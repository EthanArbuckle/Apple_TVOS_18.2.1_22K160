void sub_1000007E0(uint64_t a1)
{
  const void *v1;
  v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

CFStringRef sub_1000007F0(uint64_t a1)
{
  return CFStringCreateWithFormat(0LL, 0LL, @"<LogCtxRef: %p>", a1);
}

uint64_t sub_100000820(uint64_t *a1)
{
  if (isatty(2))
  {
    qword_10000C1B8 = (uint64_t)__stderrp;
    v2 = sub_1000008D4;
  }

  else
  {
    v2 = 0LL;
  }

  if (sub_100000F64())
  {
    int v3 = open("/dev/console", 131073);
    qword_10000C1B8 = (uint64_t)fdopen(v3, "w");
    v2 = sub_1000008D4;
  }

  uint64_t result = sub_100000C3C((dispatch_once_t *)&off_10000C000, 40LL);
  *(_DWORD *)(result + 16) = 5;
  *(void *)(result + 24) = 0LL;
  *(void *)(result + 32) = v2;
  *a1 = result;
  byte_10000C1B0 = 1;
  return result;
}

uint64_t sub_1000008D4(int a1, int a2, char *a3)
{
  if (qword_10000C1B8) {
    return fputs(a3, (FILE *)qword_10000C1B8);
  }
  return result;
}

void sub_1000008EC( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  v16 = getprogname();
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  va_list arguments = (va_list)&a9;
  if (*(void *)(a2 + 32))
  {
    time_t v39 = time(0LL);
    memset(&v38, 0, sizeof(v38));
    localtime_r(&v39, &v38);
    if (strftime(cStr, 0x63uLL, "%b %d %H:%M:%S ", &v38)
      && (CFStringRef v18 = CFStringCreateWithCString(0LL, cStr, 0x8000100u)) != 0LL)
    {
      CFStringRef cf = v18;
      CFArrayAppendValue(Mutable, v18);
    }

    else
    {
      CFStringRef cf = 0LL;
    }

    uint64_t v19 = getpid();
    if (a1 >= 7) {
      int v20 = 7;
    }
    else {
      int v20 = a1;
    }
    CFStringRef v21 = CFStringCreateWithFormat(0LL, 0LL, @"%s[%d] <%s>: ", v16, v19, (&off_100008440)[v20]);
    if (v21) {
      CFArrayAppendValue(Mutable, v21);
    }
  }

  else
  {
    CFStringRef cf = 0LL;
    CFStringRef v21 = 0LL;
  }

  CFStringRef v22 = CFStringCreateWithFormat(0LL, 0LL, @"%s:%d(%s): ", a3, a4, a5);
  if (v22) {
    CFArrayAppendValue(Mutable, v22);
  }
  CFStringRef v23 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a7, arguments);
  if (v23) {
    CFArrayAppendValue(Mutable, v23);
  }
  if (a6)
  {
    CFArrayAppendValue(Mutable, @": ");
    CFArrayAppendValue(Mutable, a6);
  }

  CFStringRef v35 = v21;
  CFTypeRef v37 = a6;
  v24 = CFStringCreateByCombiningStrings(0LL, Mutable, &stru_100008938);
  v25 = v24;
  v26 = "failed to convert string\n";
  if (v24)
  {
    CFIndex Length = CFStringGetLength(v24);
    CFIndex v28 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 2;
    v29 = (char *)malloc(v28);
    if (CFStringGetCString(v25, v29, v28, 0x8000100u)) {
      v26 = v29;
    }
  }

  else
  {
    v29 = 0LL;
  }

  if (a1 >= 7) {
    uint64_t v30 = 7LL;
  }
  else {
    uint64_t v30 = a1;
  }
  uint64_t v31 = a2;
  v32 = *(void (**)(uint64_t, void, const char *))(a2 + 32);
  if (v32)
  {
    size_t v33 = strlen(v26);
    if (v26[v33 - 1] != 10)
    {
      *(_WORD *)&v26[v33] = 10;
      v32 = *(void (**)(uint64_t, void, const char *))(v31 + 32);
    }

    v32(v30, *(void *)(v31 + 24), v26);
  }

  else
  {
    if (a1 >= 5) {
      int v34 = 5;
    }
    else {
      int v34 = a1;
    }
    asl_log(0LL, 0LL, v34, "%s", v26);
  }

  if (v29) {
    free(v29);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v37) {
    CFRelease(v37);
  }
}

uint64_t sub_100000C3C(dispatch_once_t *context, uint64_t a2)
{
  dispatch_once_t v5 = context[16];
  v4 = context + 16;
  if (v5 != -1) {
    dispatch_once_f(v4, context, (dispatch_function_t)sub_100000CAC);
  }
  size_t v6 = a2 - 16;
  uint64_t Instance = _CFRuntimeCreateInstance(0LL, context[3], v6, 0LL);
  uint64_t v8 = Instance;
  if (Instance) {
    bzero((void *)(Instance + 16), v6);
  }
  return v8;
}

uint64_t sub_100000CAC(void *a1)
{
  uint64_t v2 = a1[1];
  a1[5] = *a1;
  a1[8] = v2;
  a1[12] = a1[2];
  uint64_t result = _CFRuntimeRegisterClass(a1 + 4);
  a1[3] = result;
  return result;
}

__CFDictionary *sub_100000CE8( const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"Command", a1);
  v17 = (const void **)&a10;
  v13 = key;
  if (key)
  {
    while (1)
    {
      v14 = v17;
      CFStringRef v18 = v17 + 1;
      if (!*v14) {
        break;
      }
      CFDictionarySetValue(Mutable, v13, *v14);
      v15 = v18;
      v17 = v18 + 1;
      v13 = *v15;
      if (!*v15) {
        return Mutable;
      }
    }

    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  119LL,  (uint64_t)"createCommandDictionaryWithArgs",  0LL,  @"no value for key %@",  v12,  (uint64_t)v13);
    }
  }

  return Mutable;
}

void sub_100000E00(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

CFNumberRef sub_100000E60(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID()) {
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberIntType, a3) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void sub_100000EC4(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"ClientListenerDelay", @"com.apple.PurpleReverseProxy");
  if (v1
    || (CFPropertyListRef v1 = CFPreferencesCopyValue( @"ClientListenerDelay",  @"com.apple.PurpleReverseProxy",  @"mobile",  kCFPreferencesAnyHost)) != 0LL)
  {
    CFTypeID v2 = CFGetTypeID(v1);
    if (v2 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt32Type, &dword_10000C088);
    }
    CFRelease(v1);
  }
}

uint64_t sub_100000F64()
{
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  *(_OWORD *)__big = 0u;
  __int128 v21 = 0u;
  size_t v19 = 256LL;
  v0 = (const __CFString *)MGCopyAnswerWithError(@"ReleaseType", 0LL, &v18);
  if (v0)
  {
    CFTypeID v2 = v0;
    CFComparisonResult v3 = CFStringCompare(v0, @"Restore", 0LL);
    BOOL v5 = v3 == kCFCompareEqualTo;
    if (byte_10000C1B0 == 1)
    {
      CFComparisonResult v6 = v3;
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5) {
        sub_1000008EC( 5u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  372LL,  (uint64_t)"isRestoreOS",  0LL,  @"Asking MobileGestalt for ReleaseType, isRestoreOS: %d\n",  v4,  v6 == kCFCompareEqualTo);
      }
    }

    goto LABEL_17;
  }

  if (byte_10000C1B0 == 1)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  376LL,  (uint64_t)"isRestoreOS",  0LL,  @"Asking for kMGQReleaseType failed: %d\n",  v1,  v18);
    }
  }

  v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v7)
  {
    if (byte_10000C1B0 != 1) {
      goto LABEL_38;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  318LL,  (uint64_t)"isRestoreOSSystemVersion",  0LL,  @"CFCopySystemVersionDictionary failed\n",  v8,  v17);
    }
LABEL_32:
    if (byte_10000C1B0 == 1)
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
        sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  383LL,  (uint64_t)"isRestoreOS",  0LL,  @"Checking SystemVersion failed: %d\n",  v8,  0xFFFFFFFFLL);
      }
    }

LABEL_38:
    unsigned int v18 = sysctlbyname("kern.bootargs", __big, &v19, 0LL, 0LL);
    if (v18)
    {
      if (byte_10000C1B0 != 1) {
        return 0LL;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v13 = qword_10000C1A8;
      uint64_t v17 = v18;
      v14 = @"Calling sysctlbyname for kern.bootargs failed: %d\n";
      unsigned int v15 = 3;
      uint64_t v16 = 392LL;
    }

    else
    {
      if (strstr(__big, "rd=md0")) {
        return 1LL;
      }
      if (byte_10000C1B0 != 1) {
        return 0LL;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v13 = qword_10000C1A8;
      v14 = @"Did not find rd=md0 in bootargs, assuming not RestoreOS\n";
      unsigned int v15 = 5;
      uint64_t v16 = 390LL;
    }

    sub_1000008EC(v15, v13, (uint64_t)"Utilities.c", v16, (uint64_t)"isRestoreOS", 0LL, v14, v12, v17);
    return 0LL;
  }

  CFTypeID v2 = v7;
  Value = CFDictionaryGetValue(v7, @"ReleaseType");
  if (!Value)
  {
    if (byte_10000C1B0 == 1)
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
        sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  325LL,  (uint64_t)"isRestoreOSSystemVersion",  0LL,  @"CFDictionaryGetValue for ReleaseType failed\n",  v10,  v17);
      }
    }

    CFRelease(v2);
    goto LABEL_32;
  }

  BOOL v5 = CFEqual(Value, @"Restore") != 0;
LABEL_17:
  CFRelease(v2);
  return v5;
}

void sub_100001448(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_1000014B0;
  block[3] = &unk_1000084C0;
  block[4] = a1;
  dispatch_async(global_queue, block);
}

void sub_1000014B0(uint64_t a1)
{
}

