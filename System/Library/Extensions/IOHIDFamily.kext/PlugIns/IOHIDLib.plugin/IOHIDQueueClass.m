@interface IOHIDQueueClass
- (BOOL)setupAnalytics;
- (IOHIDQueueClass)initWithDevice:(id)a3;
- (IOHIDQueueClass)initWithDevice:(id)a3 port:(unsigned int)a4 source:(__CFRunLoopSource *)a5;
- (int)addElement:(__IOHIDElement *)a3;
- (int)containsElement:(__IOHIDElement *)a3 pValue:(char *)a4;
- (int)copyNextValue:(__IOHIDValue *)a3;
- (int)getAsyncEventSource:(const void *)a3;
- (int)getDepth:(unsigned int *)a3;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)removeElement:(__IOHIDElement *)a3;
- (int)setDepth:(unsigned int)a3;
- (int)setValueAvailableCallback:(void *)a3 context:(void *)a4;
- (int)start;
- (int)stop;
- (void)dealloc;
- (void)mapMemory;
- (void)queueCallback:(__CFMachPort *)a3 msg:(id *)a4 size:(int64_t)a5 info:(void *)a6;
- (void)signalQueueEmpty;
- (void)unmapMemory;
- (void)updateUsageAnalytics;
@end

@implementation IOHIDQueueClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0LL, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x2Eu,  0xC7u,  0x8Bu,  0xDBu,  0x9Fu,  0x4Eu,  0x11u,  0xDAu,  0xB6u,  0x5Cu,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
  if (!CFEqual(v6, v7))
  {
    int v8 = -2147483644;
    if (!v6) {
      return v8;
    }
    goto LABEL_3;
  }

  *a4 = &self->_queue;
  CFRetain(self);
  int v8 = 0;
  if (v6) {
LABEL_3:
  }
    CFRelease(v6);
  return v8;
}

- (int)getAsyncEventSource:(const void *)a3
{
  if (!a3) {
    return -536870206;
  }
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  *a3 = self->_runLoopSource;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)setDepth:(unsigned int)a3
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  self->_depth = a3;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)getDepth:(unsigned int *)a3
{
  if (!a3) {
    return -536870206;
  }
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  *a3 = self->_depth;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)addElement:(__IOHIDElement *)a3
{
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];
  input[3] = *MEMORY[0x1895F89C0];
  input[2] = 0LL;
  outputCnt = 1;
  if (!a3) {
    return -536870206;
  }
  unint64_t queueToken = self->_queueToken;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = queueToken;
  input[1] = IOHIDElementGetCookie(a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v10 = objc_msgSend_connect(WeakRetained, v6, v7, v8, v9);
  v11 = IOConnectCallScalarMethod(v10, 5u, input, 3u, &output, &outputCnt);

  self->_queueSizeChanged = (output | self->_queueSizeChanged) != 0;
  return v11;
}

- (int)removeElement:(__IOHIDElement *)a3
{
  kern_return_t v11;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];
  input[2] = *MEMORY[0x1895F89C0];
  outputCnt = 1;
  if (!a3) {
    return -536870206;
  }
  unint64_t queueToken = self->_queueToken;
  output = 0xAAAAAAAAAAAAAAAALL;
  input[0] = queueToken;
  input[1] = IOHIDElementGetCookie(a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v10 = objc_msgSend_connect(WeakRetained, v6, v7, v8, v9);
  v11 = IOConnectCallScalarMethod(v10, 6u, input, 2u, &output, &outputCnt);

  self->_queueSizeChanged = (output | self->_queueSizeChanged) != 0;
  return v11;
}

- (int)containsElement:(__IOHIDElement *)a3 pValue:(char *)a4
{
  kern_return_t v4;
  unint64_t queueToken;
  id WeakRetained;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t v13;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];
  input[2] = *MEMORY[0x1895F89C0];
  outputCnt = 1;
  v4 = -536870206;
  if (a3 && a4)
  {
    unint64_t queueToken = self->_queueToken;
    output = 0xAAAAAAAAAAAAAAAALL;
    input[0] = queueToken;
    input[1] = IOHIDElementGetCookie(a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    v13 = objc_msgSend_connect(WeakRetained, v9, v10, v11, v12);
    v4 = IOConnectCallScalarMethod(v13, 7u, input, 2u, &output, &outputCnt);

    *a4 = output;
  }

  return v4;
}

