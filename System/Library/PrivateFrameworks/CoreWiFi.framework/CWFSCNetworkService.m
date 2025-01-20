@interface CWFSCNetworkService
- (BOOL)__refreshServiceID;
- (BOOL)__updateServiceID;
- (BOOL)isMonitoringEvents;
- (BOOL)refreshServiceID;
- (CWFSCNetworkService)init;
- (CWFSCNetworkService)initWithInterfaceName:(id)a3;
- (NSString)interfaceName;
- (NSString)serviceID;
- (id)DHCPLeaseExpirationTimestamp;
- (id)DHCPLeaseStartTimestamp;
- (id)DHCPServerID;
- (id)DHCPv6ServerID;
- (id)DNSDomainName;
- (id)DNSServerAddresses;
- (id)IPv4ARPResolvedHardwareAddress;
- (id)IPv4ARPResolvedIPAddress;
- (id)IPv4Addresses;
- (id)IPv4ConfigMethod;
- (id)IPv4NetworkSignature;
- (id)IPv4Router;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6ConfigMethod;
- (id)IPv6NetworkSignature;
- (id)IPv6Router;
- (id)__DHCPInfo;
- (id)__DHCPStateConfig;
- (id)__DHCPv6StateConfig;
- (id)__DNSSetupConfig;
- (id)__DNSStateConfig;
- (id)__IPv4SetupConfig;
- (id)__IPv4StateConfig;
- (id)__IPv6SetupConfig;
- (id)__IPv6StateConfig;
- (id)__proxiesSetupConfig;
- (id)__serviceStateConfig;
- (id)eventHandler;
- (id)serviceName;
- (void)__refreshNotificationKeys;
- (void)dealloc;
- (void)restartEventMonitoring;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFSCNetworkService

- (CWFSCNetworkService)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CWFSCNetworkService;
  v5 = -[CWFSCNetworkService init](&v28, sel_init);
  v10 = v5;
  v11 = 0LL;
  if (v4 && v5)
  {
    uint64_t v12 = objc_msgSend_copy(v4, v6, v7, v8, v9);
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.corewifi.SC-service-mutex", v14);
    mutexQueue = v10->_mutexQueue;
    v10->_mutexQueue = (OS_dispatch_queue *)v15;

    if (!v10->_mutexQueue) {
      goto LABEL_10;
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.corewifi.SC-service-event", v17);
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (OS_dispatch_queue *)v18;

    if (!v10->_eventQueue) {
      goto LABEL_10;
    }
    v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    SCPreferencesRef v21 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"com.apple.corewifi.SC-service", 0LL);
    v10->_prefsRef = v21;
    if (!v21) {
      goto LABEL_10;
    }
    context.version = 0LL;
    memset(&context.retain, 0, 24);
    context.info = v10;
    SCDynamicStoreRef v22 = SCDynamicStoreCreate( v20,  @"com.apple.corewifi.SC-service",  (SCDynamicStoreCallBack)sub_1864BE0B0,  &context);
    v10->_storeRef = v22;
    if (v22 && SCDynamicStoreSetDisconnectCallBack())
    {
      v23 = (dispatch_queue_s *)v10->_mutexQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = sub_1864BE490;
      block[3] = &unk_189E5BC10;
      v11 = v10;
      v26 = v11;
      dispatch_async(v23, block);
      v10 = v26;
    }

    else
    {
LABEL_10:
      v11 = 0LL;
    }
  }

  return v11;
}