void sub_1000014B8(uint64_t a1, CFStringRef format, ...)
{
  CFStringRef v3 = CFStringCreateWithFormatAndArguments(0LL, 0LL, format, va);
  uint64_t v4 = *(void *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 136));
  if (v3) {
    CFRetain(v3);
  }
  BOOL v5 = *(const void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;
  if (v5) {
    CFRelease(v5);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 136));
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_100001544( uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v11 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v11 + 16) >= 5) {
      sub_1000008EC( 5u,  v11,  (uint64_t)"RPSocket.cpp",  259LL,  (uint64_t)"set_client",  0LL,  @"RPSocket %p: setting client. old: %p. new: %p",  a8,  a1);
    }
  }

  if (a2) {
    uint64_t v12 = a3;
  }
  else {
    uint64_t v12 = 0LL;
  }
  sub_10000164C(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(void *)(a1 + 24) = a2;
  uint64_t v13 = *(const void **)(a1 + 32);
  if (v13) {
    CFRelease(v13);
  }
  if (v12) {
    CFTypeRef v14 = CFRetain(v12);
  }
  else {
    CFTypeRef v14 = 0LL;
  }
  *(void *)(a1 + 32) = v14;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  return sub_100001698(a1);
}

uint64_t sub_10000164C(uint64_t a1)
{
  CFTypeID v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  int v3 = *(_DWORD *)(a1 + 208) - 1;
  *(_DWORD *)(a1 + 208) = v3;
  if (!v3) {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
  return pthread_mutex_unlock(v2);
}

uint64_t sub_100001698(uint64_t a1)
{
  CFTypeID v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  int v3 = *(_DWORD *)(a1 + 208);
  *(_DWORD *)(a1 + 208) = v3 + 1;
  if (!v3) {
    (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
  }
  return pthread_mutex_unlock(v2);
}

void sub_1000016E4(uint64_t a1, void *aBlock)
{
  int v3 = _Block_copy(aBlock);
  sub_100001544(*(void *)(a1 + 16), (uint64_t)sub_100001724, v3, v4, v5, v6, v7, v8);
  _Block_release(v3);
}

uint64_t sub_100001724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100001730(uint64_t a1, dispatch_object_s *a2)
{
  uint64_t v4 = *(dispatch_object_s **)(a1 + 48);
  if (v4) {
    dispatch_release(v4);
  }
  if (a2)
  {
    *(void *)(a1 + 48) = a2;
    dispatch_retain(a2);
  }

  else
  {
    *(void *)(a1 + 48) = 0LL;
  }

  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  return sub_100001698(a1);
}

uint64_t sub_100001798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)os_transaction_create("com.apple.PurpleReverseProxy.transaction");
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 48LL))(*(void *)(a1 + 16), a2);
  uint64_t v6 = v5;
  if (v5) {
    *(void *)(*(void *)(v5 + 16) + 200LL) = v4;
  }
  else {
    os_release(v4);
  }
  return v6;
}

uint64_t sub_100001804( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(*(void *)(a1 + 16) + 40LL);
  if (v11) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v11 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v11 + 16) >= 5) {
      sub_1000008EC( 5u,  v11,  (uint64_t)"RPSocket.cpp",  517LL,  (uint64_t)"RPSocketRead",  0LL,  @"Reading %lu bytes from socket %p to buffer %p",  a8,  a3);
    }
  }

  uint64_t result = (***(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 16))(*(void *)(a1 + 16), a2, a3);
  if (result != -1)
  {
    uint64_t v13 = *(unint64_t **)(*(void *)(a1 + 16) + 224LL);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + result, v13));
  }

  return result;
}

uint64_t sub_1000018F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 1LL;
  }
  uint64_t v8 = a3;
  while (1)
  {
    uint64_t v11 = sub_100001804(a1, a2, v8, a4, a5, a6, a7, a8);
    if (v11 == -1) {
      break;
    }
    if (!v11)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 40LL);
      if (v18) {
        goto LABEL_18;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v18 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_18:
        if (*(int *)(v18 + 16) >= 3) {
          sub_1000008EC( 3u,  v18,  (uint64_t)"RPSocket.cpp",  532LL,  (uint64_t)"RPSocketReadBuffer",  0LL,  @"EOF on %@\n",  a8,  a1);
        }
      }

      return 0LL;
    }

    a2 += v11;
    v8 -= v11;
    if (!v8) {
      return 1LL;
    }
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 16) + 40LL);
  if (v13) {
    goto LABEL_12;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v13 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_12:
    if (*(int *)(v13 + 16) >= 3)
    {
      unint64_t v14 = __error();
      unsigned int v15 = strerror(*v14);
      CFStringRef v16 = CFStringCreateWithCString(0LL, v15, 0x8000100u);
      sub_1000008EC( 3u,  v13,  (uint64_t)"RPSocket.cpp",  536LL,  (uint64_t)"RPSocketReadBuffer",  v16,  @"read error on %@",  v17,  a1);
    }
  }

  return 0LL;
}

const void *sub_100001A8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0LL;
  int v33 = -1;
  if (!sub_1000018F4(a1, (uint64_t)&v33, 4LL, a4, a5, a6, a7, a8) || v33 == -1)
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 16) + 40LL);
    if (v27) {
      goto LABEL_19;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v27 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_19:
      if (*(int *)(v27 + 16) >= 3) {
        sub_1000008EC( 3u,  v27,  (uint64_t)"RPSocket.cpp",  577LL,  (uint64_t)"RPSocketReadDictionary",  0LL,  @"failed to read length from %@\n",  v9,  a1);
      }
    }
  }

  else
  {
    CFIndex v10 = v33;
    Mutable = CFDataCreateMutable(0LL, v33);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFDataSetLength(Mutable, v10);
      MutableBytePtr = CFDataGetMutableBytePtr(v13);
      if ((sub_1000018F4(a1, (uint64_t)MutableBytePtr, v10, v15, v16, v17, v18, v19) & 1) != 0)
      {
        CFPropertyListRef v21 = CFPropertyListCreateWithData(0LL, v13, 2uLL, 0LL, &error);
        __int128 v23 = v21;
        if (!v21 || error)
        {
          uint64_t v31 = *(void *)(*(void *)(a1 + 16) + 40LL);
          if (v31) {
            goto LABEL_41;
          }
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v31 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_41:
            if (*(int *)(v31 + 16) >= 3) {
              sub_1000008EC( 3u,  v31,  (uint64_t)"RPSocket.cpp",  595LL,  (uint64_t)"RPSocketReadDictionary",  0LL,  @"failed to deserialize dictionary from %@: %@\n",  v22,  a1);
            }
          }

          goto LABEL_35;
        }

        CFTypeID v24 = CFGetTypeID(v21);
        if (v24 == CFDictionaryGetTypeID())
        {
LABEL_35:
          CFRelease(v13);
          return v23;
        }

        uint64_t v26 = *(void *)(*(void *)(a1 + 16) + 40LL);
        if (v26) {
          goto LABEL_12;
        }
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v26 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_12:
          if (*(int *)(v26 + 16) >= 3) {
            sub_1000008EC( 3u,  v26,  (uint64_t)"RPSocket.cpp",  600LL,  (uint64_t)"RPSocketReadDictionary",  0LL,  @"plist from %@ was not a dictionary\n",  v25,  a1);
          }
        }

        CFRelease(v23);
      }

      else
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 16) + 40LL);
        if (v29) {
          goto LABEL_32;
        }
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v29 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_32:
          if (*(int *)(v29 + 16) >= 3) {
            sub_1000008EC( 3u,  v29,  (uint64_t)"RPSocket.cpp",  589LL,  (uint64_t)"RPSocketReadDictionary",  0LL,  @"RPSocketReadBuffer failed from %@\n",  v20,  a1);
          }
        }
      }

      __int128 v23 = 0LL;
      goto LABEL_35;
    }

    uint64_t v28 = *(void *)(*(void *)(a1 + 16) + 40LL);
    if (v28) {
      goto LABEL_25;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v28 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_25:
      if (*(int *)(v28 + 16) >= 3) {
        sub_1000008EC( 3u,  v28,  (uint64_t)"RPSocket.cpp",  583LL,  (uint64_t)"RPSocketReadDictionary",  0LL,  @"CFDataCreateMutable failed for len %d for %@\n",  v12,  v10);
      }
    }
  }

  return 0LL;
}

uint64_t sub_100001E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1LL;
  }
  uint64_t v3 = a3;
  while (1)
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 8LL))( *(void *)(a1 + 16),  a2,  v3);
    if (v6 < 0) {
      break;
    }
    a2 += v6;
    v3 -= v6;
    uint64_t v8 = (unint64_t *)(*(void *)(*(void *)(a1 + 16) + 224LL) + 8LL);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + v6, v8));
    if (!v3) {
      return 1LL;
    }
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 16) + 40LL);
  if (v11) {
    goto LABEL_13;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v11 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_13:
    if (*(int *)(v11 + 16) >= 3) {
      sub_1000008EC( 3u,  v11,  (uint64_t)"RPSocket.cpp",  618LL,  (uint64_t)"RPSocketWrite",  0LL,  @"failed to write %zu bytes to %@\n",  v7,  v3);
    }
  }

  return 0LL;
}

