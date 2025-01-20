void sub_100004024(uint64_t a1@<X8>)
{
  mach_port_t v2;
  mach_port_t v3;
  __uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  mach_port_t port;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v2 = mach_host_self();
  port = 0;
  v3 = mach_host_self();
  if (host_get_special_port(v3, -1, 2, &port))
  {
    if (mach_memory_info( v2,  (mach_zone_name_array_t *)a1,  (mach_msg_type_number_t *)(a1 + 8),  (mach_zone_info_array_t *)(a1 + 16),  (mach_msg_type_number_t *)(a1 + 24),  (mach_memory_info_array_t *)(a1 + 32),  (mach_msg_type_number_t *)(a1 + 40)))
    {
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
        sub_100008710();
      }
    }

    else
    {
      v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (v4 >= 0x3B9ACA00)
      {
        v5 = v4 / 0x3B9ACA00;
        v6 = -2LL;
        v7 = v4 / 0x3B9ACA00;
        do
        {
          ++v6;
          v8 = v7 > 9;
          v7 /= 0xAuLL;
        }

        while (v8);
        if ((unint64_t)(v6 + 1) >= 2)
        {
          v9 = v6;
          do
          {
            v5 /= 0xAuLL;
            --v9;
          }

          while (v9);
          do
          {
            v5 *= 10LL;
            --v6;
          }

          while (v6);
        }
      }

      else
      {
        v5 = 0LL;
      }

      *(void *)(a1 + 48) = v5;
      *(_BYTE *)(a1 + 56) = 1;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR))
  {
    sub_1000086E0();
  }
}

uint64_t sub_100004194(uint64_t result)
{
  uint64_t v1 = result;
  if (*(_BYTE *)(result + 56))
  {
    vm_deallocate(mach_task_self_, *(void *)result, 8LL * *(unsigned int *)(result + 8));
    vm_deallocate(mach_task_self_, *(void *)(v1 + 16), 8LL * *(unsigned int *)(v1 + 24));
    result = vm_deallocate(mach_task_self_, *(void *)(v1 + 32), 8LL * *(unsigned int *)(v1 + 40));
  }

  *(_BYTE *)(v1 + 56) = 0;
  return result;
}

xpc_object_t sub_100004200(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(a1 + 24))
  {
    xpc_object_t result = xpc_array_create_empty();
    if (*(_DWORD *)(a1 + 8))
    {
      xpc_object_t xarray = result;
      uint64_t v3 = 0LL;
      uint64_t v4 = 0LL;
      unint64_t v5 = 0LL;
      do
      {
        xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_object_t v7 = xpc_int64_create((*(void *)(*(void *)(a1 + 16) + v3 + 24) * *(void *)(*(void *)(a1 + 16) + v3)) >> 10);
        xpc_object_t v8 = xpc_int64_create(*(void *)(*(void *)(a1 + 16) + v3));
        xpc_object_t v9 = xpc_string_create((const char *)(*(void *)a1 + v4));
        xpc_object_t v10 = xpc_int64_create(*(void *)(a1 + 48));
        xpc_object_t v11 = xpc_int64_create(*(void *)(*(void *)(a1 + 16) + v3 + 24));
        xpc_dictionary_set_value(v6, "estimated_size_kb", v7);
        xpc_dictionary_set_value(v6, "count", v8);
        xpc_dictionary_set_value(v6, "zone_elem_size_bytes", v11);
        xpc_dictionary_set_value(v6, "zone_name", v9);
        xpc_dictionary_set_value(v6, "clock_uptime_sec", v10);
        xpc_array_append_value(xarray, v6);
        if (v7) {
          xpc_release(v7);
        }
        if (v8) {
          xpc_release(v8);
        }
        if (v9) {
          xpc_release(v9);
        }
        if (v6) {
          xpc_release(v6);
        }
        if (v10) {
          xpc_release(v10);
        }
        if (v11) {
          xpc_release(v11);
        }
        ++v5;
        v4 += 80LL;
        v3 += 64LL;
      }

      while (v5 < *(unsigned int *)(a1 + 8));
      return xarray;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008740();
    }
    return 0LL;
  }

  return result;
}

xpc_object_t sub_1000043E8(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008770();
    }
    return 0LL;
  }

  uint64_t v3 = Mutable;
  uint64_t v4 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, 0LL);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_1000087A0();
    }
    return 0LL;
  }

  unint64_t v5 = v4;
  theDict = v3;
  CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_100004890, v3);
  CFRelease(v5);
  uint64_t v6 = CSSymbolicatorCreateWithMachKernel();
  uint64_t v28 = v7;
  uint64_t v29 = v6;
  if (((uint64_t (*)(void))CSIsNull)())
  {
    xpc_object_t v8 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Symbolicator is null, not including VM_KERN_SITE_KERNEL regions",  buf,  2u);
    }
  }

  xpc_object_t xarray = xpc_array_create_empty();
  if (*(_DWORD *)(a1 + 40))
  {
    uint64_t v9 = 0LL;
    for (unint64_t i = 0LL; i < *(unsigned int *)(a1 + 40); ++i)
    {
      xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_object_t v12 = xpc_int64_create(*(void *)(*(void *)(a1 + 32) + v9 + 16) >> 10);
      xpc_object_t v13 = xpc_int64_create(*(void *)(*(void *)(a1 + 32) + v9 + 56) >> 10);
      xpc_object_t v14 = xpc_int64_create(*(unsigned __int16 *)(*(void *)(a1 + 32) + v9 + 64));
      xpc_object_t v15 = xpc_int64_create(*(void *)(a1 + 48));
      xpc_dictionary_set_value(v11, "size_kb", v12);
      xpc_dictionary_set_value(v11, "peak_kb", v13);
      xpc_dictionary_set_value(v11, "vm_tag_id", v14);
      xpc_dictionary_set_value(v11, "clock_uptime_sec", v15);
      uint64_t v16 = *(void *)(a1 + 32);
      if ((*(void *)(v16 + v9) & 0x400) == 0)
      {
        switch(*(void *)(v16 + v9))
        {
          case 0u:
            xpc_object_t v17 = sub_1000048CC(*(void *)(v16 + v9 + 8));
            goto LABEL_13;
          case 1u:
            CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, (const void *)(v16 + v9 + 8));
            Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v20);
            if (!Value) {
              goto LABEL_22;
            }
            v22 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey);
            if (!v22)
            {
              if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
                sub_1000087FC(&v36, v37);
              }
              goto LABEL_24;
            }

            CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
            xpc_object_t v19 = xpc_string_create(CStringPtr);
            if (v19) {
              goto LABEL_14;
            }
            goto LABEL_22;
          case 2u:
            if ((CSIsNull(v29, v28) & 1) != 0) {
              goto LABEL_21;
            }
            uint64_t SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime( v29,  v28,  *(void *)(*(void *)(a1 + 32) + v9 + 8),  0x8000000000000000LL);
            uint64_t v26 = v25;
            if (!CSIsNull(SymbolWithAddressAtTime, v25))
            {
              Name = (const char *)CSSymbolGetName(SymbolWithAddressAtTime, v26);
              goto LABEL_12;
            }

            if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
              sub_100008828(&v34, v35);
            }
            xpc_object_t v19 = 0LL;
            if (!v12) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 3u:
            xpc_object_t v17 = sub_100004A04(*(void *)(v16 + v9 + 8));
            goto LABEL_13;
          default:
