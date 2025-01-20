os_log_t sub_10000218C(os_log_t result)
{
  if (result <= 3 && !qword_100015178)
  {
    result = os_log_create("com.apple.captive", (&off_1000106C8)[result]);
    qword_100015178 = (uint64_t)result;
  }

  return result;
}

os_log_t sub_1000021D4()
{
  os_log_t result = (os_log_t)qword_100015178;
  if (!qword_100015178)
  {
    os_log_t result = os_log_create("com.apple.captive", "Framework");
    qword_100015178 = (uint64_t)result;
  }

  return result;
}

CFDataRef sub_100002210(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0LL, propertyList, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
}

CFDataRef sub_100002228(CFPropertyListRef propertyList, _DWORD *a2)
{
  vm_address_t address = 0LL;
  *a2 = 0;
  os_log_t result = CFPropertyListCreateData(0LL, propertyList, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (result)
  {
    v4 = result;
    int Length = CFDataGetLength(result);
    if (!vm_allocate(mach_task_self_, &address, Length, 1))
    {
      v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }

    CFRelease(v4);
    return (const __CFData *)address;
  }

  return result;
}

CFDataRef sub_1000022DC(UInt8 *bytes, int a2)
{
  os_log_t result = CFDataCreateWithBytesNoCopy(0LL, bytes, a2, kCFAllocatorNull);
  if (result)
  {
    v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateWithData(0LL, result, 0LL, 0LL, 0LL);
    CFRelease(v3);
    return (const __CFData *)v4;
  }

  return result;
}

uint64_t sub_100002344(const void *a1, const void *a2)
{
  if (!a1) {
    return a2 == 0LL;
  }
  if (a2) {
    return CFEqual(a1, a2);
  }
  return 0LL;
}

CFStringRef sub_100002364(const __CFAllocator *a1)
{
  v2 = CFUUIDCreate(a1);
  CFStringRef v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void sub_1000023A4(void *context, CFDictionaryRef theDict)
{
}

void sub_1000023BC(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

CFArrayRef sub_1000023D0(const __CFArray *result)
{
  unsigned __int8 context = 1;
  if (result)
  {
    v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.location = 0LL;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)sub_100002424, &context);
    return (const __CFArray *)context;
  }

  return result;
}

CFTypeID sub_100002424(const void *a1, _BYTE *a2)
{
  CFTypeID result = CFStringGetTypeID();
  if (!a1 || (v5 = result, CFTypeID result = CFGetTypeID(a1), result != v5)) {
    *a2 = 0;
  }
  return result;
}

uint64_t sub_10000246C(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result = 0LL;
  if (theArray && a2)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v7 = v6;
      CFIndex v8 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.location = 0LL;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex)) {
          break;
        }
        if (Count == ++v8) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return result;
}

void sub_100002508(const void **a1, CFTypeRef cf)
{
  CFPropertyListRef v4 = *a1;
  if (cf) {
    CFRetain(cf);
  }
  if (v4) {
    CFRelease(v4);
  }
  *a1 = cf;
}

uint64_t sub_100002550(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    return CFBooleanGetValue(Value);
  }
  else {
    return a3;
  }
}

uint64_t sub_1000025B0(CFArrayRef *a1, const void *a2)
{
  CFRange v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.location = 0LL;
    if (CFArrayContainsValue(v3, v7, a2)) {
      return 0LL;
    }
    Mutable = v3;
  }

  else
  {
    Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    *a1 = Mutable;
  }

  CFArrayAppendValue(Mutable, a2);
  return 1LL;
}

CFIndex sub_100002634(const __CFArray *a1, const void *a2)
{
  if (!a1) {
    return -1LL;
  }
  v5.length = CFArrayGetCount(a1);
  v5.location = 0LL;
  return CFArrayGetFirstIndexOfValue(a1, v5, a2);
}

uint64_t sub_100002674(const __CFArray *a1, const void *a2, const void *a3)
{
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        int v11 = a3 == 0LL;
        if (!Value) {
          goto LABEL_7;
        }
        if (a3) {
          break;
        }
LABEL_8:
        if (v7 == ++v8) {
          return -1LL;
        }
      }

      int v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11) {
        return v8;
      }
      goto LABEL_8;
    }
  }

  return -1LL;
}

CFStringRef sub_10000270C(CFStringRef URLString)
{
  if (!URLString) {
    return 0LL;
  }
  v1 = CFURLCreateWithString(0LL, URLString, 0LL);
  if (!v1) {
    return 0LL;
  }
  v2 = v1;
  CFStringRef v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

uint64_t start()
{
  uint64_t v0 = 1LL;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.captiveagent", &_dispatch_main_q, 1uLL);
  if (mach_service)
  {
    v2 = mach_service;
    if (xpc_get_type(mach_service) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_event_handler(v2, &stru_100010708);
      xpc_connection_resume(v2);
      CFRunLoopRun();
      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return v0;
}

void sub_1000027E0(id a1, void *a2)
{
  if (a2)
  {
    if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_target_queue((xpc_connection_t)a2, &_dispatch_main_q);
      *(void *)&__int128 v5 = _NSConcreteStackBlock;
      *((void *)&v5 + 1) = 0x40000000LL;
      CFIndex v6 = sub_100002934;
      CFIndex v7 = &unk_100010728;
      CFIndex v8 = a2;
      xpc_connection_set_event_handler((xpc_connection_t)a2, &v5);
      xpc_connection_resume((xpc_connection_t)a2);
    }

    else if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
    {
      CFStringRef v3 = sub_1000021D4();
      os_log_type_t v4 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v3, v4))
      {
        LODWORD(v5) = 136315138;
        *(void *)((char *)&v5 + 4) = xpc_dictionary_get_string(a2, _xpc_error_key_description);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Got an error on the XPC listener: %s", (uint8_t *)&v5, 0xCu);
      }

      exit(1);
    }
  }
}

void sub_100002934(uint64_t a1, xpc_object_t object)
{
  if (!object) {
    return;
  }
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
    {
      unsigned __int8 context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
      if (context)
      {
        __int128 v5 = context;
        CFIndex v6 = sub_1000021D4();
        os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "service event handler found context", buf, 2u);
        }

        xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0LL);
        switch(*((_DWORD *)v5 + 4))
        {
          case 0:
            if (*((void *)v5 + 3)) {
              sub_100007068((void **)v5 + 3);
            }
            break;
          case 2:
            if (*((void *)v5 + 3)) {
              sub_1000076EC((uint64_t)(v5 + 24));
            }
            break;
          case 6:
            if (*((void *)v5 + 3)) {
              sub_100009CDC(v5 + 24);
            }
            break;
          case 8:
            if (*((void *)v5 + 3)) {
              sub_1000071D0((void ***)v5 + 3);
            }
            break;
          default:
            break;
        }

        xpc_release(*(xpc_object_t *)v5);
        xpc_release(*((xpc_object_t *)v5 + 1));
        free(v5);
      }
    }

    return;
  }

  CFIndex v8 = (void *)xpc_connection_copy_entitlement_value(*(void *)(a1 + 32), "com.apple.captiveagent.privileged");
  if (!v8) {
    goto LABEL_24;
  }
  v9 = v8;
  if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_BOOL)
  {
    xpc_release(v9);
LABEL_24:
    v32 = sub_1000021D4();
    os_log_type_t v33 = _SC_syslog_os_log_mapping(3LL);
    if (!os_log_type_enabled(v32, v33)) {
      return;
    }
    *(_WORD *)buf = 0;
    v34 = "daemon failed to authorize the requesting process.";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v32, v33, v34, buf, 2u);
    return;
  }

  BOOL value = xpc_BOOL_get_value(v9);
  xpc_release(v9);
  if (!value) {
    goto LABEL_24;
  }
  int v11 = *(void **)(a1 + 32);
  uint64_t uint64 = xpc_dictionary_get_uint64(object, "MessageType");
  BOOL v13 = xpc_dictionary_get_BOOL(object, "EnableDebug");
  sub_100007BFC(v13);
  switch(uint64)
  {
    case 0uLL:
      string = xpc_dictionary_get_string(object, "ProbeURL");
      v15 = xpc_dictionary_get_string(object, "InterfaceName");
      v16 = xpc_dictionary_get_string(object, "UserAgent");
      unsigned int v17 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      LODWORD(v18) = 0;
      if (!string || !v15 || !v16) {
        goto LABEL_115;
      }
      unsigned int v19 = v17;
      CFStringRef v20 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x8000100u);
      if (!v20) {
        goto LABEL_83;
      }
      v21 = v20;
      CFStringRef v22 = CFStringCreateWithCString(kCFAllocatorDefault, v15, 0x8000100u);
      if (!v22) {
        goto LABEL_86;
      }
      v23 = (void *)v22;
      v24 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x8000100u);
      if (!v24) {
        goto LABEL_84;
      }
      v25 = (xpc_object_t *)malloc(0x20uLL);
      if (!v25) {
        goto LABEL_84;
      }
      v26 = v25;
      v25[2] = 0LL;
      v25[3] = 0LL;
      xpc_object_t *v25 = xpc_retain(v11);
      v26[1] = xpc_retain(object);
      Current = CFRunLoopGetCurrent();
      v28 = sub_100006748(v21, v23, v24, (__CFReadStream *)0x20000, Current, v19, (uint64_t)sub_100003544, (uint64_t)v26);
      v26[3] = v28;
      if (v28) {
        goto LABEL_70;
      }
      v29 = (_xpc_connection_s *)v11;
      xpc_object_t v30 = object;
      unsigned int v31 = 1;
      goto LABEL_111;
    case 2uLL:
      *(void *)buf = 0LL;
      v35 = xpc_dictionary_get_string(object, "LoginURL");
      v36 = xpc_dictionary_get_string(object, "InterfaceName");
      v37 = xpc_dictionary_get_string(object, "UserAgent");
      data = (const UInt8 *)xpc_dictionary_get_data(object, "LoginBody", (size_t *)buf);
      LODWORD(v18) = 0;
      if (!v35) {
        goto LABEL_115;
      }
      if (!v36) {
        goto LABEL_115;
      }
      if (!v37) {
        goto LABEL_115;
      }
      v39 = data;
      if (!data || !*(void *)buf) {
        goto LABEL_115;
      }
      CFStringRef v40 = CFStringCreateWithCString(kCFAllocatorDefault, v35, 0x8000100u);
      if (!v40) {
        goto LABEL_83;
      }
      v24 = v40;
      CFStringRef v41 = CFStringCreateWithCString(kCFAllocatorDefault, v36, 0x8000100u);
      if (!v41) {
        goto LABEL_112;
      }
      CFStringRef v42 = v41;
      CFStringRef v43 = CFStringCreateWithCString(kCFAllocatorDefault, v37, 0x8000100u);
      if (v43)
      {
        Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v23 = Mutable;
        if (Mutable)
        {
          CFDictionaryAddValue(Mutable, off_100014F30, v24);
          CFDictionaryAddValue((CFMutableDictionaryRef)v23, off_100014F78, v43);
          CFDataRef v45 = CFDataCreate(kCFAllocatorDefault, v39, *(CFIndex *)buf);
          if (v45)
          {
            v46 = (char *)malloc(0x20uLL);
            xpc_object_t v18 = v46;
            if (v46)
            {
              *((_DWORD *)v46 + 7) = 0;
              *(void *)(v46 + 20) = 0LL;
              *((_DWORD *)v46 + 4) = 2;
              *(void *)v46 = xpc_retain(v11);
              *((void *)v18 + 1) = xpc_retain(object);
              v47 = CFRunLoopGetCurrent();
              v48 = sub_1000071D4((const __CFDictionary *)v23, v42, v45, v47, (uint64_t)sub_100003810, (uint64_t)v18);
              *((void *)v18 + 3) = v48;
              if (!v48)
              {
                sub_10000366C((_xpc_connection_s *)v11, object, 3u);
                xpc_release(*(xpc_object_t *)v18);
                xpc_release(*((xpc_object_t *)v18 + 1));
                free(v18);
                CFRelease(v24);
                CFRelease(v42);
                LODWORD(v18) = 0;
                goto LABEL_105;
              }

              xpc_connection_set_context((xpc_connection_t)v11, v18);
              LODWORD(v18) = 1;
            }

LABEL_104:
            CFRelease(v24);
            CFRelease(v42);
            v24 = (const __CFString *)v45;
            if (!v43) {
              goto LABEL_106;
            }
LABEL_105:
            CFRelease(v43);
            v24 = (const __CFString *)v45;
LABEL_106:
            if (v23) {
LABEL_107:
            }
              CFRelease(v23);
            if (!v24) {
              goto LABEL_115;
            }
            goto LABEL_113;
          }

LABEL_103:
          LODWORD(v18) = 0;
          goto LABEL_104;
        }
      }

      else
      {
        v23 = 0LL;
      }

      CFDataRef v45 = 0LL;
      goto LABEL_103;
    case 4uLL:
      v49 = sub_1000021D4();
      os_log_type_t v50 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v49, v50))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Got Logoff request", buf, 2u);
      }

      goto LABEL_50;
    case 6uLL:
      v53 = xpc_dictionary_get_string(object, "CredentialsURL");
      v54 = xpc_dictionary_get_string(object, "ServiceType");
      v55 = xpc_dictionary_get_string(object, "UserAgent");
      uint64_t v56 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      if (!v53) {
        goto LABEL_83;
      }
      unint64_t v57 = v56;
      CFStringRef v58 = CFStringCreateWithCString(kCFAllocatorDefault, v53, 0x8000100u);
      if (!v58) {
        goto LABEL_83;
      }
      v59 = v58;
      if (!v55 || (CFStringRef v60 = CFStringCreateWithCString(kCFAllocatorDefault, v55, 0x8000100u)) == 0LL)
      {
        CFRelease(v59);
LABEL_83:
        LODWORD(v18) = 0;
        goto LABEL_115;
      }

      v61 = v60;
      if (v54)
      {
        v54 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v54, 0x8000100u);
        if (v54)
        {
          v62 = (char *)malloc(0x20uLL);
          if (v62)
          {
            v63 = v62;
            *((_DWORD *)v62 + 7) = 0;
            *(void *)(v62 + 20) = 0LL;
            *((_DWORD *)v62 + 4) = 6;
            xpc_object_t v18 = xpc_retain(v11);
            *(void *)v63 = v18;
            *((void *)v63 + 1) = xpc_retain(object);
            v64 = sub_100009CE0(v59, v61);
            if (v64)
            {
              v65 = v64;
              v66 = CFRunLoopGetCurrent();
              v67 = sub_100008B0C( v65,  0LL,  v54,  v66,  (__CFReadStream *)sub_100003920,  (__CFReadStream *)v63,  (__CFReadStream *)0x4000,  v57,  0);
              *((void *)v63 + 3) = v67;
              if (v67)
              {
                xpc_connection_set_context((xpc_connection_t)v11, v63);
                LODWORD(v18) = 1;
                goto LABEL_99;
              }

              sub_10000366C((_xpc_connection_s *)v11, object, 7u);
              xpc_object_t v18 = *(xpc_object_t *)v63;
            }

            else
            {
              v88 = sub_1000021D4();
              os_log_type_t v89 = _SC_syslog_os_log_mapping(3LL);
              if (os_log_type_enabled(v88, v89))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v88, v89, "http_client_create_get_message() failed", buf, 2u);
              }
            }

            xpc_release(v18);
            xpc_release(*((xpc_object_t *)v63 + 1));
            free(v63);
            CFRelease(v59);
            CFRelease(v61);
            LODWORD(v18) = 0;