uint64_t sub_100001F14( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0LL;
  if (a2)
  {
    unint64_t v9 = CFPropertyListCreateData(0LL, a2, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
    uint64_t v11 = v9;
    if (v9 && !error)
    {
      CFIndex Length = CFDataGetLength(v9);
      uint64_t v14 = Length;
      if (Length < 0x80000000LL)
      {
        int v26 = Length;
        if ((sub_100001E04(a1, (uint64_t)&v26, 4LL) & 1) != 0)
        {
          BytePtr = CFDataGetBytePtr(v11);
          if ((sub_100001E04(a1, (uint64_t)BytePtr, v14) & 1) != 0)
          {
            uint64_t v17 = 1LL;
LABEL_42:
            CFRelease(v11);
            goto LABEL_43;
          }

          uint64_t v23 = *(void *)(*(void *)(a1 + 16) + 40LL);
          if (v23) {
            goto LABEL_39;
          }
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v23 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_39:
            if (*(int *)(v23 + 16) >= 3) {
              sub_1000008EC( 3u,  v23,  (uint64_t)"RPSocket.cpp",  668LL,  (uint64_t)"RPSocketWriteDictionary",  0LL,  @"failed to write length to %@\n",  v21,  a1);
            }
          }
        }

        else
        {
          uint64_t v22 = *(void *)(*(void *)(a1 + 16) + 40LL);
          if (v22) {
            goto LABEL_33;
          }
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v22 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_33:
            if (*(int *)(v22 + 16) >= 3) {
              sub_1000008EC( 3u,  v22,  (uint64_t)"RPSocket.cpp",  663LL,  (uint64_t)"RPSocketWriteDictionary",  0LL,  @"failed to write length to %@\n",  v19,  a1);
            }
          }
        }
      }

      else
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 16) + 40LL);
        if (v15) {
          goto LABEL_9;
        }
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v15 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_9:
          if (*(int *)(v15 + 16) >= 3) {
            sub_1000008EC( 3u,  v15,  (uint64_t)"RPSocket.cpp",  658LL,  (uint64_t)"RPSocketWriteDictionary",  0LL,  @"data too big for %@: %lu\n",  v13,  a1);
          }
        }
      }

      uint64_t v17 = 0LL;
      goto LABEL_42;
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 40LL);
    if (v18) {
      goto LABEL_22;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v18 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_22:
      if (*(int *)(v18 + 16) >= 3) {
        sub_1000008EC( 3u,  v18,  (uint64_t)"RPSocket.cpp",  652LL,  (uint64_t)"RPSocketWriteDictionary",  0LL,  @"failed to serialize dictionary to %@: %@\n",  v10,  a1);
      }
    }

    uint64_t v17 = 0LL;
    if (v11) {
      goto LABEL_42;
    }
  }

  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 16) + 40LL);
    if (v16) {
      goto LABEL_15;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v16 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_15:
      if (*(int *)(v16 + 16) >= 3) {
        sub_1000008EC( 3u,  v16,  (uint64_t)"RPSocket.cpp",  646LL,  (uint64_t)"RPSocketWriteDictionary",  0LL,  @"no dictionary to send to %@\n",  a8,  a1);
      }
    }

    uint64_t v17 = 0LL;
  }

LABEL_43:
  if (error) {
    CFRelease(error);
  }
  return v17;
}

void sub_10000226C( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = (void *)a1[28];
  if (*v9 || v9[1])
  {
    uint64_t v10 = a1[5];
    if (v10) {
      goto LABEL_7;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v10 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_7:
      if (*(int *)(v10 + 16) >= 5) {
        sub_1000008EC( 5u,  v10,  (uint64_t)"RPSocket.cpp",  168LL,  (uint64_t)"reset_stats",  0LL,  @"Reset stats for %@ after reading %lld bytes and writing %lld bytes\n",  a8,  a1[1]);
      }
    }

    uint64_t v11 = (void *)a1[28];
    *uint64_t v11 = 0LL;
    v11[1] = 0LL;
  }

void sub_100002340( void *cf, uint64_t a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = cf[2];
  uint64_t v12 = *(void **)(v11 + 216);
  if (!v12)
  {
    uint64_t v12 = calloc(1uLL, 0x10000uLL);
    uint64_t v11 = cf[2];
    *(void *)(v11 + 216) = v12;
  }

  if (a2 == 1)
  {
    uint64_t v14 = *(void *)(v11 + 40);
    if (v14) {
      goto LABEL_15;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v14 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_15:
      if (*(int *)(v14 + 16) >= 3) {
        sub_1000008EC( 3u,  v14,  (uint64_t)"RPSocket.cpp",  697LL,  (uint64_t)"ExchangeDataHelper",  0LL,  @"wrong kCFStreamEventOpenCompleted from %@\n",  a8,  (uint64_t)cf);
      }
    }
  }

  else
  {
    if (a2 == 16)
    {
      uint64_t v13 = *(void *)(v11 + 40);
      if (v13) {
        goto LABEL_9;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v13 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_9:
        if (*(int *)(v13 + 16) >= 3) {
          sub_1000008EC( 3u,  v13,  (uint64_t)"RPSocket.cpp",  691LL,  (uint64_t)"ExchangeDataHelper",  0LL,  @"kCFStreamEventEndEncountered from %@\n",  a8,  (uint64_t)cf);
        }
      }
    }

    else
    {
      uint64_t v15 = sub_100001804((uint64_t)cf, (uint64_t)v12, 0x10000LL, a4, a5, a6, a7, a8);
      if (v15)
      {
        if (v15 == -1)
        {
          uint64_t v17 = *(void *)(cf[2] + 40LL);
          if (v17) {
            goto LABEL_23;
          }
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v17 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_23:
            if (*(int *)(v17 + 16) >= 3)
            {
              uint64_t v18 = __error();
              uint64_t v19 = strerror(*v18);
              CFStringRef v20 = CFStringCreateWithCString(0LL, v19, 0x8000100u);
              sub_1000008EC( 3u,  v17,  (uint64_t)"RPSocket.cpp",  703LL,  (uint64_t)"ExchangeDataHelper",  v20,  @"RPSocketRead from %@",  v21,  (uint64_t)cf);
            }
          }
        }

        else
        {
          uint64_t v24 = *(void *)(cf[2] + 40LL);
          if (v24) {
            goto LABEL_36;
          }
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v24 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_36:
            if (*(int *)(v24 + 16) >= 3) {
              sub_1000008EC( 3u,  v24,  (uint64_t)"RPSocket.cpp",  711LL,  (uint64_t)"ExchangeDataHelper",  0LL,  @"RPSocketWrite failed to %@",  v23,  (uint64_t)a3);
            }
          }
        }
      }

      else
      {
        uint64_t v22 = *(void *)(cf[2] + 40LL);
        if (v22) {
          goto LABEL_29;
        }
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v22 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_29:
          if (*(int *)(v22 + 16) >= 3) {
            sub_1000008EC( 3u,  v22,  (uint64_t)"RPSocket.cpp",  707LL,  (uint64_t)"ExchangeDataHelper",  0LL,  @"EOF from %@\n",  v16,  (uint64_t)cf);
          }
        }
      }
    }

    CFRetain(cf);
    CFRetain(a3);
    (*(void (**)(void))(*(void *)cf[2] + 32LL))(cf[2]);
    sub_100001448((uint64_t)cf);
    if (a3)
    {
      (*(void (**)(void *))(*a3[2] + 32LL))(a3[2]);
      sub_100001448((uint64_t)a3);
    }
  }

uint64_t sub_1000026C4(int a1, int a2)
{
  uint64_t v4 = operator new(0x180uLL);
  sub_10000271C((uint64_t)v4, a1, a2);
  return v4[1];
}

void sub_100002708(_Unwind_Exception *a1)
{
}

uint64_t sub_10000271C(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = sub_100002D14(a1);
  *(void *)uint64_t v6 = off_100008570;
  *(_DWORD *)(v6 + 232) = -1;
  *(_OWORD *)(v6 + 240) = 0u;
  *(_OWORD *)(v6 + 256) = 0u;
  *(_OWORD *)(v6 + 272) = 0u;
  *(_OWORD *)(v6 + 288) = 0u;
  *(_OWORD *)(v6 + 304) = 0u;
  *(_OWORD *)(v6 + 320) = 0u;
  *(_OWORD *)(v6 + 336) = 0u;
  *(_OWORD *)(v6 + 352) = 0u;
  *(void *)(v6 + 368) = 0LL;
  uint64_t v8 = *(void *)(v6 + 40);
  if (v8) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v8 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v8 + 16) >= 5) {
      sub_1000008EC( 5u,  v8,  (uint64_t)"RPSocket.cpp",  932LL,  (uint64_t)"RPSocket_fd",  0LL,  @"Creating RPSocket_fd: %p for fd: %d and mode: %d",  v7,  a1);
    }
  }

  *(_DWORD *)(a1 + 232) = a2;
  *(void *)(a1 + 240) = dispatch_queue_create("com.apple.PurpleReverseProxy.FDQueue", 0LL);
  int v34 = 1;
  if (setsockopt(*(_DWORD *)(a1 + 232), 0xFFFF, 4130, &v34, 4u) == -1)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      goto LABEL_12;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v9 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_12:
      if (*(int *)(v9 + 16) >= 3)
      {
        uint64_t v10 = __error();
        uint64_t v11 = strerror(*v10);
        CFStringRef v12 = CFStringCreateWithCString(0LL, v11, 0x8000100u);
        sub_1000008EC( 3u,  v9,  (uint64_t)"RPSocket.cpp",  938LL,  (uint64_t)"RPSocket_fd",  v12,  @"setsockopt for %@",  v13,  *(void *)(a1 + 8));
      }
    }
  }

  bzero(v44, 0x401uLL);
  bzero(v43, 0x401uLL);
  socklen_t v33 = 128;
  if (getsockname(a2, (sockaddr *)(a1 + 248), &v33))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      goto LABEL_19;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v14 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_19:
      if (*(int *)(v14 + 16) >= 3)
      {
        uint64_t v15 = __error();
        uint64_t v16 = strerror(*v15);
        CFStringRef v17 = CFStringCreateWithCString(0LL, v16, 0x8000100u);
        sub_1000008EC( 3u,  v14,  (uint64_t)"RPSocket.cpp",  949LL,  (uint64_t)"RPSocket_fd",  v17,  @"getsockname for %@",  v18,  *(void *)(a1 + 8));
      }
    }
  }

  sub_100002E8C((uint64_t)v44, (sockaddr *)(a1 + 248));
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    sockaddr v35 = (sockaddr)0;
    __int128 v36 = 0u;
    socklen_t v32 = 128;
    if (getpeername(a2, &v35, &v32))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (v20) {
        goto LABEL_27;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v20 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_27:
        if (*(int *)(v20 + 16) >= 3)
        {
          uint64_t v21 = __error();
          uint64_t v22 = strerror(*v21);
          CFStringRef v23 = CFStringCreateWithCString(0LL, v22, 0x8000100u);
          sub_1000008EC( 3u,  v20,  (uint64_t)"RPSocket.cpp",  959LL,  (uint64_t)"RPSocket_fd",  v23,  @"getpeername for %@",  v24,  *(void *)(a1 + 8));
        }
      }
    }

    sub_100002E8C((uint64_t)v43, &v35);
  }

  switch(a3)
  {
    case 2:
      uint64_t v26 = *(void *)(a1 + 40);
      if (v26) {
        goto LABEL_43;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v26 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_43:
        if (*(int *)(v26 + 16) >= 5) {
          sub_1000008EC( 5u,  v26,  (uint64_t)"RPSocket.cpp",  973LL,  (uint64_t)"RPSocket_fd",  0LL,  @"%@: accepted %s <- %s",  v19,  *(void *)(a1 + 8));
        }
      }

      break;
    case 1:
      uint64_t v27 = *(void *)(a1 + 40);
      if (v27) {
        goto LABEL_49;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v27 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_49:
        if (*(int *)(v27 + 16) >= 5) {
          sub_1000008EC( 5u,  v27,  (uint64_t)"RPSocket.cpp",  970LL,  (uint64_t)"RPSocket_fd",  0LL,  @"%@: listening on %s",  v19,  *(void *)(a1 + 8));
        }
      }

      break;
    case 0:
      uint64_t v25 = *(void *)(a1 + 40);
      if (v25) {
        goto LABEL_37;
      }
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v25 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_37:
        if (*(int *)(v25 + 16) >= 5) {
          sub_1000008EC( 5u,  v25,  (uint64_t)"RPSocket.cpp",  967LL,  (uint64_t)"RPSocket_fd",  0LL,  @"%@: with unknown mode with address: %s",  v19,  *(void *)(a1 + 8));
        }
      }

      break;
  }

  CFRetain(*(CFTypeRef *)(a1 + 8));
  uintptr_t v28 = *(int *)(a1 + 232);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_source_t v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v28, 0LL, global_queue);
  *(void *)(a1 + 376) = v30;
  dispatch_set_context(v30, (void *)a1);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 376), (dispatch_function_t)sub_100003044);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 376), (dispatch_function_t)sub_10000307C);
  return a1;
}