LABEL_21:
            CFNumberRef v20 = 0LL;
            goto LABEL_22;
        }
      }

      Name = (const char *)(v16 + v9 + 96);
LABEL_12:
      xpc_object_t v17 = xpc_string_create(Name);
LABEL_13:
      xpc_object_t v19 = v17;
      CFNumberRef v20 = 0LL;
      if (v17)
      {
LABEL_14:
        xpc_dictionary_set_value(v11, "name", v19);
        xpc_array_append_value(xarray, v11);
        if (!v20) {
          goto LABEL_26;
        }
      }

      else
      {
LABEL_22:
        if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
          sub_1000087D0(&v32, v33);
        }
LABEL_24:
        xpc_object_t v19 = 0LL;
        if (!v20) {
          goto LABEL_26;
        }
      }

      CFRelease(v20);
LABEL_26:
      if (v12) {
LABEL_27:
      }
        xpc_release(v12);
LABEL_28:
      if (v13) {
        xpc_release(v13);
      }
      if (v14) {
        xpc_release(v14);
      }
      if (v15) {
        xpc_release(v15);
      }
      if (v19) {
        xpc_release(v19);
      }
      if (v11) {
        xpc_release(v11);
      }
      v9 += 176LL;
    }
  }

  CFRelease(theDict);
  if ((CSIsNull(v29, v28) & 1) == 0) {
    CSRelease(v29, v28);
  }
  return xarray;
}

void sub_100004890(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  Value = CFDictionaryGetValue(theDict, @"OSBundleLoadTag");
  CFDictionarySetValue(a3, Value, theDict);
}

xpc_object_t sub_1000048CC(unint64_t a1)
{
  if (a1 <= 0x24) {
    return xpc_string_create_with_format("VM_KERN_MEMORY_%s");
  }
  if (a1 == 256) {
    return xpc_string_create("VM_KERN_MEMORY_COUNT");
  }
  if (a1 == 255) {
    return xpc_string_create("VM_KERN_MEMORY_ANY");
  }
  uint64_t v3 = (os_log_s *)qword_100010EB8;
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v5 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "unrecognized vm kern memory tag %lld",  buf,  0xCu);
  }

  return xpc_string_create_with_format("VM_KERN_MEMORY_%lld");
}

xpc_object_t sub_100004A04(unint64_t a1)
{
  if (a1 <= 0xD) {
    return xpc_string_create_with_format("VM_KERN_COUNT_%s");
  }
  uint64_t v3 = (os_log_s *)qword_100010EB8;
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unrecognized vm kern count tag %lld", buf, 0xCu);
  }

  return xpc_string_create_with_format("VM_KERN_COUNT_%lld");
}

void sub_100004AD8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

_BYTE *sub_100004AF8(_BYTE *result, _BYTE *a2)
{
  *xpc_object_t result = 0;
  *a2 = 0;
  return result;
}

void sub_100004B08(int a1)
{
  if (BYTE8(v24))
  {
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    v20[3] = v24;
    xpc_object_t v2 = sub_100004200((uint64_t)v20);
    v19[0] = v21;
    v19[1] = v22;
    v19[2] = v23;
    v19[3] = v24;
    xpc_object_t v3 = sub_1000043E8((uint64_t)v19);
    if (v2)
    {
      if (xpc_array_get_count(v2))
      {
        size_t v4 = 0LL;
        do
        {
          xpc_object_t value = xpc_array_get_value(v2, v4);
          if (a1)
          {
            analytics_send_event("com.apple.memorytools.stats.zoneinfo", value);
          }

          else
          {
            uint64_t v6 = xpc_copy_description(value);
            uint64_t v7 = (os_log_s *)qword_100010EB8;
            if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              size_t v26 = (size_t)v6;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }

            free(v6);
          }

          ++v4;
        }

        while (xpc_array_get_count(v2) > v4);
      }

      xpc_object_t v8 = (os_log_s *)qword_100010EB8;
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
      {
        size_t count = xpc_array_get_count(v2);
        xpc_object_t v10 = "os_log";
        if (a1) {
          xpc_object_t v10 = "Core Analytics";
        }
        *(_DWORD *)buf = 134218242;
        size_t v26 = count;
        __int16 v27 = 2080;
        uint64_t v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send %zu zones to %s", buf, 0x16u);
      }

      xpc_release(v2);
      if (!v3) {
        goto LABEL_35;
      }
LABEL_21:
      if (xpc_array_get_count(v3))
      {
        size_t v11 = 0LL;
        do
        {
          xpc_object_t v12 = xpc_array_get_value(v3, v11);
          if (a1)
          {
            analytics_send_event("com.apple.memorytools.stats.vmkerninfo", v12);
          }

          else
          {
            xpc_object_t v13 = xpc_copy_description(v12);
            xpc_object_t v14 = (os_log_s *)qword_100010EB8;
            if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              size_t v26 = (size_t)v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }

            free(v13);
          }

          ++v11;
        }

        while (xpc_array_get_count(v3) > v11);
      }

      xpc_object_t v15 = (os_log_s *)qword_100010EB8;
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
      {
        size_t v16 = xpc_array_get_count(v3);
        xpc_object_t v17 = "os_log";
        if (a1) {
          xpc_object_t v17 = "Core Analytics";
        }
        *(_DWORD *)buf = 134218242;
        size_t v26 = v16;
        __int16 v27 = 2080;
        uint64_t v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Send %zu vm regions to %s", buf, 0x16u);
      }

      xpc_release(v3);
      goto LABEL_37;
    }

    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR))
    {
      sub_1000088AC();
      if (v3) {
        goto LABEL_21;
      }
    }

    else if (v3)
    {
      goto LABEL_21;
    }

LABEL_35:
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008880();
    }
LABEL_37:
    v18[0] = v21;
    v18[1] = v22;
    v18[2] = v23;
    v18[3] = v24;
    sub_100004194((uint64_t)v18);
    return;
  }

  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
    sub_100008854();
  }
}