LABEL_123:
            v87 = v54;
            goto LABEL_114;
          }
        }
      }

      LODWORD(v18) = 0;
LABEL_99:
      CFRelease(v59);
      CFRelease(v61);
      if (!v54) {
        goto LABEL_115;
      }
      goto LABEL_123;
    case 8uLL:
      v68 = xpc_dictionary_get_string(object, "PortalAPIURI");
      v69 = xpc_dictionary_get_string(object, "InterfaceName");
      v70 = xpc_dictionary_get_string(object, "UserAgent");
      uint64_t v71 = xpc_dictionary_get_uint64(object, "ProbeTimeout");
      LODWORD(v18) = 0;
      if (!v68 || !v69 || !v70) {
        goto LABEL_115;
      }
      uint64_t v72 = v71;
      CFStringRef v73 = CFStringCreateWithCString(kCFAllocatorDefault, v68, 0x8000100u);
      if (!v73) {
        goto LABEL_83;
      }
      v21 = v73;
      CFStringRef v74 = CFStringCreateWithCString(kCFAllocatorDefault, v69, 0x8000100u);
      if (v74)
      {
        v23 = (void *)v74;
        v24 = CFStringCreateWithCString(kCFAllocatorDefault, v70, 0x8000100u);
        if (!v24 || (v75 = (char *)malloc(0x20uLL)) == 0LL)
        {
LABEL_84:
          LODWORD(v18) = 0;
          goto LABEL_85;
        }

        v26 = (xpc_object_t *)v75;
        *((_DWORD *)v75 + 7) = 0;
        *(void *)(v75 + 20) = 0LL;
        *((_DWORD *)v75 + 4) = 8;
        *(void *)v75 = xpc_retain(v11);
        v26[1] = xpc_retain(object);
        v76 = sub_10000706C((uint64_t)v21, (uint64_t)v23, (uint64_t)v24, &_dispatch_main_q, v72, sub_1000036E8, v26);
        v26[3] = v76;
        if (v76)
        {
LABEL_70:
          xpc_connection_set_context((xpc_connection_t)v11, v26);
          LODWORD(v18) = 1;
LABEL_85:
          CFRelease(v21);
          goto LABEL_107;
        }

        v29 = (_xpc_connection_s *)v11;
        xpc_object_t v30 = object;
        unsigned int v31 = 9;
LABEL_111:
        sub_10000366C(v29, v30, v31);
        xpc_release(*v26);
        xpc_release(v26[1]);
        free(v26);
        CFRelease(v21);
        CFRelease(v23);
LABEL_112:
        LODWORD(v18) = 0;
      }

      else
      {
LABEL_86:
        LODWORD(v18) = 0;
        v24 = v21;
      }

LABEL_113:
      v87 = v24;
      goto LABEL_114;
    case 0xAuLL:
      *(void *)buf = 0LL;
      v77 = xpc_dictionary_get_string(object, "TokenAuthURL");
      v78 = xpc_dictionary_get_string(object, "InterfaceName");
      v79 = xpc_dictionary_get_string(object, "UserAgent");
      v80 = (const UInt8 *)xpc_dictionary_get_data(object, "TokenAuthCredential", (size_t *)buf);
      uint64_t v81 = xpc_dictionary_get_uint64(object, "TokenAuthTimeout");
      LODWORD(v18) = 0;
      if (!v78 || !v79 || !v80 || !*(void *)buf) {
        goto LABEL_115;
      }
      uint64_t v82 = v81;
      if (v77)
      {
        v77 = (const char *)CFStringCreateWithCString(kCFAllocatorDefault, v77, 0x8000100u);
        if (!v77) {
          goto LABEL_83;
        }
      }

      CFStringRef v83 = CFStringCreateWithCString(kCFAllocatorDefault, v78, 0x8000100u);
      if (!v83)
      {
        CFStringRef v84 = 0LL;
        goto LABEL_88;
      }

      CFStringRef v84 = CFStringCreateWithCString(kCFAllocatorDefault, v79, 0x8000100u);
      if (!v84)
      {
LABEL_88:
        CFDataRef v85 = 0LL;
        goto LABEL_89;
      }

      CFDataRef v85 = CFDataCreate(kCFAllocatorDefault, v80, *(CFIndex *)buf);
      if (!v85)
      {
LABEL_89:
        LODWORD(v18) = 0;
        goto LABEL_90;
      }

      v86 = (char *)malloc(0x20uLL);
      xpc_object_t v18 = v86;
      if (v86)
      {
        *((_DWORD *)v86 + 7) = 0;
        *(void *)(v86 + 20) = 0LL;
        *((_DWORD *)v86 + 4) = 10;
        *(void *)v86 = xpc_retain(v11);
        *((void *)v18 + 1) = xpc_retain(object);
        *((void *)v18 + 3) = sub_100007A30( (uint64_t)v77,  (uint64_t)v83,  (uint64_t)v84,  (uint64_t)v85,  &_dispatch_main_q,  v82,  sub_100003AF4,  v18);
        xpc_connection_set_context((xpc_connection_t)v11, v18);
        LODWORD(v18) = 1;
      }

LABEL_90:
      if (v77) {
        CFRelease(v77);
      }
      if (v83) {
        CFRelease(v83);
      }
      if (v84) {
        CFRelease(v84);
      }
      if (v85)
      {
        v87 = v85;
LABEL_114:
        CFRelease(v87);
      }

LABEL_115:
      if ((_DWORD)v18) {
        return;
      }
LABEL_116:
      v32 = sub_1000021D4();
      os_log_type_t v33 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v32, v33))
      {
        *(_WORD *)buf = 0;
        v34 = "Failed to process request.";
        goto LABEL_26;
      }

      return;
    default:
LABEL_50:
      v51 = sub_1000021D4();
      os_log_type_t v52 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v51, v52))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Got unknown request", buf, 2u);
      }

      goto LABEL_116;
  }

void sub_100003544(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1)
  {
    *(void *)(a1 + 24) = 0LL;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      os_log_type_t v7 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 1uLL);
      xpc_dictionary_set_uint64(v7, "ResultCode", a2);
      if (a3)
      {
        CFIndex v8 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v8)
        {
          v9 = v8;
          xpc_dictionary_set_value(v7, "ProbeResultDict", v8);
          xpc_release(v9);
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)a1, v7);
      xpc_release(v7);
    }

    else
    {
      CFRange v10 = sub_1000021D4();
      os_log_type_t v11 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "xpc_dictionary_create_reply() failed.", v12, 2u);
      }
    }

    xpc_connection_set_context(*(xpc_connection_t *)a1, 0LL);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }

void sub_10000366C(_xpc_connection_s *a1, xpc_object_t original, unsigned int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    CFIndex v6 = reply;
    xpc_dictionary_set_uint64(reply, "MessageType", a3);
    xpc_dictionary_set_uint64(v6, "ResultCode", 0xDuLL);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }

void sub_1000036E8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1)
  {
    *(void *)(a1 + 24) = 0LL;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      os_log_type_t v7 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 9uLL);
      xpc_dictionary_set_uint64(v7, "ResultCode", a2);
      if (a3)
      {
        CFIndex v8 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v8)
        {
          v9 = v8;
          xpc_dictionary_set_value(v7, "APIResultDict", v8);
          xpc_release(v9);
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)a1, v7);
      xpc_release(v7);
    }

    else
    {
      CFRange v10 = sub_1000021D4();
      os_log_type_t v11 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v10, v11))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "xpc_dictionary_create_reply() failed.", v12, 2u);
      }
    }

    xpc_connection_set_context(*(xpc_connection_t *)a1, 0LL);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }

void sub_100003810(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(void *)(a1 + 24) = 0LL;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      __int128 v5 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 3uLL);
      if (a2)
      {
        CFIndex v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(a2);
        if (v6)
        {
          os_log_type_t v7 = v6;
          xpc_dictionary_set_value(v5, "LoginResultDict", v6);
          xpc_release(v7);
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)a1, v5);
      xpc_release(v5);
    }

    else
    {
      CFIndex v8 = sub_1000021D4();
      os_log_type_t v9 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v8, v9))
      {
        *(_WORD *)CFRange v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "xpc_dictionary_create_reply() failed.", v10, 2u);
      }
    }

    xpc_connection_set_context(*(xpc_connection_t *)a1, 0LL);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }

uint64_t sub_100003920(uint64_t a1, unsigned int a2, uint64_t a3, const xmlDoc *a4)
{
  if (a1)
  {
    *(void *)(a1 + 24) = 0LL;
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      CFIndex v8 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 7uLL);
      xpc_dictionary_set_uint64(v8, "ResultCode", a2);
      if (!a4) {
        goto LABEL_7;
      }
      os_log_type_t v9 = SFRXmlToDict(a4);
      if (v9)
      {
        a4 = (const xmlDoc *)v9;
        CFRange v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
        if (!v10)
        {
          unsigned int v17 = sub_1000021D4();
          os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
          if (os_log_type_enabled(v17, v18))
          {
            *(_WORD *)unsigned int v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, v18, "_CFXPCCreateXPCObjectFromCFObject failed", v19, 2u);
          }

          goto LABEL_8;
        }

        os_log_type_t v11 = v10;
        xpc_dictionary_set_value(v8, "GetCredsResultDict", v10);
        xpc_release(v11);
LABEL_7:
        xpc_connection_send_message(*(xpc_connection_t *)a1, v8);
        xpc_release(v8);
        if (!a4)
        {
LABEL_14:
          xpc_connection_set_context(*(xpc_connection_t *)a1, 0LL);
          xpc_release(*(xpc_object_t *)a1);
          xpc_release(*(xpc_object_t *)(a1 + 8));
          free((void *)a1);
          return 1LL;
        }

LABEL_8:
        CFRelease(a4);
        goto LABEL_14;
      }

      v12 = sub_1000021D4();
      os_log_type_t v13 = _SC_syslog_os_log_mapping(3LL);
      if (!os_log_type_enabled(v12, v13)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v14 = "SFRXmlToDict failed";
      v15 = buf;
    }

    else
    {
      v12 = sub_1000021D4();
      os_log_type_t v13 = _SC_syslog_os_log_mapping(3LL);
      if (!os_log_type_enabled(v12, v13)) {
        goto LABEL_14;
      }
      __int16 v21 = 0;
      v14 = "xpc_dictionary_create_reply() failed.";
      v15 = (uint8_t *)&v21;
    }

    _os_log_impl((void *)&_mh_execute_header, v12, v13, v14, v15, 2u);
    goto LABEL_14;
  }

  return 1LL;
}

void sub_100003AF4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  CFIndex v6 = sub_1000021D4();
  os_log_type_t v7 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v6, v7))
  {
    v15[0] = 67109120;
    v15[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "handle_token_auth_result received response with result code: %u",  (uint8_t *)v15,  8u);
  }

  if (a1)
  {
    CFIndex v8 = *(void **)(a1 + 24);
    if (v8)
    {
      free(v8);
      *(void *)(a1 + 24) = 0LL;
    }

    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 8));
    if (reply)
    {
      CFRange v10 = reply;
      xpc_dictionary_set_uint64(reply, "MessageType", 0xBuLL);
      xpc_dictionary_set_uint64(v10, "ResultCode", a2);
      if (a3)
      {
        os_log_type_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3);
        if (v11)
        {
          v12 = v11;
          xpc_dictionary_set_value(v10, "TokenAuthResultDict", v11);
          xpc_release(v12);
        }
      }

      xpc_connection_send_message(*(xpc_connection_t *)a1, v10);
      xpc_release(v10);
    }

    else
    {
      os_log_type_t v13 = sub_1000021D4();
      os_log_type_t v14 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "xpc_dictionary_create_reply() failed.", (uint8_t *)v15, 2u);
      }
    }

    xpc_connection_set_context(*(xpc_connection_t *)a1, 0LL);
    xpc_release(*(xpc_object_t *)a1);
    xpc_release(*(xpc_object_t *)(a1 + 8));
    free((void *)a1);
  }

LABEL_29:
    CFStringRef v41 = sub_1000021D4();
    CFStringRef v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    CFStringRef v43 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v42, v43))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "insecure token based authentication is not supported",  buf,  2u);
    }

    CFStringRef v40 = 18;
    goto LABEL_32;
  }

  if (v39)
  {
    *(_DWORD *)buf = 138412290;
    os_log_type_t v52 = self;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "%@ server certificate is trusted", buf, 0xCu);
  }

  v23 = objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v10 serverTrust]));
LABEL_7:
  v24 = (CNTokenAuthenticator *)v23;
  if (v23) {
    v25 = v20;
  }
  else {
    v25 = 0;
  }
  if (v25 != 1)
  {
    if (((v20 | v22) & 1) != 0)
    {
      v9[2](v9, 1LL, 0LL);
      goto LABEL_33;
    }

    goto LABEL_29;
  }

  v26 = sub_1000021D4();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  v28 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v27, v28))
  {
    *(_DWORD *)buf = 138477827;
    os_log_type_t v52 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "responding to challenge using credential %{private}@ for challenge",  buf,  0xCu);
  }

  ((void (**)(id, uint64_t, CNTokenAuthenticator *))v9)[2](v9, 0LL, v24);
  if (v21)
  {
    self->_tokenAuthAttempted = 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v47 currentRequest]);
    xpc_object_t v30 = (NSURL *)objc_claimAutoreleasedReturnValue([v29 URL]);
    url = self->_url;
    self->_url = v30;
  }

LABEL_33:
}

void sub_100004A7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100004A98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained sendResponseCode:*(unsigned int *)(a1 + 40) dictionary:0];
    id WeakRetained = v3;
  }
}

void sub_100004C98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100004CAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sendResponseCode:*(unsigned int *)(a1 + 48) dictionary:*(void *)(a1 + 32)];
}

LABEL_18:
    goto LABEL_19;
  }

  if (self->_tokenAuthAttempted)
  {
    os_log_type_t v11 = sub_1000021D4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    os_log_type_t v13 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v12, v13))
    {
      os_log_type_t v14 = @"none";
      if (v9) {
        v15 = v9;
      }
      else {
        v15 = @"none";
      }
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 2112;
      if (v10) {
        os_log_type_t v14 = v10;
      }
      xpc_object_t v30 = v15;
      unsigned int v31 = 2112;
      v32 = v14;
      v16 = "%@ token authentication failed error code: [%@], error description:[%@]";
      unsigned int v17 = v12;
      os_log_type_t v18 = v13;
      unsigned int v19 = 32;
      goto LABEL_17;
    }

    goto LABEL_18;
  }

LABEL_19:
}

  v11[2](v11, v17);
}