void sub_100002CEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100002D14(uint64_t a1)
{
  *(void *)a1 = &off_100008628;
  *(void *)(a1 + 200) = 0LL;
  *(_DWORD *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  CFTypeID v2 = calloc(1uLL, 0x10uLL);
  *(void *)(a1 + 216) = 0LL;
  *(void *)(a1 + 224) = v2;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 136), 0LL);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 64), 0LL);
  uint64_t v3 = sub_100000C3C((dispatch_once_t *)&off_10000C090, 24LL);
  *(void *)(a1 + 8) = v3;
  if (v3)
  {
    *(void *)(v3 + 16) = a1;
LABEL_3:
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    goto LABEL_5;
  }

  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  if (qword_10000C1A8)
  {
    if (*(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"RPSocket.cpp",  140LL,  (uint64_t)"RPSocket",  0LL,  @"could not allocate socket\n",  v4,  v6);
    }
    goto LABEL_3;
  }

LABEL_5:
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5) {
    sub_1000008EC( 5u,  qword_10000C1A8,  (uint64_t)"RPSocket.cpp",  144LL,  (uint64_t)"RPSocket",  0LL,  @"Creating RPSocket: %p (_sockRef: %p)",  v4,  a1);
  }
  return a1;
}

uint64_t sub_100002E8C(uint64_t result, sockaddr *a2)
{
  uint64_t v3 = result;
  int sa_family = a2->sa_family;
  if (sa_family != 30 && sa_family != 1 && !a2->sa_family)
  {
    *(_WORD *)(result + 8) = 62;
    uint64_t v5 = *(void *)"<unknown>";
LABEL_21:
    *(void *)uint64_t v3 = v5;
    return result;
  }

  if (sa_family == 30) {
    int v6 = 28;
  }
  else {
    int v6 = 0;
  }
  if (sa_family == 2) {
    int v7 = 16;
  }
  else {
    int v7 = v6;
  }
  if (a2->sa_len) {
    socklen_t sa_len = a2->sa_len;
  }
  else {
    socklen_t sa_len = v7;
  }
  uint64_t result = getnameinfo(a2, sa_len, v11, 0x401u, v10, 0x20u, 10);
  if ((_DWORD)result)
  {
    if (a2->sa_family == 1)
    {
      unsigned int v9 = a2->sa_len - 2;
      if (v9 >= 0x68) {
        unsigned int v9 = 104;
      }
      if (v9) {
        return snprintf((char *)v3, 0x401uLL, "%s%.*s%s");
      }
    }

    *(_WORD *)(v3 + 8) = 62;
    uint64_t v5 = *(void *)"<unknown>";
    goto LABEL_21;
  }

  return snprintf((char *)v3, 0x401uLL, "%s%s%s%s%s");
}

void sub_100003044( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000307C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100003084( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = &off_100008628;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v9 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_1000008EC( 5u,  v9,  (uint64_t)"RPSocket.cpp",  110LL,  (uint64_t)"~RPSocket",  0LL,  @"Releasing RPSocket: %p (_sockRef: %p)",  a8,  a1);
    }
  }

  uint64_t v10 = *(const void **)(a1 + 32);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 40);
  if (v11) {
    CFRelease(v11);
  }
  CFStringRef v12 = *(const void **)(a1 + 16);
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = *(dispatch_object_s **)(a1 + 48);
  if (v13) {
    dispatch_release(v13);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 136));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 64));
  uint64_t v14 = *(void **)(a1 + 224);
  if (v14) {
    free(v14);
  }
  uint64_t v15 = *(void **)(a1 + 216);
  if (v15) {
    free(v15);
  }
  return a1;
}

void sub_100003194(void *a1)
{
}

uint64_t sub_1000031A8()
{
  return 0LL;
}

uint64_t sub_1000031B0()
{
  return 0LL;
}

uint64_t sub_1000031B8()
{
  return 0LL;
}

uint64_t sub_1000031C0()
{
  return 0LL;
}

uint64_t sub_1000031D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 24) = 0LL;
  uint64_t v9 = *(const void **)(a1 + 32);
  if (v9) {
    CFRelease(v9);
  }
  *(void *)(a1 + 32) = 0LL;
  uint64_t v10 = *(const void **)(a1 + 40);
  if (v10) {
    CFRelease(v10);
  }
  *(void *)(a1 + 40) = 0LL;
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
}

void sub_100003230( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v10 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      sub_1000008EC( 5u,  v10,  (uint64_t)"RPSocket.cpp",  229LL,  (uint64_t)"signal",  0LL,  @"RPSocket %p (ref: %p): got signal with event %d and current _cb: %p",  a8,  a1);
    }
  }

  uint64_t v11 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  uint64_t v13 = *(void (**)(const void *, uint64_t, const void *))(a1 + 24);
  if (v13)
  {
    uint64_t v14 = *(const void **)(a1 + 32);
    uint64_t context = *(void *)(a1 + 24);
    CFTypeRef cf = v14;
    uint64_t v15 = *(dispatch_queue_s **)(a1 + 48);
    if (v14) {
      CFRetain(v14);
    }
    if (v15) {
      dispatch_retain(v15);
    }
    uint64_t v16 = *(const void **)(a1 + 8);
    uint64_t v19 = v16;
    uint64_t v20 = a2;
    CFRetain(v16);
    pthread_mutex_unlock(v11);
    if (v15)
    {
      dispatch_sync_f(v15, &context, (dispatch_function_t)sub_100003428);
      dispatch_release(v15);
      uint64_t v16 = v19;
    }

    else
    {
      v13(v16, a2, v14);
    }

    sub_100001448((uint64_t)v16);
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      goto LABEL_18;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v17 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_18:
      if (*(int *)(v17 + 16) >= 3) {
        sub_1000008EC( 3u,  v17,  (uint64_t)"RPSocket.cpp",  243LL,  (uint64_t)"signal",  0LL,  @"No client callback, missing event %d for socket %p",  v12,  a2);
      }
    }

    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  }

uint64_t sub_100003428(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))a1)( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24));
}

uint64_t sub_100003438(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
}

ssize_t sub_100003444(uint64_t a1, void *a2, size_t a3)
{
  return read(*(_DWORD *)(a1 + 232), a2, a3);
}

ssize_t sub_10000344C(uint64_t a1, const void *a2, size_t a3)
{
  return write(*(_DWORD *)(a1 + 232), a2, a3);
}

void sub_100003454(uint64_t a1)
{
}

void sub_10000345C(uint64_t a1)
{
}

void sub_100003464(uint64_t a1)
{
}

CFStringRef sub_100003498(uint64_t a1)
{
  return CFStringCreateWithFormat(0LL, 0LL, @"fd fd=%d", *(unsigned int *)(a1 + 232));
}

uint64_t sub_1000034CC(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    goto LABEL_5;
  }
  uintptr_t v4 = *(int *)(a1 + 232);
  int v5 = kqueue();
  if (v5 == -1)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v11 = qword_10000C1A8;
    uint64_t v12 = __error();
    uint64_t v13 = strerror(*v12);
    CFStringRef v14 = CFStringCreateWithCString(0LL, v13, 0x8000100u);
    uint64_t v16 = "Utilities.c";
    uint64_t v17 = "WaitSocket";
    uint64_t v18 = @"kqueue";
    uint64_t v19 = v11;
    uint64_t v20 = 206LL;
    goto LABEL_18;
  }

  int v6 = v5;
  timeout.tv_sec = (int)(a2 / 0x3B9ACA00);
  timeout.tv_nsec = a2 % 0x3B9ACA00;
  eventlist.ident = v4;
  *(_DWORD *)&eventlist.filter = 1179647;
  memset(&eventlist.fflags, 0, 20);
  int v7 = kevent(v5, &eventlist, 1, &eventlist, 1, &timeout);
  if (v7 == -1)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v24 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      uint64_t v25 = __error();
      uint64_t v26 = strerror(*v25);
      CFStringRef v27 = CFStringCreateWithCString(0LL, v26, 0x8000100u);
      sub_1000008EC(3u, v24, (uint64_t)"Utilities.c", 216LL, (uint64_t)"WaitSocket", v27, @"kevent", v28, v29);
    }

    close(v6);
    return 0LL;
  }

  int v8 = v7;
  close(v6);
  if (v8 >= 1)
  {
LABEL_5:
    int v9 = accept(*(_DWORD *)(a1 + 232), 0LL, 0LL);
    if (v9 != -1) {
      return sub_1000026C4(v9, 2);
    }
    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      goto LABEL_16;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v21 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_16:
      if (*(int *)(v21 + 16) >= 3)
      {
        uint64_t v22 = __error();
        CFStringRef v23 = strerror(*v22);
        CFStringRef v14 = CFStringCreateWithCString(0LL, v23, 0x8000100u);
        uint64_t v16 = "RPSocket.cpp";
        uint64_t v29 = *(void *)(a1 + 8);
        uint64_t v17 = "accept";
        uint64_t v18 = @"accept for %@";
        uint64_t v19 = v21;
        uint64_t v20 = 1073LL;
LABEL_18:
        sub_1000008EC(3u, v19, (uint64_t)v16, v20, (uint64_t)v17, v14, v18, v15, v29);
      }
    }
  }

  return 0LL;
}

