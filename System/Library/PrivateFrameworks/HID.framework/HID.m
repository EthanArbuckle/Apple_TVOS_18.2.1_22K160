void sub_187355578( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HIDVirtualServiceNotifyCallback(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  id v9 = a1;
  [v9 delegate];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
}

uint64_t __HIDVirtualServiceSetPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a1;
  [v7 delegate];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8) {
    uint64_t v10 = [v8 setProperty:a5 forKey:a4 forService:v7];
  }
  else {
    uint64_t v10 = 0LL;
  }

  return v10;
}

uint64_t __HIDVirtualServiceCopyPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  [v5 delegate];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 propertyForKey:a4 forService:v5];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

uint64_t __HIDVirtualServiceCopyEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = a1;
  [v9 delegate];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    [MEMORY[0x189607968] numberWithUnsignedInt:a4];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v12 forKeyedSubscript:@"EventType"];

    [v11 setObject:a5 forKeyedSubscript:@"MatchingEvent"];
    [MEMORY[0x189607968] numberWithUnsignedInt:a6];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v13 forKeyedSubscript:@"MatchingEventOptions"];

    uint64_t v14 = [v10 copyEventMatching:v11 forService:v9];
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

uint64_t __HIDVirtualServiceSetOutputEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  [v5 delegate];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    else {
      uint64_t v8 = 3758097084LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

uint64_t __HIDVirtualServiceClientCopyMatchingEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  [v5 delegate];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 copyEventMatching:a4 forService:v5];
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_1()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void inputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  v6 = a1;
  IOHIDValueGetElement(a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setValueRef:a4];
  uint64_t v7 = v6[2];

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a3, v8);
}

uint64_t deviceAddedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
}

uint64_t deviceRemovedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
}

void inputReportCallback( void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (objc_class *)MEMORY[0x189603F48];
  v15 = a1;
  id v17 = (id)[[v14 alloc] initWithBytesNoCopy:a6 length:a7 freeWhenDone:0];
  uint64_t v16 = v15[4];

  (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, id))(v16 + 16))(v16, a3, a8, a4, a5, v17);
}
}

double OUTLINED_FUNCTION_2(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

void _removalCallback(uint64_t a1, uint64_t a2, char *a3)
{
  v3 = (int *)MEMORY[0x1896085D0];
  uint64_t v4 = *(void *)&a3[*MEMORY[0x1896085D0] + 112];
  if (v4)
  {
    id v5 = *(void (**)(uint64_t))(v4 + 16);
    v6 = a3;
    v5(v4);
    _Block_release(*(const void **)&v6[*v3 + 112]);
    *(void *)&v6[*v3 + 112] = 0LL;
  }

void asyncReportCallback( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  v12 = (void (**)(id, uint64_t, uint64_t, uint64_t, void))_Block_copy(a1);
  v12[2](v12, a2, a6, a7, a5);
  _Block_release(a1);
}

LABEL_8:
  return (_DWORD)ReportWithCallback == 0;
}

void inputValueCallback_0(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  id v8 = a1;
  IOHIDValueGetElement(a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setValueRef:a4];
  if (atomic_load((unint64_t *)&v8[*MEMORY[0x1896085C0] + 312]))
  {
    unint64_t v7 = atomic_load((unint64_t *)&v8[*MEMORY[0x1896085C0] + 312]);
    (*(void (**)(unint64_t, void *))(v7 + 16))(v7, v5);
  }
}

void batchInputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  uint64_t v10 = a1;
  IOHIDValueGetElement(a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setValueRef:a4];
  v6 = (int *)MEMORY[0x1896085C0];
  os_unfair_recursive_lock_lock_with_options();
  id v7 = *(id *)&v10[*v6 + 280];
  if ([v5 type] == 5)
  {
    if (atomic_load((unint64_t *)&v10[*v6 + 312]))
    {
      unint64_t v9 = atomic_load((unint64_t *)&v10[*v6 + 312]);
      (*(void (**)(unint64_t, id))(v9 + 16))(v9, v7);
    }

    [v7 removeAllObjects];
  }

  else
  {
    [v7 addObject:v5];
  }

  os_unfair_recursive_lock_unlock();
}

