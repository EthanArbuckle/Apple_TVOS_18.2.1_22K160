uint64_t sub_1000058C8(uint64_t a1)
{
  uint64_t v1;
  v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1LL;
}

void sub_100005FA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100005FB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005FC8(uint64_t a1)
{
}

uint64_t sub_100005FD0(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_10000600C(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = sub_100006494(a2, 0);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t sub_1000060F4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
}

uint64_t sub_1000061DC(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_text( a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
}

void sub_100006350( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000636C(uint64_t a1, sqlite3_stmt *a2)
{
  v3 = sub_1000064C0(a2, 0);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100006418(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100006464( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100006474()
{
  return sqlite3_errcode(*v0);
}

  ;
}

const char *sub_100006488(sqlite3 **a1)
{
  return sqlite3_errmsg(*a1);
}

unsigned __int8 *sub_100006494(sqlite3_stmt *a1, int a2)
{
  v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2) {
    v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
  }
  return v2;
}

NSNumber *sub_1000064C0(sqlite3_stmt *a1, int a2)
{
  return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", sqlite3_column_int64(a1, a2));
}

sqlite3 *sub_1000064EC(void *a1, int a2)
{
  ppDb = 0LL;
  if (a2) {
    int v2 = 65537;
  }
  else {
    int v2 = 65542;
  }
  id v3 = objc_claimAutoreleasedReturnValue([a1 path]);
  int v4 = sqlite3_open_v2((const char *)[v3 UTF8String], &ppDb, v2, 0);

  if (v4)
  {
    id v5 = sub_10000A08C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100033810(v4, v6);
    }
  }

  return ppDb;
}

BOOL sub_100006580(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_10000659C(const char *a1)
{
  return sub_1000065A4(a1, 384);
}

uint64_t sub_1000065A4(const char *a1, int a2)
{
  if (!a1) {
    sub_100033884();
  }
  int v3 = open(a1, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v3 == -1)
  {
    id v6 = sub_10000A08C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000338AC();
    }

    return 0LL;
  }

  else
  {
    int v4 = v3;
    if (fstat(v3, &v12) < 0)
    {
      id v8 = sub_10000A08C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003391C();
      }
    }

    else
    {
      if ((v12.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        uint64_t v5 = 1LL;
        if (v4 < 0) {
          return v5;
        }
        goto LABEL_16;
      }

      id v10 = sub_10000A08C();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003398C();
      }
    }

    uint64_t v5 = 0LL;
    if ((v4 & 0x80000000) == 0) {
LABEL_16:
    }
      close(v4);
  }

  return v5;
}

uint64_t sub_1000066DC(const char *a1)
{
  return sub_1000065A4(a1, 420);
}

void sub_1000066E4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

int *sub_10000671C()
{
  return __error();
}

CFArrayRef sub_100006724(__CFReadStream *a1, int a2)
{
  CFErrorRef error = 0LL;
  if (!a1)
  {
    id v8 = (os_log_s *)sub_10000A08C();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = 0LL;
      goto LABEL_19;
    }

    sub_1000339FC(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_16;
  }

  if (!CFReadStreamOpen(a1))
  {
    if ((a2 & 1) != 0) {
      goto LABEL_16;
    }
    v16 = (os_log_s *)sub_10000A08C();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v17 = "CreateMISAuthListWithStream: open stream failed (may be non-existing)";
    v18 = v16;
    os_log_type_t v19 = OS_LOG_TYPE_INFO;
    uint32_t v20 = 2;
    goto LABEL_15;
  }

  CFPropertyListRef v4 = CFPropertyListCreateWithStream(0LL, a1, 0LL, 0LL, 0LL, &error);
  if (!v4)
  {
    v21 = (os_log_s *)sub_10000A08C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    CFErrorRef v25 = error;
    v17 = "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@";
    v18 = v21;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    uint32_t v20 = 12;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
    goto LABEL_16;
  }

  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID()) {
    goto LABEL_17;
  }
  v7 = (os_log_s *)sub_10000A08C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CreateMISAuthListWithStream: plist root has wrong type",  buf,  2u);
  }

  CFRelease(v5);
LABEL_16:
  uint64_t v5 = 0LL;
LABEL_17:
  if (error) {
    CFRelease(error);
  }
LABEL_19:
  if (!v5 && a2) {
    return CFArrayCreate(0LL, 0LL, 0LL, &kCFTypeArrayCallBacks);
  }
  return (CFArrayRef)v5;
}

CFArrayRef sub_1000068FC(const __CFString *a1, int a2)
{
  int v3 = sub_10000FDFC(a1);
  if (v3)
  {
    CFPropertyListRef v4 = v3;
    uint64_t v5 = CFReadStreamCreateWithFile(0LL, v3);
    CFArrayRef v6 = sub_100006724(v5, a2);
    CFRelease(v4);
    if (v5) {
      CFRelease(v5);
    }
  }

  else
  {
    v7 = (os_log_s *)sub_10000A08C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033A2C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0LL;
  }

  return v6;
}

BOOL sub_100006988(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }

  else
  {
    CFIndex v5 = Count;
    BOOL v6 = 0;
    for (i = 0LL; i != v5; BOOL v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID())
      {
      }

      else
      {
        uint64_t v10 = (os_log_s *)sub_10000A08C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "authListIterate: row with unknown type",  v12,  2u);
        }
      }

      ++i;
    }
  }

  return v6;
}

CFArrayRef sub_100006A88()
{
  return sub_1000068FC(@"Indeterminates.plist", 1);
}

BOOL sub_100006A9C(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    uint64_t v28 = a2;
    BOOL v6 = 0;
    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        uint64_t v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, @"cdhash");
        uint64_t v12 = CFDictionaryGetValue(v10, @"upp-uuid");
        uint64_t v13 = CFDictionaryGetValue(v10, @"teamid");
        uint64_t v14 = CFDictionaryGetValue(v10, @"type");
        uint64_t v15 = (const __CFNumber *)CFDictionaryGetValue(v10, @"grace");
        if (Value
          && (CFNumberRef v16 = v15, v17 = CFGetTypeID(Value), v17 == CFStringGetTypeID())
          && v12
          && (CFTypeID v18 = CFGetTypeID(v12), v18 == CFStringGetTypeID())
          && v13
          && (CFTypeID v19 = CFGetTypeID(v13), v19 == CFStringGetTypeID())
          && v14
          && (CFTypeID v20 = CFGetTypeID(v14), v20 == CFNumberGetTypeID()))
        {
          if (!v16 || (CFTypeID v21 = CFGetTypeID(v16), v21 != CFNumberGetTypeID()))
          {
            int valuePtr = 0;
            CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          }

          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(v28 + 16))( v28,  Value,  v12,  v13,  v14,  v16)) {
            return v6;
          }
        }

        else
        {
          v26 = (os_log_s *)sub_10000A08C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = buf;
            v24 = v26;
            CFErrorRef v25 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }

      else
      {
        v22 = (os_log_s *)sub_10000A08C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = 0;
          v23 = (uint8_t *)&v31;
          v24 = v22;
          CFErrorRef v25 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, v23, 2u);
        }
      }

      BOOL v6 = ++v7 >= v5;
      if (v5 == v7) {
        return v6;
      }
    }
  }

  return 1;
}

CFArrayRef sub_100006CF0()
{
  return sub_1000068FC(@"Rejections.plist", 1);
}

BOOL sub_100006D04(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    uint64_t v27 = a2;
    BOOL v6 = 0;
    CFIndex v7 = 0LL;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v7);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFDictionaryGetTypeID())
      {
        uint64_t v10 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v7);
        Value = CFDictionaryGetValue(v10, @"upp-uuid");
        uint64_t v12 = CFDictionaryGetValue(v10, @"cdhash");
        uint64_t v13 = CFDictionaryGetValue(v10, @"teamid");
        uint64_t v14 = (const __CFNumber *)CFDictionaryGetValue(v10, @"wholeProfile");
        if (Value
          && (uint64_t v15 = v14, v16 = CFGetTypeID(Value), v16 == CFStringGetTypeID())
          && v12
          && (CFTypeID v17 = CFGetTypeID(v12), v17 == CFStringGetTypeID())
          && v13
          && (CFTypeID v18 = CFGetTypeID(v13), v18 == CFStringGetTypeID())
          && v15
          && (CFTypeID v19 = CFGetTypeID(v15), v19 == CFNumberGetTypeID()))
        {
          int valuePtr = 0;
          if (CFNumberGetValue(v15, kCFNumberIntType, &valuePtr))
          {
            if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, BOOL))(v27 + 16))( v27,  Value,  v12,  v13,  valuePtr != 0)) {
              return v6;
            }
            goto LABEL_20;
          }

          CFErrorRef v25 = (os_log_s *)sub_10000A08C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v28 = 0;
            CFTypeID v21 = (uint8_t *)&v28;
            v22 = v25;
            v23 = "rejectionListIterate: could not convert wholeProfile";
            goto LABEL_19;
          }
        }

        else
        {
          v24 = (os_log_s *)sub_10000A08C();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            CFTypeID v21 = buf;
            v22 = v24;
            v23 = "rejectionListIterate: malformed row";
            goto LABEL_19;
          }
        }
      }

      else
      {
        CFTypeID v20 = (os_log_s *)sub_10000A08C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = 0;
          CFTypeID v21 = (uint8_t *)&v31;
          v22 = v20;
          v23 = "rejectionListIterate: row with unknown type";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }

LABEL_20:
      BOOL v6 = ++v7 >= v5;
      if (v5 == v7) {
        return v6;
      }
    }
  }

  return 1;
}

  ;
}

id sub_100006F70()
{
  if (qword_10004EF80 != -1) {
    dispatch_once(&qword_10004EF80, &stru_1000453E8);
  }
  return (id)qword_10004EF88;
}

void sub_100006FB0(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS____TtC17online_auth_agent23LaunchWarningOperations);
  int v2 = (void *)qword_10004EF88;
  qword_10004EF88 = (uint64_t)v1;
}

uint64_t sub_100006FD8(void *a1, void *a2, uint64_t a3)
{
  CFIndex v5 = a1;
  id v6 = a2;
  CFIndex v7 = (void *)xpc_connection_copy_entitlement_value(v5, a3);
  pid_t pid = xpc_connection_get_pid(v5);
  if (v7) {
    BOOL v9 = v7 == &_xpc_BOOL_false;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (v9)
  {
    int v11 = pid;
    id v12 = sub_10000A08C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100033A5C(a3, v11, v13);
    }

    xpc_dictionary_set_int64(v6, "resu", 16LL);
    xpc_connection_send_message(v5, v6);
    xpc_connection_cancel(v5);
  }

  return v10;
}

void start()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v1, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100045428);
  sub_100007748();
  int v3 = (const __CFString *)sub_10000BF2C((uint64_t)@"denylist.map");
  sub_10000BB14(v3, (uint64_t)&v7);
  __int128 v4 = v7;
  __int128 v5 = v8;
  __int128 v6 = v9;
  sub_10000EB64((const void **)&v4);
  __int128 v4 = v7;
  __int128 v5 = v8;
  __int128 v6 = v9;
  sub_10000BEB8((uint64_t)&v4);
  xpc_activity_register("com.apple.mis.profile-garbage-collection", XPC_ACTIVITY_CHECK_IN, &stru_100045470);
  xpc_activity_register("com.apple.online-auth-agent.check-indeterminates", XPC_ACTIVITY_CHECK_IN, &stru_100045490);
  xpc_activity_register("com.apple.online-auth-agent.reaper", XPC_ACTIVITY_CHECK_IN, &stru_1000454B0);
  xpc_activity_register("com.apple.mis.opportunistic-validation.boot", XPC_ACTIVITY_CHECK_IN, &stru_1000454D0);
  xpc_activity_register("com.apple.online-auth-agent.denylist-update", XPC_ACTIVITY_CHECK_IN, &stru_1000454F0);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_1000071F0()
{
  mode_t v0 = umask(0x12u);
  CFIndex Length = CFStringGetLength(@"/private/var/db/MobileIdentityData");
  CFIndex v2 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  int v3 = (char *)CFAllocatorAllocate(0LL, v2, 0LL);
  if (v3)
  {
    __int128 v4 = v3;
    if (CFStringGetCString(@"/private/var/db/MobileIdentityData", v3, v2, 0x8000100u))
    {
      if ((mkdir(v4, 0x1EDu) & 0x80000000) == 0 || *__error() == 17) {
        goto LABEL_13;
      }
      id v5 = sub_10000A08C();
      __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100033B30((uint64_t)v4, v6);
      }
    }

    else
    {
      id v9 = sub_10000A08C();
      __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100033B04();
      }
    }

LABEL_13:
    CFAllocatorDeallocate(0LL, v4);
    return umask(v0);
  }

  id v7 = sub_10000A08C();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100033AD8();
  }

  return umask(v0);
}

void sub_100007320()
{
  id v0 = sub_10000A08C();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFIndex v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Creating UserTrust.db if it doesn't exist", v2, 2u);
  }
}

void sub_100007394(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100007484;
    handler[3] = &unk_100045450;
    id v9 = v2;
    int v11 = v9;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_resume(v9);
    __int128 v6 = v11;
  }

  else
  {
    xpc_type_t v4 = type;
    id v5 = sub_10000A08C();
    __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid && v4 == (xpc_type_t)&_xpc_type_error)
    {
      if (v7) {
        sub_100033BC4();
      }
    }

    else if (v7)
    {
      sub_100033BF0();
    }
  }
}

void sub_100007484(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v3 = objc_autoreleasePoolPush();
  sub_100008C58(*(void **)(a1 + 32), v4);
  objc_autoreleasePoolPop(v3);
}

void sub_1000074D0(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  id v4 = (id)os_transaction_create("gc profiles");
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  if (state) {
    sub_10000ECF8();
  }
}

void sub_100007524(id a1, OS_xpc_object *a2)
{
  activity = a2;
  CFIndex v2 = (void *)os_transaction_create("periodic check");
  if (xpc_activity_get_state(activity)) {
    sub_10000EE40(1, activity);
  }
}

void sub_10000757C(id a1, OS_xpc_object *a2)
{
}

void sub_100007584(id a1, OS_xpc_object *a2)
{
  CFIndex v2 = a2;
  int v3 = (void *)os_transaction_create("periodic check");
  if (xpc_activity_get_state(v2))
  {
    id v4 = sub_10000A08C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Checking whether opportunistic validation is needed",  buf,  2u);
    }

    unsigned __int8 v13 = 0;
    char v6 = MISExistsIndeterminateApps(0LL, 0LL, &v13);
    int v7 = v13;
    id v8 = sub_10000A08C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((v6 & 1) != 0 || v7)
    {
      if (v10)
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Yes, performing opportunistic validation.",  v12,  2u);
      }

      sub_10000EE40(0, v2);
    }

    else
    {
      if (v10)
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Opportunistic validation not necessary.",  v11,  2u);
      }
    }
  }
}

void sub_1000076CC(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2))
  {
    id v2 = sub_10000A08C();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Target OS is not iOS, skipping denylist update.",  v4,  2u);
    }
  }
}

  ;
}

void sub_100007748()
{
  dispatch_queue_attr_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v0);
  targetq = dispatch_queue_create("com.apple.mis.relister", v1);

  xpc_set_event_stream_handler("com.apple.distnoted.matching", targetq, &stru_100045560);
}

void sub_1000077B0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  int v3 = (void *)os_transaction_create("online-auth-agent relister");
  id v4 = sub_10000A08C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Relister invoked.", buf, 2u);
  }

  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string && !strcmp(string, "Application Installed"))
  {
    id v7 = sub_10000A08C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFTypeID v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Relister handling app installation.", v19, 2u);
    }

    xpc_object_t value = xpc_dictionary_get_value(v2, "UserInfo");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(value);
    int v11 = v10;
    if (v10)
    {
      if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary)
      {
        uint64_t v15 = (os_log_s *)_CFXPCCreateCFObjectFromXPCObject(v11);
        unsigned __int8 v13 = v15;
        if (v15)
        {
          CFTypeID v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"bundleIDs"));
          CFTypeID v17 = v16;
          if (v16) {
            -[os_log_s enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", &stru_1000455A0);
          }
        }

        else
        {
          id v18 = sub_10000A08C();
          CFTypeID v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_100033C48();
          }
        }
      }

      else
      {
        id v12 = sub_10000A08C();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100033C74();
        }
      }
    }

    else
    {
      id v14 = sub_10000A08C();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100033C1C();
      }
    }
  }
}

void sub_10000799C(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v4,  0LL));
    id v7 = v6;
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s bundleURL](v6, "bundleURL"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);

      if (v9)
      {
        CFTypeRef cf = 0LL;
        unsigned int v15 = 26;
        int v10 = MISQueryBlacklistForBundle([v8 path], 0, 0, 0, &cf, &v15, 0);
        CFTypeRef v11 = cf;
        if (v10 && cf)
        {
          id v12 = sub_10000A08C();
          unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Removing potential denylist override for '%@'.",  buf,  0xCu);
          }

          MISBlacklistSetOverride(cf, v15, 0LL);
          CFTypeRef v11 = cf;
        }

        if (v11) {
          CFRelease(v11);
        }
      }
    }
  }

  else
  {
    id v14 = sub_10000A08C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033CA0();
    }
  }
}

uint64_t sub_100007B38()
{
  if (qword_10004EF98 != -1) {
    dispatch_once(&qword_10004EF98, &stru_1000455C0);
  }
  return byte_10004EF90;
}

void sub_100007B78(id a1)
{
  id v1 = sub_10000EB1C();
  id v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  char v2 = sub_10000EB3C() ^ 1;
  int v3 = sub_10000EB58();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  byte_10004EF90 = [v5 isEqualToString:v4] & v2;
}

uint64_t sub_100007BD8( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  CFTypeID v17 = a1;
  id v18 = a2;
  id v107 = a3;
  id v19 = a4;
  id v20 = a5;
  id v106 = a6;
  id v21 = a7;
  id v22 = a9;
  v23 = a10;
  v24 = a11;
  CFErrorRef v25 = sub_10000FFEC(v17);
  id v26 = sub_10000A08C();
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v22;
    __int16 v115 = 2112;
    v116 = v17;
    __int16 v117 = 2112;
    id v118 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Performing auth request for: %@, %@, %@",  buf,  0x20u);
  }

  if (sub_100033550(v18))
  {
    id v28 = sub_10000A08C();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "UPP is ready.", buf, 2u);
    }

    sub_10000C1FC(@"AuthListReadyCdHashes.plist", v25);
    sub_10000C5C8(v25, v18);
    uint64_t v30 = v23[2](v23, 65LL);
    goto LABEL_7;
  }

  if (([v19 BOOLValue] & 1) != 0
    || (*(void *)buf = 0LL, MISCopyProvisioningProfile(v18, buf), !*(void *)buf))
  {
LABEL_14:
    id v32 = sub_10000C078((uint64_t)&unk_10004ED80, dword_10004EF7C);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = sub_10000C078((uint64_t)&unk_10004ED38, dword_10004ED7C);
    v105 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v102 = v33;
    if (sub_10000C14C(v33, v18) || sub_10000C14C(v105, v20))
    {
      id v35 = sub_10000A08C();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "UPP or Team ID is exempt.", buf, 2u);
      }

      sub_10000C5C8(v25, v18);
      uint64_t v37 = v23[2](v23, 1LL);
      goto LABEL_30;
    }

    if (-[__CFData length](v17, "length") != (id)20 && -[__CFData length](v17, "length") != (id)32)
    {
      id v43 = sub_10000A08C();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_100033E38();
      }
      goto LABEL_29;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 16LL));
    if (!v38)
    {
LABEL_25:
      id v41 = sub_10000A08C();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_100033CCC();
      }
LABEL_29:

      uint64_t v37 = v24[2](v24);
LABEL_30:
      uint64_t v31 = v37;
LABEL_31:

      goto LABEL_32;
    }

    id v39 = v38;
    id v40 = [v39 mutableBytes];
    if (!v40 || SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v40))
    {

      goto LABEL_25;
    }

    v101 = v39;
    v45 = (void *)sub_10000FD30();
    v46 = v45;
    if (v45)
    {
      id v98 = v45;
      id v47 = [v45 lengthOfBytesUsingEncoding:4];
      size_t v94 = ((_DWORD)v47 + 15) & 0xFFFFFFF0;
      id v87 = v98;
      id v48 = [v87 UTF8String];
      id v83 = v47;
      size_t v49 = (size_t)v47;
      v46 = v98;
      v50 = (objc_class *)sub_1000100CC(v48, v49, v94);
      if (v50)
      {
        Class v90 = v50;
        v51 = sub_100010084(v94);
        if (v51)
        {
          v85 = v51;
          mach_port_t v52 = sub_10001011C();
          io_connect_t v53 = v52;
          if (v52)
          {
            unsigned int v54 = sub_1000101B0(v52, (uint64_t)v90, (uint64_t)v85, v94);
            if (!v54)
            {
              id v100 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v85, v83));
LABEL_52:
              free(v90);
              free(v85);
              if (v53) {
                j__IOServiceClose(v53);
              }

              if (v100)
              {
                id v96 = v18;
                v65 = v17;
                v91 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v65);

                v66 = v91;
                if (v91)
                {
                  id v67 = v96;
                  id v68 = [v67 UTF8String];
                  if (v68)
                  {
                    uint64_t v88 = ccsha256_di( -[NSMutableData appendBytes:length:]( v91,  "appendBytes:length:",  v68,  [v67 lengthOfBytesUsingEncoding:4]));
                    ccdigest( v88, -[NSMutableData length](v91, "length"), -[NSMutableData bytes](v91, "bytes"), buf);
                    v69 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  buf,  32LL);
                  }

                  else
                  {
                    id v70 = sub_10000A08C();
                    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
                      sub_100033DA8();
                    }

                    v69 = 0LL;
                  }

                  v66 = v91;
                }

                else
                {
                  v69 = 0LL;
                }

                v89 = v69;
                if (v69)
                {
                  unsigned int v92 = sub_10000DBF8(v25);
                  unsigned int v72 = sub_10000DE70(v96);
                  v73 = sub_100008478(v101, v100, v96, v69, v20, v92, v72, v107, v19, v106, v21, v22, a8);
                  uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);
                  Class v93 = (Class)v74;
                  if (v74)
                  {
                    v75 = (void *)v74;
                    v108[0] = _NSConcreteStackBlock;
                    v108[1] = 3221225472LL;
                    v108[2] = sub_1000088B0;
                    v108[3] = &unk_1000455E8;
                    id v86 = v96;
                    id v109 = v86;
                    v84 = v25;
                    v110 = v84;
                    id v82 = v20;
                    id v111 = v82;
                    uint64_t v113 = a8;
                    v112 = v23;
                    v97 = objc_retainBlock(v108);
                    if (sub_10000A5B8(v75, 0, v97))
                    {
                      uint64_t v31 = 1LL;
                    }

                    else
                    {
                      id v80 = sub_10000A08C();
                      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Could not perform authorization attempt. Forcing indeterminate...",  buf,  2u);
                      }

                      sub_10000D290(v84, v86, v82, a8, 0LL, 0LL);
                      uint64_t v31 = v24[2](v24);
                    }
                  }

                  else
                  {
                    id v78 = sub_10000A08C();
                    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                      sub_100033D7C();
                    }

                    uint64_t v31 = v24[2](v24);
                  }
                }

                else
                {
                  id v76 = sub_10000A08C();
                  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
                    sub_100033D50();
                  }

                  uint64_t v31 = v24[2](v24);
                }

LABEL_50:
                goto LABEL_31;
              }

LABEL_47:
              id v63 = sub_10000A08C();
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                sub_100033CF8();
              }

              uint64_t v31 = v24[2](v24);
              goto LABEL_50;
            }

            unsigned int v95 = v54;
            id v55 = sub_10000A08C();
            v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
              sub_100033DD4(v95, v99, v56, v57, v58, v59, v60, v61);
            }
          }

          id v100 = 0LL;
          goto LABEL_52;
        }

        free(v90);
      }
    }

    else
    {
      id v62 = sub_10000A08C();
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_100033D24();
      }
    }

    goto LABEL_47;
  }

  if (!MISProvisioningProfileHasPPQExemption())
  {
    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
    goto LABEL_14;
  }

  CFRelease(*(CFTypeRef *)buf);
  sub_10000C5C8(v25, v18);
  uint64_t v30 = v23[2](v23, 1LL);
LABEL_7:
  uint64_t v31 = v30;
LABEL_32:

  return v31;
}

NSMutableDictionary *sub_100008478( void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, unsigned int a7, void *a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13)
{
  id v54 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v55 = a5;
  id v53 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  CFErrorRef v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v51 = v23;
  mach_port_t v52 = v22;
  if (v25)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v54 base64EncodedStringWithOptions:0]);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, @"nonce");

    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", @"INSTALL_FINE_GRAINED", @"action");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v27, @"deviceID");

    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v19, @"profileID");
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v28, @"appID");

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a13));
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v29, @"checkType");

    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v22, @"cdVersion");
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v23, @"signingTime");
    uint64_t v30 = v54;
    uint64_t v31 = v20;
    id v32 = v53;
    v33 = v21;
    if (v24 && a13 == 1)
    {
      id v34 = sub_10000F6FC(v24, v31);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = v35;
      if (v35 && [v35 count]) {
        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v36, @"appIdentity");
      }
    }

    if (v53) {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v53, @"universalProfile");
    }
    if (v21) {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v21, @"localProfile");
    }
    if ([v55 isEqual:&stru_100048410])
    {
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", &stru_100048410, @"teamID");
    }

    else
    {
      v38 = v31;
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v55 dataUsingEncoding:4]);
      uint64_t v40 = ccsha256_di();
      id v41 = [v39 length];
      id v42 = v39;
      ccdigest(v40, v41, [v42 bytes], v56);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v56, 32LL));
      if (!v43)
      {

        uint64_t v37 = 0LL;
        uint64_t v31 = v38;
        id v32 = v53;
        uint64_t v30 = v54;
        goto LABEL_18;
      }

      v44 = v43;
      v45 = (void *)objc_claimAutoreleasedReturnValue([v43 base64EncodedStringWithOptions:0]);
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v45, @"teamID");

      uint64_t v31 = v38;
      id v32 = v53;
      uint64_t v30 = v54;
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a6));
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v46, @"previousRejected");

    id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a7));
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v47, @"rejectedApps");

    uint64_t v37 = v25;
  }

  else
  {
    uint64_t v37 = 0LL;
    uint64_t v31 = v20;
    id v32 = v53;
    uint64_t v30 = v54;
    v33 = v21;
  }

LABEL_18:
  return v37;
}

void sub_1000088B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  int v35 = 0;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"validity"]);
    if (v5) {
      sub_10000E3E4(*(void **)(a1 + 32), v5);
    }
  }

  id v7 = *(void **)(a1 + 32);
  char v6 = *(void **)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  id v34 = 0LL;
  sub_10000D290(v6, v7, v8, v9, (uint64_t)&v35, (uint64_t)&v34);
  id v10 = v34;
  if (v4)
  {
    CFTypeRef v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"actions"]);
    if ([v11 containsObject:@"AUTHORIZED"])
    {
      id v12 = sub_10000A08C();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v14;
        __int16 v38 = 2112;
        uint64_t v39 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Authorized: %@, %@", buf, 0x16u);
      }

      sub_10000C5C8(*(void **)(a1 + 40), *(void **)(a1 + 32));
      sub_10000CD14(*(void **)(a1 + 32), *(void **)(a1 + 40));
    }

    else
    {
      if ([v11 containsObject:@"REJECT_APP_FOR_PROFILE"])
      {
        id v18 = sub_10000A08C();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v37 = v20;
          __int16 v38 = 2112;
          uint64_t v39 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Rejected app/profile combination: %@, %@",  buf,  0x16u);
        }

        id v22 = *(void **)(a1 + 32);
        id v23 = *(void **)(a1 + 40);
        id v24 = *(void **)(a1 + 48);
        char v25 = 0;
      }

      else
      {
        if (![v11 containsObject:@"REJECT_APP_AND_PROFILE"])
        {
          if ([v11 containsObject:@"REJECT_PROFILE"])
          {
            id v30 = sub_10000A08C();
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = *(void *)(a1 + 32);
              uint64_t v32 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              uint64_t v37 = v32;
              __int16 v38 = 2112;
              uint64_t v39 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Permanently rejected profile: %@, %@",  buf,  0x16u);
            }

            sub_10000C1FC(@"AuthListBannedUpps.plist", *(void **)(a1 + 32));
            sub_10000C1FC(@"AuthListBannedCdHashes.plist", *(void **)(a1 + 40));
            sub_10000C5C8(*(void **)(a1 + 40), *(void **)(a1 + 32));
            sub_10000CD14(*(void **)(a1 + 32), *(void **)(a1 + 40));
          }

          goto LABEL_22;
        }

        id v26 = sub_10000A08C();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = *(void *)(a1 + 32);
          uint64_t v28 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v37 = v28;
          __int16 v38 = 2112;
          uint64_t v39 = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Rejected profile: %@, %@", buf, 0x16u);
        }

        id v22 = *(void **)(a1 + 32);
        id v23 = *(void **)(a1 + 40);
        id v24 = *(void **)(a1 + 48);
        char v25 = 1;
      }

      sub_10000DA30(v22, v23, v24, v25);
      sub_10000C5C8(*(void **)(a1 + 40), *(void **)(a1 + 32));
    }

LABEL_22:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    goto LABEL_23;
  }

  id v16 = sub_10000A08C();
  CFTypeID v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Did not receive a valid response.", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_23:
}

void sub_100008C58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      id v15 = sub_10000A08C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v16 = "connection is now invalid.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v16, buf, 2u);
      }
    }

    else
    {
      if (v4 != &_xpc_error_termination_imminent) {
        goto LABEL_7;
      }
      id v18 = sub_10000A08C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v16 = "termination imminent, canceling connection.";
        goto LABEL_27;
      }
    }

LABEL_28:
    xpc_connection_cancel(v3);
    id v9 = 0LL;
    goto LABEL_29;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = sub_10000A08C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033F10();
    }
    goto LABEL_28;
  }

  __break(1u);
  return result;
}

LABEL_7:
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (!reply) {
    sub_100033E64();
  }
  id v9 = reply;
  string = xpc_dictionary_get_string(v4, "type");
  if (!string)
  {
    id v14 = sub_10000A08C();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100033E8C();
    }
LABEL_20:

    xpc_connection_cancel(v3);
    goto LABEL_29;
  }

  CFTypeRef v11 = string;
  if (!strncmp(string, "ping", 4uLL))
  {
    if (sub_100006FD8(v3, v9, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      CFTypeID v17 = v3;
      id v9 = v9;
      xpc_dictionary_set_int64(v9, "resu", 1LL);
      xpc_dictionary_set_string(v9, "pong", "pong!");
      xpc_connection_send_message(v17, v9);
    }
  }

  else if (!strncmp(v11, "auth", 4uLL))
  {
    if (sub_100006FD8(v3, v9, (uint64_t)"com.apple.private.mis.online_auth_agent"))
    {
      id v19 = v3;
      id v20 = v4;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v54 = 3221225472LL;
      id v55 = sub_100009F10;
      uint64_t v56 = &unk_100045610;
      id v9 = v9;
      id v57 = v9;
      uint64_t v58 = v19;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100009F4C;
      v51[3] = &unk_100045638;
      uint64_t v21 = objc_retainBlock(buf);
      mach_port_t v52 = v21;
      id v22 = objc_retainBlock(v51);
      data = xpc_dictionary_get_data(v20, "cdha", &length);
      id v24 = xpc_dictionary_get_string(v20, "uuid");
      char v25 = xpc_dictionary_get_string(v20, "team");
      v46 = xpc_dictionary_get_string(v20, "apppath");
      xpc_object_t value = xpc_dictionary_get_value(v20, "univ");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(value);
      xpc_object_t v28 = xpc_dictionary_get_value(v20, "locl");
      size_t v49 = (void *)objc_claimAutoreleasedReturnValue(v28);
      xpc_object_t v29 = xpc_dictionary_get_value(v20, "cdvr");
      id v48 = (void *)objc_claimAutoreleasedReturnValue(v29);
      xpc_object_t v30 = xpc_dictionary_get_value(v20, "sgnt");
      xpc_object_t xint = (xpc_object_t)objc_claimAutoreleasedReturnValue(v30);
      if (data && v24 && v25)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v24));
        if (v27)
        {
          uint64_t v31 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v27));
          id v43 = (void *)objc_claimAutoreleasedReturnValue(v31);
        }

        else
        {
          id v43 = 0LL;
        }

        if (v49)
        {
          id v34 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v49));
          id v42 = (void *)objc_claimAutoreleasedReturnValue(v34);
        }

        else
        {
          id v42 = 0LL;
        }

        if (v48)
        {
          int v35 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v48));
          id v41 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v35);
        }

        else
        {
          id v41 = &off_1000489B8;
        }

        if (xint)
        {
          v36 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  xpc_int64_get_value(xint));
          uint64_t v40 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v36);
        }

        else
        {
          uint64_t v40 = &off_1000489B8;
        }

        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v25));
        if (v46) {
          __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
        }
        else {
          __int16 v38 = 0LL;
        }
        int int64 = xpc_dictionary_get_int64(v20, "ckty");
        sub_100007BD8(v45, v44, v43, v42, v37, v41, v40, int64, v38, v21, v22);
      }

      else
      {
        id v32 = sub_10000A08C();
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_100033EB8();
        }

        ((void (*)(void *))v22[2])(v22);
      }
    }
  }

  else if (!strncmp(v11, "trst", 4uLL))
  {
  }

  else if (!strncmp(v11, "blov", 4uLL))
  {
  }

  else if (!strncmp(v11, "rqup", 4uLL))
  {
  }

  else
  {
    if (strncmp(v11, "lwov", 4uLL))
    {
      if (!strncmp(v11, "chlw", 4uLL))
      {
        sub_100009C04(v3, v4, v9);
        goto LABEL_29;
      }

      id v12 = sub_10000A08C();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100033EE4();
      }
      goto LABEL_20;
    }
  }

  __break(1u);
}

LABEL_29:
}

void sub_100009390(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100009F70;
  v38[3] = &unk_100045660;
  uint64_t v41 = 0LL;
  id v6 = a3;
  id v39 = v6;
  id v7 = v5;
  id v40 = v7;
  id v8 = a2;
  id v9 = objc_retainBlock(v38);
  size_t length = 0LL;
  string = xpc_dictionary_get_string(v8, "uuid");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "trst");
  BOOL v12 = xpc_dictionary_get_BOOL(v8, "usdb");
  unsigned __int8 v13 = (char *)xpc_dictionary_get_string(v8, "team");
  data = (const UInt8 *)xpc_dictionary_get_data(v8, "xsig", &length);

  if (string)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    id v34 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v15);
    if (v13) {
      unsigned __int8 v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    }
    if (data)
    {
      CFDataRef v16 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
      if (!v16)
      {
        id v17 = sub_10000A08C();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100033FE8();
        }

        ((void (*)(void *))v9[2])(v9);
LABEL_33:

        goto LABEL_34;
      }
    }

    else
    {
      CFDataRef v16 = 0LL;
    }

    id v21 = sub_10000A08C();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      id v43 = string;
      __int16 v44 = 1024;
      BOOL v45 = v11;
      __int16 v46 = 1024;
      BOOL v47 = v12;
      __int16 v48 = 2112;
      size_t v49 = v13;
      __int16 v50 = 2112;
      CFDataRef v51 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Setting trust for UPP %s: trust: %d, use db: %d, team ID: %@, auxiliary signature: %@",  buf,  0x2Cu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v12)
    {
      uint64_t v33 = v13;
      id v24 = objc_opt_new(&OBJC_CLASS____TtC17online_auth_agent24UserTrustAgentOperations);
      char v25 = v24;
      if (v11)
      {
        uint64_t v36 = 0LL;
        id v26 = (id *)&v36;
        -[UserTrustAgentOperations createUserTrustedProfileEntryWithUuid:teamId:signature:error:]( v24,  "createUserTrustedProfileEntryWithUuid:teamId:signature:error:",  v34,  v33,  v16,  &v36);
      }

      else
      {
        uint64_t v35 = 0LL;
        id v26 = (id *)&v35;
        -[UserTrustAgentOperations deleteTrustedProfileWithUuid:error:]( v24,  "deleteTrustedProfileWithUuid:error:",  v34,  &v35);
      }

      id v28 = *v26;
      if (v28)
      {
        xpc_object_t v29 = v28;
        id v30 = sub_10000A08C();
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100033F68((uint64_t)string, (uint64_t)v29, v31);
        }

        ((void (*)(void *))v9[2])(v9);
        unsigned __int8 v13 = v33;
        goto LABEL_33;
      }

      if (v11) {
        id v32 = @"MISUPPTrustSet";
      }
      else {
        id v32 = @"MISUPPTrustRevoked";
      }
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v32, 0LL, 0LL, 0);

      unsigned __int8 v13 = v33;
    }

    else
    {
      if (v11)
      {
        sub_10000C1FC(@"UserTrustedUpps.plist", v15);
        uint64_t v27 = @"MISUPPTrustSet";
      }

      else
      {
        sub_10000C428(@"UserTrustedUpps.plist", v15);
        uint64_t v27 = @"MISUPPTrustRevoked";
      }

      CFNotificationCenterPostNotification(DarwinNotifyCenter, v27, 0LL, 0LL, 0);
    }

    xpc_dictionary_set_int64(v6, "resu", 256LL);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
    if (v16) {
      CFRelease(v16);
    }
    goto LABEL_33;
  }

  id v19 = sub_10000A08C();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100033F3C();
  }

  ((void (*)(void *))v9[2])(v9);
LABEL_34:
}

void sub_1000097D0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100009FB8;
  v22[3] = &unk_100045688;
  id v6 = a3;
  id v23 = v6;
  id v7 = v5;
  id v24 = v7;
  id v8 = a2;
  id v9 = objc_retainBlock(v22);
  data = xpc_dictionary_get_data(v8, "cdha", &length);
  uint int64 = xpc_dictionary_get_uint64(v8, "haty");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (data)
  {
    BOOL v12 = objc_alloc(&OBJC_CLASS___NSMutableData);
    unsigned __int8 v13 = -[NSMutableData initWithBytes:length:](v12, "initWithBytes:length:", data, length);
    id v14 = (const __CFData *)v13;
    if (v13)
    {
      -[NSMutableData appendBytes:length:](v13, "appendBytes:length:", &uint64, 4LL);
      id v15 = sub_10000FFEC(v14);
      if (v11) {
        sub_10000C1FC(@"UserOverriddenCdHashes.plist", v15);
      }
      else {
        sub_10000C428(@"UserOverriddenCdHashes.plist", v15);
      }
      xpc_dictionary_set_int64(v6, "resu", 1024LL);
      xpc_connection_send_message((xpc_connection_t)v7, v6);
    }

    else
    {
      id v18 = sub_10000A08C();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100034040();
      }

      ((void (*)(void *))v9[2])(v9);
    }
  }

  else
  {
    id v16 = sub_10000A08C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100034014();
    }

    ((void (*)(void *))v9[2])(v9);
  }
}

void sub_1000099C4(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  connection = a1;
  uint int64 = xpc_dictionary_get_uint64(a2, "phas");
  sub_10000E0D4(uint64);
  xpc_dictionary_set_int64(v5, "resu", 512LL);
  xpc_connection_send_message(connection, v5);
}

void sub_100009A40(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100009FF4;
  v34[3] = &unk_100045688;
  id v6 = a3;
  id v35 = v6;
  id v7 = v5;
  id v36 = v7;
  id v8 = a2;
  id v9 = objc_retainBlock(v34);
  uint int64 = xpc_dictionary_get_uint64(v8, "lwid");
  BOOL v11 = xpc_dictionary_get_BOOL(v8, "ovrr");

  if (v11)
  {
    uint64_t v12 = notify_post("com.apple.mis.warning.override");
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      id v14 = sub_10000A08C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000340D0(v13, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  id v22 = sub_100006F70();
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  id v33 = 0LL;
  [v23 setUserOverride:v11 forID:uint64 error:&v33];
  id v24 = v33;
  if (v24)
  {
    id v25 = sub_10000A08C();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003406C((uint64_t)v24, v26, v27, v28, v29, v30, v31, v32);
    }

    ((void (*)(void *))v9[2])(v9);
  }

  else
  {
    xpc_dictionary_set_int64(v6, "resu", 1024LL);
    xpc_connection_send_message((xpc_connection_t)v7, v6);
  }
}

void sub_100009C04(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10000A030;
  v34[3] = &unk_100045688;
  id v7 = a3;
  id v35 = v7;
  id v8 = v5;
  id v36 = v8;
  id v9 = objc_retainBlock(v34);
  size_t length = 0LL;
  data = xpc_dictionary_get_data(v6, "cdhd", &length);
  if (data && length)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data));
    int64_t int64 = xpc_dictionary_get_int64(v6, "cdht");
    id v13 = sub_10000A08C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v38 = int64;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "XPC: checking launch warning data for: %llu, %@",  buf,  0x16u);
    }

    id v15 = sub_100006F70();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v32 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lookupLaunchWarningData:v11 cdhashType:int64 error:&v32]);
    id v18 = v32;
    id v19 = sub_10000A08C();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v22 = [v17 length];
        *(_DWORD *)buf = 138412546;
        int64_t v38 = (int64_t)v17;
        __int16 v39 = 2048;
        id v40 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "XPC: launch warning data response: %@, %lu",  buf,  0x16u);
      }

      id v23 = v17;
      xpc_dictionary_set_data(v7, "warndata", [v23 bytes], (size_t)objc_msgSend(v23, "length"));
      xpc_dictionary_set_int64(v7, "resu", 0LL);
      xpc_connection_send_message((xpc_connection_t)v8, v7);
    }

    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100034160((uint64_t)v18, v21, v26, v27, v28, v29, v30, v31);
      }

      ((void (*)(void *))v9[2])(v9);
    }
  }

  else
  {
    id v24 = sub_10000A08C();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100034134();
    }

    ((void (*)(void *))v9[2])(v9);
  }
}

uint64_t sub_100009F10(uint64_t a1, int64_t value)
{
  return 1LL;
}

uint64_t sub_100009F4C(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_100009F70(uint64_t a1)
{
  char v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "resu", 4LL);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  return 0LL;
}

uint64_t sub_100009FB8(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_100009FF4(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_10000A030(uint64_t a1)
{
  return 0LL;
}

void sub_10000A06C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000A07C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10000A08C()
{
  if (qword_10004EFA8 != -1) {
    dispatch_once(&qword_10004EFA8, &stru_1000456A8);
  }
  if (qword_10004EFA0) {
    return (id)qword_10004EFA0;
  }
  else {
    return &_os_log_default;
  }
}

void sub_10000A0DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mis", "mis");
  char v2 = (void *)qword_10004EFA0;
  qword_10004EFA0 = (uint64_t)v1;
}

void sub_10000A4E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_10000A534(uint64_t a1)
{
  char v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_10000A580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

BOOL sub_10000A5B8(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v92 = a3;
  int v89 = a2;
  if (a2 < 3)
  {
    id v99 = 0LL;
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  0LL,  &v99));
    id v8 = (os_log_s *)v99;
    os_log_t oslog = v8;
    if (!v91)
    {
      BOOL v47 = v8 == 0LL;
      id v48 = sub_10000A08C();
      Class v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      BOOL v49 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
      if (v47)
      {
        if (v49) {
          sub_100034384();
        }
      }

      else if (v49)
      {
        sub_1000343B0(oslog, v90);
      }

      BOOL v7 = 0LL;
      goto LABEL_81;
    }

    id v9 = sub_10000A08C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v91, 4LL);
      uint64_t v12 = -[NSString UTF8String](v11, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Full JSON message to send: %s", buf, 0xCu);
    }

    Class v90 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"appID"]);
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"profileID"]);
    id v13 = sub_10000A08C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v90;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v88;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Signing JSON message for %@, %@", buf, 0x16u);
    }

    id v85 = v91;
    uint32_t v15 = arc4random_uniform(0x2A300u);
    id v86 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    SecAccessControlRef v16 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0LL);
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v17 = (id *)qword_10004EFB0;
    __int16 v115 = (void *)qword_10004EFB0;
    if (!qword_10004EFB0)
    {
      id v18 = (void *)sub_10000BA58();
      uint64_t v17 = (id *)dlsym(v18, "kMAOptionsBAAKeychainLabel");
      *(void *)(*(void *)&buf[8] + 24LL) = v17;
      qword_10004EFB0 = (uint64_t)v17;
    }

    _Block_object_dispose(buf, 8);
    if (!v17) {
      sub_100034438();
    }
    id v19 = *v17;
    *(void *)v120 = v19;
    *(void *)&__int128 v124 = @"com.apple.online-auth.ppq-identity";
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v20 = (id *)qword_10004EFC0;
    __int16 v115 = (void *)qword_10004EFC0;
    if (!qword_10004EFC0)
    {
      uint64_t v21 = (void *)sub_10000BA58();
      uint64_t v20 = (id *)dlsym(v21, "kMAOptionsBAAKeychainAccessGroup");
      *(void *)(*(void *)&buf[8] + 24LL) = v20;
      qword_10004EFC0 = (uint64_t)v20;
    }

    _Block_object_dispose(buf, 8);
    if (!v20) {
      sub_1000344A8();
    }
    id v22 = *v20;
    *(void *)&v120[8] = v22;
    *((void *)&v124 + 1) = @"online-auth-agent";
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    id v23 = (id *)qword_10004EFC8;
    __int16 v115 = (void *)qword_10004EFC8;
    if (!qword_10004EFC8)
    {
      id v24 = (void *)sub_10000BA58();
      id v23 = (id *)dlsym(v24, "kMAOptionsBAANetworkTimeoutInterval");
      *(void *)(*(void *)&buf[8] + 24LL) = v23;
      qword_10004EFC8 = (uint64_t)v23;
    }

    _Block_object_dispose(buf, 8);
    if (!v23) {
      sub_100034518();
    }
    id v25 = *v23;
    *(void *)&v120[16] = v25;
    uint64_t v125 = (uint64_t)&off_1000489D0;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v26 = (id *)qword_10004EFD0;
    __int16 v115 = (void *)qword_10004EFD0;
    if (!qword_10004EFD0)
    {
      uint64_t v27 = (void *)sub_10000BA58();
      uint64_t v26 = (id *)dlsym(v27, "kMAOptionsBAAValidity");
      *(void *)(*(void *)&buf[8] + 24LL) = v26;
      qword_10004EFD0 = (uint64_t)v26;
    }

    _Block_object_dispose(buf, 8);
    if (!v26) {
      sub_100034588();
    }
    id v28 = *v26;
    id v121 = v28;
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v15 + 172800));
    v126 = v29;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v30 = (id *)qword_10004EFD8;
    __int16 v115 = (void *)qword_10004EFD8;
    if (!qword_10004EFD8)
    {
      uint64_t v31 = (void *)sub_10000BA58();
      uint64_t v30 = (id *)dlsym(v31, "kMAOptionsBAASCRTAttestation");
      *(void *)(*(void *)&buf[8] + 24LL) = v30;
      qword_10004EFD8 = (uint64_t)v30;
    }

    _Block_object_dispose(buf, 8);
    if (!v30) {
      sub_1000345F8();
    }
    id v32 = *v30;
    id v122 = v32;
    v127 = (void (*)(uint64_t))&__kCFBooleanFalse;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    id v33 = (id *)qword_10004EFE0;
    __int16 v115 = (void *)qword_10004EFE0;
    if (!qword_10004EFE0)
    {
      id v34 = (void *)sub_10000BA58();
      id v33 = (id *)dlsym(v34, "kMAOptionsBAAAccessControls");
      *(void *)(*(void *)&buf[8] + 24LL) = v33;
      qword_10004EFE0 = (uint64_t)v33;
    }

    _Block_object_dispose(buf, 8);
    if (!v33) {
      sub_100034668();
    }
    id v123 = *v33;
    SecAccessControlRef v128 = v16;
    id v35 = v123;
    id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v124,  v120,  6LL));

    dispatch_semaphore_t v37 = dispatch_semaphore_create(0LL);
    uint64_t v111 = 0LL;
    v112[0] = &v111;
    v112[1] = 0x3032000000LL;
    v112[2] = sub_10000B3CC;
    v112[3] = sub_10000B3DC;
    id v113 = 0LL;
    uint64_t v107 = 0LL;
    v108 = &v107;
    uint64_t v109 = 0x2020000000LL;
    uint64_t v110 = 0LL;
    uint64_t v101 = 0LL;
    v102 = &v101;
    uint64_t v103 = 0x3032000000LL;
    v104 = sub_10000B3CC;
    v105 = sub_10000B3DC;
    id v106 = 0LL;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_10000B8FC;
    __int16 v115 = &unk_100045748;
    __int16 v117 = &v111;
    id v118 = &v107;
    v119 = &v101;
    int64_t v38 = v37;
    v116 = v38;
    id v39 = v36;
    id v40 = buf;
    v129 = 0LL;
    v130 = &v129;
    uint64_t v131 = 0x2020000000LL;
    uint64_t v41 = off_10004EFE8;
    v132 = off_10004EFE8;
    if (!off_10004EFE8)
    {
      id v42 = (void *)sub_10000BA58();
      uint64_t v41 = dlsym(v42, "DeviceIdentityIssueClientCertificateWithCompletion");
      v130[3] = v41;
      off_10004EFE8 = v41;
    }

    _Block_object_dispose(&v129, 8);
    if (!v41)
    {
      id v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void wl_DeviceIdentityIssueClientCertificateWithCompletion(__strong dispatch_queue_t, NSDictiona ry *__strong, __strong MABAACompletionBlock)"));
      objc_msgSend( v83,  "handleFailureInFunction:file:lineNumber:description:",  v84,  @"online_auth_server.m",  34,  @"%s",  dlerror());

      __break(1u);
    }

    ((void (*)(void, id, _BYTE *))v41)(0LL, v39, v40);

    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    CFRelease(v16);
    id v43 = (void *)v108[3];
    if (*(void *)(v112[0] + 40LL))
    {
      id v44 = sub_10000A08C();
      BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_1000347F8((uint64_t)v112, v45, v46);
      }
    }

    else if (v43 && (__int16 v50 = (void *)v102[5]) != 0LL)
    {
      CFDataRef v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:0]);
      mach_port_t v52 = (const void *)SecIdentityCreate(kCFAllocatorDefault, v51, v43);

      if (v52)
      {
        BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        id v53 = (void *)objc_claimAutoreleasedReturnValue([(id)v102[5] objectAtIndexedSubscript:1]);
        v129 = v53;
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v129, 1LL));
        -[os_log_s setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v54, kSecCMSAdditionalCerts);

        int v55 = SecCMSCreateSignedData(v52, v85, v45, 0LL, v86);
        if (!v55)
        {
          if (sub_100007B38())
          {
            id v80 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableData base64EncodedStringWithOptions:]( v86,  "base64EncodedStringWithOptions:",  33LL));
            id v81 = sub_10000A08C();
            id v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id v100 = 0;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "CMS Blob:", v100, 2u);
            }

            [v80 enumerateLinesUsingBlock:&stru_100045788];
          }

          CFRelease(v52);
          uint64_t v59 = v86;
LABEL_47:

          _Block_object_dispose(&v101, 8);
          _Block_object_dispose(&v107, 8);
          _Block_object_dispose(&v111, 8);

          if (!v59)
          {
            BOOL v7 = 0LL;
LABEL_80:

LABEL_81:
            goto LABEL_82;
          }

          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://ppq.apple.com/v2/authorization"));
          if (sub_100007B38())
          {
            uint64_t v61 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mis");
            id v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v61, "stringForKey:", @"serverUrl"));

            if (v62)
            {
              uint64_t v63 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v62));

              uint64_t v60 = (void *)v63;
            }

            id v64 = sub_10000A08C();
            v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              LODWORD(v124) = 138412290;
              *(void *)((char *)&v124 + 4) = v60;
              _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_INFO,  "ppq Server URL is %@",  (uint8_t *)&v124,  0xCu);
            }
          }

          if (!v60)
          {
            id v75 = sub_10000A08C();
            id v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              sub_1000346D8();
            }
            BOOL v7 = 0LL;
            goto LABEL_79;
          }

          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  v60));
          id v67 = v66;
          if (v66)
          {
            -[os_log_s setHTTPMethod:](v66, "setHTTPMethod:", @"POST");
            -[os_log_s addValue:forHTTPHeaderField:]( v67,  "addValue:forHTTPHeaderField:",  @"8bit",  @"Content-Transfer-Encoding");
            -[os_log_s addValue:forHTTPHeaderField:]( v67,  "addValue:forHTTPHeaderField:",  @"application/octet-stream",  @"Content-Type");
            id v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
            v69 = v68;
            if (v68)
            {
              [v68 setTimeoutIntervalForRequest:10.0];
              [v69 setTimeoutIntervalForResource:10.0];
              id v70 = objc_alloc_init(&OBJC_CLASS___OnlineAuthAgentURLSessionDelegate);
              id v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v69,  v70,  0LL));
              if (v87)
              {
                *(void *)&__int128 v124 = 0LL;
                *((void *)&v124 + 1) = &v124;
                uint64_t v125 = 0x3032000000LL;
                v126 = sub_10000B3CC;
                v127 = sub_10000B3DC;
                SecAccessControlRef v128 = (SecAccessControlRef)os_transaction_create("ppq request");
                v94[0] = _NSConcreteStackBlock;
                v94[1] = 3221225472LL;
                v94[2] = sub_10000B3E4;
                v94[3] = &unk_100045720;
                int v98 = v89;
                id v95 = v5;
                id v96 = v92;
                v97 = &v124;
                v71 = objc_retainBlock(v94);
                id v72 = sub_10000A08C();
                v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v120 = 138412546;
                  *(void *)&v120[4] = v90;
                  *(_WORD *)&v120[12] = 2112;
                  *(void *)&v120[14] = v88;
                  _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Sending request for %@, %@",  v120,  0x16u);
                }

                uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v87 uploadTaskWithRequest:v67 fromData:v59 completionHandler:v71]);
                [v87 finishTasksAndInvalidate];
                BOOL v7 = v74 != 0LL;
                if (v74)
                {
                  [v74 resume];
                }

                else
                {
                  id v78 = *(void **)(*((void *)&v124 + 1) + 40LL);
                  *(void *)(*((void *)&v124 + 1) + 40LL) = 0LL;
                }

                _Block_object_dispose(&v124, 8);
              }

              else
              {
                BOOL v7 = 0LL;
              }

              goto LABEL_78;
            }
          }

          else
          {
            id v76 = sub_10000A08C();
            v69 = (void *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR)) {
              sub_100034704();
            }
          }

          BOOL v7 = 0LL;
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }

        id v56 = sub_10000A08C();
        id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          sub_100034788(v55, v57);
        }

        CFRelease(v52);
      }

      else
      {
        id v77 = sub_10000A08C();
        BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10003475C();
        }
      }
    }

    else
    {
      id v58 = sub_10000A08C();
      BOOL v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100034730();
      }
    }

    uint64_t v59 = 0LL;
    goto LABEL_47;
  }

  id v6 = sub_10000A08C();
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Maximum number of attempts (%d) reached, bailing out.",  buf,  8u);
  }

  BOOL v7 = 0LL;
LABEL_82:

  return v7;
}

void sub_10000B32C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_10000B3CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B3DC(uint64_t a1)
{
}

void sub_10000B3E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  mach_port_t v52 = 0LL;
  id v10 = sub_10000A08C();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Response received", buf, 2u);
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0 || (id v13 = [v8 statusCode], v13 == (id)200))
  {
    int v14 = 0;
    if (v7) {
      goto LABEL_6;
    }
LABEL_16:
    id v28 = sub_10000A08C();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Server returned no data", buf, 2u);
    }

    goto LABEL_20;
  }

  id v25 = v13;
  id v26 = sub_10000A08C();
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v54[0] = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Server returned HTTP status code %ld",  buf,  0xCu);
  }

  int v14 = 1;
  if (!v7) {
    goto LABEL_16;
  }
LABEL_6:
  uint64_t ApplePPQSigning = SecPolicyCreateApplePPQSigning();
  if (!ApplePPQSigning)
  {
    id v30 = sub_10000A08C();
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000348F0();
    }
LABEL_20:

    goto LABEL_21;
  }

  SecAccessControlRef v16 = (const void *)ApplePPQSigning;
  int v17 = SecCMSVerifyCopyDataAndAttributes(v7, 0LL, ApplePPQSigning, 0LL, &v52, 0LL);
  if (v17)
  {
    int v18 = v17;
    id v19 = sub_10000A08C();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v54[0]) = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Could not verify the CMS blob, received error %d",  buf,  8u);
    }

    id v21 = sub_10000A08C();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
      id v24 = -[NSString UTF8String](v23, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v54[0] = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "The server returned: %s", buf, 0xCu);
    }

    CFRelease(v16);
    goto LABEL_21;
  }

  CFRelease(v16);
  if (v14)
  {
LABEL_21:
    id v31 = sub_10000A08C();
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = *(_DWORD *)(a1 + 56) + 1;
      *(_DWORD *)buf = 67109376;
      LODWORD(v54[0]) = v33;
      WORD2(v54[0]) = 1024;
      *(_DWORD *)((char *)v54 + 6) = 3;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Could not complete online authorization (attempt %d/%d).",  buf,  0xEu);
    }

    if (v9)
    {
      id v34 = sub_10000A08C();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10003486C(v9, v35);
      }
    }

    uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8LL);
    dispatch_semaphore_t v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = 0LL;
    goto LABEL_30;
  }

  int64_t v38 = v52;
  id v39 = sub_10000A08C();
  id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v38, 4LL);
    id v42 = -[NSString UTF8String](v41, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v54[0] = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "The server returned: %s", buf, 0xCu);
  }

  id v51 = 0LL;
  id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v38,  0LL,  &v51));
  id v44 = v51;
  dispatch_semaphore_t v37 = v44;
  if (v43)
  {
    BOOL v45 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (v44)
    {
      id v46 = sub_10000A08C();
      BOOL v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v37 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        v54[0] = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Could not convert JSON to Dictionary: %@",  buf,  0xCu);
      }
    }

    BOOL v45 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v45();
  uint64_t v49 = *(void *)(*(void *)(a1 + 48) + 8LL);
  __int16 v50 = *(void **)(v49 + 40);
  *(void *)(v49 + 40) = 0LL;

LABEL_30:
}

void sub_10000B8FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  if (v9 && [v9 count] == (id)2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000B9A8(id a1, NSString *a2, BOOL *a3)
{
  id v4 = a2;
  *a3 = 0;
  id v5 = sub_10000A08C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t sub_10000BA58()
{
  char v2 = 0LL;
  if (!qword_10004EFB8)
  {
    __int128 v3 = off_1000457A8;
    uint64_t v4 = 0LL;
    qword_10004EFB8 = _sl_dlopen(&v3, &v2);
  }

  uint64_t v0 = qword_10004EFB8;
  if (!qword_10004EFB8) {
    sub_10003491C(&v2);
  }
  if (v2) {
    free(v2);
  }
  return v0;
}

char *sub_10000BB00()
{
  return dlerror();
}

void sub_10000BB08(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000BB14(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  id v6 = (char *)CFAllocatorAllocate(0LL, v5, 0LL);
  if (v6)
  {
    if (CFStringGetCString(a1, v6, v5, 0x8000100u))
    {
      int v7 = open(v6, 0);
      if ((v7 & 0x80000000) == 0)
      {
        int v8 = v7;
        off_t v9 = lseek(v7, 0LL, 2);
        if (v9 > 23)
        {
          int v17 = (char *)mmap(0LL, v9, 1, 2, v8, 0LL);
          if (v17 == (char *)-1LL)
          {
            uint64_t v20 = (os_log_s *)sub_10000A08C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_100034B70(v20);
            }
            uint64_t v11 = -1LL;
          }

          else
          {
            uint64_t v11 = (uint64_t)v17;
            *(_DWORD *)(a2 + 24) = v8;
            *(void *)(a2 + 32) = v17;
            *(void *)(a2 + 40) = v9;
            *(void *)a2 = v17;
            if (*(_DWORD *)v17 == 1134124660)
            {
              unint64_t v18 = *((unsigned int *)v17 + 2);
              if (v9 >= v18)
              {
                id v25 = &v17[v18];
                uint64_t v26 = *((unsigned int *)v17 + 3);
                uint64_t v27 = &v25[32 * v26];
                *(void *)(a2 + _Block_object_dispose((const void *)(v16 - 136), 8) = v25;
                *(void *)(a2 + 16) = v27;
                id v28 = &v27[4 * v26];
                off_t v29 = v28 - &v17[v9];
                if (v28 <= &v17[v9])
                {
LABEL_35:
                  CFAllocatorDeallocate(0LL, v6);
                  return;
                }

                id v30 = (os_log_s *)sub_10000A08C();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  int v32 = 134217984;
                  off_t v33 = v29;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Denylist is %td bytes short for entry count",  (uint8_t *)&v32,  0xCu);
                }
              }

              else
              {
                id v19 = (os_log_s *)sub_10000A08C();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  sub_100034BEC();
                }
              }
            }

            else
            {
              id v21 = (os_log_s *)sub_10000A08C();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                sub_100034C6C();
              }
            }
          }
        }

        else
        {
          id v10 = (os_log_s *)sub_10000A08C();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100034AF0(v9, v10);
          }
          if (v9 < 1) {
            goto LABEL_30;
          }
          uint64_t v11 = 0LL;
        }

LABEL_30:
        close(v8);
        goto LABEL_31;
      }

      int v14 = *__error();
      uint32_t v15 = (os_log_s *)sub_10000A08C();
      SecAccessControlRef v16 = v15;
      if (v14 == 2)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_100034A48();
        }
      }

      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        sub_100034A74(v16);
      }
    }

    else
    {
      id v13 = (os_log_s *)sub_10000A08C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100034A1C();
      }
    }
  }

  else
  {
    uint64_t v12 = (os_log_s *)sub_10000A08C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000349F0();
    }
  }

  result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

LABEL_31:
  id v22 = (os_log_s *)sub_10000A08C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_1000349C4();
  }
  id v23 = mmap(0LL, 0x18uLL, 3, 4098, -1, 0LL);
  if (v23 == (void *)-1LL)
  {
    id v31 = (os_log_s *)sub_10000A08C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100034998();
    }
    abort();
  }

  id v24 = v23;
  v23[2] = 0LL;
  *(_OWORD *)id v23 = xmmword_100037680;
  mprotect(v23, 0x18uLL, 1);
  *(void *)(a2 + _Block_object_dispose((const void *)(v16 - 136), 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)a2 = v24;
  *(_DWORD *)(a2 + 24) = -1;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = 24LL;
  if (v6) {
    goto LABEL_35;
  }
}

uint64_t sub_10000BEB8(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    __int128 v3 = *(void **)(a1 + 32);
  }

  uint64_t result = *(unsigned int *)(a1 + 24);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

void sub_10000BF04(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000BF10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10000BF2C(uint64_t a1)
{
  return [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:a1];
}

id sub_10000BF3C()
{
  if (qword_10004EFF0 != -1) {
    dispatch_once(&qword_10004EFF0, &stru_100045900);
  }
  return (id)qword_10004EFF8;
}

NSArray *sub_10000BF7C(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = -[NSArray initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSArray), "initWithContentsOfFile:", v3);

  if (v4) {
    return v4;
  }
  id v5 = sub_10000A08C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "could not read in auth list (may be non-existing)",  buf,  2u);
  }

  if (!a2)
  {
    uint64_t v4 = 0LL;
    return v4;
  }

  id v7 = sub_10000A08C();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "creating empty auth list", v10, 2u);
  }

  return objc_alloc_init(&OBJC_CLASS___NSArray);
}

id sub_10000C078(uint64_t a1, unsigned int a2)
{
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a1,  a2,  0LL));
  id v15 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  &v15));
  id v4 = v15;
  if (!v3 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
  {
    id v6 = sub_10000A08C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100034CD4((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return v3;
}

BOOL sub_10000C14C(void *a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C1D4;
  v6[3] = &unk_1000457C8;
  id v7 = a2;
  id v3 = v7;
  BOOL v4 = [a1 indexOfObjectPassingTest:v6] != (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

BOOL sub_10000C1D4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) compare:a2 options:1] == 0;
}

uint64_t sub_10000C1FC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v15 = 0LL;
  SecAccessControlRef v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  id v5 = sub_10000BF3C();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C2DC;
  block[3] = &unk_1000457F0;
  id v12 = v3;
  id v13 = v4;
  int v14 = &v15;
  id v7 = v4;
  id v8 = v3;
  dispatch_sync(v6, block);

  uint64_t v9 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_10000C2DC(uint64_t a1)
{
  size_t v2 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:*(void *)(a1 + 32)]);
  id v4 = sub_10000BF7C(v3, 1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = -[NSMutableArray initWithArray:](v2, "initWithArray:", v5);

  if (sub_10000C14C(v7, *(void **)(a1 + 40)))
  {
    char v6 = 0;
  }

  else
  {
    -[NSMutableArray addObject:](v7, "addObject:", *(void *)(a1 + 40));
    sub_10000C39C(v7, *(void *)(a1 + 32));
    char v6 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
}

void sub_10000C39C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:a2]);
  unsigned __int8 v5 = [v3 writeToFile:v4 atomically:1];

  if ((v5 & 1) == 0)
  {
    id v6 = sub_10000A08C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100034D38(v7);
    }
  }

uint64_t sub_10000C428(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v15 = 0LL;
  SecAccessControlRef v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  id v5 = sub_10000BF3C();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C508;
  block[3] = &unk_1000457F0;
  id v12 = v3;
  id v13 = v4;
  int v14 = &v15;
  id v7 = v4;
  id v8 = v3;
  dispatch_sync(v6, block);

  uint64_t v9 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void sub_10000C508(uint64_t a1)
{
  size_t v2 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:*(void *)(a1 + 32)]);
  id v4 = sub_10000BF7C(v3, 1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = -[NSMutableArray initWithArray:](v2, "initWithArray:", v5);

  if (sub_10000C14C(v7, *(void **)(a1 + 40)))
  {
    -[NSMutableArray removeObject:](v7, "removeObject:", *(void *)(a1 + 40));
    sub_10000C39C(v7, *(void *)(a1 + 32));
    char v6 = 1;
  }

  else
  {
    char v6 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v6;
}

void sub_10000C5C8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_10000BF3C();
  char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C678;
  block[3] = &unk_100045818;
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_sync(v6, block);
}

void sub_10000C678(uint64_t a1)
{
  size_t v2 = sub_10000C828();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (CFIndex i = 0LL; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"cdhash"]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"upp-uuid"]);
        id v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13
          && ([v10 compare:*(void *)(a1 + 32) options:1]
           || [v12 compare:*(void *)(a1 + 40) options:1]))
        {
          -[NSMutableArray addObject:](v14, "addObject:", v9);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  sub_10000C39C(v14, (uint64_t)@"Indeterminates.plist");
}

NSMutableArray *sub_10000C828()
{
  uint64_t v0 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Indeterminates.plist"]);
  size_t v2 = -[NSMutableArray initWithContentsOfFile:](v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    int v32 = v2;
    id v3 = v2;
    off_t v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    obj = v3;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  buf,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v42;
      uint64_t v7 = &_s10Foundation10POSIXErrorV8_nsErrorSo7NSErrorCvg_ptr;
      do
      {
        id v8 = 0LL;
        id v39 = v5;
        do
        {
          if (*(void *)v42 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v8);
          uint64_t v10 = objc_opt_class(v7[327]);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            id v11 = [v9 mutableCopy];
            id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"cdhash"]);
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"upp-uuid"]);
            int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"firstFailure"]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"lastCheck"]);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"type"]);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"grace"]);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"attempts"]);
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v12, v19) & 1) != 0
              && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v13, v20) & 1) != 0)
              && (uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v14, v21) & 1) != 0)
              && (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v15, v22) & 1) != 0)
              && (uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v16, v23) & 1) != 0))
            {
              CFDataRef v37 = sub_10000FE58(v12);

              if (v37)
              {
                int64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                id v36 = v14;
                id v35 = v15;
                id v34 = v16;
                if ([v36 compare:v38] == (id)1)
                {
                  NSLog(@"firstFailure in %@ is in the future, throwing away", v36);
                }

                else if ([v35 compare:v38] == (id)1)
                {
                  NSLog(@"lastCheck in %@ is in the future, throwing away", v35);
                }

                else if ([v34 intValue] < 2)
                {
                  if (v18)
                  {
                    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
                    if ((objc_opt_isKindOfClass(v18, v24) & 1) == 0)
                    {
                      NSLog(@"attempt in row %@ is not a number, removing", v11);
                      [v11 removeObjectForKey:@"attempts"];
                    }
                  }

                  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber);
                  if ((objc_opt_isKindOfClass(v17, v25) & 1) == 0)
                  {
                    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));

                    __int128 v17 = (void *)v31;
                    [v11 setObject:v31 forKey:@"grace"];
                  }

                  -[NSMutableArray addObject:](v33, "addObject:", v11);
                }

                else
                {
                  NSLog(@"type in row %@ is invalid, throwing away", v11);
                }
              }

              else
              {
                NSLog(@"cannot decode cdhash: %@", v12);
              }
            }

            else
            {
              NSLog(@"bad or incomplete indeterminates row: %@", v11);
            }

            id v5 = v39;
            uint64_t v7 = &_s10Foundation10POSIXErrorV8_nsErrorSo7NSErrorCvg_ptr;
          }

          else
          {
            NSLog(@"indeterminates row is not a dictionary, but %@", v9);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v5 != v8);
        id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v41,  buf,  16LL);
        id v5 = v26;
      }

      while (v26);
    }

    size_t v2 = v32;
    uint64_t v27 = v33;
  }

  else
  {
    id v28 = sub_10000A08C();
    off_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "could not read in indeterminates, creating new one",  buf,  2u);
    }

    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v27;
}

void sub_10000CD14(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_10000BF3C();
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CDC4;
  block[3] = &unk_100045818;
  id v10 = v3;
  id v11 = v4;
  id v7 = v4;
  id v8 = v3;
  dispatch_sync(v6, block);
}

void sub_10000CDC4(uint64_t a1)
{
  size_t v2 = sub_10000CF6C();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (CFIndex i = 0LL; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"cdhash"]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"upp-uuid"]);
        id v12 = v11;
        if (!v11
          || [v11 compare:*(void *)(a1 + 32) options:1]
          || [v10 compare:*(void *)(a1 + 40) options:1])
        {
          -[NSMutableArray addObject:](v4, "addObject:", v9);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  sub_10000C39C(v4, (uint64_t)@"Rejections.plist");
}

NSMutableArray *sub_10000CF6C()
{
  uint64_t v0 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Rejections.plist"]);
  size_t v2 = -[NSMutableArray initWithContentsOfFile:](v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    uint64_t v25 = v2;
    id v3 = v2;
    id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v4 = v3;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  buf,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      uint64_t v27 = v4;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v8);
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            id v11 = [v9 mutableCopy];
            id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"cdhash"]);
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"upp-uuid"]);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"teamid"]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"wholeProfile"]);
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0
              && (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v12, v17) & 1) != 0)
              && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v14, v18) & 1) != 0)
              && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v15, v19) & 1) != 0))
            {
              CFDataRef v20 = sub_10000FE58(v12);

              if (v20) {
                -[NSMutableArray addObject:](v26, "addObject:", v11);
              }
              else {
                NSLog(@"cannot decode rejections cdhash: %@", v12);
              }
              id v4 = v27;
            }

            else
            {
              NSLog(@"bad or incomplete rejections row: %@", v11);
            }
          }

          else
          {
            NSLog(@"rejections row is not a dictionary, but %@", v9);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v28,  buf,  16LL);
        id v6 = v21;
      }

      while (v21);
    }

    size_t v2 = v25;
  }

  else
  {
    id v22 = sub_10000A08C();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "could not read in rejections, creating new one",  buf,  2u);
    }

    id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v26;
}

void sub_10000D290(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = sub_10000BF3C();
  __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D384;
  block[3] = &unk_100045840;
  id v20 = v11;
  id v21 = v12;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  id v22 = v13;
  uint64_t v23 = a4;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync(v15, block);
}

void sub_10000D384(uint64_t a1)
{
  uint64_t v3 = a1 + 56;
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 0LL:
      int v4 = 0;
      goto LABEL_6;
    case 2LL:
      id v11 = sub_10000C828();
      id v27 = (id)objc_claimAutoreleasedReturnValue(v11);
      id v12 = sub_10000D634(*(void **)(a1 + 32), *(void **)(a1 + 40), v27);
      id v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v7 = v13;
      if (v13) {
        sub_10000D7E4(v13, *(_DWORD **)(a1 + 64), *(void **)(a1 + 72));
      }
      goto LABEL_25;
    case 1LL:
      int v4 = 1;
LABEL_6:
      id v5 = sub_10000C828();
      id v27 = (id)objc_claimAutoreleasedReturnValue(v5);
      id v6 = sub_10000D634(*(void **)(a1 + 32), *(void **)(a1 + 40), v27);
      uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      if (!v7)
      {
        uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", *(void *)(a1 + 32), @"cdhash");
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", *(void *)(a1 + 40), @"upp-uuid");
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v8, @"firstFailure");
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", *(void *)(a1 + 48), @"teamid");
        if ((v4 & 1) != 0)
        {
          uint64_t v9 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  sub_10000D8B4(*(void **)(a1 + 40)) + 1);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v10, @"grace");
        }

        else
        {
          -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", 0LL, @"grace");
        }

        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", &off_1000489E8, @"attempts");
        [v27 addObject:v7];
      }

      sub_10000D7E4(v7, *(_DWORD **)(a1 + 64), *(void **)(a1 + 72));
      -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v8, @"lastCheck");
      if (v4) {
        id v22 = &off_100048A00;
      }
      else {
        id v22 = &off_1000489E8;
      }
      -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v22, @"type");
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", @"grace"));
      int v24 = [v23 intValue];

      if (v24 > 0) {
        int v25 = v4;
      }
      else {
        int v25 = 0;
      }
      if (v25 == 1)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v24 - 1)));
        -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v26, @"grace");
      }

      sub_10000C39C(v27, (uint64_t)@"Indeterminates.plist");

LABEL_25:
      return;
  }

  id v14 = sub_10000A08C();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100034D78(v3, v15, v16, v17, v18, v19, v20, v21);
  }
}

id sub_10000D634(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v18 = a2;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"cdhash"]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKey:@"upp-uuid"]);
        id v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15 && ![v12 compare:v5 options:1] && !objc_msgSend(v14, "compare:options:", v18, 1))
        {
          id v16 = v11;

          goto LABEL_16;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_16:

  return v16;
}

void sub_10000D7E4(void *a1, _DWORD *a2, void *a3)
{
  id v9 = a1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"attempts"]);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 intValue] + 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    [v9 setValue:v8 forKey:@"attempts"];

    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  LODWORD(v7) = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v7;
LABEL_4:
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"firstFailure"]);
  }
}

uint64_t sub_10000D8B4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_10000E844();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (CFIndex i = 0LL; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", @"upp-uuid", (void)v13));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"grace"]);
        if (![v9 compare:v1 options:1])
        {
          uint64_t v11 = (uint64_t)[v10 intValue];

          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = 33LL;
LABEL_11:

  return v11;
}

void sub_10000DA30(void *a1, void *a2, void *a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = sub_10000BF3C();
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DB14;
  block[3] = &unk_100045868;
  id v16 = v8;
  id v17 = v7;
  id v18 = v9;
  char v19 = a4;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_sync(v11, block);
}

void sub_10000DB14(uint64_t a1)
{
  uint64_t v2 = sub_10000CF6C();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v3 = sub_10000D634(*(void **)(a1 + 32), *(void **)(a1 + 40), v6);
  id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", *(void *)(a1 + 40), @"upp-uuid");
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", *(void *)(a1 + 32), @"cdhash");
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", *(void *)(a1 + 48), @"teamid");
    if (*(_BYTE *)(a1 + 56)) {
      id v5 = &off_100048A00;
    }
    else {
      id v5 = &off_1000489E8;
    }
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v5, @"wholeProfile");
    [v6 addObject:v4];
  }

  sub_10000C39C(v6, (uint64_t)@"Rejections.plist");
}

uint64_t sub_10000DBF8(void *a1)
{
  id v1 = a1;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v2 = sub_10000BF3C();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DCB8;
  v7[3] = &unk_100045890;
  id v8 = v1;
  id v9 = &v10;
  id v4 = v1;
  dispatch_sync(v3, v7);

  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_10000DCB8(uint64_t a1)
{
  id v1 = sub_10000CF6C();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(v1);
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (CFIndex i = 0LL; i != v4; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"upp-uuid"]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"cdhash"]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"wholeProfile"]);
        uint64_t v11 = v10;
        if (v8) {
          BOOL v12 = v9 == 0LL;
        }
        else {
          BOOL v12 = 1;
        }
        BOOL v13 = v12 || v10 == 0LL;
        if (!v13
          && [v10 BOOLValue]
          && ![v9 compare:*(void *)(a1 + 32) options:1])
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;

          goto LABEL_19;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

LABEL_19:
}

uint64_t sub_10000DE70(void *a1)
{
  id v1 = a1;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 0;
  id v2 = sub_10000BF3C();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000DF30;
  v7[3] = &unk_100045890;
  id v8 = v1;
  id v9 = &v10;
  id v4 = v1;
  dispatch_sync(v3, v7);

  uint64_t v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_10000DF30(uint64_t a1)
{
  id v1 = sub_10000CF6C();
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (CFIndex i = 0LL; i != v4; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"upp-uuid"]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"cdhash"]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"wholeProfile"]);
        uint64_t v11 = v10;
        if (v8) {
          BOOL v12 = v9 == 0LL;
        }
        else {
          BOOL v12 = 1;
        }
        BOOL v13 = v12 || v10 == 0LL;
        if (!v13
          && [v10 BOOLValue]
          && ![v8 compare:*(void *)(a1 + 32) options:1])
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v4);
  }
}

uint64_t sub_10000E0D4(uint64_t a1)
{
  if (a1 != 1) {
    return 1LL;
  }
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"UserTrustedUpps.plist"]);
  if ([v1 fileExistsAtPath:v2])
  {
    id v3 = sub_10000A08C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = 1LL;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Upgrading MIS data: Migrating old trusted UPP plist to new database (phase %llu)",  buf,  0xCu);
    }

    CFArrayRef v5 = sub_1000068FC(@"UserTrustedUpps.plist", 1);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000E32C;
    v15[3] = &unk_1000458B8;
    id v6 = objc_opt_new(&OBJC_CLASS____TtC17online_auth_agent24UserTrustAgentOperations);
    __int128 v16 = v6;
    if (sub_100006988(v5, (uint64_t)v15))
    {
      id v7 = sub_10000A08C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing old trusted UPP plist", buf, 2u);
      }

      id v14 = 0LL;
      [v1 removeItemAtPath:v2 error:&v14];
      id v9 = v14;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"Version.plist"]);
      id v13 = v9;
      [v1 removeItemAtPath:v10 error:&v13];
      id v11 = v13;

      CFRelease(v5);
      return 1LL;
    }
  }

  return 0LL;
}

BOOL sub_10000E32C(uint64_t a1, uint64_t a2)
{
  id v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", a2);
  CFArrayRef v5 = *(void **)(a1 + 32);
  id v10 = 0LL;
  [v5 createUserTrustedProfileEntryWithUuid:v4 teamId:0 signature:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    id v7 = sub_10000A08C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100034DE0(a2, (uint64_t)v6, v8);
    }
  }

  return v6 == 0LL;
}

void sub_10000E3E4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  int v14 = 0;
  id v5 = sub_10000BF3C();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E4BC;
  block[3] = &unk_1000458E0;
  id v11 = v4;
  BOOL v12 = v13;
  id v10 = v3;
  id v7 = v4;
  id v8 = v3;
  dispatch_sync(v6, block);

  _Block_object_dispose(v13, 8);
}

void sub_10000E4BC(uint64_t a1)
{
  id v2 = sub_10000E844();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    while (2)
    {
      for (CFIndex i = 0LL; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"upp-uuid"]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"grace"]);
        if (![v10 compare:*(void *)(a1 + 32) options:1])
        {
          unsigned int v13 = [*(id *)(a1 + 40) intValue];
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v13
                                                                      - [v11 intValue];
          [v9 setValue:*(void *)(a1 + 40) forKey:@"grace"];

          BOOL v12 = v31;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = v31;
  -[NSMutableDictionary setValue:forKey:](v31, "setValue:forKey:", *(void *)(a1 + 32), @"upp-uuid");
  -[NSMutableDictionary setValue:forKey:](v31, "setValue:forKey:", *(void *)(a1 + 40), @"grace");
  [v4 addObject:v31];
LABEL_11:
  sub_10000C39C(v4, (uint64_t)@"AGP.plist");
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    id v30 = v4;
    int v14 = sub_10000C828();
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      char v19 = @"upp-uuid";
      do
      {
        __int128 v20 = 0LL;
        id v32 = v17;
        do
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          __int128 v21 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v20);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v19]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"grace"]);
          if (![v22 compare:*(void *)(a1 + 32) options:1]
            && (int)[v23 intValue] >= 1)
          {
            signed int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)
                + [v23 intValue];
            uint64_t v25 = v18;
            id v26 = v19;
            uint64_t v27 = a1;
            __int128 v28 = v15;
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v24 & ~(v24 >> 31)));
            [v21 setValue:v29 forKey:@"grace"];

            __int128 v15 = v28;
            a1 = v27;
            char v19 = v26;
            uint64_t v18 = v25;
            id v17 = v32;
          }

          __int128 v20 = (char *)v20 + 1;
        }

        while (v17 != v20);
        id v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }

      while (v17);
    }

    sub_10000C39C(v15, (uint64_t)@"Indeterminates.plist");

    id v4 = v30;
    BOOL v12 = v31;
  }
}

NSMutableArray *sub_10000E844()
{
  uint64_t v0 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/db/MobileIdentityData" stringByAppendingPathComponent:@"AGP.plist"]);
  id v2 = -[NSMutableArray initWithContentsOfFile:](v0, "initWithContentsOfFile:", v1);

  if (v2)
  {
    char v19 = v2;
    id v3 = v2;
    __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v4 = v3;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v21,  buf,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v8);
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          {
            id v11 = [v9 mutableCopy];
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"upp-uuid"]);
            unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"grace"]);
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0
              && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
            {
              -[NSMutableArray addObject:](v20, "addObject:", v11);
            }

            else
            {
              NSLog(@"bad or incomplete graces row: %@", v11);
            }
          }

          else
          {
            NSLog(@"graces row is not a dictionary, but %@", v9);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v21,  buf,  16LL);
      }

      while (v6);
    }

    id v2 = v19;
  }

  else
  {
    id v16 = sub_10000A08C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "could not read in graces, creating new one",  buf,  2u);
    }

    __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v20;
}

void sub_10000EACC(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("auth-list-queue", v4);
  id v3 = (void *)qword_10004EFF8;
  qword_10004EFF8 = (uint64_t)v2;
}

id sub_10000EB1C()
{
  return (id)MGCopyAnswer(@"ReleaseType", 0LL);
}

uint64_t sub_10000EB3C()
{
  return MGGetBoolAnswer(@"SigningFuse");
}

uint64_t sub_10000EB48()
{
  return MGCopyAnswer(@"UniqueDeviceID", 0LL);
}

CFStringRef sub_10000EB58()
{
  return @"Internal";
}

uint64_t sub_10000EB64(const void **a1)
{
  io_connect_t connect = 0;
  uint64_t input = *((unsigned int *)*a1 + 3);
  id v2 = sub_10000A08C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Sending denylist to AMFI....", buf, 2u);
  }

  id v4 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  io_object_t v6 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      id v7 = sub_10000A08C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100034EEC();
      }
    }

    else
    {
      id v10 = sub_10000A08C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100034E8C();
      }
    }
  }

  else
  {
    id v9 = sub_10000A08C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100034E60();
    }
  }

LABEL_13:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v6) {
    return IOObjectRelease(v6);
  }
  return result;
}

uint64_t sub_10000ECF8()
{
  io_connect_t connect = 0;
  uint64_t v0 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  io_object_t v2 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      id v3 = sub_10000A08C();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100034EEC();
      }
    }

    else
    {
      if (!IOConnectCallMethod(connect, 0xDu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL)) {
        goto LABEL_11;
      }
      id v6 = sub_10000A08C();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100034E8C();
      }
    }
  }

  else
  {
    id v5 = sub_10000A08C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100034E60();
    }
  }

LABEL_11:
  uint64_t result = connect;
  if (connect) {
    uint64_t result = IOServiceClose(connect);
  }
  if (v2) {
    return IOObjectRelease(v2);
  }
  return result;
}

  ;
}

void sub_10000EE40(int a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000A08C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = "";
    if (a1) {
      id v6 = " (periodic)";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Revalidating apps.%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  id v7 = sub_100006A88();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10000F2AC;
  v30[3] = &unk_1000459A8;
  id v8 = v3;
  id v31 = v8;
  p___int128 buf = &buf;
  sub_100006A9C(v7, (uint64_t)v30);
  if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    id v9 = sub_100006CF0();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000F400;
    v27[3] = &unk_100045A10;
    id v10 = v8;
    id v28 = v10;
    __int128 v29 = &buf;
    sub_100006D04(v9, (uint64_t)v27);
    if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      v35[0] = kMISValidationOptionValidateSignatureOnly;
      v35[1] = kMISValidationOptionOnlineAuthorization;
      v36[0] = kCFBooleanTrue;
      v36[1] = kCFBooleanTrue;
      v35[2] = kMISValidationOptionOnlineCheckType;
      if (a1) {
        uint64_t v11 = 1LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
      v36[2] = v12;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  3LL));

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10000F554;
      v23[3] = &unk_100045A38;
      id v24 = v10;
      id v26 = &buf;
      id v15 = v13;
      id v25 = v15;
      [v14 enumerateBundlesOfType:1 block:v23];

      if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL))
      {
        unsigned __int8 v34 = 0;
        int v16 = MISExistsIndeterminateApps(0LL, 0LL, &v34);
        int v17 = v34;
        id v18 = sub_10000A08C();
        char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        __int128 v20 = v19;
        if (v17) {
          int v21 = 1;
        }
        else {
          int v21 = v16;
        }
        if (v21 == 1)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 v33 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Scheduling opportunistic validation.",  v33,  2u);
          }

          xpc_object_t v22 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REPEATING, 0);
          xpc_dictionary_set_string(v22, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_ALLOW_BATTERY, 1);
          xpc_dictionary_set_BOOL(v22, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
          xpc_dictionary_set_int64(v22, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_8_HOURS);
          xpc_dictionary_set_int64(v22, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
          xpc_activity_register("com.apple.mis.opportunistic-validation.scheduled", v22, &stru_100045A58);
        }

        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 v33 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Nothing about to go indeterminate, cancelling any opportunistic validation.",  v33,  2u);
          }

          xpc_activity_unregister("com.apple.mis.opportunistic-validation.scheduled");
        }
      }
    }
  }

  _Block_object_dispose(&buf, 8);
}

void sub_10000F284(_Unwind_Exception *a1)
{
}

uint64_t sub_10000F2AC(uint64_t a1, const __CFString *a2, void *a3, void *a4)
{
  id v9 = (xpc_activity_t *)(a1 + 32);
  id v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    CFDataRef v21 = sub_10000FE58(a2);
    sub_100007BD8(v21, a3, 0LL, 0LL, a4, &off_100048A18, &off_100048A18, 2LL, 0LL, &stru_100045940, &stru_100045980);

    return 1LL;
  }

  BOOL v10 = xpc_activity_set_state(*v9, 3LL);
  id v11 = sub_10000A08C();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100034F4C((uint64_t)v9, v13, v15, v16, v17, v18, v19, v20);
    }

    goto LABEL_10;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

BOOL sub_10000F3F0(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_10000F3F8(id a1)
{
  return 1;
}

uint64_t sub_10000F400(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  id v9 = (xpc_activity_t *)(a1 + 32);
  id v8 = *(_xpc_activity_s **)(a1 + 32);
  if (!v8 || !xpc_activity_should_defer(v8))
  {
LABEL_10:
    CFDataRef v21 = sub_10000FE58(a3);
    sub_100007BD8(v21, a2, 0LL, 0LL, a4, &off_100048A18, &off_100048A18, 2LL, 0LL, &stru_1000459C8, &stru_1000459E8);

    return 1LL;
  }

  BOOL v10 = xpc_activity_set_state(*v9, 3LL);
  id v11 = sub_10000A08C();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100034F4C((uint64_t)v9, v13, v15, v16, v17, v18, v19, v20);
    }

    goto LABEL_10;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", buf, 2u);
  }

  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

BOOL sub_10000F544(id a1, int64_t a2)
{
  return 1;
}

BOOL sub_10000F54C(id a1)
{
  return 1;
}

void sub_10000F554(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = *(_xpc_activity_s **)(a1 + 32);
  if (v6 && xpc_activity_should_defer(v6))
  {
    BOOL v7 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3LL);
    id v8 = sub_10000A08C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deferring revalidateApps activity", v19, 2u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      *a3 = 1;
      goto LABEL_12;
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100034F4C(a1 + 32, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  if ([v5 profileValidated])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleURL]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);

    MISValidateSignature(v18, *(void *)(a1 + 40));
  }

LABEL_12:
}

  __break(1u);
  return result;
}

void sub_10000F680(id a1, OS_xpc_object *a2)
{
  io_object_t v2 = a2;
  id v3 = sub_10000A08C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Performing opportunistic validation.", v5, 2u);
  }

  sub_10000EE40(0, v2);
}

id sub_10000F6FC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!qword_10004F000)
  {
    *(_OWORD *)__int128 buf = off_100045AA0;
    uint64_t v41 = 0LL;
    qword_10004F000 = _sl_dlopen(buf, 0LL);
  }

  if (qword_10004F000)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    uint64_t v41 = 0x3032000000LL;
    __int128 v42 = sub_10000FB50;
    __int128 v43 = sub_10000FB60;
    id v44 = 0LL;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    __int128 v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    id v31 = sub_10000FB68;
    id v32 = &unk_100045A80;
    __int128 v35 = buf;
    id v9 = v6;
    __int128 v33 = v9;
    id v10 = v3;
    id v34 = v10;
    id v11 = v5;
    id v12 = v4;
    id v13 = v8;
    uint64_t v14 = &v29;
    *(void *)&__int128 v45 = 0LL;
    *((void *)&v45 + 1) = &v45;
    uint64_t v46 = 0x2020000000LL;
    uint64_t v15 = off_10004F008;
    BOOL v47 = off_10004F008;
    if (!off_10004F008)
    {
      uint64_t v16 = (void *)sub_10000FC34();
      uint64_t v15 = dlsym(v16, "PVAppIdentity_GenerateDigestWithCompletion");
      *(void *)(*((void *)&v45 + 1) + 24LL) = v15;
      off_10004F008 = v15;
    }

    _Block_object_dispose(&v45, 8);
    if (!v15)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void sl_PVAppIdentity_GenerateDigestWithCompletion(NSURL *__strong, NSData *__strong, dispatch_q ueue_t  _Nullable __strong, void (^__strong)(PVAppIdentityDigest *__strong))"));
      objc_msgSend( v27,  "handleFailureInFunction:file:lineNumber:description:",  v28,  @"AppIdentity.m",  23,  @"%s",  dlerror(),  v29,  v30,  v31,  v32,  v33,  v34,  v35);

      __break(1u);
    }

    ((void (*)(id, id, id, void ***))v15)(v11, v12, v13, v14);

    dispatch_time_t v17 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_wait(v9, v17);
    uint64_t v18 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v18)
    {
      id v19 = v18;
    }

    else
    {
      id v21 = sub_10000A08C();
      xpc_object_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LODWORD(v45) = 138412290;
        *(void *)((char *)&v45 + 4) = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Timed out digest calculation for %@",  (uint8_t *)&v45,  0xCu);
      }

      uint64_t v36 = 0LL;
      __int128 v37 = &v36;
      uint64_t v38 = 0x2050000000LL;
      __int128 v23 = (void *)qword_10004F010;
      uint64_t v39 = qword_10004F010;
      if (!qword_10004F010)
      {
        *(void *)&__int128 v45 = _NSConcreteStackBlock;
        *((void *)&v45 + 1) = 3221225472LL;
        uint64_t v46 = (uint64_t)sub_10000FCDC;
        BOOL v47 = &unk_100045AC0;
        id v48 = &v36;
        sub_10000FCDC((uint64_t)&v45);
        __int128 v23 = (void *)v37[3];
      }

      id v24 = v23;
      _Block_object_dispose(&v36, 8);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 digestWithTimeoutError]);
      id v19 = (id)objc_claimAutoreleasedReturnValue([v25 asDictionary]);
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v20 = sub_10000A08C();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_INFO,  "Digest calculation not supported",  buf,  2u);
    }

    id v19 = &__NSDictionary0__struct;
  }

  return v19;
}

void sub_10000FB0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FB50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000FB60(uint64_t a1)
{
}

void sub_10000FB68(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a2 asDictionary]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id v6 = sub_10000A08C();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Succesfully calculated digest for %@",  (uint8_t *)&v9,  0xCu);
  }
}

uint64_t sub_10000FC34()
{
  io_object_t v2 = 0LL;
  if (!qword_10004F000)
  {
    __int128 v3 = off_100045AA0;
    uint64_t v4 = 0LL;
    qword_10004F000 = _sl_dlopen(&v3, &v2);
  }

  uint64_t v0 = qword_10004F000;
  if (!qword_10004F000) {
    sub_100034FB4(&v2);
  }
  if (v2) {
    free(v2);
  }
  return v0;
}

Class sub_10000FCDC(uint64_t a1)
{
  Class result = objc_getClass("PVAppIdentityDigest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_100035030();
  }
  qword_10004F010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

const void *sub_10000FD30()
{
  uint64_t v0 = (const void *)sub_10000EB48();
  if (!v0)
  {
    id v5 = sub_10000A08C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000350A8();
    }

    return 0LL;
  }

  uint64_t v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    id v3 = sub_10000A08C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000350D4();
    }

    CFRelease(v1);
    return 0LL;
  }

  return v1;
}

void sub_10000FDCC(id a1)
{
  qword_10004F018 = (uint64_t)CFURLCreateWithFileSystemPath( 0LL,  @"/private/var/db/MobileIdentityData",  kCFURLPOSIXPathStyle,  1u);
}

CFURLRef sub_10000FDFC(CFStringRef filePath)
{
  if (qword_10004F020 != -1) {
    dispatch_once(&qword_10004F020, &stru_100045AE0);
  }
  return CFURLCreateWithFileSystemPathRelativeToBase(0LL, filePath, kCFURLPOSIXPathStyle, 0, (CFURLRef)qword_10004F018);
}

CFDataRef sub_10000FE58(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  uint64_t v3 = Length;
  if ((Length & 1) != 0) {
    return 0LL;
  }
  if (Length >= 0) {
    uint64_t v4 = Length;
  }
  else {
    uint64_t v4 = Length + 1;
  }
  id v5 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, v4 | 1, 0LL);
  if (!CFStringGetCString(a1, v5, v4 | 1, 0x600u)) {
    goto LABEL_36;
  }
  id v6 = (UInt8 *)CFAllocatorAllocate(kCFAllocatorDefault, v4 >> 1, 0LL);
  BOOL v7 = v6;
  if (v3 >= 2)
  {
    uint64_t v8 = (unsigned __int8 *)(v5 + 1);
    int v9 = v6;
    uint64_t v10 = v4 >> 1;
    do
    {
      int v11 = *(v8 - 1);
      unsigned int v12 = v11 - 48;
      unsigned int v13 = v11 - 97;
      char v14 = v11 - 55;
      BOOL v15 = (v11 - 65) < 6;
      char v16 = v11 - 87;
      BOOL v17 = v13 > 5;
      int v18 = v13 <= 5 || v15;
      if (v17) {
        char v16 = v14;
      }
      if (v12 < 0xA)
      {
        int v18 = 1;
        char v16 = v12;
      }

      char v19 = 16 * v16;
      int v20 = *v8;
      unsigned int v21 = v20 - 48;
      unsigned int v22 = v20 - 97;
      char v23 = v20 - 55;
      BOOL v24 = (v20 - 65) < 6;
      char v25 = v20 - 87;
      BOOL v26 = v22 > 5;
      char v27 = v22 <= 5 || v24;
      if (v26) {
        char v28 = v23;
      }
      else {
        char v28 = v25;
      }
      if (v21 >= 0xA) {
        char v29 = v27;
      }
      else {
        char v29 = 1;
      }
      if (v21 >= 0xA) {
        LOBYTE(v21) = v28;
      }
      UInt8 *v9 = v21 | v19;
      if (!v18 || (v29 & 1) == 0) {
        goto LABEL_35;
      }
      ++v9;
      v8 += 2;
    }

    while (--v10);
  }

  CFDataRef v30 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, v4 >> 1, kCFAllocatorDefault);
  if (!v30 && v7)
  {
LABEL_35:
    CFAllocatorDeallocate(kCFAllocatorDefault, v7);
LABEL_36:
    CFDataRef v30 = 0LL;
  }

  if (v5) {
    CFAllocatorDeallocate(kCFAllocatorDefault, v5);
  }
  return v30;
}

__CFString *sub_10000FFEC(const __CFData *a1)
{
  CFIndex Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v5 = CFDataGetLength(a1);
  if (v5 >= 1)
  {
    CFIndex v6 = v5;
    do
    {
      unsigned int v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0LL, @"%02x", v7);
      --v6;
    }

    while (v6);
  }

  return Mutable;
}

void *sub_100010084(size_t __size)
{
  if (!posix_memalign(&__memptr, 0x10uLL, __size)) {
    bzero(__memptr, __size);
  }
  return __memptr;
}

void *sub_1000100CC(const void *a1, size_t a2, size_t __size)
{
  CFIndex v5 = sub_100010084(__size);
  CFIndex v6 = v5;
  if (v5) {
    memcpy(v5, a1, a2);
  }
  return v6;
}

CFMutableDictionaryRef sub_10001011C()
{
  io_connect_t connect = 0;
  CFMutableDictionaryRef result = IOServiceMatching("IOAESAccelerator");
  if (result)
  {
    uint64_t v1 = result;
    CFRetain(result);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (MatchingService)
    {
      io_object_t v3 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      CFRelease(v1);
      IOObjectRelease(v3);
      return (CFMutableDictionaryRef)connect;
    }

    else
    {
      CFRelease(v1);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000101B0(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)&v19[4] = 0LL;
  size_t outputStructCnt = 88LL;
  unint64_t data = (unint64_t)CFAbsoluteTimeGetCurrent() & 0xFFFFFFFFFF800000LL;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 8u);
  CC_SHA256_Final(md, &c);
  __int128 v15 = *(_OWORD *)md;
  outputStruct[0] = a2;
  outputStruct[1] = a3;
  int v14 = a4;
  uint64_t v16 = 0x8000000000LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  *(void *)char v19 = 2106LL;
  return IOConnectCallStructMethod(a1, 1u, outputStruct, 0x58uLL, outputStruct, &outputStructCnt);
}

id sub_1000102B0()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  id v1 = objc_msgSendSuper2(&v7, "setupSchema");
  if ((_DWORD)v1)
  {
    NSString v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (!v2)
    {
      NSString v3 = String._bridgeToObjectiveC()();
      [v0 executeQuery:v3 withBind:0 withResults:0];

      NSString v4 = String._bridgeToObjectiveC()();
      [v0 executeQuery:v4 withBind:0 withResults:0];

      CFIndex v5 = @"databaseSchemaVersion";
      NSString v2 = String._bridgeToObjectiveC()();
      [v0 setSetting:v5 toValue:v2];
    }
  }

  return v1;
}

id variable initialization expression of UserTrustAgentOperations.utdb()
{
  char v0 = sub_100014904();
  return sub_1000247A8(v0 & 1);
}

uint64_t UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v26 = a1;
  uint64_t v25 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  int v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for UserTrustedProfileEntry(0LL);
  __chkstk_darwin(v12);
  int v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = 0LL;
  if (a3)
  {
    uint64_t v24 = a2;
    uint64_t v16 = a4;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    unint64_t v19 = 0LL;
    if (a5 >> 60 != 15)
    {
      swift_bridgeObjectRetain(a3);
      sub_10001073C(v16, a5);
      uint64_t v15 = nullsub_1(v24, a3, v16, a5);
      uint64_t v17 = v20;
      uint64_t v18 = v21;
      unint64_t v19 = v22;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    unint64_t v19 = 0LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v26, v25);
  sub_100010608(v15, v17, v18, v19);
  sub_100011FC0((uint64_t)v11, v15, v17, v18, v19, (uint64_t)v14);
  sub_100023A00((uint64_t)v14);
  sub_100010684((uint64_t)v14);
  return sub_1000106C0(v15, v17, v18, v19);
}

uint64_t sub_100010608(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    return sub_100010640(a3, a4);
  }

  return result;
}

uint64_t sub_100010640(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010684(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UserTrustedProfileEntry(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000106C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    return sub_1000106F8(a3, a4);
  }

  return result;
}

uint64_t sub_1000106F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001073C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100010640(a1, a2);
  }
  return a1;
}

uint64_t UserTrustAgentOperations.deleteTrustedProfile(uuid:)(uint64_t a1)
{
  return sub_100023F9C(a1);
}

id UserTrustAgentOperations.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id UserTrustAgentOperations.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  uint64_t v2 = v0;
  char v3 = sub_100014904();
  *(void *)&v0[v1] = sub_1000247A8(v3 & 1);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for UserTrustAgentOperations()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent24UserTrustAgentOperations);
}

id UserTrustAgentOperations.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010BA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000106F8(a1, a2);
  }
  return a1;
}

void sub_100010BB8()
{
  qword_1000515B0 = -1LL;
}

uint64_t sub_100010BD8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_100010C08(uint64_t a1)
{
  uint64_t result = swift_beginAccess(v1 + 16, v4, 1LL, 0LL);
  *(void *)(v1 + 16) = a1;
  return result;
}

void *sub_100010C44(uint64_t a1)
{
  return &j__swift_endAccess;
}

uint64_t sub_100010C84(uint64_t a1)
{
  uint64_t result = swift_allocObject(v1, 24LL, 7LL);
  *(void *)(result + 16) = a1;
  return result;
}

void sub_100010CB4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100010D08()
{
  uint64_t v8 = v2;
  __int16 v9 = v3;
  char v10 = BYTE2(v3);
  char v11 = BYTE3(v3);
  char v12 = BYTE4(v3);
  char v13 = BYTE5(v3);
  NSString v4 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 88LL);
  uint64_t v5 = swift_retain(v1);
  CFIndex v6 = (sqlite3_stmt *)v4(v5);
  if (qword_10004F028 != -1) {
    swift_once(&qword_10004F028, sub_100010BB8);
  }
  sqlite3_bind_blob(v6, v0, &v8, BYTE6(v3), (void (__cdecl *)(void *))qword_1000515B0);
  return swift_release(v1);
}

_BYTE *sub_100010F84(int a1)
{
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v1 + 88LL);
  NSString v4 = (sqlite3_stmt *)v3();
  uint64_t result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    CFIndex v6 = result;
    objc_super v7 = (sqlite3_stmt *)v3();
    int v8 = sqlite3_column_bytes(v7, a1);
    return (_BYTE *)sub_10001193C(v6, v8);
  }

  return result;
}

void sub_100010FE4(uint64_t a1, int a2)
{
  double v4 = Date.timeIntervalSince1970.getter();
  if ((~*(void *)&v4 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v4 < 9.22337204e18)
  {
    sqlite3_int64 v5 = (uint64_t)v4;
    CFIndex v6 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88LL))();
    sqlite3_bind_int64(v6, a2, v5);
    return;
  }

uint64_t sub_100011070(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  sqlite3_int64 v4 = sqlite3_column_int64(v3, a1);
  return Date.init(timeIntervalSince1970:)((double)v4);
}

uint64_t sub_1000110B4(sqlite3_int64 a1, int a2)
{
  sqlite3_int64 v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88LL))();
  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_1000110F0(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_10001111C(char a1, int a2)
{
  sqlite3_int64 v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v2 + 88LL))();
  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_100011158(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_100011190(uint64_t result, uint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t v6 = result;
    swift_retain(v3);
    return sub_1000111E8(v6, a2, v3, a3);
  }

  return result;
}

uint64_t sub_1000111E8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v9[2] = a3;
  int v10 = a4;
  if ((a2 & 0x1000000000000000LL) != 0 || !(a2 & 0x2000000000000000LL | a1 & 0x1000000000000000LL))
  {
    _StringGuts._slowWithCString<A>(_:)(sub_100011EF0, v9, a1, a2, (char *)&type metadata for () + 8);
    return swift_release(a3);
  }

  if ((a2 & 0x2000000000000000LL) == 0)
  {
    if ((a1 & 0x1000000000000000LL) != 0) {
      uint64_t v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v6 = (const char *)_StringObject.sharedUTF8.getter(a1, a2);
    }
    sub_100011EF0(v6);
    return swift_release(a3);
  }

  *(void *)char v11 = a1;
  uint64_t v12 = a2 & 0xFFFFFFFFFFFFFFLL;
  int v8 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)a3 + 88LL))();
  if (qword_10004F028 != -1) {
    swift_once(&qword_10004F028, sub_100010BB8);
  }
  sqlite3_bind_text(v8, a4, v11, -1, (void (__cdecl *)(void *))qword_1000515B0);
  return swift_release(a3);
}

const unsigned __int8 *sub_100011324(int a1)
{
  uint64_t v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(void *)v1 + 88LL))();
  uint64_t result = sqlite3_column_text(v3, a1);
  if (result) {
    return (const unsigned __int8 *)String.init(cString:)();
  }
  return result;
}

uint64_t sub_100011364()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t sub_100011374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = swift_allocObject(&unk_100045BD0, 24LL, 7LL);
  *(void *)(v10 + 16) = 0LL;
  char v11 = (uint64_t *)(v10 + 16);
  NSString v12 = String._bridgeToObjectiveC()();
  uint64_t v13 = swift_allocObject(&unk_100045BF8, 32LL, 7LL);
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  char v29 = sub_100011A38;
  CFDataRef v30 = (void *)v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v26 = 1107296256LL;
  char v27 = sub_1000115AC;
  char v28 = &unk_100045C10;
  int v14 = _Block_copy(&aBlock);
  uint64_t v15 = v30;
  sub_100011AC8(a3, a4);
  swift_release(v15);
  uint64_t v16 = (void *)swift_allocObject(&unk_100045C48, 40LL, 7LL);
  v16[2] = a5;
  v16[3] = a6;
  v16[4] = v10;
  char v29 = sub_100011B0C;
  CFDataRef v30 = v16;
  aBlock = _NSConcreteStackBlock;
  uint64_t v26 = 1107296256LL;
  char v27 = sub_1000115E8;
  char v28 = &unk_100045C60;
  uint64_t v17 = _Block_copy(&aBlock);
  uint64_t v18 = v30;
  sub_100011AC8(a5, a6);
  swift_retain(v10);
  swift_release(v18);
  unsigned int v19 = [v24 executeQuery:v12 withBind:v14 withResults:v17];
  _Block_release(v17);
  _Block_release(v14);

  if (v19)
  {
    unint64_t v20 = sub_100011BB8();
    swift_allocError(&type metadata for DBError, v20, 0LL, 0LL);
    *(void *)uint64_t v21 = v19;
    *(void *)(v21 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(void *)(v21 + 16) = 0LL;
    *(void *)(v21 + 24) = 0LL;
    *(_BYTE *)(v21 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release(v10);
  }

  swift_beginAccess(v11, &aBlock, 0LL, 0LL);
  uint64_t v22 = *v11;
  if (v22)
  {
    swift_errorRetain(v22);
    goto LABEL_5;
  }

  return swift_release(v10);
}

uint64_t sub_1000115AC(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_1000115E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v7 = sub_100011EA4();
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v7,  &protocol witness table for String);
  swift_retain(v5);
  v6(a2, v8);
  swift_release(v5);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100011660(void (*a1)(uint64_t))
{
  uint64_t result = sub_100011374(0xD000000000000011LL, 0x800000010003A8E0LL, 0LL, 0LL, 0LL, 0LL);
  if (!v1)
  {
    a1(result);
    return sub_100011374(0xD000000000000012LL, 0x800000010003A920LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_100011770(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  uint64_t v10 = (char *)__DataStorage._bytes.getter();
  if (!v10)
  {
LABEL_4:
    BOOL v12 = __OFSUB__(a2, a1);
    uint64_t v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }

    else
    {
      uint64_t v14 = __DataStorage._length.getter();
      if (v14 < v13) {
        uint64_t v13 = v14;
      }
      a3 = a4;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)a4 + 88LL))();
      if (!v10) {
        uint64_t v13 = 0LL;
      }
      if (v13 >= (uint64_t)0xFFFFFFFF80000000LL)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_10004F028 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_1000515B0);
            return swift_release(a4);
          }

LABEL_16:
          swift_once(&qword_10004F028, sub_100010BB8);
          goto LABEL_12;
        }

LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }

    __break(1u);
    goto LABEL_15;
  }

  uint64_t result = __DataStorage._offset.getter();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }

  __break(1u);
  return result;
}

  id v24 = sub_10002A704(0LL, &qword_10004E788, &OBJC_CLASS___CKRecordZoneID_ptr);
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v24);
  __break(1u);
}

uint64_t sub_10001187C(_BYTE *__src, _BYTE *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10001193C(_BYTE *__src, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 <= 14) {
    return sub_10001187C(__src, &__src[a2]);
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  __DataStorage.init(bytes:length:)(__src, a2);
  uint64_t v6 = type metadata accessor for Data.RangeReference(0LL);
  uint64_t result = swift_allocObject(v6, 32LL, 7LL);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_1000119E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100011A0C()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100011A38(uint64_t result)
{
  unint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = type metadata accessor for SQLStatement();
    uint64_t v6 = swift_allocObject(v5, 24LL, 7LL);
    *(void *)(v6 + 16) = v3;
    swift_retain(v4);
    v2(v6);
    swift_release(v6);
    return sub_100011EE0((uint64_t)v2, v4);
  }

  return result;
}

uint64_t sub_100011AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011AC0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100011AC8(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_100011AD8()
{
  if (v0[2]) {
    swift_release(v0[3]);
  }
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100011B0C(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = type metadata accessor for SQLStatement();
    uint64_t v6 = swift_allocObject(v5, 24LL, 7LL);
    *(void *)(v6 + 16) = v3;
    swift_retain(v4);
    v2(v6);
    swift_release(v6);
    return sub_100011EE0((uint64_t)v2, v4);
  }

  return result;
}

unint64_t sub_100011BB8()
{
  unint64_t result = qword_10004DA10;
  if (!qword_10004DA10)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037700, &type metadata for DBError);
    atomic_store(result, (unint64_t *)&qword_10004DA10);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DBError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_100011C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain(a2);
    return swift_bridgeObjectRetain(a4);
  }

  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_100011C70( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(_BYTE *)(a1 + 32));
}

uint64_t sub_100011C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return swift_bridgeObjectRelease(a4);
  }

  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_100011C2C(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  sub_100011C2C(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(_BYTE *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_100011C70(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(_BYTE *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_100011C70(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 32) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100011E5C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_100011E68(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent12SQLStatement);
}

unint64_t sub_100011EA4()
{
  unint64_t result = qword_10004DB20;
  if (!qword_10004DB20)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004DB20);
  }

  return result;
}

uint64_t sub_100011EE0(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100011EF0(const char *a1)
{
  int v3 = *(_DWORD *)(v1 + 24);
  int v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(void **)(v1 + 16) + 88LL))();
  if (qword_10004F028 != -1) {
    swift_once(&qword_10004F028, sub_100010BB8);
  }
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_1000515B0);
}

uint64_t type metadata accessor for UserTrustedProfileEntry(uint64_t a1)
{
  uint64_t result = qword_10004F0B0;
  if (!qword_10004F0B0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UserTrustedProfileEntry);
  }
  return result;
}

uint64_t sub_100011FC0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32LL))(a6, a1, v12);
  uint64_t result = type metadata accessor for UserTrustedProfileEntry(0LL);
  uint64_t v14 = (void *)(a6 + *(int *)(result + 20));
  *uint64_t v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t destroy for TrustedTeamIdEntry(void *a1)
{
  return sub_1000106F8(a1[2], a1[3]);
}

void *initializeWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain(v3);
  sub_100010640(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for TrustedTeamIdEntry(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_100010640(v7, v6);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  a1[2] = v7;
  a1[3] = v6;
  sub_1000106F8(v8, v9);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for TrustedTeamIdEntry(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_1000106F8(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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
      *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_1000121F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    if (v11)
    {
      void *v9 = *v10;
      v9[1] = v11;
      uint64_t v12 = v10[2];
      unint64_t v13 = v10[3];
      swift_bridgeObjectRetain(v11);
      sub_100010640(v12, v13);
      v9[2] = v12;
      void v9[3] = v13;
    }

    else
    {
      __int128 v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }

  return a1;
}

uint64_t sub_1000122B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  int v5 = (void *)(a1 + *(int *)(a2 + 20));
  uint64_t result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease(result);
    return sub_1000106F8(v5[2], v5[3]);
  }

  return result;
}

uint64_t sub_100012314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  if (v10)
  {
    *uint64_t v8 = *v9;
    v8[1] = v10;
    uint64_t v11 = v9[2];
    unint64_t v12 = v9[3];
    swift_bridgeObjectRetain(v10);
    sub_100010640(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }

  else
  {
    __int128 v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }

  return a1;
}

uint64_t sub_1000123A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  uint64_t v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      *uint64_t v8 = *v9;
      uint64_t v12 = v9[1];
      v8[1] = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v10);
      uint64_t v13 = v9[2];
      unint64_t v14 = v9[3];
      sub_100010640(v13, v14);
      uint64_t v15 = v8[2];
      unint64_t v16 = v8[3];
      v8[2] = v13;
      v8[3] = v14;
      sub_1000106F8(v15, v16);
    }

    else
    {
      sub_100012498(v8);
      __int128 v20 = *((_OWORD *)v9 + 1);
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v20;
    }
  }

  else if (v11)
  {
    *uint64_t v8 = *v9;
    uint64_t v17 = v9[1];
    v8[1] = v17;
    uint64_t v18 = v9[2];
    unint64_t v19 = v9[3];
    swift_bridgeObjectRetain(v17);
    sub_100010640(v18, v19);
    v8[2] = v18;
    v8[3] = v19;
  }

  else
  {
    __int128 v21 = *((_OWORD *)v9 + 1);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v21;
  }

  return a1;
}

void *sub_100012498(void *a1)
{
  return a1;
}

uint64_t sub_1000124C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  unint64_t v9 = (_OWORD *)(a2 + v7);
  __int128 v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_10001252C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a1 + v7 + 8);
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(v9 + 8);
  if (!v11)
  {
    sub_100012498(v8);
LABEL_5:
    __int128 v14 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v14;
    return a1;
  }

  *uint64_t v8 = *(void *)v9;
  v8[1] = v11;
  swift_bridgeObjectRelease(v10);
  uint64_t v12 = v8[2];
  unint64_t v13 = v8[3];
  *((_OWORD *)v8 + 1) = *(_OWORD *)(v9 + 16);
  sub_1000106F8(v12, v13);
  return a1;
}

uint64_t sub_1000125C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000125D4);
}

uint64_t sub_1000125D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  int v10 = v9 - 1;
  if (v10 < 0) {
    int v10 = -1;
  }
  return (v10 + 1);
}

uint64_t sub_100012660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001266C);
}

uint64_t sub_10001266C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + _Block_object_dispose((const void *)(v1 - 112), 8) = a2;
  return result;
}

uint64_t sub_1000126E8(uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = " ";
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void sub_100012758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Data.Iterator(0LL);
  __chkstk_darwin(v3);
  __asm { BR              X10 }

uint64_t sub_1000127DC()
{
  unint64_t v5 = sub_100012948();
  ((void (*)(uint64_t, unint64_t))dispatch thunk of IteratorProtocol.next())(v0, v5);
  if ((*(_BYTE *)(v4 - 81) & 1) != 0)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0xE000000000000000LL;
    *(_OWORD *)(v4 - 12_Block_object_dispose((const void *)(v1 - 112), 8) = xmmword_1000377D0;
    do
    {
      char v8 = *(_BYTE *)(v4 - 82);
      uint64_t v9 = sub_100012990(&qword_10004DBB0);
      uint64_t v10 = swift_allocObject(v9, 72LL, 7LL);
      *(_OWORD *)(v10 + 16) = *(_OWORD *)(v4 - 128);
      *(void *)(v10 + 56) = &type metadata for UInt8;
      *(void *)(v10 + 64) = &protocol witness table for UInt8;
      *(_BYTE *)(v10 + 32) = v8;
      uint64_t v11 = ((uint64_t (*)(uint64_t, unint64_t, uint64_t))String.init(format:_:))( 2016555045LL,  0xE400000000000000LL,  v10);
      unint64_t v13 = v12;
      *(void *)(v4 - 104) = v6;
      *(void *)(v4 - 96) = v7;
      swift_bridgeObjectRetain(v7);
      v14._countAndFlagsBits = v11;
      v14._object = v13;
      String.append(_:)(v14);
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(v13);
      uint64_t v6 = *(void *)(v4 - 104);
      unint64_t v7 = *(void *)(v4 - 96);
      ((void (*)(uint64_t, unint64_t))dispatch thunk of IteratorProtocol.next())(v0, v5);
    }

    while (*(_BYTE *)(v4 - 81) != 1);
  }

  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 136) + 8LL))(v2, v0);
  return v6;
}

unint64_t sub_100012948()
{
  unint64_t result = qword_10004DBA8;
  if (!qword_10004DBA8)
  {
    uint64_t v1 = type metadata accessor for Data.Iterator(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data.Iterator, v1);
    atomic_store(result, (unint64_t *)&qword_10004DBA8);
  }

  return result;
}

uint64_t sub_100012990(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_1000129D0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100012990(&qword_10004DBB8);
  unint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100012A34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void *sub_100012A78(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100012A9C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for AppRecord(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_10004F150, (uint64_t)&nominal type descriptor for AppRecord);
}

int *sub_100012AD4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v49 - v11;
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v49 - v13;
  id v15 = [a1 bundleIdentifier];
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    uint64_t v54 = v17;

    id v18 = [a1 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    unsigned int v19 = sub_10001A79C();
    if (v2)
    {
      swift_errorRelease(v2);
      uint64_t v53 = 0LL;
      uint64_t v51 = 0LL;
      unint64_t v52 = 0xF000000000000000LL;
    }

    else
    {
      unint64_t v52 = v21;
      uint64_t v53 = v20;
      uint64_t v51 = v19;
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    id v29 = [a1 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    id v30 = [a1 teamIdentifier];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      uint64_t v49 = v33;
      uint64_t v50 = v32;
    }

    else
    {
      uint64_t v49 = 0LL;
      uint64_t v50 = 0LL;
    }

    uint64_t v34 = v5;
    id v35 = objc_msgSend(a1, "iTunesMetadata", v49, v50);
    id v36 = [v35 versionIdentifier];

    id v37 = [a1 uniqueInstallIdentifier];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v37);
      unint64_t v41 = v40;
    }

    else
    {
      uint64_t v39 = 0LL;
      unint64_t v41 = 0xF000000000000000LL;
    }

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v12, v34);
    uint64_t result = (int *)type metadata accessor for AppRecord(0LL);
    __int128 v42 = (uint64_t *)(a2 + result[5]);
    uint64_t v43 = v54;
    uint64_t *v42 = v55;
    v42[1] = v43;
    id v44 = (uint64_t *)(a2 + result[6]);
    uint64_t v45 = v49;
    uint64_t *v44 = v50;
    v44[1] = v45;
    *(void *)(a2 + result[7]) = v36;
    uint64_t v46 = (uint64_t *)(a2 + result[8]);
    uint64_t *v46 = v39;
    v46[1] = v41;
    BOOL v47 = (void *)(a2 + result[9]);
    uint64_t v48 = v53;
    *BOOL v47 = v51;
    v47[1] = v48;
    v47[2] = v52;
  }

  else
  {
    uint64_t v22 = type metadata accessor for AppManagerError(0LL);
    unint64_t v23 = sub_100012E3C();
    swift_allocError(v22, v23, 0LL, 0LL);
    uint64_t v25 = v24;
    id v26 = [a1 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v25, v9, v5);
    uint64_t v27 = swift_storeEnumTagMultiPayload(v25, v22, 0LL);
    return (int *)swift_willThrow(v27);
  }

  return result;
}

uint64_t type metadata accessor for AppManagerError(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_10004F140, (uint64_t)&nominal type descriptor for AppManagerError);
}

uint64_t sub_100012E08(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

unint64_t sub_100012E3C()
{
  unint64_t result = qword_10004DBC0;
  if (!qword_10004DBC0)
  {
    uint64_t v1 = type metadata accessor for AppManagerError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_100037800, v1);
    atomic_store(result, (unint64_t *)&qword_10004DBC0);
  }

  return result;
}

uint64_t sub_100012E84(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(LSApplicationRecord) enumeratorWithOptions:0];
  uint64_t v5 = swift_allocObject(&unk_100045DD0, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = swift_allocObject(&unk_100045DF8, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_1000139AC;
  *(void *)(v6 + 24) = v5;
  v10[4] = sub_1000139C4;
  uint64_t v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256LL;
  v10[2] = sub_100013354;
  v10[3] = &unk_100045E10;
  uint64_t v7 = _Block_copy(v10);
  uint64_t v8 = v11;
  swift_retain(v6);
  swift_release(v8);
  objc_msgSend(v4, "swift_forEach:", v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v6, "", 102LL, 67LL, 28LL, 1LL);
  swift_release(v5);
  uint64_t result = swift_release(v6);
  return result;
}

uint64_t sub_100012FD8(void *a1, void (*a2)(char *), uint64_t a3)
{
  v22[1] = a3;
  uint64_t v5 = type metadata accessor for AppRecord(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v22 - v11;
  uint64_t result = (uint64_t)[a1 teamIdentifier];
  if (result)
  {

    id v14 = [a1 teamIdentifier];
    if (!v14) {
      goto LABEL_14;
    }
    id v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;

    if (v16 == 0x3030303030303030LL && v18 == 0xEA00000000003030LL) {
      return swift_bridgeObjectRelease(0xEA00000000003030LL);
    }
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, 0x3030303030303030LL, 0xEA00000000003030LL, 0LL);
    uint64_t result = swift_bridgeObjectRelease(v18);
    if ((v19 & 1) == 0)
    {
LABEL_14:
      if (![a1 isProfileValidated]
        || (uint64_t result = (uint64_t)[a1 isBeta], (_DWORD)result))
      {
        id v20 = [a1 URL];
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        char v21 = sub_100015858((uint64_t)v12);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
        if ((v21 & 1) == 0)
        {
          uint64_t result = (uint64_t)[a1 isDeletableSystemApplication];
          if ((result & 1) == 0)
          {
            sub_100012AD4(a1, (uint64_t)v7);
            a2(v7);
            return sub_100014850((uint64_t)v7, type metadata accessor for AppRecord);
          }
        }
      }
    }
  }

  return result;
}

void sub_100013354(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_100013388(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for AppRecord(0LL);
  uint64_t v6 = (uint64_t *)(a2 + *(int *)(v5 + 32));
  unint64_t v7 = v6[1];
  if (v7 >> 60 == 15)
  {
    uint64_t v8 = static os_log_type_t.error.getter(v5);
    uint64_t v9 = (void *)*sub_100019C48();
    uint64_t v10 = sub_100012990(&qword_10004DBB0);
    uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
    *(_OWORD *)(v11 + 16) = xmmword_1000377D0;
    id v12 = v9;
    uint64_t v13 = URL.path.getter();
    uint64_t v15 = v14;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_1000139FC();
    *(void *)(v11 + 32) = v13;
    *(void *)(v11 + 40) = v15;
    os_log(_:dso:log:_:_:)( v8,  &_mh_execute_header,  v12,  "Unable to add launch warning to app without installation ID: $@",  63LL,  2LL,  v11);

    swift_bridgeObjectRelease(v11);
    uint64_t v16 = type metadata accessor for AppManagerError(0LL);
    unint64_t v17 = sub_100012E3C();
    swift_allocError(v16, v17, 0LL, 0LL);
    uint64_t v19 = v18;
    uint64_t v20 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16LL))(v19, a2, v20);
    uint64_t v21 = swift_storeEnumTagMultiPayload(v19, v16, 1LL);
    return swift_willThrow(v21);
  }

  else
  {
    uint64_t v23 = v5;
    uint64_t v47 = *v6;
    uint64_t v24 = sub_100010640(*v6, v7);
    uint64_t v25 = static os_log_type_t.default.getter(v24);
    id v26 = (id *)sub_100019C48();
    id v27 = *v26;
    uint64_t v28 = sub_100012990(&qword_10004DBB0);
    uint64_t v29 = swift_allocObject(v28, 72LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_1000377D0;
    id v30 = (uint64_t *)(a2 + *(int *)(v23 + 20));
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    *(void *)(v29 + 56) = &type metadata for String;
    *(void *)(v29 + 64) = sub_1000139FC();
    *(void *)(v29 + 32) = v32;
    *(void *)(v29 + 40) = v31;
    id v33 = v27;
    swift_bridgeObjectRetain(v31);
    os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v33, "Adding launch warning mark to: %@", 33LL, 2LL, v29);

    swift_bridgeObjectRelease(v29);
    id v34 = objc_allocWithZone(&OBJC_CLASS___MIAppIdentity);
    swift_bridgeObjectRetain(v31);
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
    id v36 = [v34 initWithBundleID:v35];

    uint64_t v37 = (*(uint64_t (**)(void))(*(void *)a1 + 112LL))();
    if (!v2)
    {
      uint64_t v39 = v37;
      unint64_t v40 = v38;
      uint64_t v41 = static os_log_type_t.error.getter(v37);
      id v42 = *v26;
      os_log(_:dso:log:_:_:)( v41,  &_mh_execute_header,  v42,  "Unsupported platform for launch warning marks.",  46LL,  2LL,  &_swiftEmptyArrayStorage);

      uint64_t v43 = type metadata accessor for AppManagerError(0LL);
      unint64_t v44 = sub_100012E3C();
      swift_allocError(v43, v44, 0LL, 0LL);
      uint64_t v46 = swift_storeEnumTagMultiPayload(v45, v43, 2LL);
      swift_willThrow(v46);
      sub_1000106F8(v39, v40);
    }

    return sub_100010BA4(v47, v7);
  }

id sub_1000136BC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(&OBJC_CLASS___RBSTerminateContext);
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v4 initWithExplanation:v5];

  [v6 setMaximumTerminationResistance:40];
  swift_bridgeObjectRetain(a2);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v8 = [(id)objc_opt_self(RBSProcessPredicate) predicateMatchingBundleIdentifier:v7];

  id v9 = [objc_allocWithZone(RBSTerminateRequest) initWithPredicate:v8 context:v6];
  id v23 = 0LL;
  id v10 = [v9 execute:&v23];
  id v11 = v23;
  if ((_DWORD)v10)
  {
    id v12 = v23;
  }

  else
  {
    id v13 = v23;
    uint64_t v14 = _convertNSErrorToError(_:)(v11);

    uint64_t v16 = swift_willThrow(v15);
    uint64_t v17 = static os_log_type_t.error.getter(v16);
    uint64_t v18 = (void *)*sub_100019C48();
    uint64_t v19 = sub_100012990(&qword_10004DBB0);
    uint64_t v20 = swift_allocObject(v19, 72LL, 7LL);
    *(_OWORD *)(v20 + 16) = xmmword_1000377D0;
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = sub_1000139FC();
    *(void *)(v20 + 32) = a1;
    *(void *)(v20 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    id v21 = v18;
    os_log(_:dso:log:_:_:)(v17, &_mh_execute_header, v21, "Failed to terminate app: %@", 27LL, 2LL, v20);

    swift_bridgeObjectRelease(v20);
    swift_errorRelease(v14);
  }

  return v10;
}

uint64_t sub_100013900()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_100013910()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_100013920()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 80LL))();
}

uint64_t sub_100013948()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88LL))();
}

uint64_t sub_100013970()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96LL))() & 1;
}

uint64_t sub_10001399C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000139AC(void *a1)
{
  return sub_100012FD8(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000139B4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000139C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000139E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000139F4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_1000139FC()
{
  unint64_t result = qword_10004E5C0;
  if (!qword_10004E5C0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10004E5C0);
  }

  return result;
}

uint64_t *sub_100013A40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v10);
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = type metadata accessor for URL(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      uint64_t v9 = type metadata accessor for URL(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16LL))(a1, a2, v9);
      swift_storeEnumTagMultiPayload(a1, a3, 0LL);
    }
  }

  return a1;
}

uint64_t sub_100013B2C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  if (result <= 1)
  {
    uint64_t v4 = type metadata accessor for URL(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  }

  return result;
}

void *sub_100013B78(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0LL);
  }

  return a1;
}

void *sub_100013C3C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100014850((uint64_t)a1, type metadata accessor for AppManagerError);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }

    else
    {
      uint64_t v7 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0LL);
    }
  }

  return a1;
}

void *sub_100013D18(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1LL);
  }

  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0LL);
  }

  return a1;
}

void *sub_100013DDC(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100014850((uint64_t)a1, type metadata accessor for AppManagerError);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1LL);
    }

    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }

    else
    {
      uint64_t v7 = type metadata accessor for URL(0LL);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0LL);
    }
  }

  return a1;
}

uint64_t sub_100013EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100013EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100013ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100013EE4(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = v4[0];
    swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t *sub_100013F48(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v23);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    id v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = *(uint64_t *)((char *)a2 + v17);
    *id v13 = v15;
    v13[1] = v16;
    *(uint64_t *)((char *)a1 + v17) = v19;
    uint64_t v20 = (char *)a1 + v18;
    id v21 = (uint64_t *)((char *)a2 + v18);
    unint64_t v22 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v16);
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    }

    else
    {
      uint64_t v24 = *v21;
      sub_100010640(*v21, v22);
      *(void *)uint64_t v20 = v24;
      *((void *)v20 + 1) = v22;
    }

    uint64_t v25 = a3[9];
    id v26 = (char *)a1 + v25;
    id v27 = (char *)a2 + v25;
    unint64_t v28 = *((void *)v27 + 2);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)id v26 = *(_OWORD *)v27;
      *((void *)v26 + 2) = *((void *)v27 + 2);
    }

    else
    {
      *(_DWORD *)id v26 = *(_DWORD *)v27;
      uint64_t v29 = *((void *)v27 + 1);
      sub_100010640(v29, v28);
      *((void *)v26 + 1) = v29;
      *((void *)v26 + 2) = v28;
    }
  }

  return a1;
}

uint64_t sub_100014094(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[5] + 8));
  uint64_t result = swift_bridgeObjectRelease(*(void *)(a1 + a2[6] + 8));
  int v6 = (uint64_t *)(a1 + a2[8]);
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15) {
    uint64_t result = sub_1000106F8(*v6, v7);
  }
  uint64_t v8 = a1 + a2[9];
  unint64_t v9 = *(void *)(v8 + 16);
  if (v9 >> 60 != 15) {
    return sub_1000106F8(*(void *)(v8 + 8), v9);
  }
  return result;
}

uint64_t sub_100014138(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  unint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  id v13 = (uint64_t *)(a2 + v8);
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = *(void *)(a2 + v16);
  *uint64_t v12 = v14;
  v12[1] = v15;
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (uint64_t *)(a2 + v17);
  unint64_t v21 = *(void *)(a2 + v17 + 8);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v15);
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  }

  else
  {
    uint64_t v22 = *v20;
    sub_100010640(*v20, v21);
    *(void *)uint64_t v19 = v22;
    *(void *)(v19 + _Block_object_dispose((const void *)(v1 - 112), 8) = v21;
  }

  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  unint64_t v26 = *(void *)(v25 + 16);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    *(void *)(v24 + 16) = *(void *)(v25 + 16);
  }

  else
  {
    *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
    uint64_t v27 = *(void *)(v25 + 8);
    sub_100010640(v27, v26);
    *(void *)(v24 + _Block_object_dispose((const void *)(v1 - 112), 8) = v27;
    *(void *)(v24 + 16) = v26;
  }

  return a1;
}

uint64_t sub_100014258(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  unint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a3[6];
  id v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *id v13 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v17 = a3[8];
  uint64_t v18 = (uint64_t *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = *(void *)(a2 + v17 + 8);
  if (*(void *)(a1 + v17 + 8) >> 60 == 15LL)
  {
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = *v19;
      sub_100010640(v21, v20);
      uint64_t *v18 = v21;
      v18[1] = v20;
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  if (v20 >> 60 == 15)
  {
    sub_10001443C((uint64_t)v18);
LABEL_6:
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    goto LABEL_8;
  }

  uint64_t v22 = *v19;
  sub_100010640(v22, v20);
  uint64_t v23 = *v18;
  unint64_t v24 = v18[1];
  uint64_t *v18 = v22;
  v18[1] = v20;
  sub_1000106F8(v23, v24);
LABEL_8:
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = (__int128 *)(a2 + v25);
  unint64_t v28 = *(void *)(a1 + v25 + 16) >> 60;
  unint64_t v29 = *(void *)(a2 + v25 + 16) >> 60;
  if (v28 <= 0xE)
  {
    if (v29 <= 0xE)
    {
      *(_DWORD *)uint64_t v26 = *(_DWORD *)v27;
      uint64_t v34 = *((void *)v27 + 1);
      unint64_t v35 = *((void *)v27 + 2);
      sub_100010640(v34, v35);
      uint64_t v36 = *(void *)(v26 + 8);
      unint64_t v37 = *(void *)(v26 + 16);
      *(void *)(v26 + _Block_object_dispose((const void *)(v1 - 112), 8) = v34;
      *(void *)(v26 + 16) = v35;
      sub_1000106F8(v36, v37);
    }

    else
    {
      sub_100014470(v26);
      uint64_t v31 = *((void *)v27 + 2);
      *(_OWORD *)uint64_t v26 = *v27;
      *(void *)(v26 + 16) = v31;
    }
  }

  else if (v29 <= 0xE)
  {
    *(_DWORD *)uint64_t v26 = *(_DWORD *)v27;
    uint64_t v32 = *((void *)v27 + 1);
    unint64_t v33 = *((void *)v27 + 2);
    sub_100010640(v32, v33);
    *(void *)(v26 + _Block_object_dispose((const void *)(v1 - 112), 8) = v32;
    *(void *)(v26 + 16) = v33;
  }

  else
  {
    __int128 v30 = *v27;
    *(void *)(v26 + 16) = *((void *)v27 + 2);
    *(_OWORD *)uint64_t v26 = v30;
  }

  return a1;
}

uint64_t sub_10001443C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100014470(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000144A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v_Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(v10 + 16) = *(void *)(v11 + 16);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  return a1;
}

uint64_t sub_100014538(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v14[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  unint64_t v22 = *(void *)(a1 + v19 + 8);
  if (v22 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v23 = *(void *)(v21 + 8);
  if (v23 >> 60 == 15)
  {
    sub_10001443C(v20);
LABEL_4:
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    goto LABEL_6;
  }

  uint64_t v24 = *(void *)v20;
  *(void *)uint64_t v20 = *(void *)v21;
  *(void *)(v20 + _Block_object_dispose((const void *)(v1 - 112), 8) = v23;
  sub_1000106F8(v24, v22);
LABEL_6:
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  unint64_t v28 = *(void *)(a1 + v25 + 16);
  if (v28 >> 60 != 15)
  {
    unint64_t v29 = *(void *)(v27 + 16);
    if (v29 >> 60 != 15)
    {
      *(_DWORD *)uint64_t v26 = *(_DWORD *)v27;
      uint64_t v30 = *(void *)(v26 + 8);
      *(void *)(v26 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(void *)(v27 + 8);
      *(void *)(v26 + 16) = v29;
      sub_1000106F8(v30, v28);
      return a1;
    }

    sub_100014470(v26);
  }

  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *(void *)(v26 + 16) = *(void *)(v27 + 16);
  return a1;
}

uint64_t sub_100014680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001468C);
}

uint64_t sub_10001468C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_10001470C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014718);
}

uint64_t sub_100014718(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + _Block_object_dispose((const void *)(v1 - 112), 8) = (a2 - 1);
  return result;
}

uint64_t sub_100014794(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_100037870;
    void v4[2] = &unk_100037888;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = &unk_1000378A0;
    v4[5] = &unk_1000378B8;
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t type metadata accessor for AppManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent10AppManager);
}

uint64_t sub_100014850(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10001488C()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  sub_100014EA8(v0, qword_1000515B8);
  sub_1000148EC(v0, (uint64_t)qword_1000515B8);
  return URL.init(fileURLWithPath:)(0xD00000000000002BLL, 0x800000010003AC90LL);
}

uint64_t sub_1000148EC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100014904()
{
  return 0LL;
}

id sub_10001490C(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_10004F160 != -1) {
    swift_once(&qword_10004F160, sub_10001488C);
  }
  uint64_t v5 = type metadata accessor for URL(0LL);
  sub_1000148EC(v5, (uint64_t)qword_1000515B8);
  URL._bridgeToObjectiveC()(v6);
  uint64_t v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  id v9 = objc_msgSendSuper2(&v11, "initWithDatabaseURL:asReadOnly:", v7, a1 & 1);

  return v9;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent15LaunchWarningDB);
}

id sub_100014B5C()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  id v1 = objc_msgSendSuper2(&v16, "setupSchema");
  if ((_DWORD)v1)
  {
    id v2 = [v0 readSetting:@"databaseSchemaVersion"];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
      unint64_t v6 = v5;
    }

    else
    {
      NSString v7 = String._bridgeToObjectiveC()();
      [v0 executeQuery:v7 withBind:0 withResults:0];

      uint64_t v8 = @"databaseSchemaVersion";
      uint64_t v4 = 49LL;
      unint64_t v6 = 0xE100000000000000LL;
      NSString v9 = String._bridgeToObjectiveC()();
      [v0 setSetting:v8 toValue:v9];
    }

    if (v4 == 49 && v6 == 0xE100000000000000LL)
    {
      swift_bridgeObjectRelease(0xE100000000000000LL);
    }

    else
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, 49LL, 0xE100000000000000LL, 0LL);
      swift_bridgeObjectRelease(v6);
      if ((v11 & 1) == 0) {
        return v1;
      }
    }

    NSString v12 = String._bridgeToObjectiveC()();
    [v0 executeQuery:v12 withBind:0 withResults:0];

    uint64_t v13 = @"databaseSchemaVersion";
    NSString v14 = String._bridgeToObjectiveC()();
    [v0 setSetting:v13 toValue:v14];
  }

  return v1;
}

id sub_100014E74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t *sub_100014EA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

void sub_100014EE8()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v1 = [v0 defaultManager];
  URL.path.getter();
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  LODWORD(v3) = [v1 fileExistsAtPath:v4];

  if ((_DWORD)v3)
  {
    id v5 = [v0 defaultManager];
    URL._bridgeToObjectiveC()(v6);
    uint64_t v8 = v7;
    id v39 = 0LL;
    unsigned int v9 = [v5 removeItemAtURL:v7 error:&v39];

    id v10 = v39;
    if (!v9)
    {
LABEL_12:
      id v37 = v10;
      _convertNSErrorToError(_:)(v10);

      swift_willThrow(v38);
      return;
    }

    id v11 = v39;
  }

  id v12 = [v0 defaultManager];
  URL._bridgeToObjectiveC()(v13);
  uint64_t v15 = v14;
  URL._bridgeToObjectiveC()(v16);
  uint64_t v18 = v17;
  id v39 = 0LL;
  unsigned int v19 = [v12 copyItemAtURL:v15 toURL:v17 error:&v39];

  id v10 = v39;
  if (!v19) {
    goto LABEL_12;
  }
  id v20 = v39;
  Swift::String v21 = URL.path(percentEncoded:)(1);
  uint64_t v22 = String.utf8CString.getter(v21._countAndFlagsBits, v21._object);
  swift_bridgeObjectRelease(v21._object);
  int v23 = chmod((const char *)(v22 + 32), 0x1A4u);
  uint64_t v24 = swift_release(v22);
  if (v23)
  {
    os_log_type_t v25 = static os_log_type_t.error.getter(v24);
    uint64_t v26 = (void *)*sub_100019C48();
    if (os_log_type_enabled((os_log_t)v26, v25))
    {
      uint64_t v27 = v26;
      unint64_t v28 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v28 = 67109120;
      LODWORD(v39) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 4, v28 + 4);
      _os_log_impl((void *)&_mh_execute_header, v27, v25, "Failed to chmod document checker: %d", v28, 8u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }
  }

  uint64_t v29 = notify_post("com.apple.mis.doc-check-list-ingested");
  if ((_DWORD)v29)
  {
    int v30 = v29;
    os_log_type_t v31 = static os_log_type_t.error.getter(v29);
    uint64_t v32 = (os_log_s *)*sub_100019C48();
    uint64_t v29 = os_log_type_enabled(v32, v31);
    if ((_DWORD)v29)
    {
      unint64_t v33 = v32;
      uint64_t v34 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v34 = 67109120;
      LODWORD(v39) = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 4, v34 + 4);
      _os_log_impl((void *)&_mh_execute_header, v33, v31, "Failed to notify about new document checker: %u", v34, 8u);
      swift_slowDealloc(v34, -1LL, -1LL);
    }
  }

  uint64_t v35 = static os_log_type_t.default.getter(v29);
  id v36 = (id)*sub_100019C48();
  os_log(_:dso:log:_:_:)( v35,  &_mh_execute_header,  v36,  "Updated new document checker.",  29LL,  2LL,  &_swiftEmptyArrayStorage);
}

void sub_100015290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Data.Iterator(0LL);
  __chkstk_darwin(v3);
  __asm { BR              X10 }

unint64_t sub_100015308()
{
  uint64_t v6 = sub_1000165E4( (unint64_t *)&qword_10004DBA8,  (uint64_t (*)(uint64_t))&type metadata accessor for Data.Iterator,  (uint64_t)&protocol conformance descriptor for Data.Iterator);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of IteratorProtocol.next())(v0, v6);
  if ((*(_BYTE *)(v5 - 49) & 1) != 0)
  {
    unint64_t v7 = 0LL;
  }

  else
  {
    unint64_t v7 = 0LL;
    do
    {
      unint64_t v7 = *(unsigned __int8 *)(v5 - 50) | (v7 << 8);
      ((void (*)(uint64_t, uint64_t))dispatch thunk of IteratorProtocol.next())(v0, v6);
    }

    while (*(_BYTE *)(v5 - 49) != 1);
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return v7;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_10004DDE0)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata(0LL, &unk_100045F20);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004DDE0);
    }
  }

uint64_t sub_100015434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a1;
  v5[5] = a2;
  return URL.withUnsafeFileSystemRepresentation<A>(_:)(sub_10001630C, v5, (char *)&type metadata for () + 8);
}

void sub_100015470(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = (char *)&loc_1000154FC + *((int *)qword_100015848 + (a3 >> 62));
  v6[1] = (char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __asm { BR              X10 }

uint64_t sub_100015510()
{
  *(void *)(v7 - 104) = v3;
  *(_WORD *)(v7 - 96) = v6;
  *(_BYTE *)(v7 - 94) = BYTE2(v6);
  *(_BYTE *)(v7 - 93) = BYTE3(v6);
  *(_BYTE *)(v7 - 92) = BYTE4(v6);
  *(_BYTE *)(v7 - 91) = BYTE5(v6);
  uint64_t v8 = String.utf8CString.getter(v5, v4);
  int v9 = setxattr(v2, (const char *)(v8 + 32), (const void *)(v7 - 104), BYTE6(v6), 0, 0);
  uint64_t result = swift_release(v8);
  if (v9 < 0)
  {
    uint64_t v11 = ((uint64_t (*)(uint64_t))errno.getter)(result);
    int v12 = v11;
    uint64_t v13 = POSIXErrorCode.init(rawValue:)(v11);
    if ((v13 & 0x100000000LL) != 0)
    {
      unint64_t v19 = sub_1000165A0();
      uint64_t v18 = swift_allocError(&type metadata for UtilitiesError, v19, 0LL, 0LL);
      *id v20 = v12;
    }

    else
    {
      *(_DWORD *)(v7 - 104) = v13;
      unint64_t v14 = sub_100015F40((uint64_t)&_swiftEmptyArrayStorage);
      uint64_t v15 = sub_1000165E4( &qword_10004DE10,  (uint64_t (*)(uint64_t))&type metadata accessor for POSIXError,  (uint64_t)&protocol conformance descriptor for POSIXError);
      uint64_t v16 = *(void *)(v7 - 120);
      uint64_t v17 = _BridgedStoredNSError.init(_:userInfo:)(v7 - 104, v14, v1, v15);
      POSIXError._nsError.getter(v17);
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v16, v1);
    }

    return swift_willThrow(v18);
  }

  return result;
}

uint64_t sub_100015858(uint64_t a1)
{
  Swift::String v3 = URL.path(percentEncoded:)(1);
  int v12 = (statfs *)v8;
  uint64_t v13 = a1;
  if (((uint64_t)v3._object & 0x1000000000000000LL) != 0
    || !((uint64_t)v3._object & 0x2000000000000000LL | v3._countAndFlagsBits & 0x1000000000000000LL))
  {
    _StringGuts._slowWithCString<A>(_:)( sub_100016328,  v11,  v3._countAndFlagsBits,  v3._object,  (char *)&type metadata for () + 8);
    if (v1) {
      goto LABEL_9;
    }
LABEL_11:
    swift_bridgeObjectRelease(v3._object);
    int v6 = (v9 >> 14) & 1;
    return v6 & 1;
  }

  if (((uint64_t)v3._object & 0x2000000000000000LL) != 0)
  {
    v10[0] = v3._countAndFlagsBits;
    v10[1] = (uint64_t)v3._object & 0xFFFFFFFFFFFFFFLL;
    uint64_t v4 = (const char *)v10;
    goto LABEL_7;
  }

  if ((v3._countAndFlagsBits & 0x1000000000000000LL) != 0)
  {
    uint64_t v4 = (const char *)(((uint64_t)v3._object & 0xFFFFFFFFFFFFFFFLL) + 32);
LABEL_7:
    uint64_t v5 = (statfs *)v8;
    goto LABEL_8;
  }

  uint64_t v4 = (const char *)_StringObject.sharedUTF8.getter(v3._countAndFlagsBits, v3._object);
  uint64_t v5 = v12;
LABEL_8:
  sub_100015998(v4, v5);
  if (!v1) {
    goto LABEL_11;
  }
LABEL_9:
  swift_bridgeObjectRelease(v3._object);
  return v6 & 1;
}

uint64_t sub_100015998(const char *a1, statfs *a2)
{
  uint64_t v4 = type metadata accessor for POSIXError(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = statfs(a1, a2);
  if ((_DWORD)result == -1)
  {
    uint64_t v9 = errno.getter();
    uint64_t v10 = static os_log_type_t.error.getter(v9);
    uint64_t v11 = (void *)*sub_100019C48();
    uint64_t v12 = sub_100012990(&qword_10004DBB0);
    uint64_t v13 = swift_allocObject(v12, 112LL, 7LL);
    *(_OWORD *)(v13 + 16) = xmmword_1000377F0;
    *(void *)(v13 + 56) = &type metadata for Int32;
    *(void *)(v13 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v13 + 32) = v9;
    id v14 = v11;
    uint64_t v15 = URL.path.getter();
    uint64_t v17 = v16;
    *(void *)(v13 + 96) = &type metadata for String;
    *(void *)(v13 + 104) = sub_1000139FC();
    *(void *)(v13 + 72) = v15;
    *(void *)(v13 + 80) = v17;
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v14, "Unable to statfs app: %d, %@", 28LL, 2LL, v13);

    swift_bridgeObjectRelease(v13);
    uint64_t v18 = POSIXErrorCode.init(rawValue:)(v9);
    if ((v18 & 0x100000000LL) != 0)
    {
      unint64_t v23 = sub_1000165A0();
      uint64_t v22 = swift_allocError(&type metadata for UtilitiesError, v23, 0LL, 0LL);
      _DWORD *v24 = v9;
    }

    else
    {
      int v26 = v18;
      unint64_t v19 = sub_100015F40((uint64_t)&_swiftEmptyArrayStorage);
      uint64_t v20 = sub_1000165E4( &qword_10004DE10,  (uint64_t (*)(uint64_t))&type metadata accessor for POSIXError,  (uint64_t)&protocol conformance descriptor for POSIXError);
      uint64_t v21 = _BridgedStoredNSError.init(_:userInfo:)(&v26, v19, v4, v20);
      POSIXError._nsError.getter(v21);
      uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    return swift_willThrow(v22);
  }

  return result;
}

uint64_t sub_100015B94(uint64_t a1, uint64_t a2)
{
  return sub_100015C5C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100015BA0(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100015BE0(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100015C50(uint64_t a1, uint64_t a2)
{
  return sub_100015C5C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100015C5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100015C98(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100015D0C(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100015D88@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100015DC8(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100015E50@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100015E94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100015EBC(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004DDD0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100037AC8);
  uint64_t v3 = sub_1000165E4( &qword_10004DE00,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100037A1C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100015F40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100012990(&qword_10004DE18);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100016624(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100016068(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10001666C(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
    v7 += 48LL;
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

unint64_t sub_100016068(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000160CC(a1, a2, v5);
}

unint64_t sub_1000160CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    uint64_t v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      unint64_t i = (i + 1) & v13;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        BOOL v14 = (void *)(v9 + 16 * i);
        uint64_t v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v13; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
          {
            uint64_t v17 = (void *)(v9 + 16 * i);
            uint64_t v18 = v17[1];
            if (*v17 == a1 && v18 == a2) {
              break;
            }
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

unint64_t sub_100016210(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10001642C(a1, v7);
}

uint64_t sub_100016290(uint64_t a1)
{
  uint64_t v2 = sub_100012990(&qword_10004DDD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000162D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10001630C(uint64_t a1)
{
}

uint64_t sub_100016328(const char *a1)
{
  return sub_100015998(a1, *(statfs **)(v1 + 16));
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_1000163A8()
{
  return sub_1000165E4( &qword_10004DDE8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1000379E0);
}

uint64_t sub_1000163D4()
{
  return sub_1000165E4( &qword_10004DDF0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_1000379B4);
}

uint64_t sub_100016400()
{
  return sub_1000165E4( &qword_10004DDF8,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100037A50);
}

unint64_t sub_10001642C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

unint64_t sub_1000165A0()
{
  unint64_t result = qword_10004DE08;
  if (!qword_10004DE08)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037914, &type metadata for UtilitiesError);
    atomic_store(result, (unint64_t *)&qword_10004DE08);
  }

  return result;
}

uint64_t sub_1000165E4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100016624(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004DE20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10001666C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001667C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0LL;
      }
    }

    else
    {
      uint64_t v2 = type metadata accessor for __DataStorage(0LL);
      swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
      __DataStorage.init(length:)(v1);
      if (v1 >= 0x7FFFFFFF)
      {
        uint64_t v3 = type metadata accessor for Data.RangeReference(0LL);
        uint64_t result = swift_allocObject(v3, 32LL, 7LL);
        *(void *)(result + 16) = 0LL;
        *(void *)(result + 24) = v1;
      }

      else
      {
        return v1 << 32;
      }
    }
  }

  return result;
}

void sub_100016718(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100016778()
{
  uint64_t v13 = v1;
  __int16 v14 = v0;
  char v15 = BYTE2(v0);
  char v16 = BYTE3(v0);
  char v17 = BYTE4(v0);
  char v18 = BYTE5(v0);
  if ((v0 & 0x3000000000000LL) != 0)
  {
    unint64_t v2 = sub_100016BC8();
    uint64_t v3 = swift_allocError(&type metadata for BloomFilterError, v2, 0LL, 0LL);
    *(_OWORD *)uint64_t v4 = xmmword_100037B30;
    *(_BYTE *)(v4 + 16) = 2;
    swift_willThrow(v3);
    sub_1000106F8(v1, v0);
    return swift_bridgeObjectRelease(v19);
  }

  else
  {
    uint64_t v6 = (v0 >> 50) & 0x3F;
    if (!v6) {
      __break(1u);
    }
    uint64_t v7 = sub_100016C0C(0LL, 1LL, 1, (char *)&_swiftEmptyArrayStorage);
    uint64_t v8 = 0LL;
    unint64_t v9 = *((void *)v7 + 2);
    uint64_t v10 = 4 * v6;
    do
    {
      unsigned int v11 = *(_DWORD *)((char *)&v13 + v8);
      unint64_t v12 = *((void *)v7 + 3);
      if (v9 >= v12 >> 1) {
        uint64_t v7 = sub_100016C0C((char *)(v12 > 1), v9 + 1, 1, v7);
      }
      *((void *)v7 + 2) = v9 + 1;
      *(_DWORD *)&v7[4 * v9 + 32] = bswap32(v11);
      v8 += 4LL;
      ++v9;
    }

    while (v10 != v8);
    sub_1000106F8(v1, v0);
    uint64_t v19 = v7;
    return (uint64_t)v7;
  }

uint64_t sub_1000169B8(uint64_t result)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void (**)(void))(**(void **)(v1 + 40) + 136LL);
    swift_bridgeObjectRetain(result);
    uint64_t v7 = 0LL;
    do
    {
      v6(*(unsigned int *)(v5 + 4 * v7 + 32));
      if (v3) {
        break;
      }
    }

    while (v4 - 1 != v7++);
    return swift_bridgeObjectRelease(v5);
  }

  return result;
}

uint64_t sub_100016A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v8 = (unsigned int *)result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    uint64_t v8 = (unsigned int *)((char *)v8 + a1 - result);
  }

  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t result = __DataStorage._length.getter();
  if (!v8) {
    goto LABEL_25;
  }
  if (result >= v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = result;
  }
  if ((v11 & 3) != 0)
  {
    unint64_t v12 = sub_100016BC8();
    uint64_t v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0LL, 0LL);
    *(_OWORD *)uint64_t v14 = xmmword_100037B30;
    *(_BYTE *)(v14 + 16) = 2;
    return swift_willThrow(v13);
  }

  uint64_t v15 = v11 + 3;
  if (v11 >= 0) {
    uint64_t v15 = v11;
  }
  if (v11 < 4)
  {
LABEL_25:
    __break(1u);
    return result;
  }

  uint64_t v16 = (v15 >> 2) - 1;
  uint64_t v17 = *a4;
  uint64_t v18 = 0x2000000000000000LL;
  while (1)
  {
    unsigned int v20 = *v8++;
    unsigned int v19 = v20;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v17);
    *a4 = v17;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_100016C0C(0LL, *(void *)(v17 + 16) + 1LL, 1, (char *)v17);
      uint64_t v17 = result;
      *a4 = result;
    }

    unint64_t v22 = *(void *)(v17 + 16);
    unint64_t v21 = *(void *)(v17 + 24);
    if (v22 >= v21 >> 1)
    {
      uint64_t result = (uint64_t)sub_100016C0C((char *)(v21 > 1), v22 + 1, 1, (char *)v17);
      uint64_t v17 = result;
    }

    *(void *)(v17 + 16) = v22 + 1;
    *(_DWORD *)(v17 + 4 * v22 + 32) = bswap32(v19);
    *a4 = v17;
    if (!v16) {
      return result;
    }
    --v16;
    if (!--v18)
    {
      __break(1u);
      goto LABEL_23;
    }
  }

unint64_t sub_100016BC8()
{
  unint64_t result = qword_10004DE28;
  if (!qword_10004DE28)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003848C, &type metadata for BloomFilterError);
    atomic_store(result, (unint64_t *)&qword_10004DE28);
  }

  return result;
}

char *sub_100016C0C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100012990(&qword_10004DE30);
    uint64_t v11 = (char *)swift_allocObject(v10, 4 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 29;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 2);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[4 * v8]) {
      memmove(v14, v15, 4 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 4 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

ValueMetadata *type metadata accessor for BloomFilterUpdate()
{
  return &type metadata for BloomFilterUpdate;
}

void *sub_100016D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v6 = (void *)swift_allocObject(v2, 48LL, 7LL);
  void v6[2] = a1;
  v6[3] = a2;
  if (a1 == 0x363532616873LL && a2 == 0xE600000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x363532616873LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    int64_t v7 = sub_100017410;
  }

  else
  {
    if ((a1 != 0x323135616873LL || a2 != 0xE600000000000000LL)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(0x323135616873LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) == 0)
    {
      unint64_t v9 = sub_100016BC8();
      uint64_t v10 = swift_allocError(&type metadata for BloomFilterError, v9, 0LL, 0LL);
      *(_OWORD *)uint64_t v11 = xmmword_100037B60;
      *(_BYTE *)(v11 + 16) = 2;
      swift_willThrow(v10);
      swift_bridgeObjectRelease(v6[3]);
      swift_deallocPartialClassInstance(v6, v3, 48LL, 7LL);
      return v6;
    }

    int64_t v7 = sub_1000179F0;
  }

  void v6[4] = v7;
  v6[5] = 0LL;
  return v6;
}

uint64_t sub_100016E68()
{
  return 1LL;
}

Swift::Int sub_100016E70()
{
  return Hasher._finalize()();
}

uint64_t sub_100016EB8(uint64_t a1)
{
  return String.hash(into:)(a1, 1701667182LL, 0xE400000000000000LL);
}

Swift::Int sub_100016EC8(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100016F0C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046038, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100016F5C(void *a1@<X8>)
{
  *a1 = 1701667182LL;
  a1[1] = 0xE400000000000000LL;
}

uint64_t sub_100016F70()
{
  return 1701667182LL;
}

uint64_t sub_100016F80@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046070, v3);
  uint64_t result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100016FD4()
{
  return 0LL;
}

void sub_100016FE0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100016FEC(uint64_t a1)
{
  unint64_t v2 = sub_100018114();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017014(uint64_t a1)
{
  unint64_t v2 = sub_100018114();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001703C(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 48LL, 7LL);
  sub_100017088(a1);
  return v3;
}

void *sub_100017088(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012990(&qword_10004DE38);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100012A78(a1, v9);
  unint64_t v11 = sub_100018114();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for BloomFilterAlgorithm.CodingKeys,  &type metadata for BloomFilterAlgorithm.CodingKeys,  v11,  v9,  v10);
  if (!v2)
  {
    uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    v3[2] = v13;
    v3[3] = v14;
    BOOL v19 = v13 == 0x363532616873LL && v14 == 0xE600000000000000LL;
    if (v19
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x363532616873LL, 0xE600000000000000LL, v13, v14, 0LL) & 1) != 0)
    {
      unsigned int v20 = sub_100017410;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v3[4] = v20;
      v3[5] = 0LL;
      goto LABEL_4;
    }

    BOOL v21 = v17 == 0x323135616873LL && v18 == 0xE600000000000000LL;
    if (v21
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x323135616873LL, 0xE600000000000000LL, v17, v18, 0LL) & 1) != 0)
    {
      unsigned int v20 = sub_1000179F0;
      goto LABEL_11;
    }

    unint64_t v22 = sub_100016BC8();
    uint64_t v23 = swift_allocError(&type metadata for BloomFilterError, v22, 0LL, 0LL);
    *(_OWORD *)uint64_t v24 = xmmword_100037B60;
    *(_BYTE *)(v24 + 16) = 2;
    swift_willThrow(v23);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease(v3[3]);
  }

  uint64_t v15 = type metadata accessor for BloomFilterAlgorithm();
  swift_deallocPartialClassInstance(v3, v15, 48LL, 7LL);
LABEL_4:
  sub_100012A9C(a1);
  return v3;
}

uint64_t sub_1000172B0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100012990(&qword_10004DE48);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100012A78(a1, v8);
  unint64_t v10 = sub_100018114();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for BloomFilterAlgorithm.CodingKeys,  &type metadata for BloomFilterAlgorithm.CodingKeys,  v10,  v8,  v9);
  KeyedEncodingContainer.encode(_:forKey:)(*(void *)(v2 + 16), *(void *)(v2 + 24));
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100017390()
{
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t sub_1000173BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000173E8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 112LL))();
}

void sub_100017410(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SHA256(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for SHA256Digest(0LL);
  __chkstk_darwin(v4);
  uint64_t v5 = sub_1000165E4( &qword_10004DE50,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256,  (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v3, v5);
  __asm { BR              X10 }

uint64_t sub_100017514()
{
  *(void *)(v8 - 12_Block_object_dispose((const void *)(v1 - 112), 8) = v5;
  *(_WORD *)(v8 - 120) = v4;
  *(_BYTE *)(v8 - 11_Block_object_dispose((const void *)(v1 - 112), 8) = BYTE2(v4);
  *(_BYTE *)(v8 - 117) = BYTE3(v4);
  *(_BYTE *)(v8 - 116) = BYTE4(v4);
  *(_BYTE *)(v8 - 115) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 128, v8 - 128 + BYTE6(v4), v2, v6);
  sub_1000106F8(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 160) + 8LL))(v3, v2);
  *(void *)(v8 - 104) = v0;
  uint64_t v9 = sub_1000165E4( &qword_10004DE58,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA256Digest,  (uint64_t)&protocol conformance descriptor for SHA256Digest);
  *(void *)(v8 - 96) = v9;
  unint64_t v10 = sub_1000181CC((void *)(v8 - 128));
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v10, v1, v0);
  sub_100012A78((void *)(v8 - 128), *(void *)(v8 - 104));
  ((void (*)(_BYTE *(*)@<X0>(_BYTE *@<X0>, _BYTE *@<X1>, void *@<X8>), void, void *, uint64_t, uint64_t))dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:))( sub_100018158,  0LL,  &type metadata for Data._Representation,  v0,  v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  uint64_t v11 = *(void *)(v8 - 144);
  unint64_t v12 = *(void *)(v8 - 136);
  sub_100012A9C((void *)(v8 - 128));
  uint64_t v13 = sub_100012990(&qword_10004DE60);
  uint64_t v14 = swift_allocObject(v13, 96LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_100037B70;
  uint64_t v15 = sub_100017974(0LL, 3LL, v11, v12);
  unint64_t v17 = v16;
  sub_100015290(v15, v16);
  uint64_t v19 = v18;
  sub_1000106F8(v15, v17);
  *(void *)(v14 + 32) = v19;
  uint64_t v20 = sub_100017974(4LL, 7LL, v11, v12);
  unint64_t v22 = v21;
  sub_100015290(v20, v21);
  uint64_t v24 = v23;
  sub_1000106F8(v20, v22);
  *(void *)(v14 + 40) = v24;
  uint64_t v25 = sub_100017974(8LL, 11LL, v11, v12);
  unint64_t v27 = v26;
  sub_100015290(v25, v26);
  uint64_t v29 = v28;
  sub_1000106F8(v25, v27);
  *(void *)(v14 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v29;
  uint64_t v30 = sub_100017974(12LL, 15LL, v11, v12);
  unint64_t v32 = v31;
  sub_100015290(v30, v31);
  uint64_t v34 = v33;
  sub_1000106F8(v30, v32);
  *(void *)(v14 + 56) = v34;
  uint64_t v35 = sub_100017974(16LL, 19LL, v11, v12);
  unint64_t v37 = v36;
  sub_100015290(v35, v36);
  uint64_t v39 = v38;
  sub_1000106F8(v35, v37);
  *(void *)(v14 + 64) = v39;
  uint64_t v40 = sub_100017974(20LL, 23LL, v11, v12);
  unint64_t v42 = v41;
  sub_100015290(v40, v41);
  uint64_t v44 = v43;
  sub_1000106F8(v40, v42);
  *(void *)(v14 + 72) = v44;
  uint64_t v45 = sub_100017974(24LL, 27LL, v11, v12);
  unint64_t v47 = v46;
  sub_100015290(v45, v46);
  uint64_t v49 = v48;
  sub_1000106F8(v45, v47);
  *(void *)(v14 + 80) = v49;
  uint64_t v50 = sub_100017974(28LL, 31LL, v11, v12);
  unint64_t v52 = v51;
  sub_100015290(v50, v51);
  uint64_t v54 = v53;
  sub_1000106F8(v50, v52);
  *(void *)(v14 + 8_Block_object_dispose((const void *)(v1 - 112), 8) = v54;
  sub_1000106F8(v11, v12);
  return v14;
}

uint64_t sub_100017974(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_100017984 + *((int *)qword_1000179E0 + (a4 >> 62))))();
}

uint64_t sub_100017998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (BYTE6(a4) <= a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a2 + 1 < a1)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x1000179E0LL);
  }

  return Data._Representation.subscript.getter();
}

void sub_1000179F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SHA512(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for SHA512Digest(0LL);
  __chkstk_darwin(v4);
  uint64_t v5 = sub_1000165E4( &qword_10004DE68,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA512,  (uint64_t)&protocol conformance descriptor for SHA512);
  dispatch thunk of HashFunction.init()(v3, v5);
  __asm { BR              X10 }

uint64_t sub_100017AF4()
{
  *(void *)(v8 - 12_Block_object_dispose((const void *)(v1 - 112), 8) = v5;
  *(_WORD *)(v8 - 120) = v4;
  *(_BYTE *)(v8 - 11_Block_object_dispose((const void *)(v1 - 112), 8) = BYTE2(v4);
  *(_BYTE *)(v8 - 117) = BYTE3(v4);
  *(_BYTE *)(v8 - 116) = BYTE4(v4);
  *(_BYTE *)(v8 - 115) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 128, v8 - 128 + BYTE6(v4), v2, v6);
  sub_1000106F8(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v2, v6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 160) + 8LL))(v3, v2);
  *(void *)(v8 - 104) = v0;
  uint64_t v9 = sub_1000165E4( &qword_10004DE70,  (uint64_t (*)(uint64_t))&type metadata accessor for SHA512Digest,  (uint64_t)&protocol conformance descriptor for SHA512Digest);
  *(void *)(v8 - 96) = v9;
  unint64_t v10 = sub_1000181CC((void *)(v8 - 128));
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v10, v1, v0);
  sub_100012A78((void *)(v8 - 128), *(void *)(v8 - 104));
  ((void (*)(_BYTE *(*)@<X0>(_BYTE *@<X0>, _BYTE *@<X1>, void *@<X8>), void, void *, uint64_t, uint64_t))dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:))( sub_100018158,  0LL,  &type metadata for Data._Representation,  v0,  v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  uint64_t v11 = *(void *)(v8 - 144);
  unint64_t v12 = *(void *)(v8 - 136);
  sub_100012A9C((void *)(v8 - 128));
  uint64_t v13 = sub_100012990(&qword_10004DE60);
  uint64_t v14 = swift_allocObject(v13, 160LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_100037B80;
  uint64_t v15 = sub_100017974(0LL, 3LL, v11, v12);
  unint64_t v17 = v16;
  sub_100015290(v15, v16);
  uint64_t v19 = v18;
  sub_1000106F8(v15, v17);
  *(void *)(v14 + 32) = v19;
  uint64_t v20 = sub_100017974(4LL, 7LL, v11, v12);
  unint64_t v22 = v21;
  sub_100015290(v20, v21);
  uint64_t v24 = v23;
  sub_1000106F8(v20, v22);
  *(void *)(v14 + 40) = v24;
  uint64_t v25 = sub_100017974(8LL, 11LL, v11, v12);
  unint64_t v27 = v26;
  sub_100015290(v25, v26);
  uint64_t v29 = v28;
  sub_1000106F8(v25, v27);
  *(void *)(v14 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v29;
  uint64_t v30 = sub_100017974(12LL, 15LL, v11, v12);
  unint64_t v32 = v31;
  sub_100015290(v30, v31);
  uint64_t v34 = v33;
  sub_1000106F8(v30, v32);
  *(void *)(v14 + 56) = v34;
  uint64_t v35 = sub_100017974(16LL, 19LL, v11, v12);
  unint64_t v37 = v36;
  sub_100015290(v35, v36);
  uint64_t v39 = v38;
  sub_1000106F8(v35, v37);
  *(void *)(v14 + 64) = v39;
  uint64_t v40 = sub_100017974(20LL, 23LL, v11, v12);
  unint64_t v42 = v41;
  sub_100015290(v40, v41);
  uint64_t v44 = v43;
  sub_1000106F8(v40, v42);
  *(void *)(v14 + 72) = v44;
  uint64_t v45 = sub_100017974(24LL, 27LL, v11, v12);
  unint64_t v47 = v46;
  sub_100015290(v45, v46);
  uint64_t v49 = v48;
  sub_1000106F8(v45, v47);
  *(void *)(v14 + 80) = v49;
  uint64_t v50 = sub_100017974(28LL, 31LL, v11, v12);
  unint64_t v52 = v51;
  sub_100015290(v50, v51);
  uint64_t v54 = v53;
  sub_1000106F8(v50, v52);
  *(void *)(v14 + 8_Block_object_dispose((const void *)(v1 - 112), 8) = v54;
  uint64_t v55 = sub_100017974(32LL, 35LL, v11, v12);
  unint64_t v57 = v56;
  sub_100015290(v55, v56);
  uint64_t v59 = v58;
  sub_1000106F8(v55, v57);
  *(void *)(v14 + 96) = v59;
  uint64_t v60 = sub_100017974(36LL, 39LL, v11, v12);
  unint64_t v62 = v61;
  sub_100015290(v60, v61);
  uint64_t v64 = v63;
  sub_1000106F8(v60, v62);
  *(void *)(v14 + 104) = v64;
  uint64_t v65 = sub_100017974(40LL, 43LL, v11, v12);
  unint64_t v67 = v66;
  sub_100015290(v65, v66);
  uint64_t v69 = v68;
  sub_1000106F8(v65, v67);
  *(void *)(v14 + 112) = v69;
  uint64_t v70 = sub_100017974(44LL, 47LL, v11, v12);
  unint64_t v72 = v71;
  sub_100015290(v70, v71);
  uint64_t v74 = v73;
  sub_1000106F8(v70, v72);
  *(void *)(v14 + 120) = v74;
  uint64_t v75 = sub_100017974(48LL, 51LL, v11, v12);
  unint64_t v77 = v76;
  sub_100015290(v75, v76);
  uint64_t v79 = v78;
  sub_1000106F8(v75, v77);
  *(void *)(v14 + 12_Block_object_dispose((const void *)(v1 - 112), 8) = v79;
  uint64_t v80 = sub_100017974(52LL, 55LL, v11, v12);
  unint64_t v82 = v81;
  sub_100015290(v80, v81);
  uint64_t v84 = v83;
  sub_1000106F8(v80, v82);
  *(void *)(v14 + 136) = v84;
  uint64_t v85 = sub_100017974(56LL, 59LL, v11, v12);
  unint64_t v87 = v86;
  sub_100015290(v85, v86);
  uint64_t v89 = v88;
  sub_1000106F8(v85, v87);
  *(void *)(v14 + 144) = v89;
  uint64_t v90 = sub_100017974(60LL, 63LL, v11, v12);
  unint64_t v92 = v91;
  sub_100015290(v90, v91);
  uint64_t v94 = v93;
  sub_1000106F8(v90, v92);
  *(void *)(v14 + 152) = v94;
  sub_1000106F8(v11, v12);
  return v14;
}

uint64_t type metadata accessor for BloomFilterAlgorithm()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent20BloomFilterAlgorithm);
}

unint64_t sub_100018114()
{
  unint64_t result = qword_10004DE40;
  if (!qword_10004DE40)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037C3C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DE40);
  }

  return result;
}

_BYTE *sub_100018158@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0LL;
LABEL_4:
    unint64_t v5 = 0xC000000000000000LL;
    goto LABEL_5;
  }

  if (v4 <= 14)
  {
    unint64_t result = (_BYTE *)sub_10001187C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }

  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (_BYTE *)sub_1000184B4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000LL;
  }

  else
  {
    unint64_t result = (_BYTE *)sub_10001852C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000LL;
  }

LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_1000181CC(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100018208( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v13 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v13 += a1 - result;
  }

  BOOL v14 = __OFSUB__(a2, a1);
  uint64_t v15 = a2 - a1;
  if (v14)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v16 = __DataStorage._length.getter();
  if (v16 >= v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v16;
  }
  uint64_t v18 = v13 + v17;
  if (v13) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = a5(0LL);
  uint64_t v21 = sub_1000165E4(a6, a5, a7);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v13, v19, v20, v21);
}

unint64_t sub_1000182E0()
{
  unint64_t result = qword_10004DE78;
  if (!qword_10004DE78)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037B9C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DE78);
  }

  return result;
}

unint64_t sub_100018328()
{
  unint64_t result = qword_10004DE80;
  if (!qword_10004DE80)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037CB4, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DE80);
  }

  return result;
}

unint64_t sub_100018370()
{
  unint64_t result = qword_10004DE88;
  if (!qword_10004DE88)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037C8C, &type metadata for BloomFilterAlgorithm.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004DE88);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for BloomFilterAlgorithm.CodingKeys(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100018448 + 4 * byte_100037B90[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100018468 + 4 * byte_100037B95[v4]))();
  }
}

_BYTE *sub_100018448(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_100018468(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100018470(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100018478(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100018480(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100018488(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterAlgorithm.CodingKeys()
{
  return &type metadata for BloomFilterAlgorithm.CodingKeys;
}

ValueMetadata *type metadata accessor for HashAlgorithmRegistry()
{
  return &type metadata for HashAlgorithmRegistry;
}

uint64_t sub_1000184B4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v6 = type metadata accessor for Data.RangeReference(0LL);
    uint64_t result = swift_allocObject(v6, 32LL, 7LL);
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = v3;
  }

  return result;
}

uint64_t sub_10001852C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = a2 - a1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = type metadata accessor for __DataStorage(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = __DataStorage.init(bytes:length:)(a1, v3);
  if (v3 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if ((v3 & 0x80000000) == 0) {
    return v3 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

const char *sub_1000185AC()
{
  return "ckContainer";
}

const char *sub_1000185B8()
{
  return "ckEnvironment";
}

uint64_t sub_1000185C4()
{
  return sub_10001887C();
}

id sub_1000185DC()
{
  return sub_1000186CC();
}

void sub_1000185FC()
{
}

void sub_10001861C()
{
  id v1 = String._bridgeToObjectiveC()();
  [v0 deleteSetting:v1];
}

uint64_t sub_100018670()
{
  return sub_10001887C();
}

void sub_10001868C()
{
}

id sub_1000186A8()
{
  return sub_1000186CC();
}

id sub_1000186CC()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 readSetting:v1];

  if (v2)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    uint64_t v5 = v4;

    id v2 = (id)Data.init(base64Encoded:options:)(v3, v5, 0LL);
    swift_bridgeObjectRelease(v5);
  }

  return v2;
}

void sub_100018760()
{
}

void sub_100018784()
{
  NSString v1 = String._bridgeToObjectiveC()();
  object = Data.base64EncodedString(options:)(0LL)._object;
  id v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  [v0 setSetting:v1 toValue:v3];
}

void sub_100018808()
{
  id v1 = String._bridgeToObjectiveC()();
  [v0 deleteSetting:v1];
}

uint64_t sub_100018860()
{
  return sub_10001887C();
}

uint64_t sub_10001887C()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 readSetting:v1];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_1000188F4()
{
}

void sub_100018910()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = String._bridgeToObjectiveC()();
  [v0 setSetting:v1 toValue:v2];
}

uint64_t sub_100018980(uint64_t a1)
{
  if (a1 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1) {
    return v1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100018998(char a1)
{
  return a1 & 1;
}

BOOL sub_1000189A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000189B8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000189FC()
{
}

Swift::Int sub_100018A24(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void *sub_100018A64@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1LL) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_100018A84(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100018A90()
{
  return &unk_100037DB0;
}

void *sub_100018A9C()
{
  return &unk_100037DB8;
}

void *sub_100018AA8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100018AB4(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_100018ABC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100018AD0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100018AE4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100018AF8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100018B28@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v1 - 112), 8) = v3 == 0;
  return result;
}

uint64_t *sub_100018B54@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v1 - 112), 8) = v5 == 0;
  return result;
}

void *sub_100018B78(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100018B8C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100018BA0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100018BB4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100018BC8(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_100018BDC(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_100018BF0(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_100018C04()
{
  return *v0 == 0LL;
}

uint64_t sub_100018C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100018C2C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100018C40@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0;
  return result;
}

void sub_100018C50(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100018C5C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100018C70@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100019A54(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails(uint64_t a1)
{
  uint64_t result = qword_10004FCF0;
  if (!qword_10004FCF0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LaunchWarningDetails);
  }
  return result;
}

uint64_t sub_100018CE8@<X0>( int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = a1;
  *(void *)(a8 + _Block_object_dispose((const void *)(v1 - 112), 8) = a2;
  *(void *)(a8 + 16) = a3;
  char v12 = a5 & 1;
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v14 = a8 + v13[6];
  uint64_t v15 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))(v14, a4, v15);
  *(_BYTE *)(a8 + v13[7]) = v12;
  *(void *)(a8 + v13[8]) = a6;
  return sub_100018D84(a7, a8 + v13[9]);
}

uint64_t sub_100018D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_100018DD0()
{
  unint64_t result = qword_10004DF48;
  if (!qword_10004DF48)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037DC0, &type metadata for LaunchWarningReason);
    atomic_store(result, (unint64_t *)&qword_10004DF48);
  }

  return result;
}

unint64_t sub_100018E18()
{
  unint64_t result = qword_10004DF50;
  if (!qword_10004DF50)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037F60, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DF50);
  }

  return result;
}

unint64_t sub_100018E60()
{
  unint64_t result = qword_10004DF58;
  if (!qword_10004DF58)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037E98, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DF58);
  }

  return result;
}

unint64_t sub_100018EA8()
{
  unint64_t result = qword_10004DF60;
  if (!qword_10004DF60)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037F98, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DF60);
  }

  return result;
}

unint64_t sub_100018EF0()
{
  unint64_t result = qword_10004DF68;
  if (!qword_10004DF68)
  {
    unint64_t result = swift_getWitnessTable(&unk_100037FC0, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_10004DF68);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for LaunchWarningReason(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10001901C + 4 * byte_100037DA5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100019050 + 4 * byte_100037DA0[v4]))();
}

uint64_t sub_100019050(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019058(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100019060LL);
  }
  return result;
}

uint64_t sub_10001906C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100019074LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100019078(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019080(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001908C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100019094(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

void *sub_1000190C0(_DWORD *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v20);
  }

  else
  {
    *a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_100010640(v7, v8);
    v4[1] = v7;
    void v4[2] = v8;
    uint64_t v9 = a3[6];
    unint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    uint64_t v13 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(void *)((char *)v4 + v13) = *(void *)((char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = type metadata accessor for URL(0LL);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17))
    {
      uint64_t v19 = sub_100012990(&qword_10004E770);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
    }
  }

  return v4;
}

uint64_t sub_100019204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  return result;
}

uint64_t sub_1000192A8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_100010640(v6, v7);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v6;
  *(void *)(a1 + 16) = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16))
  {
    uint64_t v18 = sub_100012990(&qword_10004E770);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 1LL, v16);
  }

  return a1;
}

uint64_t sub_1000193C0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_100010640(v6, v7);
  uint64_t v8 = *(void *)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v6;
  *(void *)(a1 + 16) = v7;
  sub_1000106F8(v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1LL, v17);
  int v20 = v19(v16, 1LL, v17);
  if (!(_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }

  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_100012990(&qword_10004E770);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  return a1;
}

uint64_t sub_100019530(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14))
  {
    uint64_t v16 = sub_100012990(&qword_10004E770);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 1LL, v14);
  }

  return a1;
}

uint64_t sub_10001963C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + 8);
  sub_1000106F8(v6, v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  uint64_t v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1LL, v16);
  int v19 = v18(v15, 1LL, v16);
  if (!(_DWORD)v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100012990(&qword_10004E770);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 1LL, v16);
  return a1;
}

uint64_t sub_1000197A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000197AC);
}

uint64_t sub_1000197AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }

  if ((_DWORD)a2 != 254)
  {
    uint64_t v8 = sub_100012990(&qword_10004E770);
    uint64_t v7 = *(void *)(v8 - 8);
    uint64_t v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }

  unsigned int v10 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v10 >= 2) {
    return v10 - 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10001984C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019858);
}

uint64_t sub_100019858(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a4[6];
  }

  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + a4[7]) = a2 + 1;
      return result;
    }

    uint64_t v10 = sub_100012990(&qword_10004E770);
    uint64_t v9 = *(void *)(v10 - 8);
    uint64_t v11 = a4[9];
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_1000198F8(uint64_t a1)
{
  v6[0] = (char *)&value witness table for Builtin.Int32 + 64;
  v6[1] = &unk_100038048;
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    void v6[2] = *(void *)(v2 - 8) + 64LL;
    v6[3] = &unk_100038060;
    void v6[4] = (char *)&value witness table for Builtin.Int64 + 64;
    sub_1000199AC(319LL);
    if (v5 <= 0x3F)
    {
      v6[5] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 6LL, v6, a1 + 16);
    }
  }

void sub_1000199AC(uint64_t a1)
{
  if (!qword_10004DFC8)
  {
    uint64_t v2 = type metadata accessor for URL(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10004DFC8);
    }
  }

void type metadata accessor for SecCSDigestAlgorithm()
{
  if (!qword_10004E008)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata(0LL, &unk_1000462F0);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004E008);
    }
  }

uint64_t sub_100019A54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

uint64_t sub_100019A90()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0x6C7070612E6D6F63LL,  0xED000073696D2E65LL,  0x6573616261746164LL,  0xE800000000000000LL);
  qword_1000515D0 = result;
  return result;
}

uint64_t *sub_100019AF4()
{
  if (qword_10004FD00 != -1) {
    swift_once(&qword_10004FD00, sub_100019A90);
  }
  return &qword_1000515D0;
}

uint64_t sub_100019B34()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0x6C7070612E6D6F63LL,  0xED000073696D2E65LL,  0x74696B64756F6C63LL,  0xE800000000000000LL);
  qword_1000515D8 = result;
  return result;
}

uint64_t *sub_100019B98()
{
  if (qword_10004FD08 != -1) {
    swift_once(&qword_10004FD08, sub_100019B34);
  }
  return &qword_1000515D8;
}

uint64_t sub_100019BD8()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0x6C7070612E6D6F63LL,  0xED000073696D2E65LL,  0x775F68636E75616CLL,  0xEF73676E696E7261LL);
  qword_1000515E0 = result;
  return result;
}

uint64_t *sub_100019C48()
{
  if (qword_10004FD10 != -1) {
    swift_once(&qword_10004FD10, sub_100019BD8);
  }
  return &qword_1000515E0;
}

uint64_t type metadata accessor for Logger()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent6Logger);
}

unint64_t sub_100019CA8()
{
  unint64_t result = qword_10004E0A8;
  if (!qword_10004E0A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E0A8);
  }

  return result;
}

uint64_t sub_100019CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4 = a1 == 1634564716 && a2 == 0xE400000000000000LL;
  if (v4 || (_stringCompareWithSmolCheck(_:_:expecting:)(1634564716LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    uint64_t v7 = (unsigned int *)&enum case for Algorithm.lzma(_:);
  }

  else
  {
    if ((a1 != 1651076218 || a2 != 0xE400000000000000LL)
      && (_stringCompareWithSmolCheck(_:_:expecting:)(1651076218LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v14 = type metadata accessor for Algorithm(0LL);
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL);
      uint64_t v12 = a3;
      uint64_t v13 = 1LL;
      return v11(v12, v13, 1LL, v14);
    }

    uint64_t v7 = (unsigned int *)&enum case for Algorithm.zlib(_:);
  }

  uint64_t v8 = *v7;
  uint64_t v9 = type metadata accessor for Algorithm(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(a3, v8, v9);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  uint64_t v12 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = v9;
  return v11(v12, v13, 1LL, v14);
}

void sub_100019DF8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  id v57 = a1;
  uint64_t v54 = type metadata accessor for Algorithm(0LL);
  uint64_t v52 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v53 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for FilterOperation(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v46 - v13;
  unint64_t v15 = sub_10001A1F0();
  uint64_t v16 = *(void (**)(char *, id, uint64_t))(v9 + 16);
  v16(v14, v57, v8);
  uint64_t v17 = v59;
  id v18 = sub_10001A22C((uint64_t)v14, (SEL *)&selRef_fileHandleForReadingFromURL_error_);
  if (!v17)
  {
    uint64_t v48 = (void (*)(char *, uint64_t, uint64_t))v16;
    unint64_t v49 = v15;
    uint64_t v50 = v12;
    uint64_t v51 = v8;
    id v57 = v18;
    uint64_t v59 = v5;
    uint64_t v19 = v54;
    unint64_t v47 = v7;
    uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
    id v21 = [v20 defaultManager];
    uint64_t v22 = v55;
    URL.path.getter();
    uint64_t v24 = v23;
    NSString v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    LOBYTE(v24) = [v21 fileExistsAtPath:v25];

    if ((v24 & 1) == 0)
    {
      id v26 = [v20 defaultManager];
      URL.path.getter();
      uint64_t v28 = v27;
      NSString v29 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v28);
      [v26 createFileAtPath:v29 contents:0 attributes:0];
    }

    uint64_t v30 = (uint64_t)v50;
    v48(v50, v22, v51);
    id v31 = sub_10001A22C(v30, (SEL *)&selRef_fileHandleForWritingToURL_error_);
    uint64_t v32 = v56;
    uint64_t v33 = v31;
    uint64_t v34 = v47;
    (*(void (**)(char *, void, uint64_t))(v59 + 104))(v47, enum case for FilterOperation.decompress(_:), v4);
    uint64_t v35 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v53, v32, v19);
    uint64_t v36 = swift_allocObject(&unk_100046450, 24LL, 7LL);
    unint64_t v37 = v57;
    *(void *)(v36 + 16) = v57;
    uint64_t v38 = sub_100012990(&qword_10004E0B8);
    swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
    id v39 = v37;
    uint64_t v40 = InputFilter.init(_:using:bufferCapacity:readingFrom:)(v34, v35, 0x10000LL, sub_10001A364, v36);
    uint64_t v41 = dispatch thunk of InputFilter.readData(ofLength:)(0x10000LL);
    for (unint64_t i = v42; i >> 60 != 15; unint64_t i = v45)
    {
      v58[0] = v41;
      v58[1] = i;
      unint64_t v44 = sub_10001A390();
      NSFileHandle.write<A>(contentsOf:)(v58, &type metadata for Data, v44);
      sub_100010BA4(v41, i);
      uint64_t v41 = dispatch thunk of InputFilter.readData(ofLength:)(0x10000LL);
    }

    swift_release(v40);
  }

unint64_t sub_10001A1F0()
{
  unint64_t result = qword_10004E0B0;
  if (!qword_10004E0B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSFileHandle);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E0B0);
  }

  return result;
}

id sub_10001A22C(uint64_t a1, SEL *a2)
{
  uint64_t v4 = v2;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v7 = v6;
  id v16 = 0LL;
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), *a2, v6, &v16);

  id v9 = v16;
  if (v8)
  {
    uint64_t v10 = type metadata accessor for URL(0LL);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL);
    id v12 = v9;
    v11(a1, v10);
  }

  else
  {
    id v13 = v16;
    _convertNSErrorToError(_:)(v9);

    swift_willThrow();
    uint64_t v14 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(a1, v14);
  }

  return v8;
}

uint64_t sub_10001A340()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001A364@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSFileHandle.read(upToCount:)();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }

  return result;
}

unint64_t sub_10001A390()
{
  unint64_t result = qword_10004E0C0;
  if (!qword_10004E0C0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E0C0);
  }

  return result;
}

void sub_10001A3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Algorithm(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for FilterOperation(0LL);
  __chkstk_darwin(v4);
  *(void *)(swift_allocObject(&unk_100046478, 24LL, 7LL) + 16) = 0LL;
  __asm { BR              X10 }

uint64_t sub_10001A4AC()
{
  id v9 = (void *)swift_allocObject(&unk_1000464A0, 48LL, 7LL);
  v9[2] = BYTE6(v0);
  uint64_t v10 = *(void *)(v8 - 72);
  void v9[3] = v10;
  v9[4] = v2;
  v9[5] = v0;
  uint64_t v11 = sub_100012990(&qword_10004E0B8);
  swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
  swift_retain(v10);
  sub_100010640(v2, v0);
  uint64_t v12 = *(void *)(v8 - 104);
  uint64_t v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>), void *))InputFilter.init(_:using:bufferCapacity:readingFrom:))( v4,  v3,  0x10000LL,  sub_10001A6BC,  v9);
  if (v12) {
    return swift_release(v10);
  }
  uint64_t v14 = v13;
  *(_OWORD *)(v8 - 96) = xmmword_100037B20;
  uint64_t v15 = ((uint64_t (*)(uint64_t))dispatch thunk of InputFilter.readData(ofLength:))(0x10000LL);
  for (unint64_t i = v16; i >> 60 != 15; unint64_t i = v18)
  {
    ((void (*)(uint64_t, unint64_t))Data.append(_:))(v15, i);
    sub_100010BA4(v15, i);
    uint64_t v15 = ((uint64_t (*)(uint64_t))dispatch thunk of InputFilter.readData(ofLength:))(0x10000LL);
  }

  swift_release(v10);
  swift_release(v14);
  return *(void *)(v8 - 96);
}

uint64_t sub_10001A680()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001A690()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10001A6BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = (void *)(v6 + 16);
  swift_beginAccess(v6 + 16, v14, 0LL, 0LL);
  uint64_t result = *(void *)(v6 + 16);
  if (__OFSUB__(v5, result))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  if (v5 - result >= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v5 - result;
  }
  if (__OFADD__(result, v9)) {
    goto LABEL_10;
  }
  if (result + v9 < result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v10 = Data.subdata(in:)();
  uint64_t v12 = v11;
  uint64_t result = swift_beginAccess(v6 + 16, &v13, 1LL, 0LL);
  if (!__OFADD__(*v7, v9))
  {
    *v7 += v9;
    *a2 = v10;
    a2[1] = v12;
    return result;
  }

uint64_t sub_10001A79C()
{
  SecStaticCodeRef staticCode = 0LL;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v1 = v0;
  OSStatus v2 = SecStaticCodeCreateWithPath(v0, 0, &staticCode);

  if (v2 || !staticCode)
  {
    uint64_t v13 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    uint64_t v14 = (void *)*sub_100019C48();
    uint64_t v15 = sub_100012990(&qword_10004DBB0);
    uint64_t v16 = swift_allocObject(v15, 112LL, 7LL);
    *(_OWORD *)(v16 + 16) = xmmword_1000377F0;
    *(void *)(v16 + 56) = &type metadata for Int32;
    *(void *)(v16 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v16 + 32) = v2;
    uint64_t v17 = v14;
    uint64_t v18 = URL.path.getter();
    uint64_t v20 = v19;
    *(void *)(v16 + 96) = &type metadata for String;
    *(void *)(v16 + 104) = sub_1000139FC();
    *(void *)(v16 + 72) = v18;
    *(void *)(v16 + 80) = v20;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v17, "Unable to create code object (%d) for: %@", 41LL, 2LL, v16);

    swift_bridgeObjectRelease(v16);
    unint64_t v21 = sub_10001AE48();
    uint64_t v22 = swift_allocError(&type metadata for CodeSignatureError, v21, 0LL, 0LL);
    *(_DWORD *)uint64_t v23 = v2;
    *(_BYTE *)(v23 + 4) = 0;
    swift_willThrow(v22);
LABEL_29:

    return v17;
  }

  CFDictionaryRef information = 0LL;
  uint64_t v3 = staticCode;
  OSStatus v4 = SecCodeCopySigningInformation(v3, 0x21u, &information);
  if (v4 || (CFDictionaryRef v5 = information) == 0LL)
  {
    uint64_t v24 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    NSString v25 = (void *)*sub_100019C48();
    uint64_t v26 = sub_100012990(&qword_10004DBB0);
    uint64_t v17 = swift_allocObject(v26, 112LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_1000377F0;
    *(void *)(v17 + 56) = &type metadata for Int32;
    *(void *)(v17 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v17 + 32) = v4;
    id v27 = v25;
    uint64_t v28 = URL.path.getter();
    uint64_t v30 = v29;
    *(void *)(v17 + 96) = &type metadata for String;
    *(void *)(v17 + 104) = sub_1000139FC();
    *(void *)(v17 + 72) = v28;
    *(void *)(v17 + 80) = v30;
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v27, "Unable to create signing info (%d) for: %@", 42LL, 2LL, v17);

    swift_bridgeObjectRelease(v17);
    unint64_t v31 = sub_10001AE48();
    uint64_t v32 = swift_allocError(&type metadata for CodeSignatureError, v31, 0LL, 0LL);
    *(_DWORD *)uint64_t v33 = v4;
    *(_BYTE *)(v33 + 4) = 0;
    swift_willThrow(v32);
LABEL_28:

    goto LABEL_29;
  }

  *(void *)&__int128 v68 = kSecCodeInfoCdHashesFull;
  id v6 = kSecCodeInfoCdHashesFull;
  uint64_t v7 = v5;
  id v8 = v6;
  uint64_t v9 = v7;
  uint64_t v10 = sub_100012990(&qword_10004E0D0);
  uint64_t v11 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v68, v10);
  id v12 = -[__CFDictionary __swift_objectForKeyedSubscript:](v9, "__swift_objectForKeyedSubscript:", v11);
  swift_unknownObjectRelease(v11);
  if (v12)
  {
    _bridgeAnyObjectToAny(_:)(&v68, v12);
    swift_unknownObjectRelease(v12);
  }

  else
  {
    __int128 v68 = 0u;
    __int128 v69 = 0u;
  }

  sub_10001AE8C((uint64_t)&v68, (uint64_t)v70);
  if (!v71)
  {

    uint64_t v39 = sub_100016290((uint64_t)v70);
LABEL_16:
    uint64_t v40 = static os_log_type_t.error.getter(v39);
    uint64_t v41 = (void *)*sub_100019C48();
    uint64_t v42 = sub_100012990(&qword_10004DBB0);
    uint64_t v17 = swift_allocObject(v42, 72LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_1000377D0;
    id v43 = v41;
    uint64_t v44 = URL.path.getter();
    uint64_t v46 = v45;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_1000139FC();
    *(void *)(v17 + 32) = v44;
    *(void *)(v17 + 40) = v46;
    os_log(_:dso:log:_:_:)( v40,  &_mh_execute_header,  v43,  "Unable to get full cdhash information for: %@",  45LL,  2LL,  v17);
LABEL_27:

    swift_bridgeObjectRelease(v17);
    unint64_t v63 = sub_10001AE48();
    uint64_t v64 = swift_allocError(&type metadata for CodeSignatureError, v63, 0LL, 0LL);
    *(_DWORD *)uint64_t v65 = 0;
    *(_BYTE *)(v65 + 4) = 1;
    swift_willThrow(v64);

    goto LABEL_28;
  }

  uint64_t v34 = sub_100012990(&qword_10004E0D8);
  if ((swift_dynamicCast(&v67, v70, (char *)&type metadata for Any + 8, v34, 6LL) & 1) == 0)
  {

    goto LABEL_16;
  }

  uint64_t v35 = v67;

  uint64_t v36 = (id)kSecCodeInfoDigestAlgorithm;
  id v37 = -[__CFDictionary __swift_objectForKeyedSubscript:](v9, "__swift_objectForKeyedSubscript:", v36);
  if (v37)
  {
    id v38 = v37;
    _bridgeAnyObjectToAny(_:)(&v68, v37);
    swift_unknownObjectRelease(v38);
  }

  else
  {
    __int128 v68 = 0u;
    __int128 v69 = 0u;
  }

  sub_10001AE8C((uint64_t)&v68, (uint64_t)v70);
  if (!v71)
  {

    swift_bridgeObjectRelease(v35);
    uint64_t v49 = sub_100016290((uint64_t)v70);
LABEL_25:
    uint64_t v50 = static os_log_type_t.error.getter(v49);
    uint64_t v51 = (void *)*sub_100019C48();
    uint64_t v52 = sub_100012990(&qword_10004DBB0);
    uint64_t v17 = swift_allocObject(v52, 72LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_1000377D0;
    id v43 = v51;
    uint64_t v53 = URL.path.getter();
    uint64_t v55 = v54;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_1000139FC();
    *(void *)(v17 + 32) = v53;
    *(void *)(v17 + 40) = v55;
    os_log(_:dso:log:_:_:)( v50,  &_mh_execute_header,  v43,  "Unable to get best cdhash digest algorithm: %@",  46LL,  2LL,  v17);
    goto LABEL_27;
  }

  if ((swift_dynamicCast(&v67, v70, (char *)&type metadata for Any + 8, &type metadata for UInt32, 6LL) & 1) == 0)
  {

    uint64_t v49 = swift_bridgeObjectRelease(v35);
    goto LABEL_25;
  }

  uint64_t v17 = v67;

  if (!*(void *)(v35 + 16) || (unint64_t v47 = sub_10001AED4(v17), (v48 & 1) == 0))
  {
    uint64_t v56 = swift_bridgeObjectRelease(v35);
    uint64_t v57 = static os_log_type_t.error.getter(v56);
    uint64_t v58 = (void *)*sub_100019C48();
    uint64_t v59 = sub_100012990(&qword_10004DBB0);
    uint64_t v17 = swift_allocObject(v59, 72LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_1000377D0;
    id v43 = v58;
    uint64_t v60 = URL.path.getter();
    uint64_t v62 = v61;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_1000139FC();
    *(void *)(v17 + 32) = v60;
    *(void *)(v17 + 40) = v62;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v43, "Unable to get best cdhash data: %@", 34LL, 2LL, v17);
    goto LABEL_27;
  }

  sub_100010640(*(void *)(*(void *)(v35 + 56) + 16 * v47), *(void *)(*(void *)(v35 + 56) + 16 * v47 + 8));

  swift_bridgeObjectRelease(v35);
  return v17;
}

unint64_t sub_10001AE48()
{
  unint64_t result = qword_10004E0C8;
  if (!qword_10004E0C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000380B0, &type metadata for CodeSignatureError);
    atomic_store(result, (unint64_t *)&qword_10004E0C8);
  }

  return result;
}

uint64_t sub_10001AE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004DDD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001AED4(unsigned int a1)
{
  uint64_t v3 = static Hasher._hash(seed:bytes:count:)(*(void *)(v1 + 40), a1, 4LL);
  return sub_10001B1B4(a1, v3);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_10001AF68(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10001AF84(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }

  else
  {
    *(_BYTE *)(result + 4) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_1000106F8(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s17online_auth_agent10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_100010640(v3, v4);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v3;
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_100010640(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_1000106F8(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + 8);
  sub_1000106F8(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 0xD) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_10001B170(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

unint64_t sub_10001B1B4(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

uint64_t sub_10001B250(char *a1, char *a2)
{
  return sub_10001B25C(*a1, *a2);
}

uint64_t sub_10001B25C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 1702521203LL;
  }
  else {
    uint64_t v3 = 7107189LL;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000LL;
  }
  else {
    unint64_t v4 = 0xE400000000000000LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 1702521203LL;
  }
  else {
    uint64_t v5 = 7107189LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xE400000000000000LL;
  }
  else {
    unint64_t v6 = 0xE300000000000000LL;
  }
  if (v3 == v5 && v4 == v6)
  {
    char v7 = 1;
    unint64_t v6 = v4;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0LL);
  }

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_10001B2F0()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v5, 0LL);
  if (v1) {
    uint64_t v2 = 1702521203LL;
  }
  else {
    uint64_t v2 = 7107189LL;
  }
  if (v1) {
    unint64_t v3 = 0xE400000000000000LL;
  }
  else {
    unint64_t v3 = 0xE300000000000000LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10001B360(uint64_t a1)
{
  if (*v1) {
    uint64_t v2 = 1702521203LL;
  }
  else {
    uint64_t v2 = 7107189LL;
  }
  if (*v1) {
    unint64_t v3 = 0xE400000000000000LL;
  }
  else {
    unint64_t v3 = 0xE300000000000000LL;
  }
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10001B3AC(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2) {
    uint64_t v3 = 1702521203LL;
  }
  else {
    uint64_t v3 = 7107189LL;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000LL;
  }
  else {
    unint64_t v4 = 0xE300000000000000LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10001B418@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046620, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_10001B474(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7107189LL;
  if (*v1) {
    uint64_t v2 = 1702521203LL;
  }
  unint64_t v3 = 0xE300000000000000LL;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000LL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10001B4A4()
{
  if (*v0) {
    return 1702521203LL;
  }
  else {
    return 7107189LL;
  }
}

uint64_t sub_10001B4D0@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100046620, v3);
  uint64_t result = swift_bridgeObjectRelease(object);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_10001B530(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10001B53C(uint64_t a1)
{
  unint64_t v2 = sub_10001C820();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B564(uint64_t a1)
{
  unint64_t v2 = sub_10001C820();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001B58C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  sub_10001B5E0(a1, a2);
  return v5;
}

uint64_t sub_10001B5E0(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v53 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v51 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v7 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v8 = [v7 defaultManager];
  URL.path.getter();
  uint64_t v10 = v9;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  LOBYTE(v10) = [v8 fileExistsAtPath:v11];

  unint64_t v50 = a2;
  if ((v10 & 1) == 0)
  {
    *(void *)&__int128 v55 = sub_10001667C(a2 >> 3);
    *((void *)&v55 + 1) = v28;
    sub_10001C57C((uint64_t)&v55);
    uint64_t v26 = v2;
    __int128 v29 = v55;
    id v30 = [v7 defaultManager];
    URL.path.getter();
    uint64_t v32 = v31;
    NSString v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    [v30 createFileAtPath:v33 contents:isa attributes:0];

    sub_1000106F8(v29, *((unint64_t *)&v29 + 1));
    uint64_t v35 = v52;
    uint64_t v25 = v53;
    goto LABEL_15;
  }

  id v12 = [v7 defaultManager];
  URL.path.getter();
  uint64_t v14 = v13;
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  *(void *)&__int128 v55 = 0LL;
  id v16 = [v12 attributesOfItemAtPath:v15 error:&v55];

  uint64_t v17 = (void *)v55;
  if (!v16)
  {
    id v36 = (id)v55;
    _convertNSErrorToError(_:)(v17);

    swift_willThrow(v37);
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(a1, v5);
    uint64_t v35 = v52;
LABEL_21:
    uint64_t v47 = type metadata accessor for BloomFilterDiskStorage(0LL);
    swift_deallocPartialClassInstance( v35,  v47,  *(unsigned int *)(*(void *)v35 + 48LL),  *(unsigned __int16 *)(*(void *)v35 + 52LL));
    return v35;
  }

  type metadata accessor for FileAttributeKey();
  uint64_t v19 = v18;
  uint64_t v20 = sub_1000165E4( &qword_10004DDD0,  (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey,  (uint64_t)&unk_100037AC8);
  uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v16, v19, (char *)&type metadata for Any + 8, v20);
  id v22 = v17;

  if (*(void *)(v21 + 16))
  {
    uint64_t v23 = NSFileSize;
    unint64_t v24 = sub_100016210((uint64_t)v23);
    uint64_t v25 = v53;
    uint64_t v26 = v2;
    if ((v27 & 1) != 0)
    {
      sub_1000162D0(*(void *)(v21 + 56) + 32 * v24, (uint64_t)&v55);
    }

    else
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
    }
  }

  else
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v25 = v53;
    uint64_t v26 = v2;
  }

  uint64_t v35 = v52;
  swift_bridgeObjectRelease(v21);
  if (!*((void *)&v56 + 1))
  {
    sub_100016290((uint64_t)&v55);
LABEL_19:
    if (!v50) {
      goto LABEL_15;
    }
LABEL_20:
    unint64_t v44 = sub_100016BC8();
    uint64_t v45 = swift_allocError(&type metadata for BloomFilterError, v44, 0LL, 0LL);
    *(void *)uint64_t v46 = 0LL;
    *(void *)(v46 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(_BYTE *)(v46 + 16) = 2;
    swift_willThrow(v45);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a1, v5);
    goto LABEL_21;
  }

  if (v54 >> 61) {
    __break(1u);
  }
  if (v50 != 8 * v54) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v38 = v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v39(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url, a1, v5);
  sub_10001A1F0();
  uint64_t v40 = (uint64_t)v51;
  v39((uint64_t)v51, a1, v5);
  id v41 = sub_10001BA80(v40);
  if (v26)
  {
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v42(a1, v5);
    v42(v38, v5);
    goto LABEL_21;
  }

  id v43 = v41;
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(a1, v5);
  *(void *)(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v43;
  *(void *)(v35 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = v50;
  return v35;
}

id sub_10001BA80(uint64_t a1)
{
  uint64_t v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v5 = v4;
  id v14 = 0LL;
  id v6 = [(id)swift_getObjCClassFromMetadata(v2) fileHandleForUpdatingURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL);
    id v10 = v7;
    v9(a1, v8);
  }

  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(a1, v12);
  }

  return v6;
}

uint64_t sub_10001BB94(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  sub_10001BBE0(a1);
  return v3;
}

uint64_t sub_10001BBE0(void *a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v32 = (char *)v31 - v7;
  uint64_t v8 = sub_100012990(&qword_10004E0E8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v12 = a1[4];
  NSString v33 = a1;
  sub_100012A78(a1, v13);
  unint64_t v14 = sub_10001C820();
  NSString v15 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for BloomFilterDiskStorage.CodingKeys,  &type metadata for BloomFilterDiskStorage.CodingKeys,  v14,  v13,  v12);
  if (v15)
  {
    uint64_t v23 = v34;
    uint64_t v19 = v33;
    uint64_t v20 = type metadata accessor for BloomFilterDiskStorage(0LL);
    swift_deallocPartialClassInstance( v23,  v20,  *(unsigned int *)(*(void *)v23 + 48LL),  *(unsigned __int16 *)(*(void *)v23 + 52LL));
    id v30 = v19;
  }

  else
  {
    uint64_t v35 = v6;
    uint64_t v16 = v9;
    char v37 = 0;
    uint64_t v17 = sub_1000165E4( &qword_10004E0F8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v18 = v32;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v2, &v37, v8, v2, v17);
    uint64_t v22 = v2;
    uint64_t v23 = v34;
    uint64_t v24 = v34 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
    uint64_t v25 = v18;
    uint64_t v26 = v22;
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v34 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url,  v25,  v22);
    char v36 = 1;
    uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)(&v36, v8);
    v31[0] = v26;
    v31[1] = v24;
    uint64_t v32 = (char *)v8;
    *(void *)(v23 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) = v27;
    sub_10001A1F0();
    uint64_t v28 = (uint64_t)v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v35, v24, v26);
    id v29 = sub_10001BA80(v28);
    (*(void (**)(char *, char *))(v16 + 8))(v11, v32);
    *(void *)(v23 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh) = v29;
    id v30 = v33;
  }

  sub_100012A9C(v30);
  return v23;
}

uint64_t sub_10001BE98(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012990(&qword_10004E100);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100012A78(a1, v9);
  unint64_t v11 = sub_10001C820();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for BloomFilterDiskStorage.CodingKeys,  &type metadata for BloomFilterDiskStorage.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = v3 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  char v19 = 0;
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v14 = sub_1000165E4( &qword_10004E108,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v12, &v19, v5, v13, v14);
  if (!v2)
  {
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size);
    char v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v18, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001BFF0(unint64_t a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    unint64_t v15 = sub_100016BC8();
    uint64_t v13 = swift_allocError(&type metadata for BloomFilterError, v15, 0LL, 0LL);
    *(void *)uint64_t v16 = a1;
    *(void *)(v16 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(_BYTE *)(v16 + 16) = 1;
LABEL_8:
    swift_willThrow(v13);
    return v10 & 1;
  }

  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  id v23 = 0LL;
  unsigned int v5 = [v4 seekToOffset:a1 >> 3 error:&v23];
  id v6 = v23;
  if (!v5)
  {
    id v17 = v23;
    _convertNSErrorToError(_:)(v6);

    goto LABEL_8;
  }

  id v7 = v23;
  uint64_t v8 = NSFileHandle.read(upToCount:)(1LL);
  if (!v2)
  {
    unint64_t v11 = v9;
    if (v9 >> 60 != 15)
    {
      uint64_t v19 = v8;
      char v20 = ~(_BYTE)a1 & 7;
      sub_100015290(v8, v9);
      unint64_t v22 = v21;
      sub_100010BA4(v19, v11);
      uint64_t v10 = (v22 >> v20) & 1;
      return v10 & 1;
    }

    unint64_t v12 = sub_100016BC8();
    uint64_t v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0LL, 0LL);
    *(_OWORD *)uint64_t v14 = xmmword_100038130;
    *(_BYTE *)(v14 + 16) = 0;
    goto LABEL_8;
  }

  return v10 & 1;
}

void sub_10001C184(unint64_t a1)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size) <= a1)
  {
    unint64_t v15 = sub_100016BC8();
    uint64_t v13 = swift_allocError(&type metadata for BloomFilterError, v15, 0LL, 0LL);
    *(void *)uint64_t v16 = a1;
    *(void *)(v16 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(_BYTE *)(v16 + 16) = 1;
    goto LABEL_8;
  }

  unint64_t v4 = a1 >> 3;
  unsigned int v5 = *(void **)(v1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_fh);
  __srCC_SHA256_CTX c = 0LL;
  unsigned int v6 = [v5 seekToOffset:a1 >> 3 error:&__src];
  id v7 = __src;
  if (!v6)
  {
    id v17 = __src;
    _convertNSErrorToError(_:)(v7);

    goto LABEL_8;
  }

  id v8 = __src;
  uint64_t v9 = NSFileHandle.read(upToCount:)(1LL);
  if (v2) {
    return;
  }
  unint64_t v11 = v10;
  if (v10 >> 60 == 15)
  {
    unint64_t v12 = sub_100016BC8();
    uint64_t v13 = swift_allocError(&type metadata for BloomFilterError, v12, 0LL, 0LL);
    *(_OWORD *)uint64_t v14 = xmmword_100038130;
    *(_BYTE *)(v14 + 16) = 0;
LABEL_8:
    swift_willThrow(v13);
    return;
  }

  uint64_t v18 = v9;
  sub_100015290(v9, v10);
  id v29 = 0LL;
  __srCC_SHA256_CTX c = (id)(v19 | (1LL << (~(_BYTE)a1 & 7)));
  unsigned __int8 v20 = [v5 seekToOffset:v4 error:&v29];
  id v21 = v29;
  if ((v20 & 1) != 0)
  {
    id v22 = v29;
    uint64_t v23 = sub_10001187C(&__src, (_BYTE *)&__src + 1);
    unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFLL;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000106F8(v23, v25);
    [v5 writeData:isa];
    sub_100010BA4(v18, v11);
  }

  else
  {
    id v27 = v29;
    _convertNSErrorToError(_:)(v21);

    swift_willThrow(v28);
    sub_100010BA4(v18, v11);
  }

id sub_10001C3BC()
{
  id v0 = [(id)objc_opt_self(NSFileManager) defaultManager];
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url);
  uint64_t v2 = v1;
  URL._bridgeToObjectiveC()(v3);
  unsigned int v5 = v4;
  id v10 = 0LL;
  unsigned int v6 = [v0 copyItemAtURL:v2 toURL:v4 error:&v10];

  id v7 = v10;
  if (v6) {
    return v10;
  }
  id v9 = v10;
  _convertNSErrorToError(_:)(v7);

  return (id)swift_willThrow();
}

uint64_t sub_10001C4C8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_url;
  uint64_t v2 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10001C528@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001C554()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120LL))();
}

void sub_10001C57C(uint64_t a1)
{
  __asm { BR              X13 }

void *sub_10001C5D8( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  unsigned __int8 v32 = BYTE4(v24);
  unsigned __int8 v33 = BYTE5(v24);
  unsigned __int8 v34 = BYTE6(v24);
  uint64_t result = memset(&v30, v27, BYTE6(v24));
  unint64_t v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  void *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_10001C764(int *a1, int a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v6 = __DataStorage._bytes.getter();
  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }

  uint64_t v7 = v6;
  uint64_t v8 = __DataStorage._offset.getter();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  int64_t v10 = v5 - v4;
  uint64_t v11 = __DataStorage._length.getter();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }
  memset((void *)(v7 + v9), a2, v12);
}

uint64_t type metadata accessor for BloomFilterDiskStorage(uint64_t a1)
{
  uint64_t result = qword_1000501A0;
  if (!qword_1000501A0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BloomFilterDiskStorage);
  }
  return result;
}

unint64_t sub_10001C820()
{
  unint64_t result = qword_10004E0F0;
  if (!qword_10004E0F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000381EC, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E0F0);
  }

  return result;
}

unint64_t sub_10001C868()
{
  unint64_t result = qword_10004E110;
  if (!qword_10004E110)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003814C, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E110);
  }

  return result;
}

unint64_t sub_10001C8B0()
{
  unint64_t result = qword_10004E118;
  if (!qword_10004E118)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038264, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E118);
  }

  return result;
}

unint64_t sub_10001C8F8()
{
  unint64_t result = qword_10004E120;
  if (!qword_10004E120)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003823C, &type metadata for BloomFilterDiskStorage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E120);
  }

  return result;
}

uint64_t sub_10001C93C()
{
  return type metadata accessor for BloomFilterDiskStorage(0LL);
}

uint64_t sub_10001C944(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    void v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for BloomFilterDiskStorage.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10001CA18 + 4 * byte_100038145[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001CA4C + 4 * byte_100038140[v4]))();
}

uint64_t sub_10001CA4C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001CA54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001CA5CLL);
  }
  return result;
}

uint64_t sub_10001CA68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10001CA70LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10001CA74(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001CA7C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterDiskStorage.CodingKeys()
{
  return &type metadata for BloomFilterDiskStorage.CodingKeys;
}

uint64_t sub_10001CA98(uint64_t a1)
{
  uint64_t result = swift_allocObject(v1, 32LL, 7LL);
  *(_BYTE *)(result + 16) = 1;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t sub_10001CAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject(v2, 32LL, 7LL);
  sub_10001CB24(a1, a2);
  return v5;
}

void sub_10001CB24(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_10001CB70()
{
  if (!BYTE6(v2))
  {
    char v5 = 1;
    goto LABEL_13;
  }

  if (((uint64_t (*)(void, uint64_t, unint64_t))Data.subscript.getter)(0LL, v3, v2) != 1)
  {
    char v5 = 0;
    goto LABEL_13;
  }

  if (v1)
  {
    if (v1 == 1)
    {
      LODWORD(v4) = HIDWORD(v3) - v3;
      if (!__OFSUB__(HIDWORD(v3), (_DWORD)v3))
      {
        uint64_t v4 = (int)v4;
        goto LABEL_11;
      }

      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x10001CD74LL);
    }

    uint64_t v7 = *(void *)(v3 + 16);
    uint64_t v6 = *(void *)(v3 + 24);
    BOOL v8 = __OFSUB__(v6, v7);
    uint64_t v4 = v6 - v7;
    if (v8) {
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v4 = BYTE6(v2);
  }

LABEL_11:
  char v5 = 1;
  if (v4 == 9)
  {
    *(_BYTE *)(v0 + 16) = 1;
    uint64_t v9 = sub_100017974(1LL, 8LL, v3, v2);
    sub_10001CE14(v9, v10);
    __asm { BR              X10 }
  }

    v15[(v9 >> 6) + 8] |= 1LL << v9;
    uint64_t v19 = 8 * v9;
    *(void *)(v15[6] + v19) = a2;
    *(void *)(v15[7] + v19) = a1;
    unsigned __int8 v20 = v15[2];
    id v21 = __OFADD__(v20, 1LL);
    id v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      uint64_t v23 = a2;
      return;
    }

    goto LABEL_14;
  }

  sub_100028C0C(v12, a3 & 1);
  id v17 = sub_100028BDC((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    uint64_t v9 = v17;
    uint64_t v15 = (void *)*v4;
    if ((v13 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_13:
  unint64_t v12 = sub_10001CDB0();
  uint64_t v13 = swift_allocError(&type metadata for LaunchWarningMarkError, v12, 0LL, 0LL);
  *uint64_t v14 = v5;
  swift_willThrow(v13);
  sub_1000106F8(v3, v2);
  uint64_t v15 = type metadata accessor for LaunchWarningMark();
  swift_deallocPartialClassInstance(v0, v15, 32LL, 7LL);
  return v0;
}

    uint64_t result = sub_1000236AC(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    BOOL v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  BOOL v8 = _StringObject.sharedUTF8.getter(a5, a6);
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

unint64_t sub_10001CDB0()
{
  unint64_t result = qword_10004E200;
  if (!qword_10004E200)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038394, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_10004E200);
  }

  return result;
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent17LaunchWarningMark);
}

void sub_10001CE14(uint64_t a1, uint64_t a2)
{
  v3[3] = &type metadata for Data;
  v3[4] = &protocol witness table for Data;
  v3[0] = a1;
  v3[1] = a2;
  unint64_t v2 = (char *)&loc_10001CE78 + dword_10001D0AC[sub_100012A78(v3, (uint64_t)&type metadata for Data)[1] >> 62];
  __asm { BR              X10 }

uint64_t sub_10001CE88()
{
  uint64_t v6 = v2;
  __int16 v7 = v3;
  char v8 = BYTE2(v3);
  char v9 = BYTE3(v3);
  char v10 = BYTE4(v3);
  char v11 = BYTE5(v3);
  sub_100010640(v1, v0);
  sub_100018158(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_1000106F8(v1, v0);
  uint64_t v4 = v12;
  sub_100012A9C(&v13);
  return v4;
}

uint64_t sub_10001D0BC(uint64_t a1, uint64_t a2)
{
  v8[3] = &type metadata for UnsafeRawBufferPointer;
  v8[4] = &protocol witness table for UnsafeRawBufferPointer;
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = sub_100012A78(v8, (uint64_t)&type metadata for UnsafeRawBufferPointer);
  uint64_t v3 = (_BYTE *)*v2;
  if (*v2 && (uint64_t v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_10001187C(v3, v4);
    }

    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_1000184B4((uint64_t)v3, (uint64_t)v4);
    }

    else
    {
      uint64_t v6 = sub_10001852C((uint64_t)v3, (uint64_t)v4);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  sub_100012A9C(v8);
  return v6;
}

uint64_t sub_10001D174()
{
  __int128 v6 = xmmword_100038310;
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v1 = sub_10001D0BC((uint64_t)&v5, (uint64_t)&v6);
  unint64_t v3 = v2;
  Data.append(_:)();
  sub_1000106F8(v1, v3);
  return v6;
}

uint64_t sub_10001D214()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 112LL))();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    sub_100015434(0xD000000000000015LL, 0x800000010003AEE0LL, result, v3);
    return sub_1000106F8(v4, v5);
  }

  return result;
}

uint64_t sub_10001D29C()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

unint64_t sub_10001D2B0()
{
  unint64_t result = qword_10004E208;
  if (!qword_10004E208)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003832C, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_10004E208);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningMarkError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10001D340 + 4 * byte_100038325[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001D374 + 4 * byte_100038320[v4]))();
}

uint64_t sub_10001D374(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D37C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001D384LL);
  }
  return result;
}

uint64_t sub_10001D390(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10001D398LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10001D39C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D3A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

BOOL sub_10001D3C0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_10001D3D0( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = swift_allocObject(v8, 80LL, 7LL);
  sub_10001D46C(a1, a2, a3, a4, a5, a6, a7, a8);
  return v17;
}

void *sub_10001D46C( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = v9;
  char v11 = v8;
  v11[2] = a7;
  v11[3] = a8;
  v11[5] = a1;
  v11[4] = *(void *)(a1 + OBJC_IVAR____TtC17online_auth_agent22BloomFilterDiskStorage_size);
  char v11[8] = a2;
  v11[9] = a3;
  type metadata accessor for BloomFilterAlgorithm();
  swift_retain(a1);
  sub_100010640(a2, a3);
  uint64_t v18 = sub_100016D14(a4, a5);
  if (!v9)
  {
    v11[6] = v18;
    unsigned __int8 v20 = (uint64_t (*)(void, unint64_t))v18[4];
    uint64_t v19 = v18[5];
    swift_retain(v19);
    uint64_t v21 = v20(0LL, 0xC000000000000000LL);
    swift_release(v19);
    uint64_t v22 = *(void *)(v21 + 16);
    swift_bridgeObjectRelease(v21);
    if (a6 >= 1 && v22 >= a6)
    {
      sub_1000106F8(a2, a3);
      swift_release(a1);
      v11[7] = a6;
      return v11;
    }

    unint64_t v23 = sub_100016BC8();
    uint64_t v24 = swift_allocError(&type metadata for BloomFilterError, v23, 0LL, 0LL);
    *(_OWORD *)uint64_t v25 = xmmword_100038430;
    *(_BYTE *)(v25 + 16) = 2;
    swift_willThrow(v24);
  }

  sub_1000106F8(a2, a3);
  swift_release(a1);
  swift_bridgeObjectRelease(v11[3]);
  swift_release(v11[5]);
  if (!v10) {
    swift_release(v11[6]);
  }
  sub_1000106F8(v11[8], v11[9]);
  uint64_t v26 = type metadata accessor for BloomFilter();
  swift_deallocPartialClassInstance(v11, v26, 80LL, 7LL);
  return v11;
}

uint64_t type metadata accessor for BloomFilter()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent11BloomFilter);
}

void sub_10001D63C(char *a1)
{
}

void sub_10001D648(char a1)
{
  __asm { BR              X10 }

uint64_t sub_10001D688(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10001D710 + 4 * byte_100038452[a2]))(0x656761726F7473LL);
}

uint64_t sub_10001D710(uint64_t a1)
{
  if (a1 == 0x656761726F7473LL && v1 == 0xE700000000000000LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x656761726F7473LL, 0xE700000000000000LL, 0LL);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE700000000000000LL);
  return v2 & 1;
}

void sub_10001D7E8()
{
}

void sub_10001D7F0(char a1)
{
  __asm { BR              X10 }

Swift::Int sub_10001D838()
{
  return Hasher._finalize()();
}

void sub_10001D8CC()
{
  __asm { BR              X10 }

uint64_t sub_10001D900(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xE700000000000000LL);
}

void sub_10001D980(uint64_t a1)
{
}

void sub_10001D988(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_10001D9CC()
{
  return Hasher._finalize()();
}

unint64_t sub_10001DA60@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10001E62C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001DA8C()
{
  return ((uint64_t (*)(void))((char *)sub_10001DAB4 + 4 * byte_10003846A[*v0]))();
}

void sub_10001DAB4(void *a1@<X8>)
{
  *a1 = 0x656761726F7473LL;
  a1[1] = 0xE700000000000000LL;
}

void sub_10001DAD0(void *a1@<X8>)
{
  *a1 = 0x687469726F676C61LL;
  a1[1] = 0xE90000000000006DLL;
}

void sub_10001DAF0(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_10001DB14(void *a1@<X8>)
{
  *a1 = 1953259891LL;
  a1[1] = v1;
}

void sub_10001DB24(void *a1@<X8>)
{
  *a1 = 25705LL;
  a1[1] = 0xE200000000000000LL;
}

uint64_t sub_10001DB34()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10001DB5C + 4 * byte_100038470[*v0]))( 1702521203LL,  0xE400000000000000LL);
}

uint64_t sub_10001DB5C()
{
  return 0x656761726F7473LL;
}

uint64_t sub_10001DB74()
{
  return 0x687469726F676C61LL;
}

uint64_t sub_10001DB90()
{
  return 0x4572655073746962LL;
}

uint64_t sub_10001DBB0()
{
  return 1953259891LL;
}

uint64_t sub_10001DBBC()
{
  return 25705LL;
}

unint64_t sub_10001DBC8@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10001E62C(a1);
  *a2 = result;
  return result;
}

void sub_10001DBEC(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10001DBF8(uint64_t a1)
{
  unint64_t v2 = sub_10001E674();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001DC20(uint64_t a1)
{
  unint64_t v2 = sub_10001E674();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001DC48(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 80LL, 7LL);
  sub_10001DC94(a1);
  return v3;
}

uint64_t sub_10001DC94(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012990(&qword_10004E2D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100012A78(a1, v9);
  unint64_t v11 = sub_10001E674();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for BloomFilter.CodingKeys,  &type metadata for BloomFilter.CodingKeys,  v11,  v9,  v10);
  if (v2)
  {
    uint64_t v13 = type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance(v1, v13, 80LL, 7LL);
  }

  else
  {
    LOBYTE(v20) = 0;
    *(void *)(v1 + 32) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    LOBYTE(v20) = 3;
    *(void *)(v1 + 56) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    char v21 = 4;
    unint64_t v12 = sub_10001E6B8();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v21, v5, &type metadata for Data, v12);
    *(_OWORD *)(v1 + 64) = v20;
    LOBYTE(v20) = 5;
    *(void *)(v1 + 16) = KeyedDecodingContainer.decode(_:forKey:)(&v20, v5);
    *(void *)(v1 + 24) = v15;
    uint64_t v16 = type metadata accessor for BloomFilterAlgorithm();
    char v21 = 2;
    uint64_t v17 = sub_1000165E4( &qword_10004E2E8,  (uint64_t (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm,  (uint64_t)&unk_100037CDC);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v16, &v21, v5, v16, v17);
    *(void *)(v3 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v20;
    uint64_t v18 = type metadata accessor for BloomFilterDiskStorage(0LL);
    char v21 = 1;
    uint64_t v19 = sub_1000165E4(&qword_10004E2F0, type metadata accessor for BloomFilterDiskStorage, (uint64_t)&unk_10003828C);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v18, &v21, v5, v18, v19);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)(v3 + 40) = v20;
  }

  sub_100012A9C(a1);
  return v3;
}

uint64_t sub_10001DF88(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012990(&qword_10004E2F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100012A78(a1, v9);
  unint64_t v11 = sub_10001E674();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for BloomFilter.CodingKeys,  &type metadata for BloomFilter.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + 32);
  LOBYTE(v24) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v24, v5);
  if (!v2)
  {
    uint64_t v13 = *(void *)(v3 + 56);
    LOBYTE(v24) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v24, v5);
    __int128 v24 = *(_OWORD *)(v3 + 64);
    char v23 = 4;
    unint64_t v14 = sub_10001E6FC();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, &type metadata for Data, v14);
    uint64_t v15 = *(void *)(v3 + 16);
    uint64_t v16 = *(void *)(v3 + 24);
    LOBYTE(v24) = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16);
    *(void *)&__int128 v24 = *(void *)(v3 + 48);
    char v23 = 2;
    uint64_t v17 = type metadata accessor for BloomFilterAlgorithm();
    uint64_t v18 = sub_1000165E4( &qword_10004E308,  (uint64_t (*)(uint64_t))type metadata accessor for BloomFilterAlgorithm,  (uint64_t)&unk_100037D04);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, v17, v18);
    *(void *)&__int128 v24 = *(void *)(v3 + 40);
    char v23 = 1;
    uint64_t v19 = type metadata accessor for BloomFilterDiskStorage(0LL);
    uint64_t v20 = sub_1000165E4(&qword_10004E310, type metadata accessor for BloomFilterDiskStorage, (uint64_t)&unk_1000382B4);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v5, v19, v20);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001E1C4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 64);
  unint64_t v5 = *(void *)(v2 + 72);
  sub_100010640(v6, v5);
  sub_10001CE14(v6, v5);
  uint64_t v9 = v7;
  Data.append(_:)(a1, a2);
  return v9;
}

char *sub_10001E228()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = (*(uint64_t (**)(void))(*v0 + 152LL))();
  unint64_t v4 = v3;
  uint64_t v5 = v0[6];
  uint64_t v7 = *(uint64_t (**)(uint64_t, unint64_t))(v5 + 32);
  uint64_t v6 = *(void *)(v5 + 40);
  swift_retain(v6);
  uint64_t v8 = v7(v2, v4);
  swift_release(v6);
  int64_t v9 = sub_10001E308(*(void *)(v1 + 56), v8);
  unint64_t v11 = v10;
  uint64_t v13 = v12;
  unint64_t v15 = v14;
  swift_retain(v1);
  uint64_t v16 = sub_10001E740(v11, v13, v15, v1);
  swift_release(v1);
  sub_1000106F8(v2, v4);
  swift_unknownObjectRelease(v9);
  return v16;
}

int64_t sub_10001E308(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0LL;
    }
    if (v2 >= v3) {
      return a2;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_10001E34C()
{
  uint64_t result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = *(uint64_t (**)(void))(*v0[5] + 128LL);
      uint64_t v7 = v4 - 1;
      do
      {
        int v8 = v6(*(void *)(v3 + 8 * v5 + 32));
        BOOL v10 = v7 != v5++;
      }

      while ((v8 & v10 & 1) != 0);
      char v11 = v8 ^ 1;
    }

    else
    {
      char v11 = 0;
    }

    swift_bridgeObjectRelease(v3);
    return v11 & 1;
  }

  return result;
}

uint64_t sub_10001E400()
{
  uint64_t result = ((uint64_t (*)(void))(*v0)[20])();
  if (!v1)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = *(void (**)(void))(*v0[5] + 136LL);
      do
        v6(*(void *)(v3 + 8 * v5++ + 32));
      while (v4 != v5);
    }

    return swift_bridgeObjectRelease(v3);
  }

  return result;
}

uint64_t sub_10001E488()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t sub_10001E4C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 136))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001E4F0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144LL))();
}

char *sub_10001E518(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001E534(a1, a2, a3, *v3);
  _BYTE *v3 = result;
  return result;
}

char *sub_10001E534(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100012990(&qword_10004DE60);
    char v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    char v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 8 * v8);
  }

  swift_release(a4);
  return v11;
}

unint64_t sub_10001E62C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000468C0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 6) {
    return 6LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_10001E674()
{
  unint64_t result = qword_10004E2D8;
  if (!qword_10004E2D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000385D4, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E2D8);
  }

  return result;
}

unint64_t sub_10001E6B8()
{
  unint64_t result = qword_10004E2E0;
  if (!qword_10004E2E0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E2E0);
  }

  return result;
}

unint64_t sub_10001E6FC()
{
  unint64_t result = qword_10004E300;
  if (!qword_10004E300)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10004E300);
  }

  return result;
}

char *sub_10001E740(char *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_15;
  }
  char v5 = result;
  unint64_t result = (char *)&_swiftEmptyArrayStorage;
  if (v4)
  {
    unint64_t v15 = a3 >> 1;
    unint64_t result = sub_10001E518(0LL, v4 & ~(v4 >> 63), 0);
    if (v4 < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }

    unint64_t v7 = *(void *)(a4 + 32);
    if (!v7)
    {
LABEL_17:
      __break(1u);
      return result;
    }

    uint64_t v8 = 0LL;
    unint64_t result = (char *)&_swiftEmptyArrayStorage;
    uint64_t v10 = v15;
    uint64_t v9 = a2;
    while (1)
    {
      uint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1LL)) {
        break;
      }
      if (v9 + v8 >= v10 || v8 >= v4) {
        goto LABEL_14;
      }
      unint64_t v12 = *(void *)&v5[8 * a2 + 8 * v8];
      uint64_t v17 = result;
      unint64_t v14 = *((void *)result + 2);
      unint64_t v13 = *((void *)result + 3);
      if (v14 >= v13 >> 1)
      {
        sub_10001E518((char *)(v13 > 1), v14 + 1, 1);
        uint64_t v10 = v15;
        uint64_t v9 = a2;
        unint64_t result = v17;
      }

      *((void *)result + 2) = v14 + 1;
      *(void *)&result[8 * v14 + 32] = v12 % v7;
      ++v8;
      if (v11 == v4) {
        return result;
      }
    }

    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  return result;
}

unint64_t sub_10001E87C()
{
  unint64_t result = qword_10004E318;
  if (!qword_10004E318)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000384CC, &type metadata for BloomFilterResult);
    atomic_store(result, (unint64_t *)&qword_10004E318);
  }

  return result;
}

unint64_t sub_10001E8C4()
{
  unint64_t result = qword_10004E320;
  if (!qword_10004E320)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038534, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E320);
  }

  return result;
}

unint64_t sub_10001E90C()
{
  unint64_t result = qword_10004E328;
  if (!qword_10004E328)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003864C, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E328);
  }

  return result;
}

unint64_t sub_10001E954()
{
  unint64_t result = qword_10004E330;
  if (!qword_10004E330)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038624, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004E330);
  }

  return result;
}

uint64_t sub_10001E99C(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for BloomFilterError(uint64_t a1)
{
  return sub_10001E9C0(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10001E9C0(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t _s17online_auth_agent16BloomFilterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_10001E99C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for BloomFilterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_10001E99C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10001E9C0(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for BloomFilterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BloomFilterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10001E9C0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_10001EB54(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_10001EB6C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    LOBYTE(a2) = 2;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterError()
{
  return &type metadata for BloomFilterError;
}

uint64_t storeEnumTagSinglePayload for BloomFilterResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10001EBE0 + 4 * byte_10003847B[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001EC14 + 4 * byte_100038476[v4]))();
}

uint64_t sub_10001EC14(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EC1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001EC24LL);
  }
  return result;
}

uint64_t sub_10001EC30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10001EC38LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_10001EC3C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EC44(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterResult()
{
  return &type metadata for BloomFilterResult;
}

uint64_t getEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for BloomFilter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_10001ED3C + 4 * byte_100038485[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10001ED70 + 4 * byte_100038480[v4]))();
}

uint64_t sub_10001ED70(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001ED78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001ED80LL);
  }
  return result;
}

uint64_t sub_10001ED8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10001ED94LL);
  }
  *(_BYTE *)__n128 result = a2 + 5;
  return result;
}

uint64_t sub_10001ED98(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001EDA0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10001EDAC(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

uint64_t sub_10001EDC4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *((void *)sub_1000185AC() + 1);
  swift_bridgeObjectRetain(v4);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  id v6 = [a1 readSetting:v5];

  if (v6)
  {
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    unint64_t v8 = v7;
  }

  else
  {
    unint64_t v8 = 0x800000010003AFA0LL;
    uint64_t v28 = 0xD00000000000001ELL;
  }

  swift_bridgeObjectRetain(v8);
  uint64_t v9 = *((void *)sub_1000185B8() + 1);
  swift_bridgeObjectRetain(v9);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  id v11 = [a1 readSetting:v10];

  if (v11)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v14 = v13;

    if (v12 == 0x786F62646E6173LL && v14 == 0xE700000000000000LL)
    {
      swift_bridgeObjectRelease(0xE700000000000000LL);
      uint64_t v15 = 2LL;
    }

    else
    {
      char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, 0x786F62646E6173LL, 0xE700000000000000LL, 0LL);
      swift_bridgeObjectRelease(v14);
      if ((v16 & 1) != 0) {
        uint64_t v15 = 2LL;
      }
      else {
        uint64_t v15 = 1LL;
      }
    }
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  uint64_t v17 = sub_1000185C4();
  if (v18) {
    unint64_t v19 = v17;
  }
  else {
    unint64_t v19 = 0xD00000000000001ELL;
  }
  if (v18) {
    unint64_t v20 = v18;
  }
  else {
    unint64_t v20 = 0x800000010003AFC0LL;
  }
  swift_bridgeObjectRetain(v20);
  uint64_t v21 = sub_100018860();
  uint64_t v23 = v22;
  swift_bridgeObjectRetain(v22);
  uint64_t v24 = sub_100018670();
  uint64_t v26 = v25;

  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a2 = v28;
  a2[1] = v8;
  a2[2] = v15;
  a2[3] = v19;
  a2[4] = v20;
  a2[5] = v21;
  a2[6] = v23;
  a2[7] = v24;
  a2[8] = v26;
  return result;
}

void sub_10001EFF4(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  id v6 = objc_allocWithZone(&OBJC_CLASS___CKContainerID);
  swift_bridgeObjectRetain(v4);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  id v8 = [v6 initWithContainerIdentifier:v7 environment:v5];

  id v9 = [objc_allocWithZone(CKContainer) initWithContainerID:v8];
  id v10 = [v9 publicCloudDatabase];
  uint64_t v11 = a1[4];
  id v12 = objc_allocWithZone(&OBJC_CLASS___CKRecordZone);
  id v24 = v10;
  swift_bridgeObjectRetain(v11);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  id v14 = [v12 initWithZoneName:v13];

  sub_10001F244((uint64_t)(a1 + 5), (uint64_t)v25);
  sub_10001F244((uint64_t)v25, (uint64_t)&v26);
  id v15 = v27;
  if (!v27)
  {
    id v23 = v14;
    uint64_t v19 = a1[8];
    if (v19) {
      goto LABEL_3;
    }
LABEL_5:

    sub_10001F28C(a1);
    id v22 = 0LL;
    goto LABEL_6;
  }

  id v16 = objc_allocWithZone(&OBJC_CLASS___CKRecordZone);
  id v17 = v14;
  sub_10001F2E0((uint64_t)v25);
  NSString v18 = String._bridgeToObjectiveC()();
  sub_10001F308((uint64_t)v25);
  id v15 = [v16 initWithZoneName:v18];

  uint64_t v19 = a1[8];
  if (!v19) {
    goto LABEL_5;
  }
LABEL_3:
  swift_bridgeObjectRetain(v19);
  sub_10001F28C(a1);
  id v20 = objc_allocWithZone(&OBJC_CLASS___CKRecordZone);
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  id v22 = [v20 initWithZoneName:v21];

LABEL_6:
  *a2 = v9;
  a2[1] = v24;
  a2[2] = v14;
  a2[3] = v22;
  a2[4] = v15;
}

uint64_t sub_10001F244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_10001F28C(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[8];
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10001F2E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001F308(uint64_t a1)
{
  return a1;
}

uint64_t destroy for CloudKitConfiguration(void *a1)
{
  return swift_bridgeObjectRelease(a1[8]);
}

uint64_t initializeWithCopy for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v4;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  *(void *)(a1 + 56) = v6;
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

void *assignWithCopy for CloudKitConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v6 = a2[4];
  uint64_t v7 = a1[4];
  a1[4] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[5] = a2[5];
  uint64_t v8 = a2[6];
  uint64_t v9 = a1[6];
  a1[6] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[7] = a2[7];
  uint64_t v10 = a2[8];
  uint64_t v11 = a1[8];
  a1[8] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CloudKitConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a1 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a1 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_1000106F8(v3, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 72) = 1;
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
      *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CloudKitConfiguration()
{
  return &type metadata for CloudKitConfiguration;
}

void destroy for CloudKitRuntime(id *a1)
{
}

void *initializeWithCopy for CloudKitRuntime(void *a1, uint64_t a2)
{
  __int128 v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  uint64_t v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  NSString v13 = *(void **)(a1 + 24);
  id v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  id v16 = *(void **)(a1 + 32);
  id v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  return a1;
}

__n128 initializeWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CloudKitRuntime(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CloudKitRuntime(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CloudKitRuntime(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CloudKitRuntime()
{
  return &type metadata for CloudKitRuntime;
}

void type metadata accessor for CKContainerEnvironment()
{
  if (!qword_10004E438)
  {
    ForeignTypeMetaunint64_t data = swift_getForeignTypeMetadata(0LL, &unk_100046D48);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004E438);
    }
  }

Swift::Int sub_10001F85C()
{
  return Hasher._finalize()();
}

void sub_10001F89C()
{
}

Swift::Int sub_10001F8C0(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10001F8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_100012990(&qword_10004E770);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  id v8 = (char *)&v44 - v7;
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v50 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  id v14 = (char *)&v44 - v13;
  id v15 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 160LL);
  unint64_t v16 = v15(0LL);
  uint64_t v47 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128LL))(1LL);
  unint64_t v48 = v17;
  uint64_t v18 = v15(2LL);
  uint64_t v19 = v15(3LL);
  (*(void (**)(uint64_t))(*(void *)a1 + 144LL))(4LL);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192LL))(5LL);
  if ((v16 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }

  if (HIDWORD(v16))
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v22 = result;
  uint64_t v23 = v21;
  char v24 = sub_100018980(v18);
  if (v24 == 2)
  {
    uint64_t v25 = swift_bridgeObjectRelease(v23);
    uint64_t v26 = static os_log_type_t.error.getter(v25);
    int v27 = (void *)*sub_100019AF4();
    uint64_t v28 = sub_100012990(&qword_10004DBB0);
    uint64_t v29 = swift_allocObject(v28, 72LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_1000377D0;
    *(void *)(v29 + 56) = &type metadata for Int64;
    *(void *)(v29 + 64) = &protocol witness table for Int64;
    *(void *)(v29 + 32) = v18;
    id v30 = v27;
    os_log(_:dso:log:_:_:)(v26, &_mh_execute_header, v30, "Invalid reason in database: %lld", v44);

    swift_bridgeObjectRelease(v29);
    uint64_t v51 = v18;
    uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
    uint64_t v33 = v32;
    unint64_t v34 = sub_100011BB8();
    uint64_t v35 = swift_allocError(&type metadata for DBError, v34, 0LL, 0LL);
    *(_OWORD *)uint64_t v36 = xmmword_1000387A0;
    *(void *)(v36 + 16) = v31;
    *(void *)(v36 + 24) = v33;
    *(_BYTE *)(v36 + 32) = 1;
    swift_willThrow(v35);
    sub_1000106F8(v47, v48);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v14, v50);
  }

  else
  {
    int v45 = v24 & 1;
    uint64_t v37 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56LL))(v8, 1LL, 1LL, v37);
    if (v23)
    {
      URL.init(string:)(v22, v23);
      swift_bridgeObjectRelease(v23);
      sub_100021890((uint64_t)v8, &qword_10004E770);
      sub_100018D84((uint64_t)v6, (uint64_t)v8);
    }

    uint64_t v39 = v49;
    uint64_t v38 = v50;
    (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v12, v14, v50);
    uint64_t v43 = nullsub_1(v19, v40, v41, v42);
    sub_100020048((uint64_t)v8, (uint64_t)v6, &qword_10004E770);
    sub_100018CE8(v16, v47, v48, (uint64_t)v12, v45, v43, (uint64_t)v6, v46);
    sub_100021890((uint64_t)v8, &qword_10004E770);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v14, v38);
  }

uint64_t _s18LaunchWarningEntryVMa(uint64_t a1)
{
  uint64_t result = qword_100050A30;
  if (!qword_100050A30) {
    return swift_getSingletonMetadata(a1, &_s18LaunchWarningEntryVMn);
  }
  return result;
}

uint64_t sub_10001FCB0(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E770);
  __chkstk_darwin(v4);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)a1 + 152LL);
  v7(*a2, 1LL);
  (*(void (**)(void, void, uint64_t))(*(void *)a1 + 120LL))( *((void *)a2 + 1),  *((void *)a2 + 2),  2LL);
  id v8 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v9 = sub_100018998(*((_BYTE *)a2 + v8[7]));
  v7(v9, 3LL);
  v7(*(void *)((char *)a2 + v8[8]), 4LL);
  v7(0LL, 5LL);
  (*(void (**)(char *, uint64_t))(*(void *)a1 + 136LL))((char *)a2 + v8[6], 6LL);
  sub_100020048((uint64_t)a2 + v8[9], (uint64_t)v6, &qword_10004E770);
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1LL, v10) == 1)
  {
    sub_100021890((uint64_t)v6, &qword_10004E770);
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = URL.absoluteString.getter();
    uint64_t v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 184LL))(v12, v13, 7LL);
  return swift_bridgeObjectRelease(v13);
}

uint64_t sub_10001FE48@<X0>(int a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = sub_100012990(&qword_10004E440);
  uint64_t v8 = swift_allocBox(v7);
  uint64_t v10 = v9;
  uint64_t v11 = _s18LaunchWarningEntryVMa(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  v18[0] = 0LL;
  v18[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(87LL);
  v12._countAndFlagsBits = 0x205443454C4553LL;
  v12._object = (void *)0xE700000000000000LL;
  String.append(_:)(v12);
  v13._object = (void *)0x800000010003AFE0LL;
  v13._countAndFlagsBits = 0xD000000000000035LL;
  String.append(_:)(v13);
  v14._countAndFlagsBits = 0xD00000000000004ELL;
  v14._object = (void *)0x800000010003B0E0LL;
  String.append(_:)(v14);
  uint64_t v15 = swift_allocObject(&unk_100046D68, 40LL, 7LL);
  *(_DWORD *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  *(void *)(v15 + 32) = a3;
  sub_100010640(a2, a3);
  swift_retain(v8);
  sub_100011374(0LL, 0xE000000000000000LL, (uint64_t)sub_10002002C, v15, (uint64_t)sub_100020030, v8);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  swift_release(v15);
  if (v18[4]) {
    return swift_release_n(v8, 2LL);
  }
  swift_release(v8);
  swift_beginAccess(v10, v18, 0LL, 0LL);
  sub_100020048(v10, a4, &qword_10004E440);
  return swift_release(v8);
}

uint64_t sub_100020030(uint64_t a1)
{
  return sub_100020274(a1, v1);
}

uint64_t sub_100020048(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100012990(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002008C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100012990(&qword_10004E440);
  uint64_t v6 = swift_allocBox(v5);
  uint64_t v8 = v7;
  uint64_t v9 = _s18LaunchWarningEntryVMa(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  v14[0] = 0LL;
  v14[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(62LL);
  v10._countAndFlagsBits = 0x205443454C4553LL;
  v10._object = (void *)0xE700000000000000LL;
  String.append(_:)(v10);
  v11._object = (void *)0x800000010003AFE0LL;
  v11._countAndFlagsBits = 0xD000000000000035LL;
  String.append(_:)(v11);
  v12._object = (void *)0x800000010003B130LL;
  v12._countAndFlagsBits = 0xD000000000000035LL;
  String.append(_:)(v12);
  swift_retain(a1);
  swift_retain(v6);
  sub_100011374(0LL, 0xE000000000000000LL, (uint64_t)sub_100020238, a1, (uint64_t)sub_100020030, v6);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  swift_release(a1);
  if (v2) {
    return swift_release_n(v6, 2LL);
  }
  swift_release(v6);
  swift_beginAccess(v8, v14, 0LL, 0LL);
  sub_100020048(v8, a2, &qword_10004E440);
  return swift_release(v6);
}

uint64_t sub_100020238(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 24);
  if ((result & 0x8000000000000000LL) == 0) {
    return (*(uint64_t (**)(void))(*(void *)a1 + 152LL))();
  }
  __break(1u);
  return result;
}

uint64_t sub_100020274(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100012990(&qword_10004E440);
  __chkstk_darwin(v5);
  uint64_t v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v8 = type metadata accessor for LaunchWarningDetails(0LL);
  __chkstk_darwin(v8);
  Swift::String v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v11 = swift_projectBox(a2);
  uint64_t result = sub_10001F8FC(a1, (uint64_t)v10);
  if (!v2)
  {
    char v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(6LL);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160LL))(7LL);
    if (result < 0)
    {
      __break(1u);
    }

    else
    {
      uint64_t v14 = result;
      uint64_t v15 = _s18LaunchWarningEntryVMa(0LL);
      sub_100020C5C((uint64_t)v10, (uint64_t)v7 + *(int *)(v15 + 20), type metadata accessor for LaunchWarningDetails);
      uint64_t *v7 = v14;
      *((_BYTE *)v7 + *(int *)(v15 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = v13 & 1;
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v7, 0LL, 1LL, v15);
      swift_beginAccess(v11, v17, 1LL, 0LL);
      return sub_100021A20((uint64_t)v7, v11);
    }
  }

  return result;
}

uint64_t sub_1000203EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_100012990(&qword_10004E440);
  __chkstk_darwin(v3);
  uint64_t v35 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = swift_allocObject(&unk_100046D90, 24LL, 7LL);
  *(void *)(v9 + 16) = 0LL;
  uint64_t v10 = swift_allocBox(v3);
  uint64_t v12 = v11;
  uint64_t v13 = _s18LaunchWarningEntryVMa(0LL);
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v12;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v33 = v13;
  v14(v12, 1LL, 1LL);
  sub_100021A68(a1, (uint64_t)v8, type metadata accessor for LaunchWarningDetails);
  uint64_t v15 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = (v15 + 24) & ~v15;
  unint64_t v17 = (v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v19 = swift_allocObject(&unk_100046DB8, v18 + 8, v15 | 7);
  id v20 = v39;
  *(void *)(v19 + 16) = v39;
  sub_100020C5C((uint64_t)v8, v19 + v16, type metadata accessor for LaunchWarningDetails);
  *(void *)(v19 + v17) = v10;
  *(void *)(v19 + v1_Block_object_dispose((const void *)(v1 - 112), 8) = v9;
  aBlock[4] = sub_100020BBC;
  uint64_t v38 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100020C0C;
  aBlock[3] = &unk_100046DD0;
  uint64_t v21 = _Block_copy(aBlock);
  uint64_t v22 = v38;
  id v23 = v20;
  swift_retain(v10);
  swift_retain(v9);
  swift_release(v22);
  [v23 transaction:v21];
  _Block_release(v21);
  swift_beginAccess(v9 + 16, aBlock, 0LL, 0LL);
  if (*(void *)(v9 + 16))
  {
    uint64_t v24 = swift_errorRetain(*(void *)(v9 + 16));
    swift_willThrow(v24);
LABEL_5:
    swift_release(v9);
    return swift_release(v10);
  }

  uint64_t v25 = v34;
  uint64_t v26 = v32;
  swift_beginAccess(v32, v36, 0LL, 0LL);
  uint64_t v27 = v26;
  uint64_t v28 = v35;
  sub_100020048(v27, v35, &qword_10004E440);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v28, 1LL, v33);
  if ((_DWORD)result != 1)
  {
    sub_100020C5C(v28, v25, _s18LaunchWarningEntryVMa);
    goto LABEL_5;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000206B0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000206D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v48 + 64);
  __chkstk_darwin(v7);
  uint64_t v51 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100012990(&qword_10004E440);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v50 = (uint64_t)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v44 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = _s18LaunchWarningEntryVMa(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v47 = (uint64_t)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v44 - v21;
  uint64_t v49 = swift_projectBox(a3);
  sub_10001FE48(*(_DWORD *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), (uint64_t)v16);
  uint64_t v27 = (uint64_t)v51;
  int v45 = v14;
  uint64_t v46 = a4;
  uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  unsigned int v29 = v28(v16, 1LL, v17);
  if (v29 == 1)
  {
    uint64_t v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v28;
    sub_100021890((uint64_t)v16, &qword_10004E440);
    uint64_t v30 = a2;
    uint64_t v31 = v27;
    sub_100021A68(a2, v27, type metadata accessor for LaunchWarningDetails);
    uint64_t v32 = *(unsigned __int8 *)(v48 + 80);
    uint64_t v33 = (v32 + 16) & ~v32;
    uint64_t v34 = swift_allocObject(&unk_100046EC0, v33 + v8, v32 | 7);
    sub_100020C5C(v31, v34 + v33, type metadata accessor for LaunchWarningDetails);
    sub_100011374(0xD000000000000085LL, 0x800000010003B050LL, (uint64_t)sub_10002199C, v34, 0LL, 0LL);
    swift_release(v34);
    uint64_t v35 = (uint64_t)v45;
    sub_10001FE48(*(_DWORD *)v30, *(void *)(v30 + 8), *(void *)(v30 + 16), (uint64_t)v45);
    if (v44(v35, 1LL, v17) == 1)
    {
      sub_100021890(v35, &qword_10004E440);
      unint64_t v36 = sub_1000219DC();
      uint64_t v37 = swift_allocError(&type metadata for LaunchWarningDBError, v36, 0LL, 0LL);
      swift_willThrow(v37);
      id v23 = (uint64_t *)(v46 + 16);
      swift_beginAccess(v46 + 16, v52, 1LL, 0LL);
      uint64_t v24 = *v23;
      uint64_t *v23 = v37;
      swift_errorRelease(v24);
      return 0LL;
    }

    else
    {
      uint64_t v40 = v47;
      sub_100020C5C(v35, v47, _s18LaunchWarningEntryVMa);
      uint64_t v41 = v40;
      uint64_t v42 = v50;
      sub_100020C5C(v41, v50, _s18LaunchWarningEntryVMa);
      uint64_t v25 = 1LL;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v42, 0LL, 1LL, v17);
      uint64_t v43 = v49;
      swift_beginAccess(v49, v52, 1LL, 0LL);
      sub_100021A20(v42, v43);
    }
  }

  else
  {
    sub_100020C5C((uint64_t)v16, (uint64_t)v22, _s18LaunchWarningEntryVMa);
    uint64_t v38 = v50;
    sub_100020C5C((uint64_t)v22, v50, _s18LaunchWarningEntryVMa);
    uint64_t v25 = 1LL;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v38, 0LL, 1LL, v17);
    uint64_t v39 = v49;
    swift_beginAccess(v49, v52, 1LL, 0LL);
    sub_100021A20(v38, v39);
  }

  return v25;
}

uint64_t sub_100020ABC()
{
  uint64_t v1 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);

  sub_1000106F8(*(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 24);
  uint64_t v7 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  uint64_t v8 = v0 + v4 + *(int *)(v1 + 36);
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + v11));
  swift_release(*(void *)(v0 + v12));
  return swift_deallocObject(v0, v12 + 8, v3 | 7);
}

uint64_t sub_100020BBC()
{
  uint64_t v1 = *(void *)(type metadata accessor for LaunchWarningDetails(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_1000206D4( *(void *)(v0 + 16),  v0 + v2,  *(void *)(v0 + v3),  *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_100020C0C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  LOBYTE(sub_1000106F8(v3, v1) = v1(v3);
  swift_release(v2);
  return v1 & 1;
}

uint64_t sub_100020C44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100020C54(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100020C5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020CA0(char a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject(&unk_100046E08, 32LL, 7LL);
  *(_BYTE *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_100011374(0xD00000000000003ALL, 0x800000010003B170LL, (uint64_t)sub_100020D40, v4, 0LL, 0LL);
  return swift_release(v4);
}

uint64_t sub_100020D30()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100020D40(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)a1 + 168LL))(*(unsigned __int8 *)(v2 + 16), 1LL);
  if ((v4 & 0x8000000000000000LL) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 152LL))(v4, 2LL);
  }
  __break(1u);
  return result;
}

uint64_t sub_100020D94()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100020DB8(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  (*(void (**)(void, uint64_t))(*(void *)a1 + 152LL))(*(unsigned int *)(v1 + 16), 1LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 120LL))(v3, v4, 2LL);
}

unint64_t sub_100020E14()
{
  unint64_t result = qword_10004E448;
  if (!qword_10004E448)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000387BC, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_10004E448);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningDBError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100020E98 + 4 * byte_1000387B0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100020EB8 + 4 * byte_1000387B5[v4]))();
  }
}

_BYTE *sub_100020E98(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_100020EB8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100020EC0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100020EC8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100020ED0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100020ED8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

void *sub_100020EF4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v23 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v23);
  }

  else
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7) = *(_DWORD *)((char *)a2 + v7);
    uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
    unint64_t v11 = *(void *)((char *)a2 + v7 + 16);
    sub_100010640(v10, v11);
    *((void *)v8 + 1) = v10;
    *((void *)v8 + 2) = v11;
    unint64_t v12 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
    uint64_t v13 = v12[6];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v16 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(void *)&v8[v12[8]] = *(void *)&v9[v12[8]];
    uint64_t v17 = v12[9];
    uint64_t v18 = &v8[v17];
    uint64_t v19 = &v9[v17];
    uint64_t v20 = type metadata accessor for URL(0LL);
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1LL, v20))
    {
      uint64_t v22 = sub_100012990(&qword_10004E770);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0LL, 1LL, v20);
    }

    *((_BYTE *)v4 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }

  return v4;
}

uint64_t sub_100021070(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_1000106F8(*(void *)(v2 + 8), *(void *)(v2 + 16));
  uint64_t v3 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v4 = v2 + *(int *)(v3 + 24);
  uint64_t v5 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = v2 + *(int *)(v3 + 36);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  return result;
}

void *sub_10002111C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v3, *(void *)(v8 - 112), v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_100010640(v9, v10);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  unint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = type metadata accessor for URL(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1LL, v19))
  {
    uint64_t v21 = sub_100012990(&qword_10004E770);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0LL, 1LL, v19);
  }

  *((_BYTE *)a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_10002126C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v3, *(void *)(v8 - 112), v6) = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  unint64_t v10 = *(void *)((char *)a2 + v6 + 16);
  sub_100010640(v9, v10);
  uint64_t v11 = *((void *)v7 + 1);
  unint64_t v12 = *((void *)v7 + 2);
  *((void *)v7 + 1) = v9;
  *((void *)v7 + 2) = v10;
  sub_1000106F8(v11, v12);
  uint64_t v13 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v14 = v13[6];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(void *)&v7[v13[8]] = *(void *)&v8[v13[8]];
  uint64_t v18 = v13[9];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = type metadata accessor for URL(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD((*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7) = v23(v19, 1LL, v21);
  int v24 = v23(v20, 1LL, v21);
  if (!(_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }

  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_100012990(&qword_10004E770);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0LL, 1LL, v21);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_100021410(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  uint64_t v9 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  unint64_t v12 = &v8[v10];
  uint64_t v13 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  uint64_t v14 = v9[9];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17))
  {
    uint64_t v19 = sub_100012990(&qword_10004E770);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  }

  *((_BYTE *)a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_100021554(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)((char *)a2 + v6);
  uint64_t v9 = *(void *)((char *)a1 + v6 + 8);
  unint64_t v10 = *((void *)v7 + 2);
  *(_OWORD *)(v7 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(v8 + 8);
  sub_1000106F8(v9, v10);
  uint64_t v11 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40LL))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(void *)&v7[v11[8]] = *(void *)&v8[v11[8]];
  uint64_t v16 = v11[9];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = type metadata accessor for URL(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD((*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7) = v21(v17, 1LL, v19);
  int v22 = v21(v18, 1LL, v19);
  if (!(_DWORD)v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }

  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_100012990(&qword_10004E770);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0LL, 1LL, v19);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000216EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000216F8);
}

uint64_t sub_1000216F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  }
  unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2) {
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100021788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100021794);
}

uint64_t sub_100021794(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))( a1 + *(int *)(a4 + 20),  a2,  a2,  result);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + swift_bridgeObjectRelease(*(void *)(v0 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_100021810(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t result = type metadata accessor for LaunchWarningDetails(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    void v4[2] = &unk_1000388A8;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100021890(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100012990(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_1000218D0()
{
  uint64_t v1 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  sub_1000106F8(*(void *)(v0 + v4 + 8), *(void *)(v0 + v4 + 16));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 24);
  uint64_t v7 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  uint64_t v8 = v0 + v4 + *(int *)(v1 + 36);
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1000219A0(uint64_t a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for LaunchWarningDetails(0LL) - 8) + 80LL);
  return sub_10001FCB0(a1, (unsigned int *)(v1 + ((v3 + 16) & ~v3)));
}

unint64_t sub_1000219DC()
{
  unint64_t result = qword_10004E4D8;
  if (!qword_10004E4D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038824, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_10004E4D8);
  }

  return result;
}

uint64_t sub_100021A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021A68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

id sub_100021AAC()
{
  uint64_t v24 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v1 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for LaunchWarningDB();
  uint64_t v10 = v0;
  char v11 = sub_100014904();
  id v12 = sub_10001490C(v11 & 1);
  *(void *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_db] = v12;
  id v13 = v12;
  sub_10001EDC4(v13, v29);
  uint64_t v14 = type metadata accessor for CloudKitOperations();
  uint64_t v15 = sub_1000265D8(v29);
  type metadata accessor for LaunchWarningController(0LL);
  uint64_t v27 = v14;
  uint64_t v28 = &off_100047448;
  *(void *)&__int128 v26 = v15;
  id v16 = v13;
  swift_retain(v15);
  *(void *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController] = sub_10002B034(v16, &v26);
  sub_100021D54();
  static DispatchQoS.unspecified.getter();
  *(void *)&__int128 v26 = &_swiftEmptyArrayStorage;
  unint64_t v17 = sub_100021D90();
  uint64_t v18 = sub_100012990(&qword_10004E500);
  unint64_t v19 = sub_100021DD8();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v18, v19, v4, v17);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v24);
  *(void *)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_syncQueue] = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000016LL,  0x800000010003B1B0LL,  v9,  v6,  v3,  0LL);
  uint64_t v20 = type metadata accessor for MetricReporter();
  uint64_t v21 = sub_100013910();
  uint64_t v27 = v20;
  uint64_t v28 = &off_1000479A8;
  swift_release(v15);
  *(void *)&__int128 v26 = v21;
  sub_100021E24(&v26, (uint64_t)&v10[OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics]);

  int v22 = (objc_class *)type metadata accessor for LaunchWarningOperations();
  v25.receiver = v10;
  v25.super_class = v22;
  return objc_msgSendSuper2(&v25, "init");
}

unint64_t sub_100021D54()
{
  unint64_t result = qword_10004E4F0;
  if (!qword_10004E4F0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue_serial);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004E4F0);
  }

  return result;
}

unint64_t sub_100021D90()
{
  unint64_t result = qword_10004E4F8;
  if (!qword_10004E4F8)
  {
    uint64_t v1 = type metadata accessor for OS_dispatch_queue_serial.Attributes(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10004E4F8);
  }

  return result;
}

unint64_t sub_100021DD8()
{
  unint64_t result = qword_10004E508;
  if (!qword_10004E508)
  {
    uint64_t v1 = sub_100012A34(&qword_10004E500);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10004E508);
  }

  return result;
}

uint64_t sub_100021E24(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for LaunchWarningOperations()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent23LaunchWarningOperations);
}

uint64_t sub_100021E7C(char a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E440);
  __chkstk_darwin(v4);
  uint64_t v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v46 = _s18LaunchWarningEntryVMa(0LL);
  uint64_t v6 = *(void *)(v46 - 8);
  uint64_t v7 = __chkstk_darwin(v46);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = static os_log_type_t.default.getter(v7);
  char v11 = sub_100019C48();
  id v12 = (void *)*v11;
  uint64_t v13 = sub_100012990(&qword_10004DBB0);
  uint64_t v14 = swift_allocObject(v13, 112LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_1000377F0;
  *(void *)(v14 + 56) = &type metadata for UInt64;
  *(void *)(v14 + 64) = &protocol witness table for UInt64;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 96) = &type metadata for Bool;
  *(void *)(v14 + 104) = &protocol witness table for Bool;
  *(_BYTE *)(v14 + 72) = a1;
  id v15 = v12;
  os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v15, "Setting user override: %lld to %d", v43, v44);

  uint64_t v16 = a2;
  uint64_t v17 = v48;
  swift_bridgeObjectRelease(v14);
  uint64_t v18 = v49;
  uint64_t result = sub_100020CA0(a1, v16);
  if (!v18)
  {
    uint64_t v49 = v6;
    uint64_t v44 = v13;
    int v45 = (void **)v11;
    uint64_t v20 = v46;
    uint64_t v21 = (uint64_t)v47;
    if ((a1 & 1) != 0)
    {
      type metadata accessor for LaunchWarningMark();
      uint64_t v43 = v16;
      uint64_t v22 = sub_10001CA98(v16);
      sub_10002008C(v22, v21);
      uint64_t v23 = v20;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v21, 1LL, v20) == 1)
      {
        uint64_t v24 = sub_100021890(v21, &qword_10004E440);
        uint64_t v25 = static os_log_type_t.error.getter(v24);
        __int128 v26 = *v45;
        uint64_t v27 = swift_allocObject(v44, 72LL, 7LL);
        *(_OWORD *)(v27 + 16) = xmmword_1000377D0;
        *(void *)(v27 + 56) = &type metadata for UInt64;
        *(void *)(v27 + 64) = &protocol witness table for UInt64;
        *(void *)(v27 + 32) = v43;
        id v28 = v26;
        os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v28, "Unable to look up launch warning info for ID: %lld", v43);

        swift_bridgeObjectRelease(v27);
        return swift_release(v22);
      }

      else
      {
        uint64_t v29 = v22;
        uint64_t v30 = (uint64_t)v9;
        sub_100020C5C(v21, (uint64_t)v9, _s18LaunchWarningEntryVMa);
        uint64_t v31 = &v9[*(int *)(v23 + 20)];
        uint64_t v32 = *(unsigned int *)v31;
        uint64_t v33 = *((void *)v31 + 1);
        unint64_t v34 = *((void *)v31 + 2);
        sub_100010640(v33, v34);
        uint64_t v36 = nullsub_1(v32, v33, v34, v35);
        uint64_t v38 = v37;
        unint64_t v40 = v39;
        uint64_t v41 = *(void *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        uint64_t v42 = *(void *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_100012A78((void *)(v17 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v41);
        (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v42 + 32))( v36,  v38,  v40,  v41,  v42);
        sub_1000106F8(v38, v40);
        swift_release(v29);
        return sub_100014850(v30, _s18LaunchWarningEntryVMa);
      }
    }
  }

  return result;
}

uint64_t sub_10002229C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = _s18LaunchWarningEntryVMa(0LL);
  __chkstk_darwin(v6);
  uint64_t v73 = (uint64_t *)((char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v8 = sub_100012990(&qword_10004E520);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v78 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v75 = *(void *)(v78 - 8);
  uint64_t v11 = __chkstk_darwin(v78);
  uint64_t v71 = (uint64_t)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v72 = (unsigned int *)((char *)&v70 - v14);
  uint64_t v15 = static os_log_type_t.default.getter(v13);
  uint64_t v16 = (id *)sub_100019C48();
  id v17 = *v16;
  uint64_t v76 = sub_100012990(&qword_10004DBB0);
  uint64_t v18 = swift_allocObject(v76, 112LL, 7LL);
  __int128 v74 = xmmword_1000377F0;
  *(_OWORD *)(v18 + 16) = xmmword_1000377F0;
  *(void *)(v18 + 56) = &type metadata for UInt32;
  *(void *)(v18 + 64) = &protocol witness table for UInt32;
  unsigned int v80 = a3;
  *(_DWORD *)(v18 + 32) = a3;
  id v19 = v17;
  uint64_t v20 = a1;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  sub_100012758(v21, a2);
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  *(void *)(v18 + 96) = &type metadata for String;
  unint64_t v77 = sub_1000139FC();
  *(void *)(v18 + 104) = v77;
  *(void *)(v18 + 72) = v24;
  *(void *)(v18 + 80) = v26;
  os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v19, "Looking up launch warning for cdhash: %d, %@", 44LL, 2LL, v18);

  uint64_t v27 = swift_bridgeObjectRelease(v18);
  uint64_t v28 = *(void *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController);
  if (v28)
  {
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, void))(*(void *)v28 + 280LL);
    swift_retain(*(void *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController));
    unsigned int v30 = v80;
    uint64_t v31 = v79;
    v29(v20, v22, v80);
    if (v31)
    {
      swift_errorRelease(v31);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v10, 1LL, 1LL, v78);
      uint64_t v81 = 0LL;
    }

    else
    {
      uint64_t v36 = v78;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v10, 1LL, v78) != 1)
      {
        uint64_t v46 = v72;
        uint64_t v47 = sub_100020C5C((uint64_t)v10, (uint64_t)v72, type metadata accessor for LaunchWarningDetails);
        uint64_t v48 = static os_log_type_t.default.getter(v47);
        id v49 = *v16;
        uint64_t v50 = v36;
        uint64_t v51 = swift_allocObject(v76, 72LL, 7LL);
        *(_OWORD *)(v51 + 16) = xmmword_1000377D0;
        uint64_t v52 = v71;
        sub_100021A68((uint64_t)v46, v71, type metadata accessor for LaunchWarningDetails);
        id v53 = v49;
        uint64_t v54 = String.init<A>(describing:)(v52, v50);
        unint64_t v55 = v77;
        *(void *)(v51 + 56) = &type metadata for String;
        *(void *)(v51 + 64) = v55;
        *(void *)(v51 + 32) = v54;
        *(void *)(v51 + 40) = v56;
        os_log(_:dso:log:_:_:)(v48, &_mh_execute_header, v53, "Found launch warning with details: %@", 37LL, 2LL, v51);

        swift_bridgeObjectRelease(v51);
        uint64_t v57 = *v46;
        uint64_t v58 = *((void *)v46 + 1);
        unint64_t v59 = *((void *)v46 + 2);
        sub_100010640(v58, v59);
        uint64_t v61 = nullsub_1(v57, v58, v59, v60);
        uint64_t v63 = v62;
        unint64_t v65 = v64;
        uint64_t v66 = *(void *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
        uint64_t v67 = *(void *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
        sub_100012A78((void *)(v81 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics), v66);
        (*(void (**)(uint64_t, uint64_t, unint64_t, void, uint64_t, uint64_t, uint64_t))(v67 + 24))( v61,  v63,  v65,  0LL,  1LL,  v66,  v67);
        __int128 v68 = v73;
        sub_1000203EC((uint64_t)v46, (uint64_t)v73);
        type metadata accessor for LaunchWarningMark();
        uint64_t v69 = sub_10001CA98(*v68);
        uint64_t v32 = (*(uint64_t (**)(void))(*(void *)v69 + 112LL))();
        swift_release(v69);
        sub_1000106F8(v63, v65);
        swift_release(v28);
        sub_100014850((uint64_t)v68, _s18LaunchWarningEntryVMa);
        sub_100014850((uint64_t)v46, type metadata accessor for LaunchWarningDetails);
        return v32;
      }

      uint64_t v81 = 0LL;
    }

    uint64_t v37 = sub_100021890((uint64_t)v10, &qword_10004E520);
    uint64_t v38 = static os_log_type_t.info.getter(v37);
    id v39 = *v16;
    uint64_t v40 = swift_allocObject(v76, 112LL, 7LL);
    *(_OWORD *)(v40 + 16) = v74;
    *(void *)(v40 + 56) = &type metadata for UInt32;
    *(void *)(v40 + 64) = &protocol witness table for UInt32;
    *(_DWORD *)(v40 + 32) = v30;
    id v41 = v39;
    sub_100012758(v20, v22);
    unint64_t v42 = v77;
    *(void *)(v40 + 96) = &type metadata for String;
    *(void *)(v40 + 104) = v42;
    *(void *)(v40 + 72) = v43;
    *(void *)(v40 + 80) = v44;
    os_log(_:dso:log:_:_:)(v38, &_mh_execute_header, v41, "Found no launch warning for cdhash: %d, %@", 42LL, 2LL, v40);
    swift_release(v28);

    swift_bridgeObjectRelease(v40);
    return 0LL;
  }

  else
  {
    uint64_t v32 = static os_log_type_t.error.getter(v27);
    id v33 = *v16;
    os_log(_:dso:log:_:_:)( v32,  &_mh_execute_header,  v33,  "Launch warning lookup failed due to missing controller.",  55LL,  2LL,  &_swiftEmptyArrayStorage);

    unint64_t v34 = sub_1000228B0();
    uint64_t v35 = swift_allocError(&type metadata for LaunchWarningOperationsError, v34, 0LL, 0LL);
    swift_willThrow(v35);
  }

  return v32;
}

unint64_t sub_1000228B0()
{
  unint64_t result = qword_10004E528;
  if (!qword_10004E528)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038934, &type metadata for LaunchWarningOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E528);
  }

  return result;
}

uint64_t sub_1000229F4()
{
  uint64_t result = sub_100014904();
  if ((result & 1) != 0)
  {
    uint64_t v2 = static os_log_type_t.default.getter(result);
    __int128 v3 = sub_100019C48();
    id v4 = (id)*v3;
    os_log(_:dso:log:_:_:)( v2,  &_mh_execute_header,  v4,  "Performing regular launch warning sync.",  39LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController);
    if (v6)
    {
      __chkstk_darwin(v5);
      v11[2] = v6;
      v11[3] = v0;
      swift_retain(v6);
      OS_dispatch_queue.sync<A>(execute:)(sub_100023228, v11, (char *)&type metadata for () + 8);
      return swift_release(v6);
    }

    else
    {
      uint64_t v7 = static os_log_type_t.error.getter(v5);
      id v8 = (id)*v3;
      os_log(_:dso:log:_:_:)( v7,  &_mh_execute_header,  v8,  "Launch warning sync failed due to missing controller.",  53LL,  2LL,  &_swiftEmptyArrayStorage);

      unint64_t v9 = sub_1000228B0();
      uint64_t v10 = swift_allocError(&type metadata for LaunchWarningOperationsError, v9, 0LL, 0LL);
      return swift_willThrow(v10);
    }
  }

  return result;
}

uint64_t sub_100022B68(uint64_t a1, void *a2)
{
  v105 = a2;
  uint64_t v4 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v92 - v9;
  uint64_t v106 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v106 - 8);
  uint64_t v12 = __chkstk_darwin(v106);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  id v17 = (char *)&v92 - v16;
  uint64_t v18 = static Date.now.getter(v15);
  __int16 v19 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288LL))(v18);
  uint64_t v103 = v21;
  if (v2)
  {
    uint64_t v22 = *(void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
    uint64_t v23 = *(void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
    uint64_t v24 = sub_100012A78( (void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics),  v22);
    static Date.now.getter(v24);
    double v25 = Date.timeIntervalSince(_:)(v17);
    uint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v27 = v14;
    uint64_t v28 = v106;
    v26(v27, v106);
    (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v23 + 16))(v2, v22, v23, v25);
    swift_errorRelease(v2);
    return ((uint64_t (*)(char *, uint64_t))v26)(v17, v28);
  }

  uint64_t v97 = v5;
  uint64_t v101 = v4;
  v102 = v10;
  id v99 = v8;
  uint64_t v100 = a1;
  uint64_t v104 = 0LL;
  __int16 v30 = v19;
  uint64_t v31 = *(void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 24);
  uint64_t v32 = *(void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics + 32);
  v105 = (void *)((char *)v105 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics);
  __int16 v33 = v20;
  unint64_t v34 = sub_100012A78(v105, v31);
  static Date.now.getter(v34);
  int v98 = v17;
  double v35 = Date.timeIntervalSince(_:)(v17);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v37 = v14;
  uint64_t v38 = v106;
  v36(v37, v106);
  uint64_t v39 = v33 & 0x101;
  uint64_t v40 = (uint64_t)v103;
  uint64_t v41 = (*(uint64_t (**)(void, void (*)(char *, uint64_t), uint64_t, uint64_t, uint64_t, double))(v32 + 8))( v30 & 0x101,  v103,  v39,  v31,  v32,  v35);
  if ((v30 & 1) == 0 && v40 < 1) {
    goto LABEL_5;
  }
  uint64_t v43 = static os_log_type_t.default.getter(v41);
  uint64_t v44 = sub_100019C48();
  id v45 = (id)*v44;
  os_log(_:dso:log:_:_:)( v43,  &_mh_execute_header,  v45,  "Launch warning sync triggered an update.",  40LL,  2LL,  &_swiftEmptyArrayStorage);

  uint64_t v46 = v104;
  uint64_t v47 = (*(uint64_t (**)(void))(*(void *)v100 + 296LL))();
  if (v46)
  {
    unint64_t v42 = v98;
    return ((uint64_t (*)(char *, uint64_t))v36)(v42, v38);
  }

  uint64_t v48 = v47;
  uint64_t v104 = 0LL;
  uint64_t v49 = *(void *)(v47 + 16);
  if (!v49)
  {
    uint64_t v89 = swift_bridgeObjectRelease(v47);
    uint64_t v90 = static os_log_type_t.default.getter(v89);
    id v91 = (id)*v44;
    os_log(_:dso:log:_:_:)( v90,  &_mh_execute_header,  v91,  "Launch warning sync found no impacted apps.",  43LL,  2LL,  &_swiftEmptyArrayStorage);

LABEL_5:
    unint64_t v42 = v98;
    return ((uint64_t (*)(char *, uint64_t))v36)(v42, v38);
  }

  os_log_type_t v50 = static os_log_type_t.default.getter(v47);
  id v96 = (void **)v44;
  id v51 = (id)*v44;
  os_log_type_t v52 = v50;
  if (os_log_type_enabled((os_log_t)*v44, v50))
  {
    swift_bridgeObjectRetain(v48);
    uint64_t v54 = (os_log_s *)v51;
    unint64_t v55 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)unint64_t v55 = 134217984;
    uint64_t v108 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v108, &v109, v55 + 4);
    swift_bridgeObjectRelease(v48);
    _os_log_impl((void *)&_mh_execute_header, v54, v52, "Launch warning sync found %ld local warnings.", v55, 0xCu);
    swift_slowDealloc(v55, -1LL, -1LL);
  }

  uint64_t v56 = *(void *)(v48 + 16);
  if (!v56)
  {
    swift_bridgeObjectRelease(v48);
    goto LABEL_5;
  }

  uint64_t v57 = *(unsigned __int8 *)(v97 + 80);
  uint64_t v92 = v48;
  uint64_t v58 = v48 + ((v57 + 32) & ~v57);
  uint64_t v97 = *(void *)(v97 + 72);
  *(void *)&__int128 v53 = 136315138LL;
  __int128 v94 = v53;
  uint64_t v93 = (char *)&type metadata for Any + 8;
  uint64_t v103 = v36;
  uint64_t v59 = (uint64_t)v102;
  while (1)
  {
    sub_100021A68(v58, v59, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    unint64_t v72 = (unsigned int *)(v59 + *(int *)(v101 + 20));
    uint64_t v73 = *(void *)((char *)v72 + *(int *)(type metadata accessor for LaunchWarningDetails(0LL) + 32));
    uint64_t v74 = *(void *)sub_100018A9C();
    uint64_t v107 = v73;
    uint64_t v108 = v74;
    unint64_t v75 = sub_100018E60();
    uint64_t v76 = dispatch thunk of SetAlgebra.isSuperset(of:)(&v108, &type metadata for LaunchWarningFlags, v75);
    if ((v76 & 1) == 0) {
      break;
    }
    char v60 = 0;
LABEL_15:
    uint64_t v61 = *v72;
    uint64_t v62 = *((void *)v72 + 1);
    unint64_t v63 = *((void *)v72 + 2);
    sub_100010640(v62, v63);
    uint64_t v65 = nullsub_1(v61, v62, v63, v64);
    uint64_t v67 = v66;
    unint64_t v69 = v68;
    uint64_t v70 = v105[3];
    uint64_t v71 = v105[4];
    sub_100012A78(v105, v70);
    (*(void (**)(uint64_t, uint64_t, unint64_t, void, void, uint64_t, uint64_t))(v71 + 24))( v65,  v67,  v69,  v60 & 1,  0LL,  v70,  v71);
    sub_1000106F8(v67, v69);
    uint64_t v59 = (uint64_t)v102;
    sub_100014850((uint64_t)v102, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    v58 += v97;
    --v56;
    uint64_t v36 = v103;
    if (!v56)
    {
      swift_bridgeObjectRelease(v92);
      uint64_t v38 = v106;
      goto LABEL_5;
    }
  }

  os_log_type_t v77 = static os_log_type_t.default.getter(v76);
  uint64_t v78 = *v96;
  uint64_t v79 = (uint64_t)v99;
  sub_100021A68(v59, (uint64_t)v99, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  if (os_log_type_enabled((os_log_t)v78, v77))
  {
    os_log_t v95 = v78;
    uint64_t v80 = swift_slowAlloc(12LL, -1LL);
    uint64_t v81 = swift_slowAlloc(32LL, -1LL);
    uint64_t v108 = v81;
    *(_DWORD *)uint64_t v80 = v94;
    unint64_t v82 = (uint64_t *)(v79 + *(int *)(type metadata accessor for AppRecord(0LL) + 20));
    uint64_t v83 = *v82;
    unint64_t v84 = v82[1];
    swift_bridgeObjectRetain(v84);
    *(void *)(v80 + 4) = sub_100023424(v83, v84, &v108);
    swift_bridgeObjectRelease(v84);
    sub_100014850((uint64_t)v99, type metadata accessor for LaunchWarningController.NewLaunchWarning);
    os_log_t v85 = v95;
    _os_log_impl((void *)&_mh_execute_header, v95, v77, "Terminating app: %s", (uint8_t *)v80, 0xCu);
    swift_arrayDestroy(v81, 1LL, v93);
    swift_slowDealloc(v81, -1LL, -1LL);
    uint64_t v86 = v80;
    uint64_t v59 = (uint64_t)v102;
    swift_slowDealloc(v86, -1LL, -1LL);
  }

  else
  {
    sub_100014850(v79, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  }

  uint64_t v87 = v104;
  char v88 = (*(uint64_t (**)(uint64_t))(*(void *)v100 + 304LL))(v59);
  uint64_t v104 = v87;
  if (!v87)
  {
    char v60 = v88;
    goto LABEL_15;
  }

  sub_100014850(v59, type metadata accessor for LaunchWarningController.NewLaunchWarning);
  swift_bridgeObjectRelease(v92);
  return ((uint64_t (*)(char *, uint64_t))v36)(v98, v106);
}

uint64_t sub_100023228()
{
  return sub_100022B68(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_1000232B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningOperations();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_100023344()
{
  unint64_t result = qword_10004E530;
  if (!qword_10004E530)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000388CC, &type metadata for LaunchWarningOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E530);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningOperationsError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1000233C8 + 4 * byte_1000388C0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000233E8 + 4 * byte_1000388C5[v4]))();
  }
}

_BYTE *sub_1000233C8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000233E8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000233F0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000233F8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100023400(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100023408(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningOperationsError()
{
  return &type metadata for LaunchWarningOperationsError;
}

uint64_t sub_100023424(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000234F4(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000162D0((uint64_t)v12, *a3);
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
      sub_1000162D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100012A9C(v12);
  return v7;
}

uint64_t sub_1000234F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

uint64_t sub_1000236AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100023740(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_1000238B4(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000238B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100023740(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1000129D0(v4, 0LL);
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
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_1000238B4(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100012990(&qword_10004DBB8);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
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
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100023A00(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  int64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v8 = swift_allocObject(&unk_100047040, 32LL, 7LL);
  *(void *)(v8 + 16) = 0LL;
  *(void *)(v8 + 24) = 0LL;
  int64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v17 = a1;
  v9(v7, a1, v4);
  uint64_t v10 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  uint64_t v12 = swift_allocObject(&unk_100047068, v11 + v6, v10 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, v7, v4);
  swift_retain(v8);
  sub_100011374(0xD000000000000039LL, 0x800000010003B770LL, (uint64_t)sub_100023EB4, v12, (uint64_t)sub_100023F24, v8);
  swift_release(v12);
  swift_release(v8);
  if (v2) {
    return swift_release(v8);
  }
  swift_beginAccess(v8 + 16, v18, 0LL, 0LL);
  uint64_t v14 = *(void *)(v8 + 16);
  uint64_t v15 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain(v15);
  uint64_t v16 = swift_release(v8);
  __chkstk_darwin(v16);
  *(&v17 - 4) = v17;
  *(&v17 - 3) = v1;
  *(&v17 - 2) = v14;
  *(&v17 - 1) = v15;
  sub_100011660((void (*)(uint64_t))sub_100023F4C);
  return swift_bridgeObjectRelease(v15);
}

uint64_t sub_100023BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for UserTrustedProfileEntry(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = *(int *)(__chkstk_darwin(v9) + 20);
  uint64_t v33 = a1;
  uint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = v13[1];
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  if (!v14) {
    goto LABEL_3;
  }
  uint64_t v31 = v4;
  uint64_t v15 = v13[2];
  unint64_t v16 = v13[3];
  uint64_t v17 = *v13;
  uint64_t v18 = (void *)swift_allocObject(&unk_1000471D0, 48LL, 7LL);
  v18[2] = v17;
  v18[3] = v14;
  v18[4] = v15;
  void v18[5] = v16;
  swift_bridgeObjectRetain(v14);
  sub_100010640(v15, v16);
  sub_100011374(0xD000000000000077LL, 0x800000010003B6F0LL, (uint64_t)sub_1000246D8, (uint64_t)v18, 0LL, 0LL);
  uint64_t v5 = v31;
  uint64_t result = swift_release(v18);
  if (!v31)
  {
LABEL_3:
    sub_10002443C(v33, (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v21 = (v20 + 16) & ~v20;
    uint64_t v22 = swift_allocObject(&unk_100047158, v21 + v11, v20 | 7);
    sub_100024480((uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), v22 + v21);
    sub_100011374(0xD00000000000004CLL, 0x800000010003B880LL, (uint64_t)sub_100024554, v22, 0LL, 0LL);
    uint64_t result = swift_release(v22);
    if (!v5)
    {
      uint64_t v23 = v30;
      if (v30)
      {
        uint64_t v24 = swift_allocObject(&unk_100047090, 24LL, 7LL);
        *(void *)(v24 + 16) = 0LL;
        uint64_t v25 = swift_allocObject(&unk_100047180, 32LL, 7LL);
        uint64_t v26 = v29;
        *(void *)(v25 + 16) = v29;
        *(void *)(v25 + 24) = v23;
        swift_bridgeObjectRetain(v23);
        swift_retain(v24);
        sub_100011374( 0xD000000000000043LL,  0x800000010003B7B0LL,  (uint64_t)sub_100024424,  v25,  (uint64_t)sub_100024428,  v24);
        swift_release(v25);
        swift_release(v24);
        swift_beginAccess(v24 + 16, v32, 0LL, 0LL);
        uint64_t v27 = *(void *)(v24 + 16);
        uint64_t result = swift_release(v24);
        if (!v27)
        {
          uint64_t v28 = swift_allocObject(&unk_1000471A8, 32LL, 7LL);
          *(void *)(v28 + 16) = v26;
          *(void *)(v28 + 24) = v23;
          swift_bridgeObjectRetain(v23);
          sub_100011374(0xD000000000000033LL, 0x800000010003B800LL, (uint64_t)sub_100024424, v28, 0LL, 0LL);
          return swift_release(v28);
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)a1 + 192LL))(0LL);
  uint64_t v6 = v5;
  swift_beginAccess(v3, v9, 1LL, 0LL);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v6;
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100023F24(uint64_t a1)
{
  return sub_100023EB8(a1, v1);
}

uint64_t sub_100023F4C()
{
  return sub_100023BC8(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_100023F68()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100023F78()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100023F9C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v8 = swift_allocObject(&unk_100047040, 32LL, 7LL);
  *(void *)(v8 + 16) = 0LL;
  *(void *)(v8 + 24) = 0LL;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v28 = a1;
  uint64_t v26 = v9;
  v9(v7, a1, v2);
  uint64_t v10 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  uint64_t v12 = v11 + v4;
  uint64_t v25 = v10 | 7;
  uint64_t v13 = swift_allocObject(&unk_1000470B8, v12, v10 | 7);
  uint64_t v24 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v24(v13 + v11, v7, v2);
  swift_retain(v8);
  uint64_t v14 = v29;
  sub_100011374(0xD000000000000039LL, 0x800000010003B770LL, (uint64_t)sub_100023EB4, v13, (uint64_t)sub_100023F24, v8);
  swift_release(v13);
  swift_release(v8);
  if (v14) {
    return swift_release(v8);
  }
  swift_beginAccess(v8 + 16, v31, 0LL, 0LL);
  uint64_t v17 = *(void *)(v8 + 16);
  uint64_t v16 = *(void *)(v8 + 24);
  swift_bridgeObjectRetain(v16);
  swift_release(v8);
  uint64_t v18 = v27;
  v26(v27, v28, v2);
  uint64_t v19 = swift_allocObject(&unk_1000470E0, v12, v25);
  v24(v19 + v11, v18, v2);
  sub_100011374(0xD000000000000031LL, 0x800000010003B840LL, (uint64_t)sub_100023EB4, v19, 0LL, 0LL);
  uint64_t result = swift_release(v19);
  if (v16)
  {
    uint64_t v20 = swift_allocObject(&unk_100047090, 24LL, 7LL);
    *(void *)(v20 + 16) = 0LL;
    uint64_t v21 = swift_allocObject(&unk_100047108, 32LL, 7LL);
    *(void *)(v21 + 16) = v17;
    *(void *)(v21 + 24) = v16;
    swift_bridgeObjectRetain_n(v16, 2LL);
    swift_retain(v20);
    sub_100011374(0xD000000000000043LL, 0x800000010003B7B0LL, (uint64_t)sub_100024424, v21, (uint64_t)sub_100024428, v20);
    swift_release(v21);
    swift_release(v20);
    swift_beginAccess(v20 + 16, v30, 0LL, 0LL);
    uint64_t v22 = *(void *)(v20 + 16);
    swift_bridgeObjectRelease(v16);
    swift_release(v20);
    if (v22)
    {
      return swift_bridgeObjectRelease(v16);
    }

    else
    {
      uint64_t v23 = swift_allocObject(&unk_100047130, 32LL, 7LL);
      *(void *)(v23 + 16) = v17;
      *(void *)(v23 + 24) = v16;
      swift_bridgeObjectRetain(v16);
      sub_100011374(0xD000000000000033LL, 0x800000010003B800LL, (uint64_t)sub_100024424, v23, 0LL, 0LL);
      swift_bridgeObjectRelease(v16);
      return swift_release(v23);
    }
  }

  return result;
}

uint64_t sub_100024364()
{
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000243C4(uint64_t a1)
{
  uint64_t v2 = UUID.uuidString.getter();
  uint64_t v4 = v3;
  (*(void (**)(uint64_t))(*(void *)a1 + 184LL))(v2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_100024428(uint64_t a1)
{
  return sub_10002460C(a1);
}

uint64_t sub_10002443C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserTrustedProfileEntry(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UserTrustedProfileEntry(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000244C4()
{
  uint64_t v1 = type metadata accessor for UserTrustedProfileEntry(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v0 + v4, v6);
  uint64_t v7 = (void *)(v0 + v4 + *(int *)(v1 + 20));
  uint64_t v8 = v7[1];
  if (v8)
  {
    swift_bridgeObjectRelease(v8);
    sub_1000106F8(v7[2], v7[3]);
  }

  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100024554(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UserTrustedProfileEntry(0LL);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL);
  uint64_t v5 = v1 + ((v4 + 16) & ~v4);
  uint64_t v6 = UUID.uuidString.getter();
  uint64_t v8 = v7;
  uint64_t v9 = *(void (**)(uint64_t))(*(void *)a1 + 184LL);
  v9(v6);
  swift_bridgeObjectRelease(v8);
  uint64_t v10 = (uint64_t *)(v5 + *(int *)(v3 + 20));
  uint64_t v11 = v10[1];
  if (v11)
  {
    uint64_t v12 = *v10;
    swift_bridgeObjectRetain(v10[1]);
    uint64_t v13 = v11;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
  }

  ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v12, v11, 2LL);
  return swift_bridgeObjectRelease(v13);
}

uint64_t sub_10002460C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)a1 + 160LL))(0LL);
  uint64_t result = swift_beginAccess(v2 + 16, v5, 1LL, 0LL);
  *(void *)(v2 + 16) = v3;
  return result;
}

uint64_t sub_100024674(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)a1 + 184LL))( *(void *)(v1 + 16),  *(void *)(v1 + 24),  1LL);
}

uint64_t sub_1000246AC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000246DC(uint64_t a1)
{
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  (*(void (**)(void, void, uint64_t))(*(void *)a1 + 184LL))(v1[2], v1[3], 1LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 120LL))(v3, v4, 2LL);
}

uint64_t sub_100024748()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  sub_100014EA8(v0, qword_100051600);
  sub_1000148EC(v0, (uint64_t)qword_100051600);
  return URL.init(fileURLWithPath:)(0xD000000000000027LL, 0x800000010003B930LL);
}

id sub_1000247A8(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  if (qword_100050BC0 != -1) {
    swift_once(&qword_100050BC0, sub_100024748);
  }
  uint64_t v5 = type metadata accessor for URL(0LL);
  sub_1000148EC(v5, (uint64_t)qword_100051600);
  URL._bridgeToObjectiveC()(v6);
  uint64_t v8 = v7;
  v11.receiver = v4;
  v11.super_class = v2;
  id v9 = objc_msgSendSuper2(&v11, "initWithDatabaseURL:asReadOnly:", v7, a1 & 1);

  return v9;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent11UserTrustDB);
}

uint64_t sub_1000249F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 = [v1 dbURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v6);

  uint64_t v7 = URL.path.getter();
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  uint64_t v11 = String.utf8CString.getter(v7, v9);
  swift_bridgeObjectRelease(v9);
  sub_1000066DC((const char *)(v11 + 32));
  swift_release(v11);
  id v12 = [v1 shmURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v12);

  uint64_t v13 = URL.path.getter();
  uint64_t v15 = v14;
  v10(v5, v2);
  uint64_t v16 = String.utf8CString.getter(v13, v15);
  swift_bridgeObjectRelease(v15);
  sub_1000066DC((const char *)(v16 + 32));
  swift_release(v16);
  id v17 = [v1 walURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);

  uint64_t v18 = URL.path.getter();
  uint64_t v20 = v19;
  v10(v5, v2);
  uint64_t v21 = String.utf8CString.getter(v18, v20);
  swift_bridgeObjectRelease(v20);
  sub_1000066DC((const char *)(v21 + 32));
  return swift_release(v21);
}

id sub_100024BFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return objc_msgSendSuper2(&v2, "dealloc");
}

BOOL sub_100024C30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id sub_100024C44(void *a1, void *a2)
{
  id v31 = a1;
  uint64_t v3 = sub_100012990(&qword_10004E590);
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v30 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v30 - v17;
  if (!a2) {
    return v31;
  }
  id v30 = a2;
  id v19 = [v31 creationDate];
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1LL, 1LL, v9);
    goto LABEL_10;
  }

  uint64_t v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v16, v9);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v22(v8, 0LL, 1LL, v9);
  uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v23(v8, 1LL, v9) == 1)
  {
LABEL_10:
    uint64_t v29 = (uint64_t)v8;
LABEL_13:
    sub_100021890(v29, &qword_10004E590);
    return v30;
  }

  v21(v18, v8, v9);
  id v24 = [v31 creationDate];
  if (!v24)
  {
    v22(v6, 1LL, 1LL, v9);
    goto LABEL_12;
  }

  uint64_t v25 = v24;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v21(v6, v16, v9);
  v22(v6, 0LL, 1LL, v9);
  if (v23(v6, 1LL, v9) == 1)
  {
LABEL_12:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    uint64_t v29 = (uint64_t)v6;
    goto LABEL_13;
  }

  v21(v13, v6, v9);
  char v26 = static Date.> infix(_:_:)(v18, v13);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  v27(v13, v9);
  v27(v18, v9);
  if ((v26 & 1) != 0)
  {

    return v31;
  }

  return v30;
}

uint64_t sub_100024F14@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v81 = a7;
  uint64_t v82 = a8;
  int v84 = a3;
  uint64_t v85 = a1;
  unint64_t v86 = a2;
  uint64_t v87 = a9;
  uint64_t v12 = sub_100012990(&qword_10004E770);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v83 = &v79[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v13);
  uint64_t v16 = &v79[-v15];
  uint64_t v17 = sub_100012990(&qword_10004E590);
  __chkstk_darwin(v17);
  id v19 = &v79[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  id v24 = &v79[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v22);
  char v26 = &v79[-v25];
  sub_100020048(a6, (uint64_t)v19, &qword_10004E590);
  uint64_t v27 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v21 + 48))(v19, 1LL, v20);
  if ((_DWORD)v27 == 1)
  {
    static Date.now.getter(v27);
    uint64_t v28 = sub_100021890((uint64_t)v19, &qword_10004E590);
    if (!a4) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v28 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v21 + 32))(v26, v19, v20);
    if (!a4)
    {
LABEL_11:
      uint64_t v50 = static os_log_type_t.error.getter(v28);
      id v51 = (void *)*sub_100019B98();
      uint64_t v52 = sub_100012990(&qword_10004DBB0);
      uint64_t v44 = swift_allocObject(v52, 72LL, 7LL);
      *(_OWORD *)(v44 + 16) = xmmword_1000377D0;
      uint64_t v89 = a4;
      swift_unknownObjectRetain(a4, v53);
      id v45 = v51;
      uint64_t v54 = sub_100012990((uint64_t *)&unk_10004E7A0);
      uint64_t v55 = String.init<A>(describing:)(&v89, v54);
      uint64_t v57 = v56;
      *(void *)(v44 + 56) = &type metadata for String;
      *(void *)(v44 + 64) = sub_1000139FC();
      *(void *)(v44 + 32) = v55;
      *(void *)(v44 + 40) = v57;
      os_log(_:dso:log:_:_:)( v50,  &_mh_execute_header,  v45,  "CloudKit record has invalid flags field: %@",  43LL,  2LL,  v44);
      goto LABEL_12;
    }
  }

  uint64_t v89 = a4;
  swift_unknownObjectRetain(a4, v29);
  uint64_t v30 = sub_100012990(&qword_10004E768);
  uint64_t v28 = swift_dynamicCast(&v88, &v89, v30, &type metadata for Int, 6LL);
  if ((v28 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v34 = nullsub_1(v88, v31, v32, v33);
  if (!a5
    || (uint64_t v36 = v34,
        uint64_t v89 = a5,
        swift_unknownObjectRetain(a5, v35),
        uint64_t v34 = swift_dynamicCast(&v88, &v89, v30, &type metadata for Int, 6LL),
        (v34 & 1) == 0))
  {
    uint64_t v59 = static os_log_type_t.error.getter(v34);
    char v60 = (void *)*sub_100019B98();
    uint64_t v61 = sub_100012990(&qword_10004DBB0);
    uint64_t v62 = swift_allocObject(v61, 72LL, 7LL);
    *(_OWORD *)(v62 + 16) = xmmword_1000377D0;
    uint64_t v89 = a5;
    swift_unknownObjectRetain(a5, v63);
    id v64 = v60;
    uint64_t v65 = sub_100012990((uint64_t *)&unk_10004E7A0);
    uint64_t v66 = String.init<A>(describing:)(&v89, v65);
    uint64_t v68 = v67;
    *(void *)(v62 + 56) = &type metadata for String;
    *(void *)(v62 + 64) = sub_1000139FC();
    *(void *)(v62 + 32) = v66;
    *(void *)(v62 + 40) = v68;
    os_log(_:dso:log:_:_:)( v59,  &_mh_execute_header,  v64,  "CloudKit record has invalid reason field: %@",  44LL,  2LL,  v62);

    uint64_t v58 = v62;
    goto LABEL_14;
  }

  char v37 = sub_100018980(v88);
  if (v37 == 2)
  {
    uint64_t v38 = *(void *)sub_100018A90();
    uint64_t v88 = v36;
    uint64_t v89 = v38;
    unint64_t v39 = sub_100018E60();
    uint64_t v40 = dispatch thunk of SetAlgebra.isSuperset(of:)(&v89, &type metadata for LaunchWarningFlags, v39);
    if ((v40 & 1) != 0)
    {
      uint64_t v41 = static os_log_type_t.default.getter(v40);
      unint64_t v42 = (void *)*sub_100019B98();
      uint64_t v43 = sub_100012990(&qword_10004DBB0);
      uint64_t v44 = swift_allocObject(v43, 112LL, 7LL);
      *(_OWORD *)(v44 + 16) = xmmword_1000377F0;
      *(void *)(v44 + 56) = &type metadata for UInt32;
      *(void *)(v44 + 64) = &protocol witness table for UInt32;
      *(_DWORD *)(v44 + 32) = v84;
      id v45 = v42;
      sub_100012758(v85, v86);
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      *(void *)(v44 + 96) = &type metadata for String;
      *(void *)(v44 + 104) = sub_1000139FC();
      *(void *)(v44 + 72) = v47;
      *(void *)(v44 + 80) = v49;
      os_log(_:dso:log:_:_:)( v41,  &_mh_execute_header,  v45,  "Launch warning has unknown reason and flags indicate to ignore: %d, %@",  70LL,  2LL,  v44);
LABEL_12:

      uint64_t v58 = v44;
LABEL_14:
      swift_bridgeObjectRelease(v58);
      (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v26, v20);
      uint64_t v69 = type metadata accessor for LaunchWarningDetails(0LL);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56LL))( v87,  1LL,  1LL,  v69);
    }

    int v71 = 1;
  }

  else
  {
    int v71 = v37 & 1;
  }

  int v80 = v71;
  uint64_t v72 = type metadata accessor for URL(0LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56LL))(v16, 1LL, 1LL, v72);
  uint64_t v73 = (uint64_t)v83;
  if (v82)
  {
    URL.init(string:)(v81, v82);
    sub_100021890((uint64_t)v16, &qword_10004E770);
    sub_10002A73C(v73, (uint64_t)v16, &qword_10004E770);
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v21 + 16))(v24, v26, v20);
  sub_100020048((uint64_t)v16, v73, &qword_10004E770);
  uint64_t v74 = v73;
  uint64_t v75 = v85;
  uint64_t v76 = v86;
  sub_100010640(v85, v86);
  uint64_t v77 = v87;
  sub_100018CE8(v84, v75, v76, (uint64_t)v24, v80, v36, v74, v87);
  sub_100021890((uint64_t)v16, &qword_10004E770);
  (*(void (**)(_BYTE *, uint64_t))(v21 + 8))(v26, v20);
  uint64_t v78 = type metadata accessor for LaunchWarningDetails(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56LL))( v77,  0LL,  1LL,  v78);
}

uint64_t sub_1000254CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100012990(&qword_10004E770);
  __chkstk_darwin(v4);
  id v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v98 - v12;
  uint64_t v14 = CKRecord.subscript.getter(0x64616F6C796170LL, 0xE700000000000000LL);
  if (!v14) {
    goto LABEL_27;
  }
  uint64_t v15 = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___CKAsset);
  uint64_t v17 = (void *)swift_dynamicCastObjCClass(v15, v16);
  if (!v17)
  {
    uint64_t v14 = swift_unknownObjectRelease(v15);
LABEL_27:
    uint64_t v41 = static os_log_type_t.error.getter(v14);
    unint64_t v42 = (void *)*sub_100019B98();
    uint64_t v43 = sub_100012990(&qword_10004DBB0);
    uint64_t v44 = swift_allocObject(v43, 72LL, 7LL);
    *(_OWORD *)(v44 + 16) = xmmword_1000377D0;
    *(void *)(v44 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v44 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v44 + 32) = a1;
    id v45 = a1;
    id v46 = v42;
    os_log(_:dso:log:_:_:)( v41,  &_mh_execute_header,  v46,  "CloudKit record has invalid payload field: %@",  45LL,  2LL,  v44);

    swift_bridgeObjectRelease(v44);
    uint64_t v47 = type metadata accessor for BloomFilterRecord(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56LL))( a2,  1LL,  1LL,  v47);
  }

  uint64_t v18 = v17;
  uint64_t v108 = a2;
  id v19 = [v17 fileURL];
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1LL, 1LL, v7);
    goto LABEL_29;
  }

  uint64_t v20 = v19;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v21(v6, v11, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0LL, 1LL, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
  {
LABEL_29:
    uint64_t v49 = sub_100021890((uint64_t)v6, &qword_10004E770);
    uint64_t v50 = static os_log_type_t.error.getter(v49);
    id v51 = (void *)*sub_100019B98();
    uint64_t v52 = sub_100012990(&qword_10004DBB0);
    uint64_t v53 = swift_allocObject(v52, 72LL, 7LL);
    *(_OWORD *)(v53 + 16) = xmmword_1000377D0;
    *(void *)(v53 + 56) = sub_10002A704(0LL, &qword_10004E778, &OBJC_CLASS___CKAsset_ptr);
    *(void *)(v53 + 64) = sub_10002A378(&qword_10004E780, &qword_10004E778, &OBJC_CLASS___CKAsset_ptr);
    *(void *)(v53 + 32) = v18;
    id v54 = v51;
    swift_unknownObjectRetain(v15, v55);
    os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v54, "CloudKit asset doesn't have a file URL: %@", 42LL, 2LL, v53);

    swift_bridgeObjectRelease(v53);
    swift_unknownObjectRelease(v15);
LABEL_37:
    uint64_t v72 = type metadata accessor for BloomFilterRecord(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56LL))( v108,  1LL,  1LL,  v72);
  }

  v21(v13, v6, v7);
  uint64_t v22 = CKRecord.subscript.getter(1953259891LL, 0xE400000000000000LL);
  if (!v22
    || (uint64_t v111 = v22,
        uint64_t v23 = sub_100012990(&qword_10004E768),
        uint64_t v22 = swift_dynamicCast(&v109, &v111, v23, &type metadata for Data, 6LL),
        (v22 & 1) == 0))
  {
    uint64_t v56 = static os_log_type_t.error.getter(v22);
    uint64_t v57 = (void *)*sub_100019B98();
    uint64_t v58 = sub_100012990(&qword_10004DBB0);
    uint64_t v59 = swift_allocObject(v58, 72LL, 7LL);
    *(_OWORD *)(v59 + 16) = xmmword_1000377D0;
    *(void *)(v59 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v59 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v59 + 32) = a1;
    id v60 = a1;
    id v61 = v57;
    os_log(_:dso:log:_:_:)(v56, &_mh_execute_header, v61, "CloudKit record has invalid salt: %@", 36LL, 2LL, v59);
    swift_unknownObjectRelease(v15);

    uint64_t v62 = v59;
LABEL_36:
    swift_bridgeObjectRelease(v62);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_37;
  }

  uint64_t v24 = v109;
  unint64_t v25 = v110;
  uint64_t v26 = CKRecord.subscript.getter(1702521203LL, 0xE400000000000000LL);
  if (!v26 || (v109 = v26, uint64_t v26 = swift_dynamicCast(&v111, &v109, v23, &type metadata for UInt64, 6LL), (v26 & 1) == 0))
  {
    LODWORD(v107) = static os_log_type_t.error.getter(v26);
    id v106 = (id)*sub_100019B98();
    uint64_t v63 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v63, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    unint64_t v65 = v25;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v66 = a1;
    id v67 = v106;
    os_log(_:dso:log:_:_:)( v107,  &_mh_execute_header,  v67,  "CloudKit record has invalid size: %@",  36LL,  2LL,  v64);
LABEL_33:
    uint64_t v70 = v24;
    unint64_t v71 = v65;
LABEL_34:
    sub_1000106F8(v70, v71);
    swift_unknownObjectRelease(v15);

LABEL_35:
    uint64_t v62 = v64;
    goto LABEL_36;
  }

  uint64_t v27 = (void *)v111;
  uint64_t v28 = CKRecord.subscript.getter(0x5F736C6961746564LL, 0xEC000000656E6F7ALL);
  if (!v28 || (v111 = v28, uint64_t v28 = swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6LL), (v28 & 1) == 0))
  {
    LODWORD(v107) = static os_log_type_t.error.getter(v28);
    id v106 = (id)*sub_100019B98();
    uint64_t v68 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v68, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    unint64_t v65 = v25;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v69 = a1;
    id v67 = v106;
    os_log(_:dso:log:_:_:)( v107,  &_mh_execute_header,  v67,  "CloudKit record has invalid details zone: %@",  44LL,  2LL,  v64);
    goto LABEL_33;
  }

  id v106 = v27;
  uint64_t v29 = v110;
  uint64_t v103 = v109;
  uint64_t v30 = CKRecord.subscript.getter(0x5F73657461647075LL, 0xEC000000656E6F7ALL);
  uint64_t v104 = v24;
  unint64_t v105 = v25;
  if (!v30)
  {
    uint64_t v73 = v29;
LABEL_41:
    uint64_t v74 = swift_bridgeObjectRelease(v73);
    uint64_t v75 = static os_log_type_t.error.getter(v74);
    uint64_t v76 = (void *)*sub_100019B98();
    uint64_t v77 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v77, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v78 = a1;
    id v67 = v76;
    os_log(_:dso:log:_:_:)(v75, &_mh_execute_header, v67, "CloudKit record has invalid update zone: %@", 43LL, 2LL, v64);
LABEL_44:
    uint64_t v70 = v104;
    unint64_t v71 = v105;
    goto LABEL_34;
  }

  uint64_t v107 = v29;
  uint64_t v111 = v30;
  if ((swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6LL) & 1) == 0)
  {
    uint64_t v73 = v107;
    goto LABEL_41;
  }

  uint64_t v31 = v110;
  uint64_t v102 = v109;
  uint64_t v32 = CKRecord.subscript.getter(25705LL, 0xE200000000000000LL);
  if (!v32 || (uint64_t v111 = v32, (swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6LL) & 1) == 0))
  {
    swift_bridgeObjectRelease(v31);
    uint64_t v79 = swift_bridgeObjectRelease(v107);
    uint64_t v80 = static os_log_type_t.error.getter(v79);
    uint64_t v81 = (void *)*sub_100019B98();
    uint64_t v82 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v82, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v83 = a1;
    id v67 = v81;
    os_log(_:dso:log:_:_:)(v80, &_mh_execute_header, v67, "CloudKit record has invalid id: %@", 34LL, 2LL, v64);
    goto LABEL_44;
  }

  uint64_t v34 = v109;
  uint64_t v33 = v110;
  uint64_t v35 = CKRecord.subscript.getter(0x687469726F676C61LL, 0xEE00656D616E5F6DLL);
  if (!v35 || (uint64_t v111 = v35, (swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6LL) & 1) == 0))
  {
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v31);
    uint64_t v84 = swift_bridgeObjectRelease(v107);
    uint64_t v85 = static os_log_type_t.error.getter(v84);
    unint64_t v86 = (void *)*sub_100019B98();
    uint64_t v87 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v87, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v88 = a1;
    id v67 = v86;
    os_log(_:dso:log:_:_:)(v85, &_mh_execute_header, v67, "CloudKit record has invalid algorithm: %@", 41LL, 2LL, v64);
    goto LABEL_44;
  }

  uint64_t v100 = v109;
  uint64_t v101 = v110;
  uint64_t v36 = CKRecord.subscript.getter(0xD000000000000010LL, 0x800000010003B960LL);
  if (!v36 || (uint64_t v109 = v36, (swift_dynamicCast(&v111, &v109, v23, &type metadata for Int, 6LL) & 1) == 0))
  {
    swift_bridgeObjectRelease(v101);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v31);
    uint64_t v89 = swift_bridgeObjectRelease(v107);
    uint64_t v90 = static os_log_type_t.error.getter(v89);
    id v91 = (void *)*sub_100019B98();
    uint64_t v92 = sub_100012990(&qword_10004DBB0);
    uint64_t v64 = swift_allocObject(v92, 72LL, 7LL);
    *(_OWORD *)(v64 + 16) = xmmword_1000377D0;
    *(void *)(v64 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v64 + 32) = a1;
    id v93 = v91;
    id v94 = a1;
    os_log(_:dso:log:_:_:)( v90,  &_mh_execute_header,  v93,  "CloudKit record has invalid bitsPerEntry count: %@",  50LL,  2LL,  v64);
    sub_1000106F8(v104, v105);
    swift_unknownObjectRelease(v15);

    goto LABEL_35;
  }

  uint64_t v99 = v111;
  uint64_t v37 = CKRecord.subscript.getter(0x73736572706D6F63LL, 0xEB000000006E6F69LL);
  if (v37)
  {
    uint64_t v111 = v37;
    int v38 = swift_dynamicCast(&v109, &v111, v23, &type metadata for String, 6LL);
    if (v38) {
      uint64_t v39 = v109;
    }
    else {
      uint64_t v39 = 0LL;
    }
    if (v38) {
      uint64_t v40 = v110;
    }
    else {
      uint64_t v40 = 0LL;
    }
  }

  else
  {
    uint64_t v39 = 0LL;
    uint64_t v40 = 0LL;
  }

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v97 = v33;
  uint64_t v95 = v108;
  sub_100031134( (uint64_t)v11,  v104,  v105,  (uint64_t)v106,  v103,  v107,  v102,  v31,  v108,  v34,  v97,  v100,  v101,  v99,  v39,  v40);
  swift_unknownObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  uint64_t v96 = type metadata accessor for BloomFilterRecord(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56LL))( v95,  0LL,  1LL,  v96);
}

uint64_t sub_1000260EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100012990(&qword_10004E770);
  __chkstk_darwin(v4);
  id v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = CKRecord.subscript.getter(0x64616F6C796170LL, 0xE700000000000000LL);
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___CKAsset);
  uint64_t v17 = (void *)swift_dynamicCastObjCClass(v15, v16);
  if (!v17)
  {
    uint64_t v14 = swift_unknownObjectRelease(v15);
LABEL_7:
    uint64_t v24 = static os_log_type_t.error.getter(v14);
    unint64_t v25 = (void *)*sub_100019B98();
    uint64_t v26 = sub_100012990(&qword_10004DBB0);
    uint64_t v27 = swift_allocObject(v26, 72LL, 7LL);
    *(_OWORD *)(v27 + 16) = xmmword_1000377D0;
    *(void *)(v27 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v27 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
    *(void *)(v27 + 32) = a1;
    id v28 = v25;
    id v29 = a1;
    os_log(_:dso:log:_:_:)( v24,  &_mh_execute_header,  v28,  "CloudKit record has invalid payload field: %@",  45LL,  2LL,  v27);

    swift_bridgeObjectRelease(v27);
    uint64_t v30 = type metadata accessor for DocumentCheckerRecord(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56LL))( a2,  1LL,  1LL,  v30);
  }

  uint64_t v18 = v17;
  id v19 = [v17 fileURL];
  if (v19)
  {
    uint64_t v20 = v19;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v21(v6, v11, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0LL, 1LL, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) != 1)
    {
      v21(v13, v6, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      sub_100031258((uint64_t)v11, a2);
      swift_unknownObjectRelease(v15);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      uint64_t v22 = type metadata accessor for DocumentCheckerRecord(0LL);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56LL))( a2,  0LL,  1LL,  v22);
    }
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1LL, 1LL, v7);
  }

  uint64_t v31 = sub_100021890((uint64_t)v6, &qword_10004E770);
  uint64_t v32 = static os_log_type_t.error.getter(v31);
  uint64_t v33 = (void *)*sub_100019B98();
  uint64_t v34 = sub_100012990(&qword_10004DBB0);
  uint64_t v35 = swift_allocObject(v34, 72LL, 7LL);
  *(_OWORD *)(v35 + 16) = xmmword_1000377D0;
  *(void *)(v35 + 56) = sub_10002A704(0LL, &qword_10004E778, &OBJC_CLASS___CKAsset_ptr);
  *(void *)(v35 + 64) = sub_10002A378(&qword_10004E780, &qword_10004E778, &OBJC_CLASS___CKAsset_ptr);
  *(void *)(v35 + 32) = v18;
  id v36 = v33;
  swift_unknownObjectRetain(v15, v37);
  os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v36, "CloudKit asset doesn't have a file URL: %@", 42LL, 2LL, v35);

  swift_bridgeObjectRelease(v35);
  swift_unknownObjectRelease(v15);
  uint64_t v38 = type metadata accessor for DocumentCheckerRecord(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56LL))( a2,  1LL,  1LL,  v38);
}

id sub_1000264E8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = (void *)v1[3];
  uint64_t v5 = (void *)v1[4];
  id v6 = (void *)v1[5];
  id v12 = (id)v1[6];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v12;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  return v12;
}

void sub_100026560(uint64_t a1)
{
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = (void *)v1[3];
  uint64_t v5 = (void *)v1[4];
  id v6 = (void *)v1[5];
  id v7 = (void *)v1[6];
  __int128 v8 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v1 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v1 + 2) = v8;
  v1[6] = *(void *)(a1 + 32);
}

uint64_t sub_1000265D8(void *a1)
{
  uint64_t v3 = swift_allocObject(v1, 56LL, 7LL);
  sub_10001EFF4(a1, v6);
  __int128 v4 = v6[1];
  *(_OWORD *)(v3 + 16) = v6[0];
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  return v3;
}

__n128 sub_100026634(uint64_t a1)
{
  uint64_t v3 = swift_allocObject(v1, 56LL, 7LL);
  __n128 result = *(__n128 *)a1;
  __int128 v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v5;
  *(void *)(v3 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = *(void *)(a1 + 32);
  return result;
}

uint64_t sub_100026670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_allocWithZone(&OBJC_CLASS___CKRecordZone);
  swift_bridgeObjectRetain(a2);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v9 = [v7 initWithZoneName:v8];

  id v10 = *(uint64_t (**)(_BYTE *))(*(void *)v4 + 104LL);
  uint64_t v11 = (void (*)(_BYTE *, void))v10(v21);
  uint64_t v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v9;

  v11(v21, 0LL);
  id v14 = objc_allocWithZone(&OBJC_CLASS___CKRecordZone);
  swift_bridgeObjectRetain(a4);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v16 = [v14 initWithZoneName:v15];

  uint64_t v17 = (uint64_t (*)(_BYTE *, void))v10(v21);
  id v19 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v16;

  return v17(v21, 0LL);
}

id sub_100026798@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v9 = sub_100012990(&qword_10004E590);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id result = sub_100027D0C(a1, a2, a3);
  if (!v4)
  {
    uint64_t v13 = result;
    if (result)
    {
      uint64_t v26 = CKRecord.subscript.getter(0x7367616C66LL, 0xE500000000000000LL);
      uint64_t v14 = CKRecord.subscript.getter(0x6E6F73616572LL, 0xE600000000000000LL);
      id v15 = [v13 creationDate];
      if (v15)
      {
        id v16 = v15;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v17 = type metadata accessor for Date(0LL);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v11, 0LL, 1LL, v17);
      }

      else
      {
        uint64_t v19 = type metadata accessor for Date(0LL);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v11, 1LL, 1LL, v19);
      }

      uint64_t v20 = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
      CKRecordKeyValueSetting.subscript.getter( &v24,  25195LL,  0xE200000000000000LL,  v20,  &type metadata for String,  &protocol witness table for String);
      uint64_t v21 = v25;
      uint64_t v22 = a4;
      uint64_t v23 = v26;
      sub_100024F14(a1, a2, a3, v26, v14, (uint64_t)v11, v24, v25, v22);

      swift_bridgeObjectRelease(v21);
      swift_unknownObjectRelease(v14);
      swift_unknownObjectRelease(v23);
      return (id)sub_100021890((uint64_t)v11, &qword_10004E590);
    }

    else
    {
      uint64_t v18 = type metadata accessor for LaunchWarningDetails(0LL);
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( a4,  1LL,  1LL,  v18);
    }
  }

  return result;
}

void sub_1000269A4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v31)(void *__return_ptr);
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  id *v105;
  id *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  unsigned int v117;
  BOOL v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void v128[3];
  void *v129;
  void v130[3];
  uint64_t v131;
  uint64_t v132;
  void v133[3];
  uint64_t v134;
  uint64_t v135;
  void v136[3];
  uint64_t v137;
  uint64_t v138;
  id v139[3];
  uint64_t v140;
  uint64_t v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148[2];
  id v149;
  Swift::OpaquePointer_optional v150;
  Swift::OpaquePointer_optional v151;
  uint64_t v110 = a3;
  uint64_t v4 = v3;
  uint64_t v7 = sub_100012990(&qword_10004E5A0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v108 = (char *)&v104 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v109 = (char *)&v104 - v10;
  uint64_t v11 = sub_100012990(&qword_10004E5A8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v111 = (uint64_t)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  v116 = (uint64_t)&v104 - v14;
  uint64_t v15 = swift_allocObject(&unk_100047318, 32LL, 7LL);
  v120 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_100037B10;
  uint64_t v107 = v15 + 16;
  uint64_t v16 = swift_allocObject(&unk_100047340, 24LL, 7LL);
  id v121 = v16;
  *(void *)(v16 + 16) = 0LL;
  unint64_t v105 = (id *)(v16 + 16);
  uint64_t v17 = swift_allocObject(&unk_100047340, 24LL, 7LL);
  uint64_t v125 = v17;
  *(void *)(v17 + 16) = 0LL;
  id v106 = (id *)(v17 + 16);
  uint64_t v18 = swift_allocObject(&unk_100047368, 24LL, 7LL);
  __int128 v124 = v18;
  *(void *)(v18 + 16) = 0LL;
  v119 = (uint64_t *)(v18 + 16);
  id v19 = [objc_allocWithZone(CKFetchRecordZoneChangesConfiguration) init];
  id v122 = v19;
  id v123 = v4;
  if (a2 >> 60 != 15)
  {
    uint64_t v20 = sub_100010640(a1, a2);
    uint64_t v21 = static os_log_type_t.info.getter(v20);
    uint64_t v22 = (void *)*sub_100019B98();
    uint64_t v23 = sub_100012990(&qword_10004DBB0);
    uint64_t v24 = swift_allocObject(v23, 72LL, 7LL);
    *(_OWORD *)(v24 + 16) = xmmword_1000377D0;
    id v25 = v22;
    Swift::String v26 = Data.base64EncodedString(options:)(0LL);
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = sub_1000139FC();
    *(Swift::String *)(v24 + 32) = v26;
    os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v25, "Base asset sync with token: %@", 30LL, 2LL, v24);

    swift_bridgeObjectRelease(v24);
    id v27 = objc_allocWithZone(&OBJC_CLASS___CKServerChangeToken);
    sub_100010640(a1, a2);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v29 = [v27 initWithData:isa];
    sub_100010BA4(a1, a2);

    id v19 = v122;
    uint64_t v4 = v123;
    [v122 setPreviousServerChangeToken:v29];

    sub_100010BA4(a1, a2);
  }

  uint64_t v30 = CKFetchRecordZoneChangesConfiguration.desiredKeys.setter(&off_1000471E8);
  uint64_t v31 = *(void (**)(void *__return_ptr))(*(void *)v4 + 88LL);
  ((void (*)(void *__return_ptr, uint64_t))v31)(v130, v30);
  uint64_t v32 = (void *)v130[0];
  uint64_t v33 = (id)v130[2];

  uint64_t v34 = (void *)v130[1];
  sub_10002A73C((uint64_t)&v131, (uint64_t)&v149, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v149);
  sub_10002A73C((uint64_t)&v132, (uint64_t)v148, (uint64_t *)&unk_10004E5B0);
  sub_100028564(v148);
  uint64_t v35 = [v33 zoneID];

  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001LL) != 0)
  {
    else {
      uint64_t v38 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8LL);
    }
    uint64_t v39 = v19;
    uint64_t v40 = __CocoaDictionary.count.getter(v38);
    if (__OFADD__(v40, 1LL))
    {
      __break(1u);
      goto LABEL_23;
    }

    uint64_t v37 = (void *)sub_10002898C((uint64_t)v38, v40 + 1);
  }

  else
  {
    id v36 = v19;
    uint64_t v37 = &_swiftEmptyDictionarySingleton;
  }

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v37);
  v129 = v37;
  sub_100028EDC((uint64_t)v19, v35, isUniquelyReferenced_nonNull_native);
  id v118 = (BOOL)v129;

  unint64_t v42 = swift_bridgeObjectRelease(0x8000000000000000LL);
  __int16 v117 = static os_log_type_t.info.getter(v42);
  __int16 v115 = sub_100019B98();
  uint64_t v43 = (void *)*v115;
  v114 = sub_100012990(&qword_10004DBB0);
  uint64_t v44 = swift_allocObject(v114, 72LL, 7LL);
  id v113 = xmmword_1000377D0;
  *(_OWORD *)(v44 + 16) = xmmword_1000377D0;
  id v45 = v43;
  v31(v133);
  id v46 = (void *)v133[0];
  uint64_t v47 = (id)v133[2];

  uint64_t v48 = (void *)v133[1];
  sub_10002A73C((uint64_t)&v134, (uint64_t)&v147, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v147);
  sub_10002A73C((uint64_t)&v135, (uint64_t)&v146, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v146);
  uint64_t v49 = [v47 zoneID];

  uint64_t v50 = [v49 zoneName];
  id v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
  uint64_t v53 = v52;

  *(void *)(v44 + 56) = &type metadata for String;
  v112 = sub_1000139FC();
  *(void *)(v44 + 64) = v112;
  *(void *)(v44 + 32) = v51;
  *(void *)(v44 + 40) = v53;
  os_log(_:dso:log:_:_:)(v117, &_mh_execute_header, v45, "Starting sync of zone: %@", 25LL, 2LL, v44);

  swift_bridgeObjectRelease(v44);
  sub_10002A704(0LL, &qword_10004E5C8, &OBJC_CLASS___CKFetchRecordZoneChangesOperation_ptr);
  id v54 = sub_100012990((uint64_t *)&unk_10004E5D0);
  uint64_t v55 = swift_allocObject(v54, 40LL, 7LL);
  *(_OWORD *)(v55 + 16) = xmmword_1000389D0;
  uint64_t v56 = v118;
  v31(v136);
  uint64_t v57 = (void *)v136[0];
  uint64_t v58 = (id)v136[2];

  uint64_t v59 = (void *)v136[1];
  sub_10002A73C((uint64_t)&v137, (uint64_t)&v145, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v145);
  sub_10002A73C((uint64_t)&v138, (uint64_t)&v144, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v144);
  id v60 = [v58 zoneID];

  *(void *)(v55 + 32) = v60;
  v129 = (void *)v55;
  specialized Array._endMutation()();
  id v61 = v129;
  swift_bridgeObjectRetain(v56);
  v150.value._rawValue = v61;
  v150.is_nil = v56;
  uint64_t v62 = (void *)CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(v150, v151);
  uint64_t v63 = (void *)swift_allocObject(&unk_100047390, 40LL, 7LL);
  unint64_t v65 = v124;
  uint64_t v64 = v125;
  id v66 = v121;
  v63[2] = v124;
  v63[3] = v66;
  v63[4] = v64;
  swift_retain(v65);
  swift_retain(v66);
  swift_retain(v64);
  CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter(sub_100029070, v63);
  id v67 = swift_allocObject(&unk_1000473B8, 32LL, 7LL);
  uint64_t v68 = v120;
  *(void *)(v67 + 16) = v120;
  *(void *)(v67 + 24) = v65;
  swift_retain(v65);
  swift_retain(v68);
  CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter(sub_100029438, v67);
  id v69 = [v62 configuration];
  if (!v69)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v70 = v69;
  [v69 setQualityOfService:25];

  unint64_t v71 = [v62 configuration];
  if (!v71)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  uint64_t v72 = v71;
  [v71 setTimeoutIntervalForRequest:10.0];

  uint64_t v73 = [v62 configuration];
  if (!v73)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v74 = v73;
  [v73 setTimeoutIntervalForResource:60.0];

  uint64_t v75 = [v62 configuration];
  if (!v75)
  {
LABEL_26:
    __break(1u);
    return;
  }

  uint64_t v76 = v75;
  swift_bridgeObjectRelease(v56);
  [v76 setPreferAnonymousRequests:1];

  v31(v139);
  uint64_t v77 = v139[1];

  sub_10002A73C((uint64_t)&v140, (uint64_t)&v143, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v143);
  sub_10002A73C((uint64_t)&v141, (uint64_t)&v142, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v142);
  [v77 addOperation:v62];

  [v62 waitUntilFinished];
  id v78 = v119;
  swift_beginAccess(v119, &v129, 0LL, 0LL);
  uint64_t v79 = *v78;
  if (v79)
  {
    uint64_t v80 = swift_errorRetain(v79);
    uint64_t v81 = static os_log_type_t.error.getter(v80);
    uint64_t v82 = (void *)*v115;
    id v83 = swift_allocObject(v114, 72LL, 7LL);
    *(_OWORD *)(v83 + 16) = v113;
    v128[0] = v79;
    swift_errorRetain(v79);
    uint64_t v84 = v82;
    uint64_t v85 = sub_100012990(&qword_10004DDA0);
    unint64_t v86 = String.init<A>(describing:)(v128, v85);
    uint64_t v87 = v112;
    *(void *)(v83 + 56) = &type metadata for String;
    *(void *)(v83 + 64) = v87;
    *(void *)(v83 + 32) = v86;
    *(void *)(v83 + 40) = v88;
    os_log(_:dso:log:_:_:)(v81, &_mh_execute_header, v84, "Sync error: %@", 14LL, 2LL, v83);

    uint64_t v89 = swift_bridgeObjectRelease(v83);
    swift_willThrow(v89);
    swift_release(v68);
    swift_release(v66);
    swift_release(v125);
    swift_release(v124);
  }

  else
  {
    uint64_t v90 = type metadata accessor for BloomFilterRecord(0LL);
    id v91 = v116;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56LL))(v116, 1LL, 1LL, v90);
    uint64_t v92 = v105;
    swift_beginAccess(v105, v128, 0LL, 0LL);
    if (*v92)
    {
      id v93 = *v92;
      id v94 = v111;
      sub_1000254CC(v93, v111);

      sub_100021890(v91, &qword_10004E5A8);
      sub_10002A73C(v94, v91, &qword_10004E5A8);
    }

    uint64_t v95 = type metadata accessor for DocumentCheckerRecord(0LL);
    uint64_t v96 = (uint64_t)v109;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56LL))(v109, 1LL, 1LL, v95);
    uint64_t v97 = v106;
    swift_beginAccess(v106, &v127, 0LL, 0LL);
    uint64_t v98 = (uint64_t)v108;
    if (*v97)
    {
      uint64_t v99 = *v97;
      sub_1000260EC(v99, v98);

      sub_100021890(v96, &qword_10004E5A0);
      sub_10002A73C(v98, v96, &qword_10004E5A0);
    }

    uint64_t v100 = v116;
    uint64_t v101 = v111;
    sub_100020048(v116, v111, &qword_10004E5A8);
    sub_100020048(v96, v98, &qword_10004E5A0);
    swift_beginAccess(v107, &v126, 0LL, 0LL);
    uint64_t v102 = *(void *)(v68 + 16);
    uint64_t v103 = *(void *)(v68 + 24);
    sub_10001073C(v102, v103);
    sub_1000312BC(v101, v98, v102, v103, v110);

    sub_100021890(v96, &qword_10004E5A0);
    sub_100021890(v100, &qword_10004E5A8);
    swift_release(v68);
    swift_release(v121);
    swift_release(v125);
    swift_release(v124);
  }

id sub_1000274CC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void (*v59)(id *__return_ptr);
  void *v60;
  id v63;
  id v64;
  uint64_t v65;
  _BYTE v66[24];
  void v67[3];
  uint64_t v68[3];
  void v69[3];
  uint64_t v70;
  uint64_t v71;
  id v72[3];
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78[2];
  void *v79;
  Swift::OpaquePointer_optional v80;
  Swift::OpaquePointer_optional v81;
  uint64_t v7 = swift_allocObject(&unk_1000473E0, 17LL, 7LL);
  *(_BYTE *)(v7 + 16) = 0;
  unint64_t v65 = swift_allocObject(&unk_100047318, 32LL, 7LL);
  *(_OWORD *)(v65 + 16) = xmmword_100037B10;
  uint64_t v8 = swift_allocObject(&unk_100047368, 24LL, 7LL);
  *(void *)(v8 + 16) = 0LL;
  id v60 = (void *)(v8 + 16);
  uint64_t v59 = *(void (**)(id *__return_ptr))(*(void *)v4 + 88LL);
  v59((id *)v69);
  sub_10002A73C((uint64_t)&v70, (uint64_t)v78, (uint64_t *)&unk_10004E5B0);
  uint64_t v9 = (void *)v69[0];
  sub_100029480(v78);

  sub_100028564(v78);
  sub_10002A73C((uint64_t)&v71, (uint64_t)&v77, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v77);
  uint64_t v10 = sub_10002A73C((uint64_t)v78, (uint64_t)&v79, (uint64_t *)&unk_10004E5B0);
  uint64_t v63 = v79;
  if (!v79)
  {
    uint64_t v24 = static os_log_type_t.default.getter(v10);
    id v25 = (id)*sub_100019B98();
    os_log(_:dso:log:_:_:)( v24,  &_mh_execute_header,  v25,  "Update zone sync with no configured zone",  40LL,  2LL,  &_swiftEmptyArrayStorage);

    unint64_t v26 = sub_1000294A8();
    uint64_t v27 = swift_allocError(&type metadata for CloudKitError, v26, 0LL, 0LL);
    *id v28 = 3;
    swift_willThrow(v27);
    swift_release(v7);
    swift_release(v65);
    swift_release(v8);
    return (id)(v8 & 1);
  }

  id v11 = [objc_allocWithZone(CKFetchRecordZoneChangesConfiguration) init];
  if (a4 >> 60 != 15)
  {
    uint64_t v12 = sub_100010640(a3, a4);
    unsigned int v57 = static os_log_type_t.info.getter(v12);
    uint64_t v13 = (void *)*sub_100019B98();
    uint64_t v14 = sub_100012990(&qword_10004DBB0);
    uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
    *(_OWORD *)(v15 + 16) = xmmword_1000377D0;
    id v16 = v13;
    Swift::String v17 = Data.base64EncodedString(options:)(0LL);
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = sub_1000139FC();
    *(Swift::String *)(v15 + 32) = v17;
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v16, "Update zone sync with token: %@", 31LL, 2LL, v15);

    swift_bridgeObjectRelease(v15);
    id v18 = objc_allocWithZone(&OBJC_CLASS___CKServerChangeToken);
    sub_100010640(a3, a4);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v20 = [v18 initWithData:isa];
    sub_100010BA4(a3, a4);

    [v11 setPreviousServerChangeToken:v20];
    sub_100010BA4(a3, a4);
  }

  CKFetchRecordZoneChangesConfiguration.desiredKeys.setter(&off_100047298);
  id v21 = [v63 zoneID];
  if (((unint64_t)&_swiftEmptyDictionarySingleton & 0xC000000000000001LL) != 0)
  {
    else {
      id v29 = (void *)((unint64_t)&_swiftEmptyDictionarySingleton & 0xFFFFFFFFFFFFFF8LL);
    }
    id v30 = v11;
    id result = (id)__CocoaDictionary.count.getter(v29);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      goto LABEL_21;
    }

    uint64_t v23 = (void *)sub_10002898C((uint64_t)v29, (uint64_t)result + 1);
  }

  else
  {
    id v22 = v11;
    uint64_t v23 = &_swiftEmptyDictionarySingleton;
  }

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v23);
  uint64_t v58 = v11;
  sub_100028EDC((uint64_t)v11, v21, isUniquelyReferenced_nonNull_native);
  BOOL v33 = (BOOL)v23;

  swift_bridgeObjectRelease(0x8000000000000000LL);
  sub_10002A704(0LL, &qword_10004E5C8, &OBJC_CLASS___CKFetchRecordZoneChangesOperation_ptr);
  uint64_t v34 = sub_100012990((uint64_t *)&unk_10004E5D0);
  uint64_t v35 = swift_allocObject(v34, 40LL, 7LL);
  *(_OWORD *)(v35 + 16) = xmmword_1000389D0;
  *(void *)(v35 + 32) = [v63 zoneID];
  v68[0] = v35;
  specialized Array._endMutation()();
  swift_bridgeObjectRetain(v33);
  v80.value._rawValue = (void *)v35;
  v80.is_nil = v33;
  id v36 = (void *)CKFetchRecordZoneChangesOperation.init(recordZoneIDs:configurationsByRecordZoneID:)(v80, v81);
  uint64_t v37 = (void *)swift_allocObject(&unk_100047408, 48LL, 7LL);
  v37[2] = v8;
  v37[3] = v7;
  v37[4] = a1;
  v37[5] = a2;
  swift_retain(v8);
  swift_retain(v7);
  swift_retain(a2);
  CKFetchRecordZoneChangesOperation.recordWasChangedBlock.setter(sub_100029520, v37);
  uint64_t v38 = swift_allocObject(&unk_100047430, 32LL, 7LL);
  *(void *)(v38 + 16) = v65;
  *(void *)(v38 + 24) = v8;
  swift_retain(v8);
  swift_retain(v65);
  CKFetchRecordZoneChangesOperation.recordZoneFetchResultBlock.setter(sub_100029D34, v38);
  id result = [v36 configuration];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v39 = result;
  [result setQualityOfService:25];

  id result = [v36 configuration];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  uint64_t v40 = result;
  [result setTimeoutIntervalForRequest:10.0];

  id result = [v36 configuration];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  uint64_t v41 = result;
  [result setTimeoutIntervalForResource:60.0];

  id result = [v36 configuration];
  if (result)
  {
    unint64_t v42 = result;
    uint64_t v64 = (id)v8;
    swift_bridgeObjectRelease(v33);
    [v42 setPreferAnonymousRequests:1];

    v59(v72);
    id v43 = v72[1];

    sub_10002A73C((uint64_t)&v73, (uint64_t)&v76, (uint64_t *)&unk_10004E5B0);
    sub_100028564(&v76);
    sub_10002A73C((uint64_t)&v74, (uint64_t)&v75, (uint64_t *)&unk_10004E5B0);
    sub_100028564(&v75);
    [v43 addOperation:v36];

    [v36 waitUntilFinished];
    swift_beginAccess(v60, v68, 0LL, 0LL);
    uint64_t v44 = *v60;
    if (*v60)
    {
      uint64_t v45 = swift_errorRetain(*v60);
      uint64_t v8 = static os_log_type_t.error.getter(v45);
      id v46 = (void *)*sub_100019B98();
      uint64_t v47 = sub_100012990(&qword_10004DBB0);
      uint64_t v48 = swift_allocObject(v47, 72LL, 7LL);
      *(_OWORD *)(v48 + 16) = xmmword_1000377D0;
      v67[0] = v44;
      swift_errorRetain(v44);
      id v49 = v46;
      uint64_t v50 = sub_100012990(&qword_10004DDA0);
      uint64_t v51 = v7;
      uint64_t v52 = String.init<A>(describing:)(v67, v50);
      uint64_t v54 = v53;
      *(void *)(v48 + 56) = &type metadata for String;
      *(void *)(v48 + 64) = sub_1000139FC();
      *(void *)(v48 + 32) = v52;
      *(void *)(v48 + 40) = v54;
      os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v49, "Update sync error: %@", 21LL, 2LL, v48);

      uint64_t v55 = swift_bridgeObjectRelease(v48);
      swift_willThrow(v55);
      sub_100028564(v78);
      swift_release(v51);
      swift_release(v65);
      swift_release(v64);
    }

    else
    {
      swift_beginAccess(v7 + 16, v67, 0LL, 0LL);
      char v56 = *(_BYTE *)(v7 + 16);
      swift_beginAccess(v65 + 16, v66, 0LL, 0LL);
      sub_10001073C(*(void *)(v65 + 16), *(void *)(v65 + 24));
      LOBYTE(v_Block_object_dispose((const void *)(v1 - 112), 8) = sub_100031334(v56);
      sub_100028564(v78);
      swift_release(v7);
      swift_release(v65);
      swift_release(v64);
    }

    return (id)(v8 & 1);
  }

LABEL_24:
  __break(1u);
  return result;
}

id sub_100027D0C(uint64_t a1, uint64_t a2, int a3)
{
  void (*v67)(id *__return_ptr);
  void *v68;
  void *v69;
  void v70[3];
  void v71[3];
  uint64_t v72;
  uint64_t v73;
  id v74[3];
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80[2];
  void *v81;
  uint64_t v4 = v3;
  id v67 = *(void (**)(id *__return_ptr))(*(void *)v3 + 88LL);
  v67((id *)v71);
  sub_10002A73C((uint64_t)&v73, (uint64_t)v80, (uint64_t *)&unk_10004E5B0);
  uint64_t v8 = (void *)v71[0];
  sub_100029480(v80);

  sub_10002A73C((uint64_t)&v72, (uint64_t)&v79, (uint64_t *)&unk_10004E5B0);
  sub_100028564(&v79);
  sub_100028564(v80);
  uint64_t v9 = sub_10002A73C((uint64_t)v80, (uint64_t)&v81, (uint64_t *)&unk_10004E5B0);
  uint64_t v10 = v81;
  if (!v81)
  {
    uint64_t v41 = static os_log_type_t.error.getter(v9);
    id v42 = (id)*sub_100019B98();
    os_log(_:dso:log:_:_:)( v41,  &_mh_execute_header,  v42,  "Attempt to fetch warning details with no zone",  45LL,  2LL,  &_swiftEmptyArrayStorage);

    unint64_t v43 = sub_1000294A8();
    uint64_t v44 = swift_allocError(&type metadata for CloudKitError, v43, 0LL, 0LL);
    _BYTE *v45 = 1;
    swift_willThrow(v44);
    return v4;
  }

  uint64_t v11 = swift_allocObject(&unk_100047510, 25LL, 7LL);
  *(void *)(v11 + 16) = 0LL;
  *(_BYTE *)(v11 + 24) = -1;
  v70[0] = 0x73616864632F3176LL;
  v70[1] = 0xEA00000000002F68LL;
  LODWORD(v69) = a3;
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt32,  &protocol witness table for UInt32);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v14._countAndFlagsBits = 47LL;
  v14._object = (void *)0xE100000000000000LL;
  String.append(_:)(v14);
  sub_100012758(a1, a2);
  id v16 = v15._object;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v16);
  sub_10002A704(0LL, &qword_10004E6E8, &OBJC_CLASS___CKRecordID_ptr);
  swift_bridgeObjectRetain(0xEA00000000002F68LL);
  id v17 = [v10 zoneID];
  v18._countAndFlagsBits = 0x73616864632F3176LL;
  v18._object = (void *)0xEA00000000002F68LL;
  Class isa = CKRecordID.init(recordName:zoneID:)(v18, (CKRecordZoneID)v17).super.isa;
  uint64_t v20 = static os_log_type_t.info.getter(isa);
  id v66 = (id *)sub_100019B98();
  id v21 = *v66;
  uint64_t v64 = sub_100012990(&qword_10004DBB0);
  uint64_t v22 = swift_allocObject(v64, 72LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_1000377D0;
  *(void *)(v22 + 56) = &type metadata for String;
  unint64_t v65 = sub_1000139FC();
  *(void *)(v22 + 64) = v65;
  *(void *)(v22 + 32) = 0x73616864632F3176LL;
  *(void *)(v22 + 40) = 0xEA00000000002F68LL;
  id v23 = v21;
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v23, "CloudKit fetch for warning: %@", 30LL, 2LL, v22);

  swift_bridgeObjectRelease(v22);
  uint64_t v24 = sub_100012990((uint64_t *)&unk_10004E5D0);
  uint64_t v25 = swift_allocObject(v24, 40LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_1000389D0;
  *(void *)(v25 + 32) = isa;
  v70[0] = v25;
  specialized Array._endMutation()();
  id v26 = objc_allocWithZone(&OBJC_CLASS___CKFetchRecordsOperation);
  uint64_t v27 = isa;
  Class v28 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v70[0]);
  id v29 = [v26 initWithRecordIDs:v28];

  swift_retain(v11);
  CKFetchRecordsOperation.perRecordResultBlock.setter(sub_10002A7B4, v11);
  id result = [v29 configuration];
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v31 = result;
  [result setQualityOfService:25];

  id result = [v29 configuration];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  uint64_t v32 = result;
  [result setTimeoutIntervalForRequest:10.0];

  id result = [v29 configuration];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }

  BOOL v33 = result;
  [result setTimeoutIntervalForResource:60.0];

  id result = [v29 configuration];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v34 = result;
  [result setPreferAnonymousRequests:1];

  id result = [v29 configuration];
  if (result)
  {
    uint64_t v35 = result;
    NSString v36 = String._bridgeToObjectiveC()();
    objc_msgSend(v35, "set_sourceApplicationSecondaryIdentifier:", v36);

    v67(v74);
    id v37 = v74[1];

    sub_10002A73C((uint64_t)&v75, (uint64_t)&v78, (uint64_t *)&unk_10004E5B0);
    sub_100028564(&v78);
    sub_10002A73C((uint64_t)&v76, (uint64_t)&v77, (uint64_t *)&unk_10004E5B0);
    sub_100028564(&v77);
    [v37 addOperation:v29];

    [v29 waitUntilFinished];
    uint64_t v38 = swift_beginAccess(v11 + 16, v70, 0LL, 0LL);
    int v39 = *(unsigned __int8 *)(v11 + 24);
    if (v39 == 255)
    {
      uint64_t v46 = static os_log_type_t.error.getter(v38);
      id v47 = *v66;
      os_log(_:dso:log:_:_:)( v46,  &_mh_execute_header,  v47,  "CloudKit results block never called.",  36LL,  2LL,  &_swiftEmptyArrayStorage);

      unint64_t v48 = sub_1000294A8();
      uint64_t v49 = swift_allocError(&type metadata for CloudKitError, v48, 0LL, 0LL);
      _BYTE *v50 = 0;
      swift_willThrow(v49);
      swift_release(v11);

      sub_100028564(v80);
    }

    else
    {
      uint64_t v4 = *(void **)(v11 + 16);
      if ((v39 & 1) != 0)
      {
        id v69 = *(void **)(v11 + 16);
        sub_10002A81C(v4, v39);
        sub_10002A3B8(v4, 1);
        sub_10002A3B8(v4, 1);
        uint64_t v51 = sub_100012990(&qword_10004DDA0);
        type metadata accessor for CKError(0LL);
        uint64_t v53 = v52;
        uint64_t v54 = swift_dynamicCast(&v68, &v69, v51, v52, 6LL);
        if ((v54 & 1) != 0
          && (uint64_t v55 = v68,
              uint64_t v56 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50),  _BridgedStoredNSError.code.getter(&v69, v53, v56),  v55,  v69 == (void *)11))
        {
          sub_10002A834(v4, v39);
          sub_10002A834(v4, v39);
          swift_release(v11);

          sub_100028564(v80);
          return 0LL;
        }

        else
        {
          uint64_t v57 = static os_log_type_t.error.getter(v54);
          id v58 = *v66;
          uint64_t v59 = swift_allocObject(v64, 72LL, 7LL);
          *(_OWORD *)(v59 + 16) = xmmword_1000377D0;
          id v69 = v4;
          sub_10002A81C(v4, v39);
          id v60 = v58;
          uint64_t v61 = String.init<A>(describing:)(&v69, v51);
          *(void *)(v59 + 56) = &type metadata for String;
          *(void *)(v59 + 64) = v65;
          *(void *)(v59 + 32) = v61;
          *(void *)(v59 + 40) = v62;
          os_log(_:dso:log:_:_:)( v57,  &_mh_execute_header,  v60,  "CloudKit unexpected error during fetch: %@",  42LL,  2LL,  v59);

          uint64_t v63 = swift_bridgeObjectRelease(v59);
          swift_willThrow(v63);
          sub_10002A834(v4, v39);
          swift_release(v11);

          sub_100028564(v80);
        }
      }

      else
      {
        id v40 = v4;

        sub_100028564(v80);
        swift_release(v11);
      }
    }

    return v4;
  }

LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1000284E8()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_1000106F8(*(void *)(v0 + 16), v1);
  }
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002851C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100028540()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id *sub_100028564(id *a1)
{
  return a1;
}

uint64_t sub_10002858C()
{
  unint64_t v1 = *(void **)(v0 + 16);
  objc_super v2 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 40);
  uint64_t v4 = *(void **)(v0 + 48);

  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t sub_1000285E0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136LL))();
}

uint64_t sub_100028608()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144LL))();
}

uint64_t sub_100028630()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152LL))() & 1;
}

uint64_t sub_100028668()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128LL))();
}

id sub_100028690()
{
  return *v0;
}

uint64_t sub_100028698@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1000286A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(CKErrorDomain);
}

uint64_t sub_1000286B0(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000286F0(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100028730(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100028794()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000287C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100028818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_100028874(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004E7C8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C0C);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000288B4(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004E7C8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C0C);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000288F4(uint64_t a1)
{
  uint64_t v2 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100028934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

Swift::Int sub_10002898C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100012990(&qword_10004E790);
    uint64_t v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    uint64_t v30 = v4;
    uint64_t v5 = __CocoaDictionary.makeIterator()(a1);
    uint64_t v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = sub_10002A704(0LL, &qword_10004E788, &OBJC_CLASS___CKRecordZoneID_ptr);
      do
      {
        uint64_t v28 = v8;
        swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
        uint64_t v27 = v9;
        uint64_t v21 = sub_10002A704(0LL, &qword_10004E798, &OBJC_CLASS___CKFetchRecordZoneChangesConfiguration_ptr);
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7LL);
        uint64_t v4 = v30;
        unint64_t v22 = *(void *)(v30 + 16);
        if (*(void *)(v30 + 24) <= v22)
        {
          sub_100028C0C(v22 + 1, 1LL);
          uint64_t v4 = v30;
        }

        uint64_t v12 = v28;
        uint64_t v11 = v29;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v14 = v4 + 64;
        uint64_t v15 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v16 = result & ~v15;
        unint64_t v17 = v16 >> 6;
        if (((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v23 = 0;
          unint64_t v24 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v25 = v17 == v24;
            if (v17 == v24) {
              unint64_t v17 = 0LL;
            }
            v23 |= v25;
            uint64_t v26 = *(void *)(v14 + 8 * v17);
          }

          while (v26 == -1);
          unint64_t v18 = __clz(__rbit64(~v26)) + (v17 << 6);
        }

        *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
        uint64_t v19 = 8 * v18;
        *(void *)(*(void *)(v4 + 48) + v19) = v11;
        *(void *)(*(void *)(v4 + 56) + v19) = v12;
        ++*(void *)(v4 + 16);
        uint64_t v8 = __CocoaDictionary.Iterator.next()();
        uint64_t v9 = v20;
      }

      while (v8);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }

  return v4;
}

unint64_t sub_100028BDC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10002A448(a1, v4);
}

Swift::Int sub_100028C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100012990(&qword_10004E790);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  id v37 = v3;
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }

    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v37;
          if ((a2 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_45;
            }
            if (v15 >= v12) {
              goto LABEL_36;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_33;
            }
          }
        }

        int64_t v15 = v26;
      }
    }

LABEL_33:
    unint64_t v11 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    uint64_t v31 = 8 * v22;
    uint64_t v32 = *(void **)(*(void *)(v5 + 48) + v31);
    BOOL v33 = *(void **)(*(void *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      id v34 = v32;
      id v35 = v33;
    }

    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v8 + 40));
    uint64_t v16 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }

      while (v30 == -1);
      unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }

    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t v20 = 8 * v19;
    *(void *)(*(void *)(v8 + 48) + v20) = v32;
    *(void *)(*(void *)(v8 + 56) + v20) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v37;
  unint64_t v24 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v36 = 1LL << *(_BYTE *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v24 = -1LL << v36;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

void sub_100028EDC(uint64_t a1, void *a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100028BDC((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10002A560();
LABEL_7:
    int64_t v15 = (void *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }

uint64_t sub_10002903C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_100029070(void *a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    uint64_t v17 = v3[2];
    uint64_t v18 = swift_errorRetain(a2);
    uint64_t v19 = static os_log_type_t.default.getter(v18);
    uint64_t v20 = (void *)*sub_100019B98();
    uint64_t v21 = sub_100012990(&qword_10004DBB0);
    uint64_t v22 = swift_allocObject(v21, 112LL, 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_1000377F0;
    *(void *)(v22 + 56) = sub_10002A704(0LL, &qword_10004E6E8, &OBJC_CLASS___CKRecordID_ptr);
    *(void *)(v22 + 64) = sub_10002A378(&qword_10004E6F0, &qword_10004E6E8, &OBJC_CLASS___CKRecordID_ptr);
    *(void *)(v22 + 32) = a1;
    v42[0] = a2;
    sub_10002A3B8(a2, 1);
    id v23 = v20;
    id v24 = a1;
    uint64_t v25 = sub_100012990(&qword_10004DDA0);
    uint64_t v26 = String.init<A>(describing:)(v42, v25);
    uint64_t v28 = v27;
    *(void *)(v22 + 96) = &type metadata for String;
    *(void *)(v22 + 104) = sub_1000139FC();
    *(void *)(v22 + 72) = v26;
    *(void *)(v22 + 80) = v28;
    os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v23, "Base asset record error: %@, %@", 31LL, 2LL, v22);
    swift_bridgeObjectRelease(v22);

    swift_beginAccess(v17 + 16, v42, 1LL, 0LL);
    uint64_t v29 = *(void *)(v17 + 16);
    *(void *)(v17 + 16) = a2;
    swift_errorRelease(v29);
    return;
  }

  uint64_t v6 = v3[3];
  uint64_t v5 = v3[4];
  id v7 = a2;
  uint64_t v8 = static os_log_type_t.default.getter(v7);
  unint64_t v9 = (void *)*sub_100019B98();
  uint64_t v10 = sub_100012990(&qword_10004DBB0);
  uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_1000377D0;
  *(void *)(v11 + 56) = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
  *(void *)(v11 + 64) = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
  *(void *)(v11 + 32) = v7;
  sub_10002A3B8(a2, 0);
  id v12 = v9;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v12, "Base asset record changed: %@", 29LL, 2LL, v11);
  swift_bridgeObjectRelease(v11);

  uint64_t v13 = ((uint64_t (*)(void))CKRecord.recordType.getter)();
  uint64_t v15 = v14;
  if (v13 == 0xD00000000000001DLL && v14 == 0x800000010003BE20LL)
  {
    swift_bridgeObjectRelease(0x800000010003BE20LL);
LABEL_7:
    uint64_t v32 = (id *)(v6 + 16);
    goto LABEL_8;
  }

  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, 0xD00000000000001DLL, 0x800000010003BE20LL, 0LL);
  uint64_t v31 = swift_bridgeObjectRelease(v15);
  if ((v30 & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v37 = CKRecord.recordType.getter(v31);
  uint64_t v39 = v38;
  if (v37 == 0xD000000000000013LL && v38 == 0x800000010003BE40LL)
  {
    swift_bridgeObjectRelease(0x800000010003BE40LL);
    uint64_t v32 = (id *)(v5 + 16);
  }

  else
  {
    char v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38, 0xD000000000000013LL, 0x800000010003BE40LL, 0LL);
    swift_bridgeObjectRelease(v39);
    if ((v40 & 1) == 0)
    {
      sub_10002A3C4(a2, 0);
      sub_10002A3C4(a2, 0);
      return;
    }

    uint64_t v32 = (id *)(v5 + 16);
  }

LABEL_8:
  swift_beginAccess(v32, v42, 0LL, 0LL);
  id v33 = *v32;
  id v34 = *v32;
  id v35 = sub_100024C44(v7, v33);
  sub_10002A3C4(a2, 0);
  sub_10002A3C4(a2, 0);

  swift_beginAccess(v32, &v41, 1LL, 0LL);
  id v36 = *v32;
  *uint64_t v32 = v35;
}

uint64_t sub_100029438(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_100029D6C( a1,  a2,  a3,  a4,  a5,  "Got updated base sync token: %@",  31LL,  "Base sync completion error: %@",  30LL);
}

uint64_t sub_100029470()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

id *sub_100029480(id *a1)
{
  id v2 = *a1;
  return a1;
}

unint64_t sub_1000294A8()
{
  unint64_t result = qword_10004E5E0;
  if (!qword_10004E5E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038A54, &type metadata for CloudKitError);
    atomic_store(result, (unint64_t *)&qword_10004E5E0);
  }

  return result;
}

uint64_t sub_1000294EC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_100029520(void *a1, void *a2, char a3)
{
  uint64_t v5 = (uint64_t *)(v3[2] + 16LL);
  if ((a3 & 1) != 0)
  {
    uint64_t v19 = swift_errorRetain(a2);
    uint64_t v20 = static os_log_type_t.default.getter(v19);
    uint64_t v21 = (void *)*sub_100019B98();
    uint64_t v22 = sub_100012990(&qword_10004DBB0);
    uint64_t v23 = swift_allocObject(v22, 112LL, 7LL);
    *(_OWORD *)(v23 + 16) = xmmword_1000377F0;
    *(void *)(v23 + 56) = sub_10002A704(0LL, &qword_10004E6E8, &OBJC_CLASS___CKRecordID_ptr);
    *(void *)(v23 + 64) = sub_10002A378(&qword_10004E6F0, &qword_10004E6E8, &OBJC_CLASS___CKRecordID_ptr);
    *(void *)(v23 + 32) = a1;
    *(void *)&__int128 v85 = a2;
    sub_10002A3B8(a2, 1);
    id v24 = v21;
    id v25 = a1;
    uint64_t v26 = sub_100012990(&qword_10004DDA0);
    uint64_t v27 = String.init<A>(describing:)(&v85, v26);
    uint64_t v29 = v28;
    *(void *)(v23 + 96) = &type metadata for String;
    *(void *)(v23 + 104) = sub_1000139FC();
    *(void *)(v23 + 72) = v27;
    *(void *)(v23 + 80) = v29;
    os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v24, "Base asset record error: %@, %@", 31LL, 2LL, v23);
    swift_bridgeObjectRelease(v23);

    swift_beginAccess(v5, &v85, 1LL, 0LL);
    uint64_t v30 = *v5;
    *uint64_t v5 = (uint64_t)a2;
    goto LABEL_30;
  }

  uint64_t v6 = v3[3];
  uint64_t v75 = (void (*)(__int128 *))v3[4];
  id v7 = a2;
  uint64_t v8 = static os_log_type_t.default.getter(v7);
  unint64_t v9 = (void *)*sub_100019B98();
  uint64_t v10 = sub_100012990(&qword_10004DBB0);
  uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_1000377D0;
  uint64_t v76 = sub_10002A704(0LL, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
  *(void *)(v11 + 56) = v76;
  uint64_t v12 = sub_10002A378(&qword_10004E6F8, &qword_10004E598, &OBJC_CLASS___CKRecord_ptr);
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 32) = v7;
  sub_10002A3B8(a2, 0);
  id v13 = v9;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v13, "Update zone record changed: %@", 30LL, 2LL, v11);
  swift_bridgeObjectRelease(v11);

  uint64_t v15 = CKRecord.recordType.getter(v14);
  uint64_t v17 = v16;
  if (v15 == 0xD000000000000019LL && v16 == 0x800000010003BB20LL)
  {
    swift_bridgeObjectRelease(0x800000010003BB20LL);
  }

  else
  {
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, 0xD000000000000019LL, 0x800000010003BB20LL, 0LL);
    swift_bridgeObjectRelease(v17);
    if ((v31 & 1) == 0)
    {
      sub_10002A3C4(a2, 0);
      sub_10002A3C4(a2, 0);
      return;
    }
  }

  swift_beginAccess(v6 + 16, v77, 1LL, 0LL);
  *(_BYTE *)(v6 + 16) = 1;
  uint64_t v32 = CKRecord.subscript.getter(0x6E5F657461647075LL, 0xEA00000000006D75LL);
  if (!v32
    || (*(void *)&__int128 v85 = v32,
        uint64_t v33 = sub_100012990(&qword_10004E768),
        uint64_t v32 = swift_dynamicCast(v82, &v85, v33, &type metadata for Int64, 6LL),
        (v32 & 1) == 0))
  {
    uint64_t v45 = static os_log_type_t.error.getter(v32);
    uint64_t v46 = (void *)*sub_100019B98();
    uint64_t v47 = sub_100012990(&qword_10004DBB0);
    uint64_t v48 = swift_allocObject(v47, 72LL, 7LL);
    *(_OWORD *)(v48 + 16) = xmmword_1000377D0;
    *(void *)(v48 + 56) = v76;
    *(void *)(v48 + 64) = v12;
    *(void *)(v48 + 32) = v7;
    id v49 = v7;
    id v50 = v46;
    os_log(_:dso:log:_:_:)( v45,  &_mh_execute_header,  v50,  "CloudKit record has invalid update number: %@",  45LL,  2LL,  v48);
LABEL_25:

    swift_bridgeObjectRelease(v48);
    goto LABEL_26;
  }

  uint64_t v34 = *(void *)&v82[0];
  uint64_t v35 = CKRecord.subscript.getter(1635017060LL, 0xE400000000000000LL);
  if (!v35
    || (*(void *)&v82[0] = v35, uint64_t v35 = swift_dynamicCast(&v85, v82, v33, &type metadata for Data, 6LL), (v35 & 1) == 0))
  {
    uint64_t v51 = static os_log_type_t.error.getter(v35);
    uint64_t v52 = (void *)*sub_100019B98();
    uint64_t v53 = sub_100012990(&qword_10004DBB0);
    uint64_t v48 = swift_allocObject(v53, 72LL, 7LL);
    *(_OWORD *)(v48 + 16) = xmmword_1000377D0;
    *(void *)(v48 + 56) = v76;
    *(void *)(v48 + 64) = v12;
    *(void *)(v48 + 32) = v7;
    id v54 = v7;
    id v50 = v52;
    os_log(_:dso:log:_:_:)(v51, &_mh_execute_header, v50, "CloudKit record has invalid data: %@", 36LL, 2LL, v48);
    goto LABEL_25;
  }

  __int128 v36 = v85;
  uint64_t v37 = CKRecord.subscript.getter(0x6F635F7972746E65LL, 0xEB00000000746E75LL);
  if (v37
    && (*(void *)&v85 = v37, uint64_t v37 = swift_dynamicCast(v82, &v85, v33, &type metadata for Int64, 6LL), (v37 & 1) != 0))
  {
    uint64_t v38 = *(void *)&v82[0];
    uint64_t v39 = CKRecord.subscript.getter(0x64695F65736162LL, 0xE700000000000000LL);
    if (v39)
    {
      *(void *)&v82[0] = v39;
      uint64_t v39 = swift_dynamicCast(&v85, v82, v33, &type metadata for String, 6LL);
      if ((v39 & 1) != 0)
      {
        __int128 v40 = v85;
        uint64_t v41 = CKRecord.subscript.getter(0x73736572706D6F63LL, 0xEB000000006E6F69LL);
        if (v41)
        {
          *(void *)&v82[0] = v41;
          int v42 = swift_dynamicCast(&v85, v82, v33, &type metadata for String, 6LL);
          if (v42) {
            uint64_t v43 = v85;
          }
          else {
            uint64_t v43 = 0LL;
          }
          if (v42) {
            uint64_t v44 = *((void *)&v85 + 1);
          }
          else {
            uint64_t v44 = 0LL;
          }
        }

        else
        {
          uint64_t v43 = 0LL;
          uint64_t v44 = 0LL;
        }

        sub_100031294( v34,  v36,  *((uint64_t *)&v36 + 1),  v38,  *((uint64_t *)&v36 + 1),  *((uint64_t *)&v40 + 1),  v43,  v44,  &v85);
        __int128 v57 = v85;
        __int128 v58 = v86;
        uint64_t v56 = *((void *)&v87 + 1);
        uint64_t v55 = v87;
        __int128 v59 = v88;
        goto LABEL_27;
      }
    }

    uint64_t v69 = static os_log_type_t.error.getter(v39);
    uint64_t v70 = (void *)*sub_100019B98();
    uint64_t v71 = sub_100012990(&qword_10004DBB0);
    uint64_t v72 = swift_allocObject(v71, 72LL, 7LL);
    *(_OWORD *)(v72 + 16) = xmmword_1000377D0;
    *(void *)(v72 + 56) = v76;
    *(void *)(v72 + 64) = v12;
    *(void *)(v72 + 32) = v7;
    id v73 = v70;
    id v74 = v7;
    os_log(_:dso:log:_:_:)(v69, &_mh_execute_header, v73, "CloudKit record has invalid uuid: %@", 36LL, 2LL, v72);

    swift_bridgeObjectRelease(v72);
    sub_1000106F8(v36, *((unint64_t *)&v36 + 1));
  }

  else
  {
    uint64_t v63 = static os_log_type_t.error.getter(v37);
    uint64_t v64 = (void *)*sub_100019B98();
    uint64_t v65 = sub_100012990(&qword_10004DBB0);
    uint64_t v66 = swift_allocObject(v65, 72LL, 7LL);
    *(_OWORD *)(v66 + 16) = xmmword_1000377D0;
    *(void *)(v66 + 56) = v76;
    *(void *)(v66 + 64) = v12;
    *(void *)(v66 + 32) = v7;
    id v67 = v7;
    id v68 = v64;
    os_log(_:dso:log:_:_:)(v63, &_mh_execute_header, v68, "CloudKit record has invalid entryCount: %@", 42LL, 2LL, v66);

    swift_bridgeObjectRelease(v66);
    sub_1000106F8(v36, *((unint64_t *)&v36 + 1));
  }

LABEL_26:
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  __int128 v57 = 0uLL;
  __int128 v58 = 0uLL;
  __int128 v59 = 0uLL;
LABEL_27:
  v78[0] = v57;
  v78[1] = v58;
  uint64_t v79 = v55;
  uint64_t v80 = v56;
  __int128 v81 = v59;
  sub_10002A3C4(a2, 0);
  sub_10002A73C((uint64_t)v78, (uint64_t)v82, &qword_10004E700);
  if (*((void *)&v83 + 1))
  {
    __int128 v85 = v82[0];
    __int128 v86 = v82[1];
    __int128 v87 = v83;
    __int128 v88 = v84;
    v75(&v85);
    sub_10002A3C4(a2, 0);
    sub_10002A3D0((uint64_t)v78);
    return;
  }

  unint64_t v60 = sub_1000294A8();
  uint64_t v61 = swift_allocError(&type metadata for CloudKitError, v60, 0LL, 0LL);
  *uint64_t v62 = 2;
  sub_10002A3C4(a2, 0);
  swift_beginAccess(v5, &v85, 1LL, 0LL);
  uint64_t v30 = *v5;
  *uint64_t v5 = v61;
LABEL_30:
  swift_errorRelease(v30);
}

uint64_t sub_100029D08()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100029D34(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return sub_100029D6C( a1,  a2,  a3,  a4,  a5,  "Got updated update sync token: %@",  33LL,  "Update sync completion error: %@",  32LL);
}

uint64_t sub_100029D6C( uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, const char *a6, uint64_t a7, const char *a8, uint64_t a9)
{
  if ((a5 & 0x100) == 0)
  {
    uint64_t v12 = *(void *)(v9 + 16);
    id v13 = a2;
    uint64_t v14 = static os_log_type_t.info.getter(v13);
    uint64_t v15 = (void *)*sub_100019B98();
    uint64_t v16 = sub_100012990(&qword_10004DBB0);
    uint64_t v17 = swift_allocObject(v16, 72LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_1000377D0;
    id v18 = v15;
    id v19 = [v13 data];
    uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v19);
    unint64_t v22 = v21;

    Swift::String v23 = Data.base64EncodedString(options:)(0LL);
    sub_1000106F8(v20, v22);
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_1000139FC();
    *(Swift::String *)(v17 + 32) = v23;
    os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v18, a6, a7, 2LL, v17);
    swift_bridgeObjectRelease(v17);

    id v24 = [v13 data];
    uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v24);
    uint64_t v27 = v26;

    swift_beginAccess(v12 + 16, v57, 1LL, 0LL);
    uint64_t v28 = *(void *)(v12 + 16);
    unint64_t v29 = *(void *)(v12 + 24);
    *(void *)(v12 + 16) = v25;
    *(void *)(v12 + 24) = v27;
    return sub_100010BA4(v28, v29);
  }

  uint64_t v56 = (uint64_t *)(*(void *)(v9 + 24) + 16LL);
  uint64_t v35 = swift_errorRetain(a2);
  uint64_t v36 = static os_log_type_t.error.getter(v35);
  uint64_t v37 = (void *)*sub_100019B98();
  uint64_t v38 = sub_100012990(&qword_10004DBB0);
  uint64_t v39 = swift_allocObject(v38, 72LL, 7LL);
  *(_OWORD *)(v39 + 16) = xmmword_1000377D0;
  v57[0] = a2;
  sub_10002A2B8(a2, a3, a4, a5, 1);
  id v40 = v37;
  unint64_t v55 = a4;
  uint64_t v41 = sub_100012990(&qword_10004DDA0);
  uint64_t v53 = a3;
  uint64_t v42 = String.init<A>(describing:)(v57, v41);
  uint64_t v44 = v43;
  *(void *)(v39 + 56) = &type metadata for String;
  *(void *)(v39 + 64) = sub_1000139FC();
  *(void *)(v39 + 32) = v42;
  *(void *)(v39 + 40) = v44;
  os_log(_:dso:log:_:_:)(v36, &_mh_execute_header, v40, a8, a9, 2LL, v39);
  swift_bridgeObjectRelease(v39);

  v57[0] = a2;
  swift_errorRetain(a2);
  type metadata accessor for CKError(0LL);
  uint64_t v46 = v45;
  if (!swift_dynamicCast(&v58, v57, v41, v45, 6LL))
  {
    id v49 = v56;
LABEL_8:
    swift_beginAccess(v49, v57, 1LL, 0LL);
    uint64_t v52 = *v49;
    *id v49 = (uint64_t)a2;
    return swift_errorRelease(v52);
  }

  uint64_t v47 = v58;
  uint64_t v48 = sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
  _BridgedStoredNSError.code.getter(v57, v46, v48);
  id v49 = v56;
  if (v57[0] != 21LL)
  {

    goto LABEL_8;
  }

  unint64_t v50 = sub_10002A300();
  uint64_t v51 = swift_allocError(&type metadata for CloudKitOperationsError, v50, 0LL, 0LL);
  sub_10002A344(a2, v53, v55, a5, 1);

  swift_beginAccess(v56, v57, 1LL, 0LL);
  uint64_t v52 = *v56;
  *uint64_t v56 = v51;
  return swift_errorRelease(v52);
}

unint64_t sub_10002A0F8()
{
  unint64_t result = qword_10004E5E8;
  if (!qword_10004E5E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000389EC, &type metadata for CloudKitError);
    atomic_store(result, (unint64_t *)&qword_10004E5E8);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for CloudKitError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

uint64_t storeEnumTagSinglePayload for CloudKitError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_10002A218 + 4 * byte_1000389E5[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10002A24C + 4 * byte_1000389E0[v4]))();
}

uint64_t sub_10002A24C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002A254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002A25CLL);
  }
  return result;
}

uint64_t sub_10002A268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10002A270LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10002A274(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002A27C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CloudKitError()
{
  return &type metadata for CloudKitError;
}

uint64_t type metadata accessor for CloudKitOperations()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent18CloudKitOperations);
}

uint64_t sub_10002A2B8(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0) {
    return swift_errorRetain(a1);
  }
  id v8 = a1;
  return sub_10001073C(a2, a3);
}

void type metadata accessor for CKError(uint64_t a1)
{
}

unint64_t sub_10002A300()
{
  unint64_t result = qword_10004E6E0;
  if (!qword_10004E6E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100039014, &type metadata for CloudKitOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004E6E0);
  }

  return result;
}

uint64_t sub_10002A344(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0) {
    return swift_errorRelease(a1);
  }

  return sub_100010BA4(a2, a3);
}

uint64_t sub_10002A378(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = sub_10002A704(255LL, a2, a3);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }

  return result;
}

id sub_10002A3B8(void *a1, char a2)
{
  if ((a2 & 1) != 0) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_10002A3C4(void *a1, char a2)
{
  if ((a2 & 1) != 0) {
    swift_errorRelease(a1);
  }
  else {
}
  }

uint64_t sub_10002A3D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002A408( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6)
  {
    sub_1000106F8(a2, a3);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a8);
  }

  return result;
}

unint64_t sub_10002A448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    sub_10002A704(0LL, &qword_10004E788, &OBJC_CLASS___CKRecordZoneID_ptr);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

id sub_10002A560()
{
  __int16 v1 = v0;
  sub_100012990(&qword_10004E790);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    id v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }

  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

uint64_t sub_10002A704(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10002A73C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100012990(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002A780()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255) {
    sub_10002A3C4(*(void **)(v0 + 16), v1 & 1);
  }
  return swift_deallocObject(v0, 25LL, 7LL);
}

id sub_10002A7B4(uint64_t a1, void *a2, char a3)
{
  uint64_t v6 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a2;
  unsigned __int8 v7 = *(_BYTE *)(v3 + 24);
  a3 &= 1u;
  *(_BYTE *)(v3 + 24) = a3;
  sub_10002A834(v6, v7);
  return sub_10002A3B8(a2, a3);
}

id sub_10002A81C(id result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_10002A3B8(result, a2 & 1);
  }
  return result;
}

void sub_10002A834(void *a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_10002A3C4(a1, a2 & 1);
  }
}

uint64_t sub_10002A84C()
{
  return sub_1000165E4( &qword_10004E7B8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038B24);
}

uint64_t sub_10002A878()
{
  return sub_1000165E4( &qword_10004E7C0,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038B50);
}

uint64_t sub_10002A8A4()
{
  return sub_1000165E4( &qword_10004E7C8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C0C);
}

uint64_t sub_10002A8D0()
{
  return sub_1000165E4( &qword_10004E7D0,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038BD8);
}

uint64_t sub_10002A8FC()
{
  return sub_1000165E4( &qword_10004E7D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038B94);
}

uint64_t sub_10002A928()
{
  return sub_1000165E4( &qword_10004E7E0,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100038CF8);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_10002A968()
{
  return sub_1000165E4( &qword_10004E7E8,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100038CBC);
}

unint64_t sub_10002A998()
{
  unint64_t result = qword_10004E7F0;
  if (!qword_10004E7F0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10004E7F0);
  }

  return result;
}

uint64_t sub_10002A9DC()
{
  return sub_1000165E4( &qword_10004E7F8,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100038D34);
}

uint64_t sub_10002AA08()
{
  return sub_1000165E4( &qword_10004E6D8,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_100038C50);
}

uint64_t sub_10002AA34()
{
  uint64_t v0 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100012990(&qword_10004E770);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  sub_100014EA8(v7, qword_100051618);
  sub_1000148EC(v7, (uint64_t)qword_100051618);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v6, 1LL, 1LL, v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))( v3,  enum case for URL.DirectoryHint.inferFromPath(_:),  v0);
  return URL.init(filePath:directoryHint:relativeTo:)(0xD00000000000001ALL, 0x800000010003C440LL, v3, v6);
}

void sub_10002AB5C()
{
  qword_100051630 = 0x6C69666D6F6F6C62LL;
  *(void *)algn_100051638 = 0xEF6E69622E726574LL;
}

uint64_t sub_10002AB8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess(v3, v6, 0LL, 0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t sub_10002ABF0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  swift_beginAccess(v3, v6, 33LL, 0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(v3, a1, v4);
  return swift_endAccess(v6);
}

uint64_t (*sub_10002AC5C(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

id sub_10002ACA0()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db, v3, 0LL, 0LL);
  return *v1;
}

void sub_10002ACE4(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db);
  swift_beginAccess(v3, v5, 1LL, 0LL);
  uint64_t v4 = *v3;
  char *v3 = a1;
}

uint64_t (*sub_10002AD34(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

uint64_t sub_10002AD78()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  swift_beginAccess(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter, v3, 0LL, 0LL);
  return swift_retain(*v1);
}

uint64_t sub_10002ADC0(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  swift_beginAccess(v3, v6, 1LL, 0LL);
  uint64_t v4 = *v3;
  uint64_t *v3 = a1;
  return swift_release(v4);
}

uint64_t (*sub_10002AE10(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

uint64_t sub_10002AE54@<X0>(uint64_t a1@<X8>)
{
  return sub_10002AEC4(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit, a1);
}

uint64_t sub_10002AE60(uint64_t a1)
{
  return sub_10002AF24( a1,  &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit,  (void (*)(uint64_t, void *))sub_100021E24);
}

uint64_t (*sub_10002AE74(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

uint64_t sub_10002AEB8@<X0>(uint64_t a1@<X8>)
{
  return sub_10002AEC4(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager, a1);
}

uint64_t sub_10002AEC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess(v4, v6, 0LL, 0LL);
  return sub_10002ED5C(v4, a2);
}

uint64_t sub_10002AF10(uint64_t a1)
{
  return sub_10002AF24( a1,  &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager,  (void (*)(uint64_t, void *))sub_100021E24);
}

uint64_t sub_10002AF24(uint64_t a1, void *a2, void (*a3)(uint64_t, void *))
{
  uint64_t v6 = (void *)(v3 + *a2);
  swift_beginAccess(v6, v8, 33LL, 0LL);
  sub_100012A9C(v6);
  a3(a1, v6);
  return swift_endAccess(v8);
}

uint64_t (*sub_10002AF8C(uint64_t a1))(void)
{
  return j__swift_endAccess;
}

uint64_t sub_10002AFD0@<X0>(uint64_t a1@<X8>)
{
  return sub_10002AEC4(&OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics, a1);
}

uint64_t sub_10002AFDC(uint64_t a1)
{
  return sub_10002AF24( a1,  &OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics,  (void (*)(uint64_t, void *))sub_100021E24);
}

uint64_t (*sub_10002AFF0(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

uint64_t sub_10002B034(void *a1, void *a2)
{
  id v29 = a1;
  uint64_t v4 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000511D0 != -1) {
    swift_once(&qword_1000511D0, sub_10002AA34);
  }
  sub_1000148EC(v8, (uint64_t)qword_100051618);
  v28[0] = 0xD000000000000011LL;
  v28[1] = 0x800000010003C010LL;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))( v7,  enum case for URL.DirectoryHint.inferFromPath(_:),  v4);
  unint64_t v12 = sub_10002EDA0();
  URL.appending<A>(path:directoryHint:)(v28, v7, &type metadata for String, v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = [(id)objc_opt_self(NSFileManager) defaultManager];
  URL.path.getter();
  uint64_t v15 = v14;
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  LODWORD(v15) = [v13 fileExistsAtPath:v16];

  if (!(_DWORD)v15)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v21 = 0LL;
LABEL_7:
    sub_10002ED5C((uint64_t)a2, (uint64_t)v28);
    uint64_t v18 = (*(uint64_t (**)(id, uint64_t, void *))(v27 + 272))(v29, v21, v28);
    sub_100012A9C(a2);
    return v18;
  }

  uint64_t v17 = type metadata accessor for PropertyListDecoder(0LL);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  uint64_t v18 = PropertyListDecoder.init()();
  uint64_t v19 = Data.init(contentsOf:options:)(v11, 0LL);
  if (!v2)
  {
    uint64_t v22 = v19;
    unint64_t v23 = v20;
    uint64_t v24 = type metadata accessor for BloomFilter();
    uint64_t v25 = sub_10002EFDC(&qword_10004E878, (uint64_t)&unk_100038674);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v28, v24, v22, v23, v24, v25);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_1000106F8(v22, v23);
    swift_release(v18);
    uint64_t v21 = v28[0];
    goto LABEL_7;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  swift_release(v18);
  sub_100012A9C(a2);
  return v18;
}

uint64_t sub_10002B348(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_10002EDE4(a1, a2, a3);

  swift_release(a2);
  return v7;
}

uint64_t sub_10002B3AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v11 = sub_100012990(&qword_10004E520);
  __chkstk_darwin(v11);
  id v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v70 = a3;
  __srCC_SHA256_CTX c = bswap32(a3);
  uint64_t v73 = sub_10001187C(&__src, &v73);
  uint64_t v74 = v14 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v15 = a1;
  uint64_t v71 = a2;
  uint64_t v16 = Data.append(_:)(a1, a2);
  uint64_t v17 = v73;
  unint64_t v18 = v74;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 176LL))(v16);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v69 = a4;
    char v21 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v19 + 168LL))(v17, v18);
    if (v5)
    {
      swift_release(v20);
      return sub_1000106F8(v17, v18);
    }

    else
    {
      unint64_t v67 = v18;
      uint64_t v68 = 0LL;
      uint64_t v66 = v17;
      BOOL v26 = sub_10001D3C0(v21 & 1, 1);
      if (v26)
      {
        uint64_t v27 = static os_log_type_t.default.getter(v26);
        uint64_t v28 = (void *)*sub_100019C48();
        uint64_t v29 = sub_100012990(&qword_10004DBB0);
        uint64_t v30 = swift_allocObject(v29, 112LL, 7LL);
        *(_OWORD *)(v30 + 16) = xmmword_1000377F0;
        *(void *)(v30 + 56) = &type metadata for UInt32;
        *(void *)(v30 + 64) = &protocol witness table for UInt32;
        *(_DWORD *)(v30 + 32) = v70;
        id v31 = v28;
        sub_100012758(v15, v71);
        uint64_t v33 = v32;
        uint64_t v35 = v34;
        *(void *)(v30 + 96) = &type metadata for String;
        *(void *)(v30 + 104) = sub_1000139FC();
        *(void *)(v30 + 72) = v33;
        *(void *)(v30 + 80) = v35;
        os_log(_:dso:log:_:_:)( v27,  &_mh_execute_header,  v31,  "Item not present in bloom filter: %d, %@",  40LL,  2LL,  v30);
        swift_release(v20);
        sub_1000106F8(v66, v67);

        swift_bridgeObjectRelease(v30);
        uint64_t v36 = type metadata accessor for LaunchWarningDetails(0LL);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56LL))( v69,  1LL,  1LL,  v36);
      }

      else
      {
        (*(void (**)(uint64_t *__return_ptr))(*(void *)v6 + 200LL))(&v73);
        uint64_t v37 = v75;
        uint64_t v38 = v76;
        sub_100012A78(&v73, v75);
        uint64_t v39 = v15;
        uint64_t v40 = v15;
        unsigned int v41 = v70;
        uint64_t v42 = v68;
        (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v38 + 8))(v40, v71, v70, v37, v38);
        if (v42)
        {
          swift_release(v20);
          sub_1000106F8(v66, v67);
          return sub_100012A9C(&v73);
        }

        else
        {
          uint64_t v68 = 0LL;
          uint64_t v43 = type metadata accessor for LaunchWarningDetails(0LL);
          uint64_t v44 = *(void *)(v43 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v13, 1LL, v43) == 1)
          {
            sub_100021890((uint64_t)v13, &qword_10004E520);
            uint64_t v45 = sub_100012A9C(&v73);
            uint64_t v46 = static os_log_type_t.default.getter(v45);
            uint64_t v47 = (void *)*sub_100019C48();
            uint64_t v48 = sub_100012990(&qword_10004DBB0);
            uint64_t v49 = swift_allocObject(v48, 112LL, 7LL);
            *(_OWORD *)(v49 + 16) = xmmword_1000377F0;
            *(void *)(v49 + 56) = &type metadata for UInt32;
            *(void *)(v49 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v49 + 32) = v41;
            id v50 = v47;
            sub_100012758(v39, v71);
            uint64_t v52 = v51;
            uint64_t v54 = v53;
            *(void *)(v49 + 96) = &type metadata for String;
            *(void *)(v49 + 104) = sub_1000139FC();
            *(void *)(v49 + 72) = v52;
            *(void *)(v49 + 80) = v54;
            os_log(_:dso:log:_:_:)(v46, &_mh_execute_header, v50, "No launch warning present: %d, %@", 33LL, 2LL, v49);
            swift_release(v20);
            sub_1000106F8(v66, v67);

            swift_bridgeObjectRelease(v49);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v69, 1LL, 1LL, v43);
          }

          else
          {
            uint64_t v55 = v69;
            sub_100020C5C((uint64_t)v13, v69, type metadata accessor for LaunchWarningDetails);
            uint64_t v56 = sub_100012A9C(&v73);
            HIDWORD(v65) = static os_log_type_t.default.getter(v56);
            __int128 v57 = (void *)*sub_100019C48();
            uint64_t v58 = sub_100012990(&qword_10004DBB0);
            uint64_t v59 = swift_allocObject(v58, 112LL, 7LL);
            *(_OWORD *)(v59 + 16) = xmmword_1000377F0;
            *(void *)(v59 + 56) = &type metadata for UInt32;
            *(void *)(v59 + 64) = &protocol witness table for UInt32;
            *(_DWORD *)(v59 + 32) = v41;
            id v60 = v57;
            sub_100012758(v39, v71);
            uint64_t v62 = v61;
            uint64_t v64 = v63;
            *(void *)(v59 + 96) = &type metadata for String;
            *(void *)(v59 + 104) = sub_1000139FC();
            *(void *)(v59 + 72) = v62;
            *(void *)(v59 + 80) = v64;
            os_log(_:dso:log:_:_:)( HIDWORD(v65),  &_mh_execute_header,  v60,  "Launch warning found: %d, %@",  28LL,  2LL,  v59);
            swift_release(v20);
            sub_1000106F8(v66, v67);

            swift_bridgeObjectRelease(v59);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v55, 0LL, 1LL, v43);
          }
        }
      }
    }
  }

  else
  {
    uint64_t v23 = static os_log_type_t.error.getter(0LL);
    id v24 = (id)*sub_100019C48();
    os_log(_:dso:log:_:_:)( v23,  &_mh_execute_header,  v24,  "No bloom filter configured.",  27LL,  2LL,  &_swiftEmptyArrayStorage);
    sub_1000106F8(v17, v18);

    uint64_t v25 = type metadata accessor for LaunchWarningDetails(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))( a4,  1LL,  1LL,  v25);
  }

uint64_t sub_10002B924()
{
  void (*v42)(id *__return_ptr);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  void *v67;
  void *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  void *v78;
  os_log_type_t v79;
  os_log_s *v80;
  uint8_t *v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  void *v87;
  void *v88;
  unsigned int v89;
  id v90;
  id v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(void);
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(void, void, void, void, void, void);
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  id v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  void (*v137)(char *, uint64_t);
  uint64_t v138;
  uint64_t v139;
  os_log_type_t v140;
  void *v141;
  os_log_s *v142;
  uint8_t *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  NSURL *v153;
  void *v154;
  void *v155;
  NSURL *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  unsigned int v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  id v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(id *__return_ptr);
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  id v185;
  unint64_t v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  int *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t *v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  uint64_t v239;
  void *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t (*v251)(uint64_t);
  uint64_t v252;
  uint64_t v253;
  uint64_t (*v254)(void);
  void *v255;
  char *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void (*v269)(char *, uint64_t);
  void (*v270)(char *, uint64_t);
  unint64_t v271;
  unsigned int v272;
  void (*v273)(char *, void, uint64_t);
  void (*v274)(void);
  uint64_t *v275;
  uint64_t *v276;
  unint64_t v277;
  __int128 v278;
  uint64_t v279;
  void (*v280)(char *, uint64_t);
  uint64_t v281;
  uint64_t v282;
  char *v283;
  uint64_t v284;
  char *v285;
  uint64_t *v286;
  char *v287;
  uint64_t v288;
  void (**v289)(char *, uint64_t);
  uint64_t v290;
  char *v291;
  uint64_t v292;
  char *v293;
  char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  char *v302;
  char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void (*v308)(id *__return_ptr);
  uint64_t v309;
  char *v310;
  uint64_t (*v311)(void);
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  char v317[8];
  id v318;
  unint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v1 = v0;
  uint64_t v2 = sub_100012990(&qword_10004E5A0);
  __chkstk_darwin(v2);
  v299 = (uint64_t)&v270 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v298 = type metadata accessor for DocumentCheckerRecord(0LL);
  v297 = *(void *)(v298 - 8);
  __chkstk_darwin(v298);
  v295 = (uint64_t)&v270 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v292 = type metadata accessor for Algorithm(0LL);
  v291 = *(char **)(v292 - 8);
  __chkstk_darwin(v292);
  v287 = (char *)&v270 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100012990(&qword_10004E880);
  uint64_t v7 = __chkstk_darwin(v6);
  v290 = (uint64_t)&v270 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  v289 = (void (**)(char *, uint64_t))((char *)&v270 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  v288 = (uint64_t)&v270 - v12;
  __chkstk_darwin(v11);
  v300 = (uint64_t)&v270 - v13;
  v305 = type metadata accessor for URL.DirectoryHint(0LL);
  v301 = *(void *)(v305 - 8);
  __chkstk_darwin(v305);
  v303 = (char *)&v270 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v307 = type metadata accessor for URL(0LL);
  v304 = *(void *)(v307 - 8);
  uint64_t v15 = __chkstk_darwin(v307);
  v294 = (char *)&v270 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v15);
  v283 = (char *)&v270 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v285 = (char *)&v270 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v302 = (char *)&v270 - v22;
  __chkstk_darwin(v21);
  v293 = (char *)&v270 - v23;
  uint64_t v24 = sub_100012990(&qword_10004E5A8);
  __chkstk_darwin(v24);
  BOOL v26 = (char *)&v270 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v309 = type metadata accessor for BloomFilterRecord(0LL);
  v306 = *(void *)(v309 - 8);
  __chkstk_darwin(v309);
  v310 = (char *)&v270 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v296 = type metadata accessor for BaseZoneSyncResult(0LL);
  uint64_t v28 = __chkstk_darwin(v296);
  uint64_t v30 = (char *)&v270 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v33 = (char *)&v270 - v32;
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v270 - v34;
  uint64_t v36 = swift_allocObject(&unk_1000476B8, 24LL, 7LL);
  v314 = v36;
  *(void *)(v36 + 16) = 0LL;
  v284 = v36 + 16;
  uint64_t v37 = swift_allocObject(&unk_1000476E0, 24LL, 7LL);
  v315 = v37;
  *(void *)(v37 + 16) = 0LL;
  v286 = (uint64_t *)(v37 + 16);
  v311 = *(uint64_t (**)(void))(*(void *)v0 + 152LL);
  uint64_t v38 = (void *)v311();
  id v39 = sub_1000185DC();
  unint64_t v41 = v40;

  uint64_t v42 = *(void (**)(id *__return_ptr))(*(void *)v1 + 200LL);
  v313 = v1;
  v308 = v42;
  v42(&v318);
  uint64_t v43 = v320;
  uint64_t v44 = v321;
  sub_100012A78(&v318, v320);
  uint64_t v45 = v312;
  (*(void (**)(id, unint64_t, uint64_t, uint64_t))(v44 + 16))(v39, v41, v43, v44);
  if (v45)
  {
    sub_100010BA4((uint64_t)v39, v41);
    sub_100012A9C(&v318);
    v316 = v45;
    swift_errorRetain(v45);
    uint64_t v46 = sub_100012990(&qword_10004DDA0);
    if (!swift_dynamicCast(v46, &v316, v46, &type metadata for CloudKitOperationsError, 0LL))
    {
      swift_errorRelease(v316);
      swift_release(v314);
      return swift_release(v315);
    }

    uint64_t v47 = swift_errorRelease(v45);
    uint64_t v48 = v313;
    uint64_t v49 = (void *)((uint64_t (*)(uint64_t))v311)(v47);
    sub_10001861C();

    v308(&v318);
    id v50 = v320;
    uint64_t v51 = v321;
    sub_100012A78(&v318, v320);
    (*(void (**)(void, unint64_t, uint64_t, uint64_t))(v51 + 16))(0LL, 0xF000000000000000LL, v50, v51);
    uint64_t v52 = 0LL;
    v312 = v45;
    uint64_t v53 = (uint64_t)v35;
    sub_100020C5C((uint64_t)v30, (uint64_t)v35, type metadata accessor for BaseZoneSyncResult);
    sub_100012A9C(&v318);
    swift_errorRelease(v316);
  }

  else
  {
    sub_100010BA4((uint64_t)v39, v41);
    sub_100020C5C((uint64_t)v33, (uint64_t)v35, type metadata accessor for BaseZoneSyncResult);
    sub_100012A9C(&v318);
    v312 = 0LL;
    uint64_t v52 = 0LL;
    uint64_t v53 = (uint64_t)v35;
    uint64_t v48 = v313;
  }

  sub_100020048(v53, (uint64_t)v26, &qword_10004E5A8);
  uint64_t v54 = (int *)v309;
  LODWORD(v306) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v306 + 48))(v26, 1LL, v309);
  uint64_t v55 = v310;
  v282 = v53;
  if ((_DWORD)v306 == 1)
  {
    sub_100021890((uint64_t)v26, &qword_10004E5A8);
  }

  else
  {
    v281 = 0LL;
    uint64_t v56 = sub_100020C5C((uint64_t)v26, (uint64_t)v310, type metadata accessor for BloomFilterRecord);
    __int128 v57 = static os_log_type_t.default.getter(v56);
    uint64_t v58 = (void *)*sub_100019B98();
    v279 = sub_100012990(&qword_10004DBB0);
    uint64_t v59 = swift_allocObject(v279, 72LL, 7LL);
    v278 = xmmword_1000377D0;
    *(_OWORD *)(v59 + 16) = xmmword_1000377D0;
    id v60 = (uint64_t *)&v55[v54[9]];
    uint64_t v62 = *v60;
    uint64_t v61 = v60[1];
    v276 = v60;
    *(void *)(v59 + 56) = &type metadata for String;
    v277 = sub_1000139FC();
    *(void *)(v59 + 64) = v277;
    *(void *)(v59 + 32) = v62;
    *(void *)(v59 + 40) = v61;
    uint64_t v63 = v58;
    swift_bridgeObjectRetain(v61);
    os_log(_:dso:log:_:_:)(v57, &_mh_execute_header, v63, "Setting up new base filter: %@", 30LL, 2LL, v59);

    uint64_t v64 = v313;
    uint64_t v65 = swift_bridgeObjectRelease(v59);
    uint64_t v66 = v311;
    unint64_t v67 = (void *)((uint64_t (*)(uint64_t))v311)(v65);
    sub_100018808();

    uint64_t v68 = (void *)v66();
    uint64_t v69 = &v55[v54[7]];
    unsigned int v70 = *((void *)v69 + 1);
    swift_bridgeObjectRetain(v70);
    sub_1000188F4();

    uint64_t v71 = swift_bridgeObjectRelease(v70);
    uint64_t v72 = (void *)((uint64_t (*)(uint64_t))v66)(v71);
    uint64_t v73 = *(void *)&v55[v54[8] + 8];
    v275 = (uint64_t *)&v55[v54[8]];
    swift_bridgeObjectRetain(v73);
    sub_10001868C();

    uint64_t v74 = swift_bridgeObjectRelease(v73);
    uint64_t v75 = (*(uint64_t (**)(uint64_t))(*(void *)v64 + 176LL))(v74);
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = static os_log_type_t.info.getter(v75);
      id v78 = (void *)*sub_100019C48();
      uint64_t v79 = v77;
      if (os_log_type_enabled((os_log_t)v78, v77))
      {
        swift_retain_n(v76, 2LL);
        uint64_t v80 = v78;
        __int128 v81 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v82 = (void *)swift_slowAlloc(32LL, -1LL);
        *(_DWORD *)__int128 v81 = 136315138;
        v318 = v82;
        __int128 v83 = URL.path.getter();
        __int128 v85 = v84;
        v316 = sub_100023424(v83, v84, (uint64_t *)&v318);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v316, v317, v81 + 4);
        swift_release_n(v76, 2LL);
        swift_bridgeObjectRelease(v85);
        _os_log_impl((void *)&_mh_execute_header, v80, v79, "Removing old bloom filter: %s", v81, 0xCu);
        swift_arrayDestroy(v82, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v82, -1LL, -1LL);
        swift_slowDealloc(v81, -1LL, -1LL);
      }

      __int128 v86 = [(id)objc_opt_self(NSFileManager) defaultManager];
      URL._bridgeToObjectiveC()(*(NSURL **)(v76 + 40));
      __int128 v88 = v87;
      v318 = 0LL;
      uint64_t v89 = [v86 removeItemAtURL:v87 error:&v318];

      uint64_t v90 = v318;
      if (!v89)
      {
        v148 = v318;
        _convertNSErrorToError(_:)(v90);

        swift_willThrow(v149);
        swift_release(v76);
        goto LABEL_27;
      }

      id v91 = v318;
      swift_release(v76);
      uint64_t v64 = v313;
      uint64_t v55 = v310;
    }

    uint64_t v92 = v302;
    v274 = *(void (**)(void))(*(void *)v64 + 128LL);
    v274();
    if (qword_1000511D8 != -1) {
      swift_once(&qword_1000511D8, sub_10002AB5C);
    }
    id v93 = *(void *)algn_100051638;
    v318 = (id)qword_100051630;
    v319 = *(void *)algn_100051638;
    id v94 = v301;
    uint64_t v95 = *(void (**)(void))(v301 + 104);
    uint64_t v96 = v303;
    v272 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v97 = v305;
    v273 = (void (*)(char *, void, uint64_t))v95;
    v95(v303);
    uint64_t v98 = sub_10002EDA0();
    swift_bridgeObjectRetain(v93);
    uint64_t v99 = (uint64_t)v293;
    v271 = v98;
    URL.appending<A>(path:directoryHint:)(&v318, v96, &type metadata for String, v98);
    v270 = *(void (**)(char *, uint64_t))(v94 + 8);
    v270(v96, v97);
    swift_bridgeObjectRelease(v319);
    v280 = *(void (**)(char *, uint64_t))(v304 + 8);
    v280(v92, v307);
    uint64_t v100 = v291;
    uint64_t v101 = v300;
    uint64_t v102 = v292;
    (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v291 + 7))(v300, 1LL, 1LL, v292);
    uint64_t v103 = (uint64_t *)&v55[*(int *)(v309 + 48)];
    uint64_t v104 = v103[1];
    unint64_t v105 = v281;
    if (v104)
    {
      id v106 = v69;
      uint64_t v107 = *v103;
      swift_bridgeObjectRetain(v103[1]);
      uint64_t v108 = v288;
      sub_100019CE4(v107, v104, v288);
      sub_100021890(v101, &qword_10004E880);
      sub_10002F060(v108, v101);
      uint64_t v109 = (void (*)(void, void, void, void, void, void))v289;
      sub_100020048(v101, (uint64_t)v289, &qword_10004E880);
      if ((*((unsigned int (**)(void (*)(void, void, void, void, void, void), uint64_t, uint64_t))v100
            + 6))( v109,  1LL,  v102) == 1)
      {
        uint64_t v110 = sub_100021890((uint64_t)v109, &qword_10004E880);
        uint64_t v111 = static os_log_type_t.error.getter(v110);
        v112 = (void *)*sub_100019C48();
        id v113 = v99;
        v114 = swift_allocObject(v279, 72LL, 7LL);
        *(_OWORD *)(v114 + 16) = v278;
        __int16 v115 = v277;
        *(void *)(v114 + 56) = &type metadata for String;
        *(void *)(v114 + 64) = v115;
        *(void *)(v114 + 32) = v107;
        *(void *)(v114 + 40) = v104;
        swift_bridgeObjectRetain(v104);
        v116 = v112;
        os_log(_:dso:log:_:_:)( v111,  &_mh_execute_header,  v116,  "Update asset had invalid compression type: %@",  45LL,  2LL,  v114);

        swift_bridgeObjectRelease(v114);
        __int16 v117 = sub_10002F01C();
        id v118 = swift_allocError(&type metadata for LaunchWarningControllerError, v117, 0LL, 0LL);
        *(void *)v119 = v107;
        *(void *)(v119 + _Block_object_dispose((const void *)(v1 - 112), 8) = v104;
        *(_BYTE *)(v119 + 16) = 1;
        swift_willThrow(v118);
        sub_100021890(v101, &qword_10004E880);
        v120 = (char *)v113;
LABEL_16:
        v280(v120, v307);
LABEL_27:
        v150 = (uint64_t)v310;
LABEL_49:
        sub_100014850(v150, type metadata accessor for BloomFilterRecord);
        sub_100014850(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v314);
        return swift_release(v315);
      }

      swift_bridgeObjectRelease(v104);
      sub_100021890((uint64_t)v109, &qword_10004E880);
      uint64_t v55 = v310;
      uint64_t v69 = v106;
      unint64_t v105 = v281;
    }

    v151 = v290;
    sub_100020048(v101, v290, &qword_10004E880);
    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v100 + 6))(v151, 1LL, v102) == 1)
    {
      sub_100021890(v151, &qword_10004E880);
      v152 = [(id)objc_opt_self(NSFileManager) defaultManager];
      URL._bridgeToObjectiveC()(v153);
      v155 = v154;
      URL._bridgeToObjectiveC()(v156);
      v158 = v157;
      v318 = 0LL;
      v159 = v99;
      v160 = [v152 copyItemAtURL:v155 toURL:v157 error:&v318];

      v161 = v318;
      if (!v160)
      {
        v199 = v318;
        _convertNSErrorToError(_:)(v161);

        swift_willThrow(v200);
        sub_100021890(v300, &qword_10004E880);
        v201 = v159;
        v202 = v307;
LABEL_48:
        v280((char *)v201, v202);
        v150 = (uint64_t)v55;
        goto LABEL_49;
      }

      v162 = v318;
      v163 = v307;
      uint64_t v101 = v300;
      uint64_t v99 = v159;
    }

    else
    {
      v164 = (uint64_t)v287;
      (*((void (**)(char *, uint64_t, uint64_t))v100 + 4))(v287, v151, v102);
      sub_100019DF8(v55, v99, v164);
      if (v105)
      {
        v166 = static os_log_type_t.error.getter(v165);
        v167 = v99;
        v168 = (void *)*sub_100019C48();
        v169 = swift_allocObject(v279, 72LL, 7LL);
        *(_OWORD *)(v169 + 16) = v278;
        v170 = *v276;
        v171 = v276[1];
        v172 = v277;
        *(void *)(v169 + 56) = &type metadata for String;
        *(void *)(v169 + 64) = v172;
        *(void *)(v169 + 32) = v170;
        *(void *)(v169 + 40) = v171;
        v173 = v168;
        swift_bridgeObjectRetain(v171);
        os_log(_:dso:log:_:_:)(v166, &_mh_execute_header, v173, "Base asset had invalid payload: %@", 34LL, 2LL, v169);

        swift_bridgeObjectRelease(v169);
        v174 = sub_10002F01C();
        v175 = swift_allocError(&type metadata for LaunchWarningControllerError, v174, 0LL, 0LL);
        *(void *)v176 = 0LL;
        *(void *)(v176 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
        *(_BYTE *)(v176 + 16) = 2;
        swift_willThrow(v175);
        swift_errorRelease(v105);
        (*((void (**)(char *, uint64_t))v100 + 1))(v287, v102);
        sub_100021890(v300, &qword_10004E880);
        v280((char *)v167, v307);
        sub_100014850((uint64_t)v55, type metadata accessor for BloomFilterRecord);
LABEL_54:
        sub_100014850(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v314);
        return swift_release(v315);
      }

      (*((void (**)(uint64_t, uint64_t))v100 + 1))(v164, v102);
      v163 = v307;
    }

    type metadata accessor for BloomFilterDiskStorage(0LL);
    v203 = (uint64_t)v285;
    (*(void (**)(char *, uint64_t, uint64_t))(v304 + 16))(v285, v99, v163);
    v204 = (int *)v309;
    v205 = sub_10001B58C(v203, *(void *)&v55[*(int *)(v309 + 24)]);
    if (v105)
    {
      sub_100021890(v101, &qword_10004E880);
      v201 = v99;
      v202 = v163;
      goto LABEL_48;
    }

    v206 = v205;
    v292 = type metadata accessor for BloomFilter();
    v207 = (uint64_t *)&v55[v204[5]];
    v208 = *v207;
    v209 = v207[1];
    v210 = v204[11];
    v211 = (uint64_t *)&v55[v204[10]];
    v281 = 0LL;
    v212 = *v211;
    v213 = v211[1];
    v214 = *(void *)&v55[v210];
    v215 = *v276;
    v216 = v276[1];
    swift_retain(v206);
    sub_100010640(v208, v209);
    swift_bridgeObjectRetain(v213);
    swift_bridgeObjectRetain(v216);
    v217 = v214;
    v218 = v292;
    v219 = v281;
    v220 = sub_10001D3D0(v206, v208, v209, v212, v213, v217, v215, v216);
    if (v219)
    {
      swift_release(v206);
      sub_100021890(v300, &qword_10004E880);
      v120 = v293;
      goto LABEL_16;
    }

    v240 = (void *)v220;
    v309 = v206;
    v291 = v69;
    v241 = v302;
    v274();
    v318 = (id)0xD000000000000011LL;
    v319 = 0x800000010003C010LL;
    v242 = v303;
    v243 = v305;
    v273(v303, v272, v305);
    v244 = v283;
    URL.appending<A>(path:directoryHint:)(&v318, v242, &type metadata for String, v271);
    v270(v242, v243);
    swift_bridgeObjectRelease(v319);
    v280(v241, v307);
    v245 = type metadata accessor for PropertyListEncoder(0LL);
    swift_allocObject(v245, *(unsigned int *)(v245 + 48), *(unsigned __int16 *)(v245 + 52));
    v246 = PropertyListEncoder.init()();
    v318 = v240;
    v247 = sub_10002EFDC(&qword_10004E890, (uint64_t)&unk_10003869C);
    v248 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(&v318, v218, v247);
    v250 = v249;
    Data.write(to:options:)(v244, 0LL, v248, v249);
    v281 = 0LL;
    v251 = *(uint64_t (**)(uint64_t))(*(void *)v313 + 184LL);
    v252 = swift_retain(v240);
    v253 = v251(v252);
    v254 = v311;
    v255 = (void *)((uint64_t (*)(uint64_t))v311)(v253);
    v256 = (char *)*((void *)v291 + 1);
    v292 = *(void *)v291;
    v291 = v256;
    swift_bridgeObjectRetain(v256);
    sub_1000188F4();

    v257 = swift_bridgeObjectRelease(v256);
    v258 = (void *)((uint64_t (*)(uint64_t))v254)(v257);
    v259 = v275[1];
    v290 = *v275;
    swift_bridgeObjectRetain(v259);
    sub_10001868C();

    v260 = swift_bridgeObjectRelease(v259);
    v261 = (void *)((uint64_t (*)(uint64_t))v254)(v260);
    sub_100018808();

    v308(&v318);
    v262 = v320;
    v263 = v321;
    sub_100012A78(&v318, v320);
    v289 = *(void (***)(char *, uint64_t))(v263 + 32);
    v264 = v291;
    swift_bridgeObjectRetain(v291);
    swift_bridgeObjectRetain(v259);
    v265 = v262;
    v266 = v282;
    ((void (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))v289)(v290, v259, v292, v264, v265, v263);
    swift_bridgeObjectRelease(v259);
    swift_bridgeObjectRelease(v264);
    sub_1000106F8(v248, v250);
    swift_release(v309);
    uint64_t v53 = v266;
    swift_release(v240);
    v267 = v246;
    uint64_t v48 = v313;
    swift_release(v267);
    v268 = v307;
    v269 = v280;
    v280(v283, v307);
    sub_100021890(v300, &qword_10004E880);
    v269(v293, v268);
    sub_100014850((uint64_t)v310, type metadata accessor for BloomFilterRecord);
    sub_100012A9C(&v318);
    uint64_t v52 = v281;
  }

  id v121 = v296;
  id v122 = v53 + *(int *)(v296 + 24);
  id v123 = *(void *)(v122 + 8);
  __int128 v124 = v305;
  if (v123 >> 60 != 15)
  {
    uint64_t v125 = v53;
    v126 = *(void *)v122;
    v127 = sub_100010640(*(void *)v122, *(void *)(v122 + 8));
    SecAccessControlRef v128 = (void *)((uint64_t (*)(uint64_t))v311)(v127);
    sub_1000185FC();

    uint64_t v53 = v125;
    sub_100010BA4(v126, v123);
  }

  v129 = v299;
  sub_100020048(v53 + *(int *)(v121 + 20), v299, &qword_10004E5A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v297 + 48))(v129, 1LL, v298) == 1)
  {
    v130 = sub_100021890(v129, &qword_10004E5A0);
    uint64_t v131 = 0;
  }

  else
  {
    v132 = sub_100020C5C(v129, v295, type metadata accessor for DocumentCheckerRecord);
    v133 = v302;
    (*(void (**)(uint64_t))(*(void *)v48 + 128LL))(v132);
    v318 = (id)0xD00000000000001FLL;
    v319 = 0x800000010003BFF0LL;
    v134 = v301;
    v135 = v303;
    (*(void (**)(char *, void, uint64_t))(v301 + 104))( v303,  enum case for URL.DirectoryHint.inferFromPath(_:),  v124);
    v136 = sub_10002EDA0();
    URL.appending<A>(path:directoryHint:)(&v318, v135, &type metadata for String, v136);
    (*(void (**)(char *, uint64_t))(v134 + 8))(v135, v124);
    swift_bridgeObjectRelease(v319);
    v137 = *(void (**)(char *, uint64_t))(v304 + 8);
    v138 = v307;
    v137(v133, v307);
    sub_100014EE8();
    if (v52)
    {
      v140 = static os_log_type_t.error.getter(v139);
      v141 = (void *)*sub_100019C48();
      if (os_log_type_enabled((os_log_t)v141, v140))
      {
        swift_errorRetain(v52);
        swift_errorRetain(v52);
        v142 = v141;
        v143 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        v144 = (void *)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)v143 = 138412290;
        swift_errorRetain(v52);
        v145 = (void *)_swift_stdlib_bridgeErrorToNSError(v52);
        v318 = v145;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v318, &v319, v143 + 4);
        *v144 = v145;
        v138 = v307;
        swift_errorRelease(v52);
        swift_errorRelease(v52);
        _os_log_impl((void *)&_mh_execute_header, v142, v140, "Failed to install document checker: %@", v143, 0xCu);
        v146 = sub_100012990(&qword_10004E888);
        swift_arrayDestroy(v144, 1LL, v146);
        v147 = v144;
        uint64_t v48 = v313;
        swift_slowDealloc(v147, -1LL, -1LL);
        swift_slowDealloc(v143, -1LL, -1LL);
      }

      swift_errorRelease(v52);
      uint64_t v131 = 0;
      uint64_t v52 = 0LL;
    }

    else
    {
      uint64_t v131 = 256;
    }

    v137(v294, v138);
    v130 = sub_100014850(v295, type metadata accessor for DocumentCheckerRecord);
  }

  v177 = (*(uint64_t (**)(uint64_t))(*(void *)v48 + 176LL))(v130);
  v178 = v308;
  if (v177)
  {
    v179 = (void *)v177;
    LODWORD(v310) = v131;
    v180 = (void *)swift_allocObject(&unk_100047708, 48LL, 7LL);
    v182 = v314;
    v181 = v315;
    v180[2] = v315;
    v180[3] = v48;
    v180[4] = v179;
    v180[5] = v182;
    swift_retain(v181);
    swift_retain(v48);
    swift_retain(v179);
    v183 = swift_retain(v182);
    v184 = (void *)((uint64_t (*)(uint64_t))v311)(v183);
    v185 = sub_1000186A8();
    v187 = v186;

    v178(&v318);
    v188 = v52;
    v189 = v320;
    v190 = v321;
    sub_100012A78(&v318, v320);
    (*(void (**)(uint64_t (*)(void *), void *, id, unint64_t, uint64_t, uint64_t))(v190 + 24))( sub_10002EFC0,  v180,  v185,  v187,  v189,  v190);
    if (v188)
    {
      sub_100010BA4((uint64_t)v185, v187);
      sub_100012A9C(&v318);
      v316 = v188;
      swift_errorRetain(v188);
      v193 = sub_100012990(&qword_10004DDA0);
      if (!swift_dynamicCast(v193, &v316, v193, &type metadata for CloudKitOperationsError, 0LL))
      {
        sub_100014850(v282, type metadata accessor for BaseZoneSyncResult);
        swift_release(v180);
        swift_release(v179);
        swift_errorRelease(v316);
        swift_release(v314);
        return swift_release(v315);
      }

      v194 = swift_errorRelease(v188);
      v195 = (void *)((uint64_t (*)(uint64_t))v311)(v194);
      sub_100018808();

      v308(&v318);
      v196 = v320;
      v197 = v321;
      sub_100012A78(&v318, v320);
      (*(void (**)(uint64_t (*)(void *), void *, void, unint64_t, uint64_t, uint64_t))(v197 + 24))( sub_10002EFC0,  v180,  0LL,  0xF000000000000000LL,  v196,  v197);
      v222 = v221;
      v224 = v223;
      sub_100012A9C(&v318);
      swift_errorRelease(v316);
    }

    else
    {
      v222 = v191;
      v224 = v192;
      sub_100010BA4((uint64_t)v185, v187);
      sub_100012A9C(&v318);
    }

    v225 = v286;
    swift_beginAccess(v286, &v318, 0LL, 0LL);
    v226 = *v225;
    if (v226)
    {
      v227 = swift_errorRetain(v226);
      LODWORD(v313) = static os_log_type_t.error.getter(v227);
      v228 = (void *)*sub_100019C48();
      v229 = sub_100012990(&qword_10004DBB0);
      v230 = swift_allocObject(v229, 72LL, 7LL);
      *(_OWORD *)(v230 + 16) = xmmword_1000377D0;
      v316 = v226;
      swift_errorRetain(v226);
      v231 = v228;
      v232 = sub_100012990(&qword_10004DDA0);
      v233 = String.init<A>(describing:)(&v316, v232);
      v235 = v234;
      *(void *)(v230 + 56) = &type metadata for String;
      *(void *)(v230 + 64) = sub_1000139FC();
      *(void *)(v230 + 32) = v233;
      *(void *)(v230 + 40) = v235;
      os_log(_:dso:log:_:_:)( v313,  &_mh_execute_header,  v231,  "Update entry sync error: %{public}@",  35LL,  2LL,  v230);

      v236 = swift_bridgeObjectRelease(v230);
      swift_willThrow(v236);
      swift_release(v179);
      swift_release(v180);
      sub_100010BA4(v222, v224);
      goto LABEL_54;
    }

    if (v224 >> 60 == 15)
    {
      swift_release(v179);
    }

    else
    {
      v237 = sub_10001073C(v222, v224);
      v238 = (void *)((uint64_t (*)(uint64_t))v311)(v237);
      sub_100018760();

      swift_release(v180);
      sub_100010BA4(v222, v224);
      v180 = v179;
    }

    v239 = v282;
    swift_release(v180);
    sub_100010BA4(v222, v224);
    sub_100014850(v239, type metadata accessor for BaseZoneSyncResult);
    swift_beginAccess(v284, &v316, 0LL, 0LL);
    swift_release(v314);
    swift_release(v315);
    uint64_t v131 = (int)v310;
  }

  else
  {
    sub_100014850(v282, type metadata accessor for BaseZoneSyncResult);
    swift_release(v314);
    swift_release(v315);
  }

  return v131 | ((_DWORD)v306 != 1);
}

uint64_t sub_10002D618(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v110 = a5;
  uint64_t v111 = a4;
  v112 = a1;
  uint64_t v113 = a3;
  uint64_t v6 = type metadata accessor for Algorithm(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100012990(&qword_10004E880);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v98 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v98 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v98 - v20;
  uint64_t result = swift_beginAccess(a2 + 16, v115, 0LL, 0LL);
  if (*(void *)(a2 + 16)) {
    return result;
  }
  id v106 = v19;
  uint64_t v101 = v16;
  uint64_t v102 = v13;
  uint64_t v108 = v9;
  uint64_t v109 = v7;
  uint64_t v105 = v6;
  uint64_t v100 = (uint64_t *)(a2 + 16);
  uint64_t v103 = v21;
  uint64_t v23 = static os_log_type_t.default.getter(result);
  uint64_t v24 = (void *)*sub_100019B98();
  uint64_t v25 = sub_100012990(&qword_10004DBB0);
  uint64_t v26 = swift_allocObject(v25, 112LL, 7LL);
  __int128 v104 = xmmword_1000377F0;
  *(_OWORD *)(v26 + 16) = xmmword_1000377F0;
  uint64_t v27 = v112;
  uint64_t v28 = *v112;
  *(void *)(v26 + 56) = &type metadata for Int64;
  *(void *)(v26 + 64) = &protocol witness table for Int64;
  *(void *)(v26 + 32) = v28;
  v116[0] = *((_OWORD *)v27 + 2);
  *(void *)(v26 + 96) = &type metadata for String;
  unint64_t v107 = sub_1000139FC();
  *(void *)(v26 + 104) = v107;
  *(_OWORD *)(v26 + 72) = *((_OWORD *)v27 + 2);
  uint64_t v30 = *((void *)&v116[0] + 1);
  uint64_t v29 = *(void *)&v116[0];
  id v31 = v24;
  sub_10001F2E0((uint64_t)v116);
  os_log(_:dso:log:_:_:)( v23,  &_mh_execute_header,  v31,  "Merging in bloom filter update: %d for filter %@",  48LL,  2LL,  v26);

  swift_bridgeObjectRelease(v26);
  uint64_t v32 = *(uint64_t (**)(void))(*(void *)v113 + 176LL);
  uint64_t v33 = swift_bridgeObjectRetain(v30);
  uint64_t v34 = ((uint64_t (*)(uint64_t))v32)(v33);
  if (!v34)
  {
    uint64_t v41 = sub_10001F308((uint64_t)v116);
    goto LABEL_11;
  }

  uint64_t v35 = v34;
  uint64_t v36 = v32;
  uint64_t v99 = v28;
  uint64_t v37 = *(void *)(v34 + 16);
  uint64_t v38 = *(void *)(v34 + 24);
  swift_bridgeObjectRetain(v38);
  swift_release(v35);
  if (v29 != v37 || v30 != v38)
  {
    char v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v30, v37, v38, 0LL);
    swift_bridgeObjectRelease(v38);
    uint64_t v41 = sub_10001F308((uint64_t)v116);
    id v39 = v108;
    uint64_t v40 = (uint64_t)v106;
    uint64_t v32 = v36;
    if ((v42 & 1) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v62 = static os_log_type_t.error.getter(v41);
    uint64_t v63 = (void *)*sub_100019C48();
    uint64_t v64 = swift_allocObject(v25, 112LL, 7LL);
    unint64_t v65 = v107;
    *(void *)(v64 + 56) = &type metadata for String;
    *(void *)(v64 + 64) = v65;
    __int128 v66 = v116[0];
    *(_OWORD *)(v64 + 16) = v104;
    *(_OWORD *)(v64 + 32) = v66;
    sub_10001F2E0((uint64_t)v116);
    id v67 = v63;
    uint64_t v68 = v32();
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v71 = *(void *)(v68 + 16);
      uint64_t v70 = *(void *)(v68 + 24);
      swift_bridgeObjectRetain(v70);
      swift_release(v69);
    }

    else
    {
      uint64_t v71 = 0LL;
      uint64_t v70 = 0LL;
    }

    v114[0] = v71;
    v114[1] = v70;
    uint64_t v72 = sub_100012990(&qword_10004E430);
    uint64_t v73 = String.init<A>(describing:)(v114, v72);
    *(void *)(v64 + 96) = &type metadata for String;
    *(void *)(v64 + 104) = v65;
    *(void *)(v64 + 72) = v73;
    *(void *)(v64 + 80) = v74;
    os_log(_:dso:log:_:_:)( v62,  &_mh_execute_header,  v67,  "Update asset had incorrect ID: %{public}@, %{public}@",  53LL,  2LL,  v64);

    return swift_bridgeObjectRelease(v64);
  }

  swift_bridgeObjectRelease(v30);
  sub_10001F308((uint64_t)v116);
  id v39 = v108;
  uint64_t v40 = (uint64_t)v106;
LABEL_8:
  uint64_t v43 = v109;
  uint64_t v44 = (uint64_t)v103;
  uint64_t v45 = v105;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v103, 1LL, 1LL, v105);
  uint64_t v46 = v27[7];
  uint64_t v47 = v117;
  if (v46)
  {
    uint64_t v48 = v27[6];
    swift_bridgeObjectRetain(v27[7]);
    uint64_t v113 = v48;
    sub_100019CE4(v48, v46, v40);
    sub_100021890(v44, &qword_10004E880);
    sub_10002F060(v40, v44);
    uint64_t v49 = (uint64_t)v101;
    uint64_t v43 = v109;
    sub_100020048(v44, (uint64_t)v101, &qword_10004E880);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v49, 1LL, v45) == 1)
    {
      uint64_t v50 = sub_100021890(v49, &qword_10004E880);
      uint64_t v51 = static os_log_type_t.error.getter(v50);
      uint64_t v52 = (void *)*sub_100019C48();
      uint64_t v53 = swift_allocObject(v25, 72LL, 7LL);
      *(_OWORD *)(v53 + 16) = xmmword_1000377D0;
      unint64_t v54 = v107;
      *(void *)(v53 + 56) = &type metadata for String;
      *(void *)(v53 + 64) = v54;
      uint64_t v55 = v113;
      *(void *)(v53 + 32) = v113;
      *(void *)(v53 + 40) = v46;
      swift_bridgeObjectRetain(v46);
      id v56 = v52;
      os_log(_:dso:log:_:_:)( v51,  &_mh_execute_header,  v56,  "Update asset had invalid compression type: %@",  45LL,  2LL,  v53);

      swift_bridgeObjectRelease(v53);
      unint64_t v57 = sub_10002F01C();
      uint64_t v58 = swift_allocError(&type metadata for LaunchWarningControllerError, v57, 0LL, 0LL);
      *(void *)uint64_t v59 = v55;
      *(void *)(v59 + _Block_object_dispose((const void *)(v1 - 112), 8) = v46;
      *(_BYTE *)(v59 + 16) = 1;
      sub_100021890(v44, &qword_10004E880);
      id v60 = v100;
      swift_beginAccess(v100, v114, 1LL, 0LL);
      uint64_t v61 = *v60;
      *id v60 = v58;
      return swift_errorRelease(v61);
    }

    swift_bridgeObjectRelease(v46);
    sub_100021890(v49, &qword_10004E880);
    uint64_t v45 = v105;
  }

  uint64_t v75 = v25;
  uint64_t v77 = v27[1];
  unint64_t v76 = v27[2];
  uint64_t v78 = (uint64_t)v102;
  sub_100020048(v44, (uint64_t)v102, &qword_10004E880);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v78, 1LL, v45) == 1)
  {
    sub_100010640(v77, v76);
    sub_100021890(v78, &qword_10004E880);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v39, v78, v45);
    sub_100010640(v77, v76);
    sub_10001A3D4(v77, v76);
    __int128 v81 = v39;
    uint64_t v82 = v43;
    if (v47)
    {
      uint64_t v83 = swift_errorRelease(v47);
      uint64_t v84 = static os_log_type_t.error.getter(v83);
      __int128 v85 = (void *)*sub_100019C48();
      uint64_t v86 = swift_allocObject(v75, 72LL, 7LL);
      *(_OWORD *)(v86 + 16) = xmmword_1000377D0;
      *(void *)(v86 + 56) = &type metadata for Int64;
      *(void *)(v86 + 64) = &protocol witness table for Int64;
      *(void *)(v86 + 32) = v99;
      id v87 = v85;
      os_log(_:dso:log:_:_:)(v84, &_mh_execute_header, v87, "Update asset %lld had invalid compressed data", v98);

      swift_bridgeObjectRelease(v86);
      unint64_t v88 = sub_10002F01C();
      uint64_t v89 = swift_allocError(&type metadata for LaunchWarningControllerError, v88, 0LL, 0LL);
      *(void *)uint64_t v90 = 0LL;
      *(void *)(v90 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
      *(_BYTE *)(v90 + 16) = 2;
      sub_1000106F8(v77, v76);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v108, v45);
      sub_100021890(v44, &qword_10004E880);
      id v91 = v100;
      swift_beginAccess(v100, v114, 1LL, 0LL);
      uint64_t v92 = *v91;
      uint64_t *v91 = v89;
      return swift_errorRelease(v92);
    }

    uint64_t v93 = v79;
    unint64_t v94 = v80;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v45);
    sub_1000106F8(v77, v76);
    uint64_t v77 = v93;
    unint64_t v76 = v94;
  }

  sub_100010640(v77, v76);
  sub_100016718(v77, v76);
  uint64_t v96 = v110;
  if (v47)
  {
    sub_1000106F8(v77, v76);
    return sub_100021890(v44, &qword_10004E880);
  }

  else
  {
    uint64_t v97 = v95;
    sub_1000169B8(v95);
    swift_bridgeObjectRelease(v97);
    sub_1000106F8(v77, v76);
    sub_100021890(v44, &qword_10004E880);
    uint64_t result = swift_beginAccess(v96 + 16, v114, 1LL, 0LL);
    if (__OFADD__(*(void *)(v96 + 16), 1LL)) {
      __break(1u);
    }
    else {
      ++*(void *)(v96 + 16);
    }
  }

  return result;
}

void *sub_10002DE60()
{
  uint64_t v10 = &_swiftEmptyArrayStorage;
  (*(void (**)(void *__return_ptr))(*(void *)v0 + 224LL))(v7);
  uint64_t v1 = v8;
  uint64_t v2 = v9;
  sub_100012A78(v7, v8);
  uint64_t v5 = v0;
  uint64_t v6 = &v10;
  (*(void (**)(void (*)(uint64_t), uint64_t *, uint64_t, uint64_t))(v2 + 8))( sub_10002F0BC,  &v4,  v1,  v2);
  sub_100012A9C(v7);
  return v10;
}

void sub_10002DEF4(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v105 = a3;
  id v118 = a2;
  uint64_t v104 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0LL);
  uint64_t v106 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  uint64_t v107 = (uint64_t)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = _s18LaunchWarningEntryVMa(0LL);
  uint64_t v115 = *(void *)(v5 - 8);
  uint64_t v116 = v5;
  __chkstk_darwin(v5);
  uint64_t v108 = (uint64_t *)((char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = sub_100012990(&qword_10004E520);
  __chkstk_darwin(v7);
  v114 = (void **)((char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v112 = *(void *)(v9 - 8);
  uint64_t v113 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v109 = (uint64_t)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v111 = (uint64_t)&v101 - v12;
  uint64_t v13 = sub_100012990(&qword_10004E440);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v110 = (uint64_t)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v117 = (uint64_t)&v101 - v16;
  uint64_t v17 = type metadata accessor for AppRecord(0LL);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  LODWORD(v120) = static os_log_type_t.info.getter(v18);
  uint64_t v21 = sub_100019C48();
  uint64_t v22 = (void *)*v21;
  uint64_t v23 = sub_100012990(&qword_10004DBB0);
  uint64_t v24 = swift_allocObject(v23, 72LL, 7LL);
  __int128 v119 = xmmword_1000377D0;
  *(_OWORD *)(v24 + 16) = xmmword_1000377D0;
  sub_100021A68(a1, (uint64_t)v20, type metadata accessor for AppRecord);
  id v25 = v22;
  uint64_t v26 = String.init<A>(describing:)(v20, v17);
  uint64_t v28 = v27;
  *(void *)(v24 + 56) = &type metadata for String;
  unint64_t v29 = sub_1000139FC();
  *(void *)(v24 + 64) = v29;
  *(void *)(v24 + 32) = v26;
  *(void *)(v24 + 40) = v28;
  os_log(_:dso:log:_:_:)(v120, &_mh_execute_header, v25, "Visiting application: %@", 24LL, 2LL, v24);

  uint64_t v30 = swift_bridgeObjectRelease(v24);
  id v31 = (uint64_t *)(a1 + *(int *)(v17 + 36));
  unint64_t v32 = v31[2];
  if (v32 >> 60 == 15)
  {
    uint64_t v33 = static os_log_type_t.info.getter(v30);
    uint64_t v34 = (void *)*v21;
    uint64_t v35 = swift_allocObject(v23, 72LL, 7LL);
    *(_OWORD *)(v35 + 16) = v119;
    id v36 = v34;
    uint64_t v37 = URL.path.getter();
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 64) = v29;
    *(void *)(v35 + 32) = v37;
    *(void *)(v35 + 40) = v38;
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v36, "Unable to find cdhash for %@", 28LL, 2LL, v35);

    swift_bridgeObjectRelease(v35);
  }

  else
  {
    unint64_t v102 = v29;
    id v39 = (void **)v21;
    uint64_t v103 = v23;
    uint64_t v120 = a1;
    uint64_t v40 = *v31;
    uint64_t v41 = v31[1];
    char v42 = v118;
    uint64_t v43 = *(uint64_t (**)(uint64_t))(*v118 + 152);
    uint64_t v44 = sub_100010640(v41, v32);
    uint64_t v45 = (void *)v43(v44);
    sub_100010640(v41, v32);
    uint64_t v46 = v117;
    uint64_t v47 = v124;
    sub_10001FE48(v40, v41, v32, v117);
    sub_10003024C(v40, v41, v32);
    if (v47)
    {
      sub_10003024C(v40, v41, v32);
    }

    else
    {

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v46, 1LL, v116) == 1)
      {
        sub_100021890(v46, &qword_10004E440);
        uint64_t v48 = *v42;
        uint64_t v117 = v40;
        uint64_t v49 = *(void (**)(uint64_t, unint64_t, uint64_t))(v48 + 280);
        sub_100010640(v41, v32);
        uint64_t v50 = (uint64_t)v114;
        v49(v41, v32, v117);
        sub_10003024C(v117, v41, v32);
        uint64_t v101 = v41;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v112 + 48))(v50, 1LL, v113) == 1)
        {
          uint64_t v51 = sub_100021890(v50, &qword_10004E520);
          uint64_t v52 = static os_log_type_t.info.getter(v51);
          uint64_t v53 = *v39;
          uint64_t v54 = swift_allocObject(v103, 72LL, 7LL);
          *(_OWORD *)(v54 + 16) = v119;
          id v55 = v53;
          uint64_t v56 = URL.path.getter();
          unint64_t v57 = v102;
          *(void *)(v54 + 56) = &type metadata for String;
          *(void *)(v54 + 64) = v57;
          *(void *)(v54 + 32) = v56;
          *(void *)(v54 + 40) = v58;
          os_log(_:dso:log:_:_:)(v52, &_mh_execute_header, v55, "Found no launch warning for %@", 30LL, 2LL, v54);

          swift_bridgeObjectRelease(v54);
          sub_10003024C(v117, v101, v32);
        }

        else
        {
          uint64_t v59 = v111;
          uint64_t v60 = sub_100020C5C(v50, v111, type metadata accessor for LaunchWarningDetails);
          LODWORD(v112) = static os_log_type_t.default.getter(v60);
          v114 = v39;
          uint64_t v61 = *v39;
          uint64_t v62 = swift_allocObject(v103, 112LL, 7LL);
          *(_OWORD *)(v62 + 16) = xmmword_1000377F0;
          id v63 = v61;
          uint64_t v124 = 0LL;
          id v64 = v63;
          uint64_t v65 = URL.path.getter();
          unint64_t v66 = v102;
          *(void *)(v62 + 56) = &type metadata for String;
          *(void *)(v62 + 64) = v66;
          *(void *)(v62 + 32) = v65;
          *(void *)(v62 + 40) = v67;
          uint64_t v68 = v109;
          sub_100021A68(v59, v109, type metadata accessor for LaunchWarningDetails);
          uint64_t v69 = String.init<A>(describing:)(v68, v113);
          *(void *)(v62 + 96) = &type metadata for String;
          *(void *)(v62 + 104) = v66;
          *(void *)(v62 + 72) = v69;
          *(void *)(v62 + 80) = v70;
          os_log(_:dso:log:_:_:)( v112,  &_mh_execute_header,  v64,  "Found launch warning for %@ with details: %@",  44LL,  2LL,  v62);

          uint64_t v71 = swift_bridgeObjectRelease(v62);
          uint64_t v72 = v43(v71);
          uint64_t v73 = v59;
          uint64_t v74 = (void *)v72;
          uint64_t v75 = v110;
          uint64_t v76 = v124;
          sub_1000203EC(v73, v110);
          if (v76)
          {
            swift_errorRelease(v76);

            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v115 + 56))(v75, 1LL, 1LL, v116);
            uint64_t v77 = sub_100021890(v75, &qword_10004E440);
            uint64_t v78 = static os_log_type_t.error.getter(v77);
            uint64_t v79 = *v114;
            uint64_t v80 = swift_allocObject(v103, 72LL, 7LL);
            *(_OWORD *)(v80 + 16) = v119;
            id v81 = v79;
            uint64_t v82 = URL.path.getter();
            *(void *)(v80 + 56) = &type metadata for String;
            *(void *)(v80 + 64) = v66;
            *(void *)(v80 + 32) = v82;
            *(void *)(v80 + 40) = v83;
            os_log(_:dso:log:_:_:)( v78,  &_mh_execute_header,  v81,  "Error creating new launch warning for %@",  40LL,  2LL,  v80);

            swift_bridgeObjectRelease(v80);
            sub_10003024C(v117, v101, v32);
            sub_100014850(v73, type metadata accessor for LaunchWarningDetails);
          }

          else
          {

            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v115 + 56))(v75, 0LL, 1LL, v116);
            uint64_t v84 = v108;
            uint64_t v85 = sub_100020C5C(v75, (uint64_t)v108, _s18LaunchWarningEntryVMa);
            uint64_t v86 = static os_log_type_t.default.getter(v85);
            id v87 = *v114;
            uint64_t v88 = swift_allocObject(v103, 72LL, 7LL);
            *(_OWORD *)(v88 + 16) = v119;
            uint64_t v89 = *v84;
            *(void *)(v88 + 56) = &type metadata for UInt64;
            *(void *)(v88 + 64) = &protocol witness table for UInt64;
            *(void *)(v88 + 32) = v89;
            id v90 = v87;
            os_log(_:dso:log:_:_:)(v86, &_mh_execute_header, v90, "Created launch warning entry: %d", v101);

            swift_bridgeObjectRelease(v88);
            type metadata accessor for LaunchWarningMark();
            uint64_t v91 = sub_10001CA98(v89);
            (*(void (**)(void *__return_ptr))(*v118 + 224))(v121);
            uint64_t v92 = v122;
            uint64_t v93 = v123;
            sub_100012A78(v121, v122);
            uint64_t v94 = v120;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 16))(v91, v120, v92, v93);
            sub_100012A9C(v121);
            uint64_t v95 = v107;
            sub_100021A68(v94, v107, type metadata accessor for AppRecord);
            sub_100021A68(v73, v95 + *(int *)(v104 + 20), type metadata accessor for LaunchWarningDetails);
            uint64_t v96 = v105;
            unint64_t v97 = *v105;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v105);
            *uint64_t v96 = v97;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v97 = sub_10002EB54(0, *(void *)(v97 + 16) + 1LL, 1, v97);
              *uint64_t v96 = v97;
            }

            unint64_t v100 = *(void *)(v97 + 16);
            unint64_t v99 = *(void *)(v97 + 24);
            if (v100 >= v99 >> 1)
            {
              unint64_t v97 = sub_10002EB54(v99 > 1, v100 + 1, 1, v97);
              *uint64_t v96 = v97;
            }

            *(void *)(v97 + 16) = v100 + 1;
            sub_100020C5C( v107,  v97 + ((*(unsigned __int8 *)(v106 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80))
            + *(void *)(v106 + 72) * v100,
              type metadata accessor for LaunchWarningController.NewLaunchWarning);
            swift_release(v91);
            sub_10003024C(v117, v101, v32);
            sub_100014850((uint64_t)v84, _s18LaunchWarningEntryVMa);
            sub_100014850(v73, type metadata accessor for LaunchWarningDetails);
          }
        }
      }

      else
      {
        sub_10003024C(v40, v41, v32);
        sub_100021890(v46, &qword_10004E440);
      }
    }
  }

uint64_t sub_10002E8F8(uint64_t a1)
{
  (*(void (**)(void *__return_ptr))(*(void *)v1 + 224LL))(v19);
  uint64_t v3 = v20;
  uint64_t v4 = v21;
  sub_100012A78(v19, v20);
  uint64_t v5 = (void *)(a1 + *(int *)(type metadata accessor for AppRecord(0LL) + 20));
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  char v8 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(v4 + 24))(*v5, v6, v3, v4);
  uint64_t v9 = sub_100012A9C(v19);
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = static os_log_type_t.default.getter(v9);
    uint64_t v11 = (void *)*sub_100019C48();
    uint64_t v12 = sub_100012990(&qword_10004DBB0);
    uint64_t v13 = swift_allocObject(v12, 72LL, 7LL);
    *(_OWORD *)(v13 + 16) = xmmword_1000377D0;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_1000139FC();
    *(void *)(v13 + 32) = v7;
    *(void *)(v13 + 40) = v6;
    id v14 = v11;
    swift_bridgeObjectRetain(v6);
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v14, "Successfully terminated app: %@", 31LL, 2LL, v13);
  }

  else
  {
    uint64_t v15 = static os_log_type_t.error.getter(v9);
    uint64_t v16 = (void *)*sub_100019C48();
    uint64_t v17 = sub_100012990(&qword_10004DBB0);
    uint64_t v13 = swift_allocObject(v17, 72LL, 7LL);
    *(_OWORD *)(v13 + 16) = xmmword_1000377D0;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_1000139FC();
    *(void *)(v13 + 32) = v7;
    *(void *)(v13 + 40) = v6;
    id v14 = v16;
    swift_bridgeObjectRetain(v6);
    os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v14, "Failed to terminate app: %@", 27LL, 2LL, v13);
  }

  swift_bridgeObjectRelease(v13);
  return v8 & 1;
}

uint64_t sub_10002EAB4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL;
  uint64_t v2 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  swift_release(*(void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter));
  sub_100012A9C((void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit));
  sub_100012A9C((void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager));
  sub_100012A9C((void *)(v0 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics));
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10002EB54(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100012990(&qword_10004EA98);
  uint64_t v11 = *(void *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_29;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for LaunchWarningController.NewLaunchWarning(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    unint64_t v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(void *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }

    else if (v15 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100030268(0LL, v8, v21, a4);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10002ED5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10002EDA0()
{
  unint64_t result = qword_10004E870;
  if (!qword_10004E870)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10004E870);
  }

  return result;
}

uint64_t sub_10002EDE4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (uint64_t *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_filter);
  *uint64_t v8 = 0LL;
  *(void *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_db) = a1;
  swift_beginAccess(v8, v20, 1LL, 0LL);
  uint64_t v9 = *v8;
  *uint64_t v8 = a2;
  id v10 = a1;
  swift_retain(a2);
  swift_release(v9);
  sub_10002ED5C((uint64_t)a3, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_cloudkit);
  if (qword_1000511D0 != -1) {
    swift_once(&qword_1000511D0, sub_10002AA34);
  }
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = sub_1000148EC(v11, (uint64_t)qword_100051618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))( v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_baseURL,  v12,  v11);
  uint64_t v13 = type metadata accessor for AppManager();
  uint64_t v14 = sub_100013910();
  uint64_t v15 = (uint64_t *)(v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_appManager);
  v15[3] = v13;
  void v15[4] = (uint64_t)&off_100045E38;
  *uint64_t v15 = v14;
  uint64_t v18 = type metadata accessor for MetricReporter();
  uint64_t v19 = &off_1000479A8;
  *(void *)&__int128 v17 = sub_100013910();
  sub_100012A9C(a3);
  sub_100021E24(&v17, v4 + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningController_metrics);
  return v4;
}

uint64_t sub_10002EF50()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002EF60()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002EF84()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10002EFC0(void *a1)
{
  return sub_10002D618(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_10002EFDC(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for BloomFilter();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10002F01C()
{
  unint64_t result = qword_10004E898;
  if (!qword_10004E898)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038D80, &type metadata for LaunchWarningControllerError);
    atomic_store(result, (unint64_t *)&qword_10004E898);
  }

  return result;
}

uint64_t sub_10002F060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012990(&qword_10004E880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LaunchWarningController.NewLaunchWarning(uint64_t a1)
{
  return sub_100012E08( a1,  qword_100051270,  (uint64_t)&nominal type descriptor for LaunchWarningController.NewLaunchWarning);
}

void sub_10002F0BC(uint64_t a1)
{
}

uint64_t sub_10002F0D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for LaunchWarningControllerError(uint64_t a1)
{
  return sub_10002F100(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10002F100(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t _s17online_auth_agent28LaunchWarningControllerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_10002F0D8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_10002F0D8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10002F100(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for LaunchWarningControllerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10002F100(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for LaunchWarningControllerError()
{
  return &type metadata for LaunchWarningControllerError;
}

uint64_t sub_10002F208()
{
  return type metadata accessor for LaunchWarningController(0LL);
}

uint64_t type metadata accessor for LaunchWarningController(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_100051260, (uint64_t)&nominal type descriptor for LaunchWarningController);
}

uint64_t sub_10002F224(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[2] = "\b";
    void v4[3] = &unk_100038E10;
    v4[4] = &unk_100038E10;
    v4[5] = &unk_100038E10;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for LaunchWarningController.SyncResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningController.SyncResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[18]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningController.SyncResult( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v1 - 112), 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v1 - 112), 8) = 0;
    }
    if (a2) {
      *(_BYTE *)__n128 result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningController.SyncResult()
{
  return &type metadata for LaunchWarningController.SyncResult;
}

uint64_t *sub_10002F370(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v22);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v44 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v44(a1, a2, v7);
    uint64_t v9 = (int *)type metadata accessor for AppRecord(0LL);
    uint64_t v10 = v9[5];
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = v9[6];
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    size_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    *(uint64_t *)((char *)a1 + v9[7]) = *(uint64_t *)((char *)a2 + v9[7]);
    uint64_t v18 = v9[8];
    uint64_t v19 = (char *)a1 + v18;
    unint64_t v20 = (uint64_t *)((char *)a2 + v18);
    unint64_t v21 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v17);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    }

    else
    {
      uint64_t v23 = *v20;
      sub_100010640(*v20, v21);
      *(void *)uint64_t v19 = v23;
      *((void *)v19 + 1) = v21;
    }

    uint64_t v24 = v9[9];
    id v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    unint64_t v27 = *((void *)v26 + 2);
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)id v25 = *(_OWORD *)v26;
      *((void *)v25 + 2) = *((void *)v26 + 2);
    }

    else
    {
      *(_DWORD *)id v25 = *(_DWORD *)v26;
      uint64_t v28 = *((void *)v26 + 1);
      sub_100010640(v28, v27);
      *((void *)v25 + 1) = v28;
      *((void *)v25 + 2) = v27;
    }

    uint64_t v29 = *(int *)(a3 + 20);
    uint64_t v30 = (char *)a1 + v29;
    id v31 = (char *)a2 + v29;
    *(_DWORD *)((char *)a1 + v29) = *(_DWORD *)((char *)a2 + v29);
    uint64_t v32 = *(uint64_t *)((char *)a2 + v29 + 8);
    unint64_t v33 = *((void *)v31 + 2);
    sub_100010640(*((void *)v31 + 1), v33);
    *((void *)v30 + 1) = v32;
    *((void *)v30 + 2) = v33;
    uint64_t v34 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
    uint64_t v35 = v34[6];
    id v36 = &v30[v35];
    uint64_t v37 = &v31[v35];
    uint64_t v38 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16LL))(v36, v37, v38);
    v30[v34[7]] = v31[v34[7]];
    *(void *)&v30[v34[8]] = *(void *)&v31[v34[8]];
    uint64_t v39 = v34[9];
    uint64_t v40 = &v30[v39];
    uint64_t v41 = &v31[v39];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(&v31[v39], 1LL, v7))
    {
      uint64_t v42 = sub_100012990(&qword_10004E770);
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64LL));
    }

    else
    {
      v44((uint64_t *)v40, (uint64_t *)v41, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v40, 0LL, 1LL, v7);
    }
  }

  return a1;
}

uint64_t sub_10002F5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v17(a1, v4);
  char v6 = (int *)type metadata accessor for AppRecord(0LL);
  swift_bridgeObjectRelease(*(void *)(a1 + v6[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + v6[6] + 8));
  uint64_t v7 = (uint64_t *)(a1 + v6[8]);
  unint64_t v8 = v7[1];
  if (v8 >> 60 != 15) {
    sub_1000106F8(*v7, v8);
  }
  uint64_t v9 = a1 + v6[9];
  unint64_t v10 = *(void *)(v9 + 16);
  if (v10 >> 60 != 15) {
    sub_1000106F8(*(void *)(v9 + 8), v10);
  }
  uint64_t v11 = a1 + *(int *)(a2 + 20);
  sub_1000106F8(*(void *)(v11 + 8), *(void *)(v11 + 16));
  uint64_t v12 = type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v13 = v11 + *(int *)(v12 + 24);
  uint64_t v14 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(v13, v14);
  uint64_t v15 = v11 + *(int *)(v12 + 36);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v15, 1LL, v4);
  if (!(_DWORD)result) {
    return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v4);
  }
  return result;
}

uint64_t sub_10002F720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v42(a1, a2, v6);
  unint64_t v8 = (int *)type metadata accessor for AppRecord(0LL);
  uint64_t v9 = v8[5];
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = v11[1];
  *unint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = v8[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  uint64_t v17 = v8[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = *(void *)(a2 + v17 + 8);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v16);
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }

  else
  {
    uint64_t v21 = *v19;
    sub_100010640(*v19, v20);
    *(void *)uint64_t v18 = v21;
    *(void *)(v18 + _Block_object_dispose((const void *)(v1 - 112), 8) = v20;
  }

  uint64_t v22 = v8[9];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  unint64_t v25 = *(void *)(v24 + 16);
  if (v25 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    *(void *)(v23 + 16) = *(void *)(v24 + 16);
  }

  else
  {
    *(_DWORD *)uint64_t v23 = *(_DWORD *)v24;
    uint64_t v26 = *(void *)(v24 + 8);
    sub_100010640(v26, v25);
    *(void *)(v23 + _Block_object_dispose((const void *)(v1 - 112), 8) = v26;
    *(void *)(v23 + 16) = v25;
  }

  uint64_t v27 = *(int *)(a3 + 20);
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(_DWORD *)(a1 + v27) = *(_DWORD *)(a2 + v27);
  uint64_t v30 = *(void *)(a2 + v27 + 8);
  unint64_t v31 = *(void *)(v29 + 16);
  sub_100010640(*(void *)(v29 + 8), v31);
  *(void *)(v28 + _Block_object_dispose((const void *)(v1 - 112), 8) = v30;
  *(void *)(v28 + 16) = v31;
  uint64_t v32 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v33 = v32[6];
  uint64_t v34 = v28 + v33;
  uint64_t v35 = v29 + v33;
  uint64_t v36 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16LL))(v34, v35, v36);
  *(_BYTE *)(v28 + v32[7]) = *(_BYTE *)(v29 + v32[7]);
  *(void *)(v28 + v32[8]) = *(void *)(v29 + v32[8]);
  uint64_t v37 = v32[9];
  uint64_t v38 = (void *)(v28 + v37);
  uint64_t v39 = (const void *)(v29 + v37);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v29 + v37, 1LL, v6))
  {
    uint64_t v40 = sub_100012990(&qword_10004E770);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64LL));
  }

  else
  {
    v42((uint64_t)v38, (uint64_t)v39, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v38, 0LL, 1LL, v6);
  }

  return a1;
}

uint64_t sub_10002F958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for AppRecord(0LL);
  uint64_t v10 = v9[5];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v14 = v11[1];
  v11[1] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = v9[6];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  void *v16 = *v17;
  uint64_t v18 = v17[1];
  uint64_t v19 = v16[1];
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(void *)(a1 + v9[7]) = *(void *)(a2 + v9[7]);
  uint64_t v20 = v9[8];
  uint64_t v21 = (uint64_t *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  unint64_t v23 = *(void *)(a2 + v20 + 8);
  if (*(void *)(a1 + v20 + 8) >> 60 == 15LL)
  {
    if (v23 >> 60 != 15)
    {
      uint64_t v24 = *v22;
      sub_100010640(v24, v23);
      uint64_t *v21 = v24;
      v21[1] = v23;
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  if (v23 >> 60 == 15)
  {
    sub_10001443C((uint64_t)v21);
LABEL_6:
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    goto LABEL_8;
  }

  uint64_t v25 = *v22;
  sub_100010640(v25, v23);
  uint64_t v26 = *v21;
  unint64_t v27 = v21[1];
  uint64_t *v21 = v25;
  v21[1] = v23;
  sub_1000106F8(v26, v27);
LABEL_8:
  uint64_t v28 = v9[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (__int128 *)(a2 + v28);
  unint64_t v31 = *(void *)(a1 + v28 + 16) >> 60;
  unint64_t v32 = *(void *)(a2 + v28 + 16) >> 60;
  if (v31 <= 0xE)
  {
    if (v32 <= 0xE)
    {
      *(_DWORD *)uint64_t v29 = *(_DWORD *)v30;
      uint64_t v37 = *((void *)v30 + 1);
      unint64_t v38 = *((void *)v30 + 2);
      sub_100010640(v37, v38);
      uint64_t v39 = *(void *)(v29 + 8);
      unint64_t v40 = *(void *)(v29 + 16);
      *(void *)(v29 + _Block_object_dispose((const void *)(v1 - 112), 8) = v37;
      *(void *)(v29 + 16) = v38;
      sub_1000106F8(v39, v40);
    }

    else
    {
      sub_100014470(v29);
      uint64_t v34 = *((void *)v30 + 2);
      *(_OWORD *)uint64_t v29 = *v30;
      *(void *)(v29 + 16) = v34;
    }
  }

  else if (v32 <= 0xE)
  {
    *(_DWORD *)uint64_t v29 = *(_DWORD *)v30;
    uint64_t v35 = *((void *)v30 + 1);
    unint64_t v36 = *((void *)v30 + 2);
    sub_100010640(v35, v36);
    *(void *)(v29 + _Block_object_dispose((const void *)(v1 - 112), 8) = v35;
    *(void *)(v29 + 16) = v36;
  }

  else
  {
    __int128 v33 = *v30;
    *(void *)(v29 + 16) = *((void *)v30 + 2);
    *(_OWORD *)uint64_t v29 = v33;
  }

  uint64_t v41 = *(int *)(a3 + 20);
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  *(_DWORD *)(a1 + v41) = *(_DWORD *)(a2 + v41);
  uint64_t v44 = *(void *)(a2 + v41 + 8);
  unint64_t v45 = *(void *)(v43 + 16);
  sub_100010640(*(void *)(v43 + 8), v45);
  uint64_t v46 = *(void *)(v42 + 8);
  unint64_t v47 = *(void *)(v42 + 16);
  *(void *)(v42 + _Block_object_dispose((const void *)(v1 - 112), 8) = v44;
  *(void *)(v42 + 16) = v45;
  sub_1000106F8(v46, v47);
  uint64_t v48 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v49 = v48[6];
  uint64_t v50 = v42 + v49;
  uint64_t v51 = v43 + v49;
  uint64_t v52 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 24LL))(v50, v51, v52);
  *(_BYTE *)(v42 + v48[7]) = *(_BYTE *)(v43 + v48[7]);
  *(void *)(v42 + v48[8]) = *(void *)(v43 + v48[8]);
  uint64_t v53 = v48[9];
  uint64_t v54 = (void *)(v42 + v53);
  id v55 = (void *)(v43 + v53);
  uint64_t v56 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v51) = v56(v54, 1LL, v6);
  int v57 = v56(v55, 1LL, v6);
  if (!(_DWORD)v51)
  {
    if (!v57)
    {
      v8((uint64_t)v54, (uint64_t)v55, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(v54, v6);
    goto LABEL_20;
  }

  if (v57)
  {
LABEL_20:
    uint64_t v58 = sub_100012990(&qword_10004E770);
    memcpy(v54, v55, *(void *)(*(void *)(v58 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v54, v55, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v54, 0LL, 1LL, v6);
  return a1;
}

char *sub_10002FC90(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for AppRecord(0LL);
  *(_OWORD *)&a1[v9[5]] = *(_OWORD *)&a2[v9[5]];
  *(_OWORD *)&a1[v9[6]] = *(_OWORD *)&a2[v9[6]];
  *(void *)&a1[v9[7]] = *(void *)&a2[v9[7]];
  *(_OWORD *)&a1[v9[8]] = *(_OWORD *)&a2[v9[8]];
  uint64_t v10 = v9[9];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((void *)v11 + 2) = *((void *)v12 + 2);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(_DWORD *)uint64_t v14 = *(_DWORD *)&a2[v13];
  *(_OWORD *)(v14 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)&a2[v13 + 8];
  uint64_t v16 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v17 = v16[6];
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32LL))(v18, v19, v20);
  v14[v16[7]] = v15[v16[7]];
  *(void *)&v14[v16[8]] = *(void *)&v15[v16[8]];
  uint64_t v21 = v16[9];
  uint64_t v22 = &v14[v21];
  unint64_t v23 = &v15[v21];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&v15[v21], 1LL, v6))
  {
    uint64_t v24 = sub_100012990(&qword_10004E770);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64LL));
  }

  else
  {
    v8(v22, v23, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v22, 0LL, 1LL, v6);
  }

  return a1;
}

uint64_t sub_10002FE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for AppRecord(0LL);
  uint64_t v10 = v9[5];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = v11[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = v9[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  uint64_t v21 = v17[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease(v21);
  *(void *)(a1 + v9[7]) = *(void *)(a2 + v9[7]);
  uint64_t v22 = v9[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  unint64_t v25 = *(void *)(a1 + v22 + 8);
  if (v25 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v26 = *(void *)(v24 + 8);
  if (v26 >> 60 == 15)
  {
    sub_10001443C(v23);
LABEL_4:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    goto LABEL_6;
  }

  uint64_t v27 = *(void *)v23;
  *(void *)uint64_t v23 = *(void *)v24;
  *(void *)(v23 + _Block_object_dispose((const void *)(v1 - 112), 8) = v26;
  sub_1000106F8(v27, v25);
LABEL_6:
  uint64_t v28 = v9[9];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  unint64_t v31 = *(void *)(a1 + v28 + 16);
  if (v31 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
    *(void *)(v29 + 16) = *(void *)(v30 + 16);
    goto LABEL_11;
  }

  unint64_t v32 = *(void *)(v30 + 16);
  if (v32 >> 60 == 15)
  {
    sub_100014470(v29);
    goto LABEL_9;
  }

  *(_DWORD *)uint64_t v29 = *(_DWORD *)v30;
  uint64_t v33 = *(void *)(v29 + 8);
  *(void *)(v29 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(void *)(v30 + 8);
  *(void *)(v29 + 16) = v32;
  sub_1000106F8(v33, v31);
LABEL_11:
  uint64_t v34 = *(int *)(a3 + 20);
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(_DWORD *)uint64_t v35 = *(_DWORD *)(a2 + v34);
  uint64_t v37 = *(void *)(a1 + v34 + 8);
  unint64_t v38 = *(void *)(a1 + v34 + 16);
  *(_OWORD *)(v35 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + v34 + 8);
  sub_1000106F8(v37, v38);
  uint64_t v39 = (int *)type metadata accessor for LaunchWarningDetails(0LL);
  uint64_t v40 = v39[6];
  uint64_t v41 = v35 + v40;
  uint64_t v42 = v36 + v40;
  uint64_t v43 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 40LL))(v41, v42, v43);
  *(_BYTE *)(v35 + v39[7]) = *(_BYTE *)(v36 + v39[7]);
  *(void *)(v35 + v39[8]) = *(void *)(v36 + v39[8]);
  uint64_t v44 = v39[9];
  unint64_t v45 = (void *)(v35 + v44);
  uint64_t v46 = (void *)(v36 + v44);
  unint64_t v47 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v42) = v47(v45, 1LL, v6);
  int v48 = v47(v46, 1LL, v6);
  if (!(_DWORD)v42)
  {
    if (!v48)
    {
      v8((uint64_t)v45, (uint64_t)v46, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(v45, v6);
    goto LABEL_16;
  }

  if (v48)
  {
LABEL_16:
    uint64_t v49 = sub_100012990(&qword_10004E770);
    memcpy(v45, v46, *(void *)(*(void *)(v49 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v45, v46, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v45, 0LL, 1LL, v6);
  return a1;
}

uint64_t sub_1000300C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000300CC);
}

uint64_t sub_1000300CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AppRecord(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for LaunchWarningDetails(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t sub_100030140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003014C);
}

uint64_t sub_10003014C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for AppRecord(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for LaunchWarningDetails(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_1000301C8(uint64_t a1)
{
  uint64_t result = type metadata accessor for AppRecord(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for LaunchWarningDetails(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10003024C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 != 15) {
    return sub_1000106F8(a2, a3);
  }
  return result;
}

uint64_t sub_100030268(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(type metadata accessor for LaunchWarningController.NewLaunchWarning(0LL) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_100030384(__int16 a1, uint64_t a2, __int16 a3, double a4)
{
  NSString v8 = String._bridgeToObjectiveC()();
  uint64_t v9 = swift_allocObject(&unk_100047878, 48LL, 7LL);
  *(_BYTE *)(v9 + 16) = a1 & 1;
  *(_BYTE *)(v9 + 17) = HIBYTE(a1) & 1;
  *(void *)(v9 + 24) = a2;
  *(_BYTE *)(v9 + 32) = a3 & 1;
  *(_BYTE *)(v9 + 33) = HIBYTE(a3) & 1;
  *(double *)(v9 + 40) = a4;
  void v11[4] = sub_100030494;
  uint64_t v12 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_10003071C;
  v11[3] = &unk_100047890;
  uint64_t v10 = _Block_copy(v11);
  swift_release(v12);
  AnalyticsSendEventLazy(v8, v10);
  _Block_release(v10);
}

uint64_t sub_100030484()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_100030494()
{
  uint64_t v0 = sub_100012990(&qword_10004EB60);
  uint64_t inited = swift_initStackObject(v0, &v3);
  *(_OWORD *)(inited + 16) = xmmword_100038E60;
  *(void *)(inited + 32) = 0xD000000000000010LL;
  *(void *)(inited + 40) = 0x800000010003C570LL;
  *(NSNumber *)(inited + 4_Block_object_dispose((const void *)(v1 - 112), 8) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 56) = 0xD000000000000012LL;
  *(void *)(inited + 64) = 0x800000010003C590LL;
  *(NSNumber *)(inited + 72) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0xD000000000000012LL;
  *(void *)(inited + 8_Block_object_dispose((const void *)(v1 - 112), 8) = 0x800000010003C5B0LL;
  *(NSNumber *)(inited + 96) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 104) = 0x65746C694677656ELL;
  *(void *)(inited + 112) = 0xE900000000000072LL;
  *(NSNumber *)(inited + 120) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 12_Block_object_dispose((const void *)(v1 - 112), 8) = 0x70616C45656D6974LL;
  *(void *)(inited + 136) = 0xEB00000000646573LL;
  *(NSNumber *)(inited + 144) = Double._bridgeToObjectiveC()();
  *(void *)(inited + 152) = 0x6F43657461647075LL;
  *(void *)(inited + 160) = 0xEB00000000746E75LL;
  *(NSNumber *)(inited + 16_Block_object_dispose((const void *)(v1 - 112), 8) = Int._bridgeToObjectiveC()();
  return sub_100030604(inited);
}

unint64_t sub_100030604(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100012990(&qword_10004EB68);
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
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_100030F88(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    unint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    void v4[2] = v16;
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

Class sub_10003071C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_1000310CC();
    v5.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.Class isa = 0LL;
  }

  return v5.super.isa;
}

uint64_t sub_100030790(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000307A0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_1000307A8(uint64_t a1, double a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = swift_allocObject(&unk_1000478C8, 32LL, 7LL);
  *(void *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  v8[4] = sub_1000308B0;
  uint64_t v9 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_10003071C;
  v8[3] = &unk_1000478E0;
  uint64_t v6 = _Block_copy(v8);
  uint64_t v7 = v9;
  swift_errorRetain(a1);
  swift_release(v7);
  AnalyticsSendEventLazy(v4, v6);
  _Block_release(v6);
}

uint64_t sub_10003088C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_1000308B0()
{
  uint64_t v1 = (void *)_convertErrorToNSError(_:)(*(void *)(v0 + 16));
  uint64_t v2 = sub_100012990(&qword_10004EB60);
  uint64_t inited = swift_initStackObject(v2, v6);
  *(_OWORD *)(inited + 16) = xmmword_100038E70;
  *(void *)(inited + 32) = 1701080931LL;
  *(void *)(inited + 40) = 0xE400000000000000LL;
  [v1 code];
  *(NSNumber *)(inited + 4_Block_object_dispose((const void *)(v1 - 112), 8) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 56) = 0x6E69616D6F64LL;
  *(void *)(inited + 64) = 0xE600000000000000LL;
  id result = [v1 domain];
  if (result)
  {
    *(void *)(inited + 72) = result;
    *(void *)(inited + 80) = 0x70616C45656D6974LL;
    *(void *)(inited + 8_Block_object_dispose((const void *)(v1 - 112), 8) = 0xEB00000000646573LL;
    *(NSNumber *)(inited + 96) = Double._bridgeToObjectiveC()();
    unint64_t v5 = sub_100030604(inited);

    return (id)v5;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1000309AC(int a1, uint64_t a2, unint64_t a3, char a4, char a5)
{
  char v9 = a5 & 1;
  NSString v10 = String._bridgeToObjectiveC()();
  uint64_t v11 = swift_allocObject(&unk_100047918, 42LL, 7LL);
  *(_DWORD *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *(void *)(v11 + 32) = a3;
  *(_BYTE *)(v11 + 40) = v9;
  *(_BYTE *)(v11 + 41) = a4;
  v14[4] = sub_100030AB0;
  uint64_t v15 = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256LL;
  v14[2] = sub_10003071C;
  void v14[3] = &unk_100047930;
  char v12 = _Block_copy(v14);
  uint64_t v13 = v15;
  sub_100010640(a2, a3);
  swift_release(v13);
  AnalyticsSendEventLazy(v10, v12);
  _Block_release(v12);
}

uint64_t sub_100030AA8()
{
  return sub_100030CB8(42LL);
}

unint64_t sub_100030AB0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = sub_100012990(&qword_10004EB60);
  uint64_t inited = swift_initStackObject(v3, &v9);
  *(_OWORD *)(inited + 16) = xmmword_100038E80;
  *(void *)(inited + 32) = 0x687361686463LL;
  *(void *)(inited + 40) = 0xE600000000000000LL;
  sub_100012758(v1, v2);
  uint64_t v6 = v5;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  *(void *)(inited + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  *(void *)(inited + 56) = 0x7954687361686463LL;
  *(void *)(inited + 64) = 0xEA00000000006570LL;
  *(NSNumber *)(inited + 72) = UInt32._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0x6E6F697461636F6CLL;
  *(void *)(inited + 8_Block_object_dispose((const void *)(v1 - 112), 8) = 0xE800000000000000LL;
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 104) = 0x74616E696D726574LL;
  *(void *)(inited + 112) = 0xEA00000000006465LL;
  *(NSNumber *)(inited + 120) = Bool._bridgeToObjectiveC()();
  return sub_100030604(inited);
}

void sub_100030BC4(int a1, uint64_t a2, unint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  uint64_t v7 = swift_allocObject(&unk_100047968, 40LL, 7LL);
  *(_DWORD *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a3;
  v10[4] = sub_100030CE8;
  uint64_t v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256LL;
  void v10[2] = sub_10003071C;
  v10[3] = &unk_100047980;
  uint64_t v8 = _Block_copy(v10);
  uint64_t v9 = v11;
  sub_100010640(a2, a3);
  swift_release(v9);
  AnalyticsSendEventLazy(v6, v8);
  _Block_release(v8);
}

uint64_t sub_100030CB0()
{
  return sub_100030CB8(40LL);
}

uint64_t sub_100030CB8(uint64_t a1)
{
  return swift_deallocObject(v1, a1, 7LL);
}

unint64_t sub_100030CE8()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = sub_100012990(&qword_10004EB60);
  uint64_t inited = swift_initStackObject(v3, &v9);
  *(_OWORD *)(inited + 16) = xmmword_1000377F0;
  *(void *)(inited + 32) = 0x687361686463LL;
  *(void *)(inited + 40) = 0xE600000000000000LL;
  sub_100012758(v2, v1);
  uint64_t v6 = v5;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  *(void *)(inited + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  *(void *)(inited + 56) = 0x7954687361686463LL;
  *(void *)(inited + 64) = 0xEA00000000006570LL;
  *(NSNumber *)(inited + 72) = UInt32._bridgeToObjectiveC()();
  return sub_100030604(inited);
}

unint64_t sub_100030DA8()
{
  unint64_t result = qword_10004EAA0;
  if (!qword_10004EAA0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038E9C, &type metadata for WarningLocation);
    atomic_store(result, (unint64_t *)&qword_10004EAA0);
  }

  return result;
}

uint64_t sub_100030DEC(__int16 a1, uint64_t a2, __int16 a3)
{
  return (*(uint64_t (**)(void, uint64_t, void))(**(void **)v3 + 80LL))(a1 & 0x101, a2, a3 & 0x101);
}

uint64_t sub_100030E20()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88LL))();
}

uint64_t sub_100030E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(**(void **)v5 + 96LL))( a1,  a2,  a3,  a4,  a5 & 1);
}

uint64_t sub_100030E74()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104LL))();
}

uint64_t storeEnumTagSinglePayload for WarningLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100030EE8 + 4 * byte_100038E95[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100030F1C + 4 * byte_100038E90[v4]))();
}

uint64_t sub_100030F1C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100030F24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100030F2CLL);
  }
  return result;
}

uint64_t sub_100030F38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100030F40LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100030F44(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100030F4C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WarningLocation()
{
  return &type metadata for WarningLocation;
}

uint64_t type metadata accessor for MetricReporter()
{
  return objc_opt_self(&OBJC_CLASS____TtC17online_auth_agent14MetricReporter);
}

unint64_t sub_100030F88(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100030FEC(a1, a2, v5);
}

unint64_t sub_100030FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_1000310CC()
{
  unint64_t result = qword_10004EB70;
  if (!qword_10004EB70)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSObject);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004EB70);
  }

  return result;
}

uint64_t type metadata accessor for BloomFilterRecord(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_100051580, (uint64_t)&nominal type descriptor for BloomFilterRecord);
}

int *sub_100031134@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v23 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32LL))(a9, a1, v23);
  unint64_t result = (int *)type metadata accessor for BloomFilterRecord(0LL);
  unint64_t v25 = (void *)(a9 + result[5]);
  *unint64_t v25 = a2;
  v25[1] = a3;
  *(void *)(a9 + result[6]) = a4;
  unint64_t v26 = (void *)(a9 + result[7]);
  void *v26 = a5;
  v26[1] = a6;
  uint64_t v27 = (void *)(a9 + result[8]);
  *uint64_t v27 = a7;
  v27[1] = a8;
  uint64_t v28 = (void *)(a9 + result[9]);
  *uint64_t v28 = a10;
  v28[1] = a11;
  uint64_t v29 = (void *)(a9 + result[10]);
  void *v29 = a12;
  v29[1] = a13;
  *(void *)(a9 + result[11]) = a14;
  uint64_t v30 = (void *)(a9 + result[12]);
  *uint64_t v30 = a15;
  v30[1] = a16;
  return result;
}

uint64_t sub_100031258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
}

uint64_t sub_100031294@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t type metadata accessor for BaseZoneSyncResult(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_1000515A0, (uint64_t)&nominal type descriptor for BaseZoneSyncResult);
}

uint64_t sub_1000312BC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = type metadata accessor for BaseZoneSyncResult(0LL);
  uint64_t result = sub_10002A73C(a2, a5 + *(int *)(v9 + 20), &qword_10004E5A0);
  uint64_t v11 = (void *)(a5 + *(int *)(v9 + 24));
  *uint64_t v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t sub_100031334(char a1)
{
  return a1 & 1;
}

unint64_t sub_100031340()
{
  unint64_t result = qword_10004EB78;
  if (!qword_10004EB78)
  {
    unint64_t result = swift_getWitnessTable(&unk_100038FAC, &type metadata for CloudKitOperationsError);
    atomic_store(result, (unint64_t *)&qword_10004EB78);
  }

  return result;
}

uint64_t *sub_100031384(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v36);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    NSString v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = *v10;
    unint64_t v12 = v10[1];
    sub_100010640(*v10, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = *(uint64_t *)((char *)a2 + v13);
    uint64_t *v9 = v11;
    v9[1] = v12;
    *(uint64_t *)((char *)a1 + v13) = v15;
    BOOL v16 = (uint64_t *)((char *)a1 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (uint64_t *)((char *)a1 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    void *v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = (uint64_t *)((char *)a1 + v20);
    unint64_t v25 = (uint64_t *)((char *)a2 + v20);
    uint64_t v26 = v25[1];
    void *v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[10];
    uint64_t v28 = a3[11];
    uint64_t v29 = (uint64_t *)((char *)a1 + v27);
    uint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    *(uint64_t *)((char *)a1 + v2_Block_object_dispose((const void *)(v1 - 112), 8) = *(uint64_t *)((char *)a2 + v28);
    uint64_t v32 = a3[12];
    uint64_t v33 = (uint64_t *)((char *)a1 + v32);
    uint64_t v34 = (uint64_t *)((char *)a2 + v32);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v35);
  }

  return a1;
}

uint64_t sub_1000314BC(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  sub_1000106F8(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[8] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[9] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[10] + 8));
  return swift_bridgeObjectRelease(*(void *)(a1 + a2[12] + 8));
}

uint64_t sub_100031554(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_100010640(*v9, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void *)(a2 + v12);
  *uint64_t v8 = v10;
  v8[1] = v11;
  *(void *)(a1 + v12) = v14;
  uint64_t v15 = (void *)(a1 + v13);
  BOOL v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)(a1 + v18);
  uint64_t v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = (void *)(a1 + v19);
  uint64_t v24 = (void *)(a2 + v19);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = a3[10];
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v26);
  uint64_t v29 = (void *)(a2 + v26);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v34);
  return a1;
}

uint64_t sub_100031660(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  sub_100010640(*v9, v11);
  uint64_t v12 = *v8;
  unint64_t v13 = v8[1];
  *uint64_t v8 = v10;
  v8[1] = v11;
  sub_1000106F8(v12, v13);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  BOOL v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  uint64_t v17 = v16[1];
  uint64_t v18 = v15[1];
  v15[1] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  *uint64_t v20 = *v21;
  uint64_t v22 = v21[1];
  uint64_t v23 = v20[1];
  v20[1] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  uint64_t v27 = v26[1];
  uint64_t v28 = v25[1];
  v25[1] = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  uint64_t v29 = a3[10];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  uint64_t v32 = v31[1];
  uint64_t v33 = v30[1];
  v30[1] = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v34 = a3[12];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  *uint64_t v35 = *v36;
  uint64_t v37 = v36[1];
  uint64_t v38 = v35[1];
  v35[1] = v37;
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v38);
  return a1;
}

uint64_t sub_1000317D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v_Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_100031874(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void *)(a1 + v7);
  unint64_t v9 = *(void *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for FilterOperation.decompress(_:), v7) = *(_OWORD *)(a2 + v7);
  sub_1000106F8(v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  unint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = v11[1];
  *unint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  uint64_t v21 = v17[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease(v21);
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  uint64_t v27 = v23[1];
  void *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease(v27);
  uint64_t v28 = a3[10];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  uint64_t v33 = v29[1];
  void *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease(v33);
  uint64_t v34 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  uint64_t v39 = v35[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease(v39);
  return a1;
}

uint64_t sub_100031978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031984);
}

uint64_t sub_100031984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_100031A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031A10);
}

uint64_t sub_100031A10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 28) + _Block_object_dispose((const void *)(v1 - 112), 8) = (a2 - 1);
  return result;
}

uint64_t sub_100031A8C(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_100039078;
    void v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
    void v4[3] = &unk_100039090;
    v4[4] = &unk_100039090;
    v4[5] = &unk_100039090;
    void v4[6] = &unk_100039090;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = &unk_1000390A8;
    swift_initStructMetadata(a1, 256LL, 9LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100031B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_100031B64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_100031B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100031BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100031C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100031C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100031CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031CB4);
}

uint64_t sub_100031CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_100031CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031CFC);
}

uint64_t sub_100031CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DocumentCheckerRecord(uint64_t a1)
{
  return sub_100012E08(a1, (uint64_t *)&unk_100051590, (uint64_t)&nominal type descriptor for DocumentCheckerRecord);
}

uint64_t sub_100031D50(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t destroy for BloomFilterUpdateRecord(void *a1)
{
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 16);
  sub_100010640(v4, v5);
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  return a1;
}

void *assignWithCopy for BloomFilterUpdateRecord(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_100010640(v4, v5);
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_1000106F8(v6, v7);
  a1[3] = a2[3];
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BloomFilterUpdateRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1000106F8(v4, v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 112), 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(sub_1000106F8(v3, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterUpdateRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 64) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for BloomFilterUpdateRecord()
{
  return &type metadata for BloomFilterUpdateRecord;
}

uint64_t *sub_10003200C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v10);
  }

  else
  {
    uint64_t v7 = (int *)type metadata accessor for BloomFilterRecord(0LL);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1LL, v7))
    {
      uint64_t v9 = sub_100012990(&qword_10004E5A8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64LL));
    }

    else
    {
      uint64_t v11 = type metadata accessor for URL(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      uint64_t v12 = v7[5];
      uint64_t v13 = (uint64_t *)((char *)a1 + v12);
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_100010640(*v14, v16);
      *uint64_t v13 = v15;
      v13[1] = v16;
      *(uint64_t *)((char *)a1 + v7[6]) = *(uint64_t *)((char *)a2 + v7[6]);
      uint64_t v17 = v7[7];
      uint64_t v18 = (uint64_t *)((char *)a1 + v17);
      uint64_t v19 = (uint64_t *)((char *)a2 + v17);
      uint64_t v20 = v19[1];
      void *v18 = *v19;
      v18[1] = v20;
      uint64_t v21 = v7[8];
      uint64_t v22 = (uint64_t *)((char *)a1 + v21);
      uint64_t v23 = (uint64_t *)((char *)a2 + v21);
      uint64_t v24 = v23[1];
      void *v22 = *v23;
      v22[1] = v24;
      uint64_t v25 = v7[9];
      uint64_t v26 = (uint64_t *)((char *)a1 + v25);
      uint64_t v27 = (uint64_t *)((char *)a2 + v25);
      uint64_t v28 = v27[1];
      void *v26 = *v27;
      v26[1] = v28;
      uint64_t v29 = v7[10];
      uint64_t v30 = (uint64_t *)((char *)a1 + v29);
      uint64_t v31 = (uint64_t *)((char *)a2 + v29);
      uint64_t v32 = v31[1];
      *uint64_t v30 = *v31;
      v30[1] = v32;
      *(uint64_t *)((char *)a1 + v7[11]) = *(uint64_t *)((char *)a2 + v7[11]);
      uint64_t v33 = v7[12];
      uint64_t v34 = (uint64_t *)((char *)a1 + v33);
      uint64_t v35 = (uint64_t *)((char *)a2 + v33);
      uint64_t v36 = v35[1];
      *uint64_t v34 = *v35;
      v34[1] = v36;
      uint64_t v37 = *(void (**)(uint64_t *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRetain(v28);
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRetain(v36);
      v37(a1, 0LL, 1LL, v7);
    }

    uint64_t v38 = *(int *)(a3 + 20);
    uint64_t v39 = (char *)a1 + v38;
    uint64_t v40 = (char *)a2 + v38;
    uint64_t v41 = type metadata accessor for DocumentCheckerRecord(0LL);
    uint64_t v42 = *(void *)(v41 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1LL, v41))
    {
      uint64_t v43 = sub_100012990(&qword_10004E5A0);
      memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64LL));
    }

    else
    {
      uint64_t v44 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16LL))(v39, v40, v44);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v39, 0LL, 1LL, v41);
    }

    uint64_t v45 = *(int *)(a3 + 24);
    uint64_t v46 = (char *)a1 + v45;
    unint64_t v47 = (char *)a2 + v45;
    unint64_t v48 = *((void *)v47 + 1);
    if (v48 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    }

    else
    {
      uint64_t v49 = *(void *)v47;
      sub_100010640(*(void *)v47, *((void *)v47 + 1));
      *(void *)uint64_t v46 = v49;
      *((void *)v46 + 1) = v48;
    }
  }

  return a1;
}

uint64_t sub_100032290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for BloomFilterRecord(0LL);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v4 - 1) + 48LL))(a1, 1LL, v4))
  {
    uint64_t v5 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
    sub_1000106F8(*(void *)(a1 + v4[5]), *(void *)(a1 + v4[5] + 8));
    swift_bridgeObjectRelease(*(void *)(a1 + v4[7] + 8));
    swift_bridgeObjectRelease(*(void *)(a1 + v4[8] + 8));
    swift_bridgeObjectRelease(*(void *)(a1 + v4[9] + 8));
    swift_bridgeObjectRelease(*(void *)(a1 + v4[10] + 8));
    swift_bridgeObjectRelease(*(void *)(a1 + v4[12] + 8));
  }

  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = type metadata accessor for DocumentCheckerRecord(0LL);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(v6, 1LL, v7);
  if (!(_DWORD)result)
  {
    uint64_t v9 = type metadata accessor for URL(0LL);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v6, v9);
  }

  uint64_t v10 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  unint64_t v11 = v10[1];
  if (v11 >> 60 != 15) {
    return sub_1000106F8(*v10, v11);
  }
  return result;
}

char *sub_1000323D0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_100012990(&qword_10004E5A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    uint64_t v9 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(a1, a2, v9);
    uint64_t v10 = v6[5];
    unint64_t v11 = (uint64_t *)&a1[v10];
    uint64_t v12 = (uint64_t *)&a2[v10];
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    sub_100010640(*v12, v14);
    *unint64_t v11 = v13;
    v11[1] = v14;
    *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
    uint64_t v15 = v6[7];
    unint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)unint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    uint64_t v19 = v6[8];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = v6[9];
    uint64_t v24 = &a1[v23];
    uint64_t v25 = &a2[v23];
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    uint64_t v27 = v6[10];
    uint64_t v28 = &a1[v27];
    uint64_t v29 = &a2[v27];
    uint64_t v30 = *((void *)v29 + 1);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
    uint64_t v31 = v6[12];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    uint64_t v34 = *((void *)v33 + 1);
    *(void *)uint64_t v32 = *(void *)v33;
    *((void *)v32 + 1) = v34;
    uint64_t v35 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v34);
    v35(a1, 0LL, 1LL, v6);
  }

  uint64_t v36 = *(int *)(a3 + 20);
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = type metadata accessor for DocumentCheckerRecord(0LL);
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1LL, v39))
  {
    uint64_t v41 = sub_100012990(&qword_10004E5A0);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64LL));
  }

  else
  {
    uint64_t v42 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16LL))(v37, v38, v42);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0LL, 1LL, v39);
  }

  uint64_t v43 = *(int *)(a3 + 24);
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &a2[v43];
  unint64_t v46 = *((void *)v45 + 1);
  if (v46 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  }

  else
  {
    uint64_t v47 = *(void *)v45;
    sub_100010640(*(void *)v45, *((void *)v45 + 1));
    *(void *)uint64_t v44 = v47;
    *((void *)v44 + 1) = v46;
  }

  return a1;
}

char *sub_100032628(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(a1, a2, v11);
      uint64_t v12 = v6[5];
      uint64_t v13 = (uint64_t *)&a1[v12];
      unint64_t v14 = (uint64_t *)&a2[v12];
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_100010640(*v14, v16);
      *uint64_t v13 = v15;
      v13[1] = v16;
      *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
      uint64_t v17 = v6[7];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      *(void *)uint64_t v18 = *(void *)v19;
      uint64_t v20 = *((void *)v19 + 1);
      *((void *)v18 + 1) = v20;
      uint64_t v21 = v6[8];
      uint64_t v22 = &a1[v21];
      uint64_t v23 = &a2[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      uint64_t v24 = *((void *)v23 + 1);
      *((void *)v22 + 1) = v24;
      uint64_t v25 = v6[9];
      uint64_t v26 = &a1[v25];
      uint64_t v27 = &a2[v25];
      *(void *)uint64_t v26 = *(void *)v27;
      uint64_t v28 = *((void *)v27 + 1);
      *((void *)v26 + 1) = v28;
      uint64_t v29 = v6[10];
      uint64_t v30 = &a1[v29];
      uint64_t v31 = &a2[v29];
      *(void *)uint64_t v30 = *(void *)v31;
      uint64_t v32 = *((void *)v31 + 1);
      *((void *)v30 + 1) = v32;
      *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
      uint64_t v33 = v6[12];
      uint64_t v34 = &a1[v33];
      uint64_t v35 = &a2[v33];
      *(void *)uint64_t v34 = *(void *)v35;
      uint64_t v36 = *((void *)v35 + 1);
      *((void *)v34 + 1) = v36;
      uint64_t v37 = *(void (**)(char *, void, uint64_t, int *))(v7 + 56);
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRetain(v28);
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRetain(v36);
      v37(a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  if (v10)
  {
    sub_100014850((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    uint64_t v38 = sub_100012990(&qword_10004E5A8);
    memcpy(a1, a2, *(void *)(*(void *)(v38 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v58 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 24LL))(a1, a2, v58);
  uint64_t v59 = v6[5];
  uint64_t v60 = (uint64_t *)&a1[v59];
  uint64_t v61 = (uint64_t *)&a2[v59];
  uint64_t v62 = *v61;
  unint64_t v63 = v61[1];
  sub_100010640(*v61, v63);
  uint64_t v64 = *v60;
  unint64_t v65 = v60[1];
  *uint64_t v60 = v62;
  v60[1] = v63;
  sub_1000106F8(v64, v65);
  *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
  uint64_t v66 = v6[7];
  uint64_t v67 = &a1[v66];
  uint64_t v68 = &a2[v66];
  *(void *)uint64_t v67 = *(void *)v68;
  uint64_t v69 = *((void *)v68 + 1);
  uint64_t v70 = *((void *)v67 + 1);
  *((void *)v67 + 1) = v69;
  swift_bridgeObjectRetain(v69);
  swift_bridgeObjectRelease(v70);
  uint64_t v71 = v6[8];
  uint64_t v72 = &a1[v71];
  uint64_t v73 = &a2[v71];
  *(void *)uint64_t v72 = *(void *)v73;
  uint64_t v74 = *((void *)v73 + 1);
  uint64_t v75 = *((void *)v72 + 1);
  *((void *)v72 + 1) = v74;
  swift_bridgeObjectRetain(v74);
  swift_bridgeObjectRelease(v75);
  uint64_t v76 = v6[9];
  uint64_t v77 = &a1[v76];
  uint64_t v78 = &a2[v76];
  *(void *)uint64_t v77 = *(void *)v78;
  uint64_t v79 = *((void *)v78 + 1);
  uint64_t v80 = *((void *)v77 + 1);
  *((void *)v77 + 1) = v79;
  swift_bridgeObjectRetain(v79);
  swift_bridgeObjectRelease(v80);
  uint64_t v81 = v6[10];
  uint64_t v82 = &a1[v81];
  uint64_t v83 = &a2[v81];
  *(void *)uint64_t v82 = *(void *)v83;
  uint64_t v84 = *((void *)v83 + 1);
  uint64_t v85 = *((void *)v82 + 1);
  *((void *)v82 + 1) = v84;
  swift_bridgeObjectRetain(v84);
  swift_bridgeObjectRelease(v85);
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  uint64_t v86 = v6[12];
  id v87 = &a1[v86];
  uint64_t v88 = &a2[v86];
  *(void *)id v87 = *(void *)v88;
  uint64_t v89 = *((void *)v88 + 1);
  uint64_t v90 = *((void *)v87 + 1);
  *((void *)v87 + 1) = v89;
  swift_bridgeObjectRetain(v89);
  swift_bridgeObjectRelease(v90);
LABEL_7:
  uint64_t v39 = *(int *)(a3 + 20);
  uint64_t v40 = &a1[v39];
  uint64_t v41 = &a2[v39];
  uint64_t v42 = type metadata accessor for DocumentCheckerRecord(0LL);
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48);
  int v45 = v44(v40, 1LL, v42);
  int v46 = v44(v41, 1LL, v42);
  if (v45)
  {
    if (!v46)
    {
      uint64_t v47 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16LL))(v40, v41, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v40, 0LL, 1LL, v42);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (v46)
  {
    sub_100014850((uint64_t)v40, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    uint64_t v48 = sub_100012990(&qword_10004E5A0);
    memcpy(v40, v41, *(void *)(*(void *)(v48 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v91 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 24LL))(v40, v41, v91);
LABEL_13:
  uint64_t v49 = *(int *)(a3 + 24);
  uint64_t v50 = (uint64_t *)&a1[v49];
  uint64_t v51 = (uint64_t *)&a2[v49];
  unint64_t v52 = *(void *)&a2[v49 + 8];
  if (*(void *)&a1[v49 + 8] >> 60 != 15LL)
  {
    if (v52 >> 60 != 15)
    {
      uint64_t v54 = *v51;
      sub_100010640(v54, v52);
      uint64_t v55 = *v50;
      unint64_t v56 = v50[1];
      uint64_t *v50 = v54;
      v50[1] = v52;
      sub_1000106F8(v55, v56);
      return a1;
    }

    sub_10001443C((uint64_t)v50);
    goto LABEL_18;
  }

  if (v52 >> 60 == 15)
  {
LABEL_18:
    *(_OWORD *)uint64_t v50 = *(_OWORD *)v51;
    return a1;
  }

  uint64_t v53 = *v51;
  sub_100010640(v53, v52);
  uint64_t *v50 = v53;
  v50[1] = v52;
  return a1;
}

char *sub_100032AA8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1LL, v6))
  {
    uint64_t v8 = sub_100012990(&qword_10004E5A8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    uint64_t v9 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(a1, a2, v9);
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
    *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
    *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
    *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
    *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
    *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
    *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
    (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
  }

  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for DocumentCheckerRecord(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13))
  {
    uint64_t v15 = sub_100012990(&qword_10004E5A0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    uint64_t v16 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32LL))(v11, v12, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 1LL, v13);
  }

  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_100032C68(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = (int *)type metadata accessor for BloomFilterRecord(0LL);
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  int v9 = v8(a1, 1LL, v6);
  int v10 = v8(a2, 1LL, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, a2, v11);
      *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
      *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
      *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
      *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
      *(_OWORD *)&a1[v6[9]] = *(_OWORD *)&a2[v6[9]];
      *(_OWORD *)&a1[v6[10]] = *(_OWORD *)&a2[v6[10]];
      *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
      *(_OWORD *)&a1[v6[12]] = *(_OWORD *)&a2[v6[12]];
      (*(void (**)(char *, void, uint64_t, int *))(v7 + 56))(a1, 0LL, 1LL, v6);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  if (v10)
  {
    sub_100014850((uint64_t)a1, type metadata accessor for BloomFilterRecord);
LABEL_6:
    uint64_t v12 = sub_100012990(&qword_10004E5A8);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64LL));
    goto LABEL_7;
  }

  uint64_t v30 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40LL))(a1, a2, v30);
  uint64_t v31 = v6[5];
  uint64_t v32 = *(void *)&a1[v31];
  unint64_t v33 = *(void *)&a1[v31 + 8];
  *(_OWORD *)&a1[v31] = *(_OWORD *)&a2[v31];
  sub_1000106F8(v32, v33);
  *(void *)&a1[v6[6]] = *(void *)&a2[v6[6]];
  uint64_t v34 = v6[7];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v38 = *(void *)v36;
  uint64_t v37 = *((void *)v36 + 1);
  uint64_t v39 = *((void *)v35 + 1);
  *(void *)uint64_t v35 = v38;
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease(v39);
  uint64_t v40 = v6[8];
  uint64_t v41 = &a1[v40];
  uint64_t v42 = &a2[v40];
  uint64_t v44 = *(void *)v42;
  uint64_t v43 = *((void *)v42 + 1);
  uint64_t v45 = *((void *)v41 + 1);
  *(void *)uint64_t v41 = v44;
  *((void *)v41 + 1) = v43;
  swift_bridgeObjectRelease(v45);
  uint64_t v46 = v6[9];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v50 = *(void *)v48;
  uint64_t v49 = *((void *)v48 + 1);
  uint64_t v51 = *((void *)v47 + 1);
  *(void *)uint64_t v47 = v50;
  *((void *)v47 + 1) = v49;
  swift_bridgeObjectRelease(v51);
  uint64_t v52 = v6[10];
  uint64_t v53 = &a1[v52];
  uint64_t v54 = &a2[v52];
  uint64_t v56 = *(void *)v54;
  uint64_t v55 = *((void *)v54 + 1);
  uint64_t v57 = *((void *)v53 + 1);
  *(void *)uint64_t v53 = v56;
  *((void *)v53 + 1) = v55;
  swift_bridgeObjectRelease(v57);
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  uint64_t v58 = v6[12];
  uint64_t v59 = &a1[v58];
  uint64_t v60 = &a2[v58];
  uint64_t v62 = *(void *)v60;
  uint64_t v61 = *((void *)v60 + 1);
  uint64_t v63 = *((void *)v59 + 1);
  *(void *)uint64_t v59 = v62;
  *((void *)v59 + 1) = v61;
  swift_bridgeObjectRelease(v63);
LABEL_7:
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for DocumentCheckerRecord(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1LL, v16);
  int v20 = v18(v15, 1LL, v16);
  if (v19)
  {
    if (!v20)
    {
      uint64_t v21 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32LL))(v14, v15, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0LL, 1LL, v16);
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (v20)
  {
    sub_100014850((uint64_t)v14, type metadata accessor for DocumentCheckerRecord);
LABEL_12:
    uint64_t v22 = sub_100012990(&qword_10004E5A0);
    memcpy(v14, v15, *(void *)(*(void *)(v22 - 8) + 64LL));
    goto LABEL_13;
  }

  uint64_t v64 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 40LL))(v14, v15, v64);
LABEL_13:
  uint64_t v23 = *(int *)(a3 + 24);
  uint64_t v24 = (uint64_t *)&a1[v23];
  uint64_t v25 = (uint64_t *)&a2[v23];
  unint64_t v26 = *(void *)&a1[v23 + 8];
  if (v26 >> 60 != 15)
  {
    unint64_t v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      uint64_t v28 = *v24;
      uint64_t *v24 = *v25;
      v24[1] = v27;
      sub_1000106F8(v28, v26);
      return a1;
    }

    sub_10001443C((uint64_t)v24);
  }

  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  return a1;
}

uint64_t sub_100032FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100032FDC);
}

uint64_t sub_100032FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100012990(&qword_10004E5A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
    return v9(v10, a2, v8);
  }

  uint64_t v11 = sub_100012990(&qword_10004E5A0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }

  uint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  BOOL v15 = ((4 * (_DWORD)v14) & 0xC) == 0;
  unsigned int v16 = ((4 * v14) & 0xC | (v14 >> 2)) ^ 0xF;
  if (v15) {
    return 0LL;
  }
  else {
    return v16;
  }
}

uint64_t sub_100033098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000330A4);
}

uint64_t sub_1000330A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100012990(&qword_10004E5A8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
    return v11(v12, a2, a2, v10);
  }

  uint64_t result = sub_100012990(&qword_10004E5A0);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }

  BOOL v15 = (void *)(a1 + *(int *)(a4 + 24));
  *BOOL v15 = 0LL;
  v15[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
  return result;
}

void sub_100033160(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_10003320C(319LL, (unint64_t *)&unk_10004ED00, type metadata accessor for DocumentCheckerRecord);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      _OWORD v6[2] = &unk_100039118;
      swift_initStructMetadata(a1, 256LL, 3LL, v6, a1 + 16);
    }
  }

void sub_10003320C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  if (!*a2)
  {
    uint64_t v5 = a3(255LL);
    unint64_t v6 = type metadata accessor for Optional(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

uint64_t destroy for UpdateZoneSyncResult(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 >> 60 != 15) {
    return sub_1000106F8(*(void *)(result + 8), v1);
  }
  return result;
}

uint64_t _s17online_auth_agent20UpdateZoneSyncResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  unint64_t v3 = (uint64_t *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = *(_OWORD *)v3;
  }

  else
  {
    uint64_t v5 = *v3;
    sub_100010640(*v3, *(void *)(a2 + 16));
    *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v5;
    *(void *)(a1 + 16) = v4;
  }

  return a1;
}

uint64_t assignWithCopy for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  unint64_t v3 = (_OWORD *)(a1 + 8);
  unint64_t v4 = (uint64_t *)(a2 + 8);
  unint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16) >> 60 != 15LL)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_100010640(*v4, *(void *)(a2 + 16));
      uint64_t v8 = *(void *)(a1 + 8);
      unint64_t v9 = *(void *)(a1 + 16);
      *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v7;
      *(void *)(a1 + 16) = v5;
      sub_1000106F8(v8, v9);
      return a1;
    }

    sub_10001443C(a1 + 8);
    goto LABEL_6;
  }

  if (v5 >> 60 == 15)
  {
LABEL_6:
    _OWORD *v3 = *(_OWORD *)v4;
    return a1;
  }

  uint64_t v6 = *v4;
  sub_100010640(*v4, *(void *)(a2 + 16));
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = v6;
  *(void *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithTake for UpdateZoneSyncResult(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 8);
  unint64_t v5 = (void *)(a2 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 16);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 112), 8) = *v5;
      *(void *)(a1 + 16) = v7;
      sub_1000106F8(v8, v6);
      return a1;
    }

    sub_10001443C(a1 + 8);
  }

  *unint64_t v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateZoneSyncResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateZoneSyncResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 24) = 0;
    }
    if (a2) {
      *(_BYTE *)uint64_t result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for UpdateZoneSyncResult()
{
  return &type metadata for UpdateZoneSyncResult;
}

uint64_t storeEnumTagSinglePayload for CloudKitOperationsError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1000334F4 + 4 * asc_100038FA0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100033514 + 4 * byte_100038FA5[v4]))();
  }
}

_BYTE *sub_1000334F4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_100033514(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_10003351C(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100033524(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_10003352C(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100033534(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CloudKitOperationsError()
{
  return &type metadata for CloudKitOperationsError;
}

BOOL sub_100033550(void *a1)
{
  if (!objc_msgSend( a1,  "caseInsensitiveCompare:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  "fbe71da1-0834-4d49-9b41-d3fa7f9e4d4f"))) {
    return 1LL;
  }
  unint64_t v2 = 0LL;
  do
  {
    unint64_t v3 = v2;
    if (v2 == 14) {
      break;
    }
    id v4 = objc_msgSend( a1,  "caseInsensitiveCompare:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (&off_100047CB8)[v2 + 1]));
    unint64_t v2 = v3 + 1;
  }

  while (v4);
  return v3 < 0xE;
}

void sub_1000335E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033618()
{
}

void sub_100033680(sqlite3 **a1, os_log_s *a2)
{
}

void sub_1000336FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033730()
{
}

void sub_100033798(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  sub_100006418((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to table row count for %@: %d", (uint8_t *)&v3);
  sub_100006480();
}

void sub_100033810(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_100033884()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_1000338AC()
{
}

void sub_10003391C()
{
}

void sub_10003398C()
{
}

void sub_1000339FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033A2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033A5C(uint64_t a1, int a2, os_log_s *a3)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  sub_100006418( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Caller (pid %d) does not have required entitlement '%s'",  (uint8_t *)v3);
}

void sub_100033AD8()
{
}

void sub_100033B04()
{
}

void sub_100033B30(uint64_t a1, os_log_s *a2)
{
  int v4 = *__error();
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_100006418( (void *)&_mh_execute_header,  a2,  v5,  "Unable to create data directory '%s' (error %{errno}d)!",  (uint8_t *)&v6);
}

void sub_100033BC4()
{
}

void sub_100033BF0()
{
}

void sub_100033C1C()
{
}

void sub_100033C48()
{
}

void sub_100033C74()
{
}

void sub_100033CA0()
{
}

void sub_100033CCC()
{
}

void sub_100033CF8()
{
}

void sub_100033D24()
{
}

void sub_100033D50()
{
}

void sub_100033D7C()
{
}

void sub_100033DA8()
{
}

void sub_100033DD4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033E38()
{
}

void sub_100033E64()
{
  __assert_rtn("peerEventHandler", "online_auth_agent.m", 784, "reply != NULL");
}

void sub_100033E8C()
{
}

void sub_100033EB8()
{
}

void sub_100033EE4()
{
}

void sub_100033F10()
{
}

void sub_100033F3C()
{
}

void sub_100033F68(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to set trust for UPP %s: %@",  (uint8_t *)&v3,  0x16u);
  sub_100006480();
}

void sub_100033FE8()
{
}

void sub_100034014()
{
}

void sub_100034040()
{
}

void sub_10003406C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000340D0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034134()
{
}

void sub_100034160( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000341C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000341F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034224( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034254( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000342BC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034320( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034384()
{
}

void sub_1000343B0(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10000BB08((void *)&_mh_execute_header, a2, v4, "Could not convert dictionary to JSON: %@", (uint8_t *)&v5);

  sub_100006710();
}

void sub_100034438()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAAKeychainLabel) getkMAOptionsBAAKeychainLabel(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  28,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_1000344A8()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAAKeychainAccessGroup) getkMAOptionsBAAKeychainAccessGroup(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  29,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_100034518()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAANetworkTimeoutInterval) getkMAOptionsBAANetworkTimeoutInterval(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  30,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_100034588()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAAValidity) getkMAOptionsBAAValidity(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  31,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_1000345F8()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAASCRTAttestation) getkMAOptionsBAASCRTAttestation(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  32,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_100034668()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "typeof (kMAOptionsBAAAccessControls) getkMAOptionsBAAAccessControls(void)"));
  objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"online_auth_server.m",  33,  @"%s",  sub_10000BB00());

  __break(1u);
}

void sub_1000346D8()
{
}

void sub_100034704()
{
}

void sub_100034730()
{
}

void sub_10003475C()
{
}

void sub_100034788(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Could not create CMS blob, got error %d",  (uint8_t *)v2,  8u);
  sub_100006F68();
}

void sub_1000347F8(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 40LL);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10000BB08((void *)&_mh_execute_header, a2, a3, "Couldn't get device identity %@", (uint8_t *)&v4);
}

void sub_10003486C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_10000BB08((void *)&_mh_execute_header, a2, v4, "session error: %@", (uint8_t *)&v5);

  sub_100006710();
}

void sub_1000348F0()
{
}

void sub_10003491C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *DeviceIdentityLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"online_auth_server.m",  27,  @"%s",  *a1);

  __break(1u);
}

void sub_100034998()
{
}

void sub_1000349C4()
{
}

void sub_1000349F0()
{
}

void sub_100034A1C()
{
}

void sub_100034A48()
{
}

void sub_100034A74(os_log_s *a1)
{
}

void sub_100034AF0(uint64_t a1, os_log_s *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 24LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Denylist is too short (%lld bytes) for header (%lu bytes)",  (uint8_t *)&v2,  0x16u);
  sub_100006480();
}

void sub_100034B70(os_log_s *a1)
{
}

void sub_100034BEC()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Denylist entries offset %u is past denylist size %lld",  v2,  0x12u);
  sub_100006480();
}

void sub_100034C6C()
{
}

void sub_100034CD4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034D38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failure writing out auth list", v1, 2u);
}

void sub_100034D78( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034DE0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to migrate UPP %@: %@",  (uint8_t *)&v3,  0x16u);
  sub_100006480();
}

void sub_100034E60()
{
}

void sub_100034E8C()
{
}

void sub_100034EEC()
{
}

void sub_100034F4C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034FB4(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *ProfileValidatedAppIdentityLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"AppIdentity.m",  18,  @"%s",  *a1);

  __break(1u);
}

void sub_100035030()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getPVAppIdentityDigestClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"AppIdentity.m",  19,  @"Unable to find class %s",  "PVAppIdentityDigest");

  __break(1u);
}

void sub_1000350A8()
{
}

void sub_1000350D4()
{
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_applicationProxyForIdentifier_placeholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:placeholder:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return _[a1 asDictionary];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createUserTrustedProfileEntryWithUuid_teamId_signature_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createUserTrustedProfileEntryWithUuid:teamId:signature:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteTrustedProfileWithUuid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteTrustedProfileWithUuid:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_digestWithTimeoutError(void *a1, const char *a2, ...)
{
  return _[a1 digestWithTimeoutError];
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateBundlesOfType:block:");
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLinesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_executeQuery_withBind_withCancellableResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withBind:withCancellableResults:");
}

id objc_msgSend_executeQuery_withBind_withResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withBind:withResults:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 finishTasksAndInvalidate];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseURL:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lookupLaunchWarningData_cdhashType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupLaunchWarningData:cdhashType:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return _[a1 profileValidated];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setUserOverride_forID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserOverride:forID:error:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setupPermissions(void *a1, const char *a2, ...)
{
  return _[a1 setupPermissions];
}

id objc_msgSend_setupSchema(void *a1, const char *a2, ...)
{
  return _[a1 setupSchema];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_uploadTaskWithRequest_fromData_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithRequest:fromData:completionHandler:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}