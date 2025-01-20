@interface HIDDevice(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)getReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:;
- (BOOL)openWithOptions:()HIDFramework error:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (BOOL)setReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:;
- (CFArrayRef)elementsMatching:()HIDFramework;
- (CFTypeRef)propertyForKey:()HIDFramework;
- (IOHIDDeviceRef)initWithService:()HIDFramework;
- (uint64_t)close;
- (uint64_t)commitElements:()HIDFramework direction:error:;
- (uint64_t)commitElements:()HIDFramework direction:error:timeout:callback:;
- (uint64_t)getReport:()HIDFramework reportLength:withIdentifier:forType:error:;
- (uint64_t)open;
- (uint64_t)setReport:()HIDFramework reportLength:withIdentifier:forType:error:;
- (void)activate;
- (void)setBatchInputElementHandler:()HIDFramework;
- (void)setCancelHandler:()HIDFramework;
- (void)setDispatchQueue:()HIDFramework;
- (void)setInputElementHandler:()HIDFramework;
- (void)setInputElementMatching:()HIDFramework;
- (void)setInputReportHandler:()HIDFramework;
- (void)setRemovalHandler:()HIDFramework;
@end

@implementation HIDDevice(HIDFramework)

- (IOHIDDeviceRef)initWithService:()HIDFramework
{
  IOHIDDeviceRef v4 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x189604DB0], service);

  return v4;
}

- (CFTypeRef)propertyForKey:()HIDFramework
{
  return IOHIDDeviceGetProperty(a1, key);
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDDeviceSetProperty(a1, key, a3) != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDDeviceConformsTo(a1, usagePage, usage) != 0;
}

- (CFArrayRef)elementsMatching:()HIDFramework
{
  return IOHIDDeviceCopyMatchingElements(a1, matching, 0);
}

- (uint64_t)setReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return [a1 setReport:a3 reportLength:a4 withIdentifier:a5 forType:a6 error:a7 timeout:0 callback:0];
}

- (BOOL)setReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16 = a9;
  v17 = v16;
  if (v16)
  {
    v18 = _Block_copy(v16);
    uint64_t v19 = IOHIDDeviceSetReportWithCallback( a1,  a6,  a5,  a3,  a4,  (double)a8,  (IOHIDReportCallback)asyncReportCallback,  v18);
  }

  else
  {
    uint64_t v19 = IOHIDDeviceSetReport(a1, a6, a5, a3, a4);
  }

  int v20 = v19;
  if (a7)
  {
    if ((_DWORD)v19)
    {
      [MEMORY[0x189607870] errorWithIOReturn:v19];
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      if (v17) {
        _Block_release(v17);
      }
    }
  }

  return v20 == 0;
}

- (uint64_t)getReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return [a1 getReport:a3 reportLength:a4 withIdentifier:a5 forType:a6 error:a7 timeout:0 callback:0];
}

- (BOOL)getReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16 = a9;
  v17 = v16;
  CFIndex pReportLength = *a4;
  if (v16)
  {
    v18 = _Block_copy(v16);
    uint64_t ReportWithCallback = IOHIDDeviceGetReportWithCallback( a1,  a6,  a5,  a3,  &pReportLength,  (double)a8,  (IOHIDReportCallback)asyncReportCallback,  v18);
    if (!a7) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t ReportWithCallback = IOHIDDeviceGetReport(a1, a6, a5, a3, &pReportLength);
    *a4 = pReportLength;
    if (!a7) {
      goto LABEL_8;
    }
  }

  if ((_DWORD)ReportWithCallback)
  {
    [MEMORY[0x189607870] errorWithIOReturn:ReportWithCallback];
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    if (v17) {
      _Block_release(v17);
    }
  }

- (uint64_t)commitElements:()HIDFramework direction:error:
{
  return [a1 commitElements:a3 direction:a4 error:a5 timeout:0 callback:0];
}

- (uint64_t)commitElements:()HIDFramework direction:error:timeout:callback:
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = a1 + (int)*MEMORY[0x1896085C0];
  os_unfair_recursive_lock_lock_with_options();
  v15 = *(HIDTransaction **)(v14 + 256);
  if (!v15)
  {
    v15 = -[HIDTransaction initWithDevice:](objc_alloc(&OBJC_CLASS___HIDTransaction), "initWithDevice:", a1);
    *(void *)(v14 + 256) = v15;
  }

  id v16 = v15;
  -[HIDTransaction setDirection:](v16, "setDirection:", a4 != 0);
  if (v13) {
    uint64_t v17 = -[HIDTransaction commitElements:error:timeout:callback:]( v16,  "commitElements:error:timeout:callback:",  v12,  a5,  a6,  v13);
  }
  else {
    uint64_t v17 = -[HIDTransaction commitElements:error:](v16, "commitElements:error:", v12, a5);
  }
  uint64_t v18 = v17;
  os_unfair_recursive_lock_unlock();

  return v18;
}