uint64_t sub_100004ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 20);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to log error, message not from kernel: audit_pid %d",  buf,  8u);
    }

    return 5LL;
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 16);
    v6[0] = *(_OWORD *)a2;
    v6[1] = v5;
    uint64_t v7 = *(void *)(a2 + 32);
    return sub_100006414((uint64_t)v6, 0LL);
  }

uint64_t sub_100004F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 20);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000088D8(v3);
    }
    return 5LL;
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 16);
    v6[0] = *(_OWORD *)a2;
    v6[1] = v5;
    uint64_t v7 = *(void *)(a2 + 32);
    return sub_100006DD4((int *)v6);
  }

void *sub_100004FFC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100010E58);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100010E58))
  {
    sub_100005744((uint64_t)&unk_1000101D0);
    __cxa_atexit((void (*)(void *))sub_100005E64, &unk_1000101D0, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100010E58);
  }

  return &unk_1000101D0;
}

void sub_100005074(_Unwind_Exception *a1)
{
}

uint64_t sub_10000508C()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initialiazing EccDatabase...",  buf,  2u);
  }

  sub_100005A3C(qword_100010EA8);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initializing Memory Error MIG server...",  buf,  2u);
  }

  task_get_special_port(mach_task_self_, 4, &bootstrap_port);
  uint64_t v0 = bootstrap_check_in(bootstrap_port, "com.apple.mmaintenanced.server", (mach_port_t *)buf);
  uint64_t v1 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  *(unsigned int *)buf,  0LL,  &_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_1000051D8;
  handler[3] = &unk_10000C590;
  int v4 = *(_DWORD *)buf;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_activate(v1);
  return v0;
}

void sub_1000051D8(uint64_t a1)
{
  mach_msg_return_t v1;
  uint64_t v1 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100007208,  0x1000u,  *(_DWORD *)(a1 + 32),  50331648);
  if (v1) {
    sub_100008950(v1);
  }
}

uint64_t sub_10000520C()
{
  size_t v1 = 48LL;
  uint64_t result = sysctlbyname("kern.osreleasetype", v2, &v1, 0LL, 0LL);
  if (!(_DWORD)result && !(*(void *)&v2[0] ^ 0x6C616E7265746E49LL | BYTE8(v2[0]))) {
    byte_100010EC0 = 1;
  }
  return result;
}

void start(int a1)
{
  uint64_t v2 = 0LL;
  vproc_swap_integer(0LL, 5LL, 0LL, &v2);
  if (v2)
  {
    if (a1 == 1)
    {
      qword_100010EB8 = (uint64_t)os_log_create("com.apple.mmaintenanced", "Memory Maintenance Daemon");
      sub_10000520C();
      xpc_activity_register( "com.apple.memory-maintenance.report-mach-memory-info",  XPC_ACTIVITY_CHECK_IN,  &stru_10000C5D0);
      sub_10000508C();
      xpc_activity_register("com.apple.memory-maintenance.report-ecc-status", XPC_ACTIVITY_CHECK_IN, &stru_10000C610);
      dispatch_main();
    }
  }

  exit(1);
}

void sub_100005364(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if ((analytics_is_event_used("com.apple.memorytools.stats.zoneinfo") & 1) != 0
      || analytics_is_event_used("com.apple.memorytools.stats.vmkerninfo"))
    {
      sub_100004B08(1);
    }

    else
    {
      uint64_t v2 = (os_log_s *)qword_100010EB8;
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v3 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "memorytools.stats events disabled, skipping analytics",  v3,  2u);
      }
    }
  }

void sub_10000540C(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
  }

void sub_100005448( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void *sub_100005458()
{
  uint64_t result = sub_100004FFC();
  qword_100010EA8 = (uint64_t)result;
  return result;
}

void sub_100005474(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000054C4(exception, a1);
}

void sub_1000054B0(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000054C4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000054E8(void *a1)
{
}

void sub_1000054F8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  size_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

BOOL sub_100005520(uint64_t a1)
{
  int v2 = sqlite3_exec( *(sqlite3 **)(a1 + 8),  "PRAGMA quick_check",  (int (__cdecl *)(void *, int, char **, char **))sub_1000055A0,  0LL,  0LL);
  if (v2)
  {
    int v3 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_1000089AC(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  return v2 == 0;
}

BOOL sub_1000055A0(uint64_t a1, int a2, const char **a3)
{
  return a2 < 1 || strcmp(*a3, "ok") != 0;
}

uint64_t sub_1000055D8(uint64_t a1)
{
  int v2 = (sqlite3 **)(a1 + 8);
  int v3 = sqlite3_close(*(sqlite3 **)(a1 + 8));
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008B0C(a1, v4, v5);
    }
    return 0LL;
  }

  uint64_t v6 = (const char *)(a1 + 100);
  if (remove(v6))
  {
    uint64_t v7 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008A78((uint64_t)v6, v7);
    }
    return 0LL;
  }

  uint64_t v8 = sqlite3_open(v6, v2);
  uint64_t v9 = (os_log_s *)qword_100010EB8;
  if ((_DWORD)v8)
  {
    uint64_t v10 = v8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008A14(v10, v9, v11, v12, v13, v14, v15, v16);
    }
    return 0LL;
  }

  uint64_t v17 = 1LL;
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315138;
    CFNumberRef v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "recreated %s successfully", (uint8_t *)&v19, 0xCu);
  }

  return v17;
}

uint64_t sub_100005744(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 8) = 0LL;
  memcpy((void *)(a1 + 100), "/var/db/mmaintenanced/memory_errors.db", 0x400uLL);
  memcpy((void *)(a1 + 1124), "/System/Volumes/iSCPreboot/dramecc/dramecc.db", 0x400uLL);
  memcpy((void *)(a1 + 2148), "/System/Volumes/iSCPreboot/dramecc/", 0x400uLL);
  *(void *)(a1 + 3176) = 0LL;
  *(void *)(a1 + 3192) = 0LL;
  *(void *)(a1 + 3184) = 0LL;
  return a1;
}

BOOL sub_1000057B4(uint64_t a1)
{
  size_t v1 = (sqlite3_stmt **)(a1 + 16);
  return !sqlite3_prepare_v2( *(sqlite3 **)(a1 + 8),  "CREATE TABLE IF NOT EXISTS ecc_errors_v2 (ID INTEGER PRIMARY KEY,time INT NOT NULL,addr INT NOT NULL,row INT ,column INT,bank INT,count INT NOT NULL,correctable INT NOT NULL);",
            -1,
            (sqlite3_stmt **)(a1 + 16),
            0LL)
      && sqlite3_step(*v1) == 101;
}