void sub_100005918( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100005934(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained handleAuthenticationChallenge:*(void *)(a1 + 32) task:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

BOOL sub_1000060E0(id a1, NSURLQueryItem *a2, unint64_t a3, BOOL *a4)
{
  os_log_type_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLQueryItem name](a2, "name", a3, a4));
  unsigned __int8 v5 = [v4 isEqualToString:@"authorized"];

  return v5;
}

CNTokenAuthenticator *sub_10000666C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v13 = a7;
  id v14 = a6;
  v15 = -[CNTokenAuthenticator initWithURLString:token:queue:responseHandler:]( objc_alloc(&OBJC_CLASS___CNTokenAuthenticator),  "initWithURLString:token:queue:responseHandler:",  a1,  a2,  v14,  v13);

  -[CNTokenAuthenticator setUserAgent:](v15, "setUserAgent:", a3);
  -[CNTokenAuthenticator setInterfaceName:](v15, "setInterfaceName:", a4);
  -[CNTokenAuthenticator setTimeoutSeconds:](v15, "setTimeoutSeconds:", a5);
  -[CNTokenAuthenticator start](v15, "start");
  return v15;
}

void sub_100006724(void *a1)
{
}

CFReadStreamRef **sub_100006748( const __CFString *a1, void *a2, const __CFString *a3, __CFReadStream *a4, __CFRunLoop *a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  v16 = malloc(0x70uLL);
  v28 = (CFReadStreamRef **)v16;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((void *)v16 + 1) = a7;
  *((void *)v16 + 2) = a8;
  *((void *)v16 + 3) = a3;
  *((void *)v16 + 7) = a2;
  *((void *)v16 + 8) = a5;
  *((void *)v16 + 12) = a4;
  if (a1) {
    CFTypeRef v17 = CFRetain(a1);
  }
  else {
    CFTypeRef v17 = 0LL;
  }
  *((void *)v16 + 6) = v17;
  if (a6)
  {
    context.version = 0LL;
    memset(&context.retain, 0, 24);
    context.info = v16;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    unsigned int v19 = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + (double)a6,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100006934,  &context);
    *((void *)v16 + 9) = v19;
    if (v19) {
      CFRunLoopAddTimer(a5, v19, kCFRunLoopCommonModes);
    }
  }

  CFRetain(*((CFTypeRef *)v16 + 3));
  CFStringRef v20 = (const void *)*((void *)v16 + 7);
  if (v20) {
    CFRetain(v20);
  }
  __int16 v21 = sub_100009CE0(a1, a3);
  if (v21)
  {
    CFStringRef v22 = v21;
    v23 = sub_100008B0C(v21, a2, 0LL, a5, (__CFReadStream *)sub_100006A34, (__CFReadStream *)v16, a4, 0LL, 0);
    *v28 = v23;
    CFRelease(v22);
    uint64_t result = v28;
    if (!*v28)
    {
      sub_100006968(&v28);
      return v28;
    }
  }

  else
  {
    sub_100006968(&v28);
    v25 = sub_1000021D4();
    os_log_type_t v26 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(context.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "http_client_create_get_message failed",  (uint8_t *)&context,  2u);
    }

    return 0LL;
  }

  return result;
}

void sub_100006934(uint64_t a1, uint64_t a2)
{
  v2 = (void *)a2;
  (*(void (**)(void, uint64_t, void))(a2 + 8))(*(void *)(a2 + 16), 6LL, 0LL);
  sub_100006968(&v2);
}

void sub_100006968(void **a1)
{
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      id v3 = (const void *)v2[3];
      if (v3)
      {
        CFRelease(v3);
        v2[3] = 0LL;
      }

      os_log_type_t v4 = (const void *)v2[5];
      if (v4)
      {
        CFRelease(v4);
        v2[5] = 0LL;
      }

      unsigned __int8 v5 = (const void *)v2[6];
      if (v5)
      {
        CFRelease(v5);
        v2[6] = 0LL;
      }

      CFIndex v6 = (const void *)v2[7];
      if (v6)
      {
        CFRelease(v6);
        v2[7] = 0LL;
      }

      os_log_type_t v7 = (const void *)v2[4];
      if (v7)
      {
        CFRelease(v7);
        v2[4] = 0LL;
      }

      CFIndex v8 = (__CFRunLoopTimer *)v2[9];
      if (v8)
      {
        CFRunLoopTimerInvalidate(v8);
        os_log_type_t v9 = (const void *)v2[9];
        if (v9)
        {
          CFRelease(v9);
          v2[9] = 0LL;
        }
      }

      CFRange v10 = (__CFRunLoopTimer *)v2[10];
      if (v10)
      {
        CFRunLoopTimerInvalidate(v10);
        os_log_type_t v11 = (const void *)v2[10];
        if (v11)
        {
          CFRelease(v11);
          v2[10] = 0LL;
        }
      }

      if (*v2) {
        sub_100009CDC(v2);
      }
      free(v2);
      *a1 = 0LL;
    }
  }

uint64_t sub_100006A34(_DWORD *a1, uint64_t a2, __CFHTTPMessage *a3, const xmlDoc *a4)
{
  os_log_type_t v7 = a1;
  *(void *)v49 = a1;
  CFIndex v8 = sub_1000021D4();
  os_log_type_t v9 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v8, v9))
  {
    else {
      CFRange v10 = off_100010840[(int)a2];
    }
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
    WORD2(buf.info) = 1024;
    *(_DWORD *)((char *)&buf.info + 6) = a2;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Result = %s (%d)", (uint8_t *)&buf, 0x12u);
    os_log_type_t v7 = *(_DWORD **)v49;
  }

  if ((_DWORD)a2 == 5) {
    goto LABEL_17;
  }
  *(void *)os_log_type_t v7 = 0LL;
  if (a2 > 0xA || ((1 << a2) & 0x580) == 0)
  {
    os_log_type_t v7 = *(_DWORD **)v49;
    goto LABEL_17;
  }

  os_log_type_t v7 = *(_DWORD **)v49;
  if (*(_DWORD *)(*(void *)v49 + 104LL)) {
    goto LABEL_17;
  }
  if (*(void *)(*(void *)v49 + 80LL))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(*(void *)v49 + 80LL), kCFRunLoopCommonModes);
    CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(*(void *)v49 + 80LL));
    os_log_type_t v7 = *(_DWORD **)v49;
    v12 = *(const void **)(*(void *)v49 + 80LL);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(*(void *)v49 + 80LL) = 0LL;
      os_log_type_t v7 = *(_DWORD **)v49;
    }
  }

  buf.version = 0LL;
  memset(&buf.retain, 0, 24);
  buf.info = v7;
  int v13 = v7[22];
  v7[22] = v13 + 1;
  if (v13 < 10)
  {
    float v38 = (double)(v13 - 1) * 0.1;
    double v39 = v38;
    double v40 = CFAbsoluteTimeGetCurrent();
    if (v13 <= 2) {
      double v39 = 0.100000001;
    }
    CFRunLoopTimerRef v41 = CFRunLoopTimerCreate( kCFAllocatorDefault,  v39 + v40,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100007E7C,  &buf);
    os_log_type_t v7 = *(_DWORD **)v49;
    *(void *)(*(void *)v49 + 80LL) = v41;
    if (v41)
    {
      CFStringRef v42 = sub_1000021D4();
      os_log_type_t v43 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v42, v43))
      {
        int v44 = *(_DWORD *)(*(void *)v49 + 88LL);
        *(_DWORD *)os_log_type_t v50 = 134218240;
        double v51 = v39;
        __int16 v52 = 1024;
        int v53 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Network Error: Scheduling timer to try again in %.2f seconds. retryCount=%d",  v50,  0x12u);
      }

      CFDataRef v45 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v45, *(CFRunLoopTimerRef *)(*(void *)v49 + 80LL), kCFRunLoopCommonModes);
      return 0LL;
    }

LABEL_17:
    v7[22] = 0;
    if (!a3)
    {
      CFIndex v18 = 0LL;
      goto LABEL_33;
    }

    CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(a3);
    CFIndex v18 = ResponseStatusCode;
    if (ResponseStatusCode > 304)
    {
      if (ResponseStatusCode == 305 || ResponseStatusCode == 407)
      {
        **(void **)v49 = 0LL;
        (*(void (**)(void, uint64_t, void))(*(void *)v49 + 8LL))( *(void *)(*(void *)v49 + 16LL),  9LL,  0LL);
LABEL_70:
        sub_100006968((void **)v49);
        return 1LL;
      }

      if (ResponseStatusCode != 307)
      {
LABEL_33:
        if (a2 > 6 || ((1 << a2) & 0x61) == 0)
        {
          if (((unint64_t)(v18 - 300) < 4 || v18 == 307)
            && (sub_100008008(*(uint64_t *)v49, a3) & 1) != 0)
          {
            return 0LL;
          }

          goto LABEL_51;
        }

        v27 = sub_10000A0D0(a4);
        if (v27)
        {
          v28 = v27;
          **(void **)v49 = 0LL;
          uint64_t v29 = *(void *)v49;
          xpc_object_t v30 = *(const void **)(*(void *)v49 + 24LL);
          if (v30)
          {
            CFDictionarySetValue(v27, off_100014F78, v30);
            uint64_t v29 = *(void *)v49;
          }

          unsigned int v31 = *(const void **)(v29 + 40);
          if (v31)
          {
            CFDictionarySetValue(v28, off_100014F80, v31);
            uint64_t v29 = *(void *)v49;
          }

          v32 = *(const void **)(v29 + 32);
          if (v32)
          {
            CFDictionarySetValue(v28, off_100014F90, v32);
            uint64_t v29 = *(void *)v49;
          }

          CFDictionarySetValue(v28, off_100014F70, *(const void **)(v29 + 48));
          (*(void (**)(void, uint64_t, __CFDictionary *))(*(void *)v49 + 8LL))( *(void *)(*(void *)v49 + 16LL),  2LL,  v28);
          CFRelease(v28);
          goto LABEL_70;
        }

        if (sub_10000ACF4(a4))
        {
          **(void **)v49 = 0LL;
          if (*(_DWORD *)(*(void *)v49 + 104LL))
          {
            if (*(_BYTE *)(*(void *)v49 + 108LL) == 1) {
              uint64_t v33 = 0LL;
            }
            else {
              uint64_t v33 = 12LL;
            }
          }

          else
          {
            uint64_t v33 = 0LL;
          }

          (*(void (**)(void, uint64_t, void))(*(void *)v49 + 8LL))( *(void *)(*(void *)v49 + 16LL),  v33,  0LL);
          goto LABEL_70;
        }

        if ((_DWORD)a2 == 5) {
          return 0LL;
        }
        Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v35 = Mutable;
        v36 = *(const void **)(*(void *)v49 + 32LL);
        if (v36) {
          CFDictionarySetValue(Mutable, off_100014F90, v36);
        }
        v37 = *(const void **)(*(void *)v49 + 48LL);
        if (v37) {
          CFDictionarySetValue(v35, off_100014F70, v37);
        }
        if ((unint64_t)(v18 - 300) <= 7 && ((1LL << (v18 - 44)) & 0x8F) != 0)
        {
        }

        else if (v18 != 200 && v18 != 511)
        {
          if (*(_DWORD *)(*(void *)v49 + 104LL))
          {
            uint64_t v47 = 3LL;
            v48 = v35;
          }

          else
          {
            uint64_t v47 = 11LL;
            v48 = 0LL;
          }

          (*(void (**)(void, uint64_t, __CFDictionary *))(*(void *)v49 + 8LL))( *(void *)(*(void *)v49 + 16LL),  v47,  v48);
          goto LABEL_74;
        }

        (*(void (**)(void, uint64_t, __CFDictionary *))(*(void *)v49 + 8LL))( *(void *)(*(void *)v49 + 16LL),  3LL,  v35);
LABEL_74:
        sub_100006968((void **)v49);
LABEL_75:
        CFRelease(v35);
        return 0LL;
      }
    }

    else if ((unint64_t)(ResponseStatusCode - 300) >= 4)
    {
      goto LABEL_33;
    }

    CFStringRef v19 = CFHTTPMessageCopyHeaderFieldValue(a3, @"Location");
    if (v19)
    {
      CFStringRef v20 = v19;
      uint64_t v21 = *(void *)v49;
      CFStringRef v22 = *(const void **)(*(void *)v49 + 40LL);
      if (v22)
      {
        CFRelease(v22);
        *(void *)(*(void *)v49 + 40LL) = 0LL;
        uint64_t v21 = *(void *)v49;
      }

      *(void *)(v21 + 40) = v20;
      if (!*(_DWORD *)(v21 + 104))
      {
        CFStringRef v23 = sub_10000270C(v20);
        if (v23)
        {
          CFStringRef v24 = v23;
          uint64_t v25 = *(void *)v49;
          os_log_type_t v26 = *(const void **)(*(void *)v49 + 32LL);
          if (v26)
          {
            CFRelease(v26);
            *(void *)(*(void *)v49 + 32LL) = 0LL;
            uint64_t v25 = *(void *)v49;
          }

          *(void *)(v25 + 32) = v24;
        }
      }
    }

    goto LABEL_33;
  }

  id v14 = sub_1000021D4();
  os_log_type_t v15 = _SC_syslog_os_log_mapping(3LL);
  if (os_log_type_enabled(v14, v15))
  {
    int v16 = *(_DWORD *)(*(void *)v49 + 88LL) - 1;
    *(_DWORD *)os_log_type_t v50 = 67109120;
    LODWORD(v51) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Network Error: Failed to retry probe. Giving up after retrying %d times",  v50,  8u);
  }

LABEL_51:
  (*(void (**)(void, uint64_t, void))(*(void *)v49 + 8LL))(*(void *)(*(void *)v49 + 16LL), a2, 0LL);
  sub_100006968((void **)v49);
  return 0LL;
}

              CFRelease(v30);
              goto LABEL_52;
            }

void **sub_10000706C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v14 = (void **)calloc(1uLL, 0x18uLL);
  CFIndex v18 = v14;
  v14[1] = a6;
  v14[2] = a7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 0x40000000LL;
  v17[2] = sub_10000713C;
  v17[3] = &unk_100010800;
  v17[4] = v14;
  os_log_type_t v15 = sub_10000B690(a1, a3, a2, a5, a4, v17);
  os_log_s *v14 = v15;
  if (!v15)
  {
    sub_100007190(&v18);
    return v18;
  }

  return v14;
}

uint64_t sub_10000713C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)v6)
  {
    sub_100006724(*(void **)v6);
    **(void **)(a1 + 32) = 0LL;
    uint64_t v6 = *(void *)(a1 + 32);
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v6 + 8))(*(void *)(v6 + 16), a2, a3);
}

void sub_100007190(void ***a1)
{
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (*v2) {
        sub_100006724(*v2);
      }
      free(v2);
      *a1 = 0LL;
    }
  }

