void sub_100003704(uint64_t a1)
{
  void *v1;
  v1 = (void *)sub_100003B60(a1);
  operator delete(v1);
}

uint64_t sub_100003718(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(a1 + 8));
  uint64_t v3 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v2;
  if (v3) {
    (*(void (**)(void))(a1 + 88))();
  }
  *(void *)(a1 + 88) = sub_100003A98;
  v4 = getenv("CFNETWORKAGENT_FALSESTART_TIMEOUT");
  if (v4) {
    double v5 = (double)strtol(v4, 0LL, 10) * 1000000000.0;
  }
  else {
    double v5 = 6.0e10;
  }
  v6 = *(dispatch_source_s **)(a1 + 80);
  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)v5);
  dispatch_source_set_timer(v6, v7, (unint64_t)v5, 0x3B9ACA00uLL);
  v8 = *(dispatch_source_s **)(a1 + 80);
  handler.version = (CFIndex)_NSConcreteStackBlock;
  handler.info = (void *)3221225472LL;
  handler.retain = (void *(__cdecl *)(void *))sub_100003AC4;
  handler.release = (void (__cdecl *)(void *))&unk_100014930;
  handler.copyDescription = (CFStringRef (__cdecl *)(void *))a1;
  dispatch_source_set_event_handler(v8, &handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 80));
  v9 = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, (CFHTTPMessageRef)qword_1000188B8);
  *(void *)(a1 + 72) = v9;
  if (!v9) {
    goto LABEL_15;
  }
  handler.version = 0LL;
  handler.info = (void *)a1;
  memset(&handler.retain, 0, 24);
  CFReadStreamSetClient(v9, 0x1AuLL, (CFReadStreamClientCallBack)sub_10000399C, &handler);
  CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 8));
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v11 = Mutable;
  if (byte_1000188C0 == 1) {
    CFDictionaryAddValue(Mutable, kCFStreamSSLValidatesCertificateChain, kCFBooleanFalse);
  }
  CFDictionaryAddValue(v11, @"_kCFStreamSSLUseFalseStartNoCompatibilityCheck", kCFBooleanTrue);
  CFDictionaryAddValue(v11, _kCFStreamSSLShouldSetPeerID, kCFBooleanFalse);
  CFReadStreamSetProperty(*(CFReadStreamRef *)(a1 + 72), kCFStreamPropertySSLSettings, v11);
  CFRelease(v11);
  uint64_t result = CFReadStreamOpen(*(CFReadStreamRef *)(a1 + 72));
  if (!(_DWORD)result)
  {
    v13 = CFReadStreamCopyError(*(CFReadStreamRef *)(a1 + 72));
    sub_10000EA38(v13);
    if (v13) {
      CFRelease(v13);
    }
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a1 + 72), 0LL);
LABEL_15:
    *(_BYTE *)(a1 + 48) = 0;
    return sub_10000EDD4((void *)a1);
  }

  if (!*(_BYTE *)(a1 + 48)) {
    return sub_10000EDD4((void *)a1);
  }
  return result;
}

uint64_t sub_10000397C()
{
  return 2LL;
}

const char *sub_100003984()
{
  return "TLSFalseStart";
}

CFStringRef sub_100003990()
{
  return @"FalseStartQuery";
}

void sub_10000399C(CFReadStreamRef stream, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    CFReadStreamSetDispatchQueue(stream, 0LL);
    CFReadStreamClose(stream);
    return;
  }

  if (a2 == 16)
  {
    v6 = (__CFHTTPMessage *)CFReadStreamCopyProperty(stream, kCFStreamPropertyHTTPResponseHeader);
    if (!v6)
    {
      *(_BYTE *)(a3 + 48) = 0;
      return;
    }

    dispatch_time_t v7 = v6;
    if (CFHTTPMessageGetResponseStatusCode(v6) != 200)
    {
      *(_BYTE *)(a3 + 48) = 0;
      CFRelease(v7);
      return;
    }

    CFRelease(v7);
    goto LABEL_12;
  }

  if (a2 == 8)
  {
    double v5 = CFReadStreamCopyError(stream);
    sub_10000EA38(v5);
    *(_BYTE *)(a3 + 48) = 0;
    if (v5) {
      CFRelease(v5);
    }
  }

  if (*(_BYTE *)(a3 + 48))
  {
LABEL_12:
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 72), 0LL);
    CFReadStreamClose(*(CFReadStreamRef *)(a3 + 72));
    uint64_t v8 = *(void *)(a3 + 80);
    *(void *)(a3 + 80) = 0LL;
    if (v8) {
      (*(void (**)(void))(a3 + 88))();
    }
    sub_10000EDD4((void *)a3);
  }
}

void sub_100003A98(dispatch_source_s *a1)
{
  if (a1)
  {
    dispatch_source_cancel(a1);
    dispatch_release(a1);
  }

uint64_t sub_100003AC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "False Start request timer fired",  v4,  2u);
  }

  CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(v1 + 72), 0LL);
  CFReadStreamClose(*(CFReadStreamRef *)(v1 + 72));
  uint64_t v2 = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = 0LL;
  if (v2) {
    (*(void (**)(void))(v1 + 88))();
  }
  *(_BYTE *)(v1 + 48) = 0;
  return sub_10000EDD4((void *)v1);
}

uint64_t sub_100003B60(uint64_t a1)
{
  *(void *)a1 = off_100014900;
  uint64_t v2 = *(const void **)(a1 + 72);
  *(void *)(a1 + 72) = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = 0LL;
  if (v3) {
    (*(void (**)(void))(a1 + 88))();
  }
  return sub_10000ED74(a1);
}

void sub_100003BB0(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = 0LL;
  if (v3) {
    (*(void (**)(void))(v1 + 88))();
  }
  sub_10000ED74(v1);
  _Unwind_Resume(a1);
}

void start()
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  memset(v10, 0, sizeof(v10));
  memset(cf, 0, sizeof(cf));
  memset(&v12, 0, sizeof(v12));
  v13 = v14;
  dispatch_queue_t v15 = 0LL;
  v16 = 0LL;
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.cfnetwork.cfnetworkagent.legacy", v0);
  dispatch_queue_t v5 = v15;
  dispatch_queue_t v15 = v4;
  if (v5) {
    ((void (*)(dispatch_queue_t, uint64_t, uint64_t, uint64_t))v16)(v5, v1, v2, v3);
  }
  v16 = sub_10000D228;
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.info = cf;
  SCDynamicStoreRef v6 = SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"CFNETWORK_AGENT_STORE", 0LL, 0LL, &context);
  CFTypeRef v7 = cf[0];
  cf[0] = v6;
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = getenv("CFNETWORKAGENT_KEY_SPACE_ROOT");
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = "com.apple.CFNetwork.netcompat";
  }
  sub_100009A88(&v17, v9);
  if (SHIBYTE(cf[3]) < 0) {
    operator delete((void *)cf[1]);
  }
  *(_OWORD *)&cf[1] = v17;
  cf[3] = v18;
  std::string::operator=(&v12, (const std::string *)&cf[1]);
  std::string::append(&v12, ":");
  std::string::append(&v12, "com.apple.CFNetwork.netcompat.lastpurge");
  sub_100003E4C((uint64_t)v10);
  dispatch_main();
}

void sub_100003D48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void (*a10)(void), uint64_t a11, void (*a12)(void), CFTypeRef cf, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, char *a27, uint64_t a28, uint64_t a29, void (*a30)(void))
{
  if (a29) {
    a30();
  }
  sub_10000D234(a27);
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (a11) {
    a12();
  }
  if (a9) {
    a10();
  }
  _Unwind_Resume(a1);
}

void sub_100003DD4(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CFNetworkAgent received signal=%d, shutting down.",  (uint8_t *)v2,  8u);
  }

  exit(a1);
}

void sub_100003E4C(uint64_t a1)
{
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v2;
  if (v3)
  {
    (*(void (**)(uint64_t))(a1 + 24))(v3);
    uint64_t v2 = *(dispatch_source_s **)(a1 + 16);
  }

  *(void *)(a1 + 24) = sub_100006634;
  sub_100004134(v2);
  dispatch_queue_t v4 = *(dispatch_source_s **)(a1 + 16);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100006660;
  handler[3] = &unk_100014930;
  handler[4] = a1;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 16));
  dispatch_queue_t v5 = getenv("CFNETWORKAGENT_SERVICE_NAME");
  if (!v5) {
    dispatch_queue_t v5 = "com.apple.cfnetwork.cfnetworkagent";
  }
  mach_service = xpc_connection_create_mach_service(v5, &_dispatch_main_q, 1uLL);
  xpc_connection_t v7 = *(xpc_connection_t *)a1;
  *(void *)a1 = mach_service;
  if (v7)
  {
    (*(void (**)(xpc_connection_t))(a1 + 8))(v7);
    mach_service = *(_xpc_connection_s **)a1;
  }

  *(void *)(a1 + 8) = &_xpc_release;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003F88;
  v8[3] = &unk_100014950;
  v8[4] = a1;
  xpc_connection_set_event_handler(mach_service, v8);
  xpc_connection_resume(*(xpc_connection_t *)a1);
}

void sub_100003F88(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  sub_100004134(*(dispatch_source_s **)(v3 + 16));
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received XPC XPC_TYPE_CONNECTION",  (uint8_t *)&v8,  2u);
    }

    xpc_connection_set_target_queue((xpc_connection_t)a2, &_dispatch_main_q);
    *(void *)&__int128 v8 = _NSConcreteStackBlock;
    *((void *)&v8 + 1) = 3221225472LL;
    v9 = sub_1000041B0;
    v10 = &unk_100014978;
    v11 = a2;
    uint64_t v12 = v3;
    xpc_connection_set_event_handler((xpc_connection_t)a2, &v8);
    xpc_connection_resume((xpc_connection_t)a2);
  }

  else
  {
    xpc_type_t v5 = type;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v5 == (xpc_type_t)&_xpc_type_error)
    {
      if (v6)
      {
        LODWORD(v8) = 138412290;
        *(void *)((char *)&v8 + 4) = a2;
        xpc_connection_t v7 = "Received XPC error %@";
        goto LABEL_11;
      }
    }

    else if (v6)
    {
      LODWORD(v8) = 138412290;
      *(void *)((char *)&v8 + 4) = v5;
      xpc_connection_t v7 = "Received XPC type %@";
LABEL_11:
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  v7,  (uint8_t *)&v8,  0xCu);
    }
  }

void sub_100004134(dispatch_source_s *a1)
{
  uint64_t v2 = getenv("CFNETWORKAGENT_TIMEOUT");
  if (v2) {
    double v3 = (double)strtol(v2, 0LL, 10) * 1000000000.0;
  }
  else {
    double v3 = 1.2e11;
  }
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)v3);
  dispatch_source_set_timer(a1, v4, (unint64_t)v3, 0x3B9ACA00uLL);
}

void sub_1000041B0(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = (uint64_t)buf;
  uint64_t v5 = *(void *)(a1 + 40);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = object;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received xpc connection error %@",  buf,  0xCu);
    }

    return;
  }

  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  int64_t int64 = xpc_dictionary_get_int64(object, "type");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    else {
      __int128 v8 = off_100014F60[int64 - 1];
    }
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = int64;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Handling incoming message type %lld %s",  buf,  0x16u);
  }

  if ((unint64_t)(int64 - 1) < 2)
  {
    string = (char *)xpc_dictionary_get_string(object, "sig");
    if (string)
    {
      sub_100009A88(length, string);
      v28 = *(dispatch_queue_s **)(v5 + 112);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3321888768LL;
      *(void *)&buf[16] = sub_10000D27C;
      *(void *)&buf[24] = &unk_100014EF8;
      uint64_t v215 = v5 + 32;
      int64_t v216 = int64;
      if (SHIBYTE(v212) < 0)
      {
        sub_100009910(&__p, (void *)length[0], length[1]);
      }

      else
      {
        __int128 __p = *(_OWORD *)length;
        v218 = v212;
      }

      v219 = string;
      dispatch_async(v28, buf);
      if (SHIBYTE(v218) < 0) {
        operator delete((void *)__p);
      }
      if (SHIBYTE(v212) < 0) {
        operator delete((void *)length[0]);
      }
      return;
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = int64;
    v29 = "Received legacy query with no signature (type=%d)";
    uint32_t v30 = 8;
LABEL_33:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v29, buf, v30);
    return;
  }

  if (int64 == 5)
  {
    sub_10000E704((SCDynamicStoreRef *)(v5 + 32));
    return;
  }

  if (int64 != 3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)buf = 0;
    v29 = "Unknown message type";
    uint32_t v30 = 2;
    goto LABEL_33;
  }

  v9 = *(void **)(a1 + 32);
  v10 = (std::__shared_weak_count_vtbl *)xpc_retain(v9);
  v202 = v10;
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&off_100014A08;
  v11->__shared_weak_owners_ = 0LL;
  v11[1].__vftable = v10;
  v203 = v11;
  v13 = (std::__shared_weak_count_vtbl *)xpc_retain(object);
  v200 = v13;
  v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__shared_owners_ = 0LL;
  dispatch_queue_t v15 = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_100014A40;
  v14->__shared_weak_owners_ = 0LL;
  v14[1].__vftable = v13;
  v201 = v14;
  v194[0] = _NSConcreteStackBlock;
  v194[1] = 3321888768LL;
  v194[2] = sub_100005A18;
  v194[3] = &unk_1000149C8;
  v194[4] = v13;
  v195 = v14;
  do
    unint64_t v16 = __ldxr(v15);
  while (__stxr(v16 + 1, v15));
  v196 = v10;
  v197 = v11;
  do
    unint64_t v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  v18 = (char *)operator new(0x78uLL);
  *((void *)v18 + 1) = 0LL;
  v19 = (unint64_t *)(v18 + 8);
  *((void *)v18 + 2) = 0LL;
  *(void *)v18 = off_100014A78;
  sub_100005CF0(buf, v194);
  uint64_t v20 = *(void *)&buf[8];
  *((void *)v18 + 12) = *(void *)buf;
  v188 = (const void **)(v18 + 24);
  v189 = (const void **)(v18 + 72);
  *((void *)v18 + 11) = 0LL;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  *(_OWORD *)(v18 + 40) = 0u;
  *((void *)v18 + 13) = v20;
  if (v20)
  {
    v21 = (unint64_t *)(v20 + 8);
    do
      unint64_t v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }

  v18[112] = 0;
  v23 = xpc_dictionary_get_string(v13, "source");
  if (!v23)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    LOWORD(length[0]) = 0;
    v31 = "Invalid PAC data source";
    goto LABEL_324;
  }

  int64_t v24 = xpc_dictionary_get_int64(v13, "dtype");
  if (v24 != 1)
  {
    if (v24 == 2)
    {
      CFIndex v25 = strlen(v23);
      v26 = (void *)CFStringCreateWithBytes(0LL, (const UInt8 *)v23, v25, 0x8000100u, 0);
      goto LABEL_42;
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    LOWORD(length[0]) = 0;
    v31 = "Invalid PAC data source type";
LABEL_324:
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v31,  (uint8_t *)length,  2u);
    goto LABEL_45;
  }

  v18[112] = 1;
  CFIndex v32 = strlen(v23);
  v26 = CFURLCreateWithBytes(0LL, (const UInt8 *)v23, v32, 0x8000100u, 0LL);
LABEL_42:
  v33 = v26;
  v34 = *v188;
  *v188 = v33;
  if (v34) {
    CFRelease(v34);
  }
LABEL_45:
  v35 = xpc_dictionary_get_string(v13, "target");
  v36 = (const UInt8 *)v35;
  if (v35)
  {
    CFIndex v37 = strlen(v35);
    CFURLRef v38 = CFURLCreateWithBytes(0LL, v36, v37, 0x8000100u, 0LL);
    v39 = (const void *)*((void *)v18 + 4);
    *((void *)v18 + 4) = v38;
    if (v39) {
      CFRelease(v39);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    LOWORD(length[0]) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid PAC target URL",  (uint8_t *)length,  2u);
  }

  sub_100005D84(v13, "user", (const void **)v18 + 5);
  sub_100005D84(v13, "pass", (const void **)v18 + 6);
  sub_100005D84(v13, "bundle", (const void **)v18 + 8);
  sub_100005D84(v13, "prefix", v189);
  length[0] = 0LL;
  data = (const UInt8 *)xpc_dictionary_get_data(v13, "audit", length);
  if (data)
  {
    CFDataRef v41 = CFDataCreate(0LL, data, length[0]);
    v42 = (const void *)*((void *)v18 + 7);
    *((void *)v18 + 7) = v41;
    if (v42) {
      CFRelease(v42);
    }
  }

  v43 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v44 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }

  v198 = v18 + 24;
  v199 = (std::__shared_weak_count *)v18;
  uint64_t v46 = *((void *)v18 + 8);
  if (*(_OWORD *)(v18 + 56) == 0LL)
  {
    memset(buf, 0, sizeof(buf));
    xpc_connection_get_audit_token(v9, buf);
    *(_OWORD *)bytes = *(_OWORD *)buf;
    __int128 v193 = *(_OWORD *)&buf[16];
    CFDataRef v47 = CFDataCreate(0LL, bytes, 32LL);
    v48 = (const void *)*((void *)v18 + 7);
    *((void *)v18 + 7) = v47;
    if (v48) {
      CFRelease(v48);
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = *((void *)v18 + 7);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v46;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v49;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC handling query for id %@ token %p",  buf,  0x16u);
  }

  if (qword_1000188D0 != -1) {
    dispatch_once(&qword_1000188D0, &stru_100014C18);
  }
  uint64_t v50 = qword_1000188D8;
  v191 = (std::__shared_weak_count *)v18;
  do
    unint64_t v51 = __ldxr(v19);
  while (__stxr(v51 + 1, v19));
  v207 = v18 + 24;
  v208 = (std::__shared_weak_count *)v18;
  do
    unint64_t v52 = __ldxr(v19);
  while (__stxr(v52 + 1, v19));
  size_t v54 = *(void *)v50;
  v53 = *(std::__shared_weak_count **)(v50 + 8);
  *(void *)&__int128 v206 = *(void *)v50;
  *((void *)&v206 + 1) = v53;
  if (v53)
  {
    v55 = (unint64_t *)&v53->__shared_owners_;
    do
      unint64_t v56 = __ldxr(v55);
    while (__stxr(v56 + 1, v55));
  }

  uint64_t v204 = 0LL;
  uint64_t v205 = 0LL;
  std::mutex::lock((std::mutex *)(v50 + 56));
  if (sub_10000EAD4(*(int **)(v50 + 120)))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC clearing cache since a network or proxy change has occurred",  buf,  2u);
    }

    if (*(void *)(v50 + 40))
    {
      sub_1000092E4(*(void **)(v50 + 32));
      *(void *)(v50 + 32) = 0LL;
      uint64_t v57 = *(void *)(v50 + 24);
      if (v57)
      {
        for (uint64_t i = 0LL; i != v57; ++i)
          *(void *)(*(void *)(v50 + 16) + 8 * i) = 0LL;
      }

      *(void *)(v50 + 40) = 0LL;
    }
  }

  sub_100009A88(&v209, (char *)&unk_100011567);
  v59 = (const __CFURL *)*((void *)v18 + 3);
  v187 = v53;
  if (v18[112]) {
    v59 = (const __CFURL *)CFURLGetString(v59);
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = 1023LL;
  if (v59)
  {
    v60 = sub_10000A2CC(0LL, (CFStringRef)v59, &buf[24], (uint64_t *)&buf[8]);
  }

  else
  {
    buf[24] = 0;
    *(void *)&buf[8] = 0LL;
    v60 = &buf[24];
  }

  *(void *)&buf[16] = v60;
  if (v18[112])
  {
    v61 = (const __CFString *)*v189;
    if (*v189)
    {
      length[0] = 0LL;
      length[1] = 1023LL;
      v212 = sub_10000A2CC(0LL, v61, v213, (uint64_t *)&length[1]);
      sub_100009A88(&v210, (char *)v212);
      std::string v209 = v210;
      if (v212 && v213 != v212) {
        CFAllocatorDeallocate((CFAllocatorRef)length[0], v212);
      }
      v60 = *(UInt8 **)&buf[16];
    }
  }

  sub_100009A88(length, (char *)v60);
  if (SHIBYTE(v212) >= 0) {
    v62 = length;
  }
  else {
    v62 = (size_t *)length[0];
  }
  if (SHIBYTE(v212) >= 0) {
    std::string::size_type v63 = HIBYTE(v212);
  }
  else {
    std::string::size_type v63 = length[1];
  }
  std::string::append(&v209, (const std::string::value_type *)v62, v63);
  if (SHIBYTE(v212) < 0) {
    operator delete((void *)length[0]);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v171 = &v209;
    if ((v209.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v171 = (std::string *)v209.__r_.__value_.__r.__words[0];
    }
    LODWORD(length[0]) = 136315138;
    *(size_t *)((char *)length + 4) = (size_t)v171;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "PAC query key %s",  (uint8_t *)length,  0xCu);
  }

  size_t v190 = v54;
  if ((v209.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v64 = &v209;
  }
  else {
    v64 = (std::string *)v209.__r_.__value_.__r.__words[0];
  }
  if ((v209.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t size = v209.__r_.__value_.__s.__size_;
  }
  else {
    unint64_t size = v209.__r_.__value_.__l.__size_;
  }
  unint64_t v66 = sub_10000943C((uint64_t *)v64, size);
  int8x8_t v67 = *(int8x8_t *)(v50 + 24);
  if (v67)
  {
    unint64_t v68 = v66;
    uint8x8_t v69 = (uint8x8_t)vcnt_s8(v67);
    v69.i16[0] = vaddlv_u8(v69);
    unint64_t v70 = v69.u32[0];
    if (v69.u32[0] > 1uLL)
    {
      unint64_t v71 = v66;
      if (v66 >= *(void *)&v67) {
        unint64_t v71 = v66 % *(void *)&v67;
      }
    }

    else
    {
      unint64_t v71 = (*(void *)&v67 - 1LL) & v66;
    }

    v72 = *(unsigned __int8 ***)(*(void *)(v50 + 16) + 8 * v71);
    if (v72)
    {
      for (j = *v72; j; j = *(unsigned __int8 **)j)
      {
        unint64_t v74 = *((void *)j + 1);
        if (v74 == v68)
        {
          if (sub_100009870(j + 16, (unsigned __int8 *)&v209))
          {
            uint64_t v164 = *((void *)j + 5);
            std::mutex::lock((std::mutex *)(v164 + 80));
            if (*(double *)(v164 + 144) == 0.0)
            {
              std::mutex::unlock((std::mutex *)(v164 + 80));
            }

            else
            {
              double Current = CFAbsoluteTimeGetCurrent();
              double v166 = *(double *)(v164 + 144);
              std::mutex::unlock((std::mutex *)(v164 + 80));
              if (Current > v166)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v167 = &v209;
                  if ((v209.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                    v167 = (std::string *)v209.__r_.__value_.__r.__words[0];
                  }
                  *(_DWORD *)buf = 136315138;
                  *(void *)&buf[4] = v167;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC for key %s is expired, evicting",  buf,  0xCu);
                }

                int8x8_t v168 = *(int8x8_t *)(v50 + 24);
                unint64_t v169 = *((void *)j + 1);
                uint8x8_t v170 = (uint8x8_t)vcnt_s8(v168);
                v170.i16[0] = vaddlv_u8(v170);
                if (v170.u32[0] > 1uLL)
                {
                  if (v169 >= *(void *)&v168) {
                    v169 %= *(void *)&v168;
                  }
                }

                else
                {
                  v169 &= *(void *)&v168 - 1LL;
                }

                uint64_t v180 = *(void *)(v50 + 16);
                v181 = *(unsigned __int8 **)(v180 + 8 * v169);
                do
                {
                  v182 = v181;
                  v181 = *(unsigned __int8 **)v181;
                }

                while (v181 != j);
                unint64_t v183 = *((void *)v182 + 1);
                if (v170.u32[0] > 1uLL)
                {
                  if (v183 >= *(void *)&v168) {
                    v183 %= *(void *)&v168;
                  }
                }

                else
                {
                  v183 &= *(void *)&v168 - 1LL;
                }

                if (v183 != v169)
                {
LABEL_340:
                  if (!*(void *)j) {
                    goto LABEL_341;
                  }
                  unint64_t v184 = *(void *)(*(void *)j + 8LL);
                  if (v170.u32[0] > 1uLL)
                  {
                    if (v184 >= *(void *)&v168) {
                      v184 %= *(void *)&v168;
                    }
                  }

                  else
                  {
                    v184 &= *(void *)&v168 - 1LL;
                  }

                  if (v184 != v169) {
LABEL_341:
                  }
                    *(void *)(v180 + 8 * v169) = 0LL;
                }

                v185 = *(unsigned __int8 **)j;
                if (*(void *)j)
                {
                  unint64_t v186 = *((void *)v185 + 1);
                  if (v170.u32[0] > 1uLL)
                  {
                    if (v186 >= *(void *)&v168) {
                      v186 %= *(void *)&v168;
                    }
                  }

                  else
                  {
                    v186 &= *(void *)&v168 - 1LL;
                  }

                  if (v186 != v169)
                  {
                    *(void *)(*(void *)(v50 + 16) + 8 * v186) = v182;
                    v185 = *(unsigned __int8 **)j;
                  }
                }

                *(void *)v182 = v185;
                *(void *)j = 0LL;
                --*(void *)(v50 + 40);
                *(void *)buf = j;
                *(void *)&buf[8] = v50 + 32;
                buf[16] = 1;
                sub_1000093F8((uint64_t)buf);
                break;
              }
            }

            uint64_t v173 = *((void *)j + 5);
            *(void *)buf = v18 + 24;
            *(void *)&buf[8] = v18;
            do
              unint64_t v174 = __ldxr(v19);
            while (__stxr(v174 + 1, v19));
            v131 = v187;
            length[0] = v190;
            length[1] = (size_t)v187;
            if (v187)
            {
              v175 = (unint64_t *)&v187->__shared_owners_;
              do
                unint64_t v176 = __ldxr(v175);
              while (__stxr(v176 + 1, v175));
            }

            sub_10000689C(v173, (uint64_t *)buf, (uint64_t *)length);
            if (v187)
            {
              v177 = (unint64_t *)&v187->__shared_owners_;
              do
                unint64_t v178 = __ldaxr(v177);
              while (__stlxr(v178 - 1, v177));
              if (!v178)
              {
                ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
                std::__shared_weak_count::__release_weak(v187);
              }
            }

            v139 = *(std::__shared_weak_count **)&buf[8];
            if (*(void *)&buf[8])
            {
              v179 = (unint64_t *)(*(void *)&buf[8] + 8LL);
              do
                unint64_t v141 = __ldaxr(v179);
              while (__stlxr(v141 - 1, v179));
              goto LABEL_244;
            }

            goto LABEL_246;
          }
        }

        else
        {
          if (v70 > 1)
          {
            if (v74 >= *(void *)&v67) {
              v74 %= *(void *)&v67;
            }
          }

          else
          {
            v74 &= *(void *)&v67 - 1LL;
          }

          if (v74 != v71) {
            break;
          }
        }
      }
    }
  }

  v75 = (std::__shared_weak_count *)operator new(0xB8uLL);
  *(_OWORD *)&v75->__shared_owners_ = 0u;
  v76 = (unint64_t *)&v75->__shared_owners_;
  v75->__vftable = (std::__shared_weak_count_vtbl *)off_100014CB8;
  v75[1].std::__shared_count = 0u;
  v77 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v78 = dispatch_queue_create("com.apple.cfnetwork.pac", v77);
  v75[1].__shared_weak_owners_ = (uint64_t)v78;
  v79 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
  v79->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&off_100014B80;
  v79->~__shared_weak_count_0 = 0LL;
  v79->__on_zero_shared = 0LL;
  v79->__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v78;
  v79->__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))&_dispatch_release;
  v75[2].__vftable = v79;
  *(_OWORD *)&v75[2].__shared_owners_ = 0u;
  v75[3].std::__shared_count = 0u;
  *(_OWORD *)&v75[3].__shared_weak_owners_ = 0u;
  v75[4].__shared_owners_ = 850045863LL;
  *(_OWORD *)&v75[4].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v75[5].__shared_owners_ = 0u;
  v75[6].std::__shared_count = 0u;
  *(_OWORD *)&v75[6].__shared_weak_owners_ = 0u;
  LOBYTE(v75[7].__shared_owners_) = 0;
  length[0] = (size_t)&v75[1];
  length[1] = (size_t)v75;
  shared_owners = (std::__shared_weak_count *)v75[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1) {
      goto LABEL_140;
    }
    do
      unint64_t v81 = __ldxr(v76);
    while (__stxr(v81 + 1, v76));
    p_shared_weak_owners = (unint64_t *)&v75->__shared_weak_owners_;
    do
      unint64_t v83 = __ldxr(p_shared_weak_owners);
    while (__stxr(v83 + 1, p_shared_weak_owners));
    v75[1].__vftable = (std::__shared_weak_count_vtbl *)&v75[1];
    v75[1].__shared_owners_ = (uint64_t)v75;
    std::__shared_weak_count::__release_weak(shared_owners);
  }

  else
  {
    do
      unint64_t v84 = __ldxr(v76);
    while (__stxr(v84 + 1, v76));
    v85 = (unint64_t *)&v75->__shared_weak_owners_;
    do
      unint64_t v86 = __ldxr(v85);
    while (__stxr(v86 + 1, v85));
    v75[1].__vftable = (std::__shared_weak_count_vtbl *)&v75[1];
    v75[1].__shared_owners_ = (uint64_t)v75;
  }

  do
    unint64_t v87 = __ldaxr(v76);
  while (__stlxr(v87 - 1, v76));
  if (!v87)
  {
    ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
    std::__shared_weak_count::__release_weak(v75);
  }

