@interface IOUSBHostDevice
+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice deviceClass:(NSNumber *)deviceClass deviceSubclass:(NSNumber *)deviceSubclass deviceProtocol:(NSNumber *)deviceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray;
- (BOOL)allocateDownstreamBusCurrentWithWakeUnits:(unint64_t *)a3 sleepUnits:(unint64_t *)a4 error:(id *)a5;
- (BOOL)configureWithValue:(NSUInteger)value error:(NSError *)error;
- (BOOL)configureWithValue:(NSUInteger)value matchInterfaces:(BOOL)matchInterfaces error:(NSError *)error;
- (BOOL)resetWithError:(NSError *)error;
- (const)configurationDescriptor;
- (unint64_t)lastKnownConfiguration;
- (void)setLastKnownConfiguration:(unint64_t)a3;
@end

@implementation IOUSBHostDevice

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice deviceClass:(NSNumber *)deviceClass deviceSubclass:(NSNumber *)deviceSubclass deviceProtocol:(NSNumber *)deviceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  v16 = productIDArray;
  v17 = speed;
  v18 = deviceProtocol;
  v19 = deviceSubclass;
  v20 = deviceClass;
  v21 = bcdDevice;
  v22 = productID;
  v23 = vendorID;
  v24 = (objc_class *)objc_opt_class();
  id v25 = NSStringFromClass(v24);
  IOServiceMatching((const char *)[v25 UTF8String]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  [v26 setValue:v23 forKey:IOUSBHostMatchingPropertyKeyVendorID];
  [v26 setValue:v22 forKey:IOUSBHostMatchingPropertyKeyProductID];

  [v26 setValue:v21 forKey:IOUSBHostMatchingPropertyKeyDeviceReleaseNumber];
  [v26 setValue:v20 forKey:IOUSBHostMatchingPropertyKeyDeviceClass];

  [v26 setValue:v19 forKey:IOUSBHostMatchingPropertyKeyDeviceSubClass];
  [v26 setValue:v18 forKey:IOUSBHostMatchingPropertyKeyDeviceProtocol];

  [v26 setValue:v17 forKey:IOUSBHostMatchingPropertyKeySpeed];
  [v26 setValue:v16 forKey:IOUSBHostMatchingPropertyKeyProductIDArray];

  return (CFMutableDictionaryRef)v26;
}

- (BOOL)configureWithValue:(NSUInteger)value error:(NSError *)error
{
  return -[IOUSBHostDevice configureWithValue:matchInterfaces:error:]( self,  "configureWithValue:matchInterfaces:error:",  value,  1LL,  error);
}

- (BOOL)configureWithValue:(NSUInteger)value matchInterfaces:(BOOL)matchInterfaces error:(NSError *)error
{
  kern_return_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  const char *v17;
  uint64_t input[2];
  void v20[3];
  void v21[4];
  v21[3] = *MEMORY[0x1895F89C0];
  input[0] = value;
  input[1] = matchInterfaces;
  v8 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xAu, input, 2u, 0LL, 0LL);
  if (v8)
  {
    if (error)
    {
      v20[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 localizedStringForKey:@"Unable to set configuration." value:&stru_18A275388 table:0];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v10;
      v20[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      v20[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v14;
      [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:3];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v8 userInfo:v15];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v16) {
        -[IOUSBHostDevice configureWithValue:matchInterfaces:error:].cold.1(v16, v17);
      }
    }
  }

  else
  {
    -[IOUSBHostDevice setLastKnownConfiguration:](self, "setLastKnownConfiguration:", value);
  }

  return v8 == 0;
}

- (const)configurationDescriptor
{
  io_registry_entry_t v3 = -[IOUSBHostObject ioService](self, "ioService");
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v3,  (CFStringRef)IOUSBHostDevicePropertyKeyCurrentConfiguration,  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      unsigned __int8 valuePtr = 0;
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostDevice setLastKnownConfiguration:](self, "setLastKnownConfiguration:", valuePtr);
    }

    CFRelease(v5);
  }

  result = -[IOUSBHostDevice lastKnownConfiguration](self, "lastKnownConfiguration");
  if (result) {
    return -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:]( self,  "configurationDescriptorWithConfigurationValue:error:",  -[IOUSBHostDevice lastKnownConfiguration](self, "lastKnownConfiguration"),  0LL);
  }
  return result;
}

- (BOOL)resetWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  const char *v13;
  void v15[3];
  void v16[4];
  v16[3] = *MEMORY[0x1895F89C0];
  v4 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xCu, 0LL, 0, 0LL, 0LL);
  if (v4 && error)
  {
    v15[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 localizedStringForKey:@"Unable to reset device" value:&stru_18A275388 table:0];
    CFTypeID v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v15[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    v15[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v4 userInfo:v11];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[IOUSBHostDevice resetWithError:].cold.1(v12, v13);
    }
  }

  return v4 == 0;
}

- (BOOL)allocateDownstreamBusCurrentWithWakeUnits:(unint64_t *)a3 sleepUnits:(unint64_t *)a4 error:(id *)a5
{
  kern_return_t v10;
  unint64_t v11;
  kern_return_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  const char *v21;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t v25;
  void v26[3];
  void v27[4];
  BOOL v5 = 0;
  v27[3] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      outputCnt = 2;
      unint64_t v9 = *a4;
      output = *a3;
      id v25 = v9;
      v10 = IOConnectCallScalarMethod( -[IOUSBHostObject ioConnection](self, "ioConnection"),  0xBu,  0LL,  0,  &output,  &outputCnt);
      v11 = v25;
      *a3 = output;
      *a4 = v11;
      BOOL v5 = v10 == 0;
      if (v10)
      {
        if (a5)
        {
          v12 = v10;
          v26[0] = *MEMORY[0x1896075E0];
          [MEMORY[0x1896077F8] mainBundle];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 localizedStringForKey:@"Unable to allocate bus current" value:&stru_18A275388 table:0];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = v14;
          v26[1] = *MEMORY[0x1896075F0];
          [MEMORY[0x1896077F8] mainBundle];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 localizedStringForKey:0 value:&stru_18A275388 table:0];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v16;
          v26[2] = *MEMORY[0x189607618];
          [MEMORY[0x1896077F8] mainBundle];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 localizedStringForKey:0 value:&stru_18A275388 table:0];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27[2] = v18;
          [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:3];
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v12 userInfo:v19];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v20) {
            -[IOUSBHostDevice allocateDownstreamBusCurrentWithWakeUnits:sleepUnits:error:].cold.1(v20, v21);
          }
        }
      }
    }
  }

  return v5;
}

- (unint64_t)lastKnownConfiguration
{
  return self->_lastKnownConfiguration;
}

- (void)setLastKnownConfiguration:(unint64_t)a3
{
  self->_lastKnownConfiguration = a3;
}

- (void)configureWithValue:(uint64_t)a1 matchInterfaces:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)resetWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)allocateDownstreamBusCurrentWithWakeUnits:(uint64_t)a1 sleepUnits:(const char *)a2 error:.cold.1( uint64_t a1,  const char *a2)
{
}

@end