uint64_t sub_10000379C(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 249);
  if (v1 == 30 || v1 == 2) {
    return bswap32(*(unsigned __int16 *)(a1 + 250)) >> 16;
  }
  else {
    return 0LL;
  }
}

const void *sub_1000037C4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 232);
  socklen_t v25 = 4;
  if (qword_10000C1C0 != -1) {
    dispatch_once(&qword_10000C1C0, &stru_1000084A0);
  }
  usleep(1000 * dword_10000C088);
  if (getsockopt(v1, 6, 516, &v26, &v25))
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v2 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      uint64_t v3 = __error();
      uintptr_t v4 = strerror(*v3);
      CFStringRef v5 = CFStringCreateWithCString(0LL, v4, 0x8000100u);
      sub_1000008EC( 3u,  v2,  (uint64_t)"Utilities.c",  298LL,  (uint64_t)"copyEntitlementsForSocketPeer",  v5,  @"getsockopt",  v6,  v24);
    }

    return 0LL;
  }

  uint64_t v7 = v26;
  uint64_t v27 = 0LL;
  if (*__error() != 34)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v13 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      CFStringRef v14 = __error();
      strerror(*v14);
      sub_1000008EC( 3u,  v13,  (uint64_t)"Utilities.c",  244LL,  (uint64_t)"copyEntitlementsForPid",  0LL,  @"csops1(%d): %s\n",  v15,  v7);
    }

    return 0LL;
  }

  int v8 = (UInt8 *)calloc(1uLL, bswap32(HIDWORD(v27)));
  if (csops(v7, 7LL, v8, bswap32(HIDWORD(v27))))
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v10 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      uint64_t v11 = __error();
      strerror(*v11);
      sub_1000008EC( 3u,  v10,  (uint64_t)"Utilities.c",  252LL,  (uint64_t)"copyEntitlementsForPid",  0LL,  @"csops2(%d): %s\n",  v12,  v7);
    }

    if (!v8) {
      return 0LL;
    }
    goto LABEL_18;
  }

  if (*(_DWORD *)v8 != 1903288058)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"Utilities.c",  257LL,  (uint64_t)"copyEntitlementsForPid",  0LL,  @"bad magic 0x%08x\n",  v9,  *(unsigned int *)v8);
    }
    goto LABEL_18;
  }

  unsigned int v18 = bswap32(*((_DWORD *)v8 + 1));
  if (v18 < 9
    || (CFIndex v19 = v18 - 8,
        *((_DWORD *)v8 + 1) = v19,
        (uint64_t v20 = CFDataCreateWithBytesNoCopy(0LL, v8 + 8, v19, kCFAllocatorNull)) == 0LL))
  {
LABEL_18:
    free(v8);
    return 0LL;
  }

  uint64_t v21 = v20;
  CFPropertyListRef v22 = CFPropertyListCreateWithData(0LL, v20, 0LL, 0LL, 0LL);
  uint64_t v16 = v22;
  if (v22)
  {
    CFTypeID v23 = CFGetTypeID(v22);
    if (v23 != CFDictionaryGetTypeID())
    {
      CFRelease(v16);
      uint64_t v16 = 0LL;
    }
  }

  free(v8);
  CFRelease(v21);
  return v16;
}

void sub_100003B8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (void *)sub_100003BEC(a1, a2, a3, a4, a5, a6, a7, a8);
  operator delete(v8);
}

uint64_t sub_100003BA0(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 232);
  if ((_DWORD)result != -1) {
    return shutdown(result, 2);
  }
  return result;
}

uint64_t sub_100003BB8(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 232);
  if ((_DWORD)result != -1) {
    uint64_t result = close(result);
  }
  *(_DWORD *)(a1 + 232) = -1;
  return result;
}

uint64_t sub_100003BEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = off_100008570;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v9 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_1000008EC( 5u,  v9,  (uint64_t)"RPSocket.cpp",  999LL,  (uint64_t)"~RPSocket_fd",  0LL,  @"Releasing RPSocket_fd: %p",  a8,  a1);
    }
  }

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 376));
  dispatch_release(*(dispatch_object_t *)(a1 + 376));
  dispatch_release(*(dispatch_object_t *)(a1 + 240));
  return sub_100003084(a1, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_100003CB4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112LL))(a1);
}

uint64_t sub_100003CC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(v9 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v10 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      sub_1000008EC( 5u,  v10,  (uint64_t)"RPSocket.cpp",  384LL,  (uint64_t)"FinalizeRPSocket",  0LL,  @"Closed %@ after reading %lld bytes and writing %lld bytes\n",  a8,  a1);
    }
  }

  if (*(void *)(v9 + 200))
  {
    uint64_t v11 = *(void *)(v9 + 40);
    if (v11) {
      goto LABEL_12;
    }
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v11 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_12:
      if (*(int *)(v11 + 16) >= 5) {
        sub_1000008EC( 5u,  v11,  (uint64_t)"RPSocket.cpp",  387LL,  (uint64_t)"FinalizeRPSocket",  0LL,  @"Ending os transaction for %@\n",  a8,  a1);
      }
    }

    os_release(*(void **)(v9 + 200));
    *(void *)(v9 + 200) = 0LL;
  }

  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 88LL))(result);
  }
  return result;
}

CFStringRef sub_100003E24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 136));
  uint64_t v2 = *(const void **)(v1 + 16);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v1 + 16));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v1 + 136));
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 40LL))(v1);
  uintptr_t v4 = (const void *)v3;
  if (v3) {
    CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, @"<RPSocket %p %p: %@ %@>", v1, *(void *)(v1 + 8), v2, v3);
  }
  else {
    CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, @"<RPSocket %p %p: %@>", v1, *(void *)(v1 + 8), v2);
  }
  CFStringRef v6 = v5;
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

uint64_t sub_100003EE0(uint64_t a1)
{
  return off_10000C1D0(*(void *)(a1 + 384));
}

uint64_t sub_100003EF0(uint64_t a1)
{
  return off_10000C1C8(*(void *)(a1 + 384));
}

CFStringRef sub_100003F00(uint64_t a1)
{
  return CFStringCreateWithFormat(0LL, 0LL, @"lockdown fd=%d", *(unsigned int *)(a1 + 232));
}

void sub_100003F38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (void *)sub_100003BEC(a1, a2, a3, a4, a5, a6, a7, a8);
  operator delete(v8);
}

uint64_t sub_100003F4C(uint64_t a1)
{
  return off_10000C1D8(*(void *)(a1 + 384));
}

void sub_100003F5C(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1)
  {
    uint64_t v2 = v1;
    off_10000C1C8 = (uint64_t (*)(void))dlsym(v1, "lockdown_send");
    off_10000C1D0 = (uint64_t (*)(void))dlsym(v2, "lockdown_recv");
    off_10000C1D8 = (uint64_t (*)(void))dlsym(v2, "lockdown_disconnect");
    off_10000C1E0 = dlsym(v2, "lockdown_get_socket");
  }

uint64_t sub_100003FE8(const char *a1)
{
  if (qword_10000C1F8 != -1) {
    dispatch_once(&qword_10000C1F8, &stru_100008540);
  }
  if (!off_10000C1F0) {
    return 0LL;
  }
  uint64_t v2 = (char *)operator new(0x170uLL);
  sub_100002D14((uint64_t)v2);
  *(void *)uint64_t v2 = off_100008750;
  *((void *)v2 + 29) = strdup(a1);
  v2[240] = 0;
  *((void *)v2 + 31) = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  pthread_mutex_init((pthread_mutex_t *)v2 + 4, 0LL);
  pthread_cond_init((pthread_cond_t *)(v2 + 320), 0LL);
  return *((void *)v2 + 1);
}

void sub_1000040A0(_Unwind_Exception *a1)
{
}

void sub_1000040C4()
{
}

void sub_1000040D0()
{
}

void sub_1000040DC()
{
}

uint64_t sub_1000040E8(uint64_t result)
{
  if (!*(_BYTE *)(result + 240))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 232);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 0x40000000LL;
    v3[2] = sub_10000448C;
    v3[3] = &unk_1000087D8;
    v3[4] = v1;
    uint64_t result = off_10000C1F0(v2, 0LL, 0LL, v3);
    *(_BYTE *)(v1 + 240) = 1;
  }

  return result;
}

void sub_100004168()
{
}

CFStringRef sub_100004174(uint64_t a1)
{
  return CFStringCreateWithFormat(0LL, 0LL, @"lockdown_service service=%s", *(void *)(a1 + 232));
}