void *sub_1000071D4( const __CFDictionary *a1, const void *a2, const void *a3, __CFRunLoop *a4, uint64_t a5, uint64_t a6)
{
  v12 = malloc(0x48uLL);
  double v39 = v12;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  v12[8] = 0LL;
  void *v12 = a5;
  v12[1] = a6;
  Value = CFDictionaryGetValue(a1, off_100014F30);
  v12[3] = Value;
  if (Value) {
    CFRetain(Value);
  }
  v12[4] = a2;
  if (a2) {
    CFRetain(a2);
  }
  id v14 = CFDictionaryGetValue(a1, off_100014F78);
  v12[5] = v14;
  if (v14) {
    CFRetain(v14);
  }
  if (a3) {
    v12[6] = CFRetain(a3);
  }
  os_log_type_t v15 = (const __CFString *)v12[3];
  if (v15)
  {
    int v16 = (const __CFString *)v12[5];
    if (v16)
    {
      CFTypeRef v17 = (const __CFData *)v12[6];
      if (v17)
      {
        CFIndex v18 = CFURLCreateWithString(kCFAllocatorDefault, v15, 0LL);
        if (v18)
        {
          CFStringRef v19 = v18;
          Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, @"POST", v18, kCFHTTPVersion1_0);
          CFRelease(v19);
          if (Request)
          {
            CFHTTPMessageSetHeaderFieldValue(Request, off_100014F78, v16);
            CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Type", @"application/x-www-form-urlencoded");
            CFHTTPMessageSetBody(Request, v17);
            CFIndex Length = CFDataGetLength(v17);
            CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", Length);
            if (v22)
            {
              CFStringRef v23 = v22;
              CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Length", v22);
              CFRelease(v23);
              CFStringRef v24 = sub_100008B0C( Request,  (void *)v12[4],  0LL,  a4,  (__CFReadStream *)sub_1000081B0,  (__CFReadStream *)v12,  (__CFReadStream *)0x20000,  0LL,  0);
              if (v24)
              {
                CFRelease(Request);
                v12[2] = v24;
                return v12;
              }

              v37 = sub_1000021D4();
              os_log_type_t v38 = _SC_syslog_os_log_mapping(3LL);
              if (os_log_type_enabled(v37, v38))
              {
                *(_WORD *)CFRunLoopTimerContext buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, v38, "http_ref failed", buf, 2u);
              }

              CFRelease(Request);
LABEL_35:
              v12[2] = 0LL;
              sub_100007638((uint64_t)&v39);
              return v39;
            }

            v32 = sub_1000021D4();
            os_log_type_t v33 = _SC_syslog_os_log_mapping(3LL);
            if (os_log_type_enabled(v32, v33))
            {
              *(_WORD *)CFRunLoopTimerContext buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, v33, "CFStringCreateWithFormat failed", buf, 2u);
            }

            CFRelease(Request);
LABEL_33:
            v34 = sub_1000021D4();
            os_log_type_t v35 = _SC_syslog_os_log_mapping(3LL);
            if (os_log_type_enabled(v34, v35))
            {
              *(_WORD *)CFRunLoopTimerContext buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, v35, "http_client_create_login_message failed", buf, 2u);
            }

            goto LABEL_35;
          }

          uint64_t v29 = sub_1000021D4();
          uint64_t v30 = _SC_syslog_os_log_mapping(3LL);
          if (!os_log_type_enabled(v29, (os_log_type_t)v30)) {
            goto LABEL_33;
          }
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          unsigned int v31 = "CFHTTPMessageCreateRequest failed";
        }

        else
        {
          uint64_t v29 = sub_1000021D4();
          LOBYTE(v30) = _SC_syslog_os_log_mapping(3LL);
          if (!os_log_type_enabled(v29, (os_log_type_t)v30)) {
            goto LABEL_33;
          }
          *(_WORD *)CFRunLoopTimerContext buf = 0;
          unsigned int v31 = "CFURLCreateWithString failed";
        }

        _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, v31, buf, 2u);
        goto LABEL_33;
      }
    }
  }

  uint64_t v25 = sub_1000021D4();
  os_log_type_t v26 = _SC_syslog_os_log_mapping(3LL);
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (const char *)&unk_10000D367;
    if (v12[3]) {
      v28 = (const char *)&unk_10000D367;
    }
    else {
      v28 = " url";
    }
    if (!v12[5]) {
      v27 = " agent";
    }
    *(_DWORD *)CFRunLoopTimerContext buf = 136315394;
    CFRunLoopTimerRef v41 = v28;
    __int16 v42 = 2080;
    os_log_type_t v43 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "wispr dictionary does not contain%s%s", buf, 0x16u);
  }

  sub_100007638((uint64_t)&v39);
  return 0LL;
}

void sub_100007638(uint64_t a1)
{
  v2 = *(void **)a1;
  id v3 = *(void **)a1;
  uint64_t v5 = v3[2];
  os_log_type_t v4 = v3 + 2;
  if (v5)
  {
    sub_100009CDC(v4);
    v2 = *(void **)a1;
  }

  uint64_t v6 = (const void *)v2[3];
  if (v6)
  {
    CFRelease(v6);
    v2[3] = 0LL;
    v2 = *(void **)a1;
  }

  os_log_type_t v7 = (const void *)v2[4];
  if (v7)
  {
    CFRelease(v7);
    v2[4] = 0LL;
    v2 = *(void **)a1;
  }

  CFIndex v8 = (const void *)v2[6];
  if (v8)
  {
    CFRelease(v8);
    v2[6] = 0LL;
    v2 = *(void **)a1;
  }

  os_log_type_t v9 = (const void *)v2[5];
  if (v9)
  {
    CFRelease(v9);
    v2[5] = 0LL;
    v2 = *(void **)a1;
  }

  CFRange v10 = (__CFRunLoopTimer *)v2[7];
  if (v10)
  {
    CFRunLoopTimerInvalidate(v10);
    v2 = *(void **)a1;
    os_log_type_t v11 = *(const void **)(*(void *)a1 + 56LL);
    if (v11)
    {
      CFRelease(v11);
      v2[7] = 0LL;
      v2 = *(void **)a1;
    }
  }

  free(v2);
  *(void *)a1 = 0LL;
}

void *sub_1000076F0(const __CFDictionary *a1, void *a2, __CFRunLoop *a3, uint64_t a4, uint64_t a5)
{
  CFRange v10 = malloc(0x18uLL);
  uint64_t v25 = v10;
  v10[1] = a5;
  v10[2] = 0LL;
  *CFRange v10 = a4;
  Value = (const __CFString *)CFDictionaryGetValue(a1, off_100014F60);
  if (!Value)
  {
    CFTypeRef v17 = sub_1000021D4();
    os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v17, v18))
    {
      __int16 v24 = 0;
      CFStringRef v19 = "login result dictionary does not contain logout URL";
      CFStringRef v20 = (uint8_t *)&v24;
      goto LABEL_13;
    }

LABEL_14:
    sub_1000078B4(&v25);
    return 0LL;
  }

  v12 = Value;
  int v13 = (const __CFString *)CFDictionaryGetValue(a1, off_100014F78);
  if (v13) {
    id v14 = v13;
  }
  else {
    id v14 = @"CaptiveNetworkSupport-??? wispr";
  }
  os_log_type_t v15 = sub_100009CE0(v12, v14);
  if (!v15)
  {
    CFTypeRef v17 = sub_1000021D4();
    os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)CFRunLoopTimerContext buf = 0;
      CFStringRef v19 = "http_client_create_get_message failed";
      CFStringRef v20 = buf;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  int v16 = v15;
  v10[2] = sub_100008B0C( v15,  a2,  0LL,  a3,  (__CFReadStream *)sub_1000078F4,  (__CFReadStream *)v10,  (__CFReadStream *)0x4000,  0LL,  0);
  CFRelease(v16);
  if (!v10[2])
  {
    CFTypeRef v17 = sub_1000021D4();
    os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v17, v18))
    {
      __int16 v22 = 0;
      CFStringRef v19 = "async_http failed";
      CFStringRef v20 = (uint8_t *)&v22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, v20, 2u);
      goto LABEL_14;
    }

    goto LABEL_14;
  }

  return v10;
}

void sub_1000078B4(void **a1)
{
  v2 = *a1;
  if (v2[2])
  {
    sub_100009CDC(v2 + 2);
    v2 = *a1;
  }

  free(v2);
  *a1 = 0LL;
}

uint64_t sub_1000078F4(void *a1, int a2, uint64_t a3, const xmlDoc *a4)
{
  id v14 = a1;
  if ((a2 == 5 || a2 == 0) && a4 != 0LL)
  {
    os_log_type_t v9 = sub_10000A0D0(a4);
    if (v9)
    {
      CFRange v10 = v9;
      Value = (const __CFString *)CFDictionaryGetValue(v9, off_100014F08);
      if (CFStringGetIntValue(Value) == 130)
      {
        v12 = (const __CFString *)CFDictionaryGetValue(v10, off_100014F10);
        uint64_t IntValue = CFStringGetIntValue(v12);
      }

      else
      {
        uint64_t IntValue = 255LL;
      }

      CFRelease(v10);
      goto LABEL_17;
    }

    if (a2 == 5) {
      return 0LL;
    }
  }

  uint64_t IntValue = 255LL;
LABEL_17:
  a1[2] = 0LL;
  ((void (*)(void, uint64_t))*a1)(a1[1], IntValue);
  sub_1000078B4(&v14);
  return 1LL;
}

void sub_1000079C4()
{
  uint64_t v0 = sub_1000021D4();
  os_log_type_t v1 = _SC_syslog_os_log_mapping(3LL);
  if (os_log_type_enabled(v0, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "not implemented", v2, 2u);
  }

void **sub_100007A30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8)
{
  int v16 = (void **)calloc(1uLL, 0x18uLL);
  CFStringRef v20 = v16;
  v16[1] = a7;
  v16[2] = a8;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 0x40000000LL;
  v19[2] = sub_100007B10;
  v19[3] = &unk_100010820;
  v19[4] = v16;
  CFTypeRef v17 = sub_10000666C(a1, a4, a3, a2, a6, a5, v19);
  __CFHTTPMessage *v16 = v17;
  if (!v17)
  {
    sub_100007190(&v20);
    return v20;
  }

  return v16;
}

uint64_t sub_100007B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000021D4();
  os_log_type_t v7 = _SC_syslog_os_log_mapping(7LL);
  if (os_log_type_enabled(v6, v7))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "token authenticator provided response with result code: %u",  (uint8_t *)v10,  8u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)v8)
  {
    sub_100006724(*(void **)v8);
    **(void **)(a1 + 32) = 0LL;
    uint64_t v8 = *(void *)(a1 + 32);
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v8 + 8))(*(void *)(v8 + 16), a2, a3);
}

uint64_t sub_100007BFC(uint64_t result)
{
  byte_100015180 = result;
  return result;
}

__CFDictionary *SFRXmlToDict(const xmlDoc *a1)
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  xmlNodePtr RootElement = xmlDocGetRootElement(a1);
  if (RootElement->type == XML_ELEMENT_NODE)
  {
    for (i = RootElement->children; i; i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE)
      {
        CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)i->name, 0x8000100u);
        if (v5)
        {
          CFStringRef v6 = v5;
          children = i->children;
          if (children)
          {
            while (1)
            {
              if (children->type == XML_TEXT_NODE)
              {
                content = (const char *)children->content;
                if (content) {
                  break;
                }
              }

              children = children->next;
              if (!children) {
                goto LABEL_9;
              }
            }

            CFStringRef v15 = CFStringCreateWithCString(kCFAllocatorDefault, content, 0x8000100u);
            if (v15)
            {
              CFStringRef v16 = v15;
              CFDictionarySetValue(Mutable, v6, v15);
              CFRelease(v16);
            }
          }

          else
          {
LABEL_9:
            os_log_type_t v9 = sub_1000021D4();
            os_log_type_t v10 = _SC_syslog_os_log_mapping(4LL);
            if (os_log_type_enabled(v9, v10))
            {
              name = i->name;
              *(_DWORD *)CFRunLoopTimerContext buf = 136315138;
              uint64_t v21 = name;
              _os_log_impl((void *)&_mh_execute_header, v9, v10, "Ignoring %s, couldn't find text entry", buf, 0xCu);
            }
          }

          CFRelease(v6);
        }

        else
        {
          v12 = sub_1000021D4();
          os_log_type_t v13 = _SC_syslog_os_log_mapping(4LL);
          if (os_log_type_enabled(v12, v13))
          {
            id v14 = i->name;
            *(_DWORD *)CFRunLoopTimerContext buf = 136315138;
            uint64_t v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Ignoring %s, couldn't allocate CFString", buf, 0xCu);
          }
        }
      }
    }
  }

  else
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    CFTypeRef v17 = sub_1000021D4();
    os_log_type_t v18 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)CFRunLoopTimerContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "badly formatted xml, root element was not a node", buf, 2u);
    }

    return 0LL;
  }

  return Mutable;
}

void sub_100007E7C(__CFRunLoopTimer *a1, uint64_t a2)
{
  os_log_type_t v13 = (void *)a2;
  id v3 = *(__CFRunLoopTimer **)(a2 + 80);
  if (v3) {
    BOOL v4 = v3 == a1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    CFRunLoopTimerInvalidate(a1);
    CFStringRef v5 = *(const void **)(a2 + 80);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a2 + 80) = 0LL;
    }
  }

  CFStringRef v6 = sub_1000021D4();
  os_log_type_t v7 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)CFRunLoopTimerContext buf = 67109120;
    int v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Retrying probe. retryCount=%d", buf, 8u);
  }

  os_log_type_t v9 = sub_100009CE0(*(CFStringRef *)(a2 + 48), *(const __CFString **)(a2 + 24));
  if (v9)
  {
    os_log_type_t v10 = v9;
    *(void *)a2 = sub_100008B0C( v9,  *(void **)(a2 + 56),  0LL,  *(__CFRunLoop **)(a2 + 64),  (__CFReadStream *)sub_100006A34,  (__CFReadStream *)a2,  *(__CFReadStream **)(a2 + 96),  0LL,  0);
    CFRelease(v10);
  }

  if (!*(void *)a2)
  {
    os_log_type_t v11 = sub_1000021D4();
    os_log_type_t v12 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)CFRunLoopTimerContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to retry probe", buf, 2u);
    }

    (*(void (**)(void, uint64_t, void))(a2 + 8))(*(void *)(a2 + 16), 1LL, 0LL);
    sub_100006968(&v13);
  }