LABEL_140:
  int v88 = (char)v209.__r_.__value_.__s.__size_;
  __int128 v89 = *(_OWORD *)&v209.__r_.__value_.__l.__data_;
  if ((v209.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v90 = &v209;
  }
  else {
    v90 = (std::string *)v209.__r_.__value_.__r.__words[0];
  }
  if ((v209.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t v91 = v209.__r_.__value_.__s.__size_;
  }
  else {
    unint64_t v91 = v209.__r_.__value_.__l.__size_;
  }
  unint64_t v92 = sub_10000943C((uint64_t *)v90, v91);
  unint64_t v93 = v92;
  unint64_t v94 = *(void *)(v50 + 24);
  if (v94)
  {
    uint8x8_t v95 = (uint8x8_t)vcnt_s8((int8x8_t)v94);
    v95.i16[0] = vaddlv_u8(v95);
    unint64_t v96 = v95.u32[0];
    if (v95.u32[0] > 1uLL)
    {
      uint64_t v4 = v92;
      if (v92 >= v94) {
        uint64_t v4 = v92 % v94;
      }
    }

    else
    {
      uint64_t v4 = (v94 - 1) & v92;
    }

    v97 = *(unsigned __int8 ***)(*(void *)(v50 + 16) + 8 * v4);
    if (v97)
    {
      for (k = *v97; k; k = *(unsigned __int8 **)k)
      {
        unint64_t v99 = *((void *)k + 1);
        if (v99 == v93)
        {
        }

        else
        {
          if (v96 > 1)
          {
            if (v99 >= v94) {
              v99 %= v94;
            }
          }

          else
          {
            v99 &= v94 - 1;
          }

          if (v99 != v4) {
            break;
          }
        }
      }
    }
  }

  v100 = operator new(0x38uLL);
  v101 = (void *)(v50 + 32);
  *(void *)buf = v100;
  *(void *)&buf[8] = v50 + 32;
  buf[16] = 0;
  v102 = v100 + 2;
  void *v100 = 0LL;
  v100[1] = v93;
  if (v88 < 0)
  {
    sub_100009910(v102, (void *)v89, *((unint64_t *)&v89 + 1));
  }

  else
  {
    *(_OWORD *)v102 = *(_OWORD *)&v209.__r_.__value_.__l.__data_;
    v100[4] = v209.__r_.__value_.__l.__cap_;
  }

  size_t v103 = length[1];
  v100[5] = length[0];
  v100[6] = v103;
  if (v103)
  {
    v104 = (unint64_t *)(v103 + 8);
    do
      unint64_t v105 = __ldxr(v104);
    while (__stxr(v105 + 1, v104));
  }

  buf[16] = 1;
  float v106 = (float)(unint64_t)(*(void *)(v50 + 40) + 1LL);
  float v107 = *(float *)(v50 + 48);
  if (!v94 || (float)(v107 * (float)v94) < v106)
  {
    BOOL v108 = 1LL;
    if (v94 >= 3) {
      BOOL v108 = (v94 & (v94 - 1)) != 0;
    }
    unint64_t v109 = v108 | (2 * v94);
    unint64_t v110 = vcvtps_u32_f32(v106 / v107);
    if (v109 <= v110) {
      int8x8_t prime = (int8x8_t)v110;
    }
    else {
      int8x8_t prime = (int8x8_t)v109;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v94 = *(void *)(v50 + 24);
    if (*(void *)&prime > v94) {
      goto LABEL_181;
    }
    if (*(void *)&prime < v94)
    {
      unint64_t v118 = vcvtps_u32_f32((float)*(unint64_t *)(v50 + 40) / *(float *)(v50 + 48));
      if (v94 < 3 || (uint8x8_t v119 = (uint8x8_t)vcnt_s8((int8x8_t)v94), v119.i16[0] = vaddlv_u8(v119), v119.u32[0] > 1uLL))
      {
        unint64_t v118 = std::__next_prime(v118);
      }

      else
      {
        uint64_t v120 = 1LL << -(char)__clz(v118 - 1);
        if (v118 >= 2) {
          unint64_t v118 = v120;
        }
      }

      if (*(void *)&prime <= v118) {
        int8x8_t prime = (int8x8_t)v118;
      }
      if (*(void *)&prime >= v94)
      {
        unint64_t v94 = *(void *)(v50 + 24);
      }

      else
      {
        if (prime)
        {
LABEL_181:
          if (*(void *)&prime >> 61) {
            sub_1000091D8();
          }
          v112 = operator new(8LL * *(void *)&prime);
          v113 = *(void **)(v50 + 16);
          *(void *)(v50 + 16) = v112;
          if (v113) {
            operator delete(v113);
          }
          uint64_t v114 = 0LL;
          *(int8x8_t *)(v50 + 24) = prime;
          do
            *(void *)(*(void *)(v50 + 16) + 8 * v114++) = 0LL;
          while (*(void *)&prime != v114);
          v115 = (void *)*v101;
          if (*v101)
          {
            unint64_t v116 = v115[1];
            uint8x8_t v117 = (uint8x8_t)vcnt_s8(prime);
            v117.i16[0] = vaddlv_u8(v117);
            if (v117.u32[0] > 1uLL)
            {
              if (v116 >= *(void *)&prime) {
                v116 %= *(void *)&prime;
              }
            }

            else
            {
              v116 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)(v50 + 16) + 8 * v116) = v101;
            v121 = (void *)*v115;
            if (*v115)
            {
              do
              {
                unint64_t v122 = v121[1];
                if (v117.u32[0] > 1uLL)
                {
                  if (v122 >= *(void *)&prime) {
                    v122 %= *(void *)&prime;
                  }
                }

                else
                {
                  v122 &= *(void *)&prime - 1LL;
                }

                if (v122 != v116)
                {
                  uint64_t v123 = *(void *)(v50 + 16);
                  if (!*(void *)(v123 + 8 * v122))
                  {
                    *(void *)(v123 + 8 * v122) = v115;
                    goto LABEL_206;
                  }

                  void *v115 = *v121;
                  void *v121 = **(void **)(*(void *)(v50 + 16) + 8 * v122);
                  **(void **)(*(void *)(v50 + 16) + 8 * v122) = v121;
                  v121 = v115;
                }

                unint64_t v122 = v116;
LABEL_206:
                v115 = v121;
                v121 = (void *)*v121;
                unint64_t v116 = v122;
              }

              while (v121);
            }
          }

          unint64_t v94 = (unint64_t)prime;
          goto LABEL_210;
        }

        v172 = *(void **)(v50 + 16);
        *(void *)(v50 + 16) = 0LL;
        if (v172) {
          operator delete(v172);
        }
        unint64_t v94 = 0LL;
        *(void *)(v50 + 24) = 0LL;
      }
    }

LABEL_210:
    if ((v94 & (v94 - 1)) != 0)
    {
      if (v93 >= v94) {
        uint64_t v4 = v93 % v94;
      }
      else {
        uint64_t v4 = v93;
      }
    }

    else
    {
      uint64_t v4 = (v94 - 1) & v93;
    }
  }

  v124 = *(void **)(*(void *)(v50 + 16) + 8 * v4);
  uint64_t v125 = *(void *)buf;
  if (v124)
  {
    **(void **)buf = *v124;
  }

  else
  {
    **(void **)buf = *(void *)(v50 + 32);
    *(void *)(v50 + 32) = v125;
    *(void *)(*(void *)(v50 + 16) + 8 * v4) = v101;
    if (!*(void *)v125) {
      goto LABEL_224;
    }
    unint64_t v126 = *(void *)(*(void *)v125 + 8LL);
    if ((v94 & (v94 - 1)) != 0)
    {
      if (v126 >= v94) {
        v126 %= v94;
      }
    }

    else
    {
      v126 &= v94 - 1;
    }

    v124 = (void *)(*(void *)(v50 + 16) + 8 * v126);
  }

  void *v124 = v125;
LABEL_224:
  *(void *)buf = 0LL;
  ++*(void *)(v50 + 40);
  sub_1000093F8((uint64_t)buf);
LABEL_225:
  uint64_t v127 = length[0];
  *(void *)buf = v207;
  *(void *)&buf[8] = v208;
  if (v208)
  {
    v128 = (unint64_t *)&v208->__shared_owners_;
    do
      unint64_t v129 = __ldxr(v128);
    while (__stxr(v129 + 1, v128));
  }

  v130 = (std::__shared_weak_count *)*((void *)&v206 + 1);
  *(_OWORD *)&v210.__r_.__value_.__l.__data_ = v206;
  v131 = v187;
  if (*((void *)&v206 + 1))
  {
    v132 = (unint64_t *)(*((void *)&v206 + 1) + 8LL);
    do
      unint64_t v133 = __ldxr(v132);
    while (__stxr(v133 + 1, v132));
  }

  sub_10000689C(v127, (uint64_t *)buf, (uint64_t *)&v210);
  if (v130)
  {
    v134 = (unint64_t *)&v130->__shared_owners_;
    do
      unint64_t v135 = __ldaxr(v134);
    while (__stlxr(v135 - 1, v134));
    if (!v135)
    {
      ((void (*)(std::__shared_weak_count *))v130->__on_zero_shared)(v130);
      std::__shared_weak_count::__release_weak(v130);
    }
  }

  v136 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    v137 = (unint64_t *)(*(void *)&buf[8] + 8LL);
    do
      unint64_t v138 = __ldaxr(v137);
    while (__stlxr(v138 - 1, v137));
    if (!v138)
    {
      ((void (*)(std::__shared_weak_count *))v136->__on_zero_shared)(v136);
      std::__shared_weak_count::__release_weak(v136);
    }
  }

  v139 = (std::__shared_weak_count *)length[1];
  if (length[1])
  {
    v140 = (unint64_t *)(length[1] + 8);
    do
      unint64_t v141 = __ldaxr(v140);
    while (__stlxr(v141 - 1, v140));
LABEL_244:
    if (!v141)
    {
      ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
      std::__shared_weak_count::__release_weak(v139);
    }
  }

LABEL_246:
  std::mutex::unlock((std::mutex *)(v50 + 56));
  if (v131)
  {
    v142 = (unint64_t *)&v131->__shared_owners_;
    do
      unint64_t v143 = __ldaxr(v142);
    while (__stlxr(v143 - 1, v142));
    if (!v143)
    {
      ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
      std::__shared_weak_count::__release_weak(v131);
    }
  }

  v144 = v208;
  if (v208)
  {
    v145 = (unint64_t *)&v208->__shared_owners_;
    do
      unint64_t v146 = __ldaxr(v145);
    while (__stlxr(v146 - 1, v145));
    if (!v146)
    {
      ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
      std::__shared_weak_count::__release_weak(v144);
    }
  }

  if (v191)
  {
    v147 = (unint64_t *)&v191->__shared_owners_;
    do
      unint64_t v148 = __ldaxr(v147);
    while (__stlxr(v148 - 1, v147));
    if (!v148)
    {
      ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
      std::__shared_weak_count::__release_weak(v191);
    }
  }

  v149 = v199;
  if (v199)
  {
    v150 = (unint64_t *)&v199->__shared_owners_;
    do
      unint64_t v151 = __ldaxr(v150);
    while (__stlxr(v151 - 1, v150));
    if (!v151)
    {
      ((void (*)(std::__shared_weak_count *))v149->__on_zero_shared)(v149);
      std::__shared_weak_count::__release_weak(v149);
    }
  }

  v152 = v197;
  if (v197)
  {
    v153 = (unint64_t *)&v197->__shared_owners_;
    do
      unint64_t v154 = __ldaxr(v153);
    while (__stlxr(v154 - 1, v153));
    if (!v154)
    {
      ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
      std::__shared_weak_count::__release_weak(v152);
    }
  }

  v155 = v195;
  if (v195)
  {
    v156 = (unint64_t *)&v195->__shared_owners_;
    do
      unint64_t v157 = __ldaxr(v156);
    while (__stlxr(v157 - 1, v156));
    if (!v157)
    {
      ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
      std::__shared_weak_count::__release_weak(v155);
    }
  }

  v158 = v201;
  if (v201)
  {
    v159 = (unint64_t *)&v201->__shared_owners_;
    do
      unint64_t v160 = __ldaxr(v159);
    while (__stlxr(v160 - 1, v159));
    if (!v160)
    {
      ((void (*)(std::__shared_weak_count *))v158->__on_zero_shared)(v158);
      std::__shared_weak_count::__release_weak(v158);
    }
  }

  v161 = v203;
  if (v203)
  {
    v162 = (unint64_t *)&v203->__shared_owners_;
    do
      unint64_t v163 = __ldaxr(v162);
    while (__stlxr(v163 - 1, v162));
    if (!v163)
    {
      ((void (*)(std::__shared_weak_count *))v161->__on_zero_shared)(v161);
      std::__shared_weak_count::__release_weak(v161);
    }
  }

void sub_1000057A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, char a31, uint64_t a32, char a33, uint64_t a34, char a35, uint64_t a36, char a37, uint64_t a38, char a39, uint64_t a40, void *__p, uint64_t a42, int a43, __int16 a44, char a45, char a46)
{
  if (a46 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(a12);
  sub_100005C98((uint64_t)&a35);
  sub_100005C98((uint64_t)&a37);
  sub_100005C98((uint64_t)&a39);
  sub_100005C98((uint64_t)&a15);
  sub_100005C98((uint64_t)&a29);
  sub_100005C98(a9);
  sub_100005C98(a10);
  sub_100005C98((uint64_t)&a31);
  sub_100005C98((uint64_t)&a33);
  _Unwind_Resume(a1);
}

void sub_100005A10()
{
}

void sub_100005A18(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a4;
    uint64_t v11 = *a5;
    *(_DWORD *)buf = 138544130;
    uint64_t v45 = a2;
    __int16 v46 = 2048;
    uint64_t v47 = a3;
    __int16 v48 = 2112;
    uint64_t v49 = v10;
    __int16 v50 = 2112;
    uint64_t v51 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC query complete for id %{public}@, token %p,  list=%@, error=%@",  buf,  0x2Au);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3321888768LL;
  v36[2] = sub_1000062DC;
  v36[3] = &unk_100014998;
  uint64_t v12 = (std::__shared_weak_count *)a1[5];
  v36[4] = a1[4];
  CFIndex v37 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }

  dispatch_queue_t v15 = (std::__shared_weak_count *)a4[1];
  uint64_t v38 = *a4;
  v39 = v15;
  if (v15)
  {
    unint64_t v16 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  v18 = (std::__shared_weak_count *)a5[1];
  uint64_t v40 = *a5;
  CFDataRef v41 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }

  v21 = (std::__shared_weak_count *)a1[7];
  uint64_t v42 = a1[6];
  v43 = v21;
  if (v21)
  {
    unint64_t v22 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  dispatch_async(&_dispatch_main_q, v36);
  int64_t v24 = v43;
  if (v43)
  {
    CFIndex v25 = (unint64_t *)&v43->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  v27 = v41;
  if (v41)
  {
    v28 = (unint64_t *)&v41->__shared_owners_;
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  uint32_t v30 = v39;
  if (v39)
  {
    v31 = (unint64_t *)&v39->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  v33 = v37;
  if (v37)
  {
    v34 = (unint64_t *)&v37->__shared_owners_;
    do
      unint64_t v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

uint64_t sub_100005C98(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
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
    }
  }

  return a1;
}

void *sub_100005CF0(void *a1, const void *a2)
{
  unint64_t v4 = operator new(0x18uLL);
  v4[1] = sub_100005DE8;
  v4[2] = 0LL;
  void *v4 = _Block_copy(a2);
  *a1 = v4;
  uint64_t v5 = operator new(0x20uLL);
  *uint64_t v5 = &off_100014BB8;
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[3] = v4;
  a1[1] = v5;
  if (!a2)
  {
    v4[1] = nullsub_1;
    v4[2] = 0LL;
  }

  return a1;
}

void sub_100005D70(_Unwind_Exception *a1)
{
}

void sub_100005D84(void *a1, const char *a2, const void **a3)
{
  string = xpc_dictionary_get_string(a1, a2);
  if (string)
  {
    uint64_t v5 = (const UInt8 *)string;
    CFIndex v6 = strlen(string);
    CFStringRef v7 = CFStringCreateWithBytes(0LL, v5, v6, 0x8000100u, 0);
    __int128 v8 = *a3;
    *a3 = v7;
    if (v8) {
      CFRelease(v8);
    }
  }

void sub_100005DE8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  a1[1] = (uint64_t)sub_100006098;
  a1[2] = 0LL;
  uint64_t v5 = *a1;
  CFIndex v6 = (std::__shared_weak_count *)a4[1];
  uint64_t v20 = *a4;
  v21 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  v9 = (std::__shared_weak_count *)a5[1];
  uint64_t v18 = *a5;
  v19 = v9;
  if (v9)
  {
    uint64_t v10 = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *))(v5 + 16))(v5, a2, a3, &v20, &v18);
  uint64_t v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  dispatch_queue_t v15 = v21;
  if (v21)
  {
    unint64_t v16 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

void sub_100005ED8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_100005EFC(std::__shared_weak_count *a1)
{
}

void sub_100005F10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t *))(v1 + 8);
  if (*(void *)(v1 + 16)) {
    BOOL v3 = (*(void *)(v1 + 16) & 1LL | (unint64_t)v2) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = v3;
  if (v2 == sub_100005DE8 && v4 != 0)
  {
    v6[0] = 0LL;
    v6[1] = 0LL;
    sub_100005F90(v1, 0LL, 0LL, 0LL, 0LL, v6);
  }

  _Block_release(*(const void **)v1);
  operator delete((void *)v1);
}

void sub_100005F90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__shared_weak_count *a5, uint64_t *a6)
{
  CFIndex v6 = *(void (**)(void *, uint64_t, uint64_t, uint64_t *, uint64_t *))(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = (void *)(a1 + (v7 >> 1));
  if ((v7 & 1) != 0) {
    CFIndex v6 = *(void (**)(void *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*v8 + v6);
  }
  uint64_t v22 = a4;
  unint64_t v23 = a5;
  if (a5)
  {
    p_shared_owners = (unint64_t *)&a5->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }

  unint64_t v11 = (std::__shared_weak_count *)a6[1];
  uint64_t v20 = *a6;
  v21 = v11;
  if (v11)
  {
    uint64_t v12 = (unint64_t *)&v11->__shared_owners_;
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  v6(v8, a2, a3, &v22, &v20);
  unint64_t v14 = v21;
  if (v21)
  {
    dispatch_queue_t v15 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  unint64_t v17 = v23;
  if (v23)
  {
    uint64_t v18 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

void sub_10000607C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_100006098(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = *a1;
  CFIndex v6 = (std::__shared_weak_count *)a4[1];
  uint64_t v20 = *a4;
  v21 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  v9 = (std::__shared_weak_count *)a5[1];
  uint64_t v18 = *a5;
  unint64_t v19 = v9;
  if (v9)
  {
    unint64_t v10 = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *))(v5 + 16))(v5, a2, a3, &v20, &v18);
  uint64_t v12 = v19;
  if (v19)
  {
    unint64_t v13 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  dispatch_queue_t v15 = v21;
  if (v21)
  {
    unint64_t v16 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

void sub_10000617C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_100006198(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014A78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000061A8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014A78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_1000061C8(void *a1)
{
  uint64_t v2 = (const void *)a1[9];
  a1[9] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  BOOL v3 = (const void *)a1[8];
  a1[8] = 0LL;
  if (v3) {
    CFRelease(v3);
  }
  int v4 = (const void *)a1[7];
  a1[7] = 0LL;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)a1[6];
  a1[6] = 0LL;
  if (v5) {
    CFRelease(v5);
  }
  CFIndex v6 = (const void *)a1[5];
  a1[5] = 0LL;
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[4];
  a1[4] = 0LL;
  if (v7) {
    CFRelease(v7);
  }
  unint64_t v8 = (const void *)a1[3];
  a1[3] = 0LL;
  if (v8) {
    CFRelease(v8);
  }
}

void *sub_100006270(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    BOOL v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    CFIndex v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  return result;
}

uint64_t sub_1000062B4(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  sub_100005C98(a1 + 48);
  return sub_100005C98(v1);
}

void sub_1000062DC(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_int64(reply, "type", 4LL);
  BOOL v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFErrorRef error = 0LL;
    unint64_t v4 = CFPropertyListCreateData(0LL, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
    uint64_t v5 = v4;
    if (v4)
    {
      BytePtr = CFDataGetBytePtr(v4);
      CFIndex Length = CFDataGetLength(v5);
      xpc_dictionary_set_data(reply, "list", BytePtr, Length);
      CFRelease(v5);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        LODWORD(allocator) = 138412290;
        *(void *)((char *)&allocator + 4) = error;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC failed to convert data %@",  (uint8_t *)&allocator,  0xCu);
      }

      CFRelease(error);
    }
  }

  else
  {
    unint64_t v8 = *(__CFError **)(a1 + 64);
    if (v8)
    {
      int64_t Code = CFErrorGetCode(v8);
      xpc_dictionary_set_int64(reply, "errCode", Code);
      Domain = CFErrorGetDomain(*(CFErrorRef *)(a1 + 64));
      *(void *)&__int128 allocator = 0LL;
      *((void *)&allocator + 1) = 1023LL;
      if (Domain)
      {
        unint64_t v11 = sub_10000A2CC(0LL, Domain, v15, (uint64_t *)&allocator + 1);
      }

      else
      {
        v15[0] = 0;
        *((void *)&allocator + 1) = 0LL;
        unint64_t v11 = v15;
      }

      ptr = v11;
      xpc_dictionary_set_string(reply, "errDomain", (const char *)v11);
      if (ptr)
      {
        if (v15 != ptr) {
          CFAllocatorDeallocate((CFAllocatorRef)allocator, ptr);
        }
      }
    }
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), reply);
  if (reply) {
    xpc_release(reply);
  }
}

void sub_1000064C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFAllocatorRef allocator, uint64_t a12, void *ptr)
{
  if (ptr && v14 != ptr) {
    CFAllocatorDeallocate(allocator, ptr);
  }
  if (v13) {
    xpc_release(v13);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100006510(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    BOOL v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    CFIndex v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  uint64_t v8 = a2[9];
  result[8] = a2[8];
  result[9] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  uint64_t v11 = a2[11];
  result[10] = a2[10];
  result[11] = v11;
  if (v11)
  {
    uint64_t v12 = (unint64_t *)(v11 + 8);
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  return result;
}

uint64_t sub_100006594(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = a1 + 48;
  uint64_t v3 = a1 + 64;
  sub_100005C98(a1 + 80);
  sub_100005C98(v3);
  sub_100005C98(v2);
  return sub_100005C98(v1);
}

void sub_1000065E0(std::__shared_weak_count *a1)
{
}

void sub_1000065F4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    xpc_release(v1);
  }
}

void sub_10000660C(std::__shared_weak_count *a1)
{
}

void sub_100006620(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    xpc_release(v1);
  }
}

void sub_100006634(dispatch_source_s *a1)
{
  if (a1)
  {
    dispatch_source_cancel(a1);
    dispatch_release(a1);
  }

void sub_100006660(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Inactivity timer fired",  buf,  2u);
  }

  uint64_t v2 = (SCDynamicStoreRef *)(v1 + 32);
  uint64_t v3 = (const char *)(v1 + 64);
  unint64_t v4 = CFStringCreateWithCString(0LL, v3, 0x8000100u);
  uint64_t v5 = (const __CFArray *)SCDynamicStoreCopyValue(*v2, v4);
  CFIndex v6 = v5;
  if (v5 && CFArrayGetCount(v5) == 1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0LL);
    if (ValueAtIndex)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double DoubleValue = CFStringGetDoubleValue(ValueAtIndex);
      unint64_t v10 = getenv("CFNETWORKAGENT_TTL");
      if (v10) {
        double v11 = (double)strtol(v10, 0LL, 10);
      }
      else {
        double v11 = 86400.0;
      }
      LODWORD(ValueAtIndex) = Current - DoubleValue > v11;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unint64_t v14 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Purge k-v pair not found in dynamic store, creating and adding one.",  v14,  2u);
    }

    sub_10000E52C((uint64_t)v2);
    LODWORD(ValueAtIndex) = 0;
    if (!v6)
    {
      if (v4) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }
  }

  CFRelease(v6);
  if (v4)
  {
LABEL_15:
    CFRelease(v4);
    if (!(_DWORD)ValueAtIndex) {
      goto LABEL_19;
    }
LABEL_16:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Dynamic store is stale, purging",  v12,  2u);
    }

    sub_10000E704(v2);
LABEL_19:
    exit(0);
  }

LABEL_10:
  if (!(_DWORD)ValueAtIndex) {
    goto LABEL_19;
  }
  goto LABEL_16;
}

    CFRelease(v7);
    goto LABEL_11;
  }

void sub_10000683C(_Unwind_Exception *a1)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

void sub_10000686C()
{
  if (!v0) {
    JUMPOUT(0x100006864LL);
  }
  JUMPOUT(0x10000685CLL);
}

void sub_10000687C(std::__shared_weak_count *a1)
{
}

uint64_t sub_100006890(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void sub_10000689C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (v33)
  {
    CFIndex v6 = *(dispatch_queue_s **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768LL;
    block[2] = sub_100006AA0;
    block[3] = &unk_100014AF0;
    block[4] = a1;
    block[5] = v33;
    v28 = v34;
    if (v34)
    {
      p_shared_owners = (unint64_t *)&v34->__shared_owners_;
      do
        unint64_t v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }

    v9 = (std::__shared_weak_count *)a2[1];
    uint64_t v29 = *a2;
    uint32_t v30 = v9;
    if (v9)
    {
      unint64_t v10 = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    uint64_t v12 = (std::__shared_weak_count *)a3[1];
    uint64_t v31 = *a3;
    unint64_t v32 = v12;
    if (v12)
    {
      unint64_t v13 = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }

    dispatch_async(v6, block);
    dispatch_queue_t v15 = v32;
    if (v32)
    {
      unint64_t v16 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    uint64_t v18 = v30;
    if (v30)
    {
      unint64_t v19 = (unint64_t *)&v30->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    v21 = v28;
    if (v28)
    {
      uint64_t v22 = (unint64_t *)&v28->__shared_owners_;
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  int64_t v24 = v34;
  if (v34)
  {
    CFIndex v25 = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

void *sub_100006A60(void *a1, uint64_t a2, std::__shared_weak_count *this)
{
  *a1 = a2;
  if (this)
  {
    unint64_t v4 = std::__shared_weak_count::lock(this);
    a1[1] = v4;
    if (v4) {
      return a1;
    }
  }

  else
  {
    a1[1] = 0LL;
  }

  uint64_t v6 = sub_100009298();
  return (void *)sub_100006AA0(v6);
}

void sub_100006AA0(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(a1[5] + 40LL))
  {
    uint64_t v3 = *(__CFError **)(v2 + 40);
    if (CFErrorGetCode(v3) == 309)
    {
      Domain = CFErrorGetDomain(v3);
      if (CFStringCompare(Domain, kCFErrorDomainCFNetwork, 0LL) == kCFCompareEqualTo && !*(_BYTE *)(v2 + 152))
      {
        uint64_t v69 = a1[7];
        if (*(void *)(v69 + 16))
        {
          if (*(void *)(v69 + 24))
          {
            *(void *)buf = 0LL;
            *(void *)&buf[8] = 0LL;
            sub_100007668(a1[5] + 40LL, (__int128 *)buf);
            unint64_t v70 = *(std::__shared_weak_count **)&buf[8];
            if (*(void *)&buf[8])
            {
              unint64_t v71 = (unint64_t *)(*(void *)&buf[8] + 8LL);
              do
                unint64_t v72 = __ldaxr(v71);
              while (__stlxr(v72 - 1, v71));
              if (!v72)
              {
                ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
                std::__shared_weak_count::__release_weak(v70);
              }
            }
          }
        }
      }
    }
  }

  uint64_t v5 = a1[7];
  if (*(_BYTE *)(v5 + 88))
  {
    if (*(void *)v5)
    {
      uint64_t v6 = CFURLCopyScheme(*(CFURLRef *)v5);
      if (v6)
      {
        unint64_t v7 = v6;
        if (CFStringCompare(v6, @"ftp", 1uLL) == kCFCompareEqualTo
          || CFStringCompare(v7, @"file", 1uLL) == kCFCompareEqualTo)
        {
          if (qword_1000188C8 != -1) {
            dispatch_once(&qword_1000188C8, &stru_100014AA0);
          }
          CFErrorRef v8 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, -1002LL, 0LL);
          *(void *)buf = v8;
          v9 = operator new(0x20uLL);
          void *v9 = &off_100014E50;
          v9[1] = 0LL;
          v9[2] = 0LL;
          v9[3] = v8;
          *(void *)&buf[8] = v9;
          sub_100007668(v2 + 40, (__int128 *)buf);
          unint64_t v10 = *(std::__shared_weak_count **)&buf[8];
          if (*(void *)&buf[8])
          {
            unint64_t v11 = (unint64_t *)(*(void *)&buf[8] + 8LL);
            do
              unint64_t v12 = __ldaxr(v11);
            while (__stlxr(v12 - 1, v11));
            if (!v12)
            {
              ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
              std::__shared_weak_count::__release_weak(v10);
            }
          }
        }

        CFRelease(v7);
      }
    }
  }

  if (*(void *)(a1[5] + 40LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      CFErrorDomain v73 = CFErrorGetDomain(*(CFErrorRef *)(v2 + 40));
      CFIndex Code = CFErrorGetCode(*(CFErrorRef *)(v2 + 40));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v73;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Code;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC Fetch failed with cached error [%@:%ld]",  buf,  0x16u);
    }

    unint64_t v13 = (void *)a1[7];
    uint64_t v14 = v13[9];
    dispatch_queue_t v15 = (std::__shared_weak_count *)v13[10];
    uint64_t v142 = v14;
    unint64_t v143 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        unint64_t v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
      unint64_t v13 = (void *)a1[7];
    }

    uint64_t v19 = v13[4];
    uint64_t v18 = v13[5];
    uint64_t v134 = 0LL;
    uint64_t v135 = 0LL;
    uint64_t v20 = *(void *)(v2 + 40);
    v21 = *(std::__shared_weak_count **)(v2 + 48);
    uint64_t v132 = v20;
    unint64_t v133 = v21;
    if (v21)
    {
      uint64_t v22 = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
      if (!v14) {
        goto LABEL_66;
      }
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
      uint64_t v144 = v20;
      v145 = v21;
      do
        unint64_t v24 = __ldxr(v22);
      while (__stxr(v24 + 1, v22));
    }

    else
    {
      if (!v14) {
        goto LABEL_66;
      }
      *(void *)buf = 0LL;
      *(void *)&buf[8] = 0LL;
      uint64_t v144 = v20;
      v145 = 0LL;
    }

    sub_100005F90(v14, v18, v19, 0LL, 0LL, &v144);
    CFDataRef v41 = v145;
    if (v145)
    {
      uint64_t v42 = (unint64_t *)&v145->__shared_owners_;
      do
        unint64_t v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }

    v44 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      uint64_t v45 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }

LABEL_66:
    if (v133)
    {
      uint64_t v47 = &v133->__shared_owners_;
      do
        unint64_t v48 = __ldaxr((unint64_t *)v47);
      while (__stlxr(v48 - 1, (unint64_t *)v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v133->__on_zero_shared)(v133, v18, v19);
        std::__shared_weak_count::__release_weak(v133);
      }
    }

    uint64_t v38 = v143;
    if (v143)
    {
      uint64_t v49 = (unint64_t *)&v143->__shared_owners_;
      do
        unint64_t v40 = __ldaxr(v49);
      while (__stlxr(v40 - 1, v49));
LABEL_74:
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }

      return;
    }

    return;
  }

  CFIndex v25 = *(const OpaqueJSContext ***)(v2 + 32);
  if (!v25)
  {
    uint64_t v51 = *(char **)(v2 + 64);
    unint64_t v50 = *(void *)(v2 + 72);
    if ((unint64_t)v51 >= v50)
    {
      unint64_t v56 = *(char **)(v2 + 56);
      uint64_t v57 = (v51 - v56) >> 4;
      unint64_t v58 = v57 + 1;
      uint64_t v59 = v50 - (void)v56;
      if (v59 >> 3 > v58) {
        unint64_t v58 = v59 >> 3;
      }
      else {
        unint64_t v60 = v58;
      }
      if (v60 >> 60) {
        sub_1000091D8();
      }
      v61 = (char *)operator new(16 * v60);
      v62 = &v61[16 * v57];
      __int128 v63 = *(_OWORD *)(a1 + 7);
      *(_OWORD *)v62 = v63;
      if (*((void *)&v63 + 1))
      {
        v64 = (unint64_t *)(*((void *)&v63 + 1) + 8LL);
        do
          unint64_t v65 = __ldxr(v64);
        while (__stxr(v65 + 1, v64));
        unint64_t v56 = *(char **)(v2 + 56);
        uint64_t v51 = *(char **)(v2 + 64);
      }

      if (v51 == v56)
      {
        int64x2_t v68 = vdupq_n_s64((unint64_t)v51);
        unint64_t v66 = &v61[16 * v57];
      }

      else
      {
        unint64_t v66 = &v61[16 * v57];
        do
        {
          __int128 v67 = *((_OWORD *)v51 - 1);
          v51 -= 16;
          *((_OWORD *)v66 - 1) = v67;
          v66 -= 16;
          *(void *)uint64_t v51 = 0LL;
          *((void *)v51 + 1) = 0LL;
        }

        while (v51 != v56);
        int64x2_t v68 = *(int64x2_t *)(v2 + 56);
      }

      v55 = v62 + 16;
      *(void *)(v2 + 56) = v66;
      *(void *)(v2 + 64) = v62 + 16;
      *(void *)(v2 + 72) = &v61[16 * v60];
      uint64_t v75 = v68.i64[1];
      v76 = (void *)v68.i64[0];
      if (v76) {
        operator delete(v76);
      }
    }

    else
    {
      *(void *)uint64_t v51 = a1[7];
      uint64_t v52 = a1[8];
      *((void *)v51 + 1) = v52;
      if (v52)
      {
        v53 = (unint64_t *)(v52 + 8);
        do
          unint64_t v54 = __ldxr(v53);
        while (__stxr(v54 + 1, v53));
      }

      v55 = v51 + 16;
    }

    *(void *)(v2 + 64) = v55;
    uint64_t v78 = a1[7];
    v77 = (std::__shared_weak_count *)a1[8];
    uint64_t v125 = v77;
    if (v77)
    {
      v79 = (unint64_t *)&v77->__shared_owners_;
      do
        unint64_t v80 = __ldxr(v79);
      while (__stxr(v80 + 1, v79));
    }

    uint64_t v82 = a1[9];
    unint64_t v81 = (std::__shared_weak_count *)a1[10];
    if (v81)
    {
      unint64_t v83 = (unint64_t *)&v81->__shared_owners_;
      do
        unint64_t v84 = __ldxr(v83);
      while (__stxr(v84 + 1, v83));
    }

    if (*(_BYTE *)(v78 + 88) || (unint64_t v118 = *(const __CFString **)v78) == 0LL)
    {
      uint64_t v138 = v78;
      v139 = v77;
      if (v77)
      {
        v85 = (unint64_t *)&v77->__shared_owners_;
        do
          unint64_t v86 = __ldxr(v85);
        while (__stxr(v86 + 1, v85));
      }

      uint64_t v136 = v82;
      v137 = v81;
      if (v81)
      {
        unint64_t v87 = (unint64_t *)&v81->__shared_owners_;
        do
          unint64_t v88 = __ldxr(v87);
        while (__stxr(v88 + 1, v87));
      }

      sub_100006A60(&v144, *(void *)v2, *(std::__shared_weak_count **)(v2 + 8));
      uint64_t v89 = v144;
      if (v144)
      {
        uint64_t v90 = *(void *)(v2 + 16);
        uint64_t v142 = v78;
        unint64_t v143 = v77;
        if (v77)
        {
          unint64_t v91 = (unint64_t *)&v77->__shared_owners_;
          do
            unint64_t v92 = __ldxr(v91);
          while (__stxr(v92 + 1, v91));
        }

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3321888768LL;
        *(void *)&uint8_t buf[16] = sub_1000081F8;
        v147 = &unk_100014B40;
        uint64_t v148 = v2;
        uint64_t v149 = v78;
        v150 = v77;
        if (v77)
        {
          unint64_t v93 = (unint64_t *)&v77->__shared_owners_;
          do
            unint64_t v94 = __ldxr(v93);
          while (__stxr(v94 + 1, v93));
        }

        uint64_t v151 = v89;
        v152 = v145;
        if (v145)
        {
          uint8x8_t v95 = (unint64_t *)&v145->__shared_owners_;
          do
            unint64_t v96 = __ldxr(v95);
          while (__stxr(v96 + 1, v95));
        }

        v97 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
        v97->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))sub_100008510;
        v97->__on_zero_shared = 0LL;
        v97->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(buf);
        v140 = v97;
        v98 = (std::__shared_weak_count *)operator new(0x20uLL);
        v98->__vftable = (std::__shared_weak_count_vtbl *)&off_100014BF0;
        v98->__shared_owners_ = 0LL;
        v98->__shared_weak_owners_ = 0LL;
        v98[1].__vftable = v97;
        unint64_t v141 = v98;
        (*(void (**)(uint64_t, uint64_t, uint64_t *, std::__shared_weak_count_vtbl **))(*(void *)v82 + 16LL))( v82,  v90,  &v142,  &v140);
        unint64_t v99 = v141;
        if (v141)
        {
          v100 = (unint64_t *)&v141->__shared_owners_;
          do
            unint64_t v101 = __ldaxr(v100);
          while (__stlxr(v101 - 1, v100));
          if (!v101)
          {
            ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
            std::__shared_weak_count::__release_weak(v99);
          }
        }

        v102 = v143;
        if (v143)
        {
          size_t v103 = (unint64_t *)&v143->__shared_owners_;
          do
            unint64_t v104 = __ldaxr(v103);
          while (__stlxr(v104 - 1, v103));
          if (!v104)
          {
            ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
            std::__shared_weak_count::__release_weak(v102);
          }
        }

        unint64_t v105 = v152;
        if (v152)
        {
          float v106 = (unint64_t *)&v152->__shared_owners_;
          do
            unint64_t v107 = __ldaxr(v106);
          while (__stlxr(v107 - 1, v106));
          if (!v107)
          {
            ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
            std::__shared_weak_count::__release_weak(v105);
          }
        }

        BOOL v108 = v150;
        if (v150)
        {
          unint64_t v109 = (unint64_t *)&v150->__shared_owners_;
          do
            unint64_t v110 = __ldaxr(v109);
          while (__stlxr(v110 - 1, v109));
          if (!v110)
          {
            ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
            std::__shared_weak_count::__release_weak(v108);
          }
        }
      }

      v111 = v145;
      if (v145)
      {
        v112 = (unint64_t *)&v145->__shared_owners_;
        do
          unint64_t v113 = __ldaxr(v112);
        while (__stlxr(v113 - 1, v112));
        if (!v113)
        {
          ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
          std::__shared_weak_count::__release_weak(v111);
        }
      }

      if (v81)
      {
        uint64_t v114 = (unint64_t *)&v81->__shared_owners_;
        do
          unint64_t v115 = __ldaxr(v114);
        while (__stlxr(v115 - 1, v114));
        if (!v115)
        {
          ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
          std::__shared_weak_count::__release_weak(v81);
        }
      }

      v77 = v139;
      if (v139)
      {
        unint64_t v116 = (unint64_t *)&v139->__shared_owners_;
        do
          unint64_t v117 = __ldaxr(v116);
        while (__stlxr(v117 - 1, v116));
        goto LABEL_174;
      }
    }

    else
    {
      *(void *)buf = v78;
      *(void *)&buf[8] = v77;
      if (v77)
      {
        uint8x8_t v119 = (unint64_t *)&v77->__shared_owners_;
        do
          unint64_t v120 = __ldxr(v119);
        while (__stxr(v120 + 1, v119));
      }

      sub_1000078F0(v2, v118, (uint64_t **)buf);
      if (v77)
      {
        v121 = (unint64_t *)&v77->__shared_owners_;
        do
          unint64_t v117 = __ldaxr(v121);
        while (__stlxr(v117 - 1, v121));
LABEL_174:
        if (!v117)
        {
          ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
          std::__shared_weak_count::__release_weak(v77);
        }
      }
    }

    if (v81)
    {
      unint64_t v122 = (unint64_t *)&v81->__shared_owners_;
      do
        unint64_t v123 = __ldaxr(v122);
      while (__stlxr(v123 - 1, v122));
      if (!v123)
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
    }

    uint64_t v38 = v125;
    if (v125)
    {
      v124 = (unint64_t *)&v125->__shared_owners_;
      do
        unint64_t v40 = __ldaxr(v124);
      while (__stlxr(v40 - 1, v124));
      goto LABEL_74;
    }

    return;
  }

  unint64_t v26 = (uint64_t *)a1[7];
  v27 = (std::__shared_weak_count *)a1[8];
  v130 = v26;
  v131 = v27;
  if (v27)
  {
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
    unint64_t v26 = (uint64_t *)a1[7];
    v27 = (std::__shared_weak_count *)a1[8];
  }

  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3321888768LL;
  v126[2] = sub_1000076CC;
  v126[3] = &unk_100014AC0;
  v126[4] = v26;
  uint64_t v127 = v27;
  if (v27)
  {
    uint32_t v30 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v31 = __ldxr(v30);
    while (__stxr(v31 + 1, v30));
  }

  sub_100005CF0(&v128, v126);
  sub_10000B810(v25, &v130, &v128);
  unint64_t v32 = v129;
  if (v129)
  {
    uint64_t v33 = (unint64_t *)&v129->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  unint64_t v35 = v131;
  if (v131)
  {
    v36 = (unint64_t *)&v131->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  uint64_t v38 = v127;
  if (v127)
  {
    v39 = (unint64_t *)&v127->__shared_owners_;
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    goto LABEL_74;
  }

void sub_1000074DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void *sub_1000075D0(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    uint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  uint64_t v8 = a2[10];
  result[9] = a2[9];
  result[10] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  return result;
}

uint64_t sub_100007634(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  uint64_t v2 = a1 + 56;
  sub_100005C98(a1 + 72);
  sub_100005C98(v2);
  return sub_100005C98(v1);
}

uint64_t sub_100007668(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
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
    }
  }

  return a1;
}

void sub_1000076CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 72);
  v9 = *(std::__shared_weak_count **)(v7 + 80);
  unint64_t v37 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }

  uint64_t v12 = *a4;
  unint64_t v13 = (std::__shared_weak_count *)a4[1];
  v36 = v13;
  if (v13)
  {
    uint64_t v14 = (unint64_t *)&v13->__shared_owners_;
    do
      unint64_t v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }

  uint64_t v16 = *a5;
  unint64_t v17 = (std::__shared_weak_count *)a5[1];
  unint64_t v35 = v17;
  if (v17)
  {
    uint64_t v18 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  if (v8)
  {
    v38[2] = v12;
    v39 = v13;
    if (v13)
    {
      uint64_t v20 = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    v38[0] = v16;
    v38[1] = (uint64_t)v17;
    if (v17)
    {
      uint64_t v22 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }

    sub_100005F90(v8, a2, a3, v12, v13, v38);
    if (v17)
    {
      unint64_t v24 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    unint64_t v26 = v39;
    if (v39)
    {
      v27 = (unint64_t *)&v39->__shared_owners_;
      do
        unint64_t v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }

  if (v35)
  {
    unint64_t v29 = (unint64_t *)&v35->__shared_owners_;
    do
      unint64_t v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  if (v36)
  {
    unint64_t v31 = (unint64_t *)&v36->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  if (v37)
  {
    uint64_t v33 = (unint64_t *)&v37->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

void sub_1000078BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
}

void sub_1000078F0(uint64_t a1, const __CFString *a2, uint64_t **a3)
{
  unint64_t v6 = operator new(0x10uLL);
  void *v6 = 0LL;
  v6[1] = sub_100009080;
  sub_10000908C((void **)(a1 + 32), v6);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *a3;
  v9 = (const char *)a3[1];
  unint64_t v71 = *a3;
  unint64_t v72 = (std::__shared_weak_count *)v9;
  if (v9)
  {
    unint64_t v10 = (unint64_t *)(v9 + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1000090D4;
  v68[3] = &unk_100014B20;
  v68[4] = a1;
  sub_100005CF0(&v69, v68);
  if (qword_100018910 != -1) {
    dispatch_once(&qword_100018910, &stru_100014FE8);
  }
  uint64_t v12 = (const __CFString *)qword_100018908;
  if (!qword_100018908 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.version) = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC: Unable to load support library",  (uint8_t *)&buf,  2u);
  }

  if (!v12)
  {
    CFIndex Length = -1LL;
    if (a2) {
      goto LABEL_13;
    }
LABEL_15:
    CFIndex v14 = -1LL;
    goto LABEL_16;
  }

  CFIndex Length = CFStringGetLength(v12);
  if (!a2) {
    goto LABEL_15;
  }
LABEL_13:
  CFIndex v14 = CFStringGetLength(a2);
LABEL_16:
  buf.version = 134218240;
  *(void *)&buf.attributes = Length;
  WORD2(buf.className) = 2048;
  *(const char **)((char *)&buf.className + 6) = (const char *)v14;
  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Loaded Support Library (Library Size: %ld, PAC Size: %ld)",  (uint8_t *)&buf,  0x16u);
LABEL_17:
  if (!v12) {
    goto LABEL_37;
  }
  uint64_t v15 = CFStringCreateWithFormat(0LL, 0LL, @"%@\n%@\n", v12, a2);
  JSGlobalContextRef v16 = (JSGlobalContextRef)v15;
  if (!v15) {
    goto LABEL_38;
  }
  unint64_t v17 = (char *)JSStringCreateWithCFString(v15);
  CFRelease(v16);
  if (!v17) {
    goto LABEL_37;
  }
  JSGlobalContextRef v16 = JSGlobalContextCreateInGroup(0LL, 0LL);
  if ((int)CFNetworkDiagnosticLevel() >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    buf.version = 134218240;
    *(void *)&buf.attributes = v16;
    WORD2(buf.className) = 2048;
    *(const char **)((char *)&buf.className + 6) = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Created Runtime (Runtime: %p, Code: %p)",  (uint8_t *)&buf,  0x16u);
  }

  if (!JSCheckScriptSyntax(v16, (JSStringRef)v17, 0LL, 0, 0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.version) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC: Invalid syntax",  (uint8_t *)&buf,  2u);
    }

LABEL_37:
    JSGlobalContextRef v16 = 0LL;
    goto LABEL_38;
  }

  if (v16)
  {
    GlobalObject = (char *)JSContextGetGlobalObject(v16);
    if (GlobalObject)
    {
      if ((int)CFNetworkDiagnosticLevel() >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        buf.version = 134218240;
        *(void *)&buf.attributes = v16;
        WORD2(buf.className) = 2048;
        *(const char **)((char *)&buf.className + 6) = GlobalObject;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Using Execution Context (Runtime: %p, Context: %p)",  (uint8_t *)&buf,  0x16u);
      }

      unint64_t v19 = JSStringCreateWithCFString(@"__dnsResolve");
      __int128 v20 = *(_OWORD *)&kJSClassDefinitionEmpty.deleteProperty;
      *(_OWORD *)&buf.getProperty = *(_OWORD *)&kJSClassDefinitionEmpty.getProperty;
      *(_OWORD *)&buf.deleteProperty = v20;
      __int128 v21 = *(_OWORD *)&kJSClassDefinitionEmpty.hasInstance;
      *(_OWORD *)&buf.callAsFunction = *(_OWORD *)&kJSClassDefinitionEmpty.callAsFunction;
      *(_OWORD *)&buf.hasInstance = v21;
      __int128 v22 = *(_OWORD *)&kJSClassDefinitionEmpty.parentClass;
      *(_OWORD *)&buf.version = *(_OWORD *)&kJSClassDefinitionEmpty.version;
      *(_OWORD *)&buf.parentClass = v22;
      __int128 v23 = *(_OWORD *)&kJSClassDefinitionEmpty.finalize;
      *(_OWORD *)&buf.staticFunctions = *(_OWORD *)&kJSClassDefinitionEmpty.staticFunctions;
      *(_OWORD *)&buf.finalize = v23;
      buf.callAsFunction = (JSObjectCallAsFunctionCallback)sub_10000EE20;
      unint64_t v24 = JSClassCreate(&buf);
      unint64_t v25 = JSObjectMake(v16, v24, 0LL);
      JSClassRelease(v24);
      if (v25) {
        JSObjectSetProperty(v16, (JSObjectRef)GlobalObject, v19, v25, 0, 0LL);
      }
      JSStringRelease(v19);
      unint64_t v26 = JSStringCreateWithCFString(@"__primaryIPv4Addresses");
      FunctionWithCallback = JSObjectMakeFunctionWithCallback(v16, v26, (JSObjectCallAsFunctionCallback)sub_10000F478);
      if (FunctionWithCallback) {
        JSObjectSetProperty(v16, (JSObjectRef)GlobalObject, v26, FunctionWithCallback, 0, 0LL);
      }
      JSStringRelease(v26);
      unint64_t v28 = JSStringCreateWithCFString(@"MACH");
      String = JSValueMakeString(v16, v28);
      unint64_t v30 = JSStringCreateWithCFString(@"__platformName");
      JSObjectSetProperty(v16, (JSObjectRef)GlobalObject, v30, String, 0, 0LL);
      JSStringRelease(v28);
      JSStringRelease(v30);
    }

    JSEvaluateScript(v16, (JSStringRef)v17, 0LL, 0LL, 0, 0LL);
    JSStringRelease((JSStringRef)v17);
  }

LABEL_38:
  unint64_t v31 = *(const OpaqueJSContext **)v7;
  *(void *)uint64_t v7 = v16;
  if (v31)
  {
    (*(void (**)(void))(v7 + 8))();
    JSGlobalContextRef v16 = *(JSGlobalContextRef *)v7;
  }

  *(void *)(v7 + 8) = sub_10000B804;
  if (v16)
  {
    *(void *)&buf.version = v8;
    buf.className = v9;
    if (v9)
    {
      unint64_t v32 = (unint64_t *)(v9 + 8);
      do
        unint64_t v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }

    unint64_t v34 = v70;
    uint64_t v79 = v69;
    unint64_t v80 = v70;
    if (v70)
    {
      p_shared_owners = (unint64_t *)&v70->__shared_owners_;
      do
        unint64_t v36 = __ldxr(p_shared_owners);
      while (__stxr(v36 + 1, p_shared_owners));
    }

    sub_10000B810((const OpaqueJSContext **)v7, (uint64_t **)&buf, &v79);
    if (v34)
    {
      unint64_t v37 = (unint64_t *)&v34->__shared_owners_;
      do
        unint64_t v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }

    className = (std::__shared_weak_count *)buf.className;
    if (buf.className)
    {
      unint64_t v40 = (unint64_t *)(buf.className + 8);
      do
        unint64_t v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      goto LABEL_91;
    }
  }

  else
  {
    uint64_t v42 = (const char *)CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 308LL, 0LL);
    v77 = v42;
    unint64_t v43 = (std::__shared_weak_count *)operator new(0x20uLL);
    v43->__shared_owners_ = 0LL;
    v44 = (unint64_t *)&v43->__shared_owners_;
    v43->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v43->__shared_weak_owners_ = 0LL;
    v43[1].__vftable = (std::__shared_weak_count_vtbl *)v42;
    uint64_t v78 = v43;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.version) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC: No execution context",  (uint8_t *)&buf,  2u);
    }

    if ((int)CFNetworkDiagnosticLevel() >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v8 + 88)) {
        uint64_t v45 = *v8;
      }
      else {
        uint64_t v45 = 0LL;
      }
      buf.version = 138543618;
      *(void *)&buf.attributes = v45;
      WORD2(buf.className) = 2114;
      *(const char **)((char *)&buf.className + 6) = v42;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: No Execution Context (PAC URL: %{public}@, error: %{public}@)",  (uint8_t *)&buf,  0x16u);
    }

    uint64_t v47 = v8[4];
    uint64_t v46 = v8[5];
    uint64_t v75 = 0LL;
    v76 = 0LL;
    CFErrorDomain v73 = v42;
    unint64_t v74 = v43;
    do
      unint64_t v48 = __ldxr(v44);
    while (__stxr(v48 + 1, v44));
    uint64_t v49 = v69;
    if (v69)
    {
      *(void *)&buf.version = 0LL;
      buf.className = 0LL;
      uint64_t v79 = (uint64_t)v42;
      unint64_t v80 = v43;
      do
        unint64_t v50 = __ldxr(v44);
      while (__stxr(v50 + 1, v44));
      sub_100005F90(v49, v46, v47, 0LL, 0LL, &v79);
      do
        unint64_t v51 = __ldaxr(v44);
      while (__stlxr(v51 - 1, v44));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }

      uint64_t v52 = (std::__shared_weak_count *)buf.className;
      if (buf.className)
      {
        v53 = (unint64_t *)(buf.className + 8);
        do
          unint64_t v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
      }
    }

    v55 = v74;
    if (v74)
    {
      unint64_t v56 = (unint64_t *)&v74->__shared_owners_;
      do
        unint64_t v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v55->__on_zero_shared)(v55, v46, v47);
        std::__shared_weak_count::__release_weak(v55);
      }
    }

    unint64_t v58 = v76;
    if (v76)
    {
      uint64_t v59 = (unint64_t *)&v76->__shared_owners_;
      do
        unint64_t v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      if (!v60)
      {
        ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v58->__on_zero_shared)(v58, v46, v47);
        std::__shared_weak_count::__release_weak(v58);
      }
    }

    className = v78;
    if (v78)
    {
      v61 = (unint64_t *)&v78->__shared_owners_;
      do
        unint64_t v41 = __ldaxr(v61);
      while (__stlxr(v41 - 1, v61));
LABEL_91:
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))className->__on_zero_shared)(className);
        std::__shared_weak_count::__release_weak(className);
      }
    }
  }

  v62 = v70;
  if (v70)
  {
    __int128 v63 = (unint64_t *)&v70->__shared_owners_;
    do
      unint64_t v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }

  unint64_t v65 = v72;
  if (v72)
  {
    unint64_t v66 = (unint64_t *)&v72->__shared_owners_;
    do
      unint64_t v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }

    v9 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 308LL, 0LL);
    unint64_t v10 = (std::__shared_weak_count *)operator new(0x20uLL);
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v10->__shared_owners_ = 0LL;
    v10->__shared_weak_owners_ = 0LL;
    v10[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
    uint64_t v75 = v9;
    v76 = v10;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)JSClassDefinition buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC: FindProxyForURL failed",  buf,  2u);
    }

    if ((int)CFNetworkDiagnosticLevel() >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)*a2 + 88)) {
        unint64_t v29 = **a2;
      }
      else {
        unint64_t v29 = 0LL;
      }
      *(_DWORD *)JSClassDefinition buf = 138543874;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      unint64_t v80 = 2114;
      unint64_t v81 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Execution Failed (PAC URL: %{public}@, Target URL: %{public}@, Error: %{public}@)",  buf,  0x20u);
    }