- (CWFSCNetworkService)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFSCNetworkService dealloc](v3, v4);
  return result;
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  prefsRef = self->_prefsRef;
  if (prefsRef) {
    CFRelease(prefsRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CWFSCNetworkService;
  -[CWFSCNetworkService dealloc](&v5, sel_dealloc);
}

- (BOOL)__updateServiceID
{
  v3 = SCNetworkSetCopyCurrent(self->_prefsRef);
  if (v3)
  {
    uint64_t v8 = v3;
    CFArrayRef v9 = SCNetworkSetCopyServices(v3);
    if (v9)
    {
      v10 = v9;
      cf = v8;
      ServiceOrder = SCNetworkSetGetServiceOrder(v8);
      if (ServiceOrder && (uint64_t v12 = ServiceOrder, CFArrayGetCount(ServiceOrder) >= 1))
      {
        v45 = 0LL;
        CFIndex v13 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v12, v13);
          if (ValueAtIndex && (dispatch_queue_t v15 = ValueAtIndex, CFArrayGetCount(v10) >= 1))
          {
            CFIndex v16 = 0LL;
            do
            {
              v17 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v10, v16);
              dispatch_queue_t v18 = v17;
              if (v17)
              {
                CFStringRef ServiceID = SCNetworkServiceGetServiceID(v17);
                if (!ServiceID) {
                  goto LABEL_20;
                }
                v20 = (__CFString *)ServiceID;
                CFStringRef Name = SCNetworkServiceGetName(v18);
                if (!Name) {
                  goto LABEL_20;
                }
                SCDynamicStoreRef v22 = (__CFString *)Name;
                if (!CFEqual(v20, v15)) {
                  goto LABEL_20;
                }
                Interface = SCNetworkServiceGetInterface(v18);
                if (!Interface) {
                  goto LABEL_20;
                }
                do
                {
                  v24 = Interface;
                  Interface = SCNetworkInterfaceGetInterface(Interface);
                }

                while (Interface);
                if (SCNetworkInterfaceGetInterfaceType(v24)
                  && (BSDCFStringRef Name = SCNetworkInterfaceGetBSDName(v24)) != 0LL
                  && CFEqual(BSDName, self->_interfaceName)
                  && SCNetworkServiceGetEnabled(v18))
                {
                  dispatch_queue_t v18 = (const __SCNetworkService *)objc_msgSend_copy(v20, v26, v27, v28, v29, cf);
                  uint64_t v34 = objc_msgSend_copy(v22, v30, v31, v32, v33);

                  v45 = (void *)v34;
                }

                else
                {
LABEL_20:
                  dispatch_queue_t v18 = 0LL;
                }
              }

              ++v16;
            }

            while (CFArrayGetCount(v10) > v16 && !v18);
          }

          else
          {
            dispatch_queue_t v18 = 0LL;
          }

          ++v13;
        }

        while (CFArrayGetCount(v12) > v13 && !v18);
      }

      else
      {
        v45 = 0LL;
        dispatch_queue_t v18 = 0LL;
      }

      CFRelease(cf);
      v35 = (NSString *)v45;
    }

    else
    {
      v35 = 0LL;
      dispatch_queue_t v18 = 0LL;
      v10 = v8;
    }

    CFRelease(v10);
  }

  else
  {
    v35 = 0LL;
    dispatch_queue_t v18 = 0LL;
  }

  v36 = self->_serviceID;
  if (v36 == (NSString *)v18 || v18 && v36 && (objc_msgSend_isEqual_(v36, v4, (uint64_t)v18, v6, v7) & 1) != 0)
  {
    BOOL v37 = 0;
  }

  else
  {
    v38 = (NSString *)objc_msgSend_copy(v18, v4, v5, v6, v7, cf);
    v39 = self->_serviceID;
    self->_serviceID = v38;

    BOOL v37 = 1;
  }

  serviceCFStringRef Name = self->_serviceName;
  if (serviceName != v35
    && (!serviceName || !v35 || (objc_msgSend_isEqual_(serviceName, v4, (uint64_t)v35, v6, v7) & 1) == 0))
  {
    v41 = (NSString *)objc_msgSend_copy(v35, v4, v5, v6, v7, cf);
    v42 = self->_serviceName;
    self->_serviceCFStringRef Name = v41;
  }

  return v37;
}