CFStringRef sub_100008008(uint64_t a1, CFHTTPMessageRef response)
{
  if (!response) {
    return 0LL;
  }
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(response);
  CFIndex v5 = ResponseStatusCode;
  uint64_t result = CFHTTPMessageCopyHeaderFieldValue(response, @"Location");
  if (result)
  {
    os_log_type_t v7 = result;
    *(_BYTE *)(a1 + 108) = 0;
    if (CFStringCompare(result, *(CFStringRef *)(a1 + 48), 1uLL) == kCFCompareEqualTo) {
      *(_BYTE *)(a1 + 108) = 1;
    }
    int v8 = sub_100009CE0(v7, *(const __CFString **)(a1 + 24));
    if (v8)
    {
      os_log_type_t v9 = v8;
      os_log_type_t v10 = sub_1000021D4();
      os_log_type_t v11 = _SC_syslog_os_log_mapping(6LL);
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)CFRunLoopTimerContext buf = 134218242;
        CFIndex v13 = v5;
        __int16 v14 = 2112;
        int v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%ld redirect %@", buf, 0x16u);
      }

      CFRelease(v7);
      *(void *)a1 = sub_100008B0C( v9,  *(void **)(a1 + 56),  0LL,  *(__CFRunLoop **)(a1 + 64),  (__CFReadStream *)sub_100006A34,  (__CFReadStream *)a1,  *(__CFReadStream **)(a1 + 96),  0LL,  0);
      CFRelease(v9);
      if (*(void *)a1)
      {
        ++*(_DWORD *)(a1 + 104);
        return (const __CFString *)1;
      }
    }

    else
    {
      CFRelease(v7);
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_1000081B0(uint64_t a1, unsigned int a2, uint64_t a3, const xmlDoc *a4)
{
  uint64_t v41 = a1;
  if (a2 != 5)
  {
    *(void *)(a1 + 16) = 0LL;
    if (a2)
    {
      int v8 = sub_1000021D4();
      os_log_type_t v9 = _SC_syslog_os_log_mapping(6LL);
      if (!os_log_type_enabled(v8, v9)) {
        goto LABEL_22;
      }
      if (a2 > 0xA) {
        os_log_type_t v10 = "<unknown>";
      }
      else {
        os_log_type_t v10 = off_100010898[a2];
      }
      LODWORD(buf.version) = 136315394;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v10;
      WORD2(buf.info) = 1024;
      *(_DWORD *)((char *)&buf.info + 6) = a2;
      __int16 v22 = "Result = %s (%d)";
      CFStringRef v23 = v8;
      os_log_type_t v24 = v9;
      uint32_t v25 = 18;
    }

    else
    {
      CFStringRef v6 = sub_10000A0D0(a4);
      if (v6) {
        goto LABEL_9;
      }
      os_log_type_t v35 = sub_1000021D4();
      os_log_type_t v36 = _SC_syslog_os_log_mapping(6LL);
      if (!os_log_type_enabled(v35, v36)) {
        goto LABEL_22;
      }
      LOWORD(buf.version) = 0;
      __int16 v22 = "http_parser_wispr_find_and_parse failed";
      CFStringRef v23 = v35;
      os_log_type_t v24 = v36;
      uint32_t v25 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v23, v24, v22, (uint8_t *)&buf, v25);
    goto LABEL_22;
  }

  uint64_t result = (uint64_t)sub_10000A0D0(a4);
  CFStringRef v6 = (__CFDictionary *)result;
  if (result)
  {
LABEL_9:
    Value = (const __CFString *)CFDictionaryGetValue(v6, off_100014F08);
    SInt32 IntValue = CFStringGetIntValue(Value);
    CFIndex v13 = sub_1000021D4();
    os_log_type_t v14 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v13, v14))
    {
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v6;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "WISPr dict = %@", (uint8_t *)&buf, 0xCu);
    }

    if (IntValue != 140 && IntValue != 120) {
      goto LABEL_37;
    }
    int v15 = sub_1000021D4();
    os_log_type_t v16 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v15, v16))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Auth Notify...", (uint8_t *)&buf, 2u);
    }

    CFTypeRef v17 = (const __CFString *)CFDictionaryGetValue(v6, off_100014F10);
    if (CFStringGetIntValue(v17) != 201) {
      goto LABEL_37;
    }
    int v18 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v18 + 1;
    if (v18 >= 4)
    {
      CFStringRef v19 = sub_1000021D4();
      os_log_type_t v20 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(buf.version) = 0;
        uint64_t v21 = "Too many Authentication Poll Tries";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v21, (uint8_t *)&buf, 2u);
        goto LABEL_37;
      }

      goto LABEL_37;
    }

    os_log_type_t v26 = CFDictionaryGetValue(v6, off_100014F58);
    if (!v26)
    {
      CFStringRef v19 = sub_1000021D4();
      os_log_type_t v20 = _SC_syslog_os_log_mapping(5LL);
      if (os_log_type_enabled(v19, v20))
      {
        LOWORD(buf.version) = 0;
        uint64_t v21 = "loginResultsURL is NULL";
        goto LABEL_36;
      }

LABEL_37:
      CFDictionarySetValue(v6, off_100014F78, *(const void **)(a1 + 40));
      (*(void (**)(void, __CFDictionary *))a1)(*(void *)(a1 + 8), v6);
      CFRelease(v6);
      goto LABEL_38;
    }

    *(void *)(a1 + 24) = v26;
    CFRetain(v26);
    v27 = (const __CFString *)CFDictionaryGetValue(v6, off_100014F48);
    if (!v27)
    {
      if ((sub_100008728(a1) & 1) == 0)
      {
        CFRelease(v6);
        double v39 = sub_1000021D4();
        os_log_type_t v40 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(v39, v40))
        {
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "http_client_auth_poll_start failed", (uint8_t *)&buf, 2u);
        }

        return 1LL;
      }

      goto LABEL_41;
    }

    SInt32 v28 = CFStringGetIntValue(v27);
    uint64_t v29 = sub_1000021D4();
    os_log_type_t v30 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v29, v30))
    {
      LODWORD(buf.version) = 67109120;
      HIDWORD(buf.version) = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Delay of %d", (uint8_t *)&buf, 8u);
    }

    if (v28 < 31)
    {
      buf.version = 0LL;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      unsigned int v31 = *(__CFRunLoopTimer **)(a1 + 56);
      if (v31)
      {
        CFRunLoopTimerInvalidate(v31);
        v32 = *(const void **)(a1 + 56);
        if (v32)
        {
          CFRelease(v32);
          *(void *)(a1 + 56) = 0LL;
        }
      }

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(void *)(a1 + 56) = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + (double)v28,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_1000086F8,  &buf);
      v34 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v34, *(CFRunLoopTimerRef *)(a1 + 56), kCFRunLoopCommonModes);
LABEL_41:
      CFRelease(v6);
      return 1LL;
    }

    v37 = sub_1000021D4();
    os_log_type_t v38 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v37, v38))
    {
      LODWORD(buf.version) = 67109376;
      HIDWORD(buf.version) = v28;
      LOWORD(buf.info) = 1024;
      *(_DWORD *)((char *)&buf.info + 2) = 30;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  v38,  "Proxy delay %d greater than max allowed: %d",  (uint8_t *)&buf,  0xEu);
    }

    CFRelease(v6);
LABEL_22:
    (*(void (**)(void, void))a1)(*(void *)(a1 + 8), 0LL);
LABEL_38:
    sub_100007638((uint64_t)&v41);
    return 1LL;
  }

  return result;
}

uint64_t sub_1000086F8(uint64_t a1, uint64_t a2)
{
  id v3 = *(const void **)(a2 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a2 + 56) = 0LL;
  }

  return sub_100008728(a2);
}

uint64_t sub_100008728(uint64_t a1)
{
  uint64_t v10 = a1;
  v2 = sub_100009CE0(*(CFStringRef *)(a1 + 24), *(const __CFString **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = *(void **)(a1 + 32);
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    *(void *)(a1 + 16) = sub_100008B0C( v3,  v4,  0LL,  Current,  (__CFReadStream *)sub_1000081B0,  (__CFReadStream *)a1,  (__CFReadStream *)0x20000,  0LL,  0);
    CFRelease(v3);
    if (*(void *)(a1 + 16)) {
      return 1LL;
    }
  }

  else
  {
    os_log_type_t v7 = sub_1000021D4();
    os_log_type_t v8 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)CFRunLoopTimerContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "http_client_create_get_message failed", buf, 2u);
    }
  }

  (*(void (**)(void, void))a1)(*(void *)(a1 + 8), 0LL);
  sub_100007638((uint64_t)&v10);
  return 0LL;
}

void *sub_100008820(void *a1)
{
  *a1 = off_100010900;
  v2 = sub_1000021D4();
  os_log_type_t v3 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "new html parser", v7, 2u);
  }

  PushParserCtxt = htmlCreatePushParserCtxt(0LL, 0LL, 0LL, 0, 0LL, XML_CHAR_ENCODING_NONE);
  a1[1] = PushParserCtxt;
  if (PushParserCtxt)
  {
    if (byte_100015180) {
      int v5 = 67841;
    }
    else {
      int v5 = 67937;
    }
    htmlCtxtUseOptions(PushParserCtxt, v5);
  }

  return a1;
}

void *sub_1000088F4(void *a1)
{
  *a1 = off_100010900;
  v2 = (xmlParserCtxt *)a1[1];
  if (v2)
  {
    if (v2->myDoc)
    {
      xmlFreeDoc(v2->myDoc);
      v2 = (xmlParserCtxt *)a1[1];
      v2->myDoc = 0LL;
    }

    htmlFreeParserCtxt(v2);
    a1[1] = 0LL;
  }

  return a1;
}

void sub_10000894C(void *a1)
{
}

void sub_100008960(void *a1)
{
  os_log_type_t v1 = sub_1000088F4(a1);
  operator delete(v1);
}

uint64_t sub_100008974(uint64_t a1, const char *a2, int a3, int a4)
{
  BOOL v4 = *(xmlParserCtxt **)(a1 + 8);
  if (v4) {
    return htmlParseChunk(v4, a2, a3, a4);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100008988(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    return *(void *)(v1 + 16);
  }
  else {
    return 0LL;
  }
}

void *sub_1000089A0(void *a1)
{
  *a1 = off_100010930;
  v2 = sub_1000021D4();
  os_log_type_t v3 = _SC_syslog_os_log_mapping(6LL);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "new xml parser", v7, 2u);
  }

  PushParserCtxt = xmlCreatePushParserCtxt(0LL, 0LL, 0LL, 0, 0LL);
  a1[1] = PushParserCtxt;
  if (PushParserCtxt)
  {
    if (byte_100015180) {
      int v5 = 67841;
    }
    else {
      int v5 = 67937;
    }
    xmlCtxtUseOptions(PushParserCtxt, v5);
  }

  return a1;
}

void *sub_100008A70(void *a1)
{
  *a1 = off_100010930;
  v2 = (xmlParserCtxt *)a1[1];
  if (v2)
  {
    if (v2->myDoc)
    {
      xmlFreeDoc(v2->myDoc);
      v2 = (xmlParserCtxt *)a1[1];
      v2->myDoc = 0LL;
    }

    xmlFreeParserCtxt(v2);
    a1[1] = 0LL;
  }

  return a1;
}

void sub_100008ACC(void *a1)
{
  uint64_t v1 = sub_100008A70(a1);
  operator delete(v1);
}

uint64_t sub_100008AE0(uint64_t a1, const char *a2, int a3, int a4)
{
  BOOL v4 = *(xmlParserCtxt **)(a1 + 8);
  if (v4) {
    return xmlParseChunk(v4, a2, a3, a4);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100008AF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    return *(void *)(v1 + 16);
  }
  else {
    return 0LL;
  }
}

CFReadStreamRef *sub_100008B0C( __CFHTTPMessage *a1, void *a2, const void *a3, __CFRunLoop *a4, __CFReadStream *a5, __CFReadStream *a6, __CFReadStream *a7, unint64_t a8, char a9)
{
  CFTypeRef v17 = (CFReadStreamRef *)malloc(0x4050uLL);
  int v44 = v17;
  if (v17)
  {
    CFTypeRef v42 = a3;
    if (byte_100015180)
    {
      uint64_t v41 = a4;
      CFURLRef v18 = CFHTTPMessageCopyRequestURL(a1);
      CFStringRef v19 = sub_1000021D4();
      os_log_type_t v20 = _SC_syslog_os_log_mapping(7LL);
      if (os_log_type_enabled(v19, v20))
      {
        LODWORD(buf.version) = 138412546;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v18;
        WORD2(buf.info) = 2112;
        *(void **)((char *)&buf.info + 6) = a2;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@, interface=%@", (uint8_t *)&buf, 0x16u);
      }

      a4 = v41;
      if (v18) {
        CFRelease(v18);
      }
    }

    *(_OWORD *)(v17 + 2053) = 0u;
    *(_OWORD *)(v17 + 2055) = 0u;
    v17[2057] = 0LL;
    *(_OWORD *)(v17 + 2051) = 0u;
    v17[2048] = a4;
    v17[2049] = a5;
    v17[2050] = a6;
    v17[2055] = a7;
    *((_BYTE *)v17 + 16456) = a9 ^ 1;
    if (a8)
    {
      buf.version = 0LL;
      *(_OWORD *)&buf.info = (unint64_t)v17;
      buf.release = 0LL;
      buf.copyDescription = 0LL;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v22 = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + (double)a8,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100008FD0,  (CFRunLoopTimerContext *)&buf);
      v17[2052] = v22;
      if (!v22) {
        goto LABEL_42;
      }
    }

    CFReadStreamRef v23 = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, a1);
    v17[2051] = v23;
    if (!v23)
    {
      os_log_type_t v33 = sub_1000021D4();
      os_log_type_t v34 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v33, v34))
      {
        LOWORD(buf.version) = 0;
        os_log_type_t v35 = "CFReadStreamCreateForHTTPRequest failed";
        p_CFStreamClientContext buf = (uint8_t *)&buf;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, p_buf, 2u);
        goto LABEL_42;
      }

      goto LABEL_42;
    }

    CFDictionaryRef v24 = CFDictionaryCreate( kCFAllocatorDefault,  &kSCProxiesNoGlobal,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (v24)
    {
      CFDictionaryRef v25 = v24;
      uint64_t v26 = SCDynamicStoreCopyProxiesWithOptions(0LL, v24);
      v27 = a2;
      if (v26)
      {
        SInt32 v28 = (const void *)v26;
        uint64_t v29 = a4;
        os_log_type_t v30 = (const __CFArray *)SCNetworkProxiesCopyMatching(v26, 0LL, a2);
        if (v30)
        {
          unsigned int v31 = v30;
          if (CFArrayGetCount(v30) < 1)
          {
            ValueAtIndex = 0LL;
          }

          else
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v31, 0LL);
            CFRetain(ValueAtIndex);
          }

          CFRelease(v31);
        }

        else
        {
          ValueAtIndex = 0LL;
        }

        CFRelease(v28);
        CFRelease(v25);
        a4 = v29;
        if (ValueAtIndex)
        {
          if (CFDictionaryGetCount((CFDictionaryRef)ValueAtIndex) >= 1)
          {
            v37 = sub_1000021D4();
            os_log_type_t v38 = _SC_syslog_os_log_mapping(6LL);
            if (os_log_type_enabled(v37, v38))
            {
              LODWORD(buf.version) = 138412290;
              *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)ValueAtIndex;
              _os_log_impl((void *)&_mh_execute_header, v37, v38, "Applying proxy: %@", (uint8_t *)&buf, 0xCu);
            }

            CFReadStreamSetProperty(v44[2051], kCFStreamPropertyHTTPProxy, ValueAtIndex);
          }

          CFRelease(ValueAtIndex);
          CFTypeRef v17 = v44;
        }
      }

      else
      {
        CFRelease(v25);
      }
    }

    else
    {
      v27 = a2;
    }

    if (v27) {
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyBoundInterfaceIdentifier, v27);
    }
    if (v42)
    {
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyDataConnectionServiceType, v42);
      CFReadStreamSetProperty(v17[2051], kCFStreamPropertyDataContextOnDemand, kCFBooleanTrue);
    }

    buf.version = 0LL;
    *(_OWORD *)&buf.info = (unint64_t)v17;
    buf.release = 0LL;
    buf.copyDescription = 0LL;
    if (!CFReadStreamSetClient(v17[2051], 0x1BuLL, (CFReadStreamClientCallBack)sub_100009104, &buf))
    {
      os_log_type_t v33 = sub_1000021D4();
      os_log_type_t v34 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)os_log_type_t v43 = 0;
        os_log_type_t v35 = "CFReadStreamSetClient failed";
        goto LABEL_40;
      }

