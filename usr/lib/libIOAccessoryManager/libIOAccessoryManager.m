uint64_t IOAccessoryManagerGetServiceWithPrimaryPort(int a1)
{
  __CFDictionary *v1;
  CFAllocatorRef v2;
  CFDictionaryRef v3;
  void *values;
  void *keys;
  int valuePtr;
  valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryManager");
  keys = @"IOAccessoryPrimaryDevicePort";
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate( v2,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x1896086A8], v1);
}

uint64_t IOAccessoryManagerGetServiceWithSupportedFeature(const char *a1)
{
  v2 = IOServiceMatching("IOAccessoryManager");
  keys = @"FeaturesSupported";
  v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], a1, 0x8000100u);
  CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)&keys, &cf, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionarySetValue(v2, @"IOPropertyExistsMatch", v4);
  CFRelease(v4);
  CFRelease(keys);
  CFRelease(cf);
  return IOServiceGetMatchingService(*MEMORY[0x1896086A8], v2);
}

CFNumberRef IOAccessoryManagerGetPrimaryPort(io_registry_entry_t a1)
{
  result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryPrimaryDevicePort",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryManagerGetType(io_registry_entry_t a1)
{
  result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryManagerType",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

uint64_t IOAccessoryManagerGetUpstreamService(uint64_t a1)
{
  kern_return_t ParentEntry;
  kern_return_t v4;
  io_registry_entry_t v6;
  io_registry_entry_t parent;
  IOObjectRetain(a1);
  uint64_t v2 = a1;
  while (!IORegistryEntryInPlane(v2, "IOAccessory"))
  {
    parent = -1431655766;
    ParentEntry = IORegistryEntryGetParentEntry(v2, "IOService", &parent);
    IOObjectRelease(v2);
    uint64_t v2 = parent;
    if (ParentEntry) {
      return 0LL;
    }
  }

  while ((_DWORD)v2 == (_DWORD)a1 || !IOObjectConformsTo(v2, "IOAccessoryManager"))
  {
    v6 = -1431655766;
    CFDictionaryRef v4 = IORegistryEntryGetParentEntry(v2, "IOAccessory", &v6);
    IOObjectRelease(v2);
    uint64_t v2 = v6;
    if (v4) {
      return 0LL;
    }
  }

  return v2;
}

uint64_t IOAccessoryManagerGetUpstreamPrimaryPort(uint64_t a1)
{
  uint64_t result = IOAccessoryManagerGetUpstreamService(a1);
  if ((_DWORD)result)
  {
    io_object_t v2 = result;
    PrimaryPort = IOAccessoryManagerGetPrimaryPort(result);
    IOObjectRelease(v2);
    return (uint64_t)PrimaryPort;
  }

  return result;
}

uint64_t IOAccessoryManagerGetAccessoryID(io_registry_entry_t a1)
{
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryID",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  uint64_t result = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  if (CFProperty)
  {
    if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = -1;
    }
    CFRelease(CFProperty);
    return valuePtr;
  }

  return result;
}

CFTypeRef IOAccessoryManagerCopyAccessoryDeviceUID(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryManagerAccessoryDeviceUID",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
}

uint64_t IOAccessoryManagerGetDigitalID(io_registry_entry_t a1, UInt8 *a2)
{
  CFDictionaryRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryDigitalID",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    v8 = CFProperty;
    v10.location = 0LL;
    v10.length = 6LL;
    CFDataGetBytes(CFProperty, v10, a2);
    uint64_t v6 = 0LL;
LABEL_7:
    CFRelease(v8);
    return v6;
  }

  uint64_t v6 = 3758097095LL;
  if ((IOAccessoryManagerGetType(a1) & 0xF) != 0)
  {
    v7 = (const __CFData *)IORegistryEntryCreateCFProperty(a1, @"IOAccessoryDetect", v4, 0);
    v8 = v7;
    uint64_t v6 = v7 == (const __CFData *)*MEMORY[0x189604DE8] ? 3758097112LL : 3758097113LL;
    if (v7) {
      goto LABEL_7;
    }
  }

  return v6;
}

uint64_t IOAccesoryManagerGetDigitalIDInterfaceDeviceInfo(io_registry_entry_t a1, UInt8 *a2)
{
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryInterfaceDeviceInfo",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v10.location = 0LL;
    v10.length = 4LL;
    CFDataGetBytes(CFProperty, v10, a2);
    CFRelease(v5);
    return 0LL;
  }

  else
  {
    __int16 v9 = -21846;
    int v8 = -1431655766;
    LODWORD(result) = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v8);
    else {
      unsigned int v7 = -536870160;
    }
    if ((_DWORD)result) {
      return result;
    }
    else {
      return v7;
    }
  }
}

uint64_t checkIDBusAvailable(io_registry_entry_t a1, int a2)
{
  __int16 v5 = -21846;
  int v4 = -1431655766;
  uint64_t result = IOAccessoryManagerGetDigitalID(a1, (UInt8 *)&v4);
  if (!(_DWORD)result)
  {
    uint64_t result = 3758097102LL;
    if (v4 <= 0x3Fu)
    {
      if (a2 && (v4 & 0x300) == 0) {
        return 3758097126LL;
      }
      else {
        return 3758097136LL;
      }
    }
  }

  return result;
}

uint64_t IOAccesoryManagerGetDigitalIDAccessoryVersionInfo(io_registry_entry_t a1, UInt8 *a2)
{
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryAccessoryVersionInfo",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!CFProperty) {
    return checkIDBusAvailable(a1, 1);
  }
  __int16 v5 = CFProperty;
  v7.location = 0LL;
  v7.length = 6LL;
  CFDataGetBytes(CFProperty, v7, a2);
  CFRelease(v5);
  return 0LL;
}

uint64_t IOAccessoryManagerCopyDeviceInfo(io_registry_entry_t entry, int a2, void *a3)
{
  int v3 = a2 - 1;
  int v6 = 0;
  CFRange v7 = @"IOAccessoryInterfaceDeviceSerialNumber";
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      int v6 = 0;
      CFRange v7 = @"IOAccessoryInterfaceModuleSerialNumber";
      goto LABEL_11;
    case 2:
      int v6 = 0;
      CFRange v7 = @"IOAccessoryAccessorySerialNumber";
      goto LABEL_11;
    case 3:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryManufacturer";
      goto LABEL_11;
    case 4:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryName";
      goto LABEL_11;
    case 5:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryModelNumber";
      goto LABEL_11;
    case 6:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryFirmwareVersion";
      goto LABEL_11;
    case 7:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryHardwareVersion";
      goto LABEL_11;
    case 8:
      int v6 = 1;
      CFRange v7 = @"IOAccessoryAccessoryPPID";
LABEL_11:
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, v7, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
      if (CFProperty)
      {
        CFTypeRef v10 = CFProperty;
        uint64_t result = 0LL;
        *a3 = v10;
      }

      else
      {
        uint64_t result = checkIDBusAvailable(entry, v6);
      }

      break;
    default:
      uint64_t result = 3758097090LL;
      break;
  }

  return result;
}

CFNumberRef IOAccessoryManagerGetPowerMode(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryPowerMode",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    io_object_t v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryManagerGetActivePowerMode(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryActivePowerMode",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    io_object_t v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryManagerGetSleepPowerCurrentLimit(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessorySleepPowerCurrentLimit",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (result)
  {
    io_object_t v2 = result;
    unsigned int valuePtr = -1431655766;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

BOOL IOAccessoryManagerGetPowerDuringSleep(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryManagerSleepPower",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  CFTypeRef v2 = CFProperty;
  CFTypeRef v3 = (CFTypeRef)*MEMORY[0x189604DE8];
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 == v3;
}

uint64_t IOAccessoryManagerGetUSBConnectType(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (!(_DWORD)v5)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"IOAccessoryUSBConnectType");
      int valuePtr = -1431655766;
      if (Value)
      {
        int v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        int v8 = valuePtr;
        if (!v7) {
          int v8 = -1;
        }
      }

      else
      {
        int v8 = -1;
      }

      *a2 = v8;
    }

    if (a3) {
      *a3 = CFDictionaryGetValue(properties, @"IOAccessoryUSBActive") == (const void *)*MEMORY[0x189604DE8];
    }
    CFRelease(properties);
  }

  return v5;
}