void sub_100008184( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20, char a21, uint64_t a22, char a23, uint64_t a24, char a25, uint64_t a26, char a27, uint64_t a28, char a29)
{
}

void sub_1000081F8(uint64_t **a1, const __CFString **a2, uint64_t a3, double a4)
{
  uint64_t v8 = (uint64_t)a1[4];
  std::mutex::lock((std::mutex *)(v8 + 80));
  *((double *)a1[7] + 18) = a4;
  std::mutex::unlock((std::mutex *)(v8 + 80));
  if (*(void *)a3)
  {
    Domain = CFErrorGetDomain(*(CFErrorRef *)a3);
    CFIndex Code = CFErrorGetCode(*(CFErrorRef *)a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)JSClassDefinition buf = 138412546;
      unint64_t v37 = Domain;
      __int16 v38 = 2048;
      CFIndex v39 = Code;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC Fetch failed with error [%@:%ld]",  buf,  0x16u);
    }

    if (Code == 309 && CFStringCompare(kCFErrorDomainCFNetwork, Domain, 0LL) == kCFCompareEqualTo)
    {
      unint64_t v31 = a1[5];
      if (v31[2])
      {
        if (v31[3]) {
          *(_BYTE *)(v8 + 152) = 1;
        }
      }
    }

    CFErrorRef v11 = *(CFErrorRef *)a3;
    uint64_t v12 = *(std::__shared_weak_count **)(a3 + 8);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }

    uint64_t v15 = *(std::__shared_weak_count **)(v8 + 48);
    *(void *)(v8 + 40) = v11;
    *(void *)(v8 + 48) = v12;
    if (v15)
    {
      JSGlobalContextRef v16 = (unint64_t *)&v15->__shared_owners_;
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }

      uint64_t v12 = *(std::__shared_weak_count **)(v8 + 48);
    }

    uint64_t v34 = 0LL;
    unint64_t v35 = 0LL;
    v33[0] = *(void *)(v8 + 40);
    v33[1] = (uint64_t)v12;
    if (v12)
    {
      uint64_t v18 = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }

    sub_100008924((void *)v8, &v34, v33);
    if (v12)
    {
      __int128 v20 = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    __int128 v22 = v35;
    if (v35)
    {
      __int128 v23 = (unint64_t *)&v35->__shared_owners_;
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }

  else
  {
    unint64_t v25 = *a2;
    unint64_t v26 = a1[6];
    v32[0] = a1[5];
    v32[1] = v26;
    if (v26)
    {
      v27 = (unint64_t *)(v26 + 1);
      do
        unint64_t v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }

    sub_1000078F0(v8, v25, v32);
    if (v26)
    {
      unint64_t v29 = (unint64_t *)(v26 + 1);
      do
        unint64_t v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        (*(void (**)(uint64_t *))(*v26 + 16))(v26);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v26);
      }
    }
  }

