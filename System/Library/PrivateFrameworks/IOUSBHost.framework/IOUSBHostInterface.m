@interface IOUSBHostInterface
+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice interfaceNumber:(NSNumber *)interfaceNumber configurationValue:(NSNumber *)configurationValue interfaceClass:(NSNumber *)interfaceClass interfaceSubclass:(NSNumber *)interfaceSubclass interfaceProtocol:(NSNumber *)interfaceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray;
- (BOOL)selectAlternateSetting:(NSUInteger)alternateSetting error:(NSError *)error;
- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error;
- (IOUSBHostInterface)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler;
- (IOUSBHostPipe)copyPipeWithAddress:(NSUInteger)address error:(NSError *)error;
- (NSTimeInterval)idleTimeout;
- (const)configurationDescriptor;
- (const)interfaceDescriptor;
- (unint64_t)interfaceNumber;
- (unint64_t)lastKnownAlternateSetting;
- (void)setConfigurationDescriptor:(const IOUSBConfigurationDescriptor *)a3;
- (void)setInterfaceNumber:(unint64_t)a3;
- (void)setLastKnownAlternateSetting:(unint64_t)a3;
@end

@implementation IOUSBHostInterface

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice interfaceNumber:(NSNumber *)interfaceNumber configurationValue:(NSNumber *)configurationValue interfaceClass:(NSNumber *)interfaceClass interfaceSubclass:(NSNumber *)interfaceSubclass interfaceProtocol:(NSNumber *)interfaceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  v31 = productIDArray;
  v30 = speed;
  v18 = interfaceProtocol;
  v19 = interfaceSubclass;
  v20 = interfaceClass;
  v21 = configurationValue;
  v22 = interfaceNumber;
  v23 = bcdDevice;
  v24 = productID;
  v25 = vendorID;
  v26 = (objc_class *)objc_opt_class();
  id v27 = NSStringFromClass(v26);
  IOServiceMatching((const char *)[v27 UTF8String]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  [v28 setValue:v25 forKey:IOUSBHostMatchingPropertyKeyVendorID];
  [v28 setValue:v24 forKey:IOUSBHostMatchingPropertyKeyProductID];

  [v28 setValue:v23 forKey:IOUSBHostMatchingPropertyKeyDeviceReleaseNumber];
  [v28 setValue:v22 forKey:IOUSBHostMatchingPropertyKeyInterfaceNumber];

  [v28 setValue:v21 forKey:IOUSBHostMatchingPropertyKeyConfigurationValue];
  [v28 setValue:v20 forKey:IOUSBHostMatchingPropertyKeyInterfaceClass];

  [v28 setValue:v19 forKey:IOUSBHostMatchingPropertyKeyInterfaceSubClass];
  [v28 setValue:v18 forKey:IOUSBHostMatchingPropertyKeyInterfaceProtocol];

  [v28 setValue:v30 forKey:IOUSBHostMatchingPropertyKeySpeed];
  [v28 setValue:v31 forKey:IOUSBHostMatchingPropertyKeyProductIDArray];

  return (CFMutableDictionaryRef)v28;
}

- (IOUSBHostInterface)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___IOUSBHostInterface;
  v8 = -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:]( &v46,  sel_initWithIOService_options_queue_error_interestHandler_,  *(void *)&ioService,  options,  queue,  error,  interestHandler);
  v9 = v8;
  if (!v8)
  {
    if (error)
    {
      uint64_t v47 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_18A275388 table:0];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v19;
      uint64_t v48 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 localizedStringForKey:@"Failed [super init]" value:&stru_18A275388 table:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v21;
      uint64_t v49 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v23;
      [MEMORY[0x189603F68] dictionaryWithObjects:&valuePtr forKeys:&v47 count:3];
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v24];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v25 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v25) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.1(v25, v26);
      }
    }

    goto LABEL_15;
  }

  io_registry_entry_t v10 = -[IOUSBHostObject ioService](v8, "ioService");
  v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v10,  @"bConfigurationValue",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    v13 = CFProperty;
    CFTypeID v14 = CFGetTypeID(CFProperty);
    if (v14 == CFNumberGetTypeID())
    {
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(v13, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostInterface setConfigurationDescriptor:]( v9,  "setConfigurationDescriptor:",  -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:]( v9,  "configurationDescriptorWithConfigurationValue:error:",  valuePtr,  error));
    }

    CFRelease(v13);
  }

  if (!-[IOUSBHostInterface configurationDescriptor](v9, "configurationDescriptor"))
  {
    if (error)
    {
      uint64_t v47 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 localizedStringForKey:@"Failed to create IOUSBHostInterface." value:&stru_18A275388 table:0];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v29;
      uint64_t v48 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 localizedStringForKey:@"Unable to obtain configuration descriptor." value:&stru_18A275388 table:0];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v31;
      uint64_t v49 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v33;
      [MEMORY[0x189603F68] dictionaryWithObjects:&valuePtr forKeys:&v47 count:3];
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870212 userInfo:v34];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v35 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v35) {
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.2(v35, v36);
      }
      goto LABEL_22;
    }