- (int)start
{
  kern_return_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  uint64_t v9 = IOConnectCallScalarMethod(v8, 8u, &self->_queueToken, 1u, 0LL, 0LL);

  os_unfair_lock_lock(&self->_queueLock);
  if (!self->_queueMemory || self->_queueSizeChanged)
  {
    objc_msgSend_mapMemory(self, v10, v11, v12, v13);
    self->_queueSizeChanged = 0;
  }

  os_unfair_lock_unlock(&self->_queueLock);
  return v9;
}

- (int)stop
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  LODWORD(v2) = IOConnectCallScalarMethod(v8, 9u, &v2->_queueToken, 1u, 0LL, 0LL);

  return (int)v2;
}

- (int)setValueAvailableCallback:(void *)a3 context:(void *)a4
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  self->_valueAvailableCallback = a3;
  self->_valueAvailableContext = a4;
  os_unfair_lock_unlock(p_queueLock);
  return 0;
}

- (int)copyNextValue:(__IOHIDValue *)a3
{
  if (!a3) {
    return -536870206;
  }
  uint32_t dataSize = -1431655766;
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  objc_msgSend_updateUsageAnalytics(self, v6, v7, v8, v9);
  mach_port_t v10 = IODataQueuePeek(self->_queueMemory);
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(unsigned int *)v10->data;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    objc_msgSend_getElement_(WeakRetained, v14, v12, v15, v16);
    *a3 = (__IOHIDValue *)_IOHIDValueCreateWithElementValuePtr();

    if (*a3 && (_IOHIDValueGetFlags() & 1) != 0)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_device);
      objc_msgSend_releaseReport_(v17, v18, *(void *)&v11[3], v19, v20);
    }

    IODataQueueDequeue(self->_queueMemory, 0LL, &dataSize);
    if (*a3) {
      int v21 = 0;
    }
    else {
      int v21 = -536870212;
    }
  }

  else
  {
    int v21 = -536870169;
  }

  os_unfair_lock_unlock(p_queueLock);
  return v21;
}

- (void)queueCallback:(__CFMachPort *)a3 msg:(id *)a4 size:(int64_t)a5 info:(void *)a6
{
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  valueAvailableCallback = (void (*)(void *, void, IOHIDDeviceQueueInterface **))self->_valueAvailableCallback;
  valueAvailableContext = self->_valueAvailableContext;
  os_unfair_lock_unlock(p_queueLock);
  if (valueAvailableCallback) {
    valueAvailableCallback(valueAvailableContext, 0LL, &self->_queue);
  }
}