void sub_1000084DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
}

void sub_100008510(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  a1[1] = (uint64_t)sub_1000087B8;
  a1[2] = 0LL;
  uint64_t v3 = *a1;
  unint64_t v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v18 = *a2;
  unint64_t v19 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }

  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  uint64_t v16 = *a3;
  unint64_t v17 = v7;
  if (v7)
  {
    uint64_t v8 = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  (*(void (**)(uint64_t, uint64_t *, uint64_t *))(v3 + 16))(v3, &v18, &v16);
  unint64_t v10 = v17;
  if (v17)
  {
    CFErrorRef v11 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unint64_t v13 = v19;
  if (v19)
  {
    unint64_t v14 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

void sub_100008600( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_100008620(std::__shared_weak_count *a1)
{
}

void sub_100008634(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void (**)(uint64_t *, uint64_t *, uint64_t *))(v1 + 8);
  if (*(void *)(v1 + 16)) {
    BOOL v3 = (*(void *)(v1 + 16) & 1LL | (unint64_t)v2) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = v3;
  if (v2 == sub_100008510 && v4 != 0)
  {
    v6[0] = 0LL;
    v6[1] = 0LL;
    sub_1000086B0(v1, 0LL, 0LL, v6);
  }

  _Block_release(*(const void **)v1);
  operator delete((void *)v1);
}

void sub_1000086B0(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t *a4)
{
  int v4 = *(void (**)(void *, uint64_t *, uint64_t *))(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = (void *)(a1 + (v5 >> 1));
  if ((v5 & 1) != 0) {
    int v4 = *(void (**)(void *, uint64_t *, uint64_t *))(*v6 + v4);
  }
  uint64_t v20 = a2;
  unint64_t v21 = a3;
  if (a3)
  {
    p_shared_owners = (unint64_t *)&a3->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  unint64_t v9 = (std::__shared_weak_count *)a4[1];
  uint64_t v18 = *a4;
  unint64_t v19 = v9;
  if (v9)
  {
    unint64_t v10 = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  v4(v6, &v20, &v18);
  unint64_t v12 = v19;
  if (v19)
  {
    unint64_t v13 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  unint64_t v15 = v21;
  if (v21)
  {
    uint64_t v16 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

void sub_10000879C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_1000087B8(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  int v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v18 = *a2;
  unint64_t v19 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }

  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  uint64_t v16 = *a3;
  unint64_t v17 = v7;
  if (v7)
  {
    unint64_t v8 = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  (*(void (**)(uint64_t, uint64_t *, uint64_t *))(v3 + 16))(v3, &v18, &v16);
  unint64_t v10 = v17;
  if (v17)
  {
    unint64_t v11 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unint64_t v13 = v19;
  if (v19)
  {
    unint64_t v14 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

void sub_10000889C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void *sub_1000088B8(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    unint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  return result;
}

uint64_t sub_1000088FC(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  sub_100005C98(a1 + 56);
  return sub_100005C98(v1);
}

void sub_100008924(void *a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v4 = (void *)a1[7];
  uint64_t v5 = (void *)a1[8];
  if (v4 == v5) {
    goto LABEL_95;
  }
  char v8 = 1;
  do
  {
    if ((v8 & 1) != 0)
    {
      uint64_t v9 = *v4;
      uint64_t v10 = *(void *)(*v4 + 72LL);
      unint64_t v11 = *(std::__shared_weak_count **)(*v4 + 80LL);
      uint64_t v79 = v10;
      unint64_t v80 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
        uint64_t v9 = *v4;
      }

      uint64_t v15 = *(void *)(v9 + 32);
      uint64_t v14 = *(void *)(v9 + 40);
      uint64_t v16 = *a2;
      unint64_t v17 = (std::__shared_weak_count *)a2[1];
      uint64_t v77 = *a2;
      uint64_t v78 = v17;
      if (v17)
      {
        uint64_t v18 = (unint64_t *)&v17->__shared_owners_;
        do
          unint64_t v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
      }

      uint64_t v20 = *a3;
      unint64_t v21 = (std::__shared_weak_count *)a3[1];
      uint64_t v75 = *a3;
      v76 = v21;
      if (v21)
      {
        __int128 v22 = (unint64_t *)&v21->__shared_owners_;
        do
          unint64_t v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }

      if (v10)
      {
        uint64_t v83 = v16;
        unint64_t v84 = v17;
        if (v17)
        {
          unint64_t v24 = (unint64_t *)&v17->__shared_owners_;
          do
            unint64_t v25 = __ldxr(v24);
          while (__stxr(v25 + 1, v24));
        }

        uint64_t v81 = v20;
        uint64_t v82 = v21;
        if (v21)
        {
          unint64_t v26 = (unint64_t *)&v21->__shared_owners_;
          do
            unint64_t v27 = __ldxr(v26);
          while (__stxr(v27 + 1, v26));
        }

        sub_100005F90(v10, v14, v15, v16, v17, &v81);
        if (v21)
        {
          unint64_t v28 = (unint64_t *)&v21->__shared_owners_;
          do
            unint64_t v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }

        unint64_t v30 = v84;
        if (v84)
        {
          unint64_t v31 = (unint64_t *)&v84->__shared_owners_;
          do
            unint64_t v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
      }

      unint64_t v33 = v76;
      if (v76)
      {
        uint64_t v34 = (unint64_t *)&v76->__shared_owners_;
        do
          unint64_t v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v33->__on_zero_shared)(v33, v14, v15);
          std::__shared_weak_count::__release_weak(v33);
        }
      }

      unint64_t v36 = v78;
      if (v78)
      {
        unint64_t v37 = (unint64_t *)&v78->__shared_owners_;
        do
          unint64_t v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v36->__on_zero_shared)(v36, v14, v15);
          std::__shared_weak_count::__release_weak(v36);
        }
      }

      CFIndex v39 = v80;
      if (v80)
      {
        unint64_t v40 = (unint64_t *)&v80->__shared_owners_;
        do
          unint64_t v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        goto LABEL_89;
      }

      goto LABEL_91;
    }

    uint64_t v42 = (const OpaqueJSContext **)a1[4];
    if (v42)
    {
      unint64_t v43 = (std::__shared_weak_count *)v4[1];
      CFErrorDomain v73 = (uint64_t *)*v4;
      unint64_t v74 = v43;
      if (v43)
      {
        v44 = (unint64_t *)&v43->__shared_owners_;
        do
          unint64_t v45 = __ldxr(v44);
        while (__stxr(v45 + 1, v44));
      }

      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472LL;
      v70[2] = sub_100008E58;
      v70[3] = &unk_100014B20;
      v70[4] = v4;
      sub_100005CF0(&v71, v70);
      sub_10000B810(v42, &v73, &v71);
      uint64_t v46 = v72;
      if (v72)
      {
        uint64_t v47 = (unint64_t *)&v72->__shared_owners_;
        do
          unint64_t v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }

      CFIndex v39 = v74;
      if (v74)
      {
        uint64_t v49 = (unint64_t *)&v74->__shared_owners_;
        do
          unint64_t v41 = __ldaxr(v49);
        while (__stlxr(v41 - 1, v49));
        goto LABEL_89;
      }

      goto LABEL_91;
    }

    uint64_t v50 = *v4;
    uint64_t v51 = *(void *)(*v4 + 72LL);
    uint64_t v52 = *(std::__shared_weak_count **)(*v4 + 80LL);
    uint64_t v79 = v51;
    unint64_t v80 = v52;
    if (v52)
    {
      v53 = (unint64_t *)&v52->__shared_owners_;
      do
        unint64_t v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
      uint64_t v50 = *v4;
    }

    uint64_t v15 = *(void *)(v50 + 32);
    uint64_t v14 = *(void *)(v50 + 40);
    uint64_t v55 = *a3;
    unint64_t v56 = (std::__shared_weak_count *)a3[1];
    uint64_t v69 = v56;
    if (v56)
    {
      unint64_t v57 = (unint64_t *)&v56->__shared_owners_;
      do
        unint64_t v58 = __ldxr(v57);
      while (__stxr(v58 + 1, v57));
      if (!v51) {
        goto LABEL_81;
      }
      uint64_t v83 = 0LL;
      unint64_t v84 = 0LL;
      uint64_t v81 = v55;
      uint64_t v82 = v56;
      do
        unint64_t v59 = __ldxr(v57);
      while (__stxr(v59 + 1, v57));
    }

    else
    {
      if (!v51) {
        goto LABEL_81;
      }
      unint64_t v56 = 0LL;
      uint64_t v83 = 0LL;
      unint64_t v84 = 0LL;
      uint64_t v81 = v55;
      uint64_t v82 = 0LL;
    }

    sub_100005F90(v51, v14, v15, 0LL, 0LL, &v81);
    if (v56)
    {
      unint64_t v60 = (unint64_t *)&v56->__shared_owners_;
      do
        unint64_t v61 = __ldaxr(v60);
      while (__stlxr(v61 - 1, v60));
      if (!v61)
      {
        ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
        std::__shared_weak_count::__release_weak(v56);
      }
    }

    v62 = v84;
    if (v84)
    {
      __int128 v63 = (unint64_t *)&v84->__shared_owners_;
      do
        unint64_t v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }

LABEL_81:
    if (v69)
    {
      unint64_t v65 = (unint64_t *)&v69->__shared_owners_;
      do
        unint64_t v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v69->__on_zero_shared)(v69, v14, v15);
        std::__shared_weak_count::__release_weak(v69);
      }
    }

    CFIndex v39 = v80;
    if (v80)
    {
      unint64_t v67 = (unint64_t *)&v80->__shared_owners_;
      do
        unint64_t v41 = __ldaxr(v67);
      while (__stlxr(v41 - 1, v67));
LABEL_89:
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *, uint64_t, uint64_t))v39->__on_zero_shared)(v39, v14, v15);
        std::__shared_weak_count::__release_weak(v39);
      }
    }

LABEL_91:
    char v8 = 0;
    v4 += 2;
  }

  while (v4 != v5);
  int64x2_t v68 = (void *)a1[7];
  unint64_t v4 = (void *)a1[8];
  if (v4 != v68)
  {
    do
    {
      v4 -= 2;
      sub_100005C98((uint64_t)v4);
    }

    while (v4 != v68);
    unint64_t v4 = v68;
  }

LABEL_95:
  a1[8] = v4;
}

void sub_100008DE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100008E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v7 = **(void **)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 72);
  uint64_t v9 = *(std::__shared_weak_count **)(v7 + 80);
  unint64_t v37 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }

  uint64_t v12 = *a4;
  unint64_t v13 = (std::__shared_weak_count *)a4[1];
  unint64_t v36 = v13;
  if (v13)
  {
    uint64_t v14 = (unint64_t *)&v13->__shared_owners_;
    do
      unint64_t v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }

  uint64_t v16 = *a5;
  unint64_t v17 = (std::__shared_weak_count *)a5[1];
  unint64_t v35 = v17;
  if (v17)
  {
    uint64_t v18 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  if (v8)
  {
    v38[2] = v12;
    CFIndex v39 = v13;
    if (v13)
    {
      uint64_t v20 = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    v38[0] = v16;
    v38[1] = (uint64_t)v17;
    if (v17)
    {
      __int128 v22 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }

    sub_100005F90(v8, a2, a3, v12, v13, v38);
    if (v17)
    {
      unint64_t v24 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    unint64_t v26 = v39;
    if (v39)
    {
      uint64_t v27 = (unint64_t *)&v39->__shared_owners_;
      do
        unint64_t v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }

  if (v35)
  {
    unint64_t v29 = (unint64_t *)&v35->__shared_owners_;
    do
      unint64_t v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  if (v36)
  {
    unint64_t v31 = (unint64_t *)&v36->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  if (v37)
  {
    unint64_t v33 = (unint64_t *)&v37->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

void sub_10000904C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
}

void sub_100009080(JSGlobalContextRef ctx)
{
  if (ctx) {
    JSGlobalContextRelease(ctx);
  }
}

void sub_10000908C(void **a1, void *a2)
{
  uint64_t v2 = (void (**)(void))*a1;
  *a1 = a2;
  if (v2)
  {
    uint64_t v3 = *v2;
    *uint64_t v2 = 0LL;
    if (v3) {
      v2[1]();
    }
    operator delete(v2);
  }

void sub_1000090D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = a4[1];
  uint64_t v18 = *a4;
  unint64_t v19 = (std::__shared_weak_count *)v6;
  if (v6)
  {
    uint64_t v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  uint64_t v9 = (std::__shared_weak_count *)a5[1];
  v17[0] = *a5;
  v17[1] = (uint64_t)v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }

  sub_100008924(v5, &v18, v17);
  if (v9)
  {
    uint64_t v12 = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  uint64_t v14 = v19;
  if (v19)
  {
    uint64_t v15 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

void sub_1000091BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_1000091D8()
{
}

uint64_t sub_1000091E4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + sub_100005C98(v15 - 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  return result;
}

uint64_t sub_100009208(uint64_t a1)
{
  return sub_100005C98(a1 + 32);
}

void sub_100009214(std::__shared_weak_count *a1)
{
}

void sub_100009228(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_10000923C(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unsupported PAC URL scheme - please use HTTPS for PAC File URLs",  v1,  2u);
  }

uint64_t sub_100009298()
{
  return sub_1000092AC();
}

uint64_t sub_1000092AC(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_1000092E4(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = (void *)*v1;
      sub_100009320((uint64_t)(v1 + 2));
      operator delete(v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

void sub_100009320(uint64_t a1)
{
}

void sub_10000935C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014C80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10000936C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014C80;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_10000938C(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 24));
}

void sub_1000093B8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014C48;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000093C8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014C48;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1000093E8(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void sub_1000093F8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_100009320((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }

unint64_t sub_10000943C(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9LL * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127LL * (v22 + v20) - 0x651E95C4D06FBFB1LL * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9LL * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }

    unint64_t v4 = 0x9DDFEA08EB382D69LL;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69LL
        * (v34 ^ ((0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69LL * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297LL * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    uint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0LL);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273LL * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273LL * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64LL;
    }

    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297LL
        * ((0x9DDFEA08EB382D69LL
          * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69LL * (v49 ^ ((0x9DDFEA08EB382D69LL * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69LL
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297LL
                * ((0x9DDFEA08EB382D69LL
                  * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69LL * (v48 ^ ((0x9DDFEA08EB382D69LL * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69LL * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }

  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273LL * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69LL;
    unint64_t v30 = 0x9DDFEA08EB382D69LL * (v29 ^ (v28 - 0x3C5A37A36834CED9LL * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69LL * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }

  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69LL;
      unint64_t v73 = 0x9DDFEA08EB382D69LL * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }

    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }

  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69LL
        * ((0x9DDFEA08EB382D69LL
          * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69LL * (v3 ^ ((0x9DDFEA08EB382D69LL * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_100009870(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1LL;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }

  while (v13 && v12);
  return v14;
}

void *sub_100009910(_BYTE *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *int v5 = v8;
    int v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100009998(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014CB8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000099A8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014CB8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_1000099C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 88);
    uint64_t v4 = *(void **)(a1 + 80);
    if (v3 != v2)
    {
      do
        uint64_t v3 = sub_100005C98(v3 - 16);
      while (v3 != v2);
      uint64_t v4 = *(void **)(a1 + 80);
    }

    *(void *)(a1 + 88) = v2;
    operator delete(v4);
  }

  sub_100005C98(a1 + 64);
  sub_10000908C((void **)(a1 + 56), 0LL);
  int v5 = *(std::__shared_weak_count **)(a1 + 48);
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

  int v8 = *(std::__shared_weak_count **)(a1 + 32);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
}

void *sub_100009A88(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
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

void sub_100009B34(id a1)
{
  uint64_t v1 = operator new(0x88uLL);
  uint64_t v2 = (std::__shared_weak_count *)operator new(0x30uLL);
  uint64_t v3 = v2;
  v2->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0LL;
  v2[1].__vftable = (std::__shared_weak_count_vtbl *)&off_100014DB8;
  v2->__vftable = (std::__shared_weak_count_vtbl *)off_100014C48;
  v2[1].__shared_owners_ = 0LL;
  v2[1].__shared_weak_owners_ = 0LL;
  *(void *)&__int128 v5 = v2 + 1;
  *((void *)&v5 + 1) = v2;
  do
    unint64_t v6 = __ldxr(p_shared_owners);
  while (__stxr(v6 + 1, p_shared_owners));
  p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
  do
    unint64_t v8 = __ldxr(p_shared_weak_owners);
  while (__stxr(v8 + 1, p_shared_weak_owners));
  v2[1].__shared_owners_ = (uint64_t)&v2[1];
  v2[1].__shared_weak_owners_ = (uint64_t)v2;
  do
    unint64_t v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    __int128 v11 = v5;
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v3);
    __int128 v5 = v11;
  }

  v1[1] = 0u;
  *uint64_t v1 = v5;
  v1[2] = 0u;
  *((_DWORD *)v1 + 12) = 1065353216;
  *((void *)v1 + 7) = 850045863LL;
  v1[4] = 0u;
  v1[5] = 0u;
  v1[6] = 0u;
  *((void *)v1 + 14) = 0LL;
  int v10 = (char *)operator new(0x20uLL);
  *((void *)v10 + 1) = 0LL;
  *((void *)v10 + 2) = 0LL;
  *(void *)int v10 = off_100014C80;
  *((_DWORD *)v10 + 6) = 0;
  *((_DWORD *)v10 + 7) = 0;
  notify_register_check("com.apple.system.config.network_change", (int *)v10 + 6);
  notify_register_check("com.apple.system.config.proxy_change", (int *)v10 + 7);
  notify_check(*((_DWORD *)v10 + 6), &check);
  notify_check(*((_DWORD *)v10 + 7), &check);
  *((void *)v1 + 15) = v10 + 24;
  *((void *)v1 + 16) = v10;
  qword_1000188D8 = (uint64_t)v1;
}

void sub_100009CB4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000A088(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if ((objc_opt_respondsToSelector(a3, "statusCode") & 1) != 0) {
      uint64_t v9 = (uint64_t)[a3 statusCode];
    }
    else {
      uint64_t v9 = -1LL;
    }
    int v11 = 138413314;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    __int16 v15 = 2048;
    uint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC fetch end for %@. data %p response %p statusCode %ld error %p",  (uint8_t *)&v11,  0x34u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10000A1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 && *(_BYTE *)(a1 + 88))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)JSClassDefinition buf = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HTTPS upgrade task failed, attempting fallback %@ %@",  buf,  0x16u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _OWORD v10[2] = sub_10000A2C0;
    v10[3] = &unk_100014D10;
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    objc_msgSend(objc_msgSend(v7, "dataTaskWithURL:completionHandler:", v8, v10), "resume");
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  return [*(id *)(a1 + 32) finishTasksAndInvalidate];
}

uint64_t sub_10000A2C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

UInt8 *sub_10000A2CC(const __CFAllocator *a1, CFStringRef theString, UInt8 *a3, uint64_t *a4)
{
  usedBufLen = a4;
  if (!a4)
  {
    uint64_t v14 = 0LL;
    usedBufLen = &v14;
  }

  CFIndex Length = CFStringGetLength(theString);
  v15.location = 0LL;
  v15.length = Length;
  CFStringGetBytes(theString, v15, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen);
  CFIndex v10 = maxBufLen;
  if (a3 && *usedBufLen > maxBufLen) {
    goto LABEL_7;
  }
  int v11 = (UInt8 *)CFAllocatorAllocate(a1, maxBufLen + 1, 0LL);
  if (v11)
  {
    CFIndex v10 = maxBufLen;
    a3 = v11;
LABEL_7:
    v16.location = 0LL;
    v16.length = Length;
    CFStringGetBytes(theString, v16, 0x8000100u, 0, 0, a3, v10, usedBufLen);
    a3[*usedBufLen] = 0;
    return a3;
  }

  if (a4)
  {
    if (a3 && *a4 >= 1) {
      *a3 = 0;
    }
    *a4 = 0LL;
  }

  return a3;
}

void *sub_10000A3DC(void *result)
{
  *uint64_t result = &off_100014D68;
  return result;
}

uint64_t sub_10000A3F0(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_10000A41C(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(__p);
}

void sub_10000A448(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __int128 v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5 || (v9 = *(void *)(a1 + 8), (CFIndex v10 = std::__shared_weak_count::lock(v5)) == 0LL)) {
    sub_100009298();
  }
  int v11 = v10;
  uint64_t v63 = v9;
  uint64_t v64 = v10;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  do
    unint64_t v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    unint64_t v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }

  if (v63)
  {
    uint64_t v15 = *a3;
    if (*(_BYTE *)(*a3 + 88LL)) {
      CFRange v16 = *(NSURL **)v15;
    }
    else {
      CFRange v16 = 0LL;
    }
    __int128 v54 = *(_OWORD *)(v15 + 16);
    __int128 v56 = *(_OWORD *)(v15 + 32);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3321888768LL;
    v57[2] = sub_10000AA68;
    v57[3] = &unk_100014D78;
    __int16 v17 = (std::__shared_weak_count *)a4[1];
    v57[4] = *a4;
    uint64_t v58 = v17;
    if (v17)
    {
      uint64_t v18 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }

    uint64_t v59 = v63;
    uint64_t v60 = v64;
    uint64_t v20 = (unint64_t *)&v64->__shared_owners_;
    do
      unint64_t v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
    uint64_t v22 = (std::__shared_weak_count *)a3[1];
    uint64_t v61 = *a3;
    uint64_t v62 = v22;
    if (v22)
    {
      unint64_t v23 = (unint64_t *)&v22->__shared_owners_;
      do
        unint64_t v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }

    unint64_t v25 = objc_autoreleasePoolPush();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.receiver) = 138412290;
      *(id *)((char *)&buf.receiver + 4) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC fetch start for %@",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v26 = +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration",  v54);
    -[NSURLSessionConfiguration setConnectionProxyDictionary:]( v26,  "setConnectionProxyDictionary:",  &__NSDictionary0__struct);
    -[NSURLSessionConfiguration set_prohibitEncryptedDNS:](v26, "set_prohibitEncryptedDNS:", 1LL);
    -[NSURLSessionConfiguration setProtocolClasses:](v26, "setProtocolClasses:", 0LL);
    error[0] = 0LL;
    CFDataRef Data = CFPropertyListCreateData(0LL, &off_1000157C8, kCFPropertyListBinaryFormat_v1_0, 0LL, error);
    if (Data)
    {
      -[NSURLSessionConfiguration set_atsContext:](v26, "set_atsContext:", Data);
      CFRelease(Data);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.receiver) = 138412290;
        *(CFErrorRef *)((char *)&buf.receiver + 4) = error[0];
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC failed data conversion %@",  (uint8_t *)&buf,  0xCu);
      }

      CFRelease(error[0]);
    }

    -[NSURLSessionConfiguration setRequestCachePolicy:](v26, "setRequestCachePolicy:", 1LL);
    -[NSURLSessionConfiguration setURLCache:](v26, "setURLCache:", 0LL);
    -[NSURLSessionConfiguration setHTTPCookieStorage:](v26, "setHTTPCookieStorage:", 0LL);
    -[NSURLSessionConfiguration set_alternativeServicesStorage:](v26, "set_alternativeServicesStorage:", 0LL);
    -[NSURLSessionConfiguration set_sourceApplicationAuditTokenData:]( v26,  "set_sourceApplicationAuditTokenData:",  (void)v56);
    -[NSURLSessionConfiguration set_sourceApplicationBundleIdentifier:]( v26,  "set_sourceApplicationBundleIdentifier:",  *((void *)&v56 + 1));
    uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[NSOperationQueue setUnderlyingQueue:](v28, "setUnderlyingQueue:", a2);
    unint64_t v29 = objc_alloc(&OBJC_CLASS___PACURLSessionDelegate);
    if (v29)
    {
      buf.receiver = v29;
      buf.super_class = (Class)&OBJC_CLASS___PACURLSessionDelegate;
      id v30 = objc_msgSendSuper2(&buf, "init");
      uint64_t v32 = v30;
      if (v30)
      {
        objc_setProperty_atomic(v30, v31, (id)v55, 8LL);
        objc_setProperty_atomic(v32, v33, *((id *)&v55 + 1), 16LL);
      }
    }

    else
    {
      uint64_t v32 = 0LL;
    }

    uint64_t v34 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v26,  v32,  v28);
    error[0] = (CFErrorRef)_NSConcreteStackBlock;
    error[1] = (CFErrorRef)3221225472LL;
    error[2] = (CFErrorRef)sub_10000A088;
    error[3] = (CFErrorRef)&unk_100014CE8;
    __int128 v66 = v55;
    __int128 v67 = v56;
    error[4] = (CFErrorRef)v57;
    error[5] = (CFErrorRef)v16;
    uint64_t v35 = -[NSURL scheme](v16, "scheme");
    if (!v35
      || -[NSString caseInsensitiveCompare:](v35, "caseInsensitiveCompare:", @"http")
      || (-[NSURL isEqual:]( v16,  "isEqual:",  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"http://wpad/wpad.dat")) & 1) != 0)
    {
      int v36 = 0;
      uint64_t v37 = v16;
    }

    else
    {
      uint64_t v53 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v16,  0LL);
      -[NSURLComponents setScheme:](v53, "setScheme:", @"https");
      uint64_t v37 = -[NSURLComponents URL](v53, "URL");
      int v36 = 1;
    }

    uint64_t v38 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v37);
    unint64_t v39 = v38;
    double v40 = 60.0;
    if (v36) {
      double v40 = 3.0;
    }
    -[NSMutableURLRequest setTimeoutInterval:](v38, "setTimeoutInterval:", v40);
    buf.receiver = _NSConcreteStackBlock;
    buf.super_class = (Class)3221225472LL;
    unint64_t v69 = sub_10000A1A4;
    unint64_t v70 = &unk_100014D38;
    char v76 = v36;
    __int128 v74 = v55;
    __int128 v75 = v56;
    uint64_t v71 = v34;
    uint64_t v72 = error;
    unint64_t v73 = v16;
    -[NSURLSessionDataTask resume]( -[NSURLSession dataTaskWithRequest:completionHandler:](v34, "dataTaskWithRequest:completionHandler:", v39, &buf),  "resume");
    objc_autoreleasePoolPop(v25);
    unint64_t v41 = v62;
    if (v62)
    {
      unint64_t v42 = (unint64_t *)&v62->__shared_owners_;
      do
        unint64_t v43 = __ldaxr(v42);
      while (__stlxr(v43 - 1, v42));
      if (!v43)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }

    unint64_t v44 = v60;
    if (v60)
    {
      uint64_t v45 = (unint64_t *)&v60->__shared_owners_;
      do
        unint64_t v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
      }
    }

    uint64_t v47 = v58;
    if (v58)
    {
      uint64_t v48 = (unint64_t *)&v58->__shared_owners_;
      do
        unint64_t v49 = __ldaxr(v48);
      while (__stlxr(v49 - 1, v48));
      if (!v49)
      {
        ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
        std::__shared_weak_count::__release_weak(v47);
      }
    }
  }

  uint64_t v50 = v64;
  if (v64)
  {
    uint64_t v51 = (unint64_t *)&v64->__shared_owners_;
    do
      unint64_t v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }

void sub_10000AA34( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23)
{
}

void sub_10000AA68(uint64_t *a1, const __CFData *a2, uint64_t a3, const void *a4)
{
  if (a4)
  {
    v68[2] = 0LL;
    unint64_t v69 = 0LL;
    CFAbsoluteTimeGetCurrent();
    uint64_t v6 = (std::__shared_weak_count_vtbl *)CFRetain(a4);
    v68[0] = (uint64_t)v6;
    uint64_t v7 = (std::__shared_weak_count *)operator new(0x20uLL);
    v7->__shared_owners_ = 0LL;
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v7->__shared_weak_owners_ = 0LL;
    v7[1].__vftable = v6;
    v68[1] = (uint64_t)v7;
    sub_10000B360(a1[4], 0LL, 0LL, v68);
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }

    CFIndex v10 = v69;
    if (v69)
    {
      int v11 = (unint64_t *)&v69->__shared_owners_;
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
LABEL_105:
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }

      return;
    }

    return;
  }

  uint64_t v14 = a1[8];
  if (*(_BYTE *)(v14 + 88)) {
    uint64_t v15 = *(void *)v14;
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v17 = a1[4];
  uint64_t v16 = a1[5];
  __int128 v67 = (std::__shared_weak_count *)v16;
  if (v16)
  {
    uint64_t v18 = (unint64_t *)(v16 + 8);
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  CFErrorRef v76 = 0LL;
  uint64_t v77 = 0LL;
  CFStringRef v74 = 0LL;
  __int128 v75 = 0LL;
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse(a3);
  uint64_t v22 = HTTPResponse;
  if (!HTTPResponse)
  {
    unint64_t v24 = 0LL;
    CFErrorRef v23 = 0LL;
LABEL_22:
    CFStringRef v25 = 0LL;
    CFStringRef v72 = 0LL;
    unint64_t v73 = 0LL;
    goto LABEL_62;
  }

  if (CFHTTPMessageGetResponseStatusCode(HTTPResponse) == 401)
  {
    _CFHTTPMessageSetResponseURL(v22, v15);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(result.location) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC failed authentication",  (uint8_t *)&result,  2u);
    }

    v81[0] = kCFProxyAutoConfigurationHTTPResponseKey;
    v81[1] = kCFProxyAutoConfigurationURLKey;
    v82[0] = v22;
    v82[1] = v15;
    CFErrorRef v23 = CFErrorCreate( kCFAllocatorDefault,  kCFErrorDomainCFNetwork,  309LL,  (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  2LL,  v17));
    unint64_t v24 = (std::__shared_weak_count *)operator new(0x20uLL);
    v24->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v24->__shared_owners_ = 0LL;
    v24->__shared_weak_owners_ = 0LL;
    v24[1].__vftable = (std::__shared_weak_count_vtbl *)v23;
    CFErrorRef v76 = v23;
    uint64_t v77 = v24;
    v21.n128_f64[0] = CFAbsoluteTimeGetCurrent();
    goto LABEL_22;
  }

  CFAbsoluteTimeGetCurrent();
  ResponseStatusCFIndex Code = CFHTTPMessageGetResponseStatusCode(v22);
  if (ResponseStatusCode == -1 || ResponseStatusCode > 299)
  {
    CFStringRef v25 = 0LL;
  }

  else
  {
    unint64_t v27 = CFHTTPMessageCopyHeaderFieldValue(v22, @"Content-Type");
    uint64_t v28 = v27;
    if (v27)
    {
      if (CFStringFind(v27, @"application/x-javascript", 1uLL).location == -1) {
        goto LABEL_38;
      }
      CFRange v29 = CFStringFind(v28, @"charset=", 1uLL);
      if (v29.location == -1) {
        goto LABEL_38;
      }
      CFIndex v30 = v29.location + v29.length;
      if (CFStringGetCharacterAtIndex(v28, v29.location + v29.length) == 34) {
        ++v30;
      }
      CFIndex Length = CFStringGetLength(v28);
      uint64_t v32 = (const __CFCharacterSet *)qword_1000188E0;
      if (!qword_1000188E0)
      {
        uint64_t v32 = CFCharacterSetCreateWithCharactersInString(0LL, @"\n\r\t ;");
        qword_1000188E0 = (uint64_t)v32;
        if (!v32) {
          goto LABEL_38;
        }
      }

      CFIndex v33 = Length - v30;
      v83.location = v30;
      v83.length = v33;
      v34.length = CFStringFindCharacterFromSet(v28, v32, v83, 0LL, &result) ? result.location - v30 : v33;
      v34.location = v30;
      uint64_t v35 = CFStringCreateWithSubstring(0LL, v28, v34);
      int v36 = v35;
      if (v35)
      {
        CFStringEncoding v37 = CFStringConvertIANACharSetNameToEncoding(v35);
        CFRelease(v36);
      }

      else
      {
LABEL_38:
        CFStringEncoding v37 = -1;
      }

      CFRelease(v28);
    }

    else
    {
      CFStringEncoding v37 = -1;
    }

    CFIndex v38 = CFDataGetLength(a2);
    if (v38)
    {
      if (v37 == -1)
      {
        CFStringRef v25 = 0LL;
      }

      else
      {
        BytePtr = CFDataGetBytePtr(a2);
        CFStringRef v25 = CFStringCreateWithBytes(0LL, BytePtr, v38, v37, 1u);
      }

      if (!v25 && v37 != 134217984)
      {
        double v40 = CFDataGetBytePtr(a2);
        CFStringRef v25 = CFStringCreateWithBytes(0LL, v40, v38, 0x8000100u, 1u);
      }

      if (!v25 && v37 != 513)
      {
        unint64_t v41 = CFDataGetBytePtr(a2);
        CFStringRef v25 = CFStringCreateWithBytes(0LL, v41, v38, 0x201u, 1u);
      }

      if (v25) {
        goto LABEL_56;
      }
      unint64_t v42 = CFDataGetBytePtr(a2);
      CFStringRef v25 = CFStringCreateWithBytes(0LL, v42, v38, 0, 1u);
      if (v25) {
        goto LABEL_56;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(result.location) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC data bytes could not be converted",  (uint8_t *)&result,  2u);
      }
    }

    CFStringRef v25 = 0LL;
  }

LABEL_56:
  unint64_t v43 = (std::__shared_weak_count *)operator new(0x20uLL);
  unint64_t v24 = 0LL;
  CFErrorRef v23 = 0LL;
  v43->__shared_owners_ = 0LL;
  unint64_t v44 = (unint64_t *)&v43->__shared_owners_;
  v43->__vftable = (std::__shared_weak_count_vtbl *)&off_100014DE0;
  v43->__shared_weak_owners_ = 0LL;
  v43[1].__vftable = (std::__shared_weak_count_vtbl *)v25;
  CFStringRef v74 = v25;
  __int128 v75 = v43;
  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(result.location) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC response body failed string conversion",  (uint8_t *)&result,  2u);
    }

    CFErrorRef v23 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 308LL, 0LL);
    unint64_t v24 = (std::__shared_weak_count *)operator new(0x20uLL);
    v24->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v24->__shared_owners_ = 0LL;
    v24->__shared_weak_owners_ = 0LL;
    v24[1].__vftable = (std::__shared_weak_count_vtbl *)v23;
    CFErrorRef v76 = v23;
    uint64_t v77 = v24;
  }

  CFStringRef v72 = v25;
  unint64_t v73 = v43;
  do
    unint64_t v45 = __ldxr(v44);
  while (__stxr(v45 + 1, v44));
LABEL_62:
  CFErrorRef v70 = v23;
  uint64_t v71 = v24;
  if (v24)
  {
    unint64_t v46 = (unint64_t *)&v24->__shared_owners_;
    do
      unint64_t v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
  }

  if (v17)
  {
    result.location = (CFIndex)v25;
    result.length = (CFIndex)v73;
    if (v73)
    {
      uint64_t v48 = &v73->__shared_owners_;
      do
        unint64_t v49 = __ldxr((unint64_t *)v48);
      while (__stxr(v49 + 1, (unint64_t *)v48));
    }

    CFErrorRef v78 = v23;
    uint64_t v79 = v71;
    if (v71)
    {
      uint64_t v50 = &v71->__shared_owners_;
      do
        unint64_t v51 = __ldxr((unint64_t *)v50);
      while (__stxr(v51 + 1, (unint64_t *)v50));
    }

    sub_1000086B0(v17, (uint64_t)v25, v73, (uint64_t *)&v78);
    unint64_t v52 = v79;
    if (v79)
    {
      uint64_t v53 = (unint64_t *)&v79->__shared_owners_;
      do
        unint64_t v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }

    __int128 v55 = (std::__shared_weak_count *)result.length;
    if (result.length)
    {
      __int128 v56 = (unint64_t *)(result.length + 8);
      do
        unint64_t v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
  }

  if (v71)
  {
    uint64_t v58 = &v71->__shared_owners_;
    do
      unint64_t v59 = __ldaxr((unint64_t *)v58);
    while (__stlxr(v59 - 1, (unint64_t *)v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v71->__on_zero_shared)(v71, v21);
      std::__shared_weak_count::__release_weak(v71);
    }
  }

  if (v73)
  {
    uint64_t v60 = &v73->__shared_owners_;
    do
      unint64_t v61 = __ldaxr((unint64_t *)v60);
    while (__stlxr(v61 - 1, (unint64_t *)v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v73->__on_zero_shared)(v73, v21);
      std::__shared_weak_count::__release_weak(v73);
    }
  }

  if (v75)
  {
    uint64_t v62 = &v75->__shared_owners_;
    do
      unint64_t v63 = __ldaxr((unint64_t *)v62);
    while (__stlxr(v63 - 1, (unint64_t *)v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v75->__on_zero_shared)(v75, v21);
      std::__shared_weak_count::__release_weak(v75);
    }
  }

  if (v77)
  {
    uint64_t v64 = &v77->__shared_owners_;
    do
      unint64_t v65 = __ldaxr((unint64_t *)v64);
    while (__stlxr(v65 - 1, (unint64_t *)v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v77->__on_zero_shared)(v77, v21);
      std::__shared_weak_count::__release_weak(v77);
    }
  }

  CFIndex v10 = v67;
  if (v67)
  {
    __int128 v66 = (unint64_t *)&v67->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v66);
    while (__stlxr(v12 - 1, v66));
    goto LABEL_105;
  }

void sub_10000B24C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, char a21)
{
}

void *sub_10000B2C8(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[7];
  result[6] = a2[6];
  result[7] = v5;
  if (v5)
  {
    uint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  uint64_t v8 = a2[9];
  result[8] = a2[8];
  result[9] = v8;
  if (v8)
  {
    unint64_t v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  return result;
}

uint64_t sub_10000B32C(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = a1 + 48;
  sub_100005C98(a1 + 64);
  sub_100005C98(v2);
  return sub_100005C98(v1);
}

void sub_10000B360(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t *a4)
{
  if (a1)
  {
    void v14[2] = a2;
    uint64_t v15 = a3;
    if (a3)
    {
      p_shared_owners = (unint64_t *)&a3->__shared_owners_;
      do
        unint64_t v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }

    uint64_t v6 = (std::__shared_weak_count *)a4[1];
    v14[0] = *a4;
    v14[1] = (uint64_t)v6;
    if (v6)
    {
      unint64_t v7 = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }

    sub_1000086B0(a1, a2, a3, v14);
    if (v6)
    {
      unint64_t v9 = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }

    int v11 = v15;
    if (v15)
    {
      unint64_t v12 = (unint64_t *)&v15->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

void sub_10000B440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_10000B460(std::__shared_weak_count *a1)
{
}

void sub_10000B474(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

CFDictionaryRef sub_10000B488(const __CFAllocator *a1, const __CFString *a2, const __CFString *a3)
{
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFIndex Length = CFStringGetLength(a2);
  CFIndex location = CFStringFind(a2, @":", 0LL).location;
  CFIndex v9 = location;
  if (location == -1) {
    CFIndex v10 = Length;
  }
  else {
    CFIndex v10 = location;
  }
  CFIndex v11 = 5LL;
  if (Length >= 6)
  {
    while (1)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v11);
      if (!CFCharacterSetIsCharacterMember(Predefined, CharacterAtIndex)) {
        break;
      }
      if (Length == ++v11)
      {
        CFIndex v11 = Length;
        break;
      }
    }
  }

  BOOL v13 = v10 <= v11;
  CFIndex v14 = v10 - v11;
  if (v13) {
    return 0LL;
  }
  uint64_t v15 = CFGetAllocator(a2);
  v33.length = v11 - 1;
  v33.CFIndex location = 0LL;
  uint64_t v16 = CFStringCreateWithSubstring(v15, a2, v33);
  uint64_t v17 = CFGetAllocator(a2);
  v34.CFIndex location = v11;
  v34.length = v14;
  CFStringRef v18 = CFStringCreateWithSubstring(v17, a2, v34);
  if (v9 != -1)
  {
    v35.CFIndex location = v9 + 1;
    v35.length = Length + ~v9;
    unint64_t v19 = CFStringCreateWithSubstring(a1, a2, v35);
    SInt32 valuePtr = CFStringGetIntValue(v19);
    if (v19) {
      CFRelease(v19);
    }
  }

  if (!v16)
  {
LABEL_41:
    if (v18) {
      CFRelease(v18);
    }
    return 0LL;
  }

  if (CFStringCompare(v16, @"PROXY", 1uLL) == kCFCompareEqualTo)
  {
    if (CFStringCompare(a3, @"http", 1uLL) && CFStringCompare(a3, @"ws", 1uLL))
    {
      if (CFStringCompare(a3, @"https", 1uLL) && CFStringCompare(a3, @"wss", 1uLL))
      {
        if (CFStringCompare(a3, @"ftp", 1uLL)) {
          goto LABEL_15;
        }
        CFStringRef v20 = kCFProxyTypeFTP;
        if (v9 == -1)
        {
          CFStringRef v21 = 0LL;
          int v22 = 21;
LABEL_33:
          SInt32 valuePtr = v22;
          goto LABEL_34;
        }

        goto LABEL_28;
      }

      CFStringRef v25 = &kCFProxyTypeHTTPS;
    }

    else
    {
      CFStringRef v25 = &kCFProxyTypeHTTP;
    }

    CFStringRef v20 = *v25;
    if (v9 == -1)
    {
      CFStringRef v21 = 0LL;
      int v22 = 80;
      goto LABEL_33;
    }

LABEL_28:
    CFStringRef v21 = 0LL;
    goto LABEL_34;
  }

  if (CFStringCompare(v16, @"SOCKS", 1uLL))
  {
LABEL_15:
    CFRelease(v16);
    goto LABEL_41;
  }

  CFComparisonResult v23 = CFStringCompare(a3, @"socks4", 1uLL);
  CFStringRef v20 = kCFProxyTypeSOCKS;
  if (v23) {
    unint64_t v24 = &kCFStreamSocketSOCKSVersion5;
  }
  else {
    unint64_t v24 = &kCFStreamSocketSOCKSVersion4;
  }
  CFStringRef v21 = *v24;
  if (v9 == -1)
  {
    int v22 = 1080;
    goto LABEL_33;
  }

    if (!v15) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    goto LABEL_28;
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2);
  *(_DWORD *)__int128 __p = 134218498;
  *(void *)&__p[4] = v17;
  *(_WORD *)&__p[12] = 2112;
  *(void *)&__p[14] = v15;
  *(_WORD *)&__p[22] = 2112;
  CFStringRef v20 = v12;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to add key-value pair to SCDynamicStore <QueryType=%lld>: <Key=%@, Value=%@>",  __p,  0x20u);
  if (v15) {
    goto LABEL_29;
  }
LABEL_30:
  if (v12) {
    CFRelease(v12);
  }
  if (v10) {
    CFRelease(v10);
  }
}

LABEL_34:
  CFRelease(v16);
  if (!v20) {
    goto LABEL_41;
  }
  CFIndex v26 = 3LL;
  CFNumberRef v27 = CFNumberCreate(a1, kCFNumberSInt32Type, &valuePtr);
  keys[0] = (void *)kCFProxyTypeKey;
  keys[1] = (void *)kCFProxyHostNameKey;
  values[0] = (void *)v20;
  values[1] = (void *)v18;
  keys[2] = (void *)kCFProxyPortNumberKey;
  values[2] = v27;
  if (v21)
  {
    keys[3] = (void *)kCFStreamPropertySOCKSVersion;
    values[3] = (void *)v21;
    CFIndex v26 = 4LL;
  }

  CFDictionaryRef v28 = CFDictionaryCreate( a1,  (const void **)keys,  (const void **)values,  v26,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (v18) {
    CFRelease(v18);
  }
  if (v27) {
    CFRelease(v27);
  }
  return v28;
}

void sub_10000B804(JSGlobalContextRef ctx)
{
  if (ctx) {
    JSGlobalContextRelease(ctx);
  }
}

void sub_10000B810(const OpaqueJSContext **a1, uint64_t **a2, uint64_t *a3)
{
  uint64_t v77 = 0LL;
  CFErrorRef v78 = 0LL;
  CFErrorRef v75 = 0LL;
  CFErrorRef v76 = 0LL;
  unint64_t v4 = (const __CFURL *)(*a2)[1];
  CFStringRef v5 = CFURLCopyHostName(v4);
  CFStringRef v6 = CFURLCopyScheme(v4);
  unint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)objc_super buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "PAC FindProxyForURL failed. Invalid target URL host=%p, scheme=%p",  buf,  0x16u);
    }

    CFErrorRef v9 = CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 305LL, 0LL);
    CFIndex v10 = (std::__shared_weak_count *)operator new(0x20uLL);
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E50;
    v10->__shared_owners_ = 0LL;
    v10->__shared_weak_owners_ = 0LL;
    v10[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
    CFErrorRef v75 = v9;
    CFErrorRef v76 = v10;
    goto LABEL_78;
  }

  string = v5;
  int v11 = CFNetworkDiagnosticLevel();
  if (v11 >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)objc_super buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Calling FindProxyForURL (Target URL: %{public}@, Target Hostname: %{public}@)",  buf,  0x16u);
  }

  unint64_t v12 = *a1;
  uint64_t v14 = (*a2)[4];
  uint64_t v13 = (*a2)[5];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)objc_super buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC calling FindProxyForURL for id %@ token %p",  buf,  0x16u);
  }

  *(void *)objc_super buf = v13;
  *(void *)&buf[8] = v14;
  if (v12) {
    GlobalObject = JSContextGetGlobalObject(v12);
  }
  else {
    GlobalObject = 0LL;
  }
  uint64_t v16 = JSStringCreateWithCFString(@"__dnsResolve");
  Property = JSObjectGetProperty(v12, GlobalObject, v16, 0LL);
  JSStringRelease(v16);
  if (!Property)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    LOWORD(arguments[0]) = 0;
    CFDictionaryRef v28 = "Failed to find dnsResolve function";
LABEL_37:
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  v28,  (uint8_t *)arguments,  2u);
    goto LABEL_38;
  }

  if (!JSValueIsObject(v12, Property))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_38;
    }
    LOWORD(arguments[0]) = 0;
    CFDictionaryRef v28 = "dnsResolve is not an object";
    goto LABEL_37;
  }

  if (!JSObjectSetPrivate(Property, buf))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(arguments[0]) = 0;
      CFDictionaryRef v28 = "Failed to set the private context on dnsResolve object";
      goto LABEL_37;
    }

LABEL_78:
    uint64_t v49 = (*a2)[4];
    uint64_t v48 = (*a2)[5];
    unint64_t v73 = 0LL;
    CFStringRef v74 = 0LL;
    CFErrorRef v71 = v9;
    CFStringRef v72 = v10;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v51 = __ldxr(p_shared_owners);
    while (__stxr(v51 + 1, p_shared_owners));
    unint64_t v31 = 0LL;
    Mutable = 0LL;
    goto LABEL_81;
  }

  CFStringRef v18 = JSStringCreateWithCFString(@"__Apple_FindProxyForURL");
  if (GlobalObject) {
    GlobalObject = JSObjectGetProperty(v12, GlobalObject, v18, 0LL);
  }
  JSStringRelease(v18);
  BOOL IsFunction = JSObjectIsFunction(v12, GlobalObject);
  if (GlobalObject) {
    BOOL v20 = IsFunction;
  }
  else {
    BOOL v20 = 0;
  }
  if (!v20) {
    goto LABEL_44;
  }
  CFStringRef v21 = CFURLCopyAbsoluteURL(v4);
  int v22 = CFURLGetString(v21);
  CFComparisonResult v23 = JSStringCreateWithCFString(v22);
  arguments[0] = JSValueMakeString(v12, v23);
  unint64_t v24 = JSStringCreateWithCFString(string);
  arguments[1] = JSValueMakeString(v12, v24);
  if (v21) {
    CFRelease(v21);
  }
  CFStringRef v25 = JSObjectCallAsFunction(v12, GlobalObject, 0LL, 2uLL, arguments, 0LL);
  JSStringRelease(v23);
  JSStringRelease(v24);
  if (v25 && JSValueIsString(v12, v25))
  {
    CFIndex v26 = JSValueToStringCopy(v12, v25, 0LL);
    CFNumberRef v27 = JSStringCopyCFString(0LL, v26);
    JSStringRelease(v26);
  }

  else
  {
LABEL_44:
    CFNumberRef v27 = 0LL;
  }

  if (!JSObjectSetPrivate(Property, 0LL) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(arguments[0]) = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to clear the private context on dnsResolve object",  (uint8_t *)arguments,  2u);
  }

  CFStringRef v5 = string;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(arguments[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC returning from FindProxyForURL",  (uint8_t *)arguments,  2u);
  }

  if (!v27) {
    goto LABEL_38;
  }
  theString1 = v7;
  cf = v27;
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  unint64_t v31 = (std::__shared_weak_count *)operator new(0x20uLL);
  v31->__shared_owners_ = 0LL;
  uint64_t v32 = (unint64_t *)&v31->__shared_owners_;
  v31->__vftable = (std::__shared_weak_count_vtbl *)&off_100014E18;
  v31->__shared_weak_owners_ = 0LL;
  v31[1].__vftable = (std::__shared_weak_count_vtbl *)Mutable;
  uint64_t v77 = Mutable;
  CFErrorRef v78 = v31;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v27, @";");
  CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
  CFComparisonResult v66 = CFStringCompare(theString1, @"ftp", 1uLL);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; Count != i; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, i);
      CFStringEncoding v37 = ValueAtIndex;
      if (!ValueAtIndex) {
        continue;
      }
      CFIndex Length = CFStringGetLength(ValueAtIndex);
      MutableCopy = CFStringCreateMutableCopy(0LL, Length, v37);
      double v40 = MutableCopy;
      if (!MutableCopy) {
        continue;
      }
      CFStringTrimWhitespace(MutableCopy);
      CFIndex v41 = CFStringGetLength(v40);
      if (v41 < 6)
      {
        if (v41 != 5) {
          goto LABEL_68;
        }
      }

      else
      {
        v83.CFIndex location = 0LL;
        v83.length = 6LL;
        if (CFStringFindWithOptions(v40, @"DIRECT", v83, 1uLL, 0LL))
        {
          CFArrayAppendValue(Mutable, &off_1000157F0);
          goto LABEL_68;
        }
      }

      v84.CFIndex location = 0LL;
      v84.length = 5LL;
      if (CFStringFindWithOptions(v40, @"PROXY", v84, 1uLL, (CFRange *)buf))
      {
        unint64_t v42 = CFGetAllocator(Mutable);
        CFDictionaryRef v43 = sub_10000B488(v42, v40, theString1);
        if (v43 && v66 == kCFCompareEqualTo)
        {
          unint64_t v44 = CFGetAllocator(Mutable);
          CFDictionaryRef v45 = sub_10000B488(v44, v40, @"http");
          if (v45)
          {
            CFArrayAppendValue(Mutable, v45);
            CFRelease(v45);
          }

LABEL_67:
          CFArrayAppendValue(Mutable, v43);
          CFRelease(v43);
          goto LABEL_68;
        }
      }

      else
      {
        v85.CFIndex location = 0LL;
        v85.length = 5LL;
        if (!CFStringFindWithOptions(v40, @"SOCKS", v85, 1uLL, (CFRange *)buf)) {
          goto LABEL_68;
        }
        unint64_t v46 = CFGetAllocator(Mutable);
        CFDictionaryRef v43 = sub_10000B488(v46, v40, @"socks5");
      }

      if (v43) {
        goto LABEL_67;
      }
LABEL_68:
      CFRelease(v40);
    }
  }

  if (ArrayBySeparatingStrings) {
    CFRelease(ArrayBySeparatingStrings);
  }
  unint64_t v7 = theString1;
  if ((int)CFNetworkDiagnosticLevel() >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)*a2 + 88)) {
      uint64_t v47 = **a2;
    }
    else {
      uint64_t v47 = 0LL;
    }
    *(_DWORD *)objc_super buf = 138543874;
    *(void *)&uint8_t buf[4] = v47;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    __int16 v80 = 2114;
    CFErrorRef v81 = Mutable;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC: Execution Complete (PAC URL: %{public}@, Target URL: %{public}@, Result: %{public}@)",  buf,  0x20u);
  }

  CFRelease(cf);
  uint64_t v49 = (*a2)[4];
  uint64_t v48 = (*a2)[5];
  unint64_t v73 = Mutable;
  CFStringRef v74 = v31;
  do
    unint64_t v64 = __ldxr(v32);
  while (__stxr(v64 + 1, v32));
  CFErrorRef v71 = 0LL;
  CFStringRef v72 = 0LL;
  CFStringRef v5 = string;
