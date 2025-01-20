BOOL sub_100004978()
{
  BOOL result;
  os_log_s *v1;
  qword_100160A48 = (uint64_t)dlopen("/usr/lib/AppleConvergedTransport.dylib", 1);
  if (qword_100160A48)
  {
    dlerror();
    off_100160A50 = (uint64_t (*)(void))dlsym( (void *)qword_100160A48,  "AppleConvergedTransportInitParameters");
    if (dlerror() || !off_100160A50)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100158700);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_1000296F0();
      }
    }

    else
    {
      off_100160A58 = (uint64_t (*)(void, void))dlsym( (void *)qword_100160A48,  "AppleConvergedTransportCreate");
      if (dlerror() || !off_100160A58)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100158740);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_100029684();
        }
      }

      else
      {
        off_100160A60 = (uint64_t (*)(void, void, void, void, void, void, void))dlsym((void *)qword_100160A48, "AppleConvergedTransportSendImage");
        if (dlerror() || !off_100160A60)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_100158780);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_100029618();
          }
        }

        else
        {
          off_100160A68 = (uint64_t (*)(void, void, void, void, void, void))dlsym( (void *)qword_100160A48,  "AppleConvergedTransportRead");
          if (dlerror() || !off_100160A68)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_1001587C0);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_1000295AC();
            }
          }

          else
          {
            off_100160A70 = (uint64_t (*)(void, void, void, void, void, void))dlsym((void *)qword_100160A48, "AppleConvergedTransportWrite");
            if (dlerror() || !off_100160A70)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_100158800);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_100029540();
              }
            }

            else
            {
              off_100160A78 = (uint64_t (*)(void))dlsym( (void *)qword_100160A48,  "AppleConvergedTransportFree");
              if (!dlerror() && off_100160A78) {
                return 1LL;
              }
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_100158840);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_1000294D4();
              }
            }
          }
        }
      }
    }

    dlclose((void *)qword_100160A48);
    return 0LL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_1001586C0);
  }
  v1 = (os_log_s *)qword_100162428;
  result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100029448(v1);
    return 0LL;
  }

  return result;
}

void sub_100004D38(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004D68(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004D98(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004DC8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004DF8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004E28(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100004E58(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100004E88(uint64_t *a1, void *a2, unint64_t a3, size_t *a4)
{
  if (!a1 || (uint64_t v4 = *a1) == 0 || !a4 || (v6 = *((_DWORD *)a1 + 3), v6 == -1))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158880);
    }
    v15 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002975C(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t v9 = os_channel_ring_id(*a1, 2LL);
  uint64_t v10 = os_channel_rx_ring(v4, v9);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  *(_OWORD *)__src = 0u;
  memset(&v40, 0, sizeof(v40));
  if (kevent(v6, 0LL, 0, &v40, 1, 0LL) == -1 || (unsigned __int16)v40.filter != 0xFFFF)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001588C0);
    }
    v24 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_1000297CC(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t next_slot = os_channel_get_next_slot(v10, 0LL, &v41);
  if (!next_slot)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158A00);
    }
    v32 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002983C(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = next_slot;
  size_t v13 = WORD1(v41);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100158900);
  }
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
    sub_100029A08();
  }
  if (v13 > a3)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158940);
    }
    v14 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_1000298AC(v13, a3, v14);
    }
    return 0xFFFFFFFFLL;
  }

  memcpy(a2, __src[0], v13);
  *a4 = v13;
  if (os_channel_advance_slot(v10, v12))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158980);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029998();
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t result = os_channel_sync(v4, 1LL);
  if ((_DWORD)result)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001589C0);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029928();
    }
    return 0xFFFFFFFFLL;
  }

  return result;
}

void sub_1000051E4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005214(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005244(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005274(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000052A4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000052D4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005304(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100005334()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100158A40);
  }
  io_connect_t connect = 0;
  v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "PCIe FLR\n", buf, 2u);
  }

  v1 = IOServiceMatching("AppleBluetoothModule");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (!MatchingService)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158A80);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029A7C();
    }
    return 0xFFFFFFFFLL;
  }

  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158AC0);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029B08();
    }
    return 0xFFFFFFFFLL;
  }

  if (IOConnectCallScalarMethod(connect, 5u, 0LL, 0, 0LL, 0LL))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158B00);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029AA8();
    }
    IOServiceClose(connect);
    return 0xFFFFFFFFLL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100158B40);
  }
  uint64_t v4 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "pcie_flr";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IOConnectCallScalarMethod succeed and ready to close IO service from %s",  buf,  0xCu);
  }

  IOServiceClose(connect);
  uint64_t result = 0LL;
  byte_100160A80 = 0;
  return result;
}

void sub_1000055D0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005600(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005630(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005660(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005690(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000056C0()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100158B80);
  }
  io_connect_t connect = 0;
  v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "PCIe powercycle\n", v4, 2u);
  }

  v1 = IOServiceMatching("AppleBluetoothModule");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (!MatchingService)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158BC0);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029A7C();
    }
    return 0xFFFFFFFFLL;
  }

  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158C00);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029B08();
    }
    return 0xFFFFFFFFLL;
  }

  if (IOConnectCallScalarMethod(connect, 3u, 0LL, 0, 0LL, 0LL))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158C40);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029B68();
    }
    IOServiceClose(connect);
    return 0xFFFFFFFFLL;
  }

  IOServiceClose(connect);
  uint64_t result = 0LL;
  byte_100160A80 = 0;
  return result;
}

void sub_1000058C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000058F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005920(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100005950(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100005980()
{
  return fputc(10, __stderrp);
}

uint64_t sub_1000059D8()
{
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  char v8 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100005B18;
  block[3] = &unk_100158C68;
  block[4] = &v5;
  if (qword_100160A88 != -1) {
    dispatch_once(&qword_100160A88, block);
  }
  if (*((_BYTE *)v6 + 24))
  {
    if (byte_100160A80) {
      int v0 = 2;
    }
    else {
      int v0 = 1;
    }
    if (sub_100005B74(v0))
    {
      if (byte_100160A80) {
        int v1 = 1;
      }
      else {
        int v1 = 2;
      }
      uint64_t v2 = sub_100005B74(v1);
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158CA8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029BC8();
    }
    uint64_t v2 = 0xFFFFFFFFLL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL sub_100005B18(uint64_t a1)
{
  BOOL result = sub_100004978();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_100005B44(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100005B74(int a1)
{
  if (a1 != 2) {
    goto LABEL_19;
  }
  *(_DWORD *)notification = 0;
  uint64_t v2 = IONotificationPortCreate(kIOMainPortDefault);
  RunLoopSource = IONotificationPortGetRunLoopSource(v2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  CFMutableDictionaryRef v5 = IOServiceMatching("AppleConvergedIPCInterface");
  if (!v5)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158E88);
    }
    uint64_t v9 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029C70(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_19;
  }

  CFMutableDictionaryRef v6 = v5;
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, "hci", 0x600u);
  if (!v7)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158EC8);
    }
    uint64_t v17 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029CE0(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    CFRelease(v6);
    goto LABEL_19;
  }

  CFStringRef v8 = v7;
  CFDictionarySetValue(v6, @"ACIPCInterfaceProtocol", v7);
  CFRelease(v8);
  if (IOServiceAddMatchingNotification( v2,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)sub_1000074B4,  Current,  (io_iterator_t *)notification))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158F08);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A058();
    }
    CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    IONotificationPortDestroy(v2);
    goto LABEL_19;
  }

  io_object_t v38 = IOIteratorNext(*(io_iterator_t *)notification);
  if (v38)
  {
    io_registry_entry_t v39 = v38;
    BOOL v40 = 0;
    CFRunLoopRunResult v41 = 0xFFFF;
  }

  else
  {
    do
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100158F48);
      }
      v49 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buffer = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterface not found, waiting for it to appear",  (uint8_t *)buffer,  2u);
      }

      CFRunLoopRunResult v41 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0);
      io_registry_entry_t v39 = IOIteratorNext(*(io_iterator_t *)notification);
      BOOL v40 = v39 == 0;
    }

    while (!v39 && v41 != kCFRunLoopRunTimedOut);
  }

  CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(v2);
  IOObjectRelease(*(io_object_t *)notification);
  if (!v40 && (v41 == 0xFFFF || v41 == kCFRunLoopRunStopped))
  {
    v42 = (const __CFString *)IORegistryEntrySearchCFProperty( v39,  "IOService",  @"ACIPCInterfaceTransport",  kCFAllocatorDefault,  1u);
    if (!v42)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_1001590C8);
      }
      v50 = (os_log_s *)qword_100162428;
      int v46 = 0;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buffer = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterface found, ACIPCInterfaceTransport property not found",  (uint8_t *)buffer,  2u);
        int v46 = 0;
      }

      goto LABEL_79;
    }

    __int128 v43 = v42;
    *(void *)buffer = 0LL;
    *(void *)&buffer[8] = 0LL;
    if (CFStringGetCString(v42, buffer, 16LL, 0x600u))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100158FC8);
      }
      __int128 v44 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.ident) = 136315138;
        *(uintptr_t *)((char *)&buf.ident + 4) = (uintptr_t)buffer;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterfaceTransport %s\n",  (uint8_t *)&buf,  0xCu);
      }

      if (*(void *)buffer == 0x6B6C6177796B73LL)
      {
        int v69 = 0;
        while (1)
        {
          CFTypeRef v70 = IORegistryEntrySearchCFProperty(v39, "IOService", @"IOSkywalkNexusUUID", kCFAllocatorDefault, 1u);
          if (v70) {
            break;
          }
          usleep(0x30D40u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_100159048);
          }
          v71 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.ident) = 67109120;
            HIDWORD(buf.ident) = v69;
            _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Retry: %d - trying to find ACIPCInterfaceTransport + IOSkywalkNexusUUID\n",  (uint8_t *)&buf,  8u);
          }

          if (++v69 == 25)
          {
            int v46 = 0;
            goto LABEL_78;
          }
        }

        v88 = v70;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100159008);
        }
        v89 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.ident) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterfaceTransport + IOSkywalkNexusUUID found\n",  (uint8_t *)&buf,  2u);
        }

        CFRelease(v88);
        int v46 = 1;
        goto LABEL_78;
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159088);
      }
      v45 = (os_log_s *)qword_100162428;
      int v46 = 0;
      if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
LABEL_78:
        CFRelease(v43);
LABEL_79:
        BOOL v48 = v46 != 0;
        goto LABEL_80;
      }

      LOWORD(buf.ident) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterfaceTransport is not skywalk\n",  (uint8_t *)&buf,  2u);
    }

    else
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100158F88);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002A02C();
      }
    }

    int v46 = 0;
    goto LABEL_78;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159108);
  }
  v47 = (os_log_s *)qword_100162428;
  BOOL v48 = 0;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 67109120;
    *(_DWORD *)&buffer[4] = v41;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterface not found after 5 second -- runLoopResult = 0x%02x",  (uint8_t *)buffer,  8u);
    BOOL v48 = 0;
  }

LABEL_80:
  if (!v39)
  {
    if (v48) {
      goto LABEL_84;
    }
LABEL_19:
    uint64_t v105 = 0LL;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    memset(buffer, 0, sizeof(buffer));
    if (!qword_100160AA8)
    {
      uint64_t v25 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
      qword_100160AA8 = (uint64_t)dispatch_queue_create("com.apple.BlueTool.pcie", v25);
    }

    off_100160A50(buffer);
    *(_DWORD *)buffer = a1;
    *(_DWORD *)&buffer[24] = 1000;
    *(void *)&buffer[8] = qword_100160AA8;
    if (a1 == 2) {
      *(_DWORD *)&buffer[32] |= 8u;
    }
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 0x40000000LL;
    v98[2] = sub_100007040;
    v98[3] = &unk_100158D88;
    int v99 = a1;
    *(void *)&buffer[16] = v98;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158DC8);
    }
    uint64_t v26 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = "BTI";
      if (a1 == 2) {
        uint64_t v27 = "HCI";
      }
      LODWORD(buf.ident) = 136315138;
      *(uintptr_t *)((char *)&buf.ident + 4) = (uintptr_t)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "PCIe creating %s transport\n",  (uint8_t *)&buf,  0xCu);
    }

    if ((off_100160A58(buffer, &qword_100160A90) & 1) != 0)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100158E48);
      }
      uint64_t v28 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = "BTI";
        if (a1 == 2) {
          uint64_t v29 = "HCI";
        }
        LODWORD(buf.ident) = 136315138;
        *(uintptr_t *)((char *)&buf.ident + 4) = (uintptr_t)v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "PCIe successfully created %s transport\n",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t result = 0LL;
      strcpy((char *)&xmmword_100161FC0, "PCIE");
      off_1001623D0 = (uint64_t (*)(void, void, void))sub_100007224;
      off_1001623D8 = sub_10000722C;
      off_1001623E0 = (uint64_t (*)(void))sub_100007238;
      off_1001623E8 = sub_100007240;
      off_1001623F0 = (uint64_t (*)(void, void, void, void))sub_100007374;
      off_100162400 = (uint64_t (*)(void))sub_100007440;
      off_1001623F8 = (uint64_t (*)(void, void))sub_100007444;
      off_100162408 = (uint64_t (*)(void))nullsub_1;
      off_100162410 = (uint64_t (*)(void))nullsub_2;
      dword_100162418 = 0;
      qword_1001623C0 = 0LL;
      dword_1001623C8 = 1;
      byte_10016241C = 1;
      return result;
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158E08);
    }
    uint64_t v31 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029BF4(a1 == 2, v31, v32, v33, v34, v35, v36, v37);
    }
    return 0xFFFFFFFFLL;
  }

  IOObjectRelease(v39);
  if (!v48) {
    goto LABEL_19;
  }
LABEL_84:
  qword_100160A98 = 0LL;
  qword_100160AA0 = -1LL;
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_1001593C8);
  }
  memset(&buf, 0, sizeof(buf));
  memset(uu, 0, sizeof(uu));
  memset(buffer, 0, 37);
  v51 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)notification = 136315138;
    *(void *)&notification[4] = "hci";
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "retrieving uuid for %s", notification, 0xCu);
  }

  CFMutableDictionaryRef v52 = IOServiceMatching("AppleConvergedIPCInterface");
  if (!v52)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159408);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029DC0();
    }
    goto LABEL_139;
  }

  v53 = v52;
  CFStringRef v54 = CFStringCreateWithCString(kCFAllocatorDefault, "hci", 0x600u);
  if (!v54)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159448);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029DEC();
    }
    goto LABEL_122;
  }

  CFStringRef v55 = v54;
  CFDictionarySetValue(v53, @"ACIPCInterfaceProtocol", v54);
  CFRelease(v55);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v53);
  if (!MatchingService)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159548);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029E18();
    }
    goto LABEL_139;
  }

  io_object_t v57 = MatchingService;
  v53 = (__CFDictionary *)IORegistryEntrySearchCFProperty( MatchingService,  "IOService",  @"IOSkywalkNexusUUID",  kCFAllocatorDefault,  1u);
  IOObjectRelease(v57);
  if (!v53)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159508);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029E44();
    }
    goto LABEL_139;
  }

  if (!CFStringGetCString((CFStringRef)v53, buffer, 37LL, 0x600u))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159488);
    }
    v80 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029E70(v80, v81, v82, v83, v84, v85, v86, v87);
    }
LABEL_122:
    CFRelease(v53);
LABEL_139:
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159188);
    }
    v72 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029D50(v72, v73, v74, v75, v76, v77, v78, v79);
    }
    return 0xFFFFFFFFLL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_1001594C8);
  }
  v58 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)notification = 136315394;
    *(void *)&notification[4] = "hci";
    __int16 v109 = 2080;
    v110 = buffer;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "protocol: %s, uuidstr: %s",  notification,  0x16u);
  }

  uuid_parse(buffer, uu);
  CFRelease(v53);
  uint64_t v59 = os_channel_create(uu, 0LL);
  if (!v59)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001591C8);
    }
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      goto LABEL_174;
    }
    sub_100029F50();
    goto LABEL_172;
  }

  uint64_t v60 = v59;
  qword_100160A98 = v59;
  uint64_t v61 = os_channel_attr_create();
  if (v61)
  {
    uint64_t v62 = v61;
    if (!os_channel_read_attr(v60, v61))
    {
      *(void *)notification = 0LL;
      uint64_t v100 = 0LL;
      uint64_t v101 = 0LL;
      os_channel_attr_get(v62, 4LL, notification);
      os_channel_attr_get(v62, 3LL, &v101);
      os_channel_attr_get(v62, 2LL, &v100);
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159208);
      }
      v63 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 134218496;
        *(void *)&buffer[4] = *(void *)notification;
        *(_WORD *)&buffer[12] = 2048;
        *(void *)&buffer[14] = v101;
        *(_WORD *)&buffer[22] = 2048;
        *(void *)&buffer[24] = v100;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "skywalk channel slotlen: %llu, rxslots: %llu, txslots: %llu",  (uint8_t *)buffer,  0x20u);
      }
    }

    os_channel_attr_destroy(v62);
  }

  int v64 = kqueue();
  if (v64 == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159248);
    }
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      goto LABEL_174;
    }
    sub_100029F7C();
    goto LABEL_172;
  }

  int v65 = v64;
  LODWORD(qword_100160AA0) = v64;
  buf.ident = (int)os_channel_get_fd(v60);
  memset(&buf.fflags, 0, 20);
  *(_DWORD *)&buf.filter = 393214;
  if (kevent(v65, &buf, 1, 0LL, 0, 0LL) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159288);
    }
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      goto LABEL_174;
    }
    sub_100029FA8();
    goto LABEL_172;
  }

  int v66 = kqueue();
  if (v66 == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001592C8);
    }
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      goto LABEL_174;
    }
    sub_100029FD4();
    goto LABEL_172;
  }

  int v67 = v66;
  HIDWORD(qword_100160AA0) = v66;
  buf.ident = (int)os_channel_get_fd(v60);
  *(_DWORD *)&buf.filter = 393215;
  *(void *)((unint64_t)&buf | 0xC) = 0LL;
  *(void *)(((unint64_t)&buf | 0xC) + 8) = 0LL;
  *(_DWORD *)(((unint64_t)&buf | 0xC) + 0x10) = 0;
  if (kevent(v67, &buf, 1, 0LL, 0, 0LL) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159308);
    }
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      goto LABEL_174;
    }
    sub_10002A000();
LABEL_172:
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159388);
    }
LABEL_174:
    v90 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_100029EE0(v90, v91, v92, v93, v94, v95, v96, v97);
    }
    sub_100007DA8((uint64_t)&qword_100160A98);
    return 0xFFFFFFFFLL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159348);
  }
  v68 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 136315138;
    *(void *)&buffer[4] = "hci";
    _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "channel created successfully for %s",  (uint8_t *)buffer,  0xCu);
  }

  uint64_t result = 0LL;
  strcpy((char *)&xmmword_100161FC0, "PCIE");
  off_1001623D0 = (uint64_t (*)(void, void, void))sub_1000078B0;
  off_1001623D8 = sub_1000078B8;
  off_1001623E0 = (uint64_t (*)(void))sub_1000078C4;
  off_1001623E8 = (uint64_t (*)(void, void, void))sub_1000078CC;
  off_1001623F0 = (uint64_t (*)(void, void, void, void))sub_100007C90;
  off_100162400 = (uint64_t (*)(void))sub_100007D48;
  dword_100162418 = 0;
  off_1001623F8 = (uint64_t (*)(void, void))sub_100007D68;
  qword_1001623C0 = 0LL;
  off_100162408 = (uint64_t (*)(void))nullsub_3;
  off_100162410 = (uint64_t (*)(void))nullsub_4;
  dword_1001623C8 = 1;
  byte_10016241C = 1;
  return result;
}

uint64_t sub_100006E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  if ((off_100160A60(qword_100160A90, a1, a2, (char *)&v5 + 4, 2000LL, &v5, 0LL) & 1) != 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158D28);
    }
    uint64_t v2 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "PCIe successfully transferred FW File\n",  v4,  2u);
    }

    sub_100006F94();
    byte_100160A80 = 1;
    return sub_100005B74(2);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100158CE8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A0B8();
    }
    return 0xFFFFFFFFLL;
  }
}

void sub_100006F34(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100006F64(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100006F94()
{
  if (dword_1001623C8)
  {
    if ((off_100160A78(&qword_100160A90) & 1) == 0)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159908);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002A0E4();
      }
    }

    dispatch_release((dispatch_object_t)qword_100160AA8);
    qword_100160AA8 = 0LL;
    dword_1001623C8 = 0;
    byte_10016241C = 0;
  }

void sub_100007040(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100158D68);
  }
  CFStringRef v8 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    int v9 = *(_DWORD *)(a1 + 32);
    int v11 = 136315906;
    if (v9 == 2) {
      uint64_t v10 = "HCI";
    }
    else {
      uint64_t v10 = "BTI";
    }
    uint64_t v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2048;
    uint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "PCIe %s transport got status %u with args %p and %p\n",  (uint8_t *)&v11,  0x26u);
  }

void sub_100007164(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007194(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000071C4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000071F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100007224()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000722C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007240(a1, a2 + 1, a3 - 1);
}

uint64_t sub_100007238()
{
  return 0LL;
}

uint64_t sub_100007240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = 0;
  int v4 = off_100160A70(qword_100160A90, a2, a3, &v8, 0xFFFFFFFFLL, 0LL);
  uint64_t result = 0LL;
  if (v4) {
    BOOL v6 = v8 == a3;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159888);
    }
    CFStringRef v7 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)kevent buf = 67109632;
      int v10 = v4;
      __int16 v11 = 1024;
      int v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "PCIe write failed: ret %u, written %u, expected %zu\n",  buf,  0x18u);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_100007374(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v8 = 0;
  if ((off_100160A68(qword_100160A90, a2, a3, &v8, 0xFFFFFFFFLL, 0LL) & 1) != 0)
  {
    uint64_t result = 0LL;
    uint64_t v7 = v8;
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001598C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A110((uint64_t)&v8, a3);
    }
    uint64_t v7 = 0LL;
    uint64_t result = 0xFFFFFFFFLL;
  }

  *a4 = v7;
  return result;
}

uint64_t sub_100007444()
{
  return 0LL;
}

void sub_100007454(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007484(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000074B4(__CFRunLoop *a1)
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159148);
  }
  uint64_t v2 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "ACIPCInterface found, releasing waiting thread",  v3,  2u);
  }

  CFRunLoopStop(a1);
}

void sub_100007550(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007580(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000075B0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000075E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007610(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007640(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007670(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000076A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000076D0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007700(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007730(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007760(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007790(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000077C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000077F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007820(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007850(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007880(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000078B0()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000078B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000078CC(a1, (const void *)(a2 + 1), a3 - 1);
}

uint64_t sub_1000078C4()
{
  return 0LL;
}

uint64_t sub_1000078CC(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3 = qword_100160A98;
  if (!qword_100160A98 || !a2 || (int v5 = qword_100160AA0, (_DWORD)qword_100160AA0 == -1))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159588);
    }
    int v12 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A184(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0xFFFFFFFFLL;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  *(_OWORD *)__dst = 0u;
  uint64_t v7 = os_channel_ring_id(qword_100160A98, 0LL);
  uint64_t v8 = os_channel_tx_ring(v3, v7);
  uint64_t next_slot = os_channel_get_next_slot(v8, 0LL, &v38);
  if (!next_slot)
  {
    while (1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_1001595C8);
      }
      int v10 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.ident) = 136315138;
        *(uintptr_t *)((char *)&buf.ident + 4) = (uintptr_t)"skywalk_write_channel";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s: empty slot. waiting for slot to become available",  (uint8_t *)&buf,  0xCu);
      }

      memset(&buf, 0, sizeof(buf));
      uint64_t v11 = os_channel_get_next_slot(v8, 0LL, &v38);
      if (v11)
      {
        uint64_t next_slot = v11;
        goto LABEL_23;
      }
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159608);
    }
    uint64_t v21 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A3D8(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    return 0xFFFFFFFFLL;
  }

LABEL_23:
  size_t v29 = WORD1(v38);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159648);
  }
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
    sub_10002A364();
  }
  if (v29 < a3)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159688);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A1F4();
    }
    return 0xFFFFFFFFLL;
  }

  memcpy(__dst[0], a2, a3);
  WORD1(v38) = a3;
  os_channel_set_slot_properties(v8, next_slot, &v38);
  if (os_channel_advance_slot(v8, next_slot))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001596C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A2F4();
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t result = os_channel_sync(v3, 0LL);
  if ((_DWORD)result)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159708);
    }
    uint64_t v30 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A284(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_100007C90(uint64_t a1, void *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v9 = 0LL;
  uint64_t result = sub_100004E88(&qword_100160A98, a2, a3, (size_t *)&v9);
  if ((_DWORD)result)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159748);
    }
    uint64_t v7 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A448(&v9, a3, v7);
    }
    uint64_t v8 = 0LL;
    uint64_t result = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = v9;
  }

  *a4 = v8;
  return result;
}

void sub_100007D48()
{
  if (dword_1001623C8) {
    sub_100007DA8((uint64_t)&qword_100160A98);
  }
}

uint64_t sub_100007D68()
{
  return 0LL;
}

void sub_100007D78(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007DA8(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 8);
    if (v2 != -1)
    {
      close(v2);
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_1001597C8);
      }
      uint64_t v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)kevent buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "closed sw_kq_write", buf, 2u);
      }

      *(_DWORD *)(a1 + 8) = -1;
    }

    int v4 = *(_DWORD *)(a1 + 12);
    if (v4 != -1)
    {
      close(v4);
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159808);
      }
      int v5 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "closed sw_kq_read", v8, 2u);
      }

      *(_DWORD *)(a1 + 12) = -1;
    }

    if (*(void *)a1)
    {
      os_channel_destroy();
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159848);
      }
      BOOL v6 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "closed sk_channel", v7, 2u);
      }

      *(void *)a1 = 0LL;
    }

    dword_1001623C8 = 0;
    byte_10016241C = 0;
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159788);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A4DC();
    }
  }

void sub_100007FB0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100007FE0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008010(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008040(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008070(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000080A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000080D0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008100(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008130(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008160(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008190(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000081C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000081F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008220(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008250(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008280(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000082B0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000082E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008310(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008340(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100008370(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000083A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000083D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000083E0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100008414( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008430( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008440(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_100008470( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_100008494(int a1, char *const *a2)
{
  optind = 1;
  while (2)
  {
    uint64_t v4 = getopt(a1, a2, "rhAa:NnBb:FptWcsSo:OURVQKw:q:");
    switch((int)v4)
    {
      case 'A':
        uint64_t v5 = qword_1001623C0;
        BOOL v6 = 0LL;
        return sub_10000AFD8(v5, v6);
      case 'B':
        int v7 = qword_1001623C0;
        uint64_t v8 = 0LL;
        return sub_10000AE84(v7, v8);
      case 'C':
      case 'D':
      case 'E':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'L':
      case 'M':
      case 'P':
      case 'T':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'u':
      case 'v':
        goto LABEL_4;
      case 'F':
        if (!dword_1001623C8) {
          goto LABEL_136;
        }
        uint64_t v9 = qword_1001623C0;
        LOWORD(v224) = 0;
        off_100162408(qword_1001623C0);
        sleep(2u);
        unsigned int v10 = sub_10000BD10();
        sub_10001A1A4(&v224, 0LL, 0LL, 0LL, 0LL, 0);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100159F88);
        }
        uint64_t v11 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002A874((unsigned __int16 *)&v224, v10, v11);
        }
        int v12 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = off_1001600B8[v10];
          *(_DWORD *)kevent buf = 136315650;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = dword_1001600D0;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = dword_1001600D4;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "ACI %s chip with sw version major=%d, minor=%d.\n",  buf,  0x18u);
        }

        int v14 = sub_10000B7C4();
        __int128 v169 = 0u;
        __int128 v170 = 0u;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        memset(buf, 0, sizeof(buf));
        uint64_t v15 = fopen("/etc/bluetool/bin_id.aci", "r");
        if (v15)
        {
          uint64_t v16 = v15;
          if (fgets((char *)buf, 32, v15))
          {
            int v17 = strtoul((const char *)buf, 0LL, 10);
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A188);
            }
            uint64_t v18 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v139 = 67109120;
              *(_DWORD *)&v139[4] = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CPF bin id: 0x%08x.\n", v139, 8u);
            }
          }

          else
          {
            int v17 = 0;
          }

          fclose(v16);
        }

        else
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A148);
          }
          uint64_t v85 = (os_log_s *)qword_100162428;
          if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
          {
            int v17 = 0;
            uint64_t v93 = -1LL;
            goto LABEL_224;
          }

          sub_10002A804(v85, v86, v87, v88, v89, v90, v91, v92);
          int v17 = 0;
        }

        uint64_t v93 = qword_100162420;
LABEL_224:
        if (v14 && v14 == v17)
        {
          if (v93 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A008);
          }
          uint64_t v111 = qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
          {
            v112 = off_1001600B8[v10];
            *(_DWORD *)kevent buf = 136315394;
            *(void *)&uint8_t buf[4] = v112;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v14;
            v113 = "ACI %s chip BIN_ID=%08x equals CPF bin_id -> Skip the boot.\n";
            v114 = (os_log_s *)v111;
            uint32_t v115 = 18;
            goto LABEL_263;
          }
        }

        else
        {
          if (v93 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A048);
          }
          v116 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
          {
            v117 = off_1001600B8[v10];
            *(_DWORD *)kevent buf = 136315650;
            *(void *)&uint8_t buf[4] = v117;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v14;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_INFO,  "ACI %s chip BIN_ID %08x differ from CPF bin_id %08x -> Go boot.\n",  buf,  0x18u);
          }

          if (v10 > 1)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A088);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002A7A4();
            }
          }

          else if (sub_10000C8F0("/etc/bluetool/aci_boot.hcd") {
                 || !sub_10000AC34(v9, "/etc/bluetool/aci_boot.hcd"))
          }
          {
            sub_10001D150("power off", 0LL);
            usleep(0xC350u);
            sub_10001D150("power on", 0LL);
            usleep(0xC350u);
            sub_10001D150("device -D", 0LL);
            if (!v10) {
              sleep(2u);
            }
            sub_10001D150("aci -B", 0LL);
            usleep(0xC350u);
            sub_10001D150("hci info", 0LL);
            sub_10001D150("hci cmd 0xfe1f", 0LL);
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A108);
            }
            uint64_t v118 = qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)kevent buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v10;
              v113 = "BOOT Done! for aci_platform=%d\n";
              goto LABEL_262;
            }
          }

          else
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A0C8);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002A744();
            }
          }
        }

        return 0LL;
      case 'K':
        __int128 v176 = 0u;
        memset(v177, 0, sizeof(v177));
        __int128 v174 = 0u;
        __int128 v175 = 0u;
        __int128 v172 = 0u;
        __int128 v173 = 0u;
        __int128 v170 = 0u;
        __int128 v171 = 0u;
        __int128 v168 = 0u;
        __int128 v169 = 0u;
        __int128 v166 = 0u;
        __int128 v167 = 0u;
        __int128 v164 = 0u;
        __int128 v165 = 0u;
        __int128 v162 = 0u;
        __int128 v163 = 0u;
        __int128 v160 = 0u;
        __int128 v161 = 0u;
        __int128 v158 = 0u;
        __int128 v159 = 0u;
        __int128 v157 = 0u;
        memset(buf, 0, sizeof(buf));
        uint64_t v19 = sub_1000263FC();
        uint64_t v20 = (const char *)sub_100026B38();
        if (v20 && !strcmp(v20, "APPLE_M1"))
        {
          int v29 = 98;
        }

        else
        {
          int v225 = -871113647;
          __int128 v224 = xmmword_10002E59E;
          int v223 = 1530707451;
          __int128 v222 = xmmword_10002E5B2;
          char __streamb = MGIsDeviceOneOfType(&v224);
          int v221 = 1472775220;
          __int128 v220 = xmmword_10002E5C6;
          int v219 = 483476120;
          __int128 v218 = xmmword_10002E5DA;
          char v134 = MGIsDeviceOneOfType(&v220);
          int v217 = 282158961;
          __int128 v216 = xmmword_10002E5EE;
          int v215 = 56502976;
          __int128 v214 = xmmword_10002E602;
          char v133 = MGIsDeviceOneOfType(&v216);
          int v213 = -961843768;
          __int128 v212 = xmmword_10002E616;
          int v211 = 1282132887;
          __int128 v210 = xmmword_10002E62A;
          char v132 = MGIsDeviceOneOfType(&v212);
          int v209 = -1092155788;
          __int128 v208 = xmmword_10002E63E;
          int v207 = 763775061;
          __int128 v206 = xmmword_10002E652;
          char v131 = MGIsDeviceOneOfType(&v208);
          int v205 = -63049871;
          __int128 v204 = xmmword_10002E666;
          int v203 = -557458837;
          __int128 v202 = xmmword_10002E67A;
          char v21 = MGIsDeviceOneOfType(&v204);
          int v201 = 1730000236;
          __int128 v200 = xmmword_10002E68E;
          char v22 = MGIsDeviceOneOfType(&v200);
          int v199 = 1530338216;
          __int128 v198 = xmmword_10002E6A2;
          int v197 = 406601745;
          __int128 v196 = xmmword_10002E6B6;
          char v23 = MGIsDeviceOneOfType(&v198);
          int v195 = 1654218604;
          __int128 v194 = xmmword_10002E6CA;
          int v193 = -1930811061;
          __int128 v192 = xmmword_10002E6DE;
          char v24 = MGIsDeviceOneOfType(&v194);
          int v191 = -182498503;
          __int128 v190 = xmmword_10002E6F2;
          char v25 = MGIsDeviceOneOfType(&v190);
          int v189 = 841005628;
          __int128 v188 = xmmword_10002E706;
          int v187 = -2030489149;
          __int128 v186 = xmmword_10002E71A;
          char v26 = MGIsDeviceOneOfType(&v188);
          int v185 = 1219348060;
          __int128 v184 = xmmword_10002E72E;
          int v183 = 223445260;
          __int128 v182 = xmmword_10002E742;
          char v27 = MGIsDeviceOneOfType(&v184);
          int v181 = -584398440;
          __int128 v180 = xmmword_10002E756;
          BOOL v28 = (((MGIsDeviceOneOfType(&v180) | v27 | v26 | v25 | v24 | v23 | v22 | v21 | v131 | v132 | v133) | (v134 | __streamb)) & 1) == 0;
          int v29 = 379;
          if (v28) {
            int v30 = 187;
          }
          else {
            int v30 = 379;
          }
          int v179 = -879476163;
          __int128 v178 = xmmword_10002E76A;
        }

        if (sub_100018E28((uint64_t)v19, buf))
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A448);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002A718();
          }
          off_100162408(qword_1001623C0);
          uint64_t v36 = 22LL;
          goto LABEL_154;
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A408);
        }
        uint64_t v94 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v139 = 67109634;
          *(_DWORD *)&v139[4] = v29;
          *(_WORD *)&v139[8] = 1040;
          *(_DWORD *)&v139[10] = v29;
          *(_WORD *)&v139[14] = 2096;
          *(void *)&__int128 v140 = buf;
          _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_INFO,  "Regulatory Data (%d bytes): %.*P",  v139,  0x18u);
        }

        off_100162408(qword_1001623C0);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A2C8);
        }
        uint64_t v95 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "Power tables exist for this device",  v139,  2u);
        }

        if (!sub_100026B38())
        {
          *__error() = 94;
          uint64_t v36 = 30LL;
          goto LABEL_154;
        }

        uint64_t v96 = buf;
        do
        {
          if (*v96 != 1)
          {
            *__error() = 94;
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A488);
            }
            v120 = (os_log_s *)qword_100162428;
            if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = 24LL;
              goto LABEL_156;
            }

            sub_10002A6B0((uint64_t)v96, v120, v121, v122, v123, v124, v125, v126);
            uint64_t v36 = 24LL;
            goto LABEL_154;
          }

          uint64_t v97 = v96[3] + 4LL;
          if (off_1001623D8(qword_1001623C0, v96, v97) == -1)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A4C8);
            }
            if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = 3LL;
              goto LABEL_156;
            }

            sub_10002A658();
            uint64_t v36 = 3LL;
LABEL_154:
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A308);
            }
            goto LABEL_156;
          }

          unsigned int v98 = *(unsigned __int16 *)(v96 + 1);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A508);
          }
          int v99 = (os_log_s *)qword_100162428;
          BOOL v100 = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
          if (v100)
          {
            *(_DWORD *)v139 = 67109120;
            *(_DWORD *)&v139[4] = v98;
            _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_INFO,  "aci_download_power_tables: Handle opcode 0x%04x",  v139,  8u);
          }

          if (v98 == 65411)
          {
            usleep(0xBB8u);
            goto LABEL_186;
          }

          if ((sub_10000B958(v100, v98) & 0x80000000) != 0)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015A548);
            }
            if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = 255LL;
LABEL_156:
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002A62C();
              }
              goto LABEL_158;
            }

            sub_10002A684();
            uint64_t v36 = 255LL;
            goto LABEL_154;
          }

          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A588);
          }
          uint64_t v101 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v139 = 67109120;
            *(_DWORD *)&v139[4] = v98;
            _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_INFO,  "aci_download_power_tables: opcode 0x%04x pass",  v139,  8u);
          }

LABEL_186:
          v96 += v97;
          v29 -= v97;
        }

        while ((_WORD)v29);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A348);
        }
        v127 = (os_log_s *)qword_100162428;
        uint64_t v36 = 0LL;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v139 = 0;
          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Power tables download Done!", v139, 2u);
          uint64_t v36 = 0LL;
        }

LABEL_158:
        *(void *)&__int128 v224 = 0LL;
        __int128 v153 = 0u;
        __int128 v154 = 0u;
        __int128 v151 = 0u;
        __int128 v152 = 0u;
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        *(_OWORD *)v139 = 0u;
        __int128 v140 = 0u;
        LOBYTE(v222) = 0;
        sub_10001B0EC(64817, (uint64_t)&v222, 1uLL, (uint64_t)v139, &v224, 14);
        if (v139[3])
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A3C8);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002A600();
          }
        }

        else
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A388);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
            sub_10002A5C8();
          }
        }

        return v36;
      case 'N':
        uint64_t v31 = qword_1001623C0;
        uint64_t v32 = 0LL;
        return sub_10000B1E8(v31, (uint64_t)v32);
      case 'O':
        if (!dword_1001623C8) {
          goto LABEL_136;
        }
        uint64_t v33 = (const char *)sub_100026B38();
        if (v33 && !strcmp(v33, "ACIFPGA")) {
          sleep(2u);
        }
        else {
          usleep(0xC350u);
        }
        return 0LL;
      case 'Q':
        uint64_t v34 = 0LL;
        goto LABEL_80;
      case 'R':
        memset(&buf[4], 0, 24);
        *(_DWORD *)kevent buf = 419316737;
        CCRandomGenerateBytes(&buf[4], 0x18uLL);
        uint64_t v35 = off_1001623D8(qword_1001623C0, buf, 28LL);
        if ((_DWORD)v35 != -1) {
          return (unsigned __int16)sub_10000B958(v35, 0xFE44u);
        }
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A848);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002A934();
        }
        return 0xFFFFLL;
      case 'S':
        uint64_t v37 = qword_1001623C0;
        bzero(buf, 0x780uLL);
        bzero(v139, 0x780uLL);
        *(void *)&buf[8] = "cmd";
        *(void *)&uint8_t buf[16] = "0x1009";
        sub_10001A404(3, (const char **)buf, (char **)v139);
        *(void *)&buf[8] = "cmd";
        *(void *)&uint8_t buf[16] = "0xc1a";
        *(void *)&buf[24] = "0x03";
        sub_10001A404(4, (const char **)buf, (char **)v139);
        *(void *)&buf[8] = "cmd";
        *(void *)&uint8_t buf[16] = "0xc05";
        *(void *)&buf[24] = "0x02";
        *(void *)&__int128 v157 = "0x00";
        *((void *)&v157 + 1) = "0x03";
        sub_10001A404(6, (const char **)buf, (char **)v139);
        *(void *)&buf[8] = "cmd";
        *(void *)&uint8_t buf[16] = "0xfe10";
        *(void *)&buf[24] = "0x01";
        *(void *)&__int128 v157 = "0x78";
        *((void *)&v157 + 1) = "0xff";
        *(void *)&__int128 v158 = "0x01";
        *((void *)&v158 + 1) = "0xff";
        sub_10001A404(8, (const char **)buf, (char **)v139);
        *(void *)&buf[8] = "cmd";
        *(void *)&uint8_t buf[16] = "0xfe11";
        sub_10001A404(3, (const char **)buf, (char **)v139);
        sub_10000AFD8(v37, "06:05:04:03:02:01");
        return 0LL;
      case 'U':
        WORD4(v222) = 0;
        *(void *)&__int128 v222 = 0LL;
        __int16 v155 = 0;
        __int128 v153 = 0u;
        __int128 v154 = 0u;
        __int128 v151 = 0u;
        __int128 v152 = 0u;
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        *(_OWORD *)v139 = 0u;
        __int128 v140 = 0u;
        *(void *)&__int128 v220 = 0LL;
        bzero(buf, 0x400uLL);
        __int128 v38 = (const char *)sub_100026B38();
        off_1001623E8(qword_1001623C0, &unk_10002E59B, 3LL);
        do
          off_1001623F0(qword_1001623C0, v139, 258LL, &v220);
        while (v139[0] != 14);
        int __stream = *(unsigned __int16 *)&v139[6];
        int v135 = *(unsigned __int16 *)&v139[8];
        int v39 = *(unsigned __int16 *)&v139[10];
        int v40 = *(unsigned __int16 *)&v139[12];
        if (!v38) {
          goto LABEL_44;
        }
        if (!strcmp(v38, "APPLE_M1"))
        {
          LODWORD(v38) = *(unsigned __int16 *)&v139[14];
          int v42 = (unsigned __int16)v140;
          int v41 = WORD1(v140);
        }

        else
        {
          if (strcmp(v38, "APPLE_M2") && strcmp(v38, "APPLE_M2_5"))
          {
            LODWORD(v38) = 0;
LABEL_44:
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
LABEL_194:
            sub_100018CD8((uint64_t)buf);
            LODWORD(v222) = 16654081;
            if (off_1001623D8(qword_1001623C0, &v222, 4LL) == -1)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015A708);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002A934();
              }
            }

            else
            {
              __int16 v155 = 0;
              __int128 v153 = 0u;
              __int128 v154 = 0u;
              __int128 v151 = 0u;
              __int128 v152 = 0u;
              __int128 v149 = 0u;
              __int128 v150 = 0u;
              __int128 v147 = 0u;
              __int128 v148 = 0u;
              __int128 v145 = 0u;
              __int128 v146 = 0u;
              __int128 v143 = 0u;
              __int128 v144 = 0u;
              __int128 v141 = 0u;
              __int128 v142 = 0u;
              *(_OWORD *)v139 = 0u;
              __int128 v140 = 0u;
              do
                off_1001623F0(qword_1001623C0, v139, 258LL, &v220);
              while (v139[0] != 14);
              printf("pktlen %lu\n", (void)v220);
              v102.i32[0] = *(_DWORD *)&v139[2];
              if (vmovn_s16((int16x8_t)vmovl_u8(v102)).u32[0] == 16654081)
              {
                dword_1001600D0 = v139[6];
                dword_1001600D4 = v139[7];
                if (v139[6] == 8 && v139[7] == 32)
                {
                  int v103 = v42;
                  int v104 = v41;
                  int v105 = (int)v38;
                  if (qword_100162420 != -1) {
                    dispatch_once(&qword_100162420, &stru_10015A788);
                  }
                  v106 = (os_log_s *)qword_100162428;
                  if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO)) {
                    goto LABEL_286;
                  }
                  LODWORD(v224) = 67109888;
                  DWORD1(v224) = v139[6];
                  WORD4(v224) = 1024;
                  *(_DWORD *)((char *)&v224 + 10) = v139[7];
                  HIWORD(v224) = 1024;
                  int v225 = v139[8];
                  __int16 v226 = 1024;
                  int v227 = v139[9];
                  v107 = "Default ACI BGA SW version: %d.%d, chip revision: %d, chip mode=%d";
                }

                else
                {
                  int v103 = v42;
                  if (v139[6] > 1u || v139[6] == 1 && v139[7] >= 0xBu)
                  {
                    int v104 = v41;
                    int v105 = (int)v38;
                    if (qword_100162420 != -1) {
                      dispatch_once(&qword_100162420, &stru_10015A7C8);
                    }
                    __int16 v109 = (os_log_s *)qword_100162428;
                    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
                    {
                      LODWORD(v224) = 67110144;
                      DWORD1(v224) = v139[6];
                      WORD4(v224) = 1024;
                      *(_DWORD *)((char *)&v224 + 10) = v139[7];
                      HIWORD(v224) = 1024;
                      int v225 = v139[8];
                      __int16 v226 = 1024;
                      int v227 = v139[9];
                      __int16 v228 = 1024;
                      int v229 = v139[10];
                      _os_log_impl( (void *)&_mh_execute_header,  v109,  OS_LOG_TYPE_INFO,  "SW version: %d.%d.%d, chip revision: %d, chip mode=%d",  (uint8_t *)&v224,  0x20u);
                    }

                    dword_100161FA8 = v139[8];
                    unsigned int v110 = 9;
LABEL_287:
                    uint64_t v128 = v110;
                    int v129 = *(unsigned __int8 *)((unint64_t)v139 | v110);
                    switch(v129)
                    {
                      case 255:
                        v130 = "CHIP is: FPGA";
                        break;
                      case 32:
                        v130 = "CHIP is: BGA";
                        break;
                      case 15:
                        v130 = "CHIP is: TRIO";
                        break;
                      default:
LABEL_294:
                        printf("MAC FW Version:              %d.%d.%d.%d\n", __stream, v135, v39, v40);
                        printf("PHY FW Version:              %d.%d.%d.%d\n", v105, v103, v104, v43);
                        printf( "Chip Revision:               %02x\n",  *(unsigned __int8 *)(v128 | (unint64_t)v139));
                        printf( "Chip mode:                   %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 1));
                        printf( "ROOT Clock:                  %02x%02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 3),  *(unsigned __int8 *)(v128 | (unint64_t)v139 | 2));
                        printf( "Slow Clock used:             %02x\n",  *(unsigned __int8 *)(v128 | (unint64_t)v139 | 4));
                        printf( "Process Type:                %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 5));
                        printf( "ODP proccess:                %02x\n",  *(unsigned __int8 *)(v128 | (unint64_t)v139 | 6));
                        if ((unint64_t)v220 >= 0x3D)
                        {
                          printf( "Deep Sleep Mode:             %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 7));
                          printf( "Whitening Mode:              %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 8));
                          printf( "CDC Mode:                    %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 9));
                          printf( "Hopping Mode:                %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xA));
                          printf( "HCI UART Baud Rate:          %02x%02x%02x%02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xE),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xD),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xC),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xB));
                          printf( "Temperature Index:           %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0xF));
                          printf( "Detected Temperature:        %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x10));
                          printf( "FREF/TCXO Clock:             %02x%02x\n",  v139[v128 | 0x12],  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x11));
                          printf( "PLL Sharing Running Mode:    %02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x13));
                          printf("RF Type:                     %02x\n", v139[v128 | 0x14]);
                          printf( "RTL Version:                 %02x%02x\n",  v139[v128 | 0x16],  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x15));
                          printf( "FPGA User Code:              %02x%02x%02x%02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1A),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x19),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x18),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x17));
                          printf( "MAC bin id:                  %02x%02x%02x%02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1E),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1D),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1C),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1B));
                          printf( "PHY bin id:                  %02x%02x%02x%02x\n",  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x22),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x21),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x20),  *(unsigned __int8 *)((v128 | (unint64_t)v139) + 0x1F));
                        }

                        off_1001623E8(qword_1001623C0, &unk_10002E859, 3LL);
                        do
                          off_1001623F0(qword_1001623C0, v139, 258LL, &v220);
                        while (v139[0] != 14);
                        printf("Bluetooth Address:           %02x:%02x:%02x:%02x:%02x:%02x\n");
                        return 0LL;
                    }

                    puts(v130);
                    goto LABEL_294;
                  }

                  int v104 = v41;
                  int v105 = (int)v38;
                  if (qword_100162420 != -1) {
                    dispatch_once(&qword_100162420, &stru_10015A808);
                  }
                  v106 = (os_log_s *)qword_100162428;
                  if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
                  {
LABEL_286:
                    unsigned int v110 = 8;
                    goto LABEL_287;
                  }

                  LODWORD(v224) = 67109888;
                  DWORD1(v224) = v139[6];
                  WORD4(v224) = 1024;
                  *(_DWORD *)((char *)&v224 + 10) = v139[7];
                  HIWORD(v224) = 1024;
                  int v225 = v139[8];
                  __int16 v226 = 1024;
                  int v227 = v139[9];
                  v107 = "SW version: %d.%d, chip revision: %d, chip mode=%d";
                }

                _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, v107, (uint8_t *)&v224, 0x1Au);
                goto LABEL_286;
              }

              *__error() = 94;
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015A748);
              }
              v108 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v224) = 67110656;
                DWORD1(v224) = v139[2];
                WORD4(v224) = 1024;
                *(_DWORD *)((char *)&v224 + 10) = v139[3];
                HIWORD(v224) = 1024;
                int v225 = v139[4];
                __int16 v226 = 1024;
                int v227 = v139[5];
                __int16 v228 = 1024;
                int v229 = v139[6];
                __int16 v230 = 1024;
                int v231 = v139[7];
                __int16 v232 = 1024;
                int v233 = 65055;
                _os_log_error_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_ERROR,  "EVNT: Invalid opcode Got:[0x%x 0x%x 0x%x 0x%x 0x%x 0x%x], waiting for [0x%x] !",  (uint8_t *)&v224,  0x2Cu);
              }
            }

            return 0xFFFFLL;
          }

          LODWORD(v38) = *(unsigned __int16 *)&v139[14];
          int v41 = (unsigned __int16)v140;
          int v42 = WORD1(v140);
        }

        int v43 = WORD2(v140);
        __sprintf_chk( (char *)buf,  0,  0x400uLL,  "MAC FW Version: %d.%d.%d.%d, PHY FW Version: %d.%d.%d.%d",  __stream,  v135,  v39,  v40,  (_DWORD)v38,  v42,  v41,  WORD2(v140));
        goto LABEL_194;
      case 'V':
        else {
          __int128 v44 = "Using ACI Chipset changes (ACI_BT_SW_%d_%04d_%04d)\n\n";
        }
        printf(v44, 9LL, 27LL, 25LL);
        return 0LL;
      case 'W':
        if (!dword_1001623C8)
        {
LABEL_136:
          uint64_t v36 = 1LL;
          fwrite("First open the port with device -D command\n", 0x2BuLL, 1uLL, __stderrp);
          return v36;
        }

        uint64_t v45 = qword_1001623C0;
        off_100162408(qword_1001623C0);
        unsigned int v46 = sub_10000BD10();
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100159C48);
        }
        v47 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)kevent buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v46;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "aci_platform=%d\n", buf, 8u);
        }

        if (v46 > 1)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_100159C88);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002A568();
          }
        }

        else
        {
          if (sub_10000C8F0("/etc/bluetool/aci_init.hcd"))
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_100159D08);
            }
            BOOL v48 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)kevent buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Using default init file\n", buf, 2u);
            }

            uint64_t v49 = sub_100016AA0();
            if (v49) {
              sub_100018CD8(v49);
            }
            int v50 = sub_10000CAF8(v45, (uint64_t (*)(_BYTE *))sub_10000CD1C);
          }

          else
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_100159CC8);
            }
            v119 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)kevent buf = 136315138;
              *(void *)&uint8_t buf[4] = "/etc/bluetool/aci_init.hcd";
              _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_INFO,  "Using non-default init file: %s\n",  buf,  0xCu);
            }

            int v50 = sub_10000AC34(v45, "/etc/bluetool/aci_init.hcd");
          }

          if (v50)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_100159D48);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002A508();
            }
          }

          else
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_100159D88);
            }
            uint64_t v118 = qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)kevent buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v46;
              v113 = "INIT Done! for aci_platform=%d\n";
LABEL_262:
              v114 = (os_log_s *)v118;
              uint32_t v115 = 8;
LABEL_263:
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, v113, buf, v115);
            }
          }
        }

        return 0LL;
      case 'a':
        uint64_t v5 = qword_1001623C0;
        BOOL v6 = optarg;
        return sub_10000AFD8(v5, v6);
      case 'b':
        int v7 = qword_1001623C0;
        uint64_t v8 = optarg;
        return sub_10000AE84(v7, v8);
      case 'c':
        int v52 = qword_1001623C0;
        __int128 v169 = 0u;
        __int128 v170 = 0u;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        memset(buf, 0, sizeof(buf));
        v139[0] = 0;
        off_100162408(qword_1001623C0);
        v53 = fopen("/Users/doronk/test_temp/acl_data.txt", "w+");
        while (!read(v52, v139, 1uLL))
          ;
        if (v139[0] == 2)
        {
          read(v52, buf, 4uLL);
          size_t v54 = buf[2] | (buf[3] << 8);
          fprintf(__stderrp, "ACL data header 4 bytes=0x%x, 0x%x, 0x%x, 0x%x\n", buf[0], buf[1], buf[2], buf[3]);
          fprintf(__stderrp, "ACL data length=%d\n", v54);
          read(v52, buf, v54);
          if ((_DWORD)v54)
          {
            for (uint64_t i = 0LL; i != v54; ++i)
            {
              fprintf(__stderrp, "Data %d = 0x%x\n", i, buf[i]);
              fprintf(v53, "%d", buf[i]);
            }
          }
        }

        else
        {
          fprintf(__stderrp, "No ACL data, first byte=%d\n", v139[0]);
        }

        uint64_t v84 = v53;
        goto LABEL_131;
      case 'h':
        fprintf(__stderrp, "%s - ACI Specific Commands\n", *(const char **)a2);
        fwrite("-V    - Print ACI version information\n", 0x26uLL, 1uLL, __stderrp);
        fwrite("-W    - Download ACI init script internally or from /etc/bluetool/\n", 0x43uLL, 1uLL, __stderrp);
        fwrite("-w    - Download HCD file from /path/to/hcd/file.hcd\n", 0x35uLL, 1uLL, __stderrp);
        fwrite("-b    - Set the baud rate - Baud Rate (UART only)\n", 0x32uLL, 1uLL, __stderrp);
        fwrite("-B    - Set the baud rate using a predefined value (UART only)\n", 0x3FuLL, 1uLL, __stderrp);
        fwrite("-a    - Set BDADDR - 00:00:00:00:00:00\n", 0x27uLL, 1uLL, __stderrp);
        fwrite("-A    - Set BDADDR using devicetree\n", 0x24uLL, 1uLL, __stderrp);
        fwrite("-n    - Set the local name - Local Name\n", 0x28uLL, 1uLL, __stderrp);
        fwrite("-p    - Routes sco over PCM\n", 0x1CuLL, 1uLL, __stderrp);
        fwrite("-t    - Routes sco over Transport (HCI)\n", 0x28uLL, 1uLL, __stderrp);
        fwrite("-c    - Get ACL data, up to 256 bytes\n", 0x26uLL, 1uLL, __stderrp);
        fwrite("-s    - Get SCO data to file\n", 0x1DuLL, 1uLL, __stderrp);
        fwrite( "-S    - Set device for SCO over HCI, Set Event filter to accept any connection and change the bT address to 123456\n",  0x73uLL,  1uLL,  __stderrp);
        fwrite( "-o    - For ACI options: \n \t addr1- to change BT address to 123456, \n \t hcivoice- for voice over HCI (UART), \n \t pcmvoice- for voice over PCM include Trio L codec configuration script\n",  0xB5uLL,  1uLL,  __stderrp);
        fwrite( "-O    - Sleep delay after power on, adapted to different ACI chipsets (BGA, FPGA, etc...)\n",  0x5CuLL,  1uLL,  __stderrp);
        fwrite("-F    - Download FW RAM image HCD file from /etc/bluetool/\n", 0x3BuLL, 1uLL, __stderrp);
        fwrite("-U    - Get System Status \n", 0x1BuLL, 1uLL, __stderrp);
        fwrite("-R    - Set Rand Seed \n", 0x17uLL, 1uLL, __stderrp);
        fwrite("-Q    - Download MSF from ioreg\n", 0x20uLL, 1uLL, __stderrp);
        fwrite("-q    - Download MSF from /path/to/msf/msf.bin\n", 0x2FuLL, 1uLL, __stderrp);
        fwrite("-K    - Download power regulatory HCD file internally\n", 0x36uLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        return 0LL;
      case 'n':
        uint64_t v31 = qword_1001623C0;
        uint64_t v32 = optarg;
        return sub_10000B1E8(v31, (uint64_t)v32);
      case 'o':
        return 0LL;
      case 'p':
        *(_DWORD *)kevent buf = 33519616;
        goto LABEL_125;
      case 'q':
        uint64_t v34 = optarg;
LABEL_80:
        sub_10000B45C(v34);
        return 0LL;
      case 'r':
        return sub_10001743C(1);
      case 's':
        int v56 = qword_1001623C0;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        memset(buf, 0, sizeof(buf));
        v139[0] = 0;
        off_100162408(qword_1001623C0);
        __streama = fopen("/Users/doronk/test_temp/sco_data.txt", "w");
        do
        {
          ssize_t v57 = read(v56, v139, 1uLL);
          usleep(0x3E8u);
        }

        while ((unint64_t)(v57 + 1) < 2);
        int v58 = 0;
        char v59 = 1;
        while (1)
        {
          if ((v59 & 1) == 0)
          {
          }

          fprintf(__stderrp, "header=0x%x\n", v139[0]);
          if (v139[0] == 3)
          {
            unsigned int v73 = 0;
            int v74 = 0;
            do
            {
              unsigned int v75 = v73;
              ssize_t v76 = read(v56, &buf[(unsigned __int16)v74], 1uLL);
              v74 += v76 & ~(v76 >> 63);
              unsigned int v73 = v75 + 1;
            }

            while ((unsigned __int16)v74 <= 2u && v75 < 0x752F);
            if (v75 <= 0x752E)
            {
              size_t v78 = buf[2];
              if (!buf[2]) {
                goto LABEL_122;
              }
              unsigned int v79 = 0;
              int v80 = 0;
              do
              {
                unsigned int v81 = v79;
                ssize_t v82 = read(v56, &buf[(unsigned __int16)v80], 1uLL);
                v80 += v82 & ~(v82 >> 63);
                unsigned int v79 = v81 + 1;
              }

              while (v78 > (unsigned __int16)v80 && v81 < 0x752F);
              if (v81 <= 0x752E)
              {
LABEL_122:
                fprintf(__stderrp, "count = %d, length=%d\n", (unsigned __int16)++v58, v78);
                fwrite(buf, 1uLL, v78, __streama);
LABEL_123:
                char v59 = 0;
                continue;
              }
            }

            return 1LL;
          }

          if (v139[0] != 4) {
            break;
          }
          unsigned int v60 = 0;
          int v61 = 0;
          do
          {
            unsigned int v62 = v60;
            ssize_t v63 = read(v56, &buf[(unsigned __int16)v61], 1uLL);
            v61 += v63 & ~(v63 >> 63);
            unsigned int v60 = v62 + 1;
          }

          while ((unsigned __int16)v61 <= 1u && v62 < 0x752F);
          if (v62 > 0x752E) {
            return 1LL;
          }
          fprintf(__stderrp, "Event opcode=0x%x, length=%d\n", buf[0], buf[1]);
          char v59 = 0;
          uint64_t v65 = buf[1];
          if (buf[1])
          {
            unsigned int v66 = 0;
            int v67 = 0;
            do
            {
              unsigned int v68 = v66;
              ssize_t v69 = read(v56, &buf[(unsigned __int16)v67], 1uLL);
              v67 += v69 & ~(v69 >> 63);
              unsigned int v66 = v68 + 1;
            }

            while (v65 > (unsigned __int16)v67 && v68 < 0x752F);
            if (v68 <= 0x752E)
            {
              v71 = buf;
              do
              {
                int v72 = *v71++;
                fprintf(__stderrp, "R: 0x%02x\n", v72);
                --v65;
              }

              while (v65);
              goto LABEL_123;
            }

            return 1LL;
          }
        }

        fprintf(__stderrp, "No H4 data, first byte=%d, finish reading\n", v139[0]);
        uint64_t v84 = __streama;
LABEL_131:
        fclose(v84);
        return 0LL;
      case 't':
        *(_DWORD *)kevent buf = 33519617;
LABEL_125:
        uint8_t buf[4] = -1;
        sub_10001B0EC(65040, (uint64_t)buf, 5uLL, 0LL, 0LL, 0);
        return 0LL;
      case 'w':
        return sub_10000AC34(qword_1001623C0, optarg);
      default:
        if ((_DWORD)v4 == -1) {
          return 0LL;
        }
LABEL_4:
        fprintf(__stderrp, "Invalid option '%c'\n", v4);
        continue;
    }
  }

uint64_t sub_10000AC34(uint64_t a1, char *a2)
{
  int v4 = stat(a2, &v10);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015A1C8);
  }
  uint64_t v5 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)kevent buf = 67109378;
    *(_DWORD *)int v12 = v4;
    *(_WORD *)&v12[4] = 2080;
    *(void *)&v12[6] = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "stat_result=%d file path=%s", buf, 0x12u);
  }

  if (v4)
  {
    perror("stat ");
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A208);
    }
    BOOL v6 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      int v7 = ctime(&v10.st_mtimespec.tv_sec);
      *(_DWORD *)kevent buf = 136315394;
      *(void *)int v12 = v7;
      *(_WORD *)&v12[8] = 2048;
      *(void *)&v12[10] = v10.st_size;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "File last changed:%s File size=%lld Bytes",  buf,  0x16u);
    }
  }

  qword_100161FA0 = (uint64_t)fopen(a2, "r");
  if (qword_100161FA0)
  {
    sub_100018CD8((uint64_t)a2);
    uint64_t v8 = sub_10000CAF8(a1, sub_10000D274);
    fclose((FILE *)qword_100161FA0);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A248);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A960();
    }
    return 0xFFFFFFFFLL;
  }

  return v8;
}

uint64_t sub_10000AE84(int a1, char *__str)
{
  if (__str)
  {
    if (*__str == 36)
    {
      int v2 = __str + 1;
      uint64_t v3 = getenv(__str + 1);
      fprintf(__stderrp, "Overriding baud rate from environment variable: %s = %s\n", v2, v3);
      unint64_t v4 = strtoul(v3, 0LL, 0);
    }

    else
    {
      unint64_t v4 = strtoul(__str, 0LL, 0);
    }
  }

  else
  {
    unsigned int v5 = sub_100023BA0();
    if (v5) {
      unint64_t v4 = v5;
    }
    else {
      unint64_t v4 = 2400000LL;
    }
  }

  __int16 v12 = 0;
  int v8 = 83834369;
  __int16 v9 = v4;
  char v10 = BYTE2(v4);
  char v11 = BYTE3(v4);
  uint64_t v6 = off_1001623D8(qword_1001623C0, &v8, 8LL);
  if ((_DWORD)v6)
  {
    if ((v6 & 0x80000000) == 0) {
      *__error() = 5;
    }
  }

  else if ((sub_10000B958(v6, 0xFF36u) & 0x80000000) == 0)
  {
    off_1001623F8(qword_1001623C0, v4);
    return 0LL;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000AFD8(uint64_t a1, const char *a2)
{
  if (!a2)
  {
    WORD2(v14) = 0;
    LODWORD(v14) = 0;
    if (sub_100024150((unsigned __int8 *)&v14))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159A48);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002AA20();
      }
      return 0xFFFFFFFFLL;
    }

    v5.i32[0] = *(_DWORD *)((char *)&v14 + 2);
    int16x8_t v8 = (int16x8_t)vmovl_u8(v5);
    *(int16x4_t *)v8.i8 = vrev64_s16(*(int16x4_t *)v8.i8);
    v13[0] = vmovn_s16(v8).u32[0];
    LOBYTE(v13[1]) = BYTE1(v14);
    BYTE1(v13[1]) = v14;
LABEL_12:
    LODWORD(v9) = 117179905;
    v6.i32[0] = *(_DWORD *)((char *)v13 + 2);
    int16x8_t v10 = (int16x8_t)vmovl_u8(v6);
    *(int16x4_t *)v10.i8 = vrev64_s16(*(int16x4_t *)v10.i8);
    HIDWORD(v9) = vmovn_s16(v10).u32[0];
    uint64_t v14 = v9;
    char v15 = BYTE1(v13[0]);
    char v16 = v13[0];
    uint64_t v11 = off_1001623D8(qword_1001623C0, &v14, 10LL);
    if (!(_DWORD)v11) {
      return sub_10000B958(v11, 0xFC06u);
    }
    int v12 = v11;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159A88);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002A9C0();
      if (v12 < 0) {
        return 0xFFFFFFFFLL;
      }
    }

    else if (v12 < 0)
    {
      return 0xFFFFFFFFLL;
    }

    *__error() = 5;
    return 0xFFFFFFFFLL;
  }

  int v2 = a2;
  if (*a2 == 36)
  {
    uint64_t v3 = a2 + 1;
    unint64_t v4 = getenv(a2 + 1);
    fprintf(__stderrp, "Overriding BDADDR from environment variable: %s = %s\n", v3, v4);
    int v2 = v4;
  }

  uint64_t result = sub_10000C1B8(v2, (uint64_t)v13);
  if ((_DWORD)result != -1) {
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_10000B1E8(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)__s = 0u;
  __int128 v21 = 0u;
  if (a2)
  {
    int v2 = (char *)a2;
    if (*(_BYTE *)a2 == 36)
    {
      int v2 = getenv((const char *)(a2 + 1));
      fprintf(__stderrp, "Overriding hostname from environment variable: %s = %s\n");
    }

    else
    {
      fprintf(__stderrp, "Using passed hostname: %s\n");
    }
  }

  else
  {
    __int128 v34 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    *(_OWORD *)__s = 0uLL;
    __int128 v21 = 0uLL;
    j__gethostname(__s, 0x100uLL);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159B08);
    }
    int v2 = __s;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
      sub_10002AAB8();
    }
  }

  int v3 = strlen(v2);
  if (v3)
  {
    memset(v19, 0, sizeof(v19));
    int v18 = -133426431;
    unsigned int v4 = v3 - 1;
    if (v3 >= 1)
    {
      if (v4 >= 0xF7) {
        unsigned int v4 = 247;
      }
      uint64_t v5 = v4 + 1;
      uint8x8_t v6 = v19;
      do
      {
        char v7 = *v2++;
        *v6++ = v7;
        --v5;
      }

      while (v5);
    }

    uint64_t v8 = off_1001623D8(qword_1001623C0, &v18, 252LL);
    if ((_DWORD)v8 != -1) {
      return sub_10000B958(v8, 0xC13u);
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159B48);
    }
    int16x8_t v10 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002AA4C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_10000B45C(const char *a1)
{
  int v2 = (const char *)sub_100026B38();
  if (!v2)
  {
    int v3 = "UNKNOWN";
LABEL_7:
    fprintf(__stderrp, "No MSF supported for chip %s\n", v3);
    return;
  }

  int v3 = v2;
  if (strcmp(v2, "APPLE_M1"))
  {
    if (!strcmp(v3, "APPLE_M2") || !strcmp(v3, "APPLE_M2_5"))
    {
      sub_10000DA78(a1, 7);
      sub_10000DA78(a1, 6);
      return;
    }

    goto LABEL_7;
  }

  uint64_t v16 = 0LL;
  unsigned __int16 v15 = 0;
  uint64_t v14 = 0LL;
  memset(v23, 0, 256);
  if (!a1)
  {
LABEL_12:
    if (v15 % 0xF0u) {
      unsigned int v7 = v15 / 0xF0u + 1;
    }
    else {
      unsigned int v7 = v15 / 0xF0u;
    }
    fprintf(__stderrp, "MSF: size %d. numberOfChunks %d. chunkSize %d.\n", v15, v7, 240);
    if (v7)
    {
      __int16 v8 = 0;
      int v9 = 0;
      unsigned __int16 v10 = v15;
      do
      {
        memset(v22, 0, sizeof(v22));
        if (v10 >= 0xF0u) {
          int v11 = 240;
        }
        else {
          int v11 = v10;
        }
        __int16 v19 = v8;
        char v20 = v11;
        BOOL v21 = v10 < 0xF1u;
        __memcpy_chk(v22);
        sub_10001B0EC(64791, (uint64_t)&v19, (v11 + 4), (uint64_t)v23, &v14, 14);
        int v12 = v23[4];
        if (v23[4])
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015A888);
          }
          uint64_t v13 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)kevent buf = 67109120;
            int v18 = v12;
            _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "MSF Error in Cal data. reason %d",  buf,  8u);
          }
        }

        ++v9;
        unsigned __int16 v10 = v15 - 240;
        v15 -= 240;
        v8 += 240;
      }

      while (v9 < v7);
    }

    unsigned int v4 = __stderrp;
    uint64_t v5 = "MSF: Finished sending MSF file to device\n";
    size_t v6 = 41LL;
    goto LABEL_27;
  }

LABEL_10:
  unsigned int v4 = __stderrp;
  uint64_t v5 = "No MSF cal data in ioreg.\n";
  size_t v6 = 26LL;
LABEL_27:
  fwrite(v5, v6, 1uLL, v4);
  if (v16) {
    free(v16);
  }
}

uint64_t sub_10000B7BC()
{
  return 0LL;
}

uint64_t sub_10000B7C4()
{
  __int16 v21 = 0;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  unint64_t v3 = 0LL;
  off_1001623E8(qword_1001623C0, &unk_10002E598, 3LL);
  do
    off_1001623F0(qword_1001623C0, v6, 258LL, &v3);
  while (LOBYTE(v6[0]) != 14);
  if (v3 < 0x3D) {
    return 0LL;
  }
  uint64_t v0 = DWORD1(v7);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159948);
  }
  int v1 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)kevent buf = 67109120;
    int v5 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "MAC bin id: 0x%08x.\n", buf, 8u);
  }

  return v0;
}

void sub_10000B928(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000B958(uint64_t a1, unsigned int a2)
{
  unint64_t v7 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int16 v38 = 0;
  off_1001623F0(qword_1001623C0, &v22, 258LL, &v7);
  if (v7 < 4)
  {
LABEL_2:
    *__error() = 5;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159988);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002AB24();
    }
    return 0xFFFFFFFFLL;
  }

  while (v22 != 14)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_1001599C8);
    }
    unint64_t v3 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)kevent buf = 67109120;
      int v9 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "EVNT: Previous command did not complete yet: %02X",  buf,  8u);
    }

    __int16 v38 = 0;
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
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    off_1001623F0(qword_1001623C0, &v22, 258LL, &v7);
    if (v7 < 4) {
      goto LABEL_2;
    }
  }

  if (BYTE2(v22) != 1
    || BYTE3(v22) != a2
    || (BYTE4(v22) == a2 >> 8 ? (BOOL v4 = BYTE5(v22) == 0) : (BOOL v4 = 0), !v4))
  {
    *__error() = 94;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159A08);
    }
    int v5 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)kevent buf = 67110656;
      int v9 = v22;
      __int16 v10 = 1024;
      int v11 = BYTE1(v22);
      __int16 v12 = 1024;
      int v13 = BYTE2(v22);
      __int16 v14 = 1024;
      int v15 = BYTE3(v22);
      __int16 v16 = 1024;
      int v17 = BYTE4(v22);
      __int16 v18 = 1024;
      int v19 = BYTE5(v22);
      __int16 v20 = 1024;
      unsigned int v21 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "EVNT: Invalid opcode Got:[0x%x 0x%x 0x%x 0x%x 0x%x 0x%x], waiting for [0x%x] !",  buf,  0x2Cu);
    }

    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

void sub_10000BC7C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000BCAC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000BCDC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000BD10()
{
  __int16 v26 = 0;
  v25[1] = 0;
  uint64_t v8 = 0LL;
  v25[0] = 16654081;
  if (off_1001623D8(qword_1001623C0, v25, 4LL) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A5C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002A934();
    }
    return 255LL;
  }

  __int16 v24 = 0;
  memset(v23, 0, sizeof(v23));
  do
    off_1001623F0(qword_1001623C0, v23, 258LL, &v8);
  while (LOBYTE(v23[0]) != 14);
  v0.i32[0] = *(_DWORD *)((char *)v23 + 2);
  if (vmovn_s16((int16x8_t)vmovl_u8(v0)).u32[0] != 16654081)
  {
    *__error() = 94;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A608);
    }
    unint64_t v3 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)kevent buf = 67110656;
      int v10 = BYTE2(v23[0]);
      __int16 v11 = 1024;
      int v12 = BYTE3(v23[0]);
      __int16 v13 = 1024;
      int v14 = BYTE4(v23[0]);
      __int16 v15 = 1024;
      int v16 = BYTE5(v23[0]);
      __int16 v17 = 1024;
      int v18 = BYTE6(v23[0]);
      __int16 v19 = 1024;
      int v20 = BYTE7(v23[0]);
      __int16 v21 = 1024;
      int v22 = 65055;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "EVNT: Invalid opcode Got:[0x%x 0x%x 0x%x 0x%x 0x%x 0x%x], waiting for [0x%x] !",  buf,  0x2Cu);
    }

    return 255LL;
  }

  dword_1001600D0 = BYTE6(v23[0]);
  dword_1001600D4 = BYTE7(v23[0]);
  if (BYTE6(v23[0]) == 8 && BYTE7(v23[0]) == 32)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A648);
    }
    int v1 = (os_log_s *)qword_100162428;
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)kevent buf = 67109888;
    int v10 = BYTE6(v23[0]);
    __int16 v11 = 1024;
    int v12 = BYTE7(v23[0]);
    __int16 v13 = 1024;
    int v14 = BYTE8(v23[0]);
    __int16 v15 = 1024;
    int v16 = BYTE9(v23[0]);
    int v2 = "Default ACI BGA SW version: %d.%d, chip revision: %d, chip mode=%d";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, v2, buf, 0x1Au);
LABEL_33:
    uint64_t v6 = 8LL;
    goto LABEL_34;
  }

  if (BYTE6(v23[0]) <= 1u && (BYTE6(v23[0]) != 1 || BYTE7(v23[0]) < 0xBu))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A6C8);
    }
    int v1 = (os_log_s *)qword_100162428;
    if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)kevent buf = 67109888;
    int v10 = BYTE6(v23[0]);
    __int16 v11 = 1024;
    int v12 = BYTE7(v23[0]);
    __int16 v13 = 1024;
    int v14 = BYTE8(v23[0]);
    __int16 v15 = 1024;
    int v16 = BYTE9(v23[0]);
    int v2 = "SW version: %d.%d, chip revision: %d, chip mode=%d";
    goto LABEL_32;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015A688);
  }
  int v5 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)kevent buf = 67110144;
    int v10 = BYTE6(v23[0]);
    __int16 v11 = 1024;
    int v12 = BYTE7(v23[0]);
    __int16 v13 = 1024;
    int v14 = BYTE8(v23[0]);
    __int16 v15 = 1024;
    int v16 = BYTE9(v23[0]);
    __int16 v17 = 1024;
    int v18 = BYTE10(v23[0]);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "SW version: %d.%d.%d, chip revision: %d, chip mode=%d",  buf,  0x20u);
  }

  dword_100161FA8 = BYTE8(v23[0]);
  uint64_t v6 = 9LL;
LABEL_34:
  int v7 = *(unsigned __int8 *)((unint64_t)v23 | v6);
  if (v7 == 255) {
    return 0LL;
  }
  if (v7 != 32)
  {
    if (v7 == 15) {
      return 2LL;
    }
    return 0LL;
  }

  return 1LL;
}

uint64_t sub_10000C1B8(const char *a1, uint64_t a2)
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159AC8);
  }
  BOOL v4 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
  {
    sub_10002AB50(a1, v4);
    if (!a1) {
      return 0xFFFFFFFFLL;
    }
  }

  else if (!a1)
  {
    return 0xFFFFFFFFLL;
  }

  if (strlen(a1) < 0x11) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = (unsigned __int8 *)(a1 + 1);
  for (uint64_t i = 5LL; i != -1; --i)
  {
    int v8 = *(v6 - 1);
    unsigned int v9 = v8 - 48;
    unsigned int v10 = v8 - 97;
    else {
      char v11 = v8 - 55;
    }
    char v12 = v8 - 87;
    if (v10 > 5) {
      char v12 = v11;
    }
    if (v9 < 0xA) {
      char v12 = v9;
    }
    char v13 = 16 * v12;
    *(_BYTE *)(a2 + i) = v13;
    int v15 = *v6;
    v6 += 3;
    char v14 = v15;
    unsigned int v16 = v15 - 48;
    unsigned int v17 = v15 - 97;
    char v18 = v15 - 55;
    else {
      char v19 = v18;
    }
    char v20 = v14 - 87;
    if (v17 > 5) {
      char v20 = v19;
    }
    if (v16 < 0xA) {
      char v20 = v16;
    }
    *(_BYTE *)(a2 + i) = v20 | v13;
  }

  return 0LL;
}

void sub_10000C2E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C310(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C340(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C370(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C3A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000C3D0()
{
  __int16 v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v2 = 0LL;
  off_1001623E8(qword_1001623C0, &unk_10002E853, 3LL);
  do
    off_1001623F0(qword_1001623C0, v7, 258LL, &v2);
  while (LOBYTE(v7[0]) != 14);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159B88);
  }
  uint8x8_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)kevent buf = 67109376;
    int v4 = BYTE13(v7[0]);
    __int16 v5 = 1024;
    int v6 = BYTE12(v7[0]);
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "LMP Subversion: 0x%02X%02x", buf, 0xEu);
  }

  return WORD6(v7[0]);
}

void sub_10000C528(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

char *sub_10000C558(const char *a1)
{
  int v1 = (char *)a1;
  if (strchr(a1, 58) && strchr(v1, 44))
  {
    int v2 = sub_10000C3D0();
    unint64_t v3 = strtok(v1, ":,");
    if (v3)
    {
      __endptr = 0LL;
      while (1)
      {
        uint64_t v4 = strtol(v3, &__endptr, 0);
        __int16 v5 = strtok(0LL, ":,");
        int v1 = v5;
        if (v4 == v2) {
          break;
        }
        if (!v5) {
          return v1;
        }
        unint64_t v3 = strtok(0LL, ":,");
        if (!v3) {
          return 0LL;
        }
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159BC8);
      }
      int v7 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)kevent buf = 136315138;
        unsigned int v10 = v1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using HCD File: %s", buf, 0xCu);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

void sub_10000C6BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000C6EC(int a1, char *__str)
{
  int v11 = 0;
  uint64_t v10 = 0LL;
  uint64_t result = (uint64_t)strtok(__str, ",");
  if (result)
  {
    uint64_t v3 = 0LL;
    int v6 = 0LL;
    do
    {
      *((_BYTE *)&v10 + v3) = strtol((const char *)result, &v6, 0);
      uint64_t result = (uint64_t)strtok(0LL, ",");
      ++v3;
    }

    while (result);
    int v7 = 217851649;
    uint64_t v8 = v10;
    int v9 = v11;
    uint64_t v4 = off_1001623D8(qword_1001623C0, &v7, 16LL);
    if ((_DWORD)v4)
    {
      int v5 = v4;
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159C08);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
      {
        sub_10002ABD4();
        if (v5 < 0) {
          return 0xFFFFFFFFLL;
        }
      }

      else if (v5 < 0)
      {
        return 0xFFFFFFFFLL;
      }

      *__error() = 5;
      return 0xFFFFFFFFLL;
    }

    return sub_10000B958(v4, 0xFC27u);
  }

  return result;
}

void sub_10000C860(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C890(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000C8C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000C8F0(const char *a1)
{
  uint64_t v2 = stat(a1, &v7);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_100159DC8);
  }
  uint64_t v3 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)kevent buf = 67109378;
    *(_DWORD *)int v9 = v2;
    *(_WORD *)&v9[4] = 2080;
    *(void *)&v9[6] = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stat_result=%d file path=%s", buf, 0x12u);
  }

  if (!(_DWORD)v2)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159E08);
    }
    uint64_t v4 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      int v5 = ctime(&v7.st_mtimespec.tv_sec);
      *(_DWORD *)kevent buf = 136315394;
      *(void *)int v9 = v5;
      *(_WORD *)&v9[8] = 2048;
      *(void *)&v9[10] = v7.st_size;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "File last changed:%s File size=%lld Bytes",  buf,  0x16u);
    }
  }

  return v2;
}

void sub_10000CA98(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CAC8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000CAF8(uint64_t a1, uint64_t (*a2)(_BYTE *))
{
  if (sub_100026B38())
  {
    uint64_t result = a2(v12);
    while (v12[0] == 1)
    {
      uint64_t v4 = off_1001623D8(qword_1001623C0, v12, result);
      if ((_DWORD)v4 == -1)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100159E88);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002AC34();
        }
        return 0xFFFFFFFFLL;
      }

      if (*(unsigned __int16 *)&v12[1] == 65411)
      {
        usleep(0xBB8u);
      }

      else if ((sub_10000B958(v4, *(unsigned __int16 *)&v12[1]) & 0x80000000) != 0)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_100159EC8);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002AC60();
        }
        return 0xFFFFFFFFLL;
      }

      uint64_t result = a2(v12);
    }

    *__error() = 94;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_100159E48);
    }
    int v5 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002AC8C((uint64_t)v12, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  else
  {
    *__error() = 94;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000CD1C(_DWORD *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = sub_1000164C0(4LL, a1);
  uint64_t v3 = v2;
  if ((_DWORD)v2)
  {
    if ((_DWORD)v2 != 4)
    {
      if ((v2 & 0x80000000) == 0) {
        *__error() = 94;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159F08);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002ACF4();
      }
      return 0xFFFFFFFFLL;
    }

    if (*(_BYTE *)a1 == 1)
    {
      unsigned int v4 = 4;
    }

    else
    {
      *(_DWORD *)((char *)a1 + 1) = *a1;
      *(_BYTE *)a1 = 1;
      unsigned int v4 = 5;
    }

    uint64_t v3 = *((unsigned __int8 *)a1 + 3) + 4;
    int v5 = v3 - v4;
    int v6 = sub_1000164C0(v3 - v4, (char *)a1 + v4);
    if (v6 != v5)
    {
      if ((v6 & 0x80000000) == 0) {
        *__error() = 94;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_100159F48);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002AD54();
      }
      return 0xFFFFFFFFLL;
    }
  }

  return v3;
}

void sub_10000CE84(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CEB4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CEE4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CF14(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CF44(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CF74(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CFA4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000CFD4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D004(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D034(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D064(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D094(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D0C4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D0F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D124(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D154(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D184(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D1B4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D1E4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D214(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D244(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000D274(unsigned __int8 *a1)
{
  uint64_t v2 = (FILE *)qword_100161FA0;
  if (ferror((FILE *)qword_100161FA0))
  {
    uint64_t v8 = "Error reading command header file";
  }

  else
  {
    if (feof(v2)) {
      return 0LL;
    }
    size_t v4 = a1[3];
    size_t v5 = fread(a1 + 4, 1uLL, v4, (FILE *)qword_100161FA0);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015A288);
    }
    int v6 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "aci_download_config_fd_cb";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "we are going to read the entire packet within %s",  (uint8_t *)&v9,  0xCu);
    }

    if (v5 == v4) {
      return (v4 + 4);
    }
    uint64_t v7 = (FILE *)qword_100161FA0;
    if (!ferror((FILE *)qword_100161FA0))
    {
      if (feof(v7)) {
        return 0LL;
      }
      return (v4 + 4);
    }

    uint64_t v8 = "Error reading command payload from file";
  }

  perror(v8);
  return 0xFFFFFFFFLL;
}

void sub_10000D3EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D41C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D44C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D47C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D4AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D4DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D50C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D53C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D56C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D59C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D5CC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D5FC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D62C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D65C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D68C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D6BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D6EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D71C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D74C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D77C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D7AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D7DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D80C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000D83C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10000D86C(const char *a1, void **a2, _WORD *a3)
{
  int v6 = stat(a1, &v13);
  fprintf(__stderrp, "read_msf_file: stat_result=%d file path=%s\n", v6, a1);
  if (v6)
  {
    perror("stat ");
  }

  else
  {
    uint64_t v7 = __stderrp;
    uint64_t v8 = ctime(&v13.st_mtimespec.tv_sec);
    fprintf(v7, "read_msf_file: MSF File last changed:%s File size=%lld Bytes\n", v8, v13.st_size);
  }

  size_t st_size = v13.st_size;
  *a3 = v13.st_size;
  *a2 = malloc(st_size);
  fwrite("read_msf_file: Open MSF File\n", 0x1DuLL, 1uLL, __stderrp);
  qword_100161FA0 = (uint64_t)fopen(a1, "r");
  if (!qword_100161FA0)
  {
    fprintf(__stderrp, "Unable to open MSF, file path=%s\n", a1);
    return 0xFFFFFFFFLL;
  }

  fwrite("read_msf_file: Read MSF File to buffer\n", 0x27uLL, 1uLL, __stderrp);
  size_t v10 = fread(*a2, 1uLL, v13.st_size, (FILE *)qword_100161FA0);
  fprintf(__stderrp, "read_msf_file: Read MSF File to buffer. read_result %zu.\n", v10);
  uint64_t v11 = (FILE *)qword_100161FA0;
  if (ferror((FILE *)qword_100161FA0))
  {
    perror("Error reading msf file");
    return 0xFFFFFFFFLL;
  }

  if (feof(v11))
  {
    fprintf(__stderrp, "MSF EOF found, file path=%s\n", a1);
  }

  else
  {
    fwrite("read_msf_file: Close MSF File\n", 0x1EuLL, 1uLL, __stderrp);
    fclose((FILE *)qword_100161FA0);
  }

  return 0LL;
}

void sub_10000DA48(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000DA78(const char *a1, int a2)
{
  int v15 = 0LL;
  unsigned __int16 v14 = 0;
  uint64_t v13 = 0LL;
  memset(v34, 0, 256);
  if (a1) {
    int v3 = sub_10000D86C(a1, &v15, &v14);
  }
  else {
    int v3 = sub_100024950((UInt8 **)&v15, &v14, a2);
  }
  int v4 = v3;
  fprintf(__stderrp, "MSF-M2: type %d. file 0x%x. size %d.\n", a2, (_DWORD)v15, v14);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015A8C8);
  }
  size_t v5 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)kevent buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 1040;
    *(_DWORD *)&buf[10] = v14;
    *(_WORD *)&buf[14] = 2096;
    *(void *)&uint8_t buf[16] = v15;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cal data (Size %d bytes): %.*P", buf, 0x18u);
  }

  if (v4)
  {
    fprintf(__stderrp, "No MSF-M2 type %d cal data in ioreg.\n");
    goto LABEL_24;
  }

  unsigned __int16 v6 = v14;
  unsigned int v7 = v14 / 0xF0u;
  if (v14 % 0xF0u)
  {
    ++v7;
    goto LABEL_13;
  }

  if (v14 >= 0xF0u)
  {
LABEL_13:
    __int16 v8 = 0;
    int v9 = 0;
    do
    {
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
      __int128 v21 = 0u;
      memset(&buf[7], 0, 32);
      if (v6 >= 0xF0u) {
        int v10 = 240;
      }
      else {
        int v10 = v6;
      }
      buf[0] = a2;
      *(_WORD *)&buf[1] = 0;
      *(_WORD *)&buf[3] = v8;
      buf[5] = v10;
      buf[6] = v6 < 0xF1u;
      __memcpy_chk(&buf[7]);
      sub_10001B0EC(64793, (uint64_t)buf, (v10 + 7), (uint64_t)v34, &v13, 14);
      int v11 = v34[4];
      if (v34[4])
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A908);
        }
        char v12 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unsigned int v16 = 67109376;
          int v17 = a2;
          __int16 v18 = 1024;
          int v19 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "MSF-M2 type %d Error in Cal data. reason %d",  v16,  0xEu);
        }
      }

      ++v9;
      unsigned __int16 v6 = v14 - 240;
      v14 -= 240;
      v8 += 240;
    }

    while (v7 > v9);
  }

  fprintf(__stderrp, "MSF-M2: Finished sending MSF type %d file to device\n");
LABEL_24:
  if (v15) {
    free(v15);
  }
}

void sub_10000DDC4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10000DDF4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

  ;
}

uint64_t sub_10000DE30(int a1, char **a2, char **a3)
{
  optind = 1;
  while (2)
  {
    uint64_t v6 = getopt(a1, a2, "hw:Aa:Nn:Bb:s:ptgm:PeWvr:lQR:xuLq");
    switch((int)v6)
    {
      case 'A':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A968);
        }
        __int128 v25 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "ready to write BDADDR using devicetree from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v26 = qword_1001623C0;
        __int128 v27 = 0LL;
        return sub_1000108C4(v26, v27);
      case 'B':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A9A8);
        }
        __int128 v28 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "ready to set baudrate using a predefined value from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v29 = qword_1001623C0;
        __int128 v30 = 0LL;
        return sub_100010BAC(v29, v30);
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'M':
      case 'O':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'c':
      case 'd':
      case 'f':
      case 'i':
      case 'j':
      case 'k':
      case 'o':
        goto LABEL_4;
      case 'L':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AB88);
        }
        __int128 v31 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "ready to download Low power mode FW from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v32 = qword_1001623C0;
        __int128 v33 = (char *)sub_100016CC4();
        if (v33)
        {
          __int128 v34 = v33;
          __int128 v35 = sub_10001421C(1);
          if (v35)
          {
            __int128 v36 = v35;
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B1A8);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002AE10();
            }
          }

          else
          {
            __int128 v36 = v34;
          }

          goto LABEL_196;
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B188);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002ADE4();
        }
        return 0xFFFFFFFFLL;
      case 'N':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AA48);
        }
        __int128 v37 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "ready to set local name same as host name from %s",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v15 = qword_1001623C0;
        unsigned int v16 = 0LL;
        return sub_100010E04(v15, (uint64_t)v16);
      case 'P':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AA88);
        }
        __int16 v38 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "ready to configure I2S PCM and GPIO pins from %s",  (uint8_t *)&buf,  0xCu);
        }

        BYTE4(v14memset(v13, 0, 6) = 0;
        LODWORD(v14memset(v13, 0, 6) = 0;
        *(void *)__int128 v143 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        int v39 = (uint64_t *)&v146;
        int v40 = (__int128 *)v143;
        __int16 v41 = -86;
        goto LABEL_137;
      case 'Q':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015ABC8);
        }
        int v42 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "ready to load calibration data from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v20 = 0;
        goto LABEL_82;
      case 'R':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015ABE8);
        }
        unsigned int v7 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ready to run RSSI sweep from %s",  (uint8_t *)&buf,  0xCu);
        }

        __int16 v8 = optarg;
        int v9 = objc_autoreleasePoolPush();
        uint64_t v152 = 0LL;
        v150[4] = 0;
        *(_DWORD *)__int128 v150 = 921601;
        uint64_t v142 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        int v10 = -[NSString componentsSeparatedByString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8),  "componentsSeparatedByString:",  @", ");
        if (-[NSArray count](v10, "count") >= 5)
        {
          int v11 = "RSSI Sweep requires 4 arguments -- iterations, F_start F_stop Gain";
          goto LABEL_192;
        }

        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        id v73 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v146,  v143,  16LL);
        if (v73)
        {
          int v74 = 0;
          uint64_t v75 = *(void *)v147;
          while (1)
          {
            ssize_t v76 = 0LL;
            uint64_t v77 = v74;
            do
            {
              if (*(void *)v147 != v75) {
                objc_enumerationMutation(v10);
              }
              unsigned int v78 = [*(id *)(*((void *)&v146 + 1) + 8 * (void)v76) intValue];
              if (v78 >= 0x10000)
              {
                int v11 = "Parameter out of range";
LABEL_192:
                puts(v11);
LABEL_193:
                uint64_t v24 = 0xFFFFFFFFLL;
                goto LABEL_194;
              }

              int v74 = v77 + 1;
              *((_WORD *)&v152 + v77) = v78;
              ssize_t v76 = (char *)v76 + 1;
              ++v77;
            }

            while (v73 != v76);
            id v73 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v146,  v143,  16LL);
            if (!v73)
            {
              int v79 = (unsigned __int16)v152;
              LODWORD(v73) = WORD1(v152);
              int v80 = WORD2(v152);
              int v81 = HIWORD(v152);
              goto LABEL_209;
            }
          }
        }

        int v81 = 0;
        int v80 = 0;
        int v79 = 0;
LABEL_209:
        fprintf( __stderrp,  "RSSI Sweep Results:\n# Iteration: %d\nStart Frequency: %d MHz \nStop Frequency: %d MHz \nGain: %d\n",  v79,  (_DWORD)v73,  v80,  v81);
        *(_WORD *)&v150[1] = v79;
        *(_WORD *)&v150[5] = (_WORD)v73;
        *(_WORD *)&v150[7] = v80;
        char v151 = v81;
        sub_10001B0EC(64767, (uint64_t)v150, 0xAuLL, (uint64_t)&buf, &v142, 14);
        if (BYTE3(buf))
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B048);
          }
          uint64_t v93 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002AE74((uint64_t)&buf + 3, v93, v94, v95, v96, v97, v98, v99);
          }
          printf("RSSI Sweep failed! Error code %02X", BYTE3(buf));
          goto LABEL_193;
        }

        if (v80 - (int)v73 >= 0)
        {
          uint64_t v135 = (v80 - (_DWORD)v73 + 8) - 7LL;
          v136 = (char *)&buf + 7;
          do
          {
            unsigned __int8 v137 = *v136++;
            fprintf(__stderrp, "%d MHz: %d dBm \n", (_DWORD)v73, v137 | 0xFFFFFF00);
            LODWORD(v73) = (_DWORD)v73 + 1;
            --v135;
          }

          while (v135);
        }

        fputc(10, __stderrp);
        uint64_t v24 = 0LL;
LABEL_194:
        objc_autoreleasePoolPop(v9);
        return v24;
      case 'W':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AB48);
        }
        int v43 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "ready to download default HCD file from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v32 = qword_1001623C0;
        __int128 v44 = sub_10001421C(0);
        if (v44)
        {
          __int128 v36 = v44;
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B088);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002AD80();
          }
LABEL_196:
          int v65 = v32;
          unsigned int v66 = v36;
          return sub_1000114C0(v65, v66);
        }

        else
        {
          uint64_t v84 = sub_100016AA0();
          if (v84) {
            sub_100018CD8(v84);
          }
          return sub_1000125FC(v32, (uint64_t (*)(_OWORD *))sub_100014590);
        }

      case 'a':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A948);
        }
        uint64_t v45 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "ready to write all zero BDADDR from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v26 = qword_1001623C0;
        __int128 v27 = optarg;
        return sub_1000108C4(v26, v27);
      case 'b':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A988);
        }
        unsigned int v46 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "ready to set baudrate from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v29 = qword_1001623C0;
        __int128 v30 = optarg;
        return sub_100010BAC(v29, v30);
      case 'e':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A9C8);
        }
        char v12 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "ready to read power counter from %s",  (uint8_t *)&buf,  0xCu);
        }

        *(_WORD *)__int128 v150 = 1008;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        *(void *)__int128 v143 = 0LL;
        sub_10001B2C0((uint64_t)v150, 2uLL, (uint64_t)&buf, v143);
        if (*(void *)v143 == 15LL && (unsigned __int16)buf == 240 && BYTE2(buf) == 3)
        {
          int v89 = 5 * *(_DWORD *)((char *)&buf + 3);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B1E8);
          }
          int v90 = 2 * v89;
          uint64_t v91 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v14memset(v13, 0, 6) = 67109120;
            DWORD1(v14memset(v13, 0, 6) = v90;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "power=%u", (uint8_t *)&v146, 8u);
          }

          if (a3)
          {
            uint64_t v92 = (char *)calloc(0x40uLL, 1uLL);
            *a3 = v92;
            if (v92) {
              __sprintf_chk(v92, 0, 0x40uLL, "power=%u", v90);
            }
          }

          return 0LL;
        }

        *__error() = -94;
        return 0xFFFFFFFFLL;
      case 'g':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015A9E8);
        }
        v47 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "ready to set I2S GPIO lines from %s",  (uint8_t *)&buf,  0xCu);
        }

        BYTE2(v14memset(v13, 0, 6) = 0;
        LOWORD(v14memset(v13, 0, 6) = 2307;
        v150[2] = 0;
        *(_WORD *)__int128 v150 = 2308;
        strcpy((char *)&v152, "\a\t");
        *(void *)__int128 v143 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        sub_10001B0EC(64537, (uint64_t)&v146, 3uLL, (uint64_t)&buf, v143, 14);
        sub_10001B0EC(64537, (uint64_t)v150, 3uLL, (uint64_t)&buf, v143, 14);
        int v39 = &v152;
        int v40 = (__int128 *)v143;
        __int16 v41 = -999;
        unint64_t v48 = 3LL;
        goto LABEL_138;
      case 'h':
        fprintf(__stderrp, "%s - Broadcom Specific Commands\n", *a2);
        fwrite("-w    - Download HCD configuration file /path/to/hcd/file.hcd\n", 0x3EuLL, 1uLL, __stderrp);
        fwrite("-W    - Download default HCD \n", 0x1EuLL, 1uLL, __stderrp);
        fwrite("-L    - Download Low power mode FW \n", 0x24uLL, 1uLL, __stderrp);
        fwrite("-v    - prints the default hcd file loaded \n", 0x2CuLL, 1uLL, __stderrp);
        fwrite("-a    - Set BDADDR - 00:00:00:00:00:00\n", 0x27uLL, 1uLL, __stderrp);
        fwrite("-A    - Set BDADDR using devicetree\n", 0x24uLL, 1uLL, __stderrp);
        fwrite("-b    - Set the baud rate - Baud Rate\n", 0x26uLL, 1uLL, __stderrp);
        fwrite("-B    - Set the baud rate using a predefined value\n", 0x33uLL, 1uLL, __stderrp);
        fwrite("-P    - Configure I2S PCM and GPIO pins (inactive function/mode)\n", 0x41uLL, 1uLL, __stderrp);
        fwrite("-g    - Setup the I2S GPIO lines\n", 0x21uLL, 1uLL, __stderrp);
        fwrite("-p    - Routes sco over PCM\n", 0x1CuLL, 1uLL, __stderrp);
        fwrite("-t    - Routes sco over Transport (HCI)\n", 0x28uLL, 1uLL, __stderrp);
        fwrite("-n    - Set the local name - Local Name\n", 0x28uLL, 1uLL, __stderrp);
        fwrite("-N    - Set the local name to equal the host name\n", 0x32uLL, 1uLL, __stderrp);
        fwrite("-s    - Set the sleep mode - Sleep Mode, (0x09 = H5)\n", 0x35uLL, 1uLL, __stderrp);
        fwrite("                             Idle Threshold Host, (Not applicable to \n", 0x46uLL, 1uLL, __stderrp);
        fwrite("                             Idle Threshold HC,\n", 0x30uLL, 1uLL, __stderrp);
        fwrite("                             BT WAKE Active Mode,\n", 0x32uLL, 1uLL, __stderrp);
        fwrite("                             Host WAKE Active Mode,\n", 0x34uLL, 1uLL, __stderrp);
        fwrite("                             Allow Host Sleep During SCO,\n", 0x3AuLL, 1uLL, __stderrp);
        fwrite("                             Combine Sleep Mode and LPM,\n", 0x39uLL, 1uLL, __stderrp);
        fwrite("                             Enable Tristate Control of UART TX Line,\n", 0x46uLL, 1uLL, __stderrp);
        fwrite("                             Active Connection Handling On Suspend,\n", 0x44uLL, 1uLL, __stderrp);
        fwrite("                             Resume Timeout,\n", 0x2DuLL, 1uLL, __stderrp);
        fwrite("                             Enable Break to Host,\n", 0x33uLL, 1uLL, __stderrp);
        fwrite("                             Pulsed Host Wake,\n", 0x2FuLL, 1uLL, __stderrp);
        fwrite("-m    - Checks manufacturer\n", 0x1CuLL, 1uLL, __stderrp);
        fwrite("-R    - Run RSSI sweep (MFG FW required)\n", 0x29uLL, 1uLL, __stderrp);
        fwrite("-r    - Writes to RAM\n", 0x16uLL, 1uLL, __stderrp);
        fwrite("-x    - Load regulatory power table\n", 0x24uLL, 1uLL, __stderrp);
        fwrite("-u    - Update firmware in serial flash\n", 0x28uLL, 1uLL, __stderrp);
        fwrite("-Q    - Load calibration data\n", 0x1EuLL, 1uLL, __stderrp);
        fwrite("-q    - Load calibration data and print complete calibration data to stdio\n", 0x4BuLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        return 0LL;
      case 'l':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AB68);
        }
        uint64_t v49 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "ready to enable LMP_log from %s",  (uint8_t *)&buf,  0xCu);
        }

        BYTE4(buf) = 0;
        LODWORD(buf) = 117567495;
        off_1001623D0(qword_1001623C0, &buf, 5LL);
        usleep(0xC3500u);
        off_100162408(qword_1001623C0);
        return 0LL;
      case 'm':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AA08);
        }
        int v50 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "ready to check manufacturer from %s",  (uint8_t *)&buf,  0xCu);
          v51 = optarg;
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B1C8);
          }
        }

        else
        {
          v51 = optarg;
        }

        ssize_t v82 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "int check_manufacturer(const char *)";
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
        }

        int v83 = sub_100025E54();
        if (!v83) {
          return 0LL;
        }
        return v83 == strtol(v51, 0LL, 10);
      case 'n':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AA28);
        }
        unsigned __int16 v14 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ready to set local name from %s",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v15 = qword_1001623C0;
        unsigned int v16 = optarg;
        return sub_100010E04(v15, (uint64_t)v16);
      case 'p':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AA68);
        }
        int v17 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "ready to route SCO over PCM from %s",  (uint8_t *)&buf,  0xCu);
        }

        BYTE4(v14memset(v13, 0, 6) = 0;
        LODWORD(v14memset(v13, 0, 6) = 0x10000;
        v150[4] = 9;
        int v18 = 134809857;
        goto LABEL_136;
      case 'q':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015ABA8);
        }
        int v19 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "ready to load calibration data (complete printed to stdio) from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v20 = 1;
LABEL_82:
        sub_10001164C(v20);
        return 0LL;
      case 'r':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AAA8);
        }
        int v52 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "ready to write RAM from %s",  (uint8_t *)&buf,  0xCu);
        }

        v53 = optarg;
        size_t v54 = strchr(optarg, 61);
        memset(v145, 0, sizeof(v145));
        __int128 v144 = 0u;
        memset(&v143[4], 0, 208);
        *(void *)&__int128 v146 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        if (!v54) {
          return 0xFFFFFFFFLL;
        }
        CFStringRef v55 = v54;
        uint64_t v56 = strtol(v53, 0LL, 0);
        uint64_t v24 = 0xFFFFFFFFLL;
        if (v56 > 0xFFFFFFFFLL) {
          return v24;
        }
        *(_DWORD *)__int128 v143 = v56;
        unint64_t v57 = 4LL;
        while (*v55)
        {
          *CFStringRef v55 = 0;
          int v58 = v55 + 1;
          v143[v57] = strtol(v58, 0LL, 0);
          char v59 = strchr(v58, 44);
          unsigned int v60 = v57 + 1;
          if (v57 <= 0xFD)
          {
            CFStringRef v55 = v59;
            ++v57;
            if (v59) {
              continue;
            }
          }

          goto LABEL_216;
        }

        unsigned int v60 = v57;
LABEL_216:
        unint64_t v48 = v60;
        int v39 = (uint64_t *)v143;
        int v40 = &v146;
        __int16 v41 = -948;
LABEL_138:
        sub_10001B0EC(v41, (uint64_t)v39, v48, (uint64_t)&buf, v40, 14);
        return 0LL;
      case 's':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AAC8);
        }
        __int128 v21 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "ready to set sleep mode from %s",  (uint8_t *)&buf,  0xCu);
        }

        return sub_100011168(qword_1001623C0, (uint64_t)optarg);
      case 't':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AAE8);
        }
        int v61 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "ready to route SCO over HCI from %s",  (uint8_t *)&buf,  0xCu);
        }

        BYTE4(v14memset(v13, 0, 6) = 0;
        LODWORD(v14memset(v13, 0, 6) = 65537;
        v150[4] = 9;
        int v18 = 151587073;
LABEL_136:
        *(_DWORD *)__int128 v150 = v18;
        *(void *)__int128 v143 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        sub_10001B0EC(64609, (uint64_t)v150, 5uLL, (uint64_t)&buf, v143, 14);
        int v39 = (uint64_t *)&v146;
        int v40 = (__int128 *)v143;
        __int16 v41 = -996;
LABEL_137:
        unint64_t v48 = 5LL;
        goto LABEL_138;
      case 'u':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AC28);
        }
        __int128 v23 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "ready to update FW in serial flash from %s",  (uint8_t *)&buf,  0xCu);
        }

        sub_1000123C0();
        return 5LL;
      case 'v':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AB08);
        }
        unsigned int v62 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "ready to print the default hcd file loaded from %s",  (uint8_t *)&buf,  0xCu);
        }

        ssize_t v63 = sub_1000263FC();
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        sub_100026B38();
        if (sub_10001421C(0))
        {
          fprintf(__stdoutp, "File firmware is %s\n");
        }

        else
        {
          memset(v143, 0, 144);
          snprintf((char *)&buf, 0x80uLL, "/etc/bluetool/%s.boot.script", v63);
          if (!stat((const char *)&buf, (stat *)v143))
          {
            uint64_t v101 = fopen((const char *)&buf, "r");
            if (v101)
            {
              uint8x8_t v102 = v101;
              int v103 = (char *)malloc(0x400uLL);
              if (v103)
              {
                int v104 = v103;
                while (!feof(v102))
                {
                  int v105 = fgets(v104, 1024, v102);
                  if (v105)
                  {
                    v106 = v105;
                    size_t v107 = strlen(v105);
                    if (v107 >= 0xA)
                    {
                      v106[v107 - 1] = 0;
                      if (!strncmp(v106, "bcm -w ", 7uLL)) {
                        fprintf(__stdoutp, "File firmware is %s\n", v106 + 7);
                      }
                    }
                  }
                }

                fclose(v102);
                free(v104);
              }

              else
              {
                fclose(v102);
              }
            }
          }

          uint64_t v85 = __stdoutp;
          uint64_t v86 = (const char *)sub_100016AA0();
          fprintf(v85, "Default firmware is %s\n", v86);
          uint64_t v87 = __stdoutp;
          sub_100026B38();
          fprintf(v87, "Chipset is %s\n");
        }

        return 0LL;
      case 'w':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AB28);
        }
        int v64 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "ready to download HCD file at /path/to/hcd/file.hcd from %s",  (uint8_t *)&buf,  0xCu);
        }

        int v65 = qword_1001623C0;
        unsigned int v66 = optarg;
        return sub_1000114C0(v65, v66);
      case 'x':
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AC08);
        }
        int v67 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "bluetool_command_broadcom";
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "ready to load regulatory power table from %s",  (uint8_t *)&buf,  0xCu);
        }

        *(void *)__int128 v150 = 0LL;
        __int128 v167 = 0u;
        __int128 v168 = 0u;
        __int128 v165 = 0u;
        __int128 v166 = 0u;
        __int128 v163 = 0u;
        __int128 v164 = 0u;
        __int128 v161 = 0u;
        __int128 v162 = 0u;
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 buf = 0u;
        __int128 v154 = 0u;
        unsigned int v68 = (const char *)sub_100026B38();
        ssize_t v69 = sub_1000263FC();
        CFTypeRef v70 = (const char *)sub_100018CCC();
        if (strcmp(v68, "BCM4377B2"))
        {
          if (!strcmp(v68, "BCM4377B3"))
          {
            BOOL v71 = 0;
            unsigned int v72 = 250;
            goto LABEL_245;
          }

          if (!strcmp(v68, "BCM4387C2"))
          {
            if (strnstr(v70, "Maldives", 0x400uLL)
              || strnstr(v70, "Madagascar", 0x400uLL)
              || strnstr(v70, "Okinawa", 0x400uLL))
            {
              goto LABEL_242;
            }

            BOOL v100 = "Macadamia";
          }

          else
          {
            if (!strcmp(v68, "BCM4387C0"))
            {
              unsigned int v72 = 260;
              goto LABEL_244;
            }

            if (strcmp(v68, "BCM4378B1") && strcmp(v68, "BCM4378B3"))
            {
              if (!strcmp(v68, "BCM4388B0"))
              {
                if (strnstr(v70, "Amami", 0x400uLL) || strnstr(v70, "Tokara", 0x400uLL)) {
                  return 0LL;
                }
                unsigned int v72 = 1572;
              }

              else
              {
                if (strcmp(v68, "BCM4388C0") && strcmp(v68, "BCM4388C2"))
                {
                  BOOL v71 = 0;
                  unsigned int v72 = 210;
                  goto LABEL_245;
                }

                if (!strnstr(v70, "MahoganyA", 0x400uLL)
                  && !strnstr(v70, "MahoganyB", 0x400uLL)
                  && !strnstr(v70, "HickoryA", 0x400uLL)
                  && !strnstr(v70, "HickoryB", 0x400uLL)
                  && !strnstr(v70, "Miyake", 0x400uLL)
                  && !strnstr(v70, "Tasmania", 0x400uLL)
                  && !strnstr(v70, "Sumatra", 0x400uLL)
                  && !strnstr(v70, "Java", 0x400uLL)
                  && !strnstr(v70, "Amami", 0x400uLL)
                  && !strnstr(v70, "Iona", 0x400uLL)
                  && !strnstr(v70, "Azores", 0x400uLL)
                  && !strnstr(v70, "Tokara", 0x400uLL)
                  && !strnstr(v70, "Tresco", 0x400uLL))
                {
                  return 0LL;
                }

                unsigned int v72 = 3144;
              }

              goto LABEL_244;
            }

            if (strnstr(v70, "Marlin", 0x400uLL)
              || strnstr(v70, "Atlantis", 0x400uLL)
              || strnstr(v70, "AtlantisB", 0x400uLL)
              || strnstr(v70, "Capri", 0x400uLL)
              || strnstr(v70, "Santorini", 0x400uLL)
              || strnstr(v70, "Hazel", 0x400uLL))
            {
              goto LABEL_242;
            }

            BOOL v100 = "Redwood";
          }

          if (!strnstr(v70, v100, 0x400uLL))
          {
            unsigned int v72 = 520;
            goto LABEL_244;
          }

LABEL_242:
          unsigned int v72 = 786;
          goto LABEL_244;
        }

        if (strnstr(v70, "Monstro", 0x400uLL))
        {
          unsigned int v72 = 378;
LABEL_244:
          BOOL v71 = 1;
          goto LABEL_245;
        }

        unsigned int v72 = 378;
        if (strnstr(v70, "Pinocchio", 0x400uLL)) {
          goto LABEL_244;
        }
        v108 = strnstr(v70, "MeekoB", 0x400uLL);
        BOOL v71 = v108 != 0LL;
        if (v108) {
          unsigned int v72 = 378;
        }
        else {
          unsigned int v72 = 250;
        }
LABEL_245:
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B468);
        }
        __int16 v109 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v143 = 67109120;
          *(_DWORD *)&v143[4] = v72;
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Expected ptb size is %d", v143, 8u);
        }

        unsigned int v110 = (char *)calloc(v72, 1uLL);
        if (strcmp(v68, "BCM4355C0")
          && strcmp(v68, "BCM43430B1")
          && strcmp(v68, "BCM4357B1")
          && strcmp(v68, "BCM4355C1")
          && strcmp(v68, "BCM4377B2")
          && strcmp(v68, "BCM4377B3")
          && strcmp(v68, "BCM4378B1")
          && strcmp(v68, "BCM4378B3")
          && strcmp(v68, "BCM4387C0")
          && strcmp(v68, "BCM4387C2")
          && strcmp(v68, "BCM4388B0")
          && strcmp(v68, "BCM4388C0")
          && strcmp(v68, "BCM4388C2"))
        {
          __int128 v140 = v110;
          goto LABEL_339;
        }

        if (!strcmp(v68, "BCM4377B2")
          || !strcmp(v68, "BCM4377B3")
          || !strcmp(v68, "BCM4378B1")
          || !strcmp(v68, "BCM4378B3")
          || !strcmp(v68, "BCM4387C0")
          || !strcmp(v68, "BCM4387C2")
          || !strcmp(v68, "BCM4388B0")
          || !strcmp(v68, "BCM4388C0")
          || !strcmp(v68, "BCM4388C2"))
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B488);
          }
          v112 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 v143 = 136315138;
            *(void *)&v143[4] = v68;
            _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "Chipset is %s, load regulatory data from file system",  v143,  0xCu);
          }

          uint64_t v111 = sub_100018F2C(v72, v110);
        }

        else
        {
          uint64_t v111 = sub_100018E28((uint64_t)v69, v110);
        }

        uint64_t v24 = v111;
        if (!(_DWORD)v111)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B508);
          }
          uint64_t v122 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 v143 = 68157954;
            *(_DWORD *)&v143[4] = v72;
            *(_WORD *)&v143[8] = 2096;
            *(void *)&v143[10] = v110;
            _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Regulatory data : %.*P", v143, 0x12u);
          }

          __int128 v140 = v110;
          if (v71)
          {
            uint64_t v24 = 0LL;
            unsigned int v123 = (40525 * v72) >> 23;
            if (v72 == 207 * v123) {
              uint64_t v124 = v123;
            }
            else {
              uint64_t v124 = v123 + 1;
            }
            int v125 = 1;
            uint64_t v126 = v110;
            int v141 = v124;
            uint64_t v127 = v124;
            do
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015B528);
              }
              uint64_t v128 = (os_log_s *)qword_100162428;
              unsigned int v129 = (unsigned __int16)v72;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 v143 = 67109632;
                *(_DWORD *)&v143[4] = v125;
                *(_WORD *)&v143[8] = 1024;
                *(_DWORD *)&v143[10] = v141;
                *(_WORD *)&v143[14] = 1024;
                *(_DWORD *)&v143[16] = (unsigned __int16)v72;
                _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "Now sending ptb chunk %u of %u, %u bytes remaining",  v143,  0x14u);
                uint64_t v130 = qword_100162420;
              }

              else
              {
                uint64_t v130 = -1LL;
              }

              memset(&v143[2], 0, 207);
              LOWORD(v72) = v72 - 207;
              if (v129 >= 0xCF) {
                int v131 = 207;
              }
              else {
                int v131 = v129;
              }
              *(_WORD *)__int128 v143 = v127 - 1;
              __memcpy_chk(&v143[2]);
              if (v130 != -1) {
                dispatch_once(&qword_100162420, &stru_10015B548);
              }
              char v132 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v14memset(v13, 0, 6) = 67109634;
                DWORD1(v14memset(v13, 0, 6) = v131;
                WORD4(v14memset(v13, 0, 6) = 1040;
                *(_DWORD *)((char *)&v146 + 10) = 209;
                HIWORD(v14memset(v13, 0, 6) = 2096;
                *(void *)&__int128 v147 = v143;
                _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "Loading %u bytes of ptb data: %.*P",  (uint8_t *)&v146,  0x18u);
              }

              sub_10001B0EC(65037, (uint64_t)v143, 0xD1uLL, (uint64_t)&buf, v150, 14);
              if (BYTE3(buf))
              {
                if (qword_100162420 != -1) {
                  dispatch_once(&qword_100162420, &stru_10015B568);
                }
                char v133 = (os_log_s *)qword_100162428;
                if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v14memset(v13, 0, 6) = 67109120;
                  DWORD1(v14memset(v13, 0, 6) = v125;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v133,  OS_LOG_TYPE_ERROR,  "Error in sending regulatory data in chunk %u",  (uint8_t *)&v146,  8u);
                }

                uint64_t v24 = 23LL;
              }

              ++v125;
              v126 += 207;
              --v127;
            }

            while (v127);
            if ((_DWORD)v24) {
              goto LABEL_340;
            }
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B588);
            }
            char v134 = (os_log_s *)qword_100162428;
            uint64_t v24 = 0LL;
            if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_340;
            }
            *(_WORD *)__int128 v143 = 0;
          }

          else
          {
            sub_10001B0EC(64920, (uint64_t)v110, v72, (uint64_t)&buf, v150, 14);
            if (BYTE3(buf))
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015B5A8);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002AEDC();
              }
              uint64_t v24 = 23LL;
              goto LABEL_340;
            }

            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B5C8);
            }
            char v134 = (os_log_s *)qword_100162428;
            uint64_t v24 = 0LL;
            if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_340;
            }
            *(_WORD *)__int128 v143 = 0;
          }

          _os_log_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_DEFAULT,  "Regulatory data loaded successfully",  v143,  2u);
LABEL_339:
          uint64_t v24 = 0LL;
LABEL_340:
          if (v140) {
            free(v140);
          }
          return v24;
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B4A8);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002AF34();
        }
        v113 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v143 = 136315394;
          *(void *)&v143[4] = v68;
          *(_WORD *)&v143[12] = 2080;
          *(void *)&v143[14] = v69;
          _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "Chipset is %s, Platform is %s",  v143,  0x16u);
        }

        io_registry_entry_t v114 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
        if (v114)
        {
          io_object_t v115 = v114;
          CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v114, @"board-id", 0LL, 0);
          if (!CFProperty)
          {
LABEL_345:
            IOObjectRelease(v115);
            return v24;
          }

          v117 = CFProperty;
          CFTypeID v118 = CFGetTypeID(CFProperty);
          if (v118 != CFDataGetTypeID()) {
            goto LABEL_344;
          }
          memset(v143, 0, 32);
          unint64_t Length = CFDataGetLength(v117);
          BytePtr = (const char *)CFDataGetBytePtr(v117);
          if (Length > 0x1F)
          {
            strncpy(v143, BytePtr, 0x20uLL);
          }

          else
          {
            CFIndex v121 = CFDataGetLength(v117);
            __strncpy_chk(v143, BytePtr, v121, 32LL);
          }

          size_t v138 = strlen(v143);
          if (strncmp(v143, "Mac-E43C1C25D4880AD6", v138))
          {
LABEL_344:
            CFRelease(v117);
            goto LABEL_345;
          }

          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B5E8);
          }
          v139 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14memset(v13, 0, 6) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_DEFAULT,  "[isBoardJ52FrankenStein] It is a J52 FrankenStein Setup\n",  (uint8_t *)&v146,  2u);
          }

          CFRelease(v117);
          IOObjectRelease(v115);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B4E8);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002AF08();
          }
          return 0LL;
        }

        return v24;
      default:
        if ((_DWORD)v6 == -1) {
          return 0LL;
        }
LABEL_4:
        fprintf(__stderrp, "Invalid option '%c'\n", v6);
        continue;
    }
  }

void sub_100010894(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000108C4(int a1, const char *a2)
{
  __int16 v13 = 0;
  unsigned __int32 v12 = 0;
  if (!a2)
  {
    WORD2(__buf) = 0;
    LODWORD(__buf) = 0;
    if (sub_100024150((unsigned __int8 *)&__buf))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AE08);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002AA20();
      }
      return 0xFFFFFFFFLL;
    }

    v6.i32[0] = *(_DWORD *)((char *)&__buf + 2);
    int16x8_t v8 = (int16x8_t)vmovl_u8(v6);
    *(int16x4_t *)v8.i8 = vrev64_s16(*(int16x4_t *)v8.i8);
    unsigned __int32 v12 = vmovn_s16(v8).u32[0];
    LOBYTE(v13) = BYTE1(__buf);
    HIBYTE(v13) = __buf;
LABEL_13:
    LODWORD(v9) = 117178625;
    HIDWORD(v9) = v12;
    ____int128 buf = v9;
    __int16 v15 = v13;
    if (byte_10016241C)
    {
      ssize_t v10 = off_1001623D8(qword_1001623C0, &__buf, 10LL);
      if ((v10 & 0x80000000) != 0)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AE28);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002AFFC();
        }
        return 0xFFFFFFFFLL;
      }

      return sub_100012E68(v10, 0xFC01u);
    }

    ssize_t v10 = write(a1, &__buf, 0xAuLL);
    if (v10 == 10) {
      return sub_100012E68(v10, 0xFC01u);
    }
    ssize_t v11 = v10;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AE48);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002AF98();
      if (v11 < 0) {
        return 0xFFFFFFFFLL;
      }
    }

    else if (v11 < 0)
    {
      return 0xFFFFFFFFLL;
    }

    *__error() = 5;
    return 0xFFFFFFFFLL;
  }

  if (*a2 == 36)
  {
    int v3 = a2 + 1;
    int v4 = getenv(a2 + 1);
    fprintf(__stderrp, "Overriding BDADDR from environment variable: %s = %s\n", v3, v4);
    size_t v5 = v4;
  }

  else
  {
    size_t v5 = a2;
  }

  uint64_t result = sub_10001333C(v5, (uint64_t)&v12);
  if ((_DWORD)result != -1) {
    goto LABEL_13;
  }
  return result;
}

void sub_100010B4C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100010B7C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100010BAC(int a1, char *__str)
{
  if (byte_10016241C) {
    return 0LL;
  }
  if (__str)
  {
    if (*__str == 36)
    {
      int v4 = __str + 1;
      size_t v5 = getenv(__str + 1);
      fprintf(__stderrp, "Overriding baud rate from environment variable: %s = %s\n", v4, v5);
      unint64_t v6 = strtoul(v5, 0LL, 0);
    }

    else
    {
      unint64_t v6 = strtoul(__str, 0LL, 0);
    }
  }

  else
  {
    unsigned int v7 = sub_100023BA0();
    if (v7) {
      unint64_t v6 = v7;
    }
    else {
      unint64_t v6 = 2400000LL;
    }
  }

  ____int128 buf = 117184513;
  __int16 v10 = 0;
  __int16 v11 = v6;
  char v12 = BYTE2(v6);
  char v13 = BYTE3(v6);
  ssize_t v8 = write(a1, &__buf, 0xAuLL);
  if (v8 == 10)
  {
    if ((sub_100012E68(10LL, 0xFC18u) & 0x80000000) == 0)
    {
      off_1001623F8(qword_1001623C0, v6);
      return 0LL;
    }
  }

  else if ((v8 & 0x8000000000000000LL) == 0)
  {
    *__error() = 5;
  }

  return 0xFFFFFFFFLL;
}

void sub_100010D14(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100010D44(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100010D74(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100010DA4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100010DD4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100010E04(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)__s = 0u;
  __int128 v21 = 0u;
  if (a2)
  {
    uint64_t v2 = (char *)a2;
    if (*(_BYTE *)a2 == 36)
    {
      uint64_t v2 = getenv((const char *)(a2 + 1));
      fprintf(__stderrp, "Overriding hostname from environment variable: %s = %s\n");
    }

    else
    {
      fprintf(__stderrp, "Using passed hostname: %s\n");
    }
  }

  else
  {
    __int128 v34 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v32 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v31 = 0uLL;
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    *(_OWORD *)__s = 0uLL;
    __int128 v21 = 0uLL;
    j__gethostname(__s, 0x100uLL);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AE68);
    }
    uint64_t v2 = __s;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
      sub_10002B060();
    }
  }

  int v3 = strlen(v2);
  if (v3)
  {
    memset(v19, 0, sizeof(v19));
    int v18 = -133426431;
    unsigned int v4 = v3 - 1;
    if (v3 >= 1)
    {
      if (v4 >= 0xF7) {
        unsigned int v4 = 247;
      }
      uint64_t v5 = v4 + 1;
      unint64_t v6 = v19;
      do
      {
        char v7 = *v2++;
        *v6++ = v7;
        --v5;
      }

      while (v5);
    }

    uint64_t v8 = off_1001623D8(qword_1001623C0, &v18, 252LL);
    if ((_DWORD)v8 != -1) {
      return sub_100012E68(v8, 0xC13u);
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AE88);
    }
    __int16 v10 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002AA4C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_100011078(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000110A8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000110D8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100011108(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100011138(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100011168(int a1, uint64_t a2)
{
  unsigned int v4 = objc_autoreleasePoolPush();
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v5 = -[NSString componentsSeparatedByString:]( +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2),  "componentsSeparatedByString:",  @",");
  if (-[NSArray count](v5, "count") <= 0x18 && -[NSArray count](v5, "count") > 9)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v8)
    {
      id v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0LL;
        int v13 = v10;
        uint64_t v14 = (char *)&v28 + v10;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v5);
          }
          *((_BYTE *)v12 + (void)v14) = strtol( (const char *)[*(id *)(*((void *)&v20 + 1) + 8 * (void)v12) UTF8String],  0,  0);
          uint64_t v12 = (char *)v12 + 1;
        }

        while (v9 != v12);
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        int v10 = v13 + (_DWORD)v12;
      }

      while (v9);
      uint64_t v16 = v28;
      v15.i32[0] = v29;
      int16x8_t v17 = (int16x8_t)vmovl_u8(v15);
    }

    else
    {
      uint64_t v16 = 0LL;
      int16x8_t v17 = 0uLL;
    }

    ____int128 buf = 217851649;
    uint64_t v26 = v16;
    unsigned __int32 v27 = vmovn_s16(v17).u32[0];
    if (byte_10016241C)
    {
      ssize_t v18 = off_1001623D8(qword_1001623C0, &__buf, 16LL);
      if ((v18 & 0x80000000) != 0)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AEE8);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B124();
        }
        goto LABEL_4;
      }
    }

    else
    {
      ssize_t v18 = write(a1, &__buf, 0x10uLL);
      if (v18 != 16)
      {
        ssize_t v19 = v18;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AF08);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
        {
          sub_10002B0C0();
          if (v19 < 0) {
            goto LABEL_4;
          }
        }

        else if (v19 < 0)
        {
          goto LABEL_4;
        }

        *__error() = 5;
        goto LABEL_4;
      }
    }

    uint64_t v6 = sub_100012E68(v18, 0xFC27u);
    goto LABEL_5;
  }

  puts("Sleep mode requires less than 24 parameters");
LABEL_4:
  uint64_t v6 = 0xFFFFFFFFLL;
LABEL_5:
  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_100011430(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100011460(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100011490(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000114C0(int a1, const char *a2)
{
  unsigned int v4 = sub_100012454(a2);
  int v5 = open(v4, 0);
  if (v5 < 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AC48);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B150();
    }
    return 0xFFFFFFFFLL;
  }

  else
  {
    int v6 = v5;
    sub_100018CD8((uint64_t)a2);
    dword_100161FB0 = v6;
    uint64_t v7 = sub_1000125FC(a1, (uint64_t (*)(_OWORD *))sub_100012AD4);
    close(v6);
    return v7;
  }

void sub_10001158C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000115BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000115EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001161C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001164C(int a1)
{
  __int128 v33 = 0LL;
  unsigned __int16 v32 = 0;
  __int128 v31 = 0LL;
  unsigned __int16 v30 = 0;
  uint64_t v29 = 0LL;
  unsigned __int16 v28 = 0;
  uint64_t v27 = 0LL;
  memset(v38, 0, 256);
  uint64_t v2 = (const char *)sub_100026B38();
  sub_1000263FC();
  bzero(__str, 0x400uLL);
  size_t v26 = 1024LL;
  if (sysctlbyname("kern.bootargs", __str, &v26, 0LL, 0LL) || (uint64_t v7 = strtok(__str, " ")) == 0LL)
  {
LABEL_2:
    int v3 = (const char *)sub_100026B38();
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B3A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
      sub_10002B45C();
    }
    if (strcmp(v3, "BCM4355B3")
      && strcmp(v3, "BCM4355C0")
      && strcmp(v3, "BCM43430B1")
      && strcmp(v3, "BCM4357B1")
      && strcmp(v3, "BCM4355C1")
      && strcmp(v3, "BCM4377B2")
      && strcmp(v3, "BCM4377B3")
      && strcmp(v3, "BCM4378B1")
      && strcmp(v3, "BCM4378B3")
      && strcmp(v3, "BCM4387C0")
      && strcmp(v3, "BCM4387C2")
      && strcmp(v3, "BCM4388B0")
      && strcmp(v3, "BCM4388C0")
      && strcmp(v3, "BCM4388C2"))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B3C8);
      }
      unsigned int v4 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        int v5 = "Chipset does not support taurus cal";
LABEL_62:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 2u);
        goto LABEL_63;
      }

      goto LABEL_63;
    }

    if (strcmp(v2, "BCM4378B1")
      && strcmp(v2, "BCM4378B3")
      && strcmp(v2, "BCM4387C2")
      && strcmp(v2, "BCM4388B0")
      && strcmp(v2, "BCM4388C0")
      && strcmp(v2, "BCM4388C2"))
    {
      if (sub_1000249C8((UInt8 **)&v29, &v28))
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B2A8);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
        {
          sub_10002B3FC();
          goto LABEL_126;
        }

        goto LABEL_60;
      }

      if (a1) {
        sub_10001370C((unsigned __int8 *)v29, v28);
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B288);
      }
      uint8x8_t v15 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf[0]) = 67109634;
        DWORD1(buf[0]) = v28;
        WORD4(buf[0]) = 1040;
        *(_DWORD *)((char *)buf + 10) = v28;
        HIWORD(buf[0]) = 2096;
        *(void *)&buf[1] = v29;
        uint64_t v16 = "Cal data to be loaded (%d bytes): %.*P";
        goto LABEL_83;
      }

      goto LABEL_84;
    }

    LODWORD(buf[1]) = -1962371525;
    buf[0] = xmmword_10002E7D9;
    if (MGIsDeviceOneOfType(buf))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B228);
      }
      int v6 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Loading Calibration from FDR ... ",  (uint8_t *)buf,  2u);
        CFDataRef theData = 0LL;
        v35[0] = 0LL;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B3E8);
        }
      }

      else
      {
        CFDataRef theData = 0LL;
        v35[0] = 0LL;
      }

      id v8 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Loading calibration of FATP stage ... \n",  (uint8_t *)buf,  2u);
      }

      if (sub_100014D40((const void **)&theData, v35, (uint64_t)@"BWCl") == -1)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B408);
        }
        int v13 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "FATP stage calibration not found, looking for Golden calibration from SMT ... \n",  (uint8_t *)buf,  2u);
        }

        if (sub_100014D40((const void **)&theData, v35, (uint64_t)@"0BCl"))
        {
          if (v35[0])
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B448);
            }
            uint64_t v14 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002B37C(v35, v14);
            }
          }

LABEL_57:
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B268);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
          {
            sub_10002B31C();
LABEL_126:
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B308);
            }
          }

LABEL_60:
          unsigned int v4 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            int v5 = "No taurus cal data. Load extended calibration for Simba";
            goto LABEL_62;
          }

LABEL_63:
          if (sub_1000249B4((UInt8 **)&v33, &v32)
            || (!strcmp(v2, "BCM4355B3")
              ? (int v12 = sub_1000249A0((UInt8 **)&v31, &v30))
              : (int v12 = sub_10002498C((UInt8 **)&v31, &v30)),
                v12))
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B328);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002B2BC();
            }
          }

          else
          {
            if (v30 != 20 && v30 != 320 && v30 != 1360)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015B348);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002B204();
              }
              goto LABEL_110;
            }

            if (v32 != 206)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015B368);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002B290();
              }
              goto LABEL_110;
            }

            if (!strcmp(v2, "BCM4355B3"))
            {
              if (*((_DWORD *)v31 + 2) != 32)
              {
                if (qword_100162420 != -1) {
                  dispatch_once(&qword_100162420, &stru_10015B388);
                }
                if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                  sub_10002B230();
                }
                goto LABEL_110;
              }

              for (uint64_t i = 12LL; i != 1356; i += 42LL)
                sub_10001B0EC(64792, (uint64_t)v31 + i, 0x2AuLL, (uint64_t)v38, &v27, 14);
            }

            else
            {
              uint64_t v23 = 0LL;
              unint64_t v24 = 0LL;
              do
              {
                sub_10001B0EC(64792, (uint64_t)v31 + v23, 0x14uLL, (uint64_t)v38, &v27, 14);
                ++v24;
                v23 += 20LL;
              }

              while (v24 < v30 / 0x14u);
            }

            sub_10001B0EC(64798, (uint64_t)v33, v32, (uint64_t)v38, &v27, 14);
          }

LABEL_110:
          if (v31) {
            free(v31);
          }
          if (v32) {
            free(v33);
          }
          if (v29) {
            free(v29);
          }
          return;
        }
      }

      size_t Length = CFDataGetLength(theData);
      CFIndex v10 = Length;
      if (Length)
      {
        uint64_t v29 = malloc(Length);
        v39.location = 0LL;
        v39.length = v10;
        CFDataGetBytes(theData, v39, (UInt8 *)v29);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B428);
        }
        uint64_t v11 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0]) = 134217984;
          *(void *)((char *)buf + 4) = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "btbf length %ld\n", (uint8_t *)buf, 0xCu);
        }
      }

      unsigned __int16 v28 = v10;
    }

    else if (sub_1000249DC((UInt8 **)&v29, &v28))
    {
      goto LABEL_57;
    }

    if (a1) {
      sub_10001370C((unsigned __int8 *)v29, v28);
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B248);
    }
    uint8x8_t v15 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 67109634;
      DWORD1(buf[0]) = v28;
      WORD4(buf[0]) = 1040;
      *(_DWORD *)((char *)buf + 10) = v28;
      HIWORD(buf[0]) = 2096;
      *(void *)&buf[1] = v29;
      uint64_t v16 = "Cal data for beamforming to be loaded (%d bytes): %.*P";
LABEL_83:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)buf, 0x18u);
    }

LABEL_84:
    unsigned int v17 = v28 / 0xE6u;
    if (v28 % 0xE6u)
    {
      ++v17;
    }

    else if (v28 < 0xE6u)
    {
      goto LABEL_110;
    }

    __int16 v18 = 0;
    int v19 = 0;
    while (dword_1001623C8)
    {
      *(_OWORD *)((char *)&buf[12] + 3) = 0u;
      memset((char *)&buf[13] + 3, 0, 22);
      *(_OWORD *)((char *)&buf[10] + 3) = 0u;
      *(_OWORD *)((char *)&buf[11] + 3) = 0u;
      *(_OWORD *)((char *)&buf[8] + 3) = 0u;
      *(_OWORD *)((char *)&buf[9] + 3) = 0u;
      *(_OWORD *)((char *)&buf[6] + 3) = 0u;
      *(_OWORD *)((char *)&buf[7] + 3) = 0u;
      *(_OWORD *)((char *)&buf[4] + 3) = 0u;
      *(_OWORD *)((char *)&buf[5] + 3) = 0u;
      *(_OWORD *)((char *)&buf[2] + 3) = 0u;
      *(_OWORD *)((char *)&buf[3] + 3) = 0u;
      memset((char *)buf + 3, 0, 32);
      LOBYTE(buf[0]) = 3;
      *(_WORD *)((char *)buf + 1) = ~v18 + v17;
      __memcpy_chk((char *)buf + 3);
      sub_10001B0EC(64919, (uint64_t)buf, 0xE9uLL, (uint64_t)v38, &v27, 14);
      char v20 = v38[4];
      if (v38[4])
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B2E8);
        }
        __int128 v21 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B1A8((uint8_t *)v35, v20, (const char **)((char *)v35 + 4), v21);
        }
      }

      ++v19;
      v28 -= 230;
      __int16 v18 = v19;
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B2C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B17C();
    }
    goto LABEL_110;
  }

  while (!strstr(v7, "wifibt-external"))
  {
    uint64_t v7 = strtok(0LL, " ");
    if (!v7) {
      goto LABEL_2;
    }
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B208);
  }
  __int128 v22 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Thunderbolt to PCIe expansion chassis, so skip loading calibration data",  (uint8_t *)buf,  2u);
  }

void sub_100012300(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012330(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012360(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012390(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000123C0()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B008);
  }
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
    sub_10002B4E8();
  }
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
    sub_10002B4BC();
  }
  return 5LL;
}

char *sub_100012454(const char *a1)
{
  int v1 = (char *)a1;
  if (strchr(a1, 58) && strchr(v1, 44))
  {
    int v2 = sub_1000134F4();
    int v3 = strtok(v1, ":,");
    if (v3)
    {
      __endptr = 0LL;
      while (1)
      {
        uint64_t v4 = strtol(v3, &__endptr, 0);
        int v5 = strtok(0LL, ":,");
        int v1 = v5;
        if (v4 == v2) {
          break;
        }
        if (!v5) {
          return v1;
        }
        int v3 = strtok(0LL, ":,");
        if (!v3) {
          return 0LL;
        }
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AEC8);
      }
      uint64_t v7 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        CFIndex v10 = v1;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using HCD File: %s", buf, 0xCu);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

void sub_1000125B8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000125E8(int a1, int a2)
{
  dword_100161FB0 = a2;
  return sub_1000125FC(a1, (uint64_t (*)(_OWORD *))sub_100012AD4);
}

uint64_t sub_1000125FC(int a1, uint64_t (*a2)(_OWORD *))
{
  uint64_t v4 = sub_100026B38();
  memset(__buf, 0, 259);
  if (byte_10016241C) {
    return a2(__buf);
  }
  int v6 = (const char *)v4;
  LODWORD(__buf[0]) = 16526849;
  ssize_t v7 = write(a1, __buf, 4uLL);
  if (v7 != 4)
  {
    if ((v7 & 0x8000000000000000LL) == 0) {
      *__error() = 5;
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015ACC8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B608();
    }
    return 0xFFFFFFFFLL;
  }

  if ((sub_100012E68(4LL, 0xFC2Eu) & 0x80000000) != 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015ACE8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B558();
    }
    return 0xFFFFFFFFLL;
  }

  usleep(0xC350u);
  if (!v6) {
    int v6 = (const char *)&unk_100150C1E;
  }
  if (!strcmp(v6, "BCM4325") || !strcmp(v6, "BCM4329B1") || !strcmp(v6, "BCM4329C0") || !strcmp(v6, "BCM20710"))
  {
    ssize_t v8 = read(a1, __buf, 2uLL);
    if (v8 == 2)
    {
      *__error() = 94;
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AD28);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B5B0();
      }
    }

    else
    {
      if ((v8 & 0x8000000000000000LL) == 0) {
        *__error() = 5;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AD08);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B5DC();
      }
    }

    return 0xFFFFFFFFLL;
  }

LABEL_15:
  int v9 = 0;
  for (unsigned int i = 1; ; ++i)
  {
    uint64_t v5 = a2(__buf);
    if (50 * (i / 0x32) - 1 == v9)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AD48);
      }
      uint64_t v11 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 67109120;
        int v15 = v9 + 1;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loading segment %d", buf, 8u);
      }
    }

    if (LOBYTE(__buf[0]) != 1 || BYTE2(__buf[0]) != 252)
    {
      *__error() = 94;
      return 0xFFFFFFFFLL;
    }

    uint64_t v12 = off_1001623D8(qword_1001623C0, __buf, v5);
    if ((_DWORD)v12 == -1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AD68);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002A934();
      }
      return 0xFFFFFFFFLL;
    }

    ++v9;
    if ((sub_100012E68(v12, *(unsigned __int16 *)((char *)__buf + 1)) & 0x80000000) != 0)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AD88);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B584();
      }
      return 0xFFFFFFFFLL;
    }
  }

  return v5;
}

    uint64_t v14 = (const char **)(a2 + 8);
    if ((int)a1 <= v10)
    {
    }

    else if (!sub_10001E0A4(v7, v14, 0LL))
    {
      if ((_DWORD)a1 != v10)
      {
        int v15 = (const char **)(a2 + 8LL * (v7 + v11 + 3));
        uint64_t v16 = (a1 - v10);
        return sub_10001E0A4(v16, v15, a3);
      }

      return 0LL;
    }

    if (!(_DWORD)v11) {
      return 1LL;
    }
    int v15 = (const char **)(a2 + 8LL * (v7 + 2));
    uint64_t v16 = v11;
    return sub_10001E0A4(v16, v15, a3);
  }

  int v3 = 1LL;
  fwrite("usage: if <test> ? a : b", 0x18uLL, 1uLL, __stderrp);
  return v3;
}

uint64_t sub_100012AD4(char *a1)
{
  if (!byte_10016241C)
  {
    ssize_t v6 = read(dword_100161FB0, a1, 4uLL);
    if (!v6) {
      return 0LL;
    }
    if (v6 == 4)
    {
      if (*a1 == 1)
      {
        unsigned int v7 = 4;
      }

      else
      {
        *(_DWORD *)(a1 + 1) = *(_DWORD *)a1;
        *a1 = 1;
        unsigned int v7 = 5;
      }

      if (a1[2] == 252)
      {
        uint64_t v4 = a1[3] + 4LL;
        ssize_t v8 = &a1[v7];
        size_t v9 = v4 - v7;
        ssize_t v10 = read(dword_100161FB0, v8, v9);
        if (v10 == v9) {
          return v4;
        }
        if ((v10 & 0x8000000000000000LL) == 0) {
          *__error() = 94;
        }
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015ACA8);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B660();
        }
      }

      else
      {
        *__error() = 94;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015AC88);
        }
        uint64_t v11 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B68C(v11);
        }
      }
    }

    else
    {
      if ((v6 & 0x8000000000000000LL) == 0) {
        *__error() = 94;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015AC68);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B634();
      }
    }

    return 0xFFFFFFFFLL;
  }

  memset(&v13, 0, sizeof(v13));
  if (fstat(dword_100161FB0, &v13) == -1) {
    size_t st_size_low = 0xFFFFFFFFLL;
  }
  else {
    size_t st_size_low = LODWORD(v13.st_size);
  }
  int v2 = malloc(st_size_low);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2;
  if ((_DWORD)st_size_low == read(dword_100161FB0, v2, st_size_low))
  {
    uint64_t v4 = sub_100006E0C((uint64_t)v3, st_size_low);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B068);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B70C();
    }
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  free(v3);
  return v4;
}

void sub_100012DA8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012DD8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012E08(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100012E38(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100012E68(uint64_t a1, unsigned int a2)
{
  unint64_t v7 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int16 v38 = 0;
  off_1001623F0(qword_1001623C0, &v22, 258LL, &v7);
  if (v7 < 4)
  {
LABEL_2:
    *__error() = 5;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015ADA8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B778();
    }
    return 0xFFFFFFFFLL;
  }

  while (v22 != 14)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015ADC8);
    }
    int v3 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67109120;
      int v9 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "EVNT: Previous command did not complete yet: %02X",  buf,  8u);
    }

    __int16 v38 = 0;
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
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    off_1001623F0(qword_1001623C0, &v22, 258LL, &v7);
    if (v7 < 4) {
      goto LABEL_2;
    }
  }

  if (BYTE2(v22) != 1
    || BYTE3(v22) != a2
    || (BYTE4(v22) == a2 >> 8 ? (BOOL v4 = BYTE5(v22) == 0) : (BOOL v4 = 0), !v4))
  {
    *__error() = 94;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015ADE8);
    }
    uint64_t v5 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 67110656;
      int v9 = v22;
      __int16 v10 = 1024;
      int v11 = BYTE1(v22);
      __int16 v12 = 1024;
      int v13 = BYTE2(v22);
      __int16 v14 = 1024;
      int v15 = BYTE3(v22);
      __int16 v16 = 1024;
      int v17 = BYTE4(v22);
      __int16 v18 = 1024;
      int v19 = BYTE5(v22);
      __int16 v20 = 1024;
      unsigned int v21 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "EVNT: Invalid opcode Got:[0x%x 0x%x 0x%x 0x%x 0x%x 0x%x], waiting for [0x%x] !",  buf,  0x2Cu);
    }

    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

void sub_10001318C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000131BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000131EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001321C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001324C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001327C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000132AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000132DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001330C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001333C(const char *a1, uint64_t a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (strlen(a1) < 0x11) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = (unsigned __int8 *)(a1 + 1);
  for (uint64_t i = 5LL; i != -1; --i)
  {
    int v7 = *(v5 - 1);
    unsigned int v8 = v7 - 48;
    unsigned int v9 = v7 - 97;
    else {
      char v10 = v7 - 55;
    }
    char v11 = v7 - 87;
    if (v9 > 5) {
      char v11 = v10;
    }
    if (v8 < 0xA) {
      char v11 = v8;
    }
    char v12 = 16 * v11;
    *(_BYTE *)(a2 + i) = v12;
    int v14 = *v5;
    v5 += 3;
    char v13 = v14;
    unsigned int v15 = v14 - 48;
    unsigned int v16 = v14 - 97;
    char v17 = v14 - 55;
    else {
      char v18 = v17;
    }
    char v19 = v13 - 87;
    if (v16 > 5) {
      char v19 = v18;
    }
    if (v15 < 0xA) {
      char v19 = v15;
    }
    *(_BYTE *)(a2 + i) = v19 | v12;
  }

  return 0LL;
}

void sub_100013404(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100013434(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100013464(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100013494(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000134C4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000134F4()
{
  __int16 v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v2 = 0LL;
  off_1001623E8(qword_1001623C0, &unk_10002E853, 3LL);
  do
    off_1001623F0(qword_1001623C0, v7, 258LL, &v2);
  while (LOBYTE(v7[0]) != 14);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015AEA8);
  }
  uint8x8_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109376;
    int v4 = BYTE13(v7[0]);
    __int16 v5 = 1024;
    int v6 = BYTE12(v7[0]);
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "LMP Subversion: 0x%02X%02x", buf, 0xEu);
  }

  return WORD6(v7[0]);
}

void sub_10001364C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001367C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000136AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000136DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

size_t sub_10001370C(unsigned __int8 *a1, int a2)
{
  size_t result = fwrite("Cal data for beamforming to be loaded:\n", 0x27uLL, 1uLL, __stdoutp);
  if (a2)
  {
    __int16 v5 = &a1[a2];
    do
    {
      int v6 = *a1++;
      size_t result = fprintf(__stdoutp, "%02X ", v6);
    }

    while (a1 < v5);
  }

  return result;
}

void sub_100013788(uint64_t a1, unsigned int *a2, char *__s)
{
  if (a1)
  {
    if (a2)
    {
      int v4 = __s;
      size_t v6 = strlen(__s);
      int v7 = malloc(v6 + 1);
      if (v7)
      {
        __int16 v8 = v7;
        int v9 = 0;
        while (*v4)
        {
          unsigned __int8 v10 = __tolower(*v4);
          if ((v10 & 0x80) != 0) {
            __uint32_t v11 = 0;
          }
          else {
            __uint32_t v11 = HIWORD(_DefaultRuneLocale.__runetype[v10]) & 1;
          }
          ++v4;
          if (v11) {
            v8[v9++] = v10;
          }
        }

        v8[v9] = 0;
        LOBYTE(v12) = *v8;
        if (*v8)
        {
          unsigned int v13 = 0;
          int v14 = v8;
          do
          {
            char v15 = __tolower((char)v12);
            else {
              char v16 = v15 - 48;
            }
            if (v14[1]) {
              uint64_t v17 = 2LL;
            }
            else {
              uint64_t v17 = 1LL;
            }
            if (v14[1]) {
              char v18 = v14 + 2;
            }
            else {
              char v18 = v14 + 1;
            }
            if (v14[1]) {
              char v19 = v14[1];
            }
            else {
              char v19 = 48;
            }
            char v20 = __tolower(v19);
            unsigned int v21 = v20 - 48;
            if (v21 >= 0xA) {
              LOBYTE(v21) = v20 - 87;
            }
            *(_BYTE *)(a1 + v13++) = v21 | (16 * v16);
            int v12 = v14[v17];
            int v14 = v18;
          }

          while (v12);
        }

        else
        {
          unsigned int v13 = 0;
        }

        free(v8);
        *a2 = v13;
      }
    }
  }

uint64_t sub_1000138D0(const char *a1, int *a2)
{
  unsigned __int8 v40 = 0;
  unsigned __int16 v39 = 0;
  unsigned __int8 v38 = 0;
  unsigned __int16 v37 = 0;
  memset(v50, 0, sizeof(v50));
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  memset(v49, 0, sizeof(v49));
  __int16 v48 = 0;
  memset(v47, 0, sizeof(v47));
  uint64_t v2 = fopen(a1, "r");
  if (fgets((char *)v51, 128, v2))
  {
    int v32 = 0;
    char v3 = 0;
    __s = (char *)((unint64_t)v51 | 9);
    int v4 = &qword_100162420;
    __int16 v5 = (os_log_t *)&qword_100162428;
    do
    {
      if (sscanf((const char *)v51, ":%2hhx%4hx%2hhx", &v40, &v39, &v38) == 3)
      {
        if (*v4 != -1) {
          dispatch_once(v4, &stru_10015AF28);
        }
        size_t v6 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 67109632;
          *(_DWORD *)int v42 = v40;
          *(_WORD *)&v42[4] = 1024;
          *(_DWORD *)&v42[6] = v39;
          *(_WORD *)int v43 = 1024;
          *(_DWORD *)&v43[2] = v38;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "count = 0x%02X addressOffset = 0x%04X type = 0x%02X",  buf,  0x14u);
        }

        if (v38 == 4)
        {
          sscanf(__s, "%4hx", &v37);
          int v15 = v37;
          int v16 = v39;
          if (*v4 != -1) {
            dispatch_once(v4, &stru_10015AFA8);
          }
          uint64_t v17 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 67109632;
            *(_DWORD *)int v42 = v39;
            *(_WORD *)&v42[4] = 1024;
            *(_DWORD *)&v42[6] = v37;
            *(_WORD *)int v43 = 1024;
            *(_DWORD *)&v43[2] = v16 | (v15 << 16);
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  " addressOffset = 0x%04X addressBase = 0x%04X inAddress = 0x%08X",  buf,  0x14u);
          }
        }

        else if (!v38)
        {
          int v7 = v4;
          __int16 v8 = v5;
          unsigned __int16 v9 = v37;
          unsigned __int16 v10 = v39;
          int v11 = v39 | (v37 << 16);
          if ((v3 & 1) != 0)
          {
            HIDWORD(v3memset(v13, 0, 6) = 0;
            sub_100013788((uint64_t)v50, (unsigned int *)&v36 + 1, __s);
            if (*v7 != -1) {
              dispatch_once(v7, &stru_10015AF68);
            }
            int v12 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              int v19 = v50[0];
              if (!HIDWORD(v36)) {
                int v19 = 0;
              }
              int v20 = v50[1];
              if (HIDWORD(v36) <= 1) {
                int v20 = 0;
              }
              int v21 = v50[2];
              if (HIDWORD(v36) <= 2) {
                int v21 = 0;
              }
              int v22 = v50[3];
              if (HIDWORD(v36) <= 3) {
                int v22 = 0;
              }
              *(_DWORD *)__int128 buf = 67110400;
              *(_DWORD *)int v42 = v11;
              *(_WORD *)&v42[4] = 1024;
              *(_DWORD *)&v42[6] = HIDWORD(v36);
              *(_WORD *)int v43 = 1024;
              *(_DWORD *)&v43[2] = v19;
              *(_WORD *)__int128 v44 = 1024;
              *(_DWORD *)&v44[2] = v20;
              *(_WORD *)uint64_t v45 = 1024;
              *(_DWORD *)&v45[2] = v21;
              LOWORD(v46[0]) = 1024;
              *(_DWORD *)((char *)v46 + 2) = v22;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  " inAddress = 0x%08X insize_t Length = 0x%08X inData[0-3] = 0x%02X%02X%02X%02X...",  buf,  0x26u);
            }

            LOWORD(v47[0]) = v10;
            WORD1(v47[0]) = v9;
            int v13 = HIDWORD(v36);
            __memcpy_chk((char *)v47 + 4);
            sub_10001B0EC(64588, (uint64_t)v47, (v13 + 3), (uint64_t)v47, &v35, 14);
            if (*v7 != -1) {
              dispatch_once(v7, &stru_10015AF88);
            }
            __int16 v5 = v8;
            int v14 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 134219008;
              *(void *)int v42 = v35;
              *(_WORD *)&v42[8] = 1024;
              *(_DWORD *)int v43 = LOBYTE(v47[0]);
              *(_WORD *)&v43[4] = 1024;
              *(_DWORD *)__int128 v44 = BYTE1(v47[0]);
              *(_WORD *)&v44[4] = 1024;
              *(_DWORD *)uint64_t v45 = BYTE2(v47[0]);
              *(_WORD *)&v45[4] = 1024;
              v46[0] = BYTE3(v47[0]);
              _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "pktLength %zu WriteRAM 0x%02X%02X%02X%02X",  buf,  0x24u);
            }

            int v4 = v7;
            if (BYTE3(v47[0])) {
              goto LABEL_42;
            }
            char v3 = 1;
          }

          else
          {
            *a2 = v11;
            if (*v7 != -1) {
              dispatch_once(v7, &stru_10015AF48);
            }
            __int16 v5 = v8;
            char v18 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              int v23 = *a2;
              *(_DWORD *)__int128 buf = 67109120;
              *(_DWORD *)int v42 = v23;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  " addressLaunch = 0x%08X",  buf,  8u);
            }

            LODWORD(v3memset(v13, 0, 6) = 0;
            sub_100013788((uint64_t)v49, (unsigned int *)&v36, __s);
            char v3 = 1;
            int v32 = v11;
            int v4 = v7;
          }
        }
      }
    }

    while (fgets((char *)v51, 128, v2));
    if ((v3 & 1) == 0) {
      return fclose(v2);
    }
LABEL_42:
    if (*v4 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AFC8);
    }
    __int128 v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      int v28 = v49[0];
      if (!(_DWORD)v36) {
        int v28 = 0;
      }
      int v29 = v49[1];
      int v30 = v49[2];
      int v31 = v49[3];
      *(_DWORD *)__int128 buf = 67110400;
      *(_DWORD *)int v42 = v32;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v36;
      *(_WORD *)int v43 = 1024;
      *(_DWORD *)&v43[2] = v28;
      *(_WORD *)__int128 v44 = 1024;
      *(_DWORD *)&v44[2] = v29;
      *(_WORD *)uint64_t v45 = 1024;
      *(_DWORD *)&v45[2] = v30;
      LOWORD(v46[0]) = 1024;
      *(_DWORD *)((char *)v46 + 2) = v31;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  " firstAddress = 0x%08X firstsize_t Length = 0x%08X firstData[0-3] = 0x%02X%02X%02X%02X...",  buf,  0x26u);
    }

    LODWORD(v47[0]) = v32;
    int v25 = v36;
    __memcpy_chk((char *)v47 + 4);
    sub_10001B0EC(64588, (uint64_t)v47, (v25 + 3), (uint64_t)v47, &v35, 14);
    if (*v4 != -1) {
      dispatch_once(&qword_100162420, &stru_10015AFE8);
    }
    __int128 v26 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 134219008;
      *(void *)int v42 = v35;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)int v43 = LOBYTE(v47[0]);
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)__int128 v44 = BYTE1(v47[0]);
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)uint64_t v45 = BYTE2(v47[0]);
      *(_WORD *)&v45[4] = 1024;
      v46[0] = BYTE3(v47[0]);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "pktLength %zu WriteRAM 0x%02X%02X%02X%02X",  buf,  0x24u);
    }
  }

  return fclose(v2);
}

void sub_10001400C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001403C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001406C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001409C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000140CC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000140FC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001412C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001415C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001418C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000141BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000141EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

char *sub_10001421C(int a1)
{
  int v1 = &byte_100160AB0;
  if (!byte_100160AB0)
  {
    uint64_t v3 = sub_100026B38();
    if (!v3) {
      return 0LL;
    }
    int v4 = (const char *)v3;
    __int16 v5 = (const void *)MGCopyAnswer(@"ReleaseType", 0LL);
    if (!v5) {
      return 0LL;
    }
    size_t v6 = v5;
    int v7 = CFEqual(v5, @"Vendor");
    int v8 = CFEqual(v6, @"Internal");
    int v9 = CFEqual(v6, @"NonUI");
    int v10 = CFEqual(v6, @"VendorNonUI");
    CFRelease(v6);
    if (!v7 && !v8 && !v9 && !v10) {
      return 0LL;
    }
    int v11 = opendir("/etc/bluetool");
    if (v11)
    {
      int v12 = v11;
      int v13 = readdir(v11);
      if (v13)
      {
        int v14 = v13;
        while (1)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B0A8);
          }
          int v15 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            d_name = v14->d_name;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Looking at file %s", buf, 0xCu);
          }

          int v16 = v14->d_name;
          size_t v17 = strlen(v4);
          if (!strncmp(v16, v4, v17) && (strstr(v16, "LPM") == 0LL) != a1)
          {
            bzero(&byte_100160AB0, 0x400uLL);
            __strlcat_chk(&byte_100160AB0, "/etc/bluetool/", 1024LL, 1024LL);
            __strlcat_chk(&byte_100160AB0, v16, 1024LL, 1024LL);
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015B0C8);
            }
            char v18 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315138;
              d_name = &byte_100160AB0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Looking at firmware file %s",  buf,  0xCu);
            }

            if (!access(&byte_100160AB0, 4)) {
              break;
            }
          }

          readdir(v12);
          int v14 = readdir(v12);
          if (!v14) {
            goto LABEL_26;
          }
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B0E8);
        }
        int v20 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          d_name = (char *)v16;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Have access to file %s", buf, 0xCu);
        }

        int v1 = &byte_100160AB0;
      }

      else
      {
LABEL_26:
        int v1 = 0LL;
      }

      closedir(v12);
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

void sub_100014560(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100014590(_DWORD *a1)
{
  if (byte_10016241C)
  {
    uint64_t v1 = sub_1000173B8();
    if ((int)v1 >= 1)
    {
      uint64_t v2 = v1;
      uint64_t v3 = malloc(v1);
      if (v3)
      {
        int v4 = v3;
        if ((sub_1000161D0() & 0x80000000) == 0)
        {
          if (sub_1000164C0(v2, v4) == (_DWORD)v2)
          {
            uint64_t v5 = sub_100006E0C((uint64_t)v4, v2);
LABEL_24:
            free(v4);
            return v5;
          }

          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B168);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002B7A4();
          }
        }

        uint64_t v5 = 0xFFFFFFFFLL;
        goto LABEL_24;
      }
    }

    return 0xFFFFFFFFLL;
  }

  if (!a1) {
    return 0LL;
  }
  uint64_t v7 = sub_1000164C0(4LL, a1);
  uint64_t v5 = v7;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 == 4)
    {
      if (*(_BYTE *)a1 == 1)
      {
        unsigned int v8 = 4;
      }

      else
      {
        *(_DWORD *)((char *)a1 + 1) = *a1;
        *(_BYTE *)a1 = 1;
        unsigned int v8 = 5;
      }

      if (*((unsigned __int8 *)a1 + 2) == 252)
      {
        uint64_t v5 = *((unsigned __int8 *)a1 + 3) + 4;
        int v9 = v5 - v8;
        int v10 = sub_1000164C0(v5 - v8, (char *)a1 + v8);
        if (v10 == v9) {
          return v5;
        }
        if ((v10 & 0x80000000) == 0) {
          *__error() = 94;
        }
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B148);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B660();
        }
      }

      else
      {
        *__error() = 94;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B128);
        }
        int v11 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B68C(v11);
        }
      }
    }

    else
    {
      if ((v7 & 0x80000000) == 0) {
        *__error() = 94;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B108);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B634();
      }
    }

    return 0xFFFFFFFFLL;
  }

  return v5;
}

void sub_100014830(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014860(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014890(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000148C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000148F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014920(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014950(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014980(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000149B0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000149E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014A10(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014A40(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014A70(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014AA0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014AD0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014B00(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014B30(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014B60(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014B90(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014BC0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014BF0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014C20(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014C50(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014C80(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014CB0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014CE0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014D10(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100014D40(const void **a1, void *a2, uint64_t a3)
{
  uint64_t v8 = 0LL;
  uint64_t v5 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass(a3, 0LL, &v8);
  if (a1 && v5)
  {
    Value = CFDictionaryGetValue(v5, @"BTBF");
    *a1 = Value;
    if (!Value) {
      goto LABEL_9;
    }
LABEL_7:
    CFRetain(Value);
    uint64_t result = 0LL;
    if (!a2) {
      return result;
    }
    goto LABEL_10;
  }

  if (a1)
  {
    Value = *a1;
    if (*a1) {
      goto LABEL_7;
    }
  }

LABEL_9:
  uint64_t result = 0xFFFFFFFFLL;
  if (!a2) {
    return result;
  }
LABEL_10:
  if (v8) {
    *a2 = v8;
  }
  return result;
}

void sub_100014DD0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014E00(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014E30(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014E60(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014E90(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014EC0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014EF0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014F20(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014F50(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014F80(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014FB0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100014FE0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100015010(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100015040(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100015070(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000150A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000150D0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000150DC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000150E8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_100015118( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100015128(int a1)
{
  uint64_t v4 = 0LL;
  memset(&v3[1], 0, 192);
  if (a1) {
    unsigned __int16 v1 = 16387;
  }
  else {
    unsigned __int16 v1 = 16388;
  }
  v3[0] = 0uLL;
  return sub_100015184(2u, v1, (unsigned __int16 *)v3, 8LL, 0);
}

uint64_t sub_100015184(unsigned __int16 a1, unsigned __int16 a2, unsigned __int16 *a3, uint64_t a4, int a5)
{
  uint64_t v14 = 0LL;
  memset(v13, 0, sizeof(v13));
  *a3 = a1;
  a3[1] = (unint64_t)(a4 + 10) >> 1;
  int v8 = (unsigned __int16)word_100160EB0++;
  a3[2] = v8;
  a3[3] = a2;
  a3[4] = 0;
  char v12 = -62;
  __memcpy_chk(v13);
  if (a5)
  {
    uint64_t v11 = 217LL;
    int v9 = sub_10001B2C0((uint64_t)&v12, a4 + 11, (uint64_t)&v12, &v11);
    memcpy(a3, v13, v11 - 1);
    if (!v9) {
      goto LABEL_5;
    }
    return 0xFFFFFFFFLL;
  }

LABEL_5:
  if (v8 != a3[2] || a3[4]) {
    return 0xFFFFFFFFLL;
  }
  return 0LL;
}

uint64_t sub_1000152E4(int a1)
{
  uint64_t v4 = 0LL;
  memset(&v3[1], 0, 192);
  if (a1) {
    unsigned __int16 v1 = 16385;
  }
  else {
    unsigned __int16 v1 = 16386;
  }
  v3[0] = 0uLL;
  return sub_100015184(2u, v1, (unsigned __int16 *)v3, 8LL, 0);
}

uint64_t sub_100015340(__int16 a1)
{
  uint64_t v3 = 0LL;
  memset(v2, 0, sizeof(v2));
  WORD5(v2[0]) = 11;
  WORD6(v2[0]) = a1;
  return sub_100015184(2u, 0x5004u, (unsigned __int16 *)v2, 8LL, 0);
}

uint64_t sub_1000153A0()
{
  uint64_t v2 = 0LL;
  memset(v1, 0, sizeof(v1));
  WORD5(v1[0]) = 10;
  return sub_100015184(2u, 0x5004u, (unsigned __int16 *)v1, 8LL, 1);
}

uint64_t sub_1000153FC(__int16 *a1, __int16 *a2, _WORD *a3)
{
  uint64_t v26 = -1LL;
  *(void *)&__int128 v6 = -1LL;
  *((void *)&v6 + 1) = -1LL;
  __int128 v24 = v6;
  __int128 v25 = v6;
  __int128 v22 = v6;
  __int128 v23 = v6;
  __int128 v20 = v6;
  __int128 v21 = v6;
  __int128 v18 = v6;
  __int128 v19 = v6;
  __int128 v16 = v6;
  __int128 v17 = v6;
  __int128 v14 = v6;
  __int128 v15 = v6;
  __int128 v13 = v6;
  *a1 = WORD5(v13);
  *(void *)&__int128 v7 = -1LL;
  *((void *)&v7 + 1) = -1LL;
  __int128 v13 = v7;
  __int128 v14 = v7;
  __int128 v15 = v7;
  __int128 v16 = v7;
  __int128 v17 = v7;
  __int128 v18 = v7;
  __int128 v19 = v7;
  __int128 v20 = v7;
  __int128 v21 = v7;
  __int128 v22 = v7;
  __int128 v23 = v7;
  __int128 v24 = v7;
  __int128 v25 = v7;
  uint64_t v26 = -1LL;
  *a2 = WORD5(v13);
  *(void *)&__int128 v8 = -1LL;
  *((void *)&v8 + 1) = -1LL;
  __int128 v13 = v8;
  __int128 v14 = v8;
  __int128 v15 = v8;
  __int128 v16 = v8;
  __int128 v17 = v8;
  __int128 v18 = v8;
  __int128 v19 = v8;
  __int128 v20 = v8;
  __int128 v21 = v8;
  __int128 v22 = v8;
  __int128 v23 = v8;
  __int128 v24 = v8;
  __int128 v25 = v8;
  uint64_t v26 = -1LL;
  int v10 = WORD5(v13);
  *a3 = WORD5(v13);
  if (*a1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v12 = *a2 == -1 || v10 == 0xFFFF;
  return (v12 << 31 >> 31);
}

uint64_t sub_10001553C(__int16 a1, void *a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  __int128 v8 = 0u;
  WORD5(v8) = a1;
  size_t v5 = 2 * a3;
  WORD6(v8) = a3;
  uint64_t v6 = sub_100015184(0, 0x7003u, (unsigned __int16 *)&v8, 2 * a3 + 6, 1);
  if (!(_DWORD)v6 && a3) {
    memcpy(a2, v9, v5);
  }
  return v6;
}

uint64_t sub_1000155E0(__int16 a1, const void *a2, unint64_t a3)
{
  if (a3 > 0x64) {
    return 1LL;
  }
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  __int128 v8 = 0u;
  WORD5(v8) = a1;
  WORD6(v8) = a3;
  if (a3)
  {
    uint64_t v6 = 2 * a3;
    memcpy(v9, a2, 2 * a3);
    uint64_t v7 = v6 + 6;
  }

  else
  {
    uint64_t v7 = 6LL;
  }

  return sub_100015184(2u, 0x7003u, (unsigned __int16 *)&v8, v7, 1);
}

uint64_t sub_100015674(__int16 a1, _WORD *a2)
{
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  WORD5(v4[0]) = a1;
  HIWORD(v4[0]) = 0;
  uint64_t result = sub_100015184(0, 0x3006u, (unsigned __int16 *)v4, 8LL, 1);
  if (!(_DWORD)result) {
    *a2 = WORD6(v4[0]);
  }
  return result;
}

uint64_t sub_1000156E8(int a1, char **a2)
{
  uint64_t v4 = "Warm";
  optind = 1;
  while (2)
  {
    while (1)
    {
      uint64_t v5 = getopt(a1, a2, "hVrwRp:l:sicBT");
      int v6 = v5;
      switch((_DWORD)v5)
      {
        case 0x52:
LABEL_14:
          int v11 = sub_1000152E4(v5 == 82);
          if (v11)
          {
            fprintf(__stderrp, "Unable to reset chip: %d\n", v11);
          }

          else
          {
            if (v6 == 82) {
              __int128 v13 = "Cold";
            }
            else {
              __int128 v13 = v4;
            }
            fprintf(__stderrp, "%s reset complete!\n", v13);
          }

          break;
        case 0xFFFFFFFF:
          return 0LL;
        case 0x42:
          unsigned int v34 = sub_100023BA0();
          if (v34) {
            unsigned int v35 = v34;
          }
          else {
            unsigned int v35 = 2400000;
          }
          switch(v35)
          {
            case 0x1C200u:
              LOWORD(v3memset(v13, 0, 6) = 472;
              break;
            case 0x2DC6C0u:
              LOWORD(v3memset(v13, 0, 6) = 12288;
              break;
            case 0x249F00u:
              LOWORD(v3memset(v13, 0, 6) = 9830;
              break;
            default:
              int v36 = (int)((double)v35 * 0.004096);
              break;
          }

          *(_WORD *)__s = v36;
          __int16 v39 = 446;
          return sub_1000155E0(v39, __s, 1uLL);
        default:
LABEL_40:
          fprintf(__stderrp, "Invalid option '%c'\n", v5);
          break;
      }
    }

    switch((int)v5)
    {
      case 'h':
        fprintf(__stderrp, "%s - CSR Specific Commnads\n", *a2);
        fwrite("-V        - Get BlueCore specific version/revision information.\n", 0x40uLL, 1uLL, __stderrp);
        fwrite("-r        - Warm Reset.\n", 0x18uLL, 1uLL, __stderrp);
        fwrite("-R        - Cold Reset.\n", 0x18uLL, 1uLL, __stderrp);
        fwrite("-w        - Warm Halt.\n", 0x17uLL, 1uLL, __stderrp);
        fwrite("-s        - Deep Sleep\n", 0x17uLL, 1uLL, __stderrp);
        fwrite("-p <key>  - Read a given PSKEY\n", 0x1FuLL, 1uLL, __stderrp);
        fwrite("-l <mode> - Put device into PCM loopback\n", 0x29uLL, 1uLL, __stderrp);
        fwrite("-i\t       - Write device name and address\n", 0x2AuLL, 1uLL, __stderrp);
        fwrite("-c        - Check for wifi presence.\n", 0x25uLL, 1uLL, __stderrp);
        fwrite("-B        - Set the baud rate using a predefined value\n", 0x37uLL, 1uLL, __stderrp);
        fwrite("-T        - Set the transport using a predefined value\n", 0x37uLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        return 0LL;
      case 'i':
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        *(_OWORD *)__s = 0u;
        __int128 v43 = 0u;
        if (!j__gethostname(__s, 0x100uLL))
        {
          int v7 = strlen(__s);
          int v8 = v7 + 1 >= 0 ? v7 + 1 : v7 + 2;
          int v9 = sub_1000155E0(264, __s, (uint64_t)v8 >> 1);
          if (v9) {
            fprintf(__stderrp, "Unable to write Device Name (%d)\n", v9);
          }
        }

        if (!sub_100024150((unsigned __int8 *)__s))
        {
          v41[0] = __s[3];
          v41[1] = bswap32(*(unsigned __int16 *)&__s[4]) >> 16;
          v41[2] = __s[2];
          v41[3] = bswap32(*(unsigned __int16 *)__s) >> 16;
          int v10 = sub_1000155E0(1, v41, 4uLL);
          if (v10) {
            fprintf(__stderrp, "Unable to write BDADDR (%d)\n", v10);
          }
        }

        continue;
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'q':
      case 't':
      case 'u':
      case 'v':
        goto LABEL_40;
      case 'l':
        int v14 = strtoul(optarg, 0LL, 0);
        else {
          fprintf(__stderrp, "Chip now in PCM Loopback Mode %d\n", v14);
        }
        continue;
      case 'p':
        *(_WORD *)__s = 0;
        __int128 v15 = optarg;
        __int128 v16 = strchr(optarg, 61);
        if (v16)
        {
          __int128 v17 = v16;
          *__int128 v16 = 0;
          __int16 v18 = strtoul(v15, 0LL, 0);
          strcpy(__s, "d");
          __int128 v19 = malloc(0xC8uLL);
          if (!v19) {
            continue;
          }
          __int128 v20 = v19;
          __int128 v21 = strtok(v17 + 1, ",:");
          if (v21)
          {
            __int128 v22 = v4;
            unint64_t v23 = 0LL;
            uint64_t v24 = 0xFFFFFFFF00000000LL;
            while (v23 < *(unsigned __int16 *)__s)
            {
              v20[v23++] = strtoul(v21, 0LL, 0);
              __int128 v21 = strtok(0LL, ",:");
              v24 += (uint64_t)&_mh_execute_header;
              if (!v21) {
                goto LABEL_56;
              }
            }

            fprintf( __stderrp,  "Too many values given, skipping all past 0x%04x\n",  *(unsigned __int16 *)((char *)v20 + (v24 >> 31)));
LABEL_56:
            uint64_t v4 = v22;
          }

          else
          {
            LOWORD(v23) = 0;
          }

          *(_WORD *)__s = v23;
LABEL_59:
          free(v20);
          continue;
        }

        unsigned __int16 v28 = strtoul(v15, 0LL, 0);
        if (sub_100015674(v28, __s))
        {
          *(_WORD *)__s = 1;
          uint64_t v29 = 1LL;
        }

        else
        {
          uint64_t v29 = *(unsigned __int16 *)__s;
        }

        int v32 = malloc(2 * v29);
        if (v32)
        {
          __int128 v20 = v32;
          if (sub_10001553C(v28, v32, v29))
          {
            fprintf(__stderrp, "Unable to read PSKEY 0x%04x: %d\n");
          }

          else
          {
            fprintf(__stderrp, "PSKEY 0x%04x = ", v28);
            if (*(_WORD *)__s)
            {
              unint64_t v33 = 0LL;
              do
                fprintf(__stderrp, "0x%04x ", (unsigned __int16)v20[v33++]);
              while (v33 < *(unsigned __int16 *)__s);
            }

            fputc(10, __stderrp);
          }

          goto LABEL_59;
        }

        continue;
      case 'r':
        goto LABEL_14;
      case 's':
        int v25 = sub_1000153A0();
        uint64_t v26 = __stderrp;
        if (v25)
        {
          fprintf(__stderrp, "Unable to deep sleep chip: %d\n", v25);
          continue;
        }

        int v30 = "Deep Sleep Entered!\n";
        size_t v31 = 20LL;
        goto LABEL_46;
      case 'w':
        int v27 = sub_100015128(0);
        uint64_t v26 = __stderrp;
        if (v27)
        {
          fprintf(__stderrp, "Unable to warm halt chip: %d\n", v27);
        }

        else
        {
          int v30 = "Warm Halt Entered!\n";
          size_t v31 = 19LL;
LABEL_46:
          fwrite(v30, v31, 1uLL, v26);
        }

        continue;
      default:
        if ((_DWORD)v5 == 86)
        {
          *(_WORD *)__s = 0;
          v41[0] = 0;
          unsigned __int16 v40 = 0;
          int v12 = sub_1000153FC((__int16 *)__s, v41, &v40);
          if (v12)
          {
            fprintf(__stderrp, "Unable to get CSR specific revision information: %d\n", v12);
          }

          else
          {
            fprintf( __stderrp,  "CSR BlueCore Version 0x%04x, Revision 0x%04x, Build: ",  *(unsigned __int16 *)__s,  (unsigned __int16)v41[0]);
            if (v40 == 3164)
            {
              puts("A06");
            }

            else if (v40 == 1120)
            {
              puts("A05");
            }

            else
            {
              printf("Unknown: 0x%04x\n", v40);
            }
          }

          continue;
        }

        if ((_DWORD)v5 != 84) {
          goto LABEL_40;
        }
        switch(sub_100023E78())
        {
          case 0u:
            __int16 v38 = 2;
            goto LABEL_86;
          case 1u:
          case 3u:
            __int16 v38 = 3;
            goto LABEL_86;
          case 2u:
            __int16 v38 = 7;
            goto LABEL_86;
          case 4u:
            __int16 v38 = 6;
            goto LABEL_86;
          case 5u:
            __int16 v38 = 1;
LABEL_86:
            *(_WORD *)__s = v38;
            break;
          default:
            *(_WORD *)__s = 0;
            break;
        }

        __int16 v39 = 505;
        return sub_1000155E0(v39, __s, 1uLL);
    }
  }

uint64_t sub_100015EB0()
{
  if (MGGetBoolAnswer(@"ThreadRadioCapability"))
  {
    int v5 = -1441055153;
    __int128 v4 = xmmword_10002E828;
    uint64_t result = MGIsDeviceOneOfType(&v4);
    if ((result & 1) != 0) {
      goto LABEL_3;
    }
  }

  int v3 = -1962371525;
  __int128 v2 = xmmword_10002E83C;
  uint64_t result = MGIsDeviceOneOfType(&v2);
  if ((_DWORD)result
    && (uint64_t result = MGGetStringAnswer(@"MacFormFactor")) != 0
    && (uint64_t result = (uint64_t)objc_msgSend((id)result, "UTF8String", 0)) != 0
    && (uint64_t result = strcmp((const char *)result, "rack"), !(_DWORD)result))
  {
LABEL_3:
    char v1 = 1;
  }

  else
  {
    char v1 = 0;
  }

  byte_100160EB8 = v1;
  return result;
}

uint64_t sub_100015F98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12 = a2;
  int v14 = &qword_100160EC8;
  if (a12) {
    int v14 = &qword_100160EC0;
  }
  __int128 v15 = (char *)*v14;
  __int128 v16 = &dword_100160ED0;
  if (!a12) {
    __int128 v16 = &dword_100160ED4;
  }
  unsigned int v17 = *v16;
  if (!v15)
  {
    uint64_t v19 = a3;
    uint64_t v20 = a6;
    uint64_t v21 = a5;
    uint64_t v22 = a4;
    uint64_t v23 = a8;
    uint64_t v24 = a7;
    __int128 v15 = (char *)calloc(0x200uLL, 0x60uLL);
    a7 = v24;
    a8 = v23;
    a4 = v22;
    a5 = v21;
    a6 = v20;
    a3 = v19;
    uint64_t v12 = a2;
    int v25 = &qword_100160EC0;
    if (!a12) {
      int v25 = &qword_100160EC8;
    }
    *int v25 = (uint64_t)v15;
    if (!v15) {
      return 4661LL;
    }
  }

  if (v17 >= 0x201)
  {
    uint64_t v26 = a3;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B608);
    }
    int v27 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136315650;
      uint64_t v31 = a1;
      __int16 v32 = 2080;
      uint64_t v33 = v12;
      __int16 v34 = 2080;
      uint64_t v35 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Out of memory, can't add %s_%s_%s.",  (uint8_t *)&v30,  0x20u);
    }

    return 4661LL;
  }

  uint64_t v29 = &v15[96 * v17];
  *(void *)uint64_t v29 = a1;
  *((void *)v29 + 1) = v12;
  *((void *)v29 + 2) = a3;
  *((void *)v29 + 3) = a7;
  *((void *)v29 + 4) = a8;
  *((void *)v29 + 5) = a9;
  *((void *)v29 + memset(v13, 0, 6) = a10;
  *((void *)v29 + 7) = a11;
  *((void *)v29 + 8) = a4;
  *((void *)v29 + 9) = a5;
  *((void *)v29 + 10) = a6;
  *((void *)v29 + 11) = 0LL;
  uint64_t result = 0LL;
  if (a12) {
    dword_100160ED0 = v17 + 1;
  }
  else {
    dword_100160ED4 = v17 + 1;
  }
  return result;
}

void sub_1000161A0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000161D0()
{
  uint8x8_t v0 = sub_1000263FC();
  char v1 = (const char *)sub_100026B38();
  sub_100025E54();
  __int128 v2 = sub_10001625C();
  int v3 = byte_100160EB8;
  uint64_t v4 = qword_100160EC0;
  uint64_t v5 = qword_100160EC8;
  uint64_t result = sub_1000163B0(v0, v1, v2);
  if ((_DWORD)result != -1)
  {
    int v7 = result;
    uint64_t result = 0LL;
    if (v3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v5;
    }
    *(_DWORD *)(v8 + 96LL * v7 + 88) = 0;
  }

  return result;
}

const char *sub_10001625C()
{
  int v0 = sub_100025E54();
  if (v0 > 1835627634)
  {
    if (v0 <= 1886547811)
    {
      if (v0 == 1835627635)
      {
        return "MIT";
      }

      else
      {
        if (v0 != 1836413537) {
          return "ALL";
        }
        return "MUR";
      }
    }

    else
    {
      switch(v0)
      {
        case 1886547812:
          return "PROD";
        case 1936548719:
          return "SMC";
        case 1937006964:
          return "STA";
        default:
          return "ALL";
      }
    }
  }

  else if (v0 <= 544498794)
  {
    if (v0 == 538997881)
    {
      return "TY";
    }

    else
    {
      if (v0 != 543450486) {
        return "ALL";
      }
      return "DEV";
    }
  }

  else if (v0 == 544498795)
  {
    return "TDK";
  }

  else
  {
    if (v0 != 544568169) {
      return "ALL";
    }
    return "USI";
  }

uint64_t sub_1000163B0(char *__s1, const char *a2, const char *a3)
{
  uint64_t v3 = dword_1001609DC;
  if (dword_1001609DC == -1)
  {
    if (byte_100160EB8) {
      uint64_t v4 = &qword_100160EC0;
    }
    else {
      uint64_t v4 = &qword_100160EC8;
    }
    uint64_t v5 = &dword_100160ED0;
    if (!byte_100160EB8) {
      uint64_t v5 = &dword_100160ED4;
    }
    uint64_t v6 = *v5;
    if ((_DWORD)v6)
    {
      uint64_t v3 = 0LL;
      for (uint64_t i = (const char **)(*v4 + 16); ; i += 12)
      {
        if (!strcmp(__s1, *(i - 2)) && (!a2 || !strcmp(a2, *(i - 1))))
        {
          int v11 = *i;
          if (!strcmp(a3, *i) || !strcmp("ALL", v11)) {
            break;
          }
        }

        if (v6 == ++v3) {
          return 0xFFFFFFFFLL;
        }
      }

      if (a2) {
        dword_1001609DC = v3;
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v3;
}

uint64_t sub_1000164C0(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1000263FC();
  uint64_t v5 = sub_100026B38();
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = (const char *)v5;
  if (dword_1001609D8 == -1)
  {
    int v7 = sub_100025E54();
    if (v7 == -1) {
      int v8 = 0;
    }
    else {
      int v8 = v7;
    }
    dword_1001609D8 = v8;
  }

  int v9 = sub_10001625C();
  int v10 = sub_1000163B0(v4, v6, v9);
  int v11 = byte_100160EB8 ? &qword_100160EC0 : &qword_100160EC8;
  if (v10 == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = *v11;
  uint64_t v13 = v12 + 96LL * v10;
  uint64_t v16 = *(int *)(v13 + 88);
  int v14 = (int *)(v13 + 88);
  uint64_t v15 = v16;
  int v17 = v10;
  uint64_t v18 = v12 + 96LL * v10;
  LODWORD(v1memset(v13, 0, 6) = *(_DWORD *)(v18 + 40);
  uint64_t v20 = (int *)(v18 + 40);
  unsigned int v19 = v16;
  if (v16 <= v15)
  {
    a1 = 0LL;
    int *v14 = 0;
    return a1;
  }

  uint64_t v21 = *(void *)(v12 + 96LL * v10 + 48);
  if (v21)
  {
    uint64_t v22 = (const void *)(v21 + v15);
    if ((int)v15 + (int)a1 >= v19)
    {
      memcpy(a2, v22, v19 - v15);
      int v26 = *v20;
      int *v14 = *v20;
      return (v26 - v15);
    }

    else
    {
      memcpy(a2, v22, a1);
      *v14 += a1;
    }

    return a1;
  }

  bzero(&byte_100161AF0, 0x400uLL);
  __strlcat_chk(&byte_100161AF0, "/usr/share/firmware/bluetooth/", 1024LL, 1024LL);
  if (byte_100160EB8) {
    uint64_t v23 = &qword_100160EC0;
  }
  else {
    uint64_t v23 = &qword_100160EC8;
  }
  __strlcat_chk(&byte_100161AF0, *(void *)(*v23 + 96LL * v17 + 24), 1024LL, 1024LL);
  if (!byte_100161AF0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BC48);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B810();
    }
    return 0xFFFFFFFFLL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BC68);
  }
  uint64_t v24 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    buf.st_dev = 136315138;
    *(void *)&buf.st_mode = &byte_100161AF0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Expecting firmware file: %s",  (uint8_t *)&buf,  0xCu);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BB48);
    }
  }

  int v25 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    buf.st_dev = 136315138;
    *(void *)&buf.st_mode = &byte_100161AF0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Opening firmware file: %s", (uint8_t *)&buf, 0xCu);
  }

  if (sub_100016F24(v17, (uint64_t)&byte_100161AF0, 0))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BB68);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B920();
    }
    return 0xFFFFFFFFLL;
  }

  int v28 = open(&byte_100161AF0, 0);
  if (v28 < 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BB88);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B83C();
    }
    return 0xFFFFFFFFLL;
  }

  int v29 = v28;
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BBA8);
  }
  int v30 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    buf.st_dev = 136315138;
    *(void *)&buf.st_mode = &byte_100161AF0;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Firmware file %s successfully opened",  (uint8_t *)&buf,  0xCu);
  }

  memset(&buf, 0, sizeof(buf));
  if (fstat(v29, &buf) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BBC8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002B868();
      if (!v29) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_69;
    }

    goto LABEL_68;
  }

  if (LODWORD(buf.st_size) != (_DWORD)a1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BC28);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002B8F4();
      if (!v29) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_69;
    }

    goto LABEL_68;
  }

  if (read(v29, a2, SLODWORD(buf.st_size)) != (_DWORD)a1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BBE8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002B894();
      if (!v29) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_69;
    }

LABEL_68:
    if (!v29) {
      return 0xFFFFFFFFLL;
    }
LABEL_69:
    close(v29);
    return 0xFFFFFFFFLL;
  }

  close(v29);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BC08);
  }
  uint64_t v31 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    v32[0] = 68157954;
    v32[1] = a1;
    __int16 v33 = 2096;
    __int16 v34 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Raw firmware data loaded: %.*P",  (uint8_t *)v32,  0x12u);
  }

  return a1;
}

uint64_t sub_100016AA0()
{
  int v0 = sub_1000263FC();
  char v1 = (const char *)sub_100026B38();
  sub_100025E54();
  __int128 v2 = sub_10001625C();
  if (!v0) {
    return 0LL;
  }
  int v3 = sub_1000163B0(v0, v1, v2);
  if (v3 == -1) {
    return 0LL;
  }
  if (byte_100160EB8) {
    uint64_t v4 = &qword_100160EC0;
  }
  else {
    uint64_t v4 = &qword_100160EC8;
  }
  return *(void *)(*v4 + 96LL * v3 + 24);
}

uint64_t sub_100016B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v12 = (char *)qword_100160ED8;
  if (!qword_100160ED8)
  {
    uint64_t v12 = (char *)calloc(0x100uLL, 0x30uLL);
    qword_100160ED8 = (uint64_t)v12;
    if (!v12) {
      return 4661LL;
    }
  }

  int v13 = dword_100160EE0;
  if (dword_100160EE0 >= 0x100)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B628);
    }
    int v14 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315650;
      uint64_t v18 = a1;
      __int16 v19 = 2080;
      uint64_t v20 = a2;
      __int16 v21 = 2080;
      uint64_t v22 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Out of memory, can't add %s_%s_%s.",  (uint8_t *)&v17,  0x20u);
    }

    return 4661LL;
  }

  uint64_t result = 0LL;
  uint64_t v16 = &v12[48 * dword_100160EE0];
  *(void *)uint64_t v16 = a1;
  *((void *)v16 + 1) = a2;
  *((void *)v16 + 2) = a3;
  *((void *)v16 + 3) = a4;
  *((_DWORD *)v16 + 8) = a5;
  *((_DWORD *)v16 + 9) = 0;
  *((void *)v16 + 5) = a6;
  dword_100160EE0 = v13 + 1;
  return result;
}

void sub_100016C94(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void *sub_100016CC4()
{
  int v0 = sub_1000263FC();
  char v1 = (const char *)sub_100026B38();
  sub_100025E54();
  __int128 v2 = sub_10001625C();
  bzero(&unk_100160EE4, 0x400uLL);
  __strlcat_chk(&unk_100160EE4, "/usr/share/firmware/bluetooth/", 1024LL, 1024LL);
  int v3 = 0LL;
  if (v0 && v1)
  {
    uint64_t v4 = dword_100160EE0;
    if (!dword_100160EE0) {
      return 0LL;
    }
    uint64_t v5 = 0LL;
    for (uint64_t i = qword_100160ED8 + 16; ; i += 48LL)
    {
      if (!strcmp(v0, *(const char **)(i - 16)) && !strcmp(v1, *(const char **)(i - 8)))
      {
        int v7 = *(const char **)i;
      }

      if (v4 == ++v5) {
        return 0LL;
      }
    }

    __strlcat_chk(&unk_100160EE4, *(void *)(i + 8), 1024LL, 1024LL);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B648);
    }
    int v9 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = &unk_100160EE4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Opening firmware file: %s",  (uint8_t *)&v10,  0xCu);
    }

    int v3 = &unk_100160EE4;
    if (sub_100016F24(v5, (uint64_t)&unk_100160EE4, 1))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B668);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002B920();
      }
      return 0LL;
    }
  }

  return v3;
}

void sub_100016EF4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100016F24(int a1, uint64_t a2, int a3)
{
  char v3 = a3;
  if (a3)
  {
    if (!**(_BYTE **)(qword_100160ED8 + 48LL * a1 + 40))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BC88);
      }
      if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        return 10LL;
      }
      goto LABEL_28;
    }
  }

  else
  {
    if (byte_100160EB8) {
      uint64_t v6 = &qword_100160EC0;
    }
    else {
      uint64_t v6 = &qword_100160EC8;
    }
    if (!**(_BYTE **)(*v6 + 96LL * a1 + 56))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BCA8);
      }
      if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        return 10LL;
      }
LABEL_28:
      sub_10002B94C();
      return 10LL;
    }
  }

  int v7 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  int v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2);
  if (!-[NSFileManager fileExistsAtPath:isDirectory:](v7, "fileExistsAtPath:isDirectory:", v8, 0LL))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BD28);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B9D0();
    }
    return 10LL;
  }

  int v9 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v8);
  *(_OWORD *)md = 0u;
  __int128 v17 = 0u;
  int v10 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 64LL);
  if (!CC_SHA256(-[NSData bytes](v9, "bytes"), (CC_LONG)-[NSData length](v9, "length"), md))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BCC8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002B978();
    }
    return 14LL;
  }

  for (uint64_t i = 0LL; i != 32; ++i)
    -[NSMutableString appendFormat:](v10, "appendFormat:", @"%02x", md[i]);
  uint64_t v12 = (const char *)-[NSMutableString cStringUsingEncoding:](v10, "cStringUsingEncoding:", 4LL);
  if ((v3 & 1) != 0)
  {
    if (strcmp(*(const char **)(qword_100160ED8 + 48LL * a1 + 40), v12))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BCE8);
      }
      if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        return 14LL;
      }
      goto LABEL_41;
    }
  }

  else
  {
    if (byte_100160EB8) {
      int v14 = &qword_100160EC0;
    }
    else {
      int v14 = &qword_100160EC8;
    }
    if (strcmp(*(const char **)(*v14 + 96LL * a1 + 56), v12))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BD08);
      }
      if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        return 14LL;
      }
LABEL_41:
      sub_10002B9A4();
      return 14LL;
    }
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BD48);
  }
  uint64_t v15 = (os_log_s *)qword_100162428;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
  if ((_DWORD)result)
  {
    *(_WORD *)md = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "firmeare file SHA check passed", md, 2u);
    return 0LL;
  }

  return result;
}

void sub_100017388(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000173B8()
{
  int v0 = sub_1000263FC();
  char v1 = (const char *)sub_100026B38();
  sub_100025E54();
  __int128 v2 = sub_10001625C();
  int v3 = byte_100160EB8;
  uint64_t v4 = qword_100160EC0;
  uint64_t v5 = qword_100160EC8;
  uint64_t result = sub_1000163B0(v0, v1, v2);
  if ((_DWORD)result != -1)
  {
    if (v3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = v5;
    }
    return *(unsigned int *)(v7 + 96LL * (int)result + 40);
  }

  return result;
}

uint64_t sub_10001743C(int a1)
{
  __int128 v2 = sub_1000263FC();
  int v3 = (const char *)sub_100026B38();
  sub_100025E54();
  uint64_t v4 = sub_10001625C();
  if (byte_100160EB8) {
    uint64_t v5 = &qword_100160EC0;
  }
  else {
    uint64_t v5 = &qword_100160EC8;
  }
  uint64_t v6 = *v5;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v77 = 0u;
  if (!v2) {
    return 10LL;
  }
  uint64_t v7 = v4;
  int v8 = (const void *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (v8)
  {
    int v9 = v8;
    BOOL v10 = CFEqual(v8, @"Vendor") != 0;
    BOOL v11 = CFEqual(v9, @"Internal") != 0;
    CFRelease(v9);
  }

  else
  {
    BOOL v11 = 0;
    BOOL v10 = 0;
  }

  int v72 = a1;
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B688);
  }
  memset(&v73, 0, sizeof(v73));
  int v13 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315394;
    *(void *)uint64_t v75 = v2;
    *(_WORD *)&v75[8] = 2080;
    *(void *)&v75[10] = "runCommandForCurrentConfig";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "platform = %s from %s", buf, 0x16u);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B6A8);
    }
  }

  int v14 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315394;
    *(void *)uint64_t v75 = v3;
    *(_WORD *)&v75[8] = 2080;
    *(void *)&v75[10] = "runCommandForCurrentConfig";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "chip = %s from %s", buf, 0x16u);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B6C8);
    }
  }

  uint64_t v15 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315394;
    *(void *)uint64_t v75 = v7;
    *(_WORD *)&v75[8] = 2080;
    *(void *)&v75[10] = "runCommandForCurrentConfig";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "vendor = %s from %s", buf, 0x16u);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B6E8);
    }
  }

  uint64_t v16 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109634;
    *(_DWORD *)uint64_t v75 = v10;
    *(_WORD *)&v75[4] = 1024;
    *(_DWORD *)&v75[6] = v11;
    *(_WORD *)&v75[10] = 2080;
    *(void *)&v75[12] = "runCommandForCurrentConfig";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_isVendorInstall = %d and _isInternalInstall = %d from %s",  buf,  0x18u);
  }

  if (v10 || v11)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B708);
    }
    __int128 v17 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)uint64_t v75 = "runCommandForCurrentConfig";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "we are going to look for override script in %s",  buf,  0xCu);
    }

    uint64_t v18 = objc_autoreleasePoolPush();
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B728);
    }
    __int16 v19 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)uint64_t v75 = "runCommandForCurrentConfig";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "entered autoreleasepool from %s", buf, 0xCu);
    }

    uint64_t v20 = (void *)MGCopyAnswer(@"/YYygAofPDbhrwToVsXdeA", 0LL);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B748);
    }
    __int16 v21 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v20 UTF8String];
      *(_DWORD *)stat buf = 136315394;
      *(void *)uint64_t v75 = v22;
      *(_WORD *)&v75[8] = 2080;
      *(void *)&v75[10] = "runCommandForCurrentConfig";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "HW Model = %s from %s", buf, 0x16u);
    }

    if (v20)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B768);
      }
      uint64_t v23 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        *(void *)uint64_t v75 = "runCommandForCurrentConfig";
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "entered HW Model section from %s",  buf,  0xCu);
      }

      uint64_t v24 = (const char *)[v20 UTF8String];
      int v25 = "init";
      if (a1 != 2) {
        int v25 = "deepsleep";
      }
      if (a1 == 1) {
        int v25 = "boot";
      }
      snprintf(__str, 0x80uLL, "/etc/bluetool/%s.%s.script", v24, v25);
      CFRelease(v20);
      if (!stat(__str, &v73))
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B788);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002B9FC();
        }
        unsigned int v62 = fopen(__str, "r");
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B7A8);
        }
        ssize_t v63 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 136315394;
          *(void *)uint64_t v75 = __str;
          *(_WORD *)&v75[8] = 2080;
          *(void *)&v75[10] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "HW Model there is override script file %s and use it from %s",  buf,  0x16u);
        }

        if (v62)
        {
          int v64 = (char *)malloc(0x400uLL);
          if (v64)
          {
            int v65 = v64;
            while (!feof(v62))
            {
              unsigned int v66 = fgets(v65, 1024, v62);
              if (v66)
              {
                int v67 = v66;
                size_t v68 = strlen(v66);
                if (v68)
                {
                  v67[v68 - 1] = 0;
                  sub_10001D150(v67, 0LL);
                }
              }
            }

            fclose(v62);
            free(v65);
          }

          else
          {
            fclose(v62);
          }

          objc_autoreleasePoolPop(v18);
          return 0LL;
        }
      }
    }

    objc_autoreleasePoolPop(v18);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B7C8);
    }
    int v26 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)uint64_t v75 = "runCommandForCurrentConfig";
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "didn't find HWModel override script. Continue to look for platform override script from %s",  buf,  0xCu);
    }

    int v27 = "init";
    if (a1 != 2) {
      int v27 = "deepsleep";
    }
    if (a1 == 1) {
      int v27 = "boot";
    }
    snprintf(__str, 0x80uLL, "/etc/bluetool/%s.%s.script", v2, v27);
    if (!stat(__str, &v73))
    {
      __int128 v55 = fopen(__str, "r");
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015B7E8);
      }
      __int128 v56 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315394;
        *(void *)uint64_t v75 = __str;
        *(_WORD *)&v75[8] = 2080;
        *(void *)&v75[10] = "runCommandForCurrentConfig";
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "platform there is override script file %s and use it from %s",  buf,  0x16u);
      }

      if (v55)
      {
        __int128 v57 = (char *)malloc(0x400uLL);
        if (v57)
        {
          int v58 = v57;
          while (!feof(v55))
          {
            char v59 = fgets(v58, 1024, v55);
            if (v59)
            {
              unsigned int v60 = v59;
              size_t v61 = strlen(v59);
              if (v61)
              {
                v60[v61 - 1] = 0;
                sub_10001D150(v60, 0LL);
              }
            }
          }

          fclose(v55);
          free(v58);
        }

        else
        {
          fclose(v55);
        }

        return 0LL;
      }
    }
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B808);
  }
  int v28 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    *(void *)uint64_t v75 = "runCommandForCurrentConfig";
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "didn't find platform override script either. Will use builtinScript in firmwareList array from %s",  buf,  0xCu);
  }

  int v29 = sub_1000163B0(v2, v3, v7);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B828);
  }
  int v30 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109378;
    *(_DWORD *)uint64_t v75 = v29;
    *(_WORD *)&v75[4] = 2080;
    *(void *)&v75[6] = "runCommandForCurrentConfig";
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "getFirmwarePosForPlatform fwPos = %d from %s",  buf,  0x12u);
    uint64_t v31 = qword_100162420;
    if (v29 != -1) {
      goto LABEL_77;
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B848);
    }
  }

  else if (v29 != -1)
  {
    goto LABEL_79;
  }

  __int16 v32 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    *(void *)uint64_t v75 = "runCommandForCurrentConfig";
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "entered fwPos == NO_FW_FOUND from %s",  buf,  0xCu);
  }

  uint64_t v71 = v6;
  unsigned int v33 = 0;
  do
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B868);
    }
    __int16 v34 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 67109120;
      *(_DWORD *)uint64_t v75 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "No WiFi - Iteration %d", buf, 8u);
    }

    usleep(0x7A120u);
    int v35 = sub_100025E54();
    int v36 = sub_10001625C();
    int v37 = sub_1000163B0(v2, v3, v36);
    int v29 = v37;
    if (v33 > 8) {
      break;
    }
    if (v35 != -1) {
      break;
    }
    ++v33;
  }

  while (v37 == -1);
  uint64_t v31 = qword_100162420;
  if (v37 != -1)
  {
    uint64_t v6 = v71;
LABEL_77:
    if (v31 != -1) {
      dispatch_once(&qword_100162420, &stru_10015B8A8);
    }
LABEL_79:
    __int16 v38 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109378;
      *(_DWORD *)uint64_t v75 = v29;
      *(_WORD *)&v75[4] = 2080;
      *(void *)&v75[6] = "runCommandForCurrentConfig";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "final fwPos = %d from %s", buf, 0x12u);
    }

    switch(v72)
    {
      case 3:
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B9C8);
        }
        __int128 v45 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B9E8);
          }
        }

        __int128 v46 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 67109378;
          *(_DWORD *)uint64_t v75 = v29;
          *(_WORD *)&v75[4] = 2080;
          *(void *)&v75[6] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "running deepsleep builtin script in firmwareList array at fwPos %d from %s",  buf,  0x12u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015BA08);
          }
        }

        __int128 v47 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015BA28);
          }
        }

        __int128 v48 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v49 = *(void *)(v6 + 96LL * v29 + 80);
          *(_DWORD *)stat buf = 134218242;
          *(void *)uint64_t v75 = v49;
          *(_WORD *)&v75[8] = 2080;
          *(void *)&v75[10] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "firmwareList at fwPos has deepsleep function pointer at %p from %s",  buf,  0x16u);
        }

        CFTypeRef v70 = *(uint64_t (**)(void))(v6 + 96LL * v29 + 80);
        if (v70) {
          return v70();
        }
        break;
      case 2:
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B948);
        }
        __int128 v50 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B968);
          }
        }

        __int128 v51 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 67109378;
          *(_DWORD *)uint64_t v75 = v29;
          *(_WORD *)&v75[4] = 2080;
          *(void *)&v75[6] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "running init builtin script in firmwareList array at fwPos %d from %s",  buf,  0x12u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B988);
          }
        }

        __int128 v52 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B9A8);
          }
        }

        __int128 v53 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v54 = *(void *)(v6 + 96LL * v29 + 72);
          *(_DWORD *)stat buf = 134218242;
          *(void *)uint64_t v75 = v54;
          *(_WORD *)&v75[8] = 2080;
          *(void *)&v75[10] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "firmwareList at fwPos has init function pointer %p from %s",  buf,  0x16u);
        }

        CFTypeRef v70 = *(uint64_t (**)(void))(v6 + 96LL * v29 + 72);
        if (v70) {
          return v70();
        }
        break;
      case 1:
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015B8C8);
        }
        __int16 v39 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B8E8);
          }
        }

        unsigned __int16 v40 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 67109378;
          *(_DWORD *)uint64_t v75 = v29;
          *(_WORD *)&v75[4] = 2080;
          *(void *)&v75[6] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "running boot builtin script in firmwareList array at fwPos %d from %s",  buf,  0x12u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B908);
          }
        }

        __int16 v41 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "******************************", buf, 2u);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015B928);
          }
        }

        int v42 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = *(void *)(v6 + 96LL * v29 + 64);
          int v44 = v29;
          *(_DWORD *)stat buf = 67109634;
          *(_DWORD *)uint64_t v75 = v29;
          *(_WORD *)&v75[4] = 2048;
          *(void *)&v75[6] = v43;
          *(_WORD *)&v75[14] = 2080;
          *(void *)&v75[16] = "runCommandForCurrentConfig";
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "firmwareList at fwPos %d has boot function pointer %p from %s",  buf,  0x1Cu);
        }

        else
        {
          int v44 = v29;
        }

        CFTypeRef v70 = *(uint64_t (**)(void))(v6 + 96LL * v44 + 64);
        if (!v70) {
          return 5LL;
        }
        return v70();
      default:
        return 15LL;
    }

    return 5LL;
  }

  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015B888);
  }
  ssize_t v69 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 136315650;
    *(void *)uint64_t v75 = v2;
    *(_WORD *)&v75[8] = 2080;
    *(void *)&v75[10] = v3;
    *(_WORD *)&v75[18] = 2080;
    *(void *)&v75[20] = v36;
    _os_log_error_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "Error - no firmware for this platform.  Looking for %s %s %s",  buf,  0x20u);
  }

  if (v35 == -1) {
    return 13LL;
  }
  else {
    return 10LL;
  }
}

void sub_10001872C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001875C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001878C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000187BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000187EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001881C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001884C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001887C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000188AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000188DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001890C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001893C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001896C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001899C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000189CC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000189FC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018A2C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018A5C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018A8C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018ABC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018AEC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018B1C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018B4C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018B7C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018BAC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018BDC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018C0C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018C3C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018C6C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100018C9C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void *sub_100018CCC()
{
  return &unk_1001612E4;
}

uint64_t sub_100018CD8(uint64_t a1)
{
  return __strlcpy_chk(&unk_1001612E4, a1, 1024LL, 1024LL);
}

uint64_t sub_100018CF0(uint64_t a1, uint64_t a2, int a3)
{
  if (!qword_1001616E8) {
    qword_1001616E8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a1);
  if (![(id)qword_1001616E8 objectForKey:v6])
  {
    uint64_t v7 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", a2, a3);
    [(id)qword_1001616E8 setObject:v7 forKey:v6];
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BA48);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
      sub_10002BA5C();
    }
  }

  return 0LL;
}

void sub_100018DF8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100018E28(uint64_t a1, void *a2)
{
  int v3 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1);
  id v4 = [(id)qword_1001616E8 objectForKey:v3];
  if (v4)
  {
    memcpy(a2, [v4 bytes], (size_t)objc_msgSend(v4, "length"));
    return 0LL;
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BA68);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BABC();
    }
    return 22LL;
  }

void sub_100018EFC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100018F2C(int a1, void *a2)
{
  id v4 = sub_1000263FC();
  uint64_t v5 = (const char *)sub_100026B38();
  sub_100025E54();
  uint64_t v6 = sub_10001625C();
  uint64_t v7 = sub_100026824();
  int v8 = sub_1000163B0(v4, v5, v6);
  if (v8 == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BA88);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BB1C();
    }
    return 22LL;
  }

  int v9 = v8;
  if (byte_100160EB8) {
    BOOL v10 = &qword_100160EC0;
  }
  else {
    BOOL v10 = &qword_100160EC8;
  }
  if (!*(void *)(*v10 + 96LL * v8 + 32))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BD68);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BB48();
    }
    return 22LL;
  }

  bzero(byte_1001616F0, 0x400uLL);
  __strlcat_chk(byte_1001616F0, "/usr/share/firmware/bluetooth/", 1024LL, 1024LL);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BD88);
  }
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
    sub_10002BE54();
  }
  if (sub_100019A78(v9, v7) == -1)
  {
    if (v7)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BDA8);
      }
      __int16 v19 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136315138;
        __int128 v47 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "SKU=%s specific PTB file not found. Attempting to load default (non-SKU) PTB file",  buf,  0xCu);
      }

      if (sub_100019A78(v9, "R") == -1)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015BDC8);
        }
        int v37 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002BDE4(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        return 22LL;
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BDE8);
      }
      uint64_t v20 = qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 136315138;
        __int128 v47 = byte_1001616F0;
        uint64_t v12 = "Loaded default non-SKU PTB file: %s";
        int v13 = (os_log_s *)v20;
        uint32_t v14 = 12;
        goto LABEL_15;
      }
    }

    else
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BE08);
      }
      __int16 v21 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002BD74(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BE28);
      }
      int v29 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002BD04(v29, v30, v31, v32, v33, v34, v35, v36);
      }
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BE48);
    }
    uint64_t v11 = qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 136315394;
      __int128 v47 = v7;
      __int16 v48 = 2080;
      uint64_t v49 = byte_1001616F0;
      uint64_t v12 = "Loaded SKU=%s PTB file: %s";
      int v13 = (os_log_s *)v11;
      uint32_t v14 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    }
  }

  if (strlen(byte_1001616F0) <= 0x1E)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BE68);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BB74();
    }
    return 22LL;
  }

  int v15 = open(byte_1001616F0, 0);
  if (v15 < 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BAA8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BBA0();
    }
    return 22LL;
  }

  int v16 = v15;
  memset(&v45, 0, sizeof(v45));
  if (fstat(v15, &v45) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BAC8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002BBCC();
      if (!v16) {
        return 22LL;
      }
      goto LABEL_78;
    }

    goto LABEL_77;
  }

  if (LODWORD(v45.st_size) != a1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BB28);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002BCD8();
      if (!v16) {
        return 22LL;
      }
      goto LABEL_78;
    }

    goto LABEL_77;
  }

  if (read(v16, a2, SLODWORD(v45.st_size)) != a1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BAE8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      sub_10002BC78();
      if (!v16) {
        return 22LL;
      }
      goto LABEL_78;
    }

LABEL_77:
    if (!v16) {
      return 22LL;
    }
LABEL_78:
    close(v16);
    return 22LL;
  }

  close(v16);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015BB08);
  }
  __int128 v17 = (os_log_s *)qword_100162428;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)result)
  {
    sub_10002BBF8((uint64_t)a2, a1, v17);
    return 0LL;
  }

  return result;
}

void sub_1000195C8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000195F8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019628(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019658(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019688(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000196B8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000196E8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019718(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019748(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019778(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000197A8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000197D8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019808(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019838(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019868(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019898(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000198C8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000198F8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019928(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019958(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019988(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000199B8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000199E8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019A18(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019A48(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100019A78(int a1, const char *a2)
{
  if (byte_100160EB8) {
    __int128 v2 = &qword_100160EC0;
  }
  else {
    __int128 v2 = &qword_100160EC8;
  }
  int v3 = "R";
  if (a2) {
    int v3 = a2;
  }
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%sK_%s_*.ptb",  *(void *)(*v2 + 96LL * a1 + 32),  v3);
  uint64_t v13 = 0LL;
  uint64_t v5 = -[NSArray filteredArrayUsingPredicate:]( -[NSFileManager contentsOfDirectoryAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtPath:error:",  @"/usr/share/firmware/bluetooth/",  &v13),  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF like %@",  v4));
  if (-[NSArray count](v5, "count"))
  {
    id v6 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0LL);
    __strlcat_chk(&unk_1001616F0, [v6 UTF8String], 1024, 1024);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BE88);
    }
    uint64_t v7 = (os_log_s *)qword_100162428;
    uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
    {
      int v9 = -[NSString UTF8String](v4, "UTF8String");
      id v10 = [v6 UTF8String];
      *(_DWORD *)stat buf = 136315394;
      int v15 = v9;
      __int16 v16 = 2080;
      __int128 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PTB file matching %s is %s", buf, 0x16u);
      return 0LL;
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BEA8);
    }
    uint64_t v11 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = -[NSString UTF8String](v4, "UTF8String");
      *(_DWORD *)stat buf = 136315394;
      int v15 = v12;
      __int16 v16 = 2080;
      __int128 v17 = &unk_1001616F0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No PTB file matching %s in %s", buf, 0x16u);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

void sub_100019CEC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019D1C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019D4C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019D7C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019DAC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019DDC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019E0C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019E3C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019E6C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100019E9C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t sub_100019EC8()
{
  __int16 v6 = 0;
  memset(v5, 0, sizeof(v5));
  unint64_t v4 = 0LL;
  time_t v0 = time(0LL);
  time(0LL);
  do
  {
    off_1001623F0(qword_1001623C0, v5, 258LL, &v4);
    fwrite("Receive Test Statistics: ", 0x19uLL, 1uLL, __stderrp);
    if (v4)
    {
      uint64_t v1 = 0LL;
      int v2 = 0;
      do
      {
        fprintf(__stderrp, "%02X ", *((unsigned __int8 *)v5 + v1));
        uint64_t v1 = ++v2;
      }

      while (v4 > v2);
    }

    fputc(10, __stderrp);
  }

  while (time(0LL) - v0 < qword_100160A28 && !byte_100161EF0);
  return 0LL;
}

uint64_t sub_10001A034(void *a1, _BYTE *a2, int a3)
{
  if (dword_1001623C8)
  {
    __int16 v13 = 0;
    memset(v12, 0, sizeof(v12));
    uint64_t v11 = 0LL;
    off_1001623E8(qword_1001623C0, &unk_10002E856, 3LL);
    do
      off_1001623F0(qword_1001623C0, v12, 258LL, &v11);
    while (LOBYTE(v12[0]) != 14 && BYTE3(v12[0]) != 12 && BYTE4(v12[0]) != 20);
    if (a3) {
      printf("Local Name: %s\n", (const char *)v12 + 6);
    }
    if (a1)
    {
      size_t v8 = strlen((const char *)v12 + 6);
      memcpy(a1, (char *)v12 + 6, v8);
    }

    if (a2)
    {
      char v9 = strlen((const char *)v12 + 6);
      uint64_t result = 0LL;
      *a2 = v9;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    fwrite("Device not open yet, use 'device' to open it.\n", 0x2EuLL, 1uLL, __stderrp);
    return 3LL;
  }

  return result;
}

uint64_t sub_10001A1A4(_WORD *a1, _BYTE *a2, _WORD *a3, _BYTE *a4, _WORD *a5, int a6)
{
  if (!dword_1001623C8)
  {
    fwrite("Device not open yet, use 'device' to open it.\n", 0x2EuLL, 1uLL, __stderrp);
    return 3LL;
  }

  __int16 v19 = 0;
  memset(v18, 0, sizeof(v18));
  uint64_t v17 = 0LL;
  off_1001623E8(qword_1001623C0, &unk_10002E853, 3LL);
  do
    off_1001623F0(qword_1001623C0, v18, 258LL, &v17);
  while (LOBYTE(v18[0]) != 14 && BYTE3(v18[0]) != 16 && BYTE4(v18[0]) != 1);
  if (a6)
  {
    if (WORD5(v18[0]) > 0xEu)
    {
      if (WORD5(v18[0]) == 76)
      {
        uint32_t v14 = "Apple";
        goto LABEL_23;
      }

      if (WORD5(v18[0]) == 15)
      {
        uint32_t v14 = "Broadcom";
        goto LABEL_23;
      }
    }

    else
    {
      if (WORD5(v18[0]) == 10)
      {
        uint32_t v14 = "CSR";
        goto LABEL_23;
      }

      if (WORD5(v18[0]) == 13)
      {
        uint32_t v14 = "Texas Instruments";
LABEL_23:
        printf("Radio Manufacturer:            %s\n", v14);
        if (BYTE6(v18[0]) <= 8uLL) {
          __int16 v16 = off_1001609E0[BYTE6(v18[0])];
        }
        else {
          __int16 v16 = "NULL";
        }
        printf("Bluetooth HCI Specification:   %s\n", v16);
        printf("Bluetooth HCI Revision:        0x%02X%02X\n", BYTE7(v18[0]), BYTE8(v18[0]));
        printf("Bluetooth LMP Version:         0x%02X\n", BYTE9(v18[0]));
        printf("Bluetooth LMP Subversion:      0x%02X%02X\n", BYTE13(v18[0]), BYTE12(v18[0]));
        goto LABEL_27;
      }
    }

    uint32_t v14 = "<Unknown>";
    goto LABEL_23;
  }

LABEL_27:
  if (a1) {
    *a1 = WORD5(v18[0]);
  }
  if (a2) {
    *a2 = BYTE6(v18[0]);
  }
  if (a3) {
    *a3 = *(_WORD *)((char *)v18 + 7);
  }
  if (a4) {
    *a4 = BYTE9(v18[0]);
  }
  uint64_t result = 0LL;
  if (a5) {
    *a5 = WORD6(v18[0]);
  }
  return result;
}

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E0A8);
    }
    char v9 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v12 = 136315138;
      __int16 v13 = v1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Platform is %s", v12, 0xCu);
    }
  }

  return v1;
}

BOOL sub_10001A404(int a1, const char **a2, char **a3)
{
  __int16 v57 = 0;
  memset(v56, 0, sizeof(v56));
  unint64_t v54 = 0LL;
  if (a1 >= 2 && !strcmp(a2[1], "-h"))
  {
    fwrite("usage: hci <command>\n", 0x15uLL, 1uLL, __stderrp);
    fwrite("where <command> is one of:\n", 0x1BuLL, 1uLL, __stderrp);
    fprintf(__stderrp, "  %-16s : %s\n", "info", "Sends read local version to device");
    fprintf(__stderrp, "  %-16s : %s\n", "reset", "Sends reset command to device");
    fprintf(__stderrp, "  %-16s : %s\n", "dut", "Places device into dut test mode");
    fprintf(__stderrp, "  %-16s : %s\n", "sef", "Set event filter (Type, Condition, AutoAccept)");
    fprintf(__stderrp, "  %-16s : %s\n", "wse", "Write scan enable (Scan)");
    fprintf(__stderrp, "  %-16s : %s\n", "cmd", "Send HCI command (Command, Param1, Param2, Param3, ..., ParamN)");
    fprintf(__stderrp, "  %-16s : %s\n", "localName", "Sends the read local name command to device");
    fprintf(__stderrp, "  %-16s : %s\n", "rxTest", "Configure test time, run test or abort the test");
    return 0LL;
  }

  if (!dword_1001623C8)
  {
    fwrite("Device not open yet, use 'device' to open it.\n", 0x2EuLL, 1uLL, __stderrp);
    return 0LL;
  }

  __int16 v6 = a2[1];
  if (!strcmp(v6, "reset"))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BEE8);
    }
    uint64_t v7 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&uint8_t buf[4] = "bluetool_command_hci";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ready to send HCI_Reset command from %s",  buf,  0xCu);
    }

    off_1001623E8(qword_1001623C0, &unk_10002E850, 3LL);
    do
    {
      do
        off_1001623F0(qword_1001623C0, v56, 258LL, &v54);
      while (LOBYTE(v56[0]) != 14);
    }

    while (BYTE3(v56[0]) != 3 || BYTE4(v56[0]) != 12);
    if (BYTE5(v56[0]))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015BF68);
      }
      char v9 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002BEE8(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      if (v54)
      {
        unint64_t v17 = 0LL;
        uint64_t v18 = qword_100162420;
        do
        {
          if (v18 != -1) {
            dispatch_once(&qword_100162420, &stru_10015BFA8);
          }
          __int16 v19 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
          {
            int v20 = *((unsigned __int8 *)v56 + v17);
            *(_DWORD *)stat buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, " %02X", buf, 8u);
            uint64_t v18 = qword_100162420;
          }

          else
          {
            uint64_t v18 = -1LL;
          }

          ++v17;
        }

        while (v17 < v54);
      }

      goto LABEL_55;
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015BF28);
    }
    uint64_t v22 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      *(void *)&uint8_t buf[4] = "bluetool_command_hci";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "HCI_Reset completed from %s", buf, 0xCu);
    }

    uint64_t v23 = "Issued HCI Reset";
    goto LABEL_54;
  }

  if (!strcmp(v6, "localName"))
  {
    sub_10001A034(0LL, 0LL, 1);
    goto LABEL_55;
  }

  if (!strcmp(v6, "info"))
  {
    sub_10001A1A4(0LL, 0LL, 0LL, 0LL, 0LL, 1);
    off_1001623E8(qword_1001623C0, &unk_10002E859, 3LL);
    do
      off_1001623F0(qword_1001623C0, v56, 258LL, &v54);
    while (LOBYTE(v56[0]) != 14);
    printf( "Bluetooth Address:             %02x:%02x:%02x:%02x:%02x:%02x\n",  BYTE11(v56[0]),  BYTE10(v56[0]),  BYTE9(v56[0]),  BYTE8(v56[0]),  BYTE7(v56[0]),  BYTE6(v56[0]));
    goto LABEL_55;
  }

  if (!strcmp(v6, "dut"))
  {
    off_1001623E8(qword_1001623C0, &unk_10002E85C, 3LL);
    do
      off_1001623F0(qword_1001623C0, v56, 258LL, &v54);
    while (LOBYTE(v56[0]) != 14);
    uint64_t v23 = "DUT Mode Enabled!";
    goto LABEL_54;
  }

  if (!strcmp(v6, "sef"))
  {
    *(void *)stat buf = 0LL;
    if (a1 < 5) {
      return 0LL;
    }
    LOBYTE(v56[0]) = strtol(a2[2], (char **)buf, 0);
    BYTE1(v56[0]) = strtol(a2[3], (char **)buf, 0);
    BYTE2(v56[0]) = strtol(a2[4], (char **)buf, 0);
    sub_10001B0EC(3077, (uint64_t)v56, 3uLL, (uint64_t)v56, &v54, 14);
    fwrite("Set Event Filter Response: ", 0x1BuLL, 1uLL, __stderrp);
    if (v54)
    {
      uint64_t v37 = 0LL;
      int v38 = 0;
      do
      {
        fprintf(__stderrp, "%02X ", *((unsigned __int8 *)v56 + v37));
        uint64_t v37 = ++v38;
      }

      while (v54 > v38);
    }

LABEL_98:
    fputc(10, __stderrp);
    goto LABEL_55;
  }

  if (!strcmp(v6, "rfc"))
  {
    *(void *)stat buf = 0LL;
    if (a1 >= 3)
    {
      unsigned __int8 v39 = strtol(a2[2], (char **)buf, 0);
      LOBYTE(v56[0]) = v39;
      if (v39 != 49LL)
      {
        int v40 = v39;
        unint64_t v41 = 1LL;
LABEL_85:
        if (v40 == 80)
        {
          BYTE1(v56[0]) = strtol(a2[3], (char **)buf, 0);
          BYTE2(v56[0]) = strtol(a2[4], (char **)buf, 0);
          BYTE3(v56[0]) = strtol(a2[5], (char **)buf, 0);
          unint64_t v41 = 4LL;
        }

        sub_10001B0EC(64795, (uint64_t)v56, v41, (uint64_t)v56, &v54, 14);
        fwrite("Factory Calibration Read Table Response: ", 0x29uLL, 1uLL, __stderrp);
        if (v54)
        {
          for (unint64_t i = 0LL; i < v54; ++i)
            fprintf(__stderrp, "%02X ", *((unsigned __int8 *)v56 + i));
        }

        goto LABEL_98;
      }

      if (a1 >= 7)
      {
        BYTE1(v56[0]) = strtol(a2[3], (char **)buf, 0);
        BYTE2(v56[0]) = strtol(a2[4], (char **)buf, 0);
        BYTE3(v56[0]) = strtol(a2[5], (char **)buf, 0);
        BYTE4(v56[0]) = strtol(a2[6], (char **)buf, 0);
        int v40 = LOBYTE(v56[0]);
        unint64_t v41 = 5LL;
        goto LABEL_85;
      }
    }

    return 1LL;
  }

  if (!strcmp(v6, "wse"))
  {
    *(void *)stat buf = 0LL;
    if (a1 < 3) {
      return 0LL;
    }
    LOBYTE(v56[0]) = strtol(a2[2], (char **)buf, 0);
    sub_10001B0EC(3098, (uint64_t)v56, 1uLL, (uint64_t)v56, &v54, 14);
    fwrite("Write Scan Enable Response: ", 0x1CuLL, 1uLL, __stderrp);
    if (v54)
    {
      uint64_t v42 = 0LL;
      int v43 = 0;
      do
      {
        fprintf(__stderrp, "%02X ", *((unsigned __int8 *)v56 + v42));
        uint64_t v42 = ++v43;
      }

      while (v54 > v43);
    }

    goto LABEL_98;
  }

  if (!strcmp(v6, "rxTest"))
  {
    *(void *)stat buf = 0LL;
    if (a1 >= 3)
    {
      uint64_t v44 = a2[2];
      if (!strcmp(v44, "-t"))
      {
        qword_100160A28 = strtol(a2[3], (char **)buf, 0);
        uint64_t v23 = "Set test time";
      }

      else
      {
        if (strcmp(v44, "-a")) {
          goto LABEL_55;
        }
        byte_100161EF0 = 1;
        uint64_t v23 = "Abort Receiving Rx test events";
      }

LABEL_54:
      puts(v23);
      goto LABEL_55;
    }

    return 0LL;
  }

  if (!strcmp(v6, "cmd"))
  {
    *(void *)stat buf = 0LL;
    if (a1 < 3) {
      return 0LL;
    }
    unsigned __int16 v45 = strtol(a2[2], (char **)buf, 0);
    if (v45)
    {
      if (a1 < 4)
      {
        unint64_t v48 = 0LL;
      }

      else
      {
        unsigned __int8 v46 = 0;
        int v47 = 3;
        do
          *((_BYTE *)v56 + v46++) = strtol(a2[v47++], (char **)buf, 0);
        while (a1 > v47);
        unint64_t v48 = v46;
      }

      sub_10001B0EC(v45, (uint64_t)v56, v48, (uint64_t)v56 + 2, &v54, 14);
      LOBYTE(v56[0]) = 14;
      BYTE1(v56[0]) = v54;
      v54 += 2LL;
      fwrite("HCI Command Response: ", 0x16uLL, 1uLL, __stderrp);
      if (v54)
      {
        uint64_t v50 = 0LL;
        int v51 = 0;
        do
        {
          fprintf(__stderrp, "%02X ", *((unsigned __int8 *)v56 + v50));
          uint64_t v50 = ++v51;
        }

        while (v54 > v51);
      }

      fputc(10, __stderrp);
      if (v45 == 64594 && pthread_create(&qword_100161FB8, 0LL, (void *(__cdecl *)(void *))sub_100019EC8, 0LL))
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015BFE8);
        }
        __int128 v52 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Create thread failed\n", v53, 2u);
        }
      }
    }
  }

  else
  {
    fwrite("Invalid HCI command!\n", 0x15uLL, 1uLL, __stderrp);
  }

LABEL_55:
  BOOL result = 0LL;
  if (a3)
  {
    unint64_t v24 = v54;
    if (v54)
    {
      uint64_t v25 = (char *)malloc(5 * v54);
      *a3 = v25;
      if (v25)
      {
        uint64_t v26 = v25;
        unint64_t v27 = 0LL;
        uint64_t v28 = v25;
        do
        {
          snprintf(v28, 5 * v24, "0x%02x", *((unsigned __int8 *)v56 + v27));
          v28[4] = 32;
          ++v27;
          unint64_t v24 = v54;
          v28 += 5;
        }

        while (v27 < v54);
        BOOL result = 0LL;
        v26[5 * v54 - 1] = 0;
        return result;
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015C028);
      }
      int v29 = (os_log_s *)qword_100162428;
      BOOL result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10002BEB4(v29, v30, v31, v32, v33, v34, v35, v36);
        return 0LL;
      }
    }
  }

  return result;
}

void sub_10001B02C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B05C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B08C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B0BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001B0EC(__int16 a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, int a6)
{
  if (a3 < 0x100)
  {
    uint64_t v6 = a4;
    uint64_t v12 = 0LL;
    __int16 v13 = a1;
    char __n_1 = a3;
    __memcpy_chk(__n_2);
    off_1001623E8(qword_1001623C0, &v13, a3 + 3);
    if (v6)
    {
      do
        off_1001623F0(qword_1001623C0, &v13, 258LL, &v12);
      while (v13 != a6);
      uint64_t v10 = HIBYTE(v13);
      memcpy((void *)v6, &__n_1, HIBYTE(v13));
      uint64_t v6 = 0LL;
      *a5 = v10;
    }
  }

  else
  {
    uint64_t v6 = 1LL;
    fwrite("Invalid packet size specified. Ignoring command.", 0x30uLL, 1uLL, __stderrp);
  }

  return v6;
}

void sub_10001B260(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B290(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001B2C0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  return sub_10001B0EC(64512, a1, a2, a3, a4, 255);
}

uint64_t sub_10001B2DC()
{
  uint64_t result = sub_10001FE84();
  if (!(_DWORD)result)
  {
    strcpy((char *)&xmmword_100161FC0, "AppleBT HCI device");
    dword_100162418 = 0;
    off_1001623D0 = (uint64_t (*)(void, void, void))sub_10001B394;
    off_1001623D8 = sub_10001B39C;
    off_1001623E0 = (uint64_t (*)(void))sub_10001B478;
    off_1001623E8 = sub_10001B480;
    off_1001623F0 = (uint64_t (*)(void, void, void, void))sub_10001B544;
    off_100162400 = (uint64_t (*)(void))sub_10001B780;
    off_1001623F8 = (uint64_t (*)(void, void))sub_10001B7A0;
    qword_1001623C0 = 0LL;
    dword_1001623C8 = 1;
    off_100162408 = (uint64_t (*)(void))nullsub_5;
    off_100162410 = (uint64_t (*)(void))nullsub_6;
  }

  return result;
}

uint64_t sub_10001B394()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_10001B39C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = 1LL;
  if (a3 <= 0x406)
  {
    __int16 v4 = a3;
    bzero(v11, 0x406uLL);
    __int16 v8 = v4;
    char v5 = byte_100161EF1++;
    char v9 = v5;
    char v10 = 0;
    __memcpy_chk(v11);
    inputStruct[0] = 0x10700000100LL;
    inputStruct[1] = &v8;
    else {
      return 0LL;
    }
  }

  return v3;
}

uint64_t sub_10001B478()
{
  return 0LL;
}

uint64_t sub_10001B480(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result = 1LL;
  memset(v7, 0, sizeof(v7));
  if (a3 <= 0x103)
  {
    char v6 = 1;
    uint64_t v5 = __memcpy_chk(v7);
    return sub_10001B39C(v5, (uint64_t)&v6, a3 + 1);
  }

  return result;
}

uint64_t sub_10001B544(uint64_t a1, void *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t outputStruct = 0LL;
  inputStruct[0] = 0x10600000105LL;
  inputStruct[1] = &v29;
  uint64_t v7 = sub_100020DC8(1, inputStruct, &outputStruct);
  int v8 = byte_100161EF2++;
  if (v30[0] != v8)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015C068);
    }
    char v9 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002C080(v30, v9);
    }
    char v10 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002C010((uint64_t)v30, v10, v11, v12, v13, v14, v15, v16);
    }
    byte_100161EF2 = v30[0] + 1;
  }

  if (BYTE4(outputStruct) == 1)
  {
    size_t v17 = v29 - 1LL;
    *a4 = v17;
    if (v17 > a3)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015C128);
      }
      uint64_t v18 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002BF1C(a4, a3, v18);
      }
      *a4 = a3;
      size_t v17 = a3;
    }

    memcpy(a2, v31, v17);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015C0E8);
    }
    __int16 v19 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002BFA4((uint64_t)&outputStruct + 4, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0xFFFFFFFFLL;
  }

  return v7;
}

uint64_t sub_10001B780()
{
  uint64_t result = sub_1000204FC();
  dword_1001623C8 = 0;
  return result;
}

uint64_t sub_10001B7A0()
{
  return 0xFFFFFFFFLL;
}

void sub_10001B7B0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B7E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B810(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001B840(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

BOOL sub_10001B870()
{
  return sub_10001B88C() == 0;
}

uint64_t sub_10001B88C()
{
  if (dword_100161EF8) {
    return 0LL;
  }
  if ((byte_100161EFC & 1) != 0) {
    return 5LL;
  }
  uint64_t v1 = IOServiceNameMatching("AppleBTMgmt");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (!MatchingService)
  {
    byte_100161EFC = 1;
    return 5LL;
  }

  io_object_t v3 = MatchingService;
  if (IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100161EF8))
  {
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C168);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C150();
    }
    uint64_t v0 = 5LL;
  }

  else
  {
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C1A8);
    }
    __int16 v4 = (os_log_s *)qword_100161F08;
    uint64_t v0 = 0LL;
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "AppleBTMgmt";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "applebt_mgmt_connect: Service %s connected!\n",  (uint8_t *)&v6,  0xCu);
      uint64_t v0 = 0LL;
    }
  }

  IOObjectRelease(v3);
  return v0;
}

void sub_10001BA38(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BA64(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001BA90()
{
  if (qword_100161F00 != -1) {
    dispatch_once(&qword_100161F00, &stru_10015C1E8);
  }
  uint64_t v0 = (os_log_s *)qword_100161F08;
  if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "applebt_power_on: Calling method kAppleBTMgmtPowerOn!\n",  buf,  2u);
  }

  uint64_t v1 = sub_10001B88C();
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C228);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C210();
    }
  }

  else
  {
    uint64_t v3 = IOConnectCallMethod(dword_100161EF8, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v3)
    {
      uint64_t v2 = v3;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C268);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C1B0();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C2A8);
      }
      __int16 v4 = (os_log_s *)qword_100161F08;
      uint64_t v2 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "applebt_power_on: BT device powered on/reset!\n",  v6,  2u);
        return 0LL;
      }
    }
  }

  return v2;
}

void sub_10001BC58(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BC84(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BCB0(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BCDC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001BD08()
{
  uint64_t v0 = sub_10001B88C();
  if ((_DWORD)v0)
  {
    uint64_t v1 = v0;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C2E8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C2D0();
    }
  }

  else
  {
    uint64_t v2 = IOConnectCallMethod(dword_100161EF8, 1u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v2)
    {
      uint64_t v1 = v2;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C328);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C270();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C368);
      }
      uint64_t v3 = (os_log_s *)qword_100161F08;
      uint64_t v1 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "applebt_power_off: BT device powered off!\n",  buf,  2u);
        return 0LL;
      }
    }
  }

  return v1;
}

void sub_10001BE74(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BEA0(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001BECC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001BEF8()
{
  uint64_t v0 = sub_10001B88C();
  if ((_DWORD)v0)
  {
    uint64_t v1 = v0;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C3A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C390();
    }
  }

  else
  {
    uint64_t v2 = IOConnectCallMethod(dword_100161EF8, 8u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v2)
    {
      uint64_t v1 = v2;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C3E8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C330();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C428);
      }
      uint64_t v3 = (os_log_s *)qword_100161F08;
      uint64_t v1 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "applebt_power_sleep: BT device powered Sleep!\n",  buf,  2u);
        return 0LL;
      }
    }
  }

  return v1;
}

void sub_10001C064(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C090(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C0BC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001C0E8()
{
  uint64_t v0 = sub_10001B88C();
  if ((_DWORD)v0)
  {
    uint64_t v1 = v0;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C468);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C450();
    }
  }

  else
  {
    uint64_t v2 = IOConnectCallMethod(dword_100161EF8, 9u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v2)
    {
      uint64_t v1 = v2;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C4A8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C3F0();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C4E8);
      }
      uint64_t v3 = (os_log_s *)qword_100161F08;
      uint64_t v1 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "applebt_exit_power_sleep: BT device exited power Sleep!\n",  buf,  2u);
        return 0LL;
      }
    }
  }

  return v1;
}

void sub_10001C254(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C280(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C2AC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001C2D8(unsigned __int8 a1)
{
  unsigned __int8 inputStruct = a1;
  uint64_t v1 = sub_10001B88C();
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C528);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C510();
    }
  }

  else
  {
    uint64_t v3 = IOConnectCallMethod(dword_100161EF8, 2u, 0LL, 0, &inputStruct, 1uLL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v3)
    {
      uint64_t v2 = v3;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C568);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C4B0();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C5A8);
      }
      __int16 v4 = (os_log_s *)qword_100161F08;
      uint64_t v2 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109120;
        int v8 = inputStruct;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "applebt_set_trace_mode: set to %d!\n",  buf,  8u);
        return 0LL;
      }
    }
  }

  return v2;
}

void sub_10001C484(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C4B0(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C4DC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001C508(unsigned __int8 a1)
{
  unsigned __int8 inputStruct = a1;
  uint64_t v1 = sub_10001B88C();
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C5E8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C5D0();
    }
  }

  else
  {
    uint64_t v3 = IOConnectCallMethod(dword_100161EF8, 3u, 0LL, 0, &inputStruct, 1uLL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v3)
    {
      uint64_t v2 = v3;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C628);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C570();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C668);
      }
      __int16 v4 = (os_log_s *)qword_100161F08;
      uint64_t v2 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109120;
        int v8 = inputStruct;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "applebt_set_trace_level: set to %d!\n",  buf,  8u);
        return 0LL;
      }
    }
  }

  return v2;
}

void sub_10001C6B4(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C6E0(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C70C(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001C738(uint64_t *a1)
{
  uint64_t v2 = sub_10001B88C();
  if ((_DWORD)v2)
  {
    uint64_t v3 = v2;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C6A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C690();
    }
  }

  else
  {
    uint64_t v4 = IOConnectCallMethod(dword_100161EF8, 4u, 0LL, 0, a1, 0x20uLL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v4)
    {
      uint64_t v3 = v4;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C6E8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C630();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C728);
      }
      uint64_t v5 = (os_log_s *)qword_100161F08;
      uint64_t v3 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *a1;
        uint64_t v7 = a1[1];
        uint64_t v8 = a1[2];
        uint64_t v9 = a1[3];
        *(_DWORD *)stat buf = 134218752;
        uint64_t v12 = v6;
        __int16 v13 = 2048;
        uint64_t v14 = v7;
        __int16 v15 = 2048;
        uint64_t v16 = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "applebt_set_trace_mask: set to <%016llX%016llX%016llX%016llX>!\n",  buf,  0x2Au);
        return 0LL;
      }
    }
  }

  return v3;
}

void sub_10001C90C(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C938(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001C964(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001C990(int a1)
{
  int inputStruct = a1;
  uint64_t v1 = sub_10001B88C();
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C768);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C750();
    }
  }

  else
  {
    uint64_t v3 = IOConnectCallMethod(dword_100161EF8, 5u, 0LL, 0, &inputStruct, 4uLL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v3)
    {
      uint64_t v2 = v3;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C7A8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C6F0();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C7E8);
      }
      uint64_t v4 = (os_log_s *)qword_100161F08;
      uint64_t v2 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 67109120;
        int v8 = inputStruct;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "applebt_set_capture_timeout: set to %d!\n",  buf,  8u);
        return 0LL;
      }
    }
  }

  return v2;
}

void sub_10001CB3C(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001CB68(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001CB94(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001CBC0(int a1)
{
  int inputStruct = a1;
  uint64_t v1 = sub_10001B88C();
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C828);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C810();
    }
  }

  else
  {
    uint64_t v3 = IOConnectCallMethod(dword_100161EF8, 6u, 0LL, 0, &inputStruct, 4uLL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v2 = v3;
    if ((_DWORD)v3 != -536870201 && (_DWORD)v3 != 0)
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C868);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C7B0();
      }
    }
  }

  return v2;
}

void sub_10001CCD8(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001CD04(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001CD30(uint32_t a1, const void *a2, unsigned int a3)
{
  uint64_t v6 = sub_10001B88C();
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C8A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C8D0();
    }
  }

  else
  {
    uint64_t v8 = IOConnectCallMethod(dword_100161EF8, a1, 0LL, 0, a2, a3, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v8)
    {
      uint64_t v7 = v8;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C8E8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C870();
      }
    }

    else
    {
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C928);
      }
      uint64_t v9 = (os_log_s *)qword_100161F08;
      uint64_t v7 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "applebt_general_debug: completed!\n",  buf,  2u);
        return 0LL;
      }
    }
  }

  return v7;
}

void sub_10001CEB0(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001CEDC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001CF08(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001CF34(void *a1, size_t *a2)
{
  uint64_t v4 = sub_10001B88C();
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    if (qword_100161F00 != -1) {
      dispatch_once(&qword_100161F00, &stru_10015C968);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
      sub_10002C990();
    }
  }

  else
  {
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t v6 = IOConnectCallMethod(dword_100161EF8, 7u, 0LL, 0, 0LL, 0LL, &output, &outputCnt, a1, a2);
    if ((_DWORD)v6)
    {
      uint64_t v5 = v6;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C9A8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_ERROR)) {
        sub_10002C930();
      }
    }

    else
    {
      *a2 = output;
      if (qword_100161F00 != -1) {
        dispatch_once(&qword_100161F00, &stru_10015C9E8);
      }
      uint64_t v7 = (os_log_s *)qword_100161F08;
      uint64_t v5 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_100161F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applebt_read_crash_info: completed!\n",  buf,  2u);
        return 0LL;
      }
    }
  }

  return v5;
}

void sub_10001D0CC(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001D0F8(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

void sub_10001D124(id a1)
{
  qword_100161F08 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_mgmt");
}

uint64_t sub_10001D150(const char *a1, uint64_t a2)
{
  uint64_t v4 = strdup(a1);
  if (v4)
  {
    uint64_t v5 = v4;
    bzero(__s2, 0x808uLL);
    uint64_t v6 = 0LL;
    uint64_t v7 = v5;
LABEL_3:
    while (1)
    {
      for (unint64_t i = v7; ; ++i)
      {
        ++v7;
        int v9 = *i;
        if (v9 != 9 && v9 != 32) {
          break;
        }
      }

      if (!*i) {
        break;
      }
      __s2[v6] = i;
      if (v6 == 256)
      {
        uint64_t v14 = 1LL;
        fwrite("Too many arguments.\n", 0x14uLL, 1uLL, __stderrp);
        goto LABEL_42;
      }

      ++v6;
      while (1)
      {
        int v11 = *v7++;
        int v10 = v11;
        if (!v11) {
          break;
        }
        if (v10 == 32 || v10 == 9)
        {
          *(v7 - 1) = 0;
          goto LABEL_3;
        }
      }

      --v7;
    }

    if (!(_DWORD)v6 || (__int16 v13 = __s2[0], *__s2[0] == 35))
    {
LABEL_20:
      free(v5);
      return 0LL;
    }

    if (byte_100161F10 == 1) {
      add_history(a1);
    }
    if (strcmp("?", v13))
    {
      uint64_t v16 = &off_10015CA30;
      while (1)
      {
        __int16 v17 = *v16;
        if (!*v16) {
          break;
        }
        int v18 = strcmp((const char *)*(v16 - 2), v13);
        v16 += 3;
        if (!v18) {
          goto LABEL_31;
        }
      }

      if (!strcmp(v13, "quit") || !strcmp(v13, "exit"))
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015CBA8);
        }
        __int16 v19 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 136315138;
          uint64_t v21 = "invoke_command";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ready to quit from %s", buf, 0xCu);
        }

        sub_10001D470();
      }

      else
      {
        fprintf(__stderrp, "%s - unknown command.\n", v13);
      }

      goto LABEL_20;
    }

    __int16 v17 = sub_10001DCD0;
LABEL_31:
    optreset = 1;
    optind = 1;
    uint64_t v14 = ((uint64_t (*)(uint64_t, char **, uint64_t))v17)(v6, __s2, a2);
    if ((_DWORD)v14) {
      fprintf(__stderrp, "%s returned %d\n", __s2[0], v14);
    }
    else {
LABEL_42:
    }
      free(v5);
  }

  else
  {
    fwrite("Unable to allocate memory!  Abort! Abort!\n", 0x2AuLL, 1uLL, __stderrp);
    return 2LL;
  }

  return v14;
}

void sub_10001D440(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001D470()
{
  if (dword_1001623C8)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CCE8);
    }
    uint64_t v0 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = 136315138;
      uint64_t v2 = "handleQuit";
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "Device is opened and ready to close it from %s",  (uint8_t *)&v1,  0xCu);
    }

    off_100162400(qword_1001623C0);
  }

  if ((byte_100161F14 & 1) == 0) {
    exit(0);
  }
}

uint64_t sub_10001D578(const char *a1)
{
  uint64_t v2 = fopen(a1, "r");
  if (v2)
  {
    uint64_t v3 = v2;
    fprintf(__stderrp, "Running %s.\n", a1);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CC28);
    }
    uint64_t v4 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315394;
      *(void *)__int16 v13 = a1;
      *(_WORD *)&v13[8] = 2080;
      *(void *)&v13[10] = "runScriptFile";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "running script file %s from %s", buf, 0x16u);
    }

    uint64_t v5 = (char *)malloc(0x800uLL);
    if (v5)
    {
      while (!feof(v3))
      {
        uint64_t v6 = fgets(v5, 2048, v3);
        if (v6)
        {
          uint64_t v7 = v6;
          size_t v8 = strlen(v6);
          if (v8)
          {
            v7[v8 - 1] = 0;
            sub_10001D150(v7, 0LL);
          }
        }
      }
    }

    free(v5);
    fclose(v3);
    return 0LL;
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CBE8);
    }
    int v10 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *__error();
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)__int16 v13 = v11;
      *(_WORD *)&v13[4] = 2080;
      *(void *)&v13[6] = a1;
      *(_WORD *)&v13[14] = 2080;
      *(void *)&v13[16] = "runScriptFile";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "got error %d when opening script file %s from %s",  buf,  0x1Cu);
    }

    fprintf(__stderrp, "Unable to open file %s.\n", a1);
    return 3LL;
  }

void sub_10001D7BC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001D7EC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t start(int a1, char *const *a2)
{
  while (1)
  {
    while (1)
    {
      int v4 = getopt(a1, a2, "c:hf:F:R");
      if (v4 > 98) {
        break;
      }
      switch(v4)
      {
        case 70:
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015CCA8);
          }
          int v10 = (os_log_s *)qword_100162428;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136315394;
            uint64_t v14 = optarg;
            __int16 v15 = 2080;
            uint64_t v16 = "main";
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "try to run from command line a builtinScript %s from %s",  (uint8_t *)&v13,  0x16u);
          }

          int v11 = optarg;
          if (!strncmp(optarg, "boot", 5uLL))
          {
            int v12 = 1;
          }

          else if (!strncmp(v11, "init", 5uLL))
          {
            int v12 = 2;
          }

          else
          {
            if (strncmp(v11, "deepsleep", 0xAuLL)) {
              return 1LL;
            }
            int v12 = 3;
          }

          sub_10001743C(v12);
          return 0LL;
        case 82:
          byte_100161F14 = 1;
          return sub_1000278CC();
        case -1:
          bzero((char *)&xmmword_100161FC0 + 7, 0x459uLL);
          strcpy((char *)&xmmword_100161FC0, "<NONE>");
          rl_readline_name = "BlueTool";
          byte_100161F10 = 1;
          puts("\nWelcome to BlueTool... Rev 6.0\n");
          uint64_t v5 = getenv("BT_CHIP");
          if (v5 && !strcmp(v5, "ACI BT")) {
            sub_10001D150("aci -V", 0LL);
          }
          for (unint64_t i = readline("bluetool-> "); i; unint64_t i = readline("bluetool-> "))
          {
            if (*i)
            {
              uint64_t v7 = strdup(i);
              sub_10001D150(v7, 0LL);
              free(v7);
            }
          }

          sub_10001D470();
          exit(0);
      }
    }

    if (v4 == 99) {
      break;
    }
    if (v4 == 104)
    {
      puts("BlueTool -- A Bluetooth Config/Control Tool");
      putchar(10);
      puts("Options:");
      puts("\t-h              This message.");
      puts("\t-f <filename>   Read commands from file at startup.");
      puts("\t-F sequence\t\truns the default script for a given sequence.");
      puts("\t-c <commands>   Execute commands from string at startup.");
      putchar(10);
      return 0LL;
    }

    if (v4 == 102)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015CC68);
      }
      int v9 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        uint64_t v14 = optarg;
        __int16 v15 = 2080;
        uint64_t v16 = "main";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "try to run from command line an external script %s from %s",  (uint8_t *)&v13,  0x16u);
      }

      return sub_10001D578(optarg);
    }
  }

  return result;
}

void sub_10001DC70(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001DCA0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001DCD0()
{
  uint64_t v0 = off_10015CA08;
  do
  {
    fprintf(__stderrp, "  %-16s : %s\n", *v0, v0[1]);
    int v1 = v0[5];
    v0 += 3;
  }

  while (v1);
  fwrite("Give any commands '-h' for more details.\n", 0x29uLL, 1uLL, __stderrp);
  return 0LL;
}

uint64_t sub_10001DD64(int a1, uint64_t a2)
{
  if (a1 == 2)
  {
    int v2 = strtoul(*(const char **)(a2 + 8), 0LL, 0);
    if (v2 >= 1) {
      usleep(1000 * v2);
    }
    return 0LL;
  }

  else
  {
    uint64_t v3 = 1LL;
    fwrite("usage: msleep <msec>\n", 0x15uLL, 1uLL, __stderrp);
  }

  return v3;
}

uint64_t sub_10001DDD8()
{
  return 0LL;
}

uint64_t sub_10001DE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((int)a1 >= 6)
  {
    uint64_t v7 = 0LL;
    int v8 = a1;
    uint64_t v9 = a2 + 8;
    while (strcmp(*(const char **)(v9 + 8 * v7), "?"))
    {
      if (v8 == (_DWORD)++v7)
      {
        uint64_t v7 = a1;
        goto LABEL_8;
      }
    }

    int v8 = v7 + 1;
LABEL_8:
    int v10 = v8 + 1;
    uint64_t v11 = (a1 - (v8 + 1));
    if ((int)a1 <= v8 + 1)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = a2 + 8LL * v10;
      while (strcmp(*(const char **)(v13 + 8 * v12), ":"))
      {
        if (!(1 - (_DWORD)a1 + v8 + (_DWORD)++v12))
        {
          int v10 = v8 + v12 + 1;
          goto LABEL_15;
        }
      }

      int v10 = v8 + v12 + 2;
      uint64_t v11 = v12;
    }

uint64_t sub_10001DF94()
{
  return 0LL;
}

uint64_t sub_10001DF9C()
{
  return 1LL;
}

uint64_t sub_10001DFA4(int a1, uint64_t a2, void *a3)
{
  if (a1 < 2)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    int v4 = 0;
    uint64_t v5 = 0LL;
    uint64_t v6 = (const char **)(a2 + 8);
    uint64_t v7 = a1 - 1LL;
    do
    {
      fprintf(__stderrp, " %s", *v6);
      if (a3)
      {
        size_t v8 = strlen(*v6);
        uint64_t v9 = reallocf(v5, v8 + v4 + 1);
        uint64_t v5 = v9;
        if (v9)
        {
          int v10 = *v6;
          strcpy((char *)v9 + v4, *v6);
          int v11 = v4 + strlen(v10);
          int v4 = v11 + 1;
          *((_BYTE *)v5 + v11) = 32;
        }
      }

      ++v6;
      --v7;
    }

    while (v7);
  }

  fputc(10, __stderrp);
  if (a3) {
    *a3 = v5;
  }
  return 0LL;
}

uint64_t sub_10001E0A4(uint64_t a1, const char **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (!strcmp("?", *a2))
  {
    uint64_t v9 = sub_10001DCD0;
    return ((uint64_t (*)(uint64_t, const char **, uint64_t))v9)(a1, a2, a3);
  }

  else
  {
    for (unint64_t i = &off_10015CA30; *i; i += 3)
    {
      int v11 = *i;
      if (!strcmp((const char *)*(i - 2), v6))
      {
        uint64_t v9 = v11;
        return ((uint64_t (*)(uint64_t, const char **, uint64_t))v9)(a1, a2, a3);
      }
    }

    return 1LL;
  }

void sub_10001E158(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001E188(int a1, const char **a2)
{
  if (sub_100023E78() == 6)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CD28);
    }
    int v4 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v33 = "bluetool_command_device";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "HCI transport is hciTransportAPPLEBT from %s",  buf,  0xCu);
    }

    char v5 = 0;
    do
    {
      while (1)
      {
        while (1)
        {
          char v6 = v5;
          int v7 = getopt(a1, (char *const *)a2, "hDC");
          if (v7 != 67) {
            break;
          }
          if (dword_1001623C8)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015CDA8);
            }
            uint64_t v9 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 136315138;
              uint64_t v33 = "bluetool_command_device";
              _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Device is opened and ready to close it for transport AppleBT from %s",  buf,  0xCu);
            }

            off_100162400(qword_1001623C0);
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015CDE8);
            }
            int v10 = (os_log_s *)qword_100162428;
            char v5 = 1;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 136315138;
              uint64_t v33 = "bluetool_command_device";
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device is closed from %s", buf, 0xCu);
              char v5 = 1;
            }
          }

          else
          {
            char v5 = 1;
            fwrite("Device not Opened\n", 0x12uLL, 1uLL, __stderrp);
          }
        }

        if (v7 != 68) {
          break;
        }
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015CD68);
        }
        size_t v8 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 136315138;
          uint64_t v33 = "bluetool_command_device";
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IOS device and ready to open device IO from %s",  buf,  0xCu);
        }

        sub_10001B2DC();
        char v5 = 1;
      }

      char v5 = 0;
    }

    while (v7 != -1);
    if ((v6 & 1) == 0)
    {
      fprintf(__stderrp, "%s - Pick a device\n", *a2);
      fwrite("-D           - Open the default device.\n", 0x28uLL, 1uLL, __stderrp);
      __int16 v17 = __stderrp;
      int v18 = "-C           - Close the default device.\n";
      size_t v19 = 41LL;
LABEL_85:
      fwrite(v18, v19, 1uLL, v17);
      fputc(10, __stderrp);
    }

    return 0LL;
  }

  if (sub_100023E78() == 7)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CE28);
    }
    int v11 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v33 = "bluetool_command_device";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HCI transport is PCIE and ready to open device from %s",  buf,  0xCu);
    }

    while (1)
    {
      int v12 = getopt(a1, (char *const *)a2, "hD");
      if (v12 != 68) {
        break;
      }
      if (dword_1001623C8) {
        BOOL v13 = off_100162400 == 0LL;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015CE68);
        }
        uint64_t v14 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 136315138;
          uint64_t v33 = "bluetool_command_device";
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Device is opened and ready to close it for transport PCIE from %s",  buf,  0xCu);
        }

        off_100162400(qword_1001623C0);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015CEA8);
        }
        __int16 v15 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 136315138;
          uint64_t v33 = "bluetool_command_device";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device is closed from %s", buf, 0xCu);
        }

        if (dword_1001623C8) {
          goto LABEL_84;
        }
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015CEE8);
      }
      uint64_t v16 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v33 = "bluetool_command_device";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Device opened successfully from %s",  buf,  0xCu);
      }
    }

    if (v12 != -1)
    {
      if (v12 != 104)
      {
        sub_100005980();
        return 1LL;
      }

      sub_100005980();
    }

    return 0LL;
  }

  optind = 1;
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015CF28);
  }
  uint64_t v20 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    uint64_t v33 = "bluetool_command_device";
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "HCI transport is other types from %s",  buf,  0xCu);
  }

  unint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  while (1)
  {
    while (1)
    {
      int v23 = getopt(a1, (char *const *)a2, "hd:Ds:Sc");
      if (v23 < 99) {
        break;
      }
      if (v23 > 99)
      {
        switch(v23)
        {
          case 'd':
            uint64_t v22 = optarg;
            break;
          case 's':
            unint64_t v21 = strtoul(optarg, 0LL, 0);
            break;
          case 'h':
            fprintf(__stderrp, "%s - Pick a device\n", *a2);
            fwrite("-d <device>  - Open the specified UART device.\n", 0x2FuLL, 1uLL, __stderrp);
            fwrite("-D           - Open the default device.\n", 0x28uLL, 1uLL, __stderrp);
            fwrite("-s <#>       - Configure the device for the given speed/baudrate.\n", 0x42uLL, 1uLL, __stderrp);
            __int16 v17 = __stderrp;
            int v18 = "-S           - Configure the device for using the speed/baudrate from the device tree.\n";
            size_t v19 = 87LL;
            goto LABEL_85;
        }
      }

      else
      {
        sub_10001F014(qword_1001623C0);
      }
    }

    if (v23 == -1) {
      break;
    }
    if (v23 == 68)
    {
      uint64_t v25 = getenv("BT_UART");
      if (v25) {
        uint64_t v22 = v25;
      }
      else {
        uint64_t v22 = "com.apple.uart.bluetooth";
      }
    }

    else if (v23 == 83)
    {
      unsigned int v24 = sub_100023BA0();
      if (v24) {
        unint64_t v21 = v24;
      }
      else {
        unint64_t v21 = 2400000LL;
      }
    }
  }

  if (v22)
  {
    if (dword_1001623C8) {
      BOOL v26 = off_100162400 == 0LL;
    }
    else {
      BOOL v26 = 1;
    }
    if (!v26)
    {
      off_100162400(qword_1001623C0);
      if (dword_1001623C8)
      {
LABEL_84:
        unint64_t v27 = __stderrp;
        uint64_t v28 = "Failed to close already opened device.\n";
        size_t v29 = 39LL;
LABEL_94:
        fwrite(v28, v29, 1uLL, v27);
        return 3LL;
      }
    }

    if ((_DWORD)v21) {
      unsigned int v31 = v21;
    }
    else {
      unsigned int v31 = 115200;
    }
    printf("Opening %s @ %d baud.\n", v22, v31);
    if (sub_10001F148(v22, v31))
    {
LABEL_93:
      unint64_t v27 = __stderrp;
      uint64_t v28 = "Unable to open device.\n";
      size_t v29 = 23LL;
      goto LABEL_94;
    }

    off_100162408(qword_1001623C0);
    return 0LL;
  }

  printf("Current Device: %s\n", (const char *)&xmmword_100161FC0);
  uint64_t result = 0LL;
  if ((_DWORD)v21 && dword_1001623C8)
  {
    printf("Setting speed to %d\n", v21);
    off_1001623F8(qword_1001623C0, v21);
    return 0LL;
  }

  return result;
}

void sub_10001E9F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EA24(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EA54(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EA84(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EAB4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EAE4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EB14(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EB44(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001EB74(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001EBA4(int a1, uint64_t a2)
{
  if (sub_100023E78() == 6)
  {
    fwrite("autobaud not supported for AppleBT!\n", 0x24uLL, 1uLL, __stderrp);
    fflush(__stderrp);
    return 0LL;
  }

  __int16 v32 = 0;
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
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v15 = 0LL;
  puts("bluetool_command_autobaud");
  useconds_t v4 = 1000;
  if (a1 >= 1)
  {
    if (a2)
    {
      char v5 = *(const char **)(a2 + 8);
      if (v5)
      {
        int v6 = atoi(v5);
        if (v6 >= 0) {
          useconds_t v4 = v6;
        }
        else {
          useconds_t v4 = 3000;
        }
      }
    }
  }

  if (dword_1001623C8)
  {
    int v7 = 1;
    while (2)
    {
      if (v7 <= 8) {
        int v8 = 8;
      }
      else {
        int v8 = v7;
      }
LABEL_14:
      puts("bluetool_command_autobaud : reset ON");
      sub_100025820();
      usleep(0x3D090u);
      puts("bluetool_command_autobaud : reset OFF");
      sub_1000258E8();
      puts("bluetool_command_autobaud : flush");
      if (off_100162408)
      {
        usleep(0x3D090u);
        off_100162408(qword_1001623C0);
      }

      int v9 = 0;
      while (!off_1001623E0(qword_1001623C0))
      {
        unint64_t v10 = 0LL;
        do
        {
          usleep(v4);
          off_1001623D0(qword_1001623C0, (char *)&unk_10002E868 + v10, 1LL);
          usleep(0x3E8u);
          else {
            BOOL v11 = v10 >= 0xF;
          }
          ++v10;
        }

        while (!v11);
        if (++v9 == 11)
        {
LABEL_29:
          if (v7++ != v8) {
            goto LABEL_14;
          }
LABEL_36:
          fwrite("BlueTool: ERROR -- unable to autobaud chip.\n", 0x2CuLL, 1uLL, __stderrp);
          return 6LL;
        }
      }

      while (off_1001623E0(qword_1001623C0))
      {
        __int16 v32 = 0;
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
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        if ((off_1001623F0(qword_1001623C0, &v16, 258LL, &v15) & 0x80000000) != 0) {
          goto LABEL_29;
        }
        puts("bluetool_command_autobaud : sleep again");
        usleep(0xEA60u);
      }

      usleep(0x493E0u);
      puts("bluetool_command_autobaud : HCI reset !");
      off_1001623E8(qword_1001623C0, &unk_10002E850, 3LL);
      do
      {
        usleep(0x4E20u);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int16 v32 = 0;
        off_1001623F0(qword_1001623C0, &v16, 258LL, &v15);
      }

      while (v16 == 15);
      if (v16 != 14)
      {
        printf("We got packet 0x%02x\n", v16);
        if (v7++ <= 7) {
          continue;
        }
        goto LABEL_36;
      }

      break;
    }

    puts("autobaud complete!");
    return 0LL;
  }

  fwrite("Device not currently opened.\n", 0x1DuLL, 1uLL, __stderrp);
  return 3LL;
}

uint64_t sub_10001EF2C(int a1, char **a2)
{
  while (1)
  {
    while (1)
    {
      int v4 = getopt(a1, a2, "ht:");
      if (v4 != 116) {
        break;
      }
      strtoul(optarg, 0LL, 0);
    }

    if (v4 == -1) {
      break;
    }
    if (v4 == 104)
    {
      fwrite("(No Parameters)  - Places device in test mode indefinitely\n", 0x3BuLL, 1uLL, __stderrp);
      fwrite("-t <#>           - Places device in test mode for # seconds\n", 0x3CuLL, 1uLL, __stderrp);
      fputc(10, __stderrp);
      return 0LL;
    }
  }

  fwrite("not implemented", 0xFuLL, 1uLL, __stderrp);
  return 5LL;
}

uint64_t sub_10001F014(int a1)
{
  int v4 = 0;
  ioctl(a1, 0x4004746AuLL, &v4);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015CF68);
  }
  int v1 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
  {
    if ((v4 & 0x20) != 0) {
      int v2 = "ASSERTED";
    }
    else {
      int v2 = "DEASSERTED";
    }
    *(_DWORD *)stat buf = 136315138;
    int v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "CTS is %s", buf, 0xCu);
  }

  return v4 & 0x20;
}

void sub_10001F118(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001F148(const char *a1, unsigned int a2)
{
  uint64_t v8 = 0LL;
  *(void *)&v7[12] = 0LL;
  int v9 = 0;
  int v4 = socket(32, 1, 2);
  if (v4 < 0)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CFA8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002C9F0();
    }
    return 0xFFFFFFFFLL;
  }

  unsigned int v5 = v4;
  *(_DWORD *)int v7 = 139296;
  memset(v10, 0, sizeof(v10));
  int v11 = 0;
  __strlcpy_chk((char *)v10 + 4, a1, 96LL, 96LL);
  if (ioctl(v5, 0xC0644E03uLL, v10))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015CFE8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002CAD8();
    }
    return 0xFFFFFFFFLL;
  }

  *(_DWORD *)&v7[4] = v10[0];
  *(_DWORD *)&v7[8] = 0;
  if (connect(v5, (const sockaddr *)v7, 0x20u) == -1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D028);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002CA68();
    }
    return 0xFFFFFFFFLL;
  }

  sub_10001F484(v5, a2);
  snprintf((char *)&xmmword_100161FC0, 0x3FFuLL, "UART - %s", a1);
  uint64_t result = 0LL;
  off_1001623D0 = (uint64_t (*)(void, void, void))sub_10001F554;
  off_1001623D8 = (uint64_t (*)(void, void, void))sub_10001F55C;
  off_1001623E0 = (uint64_t (*)(void))sub_10001F564;
  off_1001623E8 = (uint64_t (*)(void, void, void))sub_10001F5F4;
  off_1001623F0 = (uint64_t (*)(void, void, void, void))sub_10001F6C8;
  off_100162400 = (uint64_t (*)(void))sub_10001F940;
  dword_100162418 = 0;
  off_1001623F8 = (uint64_t (*)(void, void))sub_10001F484;
  qword_1001623C0 = v5;
  dword_1001623C8 = 1;
  off_100162408 = (uint64_t (*)(void))sub_10001F960;
  off_100162410 = (uint64_t (*)(void))sub_10001F968;
  return result;
}

void sub_10001F3F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001F424(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001F454(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001F484(int a1, unsigned int a2)
{
  socklen_t v5 = 72;
  getsockopt(a1, 2, 1078490131, &v6, &v5);
  cfmakeraw(&v6);
  cfsetspeed(&v6, a2);
  v6.c_iflag |= 4uLL;
  v6.c_cflag = 232192LL;
  setsockopt(a1, 2, -2142735340, &v6, 0x48u);
  return 0LL;
}

uint64_t sub_10001F554(int a1, char *a2, uint64_t a3)
{
  return sub_10001FB38(a1, a2, a3, 1uLL);
}

uint64_t sub_10001F55C(int a1, char *a2, unint64_t a3)
{
  return sub_10001FB38(a1, a2, a3, a3);
}

BOOL sub_10001F564(int a1)
{
  v3.tv_sec = 0LL;
  *(void *)&v3.tv_usec = 0LL;
  memset(&v4, 0, sizeof(v4));
  if (__darwin_check_fd_set_overflow(a1, &v4, 0)) {
    *(__int32_t *)((char *)v4.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  return select(a1 + 1, &v4, 0LL, 0LL, &v3) > 0;
}

uint64_t sub_10001F5F4(int a1, char *a2, uint64_t a3)
{
  __stat buf = 1;
  if (write(a1, &__buf, 1uLL) != 1)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D0A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002CB48();
    }
    *__error() = 0;
  }

  return sub_10001FB38(a1, a2, a3, 1uLL);
}

uint64_t sub_10001F6C8(int a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v8 = (unsigned __int8 *)(a2 + 2);
  int v9 = &__stderrp;
  while (2)
  {
    while (1)
    {
      int v10 = 0;
      unsigned __int8 v25 = 0;
      while (1)
      {
        int v11 = read(a1, &v25 + v10, (1 - v10));
        if (v11 < 1)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015D0E8);
          }
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
            sub_10002CBEC();
          }
          return 0xFFFFFFFFLL;
        }

        v10 += v11;
        if (v10 >= 1)
        {
          int v10 = 0;
        }
      }

      fwrite("ACL/SCO DATA?!?!? What do you think I am? A Bluetooth stack?\n", 0x3DuLL, 1uLL, *v9);
      if (v25 == 2) {
        int v12 = 4;
      }
      else {
        int v12 = 3;
      }
      if ((int)sub_10001FD00(a1, a2, v12) <= 0)
      {
        __int128 v19 = "read() H4_HCI_DATA header";
        goto LABEL_34;
      }

      BOOL v13 = v9;
      uint64_t v14 = a4;
      if (v25 == 2) {
        int v15 = *(unsigned __int8 *)(a2 + 3) << 8;
      }
      else {
        int v15 = 0;
      }
      unsigned int v16 = v15 | *v8;
      __int128 v17 = malloc(v16);
      int v18 = sub_10001FD00(a1, (uint64_t)v17, v16);
      free(v17);
      a4 = v14;
      int v9 = v13;
      if (v18 <= 0)
      {
        __int128 v19 = "read() H4_HCI_DATA body";
        goto LABEL_34;
      }
    }

    if (v25 != 4) {
      continue;
    }
    break;
  }

  __int128 v21 = v9;
  for (int i = 0; i <= 1; i += v23)
  {
    int v23 = read(a1, (void *)(a2 + i), (2 - i));
    if (v23 < 1)
    {
      __int128 v19 = "read() H4_HCI_EVENT header";
      goto LABEL_34;
    }
  }

  unint64_t v24 = *v8 + 2LL;
  if (v24 > a3)
  {
    fprintf(*v21, "buffer passed into %s is too small to hold %d bytes\n", "uart_get_hci_event", v24);
    return 0xFFFFFFFFLL;
  }

  if ((int)sub_10001FD00(a1, (uint64_t)v8, *(unsigned __int8 *)(a2 + 1)) <= 0)
  {
    __int128 v19 = "read() H4_HCI_EVENT body";
LABEL_34:
    perror(v19);
    return 0xFFFFFFFFLL;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = *(unsigned __int8 *)(a2 + 1);
  }
  return result;
}

uint64_t sub_10001F940(int a1)
{
  uint64_t result = close(a1);
  dword_1001623C8 = 0;
  return result;
}

uint64_t sub_10001F960(int a1)
{
  return tcflush(a1, 3);
}

void sub_10001F968(int a1)
{
  __stat buf = -86;
  tcflush(a1, 3);
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015D128);
  }
  int v2 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v8) = 170;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Spaming %02X to UART", buf, 8u);
  }

  while (1)
  {
    while (write(a1, &__buf, 1uLL) > 0)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015D1A8);
      }
      timeval v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v8) = __buf;
        _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "W: 0x%02x", buf, 8u);
      }
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D168);
    }
    fd_set v4 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      socklen_t v5 = __error();
      termios v6 = strerror(*v5);
      *(_DWORD *)stat buf = 136315138;
      uint64_t v8 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Error writing byte to device: %s",  buf,  0xCu);
    }
  }

uint64_t sub_10001FB38(int __fd, char *__buf, uint64_t a3, unint64_t a4)
{
  if (a3 < 1)
  {
LABEL_9:
    tcdrain(__fd);
    return 0LL;
  }

  else
  {
    ssize_t v8 = a3;
    while (1)
    {
      size_t v9 = v8 >= a4 ? a4 : v8;
      ssize_t v10 = write(__fd, __buf, v9);
      if (v10 <= 0) {
        break;
      }
      __buf += v10;
      BOOL v11 = v8 <= v10;
      v8 -= v10;
      if (v11) {
        goto LABEL_9;
      }
    }

    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D068);
    }
    BOOL v13 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = __error();
      int v15 = strerror(*v14);
      int v16 = 134218754;
      size_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = a3 - v8;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      __int16 v22 = 2080;
      int v23 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error writing %zu bytes %zd / %zu to device: %s",  (uint8_t *)&v16,  0x2Au);
    }

    return 0xFFFFFFFFLL;
  }

void sub_10001FCA0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001FCD0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_10001FD00(int a1, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    LODWORD(vmemset(v13, 0, 6) = 0;
    while (1)
    {
      int v7 = read(a1, (void *)(a2 + (int)v6), a3 - (int)v6);
      if (v7 < 1) {
        break;
      }
      uint64_t v6 = (v6 + v7);
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_10001FD6C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001FD9C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001FDCC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10001FDFC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

  ;
}

void sub_10001FE38( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_10001FE64()
{
  return __error();
}

  ;
}

char *sub_10001FE7C(int *a1)
{
  return strerror(*a1);
}

uint64_t sub_10001FE84()
{
  if ((byte_100161F18 & 1) != 0) {
    return 0LL;
  }
  mach_port_t v1 = dword_100161F30;
  if (dword_100161F30) {
    goto LABEL_4;
  }
  io_iterator_t notification = 0;
  timeval v3 = IONotificationPortCreate(kIOMainPortDefault);
  RunLoopSource = IONotificationPortGetRunLoopSource(v3);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  uint64_t v6 = IOServiceNameMatching("AppleBTHci");
  uint64_t v7 = IOServiceAddMatchingNotification( v3,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)sub_1000210D0,  Current,  &notification);
  if ((_DWORD)v7)
  {
    uint64_t v0 = v7;
    if (qword_100161F20 != -1) {
      dispatch_once(&qword_100161F20, &stru_10015D668);
    }
    ssize_t v8 = (os_log_s *)qword_100161F28;
    if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
      sub_10002CDA0(v0, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  else
  {
    io_service_t v16 = IOIteratorNext(notification);
    for (dword_100161F34 = v16; !v16; dword_100161F34 = v16)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D6A8);
      }
      size_t v17 = (os_log_s *)qword_100161F28;
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v36 = "AppleBTHci";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_connect: Couldn't find %s service, waiting for first match\n",  buf,  0xCu);
      }

      CFRunLoopRun();
      io_service_t v16 = IOIteratorNext(notification);
    }

    uint64_t v0 = IOServiceOpen(v16, mach_task_self_, 0, (io_connect_t *)&dword_100161F30);
    if ((_DWORD)v0)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D6E8);
      }
      __int16 v18 = (os_log_s *)qword_100161F28;
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        sub_10002CD3C(v0, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  CFRunLoopRemoveSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(v3);
  IOObjectRelease(notification);
  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D728);
  }
  unsigned __int8 v25 = (os_log_s *)qword_100161F28;
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    uint64_t v36 = "AppleBTHci";
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_connect: Service %s connected!\n",  buf,  0xCu);
  }

  if (!(_DWORD)v0)
  {
    mach_port_t v1 = dword_100161F30;
LABEL_4:
    uint64_t v2 = IOConnectCallMethod(v1, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v2)
    {
      uint64_t v0 = v2;
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D228);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        sub_10002CC70();
      }
    }

    else
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D268);
      }
      int v15 = (os_log_s *)qword_100161F28;
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v36 = "AppleBTHci";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_open: Service %s opened!\n",  buf,  0xCu);
      }

      uint64_t v0 = 0LL;
      byte_100161F18 = 1;
    }

    return v0;
  }

  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D1E8);
  }
  __int128 v26 = (os_log_s *)qword_100161F28;
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
    sub_10002CCD8(v0, v26, v27, v28, v29, v30, v31, v32);
  }
  return v0;
}

void sub_1000202F8(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020324(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

const char *sub_100020350(int a1)
{
  if (a1 > -536870182)
  {
    if (a1 > -536870161)
    {
      switch(a1)
      {
        case -536870160:
          return "kIOReturnNotFound";
        case 0:
          return "kIOReturnSuccess";
        case 5:
          return "KERN_FAILURE";
      }
    }

    else
    {
      switch(a1)
      {
        case -536870181:
          return "kIOReturnNoSpace";
        case -536870167:
          return "kIOReturnDeviceError";
        case -536870165:
          return "kIOReturnAborted";
      }
    }

    return "UNKNOWN";
  }

  if (a1 <= -536870199)
  {
    if (a1 == -536870211) {
      return "kIOReturnNoMemory";
    }
    if (a1 == -536870206) {
      return "kIOReturnBadArgument";
    }
    return "UNKNOWN";
  }

  switch(a1)
  {
    case -536870198:
      uint64_t result = "kIOReturnIOError";
      break;
    case -536870197:
    case -536870196:
      return "UNKNOWN";
    case -536870195:
      uint64_t result = "kIOReturnNotOpen";
      break;
    case -536870194:
      uint64_t result = "kIOReturnNotReadable";
      break;
    case -536870193:
      uint64_t result = "kIOReturnNotWritable";
      break;
    default:
      if (a1 != -536870185) {
        return "UNKNOWN";
      }
      uint64_t result = "kIOReturnOffline";
      break;
  }

  return result;
}

void sub_1000204D0(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

uint64_t sub_1000204FC()
{
  if ((byte_100161F18 & 1) != 0)
  {
    byte_100161F18 = 0;
    uint64_t v0 = IOConnectCallMethod(dword_100161F30, 1u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v0)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D2E8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        sub_10002CE04();
      }
    }

    IOServiceClose(dword_100161F30);
    dword_100161F30 = 0;
    IOObjectRelease(dword_100161F34);
    dword_100161F34 = 0;
    if (qword_100161F20 != -1) {
      dispatch_once(&qword_100161F20, &stru_10015D328);
    }
    mach_port_t v1 = (os_log_s *)qword_100161F28;
    if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      fd_set v4 = "AppleBTHci";
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_close: Service %s closed and disconnected!\n",  buf,  0xCu);
    }
  }

  else
  {
    if (qword_100161F20 != -1) {
      dispatch_once(&qword_100161F20, &stru_10015D2A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
      sub_10002CE6C();
    }
    return 5LL;
  }

  return v0;
}

void sub_1000206D4(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020700(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_10002072C(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

uint64_t sub_100020758()
{
  if ((byte_100161F18 & 1) != 0)
  {
    uint64_t v0 = IOConnectCallMethod(dword_100161F30, 4u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v0)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D3A8);
      }
      if (!os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      sub_10002CE98();
    }

    if (qword_100161F20 != -1) {
      dispatch_once(&qword_100161F20, &stru_10015D3E8);
    }
LABEL_9:
    mach_port_t v1 = (os_log_s *)qword_100161F28;
    if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_transport_reset: HCI Transport was reset!\n",  buf,  2u);
    }

    return v0;
  }

  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D368);
  }
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
    sub_10002CF00();
  }
  return 5LL;
}

void sub_1000208C4(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_1000208F0(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_10002091C(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

uint64_t sub_100020948(int a1, unsigned __int8 *inputStruct)
{
  if ((byte_100161F18 & 1) != 0)
  {
    uint64_t v34 = 0LL;
    memset(outputStruct, 0, sizeof(outputStruct));
    uint64_t v26 = 8LL * a1;
    uint64_t v4 = IOConnectCallMethod( dword_100161F30,  2u,  0LL,  0,  inputStruct,  16LL * a1,  0LL,  0LL,  outputStruct,  (size_t *)&v26);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D468);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        sub_10002CF2C();
      }
      return v5;
    }

    if (a1 < 1) {
      return 0LL;
    }
    uint64_t v5 = 0LL;
    uint64_t v7 = a1;
    ssize_t v8 = inputStruct + 1;
    for (int i = (unsigned __int8 *)outputStruct + 4; ; i += 8)
    {
      int v10 = *((_DWORD *)i - 1);
      if (v10) {
        break;
      }
LABEL_30:
      v8 += 16;
      if (!--v7) {
        return v5;
      }
    }

    if (v10 == -536870181)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D4E8);
      }
      __int16 v18 = (os_log_s *)qword_100161F28;
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *(v8 - 1);
        int v20 = *i;
        int v21 = *v8;
        *(_DWORD *)stat buf = 67109632;
        int v28 = v19;
        __int16 v29 = 1024;
        int v30 = v20;
        __int16 v31 = 1024;
        LODWORD(v32) = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_write: write to discardable pipe %d failed with no space, written %d out of %d packets\n",  buf,  0x14u);
      }

      goto LABEL_30;
    }

    if (v10 == -536870198)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D4A8);
      }
      uint64_t v11 = qword_100161F28;
      if (!os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v12 = *(v8 - 1);
      int v13 = *i;
      int v14 = *v8;
      *(_DWORD *)stat buf = 67109632;
      int v28 = v12;
      __int16 v29 = 1024;
      int v30 = v13;
      __int16 v31 = 1024;
      LODWORD(v32) = v14;
      int v15 = (os_log_s *)v11;
      io_service_t v16 = "applebt_hci_write: write to non-discardable pipe %d failed with no space, written %d out of %d packets\n";
      uint32_t v17 = 20;
    }

    else
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D528);
      }
      uint64_t v22 = qword_100161F28;
      if (!os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v23 = *(v8 - 1);
      int v24 = *((_DWORD *)i - 1);
      unsigned __int8 v25 = sub_100020350(v24);
      *(_DWORD *)stat buf = 67109634;
      int v28 = v23;
      __int16 v29 = 1024;
      int v30 = v24;
      __int16 v31 = 2080;
      uint64_t v32 = v25;
      int v15 = (os_log_s *)v22;
      io_service_t v16 = "applebt_hci_write: write to pipe %d failed with (0x%08X, %s)\n";
      uint32_t v17 = 24;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
LABEL_29:
    uint64_t v5 = 5LL;
    goto LABEL_30;
  }

  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D428);
  }
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
    sub_10002CF94();
  }
  return 5LL;
}

void sub_100020CEC(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020D18(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020D44(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020D70(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020D9C(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

uint64_t sub_100020DC8(int a1, void *inputStruct, void *outputStruct)
{
  if ((byte_100161F18 & 1) != 0)
  {
    uint64_t v11 = 8LL * a1;
    size_t v5 = 16LL * a1;
    while (1)
    {
      uint64_t v6 = IOConnectCallMethod(dword_100161F30, 3u, 0LL, 0, inputStruct, v5, 0LL, 0LL, outputStruct, (size_t *)&v11);
      if ((_DWORD)v6 != -536870165) {
        break;
      }
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D5E8);
      }
      uint64_t v7 = (os_log_s *)qword_100161F28;
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "applebt_hci_read: method kAppleBTHciRead was aborted by signal! Read again\n",  buf,  2u);
      }
    }

    uint64_t v8 = v6;
    if ((_DWORD)v6)
    {
      if (qword_100161F20 != -1) {
        dispatch_once(&qword_100161F20, &stru_10015D5A8);
      }
      if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
        sub_10002CFC0();
      }
    }
  }

  else
  {
    if (qword_100161F20 != -1) {
      dispatch_once(&qword_100161F20, &stru_10015D568);
    }
    if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
      sub_10002D028();
    }
    return 5LL;
  }

  return v8;
}

void sub_100020F80(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020FAC(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100020FD8(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

CFTypeRef sub_100021004()
{
  if (dword_100161F34) {
    return IORegistryEntrySearchCFProperty(dword_100161F34, "IODeviceTree", @"pipes", kCFAllocatorDefault, 1u);
  }
  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D628);
  }
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_ERROR)) {
    sub_10002D054();
  }
  return 0LL;
}

void sub_1000210A4(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_1000210D0(__CFRunLoop *a1)
{
  if (qword_100161F20 != -1) {
    dispatch_once(&qword_100161F20, &stru_10015D768);
  }
  uint64_t v2 = (os_log_s *)qword_100161F28;
  if (os_log_type_enabled((os_log_t)qword_100161F28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)timeval v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "DeviceFoundCB: releasing waiting thread\n",  v3,  2u);
  }

  CFRunLoopStop(a1);
}

void sub_100021164(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100021190(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_1000211BC(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_1000211E8(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100021214(id a1)
{
  qword_100161F28 = (uint64_t)os_log_create("com.apple.bluetooth", "applebt_hci");
}

void sub_100021240( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

const char *sub_10002126C(int a1)
{
  return sub_100020350(a1);
}

  ;
}

uint64_t sub_100021280()
{
  return sub_100015F98( (uint64_t)"c036d9e267c26b68487b0be18cdc29d8b34fa96d",  (uint64_t)"BCM4350C5",  (uint64_t)"MUR",  (uint64_t)sub_100021B80,  (uint64_t)sub_100021D34,  (uint64_t)sub_100021D44,  (uint64_t)"BCM4350C5_19.1.235.4917_Brunello_OS_MUR_STC_20210628.hcd",  0LL,  0x104A1u,  (uint64_t)&unk_10002E886,  0LL,  0);
}

uint64_t sub_1000212F4()
{
  return sub_100015F98( (uint64_t)"c036d9e267c26b68487b0be18cdc29d8b34fa96d",  (uint64_t)"BCM4350C5",  (uint64_t)"TY",  (uint64_t)sub_100021DCC,  (uint64_t)sub_100021F80,  (uint64_t)sub_100021F90,  (uint64_t)"BCM4350C5_19.1.235.4918_Brunello_OS_TY_STC_20210628.hcd",  0LL,  0x1049Du,  (uint64_t)&unk_10003ED28,  0LL,  0);
}

uint64_t sub_100021368()
{
  return sub_100015F98( (uint64_t)"c036d9e267c26b68487b0be18cdc29d8b34fa96d",  (uint64_t)"BCM4350C5",  (uint64_t)"USI",  (uint64_t)sub_100022018,  (uint64_t)sub_1000221CC,  (uint64_t)sub_1000221DC,  (uint64_t)"BCM4350C5_19.1.235.4919_Brunello_OS_USI_STC_20210628.hcd",  0LL,  0x1049Eu,  (uint64_t)&unk_10004F1C6,  0LL,  0);
}

uint64_t sub_1000213DC()
{
  return sub_100015F98( (uint64_t)"ec7810354d55126df74206281a4de8e988b210e6",  (uint64_t)"BCM4357B1",  (uint64_t)"MUR",  (uint64_t)sub_100022264,  (uint64_t)sub_10002242C,  (uint64_t)sub_10002243C,  (uint64_t)"BCM4357B1_19.1.282.5151_Dory_OS_MUR_20210524.hcd",  0LL,  0x2898Au,  (uint64_t)&unk_10005F665,  0LL,  0);
}

uint64_t sub_100021450()
{
  return sub_100018CF0((uint64_t)"ec7810354d55126df74206281a4de8e988b210e6", (uint64_t)&unk_100087FF0, 210);
}

uint64_t sub_100021468()
{
  return sub_100015F98( (uint64_t)"ec7810354d55126df74206281a4de8e988b210e6",  (uint64_t)"BCM4357B1",  (uint64_t)"USI",  (uint64_t)sub_1000224C4,  (uint64_t)sub_10002268C,  (uint64_t)sub_10002269C,  (uint64_t)"BCM4357B1_19.1.282.5152_Dory_OS_USI_20210524.hcd",  0LL,  0x28956u,  (uint64_t)&unk_1000880C2,  0LL,  0);
}

uint64_t sub_1000214DC()
{
  return sub_100018CF0((uint64_t)"ec7810354d55126df74206281a4de8e988b210e6", (uint64_t)&unk_1000B0A19, 210);
}

uint64_t sub_1000214F4()
{
  return sub_100015F98( (uint64_t)"75ca7dd93c5ac33c4811050d8987504774003971",  (uint64_t)"BCM4357B1",  (uint64_t)"MUR",  (uint64_t)sub_100022724,  (uint64_t)sub_1000228EC,  (uint64_t)sub_1000228FC,  (uint64_t)"BCM4357B1_19.1.282.5161_Tuborg_OS_MUR_20210524.hcd",  0LL,  0x27861u,  (uint64_t)&unk_1000B0AEB,  0LL,  0);
}

uint64_t sub_100021568()
{
  return sub_100018CF0((uint64_t)"75ca7dd93c5ac33c4811050d8987504774003971", (uint64_t)&unk_1000D834D, 210);
}

uint64_t sub_100021580()
{
  return sub_100015F98( (uint64_t)"75ca7dd93c5ac33c4811050d8987504774003971",  (uint64_t)"BCM4357B1",  (uint64_t)"USI",  (uint64_t)sub_100022984,  (uint64_t)sub_100022B4C,  (uint64_t)sub_100022B5C,  (uint64_t)"BCM4357B1_19.1.282.5162_Tuborg_OS_USI_20210524.hcd",  0LL,  0x278BDu,  (uint64_t)&unk_1000D841F,  0LL,  0);
}

uint64_t sub_1000215F4()
{
  return sub_100018CF0((uint64_t)"75ca7dd93c5ac33c4811050d8987504774003971", (uint64_t)&unk_1000FFCDD, 210);
}

uint64_t sub_10002160C()
{
  return sub_100015F98( (uint64_t)"2dd42fd91f1ffb3344956ece1867a06a12aaf354",  (uint64_t)"BCM4357B1",  (uint64_t)"MUR",  (uint64_t)sub_100022BE4,  (uint64_t)sub_100022DAC,  (uint64_t)sub_100022DBC,  (uint64_t)"BCM4357B1_19.1.282.5161_Tuborg_OS_MUR_20210524.hcd",  0LL,  0x27861u,  (uint64_t)&unk_1000FFDAF,  0LL,  0);
}

uint64_t sub_100021680()
{
  return sub_100018CF0((uint64_t)"2dd42fd91f1ffb3344956ece1867a06a12aaf354", (uint64_t)&unk_100127611, 210);
}

uint64_t sub_100021698()
{
  return sub_100015F98( (uint64_t)"2dd42fd91f1ffb3344956ece1867a06a12aaf354",  (uint64_t)"BCM4357B1",  (uint64_t)"USI",  (uint64_t)sub_100022E44,  (uint64_t)sub_10002300C,  (uint64_t)sub_10002301C,  (uint64_t)"BCM4357B1_19.1.282.5162_Tuborg_OS_USI_20210524.hcd",  0LL,  0x278BDu,  (uint64_t)&unk_1001276E3,  0LL,  0);
}

uint64_t sub_10002170C()
{
  return sub_100018CF0((uint64_t)"2dd42fd91f1ffb3344956ece1867a06a12aaf354", (uint64_t)&unk_10014EFA1, 210);
}

uint64_t sub_100021724()
{
  return sub_100015F98( (uint64_t)"c80eef07b8211358978faac4e03806bba552ef88",  (uint64_t)"BCM4378B1",  (uint64_t)"USI",  (uint64_t)sub_1000230A4,  (uint64_t)sub_100023168,  (uint64_t)sub_100023178,  (uint64_t)"BCM4378B1_22.3.540.3950_PCIE_Marlin_OS_USI_3ANT_20241009.bin",  (uint64_t)"BCM4378B1_*_PCIE_Marlin_OS_USI_3ANT_*",  0x59F20u,  0LL,  (uint64_t)"8f9143d9e6d5e564ef08d4b36a4af823fc3ad6248a71f8dd9f4e800069b40d51",  0);
}

uint64_t sub_10002179C()
{
  return sub_100015F98( (uint64_t)"c80eef07b8211358978faac4e03806bba552ef88",  (uint64_t)"BCM4378B1",  (uint64_t)"MUR",  (uint64_t)sub_1000231D8,  (uint64_t)sub_10002329C,  (uint64_t)sub_1000232AC,  (uint64_t)"BCM4378B1_22.3.540.3949_PCIE_Marlin_OS_MUR_3ANT_20241009.bin",  (uint64_t)"BCM4378B1_*_PCIE_Marlin_OS_MUR_3ANT_*",  0x59F20u,  0LL,  (uint64_t)"85e200ad9e0a362cdbdac66cba4f60c31cb1d9f29d1873679779f8f6aa6f9caa",  0);
}

uint64_t sub_100021814()
{
  return sub_100015F98( (uint64_t)"fd81e57823eb4a40d3a98a12528081114f3e1baa",  (uint64_t)"BCM4378B1",  (uint64_t)"USI",  (uint64_t)sub_10002330C,  (uint64_t)sub_1000233D0,  (uint64_t)sub_1000233E0,  (uint64_t)"BCM4378B1_22.3.540.3950_PCIE_Marlin_OS_USI_3ANT_20241009.bin",  (uint64_t)"BCM4378B1_*_PCIE_Marlin_OS_USI_3ANT_*",  0x59F20u,  0LL,  (uint64_t)"8f9143d9e6d5e564ef08d4b36a4af823fc3ad6248a71f8dd9f4e800069b40d51",  0);
}

uint64_t sub_10002188C()
{
  return sub_100015F98( (uint64_t)"fd81e57823eb4a40d3a98a12528081114f3e1baa",  (uint64_t)"BCM4378B3",  (uint64_t)"USI",  (uint64_t)sub_100023440,  (uint64_t)sub_100023504,  (uint64_t)sub_100023514,  (uint64_t)"BCM4378B3_22.1.144.282_PCIE_Redwood_OS_USI_3ANT_20240806.bin",  (uint64_t)"BCM4378B3_*_PCIE_Redwood_OS_USI_3ANT_*",  0x3747Eu,  0LL,  (uint64_t)"039a4e1fa145e83d30d1b330c71ec55580402f92df4d165c776d82bb05b81adc",  0);
}

uint64_t sub_100021904()
{
  return sub_100015F98( (uint64_t)"fd81e57823eb4a40d3a98a12528081114f3e1baa",  (uint64_t)"BCM4378B3",  (uint64_t)"USI",  (uint64_t)sub_100023574,  (uint64_t)sub_100023638,  (uint64_t)sub_100023648,  (uint64_t)"BCM4378B3_22.1.144.284_PCIE_Hazel_OS_USI_3ANT_20240806.bin",  (uint64_t)"BCM4378B3_*_PCIE_Hazel_OS_USI_3ANT_*",  0x37A76u,  0LL,  (uint64_t)"67b636de3260e9bece28626fb5a71b4ede08c86f2d7bfc206486b5e993d79bec",  1);
}

uint64_t sub_100021980()
{
  return sub_100015F98( (uint64_t)"0c1bbe1ed1f972193dc40144a98b28307aab0a29",  (uint64_t)"BCM4387C2",  (uint64_t)"USI",  (uint64_t)sub_1000236A8,  (uint64_t)sub_10002376C,  (uint64_t)sub_10002377C,  (uint64_t)"BCM4387C2_22.2.603.2956_PCIE_RambutanA_CLPC_OS_USI_20240822.bin",  (uint64_t)"BCM4387C2_*_PCIE_RambutanA_CLPC_OS_USI_*",  0x7F027u,  0LL,  (uint64_t)"8d9a335174ae6de7bd08b558969d1b157e72977a45746aadd65b52d7b74dad53",  0);
}

uint64_t sub_1000219F8()
{
  return sub_100015F98( (uint64_t)"0c1bbe1ed1f972193dc40144a98b28307aab0a29",  (uint64_t)"BCM4387C2",  (uint64_t)"STA",  (uint64_t)sub_1000237DC,  (uint64_t)sub_1000238A0,  (uint64_t)sub_1000238B0,  (uint64_t)"BCM4387C2_22.2.603.2955_PCIE_RambutanA_CLPC_OS_STATS_20240822.bin",  (uint64_t)"BCM4387C2_*_PCIE_RambutanA_CLPC_OS_STATS_*",  0x7F029u,  0LL,  (uint64_t)"dc4a902320452c3c2d763665dfee8cd8898c5fc4f59d68b22f2624f690f1a57f",  0);
}

uint64_t sub_100021A70()
{
  return sub_100015F98( (uint64_t)"9766b0fe4400696f7336a589bd631f2498c92add",  (uint64_t)"APPLE_M2_5",  (uint64_t)"ALL",  (uint64_t)sub_100023910,  (uint64_t)sub_100023920,  (uint64_t)sub_100023A20,  (uint64_t)"aci_marconi2_5_init.hcd",  0LL,  0x34u,  (uint64_t)&unk_10014F369,  0LL,  0);
}

uint64_t sub_100021AE0()
{
  return sub_100018CF0((uint64_t)"9766b0fe4400696f7336a589bd631f2498c92add", (uint64_t)&unk_10014F073, 379);
}

uint64_t sub_100021AF8()
{
  return sub_100015F98( (uint64_t)"abe51ee857d79a480680a31f75d983813d4294cb",  (uint64_t)"APPLE_M2_5",  (uint64_t)"ALL",  (uint64_t)sub_100023A58,  (uint64_t)sub_100023A68,  (uint64_t)sub_100023B68,  (uint64_t)"aci_marconi2_5_init.hcd",  0LL,  0x34u,  (uint64_t)&unk_10014F39E,  0LL,  0);
}

uint64_t sub_100021B68()
{
  return sub_100018CF0((uint64_t)"abe51ee857d79a480680a31f75d983813d4294cb", (uint64_t)&unk_10014F1EE, 379);
}

uint64_t sub_100021B80()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -B", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01",  0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150("msleep 200", 0LL);
                                        if (!(_DWORD)result) {
                                          return sub_10001D150("quit", 0LL);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100021D34()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100021D44()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100021DCC()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -B", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01",  0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150("msleep 200", 0LL);
                                        if (!(_DWORD)result) {
                                          return sub_10001D150("quit", 0LL);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100021F80()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100021F90()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022018()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -B", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01",  0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150("msleep 200", 0LL);
                                        if (!(_DWORD)result) {
                                          return sub_10001D150("quit", 0LL);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000221CC()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_1000221DC()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x01", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022264()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10002242C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_10002243C()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000224C4()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10002268C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_10002269C()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022724()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000228EC()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_1000228FC()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022984()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022B4C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100022B5C()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022BE4()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022DAC()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100022DBC()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100022E44()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("power off", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("msleep 100", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("power on", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("msleep 100", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("hci reset", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -b 1500000", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("bcm -W", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = sub_10001D150("device -s 115200", 0LL);
                        if (!(_DWORD)result)
                        {
                          uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                          if (!(_DWORD)result)
                          {
                            uint64_t result = sub_10001D150("bcm -B", 0LL);
                            if (!(_DWORD)result)
                            {
                              uint64_t result = sub_10001D150("msleep 200 ", 0LL);
                              if (!(_DWORD)result)
                              {
                                uint64_t result = sub_10001D150("bcm -A", 0LL);
                                if (!(_DWORD)result)
                                {
                                  uint64_t result = sub_10001D150("bcm -N", 0LL);
                                  if (!(_DWORD)result)
                                  {
                                    uint64_t result = sub_10001D150("bcm -Q", 0LL);
                                    if (!(_DWORD)result)
                                    {
                                      uint64_t result = sub_10001D150("bcm -x", 0LL);
                                      if (!(_DWORD)result)
                                      {
                                        uint64_t result = sub_10001D150( "bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00",  0LL);
                                        if (!(_DWORD)result)
                                        {
                                          uint64_t result = sub_10001D150("msleep 200", 0LL);
                                          if (!(_DWORD)result) {
                                            return sub_10001D150("quit", 0LL);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10002300C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_10002301C()
{
  uint64_t result = sub_10001D150("device -D -S", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("wake on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("hci reset", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -s 0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("wake off", 0LL);
          if (!(_DWORD)result) {
            return sub_10001D150("quit", 0LL);
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000230A4()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023168()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100023178()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_1000231D8()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10002329C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_1000232AC()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_10002330C()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000233D0()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_1000233E0()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_100023440()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023504()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100023514()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_100023574()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023638()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100023648()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_1000236A8()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10002376C()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_10002377C()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_1000237DC()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("device -D", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -W", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("bcm -A", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("bcm -N", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("bcm -Q", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("bcm -x", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
                if (!(_DWORD)result) {
                  return sub_10001D150("quit", 0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000238A0()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_1000238B0()
{
  uint64_t result = sub_10001D150("device -D", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("hci reset", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("bcm -s 0x0f,0x00,0x02,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00", 0LL);
      if (!(_DWORD)result) {
        return sub_10001D150("quit", 0LL);
      }
    }
  }

  return result;
}

uint64_t sub_100023910()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100023920()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("power on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("device -D", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("aci -Q", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("aci -K", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("aci -W", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("aci -R", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("aci -A", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("aci -N", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("aci -V", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("aci -U", 0LL);
                      if (!(_DWORD)result) {
                        return sub_10001D150("quit", 0LL);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023A20()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result) {
    return sub_10001D150("quit", 0LL);
  }
  return result;
}

uint64_t sub_100023A58()
{
  return sub_10001D150("quit", 0LL);
}

uint64_t sub_100023A68()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_10001D150("power on", 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_10001D150("device -D", 0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = sub_10001D150("aci -Q", 0LL);
        if (!(_DWORD)result)
        {
          uint64_t result = sub_10001D150("aci -K", 0LL);
          if (!(_DWORD)result)
          {
            uint64_t result = sub_10001D150("aci -W", 0LL);
            if (!(_DWORD)result)
            {
              uint64_t result = sub_10001D150("aci -R", 0LL);
              if (!(_DWORD)result)
              {
                uint64_t result = sub_10001D150("aci -A", 0LL);
                if (!(_DWORD)result)
                {
                  uint64_t result = sub_10001D150("aci -N", 0LL);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = sub_10001D150("aci -V", 0LL);
                    if (!(_DWORD)result)
                    {
                      uint64_t result = sub_10001D150("aci -U", 0LL);
                      if (!(_DWORD)result) {
                        return sub_10001D150("quit", 0LL);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100023B68()
{
  uint64_t result = sub_10001D150("power off", 0LL);
  if (!(_DWORD)result) {
    return sub_10001D150("quit", 0LL);
  }
  return result;
}

unint64_t sub_100023BA0()
{
  *(_DWORD *)buffer = 0;
  uint64_t v0 = getenv("BT_BAUDRATE");
  if (v0) {
    return strtoul(v0, 0LL, 0);
  }
  uint64_t v2 = IOServiceNameMatching("bluetooth");
  if (!v2) {
    return 0LL;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0LL;
  }
  io_object_t v4 = MatchingService;
  size_t v5 = (const __CFData *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"transport-speed",  kCFAllocatorDefault,  1u);
  if (v5)
  {
    uint64_t v6 = v5;
    v9.location = 0LL;
    v9.length = 4LL;
    CFDataGetBytes(v5, v9, buffer);
    CFRelease(v6);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D7A8);
    }
    uint64_t v7 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
      sub_10002D080((int *)buffer, v7);
    }
  }

  IOObjectRelease(v4);
  unint64_t result = *(unsigned int *)buffer;
  if (*(_DWORD *)buffer >> 9 <= 0xE0u) {
    return 0LL;
  }
  return result;
}

void sub_100023CC8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100023CF8(const char *a1)
{
  unsigned __int16 v1 = 10;
  *(_DWORD *)buffer = 10;
  uint64_t v2 = IOServiceNameMatching(a1);
  if (v2)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
    if (MatchingService)
    {
      io_object_t v4 = MatchingService;
      size_t v5 = (const __CFData *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"transport-encoding",  kCFAllocatorDefault,  1u);
      if (v5)
      {
        uint64_t v6 = v5;
        v13.location = 0LL;
        v13.length = 4LL;
        CFDataGetBytes(v5, v13, buffer);
        CFRelease(v6);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015D7E8);
        }
        uint64_t v7 = (os_log_s *)qword_100162428;
        BOOL v8 = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG);
        unsigned __int16 v1 = *(_WORD *)buffer;
        if (v8)
        {
          *(_DWORD *)stat buf = 67109120;
          int v12 = *(_DWORD *)buffer;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DeviceTree transport = %d", buf, 8u);
          return *(unsigned __int16 *)buffer;
        }
      }

      else
      {
        IOObjectRelease(v4);
      }
    }
  }

  return v1;
}

void sub_100023E48(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100023E78()
{
  if (qword_100161F38 != -1) {
    dispatch_once(&qword_100161F38, &stru_10015D828);
  }
  return (unsigned __int16)dword_100160A30;
}

void sub_100023EB8(id a1)
{
  size_t v6 = 1024LL;
  if (!sysctlbyname("kern.bootargs", __str, &v6, 0LL, 0LL))
  {
    uint64_t v2 = strtok(__str, " ");
    if (v2)
    {
      timeval v3 = v2;
      while (!strstr(v3, "bt-transport-override"))
      {
        timeval v3 = strtok(0LL, " ");
        if (!v3) {
          goto LABEL_2;
        }
      }

      io_object_t v4 = strchr(v3, 61);
      unint64_t v1 = strtol(v4 + 1, 0LL, 10);
      if (v1 < 0xA) {
        goto LABEL_15;
      }
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015D868);
      }
      size_t v5 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
        sub_10002D0F8(v1, v5);
      }
    }
  }

LABEL_2:
  if (dword_100160A30 == 10)
  {
    dword_100160A30 = sub_100023CF8("marconi-bt");
    if (dword_100160A30 == 10)
    {
      LODWORD(v1) = sub_100023CF8("bluetooth");
LABEL_15:
      dword_100160A30 = v1;
    }
  }

void sub_100024054(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100024084(const char *a1, uint64_t a2)
{
  __int16 v11 = 0;
  *(_DWORD *)buffer = 0;
  timeval v3 = IOServiceNameMatching(a1);
  if (!v3) {
    return 6LL;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (!MatchingService) {
    return 6LL;
  }
  io_object_t v5 = MatchingService;
  size_t v6 = (const __CFData *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"local-mac-address",  kCFAllocatorDefault,  1u);
  if (v6)
  {
    uint64_t v7 = v6;
    v12.location = 0LL;
    v12.length = 6LL;
    CFDataGetBytes(v6, v12, buffer);
    *(_DWORD *)a2 = *(_DWORD *)buffer;
    *(_WORD *)(a2 + 4) = v11;
    CFRelease(v7);
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 6LL;
  }

  IOObjectRelease(v5);
  return v8;
}

uint64_t sub_100024150(unsigned __int8 *a1)
{
  uint64_t v2 = getenv("BT_DEVICE_ADDRESS");
  if (v2 && (timeval v3 = v2, strlen(v2) == 17))
  {
    sscanf(v3, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", a1, a1 + 1, a1 + 2, a1 + 3, a1 + 4, a1 + 5);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D8A8);
    }
    uint64_t v4 = qword_100162428;
    uint64_t v5 = 0LL;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *a1;
      int v7 = a1[1];
      int v8 = a1[2];
      int v9 = a1[3];
      int v10 = a1[4];
      int v11 = a1[5];
      *(_DWORD *)stat buf = 136316674;
      int v58 = v3;
      __int16 v59 = 1024;
      int v60 = v6;
      __int16 v61 = 1024;
      int v62 = v7;
      __int16 v63 = 1024;
      int v64 = v8;
      __int16 v65 = 1024;
      int v66 = v9;
      __int16 v67 = 1024;
      int v68 = v10;
      __int16 v69 = 1024;
      int v70 = v11;
      CFRange v12 = "BT_DEVICE_ADDRESS address (%s) %02x:%02x:%02x:%02x:%02x:%02x";
      CFRange v13 = (os_log_s *)v4;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, 0x30u);
      return 0LL;
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015D8E8);
    }
    int v14 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "could not find BT_DEVICE_ADDRESS env variable",  buf,  2u);
    }

    int v15 = (const char *)sub_100027810();
    if (v15)
    {
      io_service_t v16 = v15;
      LOWORD(v4memset(v13, 0, 6) = 0;
      *(_DWORD *)unsigned __int16 v45 = 0;
      WORD2(v44) = 0;
      LODWORD(v44) = 0;
      sscanf(v15, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx", v45, &v45[1], &v45[2], &v45[3], &v46, (char *)&v46 + 1);
      if (*(_DWORD *)v45 || (unsigned __int16)v46 != 0)
      {
        *(_DWORD *)a1 = *(_DWORD *)v45;
        *((_WORD *)a1 + 2) = v46;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015D928);
        }
        uint64_t v18 = qword_100162428;
        if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
          return 0LL;
        }
        int v19 = *a1;
        int v20 = a1[1];
        int v21 = a1[2];
        int v22 = a1[3];
        int v23 = a1[4];
        int v24 = a1[5];
        *(_DWORD *)stat buf = 136316674;
        int v58 = v16;
        __int16 v59 = 1024;
        int v60 = v19;
        __int16 v61 = 1024;
        int v62 = v20;
        __int16 v63 = 1024;
        int v64 = v21;
        __int16 v65 = 1024;
        int v66 = v22;
        __int16 v67 = 1024;
        int v68 = v23;
        __int16 v69 = 1024;
        int v70 = v24;
        CFRange v12 = "XPC Device address (%s) %02x:%02x:%02x:%02x:%02x:%02x";
        CFRange v13 = (os_log_s *)v18;
        goto LABEL_20;
      }
    }

    uint64_t v5 = sub_100024084("bluetooth", (uint64_t)a1);
    if ((_DWORD)v5)
    {
      bzero(buf, 0x400uLL);
      size_t v44 = 1024LL;
      int v25 = sysctlbyname("kern.bootargs", buf, &v44, 0LL, 0LL);
      if (v25)
      {
        int v26 = v25;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015D9E8);
        }
        uint64_t v27 = qword_100162428;
        if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        *(_DWORD *)unsigned __int16 v45 = 67109120;
        int v46 = v26;
        int v28 = "did not find bootargs sysctlbyname returned %d";
        __int16 v29 = (os_log_s *)v27;
        uint32_t v30 = 8;
      }

      else
      {
        uint64_t v32 = strtok((char *)buf, " ");
        if (v32)
        {
          uint64_t v33 = v32;
          while (!strstr(v33, "wlan.debug.generate-mac"))
          {
            if (strstr(v33, "wlan.factory"))
            {
              uint64_t v34 = strchr(v33, 61);
              if ((strtol(v34 + 1, 0LL, 16) & 4) != 0) {
                break;
              }
            }

            uint64_t v33 = strtok(0LL, " ");
            if (!v33) {
              goto LABEL_36;
            }
          }

          for (uint64_t i = 0LL; i != 6; ++i)
            a1[i] = arc4random_uniform(0xFFu);
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015D968);
          }
          uint64_t v37 = qword_100162428;
          if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
            return v5;
          }
          int v38 = *a1;
          int v39 = a1[1];
          int v40 = a1[2];
          int v41 = a1[3];
          int v42 = a1[4];
          int v43 = a1[5];
          *(_DWORD *)unsigned __int16 v45 = 67110400;
          int v46 = v38;
          __int16 v47 = 1024;
          int v48 = v39;
          __int16 v49 = 1024;
          int v50 = v40;
          __int16 v51 = 1024;
          int v52 = v41;
          __int16 v53 = 1024;
          int v54 = v42;
          __int16 v55 = 1024;
          int v56 = v43;
          int v28 = "RANDOM address %02x:%02x:%02x:%02x:%02x:%02x";
          __int16 v29 = (os_log_s *)v37;
          uint32_t v30 = 38;
        }

        else
        {
LABEL_36:
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015D9A8);
          }
          uint64_t v35 = qword_100162428;
          if (!os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT)) {
            return v5;
          }
          *(_WORD *)unsigned __int16 v45 = 0;
          int v28 = "did not find bootargs for random address generation";
          __int16 v29 = (os_log_s *)v35;
          uint32_t v30 = 2;
        }
      }

      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, v45, v30);
    }
  }

  return v5;
}

void sub_1000246F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024724(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024754(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024784(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000247B4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000247E4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100024814(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-aci-calibration", a1, a2);
}

uint64_t sub_100024828(const __CFString *a1, UInt8 **a2, _WORD *a3)
{
  int v6 = IOServiceNameMatching("marconi-bt");
  if (!v6) {
    return 6LL;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService)
  {
    int v15 = IOServiceNameMatching("bluetooth");
    if (!v15) {
      return 6LL;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v15);
    if (!MatchingService) {
      return 6LL;
    }
  }

  int v8 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", a1, kCFAllocatorDefault, 1u);
  if (v8)
  {
    int v9 = v8;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v9))
    {
      size_t Length = CFDataGetLength(v9);
      CFIndex v12 = Length;
      if (Length)
      {
        CFRange v13 = (UInt8 *)malloc(Length);
        *a2 = v13;
        v17.location = 0LL;
        v17.length = v12;
        CFDataGetBytes(v9, v17, v13);
      }

      *a3 = v12;
    }

    CFRelease(v9);
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = 6LL;
  }

  IOObjectRelease(MatchingService);
  return v14;
}

uint64_t sub_100024950(UInt8 **a1, _WORD *a2, int a3)
{
  if (a3 == 6)
  {
    uint64_t v5 = @"bluetooth-aci-wbcl-calibration";
    return sub_100024828(v5, a1, a2);
  }

  if (a3 == 7)
  {
    uint64_t v5 = @"bluetooth-aci-bcal-calibration";
    return sub_100024828(v5, a1, a2);
  }

  return 1LL;
}

uint64_t sub_10002498C(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-tx-calibration", a1, a2);
}

uint64_t sub_1000249A0(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-tx-calibration-ext", a1, a2);
}

uint64_t sub_1000249B4(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-rx-calibration", a1, a2);
}

uint64_t sub_1000249C8(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-taurus-calibration", a1, a2);
}

uint64_t sub_1000249DC(UInt8 **a1, _WORD *a2)
{
  return sub_100024828(@"bluetooth-taurus-calibration-bf", a1, a2);
}

uint64_t sub_1000249F0(int a1, uint64_t a2)
{
  if (a1 != 2) {
    goto LABEL_4;
  }
  uint64_t v2 = *(const char **)(a2 + 8);
  if (!strcmp(v2, "on"))
  {
    if (sub_100023E78() == 7
      || sub_100023E78() == 6
      || (v5 = access("/dev/btpoweroff", 0), uint64_t result = 0LL, !v5))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DA68);
      }
      int v6 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109634;
        *(_DWORD *)uint64_t v14 = sub_100023E78();
        *(_WORD *)&v14[4] = 1024;
        *(_DWORD *)&v14[6] = access("/dev/btpoweroff", 0);
        __int16 v15 = 2080;
        io_service_t v16 = "bluetool_command_power";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ready to power on with HCI transport %d, access powerOff %d from %s",  (uint8_t *)&v13,  0x18u);
      }

      sub_100025A0C();
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DAA8);
      }
      int v7 = (os_log_s *)qword_100162428;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0LL;
      if (v8)
      {
        int v13 = 136315138;
        *(void *)uint64_t v14 = "bluetool_command_power";
        int v9 = "bluetooth power is now ON in %s";
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
        return 0LL;
      }
    }
  }

  else
  {
    if (strcmp(v2, "off"))
    {
LABEL_4:
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DA28);
      }
      timeval v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D16C(v3);
      }
      return 1LL;
    }

    if (sub_100023E78() == 7
      || sub_100023E78() == 6
      || (int v10 = access("/dev/btpoweroff", 0), result = 0LL, !v10))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DAE8);
      }
      int v11 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109634;
        *(_DWORD *)uint64_t v14 = sub_100023E78();
        *(_WORD *)&v14[4] = 1024;
        *(_DWORD *)&v14[6] = access("/dev/btpoweroff", 0);
        __int16 v15 = 2080;
        io_service_t v16 = "bluetool_command_power";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ready to power off with HCI transport %d, access powerOff %d from %s",  (uint8_t *)&v13,  0x18u);
      }

      sub_100025BD8();
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DB28);
      }
      int v7 = (os_log_s *)qword_100162428;
      BOOL v12 = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0LL;
      if (v12)
      {
        int v13 = 136315138;
        *(void *)uint64_t v14 = "bluetool_command_power";
        int v9 = "bluetooth power is now OFF in %s";
        goto LABEL_32;
      }
    }
  }

  return result;
}

void sub_100024D98(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024DC8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024DF8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024E28(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100024E58(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100024E88(int a1, uint64_t a2)
{
  timeval v3 = *(const char **)(a2 + 8);
  if (!v3) {
    goto LABEL_6;
  }
  if (!strcmp(*(const char **)(a2 + 8), "on"))
  {
    if (!access("/dev/btpoweroff", 0)) {
      sub_100025BD8();
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DBA8);
    }
    uint64_t v8 = qword_100162428;
    uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result) {
      return result;
    }
    LOWORD(v17[0]) = 0;
    int v9 = "bluetooth reset is now ON";
LABEL_26:
    int v10 = (os_log_s *)v8;
    uint32_t v11 = 2;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)v17, v11);
    return 0LL;
  }

  if (!strcmp(v3, "off"))
  {
    if (!access("/dev/btpoweroff", 0)) {
      sub_100025A0C();
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DBE8);
    }
    uint64_t v8 = qword_100162428;
    uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result) {
      return result;
    }
    LOWORD(v17[0]) = 0;
    int v9 = "bluetooth reset is now OFF";
    goto LABEL_26;
  }

  if (strcmp(v3, "pulse"))
  {
LABEL_6:
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DB68);
    }
    int v5 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "usage: reset [on|off|pulse ms]",  (uint8_t *)v17,  2u);
    }

    int v6 = *(const char **)(a2 + 8);
    if (!v6) {
      return 1LL;
    }
    uint64_t result = strcmp(v6, "-h");
    if ((_DWORD)result) {
      return 1LL;
    }
    return result;
  }

  if (a1 != 3) {
    return 0LL;
  }
  int v12 = strtoul(*(const char **)(a2 + 16), 0LL, 0);
  int v13 = access("/dev/btpoweroff", 0);
  uint64_t result = 0LL;
  if (!v13)
  {
    sub_100025BD8();
    if (v12)
    {
      if (v12 <= 10) {
        useconds_t v14 = 0;
      }
      else {
        useconds_t v14 = 1000 * v12 - 10000;
      }
      usleep(v14);
    }

    sub_100025A0C();
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DC28);
    }
    uint64_t v15 = qword_100162428;
    uint64_t result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
    if ((_DWORD)result)
    {
      if (v12 <= 10) {
        int v16 = 10;
      }
      else {
        int v16 = v12;
      }
      v17[0] = 67109120;
      v17[1] = v16;
      int v9 = "bluetooth reset was pulsed %d ms";
      int v10 = (os_log_s *)v15;
      uint32_t v11 = 8;
      goto LABEL_27;
    }
  }

  return result;
}

void sub_1000251AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000251DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10002520C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10002523C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

BOOL sub_10002526C(int a1, uint64_t a2)
{
  uint64_t v4 = *(const char **)(a2 + 8);
  if ((a1 - 4) <= 0xFFFFFFFD && strcmp(v4, "on") && strcmp(v4, "off") && strcmp(v4, "pulse"))
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DC68);
    }
    int v5 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "usage: wake [on|off|pulse ms]",  (uint8_t *)v13,  2u);
    }

    return strcmp(*(const char **)(a2 + 8), "-h") != 0;
  }

  if (!strcmp(v4, "on"))
  {
    sub_100025528();
    return 0LL;
  }

  if (!strcmp(v4, "off"))
  {
    sub_1000255CC();
    return 0LL;
  }

  int v7 = strcmp(v4, "pulse");
  BOOL result = 0LL;
  if (a1 != 3 || v7) {
    return result;
  }
  int v8 = strtoul(*(const char **)(a2 + 16), 0LL, 0);
  if (dword_100160A34 != -1) {
    close(dword_100160A34);
  }
  int v9 = open("/dev/btwake", 0);
  dword_100160A34 = v9;
  if (v9 == -1) {
    return 0LL;
  }
  if (v8)
  {
    if (v8 <= 10) {
      useconds_t v10 = 0;
    }
    else {
      useconds_t v10 = 1000 * v8 - 10000;
    }
    usleep(v10);
    int v9 = dword_100160A34;
  }

  close(v9);
  dword_100160A34 = -1;
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015DCA8);
  }
  uint32_t v11 = (os_log_s *)qword_100162428;
  BOOL result = os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO);
  if (result)
  {
    if (v8 <= 10) {
      int v12 = 10;
    }
    else {
      int v12 = v8;
    }
    v13[0] = 67109120;
    v13[1] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "bluetooth wake was pulsed %d ms",  (uint8_t *)v13,  8u);
    return 0LL;
  }

  return result;
}

void sub_1000254F8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025528()
{
  if (sub_100023E78() != 7 && dword_100160A34 == -1)
  {
    dword_100160A34 = open("/dev/btwake", 0);
    if (dword_100160A34 == -1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DD28);
      }
      uint64_t v0 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D1A8(v0);
      }
    }
  }

void sub_1000255CC()
{
  if (sub_100023E78() == 7)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DD68);
    }
    uint64_t v0 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D220(v0);
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DDA8);
    }
    unint64_t v1 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      int v5 = "bluetool_wake_off";
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "non-PCIE transport in %s",  (uint8_t *)&v4,  0xCu);
    }

    if (dword_100160A34 != -1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DDE8);
      }
      uint64_t v2 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315138;
        int v5 = "bluetool_wake_off";
        _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "ready to close wake file descriptor from %s",  (uint8_t *)&v4,  0xCu);
      }

      close(dword_100160A34);
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DE28);
      }
      timeval v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315138;
        int v5 = "bluetool_wake_off";
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Wake file descriptor is closed from %s",  (uint8_t *)&v4,  0xCu);
      }

      dword_100160A34 = -1;
    }
  }

void sub_1000257F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025820()
{
  if (dword_100160A38 == -1)
  {
    dword_100160A38 = open("/dev/btreset", 0);
    if (dword_100160A38 == -1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DCE8);
      }
      uint64_t v0 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D2A0(v0);
      }
    }
  }

void sub_1000258B8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_1000258E8()
{
  uint64_t result = dword_100160A38;
  if (dword_100160A38 != -1)
  {
    uint64_t result = close(dword_100160A38);
    dword_100160A38 = -1;
  }

  return result;
}

void sub_10002591C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10002594C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_10002597C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000259AC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000259DC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025A0C()
{
  if (sub_100023E78() == 7)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DE68);
    }
    uint64_t v0 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "command_regon_power_on";
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "PCIE transport and return direclty from %s",  (uint8_t *)&v5,  0xCu);
    }
  }

  else if (sub_100023E78() == 6)
  {
    int v1 = sub_10001BA90();
    if (v1)
    {
      int v2 = v1;
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DEA8);
      }
      timeval v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D318(v2, v3, v4);
      }
    }
  }

  else if (dword_100160A3C != -1)
  {
    close(dword_100160A3C);
    dword_100160A3C = -1;
  }

void sub_100025B78(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025BA8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025BD8()
{
  if (sub_100023E78() == 7)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DEE8);
    }
    uint64_t v0 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "command_regon_power_off";
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "PCIE transport and ready to call pcie_flr from %s",  (uint8_t *)&v6,  0xCu);
    }

    sub_100005334();
  }

  else if (sub_100023E78() == 6)
  {
    int v1 = sub_10001BD08();
    if (v1)
    {
      int v2 = v1;
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DF28);
      }
      timeval v3 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D380(v2, v3, v4);
      }
    }
  }

  else if (dword_100160A3C == -1)
  {
    dword_100160A3C = open("/dev/btpoweroff", 0);
    if (dword_100160A3C == -1)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015DF68);
      }
      int v5 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D3E8(v5);
      }
    }
  }

void sub_100025DAC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025DDC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100025E0C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

  ;
}

int *sub_100025E48()
{
  return __error();
}

uint64_t sub_100025E54()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015DFA8);
  }
  uint64_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    *(void *)&uint8_t buf[4] = "int getManufacturer()";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t result = dword_100160A40;
  if ((dword_100160A40 - 1) >= 0xFFFFFFFE)
  {
    int v2 = 1634758764;
    int v21 = 1737149739;
    __int128 v20 = xmmword_10014F3E0;
    if ((MGIsDeviceOneOfType(&v20) & 1) == 0)
    {
      int v19 = -1918230744;
      __int128 v18 = xmmword_10014F3F4;
      if ((MGIsDeviceOneOfType(&v18) & 1) == 0)
      {
        int v17 = -584398440;
        __int128 v16 = xmmword_10014F408;
        if ((MGIsDeviceOneOfType(&v16) & 1) == 0)
        {
          int v15 = -879476163;
          __int128 v14 = xmmword_10014F41C;
          if ((MGIsDeviceOneOfType(&v14) & 1) == 0)
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015E4A8);
            }
            timeval v3 = (os_log_s *)qword_100162428;
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 136315138;
              *(void *)&uint8_t buf[4] = "int _getManufacturerFromString(void)";
              _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }

            int v2 = dword_100160A44;
            if (dword_100160A44 == -1)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015E4E8);
              }
              uint64_t v4 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)stat buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "MGCopyAnswer kMGQWifiVendor",  buf,  2u);
              }

              int v5 = (const __CFString *)MGCopyAnswer(@"WifiVendor", 0LL);
              if (v5)
              {
                int v6 = v5;
                __int128 v24 = 0u;
                __int128 v25 = 0u;
                *(_OWORD *)stat buf = 0u;
                __int128 v23 = 0u;
                CFStringGetCString(v5, (char *)buf, 64LL, 0x8000100u);
                if (qword_100162420 != -1) {
                  dispatch_once(&qword_100162420, &stru_10015E528);
                }
                int v7 = (os_log_s *)qword_100162428;
                if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)int v26 = 136315138;
                  uint64_t v27 = buf;
                  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Translating vendor %s", v26, 0xCu);
                }

                if (buf[0])
                {
                  int v8 = 1836413537;
                  if ((*(_DWORD *)buf != 1634891085 || *(_DWORD *)&buf[3] != 6386785) && *(_DWORD *)buf != 7159126)
                  {
                    int v8 = 544568169;
                    if (*(_DWORD *)buf != 4805461 && *(_DWORD *)buf != 7683414)
                    {
                      int v8 = 1835627635;
                      if (*(void *)buf != 0x696D757374694DLL && *(_DWORD *)buf != 6896982)
                      {
                        int v8 = 1936548719;
                        if ((*(_DWORD *)buf != 1668113747 || *(unsigned __int16 *)&buf[4] != 111)
                          && *(_DWORD *)buf != 7552342)
                        {
                          int v8 = 544498795;
                          if (*(_DWORD *)buf != 4932692 && *(_DWORD *)buf != 7617878)
                          {
                            int v8 = 538997881;
                            BOOL v11 = *(_DWORD *)buf == 2036949332 && *(unsigned __int16 *)&buf[4] == 111;
                            if (!v11 && *(_DWORD *)buf != 7945558)
                            {
                              int v8 = 1937006964;
                              if (*(_DWORD *)buf != 1413567571 || *(unsigned __int16 *)&buf[4] != 83)
                              {
                                if (*(_DWORD *)buf == 6765910) {
                                  int v8 = 1937006964;
                                }
                                else {
                                  int v8 = 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }

                else
                {
                  int v8 = -1;
                }

                dword_100160A44 = v8;
                CFRelease(v6);
              }

              int v2 = dword_100160A44;
            }
          }
        }
      }
    }

    dword_100160A40 = v2;
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015DFE8);
    }
    int v13 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_100160A40;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Manufacturer is %d", buf, 8u);
    }

    return dword_100160A40;
  }

  return result;
}

void sub_10002639C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000263CC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

char *sub_1000263FC()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E028);
  }
  uint64_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 136315138;
    int v15 = "const char *getPlatform(void)";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v1 = &byte_100161F40;
  if (!byte_100161F40)
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E068);
    }
    int v2 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MGCopyAnswer kMGQProductHash", buf, 2u);
    }

    timeval v3 = (const __CFData *)MGCopyAnswer(@"ProductHash", 0LL);
    if (v3)
    {
      uint64_t v4 = v3;
      if (CFDataGetLength(v3) == 20)
      {
        BytePtr = CFDataGetBytePtr(v4);
        int v1 = &byte_100161F40;
        snprintf( &byte_100161F40,  0x29uLL,  "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  *BytePtr,  BytePtr[1],  BytePtr[2],  BytePtr[3],  BytePtr[4],  BytePtr[5],  BytePtr[6],  BytePtr[7],  BytePtr[8],  BytePtr[9],  BytePtr[10],  BytePtr[11],  BytePtr[12],  BytePtr[13],  BytePtr[14],  BytePtr[15],  BytePtr[16],  BytePtr[17],  BytePtr[18],  BytePtr[19]);
      }

      else
      {
        int v1 = 0LL;
      }

      CFRelease(v4);
    }

    else
    {
      int v1 = 0LL;
    }

    bzero(buf, 0x400uLL);
    size_t v11 = 1024LL;
    if (!sysctlbyname("kern.bootargs", buf, &v11, 0LL, 0LL))
    {
      int v6 = strtok((char *)buf, " ");
      if (v6)
      {
        int v7 = v6;
        int v8 = "a3b78d354cda3366589b53fc2bdcb21efa7de382";
        while (strcmp(v7, "wifibt-external=0x442514e4"))
        {
          if (!strcmp(v7, "wifibt-external=0x443314e4"))
          {
            int v8 = "0b5de28032edced881d12d36422319da1e86dd70";
            break;
          }

          if (!strcmp(v7, "wifibt-external=0x443414e4"))
          {
            int v8 = "b90333f064aafba4574548dd274f8532f0fae21d";
            break;
          }

          int v7 = strtok(0LL, " ");
          if (!v7) {
            goto LABEL_27;
          }
        }

        int v1 = &byte_100161F40;
        __strlcpy_chk(&byte_100161F40, v8, 41LL, 41LL);
      }
    }

void sub_100026794(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000267C4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000267F4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

char *sub_100026824()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E0E8);
  }
  uint64_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "const char *getSKU(void)";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E128);
    }
  }

  int v1 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "MGCopyAnswer WSKU", (uint8_t *)&v8, 2u);
  }

  int v2 = (const __CFData *)MGCopyAnswer(@"WSKU", 0LL);
  if (v2)
  {
    timeval v3 = v2;
    if (CFDataGetLength(v2) == 16)
    {
      BytePtr = CFDataGetBytePtr(v3);
      byte_100161F69 = BytePtr[8];
      *(_WORD *)algn_100161F6A = *(_WORD *)(BytePtr + 9);
      byte_100161F6C = 0;
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E168);
      }
      int v5 = (os_log_s *)qword_100162428;
      int v6 = &byte_100161F69;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        int v9 = &byte_100161F69;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SKU is: %s", (uint8_t *)&v8, 0xCu);
      }
    }

    else
    {
      int v6 = 0LL;
    }

    CFRelease(v3);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E1A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D460();
    }
    return 0LL;
  }

  return v6;
}

void sub_100026A78(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100026AA8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100026AD8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100026B08(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

uint64_t sub_100026B38()
{
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E1E8);
  }
  uint64_t v0 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = "const char *getChipset(void)";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)buf, 0xCu);
  }

  unsigned __int16 v15 = 0;
  char v14 = 0;
  __int16 v13 = 0;
  char v12 = 0;
  unsigned __int16 v11 = 0;
  memset(buf, 0, 255);
  int v1 = (const char *)qword_100161F70;
  if (!qword_100161F70)
  {
    if (sub_100023E78() == 7)
    {
      if (qword_100161F88 != -1) {
        dispatch_once(&qword_100161F88, &stru_10015E228);
      }
      return qword_100161F70;
    }

    if (sub_100023E78() == 6)
    {
      int v25 = 1737149739;
      __int128 v24 = xmmword_10014F3E0;
      int v23 = -1918230744;
      __int128 v22 = xmmword_10014F3F4;
      int v1 = "APPLE_M2_5";
      int v21 = -584398440;
      __int128 v20 = xmmword_10014F408;
      int v19 = -879476163;
      __int128 v18 = xmmword_10014F41C;
      if (MGIsDeviceOneOfType(&v18))
      {
        qword_100161F70 = (uint64_t)"APPLE_M2_5";
        return (uint64_t)v1;
      }

      int v1 = (const char *)qword_100161F70;
      if (qword_100161F70) {
        return (uint64_t)v1;
      }
    }

    uint64_t v2 = sub_10001A1A4(&v15, &v14, &v13, &v12, &v11, 0);
    if ((_DWORD)v2) {
      return 0LL;
    }
    uint64_t v4 = "ALL";
    if (v15 > 0xEu)
    {
      if (v15 == 15)
      {
        if (v11 <= 0x420Du)
        {
          if (v11 <= 0x4108u)
          {
            if (v11 > 0x2201u)
            {
              if (v11 == 8706)
              {
                uint64_t v4 = "BCM4330A1";
                goto LABEL_36;
              }

              if (v11 == 16643)
              {
                uint64_t v4 = "BCM4330B1";
                goto LABEL_36;
              }
            }

            else
            {
              if (v11 == 8469)
              {
                sub_10001A034(buf, 0LL, 0);
                useconds_t v10 = strstr((const char *)buf, "4364");
                int v6 = "BCM4364A0";
                int v7 = "BCM";
                BOOL v8 = v10 == 0LL;
LABEL_30:
                if (v8) {
                  uint64_t v4 = v7;
                }
                else {
                  uint64_t v4 = v6;
                }
                goto LABEL_36;
              }

              if (v11 == 8472)
              {
                uint64_t v4 = "BCM20710";
                goto LABEL_36;
              }
            }
          }

          else if (v11 <= 0x4112u)
          {
            if (v11 == 16649)
            {
              sub_10001A034(buf, 0LL, 0);
              uint64_t v4 = "BCM43430B0";
              goto LABEL_36;
            }

            if (v11 == 16654)
            {
              uint64_t v4 = "BCM4355B0";
              goto LABEL_36;
            }
          }

          else
          {
            switch(v11)
            {
              case 0x4113u:
                uint64_t v4 = "BCM4330B0";
                goto LABEL_36;
              case 0x4207u:
                uint64_t v4 = "BCM4355B2";
                goto LABEL_36;
              case 0x420Au:
                uint64_t v4 = "BCM43430B1";
                goto LABEL_36;
            }
          }
        }

        else if (v11 > 0x610Cu)
        {
          if (v11 <= 0x6213u)
          {
            if (v11 == 24845)
            {
              uint64_t v4 = "BCM4329C0";
              goto LABEL_36;
            }

            if (v11 == 25094)
            {
              uint64_t v4 = "BCM43452A2";
              goto LABEL_36;
            }
          }

          else
          {
            switch(v11)
            {
              case 0x6214u:
                uint64_t v4 = "BCM4355C1";
                goto LABEL_36;
              case 0x6607u:
                uint64_t v4 = "BCM4350C5";
                goto LABEL_36;
              case 0x8107u:
                uint64_t v4 = "BCM4325";
                goto LABEL_36;
            }
          }
        }

        else if (v11 <= 0x4309u)
        {
          if (v11 == 16910)
          {
            uint64_t v4 = "BCM4357B1";
            goto LABEL_36;
          }

          if (v11 == 16919)
          {
            uint64_t v4 = "BCM4329B1";
            goto LABEL_36;
          }
        }

        else
        {
          switch(v11)
          {
            case 0x430Au:
              uint64_t v4 = "BCM4355B3";
              goto LABEL_36;
            case 0x6103u:
              uint64_t v4 = "BCM4355C0";
              goto LABEL_36;
            case 0x610Cu:
              uint64_t v4 = "BCM4350C2";
              goto LABEL_36;
          }
        }

        uint64_t v4 = "BCM";
        goto LABEL_36;
      }

      if (v15 != 76) {
        goto LABEL_36;
      }
    }

    else
    {
      if (v15 == 10)
      {
        if (v11 == 4841) {
          uint64_t v4 = "BC6";
        }
        else {
          uint64_t v4 = "CSR";
        }
        goto LABEL_36;
      }

      if (v15 != 13)
      {
LABEL_36:
        qword_100161F70 = (uint64_t)v4;
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015E468);
        }
        int v9 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v16 = 136315138;
          uint64_t v17 = qword_100161F70;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Chip is %s", v16, 0xCu);
        }

        return qword_100161F70;
      }
    }

    int v5 = sub_10000BD0C(v2);
    int v6 = "ACIBGA";
    int v7 = "ACIFPGA";
    BOOL v8 = v5 == 0;
    goto LABEL_30;
  }

  return (uint64_t)v1;
}

void sub_100027140(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027170(id a1)
{
  CFMutableDictionaryRef v1 = IOServiceNameMatching("AppleOLYHAL");
  if (!v1)
  {
LABEL_15:
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E428);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D48C();
    }
    return;
  }

  uint64_t v2 = v1;
  while (1)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
    if (!MatchingService)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E3E8);
      }
      int v7 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No AppleOLYHAL service. Retrying...\n",  buf,  2u);
      }

      goto LABEL_14;
    }

    io_object_t v4 = MatchingService;
    int v5 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"HWIdentifiers",  kCFAllocatorDefault,  1u);
    if (v5) {
      break;
    }
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E3A8);
    }
    int v6 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No HWIdentifiers property. Retrying...\n",  buf,  2u);
    }

    IOObjectRelease(v4);
LABEL_14:
    usleep(0x7A120u);
    uint64_t v2 = IOServiceNameMatching("AppleOLYHAL");
    if (!v2) {
      goto LABEL_15;
    }
  }

  BOOL v8 = v5;
  Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"C");
  uint64_t valuePtr = 0LL;
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
    if (valuePtr == 276347) {
      uint64_t valuePtr = 4377LL;
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E268);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D598();
    }
  }

  useconds_t v10 = (const __CFString *)CFDictionaryGetValue(v8, @"s");
  char v14 = 0;
  *(_WORD *)buffer = 0;
  if (v10)
  {
    CFStringGetCString(v10, buffer, 3LL, 0x8000100u);
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E2A8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D56C();
    }
  }

  if (valuePtr && buffer[0])
  {
    if ((snprintf(byte_100161F78, 0x10uLL, "BCM%llu%s", valuePtr, buffer) - 1) > 0xE)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E328);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D4B8();
      }
    }

    else
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E2E8);
      }
      unsigned __int16 v11 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 136315138;
        uint64_t v17 = byte_100161F78;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Generated chipset string of %s from HWIdentifiers\n",  buf,  0xCu);
      }

      qword_100161F70 = (uint64_t)byte_100161F78;
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E368);
    }
    char v12 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D4E4(&valuePtr, (uint64_t)buffer, v12);
    }
  }

  CFRelease(v8);
  IOObjectRelease(v4);
}

void sub_1000275D0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027600(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027630(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027660(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027690(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000276C0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000276F0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027720(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027750(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100027780(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000277B0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000277E0(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void *sub_100027810()
{
  return &unk_100162430;
}

unint64_t sub_10002781C()
{
  if (!dword_100161F94)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_100161F90);
    uint64_t v0 = dword_100161F94;
    uint64_t v1 = dword_100161F90;
    while ((_DWORD)v1)
    {
      if (v1 > v0)
      {
        uint64_t v2 = v1 % v0;
        uint64_t v1 = v0;
        uint64_t v0 = v2;
      }

      uint64_t v3 = v0;
      uint64_t v0 = v1;
      BOOL v4 = (_DWORD)v3 == (_DWORD)v1;
      uint64_t v1 = v3;
      if (v4)
      {
        LODWORD(v0) = 1;
        break;
      }
    }

    dword_100161F90 /= v0;
    dword_100161F94 = 1000000 * (dword_100161F94 / v0);
  }

  uint64_t v5 = mach_continuous_time();
  if (dword_100161F94) {
    return v5 * dword_100161F90 / dword_100161F94;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000278CC()
{
  mach_service = xpc_connection_create_mach_service("com.apple.BlueTool", &_dispatch_main_q, 1uLL);
  if (!mach_service) {
    return 4LL;
  }
  uint64_t v1 = mach_service;
  xpc_connection_set_event_handler(mach_service, &stru_10015E568);
  xpc_connection_resume(v1);
  CFRunLoopRun();
  return 0LL;
}

void sub_100027928(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue((xpc_connection_t)a2, &_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_100027AAC;
    handler[3] = &unk_10015E588;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(a2, _xpc_error_key_description);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E5C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D5C4();
    }
  }

  else
  {
    BOOL v4 = xpc_copy_description(a2);
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E608);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D628();
    }
    free(v4);
  }

void sub_100027AAC(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(_xpc_connection_s **)(a1 + 32);
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (object != &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E688);
      }
      int v6 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
        sub_10002D884(object, v6);
      }
    }

    return;
  }

  string = xpc_dictionary_get_string(object, "kMsgId");
  if (strcmp(string, "RunExternalScript"))
  {
    if (strcmp(string, "RunBuiltinScript"))
    {
      if (strcmp(string, "RunCommand")) {
        abort();
      }
      BOOL v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
      dispatch_time_t v9 = dispatch_time(0LL, 30000000000LL);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_source_set_event_handler(v8, &stru_10015E748);
      dispatch_resume(v8);
      xpc_object_t value = xpc_dictionary_get_value(object, "kMsgArgs");
      *(void *)uint64_t v75 = 0LL;
      xpc_object_t v11 = xpc_dictionary_get_value(value, "command");
      if (v11)
      {
        char v12 = v11;
        if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_string)
        {
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015EDC8);
          }
          __int16 v13 = (os_log_s *)qword_100162428;
          int v14 = 1;
          if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)stat buf = 0;
            int v14 = 1;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Param is not a string", buf, 2u);
          }

          unsigned __int16 v15 = 0LL;
          int v16 = 0;
          goto LABEL_102;
        }

        string_ptr = xpc_string_get_string_ptr(v12);
        if (string_ptr)
        {
          int v28 = strdup(string_ptr);
          __int16 v29 = strtok(v28, "\n");
          int v16 = 0;
          unsigned __int16 v15 = 0LL;
          if (v29)
          {
            do
            {
              *(void *)uint64_t v75 = 0LL;
              int v14 = sub_10001D150(v29, (uint64_t)v75);
              if (*(void *)v75)
              {
                size_t v30 = strlen(*(const char **)v75);
                __int16 v31 = (char *)reallocf(v15, v30 + v16 + 1);
                unsigned __int16 v15 = v31;
                if (v31)
                {
                  memcpy(&v31[v16], *(const void **)v75, v30);
                  int v32 = v16 + v30;
                  v16 += v30 + 1;
                  v15[v32] = 10;
                }

                else
                {
                  if (qword_100162420 != -1) {
                    dispatch_once(&qword_100162420, &stru_10015EE48);
                  }
                  uint64_t v33 = (os_log_s *)qword_100162428;
                  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
                    sub_10002D848(buf, &buf[1], v33);
                  }
                  int v16 = 0;
                  int v14 = 1;
                }

                free(*(void **)v75);
              }

              if (v14) {
                break;
              }
              __int16 v29 = strtok(0LL, "\n");
            }

            while (v29);
            if (v16) {
              v15[v16 - 1] = 0;
            }
          }

          else
          {
            int v14 = 1;
          }

          free(v28);
          goto LABEL_102;
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015EE08);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
          sub_10002D6B8();
        }
      }

      else
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015ED88);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
          sub_10002D68C();
        }
      }

      unsigned __int16 v15 = 0LL;
      int v16 = 0;
      int v14 = 1;
LABEL_102:
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      xpc_dictionary_set_int64(reply, "result", v14);
      if (v15 && v16) {
        xpc_dictionary_set_string(reply, "output", v15);
      }
      xpc_connection_send_message(v3, reply);
      xpc_release(reply);
      if (v15) {
        free(v15);
      }
      goto LABEL_107;
    }

    xpc_object_t v21 = xpc_dictionary_get_value(object, "kMsgArgs");
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E888);
    }
    __int128 v22 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Running xpcRunBuiltinScript", v75, 2u);
    }

    xpc_object_t v23 = xpc_dictionary_get_value(v21, "script");
    if (v23)
    {
      __int128 v24 = v23;
      if (xpc_get_type(v23) == (xpc_type_t)&_xpc_type_string)
      {
        int v42 = xpc_string_get_string_ptr(v24);
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015E948);
        }
        int v43 = (os_log_s *)qword_100162428;
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v75 = 136315650;
          *(void *)&v75[4] = v42;
          __int16 v76 = 2080;
          *(void *)__int128 v77 = "xpcRunBuiltinScript";
          *(_WORD *)&v77[8] = 2080;
          __int128 v78 = "01:48:40";
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "get arg = %s from %s at %s", v75, 0x20u);
        }

        if (v42)
        {
          int v44 = strncmp(v42, "boot", 5uLL);
          if (v44)
          {
            if (!strncmp(v42, "init", 5uLL))
            {
              BOOL v46 = 0;
              int v47 = 2;
            }

            else
            {
              int v45 = strncmp(v42, "deepsleep", 0xAuLL);
              BOOL v46 = v45 != 0;
              if (v45) {
                int v47 = 0;
              }
              else {
                int v47 = 3;
              }
            }
          }

          else
          {
            BOOL v46 = 0;
            int v47 = 1;
          }

          int v73 = v47;
          xpc_object_t v50 = xpc_dictionary_get_value(v21, "btaddress");
          if (v50)
          {
            __int16 v51 = v50;
            if (xpc_get_type(v50) == (xpc_type_t)&_xpc_type_string)
            {
              int v52 = xpc_string_get_string_ptr(v51);
              strlen(v52);
              __memcpy_chk(&unk_100162430);
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015E9C8);
              }
              __int16 v53 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = &unk_100162430;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "xpc address %s", v75, 0xCu);
              }
            }

            else
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EA08);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
                sub_10002D81C();
              }
            }
          }

          else
          {
            if (qword_100162420 != -1) {
              dispatch_once(&qword_100162420, &stru_10015EA48);
            }
            if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
              sub_10002D7F0();
            }
          }

          if (!v46)
          {
            int v54 = sub_100023E78();
            if (v44) {
              BOOL v55 = 0;
            }
            else {
              BOOL v55 = v54 == 7;
            }
            int v56 = v55;
            __int16 v57 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
            dispatch_time_t v58 = dispatch_time(0LL, 30000000000LL);
            dispatch_source_set_timer(v57, v58, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            dispatch_source_set_event_handler(v57, &stru_10015EA88);
            dispatch_resume(v57);
            if (byte_100161F98 == 1)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EB08);
              }
              __int16 v59 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s script powercycling entire wifi/BT chip",  v75,  0xCu);
              }

              int v60 = sub_1000056C0();
              if (v60)
              {
                int v35 = v60;
                if (qword_100162420 != -1) {
                  dispatch_once(&qword_100162420, &stru_10015EB48);
                }
                if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                  sub_10002D78C();
                }
                dispatch_source_cancel(v57);
                dispatch_release(v57);
                goto LABEL_187;
              }

              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EB88);
              }
              __int16 v61 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = "xpcRunBuiltinScript";
                _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "succeed from calling pcie_powercycle in %s",  v75,  0xCu);
                byte_100161F98 = 0;
                if (qword_100162420 != -1) {
                  dispatch_once(&qword_100162420, &stru_10015EBC8);
                }
              }

              else
              {
                byte_100161F98 = 0;
              }

              int v62 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = "xpcRunBuiltinScript";
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "changed variable pendingPCIEPowerCycle to be false in %s",  v75,  0xCu);
              }
            }

            source = v57;
            int v71 = v44;
            int v72 = v42;
            int v63 = 0;
            if (v56) {
              int v64 = 2;
            }
            else {
              int v64 = 1;
            }
            do
            {
              unint64_t v65 = sub_10002781C();
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EC08);
              }
              int v66 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = "xpcRunBuiltinScript";
                _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "right before calling runCommandForCurrentConfig from %s",  v75,  0xCu);
              }

              int v35 = sub_10001743C(v73);
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EC48);
              }
              __int16 v67 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136315138;
                *(void *)&v75[4] = "xpcRunBuiltinScript";
                _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "right after calling runCommandForCurrentConfig from %s",  v75,  0xCu);
              }

              unint64_t v68 = sub_10002781C();
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015EC88);
              }
              __int16 v69 = (os_log_s *)qword_100162428;
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v75 = 136316162;
                *(void *)&v75[4] = v72;
                __int16 v76 = 1024;
                *(_DWORD *)__int128 v77 = v63 + 1;
                *(_WORD *)&v77[4] = 1024;
                *(_DWORD *)&v77[6] = v64;
                LOWORD(v78) = 1024;
                *(_DWORD *)((char *)&v78 + 2) = v35;
                HIWORD(v78) = 2048;
                unint64_t v79 = v68 - v65;
                _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%s script attempt %u of %u: result %d execution time:%llu(MS)",  v75,  0x28u);
              }

              if (!v35) {
                break;
              }
              usleep(0x7A120u);
              ++v63;
            }

            while (v64 != v63);
            dispatch_source_cancel(source);
            dispatch_release(source);
            if (!v71 && v35 && sub_100023E78() == 7)
            {
              if (qword_100162420 != -1) {
                dispatch_once(&qword_100162420, &stru_10015ECC8);
              }
              if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
                sub_10002D710();
              }
              byte_100161F98 = 1;
            }

            goto LABEL_187;
          }

          int v35 = 1;
LABEL_187:
          if (qword_100162420 != -1) {
            dispatch_once(&qword_100162420, &stru_10015ED08);
          }
          goto LABEL_68;
        }

        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015E988);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG))
        {
          sub_10002D6B8();
          goto LABEL_153;
        }
      }

      else
      {
        if (qword_100162420 != -1) {
          dispatch_once(&qword_100162420, &stru_10015E908);
        }
        if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG))
        {
          sub_10002D6E4();
LABEL_153:
          int v35 = 1;
          goto LABEL_187;
        }
      }
    }

    else
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E8C8);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
      {
        sub_10002D68C();
        goto LABEL_153;
      }
    }

    int v35 = 1;
LABEL_68:
    uint64_t v36 = (os_log_s *)qword_100162428;
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v75 = 67109120;
      *(_DWORD *)&v75[4] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "builtin script completed with result %d",  v75,  8u);
    }

    xpc_object_t v37 = xpc_dictionary_create_reply(object);
    xpc_dictionary_set_int64(v37, "result", v35);
    int v38 = sub_100025E54();
    xpc_dictionary_set_int64(v37, "manufacturer", v38);
    int v39 = (const char *)sub_100018CCC();
    if (v39) {
      int v40 = v39;
    }
    else {
      int v40 = (const char *)&unk_100150C1E;
    }
    if (*v40 && MGGetBoolAnswer(@"InternalBuild"))
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015ED48);
      }
      int v41 = (os_log_s *)qword_100162428;
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v75 = 136315138;
        *(void *)&v75[4] = v40;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Firmware is %s", v75, 0xCu);
      }
    }

    xpc_dictionary_set_string(v37, "firmware", v40);
    xpc_connection_send_message(v3, v37);
    xpc_release(v37);
    goto LABEL_108;
  }

  BOOL v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
  dispatch_time_t v17 = dispatch_time(0LL, 30000000000LL);
  dispatch_source_set_timer(v8, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v8, &stru_10015E6C8);
  dispatch_resume(v8);
  xpc_object_t v18 = xpc_dictionary_get_value(object, "kMsgArgs");
  xpc_object_t v19 = xpc_dictionary_get_value(v18, "script");
  if (v19)
  {
    __int128 v20 = v19;
    if (xpc_get_type(v19) == (xpc_type_t)&_xpc_type_string)
    {
      uint64_t v34 = xpc_string_get_string_ptr(v20);
      if (v34)
      {
        int64_t v25 = (int)sub_10001D578(v34);
        goto LABEL_47;
      }

      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E848);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
        sub_10002D6B8();
      }
    }

    else
    {
      if (qword_100162420 != -1) {
        dispatch_once(&qword_100162420, &stru_10015E808);
      }
      if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEBUG)) {
        sub_10002D6E4();
      }
    }
  }

  else
  {
    if (qword_100162420 != -1) {
      dispatch_once(&qword_100162420, &stru_10015E7C8);
    }
    if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR)) {
      sub_10002D68C();
    }
  }

  int64_t v25 = 1LL;
LABEL_47:
  xpc_object_t v26 = xpc_dictionary_create_reply(object);
  xpc_dictionary_set_int64(v26, "result", v25);
  xpc_connection_send_message(v3, v26);
  xpc_release(v26);
LABEL_107:
  dispatch_source_cancel(v8);
  dispatch_release(v8);
LABEL_108:
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E648);
  }
  __int16 v49 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v75 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Completed handling of dictionary-xpc event",  v75,  2u);
  }

void sub_100028C1C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028C4C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028C7C(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028CAC(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028CDC(id a1)
{
  uint64_t v1 = (void (*)(const char *, uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "WriteStackshotReport_stdc");
  if (v1) {
    v1("BT BlueTool Stuck", 3172327085LL);
  }
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E708);
  }
  uint64_t v2 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "BlueTool timed out! Exiting...", v3, 2u);
  }

  exit(1);
}

void sub_100028D90(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028DC0(id a1)
{
  uint64_t v1 = (void (*)(const char *, uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "WriteStackshotReport_stdc");
  if (v1) {
    v1("BT BlueTool Stuck", 3172327085LL);
  }
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015E788);
  }
  uint64_t v2 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "BlueTool timed out! Exiting...", v3, 2u);
  }

  exit(1);
}

void sub_100028E74(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028EA4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028ED4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028F04(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028F34(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028F64(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028F94(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028FC4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100028FF4(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029024(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029054(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029084(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000290B4(id a1)
{
  uint64_t v1 = (void (*)(const char *, uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "WriteStackshotReport_stdc");
  if (v1) {
    v1("BT BlueTool Stuck", 3172327085LL);
  }
  if (qword_100162420 != -1) {
    dispatch_once(&qword_100162420, &stru_10015EAC8);
  }
  uint64_t v2 = (os_log_s *)qword_100162428;
  if (os_log_type_enabled((os_log_t)qword_100162428, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "BlueTool timed out! Exiting...", v3, 2u);
  }

  exit(1);
}

void sub_100029168(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029198(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000291C8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000291F8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029228(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029258(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029288(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000292B8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000292E8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029318(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029348(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029378(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000293A8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_1000293D8(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029408(id a1)
{
  qword_100162428 = (uint64_t)os_log_create("com.apple.bluetooth", "BlueTool");
}

void sub_100029438( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100029448(os_log_s *a1)
{
  v2[0] = 136315394;
  sub_100008400();
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "PCIe failed to dlopen %s, error: %s\n",  (uint8_t *)v2,  0x16u);
  sub_10000848C();
}

void sub_1000294D4()
{
}

void sub_100029540()
{
}

void sub_1000295AC()
{
}

void sub_100029618()
{
}

void sub_100029684()
{
}

void sub_1000296F0()
{
}

void sub_10002975C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000297CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002983C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000298AC(unsigned __int16 a1, uint64_t a2, os_log_s *a3)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  sub_100008440( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "slot has more data, slotLen: %u, size_in: %zu",  (uint8_t *)v3);
  sub_1000083F0();
}

void sub_100029928()
{
  v2[0] = 136315394;
  sub_10000845C();
  sub_100008440((void *)&_mh_execute_header, v0, v1, "%s: os_channel_sync rx failed - %d", (uint8_t *)v2);
  sub_1000083F0();
}

void sub_100029998()
{
  v2[0] = 136315394;
  sub_10000845C();
  sub_100008440((void *)&_mh_execute_header, v0, v1, "%s: failed to advance slot - %d", (uint8_t *)v2);
  sub_1000083F0();
}

void sub_100029A08()
{
}

void sub_100029A7C()
{
}

void sub_100029AA8()
{
}

void sub_100029B08()
{
}

void sub_100029B68()
{
}

void sub_100029BC8()
{
}

void sub_100029BF4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029C70( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029CE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029D50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029DC0()
{
}

void sub_100029DEC()
{
}

void sub_100029E18()
{
}

void sub_100029E44()
{
}

void sub_100029E70( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029EE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029F50()
{
}

void sub_100029F7C()
{
}

void sub_100029FA8()
{
}

void sub_100029FD4()
{
}

void sub_10002A000()
{
}

void sub_10002A02C()
{
}

void sub_10002A058()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "IOServiceAddMatchingNotification returned 0x%08x",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002A0B8()
{
}

void sub_10002A0E4()
{
}

void sub_10002A110(uint64_t a1, uint64_t a2)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  sub_10000844C();
  sub_100008440( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "PCIe read failed: requested %zu, received %u\n",  (uint8_t *)&v3);
  sub_1000083F0();
}

void sub_10002A184( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A1F4()
{
  int v2 = 136315650;
  int v3 = "skywalk_write_channel";
  sub_10000844C();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s: slot_len: %u, size_in: %zu",  (uint8_t *)&v2,  0x1Cu);
  sub_10000848C();
}

void sub_10002A284( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A2F4()
{
  v2[0] = 136315394;
  sub_10000845C();
  sub_100008440((void *)&_mh_execute_header, v0, v1, "%s: failed to advance slot - %d", (uint8_t *)v2);
  sub_1000083F0();
}

void sub_10002A364()
{
}

void sub_10002A3D8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A448(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "pcie_skywalk_get_hci_event";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: read failed: requested %zu, received %zu",  (uint8_t *)&v4,  0x20u);
  sub_10000848C();
}

void sub_10002A4DC()
{
}

void sub_10002A508()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "INIT failed!!! for the platform- aci_platform=%d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002A568()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "No init script for the platform- aci_platform=%d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002A5C8()
{
}

void sub_10002A600()
{
}

void sub_10002A62C()
{
}

void sub_10002A658()
{
}

void sub_10002A684()
{
}

void sub_10002A6B0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008430( (void *)&_mh_execute_header,  a2,  a3,  "aci_download_power_tables: No HCI command at first byte-0x01, first byte=0x%x",  a5,  a6,  a7,  a8,  0);
  sub_1000083F8();
}

void sub_10002A718()
{
}

void sub_10002A744()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "BOOT failed!!! for the platform- aci_platform=%d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002A7A4()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "No boot script for the platform- aci_platform=%d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002A804( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000083E0((void *)&_mh_execute_header, a1, a3, "Unable to open file path=%s", a5, a6, a7, a8, 2u);
  sub_1000083F0();
}

uint64_t sub_10002A874(unsigned __int16 *a1, unsigned __int8 a2, os_log_t log)
{
  int v3 = *a1;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "manufacturer = %d, aci_platform=%d",  (uint8_t *)v5,  0xEu);
  if (qword_100162420 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_100162420, &stru_100159FC8);
  return 0LL;
}

void sub_10002A934()
{
}

void sub_10002A960()
{
  sub_1000083E0((void *)&_mh_execute_header, v0, v1, "Unable to load HCD, file path=%s", v2, v3, v4, v5, v6);
  sub_1000083F0();
}

void sub_10002A9C0()
{
}

void sub_10002AA20()
{
}

void sub_10002AA4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002AAB8()
{
}

void sub_10002AB24()
{
}

void sub_10002AB50(const char *a1, os_log_s *a2)
{
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "strlen(bdaddr_s) = %lu", v3, 0xCu);
}

void sub_10002ABD4()
{
}

void sub_10002AC34()
{
}

void sub_10002AC60()
{
}

void sub_10002AC8C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008430( (void *)&_mh_execute_header,  a2,  a3,  "No HCI command at first byte-0x01, first byte=0x%x",  a5,  a6,  a7,  a8,  0);
  sub_1000083F8();
}

void sub_10002ACF4()
{
  sub_1000083E0( (void *)&_mh_execute_header,  v0,  v1,  "Can't read HCI command header 4 bytes, from HCD file!!! result=%zd",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F0();
}

void sub_10002AD54()
{
}

void sub_10002AD80()
{
}

void sub_10002ADE4()
{
}

void sub_10002AE10()
{
}

void sub_10002AE74( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002AEDC()
{
}

void sub_10002AF08()
{
}

uint64_t sub_10002AF34()
{
  if (qword_100162420 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_100162420, &stru_10015B4C8);
  return 0LL;
}

void sub_10002AF98()
{
}

void sub_10002AFFC()
{
}

void sub_10002B060()
{
}

void sub_10002B0C0()
{
}

void sub_10002B124()
{
}

void sub_10002B150()
{
}

void sub_10002B17C()
{
}

void sub_10002B1A8(uint8_t *a1, char a2, const char **a3, os_log_s *a4)
{
  if (a2 == 5) {
    uint64_t v4 = "Wrong MSF version";
  }
  else {
    uint64_t v4 = (const char *)&unk_100150C1E;
  }
  *(_DWORD *)a1 = 136315138;
  *a3 = v4;
  sub_1000150DC((void *)&_mh_execute_header, a4, (uint64_t)a3, "CRC error in Cal data %s", a1);
}

void sub_10002B204()
{
}

void sub_10002B230()
{
}

void sub_10002B290()
{
}

void sub_10002B2BC()
{
}

void sub_10002B31C()
{
}

void sub_10002B37C(CFErrorRef *a1, os_log_s *a2)
{
}

void sub_10002B3FC()
{
}

void sub_10002B45C()
{
}

void sub_10002B4BC()
{
}

uint64_t sub_10002B4E8()
{
  if (qword_100162420 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_100162420, &stru_10015B028);
  return 0LL;
}

void sub_10002B558()
{
}

void sub_10002B584()
{
}

void sub_10002B5B0()
{
}

void sub_10002B5DC()
{
}

void sub_10002B608()
{
}

void sub_10002B634()
{
}

void sub_10002B660()
{
}

void sub_10002B68C(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000150D0((void *)&_mh_execute_header, a1, v3, "HCI command is messed up: %d", (uint8_t *)v4);
  sub_1000083F0();
}

void sub_10002B70C()
{
  LODWORD(sub_1000150DC((void *)&_mh_execute_header, v0, v1, "Unable to send command: %zd", v2) = 136315650;
  sub_1000150FC();
  sub_1000150E8((void *)&_mh_execute_header, v0, v1, "%s: expected: %d, returned: %d\n", v2, v3, v4);
  sub_1000083F0();
}

void sub_10002B778()
{
}

void sub_10002B7A4()
{
  LODWORD(sub_1000150DC((void *)&_mh_execute_header, v0, v1, "Unable to send command: %zd", v2) = 136315650;
  sub_1000150FC();
  sub_1000150E8((void *)&_mh_execute_header, v0, v1, "%s: expected: %d, returned: %d\n", v2, v3, v4);
  sub_1000083F0();
}

void sub_10002B810()
{
}

void sub_10002B83C()
{
}

void sub_10002B868()
{
}

void sub_10002B894()
{
  sub_100019E9C((void *)&_mh_execute_header, v0, v1, "Firmware read size error: expected: %d, returned: %d", v2, v3);
  sub_1000083F0();
}

void sub_10002B8F4()
{
}

void sub_10002B920()
{
}

void sub_10002B94C()
{
}

void sub_10002B978()
{
}

void sub_10002B9A4()
{
}

void sub_10002B9D0()
{
}

void sub_10002B9FC()
{
}

void sub_10002BA5C()
{
}

void sub_10002BABC()
{
}

void sub_10002BB1C()
{
}

void sub_10002BB48()
{
}

void sub_10002BB74()
{
}

void sub_10002BBA0()
{
}

void sub_10002BBCC()
{
}

void sub_10002BBF8(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 68157954;
  v3[1] = a2;
  __int16 v4 = 2096;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Raw regulatory data loaded: %.*P",  (uint8_t *)v3,  0x12u);
  sub_1000083F0();
}

void sub_10002BC78()
{
  sub_100019E9C( (void *)&_mh_execute_header,  v0,  v1,  "Regulatory file read size error: expected: %d, returned: %d",  v2,  v3);
  sub_1000083F0();
}

void sub_10002BCD8()
{
}

void sub_10002BD04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BD74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000083E0( (void *)&_mh_execute_header,  a1,  a3,  "Critical: Unable to find default (SKU=NULL) PTB file at %s",  a5,  a6,  a7,  a8,  2u);
  sub_1000083F0();
}

void sub_10002BDE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BE54()
{
}

void sub_10002BEB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BEE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BF1C(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "applebt_io_get_hci_event: retlen %ld is bigger then maxsize %ld, triming...\n",  (uint8_t *)&v4,  0x16u);
}

void sub_10002BFA4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C010( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10002C080(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  v4[0] = 67109632;
  v4[1] = 5;
  __int16 v5 = 1024;
  int v6 = byte_100161EF2 - 1;
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "applebt_io_get_hci_event: seq_num[pipe=%d] mismatch, expected %d received %d\n",  (uint8_t *)v4,  0x14u);
  if (qword_100162420 == -1) {
    return 1LL;
  }
  dispatch_once(&qword_100162420, &stru_10015C0A8);
  return 0LL;
}

void sub_10002C150()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_mgmt_connect: IOServiceOpen returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C1B0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_on: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C210()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_on: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C270()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_off: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C2D0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_off: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C330()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_sleep: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C390()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_power_sleep: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C3F0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_exit_power_sleep: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C450()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_exit_power_sleep: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C4B0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mode: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C510()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mode: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C570()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_level: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C5D0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_level: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C630()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mask: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C690()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_trace_mask: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C6F0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_capture_timeout: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C750()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_set_capture_timeout: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C7B0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_trigger_capture: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C810()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_trigger_capture: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C870()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_general_debug: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C8D0()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_general_debug: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C930()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_read_crash_info: IOConnectCallMethod returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C990()
{
  sub_100008430( (void *)&_mh_execute_header,  v0,  v1,  "applebt_read_crash_info: applebt_mgmt_connect returned 0x%08X\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000083F8();
}

void sub_10002C9F0()
{
  uint64_t v0 = sub_10001FE64();
  sub_10001FE7C(v0);
  sub_10001FE6C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
  sub_10001FE2C();
}

void sub_10002CA68()
{
  uint64_t v0 = sub_10001FE64();
  sub_10001FE7C(v0);
  sub_10001FE4C();
  sub_10001FE38((void *)&_mh_execute_header, v1, v2, "connect(%s) failed (error = %s)", v3, v4, v5, v6, v7);
  sub_10001FE2C();
}

void sub_10002CAD8()
{
  uint64_t v0 = sub_10001FE64();
  sub_10001FE7C(v0);
  sub_10001FE4C();
  sub_10001FE38((void *)&_mh_execute_header, v1, v2, "ioctl(CTLIOCGINFO, %s) failed (error = %s)", v3, v4, v5, v6, v7);
  sub_10001FE2C();
}

void sub_10002CB48()
{
}

void sub_10002CBEC()
{
}

void sub_10002CC70()
{
  sub_100021240( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_open: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10001FE2C();
}

void sub_10002CCD8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008430( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_open: applebt_hci_connect returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_1000083F8();
}

void sub_10002CD3C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008430( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_connect: IOServiceOpen returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_1000083F8();
}

void sub_10002CDA0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008430( (void *)&_mh_execute_header,  a2,  a3,  "applebt_hci_connect: IOServiceAddMatchingNotification returned 0x%08X\n",  a5,  a6,  a7,  a8,  0);
  sub_1000083F8();
}

void sub_10002CE04()
{
  sub_100021240( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_close: IOConnectCallMethod returned (0x%08X, %s), closing connection\n",  v3,  v4,  v5,  v6,  v7);
  sub_10001FE2C();
}

void sub_10002CE6C()
{
}

void sub_10002CE98()
{
  sub_100021240( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_transport_reset: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10001FE2C();
}

void sub_10002CF00()
{
}

void sub_10002CF2C()
{
  sub_100021240( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_write: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10001FE2C();
}

void sub_10002CF94()
{
}

void sub_10002CFC0()
{
  sub_100021240( (void *)&_mh_execute_header,  v1,  v2,  "applebt_hci_read: IOConnectCallMethod returned (0x%08X, %s)\n",  v3,  v4,  v5,  v6,  v7);
  sub_10001FE2C();
}

void sub_10002D028()
{
}

void sub_10002D054()
{
}

void sub_10002D080(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "DeviceTree speed = %d", (uint8_t *)v3, 8u);
}

void sub_10002D0F8(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "transport override from boot-arg is invalid: %llu",  (uint8_t *)&v2,  0xCu);
}

void sub_10002D16C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "usage: power [on|off]", v1, 2u);
  sub_1000083F8();
}

void sub_10002D1A8(os_log_s *a1)
{
  int v2 = *sub_100025E48();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000150D0((void *)&_mh_execute_header, a1, v3, "bluetool: wake failed: error %d", (uint8_t *)v4);
  sub_100025E3C();
}

void sub_10002D220(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "bluetool_wake_off";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "PCIE transport and return direclty without wake_off from %s",  (uint8_t *)&v1,  0xCu);
}

void sub_10002D2A0(os_log_s *a1)
{
  int v2 = *sub_100025E48();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000150D0((void *)&_mh_execute_header, a1, v3, "bluetool: reset failed: error %d", (uint8_t *)v4);
  sub_100025E3C();
}

void sub_10002D318(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000150D0((void *)&_mh_execute_header, a2, a3, "bluetool: power on failed: error 0x%08X", (uint8_t *)v3);
  sub_1000083F8();
}

void sub_10002D380(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000150D0((void *)&_mh_execute_header, a2, a3, "bluetool: power off failed: error 0x%08X", (uint8_t *)v3);
  sub_1000083F8();
}

void sub_10002D3E8(os_log_s *a1)
{
  int v2 = *sub_100025E48();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000150D0((void *)&_mh_execute_header, a1, v3, "bluetool: reg on failed: error %d", (uint8_t *)v4);
  sub_100025E3C();
}

void sub_10002D460()
{
}

void sub_10002D48C()
{
}

void sub_10002D4B8()
{
}

void sub_10002D4E4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to get information to generate pcieChipset string from HWIdentifiers property chipset=%llu stepping=%s\n",  (uint8_t *)&v4,  0x16u);
}

void sub_10002D56C()
{
}

void sub_10002D598()
{
}

void sub_10002D5C4()
{
}

void sub_10002D628()
{
}

void sub_10002D68C()
{
}

void sub_10002D6B8()
{
}

void sub_10002D6E4()
{
}

void sub_10002D710()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s script failed %u times in a row. pending power cycle of entire wifi/BT chip...",  v2,  0x12u);
  sub_1000083F0();
}

void sub_10002D78C()
{
}

void sub_10002D7F0()
{
}

void sub_10002D81C()
{
}

void sub_10002D848(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *stat buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Failed to alloc output.", buf, 2u);
}

void sub_10002D884(void *a1, os_log_s *a2)
{
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}