BOOL sub_10000580C(sqlite3 **a1)
{
  int v2 = sqlite3_prepare_v2( a1[1],  "INSERT INTO ecc_errors_v2('time','addr','row','column','bank','count','correctable') VALUES(?, ?, ?, ?, ?, ?, ?);",
         -1,
         a1 + 3,
         0LL);
  int v3 = sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 6, 0LL) | v2;
  int v4 = sqlite3_prepare_v2(a1[1], "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 4, 0LL);
  int v5 = v3 | v4 | sqlite3_prepare_v2( a1[1],  "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
                   -1,
                   a1 + 7,
                   0LL);
  int v6 = sqlite3_prepare_v2( a1[1],  "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
         -1,
         a1 + 5,
         0LL);
  int v7 = v6 | sqlite3_prepare_v2( a1[1],  "SELECT COUNT(DISTINCT correctable) FROM ecc_errors_v2 WHERE addr = ?;",
              -1,
              a1 + 8,
              0LL);
  int v8 = v5 | v7 | sqlite3_prepare_v2( a1[1],  "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = 0 AND (addr >> ?) = ?;",
                   -1,
                   a1 + 9,
                   0LL);
  int v9 = sqlite3_prepare_v2( a1[1],  "SELECT (addr >> ?) as Page, MAX(time) as Time FROM ecc_errors_v2 WHERE correctable=0 GROUP BY Page ORDER BY Time DESC LIMIT ?;",
         -1,
         a1 + 10,
         0LL);
  uint64_t v10 = v8 | v9 | sqlite3_prepare_v2( a1[1],  "DELETE FROM ecc_errors_v2 WHERE (addr >> ?) = ?;",
                                  -1,
                                  a1 + 11,
                                  0LL);
  if ((_DWORD)v10)
  {
    uint64_t v11 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008B88(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return (_DWORD)v10 == 0;
}

uint64_t sub_100005994(void *a1)
{
  size_t v2 = 4LL;
  uint64_t result = sysctlbyname("vm.vm_ecc_max_db_pages", a1, &v2, 0LL, 0LL);
  if ((_DWORD)result) {
    return *__error();
  }
  return result;
}

void sub_1000059DC(uint64_t a1)
{
  size_t v1 = (_DWORD *)(a1 + 96);
  if (sub_100005994((void *)(a1 + 96)))
  {
    size_t v2 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008BEC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  if (!*v1) {
    *size_t v1 = 1024;
  }
}

void sub_100005A3C(uint64_t a1)
{
  uint64_t v2 = a1 + 100;
  int v3 = sqlite3_open((const char *)(a1 + 100), (sqlite3 **)(a1 + 8));
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008C68(v2, v4, v5);
    }
  }

  else if ((sub_100005520(a1) || sub_1000055D8(a1)) && sub_1000057B4(a1) && sub_10000580C((sqlite3 **)a1))
  {
    sub_1000059DC(a1);
    *(_BYTE *)a1 = 1;
  }

uint64_t sub_100005AEC(uint64_t a1, int a2, int a3, char a4, sqlite3_int64 a5, _DWORD *a6)
{
  uint64_t v12 = 32LL;
  if (a3) {
    uint64_t v12 = 40LL;
  }
  uint64_t v13 = *(sqlite3_stmt **)(a1 + v12);
  *a6 = 0;
  sqlite3_reset(v13);
  sqlite3_bind_int(v13, 1, a2);
  if (a3) {
    sqlite3_bind_int64(v13, 2, a5);
  }
  int v14 = sqlite3_step(v13);
  char v15 = a4 ^ 1 | a2;
  while (v14 == 100)
  {
    if ((v15 & 1) != 0)
    {
      ++*a6;
    }

    else
    {
      sqlite3_int64 v16 = sqlite3_column_int64(v13, 0);
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 64));
      sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 64), 1, v16);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 100)
      {
        if (!os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
          return 1LL;
        }
LABEL_21:
        sub_100008D64();
        return 1LL;
      }

      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 101)
      {
        if (!os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
          return 1LL;
        }
        goto LABEL_21;
      }
    }

    int v14 = sqlite3_step(v13);
  }

  if (v14 == 101) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
    sub_100008CF8();
  }
  return 1LL;
}

uint64_t sub_100005CC0(uint64_t a1, int a2, int a3, sqlite3_int64 a4, int *a5)
{
  uint64_t v9 = 48LL;
  if (a3) {
    uint64_t v9 = 56LL;
  }
  uint64_t v10 = *(sqlite3_stmt **)(a1 + v9);
  sqlite3_reset(v10);
  sqlite3_bind_int(v10, 1, a2);
  if (a3) {
    sqlite3_bind_int64(v10, 2, a4);
  }
  if (sqlite3_step(v10) == 100)
  {
    *a5 = sqlite3_column_int(v10, 0);
    int v11 = sqlite3_step(v10);
    uint64_t result = 0LL;
    if (v11 == 101) {
      return result;
    }
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR))
  {
LABEL_10:
    sub_100008DD0();
  }

  return 1LL;
}

uint64_t sub_100005DD0(uint64_t a1)
{
  if (*(_BYTE *)a1)
  {
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 16));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 24));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 40));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 48));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 56));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 64));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 72));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 88));
    sqlite3_close(*(sqlite3 **)(a1 + 8));
  }

  uint64_t v2 = *(void **)(a1 + 3176);
  if (v2)
  {
    *(void *)(a1 + 3184) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_100005E68(uint64_t a1, uint64_t a2)
{
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 24)) == 101) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
    sub_100008E3C();
  }
  return 1LL;
}

uint64_t sub_100005F40(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 88));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 88)) == 101) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
    sub_100008EA8();
  }
  return 1LL;
}

BOOL sub_100005FE8(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 72));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 72)) == 100) {
    return sqlite3_column_int(*(sqlite3_stmt **)(a1 + 72), 0) != 0;
  }
  if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
    sub_100008F14();
  }
  return 1LL;
}

void sub_1000060A0(uint64_t a1)
{
  uint64_t v2 = a1 + 1124;
  int v3 = open((const char *)(a1 + 1124), 1537, 384LL);
  int v4 = fdopen(v3, "w");
  if (v4)
  {
    uint64_t v5 = v4;
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 1, vm_page_shift);
    sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 80), 2, *(_DWORD *)(a1 + 96));
    int v6 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    if (v6 == 100)
    {
      do
      {
        sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 80), 0) << vm_page_shift;
        fprintf(v5, "%llx\n", v7 & ~vm_page_mask);
        if (byte_100010EC0)
        {
          uint64_t v8 = (os_log_s *)qword_100010EB8;
          if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            sqlite3_int64 v12 = v7;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "wrote page %llu", buf, 0xCu);
          }
        }

        int v9 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
      }

      while (v9 == 100);
      int v6 = v9;
    }

    fclose(v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "regenerated the retired page list, rc=%d",  buf,  8u);
    }
  }

  else
  {
    uint64_t v10 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100008F80(v2, v10);
    }
  }