LABEL_81:
  sub_10000C2CC(*a3, v48, v49, (uint64_t)Mutable, v31, (uint64_t *)&v71);
  unint64_t v52 = v72;
  if (v72)
  {
    uint64_t v53 = (unint64_t *)&v72->__shared_owners_;
    do
      unint64_t v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }

  __int128 v55 = v74;
  if (v74)
  {
    __int128 v56 = (unint64_t *)&v74->__shared_owners_;
    do
      unint64_t v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }

  if (v7) {
    CFRelease(v7);
  }
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v58 = v76;
  if (v76)
  {
    unint64_t v59 = (unint64_t *)&v76->__shared_owners_;
    do
      unint64_t v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }

  unint64_t v61 = v78;
  if (v78)
  {
    uint64_t v62 = (unint64_t *)&v78->__shared_owners_;
    do
      unint64_t v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }

void sub_10000C22C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, uint64_t a10, CFTypeRef a11, CFTypeRef a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20, char a21)
{
  if (a12) {
    CFRelease(a12);
  }
  sub_100005C98((uint64_t)&a19);
  sub_100005C98((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_10000C2CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__shared_weak_count *a5, uint64_t *a6)
{
  if (a1)
  {
    v16[2] = a4;
    uint64_t v17 = a5;
    if (a5)
    {
      p_shared_owners = (unint64_t *)&a5->__shared_owners_;
      do
        unint64_t v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }

    BOOL v8 = (std::__shared_weak_count *)a6[1];
    v16[0] = *a6;
    v16[1] = (uint64_t)v8;
    if (v8)
    {
      CFErrorRef v9 = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    sub_100005F90(a1, a2, a3, a4, a5, v16);
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

    uint64_t v13 = v17;
    if (v17)
    {
      uint64_t v14 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

void sub_10000C3AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_10000C3CC(std::__shared_weak_count *a1)
{
}

void sub_10000C3E0(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_10000C3F8(void *a1)
{
  uint64_t v1 = (void *)sub_10000CE38(a1);
  operator delete(v1);
}

uint64_t sub_10000C40C(uint64_t a1)
{
  uint64_t v2 = CFHostCreateWithName(kCFAllocatorDefault, (CFStringRef)qword_1000188F8);
  if (v2)
  {
    uint64_t v3 = v2;
    CFStreamCreatePairWithSocketToCFHost( kCFAllocatorDefault,  v2,  dword_1000188F0,  (CFReadStreamRef *)(a1 + 80),  (CFWriteStreamRef *)(a1 + 72));
    if (!*(void *)(a1 + 80) || !*(void *)(a1 + 72)) {
      *(_BYTE *)(a1 + 48) = 0;
    }
    CFRelease(v3);
  }

  else if (a1)
  {
    *(_BYTE *)(a1 + 48) = 0;
  }

  if (!*(_BYTE *)(a1 + 48)) {
    return sub_10000EDD4((void *)a1);
  }
  clientContext.version = 0LL;
  clientContext.info = (void *)a1;
  memset(&clientContext.retain, 0, 24);
  unint64_t v4 = *(__CFWriteStream **)(a1 + 72);
  if (!v4 || !CFWriteStreamSetClient(v4, 0x1CuLL, (CFWriteStreamClientCallBack)sub_10000C55C, &clientContext)) {
    goto LABEL_17;
  }
  CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 8));
  uint64_t result = CFWriteStreamOpen(*(CFWriteStreamRef *)(a1 + 72));
  if (!(_DWORD)result)
  {
    CFStringRef v6 = CFWriteStreamCopyError(*(CFWriteStreamRef *)(a1 + 72));
    sub_10000EA38(v6);
    if (v6) {
      CFRelease(v6);
    }
    CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a1 + 72), 0LL);
LABEL_17:
    *(_BYTE *)(a1 + 48) = 0;
    return sub_10000EDD4((void *)a1);
  }

  if (!*(_BYTE *)(a1 + 48)) {
    return sub_10000EDD4((void *)a1);
  }
  return result;
}

uint64_t sub_10000C53C()
{
  return 1LL;
}

const char *sub_10000C544()
{
  return "HTTPPipelining";
}

CFStringRef sub_10000C550()
{
  return @"PipelineQuery";
}

void sub_10000C55C(CFWriteStreamRef stream, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    CFWriteStreamSetDispatchQueue(stream, 0LL);
    CFWriteStreamClose(stream);
    return;
  }

  if (!*(_BYTE *)(a3 + 48)) {
    goto LABEL_25;
  }
  if (a2 == 16) {
    goto LABEL_9;
  }
  if (a2 == 8)
  {
    unint64_t v10 = CFWriteStreamCopyError(stream);
    sub_10000EA38(v10);
    if (v10) {
      CFRelease(v10);
    }
    *(_BYTE *)(a3 + 48) = 0;
    goto LABEL_25;
  }

  if (a2 != 4) {
    return;
  }
  CFIndex v5 = CFWriteStreamWrite(stream, (const UInt8 *)qword_1000188E8, qword_100018900);
  if (v5 == -1)
  {
    int v11 = CFWriteStreamCopyError(stream);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v11)
      {
        CFErrorDomain Domain = CFErrorGetDomain(v11);
        CFIndex Code = CFErrorGetCode(v11);
      }

      else
      {
        CFIndex Code = -1LL;
        CFErrorDomain Domain = @"NULL ERROR";
      }

      LODWORD(v15.version) = 138412546;
      *(CFIndex *)((char *)&v15.version + 4) = (CFIndex)Domain;
      WORD2(v15.info) = 2048;
      *(void **)((char *)&v15.info + 6) = (void *)Code;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to write after kCFStreamEventCanAcceptBytes <%@, %ld>",  (uint8_t *)&v15,  0x16u);
      if (!v11)
      {
LABEL_24:
        if (*(_BYTE *)(a3 + 48)) {
          return;
        }
LABEL_25:
        CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a3 + 72), 0LL);
        CFWriteStreamClose(*(CFWriteStreamRef *)(a3 + 72));
        sub_10000EDD4((void *)a3);
        return;
      }
    }

    else if (!v11)
    {
      goto LABEL_24;
    }