- (void)setInputElementMatching:()HIDFramework
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDDevice(HIDFramework) setInputElementMatching:].cold.1(&v9, v10);
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[__CFDictionary count](v8, "count"))
    {
      IOHIDDeviceRef v4 = a1;
      v5 = v8;
    }

    else
    {
      IOHIDDeviceRef v4 = a1;
      v5 = 0LL;
    }

    IOHIDDeviceSetInputValueMatching(v4, v5);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFDictionary count](v8, "count"))
      {
        v6 = a1;
        v7 = v8;
      }

      else
      {
        v6 = a1;
        v7 = 0LL;
      }

      IOHIDDeviceSetInputValueMatchingMultiple(v6, v7);
    }
  }
}

- (void)setInputElementHandler:()HIDFramework
{
  id v4 = a3;
  v5 = (unint64_t *)((char *)a1 + *MEMORY[0x1896085C0] + 312);
  id v8 = v4;
  v6 = _Block_copy(v4);
  do
    unint64_t v7 = __ldaxr(v5);
  while (__stlxr((unint64_t)v6, v5));
  if (v7) {
    -[HIDManager setInputElementHandler:].cold.1();
  }
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)inputValueCallback_0, a1);
}

- (void)setBatchInputElementHandler:()HIDFramework
{
  id v4 = a3;
  v5 = (char *)a1 + (int)*MEMORY[0x1896085C0];
  v6 = (unint64_t *)(v5 + 312);
  id v9 = v4;
  unint64_t v7 = _Block_copy(v4);
  do
    unint64_t v8 = __ldaxr(v6);
  while (__stlxr((unint64_t)v7, v6));
  if (v8) {
    -[HIDManager setInputElementHandler:].cold.1();
  }
  *((void *)v5 + 35) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)batchInputValueCallback, a1);
}

- (void)setRemovalHandler:()HIDFramework
{
  id v4 = a3;
  v5 = (unint64_t *)((char *)a1 + *MEMORY[0x1896085C0] + 320);
  id v8 = v4;
  v6 = _Block_copy(v4);
  do
    unint64_t v7 = __ldaxr(v5);
  while (__stlxr((unint64_t)v6, v5));
  if (v7) {
    -[HIDServiceClient(HIDFramework) setRemovalHandler:].cold.1();
  }
  IOHIDDeviceRegisterRemovalCallback(a1, (IOHIDCallback)removalCallback, a1);
}

- (void)setInputReportHandler:()HIDFramework
{
  id v4 = a3;
  v5 = &a1[*MEMORY[0x1896085C0]];
  v6 = (unint64_t *)(v5 + 328);
  id v16 = v4;
  unint64_t v7 = _Block_copy(v4);
  do
    unint64_t v8 = __ldaxr(v6);
  while (__stlxr((unint64_t)v7, v6));
  if (v8) {
    -[HIDManager setInputReportHandler:].cold.1();
  }
  [a1 propertyForKey:@"MaxInputReportSize"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9) {
    CFIndex v11 = [v9 unsignedIntegerValue];
  }
  else {
    CFIndex v11 = 1LL;
  }
  id v12 = (__CFData *)*((void *)v5 + 34);
  if (!v12)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], v11);
    *((void *)v5 + 34) = Mutable;
    CFDataSetLength(Mutable, v11);
    id v12 = (__CFData *)*((void *)v5 + 34);
  }

  MutableBytePtr = CFDataGetMutableBytePtr(v12);
  CFIndex Length = CFDataGetLength(*((CFDataRef *)v5 + 34));
  IOHIDDeviceRegisterInputReportWithTimeStampCallback( (IOHIDDeviceRef)a1,  MutableBytePtr,  Length,  (IOHIDReportWithTimeStampCallback)inputReportCallback_0,  a1);
}

- (void)setCancelHandler:()HIDFramework
{
}

- (void)setDispatchQueue:()HIDFramework
{
}

- (uint64_t)open
{
  return IOHIDDeviceOpen(a1, 0);
}

- (BOOL)openWithOptions:()HIDFramework error:
{
  uint64_t v5 = IOHIDDeviceOpen(a1, options);
  int v6 = v5;
  if (a4 && (_DWORD)v5)
  {
    [MEMORY[0x189607870] errorWithIOReturn:v5];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6 == 0;
}

- (uint64_t)close
{
  return IOHIDDeviceClose(a1, 0);
}

- (void)activate
{
  v2 = &a1[*MEMORY[0x1896085C0]];
  os_unfair_recursive_lock_lock_with_options();
  if (*((void *)v2 + 35))
  {
    if (*((void *)v2 + 30)) {
      objc_msgSend(MEMORY[0x189603FA8], "arrayWithArray:");
    }
    else {
      objc_msgSend( MEMORY[0x189603FA8],  "arrayWithObjects:",  &unk_18A030348,  &unk_18A030370,  &unk_18A030398,  &unk_18A0303C0,  0);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:&unk_18A0303E8];
    os_unfair_recursive_lock_unlock();
    [a1 setInputElementMatching:v3];
  }

  else
  {
    os_unfair_recursive_lock_unlock();
  }

  IOHIDDeviceActivate((IOHIDDeviceRef)a1);
}

- (void)setInputElementMatching:()HIDFramework .cold.1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end