LABEL_42:
      sub_10000904C((uint64_t *)&v44);
      return 0LL;
    }

    CFReadStreamScheduleWithRunLoop(v17[2051], a4, kCFRunLoopCommonModes);
    double v39 = v17[2052];
    if (v39) {
      CFRunLoopAddTimer(a4, v39, kCFRunLoopCommonModes);
    }
    if (!CFReadStreamOpen(v17[2051]))
    {
      os_log_type_t v33 = sub_1000021D4();
      os_log_type_t v34 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v33, v34))
      {
        *(_WORD *)os_log_type_t v43 = 0;
        os_log_type_t v35 = "CFReadStreamOpen failed";
LABEL_40:
        p_CFStreamClientContext buf = v43;
        goto LABEL_41;
      }

      goto LABEL_42;
    }
  }

  return v17;
}

void sub_100008FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  if (a2)
  {
    os_log_type_t v3 = *(__CFReadStream **)(a2 + 16408);
    if (v3 && CFReadStreamGetStatus(v3) == kCFStreamStatusOpening)
    {
      (*(void (**)(void, uint64_t, void, void))(a2 + 16392))(*(void *)(a2 + 16400), 1LL, 0LL, 0LL);
      sub_10000904C(&v5);
    }

    else
    {
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a2 + 16416));
      BOOL v4 = *(const void **)(a2 + 16416);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a2 + 16416) = 0LL;
      }
    }
  }

void sub_10000904C(uint64_t *a1)
{
  *(void *)(*a1 + 16392) = 0LL;
  uint64_t v2 = *a1;
  os_log_type_t v3 = *(__CFReadStream **)(*a1 + 16408);
  if (v3)
  {
    CFReadStreamUnscheduleFromRunLoop(v3, *(CFRunLoopRef *)(v2 + 0x4000), kCFRunLoopCommonModes);
    CFReadStreamClose(*(CFReadStreamRef *)(*a1 + 16408));
    uint64_t v2 = *a1;
    BOOL v4 = *(const void **)(*a1 + 16408);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(v2 + 16408) = 0LL;
      uint64_t v2 = *a1;
    }
  }

  uint64_t v5 = *(void *)(v2 + 16424);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
    *(void *)(*a1 + 16424) = 0LL;
    uint64_t v2 = *a1;
  }

  CFStringRef v6 = *(__CFRunLoopTimer **)(v2 + 16416);
  if (v6)
  {
    CFRunLoopTimerInvalidate(v6);
    uint64_t v2 = *a1;
    os_log_type_t v7 = *(const void **)(*a1 + 16416);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(v2 + 16416) = 0LL;
      uint64_t v2 = *a1;
    }
  }

  free((void *)v2);
  *a1 = 0LL;
}

void sub_100009104(__CFReadStream *a1, char a2, uint64_t a3)
{
  uint64_t v3 = a3;
  char v4 = a2;
  uint64_t v106 = a3;
  if ((a2 & 8) != 0)
  {
    CFReadStreamRef v23 = CFReadStreamCopyError(a1);
    CFStringRef v19 = v23;
    if (!v23)
    {
      int v61 = 1;
LABEL_90:
      unsigned int v96 = v61;
      goto LABEL_122;
    }

    if (CFErrorGetDomain(v23) == kCFErrorDomainCFNetwork)
    {
      CFIndex Code = CFErrorGetCode(v19);
      if (Code == -1005) {
        int v24 = 8;
      }
      else {
        int v24 = 1;
      }
      if (Code == 2) {
        int v24 = 7;
      }
    }

    else if (CFErrorGetDomain(v19) == kCFErrorDomainPOSIX && CFErrorGetCode(v19) == 51)
    {
      int v24 = 8;
    }

    else if (CFErrorGetDomain(v19) == kCFErrorDomainOSStatus)
    {
      if (CFErrorGetCode(v19) == -9806)
      {
        int v24 = 14;
      }

      else
      {
        CFIndex v77 = CFErrorGetCode(v19);
        unsigned int v96 = 1;
        int v24 = 15;
      }
    }

    else
    {
      int v24 = 1;
    }

    unsigned int v96 = v24;
LABEL_116:
    CFStringRef v78 = CFErrorCopyDescription(v19);
    v79 = sub_1000021D4();
    os_log_type_t v80 = _SC_syslog_os_log_mapping(5LL);
    if (os_log_type_enabled(v79, v80))
    {
      *(_DWORD *)CFStreamClientContext buf = 138412802;
      *(void *)v108 = CFErrorGetDomain(v19);
      *(_WORD *)&v108[8] = 2048;
      *(void *)&v108[10] = CFErrorGetCode(v19);
      *(_WORD *)&v108[18] = 2112;
      CFStringRef v109 = v78;
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "kCFStreamEventErrorOccurred %@/%ld: %@", buf, 0x20u);
    }

    CFRelease(v19);
    if (v78) {
      CFRelease(v78);
    }
    CFStringRef v19 = 0LL;
    goto LABEL_121;
  }

  if ((a2 & 1) != 0)
  {
    uint64_t v5 = sub_1000021D4();
    os_log_type_t v6 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)CFStreamClientContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "kCFStreamEventOpenCompleted", buf, 2u);
    }

    os_log_type_t v7 = *(__CFRunLoopTimer **)(v3 + 16416);
    if (v7)
    {
      CFRunLoopTimerInvalidate(v7);
      os_log_type_t v8 = *(const void **)(a3 + 16416);
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a3 + 16416) = 0LL;
      }
    }
  }

  if ((v4 & 2) == 0)
  {
    int v9 = 1;
LABEL_10:
    if ((v4 & 0x10) == 0) {
      return;
    }
    unsigned int v96 = v9;
    uint64_t v10 = sub_1000021D4();
    os_log_type_t v11 = _SC_syslog_os_log_mapping(6LL);
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_14;
    }
    *(_WORD *)CFStreamClientContext buf = 0;
    os_log_type_t v12 = "kCFStreamEventEndEncountered";
    CFIndex v13 = v10;
    os_log_type_t v14 = v11;
    uint32_t v15 = 2;
    goto LABEL_13;
  }

  char v94 = v4;
  CFDictionaryRef v25 = sub_1000021D4();
  os_log_type_t v26 = _SC_syslog_os_log_mapping(6LL);
  uint64_t v3 = a3;
  v101 = (int *)(a3 + 16432);
  if (os_log_type_enabled(v25, v26))
  {
    *(_WORD *)CFStreamClientContext buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "kCFStreamEventHasBytesAvailable", buf, 2u);
  }

  if (*(void *)(a3 + 16424))
  {
    unsigned int v96 = 1;
  }

  else
  {
    BOOL v68 = *(_BYTE *)(a3 + 16456) == 0;
    v69 = operator new(0x10uLL);
    v70 = v69;
    if (v68) {
      sub_1000089A0(v69);
    }
    else {
      sub_100008820(v69);
    }
    *(void *)(a3 + 16424) = v70;
    uint64_t v71 = (__CFHTTPMessage *)CFReadStreamCopyProperty(a1, kCFStreamPropertyHTTPResponseHeader);
    uint64_t v72 = v71;
    if (v71)
    {
      CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(v71);
      if (byte_100015180)
      {
        CFDictionaryRef v74 = CFHTTPMessageCopyAllHeaderFields(v72);
        if (v74)
        {
          v75 = sub_1000021D4();
          os_log_type_t v76 = _SC_syslog_os_log_mapping(6LL);
          if (os_log_type_enabled(v75, v76))
          {
            *(_DWORD *)CFStreamClientContext buf = 67109378;
            *(_DWORD *)v108 = ResponseStatusCode;
            *(_WORD *)&v108[4] = 2112;
            *(void *)&v108[6] = v74;
            _os_log_impl((void *)&_mh_execute_header, v75, v76, "-- Headers -- Response Code: %d\n%@", buf, 0x12u);
          }

          CFRelease(v74);
        }
      }

      else
      {
        CFDataRef v85 = sub_1000021D4();
        os_log_type_t v86 = _SC_syslog_os_log_mapping(6LL);
        if (os_log_type_enabled(v85, v86))
        {
          *(_DWORD *)CFStreamClientContext buf = 67109120;
          *(_DWORD *)v108 = ResponseStatusCode;
          _os_log_impl((void *)&_mh_execute_header, v85, v86, "Response Code: %d", buf, 8u);
        }
      }

      CFRelease(v72);
      int v9 = 10;
      int v87 = 6;
      if (ResponseStatusCode == 408)
      {
        uint64_t v3 = a3;
      }

      else
      {
        uint64_t v3 = a3;
        if (ResponseStatusCode != 504)
        {
          int v87 = 0;
          int v9 = 1;
        }
      }

      char v4 = v94;
      if (ResponseStatusCode == 408 || ResponseStatusCode == 504)
      {
        if (v87)
        {
          unsigned int v96 = v9;
          CFStringRef v19 = 0LL;
          goto LABEL_122;
        }

        goto LABEL_10;
      }

      unsigned int v96 = v9;
    }

    else
    {
      unsigned int v96 = 1;
      uint64_t v3 = a3;
    }
  }

  v27 = a1;
  v97 = (void *)(v3 + 16448);
LABEL_33:
  CFIndex v28 = CFReadStreamRead(v27, (UInt8 *)v3, 0x3FFFLL);
  CFIndex v99 = v28;
  int v29 = v28;
  if (v28 < 1)
  {
    uint64_t v16 = a3;
    if (v28 < 0)
    {
      int Status = CFReadStreamGetStatus(a1);
      CFStreamError Error = CFReadStreamGetError(a1);
      v90 = sub_1000021D4();
      os_log_type_t v91 = _SC_syslog_os_log_mapping(6LL);
      BOOL v92 = os_log_type_enabled(v90, v91);
      if (Error.domain == 1)
      {
        if (!v92) {
          goto LABEL_14;
        }
        v93 = strerror(Error.error);
        *(_DWORD *)CFStreamClientContext buf = 67109634;
        *(_DWORD *)v108 = Status;
        *(_WORD *)&v108[4] = 2080;
        *(void *)&v108[6] = v93;
        *(_WORD *)&v108[14] = 1024;
        *(_DWORD *)&v108[16] = Error.error;
        os_log_type_t v12 = "CFReadStreamRead() status=%d, %s (%d)";
        CFIndex v13 = v90;
        os_log_type_t v14 = v91;
        uint32_t v15 = 24;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
LABEL_14:
        uint64_t v16 = a3;
        goto LABEL_15;
      }

      uint64_t v16 = a3;
      if (v92)
      {
        *(_DWORD *)CFStreamClientContext buf = 67109632;
        *(_DWORD *)v108 = Status;
        *(_WORD *)&v108[4] = 1024;
        *(_DWORD *)&v108[6] = Error.domain;
        *(_WORD *)&v108[10] = 1024;
        *(_DWORD *)&v108[12] = Error.error;
        _os_log_impl((void *)&_mh_execute_header, v90, v91, "CFReadStreamRead() status=%d error=(%d, %d)", buf, 0x14u);
      }
    }

LABEL_15:
    CFTypeRef v17 = a1;
    uint64_t v18 = *(void *)(v16 + 16424);
    if (v18)
    {
      (*(void (**)(uint64_t, void, void, uint64_t))(*(void *)v18 + 16LL))(v18, 0LL, 0LL, 1LL);
      CFTypeRef v17 = a1;
    }

    CFStringRef v19 = (__CFError *)CFReadStreamCopyProperty(v17, kCFStreamPropertyHTTPResponseHeader);
    CFReadStreamUnscheduleFromRunLoop( *(CFReadStreamRef *)(a3 + 16408),  *(CFRunLoopRef *)(a3 + 0x4000),  kCFRunLoopCommonModes);
    CFReadStreamClose(*(CFReadStreamRef *)(a3 + 16408));
    os_log_type_t v20 = *(const void **)(a3 + 16408);
    if (v20)
    {
      CFRelease(v20);
      *(void *)(a3 + 16408) = 0LL;
    }

    uint64_t v3 = a3;
    uint64_t v21 = *(void *)(a3 + 16424);
    if (v21)
    {
      else {
        int v22 = v96;
      }
      goto LABEL_100;
    }

    goto LABEL_122;
  }

  *(_BYTE *)(a3 + v28) = 0;
  if (byte_100015180)
  {
    os_log_type_t v30 = sub_1000021D4();
    os_log_type_t v31 = _SC_syslog_os_log_mapping(7LL);
    int v29 = v99;
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)CFStreamClientContext buf = 136315138;
      *(void *)v108 = a3;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s", buf, 0xCu);
    }
  }

  uint64_t v32 = 0LL;
  int v33 = *v101;
  int *v101 = 0;
  int v34 = 0;
  os_log_type_t v35 = (char *)a3;
  while (1)
  {
    int v100 = v34;
    uint64_t v36 = (v29 - v34);
    int v37 = *(unsigned __int8 *)(a3 + 16456);
    if (*(_BYTE *)(a3 + 16456))
    {
      if ((int)v36 < 1)
      {
        LODWORD(v38) = 0;
LABEL_59:
        int v37 = 0;
        if ((_DWORD)v36 != (_DWORD)v38 - v33) {
          int *v101 = v36 - (v38 - v33);
        }
      }

      else
      {
        uint64_t v38 = 0LL;
        uint64_t v98 = v32;
        uint64_t v102 = v36;
        v103 = &v35[v32];
        int v39 = 1;
        uint64_t v40 = v36;
        while (1)
        {
          uint64_t v41 = 0LL;
          uint64_t v105 = v40 - 1;
          uint64_t v42 = v40 <= 1 ? 1LL : v40;
          int v43 = (int)v36 <= v39 ? v39 : v36;
          int v44 = &aHtml[v33];
          while (v44[v41])
          {
            int v45 = v44[v41];
            if (__toupper(v103[v38 + v41]) != v45) {
              break;
            }
            if (v42 == ++v41)
            {
              LODWORD(v41) = v42;
              goto LABEL_53;
            }
          }

          int v43 = v38 + v41;
LABEL_53:
          os_log_type_t v35 = (char *)a3;
          LODWORD(v36) = v102;
          if (v43 == (_DWORD)v102) {
            goto LABEL_57;
          }
          int v33 = 0;
          ++v38;
          ++v39;
          uint64_t v40 = v105;
          if (v38 == v102)
          {
            LODWORD(v38) = v102;
LABEL_57:
            uint64_t v32 = v98;
            goto LABEL_59;
          }
        }

        LODWORD(v36) = v38 - v33;
        int v37 = 1;
        uint64_t v32 = v98;
      }
    }

    unint64_t v46 = *((void *)v35 + 2055);
    BOOL v47 = !v46 || (int)v36 < 1;
    if (v37)
    {
      int v48 = *(_DWORD *)(a3 + 16436);
      *(_DWORD *)(a3 + 16436) = v48 + 1;
      if (v48)
      {
        uint64_t v49 = *((void *)v35 + 2053);
        unsigned int v50 = v36;
        if ((int)v36 < 1)
        {
          (*(void (**)(uint64_t, void, void, uint64_t))(*(void *)v49 + 16LL))(v49, 0LL, 0LL, 1LL);
          uint64_t v51 = a3;
        }

        else
        {
          (*(void (**)(uint64_t, char *))(*(void *)v49 + 16LL))(v49, &v35[v32]);
          uint64_t v51 = a3;
          *(void *)(a3 + 16448) += v50;
        }

        if ((*(uint64_t (**)(void))(**(void **)(v51 + 16424) + 24LL))(*(void *)(v51 + 16424)))
        {
          int v53 = *(unsigned int (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16392);
          uint64_t v54 = *(void *)(a3 + 16400);
          uint64_t v55 = (*(uint64_t (**)(void))(**(void **)(a3 + 16424) + 24LL))(*(void *)(a3 + 16424));
          if (v53(v54, 5LL, 0LL, v55))
          {
            sub_10000904C(&v106);
            return;
          }
        }

        uint64_t v56 = *(void *)(a3 + 16424);
        if (v56) {
          (*(void (**)(uint64_t))(*(void *)v56 + 8LL))(v56);
        }
        BOOL v57 = *(_BYTE *)(a3 + 16456) == 0;
        CFStringRef v58 = operator new(0x10uLL);
        v59 = v58;
        if (v57) {
          sub_1000089A0(v58);
        }
        else {
          sub_100008820(v58);
        }
        *(void *)(a3 + 16424) = v59;
        *(void *)(a3 + 16448) = 0LL;
        (*(void (**)(void *, const char *, uint64_t, void))(*v59 + 16LL))(v59, "<HTML>", 6LL, 0LL);
        *v97 += 6LL;
        int v34 = v100 + v50 + 6;
        os_log_type_t v35 = (char *)a3;
        goto LABEL_82;
      }

      LODWORD(v36) = v36 + 6;
    }

    int v52 = v36;
    (*(void (**)(void, char *))(**((void **)v35 + 2053) + 16LL))(*((void *)v35 + 2053), &v35[v32]);
    os_log_type_t v35 = (char *)a3;
    *(void *)(a3 + 16448) += v52;
    int v34 = v52 + v100;
LABEL_82:
    int v33 = 0;
    uint64_t v32 = v34;
    int v29 = v99;
    if (v99 <= v34)
    {
      int HasBytesAvailable = CFReadStreamHasBytesAvailable(a1);
      uint64_t v3 = a3;
      v27 = a1;
      if (HasBytesAvailable) {
        goto LABEL_33;
      }
      int v9 = v96;
      char v4 = v94;
      goto LABEL_10;
    }
  }

  int v62 = v36;
  v63 = sub_1000021D4();
  os_log_type_t v64 = _SC_syslog_os_log_mapping(3LL);
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v3 = a3;
    uint64_t v65 = *(void *)(a3 + 16440);
    uint64_t v66 = *(void *)(a3 + 16448);
    *(_DWORD *)CFStreamClientContext buf = 134218496;
    *(void *)v108 = v65;
    *(_WORD *)&v108[8] = 2048;
    *(void *)&v108[10] = v66;
    *(_WORD *)&v108[18] = 1024;
    LODWORD(v109) = v62;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "exceeding maxlen of %ld. current(%lu) + length(%d)",  buf,  0x1Cu);
    CFStringRef v19 = 0LL;
    int v61 = 4;
    goto LABEL_90;
  }

  CFStringRef v19 = 0LL;
  int v22 = 4;