LABEL_23:
    CFRelease(v11);
    goto LABEL_24;
  }

  size_t v6 = qword_100018900 - v5;
  if (qword_100018900 != v5)
  {
    qword_100018900 -= v5;
    memmove((void *)qword_1000188E8, (const void *)(qword_1000188E8 + v5), v6);
    int v11 = CFWriteStreamCopyError(stream);
    sub_10000EA38(v11);
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  if (!*(_BYTE *)(a3 + 48)) {
    goto LABEL_25;
  }
LABEL_9:
  CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a3 + 72), 0LL);
  CFWriteStreamClose(*(CFWriteStreamRef *)(a3 + 72));
  uint64_t v7 = *(void *)(a3 + 96);
  *(void *)(a3 + 88) = malloc(8 * v7);
  if (v7 >= 1)
  {
    uint64_t v8 = 0LL;
    do
      *(void *)(*(void *)(a3 + 88) + 8 * v8++) = CFHTTPMessageCreateEmpty(kCFAllocatorDefault, 0);
    while (*(void *)(a3 + 96) > v8);
  }

  v15.version = 0LL;
  v15.info = (void *)a3;
  memset(&v15.retain, 0, 24);
  CFErrorRef v9 = *(__CFReadStream **)(a3 + 80);
  if (v9 && CFReadStreamSetClient(v9, 0x1AuLL, (CFReadStreamClientCallBack)sub_10000C86C, &v15))
  {
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 80), *(dispatch_queue_t *)(a3 + 8));
    if (CFReadStreamOpen(*(CFReadStreamRef *)(a3 + 80)))
    {
      if (*(_BYTE *)(a3 + 48)) {
        return;
      }
      goto LABEL_32;
    }

    unint64_t v12 = CFReadStreamCopyError(*(CFReadStreamRef *)(a3 + 80));
    sub_10000EA38(v12);
    if (v12) {
      CFRelease(v12);
    }
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 80), 0LL);
  }

  *(_BYTE *)(a3 + 48) = 0;
LABEL_32:
  sub_10000EDD4((void *)a3);
}

void sub_10000C850(_Unwind_Exception *a1)
{
}

void sub_10000C86C(__CFReadStream *a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    CFReadStreamSetDispatchQueue(a1, 0LL);
    CFReadStreamClose(a1);
    return;
  }

  if (!*(_BYTE *)(a3 + 48))
  {
    sub_10000CA18(a3);
LABEL_18:
    sub_10000EDD4((void *)a3);
    return;
  }

  if (a2 == 16) {
    goto LABEL_16;
  }
  if (a2 == 8)
  {
    uint64_t v7 = CFReadStreamCopyError(a1);
    sub_10000EA38(v7);
    if (v7) {
      CFRelease(v7);
    }
    goto LABEL_16;
  }

  if (a2 != 2) {
    return;
  }
  uint64_t v5 = CFReadStreamRead(a1, buffer, 0x8000LL);
  if (v5 < 1)
  {
LABEL_20:
    BOOL v6 = 0;
    goto LABEL_21;
  }

  if (!CFHTTPMessageAppendBytes( *(CFHTTPMessageRef *)(*(void *)(a3 + 88) + 8LL * *(unsigned int *)(a3 + 104)),  buffer,  v5))
  {
LABEL_15:
    *(_BYTE *)(a3 + 48) = 0;
LABEL_16:
    sub_10000CA18(a3);
LABEL_17:
    sub_10000CCE4(a3);
    goto LABEL_18;
  }

  BOOL v6 = sub_10000CA54(a3);
LABEL_21:
  if (!*(_BYTE *)(a3 + 48) || v6)
  {
    sub_10000CA18(a3);
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

void sub_10000CA18(uint64_t a1)
{
  uint64_t v2 = *(__CFReadStream **)(a1 + 80);
  if (v2)
  {
    CFReadStreamSetDispatchQueue(v2, 0LL);
    CFReadStreamClose(*(CFReadStreamRef *)(a1 + 80));
  }

BOOL sub_10000CA54(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48)) {
    return 0LL;
  }
  uint64_t v2 = CFHTTPMessageCopyHeaderFieldValue( *(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8LL * *(unsigned int *)(a1 + 104)),  @"Content-Length");
  if (v2)
  {
    uint64_t v3 = v2;
    SInt32 IntValue = CFStringGetIntValue(v2);
    *(_DWORD *)(a1 + 108) = IntValue;
    if (IntValue >= 1
      && (uint64_t v5 = CFHTTPMessageCopyBody(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8LL * *(unsigned int *)(a1 + 104)))) != 0LL)
    {
      BOOL v6 = v5;
      if (CFDataGetLength(v5) == *(_DWORD *)(a1 + 108)
        && (uint64_t v7 = (*(_DWORD *)(a1 + 104) + 1), *(_DWORD *)(a1 + 104) = v7, *(void *)(a1 + 96) == v7))
      {
        BOOL v8 = 1LL;
      }

      else
      {
        CFIndex Length = CFDataGetLength(v6);
        CFIndex v10 = *(int *)(a1 + 108);
        if (Length <= v10)
        {
          BOOL v8 = 0LL;
        }

        else
        {
          CFIndex v11 = CFDataGetLength(v6);
          if (v11 <= v10)
          {
            *(_BYTE *)(a1 + 48) = 0;
          }

          else
          {
            size_t v12 = v11;
            if ((v11 < 1 || v11 < *(int *)(a1 + 108))
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)CFStringRef v25 = 0;
              _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Body data to split has length 0. This should never happen.",  v25,  2u);
            }

            uint64_t v13 = (UInt8 *)malloc(v12);
            size_t v14 = *(int *)(a1 + 108);
            CFStreamClientContext v15 = malloc(v14);
            uint64_t v16 = malloc(v12 - v14);
            v26.CFIndex location = 0LL;
            v26.length = v12;
            CFDataGetBytes(v6, v26, v13);
            size_t v17 = *(int *)(a1 + 108);
            memcpy(v15, v13, v17);
            CFStringRef v18 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v15, v17);
            uint64_t v19 = *(void *)(a1 + 88);
            uint64_t v20 = *(unsigned int *)(a1 + 104);
            *(_DWORD *)(a1 + 104) = v20 + 1;
            CFHTTPMessageSetBody(*(CFHTTPMessageRef *)(v19 + 8 * v20), v18);
            uint64_t v21 = *(unsigned int *)(a1 + 104);
            if (*(void *)(a1 + 96) <= v21)
            {
              *(_BYTE *)(a1 + 48) = 0;
            }

            else
            {
              uint64_t v22 = *(int *)(a1 + 108);
              size_t v23 = v12 - v22;
              memcpy(v16, &v13[v22], v23);
              CFHTTPMessageAppendBytes(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * v21), (const UInt8 *)v16, v23);
            }

            if (v16) {
              free(v16);
            }
            if (v15) {
              free(v15);
            }
            if (v13) {
              free(v13);
            }
            if (v18) {
              CFRelease(v18);
            }
          }

          BOOL v8 = sub_10000CA54(a1) != 0;
        }
      }

      CFRelease(v6);
    }

    else
    {
      BOOL v8 = 0LL;
    }

    CFRelease(v3);
  }

  else
  {
    BOOL v8 = 0LL;
    *(_BYTE *)(a1 + 48) = 0;
  }

  return v8;
}