void removalCallback(char *a1)
{
  v1 = (int *)MEMORY[0x1896085C0];
  if (atomic_load((unint64_t *)&a1[*MEMORY[0x1896085C0] + 320]))
  {
    unint64_t v3 = atomic_load((unint64_t *)&a1[*MEMORY[0x1896085C0] + 320]);
    uint64_t v4 = *(void (**)(unint64_t))(v3 + 16);
    id v7 = a1;
    v4(v3);
    id v5 = (const void *)atomic_load((unint64_t *)&v7[*v1 + 320]);
    _Block_release(v5);
    v6 = v7;
    atomic_store(0LL, (unint64_t *)&v7[*v1 + 320]);
  }

void inputReportCallback_0( void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v17 = a1;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:a6 length:a7 freeWhenDone:0];
  if (atomic_load((unint64_t *)&v17[*MEMORY[0x1896085C0] + 328]))
  {
    unint64_t v16 = atomic_load((unint64_t *)&v17[*MEMORY[0x1896085C0] + 328]);
    (*(void (**)(unint64_t, uint64_t, uint64_t, void, void, void *))(v16 + 16))( v16,  a3,  a8,  a4,  a5,  v14);
  }
}

uint64_t _eventCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16LL))();
}

uint64_t _resetCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
}

uint64_t _eventFilterCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t _serviceCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t _propertiesChangedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void asyncCommitCallback(const void *a1, uint64_t a2)
{
  uint64_t v4 = (void (**)(id, void))_Block_copy(a1);
  v4[2](v4, a2);
  _Block_release(a1);
}

uint64_t getReportCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16LL))();
  uint64_t v7 = *a5;
  if (*a5 >= v8) {
    uint64_t v7 = v8;
  }
  *a5 = v7;
  return result;
}

uint64_t setReportCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFRelease(CFTypeRef cf)
{
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
}

void IOHIDDeviceCancel(IOHIDDeviceRef device)
{
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607DE0](device, *(void *)&options);
}

Boolean IOHIDDeviceConformsTo(IOHIDDeviceRef device, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x189607DE8](device, *(void *)&usagePage, *(void *)&usage);
}

CFArrayRef IOHIDDeviceCopyMatchingElements( IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x189607DF0](device, matching, *(void *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x189607E00](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189607E08](device, key);
}

IOReturn IOHIDDeviceGetReport( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x189607E10](device, *(void *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceGetReportWithCallback( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x189607E18]( device,  *(void *)&reportType,  reportID,  report,  pReportLength,  callback,  context,  timeout);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x189607E20](device);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607E30](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback( IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceSetCancelHandler(IOHIDDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
}

void IOHIDDeviceSetInputValueMatching(IOHIDDeviceRef device, CFDictionaryRef matching)
{
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x189607E80](device, key, property);
}

IOReturn IOHIDDeviceSetReport( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x189607E88](device, *(void *)&reportType, reportID, report, reportLength);
}

IOReturn IOHIDDeviceSetReportWithCallback( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x189607E90](device, *(void *)&reportType, reportID, report, reportLength, callback, context, timeout);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x189607EA8](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x189607EB8](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x189607EC0](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x189607EC8](element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return (IOHIDElementRef)MEMORY[0x189607ED0](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x189607ED8](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x189607EE0](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x189607EF0](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x189607EF8](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x189607F00](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x189607F08](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x189607F10](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x189607F18](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x189607F20](element);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x189607F30]();
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x189607F38]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x189607F40]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x189607F58]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x189607F60]();
}

uint64_t IOHIDEventCreateWithBytes()
{
  return MEMORY[0x189607F78]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x189607F88]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x189607F90]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x189607F98]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x189607FA0]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x189607FA8]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x189607FB0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x189607FB8]();
}

uint64_t IOHIDEventGetParent()
{
  return MEMORY[0x189607FC0]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x189607FD0]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x189607FD8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x189607FE0]();
}

uint64_t IOHIDEventRemoveEvent()
{
  return MEMORY[0x189607FF0]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x189607FF8]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x189608000]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x189608008]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x189608010]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x189608020]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x189608028]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x189608030]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x189608038]();
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189608040](client, key);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x189608048](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x189608050]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x189608058]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x189608060]();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallback()
{
  return MEMORY[0x189608068]();
}

uint64_t IOHIDEventSystemClientRegisterPropertyChangedCallback()
{
  return MEMORY[0x189608070]();
}

uint64_t IOHIDEventSystemClientRegisterResetCallback()
{
  return MEMORY[0x189608078]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x189608080]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x189608088]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x189608090]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x189608098]();
}

Boolean IOHIDEventSystemClientSetProperty( IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1896080A0](client, key, property);
}

uint64_t IOHIDEventSystemConnectionGetAuditToken()
{
  return MEMORY[0x1896080A8]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x1896080B0]();
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
}

void IOHIDManagerCancel(IOHIDManagerRef manager)
{
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1896080D0](manager, *(void *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1896080D8](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1896080E0](allocator, *(void *)&options);
}

