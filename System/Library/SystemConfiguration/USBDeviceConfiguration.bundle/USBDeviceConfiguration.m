uint64_t lockdownArrivalCallback()
{
  SCLog(1LL, 6LL, @"DevUSB: lockdownd is available");
  sub_35DC();
  CFRunLoopSourceInvalidate((CFRunLoopSourceRef)qword_8070);
  CFRelease((CFTypeRef)qword_8070);
  qword_8070 = 0LL;
  CFMachPortInvalidate((CFMachPortRef)qword_8078);
  CFRelease((CFTypeRef)qword_8078);
  qword_8078 = 0LL;
  return notify_cancel(dword_8080);
}

uint64_t _usb_device_configuration_add_interface(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, a2, 0x8000100u, kCFAllocatorNull);
  *a3 = 0;
  if (v4)
  {
    CFStringRef v5 = v4;
    pthread_mutex_lock(&stru_8000);
    v6 = (const __CFArray *)qword_8088;
    v9.length = CFArrayGetCount((CFArrayRef)qword_8088);
    v9.location = 0LL;
    if (CFArrayGetFirstIndexOfValue(v6, v9, v5) == -1)
    {
      CFArrayAppendValue((CFMutableArrayRef)qword_8088, v5);
      CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
      pthread_mutex_unlock(&stru_8000);
      *a3 = sub_306C((uint64_t)Copy);
      CFRelease(Copy);
      pthread_mutex_lock(&stru_8000);
    }

    pthread_mutex_unlock(&stru_8000);
    CFRelease(v5);
  }

  return 0LL;
}

BOOL sub_306C(uint64_t a1)
{
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  int v2 = IOUSBDeviceControllerCreate(kCFAllocatorDefault, &cf);
  if (!v2)
  {
    uint64_t v3 = IOUSBDeviceDescriptionCreateFromController(kCFAllocatorDefault, cf);
    if (v3)
    {
      CFStringRef v4 = (const void *)v3;
      uint64_t MatchingConfiguration = IOUSBDeviceDescriptionGetMatchingConfiguration(v3, a1);
      if ((_DWORD)MatchingConfiguration) {
        int v2 = IOUSBDeviceControllerSetPreferredConfiguration(cf, MatchingConfiguration);
      }
      else {
        int v2 = 0;
      }
      CFRelease(v4);
    }

    else
    {
      int v2 = 0;
    }

    CFRelease(cf);
  }

  return v2 == 0;
}

uint64_t _usb_device_configuration_remove_interface(uint64_t a1, const char *a2, _DWORD *a3)
{
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, a2, 0x8000100u, kCFAllocatorNull);
  *a3 = 0;
  if (v4)
  {
    CFStringRef v5 = v4;
    pthread_mutex_lock(&stru_8000);
    v6 = (const __CFArray *)qword_8088;
    v10.length = CFArrayGetCount((CFArrayRef)qword_8088);
    v10.location = 0LL;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v6, v10, v5);
    if (FirstIndexOfValue != -1)
    {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_8088, FirstIndexOfValue);
      CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
      pthread_mutex_unlock(&stru_8000);
      *a3 = sub_306C((uint64_t)Copy);
      CFRelease(Copy);
      pthread_mutex_lock(&stru_8000);
    }

    pthread_mutex_unlock(&stru_8000);
    CFRelease(v5);
  }

  return 0LL;
}

uint64_t start()
{
  uint64_t state64 = 0LL;
  if (notify_register_mach_port("com.apple.mobile.lockdown", (mach_port_t *)&dword_8090, 0, &dword_8080))
  {
    v0 = @"DevUSB: notify_register_mach_port(lockdown) error=%d";
LABEL_5:
    SCLog(1LL, 3LL, v0);
    uint64_t state64 = 1LL;
    goto LABEL_6;
  }

  if (notify_get_state(dword_8080, &state64))
  {
    v0 = @"DevUSB: notify_get_state() error=%d";
    goto LABEL_5;
  }

  if (!state64)
  {
    SCLog(1LL, 6LL, @"DevUSB: Waiting for lockdownd");
    qword_8078 = _SC_CFMachPortCreateWithPort( "USBDeviceConfiguration",  dword_8090,  lockdownArrivalCallback,  0LL);
    qword_8070 = (uint64_t)CFMachPortCreateRunLoopSource(kCFAllocatorDefault, (CFMachPortRef)qword_8078, 0LL);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)qword_8070, kCFRunLoopDefaultMode);
    goto LABEL_7;
  }

LABEL_6:
  SCLog(1LL, 6LL, @"DevUSB: lockdownd is available");
  sub_35DC();
LABEL_7:
  pthread_mutex_lock(&stru_8000);
  if (!qword_8098)
  {
    pthread_t v4 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v6.__opaque[24] = v1;
    *(_OWORD *)&v6.__opaque[40] = v1;
    *(_OWORD *)&v6.__sig = v1;
    *(_OWORD *)&v6.__opaque[8] = v1;
    pthread_attr_init(&v6);
    pthread_attr_setdetachstate(&v6, 2);
    pthread_create(&v4, &v6, (void *(__cdecl *)(void *))sub_3400, 0LL);
    pthread_attr_destroy(&v6);
    while (qword_8098)
      pthread_cond_wait(&stru_8040, &stru_8000);
  }

  return pthread_mutex_unlock(&stru_8000);
}