void sub_10000CCE4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    for (uint64_t i = 0LL; *(void *)(a1 + 96) > i; ++i)
    {
      uint64_t v3 = CFHTTPMessageCopyBody(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * i));
      if (!v3) {
        goto LABEL_14;
      }
      unint64_t v4 = v3;
      if (CFDataGetLength(v3) > 213)
      {
        CFRelease(v4);
LABEL_14:
        *(_BYTE *)(a1 + 48) = 0;
        return;
      }

      CFDataGetLength(v4);
      uint64_t v5 = (UInt8 *)&v10 - ((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0LL);
      v11.length = CFDataGetLength(v4);
      v11.CFIndex location = 0LL;
      CFDataGetBytes(v4, v11, v5);
      unint64_t v6 = 0LL;
      while (1)
      {
        CFIndex Length = CFDataGetLength(v4);
        int v8 = v5[v6];
        int v9 = off_100014EB8[i][v6++];
        if (v8 != v9)
        {
          *(_BYTE *)(a1 + 48) = 0;
          break;
        }
      }

      CFRelease(v4);
      if (!*(_BYTE *)(a1 + 48)) {
        return;
      }
    }
  }

uint64_t sub_10000CE38(void *a1)
{
  *a1 = off_100014E88;
  uint64_t v2 = (void *)a1[11];
  if (v2)
  {
    uint64_t v3 = 0LL;
    while (a1[12] > v3)
    {
      unint64_t v4 = (const void *)v2[v3];
      v2[v3] = 0LL;
      if (v4) {
        CFRelease(v4);
      }
      ++v3;
      uint64_t v2 = (void *)a1[11];
      if (!v2) {
        goto LABEL_9;
      }
    }

    free(v2);
    a1[11] = 0LL;
  }

LABEL_9:
  uint64_t v5 = (const void *)a1[10];
  a1[10] = 0LL;
  if (v5) {
    CFRelease(v5);
  }
  unint64_t v6 = (const void *)a1[9];
  a1[9] = 0LL;
  if (v6) {
    CFRelease(v6);
  }
  return sub_10000ED74((uint64_t)a1);
}

void sub_10000CEC8(_Unwind_Exception *a1)
{
}

void sub_10000CEE0(uint64_t a1)
{
  qword_1000188E8 = 0LL;
  uint64_t v26 = a1;
  __chkstk_darwin();
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = CFDataCreate(kCFAllocatorDefault, 0LL, 0LL);
  unint64_t v4 = getenv("CFNETWORKAGENT_PORT");
  if (v4) {
    int v5 = strtol(v4, 0LL, 10);
  }
  else {
    int v5 = 80;
  }
  dword_1000188F0 = v5;
  unint64_t v6 = getenv("CFNETWORKAGENT_HOST");
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = "configuration.apple.com";
  }
  qword_1000188F8 = (uint64_t)CFStringCreateWithCString(kCFAllocatorDefault, v7, 0x600u);
  uint64_t v8 = *(void *)(v26 + 96);
  int v9 = malloc(8 * v8);
  if (v8 >= 1)
  {
    uint64_t v10 = 0LL;
    CFStringRef v25 = kCFHTTPVersion1_1;
    do
    {
      CFRange v11 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"http://%@:%d/configurations/pep/pipeline/pipeline%d.html",  qword_1000188F8,  dword_1000188F0,  v10);
      size_t v12 = CFURLCreateWithString(kCFAllocatorDefault, v11, 0LL);
      Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, @"GET", v12, v25);
      size_t v14 = v3;
      CFHTTPMessageSetBody(Request, v3);
      CFHTTPMessageSetHeaderFieldValue(Request, @"Host", (CFStringRef)qword_1000188F8);
      CFHTTPMessageSetHeaderFieldValue(Request, @"Connection", @"Keep-Alive");
      CFStreamClientContext v15 = CFHTTPMessageCopySerializedMessage(Request);
      qword_100018900 += CFDataGetLength(v15);
      CFIndex Length = CFDataGetLength(v15);
      size_t v17 = (UInt8 *)malloc(Length);
      v9[v10] = v17;
      *(void *)&v2[8 * v10] = CFDataGetLength(v15);
      v27.length = CFDataGetLength(v15);
      v27.CFIndex location = 0LL;
      CFDataGetBytes(v15, v27, v17);
      if (Request) {
        CFRelease(Request);
      }
      if (v12) {
        CFRelease(v12);
      }
      uint64_t v3 = v14;
      if (v11) {
        CFRelease(v11);
      }
      if (v15) {
        CFRelease(v15);
      }
      ++v10;
      uint64_t v8 = *(void *)(v26 + 96);
    }

    while (v8 > v10);
  }

  CFStringRef v18 = (char *)malloc(qword_100018900);
  qword_1000188E8 = (uint64_t)v18;
  if (v8 >= 1)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0LL;
    int v21 = 0;
    do
    {
      uint64_t v22 = (void *)v9[v20];
      size_t v23 = *(void *)&v2[8 * v20];
      memcpy(&v19[v21], v22, v23);
      if (v22)
      {
        free(v22);
        v9[v20] = 0LL;
        uint64_t v8 = *(void *)(v26 + 96);
      }

      v21 += v23;
      ++v20;
    }

    while (v8 > v20);
  }

  if (v3) {
    CFRelease(v3);
  }
  if (v9) {
    free(v9);
  }
}

void sub_10000D228(dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
}

void sub_10000D234(char *a1)
{
  if (a1)
  {
    sub_10000D234(*(void *)a1);
    sub_10000D234(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }

void sub_10000D27C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    std::string::size_type v14 = *(void *)(a1 + 40);
    CFStreamClientContext v15 = (void *)(a1 + 48);
    LODWORD(__dst.__r_.__value_.__l.__data_) = 134218242;
    *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = v14;
    WORD2(__dst.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&__dst.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received legacy query type=%lld sig=%s",  (uint8_t *)&__dst,  0x16u);
  }

  uint64_t v3 = (char *)(a1 + 48);
  sub_10000EB54(&__dst, a1 + 48, *(void *)(a1 + 40));
  unint64_t v4 = (void **)(v2 + 56);
  int v5 = (char **)sub_10000DB64(v2 + 56, &__dst);
  if ((char **)(v2 + 64) != v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)objc_super buf = 136315394;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v57 = 1024;
      int v58 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received <signature=%s> query type=%d> that is already outstanding. Ignoring.",  buf,  0x12u);
    }

    goto LABEL_96;
  }

  uint64_t v8 = v5;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 == 2)
  {
    uint64_t v10 = operator new(0x60uLL);
    sub_100009A88(buf, v3);
    sub_10000EC38((uint64_t)v10, (__int128 *)buf, *(dispatch_object_t *)(v2 + 80));
    void *v10 = off_100014900;
    v10[10] = 0LL;
    v10[11] = 0LL;
    v10[9] = 0LL;
    if (!qword_1000188B8)
    {
      CFRange v11 = getenv("CFNETWORKAGENT_PORT");
      if (v11) {
        uint64_t v12 = strtol(v11, 0LL, 10);
      }
      else {
        uint64_t v12 = 443LL;
      }
      uint64_t v16 = getenv("CFNETWORKAGENT_HOST");
      if (v16) {
        size_t v17 = v16;
      }
      else {
        size_t v17 = "guzzoni.apple.com";
      }
      CFStringRef v18 = CFStringCreateWithCString(kCFAllocatorDefault, v17, 0x600u);
      if (CFEqual(v18, @"127.0.0.1")) {
        byte_1000188C0 = 1;
      }
      uint64_t v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", v12);
      uint64_t v20 = getenv("CFNETWORKAGENT_FALSESTART_RESOURCE");
      if (v20) {
        int v21 = v20;
      }
      else {
        int v21 = "/salt";
      }
      uint64_t v22 = CFStringCreateWithCString(kCFAllocatorDefault, v21, 0x600u);
      CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
      CFStringAppend(Mutable, @"https://");
      CFStringAppend(Mutable, v18);
      CFStringAppend(Mutable, @":");
      CFStringAppend(Mutable, v19);
      CFStringAppend(Mutable, v22);
      uint64_t v24 = CFURLCreateWithString(kCFAllocatorDefault, Mutable, 0LL);
      qword_1000188B8 = (uint64_t)CFHTTPMessageCreateRequest(kCFAllocatorDefault, @"HEAD", v24, kCFHTTPVersion1_1);
      if (v24) {
        CFRelease(v24);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v22) {
        CFRelease(v22);
      }
      if (v19) {
        CFRelease(v19);
      }
      if (v18) {
        CFRelease(v18);
      }
    }
  }

  else
  {
    if (v9 != 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 72);
        *(_DWORD *)objc_super buf = 136315394;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v57 = 1024;
        int v58 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create query for <signature=%s, query type=%d>. Ignoring.",  buf,  0x12u);
      }

      goto LABEL_96;
    }

    uint64_t v10 = operator new(0x70uLL);
    sub_100009A88(buf, v3);
    sub_10000EC38((uint64_t)v10, (__int128 *)buf, *(dispatch_object_t *)(v2 + 80));
    void *v10 = off_100014E88;
    v10[9] = 0LL;
    v10[10] = 0LL;
    v10[11] = 0LL;
    v10[12] = 4LL;
    v10[13] = 0xFFFFFFFF00000000LL;
    if (!qword_1000188E8) {
      sub_10000CEE0((uint64_t)v10);
    }
  }

  if (v59 < 0) {
    operator delete(*(void **)buf);
  }
  CFStringRef v25 = *v8;
  if (*v8)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v26 = (char **)v25;
        CFRange v27 = v25 + 32;
        if (!sub_10000E4C4(&__dst, (void *)v25 + 4)) {
          break;
        }
        CFStringRef v25 = *v26;
        CFDictionaryRef v28 = v26;
        if (!*v26) {
          goto LABEL_50;
        }
      }

      if (!sub_10000E4C4(v27, &__dst)) {
        break;
      }
      CFDictionaryRef v28 = v26 + 1;
      CFStringRef v25 = v26[1];
      if (!v25) {
        goto LABEL_50;
      }
    }
  }

  else
  {
    uint64_t v26 = v8;
    CFDictionaryRef v28 = v8;
LABEL_50:
    uint64_t v29 = (char *)operator new(0x38uLL);
    CFIndex v30 = v29 + 32;
    if ((char)__dst.__r_.__value_.__s.__size_ < 0)
    {
      sub_100009910(v30, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }

    else
    {
      *(_OWORD *)CFIndex v30 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
      *((void *)v29 + 6) = __dst.__r_.__value_.__l.__cap_;
    }

    *(void *)uint64_t v29 = 0LL;
    *((void *)v29 + 1) = 0LL;
    *((void *)v29 + 2) = v26;
    const char *v28 = v29;
    unint64_t v31 = (void *)**v4;
    if (v31)
    {
      char *v4 = v31;
      uint64_t v29 = *v28;
    }

    uint64_t v32 = *v8;
    BOOL v33 = v29 == *v8;
    v29[24] = v33;
    if (!v33)
    {
      do
      {
        uint64_t v34 = *((void *)v29 + 2);
        if (*(_BYTE *)(v34 + 24)) {
          break;
        }
        CFRange v35 = *(char **)(v34 + 16);
        uint64_t v36 = *(void *)v35;
        if (*(void *)v35 == v34)
        {
          uint64_t v39 = *((void *)v35 + 1);
          if (!v39 || (v40 = *(unsigned __int8 *)(v39 + 24), CFStringEncoding v37 = (_BYTE *)(v39 + 24), v40))
          {
            if (*(char **)v34 == v29)
            {
              CFIndex v41 = (uint64_t *)*((void *)v29 + 2);
            }

            else
            {
              CFIndex v41 = *(uint64_t **)(v34 + 8);
              uint64_t v42 = *v41;
              *(void *)(v34 + 8) = *v41;
              if (v42)
              {
                *(void *)(v42 + 16) = v34;
                CFRange v35 = *(char **)(v34 + 16);
              }

              v41[2] = (uint64_t)v35;
              *(void *)(*(void *)(v34 + 16) + 8LL * (**(void **)(v34 + 16) != v34)) = v41;
              *CFIndex v41 = v34;
              *(void *)(v34 + 16) = v41;
              CFRange v35 = (char *)v41[2];
              uint64_t v34 = *(void *)v35;
            }

            *((_BYTE *)v41 + 24) = 1;
            v35[24] = 0;
            uint64_t v45 = *(void *)(v34 + 8);
            *(void *)CFRange v35 = v45;
            if (v45) {
              *(void *)(v45 + 16) = v35;
            }
            *(void *)(v34 + 16) = *((void *)v35 + 2);
            *(void *)(*((void *)v35 + 2) + 8LL * (**((void **)v35 + 2) != (void)v35)) = v34;
            *(void *)(v34 + 8) = v35;
            goto LABEL_81;
          }
        }

        else if (!v36 || (v38 = *(unsigned __int8 *)(v36 + 24), CFStringEncoding v37 = (_BYTE *)(v36 + 24), v38))
        {
          if (*(char **)v34 == v29)
          {
            uint64_t v43 = *((void *)v29 + 1);
            *(void *)uint64_t v34 = v43;
            if (v43)
            {
              *(void *)(v43 + 16) = v34;
              CFRange v35 = *(char **)(v34 + 16);
            }

            *((void *)v29 + 2) = v35;
            *(void *)(*(void *)(v34 + 16) + 8LL * (**(void **)(v34 + 16) != v34)) = v29;
            *((void *)v29 + 1) = v34;
            *(void *)(v34 + 16) = v29;
            CFRange v35 = (char *)*((void *)v29 + 2);
          }

          else
          {
            uint64_t v29 = (char *)*((void *)v29 + 2);
          }

          v29[24] = 1;
          v35[24] = 0;
          uint64_t v34 = *((void *)v35 + 1);
          unint64_t v44 = *(char **)v34;
          *((void *)v35 + 1) = *(void *)v34;
          if (v44) {
            *((void *)v44 + 2) = v35;
          }
          *(void *)(v34 + 16) = *((void *)v35 + 2);
          *(void *)(*((void *)v35 + 2) + 8LL * (**((void **)v35 + 2) != (void)v35)) = v34;
          *(void *)uint64_t v34 = v35;
LABEL_81:
          *((void *)v35 + 2) = v34;
          break;
        }

        *(_BYTE *)(v34 + 24) = 1;
        uint64_t v29 = v35;
        v35[24] = v35 == v32;
        *CFStringEncoding v37 = 1;
      }

      while (v35 != v32);
    }

    ++*(void *)(v2 + 72);
  }

  sub_10000DBDC(v2, (uint64_t)v10, 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)objc_super buf = 134217984;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Starting Probe for Query<%p>",  buf,  0xCu);
  }

  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472LL;
  aBlock[2] = sub_10000DF84;
  aBlock[3] = &unk_100014ED8;
  aBlock[4] = v2;
  unint64_t v46 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v46->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))sub_10000E404;
  v46->__on_zero_shared = 0LL;
  v46->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(aBlock);
  uint64_t v47 = (std::__shared_weak_count *)operator new(0x20uLL);
  uint64_t v48 = v47;
  v47->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v47->__shared_owners_;
  v47->__vftable = (std::__shared_weak_count_vtbl *)&off_100014F38;
  v47->__shared_weak_owners_ = 0LL;
  v47[1].__vftable = v46;
  do
    unint64_t v50 = __ldxr(p_shared_owners);
  while (__stxr(v50 + 1, p_shared_owners));
  unint64_t v51 = (std::__shared_weak_count *)v10[8];
  v10[7] = v46;
  v10[8] = v47;
  if (v51)
  {
    unint64_t v52 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }

  do
    unint64_t v54 = __ldaxr(p_shared_owners);
  while (__stlxr(v54 - 1, p_shared_owners));
  if (!v54)
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
  }

  (*(void (**)(void *))(*v10 + 16LL))(v10);
LABEL_96:
}

void sub_10000DA88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  operator delete(v27);
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(a1);
}

void *sub_10000DB20(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)(a1 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 48);
  result[2] = *(void *)(a2 + 64);
  *(_OWORD *)uint64_t result = v3;
  return result;
}

void sub_10000DB50(uint64_t a1)
{
}

void *sub_10000DB64(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  __int128 v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  int v5 = (void *)(a1 + 8);
  do
  {
    BOOL v6 = sub_10000E4C4(v3 + 4, a2);
    uint64_t v7 = v3 + 1;
    if (!v6)
    {
      uint64_t v7 = v3;
      int v5 = v3;
    }

    __int128 v3 = (void *)*v7;
  }

  while (*v7);
  if (v5 == v2 || sub_10000E4C4(a2, v5 + 4)) {
    return v2;
  }
  return v5;
}

void sub_10000DBDC(uint64_t a1, uint64_t a2, char a3)
{
  else {
    std::string __dst = *(std::string *)(a1 + 8);
  }
  std::string::append(&__dst, ".");
  BOOL v6 = (const std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 32LL))(a2);
  std::string::append(&__dst, v6);
  std::string::append(&__dst, ":");
  if (*(char *)(a2 + 47) < 0)
  {
    sub_100009910(__p, *(void **)(a2 + 24), *(void *)(a2 + 32));
  }

  else
  {
    *(_OWORD *)__int128 __p = *(_OWORD *)(a2 + 24);
    *(void *)&__p[16] = *(void *)(a2 + 40);
  }

  if (__p[23] >= 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = *(const std::string::value_type **)__p;
  }
  if (__p[23] >= 0) {
    std::string::size_type v8 = __p[23];
  }
  else {
    std::string::size_type v8 = *(void *)&__p[8];
  }
  std::string::append(&__dst, v7, v8);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef v10 = CFStringCreateWithFormat(0LL, 0LL, @"%f", *(void *)&Current);
  CFMutableStringRef Mutable = CFArrayCreateMutable(0LL, 2LL, &kCFTypeArrayCallBacks);
  uint64_t v12 = Mutable;
  if ((a3 & 1) != 0)
  {
    uint64_t v13 = @"PENDING";
  }

  else if (*(_BYTE *)(a2 + 48))
  {
    uint64_t v13 = @"TRUE";
  }

  else
  {
    uint64_t v13 = @"FALSE";
  }

  CFArrayAppendValue(Mutable, v13);
  CFArrayAppendValue(v12, v10);
  if ((__dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  CFStringRef v15 = CFStringCreateWithCString(0LL, (const char *)p_dst, 0x8000100u);
  if (SCDynamicStoreSetValue(*(SCDynamicStoreRef *)a1, v15, v12))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2);
      *(_DWORD *)__int128 __p = 134218498;
      *(void *)&__p[4] = v16;
      *(_WORD *)&__p[12] = 2112;
      *(void *)&__p[14] = v15;
      *(_WORD *)&__p[22] = 2112;
      uint64_t v20 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Added key-value pair to SCDynamicStore <QueryType=%lld>: <Key=%@, Value=%@>",  __p,  0x20u);
      if (!v15) {
        goto LABEL_30;
      }
LABEL_29:
      CFRelease(v15);
      goto LABEL_30;
    }

void sub_10000DEE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (v25)
  {
    CFRelease(v25);
    if (!v24)
    {
LABEL_3:
      if (!v23)
      {
LABEL_8:
        if (a16 < 0) {
          operator delete(__p);
        }
        _Unwind_Resume(exception_object);
      }

LABEL_7:
      CFRelease(v23);
      goto LABEL_8;
    }
  }

  else if (!v24)
  {
    goto LABEL_3;
  }

  CFRelease(v24);
  if (!v23) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_10000DF84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  sub_10000DBDC(v3, a2, 0);
  unint64_t v4 = (uint64_t **)(v3 + 56);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24LL))(a2);
  sub_10000EB54(&__p, a2 + 24, v5);
  BOOL v6 = sub_10000DB64(v3 + 56, &__p);
  uint64_t v7 = v6;
  std::string::size_type v8 = (uint64_t *)v6[1];
  if (v8)
  {
    do
    {
      uint64_t v9 = v8;
      std::string::size_type v8 = (uint64_t *)*v8;
    }

    while (v8);
  }

  else
  {
    CFStringRef v10 = v6;
    do
    {
      uint64_t v9 = (uint64_t *)v10[2];
      BOOL v31 = *v9 == (void)v10;
      CFStringRef v10 = v9;
    }

    while (!v31);
  }

  if (*v4 == v6) {
    char *v4 = v9;
  }
  CFRange v11 = *(uint64_t **)(v3 + 64);
  --*(void *)(v3 + 72);
  uint64_t v12 = *v6;
  if (*v6)
  {
    uint64_t v13 = (uint64_t *)v6[1];
    if (!v13)
    {
      std::string::size_type v14 = v6;
      goto LABEL_18;
    }

    do
    {
      std::string::size_type v14 = v13;
      uint64_t v13 = (uint64_t *)*v13;
    }

    while (v13);
  }

  else
  {
    std::string::size_type v14 = v6;
  }

  uint64_t v12 = v14[1];
  if (v12)
  {
LABEL_18:
    int v15 = 0;
    *(void *)(v12 + 16) = v14[2];
    goto LABEL_19;
  }

  int v15 = 1;
LABEL_19:
  uint64_t v16 = (uint64_t **)v14[2];
  uint64_t v17 = *v16;
  if (*v16 == v14)
  {
    *uint64_t v16 = (uint64_t *)v12;
    if (v14 == v11)
    {
      uint64_t v17 = 0LL;
      CFRange v11 = (uint64_t *)v12;
    }

    else
    {
      uint64_t v17 = v16[1];
    }
  }

  else
  {
    v16[1] = (uint64_t *)v12;
  }

  int v18 = *((unsigned __int8 *)v14 + 24);
  if (v14 != v6)
  {
    uint64_t v19 = v6[2];
    void v14[2] = v19;
    *(void *)(v19 + 8LL * (*(void *)v6[2] != (void)v6)) = v14;
    uint64_t v20 = *v6;
    uint64_t *v14 = *v6;
    *(void *)(v20 + 16) = v14;
    uint64_t v21 = v6[1];
    v14[1] = v21;
    if (v21) {
      *(void *)(v21 + 16) = v14;
    }
    *((_BYTE *)v14 + 24) = *((_BYTE *)v6 + 24);
    if (v11 == v6) {
      CFRange v11 = v14;
    }
  }

  if (!v18 || !v11) {
    goto LABEL_83;
  }
  if (!v15)
  {
    *(_BYTE *)(v12 + 24) = 1;
    goto LABEL_83;
  }

  while (1)
  {
    uint64_t v22 = v17[2];
    if (!*((_BYTE *)v17 + 24))
    {
      *((_BYTE *)v17 + 24) = 1;
      *(_BYTE *)(v22 + 24) = 0;
      uint64_t v28 = v17[1];
      *(void *)uint64_t v22 = v28;
      if (v28) {
        *(void *)(v28 + 16) = v22;
      }
      uint64_t v17[2] = *(void *)(v22 + 16);
      *(void *)(*(void *)(v22 + 16) + 8LL * (**(void **)(v22 + 16) != v22)) = v17;
      v17[1] = v22;
      *(void *)(v22 + 16) = v17;
      uint64_t v17 = *(uint64_t **)v22;
    }

    uint64_t v29 = (void *)*v17;
    if (*v17 && !*((_BYTE *)v29 + 24)) {
      goto LABEL_78;
    }
    CFIndex v30 = (uint64_t *)v17[1];
    if (v30 && !*((_BYTE *)v30 + 24))
    {
      if (v29 && !*((_BYTE *)v29 + 24))
      {
LABEL_78:
        CFIndex v30 = v17;
      }

      else
      {
        *((_BYTE *)v30 + 24) = 1;
        *((_BYTE *)v17 + 24) = 0;
        uint64_t v36 = *v30;
        v17[1] = *v30;
        if (v36) {
          *(void *)(v36 + 16) = v17;
        }
        v30[2] = v17[2];
        *(void *)(v17[2] + 8LL * (*(void *)v17[2] != (void)v17)) = v30;
        *CFIndex v30 = (uint64_t)v17;
        uint64_t v17[2] = (uint64_t)v30;
        uint64_t v29 = v17;
      }

      uint64_t v33 = v30[2];
      *((_BYTE *)v30 + 24) = *(_BYTE *)(v33 + 24);
      *(_BYTE *)(v33 + 24) = 1;
      *((_BYTE *)v29 + 24) = 1;
      uint64_t v34 = *(uint64_t **)v33;
      uint64_t v37 = *(void *)(*(void *)v33 + 8LL);
      *(void *)uint64_t v33 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v33;
      }
      v34[2] = *(void *)(v33 + 16);
      *(void *)(*(void *)(v33 + 16) + 8LL * (**(void **)(v33 + 16) != v33)) = v34;
      v34[1] = v33;
      goto LABEL_82;
    }

    *((_BYTE *)v17 + 24) = 0;
    CFRange v27 = (uint64_t *)v17[2];
    if (*((_BYTE *)v27 + 24)) {
      BOOL v31 = v27 == v11;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_63;
    }
