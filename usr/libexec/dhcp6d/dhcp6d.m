void start(int a1, uint64_t a2)
{
  const char *v2;
  char *v3;
  char *v4;
  dispatch_source_s *v5;
  void handler[5];
  if (a1 < 2) {
    v2 = 0LL;
  }
  else {
    v2 = *(const char **)(a2 + 8);
  }
  v3 = sub_100003BFC(v2);
  if (!v3) {
    exit(1);
  }
  v4 = v3;
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0LL, &_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_100003BF4;
  handler[3] = &unk_10000C3C8;
  handler[4] = v4;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  signal(1, (void (__cdecl *)(int))1);
  dispatch_main();
}

void sub_100003BF4(uint64_t a1)
{
}

char *sub_100003BFC(const char *a1)
{
  v28 = 0LL;
  uint64_t v2 = sub_100003F70();
  if ((v2 & 0x80000000) != 0)
  {
    uint64_t v8 = _SC_LOG_DEFAULT(v2);
    uint64_t v9 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v8, v9))
    {
      uint64_t v10 = _os_log_pack_size(12LL);
      v11 = (char *)&handler[-1] - ((__chkstk_darwin(v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v12 = __error();
      uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "socket() failed, %s", v26);
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)uint64_t v13 = 136315138;
      *(void *)(v13 + 4) = v15;
      __SC_log_send(5LL, v8, v9, v11);
    }

    goto LABEL_10;
  }

  unsigned int v3 = v2;
  v4 = sub_1000042D0();
  v28 = v4;
  if (!v4)
  {
    uint64_t v16 = _SC_LOG_DEFAULT(0LL);
    uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v16, v17))
    {
      uint64_t v18 = _os_log_pack_size(2LL);
      v19 = (char *)&handler[-1] - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v20 = __error();
      *(_WORD *)_os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "Can't load DUID") = 0;
      __SC_log_send(5LL, v16, v17, v19);
    }

    close(v3);
LABEL_10:
    sub_1000069B0(&v28);
    return 0LL;
  }

  v5 = v4;
  v6 = (char *)malloc(0x50uLL);
  *(_OWORD *)(v6 + 4) = 0u;
  *(_OWORD *)(v6 + 20) = 0u;
  *(_OWORD *)(v6 + 36) = 0u;
  *(_OWORD *)(v6 + 52) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  if (a1) {
    v7 = a1;
  }
  else {
    v7 = "/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist";
  }
  v21 = strdup(v7);
  *((void *)v6 + 2) = v5;
  *((void *)v6 + 3) = v21;
  *(_DWORD *)v6 = v3;
  dispatch_source_t v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v3, 0LL, &_dispatch_main_q);
  *((void *)v6 + 1) = v22;
  dispatch_set_context(v22, (void *)v3);
  dispatch_set_finalizer_f(v22, (dispatch_function_t)j__close);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_1000044A0;
  handler[3] = &unk_10000C3E8;
  handler[4] = v6;
  dispatch_source_set_event_handler(v22, handler);
  sub_1000048EC((uint64_t)v6);
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.info = v6;
  v23 = SCDynamicStoreCreate(0LL, @"DHCPv6Server", (SCDynamicStoreCallBack)sub_10000608C, &context);
  values = (void *)SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv6);
  v24 = CFArrayCreate(0LL, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  CFRelease(values);
  SCDynamicStoreSetNotificationKeys(v23, 0LL, v24);
  CFRelease(v24);
  *((void *)v6 + 6) = v23;
  SCDynamicStoreSetDispatchQueue(v23, &_dispatch_main_q);
  dispatch_resume(*((dispatch_object_t *)v6 + 1));
  return v6;
}

uint64_t sub_100003F70()
{
  HIDWORD(v24) = 1;
  uint64_t v0 = socket(30, 2, 0);
  uint64_t v1 = v0;
  if ((v0 & 0x80000000) == 0)
  {
    *(void *)&v25.sa_len = 587341312LL;
    *(void *)&v25.sa_data[6] = 0LL;
    int v27 = 0;
    uint64_t v26 = 0LL;
    if (bind(v0, &v25, 0x1Cu))
    {
      uint64_t v2 = _SC_LOG_DEFAULT();
      uint64_t v3 = _SC_syslog_os_log_mapping(3LL);
      if (!__SC_log_enabled(3LL, v2, v3))
      {
LABEL_6:
        close(v1);
        return 0xFFFFFFFFLL;
      }

      uint64_t v4 = _os_log_pack_size(12LL);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = *__error();
      uint64_t v7 = _os_log_pack_fill(v5, v4, v6, &_mh_execute_header, "bind failed, %s");
    }

    else if (ioctl(v1, 0x8004667EuLL, (char *)&v24 + 4) < 0)
    {
      uint64_t v2 = _SC_LOG_DEFAULT();
      uint64_t v3 = _SC_syslog_os_log_mapping(3LL);
      uint64_t v20 = _os_log_pack_size(12LL);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v21 = *__error();
      uint64_t v7 = _os_log_pack_fill(v5, v20, v21, &_mh_execute_header, "ioctl FIONBIO failed, %s");
    }

    else
    {
      uint64_t v2 = _SC_LOG_DEFAULT();
      uint64_t v3 = _SC_syslog_os_log_mapping(3LL);
      uint64_t v22 = _os_log_pack_size(12LL);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v23 = *__error();
      uint64_t v7 = _os_log_pack_fill(v5, v22, v23, &_mh_execute_header, "setsockopt(IPV6_PKTINFO) failed, %s");
    }

    uint64_t v8 = v7;
    uint64_t v9 = __error();
    uint64_t v10 = strerror(*v9);
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = v10;
    __SC_log_send(3LL, v2, v3, v5);
    goto LABEL_6;
  }

  uint64_t v11 = _SC_LOG_DEFAULT();
  uint64_t v12 = _SC_syslog_os_log_mapping(3LL);
  if (__SC_log_enabled(3LL, v11, v12))
  {
    uint64_t v13 = _os_log_pack_size(12LL);
    v14 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v15 = __error();
    uint64_t v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "socket failed, %s", v24);
    uint64_t v17 = __error();
    uint64_t v18 = strerror(*v17);
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = v18;
    __SC_log_send(3LL, v11, v12, v14);
  }

  return v1;
}

const void *sub_1000042D0()
{
  CFPropertyListRef v0 = sub_1000069E0("/var/db/com.apple.dhcp6d.plist");
  v15 = v0;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v0
    && CFGetTypeID(v0) == TypeID
    && (Value = CFDictionaryGetValue((CFDictionaryRef)v0, @"DUID"), CFTypeID v3 = CFDataGetTypeID(), Value)
    && CFGetTypeID(Value) == v3)
  {
    CFRetain(Value);
  }

  else
  {
    Value = sub_100004C7C();
    if (!Value) {
      goto LABEL_10;
    }
  }

  Mutable = CFStringCreateMutable(0LL, 0LL);
  BytePtr = (unsigned __int16 *)CFDataGetBytePtr((CFDataRef)Value);
  CFIndex Length = CFDataGetLength((CFDataRef)Value);
  sub_100008F70(Mutable, BytePtr, Length);
  uint64_t v8 = _SC_LOG_DEFAULT(v7);
  uint64_t v9 = _SC_syslog_os_log_mapping(5LL);
  if (__SC_log_enabled(5LL, v8, v9))
  {
    uint64_t v10 = _os_log_pack_size(12LL);
    uint64_t v11 = (char *)&v15 - ((__chkstk_darwin(v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = __error();
    uint64_t v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%@", v15);
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)(v13 + 4) = Mutable;
    __SC_log_send(5LL, v8, v9, v11);
  }

  CFRelease(Mutable);
LABEL_10:
  sub_1000069B0(&v15);
  return Value;
}

void sub_1000044A0(uint64_t a1)
{
}

void sub_1000044A8(int *a1)
{
  v41[0] = v43;
  v41[1] = 1500LL;
  v40.msg_name = v42;
  v40.msg_namelen = 28;
  v40.msg_iov = (iovec *)v41;
  v40.msg_iovlen = 1;
  v40.msg_control = &v44;
  v40.msg_controllen = 32;
  unint64_t v2 = recvmsg(*a1, &v40, 0);
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    v15 = __error();
    if (*v15 != 35)
    {
      uint64_t v16 = _SC_LOG_DEFAULT(v15);
      uint64_t v17 = _SC_syslog_os_log_mapping(3LL);
      if (__SC_log_enabled(3LL, v16, v17))
      {
        uint64_t v18 = _os_log_pack_size(18LL);
        v19 = (char *)&v39 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v20 = __error();
        uint64_t v21 = _os_log_pack_fill( v19,  v18,  *v20,  &_mh_execute_header,  "DHCPv6SocketRead: recvfrom failed %s (%d)",  (const char *)v39,  DWORD2(v39));
        uint64_t v22 = __error();
        uint64_t v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)uint64_t v21 = 136315394;
        *(void *)(v21 + 4) = v23;
        *(_WORD *)(v21 + 12) = 1024;
        *(_DWORD *)(v21 + 14) = v24;
        uint64_t v11 = 3LL;
        uint64_t v12 = v16;
        uint64_t v13 = v17;
        v14 = v19;
LABEL_8:
        __SC_log_send(v11, v12, v13, v14);
      }
    }
  }

  else
  {
    uint64_t v4 = v2;
    if (v2 <= 3)
    {
      uint64_t v5 = _SC_LOG_DEFAULT(v2);
      uint64_t v6 = _SC_syslog_os_log_mapping(5LL);
      uint64_t v7 = _os_log_pack_size(18LL);
      uint64_t v8 = (char *)&v39 - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v9 = __error();
      uint64_t v10 = _os_log_pack_fill( v8,  v7,  *v9,  &_mh_execute_header,  "DHCPv6SocketRead: packet too short %ld < %d",  (void)v39,  DWORD2(v39));
      *(_DWORD *)uint64_t v10 = 134218240;
      *(void *)(v10 + 4) = v4;
      *(_WORD *)(v10 + 12) = 1024;
      *(_DWORD *)(v10 + 14) = 4;
      uint64_t v11 = 5LL;
      uint64_t v12 = v5;
      uint64_t v13 = v6;
      v14 = v8;
      goto LABEL_8;
    }

    if (v40.msg_controllen < 0xC) {
      goto LABEL_22;
    }
    msg_control = (unsigned int *)v40.msg_control;
    if (!v40.msg_control) {
      goto LABEL_22;
    }
    uint64_t v26 = 0LL;
    *(void *)&__int128 v3 = 67109120LL;
    __int128 v39 = v3;
    do
    {
      if (msg_control[1] == 41)
      {
        if (msg_control[2] == 46)
        {
          if (*msg_control >= 0x20) {
            uint64_t v26 = msg_control + 3;
          }
        }

        else
        {
          uint64_t v27 = _SC_LOG_DEFAULT(v2);
          uint64_t v28 = _SC_syslog_os_log_mapping(5LL);
          unint64_t v2 = __SC_log_enabled(5LL, v27, v28);
          if ((_DWORD)v2)
          {
            uint64_t v29 = _os_log_pack_size(8LL);
            v30 = (char *)&v39 - ((__chkstk_darwin(v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            v31 = __error();
            v32 = (_DWORD *)_os_log_pack_fill( v30,  v29,  *v31,  &_mh_execute_header,  "Why did we get control message type %d?",  (_DWORD)v39);
            unsigned int v33 = msg_control[2];
            _DWORD *v32 = v39;
            v32[1] = v33;
            unint64_t v2 = __SC_log_send(5LL, v27, v28, v30);
          }
        }
      }

      msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3LL) & 0x1FFFFFFFCLL));
    }

    while ((char *)(msg_control + 3) <= (char *)v40.msg_control + v40.msg_controllen);
    if (v26)
    {
      sub_1000050DC((uint64_t)a1, (uint64_t)v42, v43, v4, v26[4]);
    }

    else
    {
LABEL_22:
      uint64_t v34 = _SC_LOG_DEFAULT(v2);
      uint64_t v35 = _SC_syslog_os_log_mapping(5LL);
      if (__SC_log_enabled(5LL, v34, v35))
      {
        uint64_t v36 = _os_log_pack_size(2LL);
        v37 = (char *)&v39 - ((__chkstk_darwin(v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        v38 = __error();
        *(_WORD *)_os_log_pack_fill( v37,  v36,  *v38,  &_mh_execute_header,  "DHCPv6SocketRead: missing IPV6_PKTINFO") = 0;
        __SC_log_send(5LL, v34, v35, v37);
      }
    }
  }
}

void sub_1000048EC(uint64_t a1)
{
  unint64_t v2 = (const char *)sub_1000069E0(*(const char **)(a1 + 24));
  v15 = v2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v2 && (CFTypeID v4 = TypeID, TypeID = CFGetTypeID(v2), TypeID == v4))
  {
    CFTypeID v5 = CFDictionaryGetTypeID();
  }

  else
  {
    uint64_t v6 = _SC_LOG_DEFAULT(TypeID);
    uint64_t v7 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v6, v7))
    {
      uint64_t v8 = _os_log_pack_size(12LL);
      uint64_t v9 = (char *)&v15 - ((__chkstk_darwin(v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = __error();
      uint64_t v11 = _os_log_pack_fill(v9, v8, *v10, &_mh_execute_header, "Failed to load '%s'", v15);
      uint64_t v12 = *(void *)(a1 + 24);
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v11 + 4) = v12;
      __SC_log_send(5LL, v6, v7, v9);
    }

    CFTypeID v5 = CFDictionaryGetTypeID();
    if (!v2)
    {
      v14 = 0LL;
      goto LABEL_11;
    }
  }

  if (CFGetTypeID(v2) == v5) {
    v14 = (const __CFDictionary *)v2;
  }
  else {
    v14 = 0LL;
  }
LABEL_11:
  sub_100004A68(a1, v14, v13);
  sub_1000069B0((const void **)&v15);
}

void sub_100004A68(uint64_t a1, CFDictionaryRef theDict, __n128 a3)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"enabled_interfaces");
    CFTypeID TypeID = CFArrayGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID) {
      Value = 0LL;
    }
    uint64_t v7 = CFDictionaryGetValue(theDict, @"options");
    CFTypeID v8 = CFDictionaryGetTypeID();
    if (v7 && CFGetTypeID(v7) != v8) {
      uint64_t v7 = 0LL;
    }
    uint64_t v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"verbose");
    CFTypeID v10 = CFBooleanGetTypeID();
    if (v9)
    {
      if (CFGetTypeID(v9) == v10)
      {
        int v11 = CFBooleanGetValue(v9);
        if (v11 != byte_100010000)
        {
          byte_100010000 = v11 != 0;
          uint64_t v12 = _SC_LOG_DEFAULT();
          uint64_t v13 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v12, v13))
          {
            uint64_t v14 = _os_log_pack_size(12LL);
            v15 = (char *)&v19 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v16 = __error();
            uint64_t v17 = _os_log_pack_fill(v15, v14, *v16, &_mh_execute_header, "Verbose mode %s", v19);
            if (byte_100010000) {
              uint64_t v18 = "enabled";
            }
            else {
              uint64_t v18 = "disabled";
            }
            *(_DWORD *)uint64_t v17 = 136315138;
            *(void *)(v17 + 4) = v18;
            __SC_log_send(5LL, v12, v13, v15);
          }
        }
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    Value = 0LL;
  }

  sub_100006098(a1, Value, a3);
  sub_100006890(a1, (const __CFDictionary *)v7);
}