uint64_t IOAccessoryManagerGetUSBConnectTypePublished(io_registry_entry_t a1, int *a2, BOOL *a3)
{
  CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (!(_DWORD)v5)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"IOAccessoryUSBConnectTypePublished");
      int valuePtr = -1431655766;
      if (Value)
      {
        int v7 = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        int v8 = valuePtr;
        if (!v7) {
          int v8 = -1;
        }
      }

      else
      {
        int v8 = -1;
      }

      *a2 = v8;
    }

    if (a3) {
      *a3 = CFDictionaryGetValue(properties, @"IOAccessoryUSBActive") == (const void *)*MEMORY[0x189604DE8];
    }
    CFRelease(properties);
  }

  return v5;
}

uint64_t IOAccessoryManagerGetUSBChargingVoltage(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3 = 3758097113LL;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryUSBChargingVoltage",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0LL;
    }
    else {
      *a2 = 0;
    }
    CFRelease(v5);
  }

  return v3;
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v3 = 3758097113LL;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryUSBCurrentLimit",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0LL;
    }
    else {
      *a2 = 0;
    }
    CFRelease(v5);
  }

  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerRestoreUSBCurrentLimitBase(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 4u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitBase(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097113LL;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryUSBCurrentLimitBase",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0LL;
    }
    else {
      uint64_t v3 = 3758097113LL;
    }
    CFRelease(v5);
  }

  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentOffset(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitOffset(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097136LL;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryUSBCurrentLimitOffset",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0LL;
    }
    else {
      uint64_t v3 = 3758097136LL;
    }
    CFRelease(v5);
  }

  return v3;
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitMaximum(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 6u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerClearUSBCurrentLimitMaximum(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitMaximum(io_registry_entry_t a1, void *a2)
{
  uint64_t v3 = 3758097136LL;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryUSBCurrentLimitMaximum",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    uint64_t v5 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, a2)) {
      uint64_t v3 = 0LL;
    }
    else {
      uint64_t v3 = 3758097136LL;
    }
    CFRelease(v5);
  }

  return v3;
}