LABEL_60:
    uint64_t v17 = *(uint64_t **)(v27[2] + 8LL * (*(void *)v27[2] == (void)v27));
  }

  if (!*((_BYTE *)v17 + 24))
  {
    *((_BYTE *)v17 + 24) = 1;
    *(_BYTE *)(v22 + 24) = 0;
    size_t v23 = *(uint64_t **)(v22 + 8);
    uint64_t v24 = *v23;
    *(void *)(v22 + 8) = *v23;
    if (v24) {
      *(void *)(v24 + 16) = v22;
    }
    v23[2] = *(void *)(v22 + 16);
    *(void *)(*(void *)(v22 + 16) + 8LL * (**(void **)(v22 + 16) != v22)) = v23;
    uint64_t *v23 = v22;
    *(void *)(v22 + 16) = v23;
    uint64_t v17 = *(uint64_t **)(*v17 + 8);
  }

  CFStringRef v25 = (void *)*v17;
  if (!*v17 || *((_BYTE *)v25 + 24))
  {
    uint64_t v26 = (uint64_t *)v17[1];
    if (v26 && !*((_BYTE *)v26 + 24)) {
      goto LABEL_69;
    }
    *((_BYTE *)v17 + 24) = 0;
    CFRange v27 = (uint64_t *)v17[2];
    if (v27 == v11)
    {
      CFRange v27 = v11;
LABEL_63:
      *((_BYTE *)v27 + 24) = 1;
      goto LABEL_83;
    }

    if (!*((_BYTE *)v27 + 24)) {
      goto LABEL_63;
    }
    goto LABEL_60;
  }

  uint64_t v26 = (uint64_t *)v17[1];
  if (v26 && !*((_BYTE *)v26 + 24))
  {
LABEL_69:
    CFStringRef v25 = v17;
  }

  else
  {
    *((_BYTE *)v25 + 24) = 1;
    *((_BYTE *)v17 + 24) = 0;
    uint64_t v32 = v25[1];
    *uint64_t v17 = v32;
    if (v32) {
      *(void *)(v32 + 16) = v17;
    }
    v25[2] = v17[2];
    *(void *)(v17[2] + 8LL * (*(void *)v17[2] != (void)v17)) = v25;
    v25[1] = v17;
    uint64_t v17[2] = (uint64_t)v25;
    uint64_t v26 = v17;
  }

  uint64_t v33 = v25[2];
  *((_BYTE *)v25 + 24) = *(_BYTE *)(v33 + 24);
  *(_BYTE *)(v33 + 24) = 1;
  *((_BYTE *)v26 + 24) = 1;
  uint64_t v34 = *(uint64_t **)(v33 + 8);
  uint64_t v35 = *v34;
  *(void *)(v33 + 8) = *v34;
  if (v35) {
    *(void *)(v35 + 16) = v33;
  }
  v34[2] = *(void *)(v33 + 16);
  *(void *)(*(void *)(v33 + 16) + 8LL * (**(void **)(v33 + 16) != v33)) = v34;
  uint64_t *v34 = v33;
LABEL_82:
  *(void *)(v33 + 16) = v34;
LABEL_83:
  operator delete(v7);
LABEL_86:
}

uint64_t sub_10000E404(void *a1)
{
  a1[1] = sub_10000E4B8;
  a1[2] = 0LL;
  return (*(uint64_t (**)(void))(*a1 + 16LL))();
}

void sub_10000E420(std::__shared_weak_count *a1)
{
}

void sub_10000E434(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2) {
    BOOL v4 = (*(void *)(v1 + 16) & 1LL | v3) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if ((uint64_t (*)(void *))v3 == sub_10000E404 && v5 != 0)
  {
    uint64_t v7 = (void *)(v1 + (v2 >> 1));
    if ((v2 & 1) != 0) {
      (*(void (**)(void *, void))(*v7 + sub_10000E404))(v7, 0LL);
    }
    else {
      ((void (*)(void *, void))sub_10000E404)(v7, 0LL);
    }
  }

  _Block_release(*(const void **)v1);
  operator delete((void *)v1);
}

uint64_t sub_10000E4B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16LL))();
}

BOOL sub_10000E4C4(void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void sub_10000E52C(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v3 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%f", *(void *)&Current);
  if (v3)
  {
    size_t v4 = v3;
    values = v3;
    CFArrayRef v5 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
    if (!v5)
    {
LABEL_12:
      CFRelease(v4);
      return;
    }

    size_t v6 = (const char *)(a1 + 32);
    int v7 = CFStringCreateWithCString(0LL, v6, 0x8000100u);
    int v8 = SCDynamicStoreSetValue(*(SCDynamicStoreRef *)a1, v7, v5);
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v9)
      {
        *(_DWORD *)objc_super buf = 138412546;
        uint64_t v12 = v7;
        __int16 v13 = 2112;
        std::string::size_type v14 = v4;
        CFStringRef v10 = "Added lastPurgeTime k-v pair to SCDynamicStore <Key=%@, Value=%@>";
        goto LABEL_15;
      }
    }

    else if (v9)
    {
      *(_DWORD *)objc_super buf = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      std::string::size_type v14 = v4;
      CFStringRef v10 = "Failed to add lastPurgeTime k-v pair to SCDynamicStore <Key=%@, Value=%@>";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v10, buf, 0x16u);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (!v7)
    {
LABEL_11:
      CFRelease(v5);
      goto LABEL_12;
    }

void sub_10000E6CC(_Unwind_Exception *a1)
{
  if (v3) {
    CFRelease(v3);
  }
  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_10000E704(SCDynamicStoreRef *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Purging dynamic store",  v20,  2u);
  }

  int v2 = getenv("CFNETWORKAGENT_KEY_SPACE_ROOT");
  if (v2) {
    int v3 = v2;
  }
  else {
    int v3 = "com\\.apple\\.CFNetwork\\.netcompat";
  }
  size_t v4 = (std::string *)sub_100009A88(v20, v3);
  std::string::append(v4, ".*");
  if (v21 >= 0) {
    CFArrayRef v5 = v20;
  }
  else {
    CFArrayRef v5 = *(uint8_t **)v20;
  }
  CFStringRef v6 = CFStringCreateWithCString(0LL, (const char *)v5, 0x8000100u);
  CFMutableStringRef Mutable = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, v6);
  int v8 = SCDynamicStoreCopyMultiple(*a1, 0LL, Mutable);
  BOOL v9 = v8;
  if (v8)
  {
    CFIndex Count = CFDictionaryGetCount(v8);
    if (Count >= 1)
    {
      __chkstk_darwin();
      uint64_t v12 = (const void **)&v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 16];
      CFDictionaryGetKeysAndValues(v9, v12, 0LL);
      *(void *)&__int128 v13 = 138412290LL;
      __int128 v19 = v13;
      while (1)
      {
        int v14 = SCDynamicStoreRemoveValue(*a1, (CFStringRef)*v12);
        BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v14)
        {
          if (v15)
          {
            uint64_t v16 = *v12;
            *(_DWORD *)objc_super buf = v19;
            size_t v23 = v16;
            uint64_t v17 = "Removed %@ from dynamic store:";
LABEL_19:
            _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  v17,  buf,  0xCu);
          }
        }

        else if (v15)
        {
          int v18 = *v12;
          *(_DWORD *)objc_super buf = v19;
          size_t v23 = v18;
          uint64_t v17 = "Did NOT Remove %@ from dynamic store:";
          goto LABEL_19;
        }

        ++v12;
        if (!--Count)
        {
          sub_10000E52C((uint64_t)a1);
          goto LABEL_22;
        }
      }
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Unable to get keys from dynamic store for removal!",  buf,  2u);
  }

LABEL_22:
  if (v9) {
    CFRelease(v9);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v21 < 0) {
    operator delete(*(void **)v20);
  }
}

void sub_10000E9D0(_Unwind_Exception *exception_object)
{
  if (v2) {
    CFRelease(v2);
  }
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000EA38(__CFError *a1)
{
  if (a1)
  {
    int v2 = (char *)malloc(0x80uLL);
    CFErrorDomain Domain = CFErrorGetDomain(a1);
    CFStringGetCString(Domain, v2, 128LL, 0x8000100u);
    size_t v4 = __stderrp;
    CFIndex Code = CFErrorGetCode(a1);
    fprintf(v4, "CFERROR: {Domain:%s, Code:%ld}", v2, Code);
    if (v2) {
      free(v2);
    }
  }

uint64_t sub_10000EAD4(int *a1)
{
  int check = 0;
  uint32_t v2 = notify_check(*a1, &check);
  int v3 = check;
  if (notify_check(a1[1], &check)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = check == 0;
  }
  unsigned int v5 = !v4;
  if (v2) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (v6) {
    return v5;
  }
  else {
    return 1LL;
  }
}

CFStringRef sub_10000EB48()
{
  return @"BaseQuery";
}

void sub_10000EB54(std::string *__dst, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100009910(__dst, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    __dst->__r_.__value_.__l.__cap_ = *(void *)(a2 + 16);
  }

  std::string::append(__dst, "_");
  std::to_string(&v7, a3);
  if ((v7.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unsigned int v5 = &v7;
  }
  else {
    unsigned int v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  if ((v7.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = v7.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = v7.__r_.__value_.__l.__size_;
  }
  std::string::append(__dst, (const std::string::value_type *)v5, size);
}

void sub_10000EC00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000EC38(uint64_t a1, __int128 *a2, dispatch_object_t object)
{
  *(_OWORD *)(a1 + 8) = 0u;
  unsigned int v5 = (uint64_t *)(a1 + 8);
  *(void *)a1 = off_100014F98;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v6 = a1 + 24;
  *(void *)(a1 + 40) = 0LL;
  *(_BYTE *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100009910(&v9, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v9 = *a2;
    uint64_t v10 = *((void *)a2 + 2);
  }

  *(_OWORD *)uint64_t v6 = v9;
  *(void *)(v6 + 16) = v10;
  if (object)
  {
    dispatch_retain(object);
    uint64_t v7 = *v5;
    *unsigned int v5 = (uint64_t)object;
    if (v7) {
      (*(void (**)(void))(a1 + 16))();
    }
    *(void *)(a1 + 16) = sub_10000ED68;
  }

  return a1;
}

void sub_10000ED24(_Unwind_Exception *a1)
{
  uint64_t v6 = *v3;
  *int v3 = 0LL;
  if (v6) {
    (*(void (**)(void))(v1 + 16))();
  }
  *(void *)uint64_t v1 = &off_100014D68;
  _Unwind_Resume(a1);
}

void sub_10000ED68(dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
}

uint64_t sub_10000ED74(uint64_t a1)
{
  *(void *)a1 = off_100014F98;
  sub_100005C98(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0LL;
  if (v2) {
    (*(void (**)(void))(a1 + 16))();
  }
  *(void *)a1 = &off_100014D68;
  return a1;
}

uint64_t sub_10000EDD4(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    int v3 = *(void (**)(void *, void *))(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    unsigned int v5 = (void *)(v2 + (v4 >> 1));
    if ((v4 & 1) != 0) {
      int v3 = *(void (**)(void *, void *))(*v5 + v3);
    }
    v3(v5, a1);
  }

  return (*(uint64_t (**)(void *))(*a1 + 8LL))(a1);
}

JSValueRef sub_10000EE20( const OpaqueJSContext *a1, JSObjectRef object, uint64_t a3, uint64_t a4, JSValueRef *a5)
{
  Private = JSObjectGetPrivate(object);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC performing DNS resolution",  buf,  2u);
  }

  JSValueRef Null = JSValueMakeNull(a1);
  if (a4 == 1 && JSValueIsString(a1, *a5))
  {
    uint64_t v10 = JSValueToStringCopy(a1, *a5, 0LL);
    uint64_t v11 = JSStringCopyCFString(kCFAllocatorDefault, v10);
    uint64_t v12 = v11;
    if (Private)
    {
      __int128 v13 = *(const __CFString **)Private;
      int v14 = (const __CFData *)*((void *)Private + 1);
    }

    else
    {
      int v14 = 0LL;
      __int128 v13 = 0LL;
    }

    uint64_t v51 = 0LL;
    unint64_t v52 = &v51;
    uint64_t v53 = 0x2020000000LL;
    uint64_t v54 = 0LL;
    *(void *)objc_super buf = kCFAllocatorDefault;
    uint64_t v61 = 1023LL;
    if (v11)
    {
      uint64_t v15 = sub_10000A2CC(kCFAllocatorDefault, v11, v63, &v61);
    }

    else
    {
      v63[0] = 0;
      uint64_t v61 = 0LL;
      uint64_t v15 = v63;
    }

    uint64_t v62 = v15;
    host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port(v15, 0LL);
    nw_parameters_t v17 = nw_parameters_create();
    nw_parameters_set_allow_unusable_addresses(v17, 1LL);
    nw_parameters_set_prohibit_encrypted_dns(v17, 1LL);
    if (v13)
    {
      CFAllocatorRef allocator = kCFAllocatorDefault;
      p_CFAllocatorRef allocator = 1023LL;
      ptr = sub_10000A2CC(kCFAllocatorDefault, v13, (UInt8 *)v58, &p_allocator);
      nw_parameters_set_source_application_by_bundle_id(v17);
      if (ptr)
      {
        if (v58 != ptr) {
          CFAllocatorDeallocate(allocator, ptr);
        }
      }
    }

    if (v14)
    {
      BytePtr = CFDataGetBytePtr(v14);
      if (BytePtr)
      {
        __int128 v19 = *((_OWORD *)BytePtr + 1);
        v50[0] = *(_OWORD *)BytePtr;
        v50[1] = v19;
        nw_parameters_set_source_application(v17, v50);
      }
    }

    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(host_with_numeric_port, v17);
    char v21 = (void *)nw_path_evaluator_copy_path();
    CFAllocatorRef allocator = 0LL;
    p_CFAllocatorRef allocator = (uint64_t)&allocator;
    ptr = (void *)0x3812000000LL;
    v58[0] = sub_10000F6CC;
    v58[1] = sub_10000F6DC;
    v58[2] = 0LL;
    char v59 = (void *)nw_resolver_create_with_path();
    uint64_t v43 = 0LL;
    unint64_t v44 = &v43;
    uint64_t v45 = 0x3812000000LL;
    unint64_t v46 = sub_10000F6F4;
    uint64_t v47 = sub_10000F704;
    uint64_t v48 = 0LL;
    dispatch_object_t objecta = dispatch_semaphore_create(0LL);
    uint64_t v36 = 0LL;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3812000000LL;
    uint64_t v39 = sub_10000F71C;
    int v40 = sub_10000F72C;
    uint64_t v41 = 0LL;
    obj = 0LL;
    if (qword_100018918 != -1) {
      dispatch_once(&qword_100018918, &stru_100015008);
    }
    uint64_t v22 = *(void *)(p_allocator + 48);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10000F744;
    v35[3] = &unk_100015030;
    v35[4] = &v36;
    v35[5] = &allocator;
    v35[6] = &v43;
    nw_resolver_set_update_handler(v22, qword_100018920, v35);
    dispatch_semaphore_wait((dispatch_semaphore_t)v44[6], 0xFFFFFFFFFFFFFFFFLL);
    if (v37[6] && ((uint64_t (*)(void))nw_array_get_count)())
    {
      CFIndex count = nw_array_get_count(v37[6]);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
      v52[3] = (uint64_t)Mutable;
      uint64_t v25 = v37[6];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10000F7B0;
      v34[3] = &unk_100015058;
      v34[4] = &v51;
      nw_array_apply(v25, v34);
      CFIndex v26 = CFArrayGetCount((CFArrayRef)v52[3]);
      CFRange v27 = v52;
      if (!v26)
      {
        uint64_t v28 = (const void *)v52[3];
        if (v28)
        {
          CFRelease(v28);
          CFRange v27 = v52;
        }

        v27[3] = 0LL;
      }
    }

    else
    {
      CFRange v27 = v52;
    }

    uint64_t v29 = (const __CFArray *)v27[3];
    _Block_object_dispose(&v36, 8);
    CFIndex v30 = obj;
    obj = 0LL;
    if (v30) {
      nw_release(v30);
    }
    _Block_object_dispose(&v43, 8);
    BOOL v31 = objecta;
    dispatch_object_t objecta = 0LL;
    if (v31) {
      dispatch_release(v31);
    }
    _Block_object_dispose(&allocator, 8);
    uint64_t v32 = v59;
    char v59 = 0LL;
    if (v32) {
      nw_release(v32);
    }
    if (v21) {
      nw_release(v21);
    }
    if (v17) {
      nw_release(v17);
    }
    if (host_with_numeric_port) {
      nw_release(host_with_numeric_port);
    }
    if (v62 && v63 != v62) {
      CFAllocatorDeallocate(*(CFAllocatorRef *)buf, v62);
    }
    _Block_object_dispose(&v51, 8);
    if (v12) {
      CFRelease(v12);
    }
    if (v29)
    {
      JSValueRef Null = sub_10000F5FC(kCFAllocatorDefault, a1, v29);
      CFRelease(v29);
    }

    JSStringRelease(v10);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC returned from DNS resolution",  buf,  2u);
  }

  return Null;
}

void sub_10000F344( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *obj, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, dispatch_object_t object, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42)
{
  if (v43) {
    nw_release(v43);
  }
  if (v42) {
    nw_release(v42);
  }
  uint64_t v45 = (void *)STACK[0x550];
  if (STACK[0x550])
  {
  }

  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

JSValueRef sub_10000F478(const OpaqueJSContext *a1)
{
  JSValueRef Null = JSValueMakeNull(a1);
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(kCFAllocatorDefault, @"JSEvaluator", 0LL, 0LL);
  if (v3)
  {
    uint64_t v4 = v3;
    NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCEntNetIPv4);
    if (!NetworkGlobalEntity) {
      goto LABEL_12;
    }
    uint64_t v6 = NetworkGlobalEntity;
    uint64_t v7 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, NetworkGlobalEntity);
    CFRelease(v6);
    if (!v7) {
      goto LABEL_12;
    }
    Value = (const __CFString *)CFDictionaryGetValue(v7, kSCDynamicStorePropNetPrimaryInterface);
    if (!Value)
    {
      CFRelease(v7);
      goto LABEL_12;
    }

    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  Value,  kSCEntNetIPv4);
    CFRelease(v7);
    if (!NetworkInterfaceEntity)
    {
LABEL_12:
      CFRelease(v4);
      return Null;
    }

    CFPropertyListRef v10 = SCDynamicStoreCopyValue(v4, NetworkInterfaceEntity);
    CFRelease(v4);
    CFRelease(NetworkInterfaceEntity);
    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      if (v11 != CFDictionaryGetTypeID())
      {
        uint64_t v4 = (const __SCDynamicStore *)v10;
        goto LABEL_12;
      }

      uint64_t v4 = (const __SCDynamicStore *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Addresses");
      CFRetain(v4);
      CFRelease(v10);
      if (v4)
      {
        JSValueRef Null = sub_10000F5FC(kCFAllocatorDefault, a1, v4);
        goto LABEL_12;
      }
    }
  }

  return Null;
}

JSValueRef sub_10000F5FC(const __CFAllocator *a1, const OpaqueJSContext *a2, CFArrayRef theArray)
{
  CFStringRef v6 = CFStringCreateByCombiningStrings(a1, theArray, @", ");
  if (CFArrayGetCount(theArray) < 1) {
    uint64_t v7 = (const __CFString *)CFRetain(@"[ ]");
  }
  else {
    uint64_t v7 = CFStringCreateWithFormat(a1, 0LL, @"[ %@ ]", v6);
  }
  int v8 = v7;
  __int128 v9 = JSStringCreateWithCFString(v7);
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  JSValueRef v10 = JSEvaluateScript(a2, v9, 0LL, 0LL, 0, 0LL);
  JSStringRelease(v9);
  return v10;
}

uint64_t sub_10000F6CC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0LL;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F6DC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0LL;
  if (v2) {
    nw_release(v2);
  }
}

uint64_t sub_10000F6F4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0LL;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F704(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 48);
  *(void *)(a1 + 48) = 0LL;
  if (v2) {
    dispatch_release(v2);
  }
}

uint64_t sub_10000F71C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0LL;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F72C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0LL;
  if (v2) {
    nw_release(v2);
  }
}

void *sub_10000F744(void *result, int a2, void *obj)
{
  if (a2 == 2)
  {
    uint64_t v4 = result;
    if (obj)
    {
      nw_retain(obj);
      uint64_t v5 = *(void *)(v4[4] + 8LL);
      CFStringRef v6 = *(void **)(v5 + 48);
      *(void *)(v5 + 48) = obj;
      if (v6) {
        nw_release(v6);
      }
    }

    nw_resolver_cancel(*(void *)(*(void *)(v4[5] + 8LL) + 48LL));
    return (void *)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v4[6] + 8LL) + 48LL));
  }

  return result;
}

uint64_t sub_10000F7B0(uint64_t a1, int a2, nw_endpoint_t endpoint)
{
  uint64_t v4 = nw_endpoint_copy_address_string(endpoint);
  if (v4)
  {
    uint64_t v5 = v4;
    CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, v4, 0x8000100u);
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v6);
    free(v5);
    if (v6) {
      CFRelease(v6);
    }
  }

  return 1LL;
}

void sub_10000F830(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000F848(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_100018920 = (uint64_t)dispatch_queue_create("com.apple.cfnetwork.pac.resolver", v1);
}

void sub_10000F87C(id a1)
{
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CFNetwork");
  uint64_t v2 = CFBundleCopyResourceURL(BundleWithIdentifier, @"PACSupport", @"js", 0LL);
  if (v2)
  {
    SCDynamicStoreRef v3 = v2;
    uint64_t v4 = CFReadStreamCreateWithFile(0LL, v2);
    CFRelease(v3);
    if (v4)
    {
      CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 0LL);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      clientContext.version = 0LL;
      clientContext.info = Mutable;
      memset(&clientContext.retain, 0, 24);
      CFReadStreamSetClient(v4, 0x1AuLL, (CFReadStreamClientCallBack)sub_10000FAD8, &clientContext);
      CFReadStreamScheduleWithRunLoop(v4, Current, @"_kProxySupportLoadingPacPrivateMode");
      if (CFReadStreamOpen(v4))
      {
        char v15 = 0;
        context.version = 0LL;
        context.info = &v15;
        memset(&context.retain, 0, 24);
        uint64_t v7 = CFGetAllocator(v4);
        CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
        __int128 v9 = CFRunLoopTimerCreate(v7, v8 + 30.0, 0.0, 0LL, 0LL, (CFRunLoopTimerCallBack)sub_10000FBC8, &context);
        if (v9) {
          CFRunLoopAddTimer(Current, v9, @"_kProxySupportLoadingPacPrivateMode");
        }
        do
        {
          if ((CFReadStreamGetStatus(v4) & 0xFFFFFFFFFFFFFFFDLL) == 5) {
            break;
          }
          CFRunLoopRunInMode(@"_kProxySupportLoadingPacPrivateMode", 1.0e20, 1u);
        }

        while (!v15);
        if (v9)
        {
          CFRunLoopRemoveTimer(Current, v9, @"_kProxySupportLoadingPacPrivateMode");
          CFRelease(v9);
        }

        if (CFReadStreamGetError(v4).error || v15)
        {
          CFIndex Length = CFDataGetLength(Mutable);
          if (Length)
          {
            v17.length = Length;
            v17.CFIndex location = 0LL;
            CFDataDeleteBytes(Mutable, v17);
          }
        }

        CFReadStreamClose(v4);
      }

      else
      {
        CFReadStreamGetError(v4);
      }

      CFReadStreamUnscheduleFromRunLoop(v4, Current, @"_kProxySupportLoadingPacPrivateMode");
      CFReadStreamSetClient(v4, 0LL, 0LL, 0LL);
      CFRelease(v4);
      CFIndex v11 = CFDataGetLength(Mutable);
      if (v11)
      {
        CFIndex v12 = v11;
        BytePtr = CFDataGetBytePtr(Mutable);
        qword_100018908 = (uint64_t)CFStringCreateWithBytes(0LL, BytePtr, v12, 0x8000100u, 1u);
      }

      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }

void sub_10000FAD8(__CFReadStream *a1, uint64_t a2, __CFData *a3)
{
  if (a2 == 16 || a2 == 8)
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }

  else if (a2 == 2)
  {
    while (CFReadStreamHasBytesAvailable(a1))
    {
      CFIndex v5 = CFReadStreamRead(a1, buffer, 4096LL);
      CFDataAppendBytes(a3, buffer, v5);
    }
  }

void sub_10000FBC8(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
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

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}