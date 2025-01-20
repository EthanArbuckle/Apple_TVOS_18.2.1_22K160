void sub_257C(std::exception *a1)
{
  void *v1;
  std::exception::~exception(a1);
  operator delete(v1);
}

void sub_2594(std::exception *a1)
{
}

const char *sub_25A8()
{
  return "CAException";
}

uint64_t sub_25B4(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_25BC(uint64_t a1)
{
  return 0LL;
}

char *sub_25DC(uint64_t a1, size_t a2, const void *a3)
{
  v6 = (char *)malloc(a2 + 14);
  *(_DWORD *)v6 = 1;
  *(void *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

char *sub_2638(_BYTE *a1, unint64_t a2)
{
  unsigned int v2 = *a1 >> 4;
  if (v2 > 0xF) {
    goto LABEL_13;
  }
  if (((1 << v2) & 0x4F00) != 0)
  {
    v3 = a1 + 3;
LABEL_4:
    else {
      return v3;
    }
  }

  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_8:
    else {
      return a1 + 2;
    }
  }

  if (v2 != 15)
  {
LABEL_13:
    v5 = a1 + 1;
    do
    {
      v3 = v5;
      ++v5;
      int v6 = *v3;
    }

    while ((v6 & 0x80000000) == 0 || v6 == -9);
    goto LABEL_4;
  }

  switch(*a1)
  {
    case 0xF0:
      goto LABEL_13;
    case 0xF1:
    case 0xF3:
      goto LABEL_8;
    case 0xF2:
      else {
        result = a1 + 3;
      }
      break;
    default:
      else {
        result = a1 + 1;
      }
      break;
  }

  return result;
}

uint64_t sub_26F8(uint64_t a1)
{
  *(void *)a1 = &off_18680;
  unsigned int v2 = *(__CFNetService **)(a1 + 8);
  if (v2)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v2, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*(CFNetServiceRef *)(a1 + 8), 0LL, 0LL);
    CFNetServiceCancel(*(CFNetServiceRef *)(a1 + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0LL;
  }

  return a1;
}

void sub_2770(uint64_t a1)
{
  v1 = *(__CFNetService **)(a1 + 8);
  if (v1)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v1, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*(CFNetServiceRef *)(a1 + 8), 0LL, 0LL);
    CFNetServiceCancel(*(CFNetServiceRef *)(a1 + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0LL;
  }
}

void sub_27D4(void *a1)
{
}

uint64_t sub_27E4(uint64_t a1)
{
  *(void *)a1 = &off_18680;
  unsigned int v2 = *(__CFNetService **)(a1 + 8);
  if (v2)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v2, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*(CFNetServiceRef *)(a1 + 8), 0LL, 0LL);
    CFNetServiceCancel(*(CFNetServiceRef *)(a1 + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0LL;
  }

  return a1;
}

void sub_285C(void *__p)
{
  *(void *)__p = &off_18680;
  unsigned int v2 = (__CFNetService *)*((void *)__p + 1);
  if (v2)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v2, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*((CFNetServiceRef *)__p + 1), 0LL, 0LL);
    CFNetServiceCancel(*((CFNetServiceRef *)__p + 1));
    CFRelease(*((CFTypeRef *)__p + 1));
  }

  operator delete(__p);
}

uint64_t sub_28D0( CFNetServiceRef *a1, CFStringRef serviceType, CFStringRef name, CFStringRef domain, SInt32 a5)
{
  clientContext.version = 0LL;
  clientContext.info = a1;
  memset(&clientContext.retain, 0, 24);
  int v6 = CFNetServiceCreate(kCFAllocatorDefault, domain, serviceType, name, a5);
  a1[1] = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94(__str, 0xFFFFFFFF);
      *(_DWORD *)buf = 136315906;
      v15 = "NetServicePublisher.cpp";
      __int16 v16 = 1024;
      int v17 = 24;
      __int16 v18 = 2080;
      v19 = __str;
      __int16 v20 = 2080;
      v21 = "CFNetServiceCreate failed";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
    }

    exception = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)exception, "CFNetServiceCreate failed", -1);
  }

  CFNetServiceSetClient(v6, (CFNetServiceClientCallBack)sub_2BCC, &clientContext);
  v7 = a1[1];
  Current = CFRunLoopGetCurrent();
  CFNetServiceScheduleWithRunLoop(v7, Current, kCFRunLoopCommonModes);
  uint64_t result = CFNetServiceRegisterWithOptions(a1[1], 0LL, &error);
  if (!(_DWORD)result)
  {
    sub_2770((uint64_t)a1);
    snprintf( (char *)buf,  0x100uLL,  "CFNetServiceRegisterWithOptions returned (domain = %d, CFStreamError error = %d)",  LODWORD(error.domain),  error.error);
    v11 = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)v11, (char *)buf, error.error);
  }

  return result;
}

void sub_2AC8(_Unwind_Exception *a1)
{
}

void sub_2ADC(_Unwind_Exception *a1)
{
}

uint64_t sub_2AF4(uint64_t result, char *__s, int a3)
{
  uint64_t v3 = result;
  *(void *)uint64_t result = &off_18658;
  *(_DWORD *)(result + 264) = a3;
  if (__s)
  {
    size_t v5 = strlen(__s);
    int v6 = (char *)(v3 + 8);
    if (v5 < 0x100)
    {
      strlcpy(v6, __s, 0x100uLL);
    }

    else
    {
      __int128 v7 = *(_OWORD *)__s;
      __int128 v8 = *((_OWORD *)__s + 1);
      __int128 v9 = *((_OWORD *)__s + 3);
      *(_OWORD *)(v3 + 40) = *((_OWORD *)__s + 2);
      *(_OWORD *)(v3 + 56) = v9;
      *(_OWORD *)int v6 = v7;
      *(_OWORD *)(v3 + 24) = v8;
      __int128 v10 = *((_OWORD *)__s + 4);
      __int128 v11 = *((_OWORD *)__s + 5);
      __int128 v12 = *((_OWORD *)__s + 7);
      *(_OWORD *)(v3 + 104) = *((_OWORD *)__s + 6);
      *(_OWORD *)(v3 + 120) = v12;
      *(_OWORD *)(v3 + 72) = v10;
      *(_OWORD *)(v3 + 88) = v11;
      __int128 v13 = *((_OWORD *)__s + 8);
      __int128 v14 = *((_OWORD *)__s + 9);
      __int128 v15 = *((_OWORD *)__s + 11);
      *(_OWORD *)(v3 + 168) = *((_OWORD *)__s + 10);
      *(_OWORD *)(v3 + 184) = v15;
      *(_OWORD *)(v3 + 136) = v13;
      *(_OWORD *)(v3 + 152) = v14;
      __int128 v16 = *((_OWORD *)__s + 12);
      __int128 v17 = *((_OWORD *)__s + 13);
      __int128 v18 = *((_OWORD *)__s + 14);
      *(_OWORD *)(v3 + 247) = *(_OWORD *)(__s + 239);
      *(_OWORD *)(v3 + 216) = v17;
      *(_OWORD *)(v3 + 232) = v18;
      *(_OWORD *)(v3 + 200) = v16;
      *(_BYTE *)(v3 + 263) = 0;
    }

    return v3;
  }

  else
  {
    *(_BYTE *)(result + 8) = 0;
  }

  return result;
}

void sub_2BB8(_Unwind_Exception *a1)
{
}

void sub_2BCC(uint64_t a1, uint64_t *a2, CFNetServiceRef *a3)
{
  if (*a2 == kCFStreamErrorDomainNetServices)
  {
    size_t v5 = a3[1];
    if (*((_DWORD *)a2 + 2) == -72001)
    {
      if (v5)
      {
        Current = CFRunLoopGetCurrent();
        CFNetServiceUnscheduleFromRunLoop(v5, Current, kCFRunLoopCommonModes);
        CFNetServiceSetClient(a3[1], 0LL, 0LL);
        CFNetServiceCancel(a3[1]);
        CFRelease(a3[1]);
        a3[1] = 0LL;
      }

      (*((void (**)(CFNetServiceRef *))*a3 + 2))(a3);
    }

    else
    {
      if (v5)
      {
        __int128 v7 = CFRunLoopGetCurrent();
        CFNetServiceUnscheduleFromRunLoop(v5, v7, kCFRunLoopCommonModes);
        CFNetServiceSetClient(a3[1], 0LL, 0LL);
        CFNetServiceCancel(a3[1]);
        CFRelease(a3[1]);
        a3[1] = 0LL;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *a2;
        int v9 = *((_DWORD *)a2 + 2);
        int v10 = 136315906;
        __int128 v11 = "NetServicePublisher.cpp";
        __int16 v12 = 1024;
        int v13 = 56;
        __int16 v14 = 1024;
        int v15 = v8;
        __int16 v16 = 1024;
        int v17 = v9;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d NetServicePublisher::RegisterCallback: domain = %d, CFStreamError error = %d",  (uint8_t *)&v10,  0x1Eu);
      }
    }
  }

char *sub_2D94(char *__str, unsigned int a2)
{
  unsigned int v4 = bswap32(a2);
  *(_DWORD *)(__str + 1) = v4;
  if ((v4 & 0x80) != 0)
  {
  }

  else if ((_DefaultRuneLocale.__runetype[(char)v4] & 0x40000) == 0)
  {
    goto LABEL_17;
  }

  __darwin_ct_rune_t v5 = __str[2];
  if (v5 < 0)
  {
    if (!__maskrune(v5, 0x40000uLL)) {
      goto LABEL_17;
    }
  }

  else if ((_DefaultRuneLocale.__runetype[v5] & 0x40000) == 0)
  {
    goto LABEL_17;
  }

  __darwin_ct_rune_t v6 = __str[3];
  if (v6 < 0)
  {
    if (!__maskrune(v6, 0x40000uLL)) {
      goto LABEL_17;
    }
  }

  else if ((_DefaultRuneLocale.__runetype[v6] & 0x40000) == 0)
  {
    goto LABEL_17;
  }

  __darwin_ct_rune_t v7 = __str[4];
  if (v7 < 0)
  {
    if (__maskrune(v7, 0x40000uLL)) {
      goto LABEL_15;
    }
  }

  else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) != 0)
  {
LABEL_15:
    *(_WORD *)(__str + 5) = 39;
    *__str = 39;
    return __str;
  }

LABEL_17:
  if (a2 + 199999 > 0x61A7E) {
    snprintf(__str, 0x10uLL, "0x%x");
  }
  else {
    snprintf(__str, 0x10uLL, "%d");
  }
  return __str;
}

  if ((v10 & 8) == 0) {
    return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
  }
  v22 = *v12;
  if ((v22 & 0x40) == 0) {
    return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
  }
  v23 = bswap32(*(_DWORD *)(v12 + 1));
  sub_4028((uint64_t)v44, (v23 >> 29) & 3);
  v24 = *(double *)(a1 + 80);
  v25 = (v22 + 1) & 7;
  v41 = v23;
  if ((v22 & 0x40) != 0)
  {
    v26 = v25 + 4 * sub_41A8((uint64_t)v44, v23);
    v43 = v11;
    v30 = *(unsigned __int8 *)(a1 + 56);
    v28 = (v30 + 1) & 7;
    if ((v30 & 0x40) != 0) {
      goto LABEL_23;
    }
LABEL_25:
    v29 = v28 | 0xFFFFFFF8;
    goto LABEL_26;
  }

  v26 = v25 | 0xFFFFFFF8;
  v43 = v11;
  v27 = *(unsigned __int8 *)(a1 + 56);
  v28 = (v27 + 1) & 7;
  if ((v27 & 0x40) == 0) {
    goto LABEL_25;
  }
LABEL_23:
  v29 = v28 + 4 * sub_41A8((uint64_t)v44, *(_DWORD *)(a1 + 60));
LABEL_26:
  v31 = (v26 - v29);
  if ((v31 - 1) <= 0x30)
  {
    v40 = v25;
    v32 = *(_BYTE *)(a1 + 56);
    v33 = sub_4084((uint64_t)v44, *(unsigned int *)(a1 + 60), 2);
    if (v26 > v29)
    {
      v34 = v33;
      v35 = v32;
      v36 = (unint64_t)(v24 * 24000000.0);
      LOBYTE(v37) = (v35 + 1) & 7;
      v38 = time - v31 * v36;
      do
      {
        data = -15;
        v46 = (v34 >> (4 * v37)) & 0xF | (16 * v37);
        sub_3EBC(a5, v38, 2, &data);
        sub_1248C((uint64_t *)a1, a3, v38, (char *)&data);
        v37 = ((_BYTE)v37 + 1) & 7;
        if (!v37) {
          v34 = sub_4084((uint64_t)v44, v34, 2);
        }
        v38 += v36;
        LODWORD(v31) = v31 - 1;
      }

      while ((_DWORD)v31);
    }

    if ((*(_DWORD *)(a1 + 60) != v41 || ((*(_BYTE *)(a1 + 56) + 1) & 7) != v40)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "RecoveryJournal.cpp";
      v50 = 1024;
      v51 = 640;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d MTC recovery error\n",  buf,  0x12u);
    }
  }

  __int128 v11 = v43;
  return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
}

uint64_t sub_2ED8(char *a1, size_t a2)
{
  *(void *)&v15.sa_len = 0LL;
  *(void *)&v15.sa_data[6] = 0LL;
  int v17 = 0;
  uint64_t v16 = 0LL;
  *(void *)&v12.sa_len = 0LL;
  *(void *)&v12.sa_data[6] = 0LL;
  int v14 = 0;
  uint64_t v13 = 0LL;
  int v4 = socket(2, 2, 0);
  if (v4 >= 1)
  {
    int v5 = v4;
    sub_30B0("8.8.8.8", "5000", &v15);
    if (!connect(v5, &v15, v15.sa_len))
    {
      socklen_t v11 = 28;
      if (!getsockname(v5, &v12, &v11))
      {
LABEL_8:
        if (v12.sa_family == 30)
        {
          *(_OWORD *)__int128 v18 = 0u;
          memset(v19, 0, sizeof(v19));
          int v9 = inet_ntop(30, &v12.sa_data[6], v18, 0x2Eu);
          if (v9)
          {
            int v10 = v9;
            if (strlen(v9) < a2) {
              strlcpy(a1, v10, a2);
            }
          }
        }

        else if (v12.sa_family == 2)
        {
          v7.s_addr = *(_DWORD *)&v12.sa_data[2];
          uint64_t v8 = inet_ntoa(v7);
          snprintf(a1, a2, "%s", v8);
        }

        return close(v5);
      }
    }

    close(v5);
  }

  uint64_t result = socket(30, 2, 0);
  int v5 = result;
  sub_30B0("1234::1234", "5000", &v15);
  if (!connect(v5, &v15, v15.sa_len))
  {
    socklen_t v11 = 28;
    if (!getsockname(v5, &v12, &v11)) {
      goto LABEL_8;
    }
  }

  return close(v5);
}

void sub_30B0(const char *a1, const char *a2, void *a3)
{
  v10.ai_flags = 1536;
  v10.ai_socktype = 2;
  int v9 = 0LL;
  int v4 = getaddrinfo(a1, a2, &v10, &v9);
  if (v4)
  {
    unsigned int v8 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94(__str, v8);
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "NetUtils.cpp";
      __int16 v14 = 1024;
      int v15 = 255;
      __int16 v16 = 2080;
      int v17 = __str;
      __int16 v18 = 2080;
      v19 = "getaddrinfo";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
    }

    exception = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)exception, "getaddrinfo", v8);
  }

  int v5 = v9;
  if (v9)
  {
    ai_addr = v9->ai_addr;
    if (ai_addr) {
      memcpy(a3, ai_addr, ai_addr->sa_len);
    }
  }

  freeaddrinfo(v5);
}

void sub_3220(_Unwind_Exception *a1)
{
}

uint64_t sub_3238(uint64_t a1, char *a2, size_t a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 30)
  {
    *(_OWORD *)socklen_t v11 = 0u;
    memset(v12, 0, sizeof(v12));
    unsigned int v8 = inet_ntop(30, (const void *)(a1 + 8), v11, 0x2Eu);
    if (v8)
    {
      int v9 = v8;
      if (strlen(v8) < a3)
      {
        strlcpy(a2, v9, a3);
        return 0LL;
      }
    }
  }

  else if (v5 == 2)
  {
    v6.s_addr = *(_DWORD *)(a1 + 4);
    in_addr v7 = inet_ntoa(v6);
    snprintf(a2, a3, "%s", v7);
    return 0LL;
  }

  return 0xFFFFFFFFLL;
}

void sub_3330(CFStringRef serviceType, CFStringRef name, CFStringRef domain, sockaddr *a4)
{
  int v4 = CFNetServiceCreate(kCFAllocatorDefault, domain, serviceType, name, 0);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94((char *)&v47, 0xFFFFFFFF);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 273;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceCreate failed";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  (uint8_t *)__str,  0x26u);
    }

    exception = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)exception, "CFNetServiceCreate failed", -1);
  }

  int v5 = v4;
  if (!CFNetServiceResolveWithTimeout(v4, 5.0, &error))
  {
    CFRelease(v5);
    SInt32 v30 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94((char *)&v47, v30);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 278;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceResolve failed";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  (uint8_t *)__str,  0x26u);
    }

    v31 = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)v31, "CFNetServiceResolve failed", v30);
  }

  Addressing = CFNetServiceGetAddressing(v5);
  int Count = CFArrayGetCount(Addressing);
  if (Addressing) {
    BOOL v8 = Count < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    CFRelease(v5);
    SInt32 v32 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94((char *)&v47, v32);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 284;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceGetAddressing failed";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  (uint8_t *)__str,  0x26u);
    }

    v33 = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)v33, "CFNetServiceGetAddressing failed", v32);
  }

  CFIndex v9 = 0LL;
  char v10 = 0;
  unsigned __int8 v11 = 0;
  uint64_t v12 = Count;
  do
  {
    while (1)
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Addressing, v9);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      int v15 = BytePtr[1];
      if (v15 != 30 && v15 != 2) {
        break;
      }
      SCNetworkReachabilityFlags flags = 0;
      int v17 = SCNetworkReachabilityCreateWithAddress(0LL, (const sockaddr *)BytePtr);
      __int16 v18 = v17;
      if (v17)
      {
        SCNetworkReachabilityGetFlags(v17, &flags);
        CFRelease(v18);
      }

      int v19 = (2 * flags) & 4;
      int v20 = BytePtr[1];
      if (v20 == 30)
      {
        __int128 v47 = 0u;
        memset(v48, 0, sizeof(v48));
        v23 = inet_ntop(30, BytePtr + 8, (char *)&v47, 0x2Eu);
        v24 = v23;
        if (v23 && strlen(v23) < 0x100)
        {
          strlcpy(__str, v24, 0x100uLL);
          goto LABEL_22;
        }
      }

      else if (v20 == 2)
      {
        v21.s_addr = *((_DWORD *)BytePtr + 1);
        v22 = inet_ntoa(v21);
        snprintf(__str, 0x100uLL, "%s", v22);
LABEL_22:
        v19 |= 2u;
      }

      if (BytePtr[1] == 30) {
        unsigned int v25 = v19 + 1;
      }
      else {
        unsigned int v25 = v19;
      }
      if (((v25 <= v11) & v10) == 0)
      {
        sockaddr v26 = *(sockaddr *)BytePtr;
        *(sockaddr *)&a4->sa_data[10] = *(sockaddr *)(BytePtr + 12);
        *a4 = v26;
        unsigned __int8 v11 = v25;
      }

      __int128 v47 = 0u;
      memset(v48, 0, sizeof(v48));
      int v27 = BytePtr[1];
      if (v27 == 2) {
        v28 = BytePtr + 4;
      }
      else {
        v28 = BytePtr + 8;
      }
      inet_ntop(v27, v28, (char *)&v47, 0x2Eu);
      ++v9;
      char v10 = 1;
      if (v9 == v12)
      {
        CFRelease(v5);
        return;
      }
    }

    ++v9;
  }

  while (v12 != v9);
  CFRelease(v5);
  if ((v10 & 1) == 0)
  {
    SInt32 v34 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94((char *)&v47, v34);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 349;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceGetAddressing was not able to resolve the address address";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  (uint8_t *)__str,  0x26u);
    }

    v35 = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)v35, "CFNetServiceGetAddressing was not able to resolve the address address", v34);
  }

void sub_38C0(_Unwind_Exception *a1)
{
}

void sub_38D4(_Unwind_Exception *a1)
{
}

void sub_38E8(_Unwind_Exception *a1)
{
}

void sub_38FC(_Unwind_Exception *a1)
{
}

void sub_3914(const __CFString *a1, CFStringRef theString, sockaddr *a3)
{
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v29 = 0u;
  if (!CFStringGetCString(theString, buffer, 256LL, 0x8000100u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94(v19, 0xFFFFFFFF);
      *(_DWORD *)buf = 136315906;
      in_addr v21 = "NetUtils.cpp";
      __int16 v22 = 1024;
      int v23 = 356;
      __int16 v24 = 2080;
      unsigned int v25 = v19;
      __int16 v26 = 2080;
      int v27 = "string conversion failed";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
    }

    exception = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)exception, "string conversion failed", -1);
  }

  if (buffer[0] == 9)
  {
    int v5 = strchr(&buffer[1], 9);
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2D94(v19, 0xFFFFFFFF);
        *(_DWORD *)buf = 136315906;
        in_addr v21 = "NetUtils.cpp";
        __int16 v22 = 1024;
        int v23 = 398;
        __int16 v24 = 2080;
        unsigned int v25 = v19;
        __int16 v26 = 2080;
        int v27 = "invalid Bonjour name";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
      }

      __int16 v16 = __cxa_allocate_exception(0x110uLL);
      sub_2AF4((uint64_t)v16, "invalid Bonjour name", -1);
    }

    char *v5 = 0;
    in_addr v6 = v5 + 1;
    in_addr v7 = CFStringCreateWithCString(0LL, &buffer[1], 0x8000100u);
    BOOL v8 = CFStringCreateWithCString(0LL, v6, 0x8000100u);
    sub_3330(a1, v7, v8, a3);
    CFRelease(v7);
    CFRelease(v8);
  }

  else
  {
    CFIndex v9 = strchr(buffer, 91);
    if (v9)
    {
      char v10 = v9;
      unsigned __int8 v11 = strstr(buffer, "]:");
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_2D94(v19, 0xFFFFFFFF);
          *(_DWORD *)buf = 136315906;
          in_addr v21 = "NetUtils.cpp";
          __int16 v22 = 1024;
          int v23 = 367;
          __int16 v24 = 2080;
          unsigned int v25 = v19;
          __int16 v26 = 2080;
          int v27 = "invalid ipv6 [host]:port string";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
        }

        int v17 = __cxa_allocate_exception(0x110uLL);
        sub_2AF4((uint64_t)v17, "invalid ipv6 [host]:port string", -1);
      }

      char *v11 = 0;
      uint64_t v12 = v11 + 2;
      uint64_t v13 = v10 + 1;
    }

    else
    {
      __int16 v14 = strchr(buffer, 58);
      if (!v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_2D94(v19, 0xFFFFFFFF);
          *(_DWORD *)buf = 136315906;
          in_addr v21 = "NetUtils.cpp";
          __int16 v22 = 1024;
          int v23 = 377;
          __int16 v24 = 2080;
          unsigned int v25 = v19;
          __int16 v26 = 2080;
          int v27 = "invalid host:port string";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
        }

        __int16 v18 = __cxa_allocate_exception(0x110uLL);
        sub_2AF4((uint64_t)v18, "invalid host:port string", -1);
      }

      *__int16 v14 = 0;
      uint64_t v12 = v14 + 1;
      uint64_t v13 = buffer;
    }

    sub_30B0(v13, v12, a3);
  }

void sub_3DBC(_Unwind_Exception *a1)
{
}

void sub_3DD0(_Unwind_Exception *a1)
{
}

void sub_3DE4(_Unwind_Exception *a1)
{
}

void sub_3DF8(_Unwind_Exception *a1)
{
}

uint64_t sub_3E10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = a1[1];
  if (v2 == a2[1] && *a1 == *a2)
  {
    if (v2 == 30)
    {
      BOOL v4 = *((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2);
      if (v4
        && *((unsigned __int16 *)a1 + 1) == *((unsigned __int16 *)a2 + 1)
        && *((_DWORD *)a1 + 1) == *((_DWORD *)a2 + 1)
        && *((_DWORD *)a1 + 6) == *((_DWORD *)a2 + 6))
      {
        return 1LL;
      }
    }

    else if (v2 == 2 {
           && *((_DWORD *)a1 + 1) == *((_DWORD *)a2 + 1)
    }
           && *((unsigned __int16 *)a1 + 1) == *((unsigned __int16 *)a2 + 1))
    {
      return 1LL;
    }
  }

  return 0LL;
}

MIDIPacket *sub_3EBC(uint64_t a1, MIDITimeStamp time, int a3, Byte *data)
{
  in_addr v7 = (MIDIPacketList *)(a1 + 48);
  size_t v8 = a3;
  uint64_t result = MIDIPacketListAdd((MIDIPacketList *)(a1 + 48), 0x400uLL, *(MIDIPacket **)(a1 + 40), time, a3, data);
  if (result
    || v7->numPackets
    && ((*(void (**)(uint64_t, MIDIPacketList *))(*(void *)a1 + 16LL))(a1, v7),
        char v10 = MIDIPacketListInit(v7),
        (uint64_t result = MIDIPacketListAdd(v7, 0x400uLL, v10, time, v8, data)) != 0LL))
  {
    *(void *)(a1 + 40) = result;
  }

  else
  {
    unsigned __int8 v11 = sub_25DC(time, v8, data);
    (*(void (**)(uint64_t, char *))(*(void *)a1 + 16LL))(a1, v11);
    free(v11);
    *(void *)(a1 + 40) = MIDIPacketListInit(v7);
    uint64_t result = MIDIPacketListInit(v7);
    *(void *)(a1 + 40) = result;
  }

  return result;
}

MIDIPacket *sub_3FC0(MIDIPacket *result, int *a2)
{
  if (*a2 >= 1)
  {
    uint64_t v2 = (uint64_t)result;
    unint64_t v3 = (unint64_t)(a2 + 1);
    unsigned int v4 = *a2 + 1;
    do
    {
      uint64_t result = sub_3EBC(v2, *(void *)v3, *(unsigned __int16 *)(v3 + 8), (Byte *)(v3 + 10));
      unint64_t v3 = (v3 + *(unsigned __int16 *)(v3 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v4;
    }

    while (v4 > 1);
  }

  return result;
}

BOOL sub_4028(uint64_t a1, unsigned int a2)
{
  if (a2 <= 7)
  {
    *(_DWORD *)(a1 + 8) = byte_15E90[a2];
    BOOL v3 = a2 == 2 || a2 == 5;
    *(_BYTE *)(a1 + 4) = v3;
    *(void *)(a1 + 16) = qword_15E98[a2];
    *(_DWORD *)(a1 + 24) = byte_15ED8[a2];
    *(_DWORD *)a1 = a2;
  }

  return a2 < 8;
}

uint64_t sub_4084(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    int v3 = *(_DWORD *)(a1 + 24);
    if (*(_BYTE *)(a1 + 4))
    {
      do
      {
        while (1)
        {
          a2 = (a2 + 1);
          if (v3 == a2)
          {
            a2 = (a2 & 0xFFFFFF00) + 256;
            if ((a2 & 0xFF00) == 0x3C00)
            {
              a2 = (a2 & 0xFFFF0000) + 0x10000;
              if ((a2 & 0xFF0000) == 0x3C0000)
              {
                unsigned int v5 = (a2 & 0xFF000000) + 0x1000000;
                if ((v5 & 0x1F000000) == 0x18000000) {
                  a2 = v5 & 0xE0000000;
                }
                else {
                  a2 = v5;
                }
              }
            }
          }

          if ((a2 & 0xFFFE) == 0) {
            break;
          }
          BOOL v4 = __OFSUB__(a3--, 1);
          if ((a3 < 0) ^ v4 | (a3 == 0)) {
            return a2;
          }
        }

        HIDWORD(v6) = -858993459 * BYTE2(a2);
        LODWORD(v6) = HIDWORD(v6);
        else {
          a2 = a2;
        }
        BOOL v4 = __OFSUB__(a3--, 1);
      }

      while (!((a3 < 0) ^ v4 | (a3 == 0)));
    }

    else
    {
      do
      {
        a2 = (a2 + 1);
        if (v3 == a2)
        {
          a2 = (a2 & 0xFFFFFF00) + 256;
          if ((a2 & 0xFF00) == 0x3C00)
          {
            a2 = (a2 & 0xFFFF0000) + 0x10000;
            if ((a2 & 0xFF0000) == 0x3C0000)
            {
              unsigned int v8 = (a2 & 0xFF000000) + 0x1000000;
              if ((v8 & 0x1F000000) == 0x18000000) {
                a2 = v8 & 0xE0000000;
              }
              else {
                a2 = v8;
              }
            }
          }
        }

        BOOL v4 = __OFSUB__(a3--, 1);
      }

      while (!((a3 < 0) ^ v4 | (a3 == 0)));
    }
  }

  return a2;
}

uint64_t sub_41A8(uint64_t a1, unsigned int a2)
{
  int v2 = HIBYTE(a2) & 0x1F;
  unsigned int v3 = *(_DWORD *)(a1 + 24) * (60 * (60 * v2 + BYTE2(a2)) + BYTE1(a2)) + a2;
  if (*(_BYTE *)(a1 + 4)) {
    return -108 * v2 - 18 * (BYTE2(a2) / 0xAu) - 2 * ((BYTE2(a2) % 0xAu) & 0x7F) + v3;
  }
  else {
    return v3;
  }
}

void sub_4218(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_4268(exception, a1);
}

void sub_4254(_Unwind_Exception *a1)
{
}

std::logic_error *sub_4268(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_428C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_42B4()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_18760;
}

void sub_42EC(std::exception *a1)
{
}

uint64_t sub_4300(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, char a6, const char *a7)
{
  *(void *)a1 = &off_18788;
  *(void *)(a1 + 8) = 0LL;
  __int16 v14 = pthread_self();
  *(_DWORD *)(a1 + 16) = sub_43AC(v14, 0);
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 112) = 0LL;
  *(_DWORD *)(a1 + 104) = a4;
  *(_DWORD *)(a1 + 108) = 0;
  *(_WORD *)(a1 + 120) = 1;
  *(_BYTE *)(a1 + 122) = a5;
  int v15 = (char *)(a1 + 40);
  *(_BYTE *)(a1 + 123) = a6;
  if (a7)
  {
    strlcpy(v15, a7, 0x40uLL);
  }

  else
  {
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)int v15 = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
  }

  return a1;
}

_opaque_pthread_t *sub_43AC(_opaque_pthread_t *result, int a2)
{
  if (result)
  {
    unsigned int v3 = result;
    mach_msg_type_number_t thread_info_outCnt = 10;
    thread_inspect_t v4 = pthread_mach_thread_np(result);
    thread_info(v4, 3u, thread_info_out, &thread_info_outCnt);
    switch(v13)
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        thread_inspect_t v6 = pthread_mach_thread_np(v3);
        thread_info(v6, 0xCu, v11, &thread_info_outCnt);
        if (a2 == 1 && v11[2]) {
          return (_opaque_pthread_t *)v11[3];
        }
        else {
          return (_opaque_pthread_t *)v11[1];
        }
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v7 = pthread_mach_thread_np(v3);
        thread_info(v7, 0xBu, v10, &thread_info_outCnt);
        if (a2 == 1 && v10[3]) {
          return (_opaque_pthread_t *)v10[4];
        }
        else {
          return (_opaque_pthread_t *)v10[1];
        }
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v5 = pthread_mach_thread_np(v3);
        thread_info(v5, 0xAu, v9, &thread_info_outCnt);
        if (a2 == 1) {
          return (_opaque_pthread_t *)v9[2];
        }
        else {
          return (_opaque_pthread_t *)v9[1];
        }
      default:
        return 0LL;
    }
  }

  return result;
}

void sub_44DC(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v10;
  int v11;
  _BYTE v12[5];
  integer_t policy_info[2];
  int v14;
  int v15;
  *(_DWORD *)(a1 + 108) = a2;
  *(_DWORD *)(a1 + 112) = a3;
  *(_DWORD *)(a1 + 116) = a4;
  *(_BYTE *)(a1 + 120) = a5;
  *(_BYTE *)(a1 + 121) = 1;
  if (atomic_load((unint64_t *)(a1 + 8)))
  {
    int v6 = *(_DWORD *)(a1 + 116);
    *(void *)policy_info = *(void *)(a1 + 108);
    int v7 = *(unsigned __int8 *)(a1 + 120);
    __int16 v14 = v6;
    int v15 = v7;
    unsigned int v8 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 8));
    thread_act_t v9 = pthread_mach_thread_np(v8);
    char v10 = thread_policy_set(v9, 2u, policy_info, 4u);
    if (v10)
    {
      v12[0] = HIBYTE(v10);
      v12[1] = BYTE2(v10);
      v12[2] = BYTE1(v10);
      unsigned __int8 v11 = v10;
      v12[3] = v10;
      v12[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_14D18((uint64_t)v12, v11);
      }
      __break(1u);
    }
  }

uint64_t sub_458C(uint64_t result)
{
  if (atomic_load((unint64_t *)(result + 8)))
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_14E3C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    __break(1u);
  }

  if (!atomic_load((unint64_t *)(result + 8)))
  {
    uint64_t v3 = result;
    int v4 = pthread_attr_init(&v43);
    if (v4)
    {
      int v15 = v4;
      BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v16) {
        sub_14E08(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    else
    {
      int v5 = pthread_attr_setdetachstate(&v43, 2);
      if (v5)
      {
        int v15 = v5;
        BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v24) {
          sub_14DD4(v24, v25, v26, v27, v28, v29, v30, v31);
        }
      }

      else
      {
        pthread_attr_getschedparam(&v43, &v42);
        v42.sched_priority = *(_DWORD *)(v3 + 104);
        pthread_attr_setschedparam(&v43, &v42);
        if (*(_BYTE *)(v3 + 122)) {
          pthread_attr_setschedpolicy(&v43, 4);
        }
        pthread_t v41 = 0LL;
        int v6 = pthread_create(&v41, &v43, (void *(__cdecl *)(void *))sub_4720, (void *)v3);
        if (!v6 && v41)
        {
          atomic_store((unint64_t)v41, (unint64_t *)(v3 + 8));
          return pthread_attr_destroy(&v43);
        }

        int v15 = v6;
        BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v32) {
          sub_14DA0(v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }
    }

    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_18630;
    exception[2] = v15;
  }

  return result;
}

uint64_t sub_4720(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40)) {
    pthread_setname_np((const char *)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 121)) {
    sub_44DC(a1, *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(_BYTE *)(a1 + 120));
  }
  int v2 = *(uint64_t (**)(void))(a1 + 24);
  if (!v2)
  {
    uint64_t v3 = 0LL;
    atomic_store(0LL, (unint64_t *)(a1 + 8));
    if (!*(_BYTE *)(a1 + 123)) {
      return v3;
    }
    goto LABEL_7;
  }

  uint64_t v3 = v2(*(void *)(a1 + 32));
  atomic_store(0LL, (unint64_t *)(a1 + 8));
  if (*(_BYTE *)(a1 + 123)) {
LABEL_7:
  }
    (*(void (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
  return v3;
}

void sub_47CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_47E4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_187D8;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0LL);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_14E70(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_18630;
    exception[2] = v5;
  }

  return a1;
}

uint64_t sub_4870(uint64_t a1)
{
  *(void *)a1 = off_187D8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_48A4(char *a1)
{
  *(void *)a1 = off_187D8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  operator delete(a1);
}

uint64_t sub_48D8(uint64_t a1)
{
  int v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v2, v3)) {
    return 0LL;
  }
  int v5 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if (v5)
  {
    int v6 = v5;
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_14EA4(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_18630;
    exception[2] = v6;
  }

  atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  return 1LL;
}

void sub_4998(uint64_t a1)
{
  int v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v2, v3))
  {
    atomic_store(0LL, (unint64_t *)(a1 + 16));
    int v4 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 24));
    if (v4)
    {
      int v5 = v4;
      BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6) {
        sub_14ED8(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18630;
      exception[2] = v5;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v15 = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own",  v15,  2u);
  }

uint64_t sub_4A7C(uint64_t a1, char *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  int v5 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  if (pthread_equal(v4, v5))
  {
    char v6 = 0;
LABEL_6:
    uint64_t result = 1LL;
    *a2 = v6;
    return result;
  }

  int v7 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 24));
  if (v7 != 16)
  {
    if (v7)
    {
      v11[0] = HIBYTE(v7);
      v11[1] = BYTE2(v7);
      v11[2] = BYTE1(v7);
      int v9 = v7;
      v11[3] = v7;
      integer_t v11[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_14F0C((uint64_t)v11, v9);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_18630;
      exception[2] = v9;
    }

    atomic_store((unint64_t)v4, (unint64_t *)(a1 + 16));
    char v6 = 1;
    goto LABEL_6;
  }

  uint64_t result = 0LL;
  *a2 = 0;
  return result;
}

BOOL sub_4B8C(uint64_t a1)
{
  unint64_t v1 = atomic_load((unint64_t *)(a1 + 16));
  return v1 == 0;
}

BOOL sub_4BA0(uint64_t a1)
{
  int v2 = pthread_self();
  int v3 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 16));
  return pthread_equal(v2, v3) != 0;
}

void sub_4BD4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_2D94((char *)&v2, *(_DWORD *)(a1 + 264));
    strlcpy(__dst, (const char *)&v2, 0x100uLL);
    int v2 = 136315906;
    int v3 = "MIDIRTPSession.cpp";
    __int16 v4 = 1024;
    int v5 = 102;
    __int16 v6 = 2080;
    uint64_t v7 = a1 + 8;
    __int16 v8 = 2080;
    int v9 = __dst;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: %s\n", (uint8_t *)&v2, 0x26u);
  }

uint64_t sub_4CC8(uint64_t a1)
{
  *(void *)a1 = off_18820;
  *(void *)(a1 + 16) = 0LL;
  *(_BYTE *)(a1 + 24) = 1;
  *(void *)(a1 + 96) = 0LL;
  *(_BYTE *)(a1 + 104) = 1;
  *(void *)(a1 + 120) = off_188B8;
  *(void *)(a1 + 128) = 0LL;
  *(_DWORD *)(a1 + 136) = -1;
  *(_WORD *)(a1 + 140) = 0;
  *(void *)(a1 + 152) = a1;
  *(void *)(a1 + 160) = off_188B8;
  *(void *)(a1 + 168) = 0LL;
  *(_DWORD *)(a1 + 176) = -1;
  *(_WORD *)(a1 + 180) = 0;
  *(void *)(a1 + 192) = a1;
  *(void *)(a1 + 200) = off_18908;
  *(void *)(a1 + 208) = 0LL;
  *(_DWORD *)(a1 + 216) = -1;
  *(_WORD *)(a1 + 220) = 0;
  *(void *)(a1 + 232) = a1;
  *(void *)(a1 + 248) = 0LL;
  *(_DWORD *)(a1 + 256) = -1;
  *(_WORD *)(a1 + 260) = 0;
  *(void *)(a1 + 240) = off_18908;
  *(void *)(a1 + 272) = a1;
  *(void *)(a1 + 280) = &off_18930;
  *(void *)(a1 + 288) = 0LL;
  *(void *)(a1 + 296) = a1;
  sub_47E4(a1 + 304, (uint64_t)"MIDIRTPSession.mSessionLock");
  *(_OWORD *)(a1 + 424) = 0u;
  *(void *)(a1 + 416) = a1 + 424;
  *(_WORD *)(a1 + 440) = 0;
  *(void *)(a1 + 444) = 0LL;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_BYTE *)(a1 + 472) = 7;
  *(void *)(a1 + 528) = 0LL;
  *(_DWORD *)(a1 + 508) = 0;
  *(_OWORD *)(a1 + 476) = 0u;
  *(_OWORD *)(a1 + 492) = 0u;
  *(void *)(a1 + 536) = 0x3F847AE147AE147BLL;
  *(void *)(a1 + 544) = &off_18980;
  *(void *)(a1 + 576) = 0LL;
  *(void *)(a1 + 584) = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
  *(void *)(a1 + 544) = &off_18958;
  *(void *)(a1 + 1616) = a1;
  *(_BYTE *)(a1 + 1625) = 0;
  *(_OWORD *)(a1 + 1632) = 0u;
  *(_OWORD *)(a1 + 1648) = 0u;
  *(void *)(a1 + 1664) = a1 + 1664;
  *(void *)(a1 + 1672) = a1 + 1664;
  *(void *)(a1 + 1680) = 0LL;
  sub_4FF0(a1 + 1632, 0x10uLL);
  uint64_t v2 = *(void *)(a1 + 1656);
  *(void *)(a1 + 1656) = 0LL;
  if (v2)
  {
    int v3 = *(const void **)(v2 + 16);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v2 + 16) = 0LL;
    }

    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v2 + 24));
    operator delete((void *)v2);
  }

  return a1;
}

void sub_4EC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, void *a12, uint64_t a13, uint64_t a14)
{
}

void *sub_4F80(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  return a1;
}

void *sub_4FB8(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  return a1;
}

void sub_4FF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(char **)a1;
  if (a2 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)
  {
    if (a2 >> 60) {
      sub_A7C4();
    }
    __int16 v4 = *(char **)(a1 + 8);
    uint64_t v5 = 16 * a2;
    __int16 v6 = (char *)operator new(16 * a2);
    uint64_t v7 = &v6[v5];
    __int16 v8 = &v6[v4 - v2];
    if (v4 == v2)
    {
      *(void *)a1 = v8;
      *(void *)(a1 + 8) = v8;
      *(void *)(a1 + 16) = v7;
      if (v2) {
LABEL_16:
      }
        operator delete(v2);
    }

    else
    {
      int v9 = &v6[v4 - v2];
      do
      {
        __int128 v10 = *((_OWORD *)v4 - 1);
        v4 -= 16;
        *((_OWORD *)v9 - 1) = v10;
        v9 -= 16;
        *(void *)__int16 v4 = 0LL;
        *((void *)v4 + 1) = 0LL;
      }

      while (v4 != v2);
      uint64_t v11 = *(char **)a1;
      uint64_t v2 = *(char **)(a1 + 8);
      *(void *)a1 = v9;
      *(void *)(a1 + 8) = v8;
      *(void *)(a1 + 16) = v7;
      if (v2 != v11)
      {
        do
        {
          uint64_t v12 = (std::__shared_weak_count *)*((void *)v2 - 1);
          if (v12)
          {
            p_shared_owners = (unint64_t *)&v12->__shared_owners_;
            do
              unint64_t v14 = __ldaxr(p_shared_owners);
            while (__stlxr(v14 - 1, p_shared_owners));
            if (!v14)
            {
              ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
              std::__shared_weak_count::__release_weak(v12);
            }
          }

          v2 -= 16;
        }

        while (v2 != v11);
        uint64_t v2 = v11;
      }

      if (v2) {
        goto LABEL_16;
      }
    }
  }

uint64_t *sub_50F8(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0LL;
    if (v2 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        uint64_t v2 = v5;
      }

      while (v5 != a1);
    }
  }

  return a1;
}

uint64_t *sub_5158(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0LL;
  if (v2)
  {
    uint64_t v3 = *(const void **)(v2 + 16);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v2 + 16) = 0LL;
    }

    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v2 + 24));
    operator delete((void *)v2);
  }

  return a1;
}

void **sub_51A8(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5)
        {
          p_shared_owners = (unint64_t *)&v5->__shared_owners_;
          do
            unint64_t v7 = __ldaxr(p_shared_owners);
          while (__stlxr(v7 - 1, p_shared_owners));
          if (!v7)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }

        v3 -= 16;
      }

      while (v3 != v2);
      uint64_t v4 = *a1;
    }

    a1[1] = v2;
    operator delete(v4);
  }

  return a1;
}

uint64_t sub_5248(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }

  return a1;
}

uint64_t sub_5280(uint64_t a1)
{
  *(void *)a1 = off_18820;
  sub_5440(a1);
  if (*(void *)(a1 + 1680))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 1672);
    uint64_t v3 = *(void *)(a1 + 1664);
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v4;
    *(void *)(a1 + 1680) = 0LL;
    if (v2 != (uint64_t *)(a1 + 1664))
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        uint64_t v2 = v5;
      }

      while (v5 != (uint64_t *)(a1 + 1664));
    }
  }

  uint64_t v6 = *(void *)(a1 + 1656);
  *(void *)(a1 + 1656) = 0LL;
  if (v6)
  {
    unint64_t v7 = *(const void **)(v6 + 16);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(v6 + 16) = 0LL;
    }

    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v6 + 24));
    operator delete((void *)v6);
  }

  uint64_t v8 = *(void *)(a1 + 1632);
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 1640);
    __int128 v10 = *(void **)(a1 + 1632);
    if (v9 != v8)
    {
      do
      {
        uint64_t v11 = *(std::__shared_weak_count **)(v9 - 8);
        if (v11)
        {
          p_shared_owners = (unint64_t *)&v11->__shared_owners_;
          do
            unint64_t v13 = __ldaxr(p_shared_owners);
          while (__stlxr(v13 - 1, p_shared_owners));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }

        v9 -= 16LL;
      }

      while (v9 != v8);
      __int128 v10 = *(void **)(a1 + 1632);
    }

    *(void *)(a1 + 1640) = v8;
    operator delete(v10);
  }

  sub_A7D8((MIDIPacketList *)(a1 + 544));
  sub_A610(a1 + 416, *(void **)(a1 + 424));
  sub_4870(a1 + 304);
  sub_26F8(a1 + 280);
  *(void *)(a1 + 240) = off_188E0;
  sub_11520(a1 + 240);
  *(void *)(a1 + 200) = off_188E0;
  sub_11520(a1 + 200);
  *(void *)(a1 + 160) = off_188E0;
  sub_11520(a1 + 160);
  *(void *)(a1 + 120) = off_188E0;
  sub_11520(a1 + 120);
  if (*(_BYTE *)(a1 + 104))
  {
    unint64_t v14 = *(const void **)(a1 + 96);
    if (v14) {
      CFRelease(v14);
    }
  }

  if (*(_BYTE *)(a1 + 24))
  {
    int v15 = *(const void **)(a1 + 16);
    if (v15) {
      CFRelease(v15);
    }
  }

  return a1;
}

void sub_5440(uint64_t a1)
{
  uint64_t v2 = a1 + 304;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
  uint64_t v4 = *(void *)(a1 + 1656);
  std::recursive_mutex::lock((std::recursive_mutex *)(v4 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v4 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v4 + 24));
  uint64_t v5 = *(void **)(a1 + 504);
  if (v5)
  {
    if (*v5) {
      MIDITimerTaskDispose();
    }
    operator delete(v5);
  }

  *(void *)(a1 + 504) = 0LL;
  uint64_t v6 = *(void **)(a1 + 528);
  if (v6)
  {
    if (*v6) {
      MIDITimerTaskDispose();
    }
    operator delete(v6);
  }

  *(void *)(a1 + 528) = 0LL;
  while (1)
  {
    uint64_t v7 = *(void *)(a1 + 1640);
    if (*(void *)(a1 + 1632) == v7) {
      break;
    }
    uint64_t v8 = *(std::__shared_weak_count **)(v7 - 8);
    v19[0] = *(void *)(v7 - 16);
    v19[1] = (uint64_t)v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }

    sub_6090(a1, v19, 1, 1);
    if (v8)
    {
      uint64_t v11 = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }

  sub_11520(a1 + 120);
  sub_11520(a1 + 160);
  sub_11520(a1 + 200);
  sub_11520(a1 + 240);
  sub_2770(a1 + 280);
  unint64_t v13 = (uint64_t *)(a1 + 1664);
  uint64_t v14 = *(void *)(a1 + 1672);
  if (v14 != a1 + 1664)
  {
    do
    {
      free(*(void **)(v14 + 32));
      uint64_t v14 = *(void *)(v14 + 8);
    }

    while ((uint64_t *)v14 != v13);
  }

  if (*(void *)(a1 + 1680))
  {
    int v15 = *(uint64_t **)(a1 + 1672);
    uint64_t v16 = *(void *)(a1 + 1664);
    uint64_t v17 = *v15;
    *(void *)(v17 + 8) = *(void *)(v16 + 8);
    **(void **)(v16 + 8) = v17;
    *(void *)(a1 + 1680) = 0LL;
    if (v15 != v13)
    {
      do
      {
        uint64_t v18 = (uint64_t *)v15[1];
        operator delete(v15);
        int v15 = v18;
      }

      while (v18 != v13);
    }
  }

  *(_BYTE *)(a1 + 8) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
}

void sub_561C(_Unwind_Exception *a1)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(a1);
}

BOOL sub_5668(uint64_t a1, unsigned int a2)
{
  *(_WORD *)(a1 + 112) = a2;
  *(_WORD *)(a1 + 114) = a2 + 1;
  uint64_t v6 = 0LL;
  *(void *)&v5.sa_data[6] = 0LL;
  int v7 = 0;
  *(_WORD *)&v5.sa_len = 528;
  *(_DWORD *)&v5.sa_data[2] = 0;
  *(_WORD *)v5.sa_data = __rev16(a2);
  if (bind(*(_DWORD *)(a1 + 136), &v5, 0x10u) < 0)
  {
    if ((*__error() & 0xFFFFFFFE) == 0x30)
    {
      BOOL v3 = 0;
      goto LABEL_8;
    }
  }

  else
  {
    *(_WORD *)(a1 + 140) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  }

  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 114)) >> 16;
  if (bind(*(_DWORD *)(a1 + 216), &v5, v5.sa_len) < 0)
  {
    BOOL v3 = (*__error() & 0xFFFFFFFE) != 48;
  }

  else
  {
    *(_WORD *)(a1 + 220) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
    BOOL v3 = 1;
  }

LABEL_8:
  int v7 = 0;
  *(_DWORD *)&v5.sa_data[2] = 0;
  *(_WORD *)&v5.sa_len = 7708;
  uint64_t v6 = 0LL;
  *(void *)&v5.sa_data[6] = 0LL;
  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16;
  if (bind(*(_DWORD *)(a1 + 176), &v5, 0x1Cu) < 0)
  {
    if ((*__error() & 0xFFFFFFFE) == 0x30) {
      return 0LL;
    }
  }

  else
  {
    *(_WORD *)(a1 + 180) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  }

  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 114)) >> 16;
  if (bind(*(_DWORD *)(a1 + 256), &v5, v5.sa_len) < 0) {
    return v3 & ((*__error() & 0xFFFFFFFE) != 48);
  }
  *(_WORD *)(a1 + 260) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  return v3;
}

MIDIPacket *sub_582C(uint64_t a1, const void *a2, unsigned int a3)
{
  if (qword_1C088)
  {
    if (*(_BYTE *)(a1 + 104)) {
      goto LABEL_3;
    }
LABEL_8:
    *(void *)(a1 + 96) = a2;
    *(_BYTE *)(a1 + 105) = 0;
    goto LABEL_11;
  }

  uint64_t v8 = operator new(0x120uLL);
  sub_A8A0((uint64_t)v8, 78);
  qword_1C088 = (uint64_t)v8;
  if (!*(_BYTE *)(a1 + 104)) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v6 = *(const void **)(a1 + 96);
  if (v6)
  {
    CFRelease(v6);
    int v7 = *(unsigned __int8 *)(a1 + 104);
    *(void *)(a1 + 96) = a2;
    *(_BYTE *)(a1 + 105) = 0;
    if (!a2 || !v7) {
      goto LABEL_11;
    }
  }

  else
  {
    *(void *)(a1 + 96) = a2;
    *(_BYTE *)(a1 + 105) = 0;
    if (!a2) {
      goto LABEL_11;
    }
  }

  CFRetain(a2);
LABEL_11:
  sub_5DE8(a1);
  sub_11568(a1 + 120, qword_1C088, 2, 2, 0, 32769);
  sub_11568(a1 + 160, qword_1C088, 30, 2, 0, 32769);
  sub_11568(a1 + 200, qword_1C088, 2, 2, 0, 1);
  sub_11568(a1 + 240, qword_1C088, 30, 2, 0, 1);
  if (!a3 || !sub_5668(a1, a3))
  {
    unsigned __int16 v9 = 5004;
    while (!sub_5668(a1, v9))
    {
      v9 += 2;
      if (v9 == 65534)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_2D94(__str, 0xFFFFFFFF);
          LODWORD(buf.version) = 136315906;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"MIDIRTPSession.cpp";
          WORD2(buf.info) = 1024;
          *(_DWORD *)((char *)&buf.info + 6) = 329;
          WORD1(buf.retain) = 2080;
          *(const void *(__cdecl **)(const void *))((char *)&buf.retain + 4) = (const void *(__cdecl *)(const void *))__str;
          WORD2(buf.release) = 2080;
          *(void (__cdecl **)(const void *))((char *)&buf.release + 6) = (void (__cdecl *)(const void *))"Couldn't find free port";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  (uint8_t *)&buf,  0x26u);
        }

        exception = __cxa_allocate_exception(0x110uLL);
        sub_2AF4((uint64_t)exception, "Couldn't find free port", -1);
      }
    }

    if (a3 != v9) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 48LL))(a1, v9);
    }
  }

  fcntl(*(_DWORD *)(a1 + 136), 4, 4LL);
  fcntl(*(_DWORD *)(a1 + 176), 4, 4LL);
  fcntl(*(_DWORD *)(a1 + 216), 4, 4LL);
  fcntl(*(_DWORD *)(a1 + 256), 4, 4LL);
  uint64_t v11 = *(const __CFString **)(a1 + 96);
  if (v11 && CFStringGetLength(v11) >= 1) {
    sub_28D0( (CFNetServiceRef *)(a1 + 280),  @"_apple-midi._udp",  *(CFStringRef *)(a1 + 96),  @"local.",  *(unsigned __int16 *)(a1 + 112));
  }
  int v12 = open("/dev/urandom", 4);
  int v13 = v12;
  if (v12 < 0 || read(v12, &buf, 4uLL) < 0)
  {
    *(_DWORD *)(a1 + 392) = rand();
    if (v13 < 0)
    {
LABEL_30:
      unsigned __int16 version = rand();
      goto LABEL_31;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 392) = buf.version;
  }

  if (read(v13, &buf, 4uLL) < 0) {
    goto LABEL_30;
  }
  unsigned __int16 version = buf.version;
LABEL_31:
  *(_DWORD *)(a1 + 408) = version + 1;
  uint64_t v15 = mach_absolute_time();
  if (v13 < 0 || read(v13, &buf, 4uLL) < 0) {
    int v16 = rand();
  }
  else {
    int v16 = buf.version;
  }
  *(void *)(a1 + 400) = v15 ^ v16 & 0xFFFFFF;
  sub_A610(a1 + 416, *(void **)(a1 + 424));
  *(void *)(a1 + 416) = a1 + 424;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_WORD *)(a1 + 440) = 0;
  *(void *)(a1 + 444) = 0LL;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_BYTE *)(a1 + 472) = 7;
  *(void *)(a1 + 476) = 0LL;
  *(void *)(a1 + 492) = 0LL;
  *(void *)(a1 + 484) = 0LL;
  *(_DWORD *)(a1 + 500) = 0;
  *(_BYTE *)(a1 + 8) = 1;
  Current = CFRunLoopGetCurrent();
  uint64_t v18 = (char *)operator new(0x58uLL);
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = sub_5F40;
  std::recursive_mutex::recursive_mutex((std::recursive_mutex *)(v18 + 24));
  buf.unsigned __int16 version = 0LL;
  *(_OWORD *)&buf.info = (unint64_t)v18;
  *(_OWORD *)&buf.release = 0uLL;
  CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
  uint64_t v20 = CFRunLoopTimerCreate(0LL, v19 + 31536000.0, 1.0e11, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_AD10, &buf);
  *((void *)v18 + 2) = v20;
  CFRunLoopAddTimer(Current, v20, kCFRunLoopDefaultMode);
  uint64_t v21 = *(void *)(a1 + 1656);
  *(void *)(a1 + 1656) = v18;
  if (v21)
  {
    uint64_t v22 = *(const void **)(v21 + 16);
    if (v22)
    {
      CFRelease(v22);
      *(void *)(v21 + 16) = 0LL;
    }

    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v21 + 24));
    operator delete((void *)v21);
  }

  uint64_t v23 = operator new(8uLL);
  void *v23 = MIDITimerTaskCreate(sub_5F44, a1);
  *(void *)(a1 + 504) = v23;
  *(void *)(a1 + 512) = -1LL;
  BOOL v24 = operator new(8uLL);
  void *v24 = MIDITimerTaskCreate(sub_5FE0, a1);
  *(void *)(a1 + 528) = v24;
  *(_BYTE *)(a1 + 1624) = 0;
  uint64_t result = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
  *(void *)(a1 + 584) = result;
  return result;
}

void sub_5D2C(_Unwind_Exception *a1)
{
}

void sub_5D44(void *a1, int a2)
{
  if (a2)
  {
    operator delete(v3);
    __cxa_begin_catch(a1);
    sub_5440(v2);
    __cxa_rethrow();
  }

  JUMPOUT(0x5DD8LL);
}

void sub_5DC4()
{
}

void sub_5DD0(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_27D4(exception_object);
}

uint64_t sub_5DE8(uint64_t a1)
{
  uint64_t v2 = *(const __CFString **)(a1 + 96);
  if (v2 && CFStringGetLength(v2) >= 1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      BOOL v3 = *(const void **)(a1 + 16);
      if (v3) {
        CFRelease(v3);
      }
    }

    CFStringRef v4 = *(CFStringRef *)(a1 + 96);
    *(void *)(a1 + 16) = v4;
    int v5 = *(unsigned __int8 *)(a1 + 104);
    *(_BYTE *)(a1 + 24) = v5;
    *(_BYTE *)(a1 + 25) = *(_BYTE *)(a1 + 105);
    if (v5 && v4)
    {
      CFRetain(v4);
      CFStringRef v4 = *(CFStringRef *)(a1 + 16);
    }
  }

  else
  {
    sub_2ED8(cStr, 0x80uLL);
    CFStringRef v4 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    if (*(_BYTE *)(a1 + 24))
    {
      uint64_t v6 = *(const void **)(a1 + 16);
      if (v6) {
        CFRelease(v6);
      }
    }

    *(void *)(a1 + 16) = v4;
    *(_BYTE *)(a1 + 25) = 0;
  }

  return CFStringGetCString(v4, (char *)(a1 + 32), 64LL, 0x8000100u);
}

double sub_5EE8(uint64_t a1)
{
  uint64_t v2 = (_OWORD *)(a1 + 8);
  sub_A610(a1, *(void **)(a1 + 8));
  *(void *)a1 = v2;
  double result = 0.0;
  *uint64_t v2 = 0u;
  *(_WORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_BYTE *)(a1 + 56) = 7;
  *(void *)(a1 + 60) = 0LL;
  *(void *)(a1 + 76) = 0LL;
  *(void *)(a1 + 68) = 0LL;
  *(_DWORD *)(a1 + 84) = 0;
  return result;
}

MIDIPacket *sub_5F44(uint64_t a1)
{
  uint64_t v2 = a1 + 304;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
  v5[0] = 0;
  *(void *)(a1 + 512) = -1LL;
  double result = sub_88E4(a1, v5, 0);
  if (v3) {
    return (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  return result;
}

void sub_5FBC(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

MIDIPacket *sub_5FE0(uint64_t a1)
{
  uint64_t v2 = a1 + 304;
  double result = (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
  int v4 = (int)result;
  if (*(_BYTE *)(a1 + 8))
  {
    if (*(_DWORD *)(a1 + 592)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 544) + 16LL))(a1 + 544, a1 + 592);
    }
    double result = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
    *(void *)(a1 + 584) = result;
    *(_BYTE *)(a1 + 1624) = 0;
  }

  if (v4) {
    return (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  return result;
}

void sub_606C(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_6090(uint64_t a1, uint64_t *a2, char a3, int a4)
{
  uint64_t v8 = (uint64_t *)(a1 + 1664);
  unsigned __int16 v9 = *(uint64_t **)(a1 + 1672);
  if (v9 != (uint64_t *)(a1 + 1664))
  {
    do
    {
      uint64_t v14 = (uint64_t *)v9[1];
      if (v9[3] == *a2)
      {
        free((void *)v9[4]);
        uint64_t v15 = *v9;
        *(void *)(v15 + 8) = v9[1];
        *(void *)v9[1] = v15;
        --*(void *)(a1 + 1680);
        operator delete(v9);
      }

      unsigned __int16 v9 = v14;
    }

    while (v14 != v8);
  }

  if ((a3 & 1) != 0)
  {
    uint64_t v10 = *a2;
    if (*(int *)(*a2 + 28) >= 1)
    {
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v25 = 0x20000005942FFFFLL;
      unsigned int v11 = bswap32(*(_DWORD *)(a1 + 392));
      int v26 = 0;
      unsigned int v27 = v11;
      *(_OWORD *)BOOL v24 = *(_OWORD *)(v10 + 64);
      *(_OWORD *)&v24[12] = *(_OWORD *)(v10 + 76);
      sub_3238((uint64_t)v24, v44, 0x100uLL);
      if ((sendto(*(_DWORD *)(a1 + 40LL * (v24[1] == 30) + 136), &v25, 0x10uLL, 0, (const sockaddr *)v24, v24[0]) & 0x80000000) != 0) {
        __error();
      }
    }
  }

  int v12 = *(void **)(a1 + 1632);
  int v13 = *(void **)(a1 + 1640);
  if (v12 == v13)
  {
LABEL_9:
    if (a4) {
LABEL_31:
    }
      (*(void (**)(uint64_t, void))(*(void *)a1 + 40LL))(a1, *(void *)(*a2 + 48));
  }

  else
  {
    while (*v12 != *a2)
    {
      v12 += 2;
      if (v12 == v13) {
        goto LABEL_9;
      }
    }

    int v16 = v12 + 2;
    if (v12 + 2 != v13)
    {
      do
      {
        __int128 v17 = *(_OWORD *)v16;
        *int v16 = 0LL;
        v16[1] = 0LL;
        uint64_t v18 = (std::__shared_weak_count *)v12[1];
        *(_OWORD *)int v12 = v17;
        if (v18)
        {
          p_shared_owners = (unint64_t *)&v18->__shared_owners_;
          do
            unint64_t v20 = __ldaxr(p_shared_owners);
          while (__stlxr(v20 - 1, p_shared_owners));
          if (!v20)
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
        }

        v16 += 2;
        v12 += 2;
      }

      while (v16 != v13);
      int v13 = *(void **)(a1 + 1640);
    }

    while (v13 != v12)
    {
      uint64_t v21 = (std::__shared_weak_count *)*(v13 - 1);
      if (v21)
      {
        uint64_t v22 = (unint64_t *)&v21->__shared_owners_;
        do
          unint64_t v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }

      v13 -= 2;
    }

    *(void *)(a1 + 1640) = v12;
    if (a4) {
      goto LABEL_31;
    }
  }

uint64_t sub_6320(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }

  return result;
}

uint64_t sub_6388(uint64_t a1, const __CFString *a2)
{
  unint64_t v4 = (CFNetServiceRef *)(a1 + 280);
  sub_2770(a1 + 280);
  if (!*(_BYTE *)(a1 + 104))
  {
    *(void *)(a1 + 96) = a2;
    *(_BYTE *)(a1 + 105) = 0;
    goto LABEL_7;
  }

  int v5 = *(const void **)(a1 + 96);
  if (!v5)
  {
    *(void *)(a1 + 96) = a2;
    *(_BYTE *)(a1 + 105) = 0;
    if (!a2) {
      return sub_5DE8(a1);
    }
    goto LABEL_10;
  }

  CFRelease(v5);
  int v6 = *(unsigned __int8 *)(a1 + 104);
  *(void *)(a1 + 96) = a2;
  *(_BYTE *)(a1 + 105) = 0;
  if (a2 && v6)
  {
LABEL_10:
    CFRetain(a2);
    a2 = *(const __CFString **)(a1 + 96);
    if (!a2) {
      return sub_5DE8(a1);
    }
    goto LABEL_11;
  }

LABEL_7:
  if (!a2) {
    return sub_5DE8(a1);
  }
LABEL_11:
  if (CFStringGetLength(a2) < 1) {
    return sub_5DE8(a1);
  }
  sub_28D0(v4, @"_apple-midi._udp", *(CFStringRef *)(a1 + 96), @"local.", *(unsigned __int16 *)(a1 + 112));
  return sub_5DE8(a1);
}

uint64_t sub_6458(uint64_t a1)
{
  int v2 = strrchr(buffer, 32);
  if (!v2) {
    int v2 = &buffer[strlen(buffer)];
  }
  int v3 = (unsigned __int16)word_1C000++;
  snprintf(v2, 8uLL, " %d", v3);
  CFStringRef v4 = CFStringCreateWithCString(0LL, buffer, 0x8000100u);
  if (*(_BYTE *)(a1 + 104))
  {
    int v5 = *(const void **)(a1 + 96);
    if (v5) {
      CFRelease(v5);
    }
  }

  *(void *)(a1 + 96) = v4;
  *(_BYTE *)(a1 + 105) = 0;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 24LL))(a1, v4);
  sub_28D0( (CFNetServiceRef *)(a1 + 280),  @"_apple-midi._udp",  *(CFStringRef *)(a1 + 96),  @"local.",  *(unsigned __int16 *)(a1 + 112));
  return sub_5DE8(a1);
}

ssize_t sub_6574(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6)
{
  __int128 v15 = 0u;
  memset(v14, 0, sizeof(v14));
  v13[0] = bswap32(a3);
  v13[1] = 0x2000000;
  unsigned int v10 = bswap32(*(_DWORD *)(a1 + 392));
  v13[2] = bswap32(a4);
  v13[3] = v10;
  if (a6)
  {
    CFStringGetCString(*(CFStringRef *)(a1 + 16), (char *)v14, 256LL, 0x8000100u);
    HIBYTE(v15) = 0;
    int v11 = strlen((const char *)v14) + 17;
  }

  else
  {
    int v11 = 16;
  }

  return sub_91E4((void *)a1, a2, a3, a5, v13, v11);
}

void sub_6698(uint64_t a1, const __CFString *a2, int a3)
{
  int v33 = a3;
  uint64_t v5 = a1 + 304;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
  sub_3914(@"_apple-midi._udp", a2, (sockaddr *)__s2);
  uint64_t v7 = *(void *)(a1 + 1632);
  for (uint64_t i = *(void *)(a1 + 1640); v7 != i; v7 += 16LL)
  {
    if (!memcmp((const void *)(*(void *)v7 + 64LL), __s2, *(unsigned __int8 *)(*(void *)v7 + 64LL)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2D94((char *)&__str, 0xFFFFFFFD);
        *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
        *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
        *(_WORD *)__int128 v36 = 1024;
        *(_DWORD *)&v36[2] = 558;
        *(_WORD *)&v36[6] = 2080;
        *(void *)&v36[8] = &__str;
        *(_WORD *)&v36[16] = 2080;
        *(void *)&v36[18] = "";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
      }

      exception = __cxa_allocate_exception(0x110uLL);
      sub_2AF4((uint64_t)exception, "", -3);
    }
  }

  unsigned __int8 v31 = 1;
  sub_AD78(a1, &v31, &v33, (uint64_t *)&__str);
  uint64_t v9 = __str;
  if (!*(_BYTE *)(__str + 40))
  {
    *(void *)(__str + 32) = a2;
    *(_BYTE *)(v9 + 41) = 0;
    goto LABEL_12;
  }

  unsigned int v10 = *(const void **)(__str + 32);
  if (!v10)
  {
    *(void *)(__str + 32) = a2;
    *(_BYTE *)(v9 + 41) = 0;
    if (!a2) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  CFRelease(v10);
  int v11 = *(unsigned __int8 *)(v9 + 40);
  *(void *)(v9 + 32) = a2;
  *(_BYTE *)(v9 + 41) = 0;
  if (a2 && v11) {
LABEL_11:
  }
    CFRetain(a2);
LABEL_12:
  uint64_t v12 = __str;
  if (!*(_BYTE *)(__str + 56))
  {
    *(void *)(__str + 48) = a2;
    *(_BYTE *)(v12 + 57) = 0;
    goto LABEL_20;
  }

  int v13 = *(const void **)(__str + 48);
  if (!v13)
  {
    *(void *)(__str + 48) = a2;
    *(_BYTE *)(v12 + 57) = 0;
    if (!a2) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  CFRelease(v13);
  int v14 = *(unsigned __int8 *)(v12 + 56);
  *(void *)(v12 + 48) = a2;
  *(_BYTE *)(v12 + 57) = 0;
  if (a2 && v14) {
LABEL_19:
  }
    CFRetain(a2);
LABEL_20:
  uint64_t v15 = __str;
  *(_OWORD *)(__str + 64) = *(_OWORD *)__s2;
  *(_OWORD *)(v15 + 76) = *(_OWORD *)&__s2[12];
  int v16 = *(_DWORD *)(v15 + 28);
  if (v16 != 1)
  {
    if (v16)
    {
LABEL_27:
      *(_WORD *)&__s2[2] = bswap32((bswap32(*(unsigned __int16 *)&__s2[2]) >> 16) + 1) >> 16;
      *(_OWORD *)(v15 + 104) = *(_OWORD *)&__s2[12];
      *(_OWORD *)(v15 + 92) = *(_OWORD *)__s2;
      goto LABEL_34;
    }

    if (!*(_WORD *)(v15 + 66) || !*(_WORD *)(v15 + 94))
    {
      *(_WORD *)&__s2[2] = bswap32((bswap32(*(unsigned __int16 *)&__s2[2]) >> 16) + 1) >> 16;
      *(_OWORD *)(v15 + 104) = *(_OWORD *)&__s2[12];
      *(_OWORD *)(v15 + 92) = *(_OWORD *)__s2;
      if (!*(_WORD *)(v15 + 66)) {
        goto LABEL_34;
      }
      if (!*(_WORD *)(v15 + 94)) {
        goto LABEL_34;
      }
      *(_DWORD *)(v15 + 28) = 1;
LABEL_33:
      *(_DWORD *)(v15 + 28) = 2;
      goto LABEL_34;
    }

    *(_DWORD *)(v15 + 28) = 1;
  }

  if (*(int *)(v15 + 144) > 4)
  {
    *(_DWORD *)(v15 + 28) = 2;
    goto LABEL_27;
  }

  *(_WORD *)&__s2[2] = bswap32((bswap32(*(unsigned __int16 *)&__s2[2]) >> 16) + 1) >> 16;
  *(_OWORD *)(v15 + 104) = *(_OWORD *)&__s2[12];
  *(_OWORD *)(v15 + 92) = *(_OWORD *)__s2;
LABEL_34:
  *(_DWORD *)(v15 + 120) = 0;
  __int128 v17 = *(void **)(a1 + 1640);
  if (*(void **)(a1 + 1632) == v17)
  {
    sub_A610(a1 + 416, *(void **)(a1 + 424));
    *(void *)(a1 + 416) = a1 + 424;
    *(_OWORD *)(a1 + 424) = 0u;
    *(_WORD *)(a1 + 440) = 0;
    *(void *)(a1 + 444) = 0LL;
    *(_OWORD *)(a1 + 456) = 0u;
    *(_BYTE *)(a1 + 472) = 7;
    *(void *)(a1 + 476) = 0LL;
    *(void *)(a1 + 492) = 0LL;
    *(void *)(a1 + 484) = 0LL;
    *(_DWORD *)(a1 + 500) = 0;
    __int128 v17 = *(void **)(a1 + 1640);
LABEL_41:
    uint64_t v21 = sub_AA20(a1 + 1632, &__str);
    goto LABEL_42;
  }

LABEL_36:
  *__int128 v17 = __str;
  uint64_t v18 = *((void *)&__str + 1);
  v17[1] = *((void *)&__str + 1);
  if (v18)
  {
    CFAbsoluteTime v19 = (unint64_t *)(v18 + 8);
    do
      unint64_t v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }

  uint64_t v21 = v17 + 2;
LABEL_42:
  *(void *)(a1 + 1640) = v21;
  uint64_t v22 = __str;
  unsigned int v23 = *(_DWORD *)(__str + 24);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  memset(&v36[4], 0, 32);
  *(void *)CFRunLoopTimerContext buf = 0x20000004E49FFFFLL;
  unsigned int v24 = bswap32(v23);
  unsigned int v25 = bswap32(*(_DWORD *)(a1 + 392));
  *(_DWORD *)&buf[8] = v24;
  *(_DWORD *)__int128 v36 = v25;
  CFStringGetCString(*(CFStringRef *)(a1 + 16), &v36[4], 256LL, 0x8000100u);
  HIBYTE(v50) = 0;
  int v26 = strlen(&v36[4]);
  sub_91E4((void *)a1, 1, -46770, v22, buf, v26 + 17);
  unsigned int v27 = (std::__shared_weak_count *)*((void *)&__str + 1);
  if (!*((void *)&__str + 1)) {
    goto LABEL_46;
  }
  __int128 v28 = (unint64_t *)(*((void *)&__str + 1) + 8LL);
  do
    unint64_t v29 = __ldaxr(v28);
  while (__stlxr(v29 - 1, v28));
  if (v29)
  {
LABEL_46:
    if (!v6) {
      return;
    }
    goto LABEL_47;
  }

  ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
  std::__shared_weak_count::__release_weak(v27);
  if (v6) {
LABEL_47:
  }
    (*(void (**)(uint64_t))(*(void *)v5 + 24LL))(v5);
}

void sub_6B9C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_27D4(exception_object);
}

uint64_t sub_6C00(uint64_t result, __int128 *a2)
{
  __int128 v2 = *a2;
  *(_OWORD *)(result + 76) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)(result + 64) = v2;
  int v3 = *(_DWORD *)(result + 28);
  if (v3 == 1) {
    goto LABEL_6;
  }
  if (!v3 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
  }

  return result;
}

uint64_t sub_6C50(uint64_t result, __int128 *a2)
{
  __int128 v2 = *a2;
  *(_OWORD *)(result + 104) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)(result + 92) = v2;
  int v3 = *(_DWORD *)(result + 28);
  if (v3 == 1) {
    goto LABEL_6;
  }
  if (!v3 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
  }

  return result;
}

_OWORD *sub_6CA0(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 8);
  if ((unint64_t)v3 >= *(void *)(a1 + 16))
  {
    double result = sub_AA20(a1, (__int128 *)a2);
    *(void *)(a1 + 8) = result;
  }

  else
  {
    uint64_t v4 = *(void *)(a2 + 8);
    void *v3 = *(void *)a2;
    v3[1] = v4;
    if (v4)
    {
      uint64_t v5 = (unint64_t *)(v4 + 8);
      do
        unint64_t v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }

    double result = v3 + 2;
    *(void *)(a1 + 8) = v3 + 2;
  }

  return result;
}

void sub_6D08(void *a1, const void *a2)
{
  uint64_t v4 = a1 + 38;
  int v5 = (*(uint64_t (**)(void *))(a1[38] + 16LL))(a1 + 38);
  unint64_t v6 = (void *)a1[204];
  uint64_t v7 = (void *)a1[205];
  if (v6 != v7)
  {
    while (!CFEqual(*(CFTypeRef *)(*v6 + 48LL), a2))
    {
      v6 += 2;
      if (v6 == v7) {
        goto LABEL_4;
      }
    }

    uint64_t v8 = (std::__shared_weak_count *)v6[1];
    v13[0] = *v6;
    v13[1] = (uint64_t)v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }

    sub_6090((uint64_t)a1, v13, 1, 0);
    if (v8)
    {
      int v11 = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }

LABEL_4:
  if (v5) {
    (*(void (**)(void *))(*v4 + 24LL))(v4);
  }
}

      a1[1] = v5;
      if (++v6 == v7)
      {
        unint64_t v20 = *a1;
        goto LABEL_27;
      }
    }
  }

  int v5 = 0LL;
  unint64_t v20 = 0LL;
LABEL_27:
  uint64_t v21 = 126 - 2 * __clz(((char *)v5 - (char *)v20) >> 4);
  if (v5 == v20) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = v21;
  }
  sub_10398(v20, v5, (uint64_t)&v23, v22, 1);
}

void sub_6E08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24LL))(v9);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_6E40(void *a1, const void *a2, int a3)
{
  unint64_t v6 = a1 + 38;
  uint64_t result = (*(uint64_t (**)(void *))(a1[38] + 16LL))(a1 + 38);
  int v8 = result;
  uint64_t v9 = (uint64_t *)a1[204];
  int v10 = (uint64_t *)a1[205];
  if (v9 == v10)
  {
LABEL_7:
    if (!v8) {
      return result;
    }
    return (*(uint64_t (**)(void *))(*v6 + 24LL))(v6);
  }

  while (1)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(*v9 + 48), a2);
    if ((_DWORD)result) {
      break;
    }
    v9 += 2;
    if (v9 == v10) {
      goto LABEL_7;
    }
  }

  uint64_t v11 = *v9;
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t result = __udivti3(3000000LL * a3, ((unint64_t)(1000000LL * a3) * (unsigned __int128)3uLL) >> 64, 125LL, 0LL);
    *(void *)(v11 + 128) = result;
    goto LABEL_7;
  }

  uint64_t result = __udivti3(-3000000LL * a3, ((unint64_t)(-1000000LL * a3) * (unsigned __int128)3uLL) >> 64, 125LL, 0LL);
  *(void *)(v11 + 128) = -result;
  if (!v8) {
    return result;
  }
  return (*(uint64_t (**)(void *))(*v6 + 24LL))(v6);
}

void sub_6F38(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

MIDIPacketList *sub_6F5C(void *a1, int a2)
{
  *(void *)&v103.packet[0].data[18] = 0LL;
  *(void *)&v103.packet[0].data[26] = MIDIPacketListInit((MIDIPacketList *)&v103.packet[0].data[34]);
  *(void *)&v103.numPackets = &off_18890;
  char v106 = 0;
  v107 = a1;
  uint64_t v4 = &a1[5 * (a2 == 30)];
  int v5 = a1 + 38;
  while (1)
  {
    v100[0] = 28;
    ssize_t v6 = recvfrom(*((_DWORD *)v4 + 54), v108, 0x5C1uLL, 0, &v102, v100);
    unsigned int v7 = v6;
    if (v6 != (int)v6)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = &off_18AB0;
    }

    if (v6 >= 4)
    {
      int v8 = (*(uint64_t (**)(void *))(*v5 + 16LL))(a1 + 38);
      unsigned int v9 = bswap32(v108[0]);
      if (v9 >= 0xFFFF0000)
      {
        sub_7984((uint64_t)a1, 0, (uint64_t)v108, v7, (uint64_t)&v102);
        goto LABEL_20;
      }

      if (LOBYTE(v108[0]) == 128 && v7 >= 0xE && (v108[0] & 0xFF00) == 0x6100)
      {
        int v10 = (void *)a1[204];
        uint64_t v11 = (void *)a1[205];
        if (v10 != v11)
        {
          unsigned int v12 = bswap32(v108[2]);
          while (1)
          {
            uint64_t v13 = *v10;
            if (*(_DWORD *)(*v10 + 120LL) == v12) {
              break;
            }
            v10 += 2;
            if (v10 == v11) {
              goto LABEL_14;
            }
          }

          __int128 v17 = (std::__shared_weak_count *)v10[1];
          *(void *)v100 = v13;
          v101 = v17;
          if (v17)
          {
            p_shared_owners = (unint64_t *)&v17->__shared_owners_;
            do
              unint64_t v19 = __ldxr(p_shared_owners);
            while (__stxr(v19 + 1, p_shared_owners));
          }

          if (*(_DWORD *)(v13 + 28) != 2) {
            goto LABEL_15;
          }
          char v20 = v109;
          if ((char)v109 < 0)
          {
            unsigned int v21 = bswap32(v109 & 0xFF0F) >> 16;
            unsigned int v22 = 14;
          }

          else
          {
            unsigned int v21 = v109 & 0xF;
            unsigned int v22 = 13;
          }

          uint64_t v96 = bswap32(v108[1]);
          if (v7 - v22 >= v21) {
            uint64_t v23 = v21;
          }
          else {
            uint64_t v23 = v7 - v22;
          }
          uint64_t v24 = v22;
          uint64_t v25 = v23 + v22;
          unsigned int v26 = v7 - v25;
          BOOL v28 = (v109 & 0x40) == 0 || v26 < 3;
          unsigned int v29 = (unsigned __int16)v9;
          int v30 = *(_DWORD *)(v13 + 300);
          __int16 v31 = v9 - v30;
          int v32 = v30 + (__int16)(v29 - v30);
          if (v30) {
            unsigned int v29 = v30 + (__int16)(v29 - v30);
          }
          unsigned int v95 = v29;
          __int16 v104 = v29;
          char v105 = 1;
          if (v30)
          {
            if (v32 - (v30 + 1) < 0)
            {
              *(_DWORD *)(v13 + 300) = v32;
              goto LABEL_15;
            }

            char v33 = v31 == 1 || v28;
            if ((v33 & 1) == 0)
            {
              uint64_t v34 = *(void *)(v13 + 256);
              if (v34) {
                uint64_t v35 = v34 + (int)v96 - (int)v34;
              }
              else {
                uint64_t v35 = v96;
              }
              MIDITimeStamp v36 = *(void *)(v13 + 128)
                  + a1[50]
                  + (uint64_t)((double)(unint64_t)(v35 + *(void *)(v13 + 168)) * 2400.0);
              *(void *)(v13 + 256) = v35;
              sub_13AA4( (uint64_t *)(v13 + 312),  (char *)v108 + v25,  v26,  v30 + 1,  v32,  v36,  (uint64_t)&v103);
              if (v106)
              {
                char v106 = 0;
                __int128 v37 = (void *)a1[204];
                __int128 v38 = (void *)a1[205];
                if (v37 == v38)
                {
LABEL_53:
                  __int128 v39 = 0LL;
                  uint64_t v13 = 0LL;
                }

                else
                {
                  while (1)
                  {
                    uint64_t v13 = *v37;
                    if (*(_DWORD *)(*v37 + 120LL) == v12) {
                      break;
                    }
                    v37 += 2;
                    if (v37 == v38) {
                      goto LABEL_53;
                    }
                  }

                  __int128 v39 = (std::__shared_weak_count *)v37[1];
                  if (v39)
                  {
                    __int128 v40 = (unint64_t *)&v39->__shared_owners_;
                    do
                      unint64_t v41 = __ldxr(v40);
                    while (__stxr(v41 + 1, v40));
                  }
                }

                __int128 v42 = v101;
                *(void *)v100 = v13;
                v101 = v39;
                if (v42)
                {
                  __int128 v43 = (unint64_t *)&v42->__shared_owners_;
                  do
                    unint64_t v44 = __ldaxr(v43);
                  while (__stlxr(v44 - 1, v43));
                  if (!v44)
                  {
                    v93 = v42;
                    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
                    std::__shared_weak_count::__release_weak(v93);
                  }

                  uint64_t v13 = *(void *)v100;
                }

                if (v13) {
                  goto LABEL_66;
                }
LABEL_15:
                int v14 = v101;
                if (v101)
                {
                  uint64_t v15 = (unint64_t *)&v101->__shared_owners_;
                  do
                    unint64_t v16 = __ldaxr(v15);
                  while (__stlxr(v16 - 1, v15));
                  if (!v16)
                  {
                    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
                    std::__shared_weak_count::__release_weak(v14);
                  }
                }

                goto LABEL_20;
              }

              uint64_t v13 = *(void *)v100;
            }
          }

LABEL_66:
          *(_DWORD *)(v13 + 300) = v95;
          if (!v28)
          {
            unsigned int v45 = bswap32(*(unsigned __int16 *)((char *)v108 + v25 + 1)) >> 16;
            if (v95) {
              unsigned int v46 = v95 + (__int16)(v45 - v95);
            }
            else {
              unsigned int v46 = v45;
            }
            sub_14678(v13 + 312, v46);
            uint64_t v13 = *(void *)v100;
          }

          __int128 v47 = (unsigned __int8 *)v108 + v24;
          __int128 v48 = (unsigned __int8 *)(v13 + 296);
          do
            unsigned __int8 v49 = __ldaxr(v48);
          while (__stlxr(v49 | 1, v48));
          if ((v49 & 1) == 0)
          {
            uint64_t v50 = *(void *)(*(void *)v100 + 288LL);
            double Current = CFAbsoluteTimeGetCurrent();
            double v52 = Current + 1.0;
            CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v50 + 16), Current + 1.0);
            double NextFireDate = CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v50 + 16));
            double v54 = Current + 1.0001;
            while (NextFireDate > v54)
            {
              CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v50 + 16), v52);
              double NextFireDate = CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v50 + 16));
            }
          }

          if ((_DWORD)v23)
          {
            uint64_t v55 = 0LL;
            v56 = (std::__shared_weak_count *)&v47[v23];
            BOOL v57 = (v20 & 0x20) == 0;
            v94 = v56;
            while (1)
            {
              if (v57)
              {
                v58 = v47;
                int v59 = (char)*v47++;
                uint64_t v60 = v59;
                if ((v59 & 0x80000000) == 0) {
                  goto LABEL_81;
                }
              }

              else
              {
                v58 = v47 + 1;
                int v62 = *v47;
                if ((char)*v47 < 0)
                {
                  int v63 = v62 & 0x7F;
                  while (v58 < (unsigned __int8 *)v56)
                  {
                    char v64 = *v58++;
                    int v62 = v64 & 0x7F | (v63 << 7);
                    int v63 = v62;
                    if ((v64 & 0x80) == 0) {
                      goto LABEL_93;
                    }
                  }

                  int v62 = v63;
                }

LABEL_93:
                LODWORD(v96) = v62 + v96;
                __int128 v47 = v58 + 1;
                uint64_t v60 = *v58;
                if (((char)*v58 & 0x80000000) == 0)
                {
LABEL_81:
                  if (!(_DWORD)v55) {
                    goto LABEL_15;
                  }
                  char v97 = v55;
                  unsigned __int8 v98 = v60;
                  if ((v55 & 0xE0) == 0xC0)
                  {
                    int v61 = 2;
                  }

                  else
                  {
                    __int128 v47 = v58 + 2;
                    unsigned __int8 v65 = v58[1];
LABEL_91:
                    unsigned __int8 v99 = v65;
                    int v61 = 3;
                  }

                  goto LABEL_129;
                }
              }

              if (v60 > 0xEF)
              {
                if (v60 > 0xF7)
                {
                  char v97 = v60;
LABEL_128:
                  int v61 = 1;
LABEL_129:
                  v76 = (Byte *)&v97;
                  goto LABEL_130;
                }

                switch((int)v60)
                {
                  case 240:
                  case 247:
                    v66 = v47;
                    do
                    {
                      int v67 = *v66++;
                      int v68 = (1 << (v67 + 16)) & 0x91;
                    }

                    while ((v67 - 240) > 7 || v68 == 0);
                    int v70 = *(v66 - 1);
                    int v71 = (_DWORD)v66 - 1 - (_DWORD)v58;
                    int v72 = v71 - 1;
                    if (v70 == 247) {
                      v73 = v47;
                    }
                    else {
                      v73 = v58;
                    }
                    if (v70 == 247) {
                      int v74 = (_DWORD)v66 - 1 - (_DWORD)v58;
                    }
                    else {
                      int v74 = (_DWORD)v66 - (_DWORD)v58;
                    }
                    if (v70 == 244)
                    {
                      v73 = v58;
                      int v74 = 1;
                    }

                    if (v70 == 240) {
                      v75 = v47;
                    }
                    else {
                      v75 = v73;
                    }
                    if (v70 != 240)
                    {
                      int v72 = v74;
                      int v71 = (_DWORD)v66 - (_DWORD)v58;
                    }

                    uint64_t v55 = 0LL;
                    if ((_DWORD)v60 == 240) {
                      v76 = v58;
                    }
                    else {
                      v76 = v75;
                    }
                    if ((_DWORD)v60 == 240) {
                      int v61 = v71;
                    }
                    else {
                      int v61 = v72;
                    }
                    __int128 v47 = v66;
                    break;
                  case 241:
                  case 243:
                    char v97 = v60;
                    uint64_t v55 = 0LL;
                    __int128 v47 = v58 + 2;
                    unsigned __int8 v98 = v58[1];
                    int v61 = 2;
                    goto LABEL_129;
                  case 242:
                    char v97 = -14;
                    if (v47 != (unsigned __int8 *)v56)
                    {
                      unsigned __int8 v98 = v58[1];
                      if (v58 + 2 != (unsigned __int8 *)v56)
                      {
                        uint64_t v55 = 0LL;
                        __int128 v47 = v58 + 3;
                        unsigned __int8 v65 = v58[2];
                        goto LABEL_91;
                      }
                    }

LABEL_162:
                    uint64_t v55 = 0LL;
                    int v61 = 2;
                    v76 = (Byte *)&v97;
                    __int128 v47 = (unsigned __int8 *)v56;
                    break;
                  case 246:
                    uint64_t v55 = 0LL;
                    char v97 = -10;
                    goto LABEL_128;
                  default:
                    goto LABEL_15;
                }
              }

              else
              {
                char v97 = v60;
                __int128 v47 = v58 + 2;
                unsigned __int8 v98 = v58[1];
                if ((v60 & 0xE0) == 0xC0)
                {
                  int v61 = 2;
                }

                else
                {
                  __int128 v47 = v58 + 3;
                  unsigned __int8 v99 = v58[2];
                  int v61 = 3;
                }

                v76 = (Byte *)&v97;
                uint64_t v55 = v60;
              }

LABEL_130:
              uint64_t v77 = *(void *)(*(void *)v100 + 256LL);
              if (v77) {
                uint64_t v78 = v77 + (int)v96 - (int)v77;
              }
              else {
                uint64_t v78 = v96;
              }
              uint64_t v79 = *(void *)(*(void *)v100 + 128LL)
                  + a1[50]
                  + (uint64_t)((double)(unint64_t)(v78 + *(void *)(*(void *)v100 + 168LL)) * 2400.0);
              *(void *)(*(void *)v100 + 256LL) = v78;
              sub_3EBC((uint64_t)&v103, v79, v61, v76);
              if (v106)
              {
                char v106 = 0;
                v80 = (void *)a1[204];
                v81 = (void *)a1[205];
                if (v80 == v81)
                {
LABEL_137:
                  v83 = v76;
                  uint64_t v84 = v55;
                  uint64_t v82 = 0LL;
                  v85 = v101;
                  *(void *)v100 = 0LL;
                  v101 = 0LL;
                  if (!v85) {
                    goto LABEL_154;
                  }
                }

                else
                {
                  while (1)
                  {
                    uint64_t v82 = *v80;
                    if (*(_DWORD *)(*v80 + 120LL) == v12) {
                      break;
                    }
                    v80 += 2;
                    if (v80 == v81) {
                      goto LABEL_137;
                    }
                  }

                  v86 = (std::__shared_weak_count *)v80[1];
                  if (v86)
                  {
                    v83 = v76;
                    v87 = (unint64_t *)&v86->__shared_owners_;
                    do
                      unint64_t v88 = __ldxr(v87);
                    while (__stxr(v88 + 1, v87));
                    uint64_t v84 = v55;
                    v85 = v101;
                    *(void *)v100 = v82;
                    v101 = v86;
                    if (!v85) {
                      goto LABEL_154;
                    }
                  }

                  else
                  {
                    v83 = v76;
                    uint64_t v84 = v55;
                    v85 = v101;
                    *(void *)v100 = v82;
                    v101 = 0LL;
                    if (!v85) {
                      goto LABEL_154;
                    }
                  }
                }

                v89 = (unint64_t *)&v85->__shared_owners_;
                do
                  unint64_t v90 = __ldaxr(v89);
                while (__stlxr(v90 - 1, v89));
                if (!v90)
                {
                  ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
                  std::__shared_weak_count::__release_weak(v85);
                }

                uint64_t v82 = *(void *)v100;
LABEL_154:
                uint64_t v55 = v84;
                v76 = v83;
                v56 = v94;
                if (!v82) {
                  goto LABEL_15;
                }
                goto LABEL_155;
              }

              uint64_t v82 = *(void *)v100;
LABEL_155:
              sub_1248C((uint64_t *)(v82 + 312), v95, v79, (char *)v76);
              BOOL v57 = 0;
            }
          }

          goto LABEL_15;
        }

LABEL_14:
        *(void *)v100 = 0LL;
        v101 = 0LL;
        goto LABEL_15;
      }

LABEL_20:
      if (v8) {
        (*(void (**)(void *))(*v5 + 24LL))(a1 + 38);
      }
    }
  }

  char v105 = 0;
  if (*(_DWORD *)&v103.packet[0].data[34]) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)&v103.numPackets + 16LL))( (uint64_t)&v103,  (uint64_t)&v103.packet[0].data[34]);
  }
  *(void *)&v103.packet[0].data[26] = MIDIPacketListInit((MIDIPacketList *)&v103.packet[0].data[34]);
  if (v7) {
    __error();
  }
  return sub_AB80(&v103);
}

void sub_78F4(_Unwind_Exception *a1)
{
}

void sub_7984(uint64_t a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4 <= 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_9F58( exception,  "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/Drivers/RTP/MIDIRT PSession.cpp: 1704");
  }

  unint64_t v5 = a4;
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  *(_OWORD *)__int128 __str = 0u;
  __int128 v110 = 0u;
  memset(v108, 0, sizeof(v108));
  if (*(_DWORD *)a3 == 1262747647)
  {
    if (a4 >= 0x14) {
      sub_9CA0(a1, a3);
    }
    return;
  }

  int v10 = bswap32(*(_DWORD *)a3);
  if (!sub_3238(a5, (char *)v108, 0x100uLL))
  {
    unsigned int v17 = bswap32(*(unsigned __int16 *)(a5 + 2)) >> 16;
    if (*(_BYTE *)(a5 + 1) == 30)
    {
      snprintf(__str, 0x100uLL, "[%s]:%d", (const char *)v108, v17);
      if (v10 > -45238) {
        goto LABEL_23;
      }
    }

    else
    {
      snprintf(__str, 0x100uLL, "%s:%d", (const char *)v108, v17);
      if (v10 > -45238) {
        goto LABEL_23;
      }
    }

LABEL_9:
    if (v10 != -48551)
    {
      if (v10 != -46770)
      {
        if (v10 == -45489 && v5 >= 0x10)
        {
          int v11 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
          unsigned int v12 = *(uint64_t **)(a1 + 1632);
          uint64_t v13 = *(uint64_t **)(a1 + 1640);
          if (v12 == v13)
          {
LABEL_17:
            unint64_t v16 = 0LL;
            uint64_t v99 = 0LL;
            uint64_t v100 = 0LL;
          }

          else
          {
            unsigned int v14 = bswap32(*(_DWORD *)(a3 + 8));
            while (1)
            {
              uint64_t v15 = *v12;
              if (*(_DWORD *)(*v12 + 24) == v14) {
                break;
              }
              v12 += 2;
              if (v12 == v13) {
                goto LABEL_17;
              }
            }

            unint64_t v16 = (std::__shared_weak_count *)v12[1];
            uint64_t v99 = *v12;
            uint64_t v100 = (uint64_t)v16;
            if (v16)
            {
              p_shared_owners = (unint64_t *)&v16->__shared_owners_;
              do
                unint64_t v50 = __ldxr(p_shared_owners);
              while (__stxr(v50 + 1, p_shared_owners));
              sub_9FD4((void *)a1, -46770, v15);
              uint64_t v94 = v15;
              unsigned int v95 = v16;
              do
                unint64_t v51 = __ldxr(p_shared_owners);
              while (__stxr(v51 + 1, p_shared_owners));
            }

            else
            {
              sub_9FD4((void *)a1, -46770, v15);
              uint64_t v94 = v15;
              unsigned int v95 = 0LL;
            }

            sub_6090(a1, &v94, 0, 1);
            sub_6320((uint64_t)&v94);
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
            *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1846;
            __int16 v102 = 2080;
            uint64_t v103 = a1 + 32;
            __int16 v104 = 2080;
            char v105 = __str;
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s: connection attempt to %s rejected\n",  buf,  0x26u);
          }

          CFStringRef v86 = CFStringCreateWithFormat(0LL, 0LL, (CFStringRef)qword_1C0A0, __str);
          *(void *)CFRunLoopTimerContext buf = &off_18AD8;
          *(void *)&buf[8] = v86;
          (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 56LL))(a1, v86);
          *(void *)CFRunLoopTimerContext buf = &off_18A18;
          if (v86) {
            CFRelease(v86);
          }
          if (v16)
          {
            v87 = (unint64_t *)&v16->__shared_owners_;
            do
              unint64_t v88 = __ldaxr(v87);
            while (__stlxr(v88 - 1, v87));
            if (!v88)
            {
              ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
              std::__shared_weak_count::__release_weak(v16);
            }
          }

          if (v11) {
            (*(void (**)(uint64_t))(*(void *)(a1 + 304) + 24LL))(a1 + 304);
          }
        }

        return;
      }

      if (v5 < 0x10) {
        return;
      }
      uint64_t v29 = a1 + 304;
      int v30 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
      __int16 v31 = *(uint64_t **)(a1 + 1632);
      int v32 = *(uint64_t **)(a1 + 1640);
      if (v31 == v32)
      {
LABEL_43:
        uint64_t v99 = 0LL;
        uint64_t v100 = 0LL;
        unsigned __int8 v98 = 0;
        int v97 = 0;
        sub_B4C8(a1, &v98, &v97, (uint64_t *)buf);
        sub_8800((uint64_t)&v99, (__int128 *)buf);
        sub_6320((uint64_t)buf);
        char v35 = 1;
        uint64_t v36 = v99;
        if (!a2)
        {
LABEL_97:
          sub_6C50(v36, (__int128 *)a5);
          goto LABEL_98;
        }
      }

      else
      {
        unsigned int v33 = bswap32(*(_DWORD *)(a3 + 12));
        while (1)
        {
          uint64_t v34 = *v31;
          if (*(_DWORD *)(*v31 + 120) == v33) {
            break;
          }
          v31 += 2;
          if (v31 == v32) {
            goto LABEL_43;
          }
        }

        uint64_t v66 = v31[1];
        uint64_t v99 = v34;
        uint64_t v100 = v66;
        if (v66)
        {
          int v67 = (unint64_t *)(v66 + 8);
          do
            unint64_t v68 = __ldxr(v67);
          while (__stxr(v68 + 1, v67));
        }

        char v35 = 0;
        uint64_t v36 = v99;
        if (!a2) {
          goto LABEL_97;
        }
      }

      sub_6C00(v36, (__int128 *)a5);
      CFStringRef v37 = CFStringCreateWithCString(0LL, __str, 0x8000100u);
      if (!v37)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CFRunLoopTimerContext buf = 136315394;
          *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1755;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d CoreMIDI network peer address name CFStringRef was NULL! This should never happen.",  buf,  0x12u);
        }

        CFStringRef v37 = CFStringCreateWithCString(0LL, "??????", 0x8000100u);
      }

      uint64_t v38 = v99;
      if (*(_BYTE *)(v99 + 56))
      {
        __int128 v39 = *(const void **)(v99 + 48);
        if (v39) {
          CFRelease(v39);
        }
      }

      *(void *)(v38 + 48) = v37;
      *(_BYTE *)(v38 + 57) = 0;
LABEL_98:
      uint64_t v69 = v99;
      *(_DWORD *)(v99 + 120) = bswap32(*(_DWORD *)(a3 + 12));
      CFStringRef v70 = CFStringCreateWithBytes(0LL, (const UInt8 *)(a3 + 16), (int)v5 - 16LL, 0x8000100u, 1u);
      if (*(_BYTE *)(v69 + 40))
      {
        int v71 = *(const void **)(v69 + 32);
        if (v71) {
          CFRelease(v71);
        }
      }

      *(void *)(v69 + 32) = v70;
      *(_BYTE *)(v69 + 41) = 0;
      uint64_t v72 = v99;
      *(_DWORD *)(v99 + 408) = *(_DWORD *)(a1 + 408) - 1;
      unsigned int v73 = bswap32(*(_DWORD *)(a3 + 4));
      if (v73 <= 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CFRunLoopTimerContext buf = 136316162;
          *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1772;
          __int16 v102 = 2080;
          uint64_t v103 = a1 + 32;
          __int16 v104 = 2080;
          char v105 = __str;
          __int16 v106 = 1024;
          unsigned int v107 = v73;
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s: rejected connection from %s: unsupported version %d protocol\n",  buf,  0x2Cu);
        }

        sub_9F80(buf, (CFStringRef)qword_1C0A8, (uint64_t)__str);
        (*(void (**)(uint64_t, void))(*(void *)a1 + 56LL))(a1, *(void *)&buf[8]);
        sub_9C60(buf);
LABEL_107:
        sub_6574(a1, a2, 0xFFFF4E4F, bswap32(*(_DWORD *)(a3 + 8)), v99, 0);
        v96[0] = v99;
        v96[1] = v100;
        if (v100)
        {
          int v74 = (unint64_t *)(v100 + 8);
          do
            unint64_t v75 = __ldxr(v74);
          while (__stxr(v75 + 1, v74));
        }

        sub_6090(a1, v96, 1, 1);
        sub_6320((uint64_t)v96);
        goto LABEL_128;
      }

      if ((v35 & 1) != 0)
      {
        if (!(*(unsigned int (**)(uint64_t, void, void))(*(void *)a1 + 32LL))( a1,  *(void *)(v72 + 32),  *(void *)(v72 + 48)))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
            *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
            *(_WORD *)&_BYTE buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1791;
            __int16 v102 = 2080;
            uint64_t v103 = a1 + 32;
            __int16 v104 = 2080;
            char v105 = __str;
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s: rejected connection from %s\n",  buf,  0x26u);
          }

          goto LABEL_107;
        }

        if (*(void *)(a1 + 1632) == *(void *)(a1 + 1640)) {
          sub_5EE8(a1 + 416);
        }
        sub_6CA0(a1 + 1632, (uint64_t)&v99);
        sub_6574(a1, a2, 0xFFFF4F4B, bswap32(*(_DWORD *)(a3 + 8)), v99, 1);
      }

      else
      {
        sub_6574(a1, a2, 0xFFFF4F4B, bswap32(*(_DWORD *)(a3 + 8)), v72, 1);
      }

      sub_98FC(v99);
LABEL_128:
      v81 = (std::__shared_weak_count *)v100;
      if (v100)
      {
        uint64_t v82 = (unint64_t *)(v100 + 8);
        do
          unint64_t v83 = __ldaxr(v82);
        while (__stlxr(v83 - 1, v82));
        if (!v83)
        {
          ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
          std::__shared_weak_count::__release_weak(v81);
        }
      }

      if (v30) {
        (*(void (**)(uint64_t))(*(void *)v29 + 24LL))(v29);
      }
      return;
    }

    if (v5 >= 0x10)
    {
      int v24 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
      uint64_t v25 = *(uint64_t **)(a1 + 1632);
      unsigned int v26 = *(uint64_t **)(a1 + 1640);
      if (v25 != v26)
      {
        unsigned int v27 = bswap32(*(_DWORD *)(a3 + 12));
        while (1)
        {
          uint64_t v28 = *v25;
          if (*(_DWORD *)(*v25 + 120) == v27) {
            break;
          }
          v25 += 2;
          if (v25 == v26) {
            goto LABEL_164;
          }
        }

        int v59 = (std::__shared_weak_count *)v25[1];
        *(void *)CFRunLoopTimerContext buf = *v25;
        *(void *)&buf[8] = v59;
        if (v59)
        {
          uint64_t v60 = (unint64_t *)&v59->__shared_owners_;
          do
            unint64_t v61 = __ldxr(v60);
          while (__stxr(v61 + 1, v60));
          uint64_t v92 = v28;
          v93 = v59;
          do
            unint64_t v62 = __ldxr(v60);
          while (__stxr(v62 + 1, v60));
        }

        else
        {
          uint64_t v92 = v28;
          v93 = 0LL;
        }

        sub_6090(a1, &v92, 0, 1);
        sub_6320((uint64_t)&v92);
        if (v59)
        {
          v89 = (unint64_t *)&v59->__shared_owners_;
          do
            unint64_t v90 = __ldaxr(v89);
          while (__stlxr(v90 - 1, v89));
          if (!v90)
          {
            ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
            std::__shared_weak_count::__release_weak(v59);
          }
        }
      }

  sub_EBC8(a1);
  if (a4)
  {
    unsigned int v12 = MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
    if (v12) {
      Value = (const __CFString *)v12;
    }
    else {
      Value = @"Unknown";
    }
    if (*(_BYTE *)(a1 + 48))
    {
      unsigned int v14 = *v8;
      if (*v8)
      {
LABEL_23:
        CFRelease(v14);
        uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
        *(void *)(a1 + 40) = Value;
        *(_BYTE *)(a1 + 49) = 0;
        if (!v15) {
          goto LABEL_29;
        }
        goto LABEL_26;
      }

      goto LABEL_25;
    }

    goto LABEL_28;
  }

  if (!*v9 || !CFDictionaryContainsKey(*v9, @"dns-sd-name"))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      unsigned int v14 = *v8;
      Value = &stru_18F88;
      if (*v8) {
        goto LABEL_23;
      }
LABEL_25:
      *(void *)(a1 + 40) = Value;
      *(_BYTE *)(a1 + 49) = 0;
      goto LABEL_26;
    }

    Value = &stru_18F88;
LABEL_28:
    *(void *)(a1 + 40) = Value;
    *(_BYTE *)(a1 + 49) = 0;
    goto LABEL_29;
  }

  if (*v9)
  {
    Value = (const __CFString *)CFDictionaryGetValue(*v9, @"dns-sd-name");
    if (!*(_BYTE *)(a1 + 48)) {
      goto LABEL_28;
    }
  }

  else
  {
    Value = 0LL;
    if (!*(_BYTE *)(a1 + 48)) {
      goto LABEL_28;
    }
  }

  if (!*v8)
  {
    *(void *)(a1 + 40) = Value;
    *(_BYTE *)(a1 + 49) = 0;
    if (!Value) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }

  CFRelease(*v8);
  uint64_t v25 = *(unsigned __int8 *)(a1 + 48);
  *(void *)(a1 + 40) = Value;
  *(_BYTE *)(a1 + 49) = 0;
  if (Value && v25) {
LABEL_26:
  }
    CFRetain(Value);
LABEL_29:
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFDictionarySetValue(*v9, @"peers", Mutable);
  MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(a1 + 56));
  if (*v9)
  {
    unsigned int v17 = (const __CFNumber *)CFDictionaryGetValue(*v9, @"flags");
    uint64_t v18 = v17;
    valuePtr = 0;
    if (v17)
    {
      int v19 = CFGetTypeID(v17);
      if (v19 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
        if ((valuePtr & 1) != 0)
        {
          if (*v9
            && (char v20 = (const __CFNumber *)CFDictionaryGetValue(*v9, @"port"), v21 = v20, valuePtr = 0, v20)
            && (unsigned int v22 = CFGetTypeID(v20), v22 == CFNumberGetTypeID()))
          {
            CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
            uint64_t v23 = valuePtr;
          }

          else
          {
            uint64_t v23 = 0;
          }

          sub_ED3C(a1, v23, 1);
        }
      }
    }
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  return a1;
}

LABEL_164:
      if (v24) {
        (*(void (**)(uint64_t))(*(void *)(a1 + 304) + 24LL))(a1 + 304);
      }
    }

    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CFRunLoopTimerContext buf = 136315650;
    *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1712;
    __int16 v102 = 2048;
    uint64_t v103 = a5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d NetUtils::AddressToName(%p, peerNameAddrWithoutPort, sizeof(peerNameAddrWithoutPort) failed. Cannot hand le control packet.",  buf,  0x1Cu);
  }

  if (v10 <= -45238) {
    goto LABEL_9;
  }
LABEL_23:
  if (v10 == -45237)
  {
    if (v5 < 0x10) {
      return;
    }
    int v40 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
    unint64_t v41 = *(unsigned int ***)(a1 + 1632);
    __int128 v42 = *(unsigned int ***)(a1 + 1640);
    if (v41 != v42)
    {
      unsigned int v43 = bswap32(*(_DWORD *)(a3 + 8));
      while (1)
      {
        unint64_t v44 = *v41;
        if ((*v41)[6] == v43) {
          break;
        }
        v41 += 2;
        if (v41 == v42) {
          goto LABEL_141;
        }
      }

      int v63 = (std::__shared_weak_count *)v41[1];
      *(void *)CFRunLoopTimerContext buf = *v41;
      *(void *)&buf[8] = v63;
      if (v63)
      {
        char v64 = (unint64_t *)&v63->__shared_owners_;
        do
          unint64_t v65 = __ldxr(v64);
        while (__stxr(v65 + 1, v64));
      }

      sub_9FD4((void *)a1, -46770, (uint64_t)v44);
      v44[30] = bswap32(*(_DWORD *)(a3 + 12));
      v44[102] = *(_DWORD *)(a1 + 408) - 1;
      sub_98FC((uint64_t)v44);
      if (a2) {
        sub_6574(a1, 0, 0xFFFF494E, v44[6], (uint64_t)v44, 1);
      }
      else {
        sub_9784((uint64_t)v44);
      }
      if (v63)
      {
        uint64_t v84 = (unint64_t *)&v63->__shared_owners_;
        do
          unint64_t v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
          std::__shared_weak_count::__release_weak(v63);
        }
      }
    }

LABEL_141:
    if (!v40) {
      return;
    }
LABEL_125:
    (*(void (**)(uint64_t))(*(void *)(a1 + 304) + 24LL))(a1 + 304);
    return;
  }

  if (v10 != -44468)
  {
    if (v10 == -44461 && v5 >= 0xA)
    {
      uint64_t v18 = a1 + 304;
      int v19 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
      char v20 = *(void **)(a1 + 1632);
      unsigned int v21 = *(void **)(a1 + 1640);
      if (v20 != v21)
      {
        unsigned int v22 = bswap32(*(_DWORD *)(a3 + 4));
        while (1)
        {
          uint64_t v23 = *v20;
          if (*(_DWORD *)(*v20 + 120LL) == v22) {
            break;
          }
          v20 += 2;
          if (v20 == v21) {
            goto LABEL_80;
          }
        }

        double v52 = (std::__shared_weak_count *)v20[1];
        if (v52)
        {
          v53 = (unint64_t *)&v52->__shared_owners_;
          do
            unint64_t v54 = __ldxr(v53);
          while (__stxr(v54 + 1, v53));
        }

        unsigned int v55 = bswap32(*(unsigned __int16 *)(a3 + 8)) >> 16;
        int v56 = *(_DWORD *)(v23 + 408);
        if (v56) {
          unsigned int v55 = v56 + (__int16)(v55 - v56);
        }
        *(_DWORD *)(v23 + 408) = v55;
        if (v52)
        {
          BOOL v57 = (unint64_t *)&v52->__shared_owners_;
          do
            unint64_t v58 = __ldaxr(v57);
          while (__stlxr(v58 - 1, v57));
          if (!v58)
          {
            ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
            std::__shared_weak_count::__release_weak(v52);
          }
        }
      }

LABEL_80:
      if (v19) {
        (*(void (**)(uint64_t))(*(void *)v18 + 24LL))(v18);
      }
    }

    return;
  }

  if (v5 >= 0xC)
  {
    int v45 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
    unsigned int v46 = *(void **)(a1 + 1632);
    __int128 v47 = *(void **)(a1 + 1640);
    if (v46 != v47)
    {
      unsigned int v48 = bswap32(*(_DWORD *)(a3 + 4));
      while (*(_DWORD *)(*v46 + 120LL) != v48)
      {
        v46 += 2;
        if (v46 == v47) {
          goto LABEL_124;
        }
      }

      v76 = (std::__shared_weak_count *)v46[1];
      *(void *)CFRunLoopTimerContext buf = *v46;
      *(void *)&buf[8] = v76;
      if (v76)
      {
        uint64_t v77 = (unint64_t *)&v76->__shared_owners_;
        do
          unint64_t v78 = __ldxr(v77);
        while (__stxr(v78 + 1, v77));
      }

      (*(void (**)(uint64_t, void))(*(void *)a1 + 64LL))(a1, bswap32(*(_DWORD *)(a3 + 8)));
      if (v76)
      {
        uint64_t v79 = (unint64_t *)&v76->__shared_owners_;
        do
          unint64_t v80 = __ldaxr(v79);
        while (__stlxr(v80 - 1, v79));
        if (!v80)
        {
          ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
          std::__shared_weak_count::__release_weak(v76);
        }
      }
    }

      uint64_t result = sub_147A0((uint64_t *)v7[1], v37);
      ++v7[2];
      return result;
    }
  }

  else
  {
    int v30 = 0;
    uint64_t v29 = a4[2];
    __int16 v31 = v13 | 0x400;
    int v32 = v12;
    if (!v11) {
      goto LABEL_34;
    }
  }

  unsigned int v33 = bswap32(v31);
  while (1)
  {
    while (1)
    {
      int v32 = (uint64_t *)v11;
      uint64_t v34 = bswap32(*(_DWORD *)(v11 + 28));
      if (v33 >= v34) {
        break;
      }
      int v11 = *v32;
      unsigned int v12 = v32;
      if (!*v32) {
        goto LABEL_34;
      }
    }

    if (v34 >= v33) {
      return result;
    }
    int v11 = v32[1];
    if (!v11)
    {
      unsigned int v12 = v32 + 1;
      goto LABEL_34;
    }
  }

LABEL_124:
    if (v45) {
      goto LABEL_125;
    }
  }

void sub_86A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  sub_6320((uint64_t)va);
  sub_6320((uint64_t)va1);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24LL))(v3);
  }
  _Unwind_Resume(a1);
}

void sub_87EC(_Unwind_Exception *a1)
{
}

uint64_t sub_8800(uint64_t result, __int128 *a2)
{
  uint64_t v2 = result;
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  int v4 = *(std::__shared_weak_count **)(result + 8);
  *(_OWORD *)uint64_t result = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      return v2;
    }
  }

  return result;
}

uint64_t sub_8878(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 1075) = 1;
  if (*(_BYTE *)(a1 + 1074)) {
    sub_4998(*(void *)(a1 + 1080) + 304LL);
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 1080) + 16LL))(*(void *)(a1 + 1080), a2);
  if (*(_BYTE *)(a1 + 1074)) {
    return sub_48D8(*(void *)(a1 + 1080) + 304LL);
  }
  return result;
}

MIDIPacket *sub_88E4(uint64_t a1, int *a2, char a3)
{
  uint64_t v6 = a1 + 304;
  uint64_t result = (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16LL))(a1 + 304);
  int v8 = (int)result;
  if (!*(_BYTE *)(a1 + 8)) {
    goto LABEL_8;
  }
  if ((a3 & 2) != 0) {
    *(_BYTE *)(a1 + 1625) = 1;
  }
  uint64_t result = sub_3FC0((MIDIPacket *)(a1 + 544), a2);
  if (!*(_DWORD *)(a1 + 592))
  {
LABEL_8:
    if (!v8) {
      return result;
    }
    return (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 24LL))(v6);
  }

  if ((a3 & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 1624))
    {
      *(_BYTE *)(a1 + 1624) = 1;
      mach_absolute_time();
      uint64_t result = (MIDIPacket *)MIDITimerTaskSetNextWakeTime(**(void **)(a1 + 528));
    }

    goto LABEL_8;
  }

  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 544) + 16LL))(a1 + 544, a1 + 592);
  uint64_t result = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
  *(void *)(a1 + 584) = result;
  if (!v8) {
    return result;
  }
  return (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 24LL))(v6);
}

void sub_89DC(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_8A08(uint64_t a1, uint64_t a2)
{
  unint64_t v10 = a2 + 4;
  unsigned int v9 = 0;
  int v8 = (char *)(a2 + 14);
  __int16 v7 = 0;
  do
    uint64_t result = sub_8AFC(a1, (unsigned int *)a2, &v9, &v10, &v8, (_BYTE *)&v7 + 1, &v7);
  while (!(_DWORD)result);
  if (*(_DWORD *)a2)
  {
    double v5 = dbl_16050[(_BYTE)v7 == 0];
  }

  else
  {
    if (!HIBYTE(v7)) {
      return result;
    }
    double v5 = fmin(*(double *)(a1 + 520) + *(double *)(a1 + 520), 1.0);
  }

  uint64_t result = mach_absolute_time();
  unint64_t v6 = result + (uint64_t)(v5 * 24000000.0);
  *(double *)(a1 + 520) = v5;
  if (v6 < *(void *)(a1 + 512))
  {
    *(void *)(a1 + 512) = v6;
    return MIDITimerTaskSetNextWakeTime(**(void **)(a1 + 504));
  }

  return result;
}

uint64_t sub_8AFC( uint64_t a1, unsigned int *a2, unsigned int *a3, unint64_t *a4, char **a5, _BYTE *a6, _BYTE *a7)
{
  uint64_t v7 = *(void *)(a1 + 1632);
  uint64_t v8 = *(void *)(a1 + 1640);
  if (v7 != v8)
  {
    char v15 = 0;
    unsigned int v16 = *(_DWORD *)(a1 + 408);
    unsigned int v17 = v16;
    do
    {
      if (*(_DWORD *)(*(void *)v7 + 28LL) == 2)
      {
        unsigned int v18 = *(_DWORD *)(*(void *)v7 + 408LL);
        if (v18 < v17 && v18 != 0) {
          unsigned int v17 = v18 + 1;
        }
        char v15 = 1;
      }

      v7 += 16LL;
    }

    while (v7 != v8);
    if ((v15 & 1) != 0)
    {
      unint64_t v20 = *a4;
      unsigned int v21 = *a5;
      if (!*a2 || (uint64_t v22 = *(void *)v20) == 0)
      {
        uint64_t v22 = mach_absolute_time();
        unsigned int v16 = *(_DWORD *)(a1 + 408);
      }

      v76 = a6;
      unint64_t v23 = (unint64_t)((double)(uint64_t)(v22 - *(void *)(a1 + 400)) * 0.000416666667 + 0.5);
      v89[0] = 24960;
      v89[1] = bswap32(v16) >> 16;
      unsigned int v24 = bswap32(*(_DWORD *)(a1 + 392));
      unsigned int v90 = bswap32(v23);
      unsigned int v91 = v24;
      int v25 = sub_12AD4(a1 + 416, v17, v16, v88, 1400);
      int v26 = v25;
      int v77 = v25;
      if (*a3 < *a2)
      {
        int v71 = a2;
        uint64_t v72 = a3;
        unsigned int v73 = a4;
        int v74 = a5;
        char v78 = 0;
        unsigned int v27 = 0;
        if (v25 <= 3) {
          int v28 = 1472;
        }
        else {
          int v28 = 1472 - v25;
        }
        uint64_t v79 = (char *)v89 + v28;
        char v29 = 1;
        int v30 = v93;
LABEL_20:
        uint64_t v31 = *(unsigned __int16 *)(v20 + 8);
        uint64_t v32 = *(void *)v20;
        if (!*(void *)v20) {
          uint64_t v32 = mach_absolute_time();
        }
        unint64_t v33 = v20 + v31 + 10;
        unint64_t v34 = (unint64_t)((double)(uint64_t)(v32 - *(void *)(a1 + 400)) * 0.000416666667 + 0.5);
        while (1)
        {
          unsigned int v35 = *v21;
          if ((v29 & 1) == 0)
          {
            unsigned int v36 = v34 - v23;
            unsigned int v37 = (v34 - v23) & 0x7F;
            if ((v34 - v23) >= 0x80)
            {
              do
              {
                int v38 = (v37 << 8) | (v36 >> 7) & 0x7F;
                unsigned int v39 = v36 >> 14;
                v36 >>= 7;
                unsigned int v37 = v38 | 0x80;
              }

              while (v39);
            }

            do
            {
              char v40 = v37;
              *v30++ = v37;
              v37 >>= 8;
            }

            while (v40 < 0);
            LODWORD(v23) = v34;
          }

          sub_1248C((uint64_t *)(a1 + 416), *(_DWORD *)(a1 + 408), *(void *)v20, v21);
          unint64_t v41 = sub_2638(v21, v33);
          if (v27)
          {
            if (v35 == v27) {
              break;
            }
          }

          if ((v35 & 0x80) != 0)
          {
            if (v35 > 0xEF)
            {
              if (v35 > 0xF7)
              {
                char v42 = 0;
                char v78 = 1;
              }

              else if (v35 == 247 || v35 == 240)
              {
                unsigned int v27 = 0;
                if (v35 == 247) {
                  char v58 = -12;
                }
                else {
                  char v58 = 0;
                }
                else {
                  char v42 = -16;
                }
              }

              else
              {
                char v42 = 0;
                unsigned int v27 = 0;
              }
            }

            else
            {
              char v42 = 0;
              v78 |= v35 < 0xA0;
              unsigned int v27 = v35;
            }

LABEL_32:
            if (v42) {
              int v43 = (_DWORD)v41 + 1;
            }
            else {
              int v43 = (int)v41;
            }
            int v44 = v43 - (_DWORD)v21;
            int v45 = (_DWORD)v79 - (_DWORD)v30;
            if ((int)v79 - (int)v30 < v44)
            {
              int v63 = v45 - 2;
              if (v45 - 2 >= v44) {
                int v63 = v44;
              }
              int v26 = v77;
              char v64 = v74;
              if (v63 > 31) {
                goto LABEL_87;
              }
              goto LABEL_89;
            }

            if (v21 >= v41) {
              goto LABEL_52;
            }
            goto LABEL_37;
          }

          int v53 = *(v41 - 1);
          if (v53 == 247) {
            int v54 = (int)v41;
          }
          else {
            int v54 = (_DWORD)v41 + 1;
          }
          int v55 = v54 - (_DWORD)v21 + 1;
          int v56 = (_DWORD)v79 - (_DWORD)v30;
          if ((int)v79 - (int)v30 < v55)
          {
            int v63 = v56 - 2;
            if (v56 - 2 >= v55) {
              int v63 = v55;
            }
            if (v63 >= 32)
            {
              *v30++ = -9;
              int v26 = v77;
              char v64 = v74;
LABEL_87:
              uint64_t v65 = v63;
              memcpy(v30, v21, v63);
              uint64_t v66 = &v30[v65];
              char *v66 = -16;
              int v30 = v66 + 1;
              v21 += v65;
              goto LABEL_89;
            }

            int v26 = v77;
            char v64 = v74;
LABEL_89:
            uint64_t v60 = 0LL;
            unint64_t *v73 = v20;
            *char v64 = v21;
            int v61 = (_DWORD)v30 - v93;
            if (v61 <= 15) {
              goto LABEL_77;
            }
LABEL_90:
            int v62 = v61 + 14;
            __int16 v92 = bswap32(v61 | 0x8000) >> 16;
            LOBYTE(v61) = v92;
            if (v26 >= 4) {
              goto LABEL_91;
            }
            goto LABEL_92;
          }

          unsigned int v27 = 0;
          if (v53 == 247) {
            char v42 = 0;
          }
          else {
            char v42 = -16;
          }
          *v30++ = -9;
          if (v21 >= v41)
          {
LABEL_52:
            if (!v42) {
              goto LABEL_23;
            }
LABEL_58:
            *v30++ = v42;
            goto LABEL_23;
          }

LABEL_37:
          int64_t v46 = v41 - v21;
          if ((unint64_t)(v41 - v21) < 0x20 || (unint64_t)(v30 - v21) < 0x20)
          {
            __int128 v47 = v21;
            unsigned int v48 = v30;
          }

          else
          {
            __int128 v47 = &v21[v46 & 0xFFFFFFFFFFFFFFE0LL];
            unsigned int v48 = &v30[v46 & 0xFFFFFFFFFFFFFFE0LL];
            unsigned __int8 v49 = v30 + 16;
            unint64_t v50 = (__int128 *)(v21 + 16);
            unint64_t v51 = v46 & 0xFFFFFFFFFFFFFFE0LL;
            do
            {
              __int128 v52 = *v50;
              *(v49 - 1) = *(v50 - 1);
              *unsigned __int8 v49 = v52;
              v49 += 2;
              v50 += 2;
              v51 -= 32LL;
            }

            while (v51);
            if (v46 == (v46 & 0xFFFFFFFFFFFFFFE0LL))
            {
              v30 += v46 & 0xFFFFFFFFFFFFFFE0LL;
              goto LABEL_57;
            }
          }

          int v30 = v48;
          do
          {
            char v57 = *v47++;
            *v30++ = v57;
          }

          while (v47 != v41);
LABEL_57:
          unsigned int v21 = v41;
          if (v42) {
            goto LABEL_58;
          }
LABEL_23:
          char v29 = 0;
          if ((unint64_t)v21 >= v33)
          {
            char v29 = 0;
            unint64_t v20 = (v20 + *(unsigned __int16 *)(v20 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            unsigned int v21 = (char *)(v20 + 10);
            unsigned int v59 = *v72 + 1;
            *uint64_t v72 = v59;
            uint64_t v60 = 1LL;
            int v26 = v77;
            if (v59 < *v71) {
              goto LABEL_20;
            }
            goto LABEL_76;
          }
        }

        char v42 = 0;
        ++v21;
        goto LABEL_32;
      }

      char v78 = 0;
      uint64_t v60 = 1LL;
      int v30 = v93;
LABEL_76:
      int v61 = (_DWORD)v30 - v93;
      if (v61 > 15) {
        goto LABEL_90;
      }
LABEL_77:
      memmove((char *)&v92 + 1, v93, v61);
      LOBYTE(v92) = v61;
      int v62 = v61 + 13;
      --v30;
      if (v26 >= 4)
      {
LABEL_91:
        LOBYTE(v92) = v61 | 0x40;
        memcpy(v30, v88, v26);
        v62 += v26;
      }

LABEL_92:
      if (v62 >= 14)
      {
        if (*(_BYTE *)(a1 + 1625))
        {
          *(_BYTE *)(a1 + 1625) = 0;
        }

        else
        {
          uint64_t v68 = *(void *)(a1 + 1632);
          for (uint64_t i = *(void *)(a1 + 1640); v68 != i; v68 += 16LL)
          {
            if (*(_DWORD *)(*(void *)v68 + 28LL) == 2
              && (sendto( *(_DWORD *)(a1 + 216 + 40LL * (*(_BYTE *)(*(void *)v68 + 93LL) == 30)),  v89,  v62,  0,  (const sockaddr *)(*(void *)v68 + 92LL),  *(unsigned __int8 *)(*(void *)v68 + 92LL)) & 0x80000000) != 0)
            {
              int v70 = *__error();
              if (v70 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
                v81 = "MIDIRTPSession.cpp";
                __int16 v82 = 1024;
                int v83 = 1398;
                __int16 v84 = 2080;
                uint64_t v85 = a1 + 32;
                __int16 v86 = 1024;
                int v87 = v70;
                _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d %s: couldn't send (%d)\n",  buf,  0x22u);
              }
            }
          }
        }
      }

      ++*(_DWORD *)(a1 + 408);
      if ((v78 & 1) != 0)
      {
        *a7 = 1;
        if (v77 < 4) {
          return v60;
        }
      }

      else if (v77 < 4)
      {
        return v60;
      }

      _BYTE *v76 = 1;
      return v60;
    }
  }

  return 1LL;
}

ssize_t sub_91E4(void *a1, int a2, int a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v10 = 92LL;
  if (a2) {
    uint64_t v10 = 64LL;
  }
  uint64_t v11 = (_OWORD *)(a4 + v10);
  *(_OWORD *)unint64_t v23 = *(_OWORD *)(a4 + v10);
  *(_OWORD *)&v23[12] = *(_OWORD *)(a4 + v10 + 12);
  if (a3 != -48309)
  {
    if (a3 == -46770)
    {
      uint64_t v13 = malloc(a6);
      memcpy(v13, a5, a6);
      *(_OWORD *)unsigned int v24 = *v11;
      *(_OWORD *)&v24[12] = *(_OWORD *)((char *)v11 + 12);
      double Current = CFAbsoluteTimeGetCurrent();
      int v15 = (*(uint64_t (**)(void *))(a1[38] + 16LL))(a1 + 38);
      unsigned int v16 = (char *)operator new(0x58uLL);
      v16[16] = a2;
      *((_DWORD *)v16 + 5) = -46770;
      *((void *)v16 + 3) = a4;
      *((void *)v16 + 4) = v13;
      *((_DWORD *)v16 + 10) = a6;
      *(_OWORD *)(v16 + 44) = *(_OWORD *)v24;
      *(_OWORD *)(v16 + 56) = *(_OWORD *)&v24[12];
      *((_DWORD *)v16 + 18) = 1;
      *((double *)v16 + 10) = Current + 1.0;
      uint64_t v17 = a1[208];
      *(void *)unsigned int v16 = v17;
      *((void *)v16 + 1) = a1 + 208;
      *(void *)(v17 + 8) = v16;
      a1[208] = v16;
      ++a1[210];
      uint64_t v18 = a1[207];
      uint64_t v19 = a1[209];
      for (i = 1.0e40; (void *)v19 != a1 + 208; uint64_t v19 = *(void *)(v19 + 8))
        double i = fmin(*(double *)(v19 + 80), i);
      do
        CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v18 + 16), i);
      while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v18 + 16)) > i + 0.0001);
      if (v15) {
        (*(void (**)(void *))(a1[38] + 24LL))(a1 + 38);
      }
    }

    sub_3238((uint64_t)v23, v24, 0x100uLL);
  }

  unsigned int v21 = &a1[5 * (v23[1] == 30)];
  if (a2) {
    ssize_t result = sendto(*((_DWORD *)v21 + 34), a5, a6, 0, (const sockaddr *)v23, v23[0]);
  }
  else {
    ssize_t result = sendto(*((_DWORD *)v21 + 54), a5, a6, 0, (const sockaddr *)v23, v23[0]);
  }
  if ((result & 0x80000000) != 0) {
    return (ssize_t)__error();
  }
  return result;
}

void sub_9438(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_27D4(exception_object);
}

void sub_9478(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3 = bswap64(*(void *)(a3 + 12));
  unint64_t v4 = bswap64(*(void *)(a3 + 20));
  unint64_t v5 = bswap64(*(void *)(a3 + 28));
  unint64_t v6 = v3 + ((v5 - v3) >> 1);
  uint64_t v7 = v6 - v4;
  if (!a2) {
    uint64_t v7 = v4 - v6;
  }
  int v8 = *(_DWORD *)(a1 + 144);
  int v9 = v8 + 1;
  *(_DWORD *)(a1 + 144) = v8 + 1;
  if (v8 != -1)
  {
    char v11 = a2;
    double v13 = (double)v7;
    if (!a2) {
      unint64_t v6 = v4;
    }
    double v14 = *(double *)(a1 + 152);
    double v15 = *(double *)(a1 + 160);
    if (v8 < 5)
    {
      if (v8) {
        double v26 = 0.7;
      }
      else {
        double v26 = 0.0;
      }
      if (v8) {
        double v27 = 0.9;
      }
      else {
        double v27 = 0.0;
      }
      if (v8) {
        double v28 = 0.1;
      }
      else {
        double v28 = 0.0;
      }
      if (v8)
      {
        int v29 = 0;
      }

      else
      {
        double v15 = (double)v7;
        int v29 = -1;
      }

      if (!v8) {
        double v14 = 0.0;
      }
      double v25 = -1.0;
    }

    else
    {
      else {
        uint64_t v16 = v9;
      }
      uint64_t v17 = (double *)(a1 + 176);
      double v18 = 0.0;
      uint64_t v19 = v16;
      unint64_t v20 = (double *)(a1 + 176);
      do
      {
        double v21 = *v20++;
        double v18 = v21 + v18;
        --v19;
      }

      while (v19);
      double v22 = v18 * 0.1;
      double v23 = 0.0;
      do
      {
        double v24 = *v17++;
        double v23 = v23 + (v24 - v22) * (v24 - v22);
        --v16;
      }

      while (v16);
      double v25 = sqrt(v23 * 0.1);
      if (v25 <= 30.0)
      {
        int v29 = 1;
        double v28 = 0.8;
        double v27 = 0.97;
        double v26 = 0.9;
      }

      else
      {
        double v26 = dbl_16060[v25 > 300.0];
        double v27 = 0.9;
        if (v25 <= 300.0) {
          double v27 = 0.95;
        }
        double v28 = 0.15;
        if (v25 <= 300.0)
        {
          int v29 = 2;
        }

        else
        {
          double v28 = 0.04;
          int v29 = 3;
        }
      }

      if (v8 < 12) {
        double v27 = 0.5;
      }
      double v31 = fmax(v25 * 3.0, 100.0);
      if (v13 - v15 < v14 - v31)
      {
        double v30 = v14 - v31 + v15;
        goto LABEL_44;
      }

      double v32 = v31 + v14;
      if (v13 - v15 > v32)
      {
        double v30 = v32 + v15;
LABEL_44:
        double v33 = v30 + v28 * v14 + (v15 - v30) * v26;
        double v34 = v30 - v33 + (v14 - (v30 - v33)) * v27;
        *(void *)(a1 + 168) = (uint64_t)v33;
        *(double *)(a1 + 8LL * (v9 % 10) + 176) = v30 - v33;
        *(double *)(a1 + 152) = v34;
        *(double *)(a1 + 160) = v33;
        if (!a2) {
          unint64_t v4 = v5;
        }
        *(void *)(a1 + 256) = v4;
        unsigned int v35 = *(FILE **)(a1 + 280);
        if (v35)
        {
          fprintf(v35, "%d\t%.f\t%.f\t%.f\t%.1f\t%.1f\t%.1f\t%d", v9, (double)v6, v13, v33, v34, v30 - v33, v25, v29);
          fflush(*(FILE **)(a1 + 280));
          int v9 = *(_DWORD *)(a1 + 144);
        }

        if (v9 <= 4 && *(_BYTE *)(a3 + 8) == 2 && (v11 & 1) == 0)
        {
          sub_9784(a1);
          return;
        }

        sub_9854(a1);
        int v36 = *(_DWORD *)(a1 + 28);
        if (v36 != 1)
        {
          if (v36 || !*(_WORD *)(a1 + 66) || !*(_WORD *)(a1 + 94)) {
            return;
          }
          *(_DWORD *)(a1 + 28) = 1;
        }

        return;
      }
    }

    double v30 = (double)v7;
    goto LABEL_44;
  }

void sub_9784(uint64_t a1)
{
  __int128 v6 = 0uLL;
  int v8 = 0;
  uint64_t v7 = 0LL;
  uint64_t v2 = *(void *)(a1 + 16);
  unsigned int v3 = bswap32(*(_DWORD *)(v2 + 392));
  v5[0] = 1262747647;
  v5[1] = v3;
  *(void *)((char *)&v6 + 4) = bswap64((unint64_t)((double)(uint64_t)(mach_absolute_time()
                                                                            - *(void *)(v2 + 400))
                                                          * 0.000416666667
                                                          + 0.5));
  *(CFAbsoluteTime *)(a1 + 272) = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = *(void *)(a1 + 16);
  v9[0] = *(sockaddr *)(a1 + 92);
  *(sockaddr *)&v9[0].sa_data[10] = *(sockaddr *)(a1 + 104);
  if ((sendto(*(_DWORD *)(v4 + 40LL * (v9[0].sa_family == 30) + 216), v5, 0x24uLL, 0, v9, v9[0].sa_len) & 0x80000000) != 0) {
    __error();
  }
  sub_9854(a1);
}

void sub_9854(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  if (*(_DWORD *)(a1 + 24))
  {
    else {
      double v3 = 1.5;
    }
    double Current = *(double *)(a1 + 272);
  }

  else
  {
    double v3 = 60.0;
    double Current = CFAbsoluteTimeGetCurrent();
  }

  double v5 = fmax(*(double *)(a1 + 264), Current) + v3;
  CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16), v5);
  while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16)) > v5 + 0.0001)
    CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16), v5);
}

uint64_t sub_98FC(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 28);
  if (v1 == 1) {
    goto LABEL_6;
  }
  if (!v1 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
  }

  return result;
}

void sub_993C(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 264);
  if (Current > v3 + 59.0)
  {
    uint64_t v4 = *(void *)(a1 + 16) + 304LL;
    int v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
    CFStringGetCString(*(CFStringRef *)(a1 + 48), buffer, 64LL, 0x8000100u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 16) + 32LL;
      *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
      *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1626;
      __int16 v18 = 2080;
      uint64_t v19 = v6;
      __int16 v20 = 2080;
      double v21 = buffer;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s: connection to %s timed out\n",  buf,  0x26u);
    }

    CFStringRef v7 = CFStringCreateWithFormat(0LL, 0LL, (CFStringRef)qword_1C0B0, *(void *)(a1 + 48));
    *(void *)CFRunLoopTimerContext buf = &off_18AD8;
    *(void *)&buf[8] = v7;
    (*(void (**)(void))(**(void **)(a1 + 16) + 56LL))(*(void *)(a1 + 16));
    int v8 = *(std::__shared_weak_count **)(a1 + 8);
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v15 = *(void *)a1;
    if (v8)
    {
      uint64_t v10 = std::__shared_weak_count::lock(v8);
      uint64_t v16 = v10;
      if (v10)
      {
        char v11 = v10;
        sub_6090(v9, &v15, 1, 1);
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (v13)
        {
          *(void *)CFRunLoopTimerContext buf = &off_18A18;
          double v14 = *(const void **)&buf[8];
          if (!*(void *)&buf[8])
          {
LABEL_17:
            if (v5) {
              (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
            }
            return;
          }
        }

        else
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
          *(void *)CFRunLoopTimerContext buf = &off_18A18;
          double v14 = *(const void **)&buf[8];
          if (!*(void *)&buf[8]) {
            goto LABEL_17;
          }
        }

        CFRelease(v14);
        goto LABEL_17;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    sub_B494();
  }

  else {
    sub_9854(a1);
  }
}

void sub_9C00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_27D4(exception_object);
}

void *sub_9C60(void *a1)
{
  *a1 = &off_18A18;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_9CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 1632);
  double v3 = *(uint64_t **)(a1 + 1640);
  if (v2 != v3)
  {
    unsigned int v6 = bswap32(*(_DWORD *)(a2 + 4));
    while (1)
    {
      uint64_t v7 = *v2;
      if (*(_DWORD *)(*v2 + 120) == v6) {
        break;
      }
      v2 += 2;
      if (v2 == v3) {
        return;
      }
    }

    int v8 = (std::__shared_weak_count *)v2[1];
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }

    unsigned int v11 = *(char *)(a2 + 8);
    *(CFAbsoluteTime *)(v7 + 264) = CFAbsoluteTimeGetCurrent();
    if (v11 >= 2)
    {
      if (v11 == 2) {
        sub_9478(v7, 0, a2);
      }
    }

    else
    {
      *(_BYTE *)(a2 + 8) = v11 + 1;
      *(_DWORD *)(a2 + 4) = bswap32(*(_DWORD *)(a1 + 392));
      *(void *)(a2 + 8LL * v11 + 20) = bswap64((unint64_t)((double)(uint64_t)(mach_absolute_time()
                                                                                    - *(void *)(a1 + 400))
                                                                  * 0.000416666667
                                                                  + 0.5));
      if (v11 == 1) {
        sub_9478(v7, 1, a2);
      }
      v14[0] = *(sockaddr *)(v7 + 92);
      *(sockaddr *)&v14[0].sa_data[10] = *(sockaddr *)(v7 + 104);
      if ((sendto( *(_DWORD *)(a1 + 40LL * (v14[0].sa_family == 30) + 216),  (const void *)a2,  0x24uLL,  0,  v14,  v14[0].sa_len) & 0x80000000) != 0) {
        __error();
      }
    }

    if (v8)
    {
      uint64_t v12 = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }

void sub_9E48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

ssize_t sub_9E5C(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 40LL * (a2 == 30);
  socklen_t v6 = 28;
  ssize_t result = recvfrom(*(_DWORD *)(v3 + 136), v7, 0x5C1uLL, 0, &v5, &v6);
  if ((int)result >= 1)
  {
    do
    {
      socklen_t v6 = 28;
      ssize_t result = recvfrom(*(_DWORD *)(v3 + 136), v7, 0x5C1uLL, 0, &v5, &v6);
    }

    while ((int)result > 0);
  }

  return result;
}

std::runtime_error *sub_9F58(std::runtime_error *a1, const char *a2)
{
  ssize_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&off_18A38;
  return result;
}

void *sub_9F80(void *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(0LL, 0LL, format, a3);
  *a1 = &off_18AD8;
  a1[1] = v4;
  return a1;
}

void sub_9FD4(void *a1, int a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1[209];
  if (v3 != a1 + 208)
  {
    while (*((_DWORD *)v3 + 5) != a2 || v3[3] != a3)
    {
      uint64_t v3 = (void *)v3[1];
      if (v3 == a1 + 208) {
        return;
      }
    }

    free((void *)v3[4]);
    uint64_t v5 = *v3;
    *(void *)(v5 + 8) = v3[1];
    *(void *)v3[1] = v5;
    --a1[210];
    operator delete(v3);
  }

BOOL sub_A05C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 4);
  if (v2 != -46770) {
    return v2 == -46770;
  }
  sub_3238(a2 + 28, v21, 0x100uLL);
  snprintf(__str, 0x100uLL, "%s:%d", v21, bswap32(*(unsigned __int16 *)(a2 + 30)) >> 16);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
    *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1926;
    __int16 v17 = 2080;
    uint64_t v18 = a1 + 32;
    __int16 v19 = 2080;
    __int16 v20 = __str;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s: Connection attempt to %s timed out\n",  buf,  0x26u);
  }

  CFStringRef v5 = CFStringCreateWithFormat(0LL, 0LL, (CFStringRef)qword_1C098, __str);
  *(void *)CFRunLoopTimerContext buf = &off_18AD8;
  *(void *)&buf[8] = v5;
  (*(void (**)(uint64_t))(*(void *)a1 + 56LL))(a1);
  socklen_t v6 = *(uint64_t **)(a2 + 8);
  uint64_t v7 = (std::__shared_weak_count *)v6[1];
  uint64_t v14 = *v6;
  if (!v7)
  {
    uint64_t v15 = 0LL;
LABEL_15:
    sub_B494();
  }

  int v8 = std::__shared_weak_count::lock(v7);
  uint64_t v15 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  sub_6090(a1, &v14, 1, 1);
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    unint64_t v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (v11)
  {
    *(void *)CFRunLoopTimerContext buf = &off_18A18;
    uint64_t v12 = *(const void **)&buf[8];
    if (!*(void *)&buf[8]) {
      return v2 == -46770;
    }
    goto LABEL_12;
  }

  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  *(void *)CFRunLoopTimerContext buf = &off_18A18;
  uint64_t v12 = *(const void **)&buf[8];
  if (*(void *)&buf[8]) {
LABEL_12:
  }
    CFRelease(v12);
  return v2 == -46770;
}

void sub_A278( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (a2) {
    sub_27D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_A2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

void sub_A2C8(void *a1)
{
  int v2 = a1 + 38;
  int v3 = (*(uint64_t (**)(void *))(a1[38] + 16LL))(a1 + 38);
  CFStringRef v4 = (char *)(a1 + 208);
  while (1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    socklen_t v6 = (char *)a1[209];
    if (v6 == v4) {
      break;
    }
    while (*((double *)v6 + 10) >= Current)
    {
LABEL_4:
      socklen_t v6 = (char *)*((void *)v6 + 1);
      if (v6 == v4)
      {
        uint64_t v15 = a1[209];
        uint64_t v16 = a1[207];
        goto LABEL_16;
      }
    }

    int v7 = *((_DWORD *)v6 + 18);
    *((_DWORD *)v6 + 18) = v7 + 1;
    if (v7 != 12)
    {
      CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = (const sockaddr *)(v6 + 44);
      socklen_t v10 = v6[44];
      *((CFAbsoluteTime *)v6 + 10) = v8 + 1.0;
      unint64_t v11 = (const void *)*((void *)v6 + 4);
      size_t v12 = *((int *)v6 + 10);
      if (v6[16]) {
        int v13 = sendto(a1[5 * (v6[45] == 30) + 17], v11, v12, 0, v9, v10);
      }
      else {
        int v13 = sendto(a1[5 * (v6[45] == 30) + 27], v11, v12, 0, v9, v10);
      }
      if (v13 < 0) {
        __error();
      }
      goto LABEL_4;
    }

    if (!sub_A05C((uint64_t)a1, (uint64_t)(v6 + 16)))
    {
      free(*((void **)v6 + 4));
      uint64_t v14 = *(void *)v6;
      *(void *)(v14 + 8) = *((void *)v6 + 1);
      **((void **)v6 + 1) = v14;
      --a1[210];
      operator delete(v6);
    }
  }

  uint64_t v16 = a1[207];
  double i = 1.0e40;
  do
LABEL_16:
    CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v16 + 16), i);
  while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v16 + 16)) > i + 0.0001);
  if (v3) {
    (*(void (**)(void *))(*v2 + 24LL))(v2);
  }
}

void sub_A4A4(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_A4DC(MIDIPacketList *a1)
{
  uint64_t v1 = sub_AB80(a1);
  operator delete(v1);
}

void sub_A4F0(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  operator delete(a1);
}

ssize_t sub_A528(uint64_t a1)
{
  return sub_9E5C(*(void *)(a1 + 32), *(_DWORD *)(a1 + 28));
}

void *sub_A538(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  return a1;
}

void sub_A570(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  operator delete(a1);
}

void sub_A5AC(void *a1)
{
  *a1 = off_188E0;
  sub_11520((uint64_t)a1);
  operator delete(a1);
}

MIDIPacketList *sub_A5E4(uint64_t a1)
{
  return sub_6F5C(*(void **)(a1 + 32), *(_DWORD *)(a1 + 28));
}

void sub_A5F4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_26F8(a1);
  operator delete(v1);
}

uint64_t sub_A608(uint64_t a1)
{
  return sub_6458(*(void *)(a1 + 16));
}

void sub_A610(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_A610(a1, *a2);
    sub_A610(a1, a2[1]);
    operator delete(a2);
  }

void sub_A650(MIDIPacketList *a1)
{
  uint64_t v1 = sub_A7D8(a1);
  operator delete(v1);
}

uint64_t sub_A664(uint64_t a1, uint64_t a2)
{
  return sub_8A08(*(void *)(a1 + 1072), a2);
}

uint64_t sub_A66C(uint64_t a1)
{
  *(void *)a1 = &off_18980;
  if (*(_DWORD *)(a1 + 48)) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  int v2 = (void *)(a1 + 8);
  int v3 = *(void **)(a1 + 32);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    int v3 = v2;
    goto LABEL_6;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_6:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_A6FC(_DWORD *__p)
{
  *(void *)__p = &off_18980;
  if (__p[12]) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  int v2 = (char *)(__p + 2);
  int v3 = (char *)*((void *)__p + 4);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    int v3 = v2;
    goto LABEL_6;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_6:
    (*(void (**)(void))(*(void *)v3 + 8 * v4))();
  }

  operator delete(__p);
}

uint64_t sub_A78C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    sub_42B4();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48LL))(v2, &v4);
}

void sub_A7C4()
{
}

MIDIPacketList *sub_A7D8(MIDIPacketList *pktlist)
{
  *(void *)&pktlist->numPackets = &off_18958;
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    sub_8A08(*(void *)&pktlist[3].packet[0].data[242], (uint64_t)v2);
  }
  *(void *)&pktlist->packet[0].data[26] = MIDIPacketListInit(v2);
  *(void *)&pktlist->numPackets = &off_18980;
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  int v3 = *(MIDIPacketList **)&pktlist->packet[0].data[18];
  if (v3 == (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4))
  {
    uint64_t v4 = 4LL;
    int v3 = (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4);
    goto LABEL_8;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_8:
    (*(void (**)(void))(*(void *)&v3->numPackets + 8 * v4))();
  }

  return pktlist;
}

uint64_t sub_A8A0(uint64_t a1, int a2)
{
  *(void *)a1 = off_189E0;
  uint64_t v3 = sub_4300(a1, (uint64_t)sub_25BC, a1, a2, 0, 0, 0LL);
  *(void *)(v3 + 128) = "SSThread";
  *(_BYTE *)(v3 + 136) = 0;
  *(void *)uint64_t v3 = &off_189A8;
  *(void *)(v3 + 144) = v3;
  sub_47E4(v3 + 152, (uint64_t)"SSThreadLock");
  *(void *)(a1 + 248) = 0LL;
  *(_DWORD *)(a1 + 272) = 0;
  *(void *)(a1 + 256) = 0LL;
  *(void *)(a1 + 264) = 0LL;
  context.unsigned __int16 version = 0LL;
  context.info = (void *)a1;
  memset(&context.retain, 0, 24);
  *(void *)(a1 + sub_26F8(v14 + 280) = CFRunLoopTimerCreate(0LL, 0.0, 1.0e11, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_A9EC, &context);
  double Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 280), kCFRunLoopDefaultMode);
  pipe((int *)(a1 + 240));
  sub_458C(a1);
  return a1;
}

void sub_A9A8(_Unwind_Exception *a1)
{
}

void sub_A9BC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  socklen_t v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 256) = v6;
    operator delete(v6);
  }

  sub_4870(v2);
  nullsub_2(v1);
  _Unwind_Resume(a1);
}

void sub_A9EC(uint64_t a1, uint64_t a2)
{
}

void sub_A9F8(uint64_t a1)
{
  uint64_t v1 = (void *)nullsub_2(a1);
  operator delete(v1);
}

uint64_t sub_AA0C(uint64_t result)
{
  *(_BYTE *)(result + 136) = 1;
  return result;
}

void sub_AA18(uint64_t a1)
{
}

_OWORD *sub_AA20(uint64_t a1, __int128 *a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = ((uint64_t)v4 - *(void *)a1) >> 4;
  unint64_t v6 = v5 + 1;
  uint64_t v7 = *(void *)(a1 + 16) - (void)v3;
  if (v7 >> 3 > v6) {
    unint64_t v6 = v7 >> 3;
  }
  if (v6 >> 60) {
    sub_428C();
  }
  uint64_t v9 = 16 * v6;
  socklen_t v10 = (char *)operator new(16 * v6);
  unint64_t v11 = &v10[16 * v5];
  __int128 v12 = *a2;
  *(_OWORD *)unint64_t v11 = *a2;
  if (*((void *)&v12 + 1))
  {
    int v13 = (unint64_t *)(*((void *)&v12 + 1) + 8LL);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
    uint64_t v3 = *(void **)a1;
    uint64_t v4 = *(void **)(a1 + 8);
  }

  uint64_t v15 = &v10[v9];
  uint64_t v16 = v11 + 16;
  if (v4 == v3)
  {
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v16;
    *(void *)(a1 + 16) = v15;
    if (!v3) {
      return v16;
    }
    goto LABEL_23;
  }

  do
  {
    __int128 v17 = *((_OWORD *)v4 - 1);
    v4 -= 2;
    *((_OWORD *)v11 - 1) = v17;
    v11 -= 16;
    *uint64_t v4 = 0LL;
    v4[1] = 0LL;
  }

  while (v4 != v3);
  uint64_t v18 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v15;
  if (v3 != v18)
  {
    do
    {
      __int16 v19 = (std::__shared_weak_count *)*(v3 - 1);
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          unint64_t v21 = __ldaxr(p_shared_owners);
        while (__stlxr(v21 - 1, p_shared_owners));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }

      v3 -= 2;
    }

    while (v3 != v18);
    uint64_t v3 = v18;
  }

  if (v3) {
LABEL_23:
  }
    operator delete(v3);
  return v16;
}

MIDIPacketList *sub_AB80(MIDIPacketList *pktlist)
{
  *(void *)&pktlist->numPackets = &off_18890;
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34])
  {
    pktlist[3].packet[0].data[245] = 1;
    if (pktlist[3].packet[0].data[244]) {
      sub_4998(*(void *)&pktlist[3].packet[0].data[250] + 304LL);
    }
    (*(void (**)(void, MIDIPacketList *))(**(void **)&pktlist[3].packet[0].data[250] + 16LL))( *(void *)&pktlist[3].packet[0].data[250],  v2);
    if (pktlist[3].packet[0].data[244]) {
      sub_48D8(*(void *)&pktlist[3].packet[0].data[250] + 304LL);
    }
  }

  *(void *)&pktlist->packet[0].data[26] = MIDIPacketListInit(v2);
  *(void *)&pktlist->numPackets = &off_18980;
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  uint64_t v3 = *(MIDIPacketList **)&pktlist->packet[0].data[18];
  if (v3 == (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4))
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4);
    goto LABEL_11;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_11:
    (*(void (**)(void))(*(void *)&v3->numPackets + 8 * v4))();
  }

  return pktlist;
}

void *sub_AC7C(void *a1)
{
  *a1 = &off_18A18;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_ACBC(void *__p)
{
  *__p = &off_18A18;
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    CFRelease(v2);
  }
  operator delete(__p);
}

void sub_ACFC(std::runtime_error *a1)
{
}

void sub_AD10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (std::recursive_mutex *)(a2 + 24);
  if (std::recursive_mutex::try_lock((std::recursive_mutex *)(a2 + 24)))
  {
    uint64_t v4 = *(__CFRunLoopTimer **)(a2 + 16);
    if (v4)
    {
      if (CFRunLoopTimerIsValid(v4)) {
        (*(void (**)(void))(a2 + 8))(*(void *)a2);
      }
    }

    std::recursive_mutex::unlock(v3);
  }

void sub_AD64(_Unwind_Exception *a1)
{
}

void sub_AD78(uint64_t a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, uint64_t *a4@<X8>)
{
  CFAbsoluteTime v8 = (std::__shared_weak_count *)operator new(0x1B8uLL);
  v8->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0LL;
  v8->__vftable = (std::__shared_weak_count_vtbl *)off_18A60;
  *a4 = sub_AEF8((uint64_t)&v8[1], a1, *a2, *a3);
  a4[1] = (uint64_t)v8;
  shared_owners = (std::__shared_weak_count *)v8[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1) {
      return;
    }
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
    do
      unint64_t v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
    v8[1].__shared_owners_ = (uint64_t)v8;
    std::__shared_weak_count::__release_weak(shared_owners);
  }

  else
  {
    do
      unint64_t v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    uint64_t v15 = (unint64_t *)&v8->__shared_weak_owners_;
    do
      unint64_t v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
    v8[1].__shared_owners_ = (uint64_t)v8;
  }

  do
    unint64_t v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

void sub_AE9C(_Unwind_Exception *a1)
{
}

void sub_AEB4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_18A60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_AEC8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_18A60;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_AEEC(uint64_t a1)
{
  return sub_B354(a1 + 24);
}

uint64_t sub_AEF8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)(a1 + 32) = 0LL;
  *(_BYTE *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0LL;
  *(_BYTE *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 168) = 0LL;
  *(_BYTE *)(a1 + 296) = 0;
  *(void *)(a1 + 300) = 0LL;
  *(void *)(a1 + 320) = 0LL;
  *(void *)(a1 + 328) = 0LL;
  *(void *)(a1 + 312) = a1 + 320;
  *(_WORD *)(a1 + 336) = 0;
  *(void *)(a1 + 340) = 0LL;
  *(void *)(a1 + 352) = 0LL;
  *(void *)(a1 + 360) = 0LL;
  *(_BYTE *)(a1 + 368) = 7;
  *(_OWORD *)(a1 + 372) = 0u;
  *(_OWORD *)(a1 + 388) = 0u;
  if (a3)
  {
    do
    {
      int v6 = random();
      *(_DWORD *)(a1 + 24) = v6;
    }

    while (!v6);
  }

  else
  {
    *(_DWORD *)(a1 + 24) = 0;
  }

  *(_WORD *)(a1 + 66) = 0;
  *(_WORD *)(a1 + 94) = 0;
  sub_B04C(a1);
  if (a4 < 0) {
    uint64_t v7 = -__udivti3(-3000000LL * a4, ((unint64_t)(-1000000LL * a4) * (unsigned __int128)3uLL) >> 64, 125LL, 0LL);
  }
  else {
    uint64_t v7 = __udivti3(3000000LL * a4, ((unint64_t)(1000000LL * a4) * (unsigned __int128)3uLL) >> 64, 125LL, 0LL);
  }
  *(void *)(a1 + 128) = v7;
  return a1;
}

void sub_B014(_Unwind_Exception *a1)
{
  int v6 = *(std::__shared_weak_count **)(v1 + 8);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  _Unwind_Resume(a1);
}

void sub_B04C(uint64_t a1)
{
  double Current = CFRunLoopGetCurrent();
  *(_DWORD *)(a1 + 144) = -1;
  *(void *)(a1 + sub_26F8(v14 + 280) = 0LL;
  *(void *)(a1 + 256) = 0LL;
  CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent();
  *(CFAbsoluteTime *)(a1 + 264) = v3;
  *(CFAbsoluteTime *)(a1 + 272) = v3;
  uint64_t v4 = operator new(0x58uLL);
  *uint64_t v4 = a1;
  v4[1] = sub_B25C;
  std::recursive_mutex::recursive_mutex((std::recursive_mutex *)(v4 + 3));
  context.unsigned __int16 version = 0LL;
  context.info = v4;
  memset(&context.retain, 0, 24);
  CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent();
  int v6 = CFRunLoopTimerCreate(0LL, v5 + 31536000.0, 1.0e11, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_AD10, &context);
  v4[2] = v6;
  CFRunLoopAddTimer(Current, v6, kCFRunLoopDefaultMode);
  *(void *)(a1 + 136) = v4;
  if (getenv("MIDIRTP_TIMESTAMP_LOG"))
  {
    snprintf((char *)&context, 0x40uLL, "/tmp/MIDIRTPTS-%.f.log", *(double *)(a1 + 264));
    *(void *)(a1 + sub_26F8(v14 + 280) = fopen((const char *)&context, "w");
  }

  uint64_t v7 = operator new(0x58uLL);
  void *v7 = a1;
  v7[1] = sub_B260;
  std::recursive_mutex::recursive_mutex((std::recursive_mutex *)(v7 + 3));
  context.unsigned __int16 version = 0LL;
  context.info = v7;
  memset(&context.retain, 0, 24);
  CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = CFRunLoopTimerCreate(0LL, v8 + 31536000.0, 1.0e11, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_AD10, &context);
  v7[2] = v9;
  CFRunLoopAddTimer(Current, v9, kCFRunLoopDefaultMode);
  *(void *)(a1 + 288) = v7;
}

void sub_B220(_Unwind_Exception *a1)
{
}

void sub_B23C(_Unwind_Exception *a1)
{
}

ssize_t sub_B260(ssize_t result)
{
  *(_BYTE *)(result + 296) = 0;
  unsigned int v1 = *(_DWORD *)(result + 300);
  if (v1)
  {
    ssize_t v2 = result;
    int v3 = *(_DWORD *)(result + 304);
    if (v3) {
      BOOL v4 = v3 == v1;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
      uint64_t v5 = *(void *)(result + 16);
      unsigned int v6 = bswap32(*(_DWORD *)(v5 + 392));
      v7[0] = 1397948415;
      v7[1] = v6;
      __int16 v8 = bswap32(v1) >> 16;
      *(_OWORD *)uint64_t v9 = *(_OWORD *)(result + 64);
      *(_OWORD *)&v9[12] = *(_OWORD *)(result + 76);
      sub_3238((uint64_t)v9, v10, 0x100uLL);
      ssize_t result = sendto(*(_DWORD *)(v5 + 40LL * (v9[1] == 30) + 136), v7, 0xCuLL, 0, (const sockaddr *)v9, v9[0]);
      if ((result & 0x80000000) != 0) {
        ssize_t result = (ssize_t)__error();
      }
    }

    *(_DWORD *)(v2 + 304) = v1;
  }

  return result;
}

uint64_t sub_B354(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 288);
  std::recursive_mutex::lock((std::recursive_mutex *)(v2 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v2 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v2 + 24));
  uint64_t v3 = *(void *)(a1 + 136);
  std::recursive_mutex::lock((std::recursive_mutex *)(v3 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v3 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v3 + 24));
  BOOL v4 = *(FILE **)(a1 + 280);
  if (v4) {
    fclose(v4);
  }
  sub_A610(a1 + 312, *(void **)(a1 + 320));
  if (*(_BYTE *)(a1 + 56))
  {
    uint64_t v5 = *(const void **)(a1 + 48);
    if (v5) {
      CFRelease(v5);
    }
  }

  if (*(_BYTE *)(a1 + 40))
  {
    unsigned int v6 = *(const void **)(a1 + 32);
    if (v6) {
      CFRelease(v6);
    }
  }

  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 8);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  return a1;
}

void sub_B410(void *a1)
{
}

void sub_B424(void *a1)
{
}

void sub_B440(std::exception *a1)
{
}

void sub_B454(void *__p)
{
  *__p = &off_18A18;
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    CFRelease(v2);
  }
  operator delete(__p);
}

void sub_B494()
{
  exception = __cxa_allocate_exception(8uLL);
}

void sub_B4C8(uint64_t a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, uint64_t *a4@<X8>)
{
  __int16 v8 = (std::__shared_weak_count *)operator new(0x1B8uLL);
  v8->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0LL;
  v8->__vftable = (std::__shared_weak_count_vtbl *)off_18A60;
  *a4 = sub_AEF8((uint64_t)&v8[1], a1, *a2, *a3);
  a4[1] = (uint64_t)v8;
  shared_owners = (std::__shared_weak_count *)v8[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1) {
      return;
    }
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
    do
      unint64_t v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
    v8[1].__shared_owners_ = (uint64_t)v8;
    std::__shared_weak_count::__release_weak(shared_owners);
  }

  else
  {
    do
      unint64_t v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    uint64_t v15 = (unint64_t *)&v8->__shared_weak_owners_;
    do
      unint64_t v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)&v8[1];
    v8[1].__shared_owners_ = (uint64_t)v8;
  }

  do
    unint64_t v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

void sub_B5EC(_Unwind_Exception *a1)
{
}

uint64_t sub_B604(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = 0LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(void *)a1 = &off_18B10;
  *(void *)(a1 + 8) = &unk_1C008;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1LL;
  uint64_t v15 = off_18BA0;
  v16[0] = a1;
  uint64_t v3 = operator new(0x340uLL);
  void *v3 = off_18B80;
  v3[1] = off_18BA0;
  v3[2] = a1;
  bzero(v3 + 8, 0x300uLL);
  BOOL v4 = operator new(0x20uLL);
  *BOOL v4 = &off_18BD8;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = v3;
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 80);
  *(void *)(a1 + 72) = v3;
  *(void *)(a1 + 80) = v4;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  ((void (*)(void *))v15[3])(v16);
  v14[0] = a1;
  __int16 v8 = operator new(0x340uLL);
  *__int16 v8 = off_18B80;
  v8[1] = off_18C00;
  v8[2] = a1;
  bzero(v8 + 8, 0x300uLL);
  uint64_t v9 = operator new(0x20uLL);
  *uint64_t v9 = &off_18BD8;
  v9[1] = 0LL;
  sockaddr v9[2] = 0LL;
  v9[3] = v8;
  socklen_t v10 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  if (v10)
  {
    unint64_t v11 = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  ((void (*)(void *))nullsub_6)(v14);
  return a1;
}

void sub_B7F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2) {
    sub_27D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_B870(void *a1)
{
  *a1 = &off_18B10;
  uint64_t v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  unsigned int v6 = (std::__shared_weak_count *)a1[7];
  if (!v6) {
    return a1;
  }
  unint64_t v7 = (unint64_t *)&v6->__shared_owners_;
  do
    unint64_t v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  return a1;
}

void *sub_B92C(void *a1)
{
  *a1 = &off_18B10;
  uint64_t v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  unsigned int v6 = (std::__shared_weak_count *)a1[7];
  if (!v6) {
    return a1;
  }
  unint64_t v7 = (unint64_t *)&v6->__shared_owners_;
  do
    unint64_t v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  return a1;
}

void sub_B9E8(void *__p)
{
  *__p = &off_18B10;
  uint64_t v2 = (const __CFUUID *)__p[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)__p[10];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  unsigned int v6 = (std::__shared_weak_count *)__p[7];
  if (!v6) {
    goto LABEL_12;
  }
  unint64_t v7 = (unint64_t *)&v6->__shared_owners_;
  do
    unint64_t v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
    operator delete(__p);
  }

  else
  {
LABEL_12:
    operator delete(__p);
  }

uint64_t sub_BAA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[6];
  if (!v5) {
    return 7LL;
  }
  a1[4] = a3;
  a1[5] = a4;
  (*(void (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
  return 0LL;
}

uint64_t sub_BAE0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7LL;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16LL))(v4, a3);
  return 0LL;
}

uint64_t sub_BB20()
{
  return 0LL;
}

uint64_t sub_BB28()
{
  return 0LL;
}

uint64_t sub_BB30()
{
  return 0LL;
}

uint64_t sub_BB38()
{
  return 0LL;
}

uint64_t sub_BB40()
{
  return 0LL;
}

uint64_t sub_BB48()
{
  return 0LL;
}

uint64_t sub_BB50()
{
  return 0LL;
}

uint64_t sub_BB58()
{
  return 0LL;
}

uint64_t sub_BB60(_DWORD *a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Fu,  0xD9u,  0x4Du,  0xFu,  0x8Cu,  0x2Au,  0x48u,  0x2Au,  0x8Au,  0xD8u,  0x7Du,  0x9Eu,  0xA3u,  0x81u,  0xC9u,  0xC1u);
  if (CFEqual(v5, v6))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0LL;
    a1[5] = 3;
  }

  else
  {
    CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x43u,  0xC9u,  0x8Cu,  0x3Cu,  0x30u,  0x6Cu,  0x11u,  0xD5u,  0xAFu,  0x73u,  0,  0x30u,  0x65u,  0xA8u,  0x30u,  0x1Eu);
    if (CFEqual(v5, v8))
    {
      (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
      *a3 = a1;
      CFRelease(v5);
      uint64_t result = 0LL;
      a1[5] = 2;
    }

    else
    {
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
      if (CFEqual(v5, v9))
      {
        (*(void (**)(_DWORD *))(*(void *)a1 + 16LL))(a1);
        *a3 = a1;
        CFRelease(v5);
        return 0LL;
      }

      else
      {
        *a3 = 0LL;
        CFRelease(v5);
        return 2147483652LL;
      }
    }
  }

  return result;
}

uint64_t sub_BD48(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_BD5C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 != 1) {
    return (v1 - 1);
  }
  (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 8LL))(a1 - 8);
  return v2;
}

uint64_t sub_BDA4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 16LL))(a1 - 8);
}

uint64_t sub_BDB0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 24LL))(a1 - 8);
}

uint64_t sub_BDBC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 32LL))(a1 - 8);
}

uint64_t sub_BDC8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 40LL))(a1 - 8);
}

uint64_t sub_BDD4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 48LL))(a1 - 8);
}

uint64_t sub_BDE0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 56LL))(a1 - 8);
}

uint64_t sub_BDEC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 64LL))(a1 - 8);
}

uint64_t sub_BDF8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 72LL))(a1 - 8);
}

uint64_t sub_BE04(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 80LL))(a1 - 8);
}

uint64_t sub_BE10(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 88LL))(a1 - 8);
}

void *sub_BE1C(void *a1)
{
  *a1 = off_18B80;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  return a1;
}

void sub_BE60(void *a1)
{
  *a1 = off_18B80;
  (*(void (**)(void *))(a1[1] + 24LL))(a1 + 2);
  operator delete(a1);
}

uint64_t sub_BEA4(uint64_t *a1, _DWORD *a2)
{
  uint64_t v8 = a1[1];
  (*(void (**)(_BYTE *, uint64_t *))(v8 + 8))(v9, a1 + 2);
  int v11 = 0;
  socklen_t v10 = v12;
  if (*a2 == 2)
  {
    v6[0] = a1;
    v6[1] = &v8;
    unint64_t v7 = v6;
    sub_C9E4((uint64_t)a2, &v7);
  }

  else
  {
    if (*a2 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error( exception,  "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventConversion.h: 657");
      exception->__vftable = (std::runtime_error_vtbl *)&off_18A38;
    }

    unint64_t v7 = (uint64_t **)&v8;
    v6[0] = (uint64_t *)&v7;
    sub_C11C((uint64_t)a2, v6);
  }

  if (v11)
  {
    v6[0] = (uint64_t *)&v11;
    (*(void (**)(_BYTE *, uint64_t **))v8)(v9, v6);
  }

  int v11 = 0;
  socklen_t v10 = v12;
  return (*(uint64_t (**)(_BYTE *))(v8 + 24))(v9);
}

void sub_C004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_C018( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
}

void sub_C034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_C048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_C05C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_27D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_C07C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

uint64_t sub_C0AC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }

  *(_DWORD *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a1 + 68;
  (*(void (**)(uint64_t))(*(void *)a1 + 24LL))(a1 + 8);
  return a1;
}

uint64_t sub_C11C(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      unint64_t v6 = *(unsigned int *)(v5 + 8);
      uint64_t v19 = v5 + 12;
      unint64_t v20 = v6;
      uint64_t v21 = *(void *)v5;
      unint64_t v22 = 0LL;
      uint64_t v16 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t result = sub_C2CC(&v19, &v18, &v16);
      if ((_DWORD)result)
      {
        unint64_t v7 = *a2;
        uint64_t v8 = v18;
        while (1)
        {
          uint64_t v24 = v8;
          v23[0] = *v7;
          v23[1] = (uint64_t)&v24;
          uint64_t result = (uint64_t)sub_C3C8((unsigned __int8 *)&v16, v23);
          uint64_t v16 = 0LL;
          uint64_t v17 = 0LL;
          if (v22 >= v20) {
            break;
          }
          int v11 = (unsigned int *)(v19 + 4 * v22);
          unint64_t v10 = *v11;
          unint64_t v13 = v22 + byte_160BB[v10 >> 28];
          if (v13 > v20) {
            break;
          }
          uint64_t v8 = v21;
          uint64_t v18 = v21;
          CFUUIDRef v9 = &v16;
          switch((uint64_t)(4 * v13 - 4 * v22) >> 2)
          {
            case 0LL:
              goto LABEL_9;
            case 1LL:
              goto LABEL_8;
            case 2LL:
              goto LABEL_7;
            case 3LL:
              goto LABEL_6;
            case 4LL:
              LODWORD(v16) = v10;
              unsigned int v14 = v11[1];
              ++v11;
              LODWORD(v10) = v14;
              CFUUIDRef v9 = (uint64_t *)((char *)&v16 + 4);
LABEL_6:
              *(_DWORD *)CFUUIDRef v9 = v10;
              CFUUIDRef v9 = (uint64_t *)((char *)v9 + 4);
              unsigned int v12 = v11[1];
              ++v11;
              LODWORD(v10) = v12;
LABEL_7:
              *(_DWORD *)CFUUIDRef v9 = v10;
              CFUUIDRef v9 = (uint64_t *)((char *)v9 + 4);
              LODWORD(v10) = v11[1];
LABEL_8:
              *(_DWORD *)CFUUIDRef v9 = v10;
LABEL_9:
              unint64_t v22 = v13;
              unint64_t v7 = *a2;
              break;
            default:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              sub_9F58( exception,  "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
          }
        }
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

void sub_C2B8(_Unwind_Exception *a1)
{
}

uint64_t sub_C2CC(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0LL;
  }
  uint64_t v5 = *a1;
  unint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_160BB[v7 >> 28];
  if (v8 > v3) {
    return 0LL;
  }
  *a2 = a1[2];
  switch((uint64_t)(v5 + 4 * v8 - (void)v6) >> 2)
  {
    case 0LL:
      goto LABEL_9;
    case 1LL:
      goto LABEL_8;
    case 2LL:
      goto LABEL_7;
    case 3LL:
      goto LABEL_6;
    case 4LL:
      *a3++ = v7;
      unsigned int v10 = v6[1];
      ++v6;
      LODWORD(v7) = v10;
LABEL_6:
      *a3++ = v7;
      unsigned int v11 = v6[1];
      ++v6;
      LODWORD(v7) = v11;
LABEL_7:
      *a3++ = v7;
      LODWORD(v7) = v6[1];
LABEL_8:
      *a3 = v7;
LABEL_9:
      a1[3] = v8;
      uint64_t result = 1LL;
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_9F58( exception,  "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
  }

  return result;
}

void sub_C3B4(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_C3C8(unsigned __int8 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v33[0] = bswap32(v3);
    v33[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v26 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v27 = v7 + 1088;
        int v28 = *(_DWORD *)(v7 + 64);
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v26 && *(unsigned __int8 *)(v9 + v29 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v29 + 10 <= v27) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }

          unint64_t v9 = (v9 + v29 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v27)
        {
          LODWORD(v29) = 0;
          *(_DWORD *)(v7 + 64) = v28 + 1;
          *(void *)unint64_t v9 = v26;
          *(_WORD *)(v9 + 8) = 0;
LABEL_53:
          uint64_t result = (unsigned __int8 *)(v9 + v29 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_62;
            case 2uLL:
              goto LABEL_61;
            case 3uLL:
              goto LABEL_60;
            case 4uLL:
LABEL_59:
              p_src = (unsigned __int8 *)&v35;
              *result++ = __src;
LABEL_60:
              unsigned __int8 v31 = *p_src++;
              *result++ = v31;
LABEL_61:
              unsigned __int8 v32 = *p_src++;
              *result++ = v32;
LABEL_62:
              std::runtime_error *result = *p_src;
              break;
            default:
LABEL_66:
              uint64_t result = (unsigned __int8 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_64;
        }

LABEL_51:
        uint64_t result = (unsigned __int8 *)sub_C80C(v7, v26, (char *)&__src, v6);
        unint64_t v9 = (unint64_t)result;
LABEL_64:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v33 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v35 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v36 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    unint64_t v20 = *(void *)(*a2 + 56);
    unint64_t v21 = *a2 + 1088;
    int v22 = *(_DWORD *)(*a2 + 64);
    if (v22)
    {
      uint64_t v23 = *(unsigned __int16 *)(v20 + 8);
      if (*(void *)v20 == v19 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v20 + v23 + 9) != 247)
      {
        if (v20 + v17 + v23 + 10 <= v21) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }

      unint64_t v20 = (v20 + v23 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }

    if (v20 + v17 + 10 <= v21)
    {
      LODWORD(v23) = 0;
      *(_DWORD *)(v18 + 64) = v22 + 1;
      *(void *)unint64_t v20 = v19;
      *(_WORD *)(v20 + 8) = 0;
LABEL_35:
      uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 10);
      if (v16 == 12582912)
      {
        double v25 = &__src;
      }

      else
      {
        double v25 = (unsigned __int8 *)&v35;
        unsigned __int8 *v24 = __src;
        uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 11);
      }

      unsigned __int8 *v24 = *v25;
      v24[1] = v25[1];
      *(_WORD *)(v20 + 8) += v17;
      *(void *)(v18 + 56) = v20;
      return result;
    }

        uint64_t result = (unsigned __int8 *)sub_C80C(v7, v26, (char *)&__src, v6);
        unint64_t v9 = (unint64_t)result;
LABEL_64:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }

    memcpy(&__src + v6, (char *)v33 + 2, v13);
    v6 += (v13 - 1) + 1LL;
    goto LABEL_39;
  }

  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v35 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2LL;
    }
    else {
      size_t v17 = 3LL;
    }
    if (v16 != 12582912) {
      char v36 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    unint64_t v20 = *(void *)(*a2 + 56);
    unint64_t v21 = *a2 + 1088;
    int v22 = *(_DWORD *)(*a2 + 64);
    if (v22)
    {
      uint64_t v23 = *(unsigned __int16 *)(v20 + 8);
      if (*(void *)v20 == v19 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v20 + v23 + 9) != 247)
      {
        if (v20 + v17 + v23 + 10 <= v21) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }

      unint64_t v20 = (v20 + v23 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }

    if (v20 + v17 + 10 <= v21)
    {
      LODWORD(v23) = 0;
      *(_DWORD *)(v18 + 64) = v22 + 1;
      *(void *)unint64_t v20 = v19;
      *(_WORD *)(v20 + 8) = 0;
LABEL_35:
      uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 10);
      if (v16 == 12582912)
      {
        double v25 = &__src;
      }

      else
      {
        double v25 = (unsigned __int8 *)&v35;
        unsigned __int8 *v24 = __src;
        uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 11);
      }

      unsigned __int8 *v24 = *v25;
      v24[1] = v25[1];
      *(_WORD *)(v20 + 8) += v17;
      *(void *)(v18 + 56) = v20;
      return result;
    }

LABEL_33:
    uint64_t result = (unsigned __int8 *)sub_C80C(*a2, v19, (char *)&__src, v17);
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1C078[v5];
      if (byte_1C078[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v35 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v9 + v12 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_58;
            }
LABEL_56:
            uint64_t result = (unsigned __int8 *)sub_C80C(v7, v8, (char *)&__src, v6);
            *(void *)(v7 + 56) = result;
            return result;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_58:
          uint64_t result = (unsigned __int8 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_62;
            case 2:
              goto LABEL_61;
            case 3:
              goto LABEL_60;
            case 4:
              goto LABEL_59;
            default:
              goto LABEL_66;
          }
        }

        goto LABEL_56;
      }
    }
  }

  return result;
}

    uint64_t result = (unsigned __int8 *)sub_C80C(*a2, v19, (char *)&__src, v17);
    *(void *)(v18 + 56) = result;
    return result;
  }

  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_1C078[v5];
      if (byte_1C078[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if ((_DWORD)v6 != 1)
        {
          char v35 = BYTE1(v3) & 0x7F;
        }

        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v9 + v12 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_58;
            }
LABEL_56:
            uint64_t result = (unsigned __int8 *)sub_C80C(v7, v8, (char *)&__src, v6);
            *(void *)(v7 + 56) = result;
            return result;
          }

          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_58:
          uint64_t result = (unsigned __int8 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_62;
            case 2:
              goto LABEL_61;
            case 3:
              goto LABEL_60;
            case 4:
              goto LABEL_59;
            default:
              goto LABEL_66;
          }
        }

        goto LABEL_56;
      }
    }
  }

  return result;
}

  *(_OWORD *)unint64_t v20 = *(_OWORD *)v3;
  double v25 = v20;
  if (v6 != v8)
  {
    uint64_t v26 = v8;
    unint64_t v27 = v20;
    do
    {
      double v25 = v27 - 16;
      *((_OWORD *)v27 - 1) = *((_OWORD *)v26 - 1);
      v26 -= 16;
      v27 -= 16;
    }

    while (v26 != v6);
  }

  int v28 = a1[1];
  uint64_t v29 = v28 - v8;
  if (v28 != v8) {
    memmove(v20 + 16, v8, v28 - v8);
  }
  double v30 = *a1;
  *a1 = v25;
  a1[1] = &v20[v29 + 16];
  a1[2] = v21;
  if (v30) {
    operator delete(v30);
  }
  return v20;
}

uint64_t sub_C80C(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 64)
    && (uint64_t v18 = a1 + 64,
        (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v18),
        *(_DWORD *)(a1 + 64) = 0,
        uint64_t v8 = a1 + 68,
        a1 + 68 + a4 + 10 <= a1 + 1088))
  {
    *(_DWORD *)(a1 + 64) = 1;
    *(void *)(a1 + 68) = a2;
    *(_WORD *)(a1 + 76) = 0;
    int v11 = (char *)(a1 + 78);
    __int16 v12 = 0;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_10;
      case 2uLL:
        goto LABEL_9;
      case 3uLL:
        goto LABEL_8;
      case 4uLL:
        char v13 = *a3++;
        int v11 = (char *)(a1 + 79);
        *(_BYTE *)(a1 + 78) = v13;
LABEL_8:
        char v14 = *a3++;
        *v11++ = v14;
LABEL_9:
        char v15 = *a3++;
        *v11++ = v15;
LABEL_10:
        char *v11 = *a3;
        __int16 v12 = *(_WORD *)(a1 + 76);
        break;
      default:
        if (a4) {
          memmove(v11, a3, a4);
        }
        __int16 v12 = 0;
        break;
    }

    *(_WORD *)(a1 + 76) = v12 + a4;
  }

  else
  {
    MIDI::LegacyPacketList::create(&v17, 1LL, a2, a3, a4);
    uint64_t v18 = v17;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v18);
    uint64_t v9 = v17;
    uint64_t v17 = 0LL;
    if (v9)
    {
      MIDI::LegacyPacketListDeleter::operator()(&v17);
      uint64_t v10 = v17;
      *(void *)(a1 + 56) = a1 + 68;
      *(_DWORD *)(a1 + 64) = 0;
      uint64_t v17 = 0LL;
      if (v10) {
        MIDI::LegacyPacketListDeleter::operator()(&v17);
      }
    }

    else
    {
      *(void *)(a1 + 56) = a1 + 68;
      *(_DWORD *)(a1 + 64) = 0;
    }

    return a1 + 68;
  }

  return v8;
}

void sub_C998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_C9AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0LL;
  if (v2) {
    MIDI::LegacyPacketListDeleter::operator()(a1);
  }
  return a1;
}

uint64_t sub_C9E4(uint64_t result, void **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      unint64_t v6 = *(unsigned int *)(v5 + 8);
      uint64_t v21 = v5 + 12;
      unint64_t v22 = v6;
      uint64_t v23 = *(void *)v5;
      unint64_t v24 = 0LL;
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t result = sub_C2CC(&v21, &v20, &v18);
      if ((_DWORD)result)
      {
        uint64_t v7 = *a2;
        uint64_t v26 = v20;
        uint64_t v8 = (unsigned __int8 *)(*v7 + 64LL);
        *(void *)&__int128 v25 = v7[1];
        while (1)
        {
          *((void *)&v25 + 1) = &v26;
          uint64_t result = (uint64_t)sub_CBAC(v8, (unsigned __int8 *)&v18, &v25);
          uint64_t v18 = 0LL;
          uint64_t v19 = 0LL;
          if (v24 >= v22) {
            break;
          }
          int v11 = (unsigned int *)(v21 + 4 * v24);
          unint64_t v10 = *v11;
          unint64_t v14 = v24 + byte_160BB[v10 >> 28];
          if (v14 > v22) {
            break;
          }
          uint64_t v15 = v23;
          uint64_t v20 = v23;
          uint64_t v9 = &v18;
          switch((uint64_t)(4 * v14 - 4 * v24) >> 2)
          {
            case 0LL:
              goto LABEL_9;
            case 1LL:
              goto LABEL_8;
            case 2LL:
              goto LABEL_7;
            case 3LL:
              goto LABEL_6;
            case 4LL:
              LODWORD(v18) = v10;
              unsigned int v16 = v11[1];
              ++v11;
              LODWORD(v10) = v16;
              uint64_t v9 = (uint64_t *)((char *)&v18 + 4);
LABEL_6:
              *(_DWORD *)uint64_t v9 = v10;
              uint64_t v9 = (uint64_t *)((char *)v9 + 4);
              unsigned int v12 = v11[1];
              ++v11;
              LODWORD(v10) = v12;
LABEL_7:
              *(_DWORD *)uint64_t v9 = v10;
              uint64_t v9 = (uint64_t *)((char *)v9 + 4);
              LODWORD(v10) = v11[1];
LABEL_8:
              *(_DWORD *)uint64_t v9 = v10;
LABEL_9:
              unint64_t v24 = v14;
              char v13 = *a2;
              uint64_t v26 = v15;
              uint64_t v8 = (unsigned __int8 *)(*v13 + 64LL);
              *(void *)&__int128 v25 = v13[1];
              break;
            default:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              sub_9F58( exception,  "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
          }
        }
      }

      v5 += 4LL * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }

    while (v4 < *(_DWORD *)(v3 + 4));
  }

  return result;
}

void sub_CB98(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_CBAC(unsigned __int8 *result, unsigned __int8 *a2, __int128 *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    __int128 v29 = *a3;
    uint64_t v5 = a2;
    return sub_CEB8(v5, (uint64_t *)&v29);
  }

  else if (v3 >> 28 == 4)
  {
    unsigned int v6 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v7 = *((_DWORD *)a2 + 1);
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        unint64_t v10 = &result[48 * (BYTE3(v3) & 0xF)];
        uint64_t v11 = (v3 >> 16) & 0xF;
        unsigned int v12 = &v10[3 * v11];
        unsigned int v13 = (v3 >> 8) & 0x7F;
        int v14 = *(_DWORD *)a2 & 0x7F;
        int v15 = (v7 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if (v16 == *v12 && v13 == v12[1])
        {
          int v17 = v11 | 0xB0;
          if (v14 == v12[2])
          {
            int v18 = (v6 << 24) | (v17 << 16);
            goto LABEL_22;
          }
        }

        else
        {
          int v17 = v11 | 0xB0;
        }

        if ((v3 & 0x100000) != 0) {
          int v19 = 25344;
        }
        else {
          int v19 = 25856;
        }
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        int v18 = (v6 << 24) | (v17 << 16);
        int v20 = v18 | v19;
        *(void *)unint64_t v27 = v18 | v19 | v13;
        __int128 v29 = *a3;
        uint64_t v26 = v10;
        sub_CEB8(v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)unint64_t v27 = (v20 | v14) - 256;
        __int128 v29 = *a3;
        sub_CEB8(v27, (uint64_t *)&v29);
        *unsigned int v12 = v16;
        uint64_t v21 = &v26[3 * v11];
        v21[1] = v13;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)unint64_t v27 = v18 | (v7 >> 25) | 0x600;
        __int128 v29 = *a3;
        uint64_t result = sub_CEB8(v27, (uint64_t *)&v29);
        if (v15)
        {
          int v28 = 0;
          *(void *)&v27[4] = 0LL;
          int v8 = v15 | v18;
          int v9 = 9728;
          goto LABEL_24;
        }

        break;
      case 8:
      case 9:
      case 10:
      case 11:
        int v8 = v7 >> 25;
        if (!(v7 >> 25)) {
          int v8 = BYTE2(v3) >> 4 == 9;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v9 = (BYTE2(v3) << 16) | (v6 << 24) | v3 & 0x7F00;
LABEL_24:
        int v22 = v8 | v9;
        goto LABEL_25;
      case 12:
        if ((v3 & 1) != 0)
        {
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
          int v25 = (v6 << 24) | (v24 - 0x100000);
          *(void *)unint64_t v27 = (v6 << 24) | (v24 - 0x100000) & 0xFFFFFF80 | (v7 >> 8) & 0x7F;
          __int128 v29 = *a3;
          sub_CEB8(v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)unint64_t v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          __int128 v29 = *a3;
          sub_CEB8(v27, (uint64_t *)&v29);
        }

        else
        {
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
        }

        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = HIWORD(v7) & 0x7F00 | v23 | v24;
        goto LABEL_25;
      case 13:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25 << 8);
        goto LABEL_25;
      case 14:
        int v28 = 0;
        *(void *)&v27[4] = 0LL;
        int v22 = (v7 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25);
LABEL_25:
        *(_DWORD *)unint64_t v27 = v22;
        __int128 v29 = *a3;
        uint64_t v5 = v27;
        return sub_CEB8(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }

  return result;
}

unsigned __int8 *sub_CEB8(unsigned __int8 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v33[0] = bswap32(v3);
    v33[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0LL;
      if (!(_DWORD)v13) {
        goto LABEL_39;
      }
    }

    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1LL;
      if (!(_DWORD)v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v26 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v27 = v7 + 1088;
        int v28 = *(_DWORD *)(v7 + 64);
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v26 && *(unsigned __int8 *)(v9 + v29 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v29 + 10 <= v27) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }

          unint64_t v9 = (v9 + v29 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }

        if (v9 + v6 + 10 <= v27)
        {
          LODWORD(v29) = 0;
          *(_DWORD *)(v7 + 64) = v28 + 1;
          *(void *)unint64_t v9 = v26;
          *(_WORD *)(v9 + 8) = 0;
LABEL_53:
          uint64_t result = (unsigned __int8 *)(v9 + v29 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_62;
            case 2uLL:
              goto LABEL_61;
            case 3uLL:
              goto LABEL_60;
            case 4uLL:
LABEL_59:
              p_src = (unsigned __int8 *)&v35;
              *result++ = __src;
LABEL_60:
              unsigned __int8 v31 = *p_src++;
              *result++ = v31;
LABEL_61:
              unsigned __int8 v32 = *p_src++;
              *result++ = v32;
LABEL_62:
              std::runtime_error *result = *p_src;
              break;
            default:
LABEL_66:
              uint64_t result = (unsigned __int8 *)memmove(result, &__src, v6);
              break;
          }

          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_64;
        }

uint64_t sub_D2FC(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72LL))( *a1,  *(unsigned int *)(*a1 + 64LL),  *a2);
}

void *sub_D314(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void *sub_D320(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void sub_D334(std::__shared_weak_count *a1)
{
}

uint64_t sub_D348(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_D364(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48LL))( *a1,  *a2,  *(void *)(*a1 + 32LL),  *(void *)(*a1 + 40LL));
}

void *sub_D37C(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void *sub_D388(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

char *NewRTPDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xECu,  0xDEu,  0x95u,  0x74u,  0xFu,  0xE4u,  0x11u,  0xD4u,  0xBBu,  0x1Au,  0,  0x50u,  0xE4u,  0xCEu,  0xA5u,  0x26u);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  unsigned int v4 = (char *)operator new(0xF0uLL);
  sub_D448((uint64_t)v4);
  return v4 + 8;
}

void sub_D434(_Unwind_Exception *a1)
{
}

uint64_t sub_D448(uint64_t a1)
{
  uint64_t v2 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x70u,  0xC9u,  0xC5u,  0xEAu,  0x7Cu,  0x65u,  0x11u,  0xD8u,  0xB3u,  0x17u,  0,  3u,  0x93u,  0xA3u,  0x4Bu,  0x5Au);
  sub_B604(a1, v2);
  *(void *)a1 = off_18C38;
  *(_DWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  sub_47E4(a1 + 152, (uint64_t)"RTPDriver.mErrorListLock");
  return a1;
}

void sub_D4F8(_Unwind_Exception *a1)
{
  unsigned int v4 = (void *)v1[16];
  if (v4)
  {
    v1[17] = v4;
    operator delete(v4);
    int v5 = *v2;
    if (!*v2)
    {
LABEL_3:
      sub_B870(v1);
      _Unwind_Resume(a1);
    }
  }

  else
  {
    int v5 = *v2;
    if (!*v2) {
      goto LABEL_3;
    }
  }

  v1[14] = v5;
  operator delete(v5);
  sub_B870(v1);
  _Unwind_Resume(a1);
}

void *sub_D544(void *a1)
{
  *a1 = off_18C38;
  CFUUIDRef v3 = (uint64_t *)a1[13];
  uint64_t v2 = (uint64_t *)a1[14];
  while (v3 != v2)
  {
    if (*v3)
    {
      unsigned int v4 = (void *)sub_F030(*v3);
      operator delete(v4);
      uint64_t v2 = (uint64_t *)a1[14];
    }

    ++v3;
  }

  sub_4870((uint64_t)(a1 + 19));
  int v5 = (void *)a1[16];
  if (v5)
  {
    a1[17] = v5;
    operator delete(v5);
  }

  size_t v6 = (void *)a1[13];
  if (v6)
  {
    a1[14] = v6;
    operator delete(v6);
  }

  return sub_B870(a1);
}

void sub_D5C8(void *a1)
{
  int v1 = sub_D544(a1);
  operator delete(v1);
}

const void *sub_D5DC(uint64_t a1)
{
  if (MIDIObjectGetDictionaryProperty(*(_DWORD *)(a1 + 100), @"apple.midirtp.addressbook", &outDict)) {
    return 0LL;
  }
  if (outDict)
  {
    CFTypeID v3 = CFGetTypeID(outDict);
    if (v3 == CFDictionaryGetTypeID())
    {
      CFDictionaryRef v4 = outDict;
      if (outDict)
      {
        Value = CFDictionaryGetValue(outDict, @"entries");
        CFRelease(v4);
        return Value;
      }
    }
  }

  return 0LL;
}

void sub_D688(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_D69C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }

  return a1;
}

void sub_D6D4(uint64_t a1, const void *a2)
{
  uint64_t v4 = a1 + 152;
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 16LL))(a1 + 152);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = *(double **)(a1 + 128);
  uint64_t v7 = (double **)(a1 + 128);
  if (*(double **)(a1 + 136) != v8)
  {
    while (*v8 <= Current + -300.0)
    {
      CFRelease(*((CFTypeRef *)v8 + 1));
      v8[1] = 0.0;
      uint64_t v10 = *(void *)(a1 + 128);
      uint64_t v9 = *(void *)(a1 + 136);
      uint64_t v11 = v9 - (v10 + 16);
      if (v9 == v10 + 16)
      {
        uint64_t v8 = *(double **)(a1 + 128);
        *(void *)(a1 + 136) = v9 - 16;
        if (v9 - 16 == v10) {
          break;
        }
      }

      else
      {
        memmove(*(void **)(a1 + 128), (const void *)(v10 + 16), v9 - (v10 + 16));
        uint64_t v8 = *v7;
        *(void *)(a1 + 136) = v10 + v11;
      }
    }
  }

  if (a2)
  {
    CFRetain(a2);
    size_t v13 = *(double **)(a1 + 136);
    unint64_t v12 = *(void *)(a1 + 144);
    if ((unint64_t)v13 >= v12)
    {
      unsigned int v15 = *v7;
      uint64_t v16 = ((char *)v13 - (char *)*v7) >> 4;
      unint64_t v17 = v16 + 1;
      uint64_t v18 = v12 - (void)v15;
      if (v18 >> 3 > v17) {
        unint64_t v17 = v18 >> 3;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19)
      {
        if (v19 >> 60) {
          sub_428C();
        }
        unint64_t v20 = (char *)operator new(16 * v19);
      }

      else
      {
        unint64_t v20 = 0LL;
      }

      unint64_t v21 = &v20[16 * v16];
      *(double *)unint64_t v21 = Current;
      *((void *)v21 + 1) = a2;
      unsigned int v14 = (double *)(v21 + 16);
      if (v13 != v15)
      {
        do
        {
          *((_OWORD *)v21 - 1) = *((_OWORD *)v13 - 1);
          v21 -= 16;
          v13 -= 2;
        }

        while (v13 != v15);
        size_t v13 = *v7;
      }

      *(void *)(a1 + 128) = v21;
      *(void *)(a1 + 136) = v14;
      *(void *)(a1 + 144) = &v20[16 * v19];
      if (v13) {
        operator delete(v13);
      }
    }

    else
    {
      *size_t v13 = Current;
      *((void *)v13 + 1) = a2;
      unsigned int v14 = v13 + 2;
    }

    *(void *)(a1 + 136) = v14;
  }

  Mutable = CFDataCreateMutable(0LL, 0LL);
  for (uint64_t i = *(void *)(a1 + 128); i != *(void *)(a1 + 136); i += 16LL)
  {
    CFDataAppendBytes(Mutable, (const UInt8 *)i, 8LL);
    bzero(buffer, 0x400uLL);
    CFStringGetCString(*(CFStringRef *)(i + 8), buffer, 1024LL, 0x8000100u);
    buffer[1023] = 0;
    *(_WORD *)bytes = strlen(buffer) + 1;
    CFDataAppendBytes(Mutable, bytes, 2LL);
    CFDataAppendBytes(Mutable, (const UInt8 *)buffer, *(unsigned __int16 *)bytes);
  }

  MIDIObjectSetDataProperty(*(_DWORD *)(a1 + 100), @"apple.midirtp.errors", Mutable);
  CFRelease(Mutable);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
}

void sub_D998(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_27D4(exception_object);
}

uint64_t sub_D9E8(uint64_t notifyRefCon, MIDIDeviceListRef devList)
{
  if (!qword_1C090)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleMIDIRTPDriver");
    if (BundleWithIdentifier)
    {
      int v5 = BundleWithIdentifier;
      CFRetain(BundleWithIdentifier);
      qword_1C090 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"BadHostErr",  @"BadHostErr",  @"RTPMIDILocalizable");
      qword_1C098 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"NoConnectResponseErr",  @"NoConnectResponseErr",  @"RTPMIDILocalizable");
      qword_1C0A0 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"RefusedConnectionErr",  @"RefusedConnectionErr",  @"RTPMIDILocalizable");
      qword_1C0A8 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"IncompatibleProtocolErr",  @"IncompatibleProtocolErr",  @"RTPMIDILocalizable");
      qword_1C0B0 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"LostConnectionErr",  @"LostConnectionErr",  @"RTPMIDILocalizable");
      qword_1C0B8 = (uint64_t)CFBundleCopyLocalizedString( v5,  @"NetworkDevice",  @"NetworkDevice",  @"RTPMIDILocalizable");
      CFRelease(v5);
    }
  }

  if (!*(_DWORD *)(notifyRefCon + 96))
  {
    OSStatus v6 = MIDIClientCreate( @"MIDIRTP driver",  (MIDINotifyProc)sub_DF48,  (void *)notifyRefCon,  (MIDIClientRef *)(notifyRefCon + 96));
    if (v6)
    {
      unsigned int v11 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2D94(v15, v11);
        *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
        unint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 155;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDIClientCreate";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
      }

      exception = __cxa_allocate_exception(0x110uLL);
      sub_2AF4((uint64_t)exception, "MIDIClientCreate", v11);
    }
  }

  if (MIDIDeviceListGetNumberOfDevices(devList))
  {
    MIDIObjectRef Device = MIDIDeviceListGetDevice(devList, 0LL);
    *(_DWORD *)(notifyRefCon + 100) = Device;
    if ((byte_1C0C0 & 1) == 0)
    {
      MIDIObjectSetStringProperty(Device, kMIDIPropertyName, (CFStringRef)qword_1C0B8);
      byte_1C0C0 = 1;
    }
  }

  else
  {
    OSStatus v8 = MIDIDeviceCreate( (MIDIDriverRef)(notifyRefCon + 8),  (CFStringRef)qword_1C0B8,  &stru_18F88,  &stru_18F88,  (MIDIDeviceRef *)(notifyRefCon + 100));
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2D94(v15, v8);
        *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
        unint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 167;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDIDeviceCreate";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
      }

      size_t v13 = __cxa_allocate_exception(0x110uLL);
      sub_2AF4((uint64_t)v13, "MIDIDeviceCreate", v8);
    }

    OSStatus v9 = MIDISetupAddDevice(*(_DWORD *)(notifyRefCon + 100));
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2D94(v15, v9);
        *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
        unint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 168;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDISetupAddDevice";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
      }

      unsigned int v14 = __cxa_allocate_exception(0x110uLL);
      sub_2AF4((uint64_t)v14, "MIDISetupAddDevice", v9);
    }
  }

  sub_D6D4(notifyRefCon, 0LL);
  MIDIObjectSetIntegerProperty(*(_DWORD *)(notifyRefCon + 100), kMIDIPropertyOffline, 0);
  MIDIObjectSetIntegerProperty(*(_DWORD *)(notifyRefCon + 100), kMIDIPropertyAdvanceScheduleTimeMuSec, 50000);
  MIDIObjectSetStringProperty( *(_DWORD *)(notifyRefCon + 100),  kMIDIPropertyImage,  @"/System/Library/Audio/MIDI Drivers/AppleMIDIRTPDriver.plugin/Contents/Resources/RTPDriverIcon.tiff");
  sub_E0A0(notifyRefCon);
  return 0LL;
}

void sub_DEA4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    CFTypeID v3 = __cxa_begin_catch(exception_object);
    if (a2 == 2) {
      sub_4BD4((uint64_t)v3);
    }
    __cxa_end_catch();
    JUMPOUT(0xDC10LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_DF48(CFTypeRef *a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (v3 == 4 && *((_DWORD *)a1 + 3) == 1)
    {
      uint64_t v4 = *(uint64_t **)(a2 + 104);
      int v5 = *(uint64_t **)(a2 + 112);
      if (v4 != v5)
      {
        while (1)
        {
          uint64_t v6 = *v4;
          if (*(_DWORD *)(*v4 + 8) == *((_DWORD *)a1 + 2)) {
            break;
          }
          if (++v4 == v5) {
            return;
          }
        }

        if (CFEqual(a1[2], @"apple.midirtp.session")) {
          sub_E3D0(v6);
        }
      }
    }
  }

  else if (*((_DWORD *)a1 + 2) == *(_DWORD *)(a2 + 100))
  {
    if (v3 == 2)
    {
      sub_E0A0(a2);
    }

    else
    {
      OSStatus v8 = *(uint64_t **)(a2 + 104);
      uint64_t v7 = *(uint64_t **)(a2 + 112);
      if (v8 != v7)
      {
        int v9 = *((_DWORD *)a1 + 4);
        uint64_t v10 = *(uint64_t **)(a2 + 104);
        while (1)
        {
          uint64_t v11 = *v10;
          if (*(_DWORD *)(*v10 + 8) == v9) {
            break;
          }
          if (++v10 == v7) {
            return;
          }
        }

        while (*(_DWORD *)(*v8 + 8) != v9)
        {
          if (++v8 == v7) {
            goto LABEL_25;
          }
        }

        uint64_t v12 = (char *)v7 - (char *)(v8 + 1);
        if (v7 != v8 + 1) {
          memmove(v8, v8 + 1, (char *)v7 - (char *)(v8 + 1));
        }
        *(void *)(a2 + 112) = (char *)v8 + v12;
LABEL_25:
        size_t v13 = (void *)sub_F030(v11);
        operator delete(v13);
      }
    }
  }

void sub_E0A0(uint64_t a1)
{
  int v2 = byte_1C0C1;
  if ((byte_1C0C1 & 1) == 0) {
    byte_1C0C1 = 1;
  }
  ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 100));
  if (NumberOfEntities)
  {
    ItemCount v4 = NumberOfEntities;
    ItemCount v5 = 0LL;
    int v32 = v2 ^ 1;
    unsigned __int8 v31 = (char **)(a1 + 104);
    do
    {
      MIDIEntityRef Entity = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 100), v5);
      if (Entity)
      {
        MIDIEntityRef v7 = Entity;
        uint64_t v8 = *(void *)(a1 + 104);
        uint64_t v9 = *(void *)(a1 + 112);
        if (v8 != v9)
        {
          while (*(_DWORD *)(*(void *)v8 + 8LL) != Entity)
          {
            v8 += 8LL;
            if (v8 == v9) {
              goto LABEL_11;
            }
          }

          goto LABEL_6;
        }

LABEL_11:
        uint64_t v10 = operator new(0x50uLL);
        sub_E82C((uint64_t)v10, a1, v7, v32);
        uint64_t v12 = *(char **)(a1 + 112);
        unint64_t v11 = *(void *)(a1 + 120);
        if ((unint64_t)v12 >= v11)
        {
          size_t v13 = *v31;
          uint64_t v14 = v12 - *v31;
          uint64_t v15 = v14 >> 3;
          unint64_t v16 = (v14 >> 3) + 1;
          if (v16 >> 61) {
            sub_A7C4();
          }
          uint64_t v17 = v11 - (void)v13;
          if (v17 >> 2 > v16) {
            unint64_t v16 = v17 >> 2;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            if (v18 >> 61) {
              sub_428C();
            }
            int v19 = operator new(8 * v18);
            __int16 v20 = &v19[8 * v15];
            *__int16 v20 = v10;
            uint64_t v21 = (uint64_t)(v20 + 1);
            if (v12 == v13)
            {
LABEL_21:
              *(void *)(a1 + 104) = v20;
              *(void *)(a1 + 112) = v21;
              *(void *)(a1 + 120) = &v19[8 * v18];
              if (v12) {
                goto LABEL_22;
              }
              goto LABEL_23;
            }
          }

          else
          {
            int v19 = 0LL;
            __int16 v20 = (void *)(8 * v15);
            *(void *)(8 * v15) = v10;
            uint64_t v21 = 8 * v15 + 8;
            if (v12 == v13) {
              goto LABEL_21;
            }
          }

          unint64_t v22 = v12 - 8 - v13;
          if (v22 < 0x58) {
            goto LABEL_37;
          }
          uint64_t v23 = (v22 >> 3) + 1;
          uint64_t v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
          int v25 = &v12[-v24];
          __int16 v20 = (void *)((char *)v20 - v24);
          uint64_t v26 = &v19[8 * v15 - 16];
          unint64_t v27 = v12 - 16;
          uint64_t v28 = v23 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            __int128 v29 = *(_OWORD *)v27;
            *(v26 - 1) = *((_OWORD *)v27 - 1);
            *uint64_t v26 = v29;
            v26 -= 2;
            v27 -= 32;
            v28 -= 4LL;
          }

          while (v28);
          uint64_t v12 = v25;
          if (v23 != (v23 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_37:
            do
            {
              uint64_t v30 = *((void *)v12 - 1);
              v12 -= 8;
              *--__int16 v20 = v30;
            }

            while (v12 != v13);
          }

          uint64_t v12 = *v31;
          *(void *)(a1 + 104) = v20;
          *(void *)(a1 + 112) = v21;
          *(void *)(a1 + 120) = &v19[8 * v18];
          if (v12) {
LABEL_22:
          }
            operator delete(v12);
LABEL_23:
          *(void *)(a1 + 112) = v21;
          goto LABEL_6;
        }

        *(void *)uint64_t v12 = v10;
        *(void *)(a1 + 112) = v12 + 8;
      }

        unint64_t v16 = sub_10A2C((unint64_t)v11, a2);
        if ((v17 & 1) == 0)
        {
LABEL_14:
          sub_10398(a1, v16, a3, a4, a5 & 1);
          a5 = 0;
          unint64_t v11 = (CFStringRef *)(v16 + 1);
          continue;
        }

        unint64_t v18 = sub_10B3C(v11, v16);
        unint64_t v11 = (CFStringRef *)(v16 + 1);
        if (!sub_10B3C((CFStringRef *)v16 + 2, (__int128 *)a2))
        {
          uint64_t v12 = a4 - 1;
          if (v18) {
            goto LABEL_3;
          }
          goto LABEL_14;
        }

        a2 = (CFStringRef *)v16;
        if (!v18) {
          goto LABEL_1;
        }
        return;
    }
  }

LABEL_6:
      ++v5;
    }

    while (v5 != v4);
  }

void sub_E324(_Unwind_Exception *a1)
{
}

uint64_t sub_E338(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    sub_88E4(a4, a2, 0);
  }
  return 0LL;
}

uint64_t sub_E374(void *a1, int a2)
{
  int v3 = (unsigned int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    ItemCount v4 = v3;
    sub_4BD4((uint64_t)v3);
    uint64_t v5 = v4[66];
    __cxa_end_catch();
    return v5;
  }

  else
  {
    __cxa_end_catch();
    return 0xFFFFFFFFLL;
  }

void sub_E3BC(_Unwind_Exception *a1)
{
}

void sub_E3D0(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1C0D0);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
  {
    qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_1C0D0);
  }

  int v3 = (os_log_s *)qword_1C0C8;
  if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
    *(void *)&uint8_t buf[4] = "RTPDriver.cpp";
    *(_WORD *)&_BYTE buf[12] = 1024;
    *(_DWORD *)&buf[14] = 418;
    *(_WORD *)&_BYTE buf[18] = 2112;
    *(void *)&buf[20] = v4;
    __int16 v31 = 1024;
    int v32 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): EntityInfoPropertyChanged", buf, 0x22u);
  }

  memset(buf, 0, 24);
  if (!MIDIObjectGetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", &outDict))
  {
    uint64_t v6 = outDict;
    CFTypeRef cf = outDict;
    __int16 v28 = 257;
    if (outDict
      && (MIDIEntityRef v7 = (const __CFNumber *)CFDictionaryGetValue(outDict, @"flags"), v8 = v7, LODWORD(valuePtr) = 0, v7)
      && (CFTypeID v9 = CFGetTypeID(v7), v9 == CFNumberGetTypeID())
      && (CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr), (valuePtr & 1) != 0))
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"port");
      __int16 v20 = Value;
      LODWORD(valuePtr) = 0;
      if (Value && (CFTypeID v21 = CFGetTypeID(Value), v21 == CFNumberGetTypeID()))
      {
        CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
        unsigned __int16 v22 = (unsigned __int16)valuePtr;
        uint64_t v23 = *(void *)(a1 + 72);
      }

      else
      {
        unsigned __int16 v22 = 0;
      }

      sub_ED3C(a1, v22, 0);
      CFTypeRef valuePtr = 0LL;
      unsigned __int8 v25 = 1;
    }

    else
    {
      sub_F0A0(a1);
      CFTypeRef valuePtr = 0LL;
      unsigned __int8 v25 = 1;
      if (!v6)
      {
LABEL_25:
        sub_F25C(a1, (const __CFDictionary **)&cf, (uint64_t)buf);
        DeepCopy = (const __CFDictionary *)CFPropertyListCreateDeepCopy(0LL, outDict, 1uLL);
        if (*(_BYTE *)(a1 + 64))
        {
          uint64_t v17 = *(const void **)(a1 + 56);
          if (v17) {
            CFRelease(v17);
          }
        }

        *(void *)(a1 + 56) = DeepCopy;
        *(_BYTE *)(a1 + 65) = 1;
        uint64_t v18 = *(void *)&buf[8];
        if (*(void *)&buf[8] != *(void *)buf)
        {
          if (DeepCopy)
          {
            DeepCopy = (const __CFDictionary *)CFDictionaryGetValue(DeepCopy, @"peers");
            uint64_t v18 = *(void *)&buf[8];
          }

          do
          {
            CFArrayRemoveValueAtIndex(DeepCopy, *(int *)(v18 - 4));
            uint64_t v18 = *(void *)&buf[8] - 4LL;
            *(void *)&buf[8] = v18;
          }

          while (v18 != *(void *)buf);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), @"peers", DeepCopy);
          MIDIObjectSetDictionaryProperty( *(_DWORD *)(a1 + 8),  @"apple.midirtp.session",  *(CFDictionaryRef *)(a1 + 56));
        }

        if (v25 && valuePtr) {
          CFRelease(valuePtr);
        }
        if ((_BYTE)v28 && cf) {
          CFRelease(cf);
        }
        goto LABEL_5;
      }
    }

    if (CFDictionaryContainsKey(v6, @"dns-sd-name"))
    {
      uint64_t v10 = CFDictionaryGetValue(v6, @"dns-sd-name");
      unint64_t v11 = v10;
      CFTypeRef valuePtr = v10;
      char v26 = 0;
      if (v10) {
        CFRetain(v10);
      }
      if (!CFEqual(v11, *(CFTypeRef *)(a1 + 40)))
      {
        if (*(_BYTE *)(a1 + 48))
        {
          uint64_t v12 = *(const void **)(a1 + 40);
          if (v12) {
            CFRelease(v12);
          }
        }

        CFTypeRef v13 = valuePtr;
        *(void *)(a1 + 40) = valuePtr;
        int v14 = v25;
        *(_BYTE *)(a1 + 48) = v25;
        *(_BYTE *)(a1 + 49) = v26;
        if (v14 && v13) {
          CFRetain(v13);
        }
        uint64_t v15 = *(void *)(a1 + 72);
        if (v15) {
          sub_6388(v15, *(const __CFString **)(a1 + 40));
        }
      }
    }

    goto LABEL_25;
  }

LABEL_5:
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

void sub_E7B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_E824()
{
  return 0LL;
}

uint64_t sub_E82C(uint64_t a1, uint64_t a2, MIDIEntityRef a3, int a4)
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  *(void *)(a1 + 24) = 0LL;
  MIDIEntityRef v7 = (CFTypeRef *)(a1 + 24);
  *(_BYTE *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v8 = (CFTypeRef *)(a1 + 40);
  *(_BYTE *)(a1 + 48) = 1;
  CFTypeID v9 = (CFDictionaryRef *)(a1 + 56);
  *(void *)(a1 + 56) = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  *(_WORD *)(a1 + 64) = 257;
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 12) = MIDIEntityGetSource(a3, 0LL);
  *(_DWORD *)(a1 + 16) = MIDIEntityGetDestination(a3, 0LL);
  CFStringRef str = 0LL;
  MIDIObjectGetStringProperty(a3, kMIDIPropertyName, &str);
  CFStringRef v10 = str;
  if (str)
  {
    if (!*(_BYTE *)(a1 + 32))
    {
      *(void *)(a1 + 24) = str;
      *(_BYTE *)(a1 + 33) = 0;
      goto LABEL_9;
    }

    if (*v7)
    {
      CFRelease(*v7);
      int v11 = *(unsigned __int8 *)(a1 + 32);
      *(void *)(a1 + 24) = v10;
      *(_BYTE *)(a1 + 33) = 0;
      if (!v11) {
        goto LABEL_9;
      }
    }

    else
    {
      *(void *)(a1 + 24) = str;
      *(_BYTE *)(a1 + 33) = 0;
    }

    CFRetain(v10);
  }

void sub_EB70(_Unwind_Exception *a1)
{
}

void sub_EBC8(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1C0D0);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
  {
    qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_1C0D0);
  }

  uint64_t v3 = (os_log_s *)qword_1C0C8;
  if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)propertyList = 136315906;
    *(void *)&propertyList[4] = "RTPDriver.cpp";
    __int16 v9 = 1024;
    int v10 = 350;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): LoadState:", propertyList, 0x22u);
  }

  if (!MIDIObjectGetDictionaryProperty( *(_DWORD *)(a1 + 8),  @"apple.midirtp.session",  (CFDictionaryRef *)propertyList))
  {
    CFPropertyListRef DeepCopy = CFPropertyListCreateDeepCopy(0LL, *(CFPropertyListRef *)propertyList, 1uLL);
    if (*(_BYTE *)(a1 + 64))
    {
      MIDIEntityRef v7 = *(const void **)(a1 + 56);
      if (v7) {
        CFRelease(v7);
      }
    }

    *(void *)(a1 + 56) = DeepCopy;
    *(_BYTE *)(a1 + 65) = 1;
    CFRelease(*(CFTypeRef *)propertyList);
  }

void sub_ED3C(uint64_t a1, unsigned __int16 a2, int a3)
{
  if (!*(void *)(a1 + 72))
  {
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)&qword_1C0D0);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
    {
      qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
      __cxa_guard_release(&qword_1C0D0);
    }

    MIDIEntityRef v7 = (os_log_s *)qword_1C0C8;
    if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 24);
      int v9 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)int v15 = 136315906;
      *(void *)&v15[4] = "RTPDriver.cpp";
      __int16 v16 = 1024;
      int v17 = 376;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): Session starting", v15, 0x22u);
    }

    MIDIObjectRemoveProperty(*(_DWORD *)(a1 + 8), kMIDIPropertyMaxSysExSpeed);
    int v10 = operator new(0x6A0uLL);
    sub_4CC8((uint64_t)v10);
    *int v10 = off_18CA8;
    v10[211] = a1;
    *(void *)(a1 + 72) = v10;
    sub_582C((uint64_t)v10, *(const void **)(a1 + 40), a2);
    MIDIEndpointSetRefCons(*(_DWORD *)(a1 + 16), *(void **)(a1 + 72), *(void **)(a1 + 72));
    if (a3)
    {
      __int16 v11 = *(const __CFDictionary **)(a1 + 56);
      if (v11)
      {
        Value = (const __CFArray *)CFDictionaryGetValue(v11, @"persistent-peers");
        __int16 v13 = Value;
        if (Value)
        {
          if (CFArrayGetCount(Value))
          {
            MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, *(CFDictionaryRef *)(a1 + 56));
            *(void *)int v15 = MutableCopy;
            *(_WORD *)&v15[8] = 257;
            CFDictionarySetValue(MutableCopy, @"peers", v13);
            MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", MutableCopy);
            if (MutableCopy) {
              CFRelease(MutableCopy);
            }
          }
        }
      }
    }
  }

void sub_EF44(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_27D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_EFF8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    unsigned __int8 v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }

  return a1;
}

uint64_t sub_F030(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    unsigned __int8 v2 = *(const void **)(a1 + 56);
    if (v2) {
      CFRelease(v2);
    }
  }

  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = *(const void **)(a1 + 40);
    if (v3) {
      CFRelease(v3);
    }
  }

  if (*(_BYTE *)(a1 + 32))
  {
    uint64_t v4 = *(const void **)(a1 + 24);
    if (v4) {
      CFRelease(v4);
    }
  }

  return a1;
}

void sub_F0A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    sub_5440(v2);
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
    }
    *(void *)(a1 + 72) = 0LL;
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_1C0D0);
    if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
    {
      qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
      __cxa_guard_release(&qword_1C0D0);
    }

    int v5 = (os_log_s *)qword_1C0C8;
    if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 24);
      int v7 = *(_DWORD *)(a1 + 8);
      int v8 = 136315906;
      int v9 = "RTPDriver.cpp";
      __int16 v10 = 1024;
      int v11 = 410;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): Session ended", (uint8_t *)&v8, 0x22u);
    }
  }

void sub_F238(_Unwind_Exception *a1)
{
}

void sub_F244(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0xF24CLL);
  }
  sub_27D4(a1);
}

void sub_F25C(uint64_t a1, const __CFDictionary **a2, uint64_t a3)
{
  if (!*(void *)(a1 + 72)) {
    return;
  }
  uint64_t v6 = *(const __CFDictionary **)(a1 + 56);
  if (v6)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(v6, @"peers");
    int v8 = *a2;
    if (*a2)
    {
LABEL_4:
      int v9 = CFDictionaryGetValue(v8, @"peers");
      goto LABEL_7;
    }
  }

  else
  {
    Value = 0LL;
    int v8 = *a2;
    if (*a2) {
      goto LABEL_4;
    }
  }

  int v9 = 0LL;
LABEL_7:
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFArrayRef v37 = Mutable;
  __int16 v38 = 257;
  CFTypeRef cf = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  __int16 v36 = 257;
  if (!Value)
  {
    Value = Mutable;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  CFArrayRef v37 = Value;
  HIBYTE(v38) = 0;
  CFRetain(Value);
  if (v9)
  {
LABEL_13:
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef cf = v9;
    HIBYTE(v36) = 0;
    CFRetain(v9);
  }

LABEL_16:
  sub_F7C8((CFStringRef **)&v33, &v37);
  sub_F7C8((CFStringRef **)&__p, (CFArrayRef *)&cf);
  uint64_t v30 = Value;
  v51[0] = &off_18D00;
  v51[1] = a1;
  __int128 v52 = v51;
  int v11 = operator new(0x20uLL);
  void *v11 = &off_18D48;
  v11[1] = a1;
  __int16 v12 = v11 + 1;
  v11[2] = &cf;
  v11[3] = a3;
  unint64_t v50 = v11;
  int64_t v46 = &off_18D90;
  *(void *)&__int128 v47 = a1;
  *((void *)&v47 + 1) = &cf;
  unsigned int v48 = &v46;
  uint64_t v13 = v33;
  unint64_t v14 = (unint64_t)v34;
  int v15 = (CFStringRef *)__p;
  unint64_t v16 = (unint64_t)v32;
  int v45 = v44;
  v44[0] = &off_18D00;
  v44[1] = a1;
  int v17 = (char *)operator new(0x20uLL);
  *(void *)int v17 = &off_18D48;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)v12;
  *((void *)v17 + 3) = v12[2];
  int v43 = v17;
  unint64_t v41 = &v39;
  unsigned int v39 = &off_18D90;
  __int128 v40 = v47;
  sub_F9E0((uint64_t)v13, v14, v15, v16, (uint64_t)v44, (uint64_t)v42, (uint64_t)&v39);
  __int16 v18 = v41;
  if (v41 == &v39)
  {
    uint64_t v19 = 4LL;
    __int16 v18 = &v39;
  }

  else
  {
    if (!v41) {
      goto LABEL_21;
    }
    uint64_t v19 = 5LL;
  }

  (*v18)[v19]();
LABEL_21:
  __int16 v20 = v43;
  if (v43 == v42)
  {
    uint64_t v21 = 4LL;
    __int16 v20 = v42;
  }

  else
  {
    if (!v43) {
      goto LABEL_26;
    }
    uint64_t v21 = 5LL;
  }

  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_26:
  CFTypeID v22 = v45;
  if (v45 == v44)
  {
    uint64_t v23 = 4LL;
    CFTypeID v22 = v44;
  }

  else
  {
    if (!v45) {
      goto LABEL_31;
    }
    uint64_t v23 = 5LL;
  }

  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_31:
  uint64_t v24 = v48;
  if (v48 == &v46)
  {
    uint64_t v25 = 4LL;
    uint64_t v24 = &v46;
  }

  else
  {
    if (!v48) {
      goto LABEL_36;
    }
    uint64_t v25 = 5LL;
  }

  (*v24)[v25]();
LABEL_36:
  char v26 = v50;
  if (v50 == v49)
  {
    uint64_t v27 = 4LL;
    char v26 = v49;
  }

  else
  {
    if (!v50) {
      goto LABEL_41;
    }
    uint64_t v27 = 5LL;
  }

  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_41:
  __int16 v28 = v52;
  if (v52 == v51)
  {
    uint64_t v29 = 4LL;
    __int16 v28 = v51;
    goto LABEL_45;
  }

  if (v52)
  {
    uint64_t v29 = 5LL;
LABEL_45:
    (*(void (**)(void))(*v28 + 8 * v29))();
  }

  if (__p)
  {
    int v32 = __p;
    operator delete(__p);
  }

  if (v33)
  {
    double v34 = v33;
    operator delete(v33);
  }

  if ((_BYTE)v36 && cf) {
    CFRelease(cf);
  }
  if (v30) {
    CFRelease(v30);
  }
}

void sub_F60C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36)
{
  if (a2) {
    sub_27D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_F7C8(CFStringRef **a1, CFArrayRef *a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  int Count = CFArrayGetCount(*a2);
  if (Count >= 1)
  {
    int v5 = 0LL;
    CFIndex v6 = 0LL;
    uint64_t v7 = Count;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*a2, v6);
      if (!ValueAtIndex || (Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"address")) == 0LL) {
        Value = &stru_18F88;
      }
      __int16 v10 = a1[2];
      if (v5 < v10)
      {
        CFStringRef *v5 = Value;
        *((_DWORD *)v5 + 2) = v6;
        v5 += 2;
      }

      else
      {
        int v11 = *a1;
        uint64_t v12 = ((char *)v5 - (char *)*a1) >> 4;
        unint64_t v13 = v12 + 1;
        uint64_t v14 = (char *)v10 - (char *)v11;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          if (v15 >> 60) {
            sub_428C();
          }
          unint64_t v16 = (char *)operator new(16 * v15);
          uint64_t v17 = (uint64_t)&v16[16 * v12];
          *(void *)uint64_t v17 = Value;
          *(_DWORD *)(v17 + 8) = v6;
          if (v5 != v11)
          {
LABEL_18:
            uint64_t v18 = v17;
            do
            {
              *(_OWORD *)(v18 - 16) = *((_OWORD *)v5 - 1);
              v18 -= 16LL;
              v5 -= 2;
            }

            while (v5 != v11);
            uint64_t v19 = *a1;
            int v5 = (CFStringRef *)(v17 + 16);
            *a1 = (CFStringRef *)v18;
            a1[1] = (CFStringRef *)(v17 + 16);
            a1[2] = (CFStringRef *)&v16[16 * v15];
            if (!v19) {
              goto LABEL_4;
            }
LABEL_24:
            operator delete(v19);
            goto LABEL_4;
          }
        }

        else
        {
          unint64_t v16 = 0LL;
          uint64_t v17 = 16 * v12;
          *(void *)uint64_t v17 = Value;
          *(_DWORD *)(v17 + 8) = v6;
          if (v5 != v11) {
            goto LABEL_18;
          }
        }

        uint64_t v19 = v5;
        int v5 = (CFStringRef *)(v17 + 16);
        *a1 = (CFStringRef *)v17;
        a1[1] = (CFStringRef *)(v17 + 16);
        a1[2] = (CFStringRef *)&v16[16 * v15];
        if (v19) {
          goto LABEL_24;
        }
      }

void sub_F9BC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_F9E0( uint64_t result, unint64_t a2, CFStringRef *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v13 = (CFStringRef *)result;
  while ((unint64_t)v13 < a2)
  {
    if ((unint64_t)a3 >= a4 || (CFStringCompare(*v13, *a3, 0LL) & 0x80000000) != 0)
    {
      uint64_t v18 = v13;
      uint64_t v14 = *(void *)(a5 + 24);
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, CFStringRef **))(*(void *)v14 + 48LL))(v14, &v18);
      v13 += 2;
    }

    else if ((CFStringCompare(*a3, *v13, 0LL) & 0x80000000) != 0)
    {
LABEL_12:
      uint64_t v18 = a3;
      uint64_t v16 = *(void *)(a6 + 24);
      if (!v16) {
LABEL_14:
      }
        sub_42B4();
      uint64_t result = (*(uint64_t (**)(uint64_t, CFStringRef **))(*(void *)v16 + 48LL))(v16, &v18);
      a3 += 2;
    }

    else
    {
      uint64_t v17 = a3;
      uint64_t v18 = v13;
      uint64_t v15 = *(void *)(a7 + 24);
      if (!v15) {
        goto LABEL_14;
      }
      v13 += 2;
      uint64_t result = (*(uint64_t (**)(uint64_t, CFStringRef **, CFStringRef **))(*(void *)v15 + 48LL))( v15,  &v18,  &v17);
      a3 += 2;
    }
  }

  return result;
}

uint64_t sub_FAF0(uint64_t result, const void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    if (*(_BYTE *)(result + 48))
    {
      unsigned __int8 v4 = *(const void **)(result + 40);
      if (v4)
      {
        CFRelease(v4);
        int v5 = *(unsigned __int8 *)(v3 + 48);
        *(void *)(v3 + 40) = a2;
        *(_BYTE *)(v3 + 49) = 0;
        if (!v5) {
          goto LABEL_10;
        }
      }

      else
      {
        *(void *)(v3 + 40) = a2;
        *(_BYTE *)(v3 + 49) = 0;
      }

      CFRetain(a2);
    }

    else
    {
      *(void *)(result + 40) = a2;
      *(_BYTE *)(result + 49) = 0;
    }

LABEL_10:
    sub_EBC8(v3);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 56), @"dns-sd-name", a2);
    return MIDIObjectSetDictionaryProperty( *(_DWORD *)(v3 + 8),  @"apple.midirtp.session",  *(CFDictionaryRef *)(v3 + 56));
  }

  return result;
}

  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  CFIndex v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  CFDictionaryRef v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    uint64_t v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    int v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    int v11 = *a2;
    __int16 v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    void *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
    goto LABEL_16;
  }

  uint64_t v7 = 0LL;
  uint64_t result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v14 = (uint64_t **)v7[2];
    if (*v14 == v7) {
      break;
    }
    if (*((_BYTE *)v7 + 24))
    {
      uint64_t v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }

    else
    {
      *((_BYTE *)v7 + 24) = 1;
      *((_BYTE *)v14 + 24) = 0;
      uint64_t v17 = v14[1];
      uint64_t v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18) {
        v18[2] = (uint64_t)v14;
      }
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
      *uint64_t v17 = (uint64_t)v14;
      sockaddr v14[2] = v17;
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
      uint64_t v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }

    if (!*((_BYTE *)v15 + 24))
    {
      uint64_t v19 = (uint64_t *)v7[1];
      if (!v19) {
        goto LABEL_64;
      }
LABEL_63:
      if (*((_BYTE *)v19 + 24))
      {
LABEL_64:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        char v23 = v15[1];
        os_log_s *v7 = v23;
        if (v23) {
          *(void *)(v23 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        _DWORD v7[2] = (uint64_t)v15;
        uint64_t v19 = v7;
      }

      else
      {
        uint64_t v15 = v7;
      }

      uint64_t v27 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v27 + 24);
      *(_BYTE *)(v27 + 24) = 1;
      *((_BYTE *)v19 + 24) = 1;
      __int16 v28 = *(uint64_t **)(v27 + 8);
      uint64_t v29 = *v28;
      *(void *)(v27 + 8) = *v28;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8LL * (**(void **)(v27 + 16) != v27)) = v28;
      void *v28 = v27;
      *(void *)(v27 + 16) = v28;
      return result;
    }

uint64_t sub_FB88(uint64_t a1, const MIDIPacketList *a2)
{
  return MIDIReceived(*(_DWORD *)(*(void *)(a1 + 1688) + 12LL), a2);
}

BOOL sub_FB94(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFIndex v6 = *(const __CFDictionary **)(a1 + 56);
  if (v6)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"join-policy");
    *(_DWORD *)int valuePtr = 0;
    if (Value)
    {
      int v8 = Value;
      CFTypeID v9 = CFGetTypeID(Value);
      if (v9 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v8, kCFNumberSInt32Type, valuePtr);
        if (*(_DWORD *)valuePtr == 1)
        {
          unsigned __int8 v16 = atomic_load((unsigned __int8 *)&qword_1C0D0);
          if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
          {
            qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
            __cxa_guard_release(&qword_1C0D0);
          }

          uint64_t v17 = (os_log_s *)qword_1C0C8;
          if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int valuePtr = 136315906;
            *(void *)&valuePtr[4] = "RTPDriver.cpp";
            __int16 v42 = 1024;
            int v43 = 631;
            __int16 v44 = 2112;
            int v45 = a2;
            __int16 v46 = 2112;
            __int128 v47 = a3;
            _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Join policy is kRTPJoinPolicy_UsersInDirectory: Looking up %@ %@",  valuePtr,  0x26u);
          }

          sub_3914(&stru_18F88, a3, &v31);
          sub_3238((uint64_t)&v31, valuePtr, 0x100uLL);
          uint64_t v18 = (const __CFArray *)sub_D5DC(*(void *)a1);
          uint64_t v19 = v18;
          if (v18)
          {
            int Count = CFArrayGetCount(v18);
            if (Count >= 1)
            {
              CFIndex v20 = 0LL;
              BOOL v21 = 1;
              while (1)
              {
                ValueAtIndex = CFArrayGetValueAtIndex(v19, v20);
                unsigned __int8 v23 = atomic_load((unsigned __int8 *)&qword_1C0D0);
                if ((v23 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
                {
                  qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
                  __cxa_guard_release(&qword_1C0D0);
                }

                uint64_t v24 = (os_log_s *)qword_1C0C8;
                if (os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)CFRunLoopTimerContext buf = 136316162;
                  *(void *)&uint8_t buf[4] = "RTPDriver.cpp";
                  __int16 v33 = 1024;
                  int v34 = 651;
                  __int16 v35 = 1024;
                  int v36 = v20;
                  __int16 v37 = 1024;
                  int v38 = Count;
                  __int16 v39 = 2112;
                  __int128 v40 = ValueAtIndex;
                  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d   Address Book entry %d/%d: %@", buf, 0x28u);
                }

                if (ValueAtIndex)
                {
                  CFTypeID v25 = CFGetTypeID(ValueAtIndex);
                  if (v25 == CFDictionaryGetTypeID())
                  {
                    char v26 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"address");
                    uint64_t v27 = v26;
                    if (v26)
                    {
                      CFTypeID v28 = CFGetTypeID(v26);
                      if (v28 == CFStringGetTypeID())
                      {
                        sub_3914(&stru_18F88, v27, &v30);
                        sub_3238((uint64_t)&v30, buf, 0x100uLL);
                        if ((sub_3E10(&v30.sa_len, &v31.sa_len) & 1) != 0) {
                          break;
                        }
                      }
                    }
                  }
                }

                BOOL v21 = ++v20 < Count;
                if (Count == v20) {
                  return 0LL;
                }
              }

              if (v21) {
                goto LABEL_6;
              }
            }
          }

          return 0LL;
        }

        if (*(_DWORD *)valuePtr == 2)
        {
LABEL_6:
          CFMutableArrayRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          *(void *)int valuePtr = Mutable;
          *(_WORD *)&valuePtr[8] = 257;
          if (CFStringGetLength(a2)) {
            int v11 = a2;
          }
          else {
            int v11 = a3;
          }
          CFDictionarySetValue(Mutable, @"name", v11);
          CFDictionarySetValue(Mutable, @"address", a3);
          sub_EBC8(a1);
          uint64_t v12 = *(const __CFDictionary **)(a1 + 56);
          if (v12) {
            uint64_t v12 = (const __CFDictionary *)CFDictionaryGetValue(v12, @"peers");
          }
          *(void *)CFRunLoopTimerContext buf = v12;
          *(_WORD *)&buf[8] = 256;
          CFArrayAppendValue(v12, Mutable);
          MIDIObjectSetDictionaryProperty( *(_DWORD *)(a1 + 8),  @"apple.midirtp.session",  *(CFDictionaryRef *)(a1 + 56));
          if (Mutable) {
            CFRelease(Mutable);
          }
          return 1LL;
        }
      }
    }
  }

  unsigned __int8 v14 = atomic_load((unsigned __int8 *)&qword_1C0D0);
  if ((v14 & 1) == 0 && __cxa_guard_acquire(&qword_1C0D0))
  {
    qword_1C0C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_1C0D0);
  }

  uint64_t v15 = (os_log_s *)qword_1C0C8;
  BOOL result = os_log_type_enabled((os_log_t)qword_1C0C8, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    *(_DWORD *)int valuePtr = 136315906;
    *(void *)&valuePtr[4] = "RTPDriver.cpp";
    __int16 v42 = 1024;
    int v43 = 627;
    __int16 v44 = 2112;
    int v45 = a2;
    __int16 v46 = 2112;
    __int128 v47 = a3;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d Join policy is kRTPJoinPolicy_NoOne: %@ %@ is not allowed to connect",  valuePtr,  0x26u);
    return 0LL;
  }

  return result;
}

void sub_100D0(_Unwind_Exception *a1)
{
}

void sub_100DC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_27D4(a1);
  }
  _Unwind_Resume(a1);
}

void sub_100EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

void sub_10100(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      unsigned __int8 v4 = v3;
      sub_4BD4((uint64_t)v3);
      int v5 = v4[66];
      __cxa_end_catch();
      if (!v5) {
        JUMPOUT(0xFE54LL);
      }
    }

    else
    {
      __cxa_end_catch();
    }

    JUMPOUT(0xFD6CLL);
  }

  _Unwind_Resume(a1);
}

void sub_1013C(_Unwind_Exception *a1)
{
}

void sub_10148(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x100E4LL);
}

void sub_10154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

void sub_10170( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

CFIndex sub_10190(uint64_t a1, const void *a2)
{
  unsigned __int8 v4 = *(const __CFDictionary **)(a1 + 56);
  if (v4) {
    Value = (const __CFArray *)CFDictionaryGetValue(v4, @"peers");
  }
  else {
    Value = 0LL;
  }
  CFIndex result = CFArrayGetCount(Value);
  if ((int)result >= 1)
  {
    CFIndex v7 = 0LL;
    uint64_t v8 = result;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v7);
      if (!ValueAtIndex || (__int16 v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"address")) == 0LL) {
        __int16 v10 = &stru_18F88;
      }
      CFIndex result = CFEqual(v10, a2);
      if ((_DWORD)result) {
        break;
      }
      if (v8 == ++v7) {
        return result;
      }
    }

    CFArrayRemoveValueAtIndex(Value, v7);
    return MIDIObjectSetDictionaryProperty( *(_DWORD *)(a1 + 8),  @"apple.midirtp.session",  *(CFDictionaryRef *)(a1 + 56));
  }

  return result;
}

void sub_10284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10298( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_102AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_102C0(uint64_t a1, const void *a2)
{
}

void sub_102D0(uint64_t a1)
{
  uint64_t v1 = (void *)sub_5280(a1);
  operator delete(v1);
}

uint64_t sub_102E4(uint64_t a1, const void *a2)
{
  return sub_FAF0(*(void *)(a1 + 1688), a2);
}

BOOL sub_102EC(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return sub_FB94(*(void *)(a1 + 1688), a2, a3);
}

CFIndex sub_102F4(uint64_t a1, const void *a2)
{
  return sub_10190(*(void *)(a1 + 1688), a2);
}

uint64_t sub_102FC(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 1688);
  sub_EBC8(v3);
  int valuePtr = a2;
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 56), @"port", v4);
  CFRelease(v4);
  return MIDIObjectSetDictionaryProperty( *(_DWORD *)(v3 + 8),  @"apple.midirtp.session",  *(CFDictionaryRef *)(v3 + 56));
}

uint64_t sub_10374(uint64_t a1, SInt32 value)
{
  MIDIObjectRef v2 = *(_DWORD *)(*(void *)(a1 + 1688) + 8LL);
  if (value) {
    return MIDIObjectSetIntegerProperty(v2, kMIDIPropertyMaxSysExSpeed, value);
  }
  else {
    return MIDIObjectRemoveProperty(v2, kMIDIPropertyMaxSysExSpeed);
  }
}

void sub_10398(CFStringRef *a1, CFStringRef *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  __int16 v10 = a2 - 2;
  int v11 = a1;
  while (2)
  {
    uint64_t v12 = a4 - 1;
LABEL_3:
    a1 = v11;
    uint64_t v13 = (char *)a2 - (char *)v11;
    unint64_t v14 = ((char *)a2 - (char *)v11) >> 4;
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((CFStringCompare(*v10, *v11, 0LL) & 0x80000000) != 0)
        {
          __int128 v41 = *(_OWORD *)v11;
          *(_OWORD *)int v11 = *(_OWORD *)v10;
          *(_OWORD *)__int16 v10 = v41;
        }

        return;
      case 3uLL:
        sub_107BC(v11, v11 + 2, a2 - 2);
        return;
      case 4uLL:
        sub_10CF4(v11, v11 + 2, v11 + 4, a2 - 2);
        return;
      case 5uLL:
        sub_10DA0(v11, v11 + 2, v11 + 4, v11 + 6, a2 - 2);
        return;
      default:
        if (v13 <= 383)
        {
          uint64_t v19 = v11 + 2;
          BOOL v21 = v11 == a2 || v19 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v21)
            {
              uint64_t v22 = 0LL;
              unsigned __int8 v23 = v11;
              do
              {
                if ((CFStringCompare(*v19, *v23, 0LL) & 0x80000000) != 0)
                {
                  unint64_t v25 = 0LL;
                  char v26 = *v19;
                  uint64_t v27 = v23[3];
                  do
                  {
                    CFTypeID v28 = &v23[v25 / 8];
                    *(_OWORD *)&v23[v25 / 8 + 2] = *(_OWORD *)&v23[v25 / 8];
                    if (v22 == v25)
                    {
                      uint64_t v24 = v11;
                      goto LABEL_34;
                    }

                    v25 -= 16LL;
                  }

                  while ((CFStringCompare(v26, *(v28 - 2), 0LL) & 0x80000000) != 0);
                  uint64_t v24 = &v19[v25 / 8];
LABEL_34:
                  CFStringRef *v24 = v26;
                  v24[1] = v27;
                }

                v19 += 2;
                v22 -= 16LL;
                v23 += 2;
              }

              while (v19 != a2);
            }
          }

          else if (!v21)
          {
            do
            {
              int v34 = v19;
              if ((CFStringCompare(a1[2], *a1, 0LL) & 0x80000000) != 0)
              {
                __int16 v35 = *v19;
                int v36 = a1[3];
                __int16 v37 = v19;
                do
                {
                  int v38 = v37 - 2;
                  *(_OWORD *)__int16 v37 = *((_OWORD *)v37 - 1);
                  int v39 = CFStringCompare(v35, *(v37 - 4), 0LL);
                  __int16 v37 = v38;
                }

                while (v39 < 0);
                *int v38 = v35;
                v38[1] = v36;
              }

              uint64_t v19 = v34 + 2;
              a1 = v34;
            }

            while (v34 + 2 != a2);
          }

          return;
        }

        a4 = v12;
        if (v12 == -1)
        {
          if (v11 != a2)
          {
            unint64_t v29 = (v14 - 2) >> 1;
            unint64_t v30 = v29 + 1;
            sockaddr v31 = &v11[2 * v29];
            do
            {
              sub_10E7C((CFComparisonResult)v11, a3, ((char *)a2 - (char *)v11) >> 4, v31);
              v31 -= 2;
              --v30;
            }

            while (v30);
            unint64_t v32 = (unint64_t)v13 >> 4;
            do
            {
              sub_10FA8((__n128 *)v11, (uint64_t)a2, a3, v32);
              a2 -= 2;
            }

            while (v32-- > 2);
          }

          return;
        }

        uint64_t v15 = &v11[2 * (v14 >> 1)];
        if ((unint64_t)v13 < 0x801)
        {
          sub_107BC(v15, v11, a2 - 2);
          if ((a5 & 1) != 0) {
            goto LABEL_11;
          }
        }

        else
        {
          sub_107BC(v11, v15, a2 - 2);
          sub_107BC(v11 + 2, v15 - 2, a2 - 4);
          sub_107BC(v11 + 4, v15 + 2, a2 - 6);
          sub_107BC(v15 - 2, v15, v15 + 2);
          __int128 v40 = *(_OWORD *)v11;
          *(_OWORD *)int v11 = *(_OWORD *)v15;
          *(_OWORD *)uint64_t v15 = v40;
          if ((a5 & 1) != 0) {
            goto LABEL_11;
          }
        }

        if ((CFStringCompare(*(v11 - 2), *v11, 0LL) & 0x80000000) == 0)
        {
          int v11 = sub_10914(v11, a2);
          a5 = 0;
          continue;
        }

uint64_t sub_107BC(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3)
{
  int v6 = CFStringCompare(*a2, *a1, 0LL);
  int v7 = CFStringCompare(*a3, *a2, 0LL);
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      __int128 v11 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v11;
      return 1LL;
    }

    else
    {
      __int128 v9 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v9;
      if ((CFStringCompare(*a3, *a2, 0LL) & 0x80000000) != 0)
      {
        __int128 v12 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v12;
        return 2LL;
      }

      else
      {
        return 1LL;
      }
    }
  }

  else if (v7 < 0)
  {
    __int128 v10 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v10;
    if ((CFStringCompare(*a2, *a1, 0LL) & 0x80000000) != 0)
    {
      __int128 v13 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v13;
      return 2LL;
    }

    else
    {
      return 1LL;
    }
  }

  else
  {
    return 0LL;
  }

CFStringRef *sub_10914(const __CFString **a1, CFStringRef *a2)
{
  MIDIObjectRef v2 = a2;
  CFNumberRef v4 = *a1;
  int v5 = a1[1];
  if ((CFStringCompare(*a1, *(a2 - 2), 0LL) & 0x80000000) != 0)
  {
    int v7 = a1;
    do
    {
      uint64_t v8 = v7[2];
      v7 += 2;
    }

    while ((CFStringCompare(v4, v8, 0LL) & 0x80000000) == 0);
  }

  else
  {
    unint64_t v6 = (unint64_t)(a1 + 2);
    do
    {
      int v7 = (CFStringRef *)v6;
      v6 += 16LL;
    }

    while ((CFStringCompare(v4, *v7, 0LL) & 0x80000000) == 0);
  }

  if (v7 < v2)
  {
    do
    {
      __int128 v9 = *(v2 - 2);
      v2 -= 2;
    }

    while ((CFStringCompare(v4, v9, 0LL) & 0x80000000) != 0);
  }

  while (v7 < v2)
  {
    __int128 v13 = *(_OWORD *)v7;
    *(_OWORD *)int v7 = *(_OWORD *)v2;
    *(_OWORD *)MIDIObjectRef v2 = v13;
    do
    {
      __int128 v10 = v7[2];
      v7 += 2;
    }

    while ((CFStringCompare(v4, v10, 0LL) & 0x80000000) == 0);
    do
    {
      __int128 v11 = *(v2 - 2);
      v2 -= 2;
    }

    while ((CFStringCompare(v4, v11, 0LL) & 0x80000000) != 0);
  }

  if (v7 - 2 != a1) {
    *(_OWORD *)a1 = *((_OWORD *)v7 - 1);
  }
  *(v7 - 2) = v4;
  *(v7 - 1) = v5;
  return v7;
}

_OWORD *sub_10A2C(unint64_t a1, _OWORD *a2)
{
  CFNumberRef v4 = *(const __CFString **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a1;
  do
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(const __CFString **)(v6 + 16);
    v6 += 16LL;
  }

  while ((CFStringCompare(v8, v4, 0LL) & 0x80000000) != 0);
  if (v7 == a1)
  {
    do
    {
      __int128 v10 = (const __CFString *)*((void *)a2-- - 2);
    }

    while ((CFStringCompare(v10, v4, 0LL) & 0x80000000) == 0);
  }

  else
  {
    do
      __int128 v9 = (const __CFString *)*((void *)a2-- - 2);
    while ((CFStringCompare(v9, v4, 0LL) & 0x80000000) == 0);
  }

  unint64_t v11 = v6;
  if (v6 < (unint64_t)a2)
  {
    __int128 v12 = a2;
    do
    {
      __int128 v13 = *(_OWORD *)v11;
      *(_OWORD *)unint64_t v11 = *v12;
      *__int128 v12 = v13;
      do
      {
        unint64_t v14 = *(const __CFString **)(v11 + 16);
        v11 += 16LL;
      }

      while ((CFStringCompare(v14, v4, 0LL) & 0x80000000) != 0);
      do
        uint64_t v15 = (const __CFString *)*((void *)v12-- - 2);
      while ((CFStringCompare(v15, v4, 0LL) & 0x80000000) == 0);
    }

    while (v11 < (unint64_t)v12);
  }

  CFIndex result = (_OWORD *)(v11 - 16);
  if (v11 - 16 != a1) {
    *(_OWORD *)a1 = *result;
  }
  *(void *)(v11 - 16) = v4;
  *(void *)(v11 - 8) = v5;
  return result;
}

BOOL sub_10B3C(CFStringRef *a1, __int128 *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 4;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      unint64_t v6 = a2 - 1;
      if ((CFStringCompare(*((CFStringRef *)a2 - 2), *a1, 0LL) & 0x80000000) != 0)
      {
        __int128 v7 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *v6;
        __int128 *v6 = v7;
      }

      return 1LL;
    case 3LL:
      sub_107BC(a1, a1 + 2, (CFStringRef *)a2 - 2);
      return 1LL;
    case 4LL:
      sub_10CF4(a1, a1 + 2, a1 + 4, (CFStringRef *)a2 - 2);
      return 1LL;
    case 5LL:
      sub_10DA0(a1, a1 + 2, a1 + 4, a1 + 6, (CFStringRef *)a2 - 2);
      return 1LL;
    default:
      uint64_t v8 = a1 + 4;
      sub_107BC(a1, a1 + 2, a1 + 4);
      __int128 v9 = (__int128 *)(a1 + 6);
      if (a1 + 6 == (CFStringRef *)a2) {
        return 1LL;
      }
      uint64_t v10 = 0LL;
      int v11 = 0;
      break;
  }

  while ((CFStringCompare(*(CFStringRef *)v9, *v8, 0LL) & 0x80000000) == 0)
  {
LABEL_13:
    uint64_t v8 = (CFStringRef *)v9;
    v10 += 16LL;
    if (++v9 == a2) {
      return 1LL;
    }
  }

  __int128 v12 = *(const __CFString **)v9;
  __int128 v13 = (const __CFString *)*((void *)v9 + 1);
  uint64_t v14 = v10;
  do
  {
    uint64_t v15 = (uint64_t)a1 + v14;
    *(_OWORD *)((char *)a1 + v14 + 48) = *(_OWORD *)((char *)a1 + v14 + 32);
    if (v14 == -32)
    {
      *a1 = v12;
      a1[1] = v13;
      if (++v11 != 8) {
        goto LABEL_13;
      }
      return v9 + 1 == a2;
    }

    v14 -= 16LL;
  }

  while ((CFStringCompare(v12, *(CFStringRef *)(v15 + 16), 0LL) & 0x80000000) != 0);
  uint64_t v16 = (uint64_t)a1 + v14;
  *(void *)(v16 + 48) = v12;
  *(void *)(v16 + 56) = v13;
  if (++v11 != 8) {
    goto LABEL_13;
  }
  return v9 + 1 == a2;
}

__n128 sub_10CF4(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3, CFStringRef *a4)
{
  if ((CFStringCompare(*a4, *a3, 0LL) & 0x80000000) != 0)
  {
    __int128 v9 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v9;
    if ((CFStringCompare(*a3, *a2, 0LL) & 0x80000000) != 0)
    {
      __int128 v10 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v10;
      if ((CFStringCompare(*a2, *a1, 0LL) & 0x80000000) != 0)
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }

  return result;
}

__n128 sub_10DA0(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3, CFStringRef *a4, CFStringRef *a5)
{
  if ((CFStringCompare(*a5, *a4, 0LL) & 0x80000000) != 0)
  {
    __int128 v11 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v11;
    if ((CFStringCompare(*a4, *a3, 0LL) & 0x80000000) != 0)
    {
      __int128 v12 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v12;
      if ((CFStringCompare(*a3, *a2, 0LL) & 0x80000000) != 0)
      {
        __int128 v13 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v13;
        if ((CFStringCompare(*a2, *a1, 0LL) & 0x80000000) != 0)
        {
          __n128 result = *(__n128 *)a1;
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }

  return result;
}

CFComparisonResult sub_10E7C(CFComparisonResult result, uint64_t a2, uint64_t a3, CFStringRef *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    CFComparisonResult v6 = result;
    uint64_t v7 = (uint64_t)a4 - result;
    uint64_t v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v10 = v7 >> 3;
      uint64_t v11 = (v7 >> 3) + 1;
      uint64_t v12 = result + 2 * v7;
      __int128 v13 = (CFStringRef *)(v12 + 16);
      uint64_t v14 = v10 + 2;
      if (v10 + 2 < a3 && (CFStringCompare(*v13, *(CFStringRef *)(v12 + 32), 0LL) & 0x80000000LL) != 0)
      {
        v13 += 2;
        uint64_t v11 = v14;
      }

      __n128 result = CFStringCompare(*v13, *v5, 0LL);
      if ((result & 0x80000000) == 0)
      {
        uint64_t v15 = *v5;
        uint64_t v16 = v5[1];
        uint64_t v17 = v6 + 16;
        do
        {
          BOOL v18 = v5;
          uint64_t v5 = v13;
          *(_OWORD *)BOOL v18 = *(_OWORD *)v13;
          if (v8 < v11) {
            break;
          }
          uint64_t v19 = (2 * v11) | 1;
          __int128 v13 = (CFStringRef *)(v17 + 32 * v11);
          uint64_t v20 = 2 * v11 + 2;
          if (v20 < a3 && (CFStringCompare(*v13, v13[2], 0LL) & 0x80000000LL) != 0)
          {
            v13 += 2;
            uint64_t v19 = v20;
          }

          __n128 result = CFStringCompare(*v13, v15, 0LL);
          uint64_t v11 = v19;
        }

        while ((result & 0x80000000) == 0);
        CFStringRef *v5 = v15;
        v5[1] = v16;
      }
    }
  }

  return result;
}

__n128 sub_10FA8(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v7 = 0LL;
    __n128 v21 = *a1;
    int64_t v8 = (unint64_t)(a4 - 2) >> 1;
    __int128 v9 = a1;
    do
    {
      uint64_t v10 = (uint64_t)&v9[v7 + 1];
      uint64_t v11 = (2 * v7) | 1;
      uint64_t v12 = 2 * v7 + 2;
      if (v12 < a4 && (CFStringCompare(*(CFStringRef *)v10, *(CFStringRef *)&v9[v7 + 2], 0LL) & 0x80000000LL) != 0)
      {
        v10 += 16LL;
        uint64_t v11 = v12;
      }

      *__int128 v9 = *(_OWORD *)v10;
      __int128 v9 = (_OWORD *)v10;
      uint64_t v7 = v11;
    }

    while (v11 <= v8);
    __int128 v13 = (__n128 *)(a2 - 16);
    if (v10 == a2 - 16)
    {
      __n128 result = v21;
      *(__n128 *)uint64_t v10 = v21;
    }

    else
    {
      *(__n128 *)uint64_t v10 = *v13;
      __n128 result = v21;
      *__int128 v13 = v21;
      uint64_t v15 = v10 - (void)a1 + 16;
      if (v15 >= 17)
      {
        unint64_t v16 = (((unint64_t)v15 >> 4) - 2) >> 1;
        uint64_t v17 = (CFStringRef *)&a1[v16];
        if ((CFStringCompare(*v17, *(CFStringRef *)v10, 0LL) & 0x80000000) != 0)
        {
          BOOL v18 = *(const __CFString **)v10;
          uint64_t v19 = *(void *)(v10 + 8);
          do
          {
            uint64_t v20 = (_OWORD *)v10;
            uint64_t v10 = (uint64_t)v17;
            __n128 result = *(__n128 *)v17;
            *uint64_t v20 = *(_OWORD *)v17;
            if (!v16) {
              break;
            }
            unint64_t v16 = (v16 - 1) >> 1;
            uint64_t v17 = (CFStringRef *)&a1[v16];
          }

          while ((CFStringCompare(*v17, v18, 0LL) & 0x80000000) != 0);
          *(void *)uint64_t v10 = v18;
          *(void *)(v10 + 8) = v19;
        }
      }
    }
  }

  return result;
}

void *sub_11110(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &off_18D00;
  result[1] = v3;
  return result;
}

uint64_t sub_11144(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_18D00;
  a2[1] = v2;
  return result;
}

void sub_11160(uint64_t a1, const void ***a2)
{
}

__n128 sub_1117C(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &off_18D48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 sub_111BC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &off_18D48;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_111E4(uint64_t a1, const __CFString ***a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 72LL);
  uint64_t v3 = **a2;
  CFIndex v4 = *((int *)*a2 + 2);
  uint64_t v5 = **(const __CFArray ***)(a1 + 16);
  int valuePtr = 0;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v4);
  if (ValueAtIndex && (Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"latency")) != 0LL)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    int v8 = valuePtr;
  }

  else
  {
    int v8 = 0;
  }

  sub_6698(v2, v3, v8);
}

void sub_11278(void *a1, int a2)
{
  CFComparisonResult v6 = __cxa_begin_catch(a1);
  if (a2 == 2)
  {
    uint64_t v7 = v6;
    sub_4BD4((uint64_t)v6);
    int v8 = v7[66];
    __cxa_end_catch();
    if (v8 == -3)
    {
LABEL_8:
      uint64_t v10 = *(void *)(v2 + 24);
      uint64_t v12 = *(char **)(v10 + 8);
      unint64_t v11 = *(void *)(v10 + 16);
      if ((unint64_t)v12 >= v11)
      {
        uint64_t v14 = *(char **)v10;
        uint64_t v15 = (uint64_t)&v12[-*(void *)v10];
        uint64_t v16 = v15 >> 2;
        unint64_t v17 = (v15 >> 2) + 1;
        if (v17 >> 62) {
          sub_A7C4();
        }
        uint64_t v18 = v11 - (void)v14;
        if (v18 >> 1 > v17) {
          unint64_t v17 = v18 >> 1;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          if (v19 >> 62) {
            sub_428C();
          }
          uint64_t v20 = operator new(4 * v19);
        }

        else
        {
          uint64_t v20 = 0LL;
        }

        __n128 v21 = &v20[4 * v16];
        _DWORD *v21 = *(_DWORD *)(v3 + 8);
        __int128 v13 = v21 + 1;
        if (v12 != v14)
        {
          unint64_t v22 = v12 - v14 - 4;
          if (v22 < 0x2C) {
            goto LABEL_35;
          }
          uint64_t v23 = (v22 >> 2) + 1;
          uint64_t v24 = 4 * (v23 & 0x7FFFFFFFFFFFFFF8LL);
          unint64_t v25 = &v12[-v24];
          __n128 v21 = (_DWORD *)((char *)v21 - v24);
          char v26 = &v20[4 * v16 - 16];
          uint64_t v27 = v12 - 16;
          uint64_t v28 = v23 & 0x7FFFFFFFFFFFFFF8LL;
          do
          {
            __int128 v29 = *(_OWORD *)v27;
            *(v26 - 1) = *((_OWORD *)v27 - 1);
            *char v26 = v29;
            v26 -= 2;
            v27 -= 32;
            v28 -= 8LL;
          }

          while (v28);
          uint64_t v12 = v25;
          if (v23 != (v23 & 0x7FFFFFFFFFFFFFF8LL))
          {
LABEL_35:
            do
            {
              int v30 = *((_DWORD *)v12 - 1);
              v12 -= 4;
              *--__n128 v21 = v30;
            }

            while (v12 != v14);
          }
        }

        *(void *)uint64_t v10 = v21;
        *(void *)(v10 + 8) = v13;
        *(void *)(v10 + 16) = &v20[4 * v19];
        if (v14) {
          operator delete(v14);
        }
      }

      else
      {
        *(_DWORD *)uint64_t v12 = *(_DWORD *)(v3 + 8);
        __int128 v13 = v12 + 4;
      }

      *(void *)(v10 + 8) = v13;
LABEL_32:
      JUMPOUT(0x1125CLL);
    }

    if (!v8) {
      goto LABEL_32;
    }
  }

  else
  {
    __cxa_end_catch();
  }

  CFStringRef v9 = CFStringCreateWithFormat(0LL, 0LL, (CFStringRef)qword_1C090);
  sub_D6D4(*v4, v9);
  if (v9) {
    CFRelease(v9);
  }
  goto LABEL_8;
}

void sub_11418(_Unwind_Exception *a1)
{
}

__n128 sub_11450(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &off_18D90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_11488(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &off_18D90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_114A8(uint64_t a1, uint64_t a2, const void ***a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 8) + 72LL);
  CFIndex v4 = **(const __CFArray ***)(a1 + 16);
  uint64_t v5 = **a3;
  CFIndex v6 = *((int *)*a3 + 2);
  int valuePtr = 0;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v6);
  if (ValueAtIndex && (Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"latency")) != 0LL)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    int v9 = valuePtr;
  }

  else
  {
    int v9 = 0;
  }

  return sub_6E40(v3, v5, v9);
}

uint64_t sub_11520(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    sub_11AB0(v2, a1);
    *(void *)(a1 + 8) = 0LL;
  }

  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a1 + 16) = -1;
  }

  *(_WORD *)(a1 + 20) = 0;
  return result;
}

ssize_t sub_11568(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    sub_11AB0(v12, a1);
    *(void *)(a1 + 8) = 0LL;
  }

  int v13 = *(_DWORD *)(a1 + 16);
  if ((v13 & 0x80000000) == 0)
  {
    close(v13);
    *(_DWORD *)(a1 + 16) = -1;
  }

  *(_WORD *)(a1 + 20) = 0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  ssize_t result = socket(a3, a4, a5);
  *(_DWORD *)(a1 + 16) = result;
  if ((result & 0x80000000) != 0)
  {
    int v15 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_2D94(v17, v15);
      *(_DWORD *)CFRunLoopTimerContext buf = 136315906;
      unint64_t v19 = "Socket.cpp";
      __int16 v20 = 1024;
      int v21 = 42;
      __int16 v22 = 2080;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      unint64_t v25 = "couldn't create socket";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d about to throw %s: %s",  buf,  0x26u);
    }

    exception = __cxa_allocate_exception(0x110uLL);
    sub_2AF4((uint64_t)exception, "couldn't create socket", v15);
  }

  *(_DWORD *)(a1 + 24) = a6;
  if (a2) {
    return sub_11750(a2, a1);
  }
  return result;
}

void sub_11738(_Unwind_Exception *a1)
{
}

ssize_t sub_11750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 152;
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 16LL))(a1 + 152);
  uint64_t v14 = a2;
  char v15 = 0;
  int v16 = 0;
  uint64_t v7 = *(char **)(a1 + 248);
  CFIndex v6 = *(char **)(a1 + 256);
  if (v6 != v7)
  {
    unint64_t v8 = (v6 - v7) >> 4;
    do
    {
      unint64_t v9 = v8 >> 1;
      uint64_t v10 = &v7[16 * (v8 >> 1)];
      uint64_t v12 = *(void *)v10;
      unint64_t v11 = v10 + 16;
      v8 += ~(v8 >> 1);
      if (*(_DWORD *)(v12 + 16) < *(_DWORD *)(a2 + 16)) {
        uint64_t v7 = v11;
      }
      else {
        unint64_t v8 = v9;
      }
    }

    while (v8);
    CFIndex v6 = v7;
  }

  sub_11850((char **)(a1 + 248), v6, (char *)&v14);
  ++*(_DWORD *)(a1 + 272);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
  LOBYTE(v14) = 88;
  return write(*(_DWORD *)(a1 + 244), &v14, 1uLL);
}

void sub_1182C(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

char *sub_11850(char **a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  CFIndex v6 = *a1;
  unint64_t v5 = (unint64_t)a1[1];
  uint64_t v7 = a2 - *a1;
  unint64_t v8 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF0LL];
  unint64_t v9 = (unint64_t)a1[2];
  if (v5 < v9)
  {
    if (v8 == (char *)v5)
    {
      *(_OWORD *)unint64_t v8 = *(_OWORD *)a3;
      a1[1] = v8 + 16;
    }

    else
    {
      uint64_t v10 = v8 + 16;
      unint64_t v11 = (__int128 *)(v5 - 16);
      uint64_t v12 = a1[1];
      if (v5 >= 0x10)
      {
        do
        {
          __int128 v13 = *v11++;
          *(_OWORD *)uint64_t v12 = v13;
          v12 += 16;
        }

        while ((unint64_t)v11 < v5);
      }

      a1[1] = v12;
      if ((_OWORD *)v5 != v10) {
        memmove((void *)(v5 - 16 * ((uint64_t)(v5 - (void)v10) >> 4)), v8, v5 - (void)v10);
      }
      if (v8 <= v3) {
        v3 += 16 * (a1[1] > v3);
      }
      *(_OWORD *)unint64_t v8 = *(_OWORD *)v3;
    }

    return v8;
  }

  unint64_t v14 = ((uint64_t)(v5 - (void)v6) >> 4) + 1;
  if (v14 >> 60) {
    sub_A7C4();
  }
  uint64_t v16 = v9 - (void)v6;
  if (v16 >> 3 > v14) {
    unint64_t v14 = v16 >> 3;
  }
  else {
    unint64_t v17 = v14;
  }
  if (v17)
  {
    if (v17 >> 60) {
      sub_428C();
    }
    uint64_t v18 = (char *)operator new(16 * v17);
    uint64_t v19 = v7 >> 4;
    __int16 v20 = &v18[16 * (v7 >> 4)];
    int v21 = &v18[16 * v17];
    if (v7 >> 4 != v17) {
      goto LABEL_33;
    }
    goto LABEL_22;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = v7 >> 4;
  __int16 v20 = (char *)(16 * (v7 >> 4));
  int v21 = 0LL;
  if (!(v7 >> 4))
  {
LABEL_22:
    if (v7 < 1)
    {
      if (v6 == a2) {
        unint64_t v23 = 1LL;
      }
      else {
        unint64_t v23 = v7 >> 3;
      }
      if (v23 >> 60) {
        sub_428C();
      }
      __int16 v24 = (char *)operator new(16 * v23);
      __int16 v20 = &v24[16 * (v23 >> 2)];
      int v21 = &v24[16 * v23];
      if (v18)
      {
        operator delete(v18);
        CFIndex v6 = *a1;
      }
    }

    else
    {
      if (v19 >= -1) {
        unint64_t v22 = v19 + 1;
      }
      else {
        unint64_t v22 = v19 + 2;
      }
      v20 -= 16 * (v22 >> 1);
    }
  }

void sub_11A98(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

ssize_t sub_11AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a1 + 152);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 16LL))(a1 + 152);
  int v6 = v5;
  unint64_t v8 = (char *)v4[12];
  uint64_t v7 = (char *)v4[13];
  if (v8 == v7)
  {
LABEL_4:
    ++*(_DWORD *)(a1 + 272);
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  while (*(void *)v8 != a2)
  {
    v8 += 16;
    if (v8 == v7) {
      goto LABEL_4;
    }
  }

  int64_t v9 = v7 - (v8 + 16);
  if (v7 != v8 + 16) {
    memmove(v8, v8 + 16, v7 - (v8 + 16));
  }
  *(void *)(a1 + 256) = &v8[v9];
  ++*(_DWORD *)(a1 + 272);
  if (v6) {
LABEL_9:
  }
    (*(void (**)(void *))(*v4 + 24LL))(v4);
LABEL_10:
  __CFRunLoopTimerContext buf = 88;
  return write(*(_DWORD *)(a1 + 244), &__buf, 1uLL);
}

void sub_11B94(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  int v5 = *(_BYTE **)a3;
  if ((a2 & 1) == 0 && (v5[25] & 0x80) != 0)
  {
    *(_DWORD *)(a3 + 12) |= a4;
    uint64_t v7 = *(__CFRunLoopTimer **)(a1 + 280);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v7, Current);
  }

  else
  {
    uint64_t v6 = a1 + 152;
    sub_4998(a1 + 152);
    (*(void (**)(_BYTE *, uint64_t))(*(void *)v5 + 16LL))(v5, a4);
    sub_48D8(v6);
  }

uint64_t sub_11C14(void *a1, int a2)
{
  uint64_t v4 = __cxa_begin_catch(a1);
  if (a2 == 2) {
    sub_11C58(v4[66]);
  }
  __cxa_end_catch();
  return sub_48D8(v2);
}

void sub_11C44(_Unwind_Exception *a1)
{
}

void sub_11C58(unsigned int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_2D94((char *)&v2, a1);
    strlcpy(__dst, (const char *)&v2, 0x100uLL);
    int v2 = 136315650;
    uint64_t v3 = "SocketServer.cpp";
    __int16 v4 = 1024;
    int v5 = 75;
    __int16 v6 = 2080;
    uint64_t v7 = __dst;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s\n", (uint8_t *)&v2, 0x1Cu);
  }

void sub_11D38(uint64_t a1)
{
  int v29 = *(_DWORD *)(a1 + 240);
  uint64_t v2 = a1 + 152;
  sub_48D8(a1 + 152);
  if (*(_BYTE *)(a1 + 136)) {
    goto LABEL_2;
  }
  int v28 = 1 << v29;
  unint64_t v27 = (unint64_t)v29 >> 5;
  while (1)
  {
    memset(&v31, 0, sizeof(v31));
    memset(&v30, 0, sizeof(v30));
    if (__darwin_check_fd_set_overflow(v29, &v31, 0)) {
      v31.fds_bits[v27] |= v28;
    }
    uint64_t v4 = *(void *)(a1 + 248);
    uint64_t v3 = *(void *)(a1 + 256);
    int v5 = v29;
    while (v4 != v3)
    {
      if (!*(_DWORD *)(v4 + 12))
      {
        int v6 = *(_DWORD *)(*(void *)v4 + 24LL);
        unint64_t v7 = *(int *)(*(void *)v4 + 16LL);
        if ((v6 & 3) != 0)
        {
          if (__darwin_check_fd_set_overflow(*(_DWORD *)(*(void *)v4 + 16LL), &v31, 0)) {
            *(__int32_t *)((char *)v31.fds_bits + ((v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
          }
        }

        if ((v6 & 4) != 0 && !*(_BYTE *)(v4 + 8))
        {
          if (__darwin_check_fd_set_overflow(v7, &v30, 0)) {
            *(__int32_t *)((char *)v30.fds_bits + ((v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
          }
        }
      }

      v4 += 16LL;
      uint64_t v3 = *(void *)(a1 + 256);
    }

    sub_4998(v2);
    int v8 = select(v5 + 1, &v31, &v30, 0LL, 0LL);
    sub_48D8(v2);
    if (v8 != -1)
    {
      int64_t v9 = *(char **)(a1 + 248);
      if (v9 != *(char **)(a1 + 256))
      {
        int v10 = *(_DWORD *)(a1 + 272);
        do
        {
          while (1)
          {
            int v11 = *(_DWORD *)(*(void *)v9 + 24LL);
            int v12 = *(_DWORD *)(*(void *)v9 + 16LL);
            if (__darwin_check_fd_set_overflow(v12, &v31, 0)
              && ((*(unsigned int *)((char *)v31.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) != 0)
            {
              if ((v11 & 1) != 0) {
                uint64_t v13 = 1LL;
              }
              else {
                uint64_t v13 = 2LL;
              }
              uint64_t v14 = *(void *)v9;
              if ((*(_BYTE *)(*(void *)v9 + 25LL) & 0x80) != 0)
              {
                *((_DWORD *)v9 + 3) |= v13;
                char v15 = *(__CFRunLoopTimer **)(a1 + 280);
                CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v15, Current);
              }

              else
              {
                sub_4998(v2);
                (*(void (**)(uint64_t, uint64_t))(*(void *)v14 + 16LL))(v14, v13);
                sub_48D8(v2);
              }
            }

            if (__darwin_check_fd_set_overflow(v12, &v30, 0)
              && ((*(unsigned int *)((char *)v30.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) != 0)
            {
              v9[8] = 1;
              uint64_t v17 = *(void *)v9;
              if ((*(_BYTE *)(*(void *)v9 + 25LL) & 0x80) != 0)
              {
                *((_DWORD *)v9 + 3) |= 4u;
                uint64_t v18 = *(__CFRunLoopTimer **)(a1 + 280);
                CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v18, v19);
              }

              else
              {
                sub_4998(v2);
                (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 16LL))(v17, 4LL);
                sub_48D8(v2);
              }
            }

            __int16 v20 = *(char **)(a1 + 256);
            if (*(_DWORD *)(a1 + 272) != v10) {
              break;
            }
            v9 += 16;
            if (v9 == v20) {
              goto LABEL_47;
            }
          }

          int64_t v9 = *(char **)(a1 + 248);
          if (v20 == v9) {
            break;
          }
          unint64_t v21 = (v20 - v9) >> 4;
          do
          {
            unint64_t v22 = v21 >> 1;
            unint64_t v23 = (uint64_t *)&v9[16 * (v21 >> 1)];
            uint64_t v25 = *v23;
            __int16 v24 = (char *)(v23 + 2);
            v21 += ~(v21 >> 1);
            if (*(_DWORD *)(v25 + 16) <= v12) {
              int64_t v9 = v24;
            }
            else {
              unint64_t v21 = v22;
            }
          }

          while (v21);
          int v10 = *(_DWORD *)(a1 + 272);
        }

        while (v9 != v20);
      }

LABEL_47:
      if (__darwin_check_fd_set_overflow(v29, &v31, 0) && (v31.fds_bits[v27] & v28) != 0) {
        read(v29, buf, 0x20uLL);
      }
      goto LABEL_4;
    }

    if (*__error() != 9) {
      break;
    }
LABEL_4:
    if (*(_BYTE *)(a1 + 136)) {
      goto LABEL_2;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v26 = *__error();
    *(_DWORD *)CFRunLoopTimerContext buf = 136315650;
    __int16 v33 = "SocketServer.cpp";
    __int16 v34 = 1024;
    int v35 = 153;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d select failed: %d\n", buf, 0x18u);
  }

LABEL_2:
  sub_4998(v2);
}

void sub_122E8(_Unwind_Exception *a1)
{
}

void sub_1230C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x12310LL);
  }
  _Unwind_Resume(a1);
}

void sub_12318(uint64_t a1)
{
  uint64_t v2 = a1 + 152;
  sub_48D8(a1 + 152);
  uint64_t v4 = *(char **)(a1 + 248);
  uint64_t v3 = *(char **)(a1 + 256);
  if (v4 == v3) {
    goto LABEL_24;
  }
  char v5 = 0;
  int v6 = *(_DWORD *)(a1 + 272);
  do
  {
    while (1)
    {
      while (1)
      {
        int v7 = *((_DWORD *)v4 + 3);
        if (v7) {
          break;
        }
        v4 += 16;
        if (v4 == v3) {
          goto LABEL_22;
        }
      }

      int v8 = *(_DWORD *)(*(void *)v4 + 16LL);
      *((_DWORD *)v4 + 3) = 0;
      if ((v7 & 1) == 0) {
        break;
      }
      sub_11B94(a1, 1, (uint64_t)v4, 1LL);
      if ((v7 & 4) != 0) {
        goto LABEL_14;
      }
LABEL_8:
      int v9 = *(_DWORD *)(a1 + 272);
      uint64_t v3 = *(char **)(a1 + 256);
      if (v9 != v6) {
        goto LABEL_15;
      }
LABEL_9:
      v4 += 16;
      char v5 = 1;
      if (v4 == v3) {
        goto LABEL_22;
      }
    }

    if ((v7 & 2) != 0)
    {
      sub_11B94(a1, 1, (uint64_t)v4, 2LL);
      if ((v7 & 4) != 0) {
        goto LABEL_14;
      }
      goto LABEL_8;
    }

    if ((v7 & 4) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    sub_11B94(a1, 1, (uint64_t)v4, 4LL);
    int v9 = *(_DWORD *)(a1 + 272);
    uint64_t v3 = *(char **)(a1 + 256);
    if (v9 == v6) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v4 = *(char **)(a1 + 248);
    if (v3 == v4) {
      goto LABEL_23;
    }
    unint64_t v10 = (v3 - v4) >> 4;
    do
    {
      unint64_t v11 = v10 >> 1;
      int v12 = &v4[16 * (v10 >> 1)];
      uint64_t v14 = *(void *)v12;
      uint64_t v13 = v12 + 16;
      v10 += ~(v10 >> 1);
      if (*(_DWORD *)(v14 + 16) <= v8) {
        uint64_t v4 = v13;
      }
      else {
        unint64_t v10 = v11;
      }
    }

    while (v10);
    char v5 = 1;
    int v6 = v9;
  }

  while (v4 != v3);
LABEL_22:
  if ((v5 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_23:
  __CFRunLoopTimerContext buf = 88;
  write(*(_DWORD *)(a1 + 244), &__buf, 1uLL);
LABEL_24:
  sub_4998(v2);
}

uint64_t *sub_1248C(uint64_t *result, unsigned int a2, uint64_t a3, char *a4)
{
  int v7 = result;
  unsigned int v8 = *a4;
  if (*a4 > -17)
  {
    switch(*a4)
    {
      case -15:
        char v14 = *((_BYTE *)result + 56);
        unsigned int v15 = a4[1];
        unsigned int v16 = v15 >> 4;
        if (v15 >> 4 == ((v14 + 1) & 7))
        {
          int v17 = ((v15 & 0xF) << (4 * v16)) | *((_DWORD *)result + 16);
          if (v15 > 0x6F)
          {
            *((_DWORD *)result + 15) = v17;
            char v18 = v14 & 0x98 | 0x47;
            int v17 = 0;
LABEL_84:
            *((_BYTE *)result + 56) = v18;
            *((_DWORD *)result + 16) = v17;
            *((_DWORD *)result + 17) = a2;
            uint64_t v51 = result[9];
            if (v51)
            {
              double v52 = (double)(unint64_t)(a3 - v51);
              double v53 = v52 * 0.0000000416666667;
              if (v52 * 0.0000000416666667 > 0.0420833333 || v53 < 0.002)
              {
                result[10] = 0LL;
              }

              else
              {
                double v54 = *((double *)result + 10);
                if (v54 <= 0.0) {
                  *((double *)result + 10) = v53;
                }
                else {
                  *((double *)result + 10) = v52 * 0.00000000416666667 + v54 * 0.9;
                }
              }
            }

            result[9] = a3;
            return result;
          }
        }

        else
        {
          char v14 = 7;
          *((_BYTE *)result + 56) = 7;
          *(uint64_t *)((char *)result + 60) = 0LL;
          *(uint64_t *)((char *)result + 76) = 0LL;
          *(uint64_t *)((char *)result + 68) = 0LL;
          *((_DWORD *)result + 21) = 0;
          if (v15 > 0xF) {
            return result;
          }
          int v17 = (a4[1] & 0xF) << (4 * v16);
        }

        char v18 = v16 | v14 & 0xF8 | 0x20;
        goto LABEL_84;
      case -14:
        *((_DWORD *)result + 8) = a2;
        *((_DWORD *)result + 7) = a4[1] | (a4[2] << 7);
        *((_BYTE *)result + 25) = 1;
        return result;
      case -8:
        if ((result[3] & 0x40) != 0)
        {
          ++*((_DWORD *)result + 7);
          *((_DWORD *)result + 8) = a2;
          *((_BYTE *)result + 25) = 1;
        }

        uint64_t v38 = result[5];
        if (v38)
        {
          double v39 = (double)(unint64_t)(a3 - v38);
          if (60000000.0 / v39 >= 40.0 && 60000000.0 / v39 <= 500.0)
          {
            double v55 = *((double *)result + 6);
            if (v55 <= 0.0) {
              double v56 = v39 * 0.0000000416666667;
            }
            else {
              double v56 = v39 * 0.00000000416666667 + v55 * 0.9;
            }
            *((double *)result + 6) = v56;
          }

          else
          {
            result[6] = 0LL;
          }
        }

        result[5] = a3;
        return result;
      case -6:
        *((_DWORD *)result + 7) = 0;
        *((_DWORD *)result + 8) = a2;
        *((_BYTE *)result + 25) = 1;
        goto LABEL_47;
      case -5:
        *((_DWORD *)result + 8) = a2;
LABEL_47:
        char v41 = *((_BYTE *)result + 24) | 0x40;
        goto LABEL_49;
      case -4:
        *((_DWORD *)result + 8) = a2;
        char v41 = result[3] & 0xBF;
LABEL_49:
        *((_BYTE *)result + 24) = v41;
        return result;
      default:
        return result;
    }
  }

  int v9 = v8 & 0xF;
  if (v8 > 0x9F)
  {
    int v19 = (v8 >> 4) - 10;
    switch(v19)
    {
      case 0:
        unsigned __int8 v4 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (a4[1] << 16) | 0x700;
        if (v20) {
          goto LABEL_57;
        }
        goto LABEL_76;
      case 1:
        unsigned __int8 v4 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (a4[1] << 16) | 0x100;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      case 2:
        unsigned __int8 v4 = a4[1];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF;
        if (v20) {
          goto LABEL_57;
        }
        goto LABEL_76;
      case 3:
        unsigned __int8 v4 = a4[1];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00F9FF | 0x600;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      case 4:
        unsigned __int8 v4 = a4[1];
        unsigned __int8 v5 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FCFF | 0x300;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      default:
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (v19 << 16);
        if (v20)
        {
LABEL_57:
          unsigned int v42 = bswap32(v22);
          int v43 = v21;
          uint64_t v44 = v20;
          do
          {
            unsigned int v45 = bswap32(*(_DWORD *)(v44 + 28));
            BOOL v46 = v45 >= v42;
            if (v45 >= v42) {
              __int128 v47 = (uint64_t *)v44;
            }
            else {
              __int128 v47 = (uint64_t *)(v44 + 8);
            }
            if (v46) {
              int v43 = (void *)v44;
            }
            uint64_t v44 = *v47;
          }

          while (*v47);
          if (v43 != v21 && v42 >= bswap32(*((_DWORD *)v43 + 7)))
          {
            *((_BYTE *)v43 + 32) = v4;
            *((_BYTE *)v43 + 33) = v5;
            *((_DWORD *)v43 + 9) = a2;
            *((_DWORD *)v43 + 10) = a2;
            return result;
          }

          do
          {
            while (1)
            {
              unsigned int v48 = (void *)v20;
              unsigned int v49 = bswap32(*(_DWORD *)(v20 + 28));
              if (v42 >= v49) {
                break;
              }
              uint64_t v20 = *(void *)v20;
              unint64_t v21 = v48;
              if (!*v48) {
                goto LABEL_77;
              }
            }

            if (v49 >= v42) {
              return result;
            }
            uint64_t v20 = *(void *)(v20 + 8);
          }

          while (v20);
          unint64_t v21 = v48 + 1;
        }

        else
        {
LABEL_76:
          unsigned int v48 = v21;
        }

LABEL_77:
        int v35 = operator new(0x30uLL);
        v35[7] = v22;
        *((_BYTE *)v35 + 32) = v4;
        *((_BYTE *)v35 + 33) = v5;
        v35[9] = a2;
        v35[10] = a2;
        *(void *)int v35 = 0LL;
        *((void *)v35 + 1) = 0LL;
        *((void *)v35 + 2) = v48;
        void *v21 = v35;
        unint64_t v50 = *(void **)*v7;
        if (!v50) {
          goto LABEL_79;
        }
        uint64_t *v7 = (uint64_t)v50;
        int v37 = (uint64_t *)*v21;
        break;
    }

    goto LABEL_80;
  }

  if (v8 < 0x90)
  {
    BOOL v10 = 1;
    int v12 = result + 1;
    uint64_t v11 = result[1];
    int v13 = v9 | (a4[1] << 16);
    if (!v11) {
      goto LABEL_24;
    }
LABEL_14:
    unsigned int v23 = bswap32(v13 | 0x400);
    __int16 v24 = v12;
    uint64_t v25 = v11;
    do
    {
      unsigned int v26 = bswap32(*(_DWORD *)(v25 + 28));
      BOOL v27 = v26 >= v23;
      if (v26 >= v23) {
        int v28 = (uint64_t *)v25;
      }
      else {
        int v28 = (uint64_t *)(v25 + 8);
      }
      if (v27) {
        __int16 v24 = (uint64_t *)v25;
      }
      uint64_t v25 = *v28;
    }

    while (*v28);
    if (v24 != v12 && v23 >= bswap32(*((_DWORD *)v24 + 7)))
    {
      if (v10)
      {
        *((_DWORD *)v24 + 10) = a2;
      }

      else
      {
        *((_BYTE *)v24 + 32) = a4[2];
        *(uint64_t *)((char *)v24 + 36) = a2;
      }

      return result;
    }

    goto LABEL_24;
  }

  BOOL v10 = a4[2] == 0;
  int v12 = result + 1;
  uint64_t v11 = result[1];
  int v13 = v9 | (a4[1] << 16);
  if (v11) {
    goto LABEL_14;
  }
LABEL_24:
  if (v10)
  {
    unsigned __int8 v29 = 0;
    unsigned int v30 = a2;
    unsigned int v31 = v13 | 0x400;
    unint64_t v32 = v12;
    if (!v11)
    {
LABEL_34:
      int v35 = operator new(0x30uLL);
      v35[7] = v31;
      *((_BYTE *)v35 + 32) = v29;
      v35[9] = a2;
      v35[10] = v30;
      *(void *)int v35 = 0LL;
      *((void *)v35 + 1) = 0LL;
      *((void *)v35 + 2) = v32;
      *int v12 = (uint64_t)v35;
      __int16 v36 = *(void **)*v7;
      if (v36)
      {
        uint64_t *v7 = (uint64_t)v36;
        int v37 = (uint64_t *)*v12;
      }

      else
      {
LABEL_79:
        int v37 = (uint64_t *)v35;
      }

uint64_t sub_12AD4(uint64_t a1, unsigned int a2, int a3, char *a4, int a5)
{
  *a4 = 0x80;
  *(_WORD *)(a4 + 1) = bswap32(a2) >> 16;
  int v8 = a3 - 1;
  unsigned int v9 = *(_DWORD *)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(a1 + 68);
  BOOL v11 = v10 >= a2;
  if (v10 >= a2) {
    char v12 = (16 * (v9 >= a2)) | 8;
  }
  else {
    char v12 = 16 * (v9 >= a2);
  }
  BOOL v13 = v11 || v9 >= a2;
  char v14 = a4 + 3;
  if (v13)
  {
    char v15 = *a4 | 0x40;
    *a4 = v15;
    char v14 = a4 + 5;
    char v16 = v12 | 0x80;
    if (v9 < a2) {
      goto LABEL_18;
    }
    if (*(_DWORD *)(a1 + 32) == v8)
    {
      v15 &= ~0x80u;
      *a4 = v15;
      char v16 = v12;
      int v17 = *(unsigned __int8 *)(a1 + 24);
      unsigned int v18 = *(_DWORD *)(a1 + 28);
      if ((v18 & 0x70000) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      int v17 = *(unsigned __int8 *)(a1 + 24) | 0x80;
      unsigned int v18 = *(_DWORD *)(a1 + 28);
      if ((v18 & 0x70000) != 0) {
        goto LABEL_15;
      }
    }

    if (!*(_BYTE *)(a1 + 25))
    {
LABEL_16:
      a4[5] = v17;
      if ((v17 & 0x10) != 0)
      {
        char v14 = a4 + 8;
        *((_WORD *)a4 + 3) = bswap32(v18) >> 16;
        if ((v16 & 8) == 0) {
          goto LABEL_28;
        }
        goto LABEL_21;
      }

      char v14 = a4 + 6;
LABEL_18:
      if ((v16 & 8) == 0) {
        goto LABEL_28;
      }
LABEL_21:
      if (*(_DWORD *)(a1 + 68) == v8)
      {
        v16 &= ~0x80u;
        *a4 = v15 & 0x7F;
        char v19 = *(_BYTE *)(a1 + 56);
        char v20 = v19;
        *char v14 = v19;
        unint64_t v21 = v14 + 1;
        if ((v19 & 0x40) != 0) {
          goto LABEL_23;
        }
      }

      else
      {
        char v22 = *(_BYTE *)(a1 + 56) | 0x80;
        char v20 = v22;
        *char v14 = v22;
        unint64_t v21 = v14 + 1;
        if ((v22 & 0x40) != 0)
        {
LABEL_23:
          *(_DWORD *)(v14 + 1) = bswap32(*(_DWORD *)(a1 + 60));
          v14 += 5;
          if ((v20 & 0x20) == 0) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }

      char v14 = v21;
      if ((v20 & 0x20) != 0)
      {
LABEL_27:
        unsigned int v23 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)char v14 = bswap32((v23 << 20) & 0xF000000 | (v23 << 28) | (((v23 >> 8) & 0xF) << 20) | ((unsigned __int16)v23 >> 12 << 16) | (v23 >> 4) & 0xF000 | (v23 >> 12) & 0xF00 | (v23 >> 20) & 0xF0 | (v23 >> 28));
        v14 += 4;
      }

LABEL_28:
      __int16 v24 = (_WORD)v14 - ((_WORD)a4 + 3);
      a4[3] = HIBYTE(v24) & 3 | v16;
      a4[4] = v24;
      goto LABEL_29;
    }

LABEL_15:
    v17 |= HIWORD(v18) & 7 | 0x10;
    goto LABEL_16;
  }

LABEL_29:
  unsigned int v26 = (void *)(a1 + 8);
  uint64_t v25 = *(void **)a1;
  if (*(void *)a1 == a1 + 8) {
    return ((_DWORD)v14 - (_DWORD)a4);
  }
  BOOL v27 = 0LL;
  unint64_t v118 = (unint64_t)&a4[a5];
  unsigned __int8 v117 = -1;
  while (2)
  {
    while (1)
    {
      unsigned int v29 = *((_DWORD *)v25 + 10);
      BOOL v30 = v29 >= a2 || v29 == 0;
      if (v30) {
        break;
      }
      unsigned int v31 = (void *)v25[1];
      unint64_t v32 = v31;
      unsigned int v33 = v25;
      if (v31)
      {
        do
        {
          unsigned int v34 = v32;
          unint64_t v32 = (void *)*v32;
        }

        while (v32);
      }

      else
      {
        do
        {
          unsigned int v34 = (void *)v33[2];
          BOOL v30 = *v34 == (void)v33;
          unsigned int v33 = v34;
        }

        while (!v30);
      }

      int v35 = v25;
      if (v31)
      {
        do
        {
          __int16 v36 = v31;
          unsigned int v31 = (void *)*v31;
        }

        while (v31);
      }

      else
      {
        do
        {
          __int16 v36 = (void *)v35[2];
          BOOL v30 = *v36 == (void)v35;
          int v35 = v36;
        }

        while (!v30);
      }

      if (*(void **)a1 == v25) {
        *(void *)a1 = v36;
      }
      int v28 = *(uint64_t **)(a1 + 8);
      --*(void *)(a1 + 16);
      sub_14954(v28, v25);
      operator delete(v25);
      uint64_t v25 = v34;
      if (v34 == v26) {
        goto LABEL_232;
      }
    }

    int v37 = (char *)v25 + 28;
    int v38 = *((unsigned __int8 *)v25 + 28);
    if (v38 != v117)
    {
      if ((*a4 & 0x20) != 0)
      {
        unsigned int v40 = bswap32((*(unsigned __int16 *)v27 << 8) & 0xFC00 | ((_DWORD)v14 - (_DWORD)v27)) >> 16;
        *(_WORD *)BOOL v27 = v40;
        if ((v40 & 0x80) != 0) {
          char v41 = *a4;
        }
        else {
          char v41 = *a4 & 0x7F;
        }
        char v39 = v41 + 1;
      }

      else
      {
        char v39 = *a4 | 0x20;
      }

      *a4 = v39;
      *char v14 = (8 * v38) | 0x80;
      *(_WORD *)(v14 + 1) = 0;
      unsigned __int8 v117 = v38;
      BOOL v27 = v14;
      v14 += 3;
    }

    int v42 = *((_DWORD *)v25 + 9);
    if (v42 == v8) {
      char v43 = 0;
    }
    else {
      char v43 = 0x80;
    }
    switch(*((_BYTE *)v25 + 29))
    {
      case 0:
        uint64_t v44 = v14 + 3;
        v27[2] |= 0x80u;
        *char v14 = *((_BYTE *)v25 + 32) | v43;
        *(_WORD *)(v14 + 1) = 0;
        unsigned int v45 = (void *)v25[1];
        if (v45)
        {
          do
          {
            BOOL v46 = v45;
            unsigned int v45 = (void *)*v45;
          }

          while (v45);
        }

        else
        {
          do
          {
            BOOL v46 = (void *)v25[2];
            BOOL v30 = *v46 == (void)v25;
            uint64_t v25 = v46;
          }

          while (!v30);
        }

        goto LABEL_172;
      case 1:
        int v114 = v38;
        v27[2] |= 0x40u;
        *char v14 = v43;
        __int128 v47 = v14 + 1;
        if (v42 == v8) {
          *v27 &= ~0x80u;
        }
        int v113 = v8;
        while (2)
        {
          *__int128 v47 = *((_BYTE *)v25 + 30) | v43;
          v47[1] = *((_BYTE *)v25 + 32);
          unsigned int v48 = (void *)v25[1];
          unsigned int v49 = v25;
          if (v48)
          {
            do
            {
              uint64_t v25 = v48;
              unsigned int v48 = (void *)*v48;
            }

            while (v48);
          }

          else
          {
            do
            {
              uint64_t v25 = (void *)v49[2];
              BOOL v30 = *v25 == (void)v49;
              unsigned int v49 = v25;
            }

            while (!v30);
          }

          unint64_t v50 = v47 + 2;
          if (v25 == v26) {
            goto LABEL_231;
          }
          while (1)
          {
            unsigned int v52 = *((_DWORD *)v25 + 10);
            if (v52 >= a2 || v52 == 0) {
              break;
            }
            double v54 = (void *)v25[1];
            double v55 = v54;
            double v56 = v25;
            if (v54)
            {
              do
              {
                char v57 = v55;
                double v55 = (void *)*v55;
              }

              while (v55);
            }

            else
            {
              do
              {
                char v57 = (void *)v56[2];
                BOOL v30 = *v57 == (void)v56;
                double v56 = v57;
              }

              while (!v30);
            }

            char v58 = v25;
            if (v54)
            {
              do
              {
                unsigned int v59 = v54;
                double v54 = (void *)*v54;
              }

              while (v54);
            }

            else
            {
              do
              {
                unsigned int v59 = (void *)v58[2];
                BOOL v30 = *v59 == (void)v58;
                char v58 = v59;
              }

              while (!v30);
            }

            if (*(void **)a1 == v25) {
              *(void *)a1 = v59;
            }
            uint64_t v51 = *(uint64_t **)(a1 + 8);
            --*(void *)(a1 + 16);
            sub_14954(v51, v25);
            operator delete(v25);
            uint64_t v25 = v57;
            if (v57 == v26) {
              goto LABEL_231;
            }
          }

          if ((unint64_t)(v47 + 5) < v118)
          {
            char v61 = *v14;
            if (*((_DWORD *)v25 + 9) == v113)
            {
              char v43 = 0;
              *char v14 = (v61 & 0x7F) + 1;
              *v27 &= ~0x80u;
            }

            else
            {
              *char v14 = v61 + 1;
              char v43 = 0x80;
            }

            v47 += 2;
            continue;
          }

          goto LABEL_231;
        }

      case 3:
        uint64_t v44 = v14 + 2;
        v27[2] |= 0x10u;
        *char v14 = *((_BYTE *)v25 + 32) | v43;
        v14[1] = *((_BYTE *)v25 + 33);
        int v62 = (void *)v25[1];
        if (v62)
        {
          do
          {
            BOOL v46 = v62;
            int v62 = (void *)*v62;
          }

          while (v62);
        }

        else
        {
          do
          {
            BOOL v46 = (void *)v25[2];
            BOOL v30 = *v46 == (void)v25;
            uint64_t v25 = v46;
          }

          while (!v30);
        }

        goto LABEL_172;
      case 4:
        int v63 = v14 + 2;
        char v64 = v25 + 4;
        v119[0] = 0LL;
        v119[1] = 0LL;
        if (*((_DWORD *)v25 + 10) == v8) {
          char v65 = 0;
        }
        else {
          char v65 = 0x80;
        }
        v27[2] |= 8u;
        *(_WORD *)char v14 = -3712;
        int v66 = 1;
        int v67 = 15;
        int v115 = v38;
        if (*((_BYTE *)v25 + 32)) {
          goto LABEL_118;
        }
        while (2)
        {
          unint64_t v68 = v37[2];
          *((_BYTE *)v119 + (v68 >> 3)) |= 0x80u >> (v68 & 7);
          __int128 v110 = v63;
          if (!v65)
          {
            *v14 &= ~0x80u;
LABEL_128:
            *v27 &= ~0x80u;
          }

LABEL_129:
          int v111 = v66;
          int v112 = v67;
          uint64_t v69 = (void *)v25[1];
          if (v69)
          {
            do
            {
              int v70 = v69;
              uint64_t v69 = (void *)*v69;
            }

            while (v69);
          }

          else
          {
            do
            {
              int v70 = (void *)v25[2];
              BOOL v30 = *v70 == (void)v25;
              uint64_t v25 = v70;
            }

            while (!v30);
          }

          if (v70 == v26)
          {
LABEL_215:
            uint64_t v25 = (void *)(a1 + 8);
            char v97 = v111;
            unsigned int v96 = v112;
            uint64_t v98 = (v111 - v112);
            int v63 = v110;
            if (v111 < v112) {
              goto LABEL_230;
            }
          }

          else
          {
            while (1)
            {
              unsigned int v72 = *((_DWORD *)v70 + 10);
              if (v72 >= a2 || v72 == 0) {
                break;
              }
              int v74 = (void *)v70[1];
              unint64_t v75 = v74;
              v76 = v70;
              if (v74)
              {
                do
                {
                  int v77 = v75;
                  unint64_t v75 = (void *)*v75;
                }

                while (v75);
              }

              else
              {
                do
                {
                  int v77 = (void *)v76[2];
                  BOOL v30 = *v77 == (void)v76;
                  v76 = v77;
                }

                while (!v30);
              }

              char v78 = v70;
              if (v74)
              {
                do
                {
                  uint64_t v79 = v74;
                  int v74 = (void *)*v74;
                }

                while (v74);
              }

              else
              {
                do
                {
                  uint64_t v79 = (void *)v78[2];
                  BOOL v30 = *v79 == (void)v78;
                  char v78 = v79;
                }

                while (!v30);
              }

              if (*(void **)a1 == v70) {
                *(void *)a1 = v79;
              }
              int v71 = *(uint64_t **)(a1 + 8);
              --*(void *)(a1 + 16);
              sub_14954(v71, v70);
              operator delete(v70);
              int v70 = v77;
              if (v77 == v26) {
                goto LABEL_215;
              }
            }

            int v37 = (char *)v70 + 28;
            if (*((unsigned __int8 *)v70 + 28) == v115 && *((_BYTE *)v70 + 29) == 4)
            {
              char v64 = v70 + 4;
              if (*((_DWORD *)v70 + 9) == v8) {
                char v43 = 0;
              }
              else {
                char v43 = 0x80;
              }
              if (v72 == v8) {
                char v65 = 0;
              }
              else {
                char v65 = 0x80;
              }
              uint64_t v25 = v70;
              int v63 = v110;
              int v66 = v111;
              int v67 = v112;
              if (!*((_BYTE *)v70 + 32)) {
                continue;
              }
LABEL_118:
              if (*((_DWORD *)v64 + 2) >= *((_DWORD *)v64 + 1)) {
                continue;
              }
              ++*v14;
              if ((unint64_t)(v63 + 2) < v118)
              {
                *int v63 = v37[2] | v43;
                v63[1] = *((_BYTE *)v25 + 32);
                __int128 v110 = v63 + 2;
                if (!v43) {
                  goto LABEL_128;
                }
                goto LABEL_129;
              }

LABEL_236:
              LODWORD(v14) = (_DWORD)v63;
              if (v27) {
                goto LABEL_233;
              }
              return ((_DWORD)v14 - (_DWORD)a4);
            }

            uint64_t v25 = v70;
            char v97 = v111;
            unsigned int v96 = v112;
            uint64_t v98 = (v111 - v112);
            int v63 = v110;
            if (v111 < v112)
            {
LABEL_230:
              char v14 = v63;
              goto LABEL_175;
            }
          }

          break;
        }

        v14[1] = v97 | (16 * v96);
        if ((v98 & 0x80000000) != 0) {
          goto LABEL_230;
        }
        int v99 = v98 + 1;
        uint64_t v100 = (char *)v119 + v96;
        if (v98 < 0x1F || v63 - (_BYTE *)v119 - (unint64_t)v96 < 0x20)
        {
          char v14 = v63;
LABEL_221:
          unsigned int v101 = v99 + 1;
          do
          {
            char v102 = *v100++;
            *v14++ = v102;
            --v101;
          }

          while (v101 > 1);
          goto LABEL_175;
        }

        uint64_t v103 = v98 + 1;
        v100 += v103 & 0x1FFFFFFE0LL;
        v99 -= v103 & 0xFFFFFFE0;
        char v14 = &v63[v103 & 0x1FFFFFFE0LL];
        __int16 v104 = v63 + 16;
        char v105 = (__int128 *)((char *)&v119[2] + v96);
        uint64_t v106 = v103 & 0x1FFFFFFE0LL;
        do
        {
          __int128 v107 = *v105;
          *(v104 - 1) = *(v105 - 1);
          *__int16 v104 = v107;
          v104 += 2;
          v105 += 2;
          v106 -= 32LL;
        }

        while (v106);
        if (v103 != (v103 & 0x1FFFFFFE0LL)) {
          goto LABEL_221;
        }
        goto LABEL_175;
      case 6:
        uint64_t v44 = v14 + 1;
        *char v14 = *((_BYTE *)v25 + 32) | v43;
        v81 = (void *)v25[1];
        if (v81)
        {
          do
          {
            BOOL v46 = v81;
            v81 = (void *)*v81;
          }

          while (v81);
        }

        else
        {
          do
          {
            BOOL v46 = (void *)v25[2];
            BOOL v30 = *v46 == (void)v25;
            uint64_t v25 = v46;
          }

          while (!v30);
        }

LABEL_172:
        if (v42 == v8) {
          *v27 &= ~0x80u;
        }
        uint64_t v25 = v46;
        char v14 = v44;
        goto LABEL_175;
      case 7:
        int v116 = v38;
        v27[2] |= 1u;
        *char v14 = v43;
        __int16 v82 = v14 + 1;
        if (v42 == v8) {
          *v27 &= ~0x80u;
        }
        int v113 = v8;
LABEL_181:
        *__int16 v82 = *((_BYTE *)v25 + 30) | v43;
        v82[1] = *((_BYTE *)v25 + 32);
        int v83 = (void *)v25[1];
        __int16 v84 = v25;
        if (v83)
        {
          do
          {
            uint64_t v25 = v83;
            int v83 = (void *)*v83;
          }

          while (v83);
        }

        else
        {
          do
          {
            uint64_t v25 = (void *)v84[2];
            BOOL v30 = *v25 == (void)v84;
            __int16 v84 = v25;
          }

          while (!v30);
        }

        unint64_t v50 = v82 + 2;
        if (v25 == v26) {
          goto LABEL_231;
        }
        while (1)
        {
          unsigned int v86 = *((_DWORD *)v25 + 10);
          if (v86 >= a2 || v86 == 0) {
            break;
          }
          unint64_t v88 = (void *)v25[1];
          v89 = v88;
          unsigned int v90 = v25;
          if (v88)
          {
            do
            {
              unsigned int v91 = v89;
              v89 = (void *)*v89;
            }

            while (v89);
          }

          else
          {
            do
            {
              unsigned int v91 = (void *)v90[2];
              BOOL v30 = *v91 == (void)v90;
              unsigned int v90 = v91;
            }

            while (!v30);
          }

          __int16 v92 = v25;
          if (v88)
          {
            do
            {
              v93 = v88;
              unint64_t v88 = (void *)*v88;
            }

            while (v88);
          }

          else
          {
            do
            {
              v93 = (void *)v92[2];
              BOOL v30 = *v93 == (void)v92;
              __int16 v92 = v93;
            }

            while (!v30);
          }

          if (*(void **)a1 == v25) {
            *(void *)a1 = v93;
          }
          uint64_t v85 = *(uint64_t **)(a1 + 8);
          --*(void *)(a1 + 16);
          sub_14954(v85, v25);
          operator delete(v25);
          uint64_t v25 = v91;
          if (v91 == v26) {
            goto LABEL_231;
          }
        }

        if (*((unsigned __int8 *)v25 + 28) != v116 || *((_BYTE *)v25 + 29) != 7)
        {
LABEL_228:
          char v14 = v50;
          int v8 = v113;
LABEL_175:
          if (v25 == v26) {
            goto LABEL_232;
          }
          continue;
        }

        if ((unint64_t)(v82 + 5) < v118)
        {
          char v95 = *v14;
          if (*((_DWORD *)v25 + 9) == v113)
          {
            char v43 = 0;
            *char v14 = (v95 & 0x7F) + 1;
            *v27 &= ~0x80u;
          }

          else
          {
            *char v14 = v95 + 1;
            char v43 = 0x80;
          }

          v82 += 2;
          goto LABEL_181;
        }

LABEL_231:
        LODWORD(v14) = (_DWORD)v50;
LABEL_232:
        if (v27)
        {
LABEL_233:
          unsigned int v108 = bswap32((*(unsigned __int16 *)v27 << 8) & 0xFC00 | ((_DWORD)v14 - (_DWORD)v27)) >> 16;
          *(_WORD *)BOOL v27 = v108;
          if ((v108 & 0x80) == 0) {
            *a4 &= ~0x80u;
          }
        }

        return ((_DWORD)v14 - (_DWORD)a4);
      default:
        goto LABEL_175;
    }
  }

uint64_t sub_1369C(uint64_t a1, unsigned __int16 *a2, unsigned int a3, MIDITimeStamp time, uint64_t a5)
{
  char v10 = *(_BYTE *)a2;
  char v12 = (unsigned __int8 *)(a2 + 1);
  int v11 = *a2;
  if ((*(_BYTE *)a2 & 0x10) == 0) {
    goto LABEL_17;
  }
  char v13 = *v12;
  if ((*v12 & 0x10) != 0)
  {
    unsigned int v14 = (bswap32(*(unsigned __int16 *)((char *)a2 + 3)) >> 16) & 0xFFF8FFFF | ((v13 & 7) << 16);
    char v12 = (unsigned __int8 *)a2 + 5;
    char v15 = *(_BYTE *)(a1 + 24);
    if ((v13 & 0x40) != 0) {
      goto LABEL_4;
    }
  }

  else
  {
    unsigned int v14 = 0;
    char v12 = (unsigned __int8 *)a2 + 3;
    char v15 = *(_BYTE *)(a1 + 24);
    if ((v13 & 0x40) != 0)
    {
LABEL_4:
      if ((v15 & 0x40) == 0)
      {
        if (v14)
        {
          Byte data = -14;
          char v46 = v14 & 0x7F;
          char v47 = (v14 >> 7) & 0x7F;
          sub_3EBC(a5, time, 3, &data);
          sub_1248C((uint64_t *)a1, a3, time, (char *)&data);
          Byte v16 = -5;
        }

        else
        {
          Byte v16 = -6;
        }

        goto LABEL_16;
      }

      uint64_t v17 = v14 - *(_DWORD *)(a1 + 28);
      if ((int)v17 >= 1)
      {
        double v18 = *(double *)(a1 + 48);
        if (v18 > 0.0)
        {
          int v42 = *a2;
          Byte data = -8;
          unint64_t v19 = (unint64_t)(v18 * 24000000.0);
          MIDITimeStamp v20 = time - v19 * v17;
          unsigned int v21 = v17 + 1;
          do
          {
            sub_3EBC(a5, v20, 1, &data);
            sub_1248C((uint64_t *)a1, a3, v20, (char *)&data);
            v20 += v19;
            --v21;
          }

          while (v21 > 1);
          int v11 = v42;
        }
      }

      goto LABEL_17;
    }
  }

  if ((v15 & 0x40) != 0)
  {
    Byte v16 = -4;
LABEL_16:
    Byte data = v16;
    sub_3EBC(a5, time, 1, &data);
    sub_1248C((uint64_t *)a1, a3, time, (char *)&data);
  }

uint64_t *sub_13AA4(uint64_t *result, char *a2, int a3, int a4, int a5, MIDITimeStamp time, uint64_t a7)
{
  uint64_t v7 = a7;
  char v10 = result;
  int v11 = (uint64_t *)(a2 + 3);
  unsigned int v128 = a5 - 1;
  char v12 = *a2;
  v127 = result;
  if (a5 - a4 != 1 || *a2 < 0)
  {
    if ((*a2 & 0x40) != 0)
    {
      ssize_t result = (uint64_t *)sub_1369C((uint64_t)result, (unsigned __int16 *)(a2 + 3), v128, time, a7);
      int v11 = result;
      char v12 = *a2;
    }

    unsigned int v48 = v128;
    if ((v12 & 0x20) == 0) {
      return result;
    }
    int v49 = 0;
    int v116 = (v12 & 0xF) + 1;
    __int16 v50 = v10 + 1;
    while (1)
    {
      int v118 = v49;
      int v51 = (unsigned __int8 *)v11 + 3;
      unsigned int v122 = *(unsigned __int8 *)v11;
      int v52 = (v122 >> 3) & 0xF;
      int v53 = *((char *)v11 + 2);
      if ((v53 & 0x80000000) == 0) {
        break;
      }
      uint64_t v54 = *v50;
      if (!*v50) {
        goto LABEL_89;
      }
      unsigned int v55 = v52 << 24;
      double v56 = v50;
      do
      {
        unsigned int v57 = bswap32(*(_DWORD *)(v54 + 28));
        BOOL v58 = v57 >= v55;
        if (v57 >= v55) {
          unsigned int v59 = (uint64_t *)v54;
        }
        else {
          unsigned int v59 = (uint64_t *)(v54 + 8);
        }
        if (v58) {
          double v56 = (void *)v54;
        }
        uint64_t v54 = *v59;
      }

      while (*v59);
      if (v56 == v50 || v55 < bswap32(*((_DWORD *)v56 + 7)) || *((_BYTE *)v56 + 32) != (*v51 & 0x7F))
      {
LABEL_89:
        Byte data = v52 | 0xC0;
        char v130 = *v51 & 0x7F;
        sub_3EBC(v7, time, 2, &data);
        ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
      }

      int v51 = (unsigned __int8 *)v11 + 6;
      unsigned __int8 v124 = v53;
      if ((v53 & 0x40) != 0) {
        goto LABEL_96;
      }
LABEL_91:
      unsigned __int8 v60 = v124;
      if ((v124 & 0x10) != 0)
      {
        uint64_t v70 = *v50;
        if (!*v50) {
          goto LABEL_125;
        }
        unsigned int v71 = bswap32(v52 | 0x300);
        unsigned int v72 = v50;
        do
        {
          unsigned int v73 = bswap32(*(_DWORD *)(v70 + 28));
          BOOL v74 = v73 >= v71;
          if (v73 >= v71) {
            unint64_t v75 = (uint64_t *)v70;
          }
          else {
            unint64_t v75 = (uint64_t *)(v70 + 8);
          }
          if (v74) {
            unsigned int v72 = (void *)v70;
          }
          uint64_t v70 = *v75;
        }

        while (*v75);
        if (v72 == v50
          || v71 < bswap32(*((_DWORD *)v72 + 7))
          || *((_BYTE *)v72 + 32) != (*v51 & 0x7F)
          || *((unsigned __int8 *)v72 + 33) != v51[1])
        {
LABEL_125:
          Byte data = v52 | 0xE0;
          char v130 = *v51 & 0x7F;
          char v131 = v51[1];
          sub_3EBC(v7, time, 3, &data);
          ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
        }

        v51 += 2;
        if ((v124 & 8) != 0)
        {
LABEL_127:
          __int128 v120 = (unsigned __int8 *)v11;
          unsigned int v114 = v51[1];
          v76 = v51 + 2;
          int v77 = *v51 & 0x7F;
          if ((*v51 & 0x7F) == 0)
          {
LABEL_147:
            unsigned int v86 = v114 >> 4;
            unsigned int v87 = v114 & 0xF;
            if (v87 >= v114 >> 4)
            {
              uint64_t v115 = v87 - v86;
              int v88 = 8 * v86;
              v89 = v76;
              do
              {
                int v91 = *v89++;
                int v90 = v91;
                if (v91)
                {
                  unsigned int v92 = 128;
                  do
                  {
                    if ((v92 & v90) != 0)
                    {
                      uint64_t v93 = *v50;
                      if (*v50)
                      {
                        unsigned int v94 = bswap32((v122 >> 3) & 0xF | ((v88 & 0x7F) << 16) | 0x400);
                        char v95 = v50;
                        do
                        {
                          unsigned int v96 = bswap32(*(_DWORD *)(v93 + 28));
                          BOOL v97 = v96 >= v94;
                          if (v96 >= v94) {
                            uint64_t v98 = (uint64_t *)v93;
                          }
                          else {
                            uint64_t v98 = (uint64_t *)(v93 + 8);
                          }
                          if (v97) {
                            char v95 = (void *)v93;
                          }
                          uint64_t v93 = *v98;
                        }

                        while (*v98);
                        if (v95 != v50
                          && v94 >= bswap32(*((_DWORD *)v95 + 7))
                          && *((_BYTE *)v95 + 32)
                          && *((_DWORD *)v95 + 10) < *((_DWORD *)v95 + 9))
                        {
                          Byte data = (v122 >> 3) | 0x90;
                          char v130 = v88;
                          char v131 = 0;
                          sub_3EBC(a7, time, 3, &data);
                          ssize_t result = sub_1248C(v127, v128, time, (char *)&data);
                        }
                      }
                    }

                    ++v88;
                    BOOL v39 = v92 >= 2;
                    v92 >>= 1;
                  }

                  while (v39);
                }

                else
                {
                  v88 += 8;
                }

                BOOL v31 = v86++ == v87;
              }

              while (!v31);
              int v51 = &v76[v115 + 1];
              uint64_t v7 = a7;
              char v10 = v127;
              unsigned int v48 = v128;
              int v11 = (uint64_t *)v120;
              unsigned __int8 v60 = v124;
              if ((v124 & 2) == 0) {
                goto LABEL_94;
              }
            }

            else
            {
              int v51 = v76;
              uint64_t v7 = a7;
              int v11 = (uint64_t *)v120;
              unsigned __int8 v60 = v124;
              if ((v124 & 2) == 0) {
                goto LABEL_94;
              }
            }

LABEL_173:
            uint64_t v99 = *v50;
            if (!*v50) {
              goto LABEL_185;
            }
            unsigned int v100 = bswap32(v52 | 0x600);
            unsigned int v101 = v50;
            do
            {
              unsigned int v102 = bswap32(*(_DWORD *)(v99 + 28));
              BOOL v103 = v102 >= v100;
              if (v102 >= v100) {
                __int16 v104 = (uint64_t *)v99;
              }
              else {
                __int16 v104 = (uint64_t *)(v99 + 8);
              }
              if (v103) {
                unsigned int v101 = (void *)v99;
              }
              uint64_t v99 = *v104;
            }

            while (*v104);
            if (v101 == v50 || v100 < bswap32(*((_DWORD *)v101 + 7)) || *((_BYTE *)v101 + 32) != (*v51 & 0x7F))
            {
LABEL_185:
              Byte data = (v122 >> 3) | 0xD0;
              char v130 = *v51 & 0x7F;
              sub_3EBC(v7, time, 2, &data);
              ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
            }

            ++v51;
            if ((v60 & 1) == 0) {
              goto LABEL_73;
            }
LABEL_187:
            unsigned __int8 v106 = *v51;
            char v105 = v51 + 1;
            int v107 = v106 & 0x7F;
            do
            {
              uint64_t v108 = *v50;
              if (!*v50) {
                goto LABEL_188;
              }
              unsigned int v109 = bswap32((v122 >> 3) & 0xF | ((*v105 & 0x7F) << 16) | 0x700);
              __int128 v110 = v50;
              do
              {
                unsigned int v111 = bswap32(*(_DWORD *)(v108 + 28));
                BOOL v112 = v111 >= v109;
                if (v111 >= v109) {
                  int v113 = (uint64_t *)v108;
                }
                else {
                  int v113 = (uint64_t *)(v108 + 8);
                }
                if (v112) {
                  __int128 v110 = (void *)v108;
                }
                uint64_t v108 = *v113;
              }

              while (*v113);
              if (v110 == v50 || v109 < bswap32(*((_DWORD *)v110 + 7)) || *((_BYTE *)v110 + 32) != (v105[1] & 0x7F))
              {
LABEL_188:
                Byte data = v52 | 0xA0;
                char v130 = *v105 & 0x7F;
                char v131 = v105[1];
                sub_3EBC(v7, time, 3, &data);
                ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
              }

              v105 += 2;
              BOOL v63 = v107-- <= 0;
            }

            while (!v63);
            goto LABEL_73;
          }

          while (2)
          {
            char v78 = v76;
            int v79 = v51[2] & 0x7F;
            uint64_t v80 = *v50;
            if (!*v50) {
              goto LABEL_143;
            }
            unsigned int v81 = bswap32(v52 | (v79 << 16) | 0x400);
            __int16 v82 = v50;
            do
            {
              unsigned int v83 = bswap32(*(_DWORD *)(v80 + 28));
              BOOL v84 = v83 >= v81;
              if (v83 >= v81) {
                uint64_t v85 = (uint64_t *)v80;
              }
              else {
                uint64_t v85 = (uint64_t *)(v80 + 8);
              }
              if (v84) {
                __int16 v82 = (void *)v80;
              }
              uint64_t v80 = *v85;
            }

            while (*v85);
            if (v82 != v50
              && v81 >= bswap32(*((_DWORD *)v82 + 7))
              && *((_BYTE *)v82 + 32)
              && *((_DWORD *)v82 + 10) < *((_DWORD *)v82 + 9))
            {
              if (*((unsigned __int8 *)v82 + 32) != v51[3])
              {
                Byte data = (v122 >> 3) | 0x90;
                char v130 = v79;
                char v131 = 0;
                sub_3EBC(v7, time, 3, &data);
                goto LABEL_144;
              }
            }

            else
            {
LABEL_143:
              Byte data = (v122 >> 3) | 0x90;
              char v130 = v79;
LABEL_144:
              char v131 = v51[3];
              sub_3EBC(v7, time, 3, &data);
              ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
            }

            v76 += 2;
            int v51 = v78;
            BOOL v63 = v77-- <= 1;
            if (v63) {
              goto LABEL_147;
            }
            continue;
          }
        }
      }

      else if ((v124 & 8) != 0)
      {
        goto LABEL_127;
      }

      if ((v124 & 2) != 0) {
        goto LABEL_173;
      }
LABEL_94:
      if ((v60 & 1) != 0) {
        goto LABEL_187;
      }
LABEL_73:
      int v11 = (uint64_t *)((char *)v11 + (bswap32(*(_WORD *)v11 & 0xFF03) >> 16));
      int v49 = v118 + 1;
      if (v118 + 1 == v116) {
        return result;
      }
    }

    unsigned __int8 v124 = *((_BYTE *)v11 + 2);
    if ((v53 & 0x40) == 0) {
      goto LABEL_91;
    }
LABEL_96:
    char v61 = *v51++;
    int v62 = v61 & 0x7F;
    do
    {
      uint64_t v64 = *v50;
      if (!*v50) {
        goto LABEL_97;
      }
      unsigned int v65 = bswap32((v122 >> 3) & 0xF | ((*v51 & 0x7F) << 16) | 0x100);
      int v66 = v50;
      do
      {
        unsigned int v67 = bswap32(*(_DWORD *)(v64 + 28));
        BOOL v68 = v67 >= v65;
        if (v67 >= v65) {
          uint64_t v69 = (uint64_t *)v64;
        }
        else {
          uint64_t v69 = (uint64_t *)(v64 + 8);
        }
        if (v68) {
          int v66 = (void *)v64;
        }
        uint64_t v64 = *v69;
      }

      while (*v69);
      if (v66 == v50 || v65 < bswap32(*((_DWORD *)v66 + 7)) || *((_BYTE *)v66 + 32) != (v51[1] & 0x7F))
      {
LABEL_97:
        Byte data = (v122 >> 3) | 0xB0;
        char v130 = *v51 & 0x7F;
        char v131 = v51[1];
        sub_3EBC(v7, time, 3, &data);
        ssize_t result = sub_1248C(v10, v48, time, (char *)&data);
      }

      v51 += 2;
      BOOL v63 = v62-- <= 0;
    }

    while (!v63);
    goto LABEL_91;
  }

  if ((*a2 & 0x40) != 0)
  {
    ssize_t result = (uint64_t *)sub_1369C((uint64_t)result, (unsigned __int16 *)(a2 + 3), v128, time, a7);
    int v11 = result;
    char v12 = *a2;
  }

  if ((v12 & 0x20) != 0)
  {
    int v13 = 0;
    int v121 = (v12 & 0xF) + 1;
    unsigned int v14 = v10 + 1;
    while (1)
    {
      Byte v16 = (char *)v11 + 3;
      unsigned int v15 = *(char *)v11;
      if ((v15 & 0x80000000) != 0) {
        goto LABEL_7;
      }
      int v17 = (v15 >> 3) & 0xF;
      int v18 = *((char *)v11 + 2);
      if (v18 < 0) {
        break;
      }
      unint64_t v19 = v127;
      unsigned int v20 = *(unsigned __int8 *)v11;
      unsigned __int8 v126 = *((_BYTE *)v11 + 2);
      unsigned int v117 = v20;
      if ((v18 & 0x40) != 0) {
        goto LABEL_15;
      }
LABEL_21:
      int v123 = v13;
      if ((v126 & 0x10) != 0)
      {
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = v17 | 0xE0;
          char v130 = *v16 & 0x7F;
          char v131 = v16[1];
          sub_3EBC(v7, time, 3, &data);
          ssize_t result = sub_1248C(v19, v128, time, (char *)&data);
        }

        v16 += 2;
      }

      __int128 v119 = (unsigned __int8 *)v11;
      if ((v126 & 8) != 0)
      {
        uint64_t v26 = *v16 & 0x7F;
        unsigned int v27 = v16[1];
        unsigned int v28 = v27 >> 4;
        uint64_t v29 = v27 & 0xF;
        if ((*v16 & 0x80) != 0)
        {
          if ((*v16 & 0x7F) != 0)
          {
            unsigned int v41 = v26 + 1;
            int v42 = v16;
            do
            {
              int v44 = (char)v42[2];
              v42 += 2;
              char v43 = v44;
              if ((v44 & 0x80000000) == 0)
              {
                Byte data = (v117 >> 3) | 0x90;
                char v130 = v43;
                char v131 = v16[3];
                sub_3EBC(v7, time, 3, &data);
                ssize_t result = sub_1248C(v127, v128, time, (char *)&data);
              }

              --v41;
              Byte v16 = v42;
            }

            while (v41 > 1);
          }

          else
          {
            int v42 = v16;
          }

          Byte v16 = &v42[v29 - v28 + 3];
          unint64_t v19 = v127;
        }

        else
        {
          v16 += 2 * v26 + 2;
          if (v28 <= v29)
          {
            int v30 = 8 * v28;
            do
            {
              int v33 = *v16++;
              int v32 = v33;
              if (v33)
              {
                unsigned int v34 = 128;
                do
                {
                  if ((v34 & v32) != 0)
                  {
                    uint64_t v35 = *v14;
                    if (*v14)
                    {
                      unsigned int v36 = bswap32(v17 & 0xFF80FFFF | ((v30 & 0x7F) << 16) | 0x400);
                      int v37 = v14;
                      do
                      {
                        unsigned int v38 = bswap32(*(_DWORD *)(v35 + 28));
                        BOOL v39 = v38 >= v36;
                        if (v38 >= v36) {
                          int v40 = (uint64_t *)v35;
                        }
                        else {
                          int v40 = (uint64_t *)(v35 + 8);
                        }
                        if (v39) {
                          int v37 = (void *)v35;
                        }
                        uint64_t v35 = *v40;
                      }

                      while (*v40);
                      if (v37 != v14
                        && v36 >= bswap32(*((_DWORD *)v37 + 7))
                        && *((_BYTE *)v37 + 32)
                        && *((_DWORD *)v37 + 10) < *((_DWORD *)v37 + 9))
                      {
                        Byte data = (v117 >> 3) | 0x90;
                        char v130 = v30;
                        char v131 = 0;
                        sub_3EBC(a7, time, 3, &data);
                        ssize_t result = sub_1248C(v127, v128, time, (char *)&data);
                      }
                    }
                  }

                  ++v30;
                  BOOL v39 = v34 >= 2;
                  v34 >>= 1;
                }

                while (v39);
              }

              else
              {
                v30 += 8;
              }

              BOOL v31 = v28++ == (_DWORD)v29;
              unint64_t v19 = v127;
            }

            while (!v31);
          }
        }
      }

      if ((v126 & 2) != 0)
      {
        uint64_t v7 = a7;
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = (v117 >> 3) | 0xD0;
          char v130 = *v16 & 0x7F;
          sub_3EBC(a7, time, 2, &data);
          ssize_t result = sub_1248C(v19, v128, time, (char *)&data);
        }

        ++v16;
        int v11 = (uint64_t *)v119;
        int v13 = v123;
        if ((v126 & 1) == 0) {
          goto LABEL_7;
        }
LABEL_63:
        if (((char)*v16 & 0x80000000) == 0)
        {
          unsigned int v45 = v16 + 1;
          int v46 = *v16 + 1;
          do
          {
            if ((*v45 & 0x80000000) == 0)
            {
              Byte data = v17 | 0xA0;
              char v130 = *v45 & 0x7F;
              char v131 = v45[1];
              sub_3EBC(v7, time, 3, &data);
              ssize_t result = sub_1248C(v127, v128, time, (char *)&data);
            }

            v45 += 2;
            BOOL v47 = __OFSUB__(v46--, 1);
          }

          while (!((v46 < 0) ^ v47 | (v46 == 0)));
        }

        goto LABEL_7;
      }

      uint64_t v7 = a7;
      int v11 = (uint64_t *)v119;
      int v13 = v123;
      if ((v126 & 1) != 0) {
        goto LABEL_63;
      }
LABEL_7:
      int v11 = (uint64_t *)((char *)v11 + (bswap32(*(_WORD *)v11 & 0xFF03) >> 16));
      if (++v13 == v121) {
        return result;
      }
    }

    int v21 = (char)*v16;
    unint64_t v19 = v127;
    if ((v21 & 0x80000000) == 0)
    {
      Byte data = v17 | 0xC0;
      char v130 = v21;
      sub_3EBC(v7, time, 2, &data);
      ssize_t result = sub_1248C(v127, v128, time, (char *)&data);
    }

    Byte v16 = (char *)v11 + 6;
    unsigned int v20 = v15;
    unsigned __int8 v126 = v18;
    unsigned int v117 = v15;
    if ((v18 & 0x40) == 0) {
      goto LABEL_21;
    }
LABEL_15:
    int v22 = (char)*v16;
    int v23 = v22 & 0x7F;
    if (v22 < 0)
    {
      v16 += (2 * (v23 + 1)) + 1;
    }

    else
    {
      ++v16;
      unsigned int v24 = (v20 >> 3) | 0xFFFFFFB0;
      unsigned int v25 = v23 + 2;
      do
      {
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = v24;
          char v130 = *v16 & 0x7F;
          char v131 = v16[1];
          sub_3EBC(v7, time, 3, &data);
          ssize_t result = sub_1248C(v19, v128, time, (char *)&data);
        }

        v16 += 2;
        --v25;
      }

      while (v25 > 1);
    }

    goto LABEL_21;
  }

  return result;
}

void sub_14678(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 88) != a2)
  {
    unsigned __int8 v5 = (void *)(a1 + 8);
    unsigned __int8 v4 = *(void **)a1;
    if (*(void *)a1 != a1 + 8)
    {
      do
      {
        unsigned int v7 = *((_DWORD *)v4 + 10);
        int v8 = (void *)v4[1];
        BOOL v9 = v7 >= a2 || v7 == 0;
        if (v9)
        {
          if (v8)
          {
            do
            {
              char v10 = v8;
              int v8 = (void *)*v8;
            }

            while (v8);
          }

          else
          {
            do
            {
              char v10 = (void *)v4[2];
              BOOL v9 = *v10 == (void)v4;
              unsigned __int8 v4 = v10;
            }

            while (!v9);
          }
        }

        else
        {
          int v11 = (void *)v4[1];
          char v12 = v4;
          if (v8)
          {
            do
            {
              char v10 = v11;
              int v11 = (void *)*v11;
            }

            while (v11);
          }

          else
          {
            do
            {
              char v10 = (void *)v12[2];
              BOOL v9 = *v10 == (void)v12;
              char v12 = v10;
            }

            while (!v9);
          }

          int v13 = v4;
          if (v8)
          {
            do
            {
              unsigned int v14 = v8;
              int v8 = (void *)*v8;
            }

            while (v8);
          }

          else
          {
            do
            {
              unsigned int v14 = (void *)v13[2];
              BOOL v9 = *v14 == (void)v13;
              int v13 = v14;
            }

            while (!v9);
          }

          if (*(void **)a1 == v4) {
            *(void *)a1 = v14;
          }
          int v6 = *(uint64_t **)(a1 + 8);
          --*(void *)(a1 + 16);
          sub_14954(v6, v4);
          operator delete(v4);
        }

        unsigned __int8 v4 = v10;
      }

      while (v10 != v5);
    }

    *(_DWORD *)(a1 + 88) = a2;
  }

uint64_t *sub_147A0(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(_BYTE *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unsigned __int8 v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }

      else
      {
        BOOL v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }

        sockaddr v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8LL * (**(void **)(v2 + 16) != v2)) = v9;
        *BOOL v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }

      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }

LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    _BYTE *v5 = 1;
    if (v3 == result) {
      return result;
    }
  }

  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    unsigned __int8 v5 = (_BYTE *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }

  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }

    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8LL * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }

  else
  {
    a2 = (uint64_t *)a2[2];
  }

  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  int v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  uint64_t v13[2] = v3[2];
  *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v13;
  *int v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *sub_14954(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }

    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    int v6 = (uint64_t **)v3[2];
    uint64_t v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }

LABEL_38:
    unint64_t v19 = (uint64_t *)v7[1];
    if (v19 && !*((_BYTE *)v19 + 24)) {
      goto LABEL_63;
    }
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      uint64_t v12 = result;
LABEL_61:
      *((_BYTE *)v12 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v12 + 24)) {
      goto LABEL_61;
    }
LABEL_24:
    uint64_t v7 = *(uint64_t **)(v12[2] + 8LL * (*(void *)v12[2] == (void)v12));
  }

  if (*((_BYTE *)v7 + 24))
  {
    Byte v16 = (void *)*v7;
    if (!*v7) {
      goto LABEL_49;
    }
LABEL_48:
    if (!*((_BYTE *)v16 + 24)) {
      goto LABEL_67;
    }
  }

  else
  {
    *((_BYTE *)v7 + 24) = 1;
    *((_BYTE *)v14 + 24) = 0;
    unsigned int v20 = (uint64_t *)v7[1];
    *uint64_t v14 = v20;
    if (v20) {
      v20[2] = (uint64_t)v14;
    }
    _DWORD v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    sockaddr v14[2] = v7;
    uint64_t v7 = *v14;
    Byte v16 = (void *)**v14;
    if (v16) {
      goto LABEL_48;
    }
  }

LABEL_49:
  int v21 = (uint64_t *)v7[1];
  if (!v21 || *((_BYTE *)v21 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v12 = (uint64_t *)v7[2];
    if (*((_BYTE *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
    goto LABEL_24;
  }

  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_67:
    int v21 = v7;
  }

  else
  {
    *((_BYTE *)v21 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v22 = *v21;
    v7[1] = *v21;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v21[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v21;
    uint64_t *v21 = (uint64_t)v7;
    _DWORD v7[2] = (uint64_t)v21;
    Byte v16 = v7;
  }

  unsigned int v24 = (uint64_t *)v21[2];
  *((_BYTE *)v21 + 24) = *((_BYTE *)v24 + 24);
  *((_BYTE *)v24 + 24) = 1;
  *((_BYTE *)v16 + 24) = 1;
  uint64_t v25 = *v24;
  uint64_t v26 = *(void *)(*v24 + 8);
  uint64_t *v24 = v26;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  *(void *)(v25 + 16) = v24[2];
  *(void *)(v24[2] + 8LL * (*(void *)v24[2] != (void)v24)) = v25;
  *(void *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

void sub_14D18(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " CAPThread::SetTimeConstraints: thread_policy_set failed, Error: %d (%s)",  (uint8_t *)v2,  0x12u);
}

void sub_14DA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14DD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14E08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14E3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14E70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14EA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14ED8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_14F0C(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)",  (uint8_t *)v2,  0x12u);
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