- (void)unmapMemory
{
  if (self->_queueMemory)
  {
    queueHeader = self->_queueHeader;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
    uint64_t v9 = objc_msgSend_connect(WeakRetained, v5, v6, v7, v8);
    MEMORY[0x1895DDD80](v9, LODWORD(self->_queueToken), *MEMORY[0x1895FBBE0], queueHeader);

    self->_queueHeader = 0LL;
    self->_queueMemory = 0LL;
    self->_queueMemorySize = 0LL;
  }

  if (self->_usageAnalytics)
  {
    IOHIDAnalyticsEventCancel();
    CFRelease(self->_usageAnalytics);
    self->_usageAnalytics = 0LL;
  }

- (void)mapMemory
{
  uint64_t v17 = 0LL;
  v18 = 0LL;
  objc_msgSend_unmapMemory(self, a2, v2, v3, v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  uint64_t v11 = objc_msgSend_connect(WeakRetained, v7, v8, v9, v10);
  MEMORY[0x1895DDD68](v11, LODWORD(self->_queueToken), *MEMORY[0x1895FBBE0], &v18, &v17, 1LL);

  uint64_t v12 = v18;
  self->_queueHeader = v18;
  self->_queueMemory = (_IODataQueueMemory *)&v12[1];
  self->_queueMemorySize = v17 - 48;
  objc_msgSend_setupAnalytics(self, v13, v14, v15, v16);
}

- (IOHIDQueueClass)initWithDevice:(id)a3
{
  return (IOHIDQueueClass *)objc_msgSend_initWithDevice_port_source_(self, a2, (uint64_t)a3, 0, 0);
}

- (IOHIDQueueClass)initWithDevice:(id)a3 port:(unsigned int)a4 source:(__CFRunLoopSource *)a5
{
  kern_return_t v22;
  mach_port_t NotificationPort;
  CFMachPortRef v24;
  CFRunLoopSourceRef RunLoopSource;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  mach_port_t v31;
  os_log_s *v32;
  IOHIDQueueClass *v33;
  objc_super v35;
  CFMachPortContext context;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  kern_return_t v40;
  uint64_t reference[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t input[3];
  input[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  input[0] = 0LL;
  input[1] = 0LL;
  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43 = v9;
  v44 = v9;
  *(_OWORD *)reference = v9;
  v42 = v9;
  context.version = 0LL;
  context.info = self;
  memset(&context.retain, 0, 24);
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___IOHIDQueueClass;
  uint64_t v10 = -[IOHIDIUnknown2 init](&v35, sel_init);
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_device, v8);
    uint64_t v12 = (char *)malloc(0x70uLL);
    v11->_queue = (IOHIDDeviceQueueInterface *)v12;
    v11->_queueLock._os_unfair_lock_opaque = 0;
    vtbl = v11->super._vtbl;
    Release = vtbl->Release;
    __int128 v15 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)uint64_t v12 = v11;
    *((void *)v12 + 3) = Release;
    *((void *)v12 + 4) = sub_18908CD20;
    *((void *)v12 + 5) = sub_18908CD30;
    *((void *)v12 + 6) = sub_18908CD40;
    *((void *)v12 + 7) = sub_18908CD50;
    *((void *)v12 + 8) = sub_18908CD60;
    *((void *)v12 + 9) = sub_18908CD70;
    *((void *)v12 + 10) = sub_18908CD84;
    *(_OWORD *)(v12 + 8) = v15;
    *((void *)v12 + 11) = sub_18908CD90;
    *((void *)v12 + 12) = sub_18908CD9C;
    *((void *)v12 + 13) = sub_18908CDB0;
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_device);
    mach_port_t v21 = objc_msgSend_connect(WeakRetained, v17, v18, v19, v20);
    v22 = IOConnectCallScalarMethod(v21, 3u, input, 2u, &output, &outputCnt);

    if (!v22)
    {
      v11->_unint64_t queueToken = output;
      if (a4)
      {
        v11->_port = a4;
      }

      else
      {
        NotificationPort = IODataQueueAllocateNotificationPort();
        v22 = -536870211;
        v11->_port = NotificationPort;
        if (!NotificationPort) {
          goto LABEL_11;
        }
        v24 = CFMachPortCreateWithPort( (CFAllocatorRef)*MEMORY[0x189604DB0],  NotificationPort,  (CFMachPortCallBack)sub_18908CDC0,  &context,  0LL);
        v11->_machPort = v24;
        if (!v24) {
          goto LABEL_11;
        }
      }

      if (a5)
      {
        v11->_runLoopSource = a5;
        CFRetain(a5);
        goto LABEL_10;
      }

      RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x189604DB0], v11->_machPort, 0LL);
      v11->_runLoopSource = RunLoopSource;
      if (RunLoopSource)
      {
LABEL_10:
        v26 = objc_loadWeakRetained((id *)&v11->_device);
        v31 = objc_msgSend_connect(v26, v27, v28, v29, v30);
        v22 = IOConnectCallAsyncScalarMethod(v31, 0x10u, v11->_port, reference, 1u, &v11->_queueToken, 1u, 0LL, 0LL);

        if (!v22)
        {
          v33 = v11;
          goto LABEL_16;
        }

        goto LABEL_11;
      }

      v22 = -536870211;
    }

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v8 = objc_msgSend_connect(WeakRetained, v4, v5, v6, v7);
  IOConnectCallScalarMethod(v8, 4u, &self->_queueToken, 1u, 0LL, 0LL);

  queue = self->_queue;
  if (queue) {
    free(queue);
  }
  runLoopSource = self->_runLoopSource;
  if (runLoopSource) {
    CFRelease(runLoopSource);
  }
  machPort = self->_machPort;
  if (machPort)
  {
    CFMachPortInvalidate(machPort);
    CFRelease(self->_machPort);
    port = (const char *)self->_port;
    if ((_DWORD)port) {
      mach_port_mod_refs(*MEMORY[0x1895FBBE0], (mach_port_name_t)port, 1u, -1);
    }
  }

  objc_msgSend_unmapMemory(self, port, v10, v11, v12);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IOHIDQueueClass;
  -[IOHIDIUnknown2 dealloc](&v16, sel_dealloc);
}

