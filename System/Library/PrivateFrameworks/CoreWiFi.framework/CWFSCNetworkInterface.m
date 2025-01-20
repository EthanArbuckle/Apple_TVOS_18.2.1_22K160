@interface CWFSCNetworkInterface
- (BOOL)isLinkActive;
- (BOOL)isMonitoringEvents;
- (CWFSCNetworkInterface)init;
- (CWFSCNetworkInterface)initWithInterfaceName:(id)a3;
- (NSString)hardwareAddress;
- (NSString)interfaceName;
- (id)IPv4Addresses;
- (id)IPv4BroadcastAddresses;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6Flags;
- (id)IPv6PrefixLengths;
- (id)__IPv4StateConfig;
- (id)__IPv6StateConfig;
- (id)__linkStateConfig;
- (id)__networkInterfaceHardwareAddress;
- (id)airPortSetupConfiguration;
- (id)airPortStateConfiguration;
- (id)eventHandler;
- (void)__startEventMonitoring;
- (void)dealloc;
- (void)restartEventMonitoring;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkInterface

- (CWFSCNetworkInterface)initWithInterfaceName:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___CWFSCNetworkInterface;
  v5 = -[CWFSCNetworkInterface init](&v36, sel_init);
  v10 = v5;
  if (!v4 || !v5) {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  objc_msgSend___networkInterfaceHardwareAddress(v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
  hardwareAddress = v10->_hardwareAddress;
  v10->_hardwareAddress = (NSString *)v22;

  if (!v10->_hardwareAddress)
  {
    CWFGetOSLog();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      CWFGetOSLog();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v33 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v34 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v37 = 136446978;
      v38 = "-[CWFSCNetworkInterface initWithInterfaceName:]";
      __int16 v39 = 2082;
      v40 = "CWFSCNetworkInterface.m";
      __int16 v41 = 1024;
      int v42 = 80;
      __int16 v43 = 2114;
      id v44 = v4;
      _os_log_send_and_compose_impl();
    }
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v25 = dispatch_queue_create("com.apple.corewifi.SC-interface-mutex", v24);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v25;

  if (!v10->_mutexQueue) {
    goto LABEL_8;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v28 = dispatch_queue_create("com.apple.corewifi.SC-interface-event", v27);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v28;

  if (!v10->_eventQueue
    || (context.version = 0LL,
        memset(&context.retain, 0, 24),
        context.info = v10,
        SCDynamicStoreRef v30 = SCDynamicStoreCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"com.apple.corewifi.SC-interface",  (SCDynamicStoreCallBack)sub_186518914,  &context),  (v10->_storeRef = v30) == 0LL)
    || !SCDynamicStoreSetDisconnectCallBack())
  {
LABEL_8:

    v10 = 0LL;
  }

  return v10;
}

- (CWFSCNetworkInterface)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFSCNetworkInterface dealloc](v3, v4);
  return result;
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CWFSCNetworkInterface;
  -[CWFSCNetworkInterface dealloc](&v4, sel_dealloc);
}

- (void)__startEventMonitoring
{
  v12[2] = *MEMORY[0x1895F89C0];
  v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  objc_super v4 = (const __CFString *)*MEMORY[0x18960C548];
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  (CFStringRef)self->_interfaceName,  (CFStringRef)*MEMORY[0x18960C588]);
  if (NetworkInterfaceEntity)
  {
    CFStringRef v6 = NetworkInterfaceEntity;
    CFStringRef v7 = SCDynamicStoreKeyCreateNetworkInterfaceEntity( v3,  v4,  (CFStringRef)self->_interfaceName,  (CFStringRef)*MEMORY[0x18960C590]);
    if (v7)
    {
      CFStringRef v10 = v7;
      v12[0] = v6;
      v12[1] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v8, (uint64_t)v12, 2, v9);
      uint64_t v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v11, 0LL)) {
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      }
      CFRelease(v6);
      CFRelease(v10);
    }

    else
    {
      CFRelease(v6);
    }
  }

- (void)restartEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186518E08;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186518E98;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186518F34;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_186519020;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)airPortStateConfiguration
{
  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  interfaceName,  (CFStringRef)*MEMORY[0x18960C570])) != 0LL)
  {
    v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      uint64_t v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)airPortSetupConfiguration
{
  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  interfaceName,  (CFStringRef)*MEMORY[0x18960C570])) != 0LL)
  {
    v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      uint64_t v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)__IPv4StateConfig
{
  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  interfaceName,  (CFStringRef)*MEMORY[0x18960C588])) != 0LL)
  {
    v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      uint64_t v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)__IPv6StateConfig
{
  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  interfaceName,  (CFStringRef)*MEMORY[0x18960C590])) != 0LL)
  {
    v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      uint64_t v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)__linkStateConfig
{
  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  interfaceName,  (CFStringRef)*MEMORY[0x18960C5A0])) != 0LL)
  {
    v5 = NetworkInterfaceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      uint64_t v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)IPv4Addresses
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C6C0], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4BroadcastAddresses
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C6C8], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4SubnetMasks
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C720], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6Addresses
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C730], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6Flags
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C748], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6PrefixLengths
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C760], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isLinkActive
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x18960C7A8], v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (id)__networkInterfaceHardwareAddress
{
  uint64_t v3 = SCNetworkInterfaceCopyAll();
  if (v3)
  {
    uint64_t v4 = v3;
    CFIndex Count = CFArrayGetCount(v3);
    if (Count < 1)
    {
LABEL_8:
      char v14 = 0LL;
    }

    else
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v4, v7);
        if (ValueAtIndex)
        {
          do
          {
            uint64_t v9 = ValueAtIndex;
            ValueAtIndex = SCNetworkInterfaceGetInterface(ValueAtIndex);
          }

          while (ValueAtIndex);
          BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(v9);
        }

        if (++v7 == v6) {
          goto LABEL_8;
        }
      }

      HardwareAddressString = (__CFString *)SCNetworkInterfaceGetHardwareAddressString(v9);
      CWFCorrectEthernetAddressString(HardwareAddressString);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = (void *)objc_msgSend_copy(v16, v17, v18, v19, v20);
    }

    CFRelease(v4);
  }

  else
  {
    char v14 = 0LL;
  }

  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)hardwareAddress
{
  return self->_hardwareAddress;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end