uint64_t IOAccessoryManagerConfigurePower(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerConfigurePowerLowVoltageSelect(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x11u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerSetPowerDuringSleep(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerRequestAccessoryPowerOff(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x12u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryManagerRevokeFeatures(mach_port_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = 0LL;
  input[1] = a2;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerAllowFeatures(mach_port_t a1, unsigned int a2)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = 0LL;
  return IOConnectCallScalarMethod(a1, 0xDu, input, 2u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerRevokeHighCurrentPower(mach_port_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  __int128 v2 = xmmword_187E95A90;
  return IOConnectCallScalarMethod(a1, 0xDu, (const uint64_t *)&v2, 2u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerConfigureUSBMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerEnableUSBHostMode(mach_port_t a1, int a2)
{
  uint64_t input = 2LL * (a2 != 0);
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerSetBatteryPackMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerSetGoldbondMode(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x13u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerConfigureGoldbondMode(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0x14u, input, 2u, 0LL, 0LL);
}

BOOL IOAccessoryManagerGetBatteryPackMode(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryBatteryPack",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  CFTypeRef v2 = CFProperty;
  CFTypeRef v3 = (CFTypeRef)*MEMORY[0x189604DE8];
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 == v3;
}

uint64_t IOAccessoryManagerSetUSBPowerIgnore(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xFu, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerSetUSBPreventSourceDetection(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Au, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerSetAttachStyle(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerOverrideDetect(mach_port_t a1, unsigned int a2, int a3)
{
  v4[3] = *MEMORY[0x1895F89C0];
  v4[0] = 1LL;
  v4[1] = a2;
  v4[2] = a3;
  return IOConnectCallScalarMethod(a1, 0xAu, v4, 3u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerOverrideDigitalID(mach_port_t a1, void *inputStruct)
{
  return IOConnectCallStructMethod(a1, 0xBu, inputStruct, 6uLL, 0LL, 0LL);
}

uint64_t IOAccessoryManagerOverrideDPDNConfig(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  input[4] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  input[2] = 0LL;
  uint64_t input[3] = 0LL;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerOverrideDPDNBTConfig( mach_port_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  input[4] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint64_t input[3] = a5;
  return IOConnectCallScalarMethod(a1, 0xEu, input, 4u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerOverrideDetectClear(mach_port_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  __int128 v2 = xmmword_187E95A70;
  uint64_t v3 = -1LL;
  return IOConnectCallScalarMethod(a1, 0xAu, (const uint64_t *)&v2, 3u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerCheckPinVoltage( mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x10u, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerSelectEisPin(mach_port_t a1, unsigned int a2, unsigned int a3, uint64_t *output)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Bu, input, 2u, output, &outputCnt);
}

uint64_t IOAccessoryManagerGetFreePinMask(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x1Cu, 0LL, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMGetAvailablePins(mach_port_t a1, uint64_t *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t output = 0LL;
  uint64_t v9 = 0LL;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(a1, 0x1Du, 0LL, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    uint64_t v6 = v9;
    *a2 = output;
    *a3 = v6;
  }

  return result;
}

uint64_t IOAccessoryManagerSetLDCM(mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, void *a5)
{
  input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t output = 0LL;
  uint64_t v11 = 0LL;
  uint32_t outputCnt = 2;
  uint64_t result = IOConnectCallScalarMethod(a1, 0x1Eu, input, 2u, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    uint64_t v8 = v11;
    *a4 = output;
    *a5 = v8;
  }

  return result;
}

uint64_t IOAccessoryManagerLDCMSetLiquidDetected(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x1Fu, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerLDCMEnableMitigations(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x20u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerLDCMEnableUserOverride(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x21u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerLDCMGetMeasurementStatus(mach_port_t a1, uint64_t *output)
{
  uint32_t outputCnt = 1;
  return IOConnectCallScalarMethod(a1, 0x22u, 0LL, 0, output, &outputCnt);
}

uint64_t IOAccessoryManagerLDCMSetState(mach_port_t a1, uint64_t *input)
{
  return IOConnectCallScalarMethod(a1, 0x23u, input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerApplyMGIDWorkaround(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0x24u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryManagerForcePowerGateEnable(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 0x25u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerForceUSBConnectActive(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryManagerPowerModeIsSupported(io_registry_entry_t a1, int a2)
{
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessorySupportedPowerModes",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!CFProperty) {
    return 0LL;
  }
  uint64_t v5 = CFProperty;
  int valuePtr = a2;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v10.length = CFArrayGetCount(v5);
  v10.location = 0LL;
  uint64_t v7 = CFArrayContainsValue(v5, v10, v6);
  CFRelease(v6);
  CFRelease(v5);
  return v7;
}

CFArrayRef IOAccessoryManagerPowerModeCurrentLimit(io_registry_entry_t a1, int a2)
{
  uint64_t result = (const __CFArray *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryPowerCurrentLimits",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v4 = result;
    if (a2)
    {
      CFIndex v5 = (a2 - 1);
      if (CFArrayGetCount(result) > v5)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v4, v5);
        if (ValueAtIndex) {
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
        }
      }
    }

    CFRelease(v4);
    return (const __CFArray *)valuePtr;
  }

  return result;
}

uint64_t IOAccessoryManagerSetAccessoryUsedCurrent()
{
  return 0LL;
}

uint64_t IOAccessoryManagerSetAccessoryRequestedCurrent()
{
  return 0LL;
}

uint64_t IOAccessoryManagerPowerDuringSleepIsSupported(io_registry_entry_t a1)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryManagerSleepPower",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    return 1LL;
  }

  return result;
}

uint64_t IOAccessoryManagerRequestLdcmMeasurement(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x15u, v3, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerGetLdcmParams(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt = 126LL;
  return IOConnectCallStructMethod(a1, 0x16u, 0LL, 0LL, outputStruct, &outputStructCnt);
}

uint64_t IOAccessoryManagerSetVoltageDetected(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0x17u, v3, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryManagerChallengeCryptoDock9Pin( mach_port_t a1, int a2, void *inputStruct, void *outputStruct)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  uint32_t outputCnt = 0;
  size_t v5 = 16LL;
  return IOConnectCallMethod(a1, 0x18u, input, 1u, inputStruct, 8uLL, 0LL, &outputCnt, outputStruct, &v5);
}

uint64_t IOAccessoryManagerChallengeCryptoDock( mach_port_t a1, int a2, void *inputStruct, uint64_t a4, void *outputStruct, uint64_t a6, uint64_t *a7)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a4;
  uint64_t input[2] = a6;
  uint32_t outputCnt = 1;
  size_t v8 = 16LL;
  return IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v8);
}

uint64_t IOAccessoryManagerChallengeCryptoLength(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2)
  {
    io_object_t AuthCP = __findAuthCP();
    if (AuthCP)
    {
      io_object_t v6 = AuthCP;
      uint64_t v7 = 64LL;
      uint64_t v8 = 32LL;
    }

    else
    {
      io_object_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1);
      if (!ServiceWithPrimaryPort) {
        return 3758097084LL;
      }
      io_object_t v6 = ServiceWithPrimaryPort;
      BOOLean_t v10 = IOObjectConformsTo(ServiceWithPrimaryPort, "IOAccessoryDock9Pin");
      uint64_t v8 = 15LL;
      if (v10) {
        uint64_t v8 = 8LL;
      }
      uint64_t v7 = 16LL;
    }

    *a1 = v8;
    *a2 = v7;
    IOObjectRelease(v6);
    return 0LL;
  }

  return result;
}

uint64_t __findAuthCP()
{
  *(void *)existing = 0LL;
  v0 = IOServiceMatching("AppleAuthCP");
  if (v0)
  {
    if (!IOServiceGetMatchingServices(*MEMORY[0x1896086A8], v0, &existing[1]) && existing[1] != 0)
    {
      uint64_t v2 = IOIteratorNext(existing[1]);
      if ((_DWORD)v2)
      {
        uint64_t v3 = v2;
        uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        do
        {
          CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"flags", v4, 0);
          if (CFProperty)
          {
            io_object_t v6 = CFProperty;
            if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, existing) && BYTE2(existing[0]) << 16 == 0x40000)
            {
              CFRelease(v6);
              IOObjectRelease(existing[1]);
              uint64_t v8 = 0LL;
              IORegistryEntryGetRegistryEntryID(v3, &v8);
              return v3;
            }

            CFRelease(v6);
          }

          else
          {
            puts("numberref is NULL");
          }

          IOObjectRelease(v3);
          uint64_t v3 = IOIteratorNext(existing[1]);
        }

        while ((_DWORD)v3);
      }

      IOObjectRelease(existing[1]);
    }
  }

  return 0LL;
}

uint64_t IOAccessoryManagerChallengeCryptoMLBChip4(const void *a1, uint64_t a2, UInt8 **a3, CFIndex *a4)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  io_connect_t connect = 0;
  uint64_t v4 = 3758097085LL;
  *(_OWORD *)md = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v42 = 0u;
  if (!a1 || (CC_LONG v5 = a2, !a2))
  {
    v37 = "invalid inCmd";
LABEL_39:
    puts(v37);
    return v4;
  }

  if (!a3 || !a4)
  {
    v37 = "invalid outRsp";
    goto LABEL_39;
  }

  io_service_t AuthCP = __findAuthCP();
  if (!AuthCP) {
    return 3758097084LL;
  }
  io_object_t v10 = AuthCP;
  uint64_t v11 = IOServiceOpen(AuthCP, *MEMORY[0x1895FBBE0], 0, &connect);
  if ((_DWORD)v11)
  {
    uint64_t v20 = v11;
    printf("IOServiceOpen failed: 0x%x\n", v11);
    v21 = 0LL;
    v22 = 0LL;
    v14 = 0LL;
    goto LABEL_10;
  }

  CC_SHA256(a1, v5, md);
  v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], md, 32LL);
  v14 = v13;
  if (!v13)
  {
    puts("CFDataCreate failed");
    v21 = 0LL;
LABEL_46:
    v22 = 0LL;
    goto LABEL_28;
  }

  io_connect_t v15 = connect;
  *(void *)&__int128 v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&outputStruct[96] = v16;
  *(_OWORD *)&outputStruct[112] = v16;
  *(_OWORD *)&outputStruct[64] = v16;
  *(_OWORD *)&outputStruct[80] = v16;
  *(_OWORD *)&outputStruct[32] = v16;
  *(_OWORD *)&outputStruct[48] = v16;
  *(_OWORD *)outputStruct = v16;
  *(_OWORD *)&outputStruct[16] = v16;
  size_t outputStructCnt = 128LL;
  BytePtr = CFDataGetBytePtr(v13);
  size_t Length = CFDataGetLength(v14);
  uint64_t v19 = IOConnectCallStructMethod(v15, 0, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!(_DWORD)v19)
  {
    v23 = CFDataCreate(v12, outputStruct, outputStructCnt);
    v21 = v23;
    if (v23)
    {
      if (CFDataGetLength(v23) == 64)
      {
        v49.location = 0LL;
        v49.length = 64LL;
        CFDataGetBytes(v21, v49, buffer);
        int v24 = (char)v43;
        if ((v43 & 0x80u) == 0LL) {
          char v25 = 32;
        }
        else {
          char v25 = 33;
        }
        *(_OWORD *)&outputStruct[112] = 0u;
        if ((buffer[0] & 0x80u) == 0) {
          char v26 = 32;
        }
        else {
          char v26 = 33;
        }
        memset(&outputStruct[4], 0, 112);
        outputStruct[0] = 48;
        outputStruct[1] = (v25 + v26) | 4;
        outputStruct[2] = 2;
        outputStruct[3] = v26;
        if ((buffer[0] & 0x80u) == 0) {
          uint64_t v27 = 4LL;
        }
        else {
          uint64_t v27 = 5LL;
        }
        v28 = &outputStruct[v27];
        __int128 v29 = v42;
        *(_OWORD *)v28 = *(_OWORD *)buffer;
        *((_OWORD *)v28 + 1) = v29;
        v28[32] = 2;
        uint64_t v30 = v27 | 0x22;
        v28[33] = v25;
        if (v24 < 0)
        {
          outputStruct[v30] = 0;
          LODWORD(v30) = v27 + 35;
        }

        __int128 v31 = v44;
        v32 = &outputStruct[v30];
        _OWORD *v32 = v43;
        v32[1] = v31;
        v33 = CFDataCreate(v12, outputStruct, (v30 + 32));
        v22 = v33;
        if (v33 && CFDataGetLength(v33))
        {
          CFIndex v34 = CFDataGetLength(v22);
          v35 = (UInt8 *)calloc(1uLL, v34);
          *a3 = v35;
          v50.location = 0LL;
          v50.length = v34;
          CFDataGetBytes(v22, v50, v35);
          uint64_t v4 = 0LL;
          *a4 = v34;
        }

        else
        {
          puts("outSignatureDer is empty");
        }

        goto LABEL_28;
      }

      v38 = "outSignature length is invalid";
    }

    else
    {
      v38 = "outSignature is NULL";
    }

    puts(v38);
    goto LABEL_46;
  }

  uint64_t v20 = v19;
  printf("cpCreateSignature failed: 0x%x\n", v19);
  v21 = 0LL;
  v22 = 0LL;
LABEL_10:
  uint64_t v4 = v20;
LABEL_28:
  IOObjectRelease(v10);
  if (connect)
  {
    IOServiceClose(connect);
    io_connect_t connect = 0;
  }

  if (v14) {
    CFRelease(v14);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v22) {
    CFRelease(v22);
  }
  return v4;
}

uint64_t IOAccessoryManagerChallengeCryptoDockAuthChip( mach_port_t a1, int a2, void *inputStruct, uint64_t a4, void *outputStruct, uint64_t a6, uint64_t *a7)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a4;
  uint64_t input[2] = a6;
  uint32_t outputCnt = 1;
  size_t v8 = 16LL;
  if (a1) {
    return IOConnectCallMethod(a1, 0x19u, input, 3u, inputStruct, 0xFuLL, a7, &outputCnt, outputStruct, &v8);
  }
  else {
    return 3758097084LL;
  }
}

uint64_t IOAccessoryPortGetServiceWithPort(int a1)
{
  int valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryPort");
  keys = @"IOAccessoryDevicePort";
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v3 = CFDictionaryCreate( v2,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x1896086A8], v1);
}

CFNumberRef IOAccessoryPortGetPort(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryDevicePort",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryPortGetTransportType(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryTransportType",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryPortGetStreamType(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryPortStreamType",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFNumberRef IOAccessoryPortGetManagerPrimaryPort(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryPortManagerPrimaryPort",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v2 = result;
    if (!CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr)) {
      unsigned int valuePtr = 0;
    }
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

uint64_t IOAccessoryPortGetManagerService(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  uint64_t result;
  BOOL v3;
  BOOLean_t v4;
  io_registry_entry_t parent;
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent);
  uint64_t result = parent;
  if (ParentEntry) {
    CFDictionaryRef v3 = 1;
  }
  else {
    CFDictionaryRef v3 = parent == 0;
  }
  if (!v3)
  {
    uint64_t v4 = IOObjectConformsTo(parent, "IOAccessoryManager");
    uint64_t result = parent;
    if (!v4)
    {
      IOObjectRelease(parent);
      return 0LL;
    }
  }

  return result;
}

uint64_t IOAccessoryPortTransmitData( mach_port_t a1, void *inputStruct, size_t inputStructCnt, unsigned int a4)
{
  uint64_t input = a4;
  return IOConnectCallMethod(a1, 0, &input, 1u, inputStruct, inputStructCnt, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAccessoryPortWaitSendDone(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryPortSetUSBRoleSwitchMask(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(a1, 2u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

CFRunLoopSourceRef IOAccessoryPortCreateRunLoopSource(uint64_t a1, UInt8 a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v16;
  mach_msg_return_t v17;
  mach_msg_header_t v18;
  Boolean shouldFreeInfo[17];
  CFMachPortContext context;
  size_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 40LL);
  if (!Mutable) {
    return 0LL;
  }
  io_object_t v10 = Mutable;
  memset(&context, 0, sizeof(context));
  memset(shouldFreeInfo, 170, sizeof(shouldFreeInfo));
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((void *)MutableBytePtr + 2) = a3;
  MutableBytePtr[24] = a2;
  *((void *)MutableBytePtr + 4) = a4;
  if (MEMORY[0x1895B8A8C]( a1,  0LL,  *MEMORY[0x1895FBBE0],  &shouldFreeInfo[9],  &shouldFreeInfo[1],  1LL)
    || (*((void *)MutableBytePtr + 1) = *(void *)&shouldFreeInfo[9],
        uint64_t NotificationPort = IODataQueueAllocateNotificationPort(),
        (*((_DWORD *)MutableBytePtr + 1) = NotificationPort) == 0)
    || MEMORY[0x1895B8A98](a1, 0LL, NotificationPort, 0LL))
  {
    CFRelease(v10);
    return 0LL;
  }

  context.version = 0LL;
  context.info = v10;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1896030F0];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1896030E0];
  context.copyDescription = 0LL;
  io_connect_t v15 = CFMachPortCreateWithPort( v8,  *((_DWORD *)MutableBytePtr + 1),  (CFMachPortCallBack)IOAccessoryPortMachPortCallBack,  &context,  shouldFreeInfo);
  if (shouldFreeInfo[0]) {
    CFRelease(v10);
  }
  if (!v15) {
    return 0LL;
  }
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v8, v15, 0LL);
  CFRelease(v15);
  if (RunLoopSource)
  {
    if (IODataQueueDataAvailable(*((IODataQueueMemory **)MutableBytePtr + 1)))
    {
      *(void *)&v18.msgh_bits = 0x1800000014LL;
      v18.msgh_remote_port = *((_DWORD *)MutableBytePtr + 1);
      v18.msgh_local_port = 0;
      *(void *)&v18.msgh_voucher_port = 0LL;
      __int128 v16 = mach_msg(&v18, 17, 0x18u, 0, 0, 0, 0);
      v17 = v16;
      if (v16 && v16 != 268435460) {
        CFRelease(RunLoopSource);
      }
      if (v17 != 268435460 && v17) {
        return 0LL;
      }
    }
  }

  return RunLoopSource;
}

void IOAccessoryPortMachPortCallBack(int a1, int a2, int a3, CFMutableDataRef theData)
{
  if (theData)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(theData);
    if (MutableBytePtr)
    {
      CC_LONG v5 = MutableBytePtr;
      if (MutableBytePtr[24])
      {
        (*((void (**)(void, void))MutableBytePtr + 2))(0LL, *((void *)MutableBytePtr + 4));
      }

      else
      {
        while (1)
        {
          size_t v8 = IODataQueuePeek(*((IODataQueueMemory **)v5 + 1));
          if (!v8) {
            break;
          }
          unsigned int v7 = *(unsigned __int16 *)v8->data;
          data = v8->data;
          if (v7 > 0x100) {
            break;
          }
          (*((void (**)(UInt8 *, void))v5 + 2))(data, *((void *)v5 + 4));
          IODataQueueDequeue(*((IODataQueueMemory **)v5 + 1), 0LL, 0LL);
        }
      }
    }
  }

uint64_t IOAccessoryIDBusGetServiceWithManagerPrimaryPort(int a1)
{
  int valuePtr = a1;
  v1 = IOServiceMatching("IOAccessoryIDBusTransport");
  keys = @"IOAccessoryPortManagerPrimaryPort";
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v3 = CFDictionaryCreate( v2,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
  CFRelease(v3);
  CFRelease(keys);
  CFRelease(values);
  return IOServiceGetMatchingService(*MEMORY[0x1896086A8], v1);
}

uint64_t IOAccessoryIDBusTransferData( mach_port_t a1, void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t a5, unsigned int a6, double a7)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  size_t v8 = a5;
  input[0] = (unint64_t)(a7 * 1000000.0);
  input[1] = a6;
  return IOConnectCallMethod(a1, 0, input, 2u, inputStruct, inputStructCnt, 0LL, 0LL, outputStruct, &v8);
}

uint64_t IOAccessoryIDBusCancelTransfer(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 1u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryIDBusSendBreak(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 2u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryIDBusSendBusReset(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 3u, 0LL, 0, 0LL, 0LL);
}

uint64_t IOAccessoryIDBusAssertBusReset(mach_port_t a1, int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0LL, 0LL);
}

uint64_t IOAccessoryIDBusGetMaxTransfer(uint64_t a1, void *a2, void *a3)
{
  io_registry_entry_t entry = -1431655766;
  uint64_t v5 = MEMORY[0x1895B8A80](a1, &entry);
  if (!(_DWORD)v5)
  {
    CFMutableDictionaryRef properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = IORegistryEntryCreateCFProperties(entry, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
    if (!(_DWORD)v5)
    {
      uint64_t v5 = 3758097084LL;
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxTransmit");
      unsigned int v7 = (const __CFNumber *)CFDictionaryGetValue(properties, "IOAccessoryIDBusTransportMaxReceive");
      int valuePtr = -1431655766;
      uint64_t v8 = 3758097084LL;
      if (Value && CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
      {
        uint64_t v8 = 0LL;
        *a2 = valuePtr;
      }

      if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
      {
        *a3 = valuePtr;
        uint64_t v5 = v8;
      }

      CFRelease(properties);
    }
  }

  return v5;
}

CFNumberRef IOAccessoryEAInterfaceGetTransportType(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"TransportType",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = 0;
  if (result)
  {
    uint64_t v2 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

CFTypeRef IOAccessoryEAInterfaceCopyProtocolString(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"ProtocolString", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceVendorName", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceProductName", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceModelNumber", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceHardwareRevision", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceFirmwareRevision", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceSerialNumber", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryEAInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceDockType", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

uint64_t IOAccessoryEAInterfaceRegisterReceiveCallback( mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  reference[0] = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  reference[1] = a3;
  __int128 v8 = a4;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 2u, MachPort, reference, 3u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAccessoryEAInterfaceReceiveData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, 0LL, 0LL, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryEAInterfaceSendData(mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 0, inputStruct, inputStructCnt, 0LL, 0LL);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceVendorName", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceProductName", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceModelNumber", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceHardwareRevision", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceFirmwareRevision", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceSerialNumber", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFTypeRef IOAccessoryOOBPairingInterfaceCopyDeviceDockType(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"DeviceDockType", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

CFNumberRef IOAccessoryOOBPairingInterfaceCopyDevicePlatformID(io_registry_entry_t a1)
{
  uint64_t result = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"DevicePlatformID",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (result)
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr)) {
      return (const __CFNumber *)valuePtr;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

CFTypeRef IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty( a1,  @"DeviceSupportedOOBPairingTypes",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
}

uint64_t IOAccessoryOOBPairingInterfaceGetActivePairingType(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"DeviceActiveOOBPairingType",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  unsigned int valuePtr = -1431655766;
  if (CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr)) {
    return valuePtr;
  }
  else {
    return 2LL;
  }
}

uint64_t IOAccessoryOOBPairingInterfaceSupports2Way(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( a1,  @"DeviceSupportsSupports2Way",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  int valuePtr = -1431655766;
  int Value = CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
  unsigned __int8 v3 = valuePtr;
  if (!Value) {
    return 0;
  }
  return v3;
}

uint64_t IOAccessoryOOBPairingInterfaceRegisterReceiveCallback( mach_port_t a1, IONotificationPortRef notify, uint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  reference[0] = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  reference[1] = a3;
  __int128 v8 = a4;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 0, MachPort, reference, 3u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingInfo( mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 1u, inputStruct, inputStructCnt, 0LL, 0LL);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingInfo( mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 2u, 0LL, 0LL, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingData( mach_port_t a1, void *inputStruct, size_t inputStructCnt)
{
  return IOConnectCallStructMethod(a1, 3u, inputStruct, inputStructCnt, 0LL, 0LL);
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingData( mach_port_t a1, void *outputStruct, size_t *outputStructCnt)
{
  return IOConnectCallStructMethod(a1, 4u, 0LL, 0LL, outputStruct, outputStructCnt);
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategories(io_registry_entry_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  io_object_t v6 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    unsigned int v7 = 0;
    if (a2 && a3) {
      unsigned int v7 = *a3;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    __int16 v21 = 1024;
    io_registry_entry_t v22 = a1;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    _os_log_impl(&dword_187E8F000, v6, OS_LOG_TYPE_INFO, "%s: service %d, outDataCount %u", buf, 0x18u);
  }

  if (!a2 || !a3)
  {
    uint64_t v14 = 3758097090LL;
    v13 = (os_log_s *)gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    unsigned int v15 = 0;
    goto LABEL_23;
  }

  if (!*a3) {
    goto LABEL_26;
  }
  CFTypeRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryConfigStreamCategoryList",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 3758097090LL;
    v13 = (os_log_s *)gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    goto LABEL_22;
  }

  IOAccessoryConfigStreamInterfaceGetCategories_cold_2();
  if (!CFProperty) {
    goto LABEL_26;
  }
LABEL_13:
  unsigned int Count = CFArrayGetCount(CFProperty);
  unsigned int v10 = *a3;
  if (Count < *a3) {
    unsigned int v10 = Count;
  }
  if (v10 >= 8) {
    uint64_t v11 = 8LL;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG)) {
    IOAccessoryConfigStreamInterfaceGetCategories_cold_1(a1, v11, v12);
  }
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 0x40000000LL;
  v17[2] = __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke;
  v17[3] = &__block_descriptor_tmp;
  int v18 = v11;
  v17[4] = a2;
  __iterateDictionaryList(CFProperty, v11, (uint64_t)v17);
  *a3 = v11;
  CFRelease(CFProperty);
  v13 = (os_log_s *)gLogObject;
  uint64_t v14 = 0LL;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = 0LL;
LABEL_22:
    unsigned int v15 = *a3;
LABEL_23:
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "IOAccessoryConfigStreamInterfaceGetCategories";
    __int16 v21 = 1024;
    io_registry_entry_t v22 = a1;
    __int16 v23 = 1024;
    unsigned int v24 = v15;
    __int16 v25 = 1024;
    int v26 = v14;
    _os_log_impl(&dword_187E8F000, v13, OS_LOG_TYPE_DEFAULT, "%s: service %d, *outDataCount %u, ret %x", buf, 0x1Eu);
  }

  return v14;
}

void __iterateDictionaryList(const __CFArray *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  io_object_t v6 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "__iterateDictionaryList";
    __int16 v15 = 2048;
    CFIndex Count = CFArrayGetCount(a1);
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 1024;
    BOOL v20 = a3 != 0;
    _os_log_debug_impl( &dword_187E8F000,  v6,  OS_LOG_TYPE_DEBUG,  "%s: array %ld values, upToCount %ld, handler %d",  buf,  0x26u);
  }

  uint64_t v7 = a2 - 1;
  if (a2 >= 1 && a1 && a3)
  {
    CFIndex v8 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
      unsigned int v10 = (os_log_s *)gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        CFIndex v12 = CFDictionaryGetCount(ValueAtIndex);
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = "__iterateDictionaryList";
        __int16 v15 = 2048;
        CFIndex Count = v8;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        _os_log_debug_impl( &dword_187E8F000,  v10,  OS_LOG_TYPE_DEBUG,  "%s: call handler, i %ld, item %ld values",  buf,  0x20u);
      }

      else {
        BOOL v11 = 1;
      }
      ++v8;
    }

    while (!v11);
  }

uint64_t __IOAccessoryConfigStreamInterfaceGetCategories_block_invoke( uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  io_object_t v6 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *(_DWORD *)(a1 + 40);
    int v10 = 136315906;
    BOOL v11 = "IOAccessoryConfigStreamInterfaceGetCategories_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 2048;
    CFIndex Count = CFDictionaryGetCount(a3);
    _os_log_debug_impl( &dword_187E8F000,  v6,  OS_LOG_TYPE_DEBUG,  "%s: callback, index %ld / %d, entry %ld values",  (uint8_t *)&v10,  0x26u);
  }

  int Value = (const __CFNumber *)CFDictionaryGetValue(a3, @"CategoryID");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(void *)(a1 + 32) + 8 * a2));
  }
  return 1LL;
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategoryProperties( io_registry_entry_t a1, int a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2000000000LL;
  uint64_t v38 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2000000000LL;
  uint64_t v34 = -1LL;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  CFIndex v8 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = 0;
    if (a3 && a4) {
      unsigned int v9 = *a4;
    }
    *(_DWORD *)buf = 136315906;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v41 = 1024;
    io_registry_entry_t v42 = a1;
    __int16 v43 = 1024;
    int v44 = a2;
    __int16 v45 = 1024;
    *(_DWORD *)__int128 v46 = v9;
    _os_log_impl(&dword_187E8F000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, outDataCount %u", buf, 0x1Eu);
  }

  if (!a3 || !a4)
  {
    uint64_t v14 = 3758097090LL;
    uint64_t v21 = (os_log_s *)gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    unsigned int v26 = 0;
    goto LABEL_35;
  }

  if (!*a4) {
    goto LABEL_26;
  }
  CFTypeRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryConfigStreamCategoryList",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    if (CFProperty) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 3758097090LL;
    uint64_t v21 = (os_log_s *)gLogObject;
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }

  IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1();
  if (!CFProperty) {
    goto LABEL_26;
  }
LABEL_13:
  CFIndex Count = CFArrayGetCount(CFProperty);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 0x40000000LL;
  v30[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke;
  v30[3] = &unk_18A166FA0;
  v30[4] = &v31;
  v30[5] = &v35;
  __findCategoryEntry(CFProperty, a2, (uint64_t)v30);
  uint64_t v13 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = 8LL;
    if (Count < 8) {
      uint64_t v22 = Count;
    }
    uint64_t v23 = v32[3];
    uint64_t v24 = v36[3];
    *(_DWORD *)buf = 136316418;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v41 = 1024;
    io_registry_entry_t v42 = a1;
    __int16 v43 = 1024;
    int v44 = a2;
    __int16 v45 = 2048;
    *(void *)__int128 v46 = v23;
    *(_WORD *)&v46[8] = 2048;
    uint64_t v47 = v22;
    __int16 v48 = 2112;
    uint64_t v49 = v24;
    _os_log_debug_impl( &dword_187E8F000,  v13,  OS_LOG_TYPE_DEBUG,  "%s: service %d, categoryID 0x%x, found catIndex %ld, categoryCount %ld, categoryItem %@",  buf,  0x36u);
  }

  uint64_t v14 = 3758097090LL;
  if ((v32[3] & 0x8000000000000000LL) == 0)
  {
    int Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v36[3], @"PropertyList");
    __int16 v16 = (os_log_s *)gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v32[3];
      *(_DWORD *)buf = 136316162;
      v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
      __int16 v41 = 1024;
      io_registry_entry_t v42 = a1;
      __int16 v43 = 1024;
      int v44 = a2;
      __int16 v45 = 2048;
      *(void *)__int128 v46 = v25;
      *(_WORD *)&v46[8] = 2112;
      uint64_t v47 = (uint64_t)Value;
      _os_log_debug_impl( &dword_187E8F000,  v16,  OS_LOG_TYPE_DEBUG,  "%s: service %d, category 0x%x / %ld, found propertyList %@",  buf,  0x2Cu);
      if (Value) {
        goto LABEL_17;
      }
    }

    else if (Value)
    {
LABEL_17:
      unsigned int v17 = CFArrayGetCount(Value);
      unsigned int v18 = *a4;
      if (v17 < *a4) {
        unsigned int v18 = v17;
      }
      if (v18 >= 0x10) {
        uint64_t v19 = 16LL;
      }
      else {
        uint64_t v19 = v18;
      }
      BOOL v20 = (os_log_s *)gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = v32[3];
        *(_DWORD *)buf = 136316162;
        v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
        __int16 v41 = 1024;
        io_registry_entry_t v42 = a1;
        __int16 v43 = 1024;
        int v44 = a2;
        __int16 v45 = 2048;
        *(void *)__int128 v46 = v28;
        *(_WORD *)&v46[8] = 1024;
        LODWORD(v47) = v19;
        _os_log_debug_impl( &dword_187E8F000,  v20,  OS_LOG_TYPE_DEBUG,  "%s: service %d, category 0x%x / %ld, propertyCount %d",  buf,  0x28u);
      }

      v29[0] = v12;
      v29[1] = 0x40000000LL;
      v29[2] = __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_128;
      v29[3] = &__block_descriptor_tmp_131;
      v29[4] = a3;
      __iterateDictionaryList(Value, v19, (uint64_t)v29);
      uint64_t v14 = 0LL;
      *a4 = v19;
      goto LABEL_33;
    }

    uint64_t v14 = 3758097112LL;
  }

LABEL_33:
  CFRelease(CFProperty);
  uint64_t v21 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
LABEL_34:
    unsigned int v26 = *a4;
LABEL_35:
    *(_DWORD *)buf = 136316162;
    v40 = "IOAccessoryConfigStreamInterfaceGetCategoryProperties";
    __int16 v41 = 1024;
    io_registry_entry_t v42 = a1;
    __int16 v43 = 1024;
    int v44 = a2;
    __int16 v45 = 1024;
    *(_DWORD *)__int128 v46 = v26;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v14;
    _os_log_impl( &dword_187E8F000,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: service %d, categoryID 0x%x, outDataCount %u, ret %x",  buf,  0x24u);
  }

LABEL_36:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v14;
}

void __findCategoryEntry(const __CFArray *a1, int a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = -1LL;
  io_object_t v6 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
  {
    CFIndex Count = CFArrayGetCount(a1);
    *(_DWORD *)buf = 136315906;
    BOOL v20 = "__findCategoryEntry";
    __int16 v21 = 2048;
    CFIndex v22 = Count;
    __int16 v23 = 1024;
    int v24 = a2;
    __int16 v25 = 1024;
    BOOL v26 = a3 != 0;
    _os_log_debug_impl( &dword_187E8F000,  v6,  OS_LOG_TYPE_DEBUG,  "%s: categoryList %ld, categoryID %d, handler %d",  buf,  0x22u);
    if (!a1) {
      goto LABEL_7;
    }
  }

  else if (!a1)
  {
    goto LABEL_7;
  }

  if (a3)
  {
    CFIndex v7 = CFArrayGetCount(a1);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = ____findCategoryEntry_block_invoke;
    v9[3] = &unk_18A167028;
    __int16 v10 = a2;
    v9[4] = &v11;
    v9[5] = &v15;
    __iterateDictionaryList(a1, v7, (uint64_t)v9);
    if ((v12[3] & 0x8000000000000000LL) == 0)
    {
      if (v16[3]) {
        (*(void (**)(uint64_t))(a3 + 16))(a3);
      }
    }
  }

LABEL_7:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke( uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = a3;
  return result;
}

uint64_t __IOAccessoryConfigStreamInterfaceGetCategoryProperties_block_invoke_128( uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  int Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"PropertyID");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(*(void *)(a1 + 32) + 8 * a2));
  }
  return 1LL;
}

uint64_t IOAccessoryConfigStreamInterfaceGetProperty( io_registry_entry_t a1, int a2, int a3, UInt8 *a4, CFIndex *a5)
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000LL;
  uint64_t v51 = 0LL;
  uint64_t v44 = 0LL;
  __int16 v45 = &v44;
  uint64_t v46 = 0x2000000000LL;
  uint64_t v47 = -1LL;
  uint64_t v40 = 0LL;
  __int16 v41 = &v40;
  uint64_t v42 = 0x2000000000LL;
  uint64_t v43 = -1LL;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  unsigned int v9 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    CFIndex v10 = 0LL;
    if (a4 && a5) {
      CFIndex v10 = *a5;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v72) = 1024;
    *(_DWORD *)((char *)&v72 + 2) = a3;
    WORD3(v72) = 2048;
    *((void *)&v72 + 1) = v10;
    _os_log_impl( &dword_187E8F000,  v9,  OS_LOG_TYPE_INFO,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu",  buf,  0x28u);
  }

  uint64_t v11 = 3758097090LL;
  if (a4) {
    BOOL v12 = a5 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  char v13 = v12;
  char v38 = v13;
  if (!v12 && *a5)
  {
    CFTypeRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty( a1,  @"IOAccessoryConfigStreamCategoryList",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (!os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      if (!CFProperty) {
        goto LABEL_40;
      }
LABEL_18:
      uint64_t v67 = 0LL;
      v68 = &v67;
      uint64_t v69 = 0x2000000000LL;
      uint64_t v70 = 0LL;
      uint64_t v63 = 0LL;
      v64 = &v63;
      uint64_t v65 = 0x2000000000LL;
      uint64_t v66 = -1LL;
      uint64_t v59 = 0LL;
      v60 = &v59;
      uint64_t v61 = 0x2000000000LL;
      uint64_t v62 = -1LL;
      uint64_t v15 = (os_log_s *)gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        CFIndex Count = CFArrayGetCount(CFProperty);
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = "__findPropertyEntry";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = Count;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v72) = a2;
        WORD2(v72) = 1024;
        *(_DWORD *)((char *)&v72 + 6) = a3;
        WORD5(v72) = 1024;
        HIDWORD(v72) = 1;
        _os_log_debug_impl( &dword_187E8F000,  v15,  OS_LOG_TYPE_DEBUG,  "%s: categoryList %ld, categoryID %d, propertyID %d, handler %d",  buf,  0x28u);
      }

      CFIndex v16 = CFArrayGetCount(CFProperty);
      uint64_t v17 = MEMORY[0x1895F87A8];
      v58[0] = MEMORY[0x1895F87A8];
      v58[1] = 0x40000000LL;
      v58[2] = ____findPropertyEntry_block_invoke;
      v58[3] = &unk_18A167050;
      v58[4] = &v63;
      v58[5] = &v67;
      __findCategoryEntry(CFProperty, a2, (uint64_t)v58);
      *(void *)buf = v17;
      *(void *)&buf[8] = 0x40000000LL;
      *(void *)&buf[16] = ____findPropertyEntry_block_invoke_2;
      *(void *)&__int128 v72 = &unk_18A167078;
      *(_WORD *)&v73[8] = a2;
      *((void *)&v72 + 1) = &v63;
      *(void *)v73 = &v67;
      __iterateDictionaryList(CFProperty, v16, (uint64_t)buf);
      if ((v64[3] & 0x8000000000000000LL) == 0)
      {
        int Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v68[3], @"PropertyList");
        uint64_t v54 = 0LL;
        v55 = &v54;
        uint64_t v56 = 0x2000000000LL;
        uint64_t v57 = 0LL;
        if (Value)
        {
          uint64_t v19 = Value;
          CFIndex v20 = CFArrayGetCount(Value);
          v52[0] = v17;
          v52[1] = 0x40000000LL;
          v52[2] = ____findPropertyEntry_block_invoke_3;
          v52[3] = &unk_18A1670A0;
          __int16 v53 = a3;
          v52[4] = &v59;
          v52[5] = &v54;
          __iterateDictionaryList(v19, v20, (uint64_t)v52);
          uint64_t v21 = v60[3];
          if ((v21 & 0x8000000000000000LL) == 0)
          {
            uint64_t v22 = v55[3];
            if (v22)
            {
              v45[3] = v64[3];
              v41[3] = v21;
              v49[3] = v22;
            }
          }
        }

        _Block_object_dispose(&v54, 8);
      }

      _Block_object_dispose(&v59, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      __int16 v23 = (os_log_s *)gLogObject;
      if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = v45[3];
        uint64_t v31 = v41[3];
        v32 = (const __CFData *)v49[3];
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a1;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a2;
        LOWORD(v72) = 1024;
        *(_DWORD *)((char *)&v72 + 2) = a3;
        WORD3(v72) = 2048;
        *((void *)&v72 + 1) = v30;
        *(_WORD *)v73 = 2048;
        *(void *)&v73[2] = v31;
        __int16 v74 = 2112;
        v75 = v32;
        _os_log_debug_impl( &dword_187E8F000,  v23,  OS_LOG_TYPE_DEBUG,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, found catIndex %ld, propIndex %ld, propertyItem %@",  buf,  0x3Cu);
      }

      int v24 = (const __CFDictionary *)v49[3];
      if (v24)
      {
        __int16 v25 = (const __CFData *)CFDictionaryGetValue(v24, @"PropertyData");
        BOOL v26 = (os_log_s *)gLogObject;
        if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = v45[3];
          uint64_t v34 = v41[3];
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = a1;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = a2;
          LOWORD(v72) = 2048;
          *(void *)((char *)&v72 + 2) = v33;
          WORD5(v72) = 1024;
          HIDWORD(v72) = a3;
          *(_WORD *)v73 = 2048;
          *(void *)&v73[2] = v34;
          __int16 v74 = 2112;
          v75 = v25;
          _os_log_debug_impl( &dword_187E8F000,  v26,  OS_LOG_TYPE_DEBUG,  "%s: service %d, category 0x%x / %ld, property 0x%x / %ld, found data %@",  buf,  0x3Cu);
          if (v25) {
            goto LABEL_31;
          }
        }

        else if (v25)
        {
LABEL_31:
          unint64_t Length = CFDataGetLength(v25);
          if (Length >= *a5) {
            CFIndex v28 = *a5;
          }
          else {
            CFIndex v28 = Length;
          }
          v77.location = 0LL;
          v77.length = v28;
          CFDataGetBytes(v25, v77, a4);
          uint64_t v11 = 0LL;
          *a5 = v28;
          goto LABEL_39;
        }
      }

      uint64_t v11 = 3758097112LL;
LABEL_39:
      CFRelease(CFProperty);
      goto LABEL_40;
    }

    IOAccessoryConfigStreamInterfaceGetProperty_cold_1();
    if (CFProperty) {
      goto LABEL_18;
    }
  }

LABEL_40:
  uint64_t v35 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if ((v38 & 1) != 0) {
      CFIndex v36 = 0LL;
    }
    else {
      CFIndex v36 = *a5;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "IOAccessoryConfigStreamInterfaceGetProperty";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a1;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    LOWORD(v72) = 1024;
    *(_DWORD *)((char *)&v72 + 2) = a3;
    WORD3(v72) = 2048;
    *((void *)&v72 + 1) = v36;
    *(_WORD *)v73 = 1024;
    *(_DWORD *)&v73[2] = v11;
    _os_log_impl( &dword_187E8F000,  v35,  OS_LOG_TYPE_DEFAULT,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, outDataSize %lu, ret %x",  buf,  0x2Eu);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v11;
}

uint64_t IOAccessoryConfigStreamInterfaceRequestGetProperty( io_service_t a1, io_connect_t a2, unsigned int a3)
{
  kern_return_t v11;
  os_log_s *v12;
  uint64_t v13;
  os_log_s *v14;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  io_service_t v20;
  __int16 v21;
  io_connect_t v22;
  __int16 v23;
  _BYTE v24[10];
  uint64_t v25;
  uint64_t input[3];
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  input[0] = a2;
  input[1] = a3;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  CFIndex v8 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    uint64_t v19 = 1024;
    CFIndex v20 = a1;
    uint64_t v21 = 1024;
    uint64_t v22 = a2;
    __int16 v23 = 1024;
    *(_DWORD *)int v24 = a3;
    _os_log_impl(&dword_187E8F000, v8, OS_LOG_TYPE_INFO, "%s: service %d, categoryID 0x%x, propertyID 0x%x", buf, 0x1Eu);
  }

  io_connect_t connect = 0;
  uint64_t v9 = IOServiceOpen(a1, *MEMORY[0x1895FBBE0], 0, &connect);
  if (!(_DWORD)v9)
  {
    CFIndex v10 = (os_log_s *)gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      uint64_t v19 = 1024;
      CFIndex v20 = a1;
      uint64_t v21 = 1024;
      uint64_t v22 = connect;
      __int16 v23 = 2048;
      *(void *)int v24 = v6;
      *(_WORD *)&v24[8] = 2048;
      __int16 v25 = v7;
      _os_log_debug_impl( &dword_187E8F000,  v10,  OS_LOG_TYPE_DEBUG,  "%s: service %d, connect %d, arg [%llx  %llx]",  buf,  0x2Cu);
    }

    uint64_t v11 = IOConnectCallScalarMethod(connect, 0, input, 2u, 0LL, 0LL);
    BOOL v12 = (os_log_s *)gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
      uint64_t v19 = 1024;
      CFIndex v20 = a1;
      uint64_t v21 = 1024;
      uint64_t v22 = connect;
      __int16 v23 = 1024;
      *(_DWORD *)int v24 = v11;
      _os_log_debug_impl( &dword_187E8F000,  v12,  OS_LOG_TYPE_DEBUG,  "%s: service %d, connect %d, after call, ret %x",  buf,  0x1Eu);
    }

    uint64_t v9 = IOServiceClose(connect);
  }

  char v13 = v9;
  uint64_t v14 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "IOAccessoryConfigStreamInterfaceRequestGetProperty";
    uint64_t v19 = 1024;
    CFIndex v20 = a1;
    uint64_t v21 = 1024;
    uint64_t v22 = a2;
    __int16 v23 = 1024;
    *(_DWORD *)int v24 = a3;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v13;
    _os_log_impl( &dword_187E8F000,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, ret %x",  buf,  0x24u);
  }

  return v13;
}

uint64_t IOAccessoryConfigStreamInterfaceSetProperty( io_service_t a1, io_connect_t a2, unsigned int a3, const void *a4, uint64_t a5)
{
  kern_return_t v15;
  os_log_s *v16;
  uint64_t v17;
  os_log_s *v18;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  io_service_t v24;
  __int16 v25;
  io_connect_t v26;
  __int16 v27;
  _BYTE v28[20];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t input[4];
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a5;
  if (__initLogging_onceToken != -1) {
    dispatch_once(&__initLogging_onceToken, &__block_literal_global);
  }
  BOOL v12 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    __int16 v23 = 1024;
    int v24 = a1;
    __int16 v25 = 1024;
    BOOL v26 = a2;
    uint64_t v27 = 1024;
    *(_DWORD *)CFIndex v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = a5;
    _os_log_impl( &dword_187E8F000,  v12,  OS_LOG_TYPE_INFO,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu",  buf,  0x28u);
  }

  io_connect_t connect = 0;
  uint64_t v13 = IOServiceOpen(a1, *MEMORY[0x1895FBBE0], 0, &connect);
  if ((_DWORD)v13) {
    goto LABEL_12;
  }
  if (a5 <= 0x400)
  {
    uint64_t v14 = (os_log_s *)gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      __int16 v23 = 1024;
      int v24 = a1;
      __int16 v25 = 1024;
      BOOL v26 = connect;
      uint64_t v27 = 2048;
      *(void *)CFIndex v28 = v10;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v11;
      *(_WORD *)&v28[18] = 2048;
      __int128 v29 = a5;
      uint64_t v30 = 2048;
      uint64_t v31 = a5;
      v32 = 1024;
      uint64_t v33 = 1024;
      _os_log_debug_impl( &dword_187E8F000,  v14,  OS_LOG_TYPE_DEBUG,  "%s: service %d, connect %d, arg [%llx  %llx  %llx], dataSize %zu / %d",  buf,  0x46u);
    }

    uint64_t v15 = IOConnectCallMethod(connect, 1u, input, 3u, a4, 0x400uLL, 0LL, 0LL, 0LL, 0LL);
    CFIndex v16 = (os_log_s *)gLogObject;
    if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
      __int16 v23 = 1024;
      int v24 = a1;
      __int16 v25 = 1024;
      BOOL v26 = connect;
      uint64_t v27 = 1024;
      *(_DWORD *)CFIndex v28 = v15;
      _os_log_debug_impl( &dword_187E8F000,  v16,  OS_LOG_TYPE_DEBUG,  "%s: service %d, connect %d, after call, ret %x",  buf,  0x1Eu);
    }

    uint64_t v13 = IOServiceClose(connect);
LABEL_12:
    uint64_t v17 = v13;
    goto LABEL_13;
  }

  uint64_t v17 = 52LL;
LABEL_13:
  uint64_t v18 = (os_log_s *)gLogObject;
  if (os_log_type_enabled((os_log_t)gLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v22 = "IOAccessoryConfigStreamInterfaceSetProperty";
    __int16 v23 = 1024;
    int v24 = a1;
    __int16 v25 = 1024;
    BOOL v26 = a2;
    uint64_t v27 = 1024;
    *(_DWORD *)CFIndex v28 = a3;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = a5;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = v17;
    _os_log_impl( &dword_187E8F000,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: service %d, categoryID 0x%x, propertyID 0x%x, dataSize %zu, ret %x",  buf,  0x2Eu);
  }

  return v17;
}

os_log_t ____initLogging_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ioamlib", "ioamlib");
  gLogObject = (uint64_t)result;
  return result;
}

uint64_t ____findCategoryEntry_block_invoke(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  int Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"CategoryID");
  if (!Value) {
    return 1LL;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = a3;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_2(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  int Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"CategoryID");
  if (!Value) {
    return 1LL;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = theDict;
  return result;
}

uint64_t ____findPropertyEntry_block_invoke_3(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  int Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"PropertyID");
  if (!Value) {
    return 1LL;
  }
  unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = theDict;
  return result;
}

  ;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void *ResourceArbiterClientNotifyEvent(void *result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 == -469794814)
  {
    uint64_t result = (void *)[result clientPriority];
    if ((_DWORD)result == a4) {
      return (void *)[v5 resourceAccessRevoked];
    }
  }

  else if (a3 == -469794815)
  {
    uint64_t result = (void *)[result clientPriority];
    if ((_DWORD)result == a4) {
      return (void *)[v5 resourceAccessGranted];
    }
  }

  return result;
}

uint64_t requestResource(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 0, input, 2u, 0LL, 0LL);
}

uint64_t releaseResource(mach_port_t a1, unsigned int a2)
{
  uint64_t input = a2;
  return IOConnectCallScalarMethod(a1, 1u, &input, 1u, 0LL, 0LL);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136315650;
  uint64_t v4 = "IOAccessoryConfigStreamInterfaceGetCategories";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl( &dword_187E8F000,  log,  OS_LOG_TYPE_DEBUG,  "%s: service %d, categoryCount %d",  (uint8_t *)&v3,  0x18u);
}

void IOAccessoryConfigStreamInterfaceGetCategories_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187E8F000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

void IOAccessoryConfigStreamInterfaceGetCategoryProperties_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187E8F000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

void IOAccessoryConfigStreamInterfaceGetProperty_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_187E8F000, v0, v1, "%s: service %d, categoryList %@ ", v2);
  OUTLINED_FUNCTION_2();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

kern_return_t IOConnectCallAsyncMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CA8]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  inputStruct);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallStructMethod( mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CC8]( *(void *)&connection,  *(void *)&selector,  inputStruct,  inputStructCnt,  outputStruct,  outputStructCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x189607CD0](*(void *)&connect, service);
}

kern_return_t IOConnectMapMemory( io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x189607CD8]( *(void *)&connect,  *(void *)&memoryType,  *(void *)&intoTask,  atAddress,  ofSize,  *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x189607D68]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x189607D70](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x189607D78](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x189607D80](dataQueue);
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

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x189608340](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x189608500](*(void *)&entry, entryID);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x189608510](*(void *)&entry, plane);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1896166F8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}