uint64_t sub_1000062C0(const char *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v2)
  {
    io_registry_entry_t v3 = v2;
    int v4 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v4)
    {
      uint64_t v5 = v4;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, v4, 0LL, 0);
      if (CFProperty)
      {
        sqlite3_int64 v7 = CFProperty;
        if (CFDataGetLength(CFProperty) == 4)
        {
          uint64_t v8 = *(unsigned int *)CFDataGetBytePtr(v7);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
            sub_1000090B8();
          }
          uint64_t v8 = 0LL;
        }

        CFRelease(v7);
      }

      else
      {
        uint64_t v8 = 0LL;
      }

      CFRelease(v5);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
        sub_10000908C();
      }
      uint64_t v8 = 0LL;
    }

    IOObjectRelease(v3);
  }

  else
  {
    int v9 = (os_log_s *)qword_100010EB8;
    if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
      sub_100009028((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);
    }
    return 0LL;
  }

  return v8;
}

uint64_t sub_100006414(uint64_t a1, time_t a2)
{
  int v3 = *(_DWORD *)(a1 + 4);
  if ((v3 & 4) != 0)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0LL;
    if (!v11) {
      return result;
    }
    uint64_t v13 = *(void *)(a1 + 8);
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received test event for addr %llx, ignoring",  (uint8_t *)&buf,  0xCu);
    return 0LL;
  }

  uint64_t v4 = qword_100010EB0;
  if (*(_BYTE *)qword_100010EB0)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    LOBYTE(v5) = v3;
    uint64_t v22 = 0LL;
    if (!a2)
    {
      time(v18);
      a2 = v18[0];
      int v5 = *(_DWORD *)(a1 + 4);
      uint64_t v4 = qword_100010EB0;
    }

    unint64_t v6 = *(void *)(a1 + 8);
    *(void *)&__int128 buf = a2;
    *((void *)&buf + 1) = v6;
    int v7 = v5 & 1;
    LOBYTE(v22) = v5 & 1;
    if (mkdir((const char *)(v4 + 2148), 0x180u) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
        sub_100009110();
      }
      return 5LL;
    }

    if ((v3 & 2) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
        sub_1000090E4();
      }
    }

    else
    {
      uint64_t v8 = qword_100010EB0;
      *(_DWORD *)(qword_100010EB0 + 3200) = *(_DWORD *)(a1 + 20);
      if (!v7 && sub_100005FE8(v8, v6)) {
        return 0LL;
      }
      if ((v3 & 0x10) != 0)
      {
        if (sub_100005F40(qword_100010EB0, v6))
        {
          if (!byte_100010EC0) {
            return 5LL;
          }
          uint64_t v9 = qword_100010EB8;
          if (!os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
            return 5LL;
          }
          LODWORD(v18[0]) = 134217984;
          *(time_t *)((char *)v18 + 4) = v6;
          uint64_t v10 = "Failed to remove address %llx from database";
LABEL_32:
          p___int128 buf = (uint8_t *)v18;
          uint64_t v14 = (os_log_s *)v9;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v17 = 12;
          goto LABEL_19;
        }
      }

      else if (sub_100005E68(qword_100010EB0, (uint64_t)&buf))
      {
        if (!byte_100010EC0) {
          return 5LL;
        }
        uint64_t v9 = qword_100010EB8;
        if (!os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR)) {
          return 5LL;
        }
        LODWORD(v18[0]) = 134217984;
        *(time_t *)((char *)v18 + 4) = v6;
        uint64_t v10 = "Failed to insert error into database for addr %llx";
        goto LABEL_32;
      }

      if (v7) {
        return 0LL;
      }
    }

    sub_1000060A0(qword_100010EB0);
    return 0LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    uint64_t v14 = (os_log_s *)&_os_log_default;
    uint64_t v10 = "Received a notification, but EccDatabase is not in a valid state";
    p___int128 buf = (uint8_t *)&buf;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 2;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v14, v16, v10, p_buf, v17);
  }

  return 5LL;
}

BOOL sub_1000066DC()
{
  return sub_100005994(v1) != 2 && sub_1000062C0("dram-ecc") != 0;
}