uint64_t sub_3400()
{
  mach_port_t sp = -1431655766;
  CStringPtr = CFStringGetCStringPtr(@"com.apple.SystemConfiguration.USBDeviceConfig", 0);
  if (!bootstrap_check_in(bootstrap_port, CStringPtr, &sp))
  {
    uint64_t v1 = IOMIGMachPortCreate(kCFAllocatorDefault, 40LL, sp);
    qword_80A0 = v1;
    if (v1)
    {
      IOMIGMachPortRegisterDemuxCallback(v1, sub_3800, 0LL);
      uint64_t v2 = qword_80A0;
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      IOMIGMachPortScheduleWithRunLoop(v2, Current, kCFRunLoopDefaultMode);
    }
  }

  pthread_mutex_lock(&stru_8000);
  qword_8088 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  qword_8098 = (uint64_t)CFRunLoopGetCurrent();
  pthread_mutex_unlock(&stru_8000);
  pthread_cond_signal(&stru_8040);
  CFRunLoopRun();
  uint64_t v4 = qword_80A0;
  if (qword_80A0)
  {
    CFRunLoopRef v5 = CFRunLoopGetCurrent();
    IOMIGMachPortUnscheduleFromRunLoop(v4, v5, kCFRunLoopDefaultMode);
    mach_port_name_t Port = IOMIGMachPortGetPort(qword_80A0);
    CFRelease((CFTypeRef)qword_80A0);
    if (Port) {
      mach_port_mod_refs(mach_task_self_, Port, 1u, -1);
    }
    qword_80A0 = 0LL;
  }

  pthread_mutex_lock(&stru_8000);
  if (qword_8088)
  {
    CFRelease((CFTypeRef)qword_8088);
    qword_8088 = 0LL;
  }

  pthread_mutex_unlock(&stru_8000);
  return 0LL;
}

void stop(__CFRunLoopSource *a1)
{
  if (qword_8098) {
    CFRunLoopStop((CFRunLoopRef)qword_8098);
  }
  pthread_mutex_unlock(&stru_8000);
  CFRunLoopSourceSignal(a1);
}

uint64_t sub_35DC()
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  return IOUSBDeviceControllerRegisterArrivalCallback(sub_3620, 0LL, Current, kCFRunLoopDefaultMode);
}

void sub_3620()
{
  CFTypeRef cf = 0LL;
  SCLog(1LL, 6LL, @"DevUSB: setDefaultUSBDescription entered");
  if (IOUSBDeviceControllerCreate(kCFAllocatorDefault, &cf))
  {
    SCLog(1LL, 3LL, @"DevUSB: IOUSBDeviceControllerCreate failed with error: 0x%08x");
LABEL_3:
    SCLog(1LL, 3LL, @"DevUSB: Failed to set USB Device Description");
    goto LABEL_11;
  }

  uint64_t v0 = IOUSBDeviceDescriptionCreateFromDefaultsAndController(kCFAllocatorDefault, cf);
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    uint64_t v2 = (const __CFString *)MGCopyAnswer(@"UniqueDeviceID", 0LL);
    if (v2)
    {
      uint64_t v3 = v2;
      MutableCFArrayRef Copy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v2);
      v7.length = CFStringGetLength(v3);
      v7.location = 0LL;
      CFStringFindAndReplace(MutableCopy, @"-", &stru_43B0, v7, 0LL);
      IOUSBDeviceDescriptionSetSerialString(v1, MutableCopy);
      CFRelease(MutableCopy);
      IOUSBDeviceDescriptionSetUDIDString(v1, v3);
      CFRelease(v3);
      if (IOUSBDeviceControllerSetDescription(cf, v1))
      {
        SCLog(1LL, 3LL, @"DevUSB: Failed to set USB Device Description: 0x%08x");
        CFRelease(v1);
        CFRelease(cf);
        goto LABEL_3;
      }
    }

    else
    {
      SCLog(1LL, 3LL, @"DevUSB: Can't get UDID for use as serial number");
    }

    CFRelease(v1);
  }

  CFRelease(cf);
LABEL_11:
  pthread_mutex_lock(&stru_8000);
  if (qword_8088) {
    CFArrayRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, (CFArrayRef)qword_8088);
  }
  else {
    CFArrayRef Copy = 0LL;
  }
  pthread_mutex_unlock(&stru_8000);
  sub_306C((uint64_t)Copy);
  if (Copy) {
    CFRelease(Copy);
  }
}

uint64_t sub_3800(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a2[5];
  if (v3 >= 30050 && v3 < 30052) {
    LOBYTE(result) = usb_device_configuration_server(a2, a3);
  }
  else {
    LOBYTE(result) = 0;
  }
  return result;
}

uint64_t usb_device_configuration_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

const char *sub_3880(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x128
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x100) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }

  uint64_t result = (const char *)_usb_device_configuration_add_interface( *((unsigned int *)v3 + 3),  v3 + 40,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v9 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_394C(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, uint64_t v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x128
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x100) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = (const char *)memchr(result + 40, 0, v4 - 40)) == 0LL))
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }

  uint64_t result = (const char *)_usb_device_configuration_remove_interface( *((unsigned int *)v3 + 3),  v3 + 40,  (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v9 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_12;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t usb_device_configuration_server(_DWORD *a1, uint64_t a2)
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
  if ((v4 - 30052) >= 0xFFFFFFFE
    && (unsigned int v5 = (void (*)(void))*(&_usb_device_configuration_subsystem + 5 * (v4 - 30050) + 5)) != 0LL)
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