- (NSTimeInterval)idleTimeout
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod( -[IOUSBHostObject ioConnection](self, "ioConnection"),  0xBu,  0LL,  0,  &output,  &outputCnt);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    double v5 = 0.0;
    if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0) {
      NSLog( @"[Line %d of %s] %sconnect call failed with 0x%x",  142LL,  "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostInterface.m",  "-[IOUSBHostInterface idleTimeout]",  v4);
    }
  }

  else
  {
    double v5 = (double)output;
  }

  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  kern_return_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  const char *v15;
  uint64_t v17;
  void v18[3];
  void v19[4];
  v19[3] = *MEMORY[0x1895F89C0];
  double v5 = &off_188763000;
  LODWORD(v5) = vcvtad_u64_f64(idleTimeout * 1000.0);
  v6 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", v5), 0xAu, &v17, 1u, 0LL, 0LL);
  if (v6 && error)
  {
    v18[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 localizedStringForKey:@"Unable to set idle timeout." value:&stru_18A275388 table:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v18[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 localizedStringForKey:0 value:&stru_18A275388 table:0];
    io_registry_entry_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:3];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v6 userInfo:v13];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    CFTypeID v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v14) {
      -[IOUSBHostInterface setIdleTimeout:error:].cold.1(v14, v15);
    }
  }

  return v6 == 0;
}

- (const)interfaceDescriptor
{
  io_registry_entry_t v3 = -[IOUSBHostObject ioService](self, "ioService");
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v3,  @"bAlternateSetting",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    double v5 = CFProperty;
    unsigned __int8 valuePtr = 0;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostInterface setLastKnownAlternateSetting:](self, "setLastKnownAlternateSetting:", valuePtr);
    }

    CFRelease(v5);
  }

  v7 = -[IOUSBHostInterface configurationDescriptor](self, "configurationDescriptor");
  v8 = v7;
  for (i = 0LL; ; i = (const IOUSBDescriptorHeader *)v11)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v7, i);
    v11 = InterfaceDescriptor;
    if (!InterfaceDescriptor) {
      break;
    }
    uint64_t bInterfaceNumber = InterfaceDescriptor->bInterfaceNumber;
    if (-[IOUSBHostInterface interfaceNumber](self, "interfaceNumber") == bInterfaceNumber)
    {
      uint64_t bAlternateSetting = v11->bAlternateSetting;
      if (-[IOUSBHostInterface lastKnownAlternateSetting](self, "lastKnownAlternateSetting") == bAlternateSetting) {
        break;
      }
    }

    v7 = v8;
  }

  return v11;
}

