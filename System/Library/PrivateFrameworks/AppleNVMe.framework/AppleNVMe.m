uint64_t AppleNVMeNamespaceAccessFindServiceByNSType(int a1, io_object_t *a2, CFTimeInterval a3)
{
  else {
    return AppleNVMeNamespaceAccessFindServiceByName((&sNVMeEmbeddedNamespaceTypeNames)[a1], a2, a3);
  }
}

uint64_t AppleNVMeNamespaceAccessFindServiceByName(const char *a1, io_object_t *a2, CFTimeInterval a3)
{
  io_iterator_t notification = 0;
  *a2 = 0;
  v6 = IOServiceMatching("AppleNVMeNamespaceDevice");
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(v6, @"IOPropertyMatch", Mutable);
  CFRelease(Mutable);
  CFStringRef v8 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
  CFDictionarySetValue(Mutable, v8, (const void *)*MEMORY[0x189604DE8]);
  v9 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = 3758097088LL;
    if (IOServiceAddMatchingNotification( v9,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)AppleNVMeNamespaceAccessMatchingServiceCallback,  a2,  &notification))
    {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%s IOServiceAddMatchingNotification () failed\n",  "AppleNVMeNamespaceAccessFindServiceByName");
    }

    else
    {
      AppleNVMeNamespaceAccessMatchingServiceCallback(a2, notification);
      io_object_t v12 = *a2;
      if (!*a2)
      {
        Current = CFRunLoopGetCurrent();
        RunLoopSource = IONotificationPortGetRunLoopSource(v10);
        CFRunLoopAddSource(Current, RunLoopSource, @"WaitForNVMeNSAccessService");
        CFRunLoopRunInMode(@"WaitForNVMeNSAccessService", a3, 1u);
        io_object_t v12 = *a2;
      }

      if (v12) {
        uint64_t v11 = 0LL;
      }
      else {
        uint64_t v11 = 3758097110LL;
      }
    }

    IONotificationPortDestroy(v10);
    if (notification) {
      IOObjectRelease(notification);
    }
  }

  else
  {
    uint64_t v11 = 3758097088LL;
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%s IONotificationPortCreate () failed\n",  "AppleNVMeNamespaceAccessFindServiceByName");
  }

  return v11;
}

uint64_t AppleNVMeNamespaceAccessMatchingServiceCallback(io_object_t *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    io_object_t v5 = result;
    do
    {
      if (!*a1)
      {
        IOObjectRetain(v5);
        *a1 = v5;
      }

      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t AppleNVMeNamespaceAccessOpenConection(io_service_t a1, io_connect_t *connect)
{
  if (a1) {
    return IOServiceOpen(a1, *MEMORY[0x1895FBBE0], 0, connect);
  }
  else {
    return 3758097090LL;
  }
}

uint64_t AppleNVMeNamespaceAccessGetBlockSize(mach_port_t a1, void *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallMethod(a1, 2u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v3) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessGetBlockSize", v3);
  }
  else {
    *a2 = output[0];
  }
  return v3;
}

uint64_t AppleNVMeNamespaceAccessGetBlockCount(mach_port_t a1, void *a2)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallMethod(a1, 3u, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
  if ((_DWORD)v3) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%s failed, kernResult = 0x%x \n",  "AppleNVMeNamespaceAccessGetBlockCount",  v3);
  }
  else {
    *a2 = output[0];
  }
  return v3;
}

uint64_t AppleNVMeNamespaceAccessReadData(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a4;
  input[2] = a3;
  uint64_t v4 = IOConnectCallMethod(a1, 0, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v4) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessReadData", v4);
  }
  return v4;
}

uint64_t AppleNVMeNamespaceAccessWriteData(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a4;
  input[2] = a3;
  uint64_t v4 = IOConnectCallMethod(a1, 1u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v4) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessWriteData", v4);
  }
  return v4;
}

uint64_t AppleNVMeNamespaceAccessUnmapRange(mach_port_t a1, uint64_t a2, uint64_t a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t v3 = IOConnectCallMethod(a1, 4u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v3) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessUnmapRange", v3);
  }
  return v3;
}