- (BOOL)setupAnalytics
{
  v34[2] = *MEMORY[0x1895F89C0];
  v33[0] = @"staticSize";
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x189607968], a2, self->_queueMemorySize, v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = @"queueType";
  v34[0] = v5;
  v34[1] = @"deviceQueue";
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v6, (uint64_t)v34, (uint64_t)v33, 2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (void *)objc_msgSend_mutableCopy(v7, v8, v9, v10, v11);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  io_registry_entry_t v18 = objc_msgSend_service(WeakRetained, v14, v15, v16, v17, 3336, 1);
  uint64_t v19 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFProperty = (void *)IORegistryEntryCreateCFProperty( v18,  @"DeviceUsagePairs",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);

  id v21 = objc_loadWeakRetained((id *)&self->_device);
  io_registry_entry_t v26 = objc_msgSend_service(v21, v22, v23, v24, v25);
  v27 = (void *)IORegistryEntryCreateCFProperty(v26, @"Transport", v19, 0);

  if (CFProperty) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v28, (uint64_t)CFProperty, (uint64_t)@"usagePairs", v29);
  }
  if (v27) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v28, (uint64_t)v27, (uint64_t)@"transport", v29);
  }
  v30 = (void *)IOHIDAnalyticsHistogramEventCreate();
  self->_usageAnalytics = v30;
  if (v30)
  {
    IOHIDAnalyticsEventActivate();
  }

  else
  {
    _IOHIDLogCategory();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1890963C8(v32);
    }
  }

  return v30 != 0LL;
}

- (void)updateUsageAnalytics
{
  if (self->_queueHeader)
  {
    queueMemory = self->_queueMemory;
    if (queueMemory)
    {
      if (self->_usageAnalytics)
      {
        unsigned int tail = queueMemory->tail;
        if (tail != self->_lastTail)
        {
          IOHIDAnalyticsHistogramEventSetIntegerValue();
          self->_lastTail = tail;
        }
      }
    }
  }

- (void)signalQueueEmpty
{
  kern_return_t v10;
  os_log_s *v11;
  _DWORD v12[2];
  uint64_t v13;
  v13 = *MEMORY[0x1895F89C0];
  queueHeader = self->_queueHeader;
  if (queueHeader)
  {
    char v3 = atomic_load(&queueHeader->var0);
    if ((v3 & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
      mach_port_t v9 = objc_msgSend_connect(WeakRetained, v5, v6, v7, v8);
      uint64_t v10 = IOConnectCallScalarMethod(v9, 0x12u, 0LL, 0, 0LL, 0LL);

      if (v10)
      {
        _IOHIDLogCategory();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12[0] = 67109120;
          v12[1] = v10;
          _os_log_impl( &dword_189088000,  v11,  OS_LOG_TYPE_DEFAULT,  "kIOHIDLibUserClientResumeReports:%#x\n",  (uint8_t *)v12,  8u);
        }
      }
    }
  }

- (void).cxx_destruct
{
}

@end