const void *sub_1000041A8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    gettimeofday(&v16, 0LL);
    unint64_t v4 = a2 + 1000 * v16.tv_usec;
    __darwin_time_t tv_sec = v16.tv_sec;
    CFStringRef v6 = (pthread_mutex_t *)(a1 + 256);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
    if (v4)
    {
      __darwin_time_t v7 = tv_sec + v4 / 0x3B9ACA00;
      while (!CFArrayGetCount(*(CFArrayRef *)(a1 + 248)))
      {
        v15.__darwin_time_t tv_sec = v7;
        v15.tv_nsec = v4 % 0x3B9ACA00;
        int v8 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 320), (pthread_mutex_t *)(a1 + 256), &v15);
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 40);
          if (v9) {
            goto LABEL_10;
          }
          if (qword_10000C1A0 != -1)
          {
            int v14 = v8;
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
            int v8 = v14;
          }

          uint64_t v9 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_10:
            if (*(int *)(v9 + 16) >= 3)
            {
              uint64_t v10 = *(void *)(a1 + 8);
              strerror(v8);
              sub_1000008EC( 3u,  v9,  (uint64_t)"RPSocket.cpp",  1280LL,  (uint64_t)"accept",  0LL,  @"pthread_cond_timedwait from %@: %s\n",  v11,  v10);
            }
          }

          break;
        }
      }
    }
  }

  else
  {
    CFStringRef v6 = (pthread_mutex_t *)(a1 + 256);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }

  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 248)) < 1)
  {
    ValueAtIndex = 0LL;
  }

  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), 0LL);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 248), 0LL);
  }

  pthread_mutex_unlock(v6);
  return ValueAtIndex;
}

void sub_100004354( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (void *)sub_100004368(a1, a2, a3, a4, a5, a6, a7, a8);
  operator delete(v8);
}

uint64_t sub_100004368( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)a1 = off_100008750;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v9 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      sub_1000008EC( 5u,  v9,  (uint64_t)"RPSocket.cpp",  1226LL,  (uint64_t)"~RPSocket_lockdown_service",  0LL,  @"Releasing RPSocket_lockdown_service: %p",  a8,  a1);
    }
  }

  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 248));
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = (void **)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), i);
      if (ValueAtIndex) {
        (*(void (**)(void *))(*ValueAtIndex[2] + 32LL))(ValueAtIndex[2]);
      }
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 248));
  free(*(void **)(a1 + 232));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 256));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 320));
  return sub_100003084(a1, v13, v14, v15, v16, v17, v18, v19);
}

void sub_10000448C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v10 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 7) {
      sub_1000008EC( 7u,  v10,  (uint64_t)"RPSocket.cpp",  1241LL,  (uint64_t)"unpause_block_invoke",  0LL,  @"got a %s connection for %@\n",  a8,  *(void *)(v9 + 232));
    }
  }

  if (qword_10000C1E8 != -1) {
    dispatch_once(&qword_10000C1E8, &stru_100008500);
  }
  uint64_t v11 = 0LL;
  if (off_10000C1C8)
  {
    if (off_10000C1D0)
    {
      if (off_10000C1D8)
      {
        uint64_t v12 = (uint64_t (*)(uint64_t))off_10000C1E0;
        if (off_10000C1E0)
        {
          uint64_t v13 = operator new(0x188uLL);
          int v14 = v12(a2);
          sub_10000271C((uint64_t)v13, v14, 0);
          void *v13 = off_1000086A8;
          v13[48] = a2;
          uint64_t v11 = (const void *)v13[1];
        }
      }
    }
  }

  pthread_mutex_lock((pthread_mutex_t *)(v9 + 256));
  CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 248), v11);
  CFRelease(v11);
  pthread_cond_broadcast((pthread_cond_t *)(v9 + 320));
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 256));
  sub_100003230(v9, 2LL, v15, v16, v17, v18, v19, v20);
}

void sub_10000460C(_Unwind_Exception *a1)
{
}

void sub_100004620(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1) {
    off_10000C1F0 = dlsym(v1, "lockdown_checkin_xpc");
  }
}

void start(int a1, uint64_t a2)
{
  BOOL v3 = a1 >= 2 && (v2 = *(const char **)(a2 + 8)) != 0LL && strcmp(v2, "--ramdisk") == 0;
  unint64_t v4 = sub_100004CA8("notify");
  if (!v4)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v6 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      __darwin_time_t v7 = @"notify socket checkin failed\n";
      uint64_t v8 = 381LL;
LABEL_52:
      sub_1000008EC(3u, v6, (uint64_t)"PurpleReverseProxyService.c", v8, (uint64_t)"main", 0LL, v7, v5, v34);
      goto LABEL_53;
    }

    goto LABEL_53;
  }

  uint64_t v9 = (uint64_t)v4;
  uint64_t v10 = sub_100004CA8("socks");
  if (!v10)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v6 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      __darwin_time_t v7 = @"socks socket checkin failed\n";
      uint64_t v8 = 387LL;
      goto LABEL_52;
    }

LABEL_53:
    exit(1);
  }

  uint64_t v11 = (uint64_t)v10;
  if (v3)
  {
    *(_OWORD *)__int128 v37 = xmmword_1000069F0;
    *(_OWORD *)&v37[12] = *(__int128 *)((char *)&xmmword_1000069F0 + 12);
    uint64_t v12 = (uint64_t)sub_100004CA8("ctrl");
    int v13 = socket(30, 1, 0);
    if (v13 == -1)
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v14 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
        if (*(int *)(qword_10000C1A8 + 16) >= 3)
        {
          uint64_t v15 = __error();
          uint64_t v16 = strerror(*v15);
          CFStringRef v17 = CFStringCreateWithCString(0LL, v16, 0x8000100u);
          sub_1000008EC( 3u,  v14,  (uint64_t)"RPSocket.cpp",  1123LL,  (uint64_t)"RPCreateSocketAcceptingWithAddress",  v17,  @"socket(%d, SOCK_STREAM)",  v18,  30LL);
        }

LABEL_45:
        uint64_t v14 = 0LL;
        if (v12)
        {
LABEL_46:
          if (v14)
          {
            BOOL v31 = (sub_100000F64() & 1) == 0 && (MGGetBoolAnswer(@"OBqqs000I0SR+EbJ7VO8UQ") & 1) != 0 && !v3;
            __int16 v32 = (*(uint64_t (**)(void))(**(void **)(v14 + 16) + 56LL))(*(void *)(v14 + 16));
            qword_10000C200 = (uint64_t)CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 0x40000000LL;
            aBlock[2] = sub_100004E10;
            aBlock[3] = &unk_100008818;
            aBlock[4] = v9;
            BOOL v42 = v31;
            sub_1000016E4(v9, aBlock);
            *(void *)__int128 v37 = _NSConcreteStackBlock;
            *(void *)&v37[8] = 0x40000000LL;
            *(void *)&v37[16] = sub_100004F1C;
            *(void *)&v37[24] = &unk_100008838;
            BOOL v40 = v31;
            uint64_t v38 = v11;
            uint64_t v39 = v14;
            sub_1000016E4(v11, v37);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 0x40000000LL;
            v35[2] = sub_10000553C;
            v35[3] = &unk_100008878;
            v35[4] = v12;
            __int16 v36 = v32;
            sub_1000016E4(v12, v35);
            sub_100001698(*(void *)(v9 + 16));
            sub_100001698(*(void *)(v12 + 16));
            sub_100001698(*(void *)(v11 + 16));
            if (!v3) {
              sub_100001698(*(void *)(v14 + 16));
            }
            if (qword_10000C1A0 != -1) {
              dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
            }
            if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 7) {
              sub_1000008EC( 7u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  443LL,  (uint64_t)"main",  0LL,  @"proxy running\n",  v33,  v34);
            }
            CFRunLoopRun();
            exit(0);
          }

          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v6 = qword_10000C1A8;
          if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
          {
            __darwin_time_t v7 = @"no conn listener\n";
            uint64_t v8 = 426LL;
            goto LABEL_52;
          }

          goto LABEL_53;
        }

LABEL_27:
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v6 = qword_10000C1A8;
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        {
          __darwin_time_t v7 = @"no ctrl listener\n";
          uint64_t v8 = 421LL;
          goto LABEL_52;
        }

        goto LABEL_53;
      }

LABEL_26:
      if (v12) {
        goto LABEL_46;
      }
      goto LABEL_27;
    }

    int v20 = v13;
    if (bind(v13, (const sockaddr *)v37, 0x1Cu) == -1)
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v21 = qword_10000C1A8;
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      {
        CFPropertyListRef v22 = __error();
        CFTypeID v23 = strerror(*v22);
        CFStringRef v24 = CFStringCreateWithCString(0LL, v23, 0x8000100u);
        sub_1000008EC( 3u,  v21,  (uint64_t)"RPSocket.cpp",  1136LL,  (uint64_t)"RPCreateSocketAcceptingWithAddress",  v24,  @"bind(port=%d)",  v25,  0LL);
      }

LABEL_44:
      close(v20);
      goto LABEL_45;
    }

    if (listen(v20, 128) == -1)
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v26 = qword_10000C1A8;
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      {
        uint64_t v27 = __error();
        uint64_t v28 = strerror(*v27);
        CFStringRef v29 = CFStringCreateWithCString(0LL, v28, 0x8000100u);
        sub_1000008EC( 3u,  v26,  (uint64_t)"RPSocket.cpp",  1141LL,  (uint64_t)"RPCreateSocketAcceptingWithAddress",  v29,  @"listen(port=%d)",  v30,  0LL);
      }

      goto LABEL_44;
    }

    uint64_t v19 = sub_1000026C4(v20, 1);
  }

  else
  {
    uint64_t v12 = sub_100003FE8("com.apple.PurpleReverseProxy.Ctrl");
    uint64_t v19 = sub_100003FE8("com.apple.PurpleReverseProxy.Conn");
  }

  uint64_t v14 = v19;
  goto LABEL_26;
}

int *sub_100004CA8(const char *a1)
{
  size_t cnt = 0LL;
  fds = 0LL;
  int v2 = launch_activate_socket(a1, &fds, &cnt);
  if (v2)
  {
    int v4 = v2;
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v5 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
      if (*(int *)(qword_10000C1A8 + 16) >= 3)
      {
        uint64_t v9 = strerror(v4);
        sub_1000008EC( 3u,  v5,  (uint64_t)"PurpleReverseProxyService.c",  21LL,  (uint64_t)"get_launchd_socket",  0LL,  @"launch_activate_socket: %s\n",  v6,  (uint64_t)v9);
      }
    }
  }

  else
  {
    if (cnt)
    {
      int v8 = *fds;
      free(fds);
      if (v8 == -1) {
        return 0LL;
      }
      return (int *)sub_1000026C4(v8, 1);
    }

    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  25LL,  (uint64_t)"get_launchd_socket",  0LL,  @"launch_activate_socket: no sockets for %s\n",  v3,  (uint64_t)a1);
    }
  }

  uint64_t result = fds;
  if (fds)
  {
    free(fds);
    return 0LL;
  }

  return result;
}

