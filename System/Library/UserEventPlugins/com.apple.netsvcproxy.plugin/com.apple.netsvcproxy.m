void sub_37FC(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  v3 = (id)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  v1 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v3));
  v2 = (void *)qword_17DF0;
  qword_17DF0 = v1;
}

LABEL_17:
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

LABEL_26:
    nwi_state_release(v7);
    goto LABEL_27;
  }

  v9 = 0LL;
LABEL_28:

  return v9;
}

LABEL_22:
  return v16;
}

void enable_timestamps(char a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6740;
  block[3] = &unk_14798;
  char v2 = a1;
  if (qword_17E00 != -1) {
    dispatch_once(&qword_17E00, block);
  }
}

void sub_6740(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
  {
    if (mach_timebase_info((mach_timebase_info_t)&dword_17E08))
    {
      id v1 = nplog_obj();
      char v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_BC9C(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }

    else
    {
      g_recordTimestamps = 1;
    }
  }
}

double get_interval_for_mach_times( unint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a2 > a1)
  {
    if (g_recordTimestamps)
    {
      LODWORD(a4) = dword_17E08;
      LODWORD(a5) = *(_DWORD *)algn_17E0C;
      return (double)(a2 - a1) * (double)*(unint64_t *)&a4 / (double)*(unint64_t *)&a5 / 1000000.0;
    }
  }

  return result;
}

void *create_timestamps()
{
  if (!g_recordTimestamps) {
    return 0LL;
  }
  double result = malloc(0x78uLL);
  if (result)
  {
    result[14] = 0LL;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)double result = 0u;
  }

  return result;
}

id NPGetInternalQueue()
{
  if (qword_17E18 != -1) {
    dispatch_once(&qword_17E18, &stru_147B8);
  }
  return (id)qword_17E10;
}

void sub_6878(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("NetworkServiceProxy internal queue", 0LL);
  char v2 = (void *)qword_17E10;
  qword_17E10 = (uint64_t)v1;
}

LABEL_23:
          v25 = 0LL;
          v26 = 0LL;
          v24 = 0;
          v17 = CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
          if (v17)
          {
            v18 = v17;
            CFCalendarDecomposeAbsoluteTime(v17, v5, "yMdHm", (char *)&v26 + 4, &v26, (char *)&v25 + 4, &v25, &v24);
            v19 = nplog_obj();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              v28 = HIDWORD(v26);
              v29 = 1024;
              v30 = v26;
              v31 = 1024;
              v32 = HIDWORD(v25);
              v33 = 1024;
              v34 = v25;
              v35 = 1024;
              v36 = v24;
              _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n",  buf,  0x20u);
            }

            CFCalendarDecomposeAbsoluteTime(v18, v9, "yMdHm", (char *)&v26 + 4, &v26, (char *)&v25 + 4, &v25, &v24);
            v21 = nplog_obj();
            v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67110144;
              v28 = HIDWORD(v26);
              v29 = 1024;
              v30 = v26;
              v31 = 1024;
              v32 = HIDWORD(v25);
              v33 = 1024;
              v34 = v25;
              v35 = 1024;
              v36 = v24;
              _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n",  buf,  0x20u);
            }

            CFRelease(v18);
          }

          goto LABEL_29;
        }

        if (v10 && CFDateCompare(v13, v10, 0LL) == kCFCompareGreaterThan)
        {
          v14 = nplog_obj();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Current time after valid time", buf, 2u);
          }

          uint64_t v7 = 3LL;
          goto LABEL_23;
        }

        uint64_t v7 = 1LL;
      }
    }

LABEL_29:
    CFRelease(v6);
    CFRelease(v10);
    CFRelease(v13);
    return v7;
  }

  return 4LL;
}