void sub_100006720(time_t a1)
{
  if (sub_1000066DC())
  {
    if (a1) {
      time_t v24 = a1;
    }
    else {
      time(&v24);
    }
    if (!*(_DWORD *)(qword_100010EB0 + 3200)) {
      *(_DWORD *)(qword_100010EB0 + 3200) = sub_1000062C0("dram-vendor-id");
    }
    time_t v2 = v24;
    if (difftime(v24, qword_100010EC8) >= 300.0)
    {
      int v3 = 0;
      qword_100010EC8 = v2;
      sqlite3_int64 v4 = v2 - 86400;
      char v5 = 1;
      do
      {
        int v6 = 0;
        char v7 = v5;
        char v8 = 1;
        do
        {
          char v9 = v8;
          unsigned int v25 = 0;
          if (sub_100005CC0(qword_100010EB0, v3 & 1, v6 & 1, v4, (int *)&v25))
          {
            uint64_t v10 = (os_log_s *)qword_100010EB8;
            if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 67109376;
              int v27 = v3;
              LOWORD(v28) = 1024;
              *(_DWORD *)((char *)&v28 + 2) = v6;
              _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to get total count for correctable=%d epoch=%d ",  buf,  0xEu);
            }
          }

          else
          {
            buf[0] = v3;
            buf[1] = 0;
            buf[2] = v6 & 1;
            unsigned int v11 = *(_DWORD *)(qword_100010EB0 + 3200);
            int v27 = 4;
            unint64_t v28 = __PAIR64__(v25, v11);
            sub_1000069F0(buf);
          }

          char v8 = 0;
          int v6 = 1;
        }

        while ((v9 & 1) != 0);
        char v5 = 0;
        int v3 = 1;
      }

      while ((v7 & 1) != 0);
      int v12 = 0;
      char v13 = 1;
      do
      {
        int v14 = 0;
        char v23 = v13;
        char v15 = 1;
        do
        {
          char v16 = 0;
          char v17 = v15;
          char v18 = 1;
          do
          {
            char v19 = v18;
            if ((v12 & 1) != 0 && (v16 & 1) != 0) {
              break;
            }
            unsigned int v25 = 0;
            uint8_t v20 = v16 & 1;
            if (sub_100005AEC(qword_100010EB0, v12 & 1, v14 & 1, v16 & 1, v4, &v25) == 1)
            {
              uint64_t v21 = (os_log_s *)qword_100010EB8;
              if (os_log_type_enabled((os_log_t)qword_100010EB8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 67109376;
                int v27 = v12;
                LOWORD(v28) = 1024;
                *(_DWORD *)((char *)&v28 + 2) = v14;
                _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to get unique addr count for correctable=%d epoch=%d ",  buf,  0xEu);
              }
            }

            else
            {
              buf[0] = v12;
              buf[1] = v20;
              buf[2] = v14 & 1;
              unsigned int v22 = *(_DWORD *)(qword_100010EB0 + 3200);
              int v27 = 0;
              unint64_t v28 = __PAIR64__(v25, v22);
              sub_1000069F0(buf);
            }

            char v18 = 0;
            char v16 = 1;
          }

          while ((v19 & 1) != 0);
          char v15 = 0;
          int v14 = 1;
        }

        while ((v17 & 1) != 0);
        char v13 = 0;
        int v12 = 1;
      }

      while ((v23 & 1) != 0);
    }
  }

void sub_1000069F0(unsigned __int8 *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *a1;
    int v3 = a1[1];
    int v4 = a1[2];
    int v5 = *((_DWORD *)a1 + 1);
    int v6 = *((_DWORD *)a1 + 2);
    int v7 = *((_DWORD *)a1 + 3);
    *(_DWORD *)__int128 buf = 67110400;
    int v25 = v2;
    __int16 v26 = 1024;
    int v27 = v3;
    __int16 v28 = 1024;
    int v29 = v4;
    __int16 v30 = 1024;
    int v31 = v5;
    __int16 v32 = 1024;
    int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Notified CoreAnalytics of ECC error -> correctable: %u, preceded_by_correctable: %u, epoch: %u, uniqueness: %u, ve ndor: %u, count: %u",  buf,  0x26u);
  }

  char v8 = (void *)qword_100010EB0;
  if (*(_BYTE *)(qword_100010EB0 + 1))
  {
    char v9 = *(_OWORD **)(qword_100010EB0 + 3184);
    unint64_t v10 = *(void *)(qword_100010EB0 + 3192);
    if ((unint64_t)v9 >= v10)
    {
      int v12 = (void **)(qword_100010EB0 + 3176);
      uint64_t v13 = *(void *)(qword_100010EB0 + 3176);
      uint64_t v14 = ((uint64_t)v9 - v13) >> 4;
      unint64_t v15 = v14 + 1;
      uint64_t v16 = v10 - v13;
      if (v16 >> 3 > v15) {
        unint64_t v15 = v16 >> 3;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17) {
        char v18 = (char *)sub_100006D20(qword_100010EB0 + 3192, v17);
      }
      else {
        char v18 = 0LL;
      }
      char v19 = &v18[16 * v14];
      uint8_t v20 = &v18[16 * v17];
      *(_OWORD *)char v19 = *(_OWORD *)a1;
      unsigned int v11 = v19 + 16;
      uint64_t v21 = (char *)v8[398];
      unsigned int v22 = (char *)v8[397];
      if (v21 != v22)
      {
        do
        {
          *((_OWORD *)v19 - 1) = *((_OWORD *)v21 - 1);
          v19 -= 16;
          v21 -= 16;
        }

        while (v21 != v22);
        uint64_t v21 = (char *)*v12;
      }

      v8[397] = v19;
      v8[398] = v11;
      v8[399] = v20;
      if (v21) {
        operator delete(v21);
      }
    }

    else
    {
      *char v9 = *(_OWORD *)a1;
      unsigned int v11 = v9 + 1;
    }

    v8[398] = v11;
  }

  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 0x40000000LL;
    v23[2] = sub_100006C04;
    v23[3] = &unk_10000C630;
    v23[4] = a1;
    analytics_send_event_lazy("com.apple.ecc_error", v23);
  }

void *sub_100006C04(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v3 = v2;
  if (**(_BYTE **)(a1 + 32)) {
    int v4 = "CE";
  }
  else {
    int v4 = "UE";
  }
  xpc_dictionary_set_string(v2, "CEorUE", v4);
  xpc_dictionary_set_BOOL(v3, "PrecededByCE", *(_BYTE *)(*(void *)(a1 + 32) + 1LL));
  if (*(_BYTE *)(*(void *)(a1 + 32) + 2LL)) {
    int v5 = "Epoch";
  }
  else {
    int v5 = "Accumulated";
  }
  xpc_dictionary_set_string(v3, "TimePeriod", v5);
  int v6 = 0LL;
  uint64_t v7 = *(unsigned int *)(*(void *)(a1 + 32) + 4LL);
  xpc_dictionary_set_string(v3, "CountType", v6);
  xpc_dictionary_set_uint64(v3, "Vendor", *(unsigned int *)(*(void *)(a1 + 32) + 8LL));
  xpc_dictionary_set_uint64(v3, "ErrorCount", *(unsigned int *)(*(void *)(a1 + 32) + 12LL));
  return v3;
}

void sub_100006D0C()
{
}

void *sub_100006D20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_1000054F8();
  }
  return operator new(16 * a2);
}