LABEL_100:
  unsigned int v96 = v22;
LABEL_121:
  uint64_t v3 = a3;
LABEL_122:
  uint64_t v81 = *(void (**)(uint64_t, void, __CFError *, uint64_t))(v3 + 16392);
  uint64_t v82 = *(void *)(v3 + 16400);
  uint64_t v83 = *(void *)(v3 + 16424);
  if (v83) {
    uint64_t v84 = (*(uint64_t (**)(uint64_t))(*(void *)v83 + 24LL))(v83);
  }
  else {
    uint64_t v84 = 0LL;
  }
  v81(v82, v96, v19, v84);
  sub_10000904C(&v106);
  if (v19) {
    CFRelease(v19);
  }
}

void sub_100009CB4(_Unwind_Exception *a1)
{
}

__CFHTTPMessage *sub_100009CE0(CFStringRef URLString, const __CFString *a2)
{
  char v4 = CFURLCreateWithString(kCFAllocatorDefault, URLString, 0LL);
  if (!v4)
  {
    uint64_t v5 = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, URLString, 0LL, 0LL, 0x8000100u);
    char v4 = CFURLCreateWithString(kCFAllocatorDefault, v5, 0LL);
    CFRelease(v5);
    if (!v4)
    {
      CFIndex v13 = sub_1000021D4();
      os_log_type_t v14 = _SC_syslog_os_log_mapping(3LL);
      if (os_log_type_enabled(v13, v14))
      {
        int v16 = 138412290;
        CFStringRef v17 = URLString;
        int v9 = "CFURLCreateWithString %@ failed";
        uint64_t v10 = v13;
        os_log_type_t v11 = v14;
        uint32_t v12 = 12;
        goto LABEL_9;
      }

      return 0LL;
    }
  }

  Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, @"GET", v4, kCFHTTPVersion1_0);
  CFRelease(v4);
  if (!Request)
  {
    os_log_type_t v7 = sub_1000021D4();
    uint64_t v8 = _SC_syslog_os_log_mapping(3LL);
    if (os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v16) = 0;
      int v9 = "CFHTTPMessageCreateRequest failed";
      uint64_t v10 = v7;
      os_log_type_t v11 = v8;
      uint32_t v12 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v16, v12);
      return 0LL;
    }

    return 0LL;
  }

  CFHTTPMessageSetHeaderFieldValue(Request, off_100014F78, a2);
  return Request;
}

uint64_t sub_100009EA0(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result;
  strcpy(v26, "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t!");
  if (a2 <= 0xF) {
    v26[a2] = 0;
  }
  if (result)
  {
    uint64_t v3 = a2 + 1;
    do
    {
      uint64_t v4 = *(void *)(v2 + 16);
      uint64_t v5 = sub_1000021D4();
      os_log_type_t v6 = _SC_syslog_os_log_mapping(7LL);
      BOOL v7 = os_log_type_enabled(v5, v6);
      if (v4)
      {
        if (!v7) {
          goto LABEL_15;
        }
        uint64_t v8 = *(unsigned int *)(v2 + 8);
        int v9 = "???";
        uint64_t v10 = *(void *)(v2 + 16);
        *(_DWORD *)CFStreamClientContext buf = 136315650;
        uint64_t v21 = v26;
        __int16 v22 = 2080;
        CFReadStreamRef v23 = v9;
        __int16 v24 = 2080;
        uint64_t v25 = v10;
        os_log_type_t v11 = v5;
        os_log_type_t v12 = v6;
        CFIndex v13 = "%s%s: %s";
        uint32_t v14 = 32;
      }

      else
      {
        if (!v7) {
          goto LABEL_15;
        }
        uint64_t v15 = *(unsigned int *)(v2 + 8);
        int v16 = "???";
        *(_DWORD *)CFStreamClientContext buf = 136315394;
        uint64_t v21 = v26;
        __int16 v22 = 2080;
        CFReadStreamRef v23 = v16;
        os_log_type_t v11 = v5;
        os_log_type_t v12 = v6;
        CFIndex v13 = "%s%s: <NULL>";
        uint32_t v14 = 22;
      }

      _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, buf, v14);
LABEL_15:
      if (*(void *)(v2 + 80))
      {
        CFStringRef v17 = sub_1000021D4();
        os_log_type_t v18 = _SC_syslog_os_log_mapping(7LL);
        if (os_log_type_enabled(v17, v18))
        {
          CFStringRef v19 = *(const char **)(v2 + 80);
          *(_DWORD *)CFStreamClientContext buf = 136315394;
          uint64_t v21 = v26;
          __int16 v22 = 2080;
          CFReadStreamRef v23 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%sdata:%s", buf, 0x16u);
        }
      }

      uint64_t result = *(void *)(v2 + 24);
      if (result) {
        uint64_t result = sub_100009EA0(result, v3);
      }
      uint64_t v2 = *(void *)(v2 + 48);
    }

    while (v2);
  }

  return result;
}