id get_nsdata_from_xpc_object(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_data) {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

id get_nsdictionary_from_xpc_object(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary) {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

id get_nsarray_from_xpc_object(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_array) {
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

id sub_732C(uint64_t a1, const void *a2, unint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 0LL;
  }
  if (a3 >= 4 && a4 == 2)
  {
    int v7 = 2;
  }

  else
  {
    uint64_t v9 = 0LL;
    if (a3 < 0x10 || a4 != 30) {
      return v9;
    }
    int v7 = 30;
  }

  inet_ntop(v7, a2, v10, 0x40u);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
  return v9;
}

id sub_73F0(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x20) {
    return 0LL;
  }
  int __b = 0;
  if (a2 >= 8)
  {
    unint64_t v4 = a2 >> 3;
    memset(&__b, 255, a2 >> 3);
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((a2 & 7) != 0) {
    *((_BYTE *)&__b + v4) = 0xFF00u >> (a2 & 7);
  }
  id v5 = sub_732C((uint64_t)&OBJC_CLASS___NPUtilities, &__b, 4uLL, 2LL);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

id sub_7484(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = 0LL;
  v6[0] = 0LL;
  v6[1] = 0LL;
  if (a2 >= 8)
  {
    unint64_t v3 = a2 >> 3;
    memset(v6, 255, a2 >> 3);
  }

  if ((a2 & 7) != 0) {
    *((_BYTE *)v6 + v3) = 0xFF00u >> (a2 & 7);
  }
  id v4 = sub_732C((uint64_t)&OBJC_CLASS___NPUtilities, v6, 0x10uLL, 30LL);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

void sub_76EC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_7720(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_774C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_775C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_77D8(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot())
  {
    if (([*(id *)(a1 + 32) didInitialLaunch] & 1) == 0)
    {
      [*(id *)(a1 + 32) setDidInitialLaunch:1];
      [*(id *)(a1 + 32) launchOwner];
    }
  }

  else
  {
    int out_token = -1;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_790C;
    v7[3] = &unk_14908;
    v7[4] = *(void *)(a1 + 32);
    uint32_t v4 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v3, v7);

    if (v4)
    {
      id v5 = nplog_obj();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_BE10(v6);
      }
    }

    else if (MKBDeviceUnlockedSinceBoot())
    {
      notify_cancel(out_token);
      if (([*(id *)(a1 + 32) didInitialLaunch] & 1) == 0)
      {
        [*(id *)(a1 + 32) setDidInitialLaunch:1];
        [*(id *)(a1 + 32) launchOwner];
      }
    }
  }

id sub_790C(uint64_t a1)
{
  id v2 = nplog_obj();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Received first unlock notification.", v5, 2u);
  }

  id result = [*(id *)(a1 + 32) didInitialLaunch];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidInitialLaunch:1];
    return [*(id *)(a1 + 32) launchOwner];
  }

  return result;
}

void sub_79D4(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(&OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer);
  id v2 = (void *)qword_17E28;
  qword_17E28 = (uint64_t)v1;
}

void sub_7A5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v6 handleProviderAction:a1 token:a2 event:v5];
}

void sub_7BB8(_Unwind_Exception *a1)
{
}

id sub_7CC0(uint64_t a1)
{
  id v2 = nplog_obj();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%@ file handle reader setting timer fired", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) setFileHandleReaderSettingTimer:0];
  return [*(id *)(a1 + 32) setupReadabilityHandlers];
}

id sub_802C(uint64_t a1)
{
  id v2 = nplog_obj();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "File Handle Maintainer got a readable event on a file handle: %@",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(a1 + 40) cancelFileHandleReaderSources];
  [*(id *)(a1 + 40) setDidInitialLaunch:1];
  [*(id *)(a1 + 40) launchOwner];
  return [*(id *)(a1 + 40) startFileHandleReaderSettingTimer];
}

void sub_8184(_Unwind_Exception *a1)
{
}

uint64_t sub_8198(uint64_t a1, void *a2)
{
  id v3 = a2;

  return 1LL;
}

void sub_8270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id nplog_obj()
{
  if (qword_17E40 != -1) {
    dispatch_once(&qword_17E40, &stru_149C0);
  }
  return (id)qword_17E38;
}

void sub_83D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.networkserviceproxy", "");
  id v2 = (void *)qword_17E38;
  qword_17E38 = (uint64_t)v1;
}

id nplog_large_obj()
{
  if (qword_17E50 != -1) {
    dispatch_once(&qword_17E50, &stru_149E0);
  }
  return (id)qword_17E48;
}

void sub_8448(id a1)
{
  os_log_t v1 = os_log_create("com.apple.networkserviceproxy", "Large");
  id v2 = (void *)qword_17E48;
  qword_17E48 = (uint64_t)v1;
}

void nsp_print_backtrace()
{
  int v0 = backtrace(v10, 128);
  os_log_t v1 = backtrace_symbols(v10, v0);
  id v2 = v1;
  if (v0 >= 1)
  {
    uint64_t v3 = v0;
    uint64_t v4 = v1;
    do
    {
      id v5 = nplog_obj();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *v4;
        *(_DWORD *)buf = 136315138;
        uint64_t v9 = v7;
        _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "    %s", buf, 0xCu);
      }

      ++v4;
      --v3;
    }

    while (v3);
  }

  free(v2);
}

void sub_85CC(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___NPUserEventAgent);
  id v2 = (void *)qword_17E58;
  qword_17E58 = (uint64_t)v1;
}