void sub_100006D54( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006D64(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100006D8C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006D9C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006DAC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void *sub_100006DB8()
{
  uint64_t result = sub_100004FFC();
  qword_100010EB0 = (uint64_t)result;
  return result;
}

uint64_t sub_100006DD4(int *a1)
{
  int v2 = *a1;
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v2 < 1)
  {
    if (v3)
    {
      int v5 = a1[3];
      int v6 = a1[4];
      int v7 = a1[5];
      int v8 = a1[6];
      int v9 = a1[7];
      int v10 = a1[8];
      int v11 = a1[9];
      unsigned int v13 = a1[1];
      int v12 = a1[2];
      *(_DWORD *)__int128 buf = 67111424;
      int v20 = v12;
      __int16 v21 = 1024;
      int v22 = v5;
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 1024;
      int v26 = v7;
      __int16 v27 = 1024;
      int v28 = v8;
      __int16 v29 = 1024;
      int v30 = v9;
      __int16 v31 = 1024;
      int v32 = v10;
      __int16 v33 = 1024;
      int v34 = v11;
      __int16 v35 = 1024;
      int v36 = v13 & 1;
      __int16 v37 = 1024;
      int v38 = (v13 >> 1) & 1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Notified CoreAnalytics of MCC error: status(%x) amcc(%x) plane(%x) bank(%x) way(%x) index(%x) bit_off_cl(%x) bit _off_within_hcl(%x) single_bit(%u) multi_bit(%u)",  buf,  0x3Eu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000LL;
    v15[2] = sub_100006F7C;
    v15[3] = &unk_10000C678;
    __int128 v14 = *((_OWORD *)a1 + 1);
    __int128 v16 = *(_OWORD *)a1;
    __int128 v17 = v14;
    uint64_t v18 = *((void *)a1 + 4);
    analytics_send_event_lazy("com.apple.mcc.error", v15);
    return 0LL;
  }

  else
  {
    if (v3)
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v20 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown ECC event version %u\n",  buf,  8u);
    }

    return 5LL;
  }

xpc_object_t sub_100006F7C(_DWORD *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "status", a1[10]);
  xpc_dictionary_set_uint64(v2, "amcc", a1[11]);
  xpc_dictionary_set_uint64(v2, "plane", a1[12]);
  xpc_dictionary_set_uint64(v2, "bank", a1[13]);
  xpc_dictionary_set_uint64(v2, "way", a1[14]);
  xpc_dictionary_set_uint64(v2, "index", a1[15]);
  xpc_dictionary_set_uint64(v2, "bit_off_cl", a1[16]);
  xpc_dictionary_set_uint64(v2, "bit_off_within_hcl", a1[17]);
  xpc_dictionary_set_uint64(v2, "single_bit", a1[9] & 1LL);
  xpc_dictionary_set_uint64(v2, "multi_bit", ((unint64_t)a1[9] >> 1) & 1);
  return v2;
}

uint64_t sub_10000707C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_1000070B8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      __int128 v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      uint64_t v9 = *(void *)(result + 64);
      __int128 v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      uint64_t result = sub_100004ED0(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100007160(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      __int128 v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      uint64_t v9 = *(void *)(result + 64);
      __int128 v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      uint64_t result = sub_100004F94(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100007208(_DWORD *a1, uint64_t a2)
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
  if ((v4 - 5902) >= 0xFFFFFFFE
    && (__int128 v5 = (void (*)(void))*(&off_10000C698 + 5 * (v4 - 5900) + 5)) != 0LL)
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

uint64_t sub_100007298(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000072D8(uint64_t a1)
{
  uint64_t v2 = sub_100007298(&qword_100010E60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100007318(uint64_t a1, int *a2)
{
  __int128 v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_10000737C;
  return v6(a1);
}

uint64_t sub_10000737C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

void mm_swift_are_models_loaded(const void *a1)
{
}

uint64_t areModelsLoaded(callback:)(const void *a1)
{
  return sub_1000077A8( a1,  (uint64_t)&unk_10000C7C8,  (uint64_t)&unk_10000C7F0,  (uint64_t)&unk_100010E78,  (uint64_t)&unk_100010E80);
}

uint64_t sub_100007408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[3] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Query(0LL);
  v4[6] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[7] = v8;
  v4[8] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100007490, 0LL, 0LL);
}

uint64_t sub_100007490()
{
  int v1 = (void *)swift_task_alloc(async function pointer to Query.loadedAssets.getter[1]);
  *(void *)(v0 + 72) = v1;
  *int v1 = v0;
  v1[1] = sub_1000074E4;
  return Query.loadedAssets.getter();
}

uint64_t sub_1000074E4(uint64_t a1)
{
  int v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 72LL);
  *(void *)(*(void *)v2 + 80LL) = v1;
  swift_task_dealloc(v5);
  uint64_t v7 = v4[7];
  uint64_t v6 = v4[8];
  uint64_t v8 = v4[6];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v9 = sub_1000075D0;
  }

  else
  {
    v4[11] = a1;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v9 = sub_100007570;
  }

  return swift_task_switch(v9, 0LL, 0LL);
}

uint64_t sub_100007570()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(*(void *)(v0 + 88) + 16LL);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
  uint64_t v3 = *(void *)(v0 + 40);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000075D0()
{
  uint64_t v1 = Logger.init(subsystem:category:)( 0xD000000000000017LL,  0x800000010000BA30LL,  0xD000000000000014LL,  0x800000010000B760LL);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to connect to modelmanagerd", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);

  (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0LL);
  swift_errorRelease(v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v10 = *(void *)(v0 + 40);
  swift_task_dealloc(*(void *)(v0 + 64));
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007700()
{
  uint64_t v2 = *(void *)(v0 + 32);
  os_log_type_t v3 = (void *)swift_task_alloc(dword_100010E74);
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_1000086D8;
  return sub_100007408((uint64_t)v3, v4, v5, v2);
}

void mm_swift_run_with_memory_maintenance_assertion(const void *a1)
{
}

void sub_100007758(const void *a1, void (*a2)(void))
{
  os_log_type_t v3 = _Block_copy(a1);
  a2();
  _Block_release(v3);
}

uint64_t runWithMemoryMaintenanceAssertion(block:)(const void *a1)
{
  return sub_1000077A8( a1,  (uint64_t)&unk_10000C818,  (uint64_t)&unk_10000C840,  (uint64_t)&unk_100010E90,  (uint64_t)&unk_100010E98);
}

uint64_t sub_1000077A8(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v12 = _Block_copy(a1);
  uint64_t v13 = type metadata accessor for TaskPriority(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1LL, 1LL, v13);
  unint64_t v15 = (void *)swift_allocObject(a2, 40LL, 7LL);
  v15[2] = 0LL;
  __int128 v16 = v15 + 2;
  v15[3] = 0LL;
  void v15[4] = v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1LL, v13) == 1)
  {
    sub_1000072D8((uint64_t)v11);
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 7168LL;
  }

  else
  {
    unsigned __int8 v20 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    uint64_t v19 = v20 | 0x1C00LL;
    uint64_t v21 = *v16;
    if (*v16)
    {
      uint64_t v22 = v15[3];
      uint64_t ObjectType = swift_getObjectType(*v16);
      swift_unknownObjectRetain(v21);
      uint64_t v17 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v22);
      uint64_t v18 = v24;
      swift_unknownObjectRelease(v21);
    }

    else
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
    }
  }

  uint64_t v25 = swift_allocObject(a3, 32LL, 7LL);
  *(void *)(v25 + 16) = a4;
  *(void *)(v25 + 24) = v15;
  if (v18 | v17)
  {
    v29[0] = 0LL;
    v29[1] = 0LL;
    int v26 = v29;
    v29[2] = v17;
    v29[3] = v18;
  }

  else
  {
    int v26 = 0LL;
  }

  uint64_t v27 = swift_task_create(v19, v26, (char *)&type metadata for () + 8, a5, v25);
  return swift_release(v27);
}

uint64_t sub_100007978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[9] = v6;
  v4[10] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000079D8, 0LL, 0LL);
}