- (BOOL)selectAlternateSetting:(NSUInteger)alternateSetting error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  const char *v16;
  uint64_t v18;
  void v19[3];
  void v20[4];
  v20[3] = *MEMORY[0x1895F89C0];
  v7 = IOConnectCallScalarMethod( -[IOUSBHostObject ioConnection](self, "ioConnection", alternateSetting),  0xCu,  &v18,  1u,  0LL,  0LL);
  if (v7)
  {
    if (error)
    {
      v19[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 localizedStringForKey:@"Unable to select alternate setting." value:&stru_18A275388 table:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v19[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      io_registry_entry_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v11;
      v19[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
      CFTypeID v14 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v15) {
        -[IOUSBHostInterface selectAlternateSetting:error:].cold.1(v15, v16);
      }
    }
  }

  else
  {
    -[IOUSBHostInterface setLastKnownAlternateSetting:](self, "setLastKnownAlternateSetting:", alternateSetting);
  }

  return v7 == 0;
}

- (IOUSBHostPipe)copyPipeWithAddress:(NSUInteger)address error:(NSError *)error
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  __int16 valuePtr = 0;
  io_registry_entry_t v7 = -[IOUSBHostObject ioService](self, "ioService");
  v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v7,  @"bAlternateSetting",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    io_registry_entry_t v10 = CFProperty;
    CFTypeID v11 = CFGetTypeID(CFProperty);
    if (v11 == CFNumberGetTypeID()) {
      CFNumberGetValue(v10, kCFNumberSInt8Type, &valuePtr);
    }
    CFRelease(v10);
  }

  v12 = (const __CFNumber *)IORegistryEntryCreateCFProperty( -[IOUSBHostObject ioService](self, "ioService"),  @"bInterfaceNumber",  v8,  0);
  if (v12)
  {
    v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFNumberGetTypeID()) {
      CFNumberGetValue(v13, kCFNumberSInt8Type, (char *)&valuePtr + 1);
    }
    CFRelease(v13);
  }

  v15 = -[IOUSBHostInterface configurationDescriptor](self, "configurationDescriptor");
  v16 = v15;
  for (i = 0LL; ; i = (const IOUSBDescriptorHeader *)v19)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v15, i);
    v19 = InterfaceDescriptor;
    if (!InterfaceDescriptor
      || __PAIR64__(InterfaceDescriptor->bAlternateSetting, InterfaceDescriptor->bInterfaceNumber) == __PAIR64__(valuePtr, HIBYTE(valuePtr)))
    {
      break;
    }

    v15 = v16;
  }

  v20 = 0LL;
  do
  {
    EndpointDescriptor = IOUSBGetNextEndpointDescriptor(v16, v19, v20);
    if (!EndpointDescriptor)
    {
      if (!error) {
        return 0LL;
      }
      uint64_t v41 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 localizedStringForKey:@"Unable to copy pipe." value:&stru_18A275388 table:0];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v33;
      uint64_t v42 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 localizedStringForKey:@"Endpoint address not found." value:&stru_18A275388 table:0];
      BOOL v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v35;
      uint64_t v43 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 localizedStringForKey:@"Select a valid endpoint address" value:&stru_18A275388 table:0];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v46 = v37;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v41 count:3];
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870160 userInfo:v29];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v38 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v38) {
        -[IOUSBHostInterface copyPipeWithAddress:error:].cold.1(v38, v39);
      }
      goto LABEL_23;
    }

    v20 = (const IOUSBDescriptorHeader *)EndpointDescriptor;
  }

  while (IOUSBGetEndpointAddress(EndpointDescriptor) != address);
  result = -[IOUSBHostPipe initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:]( objc_alloc(&OBJC_CLASS___IOUSBHostPipe),  "initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:",  self,  address,  -[IOUSBHostObject ioConnection](self, "ioConnection"),  -[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"),  -[IOUSBHostObject deviceAddress](self, "deviceAddress"));
  if (result) {
    return result;
  }
  if (error)
  {
    uint64_t v41 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:@"Unable to copy pipe." value:&stru_18A275388 table:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    uint64_t v42 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 localizedStringForKey:@"IOUSBHostPipe init failed." value:&stru_18A275388 table:0];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v26;
    uint64_t v43 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v46 = v28;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v41 count:3];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v29];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    BOOL v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v30) {
      -[IOUSBHostInterface copyPipeWithAddress:error:].cold.2(v30, v31);
    }
LABEL_23:
  }

  return 0LL;
}

- (const)configurationDescriptor
{
  return self->_configurationDescriptor;
}

- (void)setConfigurationDescriptor:(const IOUSBConfigurationDescriptor *)a3
{
  self->_configurationDescriptor = a3;
}

- (unint64_t)interfaceNumber
{
  return self->_interfaceNumber;
}

- (void)setInterfaceNumber:(unint64_t)a3
{
  self->_interfaceNumber = a3;
}

- (unint64_t)lastKnownAlternateSetting
{
  return self->_lastKnownAlternateSetting;
}

- (void)setLastKnownAlternateSetting:(unint64_t)a3
{
  self->_lastKnownAlternateSetting = a3;
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.3( uint64_t a1,  const char *a2)
{
}

- (void)setIdleTimeout:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)selectAlternateSetting:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)copyPipeWithAddress:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)copyPipeWithAddress:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
}

@end