CFTypeRef IOHIDManagerGetProperty(IOHIDManagerRef manager, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1896080E8](manager, key);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1896080F0](manager, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback( IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback( IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterInputReportWithTimeStampCallback( IOHIDManagerRef manager, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDManagerRegisterInputValueCallback( IOHIDManagerRef manager, IOHIDValueCallback callback, void *context)
{
}

void IOHIDManagerSetCancelHandler(IOHIDManagerRef manager, dispatch_block_t handler)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
}

void IOHIDManagerSetInputValueMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetInputValueMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

Boolean IOHIDManagerSetProperty(IOHIDManagerRef manager, CFStringRef key, CFTypeRef value)
{
  return MEMORY[0x189608150](manager, key, value);
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x189608160](service, *(void *)&usagePage, *(void *)&usage);
}

uint64_t IOHIDServiceClientCopyMatchingEvent()
{
  return MEMORY[0x189608168]();
}

uint64_t IOHIDServiceClientCopyProperties()
{
  return MEMORY[0x189608170]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189608178](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x189608180](service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x189608188]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x189608190](service, key, property);
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x189608198]();
}

uint64_t IOHIDServiceCopyMatchingEvent()
{
  return MEMORY[0x1896081A0]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1896081A8]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1896081B8]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1896081C8]();
}

uint64_t IOHIDSessionGetProperty()
{
  return MEMORY[0x1896081D0]();
}

uint64_t IOHIDSessionSetProperty()
{
  return MEMORY[0x1896081D8]();
}

void IOHIDTransactionAddElement(IOHIDTransactionRef transaction, IOHIDElementRef element)
{
}

void IOHIDTransactionClear(IOHIDTransactionRef transaction)
{
}

IOReturn IOHIDTransactionCommit(IOHIDTransactionRef transaction)
{
  return MEMORY[0x1896081F0](transaction);
}

IOReturn IOHIDTransactionCommitWithCallback( IOHIDTransactionRef transaction, CFTimeInterval timeout, IOHIDCallback callback, void *context)
{
  return MEMORY[0x1896081F8](transaction, callback, context, timeout);
}

IOHIDTransactionRef IOHIDTransactionCreate( CFAllocatorRef allocator, IOHIDDeviceRef device, IOHIDTransactionDirectionType direction, IOOptionBits options)
{
  return (IOHIDTransactionRef)MEMORY[0x189608200](allocator, device, *(void *)&direction, *(void *)&options);
}

IOHIDTransactionDirectionType IOHIDTransactionGetDirection(IOHIDTransactionRef transaction)
{
  return MEMORY[0x189608208](transaction);
}

void IOHIDTransactionSetDirection(IOHIDTransactionRef transaction, IOHIDTransactionDirectionType direction)
{
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
}

CFTypeRef IOHIDUserDeviceCopyProperty(IOHIDUserDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189608228](device, key);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return MEMORY[0x189608230]();
}

uint64_t IOHIDUserDeviceCreateWithOptions()
{
  return MEMORY[0x189608238]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x189608248]();
}

IOReturn IOHIDUserDeviceHandleReportWithTimeStamp( IOHIDUserDeviceRef device, uint64_t timestamp, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x189608258](device, timestamp, report, reportLength);
}

uint64_t IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback()
{
  return MEMORY[0x189608268]();
}

uint64_t IOHIDUserDeviceRegisterSetReportCallback()
{
  return MEMORY[0x189608278]();
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
}

Boolean IOHIDUserDeviceSetProperty(IOHIDUserDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x189608290](device, key, property);
}

IOHIDValueRef IOHIDValueCreateWithBytes( CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x189608298](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue( CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x1896082A0](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1896082A8](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1896082B0](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x1896082B8](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1896082C0](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  return result;
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1896082D0](value);
}

uint64_t IOHIDVirtualServiceClientCreateWithCallbacks()
{
  return MEMORY[0x1896082D8]();
}

uint64_t IOHIDVirtualServiceClientDispatchEvent()
{
  return MEMORY[0x1896082E0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IOHIDElementGetValue()
{
  return MEMORY[0x1896085F0]();
}

uint64_t _IOHIDElementSetValue()
{
  return MEMORY[0x189608600]();
}

uint64_t _IOHIDEventCreate()
{
  return MEMORY[0x189608610]();
}

uint64_t _IOHIDEventEqual()
{
  return MEMORY[0x189608618]();
}

uint64_t _IOHIDServiceDispatchEvent()
{
  return MEMORY[0x189608640]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t objc_msgSend_getReport_reportLength_withIdentifier_forType_error_timeout_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getReport_reportLength_withIdentifier_forType_error_timeout_callback_);
}

uint64_t objc_msgSend_setReport_reportLength_withIdentifier_forType_error_timeout_callback_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setReport_reportLength_withIdentifier_forType_error_timeout_callback_);
}