- (void)__refreshNotificationKeys
{
  v23[5] = *MEMORY[0x1895F89C0];
  v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  (CFStringRef)*MEMORY[0x18960C538],  0LL);
  if (NetworkServiceEntity)
  {
    CFStringRef v8 = NetworkServiceEntity;
    serviceID = (const __CFString *)self->_serviceID;
    if (serviceID)
    {
      v10 = (const __CFString *)*MEMORY[0x18960C548];
      CFStringRef v11 = SCDynamicStoreKeyCreateNetworkServiceEntity( v3,  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  (CFStringRef)*MEMORY[0x18960C588]);
      if (!v11)
      {
        v20 = 0LL;
LABEL_20:
        CFRelease(v8);

        return;
      }

      CFStringRef v12 = v11;
      CFStringRef v13 = SCDynamicStoreKeyCreateNetworkServiceEntity( v3,  v10,  (CFStringRef)self->_serviceID,  (CFStringRef)*MEMORY[0x18960C590]);
      if (!v13)
      {
        v20 = 0LL;
        CFStringRef v19 = 0LL;
        CFStringRef v15 = 0LL;
        CFStringRef v14 = 0LL;
        goto LABEL_11;
      }

      CFStringRef v14 = SCDynamicStoreKeyCreateNetworkServiceEntity( v3,  v10,  (CFStringRef)self->_serviceID,  (CFStringRef)*MEMORY[0x18960C578]);
      if (!v14)
      {
        v20 = 0LL;
        CFStringRef v19 = 0LL;
        CFStringRef v15 = 0LL;
        goto LABEL_11;
      }

      CFStringRef v15 = SCDynamicStoreKeyCreateNetworkServiceEntity( v3,  v10,  (CFStringRef)self->_serviceID,  (CFStringRef)*MEMORY[0x18960C580]);
      if (!v15)
      {
        v20 = 0LL;
        CFStringRef v19 = 0LL;
        goto LABEL_11;
      }

      CFStringRef v16 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, 0LL);
      CFStringRef v19 = v16;
      if (!v16)
      {
        v20 = 0LL;
        goto LABEL_11;
      }

      v23[0] = v12;
      v23[1] = v13;
      v23[2] = v14;
      v23[3] = v15;
      v23[4] = v16;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v17, (uint64_t)v23, 5, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      CFStringRef v13 = 0LL;
      CFStringRef v14 = 0LL;
      CFStringRef v15 = 0LL;
      CFStringRef v19 = 0LL;
      v20 = 0LL;
      CFStringRef v12 = 0LL;
    }

    storeRef = self->_storeRef;
    objc_msgSend_arrayWithObject_(MEMORY[0x189603F18], v5, (uint64_t)v8, v6, v7);
    SCDynamicStoreRef v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    SCDynamicStoreSetNotificationKeys(storeRef, (CFArrayRef)v20, v22);

    if (!v12)
    {
LABEL_12:
      if (v13) {
        CFRelease(v13);
      }
      if (v14) {
        CFRelease(v14);
      }
      if (v15) {
        CFRelease(v15);
      }
      if (v19) {
        CFRelease(v19);
      }
      goto LABEL_20;
    }

- (BOOL)__refreshServiceID
{
  int updated = objc_msgSend___updateServiceID(self, a2, v2, v3, v4);
  if (updated) {
    objc_msgSend___refreshNotificationKeys(self, v6, v7, v8, v9);
  }
  return updated;
}

- (BOOL)refreshServiceID
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BEADC;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)restartEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BEB70;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BEC0C;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1864BECAC;
  block[3] = &unk_189E5BC10;
  void block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BED98;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IPv4StateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  (CFStringRef)*MEMORY[0x18960C588])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__DHCPStateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  (CFStringRef)*MEMORY[0x18960C578])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__IPv6StateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  (CFStringRef)*MEMORY[0x18960C590])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__DHCPv6StateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  @"DHCPv6")) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__IPv4SetupConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  serviceID,  (CFStringRef)*MEMORY[0x18960C588])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__IPv6SetupConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  serviceID,  (CFStringRef)*MEMORY[0x18960C590])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__DNSStateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  (CFStringRef)*MEMORY[0x18960C580])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__DNSSetupConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  serviceID,  (CFStringRef)*MEMORY[0x18960C580])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__proxiesSetupConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C540],  serviceID,  (CFStringRef)*MEMORY[0x18960C5A8])) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)__serviceStateConfig
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFStringRef)*MEMORY[0x18960C548],  serviceID,  0LL)) != 0LL)
  {
    uint64_t v5 = NetworkServiceEntity;
    uint64_t v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      CFStringRef v11 = v6;
      CFStringRef v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }

    else
    {
      CFStringRef v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  return v12;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BF4BC;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  CWFCorrectEthernetAddressString((void *)v7[5]);
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BF624;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Router
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BF78C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Addresses
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BF8F4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4SubnetMasks
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BFA5C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Router
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BFBC4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Addresses
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BFD2C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6ConfigMethod
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BFE94;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ConfigMethod
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864BFFB4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSDomainName
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C00D4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSServerAddresses
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C023C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)serviceID
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C03A4;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)serviceName
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C04A0;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__DHCPInfo
{
  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID && (CFDictionaryRef v3 = SCDynamicStoreCopyDHCPInfo(self->_storeRef, serviceID)) != 0LL)
  {
    CFDictionaryRef v7 = v3;
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v4, (uint64_t)v3, v5, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)DHCPLeaseStartTimestamp
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C05F8;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPLeaseExpirationTimestamp
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C0718;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4NetworkSignature
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C0838;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6NetworkSignature
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C0954;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPServerID
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C0A70;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPv6ServerID
{
  uint64_t v6 = 0LL;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1864BF4A4;
  uint64_t v10 = sub_1864BF4B4;
  id v11 = 0LL;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_1864C0B94;
  v5[3] = &unk_189E5CF90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void).cxx_destruct
{
}

@end