BOOL AppleNVMeDeviceSupportsPanicLogAccess()
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v10[0] = 0LL;
  v10[1] = 0LL;
  int v11 = 0;
  mach_port_t v0 = *MEMORY[0x1896086A8];
  io_registry_entry_t v1 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/arm-io/ans");
  if (v1)
  {
    io_object_t v2 = v1;
    uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( v1,  @"role",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      io_object_t v5 = CFProperty;
      v6 = CFStringCreateFromExternalRepresentation(v3, CFProperty, 0x600u);
      if (v6)
      {
        CFStringGetCString(v6, (char *)v10, 20LL, 0x600u);
        int v7 = LODWORD(v10[0]) ^ 0x32534E41 | BYTE4(v10[0]);
        CFRelease(v5);
        IOObjectRelease(v2);
        if (!v7) {
          return 1LL;
        }
        goto LABEL_5;
      }

      CFRelease(v5);
    }

    IOObjectRelease(v2);
  }

LABEL_5:
  io_registry_entry_t v8 = IORegistryEntryFromPath(v0, "IODeviceTree:/arm-io/apcie/pci-bridge0/s3e");
  if (!v8) {
    return AppleNVMeDeviceHasAVP();
  }
  IOObjectRelease(v8);
  return 1LL;
}

uint64_t AppleNVMePanicLogGetSize(void *a1)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  *(void *)connect = 0LL;
  *a1 = 0LL;
  int ServiceByNSType = AppleNVMeNamespaceAccessFindServiceByNSType(8, &connect[1], 120.0);
  if (connect[1]) {
    BOOL v3 = ServiceByNSType == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    uint64_t v8 = 1LL;
    goto LABEL_16;
  }

  int v4 = AppleNVMeNamespaceAccessOpenConection(connect[1], connect);
  io_connect_t v5 = connect[0];
  if (connect[0]) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = 3LL;
    if (!AppleNVMeNamespaceAccessGetBlockSize(connect[0], &v11)
      && v11
      && !AppleNVMeNamespaceAccessGetBlockCount(connect[0], &v10)
      && v10)
    {
      uint64_t v8 = 0LL;
      *a1 = v11 * v10;
    }

LABEL_16:
    io_connect_t v5 = connect[0];
    if (!connect[0]) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v8 = 2LL;
  if (connect[0]) {
LABEL_17:
  }
    IOServiceClose(v5);
LABEL_18:
  if (connect[1]) {
    IOObjectRelease(connect[1]);
  }
  return v8;
}

uint64_t AppleNVMeReadPanicLogData(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  *(void *)connect = 0LL;
  uint64_t v4 = 6LL;
  if (!a2 || !a4) {
    goto LABEL_24;
  }
  int ServiceByNSType = AppleNVMeNamespaceAccessFindServiceByNSType(8, &connect[1], 120.0);
  uint64_t v4 = 1LL;
  if (!connect[1] || ServiceByNSType) {
    goto LABEL_21;
  }
  int v10 = AppleNVMeNamespaceAccessOpenConection(connect[1], connect);
  io_connect_t v11 = connect[0];
  uint64_t v4 = 2LL;
  if (connect[0] && !v10)
  {
    uint64_t v4 = 3LL;
    if (!AppleNVMeNamespaceAccessGetBlockSize(connect[0], &v17)
      && v17
      && !AppleNVMeNamespaceAccessGetBlockCount(connect[0], &v16)
      && v16)
    {
      uint64_t v12 = v17 * v16;
      if (v17 * v16 < a3) {
        a3 = v17 * v16;
      }
      if (AppleNVMeNamespaceAccessReadData(connect[0], a2, 0LL, a3))
      {
        uint64_t v4 = 4LL;
      }

      else
      {
        if (AppleNVMeDeviceHasAVP()) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = v17;
        }
        if (AppleNVMeNamespaceAccessUnmapRange(connect[0], 0LL, v13))
        {
          uint64_t v4 = 5LL;
        }

        else
        {
          if (a1) {
            *a1 = AppleNVMePanicLogSourcePath;
          }
          uint64_t v4 = 0LL;
          *a4 = a3;
        }
      }
    }

LABEL_21:
    io_connect_t v11 = connect[0];
  }

  if (v11) {
    IOServiceClose(v11);
  }
LABEL_24:
  if (connect[1]) {
    IOObjectRelease(connect[1]);
  }
  return v4;
}

BOOL AppleNVMeDeviceHasAVP()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/product/util");
  io_registry_entry_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

CFRunLoopRunResult CFRunLoopRunInMode( CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x189603198](mode, returnAfterSourceHandled, seconds);
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x189608348](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IOServiceAddMatchingNotification( IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x189608548](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}