uint64_t sub_1000079D8()
{
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to Assertion.__allocating_init(policy:description:)[1]);
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100007A94;
  return Assertion.__allocating_init(policy:description:)( 0xD000000000000011LL,  0x800000010000B780LL,  0xD000000000000031LL,  0x800000010000B7A0LL);
}

uint64_t sub_100007A94(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 88);
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    uint64_t v5 = sub_100007C80;
  }
  else {
    uint64_t v5 = sub_100007B00;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100007B00(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Acquired MemoryMaintenance assertion in modelmanagerd", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v5 = *(void *)(v1 + 56);

  (*(void (**)(uint64_t))(v5 + 16))(v5);
  uint64_t v6 = (void *)swift_task_alloc(async function pointer to Assertion.invalidate()[1]);
  *(void *)(v1 + 112) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100007BD4;
  return Assertion.invalidate()();
}

uint64_t sub_100007BD4()
{
  return swift_task_switch(sub_100007C28, 0LL, 0LL);
}

uint64_t sub_100007C28()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_release(*(void *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(*(void *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007C80()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v17 = *(void *)(v0 + 64);
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getErrorValue(v5, v0 + 40, v0 + 16);
    uint64_t v8 = Error.localizedDescription.getter(*(void *)(v0 + 24), *(void *)(v0 + 32));
    unint64_t v10 = v9;
    *(void *)(v0 + 48) = sub_100008038(v8, v9, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "Failed to acquire MemoryMaintenance assertion in modelmanagerd: %s",  v6,  0xCu);
    swift_arrayDestroy(v7, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    swift_errorRelease(v5);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }

  else
  {
    uint64_t v11 = *(void *)(v0 + 104);
    uint64_t v13 = *(void *)(v0 + 72);
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v14 = *(void *)(v0 + 64);
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }

  swift_task_dealloc(*(void *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007E70(uint64_t a1)
{
  os_log_type_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100010E6C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000086D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100010E68 + dword_100010E68))(a1, v4);
}

uint64_t sub_100007EE4()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100007F10()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_100010E8C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007F5C;
  return sub_100007978((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100007F5C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100007FA4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100007FC8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100010E6C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007F5C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100010E68 + dword_100010E68))(a1, v4);
}

uint64_t sub_100008038(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008108(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008698((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100008698((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100008678(v12);
  return v7;
}

uint64_t sub_100008108(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000082C0(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_1000082C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008354(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000852C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000852C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008354(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_1000084C8(v4, 0LL);
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

void *sub_1000084C8(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100007298(&qword_100010EA0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000852C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100007298(&qword_100010EA0);
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

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100008678(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008698(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000086E0()
{
  sub_100004AD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kr != KERN_SUCCESS)", v2);
  sub_100004AE4();
}

void sub_100008710()
{
  sub_100004AD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kr == KERN_SUCCESS)", v2);
  sub_100004AE4();
}

void sub_100008740()
{
  sub_100004AD8( (void *)&_mh_execute_header,  v0,  v1,  "Error: failed (info.zone_names_count == info.zone_info_count)",  v2);
  sub_100004AE4();
}

void sub_100008770()
{
  sub_100004AD8((void *)&_mh_execute_header, v0, v1, "Error: failed (tag_to_bundle_info != NULL)", v2);
  sub_100004AE4();
}

void sub_1000087A0()
{
  sub_100004AD8((void *)&_mh_execute_header, v0, v1, "Error: failed (kext_info != NULL)", v2);
  sub_100004AE4();
}

void sub_1000087D0(_BYTE *a1, _BYTE *a2)
{
  sub_100004AD8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error: failed (vm_name != NULL)", v3);
}

void sub_1000087FC(_BYTE *a1, _BYTE *a2)
{
  sub_100004AD8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Error: failed (bundle_id != NULL)", v3);
}

void sub_100008828(_BYTE *a1, _BYTE *a2)
{
}

void sub_100008854()
{
}

void sub_100008880()
{
}

void sub_1000088AC()
{
}

void sub_1000088D8(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to log error, message not from kernel: audit_pid %d",  (uint8_t *)v1,  8u);
  sub_100004AE4();
}

void sub_100008950(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set context for inbound notifications on the mach port",  v1,  2u);
  }

  sub_100004AE4();
}

void sub_1000089AC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008A14( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008A78(uint64_t a1, os_log_s *a2)
{
  int v4 = *__error();
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_100006D64((void *)&_mh_execute_header, a2, v5, "failed to remove %s, errno: %d", (uint8_t *)&v6);
}

void sub_100008B0C(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 136315394;
  uint64_t v4 = a1 + 100;
  __int16 v5 = 1024;
  int v6 = a2;
  sub_100006D64( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "failed to close connection to %s, rc: %d",  (uint8_t *)&v3);
  sub_100006D84();
}

void sub_100008B88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008BEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008C68(uint64_t a1, int a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "initialize";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  sub_100006DAC((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: failed to open database %s, rc: %d", (uint8_t *)&v3);
}

void sub_100008CF8()
{
  sub_100006D54((void *)&_mh_execute_header, v0, v1, "%s: failed with rc=%d", v2, v3, v4, v5, 2u);
  sub_100006D84();
}

void sub_100008D64()
{
  sub_100006D54( (void *)&_mh_execute_header,  v0,  v1,  "%s: sqlite3_step(stmt_ue_preceded_by_ce_count) returned %d",  v2,  v3,  v4,  v5,  2u);
  sub_100006D84();
}

void sub_100008DD0()
{
  sub_100006D54((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100006D84();
}

void sub_100008E3C()
{
  sub_100006D54((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100006D84();
}

void sub_100008EA8()
{
  sub_100006D54((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100006D84();
}

void sub_100008F14()
{
  sub_100006D54((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
  sub_100006D84();
}

void sub_100008F80(uint64_t a1, os_log_s *a2)
{
  int v4 = *__error();
  int v6 = 136315650;
  __int16 v7 = "regenerate_retired_pages";
  __int16 v8 = 2080;
  uint64_t v9 = a1;
  __int16 v10 = 1024;
  int v11 = v4;
  sub_100006DAC((void *)&_mh_execute_header, a2, v5, "%s: Cannot open database file %s, errno %d", (uint8_t *)&v6);
}

void sub_100009028( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000908C()
{
}

void sub_1000090B8()
{
}

void sub_1000090E4()
{
}

void sub_100009110()
{
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