void sub_87C8(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Resurrection timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_8A1C(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Config Fetch timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_8C70(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Token Fetch timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_8EC4(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Device identity fetch timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_9118(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Subscription check timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_936C(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Proxy restore timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_95C0(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "odoh retore timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_9814(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "odoh auth outage restore fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_9A68(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "proxy path probe timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_9CBC(id a1, NSTimer *a2)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "direct path probe timer fired", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_9E9C(uint64_t a1)
{
  id v2 = nplog_obj();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%@: location monitor timer fired", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v5 launchOwner];
}

void sub_A04C(id a1)
{
  int out_token = -1;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint32_t v3 = notify_register_dispatch("com.apple.networking.captive.CNPluginListChanged", &out_token, v2, &stru_14BE8);

  if (v3)
  {
    id v4 = nplog_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_C0FC();
    }
  }

void sub_A0D8(id a1, int a2)
{
  id v2 = nplog_obj();
  uint32_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "received captive plugin list changed notification", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v4 launchOwner];
}

void sub_A1C4(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  void v6[2] = sub_A27C;
  v6[3] = &unk_14C10;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend( *(id *)(a1 + 32),  "setUserActivityNotificationHandle:",  IOPMScheduleUserActivityLevelNotification(v3, v6));

  if (![*(id *)(a1 + 32) userActivityNotificationHandle])
  {
    id v4 = nplog_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_C128();
    }
  }

void sub_A27C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 && [*(id *)(a1 + 32) captiveOutageWaitingForUserActivity])
  {
    id v2 = nplog_obj();
    uint32_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "[active user] outage notification is pending, launching NSP",  v5,  2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
    [v4 launchOwner];
  }

void sub_A52C()
{
  id v0 = nplog_obj();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint32_t v3 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "dynamic store changed", v3, 2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v2 launchOwner];
}

LABEL_86:
  objc_sync_exit(v9);
}

void sub_AE58(_Unwind_Exception *a1)
{
}

void sub_B560(_Unwind_Exception *a1)
{
}

void NPUserEventAgentModuleInit()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer]( &OBJC_CLASS___NSPUserEventAgentFileHandleMaintainer,  "sharedEventAgentMaintainer"));
  [v0 startEventAgentModeWithEventName:@"com.apple.networkserviceproxy.file-descriptor-maintainer"];

  xpc_event_provider_create();
}

void sub_BA24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NPUserEventAgent sharedAgent](&OBJC_CLASS___NPUserEventAgent, "sharedAgent"));
  [v6 handleProviderAction:a1 token:a2 event:v5];
}

  ;
}

  ;
}

void sub_BAA0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

CFErrorRef sub_BACC()
{
  return SCCopyLastError();
}

void sub_BAD4()
{
  sub_76EC(&dword_0, v0, v1, "SecItemCopyMatching returned %d for %@");
  sub_7718();
}

void sub_BB34()
{
}

void sub_BB94()
{
}

void sub_BBF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BC28(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Random ratio %f", (uint8_t *)&v2, 0xCu);
  sub_7718();
}

void sub_BC9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BCD0()
{
  sub_76EC(&dword_0, v0, v1, "Mach-O UUID for process PID=%d is %@");
  sub_7718();
}

void sub_BD30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BDA0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BE10(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to register for first unlock notification.", v1, 2u);
}

void sub_BE50(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl( &dword_0,  log,  OS_LOG_TYPE_DEBUG,  "File Handle Maintainer got a %ld action with token %llu",  (uint8_t *)&v3,  0x16u);
}

void sub_BED4()
{
}

void sub_BF00()
{
}

void sub_BF2C()
{
}

void sub_BF58()
{
}

void sub_BF84()
{
}

void sub_BFB0()
{
}

void sub_BFDC()
{
}

void sub_C008()
{
}

void sub_C034()
{
}

void sub_C060()
{
}

void sub_C08C()
{
}

void sub_C0FC()
{
}

void sub_C128()
{
}

void sub_C154()
{
  CFErrorRef v0 = sub_BACC();
  sub_BAC0();
  sub_BAA0(&dword_0, v1, v2, "Failed to create dynamic store: %@", v3, v4, v5, v6, v7);

  sub_BAB4();
}

void sub_C1C4()
{
  CFErrorRef v0 = sub_BACC();
  sub_BAC0();
  sub_BAA0(&dword_0, v1, v2, "Failed to set dynamic store dispatch queue: %@", v3, v4, v5, v6, v7);

  sub_BAB4();
}

void sub_C234()
{
  CFErrorRef v0 = sub_BACC();
  sub_BAC0();
  sub_BAA0(&dword_0, v1, v2, "Failed to update the dynamic store notification keys: %@", v3, v4, v5, v6, v7);

  sub_BAB4();
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_wifiNetworkSignature(void *a1, const char *a2, ...)
{
  return [a1 wifiNetworkSignature];
}