void sub_100004E10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = sub_100005A24(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a4, a5, a6, a7, a8);
  if (v9)
  {
    uint64_t v11 = (uint64_t *)v9;
    sub_1000014B8(v9, @"NotifyConn");
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000LL;
    aBlock[2] = sub_100006058;
    aBlock[3] = &unk_1000087F8;
    aBlock[4] = v11;
    sub_1000016E4((uint64_t)v11, aBlock);
    sub_100001698(v11[2]);
    CFRelease(v11);
  }

  else
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8)
    {
      if (*(int *)(qword_10000C1A8 + 16) >= 3) {
        sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  131LL,  (uint64_t)"startProxy_block_invoke",  0LL,  @"acceptConnection failed\n",  v10,  a9);
      }
    }
  }

void sub_100004F1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = sub_100005A24(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 48), a4, a5, a6, a7, a8);
  if (v10)
  {
    uint64_t v12 = (uint64_t *)v10;
    pthread_mutex_lock(&stru_10000C158);
    int v13 = (void **)qword_10000C208;
    if (qword_10000C208)
    {
      CFRetain((CFTypeRef)qword_10000C208);
      int v14 = dword_10000C198;
      pthread_mutex_unlock(&stru_10000C158);
      int v77 = 1;
      if ((sub_100001E04((uint64_t)v13, (uint64_t)&v77, 4LL) & 1) != 0)
      {
        uint64_t v15 = sub_100001798(*(void *)(a1 + 40), 10000000000LL);
        if (v15)
        {
          CFStringRef v17 = (uint64_t *)v15;
          uint64_t v18 = malloc(0xAuLL);
          if (sub_1000018F4((uint64_t)v17, (uint64_t)v18, 10LL, v19, v20, v21, v22, v23))
          {
            if (*(void *)v18 == 0x6E6F436F6C6C6548LL && v18[4] == 110)
            {
              int v27 = 1;
              if (!v18)
              {
LABEL_18:
                if (v27)
                {
                  uint64_t v28 = random();
                  uint64_t v29 = random();
                  uint64_t v30 = random();
                  CFStringRef v31 = CFStringCreateWithFormat(0LL, 0LL, @"%08x%08x%08x", v28, v29, v30);
                  CFStringRef v39 = v31;
                  if (v14 == 1)
                  {
                    BOOL v40 = 0LL;
                    if ((sub_100001E04((uint64_t)v17, (uint64_t)"HelloConn", 10LL) & 1) != 0)
                    {
LABEL_53:
                      sub_1000014B8((uint64_t)v17, @"Host-%@", v39);
                      sub_1000014B8((uint64_t)v12, @"Client-%@", v39);
                      uint64_t v49 = *(void *)(v17[2] + 40);
                      if (v49) {
                        goto LABEL_57;
                      }
                      if (qword_10000C1A0 != -1) {
                        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
                      }
                      uint64_t v49 = qword_10000C1A8;
                      if (qword_10000C1A8)
                      {
LABEL_57:
                        if (*(int *)(v49 + 16) >= 5) {
                          sub_1000008EC( 5u,  v49,  (uint64_t)"RPSocket.cpp",  726LL,  (uint64_t)"RPSocketExchangeData",  0LL,  @"RPSocketExchangeData:   %p  <==>  %p\n",  v48,  v17[2]);
                        }
                      }

                      sub_10000164C(v17[2]);
                      sub_10000164C(v12[2]);
                      sub_10000226C((uint64_t *)v17[2], v50, v51, v52, v53, v54, v55, v56);
                      sub_10000226C((uint64_t *)v12[2], v57, v58, v59, v60, v61, v62, v63);
                      uint64_t v69 = *(void *)(v17[2] + 40);
                      if (v69) {
                        goto LABEL_63;
                      }
                      if (qword_10000C1A0 != -1) {
                        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
                      }
                      uint64_t v69 = qword_10000C1A8;
                      if (qword_10000C1A8)
                      {
LABEL_63:
                        if (*(int *)(v69 + 16) >= 5) {
                          sub_1000008EC( 5u,  v69,  (uint64_t)"RPSocket.cpp",  734LL,  (uint64_t)"RPSocketExchangeData",  0LL,  @"Beginning data exchange:   %@  <==>  %@\n",  v68,  (uint64_t)v17);
                        }
                      }

                      sub_100001544(v17[2], (uint64_t)sub_100002340, v12, v64, v65, v66, v67, v68);
                      sub_100001544(v12[2], (uint64_t)sub_100002340, v17, v70, v71, v72, v73, v74);
                      dispatch_queue_t v75 = dispatch_queue_create("com.apple.PurpleReverseProxy.ExchangeData", 0LL);
                      sub_100001730(v17[2], v75);
                      sub_100001730(v12[2], v75);
                      dispatch_release(v75);
                      sub_100001698(v17[2]);
                      sub_100001698(v12[2]);
                      sub_100001698(v17[2]);
                      sub_100001698(v12[2]);
                      CFRelease(v12);
LABEL_39:
                      CFRelease(v13);
LABEL_40:
                      if (v17) {
                        CFRelease(v17);
                      }
                      if (v39) {
                        CFRelease(v39);
                      }
                      if (v40) {
                        CFRelease(v40);
                      }
                      return;
                    }
                  }

                  else
                  {
                    BOOL v40 = sub_100000CE8( @"HelloConn",  v32,  v33,  v34,  v35,  v36,  v37,  v38,  @"Identifier",  (uint64_t)v31);
                    sub_100000E00(v40, @"ConnProtoVersion", 2);
                  }

LABEL_36:
                  (*(void (**)(uint64_t))(*(void *)v12[2] + 32LL))(v12[2]);
                  if (v17) {
                    (*(void (**)(uint64_t))(*(void *)v17[2] + 32LL))(v17[2]);
                  }
                  CFRelease(v12);
                  if (!v13) {
                    goto LABEL_40;
                  }
                  goto LABEL_39;
                }

LABEL_35:
                CFStringRef v39 = 0LL;
                BOOL v40 = 0LL;
                goto LABEL_36;
              }

LABEL_17:
              free(v18);
              goto LABEL_18;
            }

            uint64_t v26 = *(void *)(v17[2] + 40);
            if (v26) {
              goto LABEL_14;
            }
            if (qword_10000C1A0 != -1) {
              dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
            }
            uint64_t v26 = qword_10000C1A8;
            if (qword_10000C1A8)
            {
LABEL_14:
              if (*(int *)(v26 + 16) >= 3) {
                sub_1000008EC( 3u,  v26,  (uint64_t)"RPSocket.cpp",  559LL,  (uint64_t)"RPSocketReceiveExpectedMessage",  0LL,  @"invalid message from %@, expecting '%s'\n",  v24,  (uint64_t)v17);
              }
            }
          }

          int v27 = 0;
          if (!v18) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }

        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
          sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  231LL,  (uint64_t)"startProxy_block_invoke_3",  0LL,  @"RPSocketCreateAccepted failed\n",  v16,  (uint64_t)key);
        }
      }

      else
      {
        (*(void (**)(void *))(*v13[2] + 32LL))(v13[2]);
      }
    }

    else
    {
      pthread_mutex_unlock(&stru_10000C158);
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
        sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  218LL,  (uint64_t)"startProxy_block_invoke_3",  0LL,  @"no current ctrl connection exists from the host so we can't accept socks connections right now\n",  v41,  (uint64_t)key);
      }
      int v13 = 0LL;
    }

    CFStringRef v17 = 0LL;
    goto LABEL_35;
  }

  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
    sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  206LL,  (uint64_t)"startProxy_block_invoke_3",  0LL,  @"acceptConnection failed\n",  v11,  a9);
  }
}

  (*(void (**)(void))(**(void **)(v11 + 16) + 32LL))(*(void *)(v11 + 16));
  sub_100001448(v11);
  uint64_t v11 = 0LL;
  if (v14) {
    goto LABEL_18;
  }
  return v11;
}