__CFDictionary *sub_10000A0D0(const xmlDoc *a1)
{
  xmlNodePtr RootElement = xmlDocGetRootElement(a1);
  uint64_t v3 = (__CFDictionary *)sub_10000AB70((uint64_t)RootElement, "WISPAccessGatewayParam", 0);
  if (byte_100015180)
  {
    uint64_t v4 = sub_1000021D4();
    os_log_type_t v5 = _SC_syslog_os_log_mapping(7LL);
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)CFStreamClientContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "-- XML Document --", buf, 2u);
    }

    xmlNodePtr v6 = xmlDocGetRootElement(a1);
    sub_100009EA0((uint64_t)v6, 0);
  }

  if (v3)
  {
    BOOL v7 = 0LL;
  }

  else
  {
    xmlNodePtr v14 = xmlDocGetRootElement(a1);
    uint64_t v15 = sub_10000ABF8((uint64_t)v14, 0);
    if (!v15) {
      return 0LL;
    }
    BOOL v7 = v15;
    xmlNodePtr v16 = xmlDocGetRootElement(v15);
    uint64_t v3 = (__CFDictionary *)sub_10000AB70((uint64_t)v16, "WISPAccessGatewayParam", 0);
    if (!v3) {
      goto LABEL_25;
    }
  }

  if (byte_100015180)
  {
    uint64_t v8 = sub_1000021D4();
    os_log_type_t v9 = _SC_syslog_os_log_mapping(7LL);
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)CFStreamClientContext buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "-- WISPr XML --", buf, 2u);
    }

    sub_100009EA0((uint64_t)v3, 0);
  }

  v126 = off_100014F08;
  char v127 = 4;
  v128 = off_100014F10;
  char v129 = 4;
  v130 = off_100014F18;
  char v131 = 0;
  v132 = off_100014F20;
  char v133 = 0;
  v134 = off_100014F28;
  char v135 = 0;
  v136 = off_100014F30;
  char v137 = 4;
  v138 = off_100014F38;
  char v139 = 0;
  v140 = off_100014F88;
  char v141 = 0;
  v118 = off_100014F08;
  char v119 = 4;
  v120 = off_100014F10;
  char v121 = 4;
  v122 = off_100014F40;
  char v123 = 0;
  v124 = off_100014F48;
  char v125 = 0;
  uint64_t v106 = off_100014F08;
  char v107 = 4;
  v108 = off_100014F10;
  char v109 = 4;
  v110 = off_100014F50;
  char v111 = 0;
  v112 = off_100014F58;
  char v113 = 0;
  v114 = off_100014F60;
  char v115 = 0;
  v116 = off_100014F68;
  char v117 = 0;
  char v94 = off_100014F08;
  char v95 = 4;
  unsigned int v96 = off_100014F10;
  char v97 = 4;
  uint64_t v98 = off_100014F50;
  char v99 = 0;
  int v100 = off_100014F48;
  char v101 = 0;
  uint64_t v102 = off_100014F60;
  char v103 = 0;
  v104 = off_100014F68;
  char v105 = 0;
  v88 = off_100014F08;
  char v89 = 4;
  v90 = off_100014F10;
  char v91 = 4;
  BOOL v92 = off_100014F60;
  char v93 = 0;
  uint64_t v84 = off_100014F08;
  char v85 = 4;
  os_log_type_t v86 = off_100014F10;
  char v87 = 4;
  *(void *)CFStreamClientContext buf = "Redirect";
  uint64_t v82 = &v126;
  v83[0] = 0x6400000008LL;
  v83[1] = "Proxy";
  v83[2] = &v118;
  v83[3] = 0x6E00000004LL;
  v83[4] = "AuthenticationReply";
  v83[5] = &v106;
  v83[6] = 0x7800000006LL;
  v83[7] = "LogoffReply";
  v83[8] = &v84;
  v83[9] = 0x8200000002LL;
  v83[10] = "AuthenticationPollReply";
  v83[11] = &v94;
  v83[12] = 0x8C00000006LL;
  v83[13] = "AbortLoginReply";
  v83[14] = &v88;
  v83[15] = 0x9600000003LL;
  uint64_t v10 = *((void *)v3 + 3);
  if (!v10)
  {
    os_log_type_t v11 = sub_1000021D4();
    os_log_type_t v12 = _SC_syslog_os_log_mapping(4LL);
    if (!os_log_type_enabled(v11, v12)) {
      goto LABEL_23;
    }
    *(_WORD *)v75 = 0;
    CFIndex v13 = "Invalid WISPAccessGatewayParam, no children";
    goto LABEL_21;
  }

  while (*(_DWORD *)(v10 + 8) != 1)
  {
    uint64_t v10 = *(void *)(v10 + 48);
    if (!v10)
    {
      os_log_type_t v11 = sub_1000021D4();
      os_log_type_t v12 = _SC_syslog_os_log_mapping(4LL);
      if (!os_log_type_enabled(v11, v12)) {
        goto LABEL_23;
      }
      *(_WORD *)v75 = 0;
      CFIndex v13 = "Couldn't find WISPAccessGatewayParam XML_ELEMENT_NODE child";
      goto LABEL_21;
    }
  }

  uint64_t v21 = 0LL;
  __int16 v22 = *(const char **)(v10 + 16);
  do
  {
    if (!strcasecmp(v22, *(const char **)&buf[v21 * 8]))
    {
      uint64_t v74 = *(void *)&buf[v21 * 8 + 8];
      uint64_t v26 = LODWORD(v83[v21]);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        uint64_t v3 = Mutable;
        uint64_t v28 = *(void *)(v10 + 24);
        if (v28)
        {
          while (*(_DWORD *)(v28 + 8) != 1)
          {
LABEL_52:
            uint64_t v28 = *(void *)(v28 + 48);
            if (!v28) {
              goto LABEL_59;
            }
          }

          CFStringRef v29 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(v28 + 16), 0x8000100u);
          if (!v29)
          {
            int v39 = sub_1000021D4();
            os_log_type_t v40 = _SC_syslog_os_log_mapping(4LL);
            if (os_log_type_enabled(v39, v40))
            {
              uint64_t v41 = *(void *)(v28 + 16);
              *(_DWORD *)v75 = 136315138;
              uint64_t v76 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "Ignoring %s, couldn't allocate CFString", v75, 0xCu);
            }

            goto LABEL_52;
          }

          os_log_type_t v30 = v29;
          uint64_t v31 = v26;
          uint64_t v32 = (_BYTE *)(v74 + 8);
          if ((int)v26 < 1)
          {
LABEL_40:
            int v33 = sub_1000021D4();
            os_log_type_t v34 = _SC_syslog_os_log_mapping(4LL);
            if (!os_log_type_enabled(v33, v34)) {
              goto LABEL_51;
            }
            uint64_t v35 = *(void *)(v28 + 16);
            *(_DWORD *)v75 = 136315138;
            uint64_t v76 = v35;
            uint64_t v36 = v33;
            os_log_type_t v37 = v34;
            uint64_t v38 = "Ignoring %s, unexpected parameter";
          }

          else
          {
            while (CFStringCompare(*((CFStringRef *)v32 - 1), v30, 1uLL))
            {
              v32 += 16;
              if (!--v31) {
                goto LABEL_40;
              }
            }

            uint64_t v42 = *(void *)(v28 + 24);
            if (v42)
            {
              while (1)
              {
                if (*(_DWORD *)(v42 + 8) == 3)
                {
                  int v43 = *(const char **)(v42 + 80);
                  if (v43) {
                    break;
                  }
                }

                uint64_t v42 = *(void *)(v42 + 48);
                if (!v42) {
                  goto LABEL_48;
                }
              }

              if ((*v32 & 1) == 0)
              {
                CFStringRef v47 = CFStringCreateWithCString(kCFAllocatorDefault, v43, 0x8000100u);
                if (v47)
                {
                  CFStringRef v48 = v47;
                  *v32 |= 1u;
                  CFDictionarySetValue(v3, *((const void **)v32 - 1), v47);
                  CFRelease(v48);
                }

                goto LABEL_51;
              }

              uint64_t v49 = sub_1000021D4();
              os_log_type_t v50 = _SC_syslog_os_log_mapping(4LL);
              if (os_log_type_enabled(v49, v50))
              {
                uint64_t v51 = *(void *)(v28 + 16);
                *(_DWORD *)v75 = 136315138;
                uint64_t v76 = v51;
                uint64_t v36 = v49;
                os_log_type_t v37 = v50;
                uint64_t v38 = "Ignoring %s, already found. Weird.";
                goto LABEL_50;
              }

LABEL_48:
            int v44 = sub_1000021D4();
            os_log_type_t v45 = _SC_syslog_os_log_mapping(4LL);
            if (!os_log_type_enabled(v44, v45)) {
              goto LABEL_51;
            }
            uint64_t v46 = *(void *)(v28 + 16);
            *(_DWORD *)v75 = 136315138;
            uint64_t v76 = v46;
            uint64_t v36 = v44;
            os_log_type_t v37 = v45;
            uint64_t v38 = "Ignoring %s, couldn't find text entry";
          }

LABEL_50:
          _os_log_impl((void *)&_mh_execute_header, v36, v37, v38, v75, 0xCu);
          goto LABEL_51;
        }

LABEL_59:
        if ((int)v26 >= 1)
        {
          int v52 = (_BYTE *)(v74 + 8);
          while ((*v52 & 5) != 4)
          {
            v52 += 16;
            if (!--v26) {
              goto LABEL_63;
            }
          }

          int v62 = sub_1000021D4();
          os_log_type_t v63 = _SC_syslog_os_log_mapping(3LL);
          if (!os_log_type_enabled(v62, v63)) {
            goto LABEL_82;
          }
          uint64_t v65 = *((void *)v52 - 1);
          *(_DWORD *)v75 = 138412290;
          uint64_t v76 = v65;
          os_log_type_t v64 = "Missing required parameter %@";
          goto LABEL_75;
        }

LABEL_63:
        Value = (const __CFString *)CFDictionaryGetValue(v3, off_100014F08);
        if (Value)
        {
          SInt32 IntValue = CFStringGetIntValue(Value);
          uint64_t v55 = IntValue;
          int v56 = HIDWORD(v83[v21]);
          if (IntValue != v56)
          {
            uint64_t v71 = sub_1000021D4();
            os_log_type_t v72 = _SC_syslog_os_log_mapping(4LL);
            if (os_log_type_enabled(v71, v72))
            {
              uint64_t v73 = *(void *)(v10 + 16);
              *(_DWORD *)v75 = 136315650;
              uint64_t v76 = v73;
              __int16 v77 = 1024;
              int v78 = v56;
              __int16 v79 = 2048;
              uint64_t v80 = v55;
              os_log_type_t v64 = "Message type for %s should be %d but is %ld";
              uint64_t v66 = v71;
              os_log_type_t v67 = v72;
              uint32_t v68 = 28;
              goto LABEL_81;
            }

            goto LABEL_82;
          }

          if (IntValue != 100) {
            goto LABEL_24;
          }
          BOOL v57 = (const __CFString *)CFDictionaryGetValue(v3, off_100014F30);
          CFStringRef v58 = CFURLCreateWithString(kCFAllocatorDefault, v57, 0LL);
          if (v58)
          {
            v59 = v58;
            CFStringRef v60 = CFURLCopyScheme(v58);
            CFRelease(v59);
            if (v60)
            {
              CFComparisonResult v61 = CFStringCompare(v60, @"https", 1uLL);
              CFRelease(v60);
              if (v61 == kCFCompareEqualTo) {
                goto LABEL_24;
              }
              int v62 = sub_1000021D4();
              os_log_type_t v63 = _SC_syslog_os_log_mapping(3LL);
              if (os_log_type_enabled(v62, v63))
              {
                *(_DWORD *)v75 = 138412290;
                uint64_t v76 = 0LL;
                os_log_type_t v64 = "Login scheme must be https, was: %@";
LABEL_75:
                uint64_t v66 = v62;
                os_log_type_t v67 = v63;
                uint32_t v68 = 12;
LABEL_81:
                _os_log_impl((void *)&_mh_execute_header, v66, v67, v64, v75, v68);
              }

LABEL_82:
              CFRelease(v3);
              goto LABEL_23;
            }

            v69 = sub_1000021D4();
            os_log_type_t v70 = _SC_syslog_os_log_mapping(3LL);
            if (!os_log_type_enabled(v69, v70)) {
              goto LABEL_82;
            }
            *(_WORD *)v75 = 0;
            os_log_type_t v64 = "Couldn't get scheme from loginURL";
          }

          else
          {
            v69 = sub_1000021D4();
            os_log_type_t v70 = _SC_syslog_os_log_mapping(3LL);
            if (!os_log_type_enabled(v69, v70)) {
              goto LABEL_82;
            }
            *(_WORD *)v75 = 0;
            os_log_type_t v64 = "Couldn't create loginURL";
          }
        }

        else
        {
          v69 = sub_1000021D4();
          os_log_type_t v70 = _SC_syslog_os_log_mapping(4LL);
          if (!os_log_type_enabled(v69, v70)) {
            goto LABEL_82;
          }
          *(_WORD *)v75 = 0;
          os_log_type_t v64 = "Missing message type field!";
        }

        uint64_t v66 = v69;
        os_log_type_t v67 = v70;
        uint32_t v68 = 2;
        goto LABEL_81;
      }

      os_log_type_t v11 = sub_1000021D4();
      os_log_type_t v12 = _SC_syslog_os_log_mapping(3LL);
      if (!os_log_type_enabled(v11, v12)) {
        goto LABEL_23;
      }
      *(_WORD *)v75 = 0;
      CFIndex v13 = "Failed to allocate dictionary";
LABEL_21:
      CFStringRef v17 = v11;
      os_log_type_t v18 = v12;
      uint32_t v19 = 2;
      goto LABEL_22;
    }

    v21 += 3LL;
  }

  while (v21 != 18);
  CFReadStreamRef v23 = sub_1000021D4();
  os_log_type_t v24 = _SC_syslog_os_log_mapping(4LL);
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = *(void *)(v10 + 16);
    *(_DWORD *)v75 = 136315138;
    uint64_t v76 = v25;
    CFIndex v13 = "Unknown message type: %s";
    CFStringRef v17 = v23;
    os_log_type_t v18 = v24;
    uint32_t v19 = 12;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v13, v75, v19);
  }

LABEL_23:
  uint64_t v3 = 0LL;
LABEL_24:
  if (v7) {
LABEL_25:
  }
    xmlFreeDoc(v7);
  return v3;
}

uint64_t sub_10000AB70(uint64_t a1, const char *a2, int a3)
{
  if (a3 > 10) {
    return 0LL;
  }
  uint64_t v3 = a1;
  if (a1)
  {
    uint64_t v5 = (a3 + 1);
    while (*(_DWORD *)(v3 + 8) != 1 || strcasecmp(*(const char **)(v3 + 16), a2))
    {
      uint64_t v6 = *(void *)(v3 + 24);
      if (v6)
      {
        uint64_t v7 = sub_10000AB70(v6, a2, v5);
        if (v7) {
          return v7;
        }
      }

      uint64_t v3 = *(void *)(v3 + 48);
      if (!v3) {
        return v3;
      }
    }
  }

  return v3;
}

xmlDoc *sub_10000ABF8(uint64_t a1, int a2)
{
  if (a2 > 10) {
    return 0LL;
  }
  uint64_t v2 = a1;
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = (a2 + 1);
  while (1)
  {
    if (*(_DWORD *)(v2 + 8) == 8)
    {
      for (i = *(const char **)(v2 + 80); *i; ++i)
      {
        if (*i == 60)
        {
          if (!strncmp(i, "<?xml", 5uLL))
          {
            int v5 = strlen(i);
            Memory = xmlReadMemory(i, v5, 0LL, 0LL, 67937);
            if (Memory)
            {
              uint64_t v7 = (xmlDoc *)Memory;
              xmlNodePtr RootElement = xmlDocGetRootElement(Memory);
              xmlFreeDoc(v7);
            }
          }

          break;
        }
      }
    }

    uint64_t v9 = *(void *)(v2 + 24);
    if (v9)
    {
      uint64_t v10 = sub_10000ABF8(v9, v3);
      if (v10) {
        return (xmlDoc *)v10;
      }
    }

    uint64_t v2 = *(void *)(v2 + 48);
    if (!v2) {
      return 0LL;
    }
  }

BOOL sub_10000ACF4(const xmlDoc *a1)
{
  xmlNodePtr RootElement = xmlDocGetRootElement(a1);
  uint64_t v2 = sub_10000AB70((uint64_t)RootElement, "title", 0);
  BOOL result = 0;
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      if (*(_DWORD *)(v3 + 8) == 3)
      {
        uint64_t v4 = *(const char **)(v3 + 80);
        if (v4)
        {
          if (!strcmp(v4, "Success")) {
            return 1;
          }
        }
      }
    }
  }

  return result;
}

LABEL_6:
  return v13;
}

void sub_10000B170( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000B190(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v9)
    {
      os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v11 isEqualToString:NSURLErrorDomain])
      {
        id v12 = [v9 code];

        if (v12 == (id)-1202LL)
        {
          CFIndex v13 = WeakRetained;
          uint64_t v14 = 15LL;
LABEL_46:
          [v13 sendResponseCode:v14 dictionary:0];
          goto LABEL_47;
        }
      }

      else
      {
      }

      CFStringRef v17 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v17 isEqualToString:NSURLErrorDomain])
      {
        if ([v9 code] == (id)-1003)
        {

LABEL_39:
          CFIndex v13 = WeakRetained;
          uint64_t v14 = 7LL;
          goto LABEL_46;
        }

        id v38 = [v9 code];

        if (v38 == (id)-1006LL) {
          goto LABEL_39;
        }
      }

      else
      {
      }

      os_log_type_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v18 isEqualToString:NSURLErrorDomain])
      {
        if ([v9 code] == (id)-1005)
        {

LABEL_45:
          CFIndex v13 = WeakRetained;
          uint64_t v14 = 8LL;
          goto LABEL_46;
        }

        id v39 = [v9 code];

        if (v39 == (id)-1009LL) {
          goto LABEL_45;
        }
      }

      else
      {
      }

      uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v19 isEqualToString:NSURLErrorDomain])
      {
        id v20 = [v9 code];

        if (v20 == (id)-1001LL)
        {
          CFIndex v13 = WeakRetained;
          uint64_t v14 = 6LL;
          goto LABEL_46;
        }
      }

      else
      {
      }

      CFIndex v13 = WeakRetained;
      uint64_t v14 = 13LL;
      goto LABEL_46;
    }

    if (v7)
    {
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
      BOOL v16 = (objc_opt_isKindOfClass(v8, v15) & 1) == 0 || (char *)[v8 statusCode] - 200 < (char *)0x64;
    }

    else
    {
      BOOL v16 = 0;
    }

    os_log_t v21 = sub_1000021D4();
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = _SC_syslog_os_log_mapping(6LL);
    os_log_type_t v24 = v22;
    if (os_log_type_enabled(v24, v23))
    {
      if (v16) {
        uint64_t v25 = "successful";
      }
      else {
        uint64_t v25 = "unsuccessful";
      }
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained apiURL]);
      *(_DWORD *)CFStreamClientContext buf = 136315650;
      uint64_t v42 = v25;
      __int16 v43 = 2114;
      id v44 = v8;
      __int16 v45 = 2114;
      uint64_t v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "Received %s response %{public}@ for %{public}@", buf, 0x20u);
    }

    if (!v16)
    {
      CFIndex v13 = WeakRetained;
      uint64_t v14 = 10LL;
      goto LABEL_46;
    }

    id v40 = 0LL;
    v27 = (char *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v40));
    id v28 = v40;
    os_log_t v29 = sub_1000021D4();
    os_log_type_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    os_log_type_t v31 = _SC_syslog_os_log_mapping(6LL);
    if (os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)CFStreamClientContext buf = 138543362;
      uint64_t v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Portal state: %{public}@", buf, 0xCu);
    }

    if (v27
      && (uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:off_100014F98]),
          v32,
          v32))
    {
      int v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:off_100014F98]);
      unsigned int v34 = [v33 BOOLValue];

      if (v34) {
        uint64_t v35 = 16LL;
      }
      else {
        uint64_t v35 = 0LL;
      }
      uint64_t v36 = WeakRetained;
      os_log_type_t v37 = v27;
    }

    else
    {
      uint64_t v36 = WeakRetained;
      uint64_t v35 = 10LL;
      os_log_type_t v37 = 0LL;
    }

    [v36 sendResponseCode:v35 dictionary:v37];
  }

LABEL_47:
}

CAAPIHandler *sub_10000B690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  CFIndex v13 = -[CAAPIHandler initWithURLString:queue:responseHandler:]( objc_alloc(&OBJC_CLASS___CAAPIHandler),  "initWithURLString:queue:responseHandler:",  a1,  v12,  v11);

  -[CAAPIHandler setUserAgent:](v13, "setUserAgent:", a2);
  -[CAAPIHandler setInterfaceName:](v13, "setInterfaceName:", a3);
  -[CAAPIHandler setTimeoutSeconds:](v13, "setTimeoutSeconds:", a4);
  -[CAAPIHandler fetchAPI](v13, "fetchAPI");
  return v13;
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

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return [a1 userAgent];
}