__CFData *sub_100004C7C()
{
  CFPropertyListRef v0 = (const char *)sub_1000081B0();
  uint64_t v27 = v0;
  if (!v0)
  {
    uint64_t v16 = _SC_LOG_DEFAULT(0LL);
    uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v18 = _os_log_pack_size(2LL);
    v19 = (char *)&v27 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = *__error();
    uint64_t v21 = (_WORD *)_os_log_pack_fill(v19, v18, v20, &_mh_execute_header, "can't retrieve interface list", v27);
LABEL_12:
    _WORD *v21 = 0;
    __SC_log_send(5LL, v16, v17, v19);
    uint64_t v7 = 0LL;
    goto LABEL_14;
  }

  uint64_t v1 = sub_1000080B8((uint64_t)v0);
  if (!v1)
  {
    uint64_t v16 = _SC_LOG_DEFAULT(0LL);
    uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
    uint64_t v22 = _os_log_pack_size(2LL);
    v19 = (char *)&v27 - ((__chkstk_darwin(v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = *__error();
    uint64_t v21 = (_WORD *)_os_log_pack_fill(v19, v22, v23, &_mh_execute_header, "can't find suitable interface for DUID", v27);
    goto LABEL_12;
  }

  uint64_t v2 = v1;
  __int128 v3 = (const void *)sub_100008A18(v1);
  int v4 = sub_1000081A4(v2);
  unsigned int v5 = sub_1000089FC(v2);
  uint64_t v6 = sub_100009254(v3, v4, v5);
  if (!v6)
  {
    uint64_t v16 = _SC_LOG_DEFAULT(0LL);
    uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v16, v17))
    {
      uint64_t v24 = _os_log_pack_size(2LL);
      v19 = (char *)&v27 - ((__chkstk_darwin(v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = *__error();
      uint64_t v21 = (_WORD *)_os_log_pack_fill(v19, v24, v25, &_mh_execute_header, "failed to establish DUID", v27);
      goto LABEL_12;
    }

LABEL_13:
    uint64_t v7 = 0LL;
    goto LABEL_14;
  }

  uint64_t v7 = v6;
  sub_100004F88(v6);
  uint64_t v9 = _SC_LOG_DEFAULT(v8);
  uint64_t v10 = _SC_syslog_os_log_mapping(5LL);
  if (__SC_log_enabled(5LL, v9, v10))
  {
    uint64_t v11 = _os_log_pack_size(12LL);
    uint64_t v12 = (char *)&v27 - ((__chkstk_darwin(v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = __error();
    uint64_t v14 = _os_log_pack_fill(v12, v11, *v13, &_mh_execute_header, "Derived DUID from %s", v27);
    uint64_t v15 = nullsub_1(v2);
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = v15;
    __SC_log_send(5LL, v9, v10, v12);
  }

LABEL_14:
  sub_100008980((uint64_t *)&v27);
  return v7;
}

void sub_100004F88(void *a1)
{
  values = a1;
  CFDictionaryRef v9 = CFDictionaryCreate( 0LL,  (const void **)&off_10000C408,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  uint64_t v1 = sub_100006ABC(v9, "/var/db/com.apple.dhcp6d.plist", 0x1A4u);
  if ((v1 & 0x80000000) != 0)
  {
    uint64_t v2 = _SC_LOG_DEFAULT(v1);
    uint64_t v3 = _SC_syslog_os_log_mapping(7LL);
    if (__SC_log_enabled(7LL, v2, v3))
    {
      uint64_t v4 = _os_log_pack_size(12LL);
      unsigned int v5 = (char *)&v8 - ((__chkstk_darwin(v4) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v6 = __error();
      uint64_t v7 = _os_log_pack_fill(v5, v4, *v6, &_mh_execute_header, "Failed to write DUID to %s", v8);
      *(_DWORD *)uint64_t v7 = 136315138;
      *(void *)(v7 + 4) = "/var/db/com.apple.dhcp6d.plist";
      __SC_log_send(7LL, v2, v3, v5);
    }
  }

  sub_1000069B0((const void **)&v9);
}

void sub_1000050DC(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5)
{
  uint64_t v7 = *(unsigned int *)(a1 + 72);
  uint64_t v11 = 0LL;
  while (*(_DWORD *)(*(void *)(a1 + 56) + 4 * v11) != a5)
  {
    if (v7 == ++v11) {
      goto LABEL_15;
    }
  }

  if (v11 == 0xFFFFFFFFLL || !*(void *)(*(void *)(a1 + 64) + 8 * v11))
  {
LABEL_15:
    uint64_t v24 = _SC_LOG_DEFAULT(a1);
    uint64_t v25 = _SC_syslog_os_log_mapping(7LL);
    if (__SC_log_enabled(7LL, v24, v25))
    {
      uint64_t v26 = _os_log_pack_size(14LL);
      uint64_t v27 = (char *)&v113 - ((__chkstk_darwin(v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v28 = __error();
      uint64_t v29 = _os_log_pack_fill( v27,  v26,  *v28,  &_mh_execute_header,  "Interface %d not enabled, ignoring (%d bytes)",  (_DWORD)v113,  (_DWORD)v114);
      *(_DWORD *)uint64_t v29 = 67109376;
      *(_DWORD *)(v29 + 4) = a5;
      *(_WORD *)(v29 + 8) = 1024;
      *(_DWORD *)(v29 + 10) = a4;
      __SC_log_send(7LL, v24, v25, v27);
    }
  }

  else if (*a3 == 11)
  {
    uint64_t v118 = *(void *)(*(void *)(a1 + 64) + 8 * v11);
    uint64_t v12 = (const char *)sub_1000097E0((uint64_t)a3, a4, v123);
    uint64_t v13 = v12;
    v121 = v12;
    if (byte_100010000)
    {
      Mutable = CFStringCreateMutable(0LL, 0LL);
      DHCPv6PacketPrintToString(Mutable, a3, a4);
      if (v13) {
        sub_100009834(Mutable, (uint64_t)v13);
      }
      uint64_t v16 = _SC_LOG_DEFAULT(v15);
      uint64_t v17 = _SC_syslog_os_log_mapping(4294967290LL);
      if (__SC_log_enabled(4294967290LL, v16, v17))
      {
        v117 = v13;
        uint64_t v18 = _os_log_pack_size(32LL);
        v116 = &v113;
        v19 = (char *)&v113 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v20 = __error();
        uint64_t v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "[%s] Receive from %s %@");
        uint64_t v22 = inet_ntop(30, (const void *)(a2 + 8), v122, 0x2Eu);
        *(_DWORD *)uint64_t v21 = 136315650;
        *(void *)(v21 + 4) = v118;
        *(_WORD *)(v21 + 12) = 2080;
        *(void *)(v21 + 14) = v22;
        *(_WORD *)(v21 + 22) = 2112;
        *(void *)(v21 + 24) = Mutable;
        uint64_t v13 = v117;
        __SC_log_send(4294967290LL, v16, v17, v19);
      }

      CFRelease(Mutable);
    }

    else
    {
      uint64_t v38 = _SC_LOG_DEFAULT(v12);
      uint64_t v39 = _SC_syslog_os_log_mapping(5LL);
      int v40 = v39;
      uint64_t v23 = __SC_log_enabled(5LL, v38, v39);
      if ((_DWORD)v23)
      {
        uint64_t v115 = v38;
        uint64_t v41 = _os_log_pack_size(44LL);
        v116 = &v113;
        uint64_t v42 = __chkstk_darwin(v41);
        v117 = v13;
        v43 = (char *)&v113 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        char v44 = __error();
        uint64_t v45 = _os_log_pack_fill( v43,  v41,  *v44,  &_mh_execute_header,  "[%s] Receive %s (%d) [%d bytes] from %s",  v113,  v114,  v115,  (_DWORD)v116,  v117);
        v46 = DHCPv6MessageTypeName(*a3);
        HIDWORD(v114) = v40;
        v47 = v46;
        int v48 = *a3;
        v49 = inet_ntop(30, (const void *)(a2 + 8), v122, 0x2Eu);
        *(_DWORD *)uint64_t v45 = 136316162;
        *(void *)(v45 + 4) = v118;
        *(_WORD *)(v45 + 12) = 2080;
        *(void *)(v45 + 14) = v47;
        *(_WORD *)(v45 + 22) = 1024;
        *(_DWORD *)(v45 + 24) = v48;
        *(_WORD *)(v45 + 28) = 1024;
        *(_DWORD *)(v45 + 30) = a4;
        *(_WORD *)(v45 + 34) = 2080;
        *(void *)(v45 + 36) = v49;
        v50 = v43;
        uint64_t v13 = v117;
        uint64_t v23 = __SC_log_send(5LL, v115, HIDWORD(v114), v50);
      }
    }

    if (v13)
    {
      v51 = sub_10000997C((uint64_t)v13, 2, (unsigned int *)&v120, 0LL);
      if (v51)
      {
        v52 = v51;
        BOOL v53 = sub_10000920C(v51, v120);
        if (!v53)
        {
          uint64_t v56 = _SC_LOG_DEFAULT(v53);
          uint64_t v57 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v56, v57))
          {
            uint64_t v97 = _os_log_pack_size(2LL);
            v59 = (char *)&v113 - ((__chkstk_darwin(v97) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v98 = *__error();
            v61 = (_WORD *)_os_log_pack_fill(v59, v97, v98, &_mh_execute_header, "Request contains invalid SERVERID");
            goto LABEL_50;
          }

LABEL_58:
          sub_1000097F8((void **)&v121);
          return;
        }

        CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        if (Length != v120
          || (BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 16)), CFIndex Length = bcmp(v52, BytePtr, v120), (_DWORD)Length))
        {
          uint64_t v56 = _SC_LOG_DEFAULT(Length);
          uint64_t v57 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v56, v57))
          {
            uint64_t v58 = _os_log_pack_size(2LL);
            v59 = (char *)&v113 - ((__chkstk_darwin(v58) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v60 = *__error();
            v61 = (_WORD *)_os_log_pack_fill(v59, v58, v60, &_mh_execute_header, "Request SERVERID doesn't match");
LABEL_50:
            _WORD *v61 = 0;
LABEL_56:
            uint64_t v95 = v56;
            uint64_t v96 = v57;
            v106 = v59;
LABEL_57:
            __SC_log_send(5LL, v95, v96, v106);
            goto LABEL_58;
          }

          goto LABEL_58;
        }
      }

      DHCPv6PacketSetMessageType(&v124, 7);
      __int16 v125 = *(_WORD *)(a3 + 1);
      unsigned __int8 v126 = a3[3];
      sub_100009604((uint64_t)v119, (uint64_t)&v127, 1496);
      v68 = sub_10000997C((uint64_t)v13, 1, (unsigned int *)&v120, 0LL);
      if (!v68) {
        goto LABEL_34;
      }
      v69 = v68;
      BOOL v70 = sub_10000920C(v68, v120);
      if (!v70)
      {
        uint64_t v56 = _SC_LOG_DEFAULT(v70);
        uint64_t v57 = _SC_syslog_os_log_mapping(5LL);
        if (__SC_log_enabled(5LL, v56, v57))
        {
          uint64_t v99 = _os_log_pack_size(2LL);
          v59 = (char *)&v113 - ((__chkstk_darwin(v99) + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v100 = *__error();
          v61 = (_WORD *)_os_log_pack_fill(v59, v99, v100, &_mh_execute_header, "Request contains invalid CLIENTID");
          goto LABEL_50;
        }

        goto LABEL_58;
      }

      BOOL v71 = sub_100009618((uint64_t)v119, 1u, (unsigned __int16)v120, v69, v123);
      if (!v71)
      {
        uint64_t v56 = _SC_LOG_DEFAULT(v71);
        uint64_t v57 = _SC_syslog_os_log_mapping(5LL);
        uint64_t v104 = _os_log_pack_size(12LL);
        v59 = (char *)&v113 - ((__chkstk_darwin(v104) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v105 = *__error();
        uint64_t v103 = _os_log_pack_fill(v59, v104, v105, &_mh_execute_header, " failed to add CLIENTID, %s");
      }

      else
      {
LABEL_34:
        unsigned __int16 v72 = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        v73 = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
        BOOL v74 = sub_100009618((uint64_t)v119, 2u, v72, v73, v123);
        if (v74)
        {
          v75 = sub_10000997C((uint64_t)v13, 6, (unsigned int *)&v120, 0LL);
          if (v75 && *(void *)(a1 + 32) && v120 >= 2)
          {
            v76 = v75;
            uint64_t v77 = 0LL;
            while (1)
            {
              unsigned int v78 = bswap32(v76[v77]);
              unsigned int v79 = HIWORD(v78);
              v80 = (const __CFData *)sub_100009A24(*(const __CFDictionary **)(a1 + 32), SHIWORD(v78));
              if (v80)
              {
                v81 = v80;
                unsigned __int16 v82 = CFDataGetLength(v80);
                v83 = (UInt8 *)CFDataGetBytePtr(v81);
                BOOL v84 = sub_100009618((uint64_t)v119, v79, v82, v83, v123);
                if (!v84) {
                  break;
                }
              }
            }

            uint64_t v107 = _SC_LOG_DEFAULT(v84);
            uint64_t v108 = _SC_syslog_os_log_mapping(5LL);
            uint64_t v109 = _os_log_pack_size(22LL);
            v91 = (char *)&v113 - ((__chkstk_darwin(v109) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            v110 = __error();
            uint64_t v111 = _os_log_pack_fill( v91,  v109,  *v110,  &_mh_execute_header,  "failed to add %s, %s",  v113,  v114);
            v112 = sub_100009480(v79);
            *(_DWORD *)uint64_t v111 = 136315394;
            *(void *)(v111 + 4) = v112;
            *(_WORD *)(v111 + 12) = 2080;
            *(void *)(v111 + 14) = v123;
            uint64_t v95 = v107;
            uint64_t v96 = v108;
          }

          else
          {
LABEL_42:
            int v85 = sub_100009610((uint64_t)v119);
            uint64_t v86 = sub_100005C54((int *)a1, a5, (_OWORD *)(a2 + 8), &v124, (v85 + 4));
            int v87 = v86;
            uint64_t v88 = _SC_LOG_DEFAULT(v86);
            uint64_t v89 = _SC_syslog_os_log_mapping(5LL);
            uint64_t v90 = _os_log_pack_size(22LL);
            v91 = (char *)&v113 - ((__chkstk_darwin(v90) + 15) & 0xFFFFFFFFFFFFFFF0LL);
            v92 = __error();
            uint64_t v93 = _os_log_pack_fill( v91,  v90,  *v92,  &_mh_execute_header,  "%s transmit failed, %s",  v113,  v114);
            v94 = strerror(v87);
            *(_DWORD *)uint64_t v93 = 136315394;
            *(void *)(v93 + 4) = v118;
            *(_WORD *)(v93 + 12) = 2080;
            *(void *)(v93 + 14) = v94;
            uint64_t v95 = v88;
            uint64_t v96 = v89;
          }

          v106 = v91;
          goto LABEL_57;
        }

        uint64_t v56 = _SC_LOG_DEFAULT(v74);
        uint64_t v57 = _SC_syslog_os_log_mapping(5LL);
        uint64_t v101 = _os_log_pack_size(12LL);
        v59 = (char *)&v113 - ((__chkstk_darwin(v101) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v102 = *__error();
        uint64_t v103 = _os_log_pack_fill(v59, v101, v102, &_mh_execute_header, "failed to add SERVERID, %s");
      }

      *(_DWORD *)uint64_t v103 = 136315138;
      *(void *)(v103 + 4) = v123;
      goto LABEL_56;
    }

    uint64_t v62 = _SC_LOG_DEFAULT(v23);
    uint64_t v63 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v62, v63))
    {
      uint64_t v64 = _os_log_pack_size(12LL);
      v65 = (char *)&v113 - ((__chkstk_darwin(v64) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v66 = __error();
      uint64_t v67 = _os_log_pack_fill( v65,  v64,  *v66,  &_mh_execute_header,  "DHCPv6 options parse failed, %s",  v113);
      *(_DWORD *)uint64_t v67 = 136315138;
      *(void *)(v67 + 4) = v123;
      __SC_log_send(5LL, v62, v63, v65);
    }
  }

  else
  {
    uint64_t v30 = _SC_LOG_DEFAULT(a1);
    uint64_t v31 = _SC_syslog_os_log_mapping(7LL);
    if (__SC_log_enabled(7LL, v30, v31))
    {
      uint64_t v32 = _os_log_pack_size(30LL);
      unsigned int v33 = (char *)&v113 - ((__chkstk_darwin(v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v34 = __error();
      uint64_t v35 = _os_log_pack_fill( v33,  v32,  *v34,  &_mh_execute_header,  "Ignoring %s (%d) packet on interface %d (%d bytes)",  v113,  (_DWORD)v114,  v115,  (_DWORD)v116);
      uint64_t v36 = DHCPv6MessageTypeName(*a3);
      int v37 = *a3;
      *(_DWORD *)uint64_t v35 = 136315906;
      *(void *)(v35 + 4) = v36;
      *(_WORD *)(v35 + 12) = 1024;
      *(_DWORD *)(v35 + 14) = v37;
      *(_WORD *)(v35 + 18) = 1024;
      *(_DWORD *)(v35 + 20) = a5;
      *(_WORD *)(v35 + 24) = 1024;
      *(_DWORD *)(v35 + 26) = a4;
      __SC_log_send(7LL, v30, v31, v33);
    }
  }

uint64_t sub_100005C54(int *a1, unsigned int a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5)
{
  int v48 = a3;
  uint64_t v8 = a1;
  if (byte_100010000)
  {
    Mutable = CFStringCreateMutable(0LL, 0LL);
    DHCPv6PacketPrintToString(Mutable, a4, a5);
    uint64_t v10 = sub_1000097E0((uint64_t)a4, a5, v52);
    *(void *)v49 = v10;
    if (v10)
    {
      sub_100009834(Mutable, (uint64_t)v10);
      sub_1000097F8((void **)v49);
    }

    else
    {
      uint64_t v24 = _SC_LOG_DEFAULT(0LL);
      uint64_t v25 = _SC_syslog_os_log_mapping(5LL);
      uint64_t v11 = __SC_log_enabled(5LL, v24, v25);
      if ((_DWORD)v11)
      {
        uint64_t v26 = _os_log_pack_size(12LL);
        v47 = (const char **)v8;
        uint64_t v27 = (char *)&v45 - ((__chkstk_darwin(v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v28 = __error();
        uint64_t v29 = _os_log_pack_fill(v27, v26, *v28, &_mh_execute_header, "parse options failed, %s", v45);
        *(_DWORD *)uint64_t v29 = 136315138;
        *(void *)(v29 + 4) = v52;
        uint64_t v11 = __SC_log_send(5LL, v24, v25, v27);
        uint64_t v8 = (int *)v47;
      }
    }

    uint64_t v30 = (const char *)_SC_LOG_DEFAULT(v11);
    uint64_t v31 = _SC_syslog_os_log_mapping(4294967290LL);
    if (__SC_log_enabled(4294967290LL, v30, v31))
    {
      uint64_t v32 = _os_log_pack_size(38LL);
      v46 = (const char **)v30;
      uint64_t v33 = v32;
      v47 = &v45;
      uint64_t v34 = (char *)&v45 - ((__chkstk_darwin(v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v35 = __error();
      uint64_t v36 = _os_log_pack_fill(v34, v33, *v35, &_mh_execute_header, "[%s] Transmit [%d bytes] to %s %@");
      int v37 = Mutable;
      int v38 = a5;
      a5 = (uint64_t)a4;
      uint64_t v39 = v8;
      unsigned int v40 = a2;
      uint64_t v41 = if_indextoname(a2, v51);
      uint64_t v42 = inet_ntop(30, v48, v50, 0x2Eu);
      *(_DWORD *)uint64_t v36 = 136315906;
      *(void *)(v36 + 4) = v41;
      a2 = v40;
      uint64_t v8 = v39;
      a4 = (unsigned __int8 *)a5;
      LODWORD(a5) = v38;
      Mutable = v37;
      *(_WORD *)(v36 + 12) = 1024;
      *(_DWORD *)(v36 + 14) = a5;
      *(_WORD *)(v36 + 18) = 2080;
      *(void *)(v36 + 20) = v42;
      *(_WORD *)(v36 + 28) = 2112;
      *(void *)(v36 + 30) = v37;
      __SC_log_send(4294967290LL, v46, v31, v34);
    }

    CFRelease(Mutable);
  }

  else
  {
    uint64_t v12 = (const char *)_SC_LOG_DEFAULT(a1);
    uint64_t v13 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v12, v13))
    {
      LODWORD(v47) = a2;
      uint64_t v14 = _os_log_pack_size(44LL);
      v46 = &v45;
      uint64_t v15 = (char *)&v45 - ((__chkstk_darwin(v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = __error();
      uint64_t v17 = _os_log_pack_fill( v15,  v14,  *v16,  &_mh_execute_header,  "[%s] Transmit %s (%d) [%d bytes] to %s",  v45,  (const char *)v46,  (_DWORD)v47,  (_DWORD)v48,  *(const char **)v49);
      uint64_t v18 = if_indextoname(v47, v51);
      uint64_t v45 = v12;
      v19 = v18;
      uint64_t v20 = DHCPv6MessageTypeName(*a4);
      uint64_t v21 = v8;
      int v22 = *a4;
      uint64_t v23 = inet_ntop(30, v48, v50, 0x2Eu);
      *(_DWORD *)uint64_t v17 = 136316162;
      *(void *)(v17 + 4) = v19;
      *(_WORD *)(v17 + 12) = 2080;
      *(void *)(v17 + 14) = v20;
      *(_WORD *)(v17 + 22) = 1024;
      *(_DWORD *)(v17 + 24) = v22;
      uint64_t v8 = v21;
      *(_WORD *)(v17 + 28) = 1024;
      *(_DWORD *)(v17 + 30) = a5;
      *(_WORD *)(v17 + 34) = 2080;
      *(void *)(v17 + 36) = v23;
      a2 = v47;
      __SC_log_send(5LL, v45, v13, v15);
    }
  }

  int v43 = *v8;
  *(_OWORD *)&v49[12] = *(__int128 *)((char *)&xmmword_10000AF08 + 12);
  *(_OWORD *)v49 = xmmword_10000AF08;
  *(_OWORD *)&v49[8] = *v48;
  *(_WORD *)&v49[2] = 8706;
  return sub_100008E80(v43, a2, v49, (uint64_t)a4, a5, -1);
}

void sub_10000608C(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100006098(uint64_t a1, const void *a2, __n128 a3)
{
  unsigned int v29 = 0;
  unsigned int v5 = *(const void **)(a1 + 40);
  uint64_t v28 = v5;
  if (!byte_100010000 || sub_100006F54(v5, a2))
  {
    if (a2) {
      goto LABEL_4;
    }
LABEL_28:
    LODWORD(v7) = 0;
    uint64_t v6 = 0LL;
    CFDictionaryRef v9 = 0LL;
    char v15 = 1;
    goto LABEL_29;
  }

  uint64_t v16 = _SC_LOG_DEFAULT();
  uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
  int v18 = __SC_log_enabled(5LL, v16, v17);
  if (!a2)
  {
    if (v18)
    {
      uint64_t v7 = _os_log_pack_size(2LL);
      uint64_t v23 = (char *)&v27 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v24 = __error();
      *(_WORD *)_os_log_pack_fill(v23, v7, *v24, &_mh_execute_header, "Enabled Interfaces: none") = 0;
      __SC_log_send(5LL, v16, v17, v23);
      char v15 = 1;
      LODWORD(v7) = 0;
      uint64_t v6 = 0LL;
      goto LABEL_24;
    }

    goto LABEL_28;
  }

  if (v18)
  {
    uint64_t v19 = _os_log_pack_size(12LL);
    uint64_t v20 = (char *)&v27 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = __error();
    uint64_t v22 = _os_log_pack_fill(v20, v19, *v21, &_mh_execute_header, "Enabled Interfaces: %@");
    *(_DWORD *)uint64_t v22 = 138412290;
    *(void *)(v22 + 4) = a2;
    __SC_log_send(5LL, v16, v17, v20);
  }

LABEL_4:
  uint64_t v6 = sub_100006D74((const __CFArray *)a2, &v29);
  uint64_t v7 = v29;
  if (!v6)
  {
    char v15 = 0;
LABEL_24:
    CFDictionaryRef v9 = 0LL;
    goto LABEL_29;
  }

  uint64_t v8 = if_nameindex();
  CFDictionaryRef v9 = (int *)malloc(4LL * (int)v7);
  if ((int)v7 >= 1)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (v8 && (if_name = v8->if_name) != 0LL)
      {
        uint64_t v12 = (const char *)v6[i];
        uint64_t v13 = v8;
        while (strcmp(if_name, v12))
        {
          if_name = v13[1].if_name;
          ++v13;
          if (!if_name) {
            goto LABEL_12;
          }
        }

        int if_index = v13->if_index;
      }

      else
      {
LABEL_12:
        int if_index = 0;
      }

      v9[i] = if_index;
    }
  }

  if (v8) {
    if_freenameindex(v8);
  }
  LODWORD(v7) = v29;
  if (v9)
  {
    sub_100006398(a1, (uint64_t)v9, (uint64_t)v6, v29, a3);
    char v15 = 0;
    LODWORD(v7) = v29;
  }

  else
  {
    char v15 = 0;
  }

LABEL_29:
  sub_100006534(a1, v9, v7, a3);
  uint64_t v25 = *(void **)(a1 + 56);
  if (v25) {
    free(v25);
  }
  uint64_t v26 = *(void **)(a1 + 64);
  if (v26) {
    free(v26);
  }
  *(_DWORD *)(a1 + 72) = v29;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v6;
  if ((v15 & 1) == 0) {
    CFRetain(a2);
  }
  *(void *)(a1 + 40) = a2;
  sub_1000069B0(&v28);
}

uint64_t sub_100006398(uint64_t result, uint64_t a2, uint64_t a3, int a4, __n128 a5)
{
  if (a4 >= 1)
  {
    uint64_t v5 = a3;
    uint64_t v7 = result;
    uint64_t v8 = 0LL;
    uint64_t v9 = a4;
    a5.n128_u64[0] = 136315138LL;
    __n128 v22 = a5;
    uint64_t v23 = a3;
    do
    {
      int v10 = *(_DWORD *)(a2 + 4 * v8);
      if (v10)
      {
        uint64_t v11 = *(void *)(v5 + 8 * v8);
        uint64_t v12 = *(unsigned int *)(v7 + 72);
        uint64_t v13 = *(int **)(v7 + 56);
        uint64_t v14 = 0xFFFFFFFFLL;
        while (1)
        {
          int v15 = *v13++;
          if (v15 == v10) {
            break;
          }
          --v14;
          if (!--v12) {
            goto LABEL_10;
          }
        }

        if (!v14)
        {
LABEL_10:
          result = sub_1000066EC(*(_DWORD *)v7, 80, v10);
          if (!(_DWORD)result)
          {
            uint64_t v16 = _SC_LOG_DEFAULT();
            uint64_t v17 = _SC_syslog_os_log_mapping(5LL);
            result = __SC_log_enabled(5LL, v16, v17);
            if ((_DWORD)result)
            {
              uint64_t v18 = _os_log_pack_size(12LL);
              uint64_t v19 = (char *)&v22 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v20 = __error();
              uint64_t v21 = _os_log_pack_fill( v19,  v18,  *v20,  &_mh_execute_header,  "Added DHCPv6 multicast for interface %s",  (const char *)v22.n128_u64[0]);
              *(_DWORD *)uint64_t v21 = v22.n128_u32[0];
              *(void *)(v21 + 4) = v11;
              result = __SC_log_send(5LL, v16, v17, v19);
              uint64_t v5 = v23;
            }
          }
        }
      }

      ++v8;
    }

    while (v8 != v9);
  }

  return result;
}

uint64_t sub_100006534(uint64_t result, int *a2, unsigned int a3, __n128 a4)
{
  if (*(int *)(result + 72) >= 1)
  {
    int v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = 0LL;
    uint64_t v8 = a3;
    a4.n128_u64[0] = 136315138LL;
    __n128 v21 = a4;
    int v22 = a3;
    do
    {
      uint64_t v9 = *(int *)(*(void *)(v6 + 56) + 4 * v7);
      if ((_DWORD)v9)
      {
        uint64_t v10 = *(void *)(*(void *)(v6 + 64) + 8 * v7);
        if (!a2 || v4 < 1) {
          goto LABEL_11;
        }
        uint64_t v11 = a2;
        uint64_t v12 = v8;
        uint64_t v13 = 0xFFFFFFFFLL;
        while (1)
        {
          int v14 = *v11++;
          if (v14 == v9) {
            break;
          }
          --v13;
          if (!--v12) {
            goto LABEL_11;
          }
        }

        if (!v13)
        {
LABEL_11:
          result = sub_1000066EC(*(_DWORD *)v6, 81, v9);
          if (!(_DWORD)result)
          {
            uint64_t v15 = _SC_LOG_DEFAULT();
            uint64_t v16 = _SC_syslog_os_log_mapping(5LL);
            result = __SC_log_enabled(5LL, v15, v16);
            if ((_DWORD)result)
            {
              uint64_t v17 = _os_log_pack_size(12LL);
              uint64_t v18 = (char *)&v21 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v19 = __error();
              uint64_t v20 = _os_log_pack_fill( v18,  v17,  *v19,  &_mh_execute_header,  "Removed DHCPv6 multicast for interface %s",  (const char *)v21.n128_u64[0]);
              *(_DWORD *)uint64_t v20 = v21.n128_u32[0];
              *(void *)(v20 + 4) = v10;
              result = __SC_log_send(5LL, v15, v16, v18);
              int v4 = v22;
            }
          }
        }
      }

      ++v7;
    }

    while (v7 < *(int *)(v6 + 72));
  }

  return result;
}

uint64_t sub_1000066EC(int a1, int a2, int a3)
{
  if ((a2 & 0xFFFFFFFE) != 0x50) {
    return 0xFFFFFFFFLL;
  }
  HIDWORD(v16) = a3;
  v17[0] = xmmword_10000AF24;
  *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_10000AF24 + 12);
  uint64_t v5 = setsockopt(a1, 41, a2, (char *)&v16 + 4, 0x84u);
  if ((_DWORD)v5)
  {
    uint64_t v6 = _SC_LOG_DEFAULT();
    uint64_t v7 = _SC_syslog_os_log_mapping(3LL);
    if (__SC_log_enabled(3LL, v6, v7))
    {
      uint64_t v8 = _os_log_pack_size(28LL);
      uint64_t v9 = (char *)&v16 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = __error();
      uint64_t v11 = _os_log_pack_fill( v9,  v8,  *v10,  &_mh_execute_header,  "setsockopt(%s) if_index %d failed, %s",  v16,  LODWORD(v17[0]),  *((const char **)&v17[0] + 1));
      if (a2 == 80) {
        uint64_t v12 = "MCAST_JOIN_GROUP";
      }
      else {
        uint64_t v12 = "MCAST_LEAVE_GROUP";
      }
      uint64_t v13 = __error();
      int v14 = strerror(*v13);
      *(_DWORD *)uint64_t v11 = 136315650;
      *(void *)(v11 + 4) = v12;
      *(_WORD *)(v11 + 12) = 1024;
      *(_DWORD *)(v11 + 14) = a3;
      *(_WORD *)(v11 + 18) = 2080;
      *(void *)(v11 + 20) = v14;
      __SC_log_send(3LL, v6, v7, v9);
    }
  }

  return v5;
}

void sub_100006890(uint64_t a1, const __CFDictionary *a2)
{
  if (!a2)
  {
LABEL_5:
    CFMutableDictionaryRef v3 = 0LL;
    goto LABEL_6;
  }

  CFMutableDictionaryRef v3 = sub_100009A88(a2);
  if (!v3)
  {
    uint64_t v4 = _SC_LOG_DEFAULT();
    uint64_t v5 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v4, v5))
    {
      uint64_t v6 = _os_log_pack_size(2LL);
      uint64_t v7 = (char *)&v9 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v8 = __error();
      *(_WORD *)_os_log_pack_fill( v7,  v6,  *v8,  &_mh_execute_header,  "Failed to create DHCPv6OptionsDictionary") = 0;
      __SC_log_send(5LL, v4, v5, v7);
    }

    goto LABEL_5;
  }

LABEL_6:
  sub_1000069B0((const void **)(a1 + 32));
  *(void *)(a1 + 32) = v3;
}

  *a2 = v5;
  return v7;
}

void sub_1000069B0(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0LL;
    }
  }

CFPropertyListRef sub_1000069E0(const char *a1)
{
  if (stat(a1, &v11) < 0) {
    return 0LL;
  }
  off_t st_size = v11.st_size;
  if (!v11.st_size) {
    return 0LL;
  }
  CFMutableDictionaryRef v3 = malloc(v11.st_size);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  int v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }

  uint64_t v7 = CFDataCreateWithBytesNoCopy(0LL, (const UInt8 *)v4, st_size, kCFAllocatorNull);
  if (v7)
  {
    uint64_t v8 = v7;
    CFPropertyListRef v9 = CFPropertyListCreateWithData(0LL, v7, 0LL, 0LL, 0LL);
    CFRelease(v8);
  }

  else
  {
    CFPropertyListRef v9 = 0LL;
  }

  free(v4);
  return v9;
}

uint64_t sub_100006ABC(CFPropertyListRef propertyList, const char *a2, unsigned int a3)
{
  if (!propertyList) {
    return 0LL;
  }
  Data = CFPropertyListCreateData(0LL, propertyList, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  if (!Data) {
    return 0LL;
  }
  int v6 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  size_t Length = CFDataGetLength(v6);
  snprintf(__str, 0x400uLL, "%s-", a2);
  int v9 = open(__str, 1537, a3);
  if (v9 < 0)
  {
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  else
  {
    int v10 = v9;
    if (write(v9, BytePtr, Length) == Length)
    {
      rename(__str, a2);
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v11 = 0xFFFFFFFFLL;
    }

    close(v10);
  }

  CFRelease(v6);
  return v11;
}

uint64_t sub_100006BDC(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  CFIndex usedBufLen = 0LL;
  v11.length = CFStringGetLength(a1);
  v11.location = 0LL;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  int v8 = usedBufLen;
  if (a2) {
    a2[usedBufLen] = 0;
  }
  return (v8 + 1);
}

uint64_t sub_100006C60(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  CFIndex Count = CFArrayGetCount(a1);
  CFIndex v9 = Count;
  signed int v10 = 8 * Count;
  if (a2)
  {
    uint64_t v12 = (UInt8 *)(a2 + v10);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (Count >= 1)
  {
    CFIndex v13 = 0LL;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v13);
      CFTypeID TypeID = CFStringGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID) {
        return 0LL;
      }
      if (a2)
      {
        int v16 = *a3 - v10;
        if (v16 < 0) {
          return 0LL;
        }
        int v17 = sub_100006BDC(ValueAtIndex, v12, v16, 0);
        *(void *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }

      else
      {
        int v17 = sub_100006BDC(ValueAtIndex, v12, 0, 0);
      }

      v10 += v17;
    }

    while (v9 != ++v13);
  }

  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1LL;
}

void *sub_100006D74(const __CFArray *a1, _DWORD *a2)
{
  *a2 = 0;
  uint64_t v4 = malloc(__size);
  if (!sub_100006C60(a1, (uint64_t)v4, (unsigned int *)&__size, &__size_4))
  {
    free(v4);
    return 0LL;
  }

  *a2 = __size_4;
  return v4;
}

uint64_t sub_100006DFC(const __CFString *a1, void *a2)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return 0LL;
  }
  uint64_t result = CFStringGetCString(a1, buffer, 64LL, 0x600u);
  if ((_DWORD)result) {
    return inet_pton(30, buffer, a2) == 1;
  }
  return result;
}

void *sub_100006EB0(const __CFArray *a1, int *a2)
{
  int Count = CFArrayGetCount(a1);
  int v5 = Count;
  if (!Count) {
    return 0LL;
  }
  int v6 = malloc(16LL * Count);
  uint64_t v7 = v6;
  if (v5 >= 1)
  {
    CFIndex v8 = 0LL;
    CFIndex v9 = v6;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v8);
      if ((sub_100006DFC(ValueAtIndex, v9) & 1) == 0) {
        break;
      }
      ++v8;
      v9 += 2;
      if (v5 == v8) {
        goto LABEL_6;
      }
    }

    free(v7);
    return 0LL;
  }

uint64_t sub_100006F54(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0LL;
  }
  if (a2)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFGetTypeID(a2)) {
      return CFEqual(a1, a2);
    }
  }

  return 0LL;
}

void sub_100006FC4(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v9 = 0LL;
    uint64_t v10 = a3;
    do
    {
      if (v9)
      {
        if (a4 != 32 || (v9 & 7) != 0) {
          *(_WORD *)CFRange v11 = a4;
        }
        else {
          strcpy(v11, "  ");
        }
      }

      else
      {
        v11[0] = 0;
      }

      CFStringAppendFormat(theString, 0LL, @"%s%02x", v11, *(unsigned __int8 *)(a2 + v9++));
    }

    while (v10 != v9);
  }

UInt8 *sub_10000707C(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  CFIndex usedBufLen = 0LL;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0LL, 0LL, &usedBufLen);
  CFIndex v7 = usedBufLen;
  if (!usedBufLen) {
    return 0LL;
  }
  CFIndex v8 = (UInt8 *)malloc(usedBufLen + 1);
  v11.CFIndex location = location;
  v11.CFIndex length = length;
  CFStringGetBytes(a1, v11, a3, 0, 0, v8, v7, &usedBufLen);
  v8[usedBufLen] = 0;
  return v8;
}

UInt8 *sub_100007130(const __CFString *a1, CFStringEncoding a2)
{
  v5.CFIndex length = CFStringGetLength(a1);
  v5.CFIndex location = 0LL;
  return sub_10000707C(a1, v5, a2);
}

CFDataRef sub_100007164(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0LL, theString, 0x8000100u, 0);
}

void *sub_10000717C(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  CFRange v5 = a4;
  int v6 = a3;
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v7 = a1;
  if (!a3)
  {
    uint64_t v69 = 0LL;
    __int128 v68 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    int v8 = 128;
    uint64_t v9 = &v60;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    goto LABEL_7;
  }

  int v8 = *a4;
  if (!*a4)
  {
LABEL_5:
    int v10 = 0;
    goto LABEL_84;
  }

  __int128 v68 = 0u;
  uint64_t v69 = 0LL;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  uint64_t v9 = (__int128 *)a3;
  LOBYTE(v68) = 1;
LABEL_7:
  *((void *)&v68 + 1) = v9;
  HIDWORD(v69) = v8;
  BOOL v70 = 0LL;
  uint64_t v71 = 0LL;
  char v72 = a5;
  if (a2 < 1)
  {
    int v10 = 0;
LABEL_66:
    if (!v6)
    {
      int v6 = malloc(v10);
      memcpy(v6, *((const void **)&v68 + 1), v10);
    }

    goto LABEL_83;
  }

  uint64_t v11 = 0LL;
  uint64_t v53 = a2;
  while (1)
  {
    uint64_t v55 = v11;
    uint64_t v12 = *(const char **)(v7 + 8 * v11);
    int v56 = v69;
    unsigned int v13 = strlen(v12);
    int v14 = (char *)malloc((int)v13 + 26LL);
    uint64_t v15 = malloc(0x30uLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      _OWORD *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((void *)v15 + 4) = v15;
    }

    int v16 = v14 + 24;
    *(void *)int v14 = v15;
    *((void *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0) {
      break;
    }
    int v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!v72)
    {
      goto LABEL_63;
    }

    uint64_t v58 = v71;
    if ((int)v71 < 1)
    {
      unsigned int v25 = 0;
LABEL_41:
      if ((sub_100007E30((uint64_t)&v60, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_74:
        if ((v69 & 0x80000000) != 0 || (int)v69 > SHIDWORD(v69))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v56);
          uint64_t v7 = a1;
        }

        else
        {
          LODWORD(v69) = v56;
          uint64_t v7 = a1;
        }

        sub_100007F28((void **)v14);
        free(v14);
        goto LABEL_79;
      }

      uint64_t v26 = 0LL;
      unsigned int v39 = 0;
      char v38 = 1;
      goto LABEL_43;
    }

    uint64_t v24 = 0LL;
    unsigned int v25 = 0;
    uint64_t v26 = 0LL;
    uint64_t v57 = v70;
    uint64_t v27 = *((void *)&v68 + 1);
    do
    {
      uint64_t v28 = v57[v24];
      if (!v28) {
        break;
      }
      unsigned int v29 = 0;
      uint64_t v30 = *(unsigned int *)(v28 + 40);
      uint64_t v31 = *(void **)v14;
      uint64_t v32 = *(unsigned int *)(*(void *)v14 + 40LL);
      do
      {
        unsigned int v33 = v29;
        uint64_t v34 = (unsigned __int8 *)(v27 + *(unsigned int *)(*(void *)(v28 + 32) + 4 * v30 - 4));
        size_t v35 = *v34;
        uint64_t v36 = (unsigned __int8 *)(*((void *)v14 + 1) + *(unsigned int *)(v31[4] + 4 * v32 - 4));
        if ((_DWORD)v35 != *v36) {
          break;
        }
        int v37 = memcmp(v34 + 1, v36 + 1, v35);
        unsigned int v29 = v33 + 1;
        --v30;
        --v32;
      }

      while (!v37);
      if (v33 > v25) {
        uint64_t v26 = v28;
      }
      ++v24;
    }

    while (v24 != v58);
    if (!v26) {
      goto LABEL_41;
    }
    char v38 = 0;
    unsigned int v39 = *(_DWORD *)(v26 + 40) - v25;
LABEL_43:
    unsigned int v40 = *(void **)v14;
    uint64_t v41 = *(unsigned int *)(*(void *)v14 + 40LL);
    if ((int)v41 >= 1)
    {
      uint64_t v42 = 0LL;
      uint64_t v43 = v41 - v25;
      do
      {
        if (v42 >= (int)v43)
        {
          int v46 = *(_DWORD *)(*(void *)(v26 + 32) + 4LL * (int)v39);
          if (v43 == v42)
          {
            __int16 __src = bswap32(v46 | 0xC000) >> 16;
          }

          ++v39;
          char v44 = *(void **)v14;
        }

        else
        {
          char v44 = *(void **)v14;
          uint64_t v45 = *(unsigned int *)(*(void *)(*(void *)v14 + 32LL) + 4 * v42);
          if ((v38 & 1) == 0)
          {
            if (!sub_100007E30( (uint64_t)&v60,  (void *)(*((void *)v14 + 1) + v45),  *(unsigned __int8 *)(*((void *)v14 + 1) + v45) + 1)) {
              goto LABEL_74;
            }
            char v44 = *(void **)v14;
          }

          int v46 = v45 + v56;
        }

        *(_DWORD *)(v44[4] + 4 * v42++) = v46;
      }

      while (v41 != v42);
      unsigned int v40 = *(void **)v14;
    }

    int v47 = v71;
    uint64_t v48 = SHIDWORD(v71);
    if (HIDWORD(v71) == (_DWORD)v71)
    {
      if (HIDWORD(v71))
      {
        HIDWORD(v71) *= 2;
        v49 = reallocf(v70, 16 * v48);
        BOOL v70 = v49;
        int v47 = v71;
      }

      else
      {
        HIDWORD(v71) = 8;
        v49 = malloc(0x40uLL);
        int v47 = 0;
        BOOL v70 = v49;
      }
    }

    else
    {
      v49 = v70;
    }

    LODWORD(v71) = v47 + 1;
    v49[v47] = v40;
    *(void *)int v14 = 0LL;
LABEL_63:
    sub_100007F28((void **)v14);
    free(v14);
    uint64_t v7 = a1;
    uint64_t v11 = v55 + 1;
    if (v55 + 1 == v53)
    {
      int v10 = v69;
      int v6 = a3;
      CFRange v5 = a4;
      goto LABEL_66;
    }
  }

  uint64_t v17 = 0LL;
  size_t v18 = 0LL;
  int v19 = 0;
  int v20 = 0;
  uint64_t v21 = v13;
  uint64_t v22 = v13 + 1;
  while (1)
  {
    if (v17 != v21)
    {
      int v23 = v12[v17];
      if (v23 != 46)
      {
        ++v17;
        *(_BYTE *)(*((void *)v14 + 1) + v17) = v23;
        ++v20;
        goto LABEL_19;
      }
    }

    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_70;
    }

    if (v20 >= 64) {
      break;
    }
    sub_100007DA8(*(int **)v14, v18);
    *(_BYTE *)(*((void *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    size_t v18 = ++v17;
    int v20 = 0;
LABEL_19:
    if (v17 == v22)
    {
      int v16 = (char *)*((void *)v14 + 1);
      goto LABEL_22;
    }
  }

  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_70:
  sub_100007F28((void **)v14);
  free(v14);
  else {
    LODWORD(v69) = v56;
  }
LABEL_79:
  CFRange v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v55));
  if (a3) {
    int v10 = v69;
  }
  else {
    int v10 = 0;
  }
  int v6 = 0LL;
LABEL_83:
  sub_100007770((uint64_t)&v60);
LABEL_84:
  _DWORD *v5 = v10;
  return v6;
}

void sub_100007770(uint64_t a1)
{
  CFMutableDictionaryRef v3 = (void **)(a1 + 152);
  uint64_t v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
      do
      {
        sub_100007F28((void **)(*(void *)(a1 + 152) + v4));
        ++v5;
        v4 += 8LL;
      }

      while (v5 < *(int *)(a1 + 160));
      uint64_t v2 = *v3;
    }

    free(v2);
  }

  *CFMutableDictionaryRef v3 = 0LL;
  *(void *)(a1 + 160) = 0LL;
}

CFDataRef sub_1000077E4(const __CFArray *a1, char a2)
{
  LODWORD(length) = 0;
  CFMutableDictionaryRef v3 = sub_100006D74(a1, &v8);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (UInt8 *)sub_10000717C((uint64_t)v3, v8, 0LL, &length, a2);
  free(v4);
  CFDataRef v6 = CFDataCreate(0LL, v5, (int)length);
  free(v5);
  return v6;
}

CFDataRef sub_10000786C(const __CFString *a1)
{
  LODWORD(length) = 0;
  uint64_t v1 = sub_100007130(a1, 0x8000100u);
  CFDataRef v6 = v1;
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  CFMutableDictionaryRef v3 = (UInt8 *)sub_10000717C((uint64_t)&v6, 1, 0LL, &length, 0);
  free(v2);
  if (!v3) {
    return 0LL;
  }
  CFDataRef v4 = CFDataCreate(0LL, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_1000078F8(uint64_t a1, unsigned int a2, int *a3)
{
  __src[0] = 0LL;
  memset(v12, 0, sizeof(v12));
  __src[1] = v12;
  uint64_t v14 = 0x8000000000LL;
  int v4 = sub_100007A08(a1, a2, (uint64_t)v12, 0);
  int v5 = v4;
  if (v4)
  {
    size_t v6 = (int)v14;
    uint64_t v7 = (char *)malloc((int)v14 + 8LL * v4);
    int v8 = &v7[8 * v5];
    memcpy(v8, __src[1], v6);
    if (v5 >= 1)
    {
      uint64_t v9 = 0LL;
      do
      {
        *(void *)&v7[v9] = v8;
        v8 += strlen(v8) + 1;
        v9 += 8LL;
      }

      while (8LL * v5 != v9);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v7) {
    int v10 = v5;
  }
  else {
    int v10 = 0;
  }
  *a3 = v10;
  sub_100007D54(v12);
  return v7;
}

uint64_t sub_100007A08(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0LL;
  if (a1 && a2)
  {
    size_t v7 = 0LL;
    size_t v8 = 0LL;
    uint64_t v4 = 0LL;
    unsigned int v9 = 0;
    v30[1] = (void *)0x800000000LL;
    memset(v29, 0, sizeof(v29));
    v30[0] = v29;
    char v10 = 1;
    unsigned int v11 = a2;
    do
    {
      uint64_t v12 = (unsigned __int8 *)(a1 + v8);
      unsigned int v13 = *v12;
      if ((~v13 & 0xC0) != 0)
      {
        if (v8 >= v7)
        {
          if (v13 >= 0x40)
          {
            fprintf(__stderrp, "label length %d > %d\n");
            goto LABEL_48;
          }

          unsigned int v18 = v13 + 1;
          if (v11 <= v13)
          {
            fprintf(__stderrp, "label truncated %d < %d\n");
            goto LABEL_48;
          }

          size_t v7 = v18 + v7;
          v11 -= v18;
        }

        if (*v12)
        {
          char __src = 46;
          if (SLODWORD(v30[1]) < 1) {
            goto LABEL_29;
          }
          if (*(_DWORD *)v30[0] != (_DWORD)v8)
          {
            uint64_t v19 = 1LL;
            do
            {
              unint64_t v20 = v19;
              if (LODWORD(v30[1]) == v19) {
                break;
              }
              int v21 = *((_DWORD *)v30[0] + v19++);
            }

            while (v21 != (_DWORD)v8);
            if (v20 >= LODWORD(v30[1])) {
LABEL_29:
            }
              sub_100007DA8((int *)v29, v8);
          }

          if ((v10 & 1) == 0) {
            sub_100007E30(a3, &__src, 1);
          }
          sub_100007E30(a3, v12 + 1, v13);
          char v10 = 0;
          size_t v8 = v8 + v13 + 1;
        }

        else
        {
          char __src = 0;
          char v10 = 1;
          sub_100007E30(a3, &__src, 1);
          uint64_t v4 = (v4 + 1);
          unsigned int v9 = v7;
          size_t v8 = v7;
          if (a4) {
            break;
          }
        }
      }

      else
      {
        if (a4)
        {
          uint64_t v22 = __stderrp;
          int v23 = "single name with pointers\n";
          size_t v24 = 26LL;
          goto LABEL_47;
        }

        if (v8 >= v7)
        {
          if (v11 <= 1)
          {
            uint64_t v22 = __stderrp;
            int v23 = "truncated pointer value\n";
            size_t v24 = 24LL;
            goto LABEL_47;
          }

          size_t v7 = (v7 + 2);
          v11 -= 2;
        }

        unsigned int v14 = bswap32(*(_WORD *)v12 & 0xFF3F);
        if (v8 <= HIWORD(v14))
        {
          uint64_t v22 = __stderrp;
          int v23 = "pointer points at or ahead of current position\n";
          size_t v24 = 47LL;
          goto LABEL_47;
        }

        size_t v8 = HIWORD(v14);
        if (v9 <= v8)
        {
          uint64_t v22 = __stderrp;
          int v23 = "attempt to create infinite loop\n";
          size_t v24 = 32LL;
          goto LABEL_47;
        }

        if (SLODWORD(v30[1]) < 1) {
          goto LABEL_38;
        }
        if (*(_DWORD *)v30[0] != (_DWORD)v8)
        {
          uint64_t v15 = 1LL;
          do
          {
            unint64_t v16 = v15;
            if (LODWORD(v30[1]) == v15) {
              break;
            }
            int v17 = *((_DWORD *)v30[0] + v15++);
          }

          while (v17 != (_DWORD)v8);
          if (v16 >= LODWORD(v30[1]))
          {
LABEL_38:
            uint64_t v22 = __stderrp;
            int v23 = "attempt to point off into the weeds\n";
            size_t v24 = 36LL;
            goto LABEL_47;
          }
        }
      }
    }

    while (v8 < a2);
    if ((_DWORD)v4) {
      goto LABEL_49;
    }
    uint64_t v22 = __stderrp;
    if (*(_DWORD *)(a3 + 144))
    {
      int v23 = "name missing end label\n";
      size_t v24 = 23LL;
    }

    else
    {
      int v23 = "empty list\n";
      size_t v24 = 11LL;
    }

LABEL_47:
    fwrite(v23, v24, 1uLL, v22);
LABEL_48:
    sub_100007D54((_OWORD *)a3);
    uint64_t v4 = 0LL;
LABEL_49:
    if (v30[0] && v30[0] != v29) {
      free(v30[0]);
    }
  }

  return v4;
}

double sub_100007D54(_OWORD *a1)
{
  if (!*((_BYTE *)a1 + 128))
  {
    uint64_t v2 = (_OWORD *)*((void *)a1 + 17);
    if (v2) {
      BOOL v3 = v2 == a1;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      free(v2);
    }
  }

  *((void *)a1 + 18) = 0LL;
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_100007DA8(int *result, size_t __size)
{
  int v2 = __size;
  uint64_t v3 = (uint64_t)result;
  uint64_t v4 = result[11];
  if ((_DWORD)v4 == result[10])
  {
    result[11] = 2 * v4;
    int v5 = (void *)*((void *)result + 4);
    if (v5 == (void *)v3)
    {
      size_t v6 = malloc(8 * v4);
      *(void *)(v3 + 32) = v6;
      double result = (int *)memmove(v6, (const void *)v3, 4 * v4);
    }

    else
    {
      double result = (int *)reallocf(v5, 8 * v4);
      *(void *)(v3 + 32) = result;
    }
  }

  uint64_t v7 = *(void *)(v3 + 32);
  uint64_t v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 40) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_100007E30(uint64_t a1, void *__src, int a3)
{
  int v7 = *(_DWORD *)(a1 + 144);
  int v6 = *(_DWORD *)(a1 + 148);
  if (v6 - v7 >= a3)
  {
    unsigned int v9 = *(char **)(a1 + 136);
  }

  else
  {
    if (*(_BYTE *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v6 - v7);
      return 0LL;
    }

    if (a3 <= 128) {
      int v10 = 128;
    }
    else {
      int v10 = a3;
    }
    int v11 = v6 + v10;
    *(_DWORD *)(a1 + 148) = v11;
    uint64_t v12 = *(void **)(a1 + 136);
    if (v12 == (void *)a1)
    {
      unsigned int v9 = (char *)malloc(v11);
      *(void *)(a1 + 136) = v9;
      memcpy(v9, (const void *)a1, v7);
    }

    else
    {
      unsigned int v9 = (char *)reallocf(v12, v11);
      *(void *)(a1 + 136) = v9;
      int v7 = *(_DWORD *)(a1 + 144);
    }
  }

  memcpy(&v9[v7], __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1LL;
}

void sub_100007F28(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (*a1)
    {
      uint64_t v3 = (void *)v2[4];
      if (v3) {
        BOOL v4 = v3 == v2;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4) {
        free(v3);
      }
      free(v2);
      *a1 = 0LL;
    }
  }

void *sub_100007F70(void *a1, uint64_t a2, uint64_t a3)
{
  double result = sub_100008CD0(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_100007FA4(uint64_t *a1)
{
  uint64_t v1 = (uint64_t)a1;
  while (sub_100008D44(a1, 0, &v3))
  {
    if (v3)
    {
      int v2 = *(void (**)(void))(v1 + 16);
      if (v2) {
        v2();
      }
    }

    a1 = (uint64_t *)v1;
  }

  sub_100008CD8(v1);
}

__n128 sub_100008004(__n128 *a1)
{
  int v2 = malloc(0x10uLL);
  if (v2)
  {
    __n128 result = *a1;
    *int v2 = *a1;
  }

  return result;
}

uint64_t sub_100008038(uint64_t *a1, char *__s2)
{
  uint64_t v4 = -96LL;
  uint64_t v5 = -1LL;
  while (1)
  {
    int v6 = a1 ? *((_DWORD *)a1 + 2) : 0;
    if (++v5 >= v6) {
      break;
    }
    uint64_t v7 = v4 + 96;
    uint64_t v8 = *a1;
    int v9 = strcmp((const char *)(*a1 + v4 + 96), __s2);
    uint64_t v4 = v7;
    if (!v9) {
      return v8 + v7;
    }
  }

  return 0LL;
}

uint64_t sub_1000080B8(uint64_t a1)
{
  uint64_t result = sub_100008038((uint64_t *)a1, "en0");
  if (!result)
  {
    if (a1 && (uint64_t v3 = *(unsigned int *)(a1 + 8), (int)v3 >= 1))
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      uint64_t v7 = *(int *)(a1 + 8);
      do
      {
        if (v4 >= v7) {
          uint64_t v8 = 0LL;
        }
        else {
          uint64_t v8 = *(void *)a1 + 96 * v4;
        }
        int v9 = *(unsigned __int8 *)(v8 + 18);
        if (v9 == 6 || v9 == 144)
        {
          if (v5)
          {
          }

          else
          {
            uint64_t v5 = (const char *)v8;
          }
        }

        else if (!v6)
        {
          if (*(_BYTE *)(v8 + 74)) {
            uint64_t v6 = v8;
          }
          else {
            uint64_t v6 = 0LL;
          }
        }

        ++v4;
      }

      while (v4 != v3);
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v5 = 0LL;
    }

    if (v6) {
      BOOL v10 = v5 == 0LL;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10) {
      return v6;
    }
    else {
      return (uint64_t)v5;
    }
  }

  return result;
}

uint64_t sub_1000081A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 74);
}

void *sub_1000081B0()
{
  CFPropertyListRef v0 = malloc(0x10uLL);
  uint64_t v1 = v0;
  if (v0 && !sub_1000081F4((uint64_t)v0))
  {
    free(v1);
    return 0LL;
  }

  return v1;
}

uint64_t sub_1000081F4(uint64_t a1)
{
  v76 = 0LL;
  *(void *)a1 = 0LL;
  int v2 = getifaddrs(&v76);
  uint64_t v3 = v76;
  if (v2 < 0) {
    goto LABEL_88;
  }
  if (!v76)
  {
LABEL_90:
    uint64_t result = *(void *)a1;
    if (*(void *)a1)
    {
      free((void *)result);
      uint64_t result = 0LL;
      *(void *)a1 = 0LL;
    }

    return result;
  }

  int v4 = 0;
  uint64_t v5 = v76;
  while (v5->ifa_addr)
  {
    uint64_t v5 = v5->ifa_next;
    --v4;
    if (!v5) {
      goto LABEL_8;
    }
  }

  if (!v4)
  {
LABEL_88:
    if (v3) {
      freeifaddrs(v3);
    }
    goto LABEL_90;
  }

LABEL_8:
  int v6 = -v4;
  uint64_t v7 = malloc(96LL * -v4);
  *(void *)a1 = v7;
  if (!v7) {
    goto LABEL_88;
  }
  int v8 = socket(2, 2, 0);
  uint64_t v3 = v76;
  if (v8 < 0) {
    goto LABEL_88;
  }
  int v10 = v8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v6;
  size_t v11 = 96LL;
  if (!v3) {
    goto LABEL_93;
  }
  mach_port_t v73 = kIOMainPortDefault;
  uint64_t v71 = kCFAllocatorDefault;
  *(void *)&__int128 v9 = 136315906LL;
  __int128 v74 = v9;
  int v75 = v8;
  do
  {
    ifa_addr = v3->ifa_addr;
    if (!ifa_addr) {
      goto LABEL_82;
    }
    ifa_name = v3->ifa_name;
    int sa_family = ifa_addr->sa_family;
    if (sa_family == 2)
    {
      uint64_t v21 = 96LL * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
      uint64_t v22 = -96LL;
      do
      {
        uint64_t v23 = v22 + 96;
        if (v21 == v22 + 96) {
          goto LABEL_30;
        }
        uint64_t v24 = *(void *)a1;
        int v25 = strcmp((const char *)(*(void *)a1 + v22 + 96), ifa_name);
        uint64_t v22 = v23;
      }

      while (v25);
      if (v24)
      {
        uint64_t v26 = v24 + v23;
LABEL_32:
        int v38 = *(_DWORD *)&ifa_addr->sa_data[2];
        ifa_netmask = v3->ifa_netmask;
        if (ifa_netmask) {
          int v40 = *(_DWORD *)&ifa_netmask->sa_data[2];
        }
        else {
          int v40 = 0;
        }
        if ((*(_WORD *)(v26 + 16) & 2) != 0 && (ifa_dstaddr = v3->ifa_dstaddr) != 0LL) {
          int v42 = *(_DWORD *)&ifa_dstaddr->sa_data[2];
        }
        else {
          int v42 = 0;
        }
        uint64_t v43 = malloc(0x10uLL);
        if (v43)
        {
          _DWORD *v43 = v38;
          v43[1] = v40;
          v43[2] = v40 & v38;
          v43[3] = v42;
        }

        sub_100008000(v26 + 24, v43);
        goto LABEL_82;
      }

LABEL_30:
      uint64_t v37 = sub_100008C50((uint64_t *)a1, (uint64_t)ifa_name);
      if (v37)
      {
        uint64_t v26 = v37;
        *(_WORD *)(v37 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }

      uint64_t v44 = sub_1000093E8();
      uint64_t v45 = _SC_syslog_os_log_mapping(5LL);
      goto LABEL_45;
    }

    if (sa_family != 18) {
      goto LABEL_82;
    }
    uint64_t v15 = 96LL * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
    uint64_t v16 = -96LL;
    do
    {
      uint64_t v17 = v16 + 96;
      if (v15 == v16 + 96) {
        goto LABEL_25;
      }
      uint64_t v18 = *(void *)a1;
      int v19 = strcmp((const char *)(*(void *)a1 + v16 + 96), ifa_name);
      uint64_t v16 = v17;
    }

    while (v19);
    if (v18)
    {
      uint64_t v20 = v18 + v17;
      goto LABEL_27;
    }

LABEL_25:
    uint64_t v27 = sub_100008C50((uint64_t *)a1, (uint64_t)ifa_name);
    if (!v27)
    {
      uint64_t v44 = sub_1000093E8();
      uint64_t v45 = _SC_syslog_os_log_mapping(5LL);
LABEL_45:
      uint64_t v46 = _os_log_pack_size(2LL);
      int v47 = (char *)&v71 - ((__chkstk_darwin(v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v48 = *__error();
      *(_WORD *)_os_log_pack_fill(v47, v46, v48, &_mh_execute_header, "interfaces: S_next_entry returns NULL", v71) = 0;
      __SC_log_send(5LL, v44, v45, v47);
      goto LABEL_82;
    }

    uint64_t v20 = v27;
    *(_WORD *)(v27 + 16) = v3->ifa_flags;
LABEL_27:
    unsigned int v28 = ifa_addr->sa_data[4];
    if (v28 >= 0x11)
    {
      uint64_t v29 = sub_1000093E8();
      uint64_t v30 = _SC_syslog_os_log_mapping(5LL);
      if (__SC_log_enabled(5LL, v29, v30))
      {
        uint64_t v31 = _os_log_pack_size(34LL);
        uint64_t v32 = (char *)&v71 - ((__chkstk_darwin(v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        unsigned int v33 = __error();
        uint64_t v34 = _os_log_pack_fill( v32,  v31,  *v33,  &_mh_execute_header,  "%s: link type %d address length %d > %ld",  (const char *)v71,  v72,  (_DWORD)v74,  *((void *)&v74 + 1));
        int v35 = ifa_addr->sa_data[2];
        int v36 = ifa_addr->sa_data[4];
        *(_DWORD *)uint64_t v34 = v74;
        *(void *)(v34 + 4) = ifa_name;
        *(_WORD *)(v34 + 12) = 1024;
        *(_DWORD *)(v34 + 14) = v35;
        *(_WORD *)(v34 + 18) = 1024;
        *(_DWORD *)(v34 + 20) = v36;
        *(_WORD *)(v34 + 24) = 2048;
        unsigned int v28 = 16;
        *(void *)(v34 + 26) = 16LL;
        __SC_log_send(5LL, v29, v30, v32);
        int v10 = v75;
      }

      else
      {
        unsigned int v28 = 16;
      }
    }

    *(_BYTE *)(v20 + 74) = v28;
    memmove((void *)(v20 + 56), &ifa_addr->sa_data[ifa_addr->sa_data[3] + 6], v28);
    char v49 = ifa_addr->sa_data[2];
    *(_BYTE *)(v20 + 75) = v49;
    *(_WORD *)(v20 + 72) = *(_WORD *)ifa_addr->sa_data;
    ifa_data = (char *)v3->ifa_data;
    if (ifa_data) {
      char v49 = *ifa_data;
    }
    *(_BYTE *)(v20 + 18) = v49;
    if (sub_100008A20(v10, (uint64_t)ifa_name, (uint64_t)v80))
    {
      if (*(_BYTE *)(v20 + 18) == 6)
      {
        uint64_t v51 = sub_100008AB0(v10, (uint64_t)ifa_name);
        if ((v51 & 0x4000) != 0) {
          *(_BYTE *)(v20 + 19) |= 8u;
        }
        if ((v80[16] & 0xE0) == 0x80)
        {
          char v52 = *(_BYTE *)(v20 + 19);
          *(_BYTE *)(v20 + 19) = v52 | 1;
          if ((v51 & 0x100000) != 0)
          {
            char v66 = v52 | 3;
            goto LABEL_70;
          }

          keys = @"IOInterfaceName";
          values = (void *)CFStringCreateWithCString(0LL, ifa_name, 0x8000100u);
          uint64_t v77 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          keys = @"IOPropertyMatch";
          uint64_t v53 = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&v77,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          CFRelease(v77);
          io_service_t MatchingService = IOServiceGetMatchingService(v73, v53);
          if (MatchingService)
          {
            io_object_t v55 = MatchingService;
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IO80211InterfaceRole", v71, 0);
            if (CFProperty)
            {
              uint64_t v57 = CFProperty;
              CFTypeID TypeID = CFStringGetTypeID();
              BOOL v59 = CFGetTypeID(v57) == TypeID && CFEqual(v57, @"Infrastructure") != 0;
              CFRelease(v57);
              IOObjectRelease(v55);
              if (v59)
              {
                char v66 = *(_BYTE *)(v20 + 19) | 0x10;
LABEL_70:
                *(_BYTE *)(v20 + 19) = v66;
              }
            }

            else
            {
              IOObjectRelease(v55);
            }
          }
        }

        else
        {
          CFStringRef v60 = CFStringCreateWithCString(0LL, ifa_name, 0x8000100u);
          uint64_t v61 = _SCNetworkInterfaceCreateWithBSDName(0LL, v60, 0LL);
          if (v61)
          {
            __int128 v62 = (const void *)v61;
            int IsTetheredHotspot = _SCNetworkInterfaceIsTetheredHotspot();
            int IsCarPlay = _SCNetworkInterfaceIsCarPlay(v62);
            CFRelease(v62);
            if (IsCarPlay)
            {
              if (IsTetheredHotspot) {
                char v65 = 36;
              }
              else {
                char v65 = 32;
              }
              CFRelease(v60);
            }

            else
            {
              CFRelease(v60);
              if (!IsTetheredHotspot) {
                goto LABEL_71;
              }
              char v65 = 4;
            }

            char v66 = *(_BYTE *)(v20 + 19) | v65;
            goto LABEL_70;
          }

          CFRelease(v60);
        }
      }

LABEL_71:
      if (v82 < 1)
      {
        int v68 = 0;
        unint64_t v67 = 0LL;
        uint64_t v69 = 0LL;
      }

      else
      {
        unint64_t v67 = (unint64_t)(v81 & 2) << 31;
        if ((v81 & 1) != 0) {
          int v68 = (v81 >> 2) & 1;
        }
        else {
          int v68 = 0;
        }
        if ((v81 & 1) == 0) {
          unint64_t v67 = 0LL;
        }
        uint64_t v69 = 1LL;
        if ((v81 & 1) == 0) {
          uint64_t v69 = 0LL;
        }
      }

      *(void *)(v20 + 80) = v69 | v67;
      *(_DWORD *)(v20 + 88) = v68;
    }

LABEL_82:
    uint64_t v3 = v3->ifa_next;
  }

  while (v3);
  size_t v11 = 96LL * *(int *)(a1 + 8) + 96;
LABEL_93:
  *(void *)a1 = reallocf(*(void **)a1, v11);
  if (v76) {
    freeifaddrs(v76);
  }
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  return 1LL;
}

void sub_100008980(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (*(int *)(v2 + 8) >= 1)
      {
        uint64_t v3 = 0LL;
        uint64_t v4 = 24LL;
        do
        {
          sub_100007FA4((uint64_t *)(*(void *)v2 + v4));
          ++v3;
          v4 += 96LL;
        }

        while (v3 < *(int *)(v2 + 8));
      }

      if (*(void *)v2) {
        free(*(void **)v2);
      }
      free((void *)v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_1000089FC(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 75);
  if (v1 == 144) {
    unsigned int v2 = 24;
  }
  else {
    unsigned int v2 = -1;
  }
  if (v1 == 6) {
    return 1LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_100008A18(uint64_t a1)
{
  return a1 + 56;
}

uint64_t sub_100008A20(int a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)(a3 + 28) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __strlcpy_chk(a3, a2, 16LL, 16LL);
  if (ioctl(a1, 0xC02C6938uLL, a3) != -1) {
    return 1LL;
  }
  if (*__error() != 102) {
    return 0LL;
  }
  *(_DWORD *)(a3 + 24) = 3;
  uint64_t result = 1LL;
  *(_DWORD *)(a3 + 32) = 1;
  return result;
}

uint64_t sub_100008AB0(int a1, uint64_t a2)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __strlcpy_chk(&v13, a2, 16LL, 16LL);
  if (ioctl(a1, 0xC020698EuLL, &v13) != -1) {
    return v14;
  }
  if (*__error() != 6 && *__error() != 82 && *__error() != 22)
  {
    uint64_t v5 = sub_1000093E8();
    uint64_t v6 = _SC_syslog_os_log_mapping(5LL);
    if (__SC_log_enabled(5LL, v5, v6))
    {
      uint64_t v7 = _os_log_pack_size(22LL);
      int v8 = (char *)&v13 - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __int128 v9 = __error();
      uint64_t v10 = _os_log_pack_fill( v8,  v7,  *v9,  &_mh_execute_header,  "%s: SIOCGIFEFLAGS failed status, %s",  (const char *)v13,  *((const char **)&v13 + 1));
      size_t v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = a2;
      *(_WORD *)(v10 + 12) = 2080;
      *(void *)(v10 + 14) = v12;
      __SC_log_send(5LL, v5, v6, v8);
    }
  }

  return 0LL;
}

uint64_t sub_100008C50(uint64_t *a1, uint64_t a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  if (v2 >= *((_DWORD *)a1 + 3)) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  *((_DWORD *)a1 + 2) = v2 + 1;
  uint64_t v4 = v3 + 96LL * v2;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __strlcpy_chk(v4, a2, 16LL, 16LL);
  sub_100007F70((void *)(v4 + 24), (uint64_t)j__free, (uint64_t)sub_100008004);
  return v4;
}

void *sub_100008CD0(void *result)
{
  *uint64_t result = 0LL;
  result[1] = 0LL;
  return result;
}

void sub_100008CD8(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2) {
    free(v2);
  }
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

uint64_t sub_100008D04(uint64_t result)
{
  if (result)
  {
    if (*(void *)result) {
      return *(unsigned int *)(result + 12);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100008D20(uint64_t a1, int a2)
{
  if (*(void *)a1 && *(_DWORD *)(a1 + 12) > a2) {
    return *(void *)(*(void *)a1 + 8LL * a2);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100008D44(uint64_t *a1, unsigned int a2, void *a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if ((a2 & 0x80000000) == 0)
  {
    int v6 = *((_DWORD *)a1 + 3);
    if (v6 > (int)a2)
    {
      if (a3) {
        *a3 = *(void *)(v3 + 8LL * a2);
      }
      if ((int)(v6 + ~a2) >= 1)
      {
        memmove((void *)(*a1 + 8LL * a2), (const void *)(*a1 + 8LL * (a2 + 1)), 8LL * (v6 + ~a2));
        int v6 = *((_DWORD *)a1 + 3);
      }

      *((_DWORD *)a1 + 3) = v6 - 1;
      return 1LL;
    }
  }

  return result;
}

BOOL sub_100008DC8(uint64_t a1, uint64_t a2)
{
  BOOL result = sub_100008E08(a1);
  if (result)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v6 + 1;
    *(void *)(v5 + 8 * v6) = a2;
    return 1LL;
  }

  return result;
}

BOOL sub_100008E08(uint64_t a1)
{
  int v2 = *(void **)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  if (!v2)
  {
    if (!v3)
    {
      int v3 = 16;
      *(_DWORD *)(a1 + 8) = 16;
    }

    *(_DWORD *)(a1 + 12) = 0;
    int v2 = malloc(8LL * v3);
    goto LABEL_7;
  }

  if (v3 == *(_DWORD *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 8) = 2 * v3;
    int v2 = realloc(v2, 16LL * v3);
LABEL_7:
    *(void *)a1 = v2;
  }

  return v2 != 0LL;
}

void sub_100008E78(__CFString *a1, uint64_t a2, int a3)
{
}

uint64_t sub_100008E80(int a1, int a2, void *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a5;
  v11[0] = a4;
  v11[1] = a5;
  v10.msg_name = a3;
  v10.msg_namelen = 28;
  v10.msg_iov = (iovec *)v11;
  v10.msg_iovlen = 1;
  v10.msg_control = &v12;
  if (a6 >= 0) {
    socklen_t v7 = 48;
  }
  else {
    socklen_t v7 = 32;
  }
  v10.msg_controllen = v7;
  v10.msg_flags = 0;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  int v13 = 46;
  uint64_t v12 = 0x2900000020LL;
  int v16 = 0;
  LODWORD(v15) = a2;
  if ((a6 & 0x80000000) == 0)
  {
    *(void *)((char *)&v15 + 4) = 0x2900000010LL;
    HIDWORD(v15) = 47;
    int v16 = a6;
  }

  ssize_t v8 = sendmsg(a1, &v10, 0);
  uint64_t result = 0LL;
  if (v8 != v6) {
    return *__error();
  }
  return result;
}

void sub_100008F70(CFMutableStringRef theString, unsigned __int16 *a2, uint64_t a3)
{
  int v3 = a3;
  if ((int)a3 >= 2)
  {
    uint64_t v7 = bswap32(*a2) >> 16;
    switch((int)v7)
    {
      case 1:
        int v8 = a3 - 8;
        if (a3 < 8)
        {
          uint64_t v6 = 8LL;
          goto LABEL_3;
        }

        CFStringAppendFormat( theString,  0LL,  @"DUID LLT HW %d Time %u Addr ",  bswap32(a2[1]) >> 16,  bswap32(*((_DWORD *)a2 + 1)));
        uint64_t v9 = (uint64_t)(a2 + 4);
        goto LABEL_17;
      case 2:
        int v8 = a3 - 6;
        if (a3 < 6)
        {
          uint64_t v6 = 6LL;
          goto LABEL_3;
        }

        CFStringAppendFormat(theString, 0LL, @"DUID EN Num %d Id ", __rev16(a2[2]));
        uint64_t v9 = (uint64_t)(a2 + 3);
        goto LABEL_17;
      case 3:
        int v8 = a3 - 4;
        if (a3 < 4)
        {
          uint64_t v6 = 4LL;
          goto LABEL_3;
        }

        CFStringAppendFormat(theString, 0LL, @"DUID LL HW %d Addr ", bswap32(a2[1]) >> 16);
        uint64_t v9 = (uint64_t)(a2 + 2);
LABEL_17:
        sub_100006FC4(theString, v9, v8, 58);
        return;
      case 4:
        if (a3 < 0x12)
        {
          uint64_t v6 = 18LL;
          goto LABEL_3;
        }

        uuid_unparse((const unsigned __int8 *)a2 + 2, out);
        CFStringAppendFormat(theString, 0LL, @"DUID UUID %s", out);
        break;
      default:
        CFStringAppendFormat(theString, 0LL, @"DUID (unrecognized type=%d): ", v7);
        sub_100006FC4(theString, (uint64_t)a2, v3, 32);
        return;
    }
  }

  else
  {
    uint64_t v6 = 2LL;
LABEL_3:
    CFStringAppendFormat(theString, 0LL, @"DUID too short (%d < %d), Data = { ", a3, v6);
    sub_100006FC4(theString, (uint64_t)a2, v3, 32);
    CFStringAppendCString(theString, " }", 0x600u);
  }

BOOL sub_10000920C(unsigned __int16 *a1, int a2)
{
  if (a2 < 2) {
    return 0LL;
  }
  unsigned int v2 = (bswap32(*a1) >> 16) - 1;
  return (unsigned __int16)v2 <= 3u && dword_10000AF60[(__int16)v2] <= a2;
}

__CFData *sub_100009254(const void *a1, int a2, unsigned int a3)
{
  size_t v5 = a2;
  CFIndex v6 = a2 + 8;
  Mutable = CFDataCreateMutable(0LL, v6);
  CFDataSetLength(Mutable, v6);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *(_WORD *)MutableBytePtr = 256;
  *((_WORD *)MutableBytePtr + 1) = bswap32(a3) >> 16;
  memcpy(MutableBytePtr + 8, a1, v5);
  memset(&v11, 0, sizeof(v11));
  v11.tm_year = 100;
  v11.tm_mday = 1;
  int v9 = timegm(&v11);
  *((_DWORD *)MutableBytePtr + 1) = bswap32(time(0LL) - v9);
  return Mutable;
}

const char *DHCPv6MessageTypeName(unsigned int a1)
{
  if (a1 > 0xD) {
    return "<unknown";
  }
  else {
    return off_10000C410[(char)a1];
  }
}

_BYTE *DHCPv6PacketSetMessageType(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void DHCPv6PacketPrintToString(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  if ((int)a3 > 3)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = DHCPv6MessageTypeName(*a2);
    CFStringAppendFormat( theString,  0LL,  @"DHCPv6 %s (%d) Transaction ID 0x%06x Length %d\n",  v7,  v6,  bswap32((a2[1] << 8) | (a2[2] << 16) | (a2[3] << 24)),  a3);
  }

  else
  {
    CFStringAppendFormat(theString, 0LL, @"Packet too short %d < %d\n", a3, 4LL);
  }

uint64_t sub_1000093E8()
{
  return qword_100010008;
}

uint64_t sub_1000093F4(int a1)
{
  uint64_t result = 1LL;
  switch(a1)
  {
    case 1:
    case 2:
      uint64_t result = 2LL;
      break;
    case 3:
      uint64_t result = 7LL;
      break;
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      return result;
    case 5:
      uint64_t result = 8LL;
      break;
    case 6:
    case 8:
      uint64_t result = 3LL;
      break;
    case 12:
    case 22:
    case 23:
      uint64_t result = 5LL;
      break;
    case 13:
      uint64_t result = 9LL;
      break;
    case 14:
      uint64_t result = 0LL;
      break;
    case 21:
    case 24:
      uint64_t result = 6LL;
      break;
    case 25:
      uint64_t result = 11LL;
      break;
    case 26:
      uint64_t result = 12LL;
      break;
    case 41:
    case 42:
      goto LABEL_7;
    default:
      if (a1 == 103) {
LABEL_7:
      }
        uint64_t result = 10LL;
      break;
  }

  return result;
}

const char *sub_100009480(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = "CLIENTID";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "SERVERID";
      break;
    case 2:
      uint64_t result = "IA_NA";
      break;
    case 3:
      uint64_t result = "IA_TA";
      break;
    case 4:
      uint64_t result = "IAADDR";
      break;
    case 5:
      uint64_t result = "ORO";
      break;
    case 6:
      uint64_t result = "PREFERENCE";
      break;
    case 7:
      uint64_t result = "ELAPSED_TIME";
      break;
    case 8:
      uint64_t result = "RELAY_MSG";
      break;
    case 9:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
      goto LABEL_5;
    case 10:
      uint64_t result = "AUTH";
      break;
    case 11:
      uint64_t result = "UNICAST";
      break;
    case 12:
      uint64_t result = "STATUS_CODE";
      break;
    case 13:
      uint64_t result = "RAPID_COMMIT";
      break;
    case 14:
      uint64_t result = "USER_CLASS";
      break;
    case 15:
      uint64_t result = "VENDOR_CLASS";
      break;
    case 16:
      uint64_t result = "VENDOR_OPTS";
      break;
    case 17:
      uint64_t result = "INTERFACE_ID";
      break;
    case 18:
      uint64_t result = "RECONF_MSG";
      break;
    case 19:
      uint64_t result = "RECONF_ACCEPT";
      break;
    case 20:
      uint64_t result = "SIP_SERVER_D";
      break;
    case 21:
      uint64_t result = "SIP_SERVER_A";
      break;
    case 22:
      uint64_t result = "DNS_SERVERS";
      break;
    case 23:
      uint64_t result = "DOMAIN_LIST";
      break;
    case 24:
      uint64_t result = "IA_PD";
      break;
    case 25:
      uint64_t result = "IAPREFIX";
      break;
    case 40:
      uint64_t result = "POSIX_TIMEZONE";
      break;
    case 41:
      uint64_t result = "TZDB_TIMEZONE";
      break;
    default:
      else {
LABEL_5:
      }
        uint64_t result = "<unknown>";
      break;
  }

  return result;
}

uint64_t sub_100009604(uint64_t result, uint64_t a2, int a3)
{
  *(void *)uint64_t result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = 0;
  return result;
}

uint64_t sub_100009610(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

BOOL sub_100009618(uint64_t a1, unsigned int a2, size_t __len, void *__src, char *a5)
{
  int v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
  int v7 = __len + 4;
  *a5 = 0;
  if (v6 < (int)__len + 4)
  {
    tm v11 = sub_100009480(a2);
    snprintf(a5, 0x100uLL, "No room for option %s (%d), %d < %d", v11, a2, v6, v7);
  }

  else
  {
    int v9 = (_WORD *)(*(void *)a1 + *(int *)(a1 + 12));
    *int v9 = __rev16(a2);
    v9[1] = __rev16(__len);
    if ((_DWORD)__len) {
      memmove(v9 + 2, __src, __len);
    }
    *(_DWORD *)(a1 + 12) += v7;
  }

  return v6 >= v7;
}

_OWORD *sub_1000096DC(unsigned __int16 *a1, unsigned int a2, char *a3)
{
  int v6 = a1;
  if (a2 >= 4)
  {
    while (1)
    {
      unsigned int v8 = (bswap32(v6[1]) >> 16) + 4;
      unsigned int v7 = a2 - v8;
      sub_100008DC8((uint64_t)&v10, (uint64_t)v6);
      int v6 = (unsigned __int16 *)((char *)v6 + v8);
      a2 -= v8;
      if (v7 < 4) {
        goto LABEL_5;
      }
    }

    if (a3)
    {
      sub_100009480(bswap32(*v6) >> 16);
      snprintf(a3, 0x100uLL, "truncated option %s (%d) at offset %d, left %d < need %d");
    }
  }

  else
  {
    unsigned int v7 = a2;
LABEL_5:
    if (!v7)
    {
      uint64_t result = malloc(0x10uLL);
      *uint64_t result = v10;
      return result;
    }

    if (a3) {
      snprintf(a3, 0x100uLL, "truncated buffer at offset %d\n");
    }
  }

  sub_100008CD8((uint64_t)&v10);
  return 0LL;
}

_OWORD *sub_1000097E0(uint64_t a1, int a2, char *a3)
{
  BOOL v3 = __OFSUB__(a2, 4);
  signed int v4 = a2 - 4;
  if (v4 < 0 != v3) {
    return 0LL;
  }
  else {
    return sub_1000096DC((unsigned __int16 *)(a1 + 4), v4, a3);
  }
}

void sub_1000097F8(void **a1)
{
  int v1 = *a1;
  if (*a1)
  {
    *a1 = 0LL;
    sub_100008CD8((uint64_t)v1);
    free(v1);
  }

void sub_100009834(__CFString *a1, uint64_t a2)
{
}

void sub_10000983C(__CFString *a1, uint64_t a2, int a3)
{
  uint64_t v6 = sub_100008D04(a2);
  int v7 = v6;
  CFStringAppendFormat(a1, 0LL, @"Options[%d] = {\n", v6);
  if (v7 >= 1)
  {
    for (int i = 0; i != v7; ++i)
    {
      int v9 = (unsigned __int16 *)sub_100008D20(a2, i);
      unsigned int v10 = *v9;
      unsigned int v11 = v9[1];
      if (a3 >= 1)
      {
        int v12 = a3;
        do
        {
          CFStringAppendFormat(a1, 0LL, @"  ");
          --v12;
        }

        while (v12);
      }

      CFStringAppendFormat(a1, 0LL, @"  ");
      sub_10000A134(a1, bswap32(v10) >> 16, bswap32(v11) >> 16, v9 + 2, a3);
    }
  }

  if (a3 >= 1)
  {
    do
    {
      CFStringAppendFormat(a1, 0LL, @"  ");
      --a3;
    }

    while (a3);
  }

  CFStringAppendFormat(a1, 0LL, @"}\n");
}

unsigned __int16 *sub_10000997C(uint64_t a1, int a2, unsigned int *a3, int *a4)
{
  int v8 = sub_100008D04(a1);
  int v9 = v8;
  if (a4) {
    int v10 = *a4;
  }
  else {
    int v10 = 0;
  }
  if (v10 >= v8) {
    return 0LL;
  }
  while (1)
  {
    unsigned int v11 = (unsigned __int16 *)sub_100008D20(a1, v10);
    if (a2 == bswap32(*v11) >> 16) {
      break;
    }
    if (v9 == ++v10) {
      return 0LL;
    }
  }

  if (a4) {
    *a4 = v10 + 1;
  }
  *a3 = bswap32(v11[1]) >> 16;
  return v11 + 2;
}

const void *sub_100009A24(const __CFDictionary *a1, __int16 a2)
{
  __int16 valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberSInt16Type, &valuePtr);
  if (!v3) {
    return 0LL;
  }
  CFNumberRef v4 = v3;
  Value = CFDictionaryGetValue(a1, v3);
  CFRelease(v4);
  return Value;
}

CFMutableDictionaryRef sub_100009A88(const __CFDictionary *a1)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  if (!Count) {
    return 0LL;
  }
  uint64_t v3 = Count;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v38 = Mutable;
  size_t v5 = (const void **)malloc(16 * v3);
  uint64_t v6 = &v5[v3];
  CFDictionaryGetKeysAndValues(a1, v5, v6);
  if (v3 >= 1)
  {
    uint64_t v8 = 0LL;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v34 = v7;
    int v35 = Mutable;
    int v36 = &v5[v3];
    uint64_t v37 = v5;
    do
    {
      int v9 = (const __CFString *)v5[v8];
      int v10 = (const __CFString *)v6[v8];
      if (CFStringHasPrefix(v9, @"dhcp_"))
      {
        v40.CFIndex length = CFStringGetLength(v9) - 5;
        v40.CFIndex location = 5LL;
        unsigned int v11 = sub_10000707C(v9, v40, 0x8000100u);
        if (v11)
        {
          int v12 = (char *)v11;
          uint64_t v13 = 0LL;
          while (strcasecmp(v12, *(const char **)&word_10000C480[v13 + 4]))
          {
            v13 += 8LL;
            if ((_DWORD)(v13 * 2) == 80) {
              goto LABEL_11;
            }
          }

          unsigned __int16 v14 = word_10000C480[v13];
          if (!v14)
          {
LABEL_11:
            if ((*v12 - 48) > 9 || (unsigned __int16 v14 = strtoul(v12, 0LL, 0)) == 0)
            {
              uint64_t v18 = _SC_LOG_DEFAULT();
              uint64_t v19 = _SC_syslog_os_log_mapping(5LL);
              uint64_t v20 = _os_log_pack_size(12LL);
              uint64_t v21 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
              uint64_t v22 = __error();
              uint64_t v23 = _os_log_pack_fill( v21,  v20,  *v22,  &_mh_execute_header,  "Ignoring unsupported option '%@'");
              *(_DWORD *)uint64_t v23 = v34;
              *(void *)(v23 + 4) = v9;
              uint64_t v24 = v18;
              uint64_t v25 = v19;
              uint64_t v26 = v21;
              goto LABEL_19;
            }
          }

          CFDataRef v15 = sub_100009DF8(v14, v10);
          if (v15)
          {
            CFDataRef v16 = v15;
            unsigned __int16 valuePtr = v14;
            CFNumberRef v17 = CFNumberCreate(0LL, kCFNumberSInt16Type, &valuePtr);
            CFDictionarySetValue(Mutable, v17, v16);
            CFRelease(v17);
            CFRelease(v16);
            goto LABEL_20;
          }

          uint64_t v27 = _SC_LOG_DEFAULT();
          uint64_t v28 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v27, v28))
          {
            uint64_t v29 = _os_log_pack_size(12LL);
            uint64_t v30 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL);
            uint64_t v31 = __error();
            uint64_t v32 = _os_log_pack_fill(v30, v29, *v31, &_mh_execute_header, "Failed to handle '%@'");
            *(_DWORD *)uint64_t v32 = v34;
            *(void *)(v32 + 4) = v9;
            uint64_t v24 = v27;
            uint64_t v25 = v28;
            uint64_t v26 = v30;
LABEL_19:
            __SC_log_send(5LL, v24, v25, v26);
            CFMutableDictionaryRef Mutable = v35;
          }

LABEL_20:
          free(v12);
          uint64_t v6 = v36;
          size_t v5 = v37;
        }
      }

      ++v8;
    }

    while (v8 != v3);
  }

  free(v5);
  if (!CFDictionaryGetCount(Mutable))
  {
    sub_1000069B0((const void **)&v38);
    return v38;
  }

  return Mutable;
}

CFDataRef sub_100009DF8(int a1, const __CFString *a2)
{
  int v3 = sub_1000093F4(a1);
  CFTypeID TypeID = CFDataGetTypeID();
  if (a2)
  {
    if (CFGetTypeID(a2) == TypeID) {
      return (CFDataRef)CFRetain(a2);
    }
    CFTypeID v6 = CFStringGetTypeID();
    if (CFGetTypeID(a2) == v6)
    {
      if (v3 == 6) {
        return sub_10000786C(a2);
      }
      if (v3 != 5) {
        return sub_100007164(a2);
      }
      if ((sub_100006DFC(a2, bytes) & 1) != 0) {
        return CFDataCreate(0LL, bytes, 16LL);
      }
      uint64_t v10 = _SC_LOG_DEFAULT();
      uint64_t v11 = _SC_syslog_os_log_mapping(5LL);
    }

    else
    {
      CFTypeID v7 = CFArrayGetTypeID();
      if (CFGetTypeID(a2) == v7)
      {
        if (v3 == 6) {
          return sub_1000077E4((const __CFArray *)a2, 0);
        }
        if (v3 == 5)
        {
          uint64_t v8 = (const UInt8 *)sub_100006EB0((const __CFArray *)a2, (int *)bytes);
          if (v8)
          {
            int v9 = (UInt8 *)v8;
            a2 = (const __CFString *)CFDataCreate(0LL, v8, 16LL * *(int *)bytes);
            free(v9);
            return (CFDataRef)a2;
          }

          uint64_t v10 = _SC_LOG_DEFAULT();
          uint64_t v11 = _SC_syslog_os_log_mapping(5LL);
          if (__SC_log_enabled(5LL, v10, v11))
          {
LABEL_21:
            uint64_t v12 = _os_log_pack_size(12LL);
            uint64_t v13 = &bytes[-((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
            uint64_t v14 = *__error();
            uint64_t v15 = _os_log_pack_fill(v13, v12, v14, &_mh_execute_header, "invalid IPv6 address '%@'");
            *(_DWORD *)uint64_t v15 = 138412290;
            *(void *)(v15 + 4) = a2;
            __SC_log_send(5LL, v10, v11, v13);
          }
        }
      }
    }

    return 0LL;
  }

  CFStringGetTypeID();
  CFArrayGetTypeID();
  return (CFDataRef)a2;
}

void sub_10000A134(__CFString *a1, unsigned int a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  uint64_t v10 = sub_100009480(a2);
  CFStringAppendFormat(a1, 0LL, @"%s (%d) Length %d: ", v10, a2, a3);
  switch(sub_1000093F4(a2))
  {
    case 0u:
      return;
    case 2u:
      sub_100008F70(a1, a4, a3);
      goto LABEL_51;
    case 3u:
      if (a3 >= 2)
      {
        uint64_t v11 = 0LL;
        do
        {
          unsigned int v12 = bswap32(a4[v11]);
          uint64_t v13 = HIWORD(v12);
          if ((_DWORD)(v11 * 2)) {
            uint64_t v14 = ", ";
          }
          else {
            uint64_t v14 = (const char *)&unk_10000B2A2;
          }
          if (a2 == 6)
          {
            int v35 = sub_100009480(HIWORD(v12));
            CFStringAppendFormat(a1, 0LL, @"%s%s (%d)", v14, v35, v13);
          }

          else
          {
            CFStringAppendFormat(a1, 0LL, @"%s%d", v14, HIWORD(v12), v37);
          }

          ++v11;
        }

        while ((a3 & 0xFFFE) != (_DWORD)(v11 * 2));
      }

      goto LABEL_51;
    case 4u:
      if (a3 >= 4)
      {
        uint64_t v15 = 0LL;
        int v16 = a3 & 0xFFFC;
        do
        {
          if ((_DWORD)(v15 * 2)) {
            CFNumberRef v17 = ", ";
          }
          else {
            CFNumberRef v17 = (const char *)&unk_10000B2A2;
          }
          CFStringAppendFormat(a1, 0LL, @"%s%d", v17, bswap32(*(_DWORD *)&a4[v15]));
          v15 += 2LL;
        }

        while (v16 != (_DWORD)(v15 * 2));
      }

      goto LABEL_51;
    case 5u:
      if (a3 >= 0x10)
      {
        uint64_t v18 = 0LL;
        int v19 = a3 & 0xFFF0;
        do
        {
          if ((_DWORD)(v18 * 2)) {
            uint64_t v20 = ", ";
          }
          else {
            uint64_t v20 = (const char *)&unk_10000B2A2;
          }
          uint64_t v21 = inet_ntop(30, &a4[v18], v39, 0x2Eu);
          CFStringAppendFormat(a1, 0LL, @"%s%s", v20, v21);
          v18 += 8LL;
        }

        while (v19 != (_DWORD)(v18 * 2));
      }

      goto LABEL_55;
    case 6u:
      uint64_t v22 = sub_1000078F8((uint64_t)a4, a3, (int *)v39);
      if (v22)
      {
        uint64_t v23 = v22;
        if (*(int *)v39 >= 1)
        {
          uint64_t v24 = 0LL;
          do
          {
            if (v24) {
              uint64_t v25 = ", ";
            }
            else {
              uint64_t v25 = (const char *)&unk_10000B2A2;
            }
            CFStringAppendFormat(a1, 0LL, @"%s%s", v25, *(void *)&v23[8 * v24++]);
          }

          while (v24 < *(int *)v39);
        }

        free(v23);
      }

      else
      {
        CFStringAppendFormat(a1, 0LL, @" Invalid");
LABEL_53:
        if ((_DWORD)a3)
        {
          CFStringAppendFormat(a1, 0LL, @" Data ");
          sub_100008E78(a1, (uint64_t)a4, a3);
        }
      }

LABEL_55:
      CFStringAppendFormat(a1, 0LL, @"\n", v33, v34, v37);
      return;
    case 7u:
      if (a3 <= 0xB)
      {
        CFStringAppendFormat(a1, 0LL, @" IA_NA option is too short %d < %d\n", a3, 12LL, v37);
        return;
      }

      unsigned int v26 = a3 - 12;
      CFStringAppendFormat( a1,  0LL,  @" IA_NA IAID=%d T1=%d T2=%d",  bswap32(*(_DWORD *)a4),  bswap32(*((_DWORD *)a4 + 1)),  bswap32(*((_DWORD *)a4 + 2)));
      goto LABEL_48;
    case 8u:
      sub_10000A6C0(a1, (uint64_t)a4, a3, a5);
      return;
    case 9u:
      if (a3 > 1)
      {
        unsigned int v27 = bswap32(*a4);
        uint64_t v28 = HIWORD(v27);
        uint64_t v29 = (a3 - 2);
        uint64_t v30 = sub_10000A898(HIWORD(v27));
        if ((_DWORD)v29) {
          CFStringAppendFormat(a1, 0LL, @" STATUS_CODE %s (%d) '%.*s'\n", v30, v28, v29, a4 + 1);
        }
        else {
          CFStringAppendFormat(a1, 0LL, @" STATUS_CODE %s (%d)\n", v30, v28, v37);
        }
      }

      else
      {
        CFStringAppendFormat(a1, 0LL, @" STATUS_CODE option is too short %d < %d\n", a3, 2LL, v37);
      }

      return;
    case 0xAu:
      *(void *)unsigned int v39 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)a4, a3, 0x8000100u, 0);
      CFStringAppendFormat(a1, 0LL, @" %@\n", *(void *)v39);
      sub_1000069B0((const void **)v39);
      return;
    case 0xBu:
      if (a3 > 0xB)
      {
        unsigned int v26 = a3 - 12;
        CFStringAppendFormat( a1,  0LL,  @" IA_PD IAID=%d T1=%d T2=%d",  bswap32(*(_DWORD *)a4),  bswap32(*((_DWORD *)a4 + 1)),  bswap32(*((_DWORD *)a4 + 2)));
LABEL_48:
        if (v26)
        {
          uint64_t v31 = sub_1000096DC(a4 + 6, v26, v39);
          if (v31)
          {
            uint64_t v32 = v31;
            CFStringAppendFormat(a1, 0LL, @" ");
            sub_10000983C(a1, v32, (a5 + 1));
            sub_100008CD8((uint64_t)v32);
            free(v32);
          }

          else
          {
            CFStringAppendFormat(a1, 0LL, @" options invalid:\n\t%s\n", v39, v36, v38);
          }
        }

        else
        {
LABEL_51:
          CFStringAppendFormat(a1, 0LL, @"\n");
        }
      }

      else
      {
        CFStringAppendFormat(a1, 0LL, @" IA_PD option is too short %d < %d\n", a3, 12LL, v37);
      }

      return;
    case 0xCu:
      sub_10000A7A8(a1, (uint64_t)a4, a3, a5);
      return;
    default:
      goto LABEL_53;
  }

void sub_10000A6C0(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  if ((int)a3 > 23)
  {
    unsigned int v7 = a3 - 24;
    uint64_t v8 = inet_ntop(30, (const void *)a2, v11, 0x2Eu);
    CFStringAppendFormat( theString,  0LL,  @" IAADDR %s Preferred %d Valid=%d",  v8,  bswap32(*(_DWORD *)(a2 + 16)),  bswap32(*(_DWORD *)(a2 + 20)));
    if (v7) {
      sub_10000A8C0(theString, (unsigned __int16 *)(a2 + 24), v7, a4);
    }
    else {
      CFStringAppendFormat(theString, 0LL, @"\n", v9, v10);
    }
  }

  else
  {
    CFStringAppendFormat(theString, 0LL, @" IAADDR option is too short %d < %d\n", a3, 24LL);
  }

void sub_10000A7A8(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  if ((int)a3 > 24)
  {
    unsigned int v7 = a3 - 25;
    uint64_t v8 = inet_ntop(30, (const void *)(a2 + 9), v11, 0x2Eu);
    CFStringAppendFormat( theString,  0LL,  @" IAPREFIX %s/%d Preferred %d Valid=%d",  v8,  *(unsigned __int8 *)(a2 + 8),  bswap32(*(_DWORD *)a2),  bswap32(*(_DWORD *)(a2 + 4)));
    if (v7) {
      sub_10000A8C0(theString, (unsigned __int16 *)(a2 + 25), v7, a4);
    }
    else {
      CFStringAppendFormat(theString, 0LL, @"\n", v9, v10);
    }
  }

  else
  {
    CFStringAppendFormat(theString, 0LL, @" IAPREFIX option is too short %d < %d\n", a3, 25LL);
  }

const char *sub_10000A898(unsigned int a1)
{
  if (a1 > 0x16) {
    return "<unknown>";
  }
  else {
    return (&off_10000C4D0)[(__int16)a1];
  }
}

void sub_10000A8C0(__CFString *a1, unsigned __int16 *a2, unsigned int a3, int a4)
{
  CFTypeID v6 = sub_1000096DC(a2, a3, v8);
  if (v6)
  {
    unsigned int v7 = v6;
    CFStringAppendFormat(a1, 0LL, @" ");
    sub_10000983C(a1, v7, (a4 + 1));
    sub_100008CD8((uint64_t)v7);
    free(v7);
  }

  else
  {
    CFStringAppendFormat(a1, 0LL, @" options invalid:\n\t%s\n", v8);
  }