void sub_10000553C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v46 = -1;
  uint64_t v9 = sub_100005A24(*(void *)(a1 + 32), a2, 0, a4, a5, a6, a7, a8);
  if (v9)
  {
    uint64_t v11 = (uint64_t *)v9;
    sub_1000014B8(v9, @"CtrlConn");
    if (sub_1000018F4((uint64_t)v11, (uint64_t)&v47, 10LL, v12, v13, v14, v15, v16))
    {
      if (v47 == 0x7274436E69676542LL && v48 == 108)
      {
        uint64_t v29 = (const __CFDictionary *)sub_100001A8C((uint64_t)v11, v17, v18, v19, v20, v21, v22, v23);
        int v27 = v29;
        if (v29)
        {
          if ((sub_100000E60(v29, @"CtrlProtoVersion", &v46) & 1) != 0)
          {
            if (v46 != 2)
            {
              if (qword_10000C1A0 != -1) {
                dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
              }
              int v30 = qword_10000C1A8;
              if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
              {
                uint64_t v44 = v46;
                sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  303LL,  (uint64_t)"startProxy_block_invoke_4",  0LL,  @"Mismatched ctrl proto version (expected %d, got %d); this may or may not work\n",
                  v36,
                  2LL);
              }
            }

            uint64_t v26 = sub_100000CE8(@"BeginCtrl", v30, v31, v32, v33, v34, v35, v36, 0LL, v44);
            sub_100000E00(v26, @"CtrlProtoVersion", 2);
            sub_100000E00(v26, @"ConnPort", *(unsigned __int16 *)(a1 + 40));
LABEL_44:
            (*(void (**)(uint64_t))(*(void *)v11[2] + 32LL))(v11[2]);
LABEL_45:
            CFRelease(v11);
            if (v27) {
              CFRelease(v27);
            }
            if (v26) {
              CFRelease(v26);
            }
            return;
          }

          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
            sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  298LL,  (uint64_t)"startProxy_block_invoke_4",  0LL,  @"Host didn't specify ctrl proto version\n",  v36,  (uint64_t)key);
          }
        }

        uint64_t v26 = 0LL;
        goto LABEL_44;
      }

      if (v47 != 0x7274436F6C6C6548LL || v48 != 108)
      {
        uint64_t v26 = 0LL;
        int v27 = 0LL;
LABEL_12:
        pthread_mutex_lock(&stru_10000C158);
        if (qword_10000C208)
        {
          (*(void (**)(void))(**(void **)(qword_10000C208 + 16) + 32LL))(*(void *)(qword_10000C208 + 16));
          sub_100001448(qword_10000C208);
        }

        qword_10000C208 = (uint64_t)v11;
        dword_10000C198 = v46;
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5) {
          sub_1000008EC( 5u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  327LL,  (uint64_t)"startProxy_block_invoke_4",  0LL,  @"got a ctrl connection from a host so we can now accept socks connections\n",  v28,  (uint64_t)key);
        }
        sub_100005C94(1);
        CFRetain((CFTypeRef)qword_10000C208);
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 0x40000000LL;
        aBlock[2] = sub_100005CFC;
        aBlock[3] = &unk_100008858;
        aBlock[4] = v11;
        sub_1000016E4((uint64_t)v11, aBlock);
        sub_100001698(v11[2]);
        notify_post("com.apple.PurpleReverseProxy.ProxyOnline");
        pthread_mutex_unlock(&stru_10000C158);
        goto LABEL_45;
      }

      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
        sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  314LL,  (uint64_t)"startProxy_block_invoke_4",  0LL,  @"Host is using deprecated ReverseProxy protocol; allowing for now\n",
      }
          v23,
          (uint64_t)key);
      if (sub_100001E04((uint64_t)v11, (uint64_t)"HelloCtrl", 10LL)
        && sub_100001E04((uint64_t)v11, a1 + 40, 2LL))
      {
        uint64_t v26 = 0LL;
        int v27 = 0LL;
        unsigned int v46 = 1;
        goto LABEL_12;
      }
    }

    uint64_t v26 = 0LL;
    int v27 = 0LL;
    goto LABEL_44;
  }

  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
    sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  282LL,  (uint64_t)"startProxy_block_invoke_4",  0LL,  @"acceptConnection failed\n",  v10,  (uint64_t)key);
  }
}

uint64_t sub_100005A24( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 != 2)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  47LL,  (uint64_t)"acceptConnection",  0LL,  @"unknown event type %lu\n",  a8,  a2);
    }
LABEL_30:
    exit(1);
  }

  uint64_t v9 = sub_100001798(a1, 0LL);
  if (!v9)
  {
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3) {
      sub_1000008EC( 3u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  53LL,  (uint64_t)"acceptConnection",  0LL,  @"RPSocketCreateAccepted failed\n",  v10,  v20);
    }
    goto LABEL_30;
  }

  uint64_t v11 = v9;
  if (!a3) {
    return v11;
  }
  uint64_t v12 = *(uint64_t (**(void))(**(void **)(v9 + 16) + 72LL))(*(void *)(v9 + 16));
  uint64_t v14 = v12;
  if (v12)
  {
    if (CFDictionaryGetValue(v12, @"com.apple.private.PurpleReverseProxy.allowed") == kCFBooleanTrue)
    {
LABEL_18:
      CFRelease(v14);
      return v11;
    }

    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v15 = qword_10000C1A8;
    uint64_t v16 = @"client not entitled to use proxy\n";
    uint64_t v17 = 66LL;
    goto LABEL_16;
  }

  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v15 = qword_10000C1A8;
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
  {
    uint64_t v16 = @"RPSocketCopyEntitlements failed\n";
    uint64_t v17 = 61LL;
LABEL_16:
    sub_1000008EC(3u, v15, (uint64_t)"PurpleReverseProxyService.c", v17, (uint64_t)"acceptConnection", 0LL, v16, v13, v20);
  }

void sub_100005C94(char a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005F1C;
  block[3] = &unk_100008898;
  char v4 = a1;
  dispatch_async(global_queue, block);
}

uint64_t sub_100005CFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = sub_100001804(*(void *)(a1 + 32), (uint64_t)v24, 10LL, a4, a5, a6, a7, a8);
  if (v9 < 1)
  {
    uint64_t v15 = v9;
    if (qword_10000C1A0 != -1) {
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
    }
    uint64_t v16 = qword_10000C1A8;
    if (v15 == -1)
    {
      uint64_t v21 = __error();
      uint64_t v22 = strerror(*v21);
      CFStringRef v17 = CFStringCreateWithCString(0LL, v22, 0x8000100u);
      uint64_t v12 = @"ctrl socket read";
      unsigned int v13 = 3;
      uint64_t v11 = v16;
      uint64_t v14 = 339LL;
      goto LABEL_14;
    }

    uint64_t v12 = @"ctrl socket eof\n";
    unsigned int v13 = 7;
    uint64_t v11 = qword_10000C1A8;
    uint64_t v14 = 341LL;
LABEL_13:
    CFStringRef v17 = 0LL;
LABEL_14:
    sub_1000008EC( v13,  v11,  (uint64_t)"PurpleReverseProxyService.c",  v14,  (uint64_t)"startProxy_block_invoke_5",  v17,  v12,  v10,  v23);
    goto LABEL_15;
  }

  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  uint64_t v11 = qword_10000C1A8;
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
  {
    uint64_t v12 = @"unexpected data on ctrl socket\n";
    unsigned int v13 = 3;
    uint64_t v14 = 337LL;
    goto LABEL_13;
  }

LABEL_15:
  pthread_mutex_lock(&stru_10000C158);
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18)
  {
    (*(void (**)(void))(**(void **)(v18 + 16) + 32LL))(*(void *)(v18 + 16));
    uint64_t v19 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  if (qword_10000C208 == v19)
  {
    sub_100001448(v19);
    qword_10000C208 = 0LL;
    dword_10000C198 = -1;
    sub_100005C94(0);
  }

  return pthread_mutex_unlock(&stru_10000C158);
}

uint64_t sub_100005F1C(uint64_t a1)
{
  return pthread_mutex_unlock(&stru_10000C118);
}

uint64_t sub_100005F64( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100005F6C(a1, *a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100005F6C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10000C1A0 != -1) {
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
  }
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5)
  {
    uint64_t v10 = "is not";
    if (a2) {
      uint64_t v10 = "is";
    }
    sub_1000008EC( 5u,  qword_10000C1A8,  (uint64_t)"PurpleReverseProxyService.c",  94LL,  (uint64_t)"sendANotification",  0LL,  @"sending a client notification that the proxy %s online\n",  a8,  (uint64_t)v10);
  }

  int v12 = a2;
  uint64_t result = sub_100001E04(a1, (uint64_t)&v12, 4LL);
  if ((result & 1) == 0)
  {
    if (a1) {
      return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32LL))(*(void *)(a1 + 16));
    }
  }

  return result;
}

void sub_100006058( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (const __CFDictionary *)sub_100001A8C(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    uint64_t v10 = v9;
    Value = CFDictionaryGetValue(v9, @"Command");
    if (Value)
    {
      unsigned int v13 = Value;
      if (CFEqual(Value, @"RegisterNotify"))
      {
        pthread_mutex_lock(&stru_10000C118);
        CFSetAddValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
        pthread_mutex_unlock(&stru_10000C118);
        pthread_mutex_lock(&stru_10000C158);
        sub_100005F6C(*(void *)(a1 + 32), qword_10000C208 != 0, v14, v15, v16, v17, v18, v19);
        pthread_mutex_unlock(&stru_10000C158);
        CFRelease(v10);
        return;
      }

      if (CFEqual(v13, @"SetLogLevel"))
      {
        if ((sub_100000E60(v10, @"Level", &v29) & 1) != 0)
        {
          int v24 = v29;
          if (qword_10000C1A0 != -1) {
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
          }
          uint64_t v25 = qword_10000C1A8;
          else {
            LODWORD(v26) = v24;
          }
          if (v24 < 0) {
            LODWORD(v26) = 0;
          }
          if (v24 == -1) {
            uint64_t v26 = 5LL;
          }
          else {
            uint64_t v26 = v26;
          }
          *(_DWORD *)(qword_10000C1A8 + 16) = v26;
          if (v26 >= 3) {
            sub_1000008EC( 3u,  v25,  (uint64_t)"Logging.c",  111LL,  (uint64_t)"SetDefaultLogLevel",  0LL,  @"set default log level to %d (%s)\n",  v12,  v26);
          }
          goto LABEL_38;
        }

        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v21 = qword_10000C1A8;
        uint64_t v22 = @"client dictionary has invalid level\n";
        uint64_t v23 = 166LL;
      }

      else
      {
        if (qword_10000C1A0 != -1) {
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
        }
        uint64_t v21 = qword_10000C1A8;
        uint64_t v22 = @"unknown command from client\n";
        uint64_t v23 = 172LL;
      }
    }

    else
    {
      if (qword_10000C1A0 != -1) {
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000820);
      }
      uint64_t v21 = qword_10000C1A8;
      uint64_t v22 = @"client dictionary doesn't contain a command\n";
      uint64_t v23 = 146LL;
    }

    sub_1000008EC( 3u,  v21,  (uint64_t)"PurpleReverseProxyService.c",  v23,  (uint64_t)"startProxy_block_invoke_2",  0LL,  v22,  v12,  v28);
LABEL_38:
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27) {
      (*(void (**)(void))(**(void **)(v27 + 16) + 32LL))(*(void *)(v27 + 16));
    }
    pthread_mutex_lock(&stru_10000C118);
    CFSetRemoveValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
    pthread_mutex_unlock(&stru_10000C118);
    CFRelease(v10);
    return;
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(void))(**(void **)(v20 + 16) + 32LL))(*(void *)(v20 + 16));
  }
  pthread_mutex_lock(&stru_10000C118);
  CFSetRemoveValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
  pthread_mutex_unlock(&stru_10000C118);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}