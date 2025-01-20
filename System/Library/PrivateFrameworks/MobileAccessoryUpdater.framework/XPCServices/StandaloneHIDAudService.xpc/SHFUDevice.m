@interface SHFUDevice
+ (BOOL)ignoreVersionCheck;
+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 registryEntryID:(id)a6 errorDomain:(id)a7 error:(id *)a8;
+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 withVendorID:(int)a6 productID:(int)a7 locationID:(unsigned int)a8 interfaceNumber:(unsigned int)a9 errorDomain:(id)a10 error:(id *)a11;
+ (id)getDevicesWithMatchingDict:(__CFDictionary *)a3 hasPowerSource:(BOOL)a4 errorDomain:(id)a5 error:(id *)a6 delegate:(id)a7 logHandle:(id)a8;
+ (id)getNumberPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4 recursive:(BOOL)a5;
+ (id)getStringPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4;
+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 hasPowerSource:(BOOL)a5 parsers:(id)a6 totalPrepareBytes:(unint64_t)a7 bytesSent:(unint64_t *)a8 featureReportDelay:(id)a9 logHandle:(id)a10 pluginDelegate:(id)a11 errorDomain:(id)a12;
+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 interfaceNum:(id)a5 hasPowerSource:(BOOL)a6 parsers:(id)a7 totalPrepareBytes:(unint64_t)a8 bytesSent:(unint64_t *)a9 featureReportDelay:(id)a10 waitForRenumeration:(BOOL)a11 logHandle:(id)a12 pluginDelegate:(id)a13 errorDomain:(id)a14;
+ (void)setIgnoreVersionCheck:(BOOL)a3;
- (BOOL)GATTServicesDiscoveryNeeded;
- (BOOL)batteryIsCharging;
- (BOOL)firmwareVersionsEqualTo:(id)a3;
- (BOOL)firmwareVersionsOlderThan:(id)a3;
- (BOOL)hardwareVersionSupportedBy:(id)a3;
- (BOOL)hasPowerSource;
- (BOOL)sendOffsets;
- (BOOL)sendUberInitAndCommit;
- (BOOL)shouldInstallFW:(id)a3 personalizationAllowed:(BOOL)a4;
- (BOOL)useFWUpdateReportIDs;
- (FudPluginDelegate)delegate;
- (NSDictionary)powerSource;
- (NSMutableDictionary)fwVersions;
- (NSNumber)R1FWVersion;
- (NSNumber)interfaceNum;
- (NSNumber)registryEntryID;
- (NSObject)personalizationObserver;
- (NSString)className;
- (NSString)deviceAddress;
- (NSString)errorDomain;
- (NSString)productName;
- (NSString)serialNumber;
- (NSString)transport;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_semaphore)powerSemaphore;
- (OS_os_log)logHandle;
- (SHFUDevice)init;
- (SHFUDevice)initWithDeviceRef:(__IOHIDDevice *)a3 service:(unsigned int)a4 hasPowerSource:(BOOL)a5 delegate:(id)a6 logHandle:(id)a7 errorDomain:(id)a8 error:(id *)a9 buffer:(char *)a10 bufferLength:(unsigned int)a11;
- (SHFUDevice)initWithService:(unsigned int)a3 hasPowerSource:(BOOL)a4 delegate:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8;
- (id)auErrorString:(unsigned __int8)a3;
- (id)commitAllFirmwares;
- (id)createPersonalizationRequest:(id)a3 error:(id *)a4;
- (id)description;
- (id)latestFirmwareForHardware:(id)a3;
- (id)sendAllFirmwaresToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6;
- (id)sendPersonalizedManifestsToDevice:(id)a3 featureReportDelay:(id)a4 manifestCount:(id)a5;
- (id)sendSingleFirmwareToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6;
- (id)sendUnsignedFWToDevice:(id)a3 featureReportDelay:(id)a4 sendPersonalizedManifests:(BOOL *)a5;
- (id)waitForSecureFWReenumeration;
- (int)batteryCapacity;
- (int)getReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int *)a5;
- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5;
- (int64_t)powerSourceTimedOut;
- (unint64_t)getTotalFirmwareBytes:(id)a3;
- (unsigned)hardwareVersion;
- (unsigned)initReportDelay;
- (unsigned)locationID;
- (unsigned)primaryUsage;
- (unsigned)primaryUsagePage;
- (unsigned)productID;
- (unsigned)protocolVersion;
- (unsigned)updateFlags;
- (unsigned)vendorID;
- (unsigned)writeBufferSize;
- (void)dealloc;
- (void)delayAfterInitReport;
- (void)logVersions:(id)a3;
- (void)reset;
- (void)resetSecureFW;
- (void)setClassName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setInterfaceNum:(id)a3;
- (void)setLocationID:(unsigned int)a3;
- (void)setLogHandle:(id)a3;
- (void)setPersonalizationObserver:(id)a3;
- (void)setPowerSource:(id)a3;
- (void)setPowerSourceTimedOut:(int64_t)a3;
- (void)setProductName:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SHFUDevice

+ (id)getNumberPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4 recursive:(BOOL)a5
{
  v5 = 0LL;
  if (a3 && a4)
  {
    if (a5) {
      IOOptionBits v6 = 3;
    }
    else {
      IOOptionBits v6 = 0;
    }
    CFTypeRef v7 = IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, v6);
    v5 = (void *)v7;
    if (v7)
    {
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 != CFNumberGetTypeID())
      {
        CFRelease(v5);
        v5 = 0LL;
      }
    }
  }

  return v5;
}

+ (id)getStringPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4
{
  v4 = 0LL;
  if (a3)
  {
    if (a4)
    {
      CFTypeRef v5 = IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, 0);
      v4 = (void *)v5;
      if (v5)
      {
        CFTypeID v6 = CFGetTypeID(v5);
        if (v6 != CFStringGetTypeID())
        {
          CFRelease(v4);
          v4 = 0LL;
        }
      }
    }
  }

  return v4;
}

+ (id)getDevicesWithMatchingDict:(__CFDictionary *)a3 hasPowerSource:(BOOL)a4 errorDomain:(id)a5 error:(id *)a6 delegate:(id)a7 logHandle:(id)a8
{
  kern_return_t MatchingServices;
  io_object_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFTypeRef v22;
  CFTypeID v23;
  SHFUDevice *v24;
  NSError *v25;
  id v26;
  void *v27;
  NSError *v28;
  uint64_t v30;
  NSError *v31;
  void *v32;
  id v33;
  id v34;
  BOOL v35;
  io_registry_entry_t parent;
  io_iterator_t existing;
  NSErrorUserInfoKey v38;
  uint64_t v39;
  NSErrorUserInfoKey v40;
  CFStringRef v41;
  v35 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  existing = 0;
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, a3);
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, MutableCopy, &existing);
  v18 = existing;
  v34 = v14;
  if (existing && !MatchingServices)
  {
    v19 = IOIteratorNext(existing);
    if ((_DWORD)v19)
    {
      v20 = v19;
      do
      {
        if (*a6) {
          break;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( a3,  "objectForKeyedSubscript:",  @"bInterfaceNumber"));
        if (!v21) {
          goto LABEL_12;
        }
        if (!IORegistryEntryGetParentEntry(v20, "IOService", &parent))
        {
          v22 = IORegistryEntrySearchCFProperty(parent, "IOService", @"bInterfaceNumber", kCFAllocatorDefault, 1u);
          IOObjectRelease(parent);
          if (v22)
          {
            v23 = CFGetTypeID(v22);
            if (v23 == CFNumberGetTypeID() && ([v21 isEqualToNumber:v22] & 1) != 0)
            {
              CFRelease(v22);
              id v14 = v34;
LABEL_12:
              v24 = -[SHFUDevice initWithService:hasPowerSource:delegate:logHandle:errorDomain:error:]( objc_alloc(&OBJC_CLASS___SHFUDevice),  "initWithService:hasPowerSource:delegate:logHandle:errorDomain:error:",  v20,  v35,  v13,  v14,  v12,  a6);
              if (v24)
              {
                -[NSMutableArray addObject:](v15, "addObject:", v24);
              }

              else if (!*a6)
              {
                v25 = objc_alloc(&OBJC_CLASS___NSError);
                v40 = NSLocalizedDescriptionKey;
                v41 = @"Failed to initialize SHFUDevice";
                v33 = v13;
                v26 = v12;
                v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
                v28 = v25;
                id v14 = v34;
                *a6 = -[NSError initWithDomain:code:userInfo:](v28, "initWithDomain:code:userInfo:", v26, 1LL, v27);

                id v12 = v26;
                id v13 = v33;
              }

              IOObjectRelease(v20);

              goto LABEL_19;
            }

            CFRelease(v22);
            id v14 = v34;
          }
        }

        IOObjectRelease(v20);
LABEL_19:

        v20 = IOIteratorNext(existing);
      }

      while ((_DWORD)v20);
    }

    v18 = existing;
  }

  if (v18)
  {
    IOObjectRelease(v18);
    existing = 0;
  }

  if (!*a6)
  {
    if (-[NSMutableArray count](v15, "count")) {
      goto LABEL_26;
    }
    v30 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No standalone HID devices detected matching %@",  a3));
    v31 = objc_alloc(&OBJC_CLASS___NSError);
    v38 = NSLocalizedDescriptionKey;
    v39 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    *a6 = -[NSError initWithDomain:code:userInfo:](v31, "initWithDomain:code:userInfo:", v12, 0LL, v32);

    v15 = (NSMutableArray *)v30;
    id v14 = v34;
  }

  v15 = 0LL;
LABEL_26:

  return v15;
}

+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 registryEntryID:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  BOOL v11 = a4;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  CFMutableDictionaryRef v17 = IORegistryEntryIDMatching((uint64_t)[a6 unsignedLongLongValue]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( [a1 getDevicesWithMatchingDict:v17 hasPowerSource:v11 errorDomain:v14 error:a8 delegate:v16 logHandle:v15]);

  CFRelease(v17);
  return v18;
}

+ (id)getDevices:(id)a3 hasPowerSource:(BOOL)a4 logHandle:(id)a5 withVendorID:(int)a6 productID:(int)a7 locationID:(unsigned int)a8 interfaceNumber:(unsigned int)a9 errorDomain:(id)a10 error:(id *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  BOOL v31 = a4;
  v29 = a11;
  id v17 = a10;
  id v18 = a5;
  id v19 = a3;
  CFMutableDictionaryRef v20 = IOServiceMatching("IOHIDDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
  -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, @"VendorID");

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
  -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, @"ProductID");

  if (SHFU_UNKNOWN_LOCATION_ID != (_DWORD)v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
    -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v23, @"LocationID");
  }

  if (SHFU_UNKNOWN_INTERFACE_NUMBER != a9)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a9));
    -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v24, @"bInterfaceNumber");
  }

  if ((int)v12 <= 612)
  {
    if ((_DWORD)v12 != 332 && (_DWORD)v12 != 546)
    {
LABEL_14:
      v25 = &off_100026BD8;
      v26 = @"DeviceUsagePairs";
      goto LABEL_9;
    }
  }

  else if (((v12 - 613) > 0x3A || ((1LL << (v12 - 101)) & 0x4A06000001F01FFLL) == 0) {
         && (_DWORD)v12 != 786)
  }
  {
    goto LABEL_14;
  }

  -[__CFDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  &off_100026A98,  @"PrimaryUsagePage",  a11);
  v25 = &off_100026AB0;
  v26 = @"PrimaryUsage";
LABEL_9:
  -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v25, v26, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue( [a1 getDevicesWithMatchingDict:v20 hasPowerSource:v31 errorDomain:v17 error:v30 delegate:v19 logHandle:v18]);

  return v27;
}

- (SHFUDevice)initWithService:(unsigned int)a3 hasPowerSource:(BOOL)a4 delegate:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  uint64_t v11 = a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  memset(v47, 0, sizeof(v47));
  unsigned int v38 = 512;
  id v17 = IOHIDDeviceCreate(kCFAllocatorDefault, v12);
  unsigned int v37 = v11;
  if (!v17)
  {
    v23 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    v46 = @"Failed to create IOHIDDevice";
    char v20 = 1;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    v22 = -[NSError initWithDomain:code:userInfo:](v23, "initWithDomain:code:userInfo:", v16, 19LL, v24);

    id v18 = 0LL;
    if (v22) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }

  id v18 = v17;
  if (!IOHIDDeviceOpen(v17, 0))
  {
    uint64_t v26 = sub_10000F240(0xB8u, v47, &v38, v18, v15);
    if ((_DWORD)v26)
    {
      v27 = SHFUIOReturnString(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Update params feature report ID 0x%02X failed with %@",  184LL,  v28));

      uint64_t v30 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      v42 = v29;
      BOOL v31 = &v42;
      v32 = &v41;
    }

    else
    {
      unsigned int v33 = v38;
      if (v38 > 1)
      {
LABEL_17:
        LODWORD(v36) = v33;
        v25 = -[SHFUDevice initWithDeviceRef:service:hasPowerSource:delegate:logHandle:errorDomain:error:buffer:bufferLength:]( self,  "initWithDeviceRef:service:hasPowerSource:delegate:logHandle:errorDomain:error:buffer:bufferLength:",  v18,  v12,  v11,  v14,  v15,  v16,  a8,  v47,  v36);
        goto LABEL_18;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Update params feature report ID 0x%02X returned invalid payload length %d",  184LL,  v38));
      uint64_t v30 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      v40 = v29;
      BOOL v31 = &v40;
      v32 = &v39;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v32,  1LL));
    v22 = -[NSError initWithDomain:code:userInfo:](v30, "initWithDomain:code:userInfo:", v16, 21LL, v34);

    char v20 = 0;
    if (v22) {
      goto LABEL_6;
    }
LABEL_16:
    uint64_t v11 = v37;
    unsigned int v33 = v38;
    goto LABEL_17;
  }

  id v19 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
  v44 = @"Failed to open IOHIDDevice";
  char v20 = 1;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  v22 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", v16, 20LL, v21);

  CFRelease(v18);
  id v18 = 0LL;
  if (!v22) {
    goto LABEL_16;
  }
LABEL_6:
  if (a8) {
    *a8 = v22;
  }
  if ((v20 & 1) == 0)
  {
    IOHIDDeviceClose(v18, 0);
    CFRelease(v18);
  }

  v25 = 0LL;
LABEL_18:

  return v25;
}

- (SHFUDevice)init
{
  return -[SHFUDevice initWithService:hasPowerSource:delegate:logHandle:errorDomain:error:]( self,  "initWithService:hasPowerSource:delegate:logHandle:errorDomain:error:",  0LL,  0LL,  0LL,  0LL,  &stru_100024A50,  0LL);
}

- (SHFUDevice)initWithDeviceRef:(__IOHIDDevice *)a3 service:(unsigned int)a4 hasPowerSource:(BOOL)a5 delegate:(id)a6 logHandle:(id)a7 errorDomain:(id)a8 error:(id *)a9 buffer:(char *)a10 bufferLength:(unsigned int)a11
{
  uint64_t v14 = *(void *)&a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a9) {
    *a9 = 0LL;
  }
  if (a3 && (_DWORD)v14)
  {
    v59.receiver = self;
    v59.super_class = (Class)&OBJC_CLASS___SHFUDevice;
    char v20 = -[SHFUDevice init](&v59, "init");
    v21 = v20;
    if (v20)
    {
      v20->_hasPowerSource = a5;
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.SHFUDevice", 0LL);
      serialQueue = v21->_serialQueue;
      v21->_serialQueue = (OS_dispatch_queue *)v22;

      dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
      powerSemaphore = v21->_powerSemaphore;
      v21->_powerSemaphore = (OS_dispatch_semaphore *)v24;

      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v19));
      errorDomain = v21->_errorDomain;
      v21->_errorDomain = (NSString *)v26;

      v21->_deviceRef = a3;
      objc_storeWeak((id *)&v21->_delegate, v17);
      objc_storeWeak((id *)&v21->_logHandle, v18);
      uint64_t entryID = 0LL;
      IORegistryEntryGetRegistryEntryID(v14, &entryID);
      if (entryID)
      {
        uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
        registryEntryID = v21->_registryEntryID;
        v21->_registryEntryID = (NSNumber *)v28;
      }

      if (!IORegistryEntryGetName(v14, name))
      {
        uint64_t v30 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  name,  4LL);
        className = v21->_className;
        v21->_className = v30;
      }

      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getStringPropertyFromService:withKey:]( &OBJC_CLASS___SHFUDevice,  "getStringPropertyFromService:withKey:",  v14,  @"Product"));
      productName = v21->_productName;
      v21->_productName = (NSString *)v32;

      uint64_t v34 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getStringPropertyFromService:withKey:]( &OBJC_CLASS___SHFUDevice,  "getStringPropertyFromService:withKey:",  v14,  @"Transport"));
      transport = v21->_transport;
      v21->_transport = (NSString *)v34;

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"ProductID",  0LL));
      v21->_int productID = (unsigned __int16)[v36 unsignedIntValue];
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"VendorID",  0LL));

      v21->_vendorID = (unsigned __int16)[v37 unsignedIntValue];
      unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"PrimaryUsage",  0LL));

      v21->_primaryUsage = (unsigned __int16)[v38 unsignedIntValue];
      NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"PrimaryUsagePage",  0LL));

      v21->_primaryUsagePage = (unsigned __int16)[v39 unsignedIntValue];
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"LocationID",  0LL));

      v21->_locationID = [v40 unsignedIntValue];
      io_registry_entry_t parent = 0;
      if (!IORegistryEntryGetParentEntry(v14, "IOService", &parent) && parent)
      {
        uint64_t v41 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:"));
        interfaceNum = v21->_interfaceNum;
        v21->_interfaceNum = (NSNumber *)v41;

        IOObjectRelease(parent);
      }

      if (!v21->_interfaceNum)
      {
        uint64_t v43 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getNumberPropertyFromService:withKey:recursive:]( &OBJC_CLASS___SHFUDevice,  "getNumberPropertyFromService:withKey:recursive:",  v14,  @"bInterfaceNumber",  1LL));
        v44 = v21->_interfaceNum;
        v21->_interfaceNum = (NSNumber *)v43;
      }

      if (v21->_vendorID == 76)
      {
        if ((int productID = v21->_productID, (productID - 613) <= 0x3A)
          && ((1LL << (productID - 101)) & 0x4A0000000000095LL) != 0
          || (productID - 800) < 5)
        {
          uint64_t v46 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getStringPropertyFromService:withKey:]( &OBJC_CLASS___SHFUDevice,  "getStringPropertyFromService:withKey:",  v14,  @"SerialNumber"));
          deviceAddress = v21->_deviceAddress;
          v21->_deviceAddress = (NSString *)v46;
        }
      }

      uint64_t v48 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getStringPropertyFromService:withKey:]( &OBJC_CLASS___SHFUDevice,  "getStringPropertyFromService:withKey:",  v14,  @"SerialNumber"));
      serialNumber = v21->_serialNumber;
      v21->_serialNumber = (NSString *)v48;

      if (a11 == 2)
      {
        v21->_protocolVersion = 1;
LABEL_22:
        v21->_writeBufferSize = *(_WORD *)a10;
        __int16 v50 = 257;
LABEL_23:
        *(_WORD *)&v21->_useFWUpdateReportIDs = v50;
        v21->_sendUberInitAndCommit = 0;
      }

      else
      {
        uint64_t v51 = *a10;
        v21->_protocolVersion = v51;
        switch((int)v51)
        {
          case 1:
            goto LABEL_22;
          case 2:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            __int16 v50 = 256;
            goto LABEL_23;
          case 3:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            v21->_useFWUpdateReportIDs = 0;
            goto LABEL_34;
          case 4:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            goto LABEL_33;
          case 5:
            v21->_writeBufferSize = *(_WORD *)(a10 + 1);
            unsigned __int16 v55 = *(_WORD *)(a10 + 3);
            v21->_updateFlags = v55;
            v21->_initReportDelay = *(_WORD *)(a10 + 5);
LABEL_33:
            v21->_useFWUpdateReportIDs = 1;
LABEL_34:
            v21->_sendUberInitAndCommit = (v55 & 2) != 0;
            v21->_sendOffsets = (v55 & 1) == 0;
            break;
          default:
            if (a9)
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid FW update protocol version %d",  v51));
              v53 = objc_alloc(&OBJC_CLASS___NSError);
              NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
              v61 = v52;
              v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
              *a9 = -[NSError initWithDomain:code:userInfo:](v53, "initWithDomain:code:userInfo:", v19, 22LL, v54);
            }

            v21 = 0LL;
            break;
        }
      }
    }
  }

  else
  {

    v21 = 0LL;
  }

  return v21;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    IOHIDDeviceClose(deviceRef, 0);
    CFRelease(self->_deviceRef);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SHFUDevice;
  -[SHFUDevice dealloc](&v4, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SHFUDevice className](self, "className"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SHFUDevice productName](self, "productName"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SHFUDevice transport](self, "transport"));
  uint64_t v33 = -[SHFUDevice productID](self, "productID");
  uint64_t v31 = -[SHFUDevice vendorID](self, "vendorID");
  uint64_t v30 = -[SHFUDevice primaryUsage](self, "primaryUsage");
  uint64_t v29 = -[SHFUDevice primaryUsagePage](self, "primaryUsagePage");
  uint64_t v28 = -[SHFUDevice locationID](self, "locationID");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice interfaceNum](self, "interfaceNum"));
  uint64_t v36 = (void *)v4;
  id obj = (id)v3;
  v35 = (void *)v5;
  if (v34) {
    uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SHFUDevice interfaceNum](self, "interfaceNum"));
  }
  else {
    uint64_t v32 = @"N/A";
  }
  unsigned int v27 = -[SHFUDevice useFWUpdateReportIDs](self, "useFWUpdateReportIDs");
  unsigned int v26 = -[SHFUDevice sendOffsets](self, "sendOffsets");
  unsigned int v6 = -[SHFUDevice sendUberInitAndCommit](self, "sendUberInitAndCommit");
  unsigned int v7 = -[SHFUDevice writeBufferSize](self, "writeBufferSize");
  unsigned int v8 = -[SHFUDevice updateFlags](self, "updateFlags");
  unsigned int v9 = -[SHFUDevice initReportDelay](self, "initReportDelay");
  unsigned int v10 = -[SHFUDevice hardwareVersion](self, "hardwareVersion");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice powerSource](self, "powerSource"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice deviceAddress](self, "deviceAddress"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialNumber](self, "serialNumber"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice registryEntryID](self, "registryEntryID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( NSMutableString,  "stringWithFormat:",  @"class: %@, product: %@, transport: %@, PID 0x%x, VID 0x%x, primary usage 0x%x, primary usage page 0x%x, locationID 0x%x, interface %@, useFWUpdateReportIDs %d, sendOffsets %d, sendUberInitAndCommit %d, writeBufferSize %u, updateFlags %u, init report delay %u, hardware version 0x%02x, power source %@, deviceAddress %@, serial number %@ IORegistryEntryID 0x%016llX",  obj,  v36,  v35,  v33,  v31,  v30,  v29,  v28,  v32,  v27,  v26,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  [v14 unsignedLongLongValue]));

  if (v34) {
  __int128 v41 = 0u;
  }
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v16 = self;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
  id v17 = [obja countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(obja);
        }
        v21 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        dispatch_queue_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v21 unsignedIntValue]));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](v16, "fwVersions"));
        dispatch_semaphore_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v21]);
        [v15 appendFormat:@", %@ version 0x%02x", v22, objc_msgSend(v24, "unsignedIntValue")];
      }

      id v18 = [obja countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v18);
  }

  return v15;
}

- (void)logVersions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v40 = v4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, @"deviceType");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  -[SHFUDevice hardwareVersion](self, "hardwareVersion")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"hardwareVersion");

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  -[SHFUDevice hardwareVersion](self, "hardwareVersion")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"hardwareVersionStr");

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v13 unsignedIntValue]));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v10);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialNumber](self, "serialNumber"));
  id v18 = [v17 length];

  if (v18) {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialNumber](self, "serialNumber"));
  }
  else {
    id v19 = v40;
  }
  char v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  dispatch_queue_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dictionaryForKey:@"CoreAnalyticsTimestamps"]);
  v23 = (NSMutableDictionary *)[v22 mutableCopy];

  dispatch_semaphore_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  unsigned int v26 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
  if (!v23)
  {
    if (v28) {
      sub_100017658();
    }

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    goto LABEL_27;
  }

  if (v28) {
    sub_100017778();
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v20));
  if (!v29
    || (uint64_t v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v26, "dateFromString:", v29))) == 0LL)
  {
    __int128 v39 = v21;
    uint64_t v32 = v26;
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_100017658();
    }
    uint64_t v31 = 0LL;
    goto LABEL_22;
  }

  uint64_t v31 = v30;
  if (-[NSMutableDictionary compare:](v30, "compare:", v24) == (id)1)
  {
    __int128 v39 = v21;
    uint64_t v32 = v26;
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_1000176B8();
    }
LABEL_22:

    v25 = v34;
    dispatch_semaphore_t v24 = v33;
    unsigned int v26 = v32;
    v21 = v39;
LABEL_23:

LABEL_27:
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_10001762C();
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100010550;
    v41[3] = &unk_1000247F8;
    __int128 v42 = v5;
    AnalyticsSendEventLazy(@"com.apple.StandaloneHIDFudPlugins", v41);
    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v26, "stringFromDate:", v24));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v37, v20);
    [v21 setObject:v23 forKey:@"CoreAnalyticsTimestamps"];

    uint64_t v31 = v42;
    goto LABEL_30;
  }

  if (-[NSMutableDictionary compare:](v31, "compare:", v25) != (id)1) {
    goto LABEL_23;
  }
  unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    sub_100017718();
  }

LABEL_30:
}

- (BOOL)shouldInstallFW:(id)a3 personalizationAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareType]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  unsigned int v10 = [v9 unsignedIntValue];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareVersion]);
  unsigned int v12 = [v11 unsignedIntValue];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareType]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v13 unsignedIntValue]));

  if (v12 == v10 && !+[SHFUDevice ignoreVersionCheck](&OBJC_CLASS___SHFUDevice, "ignoreVersionCheck"))
  {
    if (-[SHFUDevice productID](self, "productID") != 614
      || (id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 getFirmwareType]),
          unsigned int v16 = [v15 unsignedIntValue],
          v15,
          v16 != 48))
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000177D8();
      }
      BOOL v17 = 0;
      goto LABEL_16;
    }
  }

  if ((![v6 personalizationRequired] || v4)
    && (([v6 personalizationRequired] & 1) != 0 || !v4))
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412802;
      v21 = v14;
      __int16 v22 = 1024;
      unsigned int v23 = v10;
      __int16 v24 = 1024;
      unsigned int v25 = v12;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%@ has FW version 0x%X installed. Start installation of FW version 0x%X.",  (uint8_t *)&v20,  0x18u);
    }

    BOOL v17 = 1;
LABEL_16:

    goto LABEL_17;
  }

  BOOL v17 = 0;
LABEL_17:

  return v17;
}

- (NSNumber)R1FWVersion
{
  fwVersions = self->_fwVersions;
  self->_fwVersions = 0LL;

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:&off_100026AC8]);

  return (NSNumber *)v5;
}

- (id)waitForSecureFWReenumeration
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 450.0));
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100017880(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v13 = [v12 compare:v3];

  if (v13 == (id)-1LL)
  {
    while (1)
    {
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 5.0);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice R1FWVersion](self, "R1FWVersion"));
      id v15 = v14;
      if (v14)
      {
      }

      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v17 = [v16 compare:v3];

      if (v17 != (id)-1LL) {
        goto LABEL_7;
      }
    }

    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100017854();
    }
    v21 = 0LL;
  }

  else
  {
LABEL_7:
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timed out after %f seconds waiting for secure firmware",  0x407C200000000000LL));
    id v18 = objc_alloc(&OBJC_CLASS___NSError);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    __int16 v24 = v15;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    v21 = -[NSError initWithDomain:code:userInfo:](v18, "initWithDomain:code:userInfo:", v19, 52LL, v20);
  }

  return v21;
}

- (id)createPersonalizationRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  int8x16_t v42 = 0u;
  __int128 v43 = 0u;
  int v32 = 512;
  int v7 = 11;
  __int128 v40 = 0u;
  int8x16_t v41 = 0u;
  while (1)
  {
    uint64_t v8 = -[SHFUDevice getReportID:buffer:length:](self, "getReportID:buffer:length:", 189LL, &v40, &v32);
    if (!(_DWORD)v8) {
      break;
    }
    uint64_t v9 = v8;
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000178F0(buf, v39, v10);
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 5.0);
    if (!--v7)
    {
      id v18 = SHFUIOReturnString(v9);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Personalization info feature report ID 0x%02X failed with %@ for device %@",  189LL,  v19,  self));

      v21 = objc_alloc(&OBJC_CLASS___NSError);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      id v37 = v20;
      NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
      *a4 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", v22, 53LL, v23);

      id v24 = 0LL;
      goto LABEL_11;
    }
  }

  id v11 = [[FudPersonalizationRequest alloc] initWithName:@"com.apple.StandaloneHIDFudPlugins.personalization"];
  [v11 setResponseFormat:0];
  [v11 setRequestPrefix:@"Rap"];
  [v11 setSecurityDomain:BYTE1(v40)];
  [v11 setProductionMode:BYTE2(v40) != 0];
  [v11 setSecurityMode:BYTE3(v40) != 0];
  [v11 setBoardID:bswap32(WORD2(v40)) >> 16];
  [v11 setChipID:bswap32(WORD3(v40)) >> 16];
  [v11 setEcID:bswap64(*((unint64_t *)&v40 + 1))];
  int8x16_t v12 = vrev64q_s8(v41);
  int8x16_t v13 = vrev64q_s8(v42);
  v35[0] = vextq_s8(v13, v13, 8uLL);
  v35[1] = vextq_s8(v12, v12, 8uLL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v35, 32LL));
  [v11 setNonceHash:v14];

  id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 getFTABDigests]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100010DFC;
  v29[3] = &unk_100024820;
  id v20 = v11;
  id v30 = v20;
  id v17 = v15;
  uint64_t v31 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:v29];
  if (-[NSMutableArray count](v17, "count"))
  {
    [v20 setObjectList:v17];
    id v24 = v20;
  }

  else
  {
    unsigned int v25 = objc_alloc(&OBJC_CLASS___NSError);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    uint64_t v34 = @"Failed to create personalization request";
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    *a4 = -[NSError initWithDomain:code:userInfo:](v25, "initWithDomain:code:userInfo:", v26, 52LL, v27);

    id v24 = 0LL;
  }

LABEL_11:
  return v24;
}

- (id)sendUnsignedFWToDevice:(id)a3 featureReportDelay:(id)a4 sendPersonalizedManifests:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100017938(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  *a5 = 0;
  if ([v8 personalizationRequired])
  {
    if (-[SHFUDevice shouldInstallFW:personalizationAllowed:](self, "shouldInstallFW:personalizationAllowed:", v8, 1LL))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 payload]);
      id v19 = (NSError *)objc_claimAutoreleasedReturnValue( -[SHFUDevice sendSingleFirmwareToDevice:totalPrepareBytes:bytesSent:featureReportDelay:]( self,  "sendSingleFirmwareToDevice:totalPrepareBytes:bytesSent:featureReportDelay:",  v18,  0LL,  0LL,  v9));

      if (!v19) {
        *a5 = 1;
      }
    }

    else
    {
      id v19 = 0LL;
    }
  }

  else
  {
    id v20 = objc_alloc(&OBJC_CLASS___NSError);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    unsigned int v25 = @"Personalization not required for AFU file parser";
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    id v19 = -[NSError initWithDomain:code:userInfo:](v20, "initWithDomain:code:userInfo:", v21, 52LL, v22);
  }

  return v19;
}

- (id)sendPersonalizedManifestsToDevice:(id)a3 featureReportDelay:(id)a4 manifestCount:(id)a5
{
  id v63 = a3;
  id v62 = a4;
  id v8 = a5;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100017AD4(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (v8)
  {
    if ([v63 personalizationRequired])
    {
      uint64_t v80 = 0LL;
      v81[0] = &v80;
      v81[1] = 0x3032000000LL;
      v81[2] = sub_10001170C;
      v81[3] = sub_10001171C;
      id v82 = 0LL;
      v78[0] = 0LL;
      v78[1] = v78;
      v78[2] = 0x3042000000LL;
      v78[3] = sub_100011724;
      v78[4] = sub_100011730;
      location = &v79;
      objc_initWeak(&v79, self);
      uint64_t v72 = 0LL;
      v73 = &v72;
      uint64_t v74 = 0x3032000000LL;
      v75 = sub_10001170C;
      v76 = sub_10001171C;
      id v77 = 0LL;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned __int8 v18 = [v17 BOOLForKey:@"WriteManifests"];

      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_100011738;
      v65[3] = &unk_100024848;
      __int128 v68 = v78;
      id v19 = v63;
      unsigned __int8 v71 = v18;
      id v66 = v19;
      __int128 v69 = &v80;
      id v67 = v62;
      __int128 v70 = &v72;
      id v20 = objc_retainBlock(v65);
      int v21 = 0;
      __int128 v60 = v81;
      while (v21 < (int)[v8 intValue])
      {
        uint64_t v22 = v81[0];
        id obj = *(id *)(v81[0] + 40LL);
        NSErrorUserInfoKey v23 = (void *)objc_claimAutoreleasedReturnValue( -[SHFUDevice createPersonalizationRequest:error:]( self,  "createPersonalizationRequest:error:",  v19,  &obj));
        objc_storeStrong((id *)(v22 + 40), obj);
        if (*(void *)(v81[0] + 40LL)) {
          goto LABEL_18;
        }
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
        unsigned int v25 = (void *)v73[5];
        v73[5] = (uint64_t)v24;

        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%llu",  @"com.apple.StandaloneHIDFudPlugins.personalization",  [v23 ecID],  v60,  location));
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 addObserverForName:v26 object:0 queue:0 usingBlock:v20]);
        -[SHFUDevice setPersonalizationObserver:](self, "setPersonalizationObserver:", v28);

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice delegate](self, "delegate"));
        [v29 personalizationRequest:v23];

        dispatch_time_t v30 = dispatch_time(0LL, 120000000000LL);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_100017A8C(buf, &v86, v31);
        }

        uint64_t v32 = dispatch_semaphore_wait((dispatch_semaphore_t)v73[5], v30);
        NSErrorUserInfoKey v33 = (void *)v73[5];
        v73[5] = 0LL;

        if (*(void *)(v81[0] + 40LL)) {
          goto LABEL_17;
        }
        if (v32)
        {
          __int128 v43 = objc_alloc(&OBJC_CLASS___NSError);
          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
          NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
          v84 = @"Timed out waiting for personalization response.";
          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
          __int128 v46 = -[NSError initWithDomain:code:userInfo:](v43, "initWithDomain:code:userInfo:", v44, 52LL, v45);
          __int128 v47 = *(void **)(v81[0] + 40LL);
          *(void *)(v81[0] + 40LL) = v46;

LABEL_17:
LABEL_18:

          break;
        }

        uint64_t v34 = objc_claimAutoreleasedReturnValue(-[SHFUDevice waitForSecureFWReenumeration](self, "waitForSecureFWReenumeration"));
        v35 = *(void **)(v81[0] + 40LL);
        *(void *)(v81[0] + 40LL) = v34;

        if (*(void *)(v81[0] + 40LL)) {
          goto LABEL_17;
        }

        ++v21;
      }

      if (*(void *)(v81[0] + 40LL)) {
        goto LABEL_20;
      }
      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice R1FWVersion](self, "R1FWVersion"));
      BOOL v57 = [v56 unsignedIntValue] == 1;

      if (!v57) {
        goto LABEL_24;
      }
      if (*(void *)(v81[0] + 40LL))
      {
LABEL_20:
        __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100017A20((uint64_t)v60, v48, v49, v50, v51, v52, v53, v54);
        }
      }

      else
      {
        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice R1FWVersion](self, "R1FWVersion"));
        BOOL v59 = [v58 unsignedIntValue] == 1;

        if (!v59) {
          goto LABEL_23;
        }
        __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1000179A8(v48);
        }
      }

LABEL_23:
      -[SHFUDevice resetSecureFW](self, "resetSecureFW");
LABEL_24:
      __int128 v39 = (NSError *)*(id *)(v81[0] + 40LL);

      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(v78, 8);
      objc_destroyWeak(location);
      _Block_object_dispose(&v80, 8);

      goto LABEL_25;
    }

    __int128 v40 = objc_alloc(&OBJC_CLASS___NSError);
    int8x16_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    v88 = @"Personalization not required for AFU file parser";
    int8x16_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
    __int128 v39 = -[NSError initWithDomain:code:userInfo:](v40, "initWithDomain:code:userInfo:", v41, 52LL, v42);
  }

  else
  {
    NSErrorUserInfoKey v36 = objc_alloc(&OBJC_CLASS___NSError);
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    v90 = @"Manifest count not specified";
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
    __int128 v39 = -[NSError initWithDomain:code:userInfo:](v36, "initWithDomain:code:userInfo:", v37, 52LL, v38);
  }

- (void)delayAfterInitReport
{
  if (-[SHFUDevice initReportDelay](self, "initReportDelay"))
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100017C44(self);
    }

    +[NSThread sleepForTimeInterval:]( &OBJC_CLASS___NSThread,  "sleepForTimeInterval:",  (double)-[SHFUDevice initReportDelay](self, "initReportDelay"));
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100017BD0(self);
    }
  }

- (id)sendAllFirmwaresToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (!-[SHFUDevice sendUberInitAndCommit](self, "sendUberInitAndCommit")) {
    goto LABEL_4;
  }
  __int16 v33 = -17213;
  uint64_t v12 = -[SHFUDevice setReportID:buffer:length:](self, "setReportID:buffer:length:", 176LL, &v33, 2LL);
  if (!(_DWORD)v12) {
    goto LABEL_4;
  }
  uint64_t v13 = SHFUIOReturnString(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Uber init report ID 0x%02X failed with %@ for device %@",  176LL,  v14,  self));

  uint64_t v16 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
  NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
  NSErrorUserInfoKey v36 = v15;
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  id v19 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", v17, 24LL, v18);

  if (!v19)
  {
LABEL_4:
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v20 = v10;
    id v21 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      id v28 = v10;
      uint64_t v23 = *(void *)v30;
LABEL_6:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned int v25 = *(void **)(*((void *)&v29 + 1) + 8 * v24);
        if (-[SHFUDevice shouldInstallFW:personalizationAllowed:]( self,  "shouldInstallFW:personalizationAllowed:",  v25,  0LL))
        {
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 payload]);
          id v19 = (NSError *)objc_claimAutoreleasedReturnValue( -[SHFUDevice sendSingleFirmwareToDevice:totalPrepareBytes:bytesSent:featureReportDelay:]( self,  "sendSingleFirmwareToDevice:totalPrepareBytes:bytesSent:featureReportDelay:",  v26,  a4,  a5,  v11));

          if (v19) {
            break;
          }
        }

        if (v22 == (id)++v24)
        {
          id v22 = [v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v22) {
            goto LABEL_6;
          }
          id v19 = 0LL;
          break;
        }
      }

      id v10 = v28;
    }

    else
    {
      id v19 = 0LL;
    }
  }

  return v19;
}

+ (BOOL)ignoreVersionCheck
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"UpdateCurrentVersion"];

  return v3;
}

+ (void)setIgnoreVersionCheck:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v5 setObject:v4 forKey:@"UpdateCurrentVersion"];
}

+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 hasPowerSource:(BOOL)a5 parsers:(id)a6 totalPrepareBytes:(unint64_t)a7 bytesSent:(unint64_t *)a8 featureReportDelay:(id)a9 logHandle:(id)a10 pluginDelegate:(id)a11 errorDomain:(id)a12
{
  LOBYTE(v13) = 1;
  return +[SHFUDevice sendAllFirmwaresToDeviceWithVendorID:productID:interfaceNum:hasPowerSource:parsers:totalPrepareBytes:bytesSent:featureReportDelay:waitForRenumeration:logHandle:pluginDelegate:errorDomain:]( &OBJC_CLASS___SHFUDevice,  "sendAllFirmwaresToDeviceWithVendorID:productID:interfaceNum:hasPowerSource:parsers:totalPrepareBytes:bytesSen t:featureReportDelay:waitForRenumeration:logHandle:pluginDelegate:errorDomain:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  a9,  v13,  a10,  a11,  a12);
}

+ (id)sendAllFirmwaresToDeviceWithVendorID:(id)a3 productID:(id)a4 interfaceNum:(id)a5 hasPowerSource:(BOOL)a6 parsers:(id)a7 totalPrepareBytes:(unint64_t)a8 bytesSent:(unint64_t *)a9 featureReportDelay:(id)a10 waitForRenumeration:(BOOL)a11 logHandle:(id)a12 pluginDelegate:(id)a13 errorDomain:(id)a14
{
  BOOL v60 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v69 = a10;
  id v62 = a12;
  id v61 = a13;
  id v66 = a14;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
  uint64_t v23 = IONotificationPortCreate(kIOMasterPortDefault);
  io_iterator_t notification = 0;
  dispatch_queue_t v24 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.newDeviceMatch", 0LL);
  dispatch_set_context(v24, v22);
  dispatch_set_finalizer_f(v24, (dispatch_function_t)j__dispatch_semaphore_signal);
  IONotificationPortSetDispatchQueue(v23, v24);
  CFMutableDictionaryRef v25 = IOServiceMatching("IOHIDDevice");
  __int128 v64 = v17;
  -[__CFDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v17, @"VendorID");
  id v63 = v18;
  -[__CFDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v18, @"ProductID");
  -[__CFDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  &off_100026A98,  @"PrimaryUsagePage");
  -[__CFDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  &off_100026AB0,  @"PrimaryUsage");
  uint64_t v54 = v25;
  dsema = v21;
  if (!IOServiceAddMatchingNotification( v23,  "IOServiceFirstMatch",  v54,  (IOServiceMatchingCallback)sub_10001243C,  v21,  &notification)
    && notification)
  {
    while (IOIteratorNext(notification))
      ;
  }

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = v20;
  id v59 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (!v59)
  {
    unsigned int v38 = 0LL;
    goto LABEL_39;
  }

  uint64_t v58 = *(void *)v76;
  id v55 = v19;
  uint64_t v52 = v23;
  uint64_t v53 = v22;
  uint64_t v51 = v24;
  do
  {
    for (i = 0LL; i != v59; i = (char *)i + 1)
    {
      if (*(void *)v76 != v58) {
        objc_enumerationMutation(obj);
      }
      unsigned int v27 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
      id v28 = [v64 intValue];
      id v29 = [v63 intValue];
      uint64_t v30 = SHFU_UNKNOWN_LOCATION_ID;
      if (v19) {
        unsigned int v31 = [v19 unsignedIntValue];
      }
      else {
        unsigned int v31 = SHFU_UNKNOWN_INTERFACE_NUMBER;
      }
      id v74 = 0LL;
      LODWORD(v50) = v31;
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:withVendorID:productID:locationID:interfaceNumber:errorDomain:error:",  v61,  v60,  v62,  v28,  v29,  v30,  v50,  v66,  &v74));
      __int16 v33 = (NSError *)v74;
      if (v33)
      {
        unsigned int v38 = v33;
        __int128 v56 = v32;
        goto LABEL_37;
      }

      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id v34 = v32;
      id v35 = [v34 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (!v35)
      {

        goto LABEL_33;
      }

      id v36 = v35;
      __int128 v56 = v32;
      __int128 v65 = i;
      char v37 = 0;
      unsigned int v38 = 0LL;
      uint64_t v39 = *(void *)v71;
      while (2)
      {
        for (j = 0LL; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(v34);
          }
          int8x16_t v41 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)j);
          if ([v41 shouldInstallFW:v27 personalizationAllowed:0])
          {
            int8x16_t v42 = (void *)objc_claimAutoreleasedReturnValue([v27 payload]);
            __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( [v41 sendSingleFirmwareToDevice:v42 totalPrepareBytes:a8 bytesSent:a9 featureReportDelay:v69]);

            if (v43)
            {
              if ((v37 & 1) == 0)
              {
                __int128 v44 = v43;

                char v37 = 0;
                unsigned int v38 = v44;
LABEL_25:

                continue;
              }
            }

            else
            {
              [v41 reset];
              if (a11)
              {
                dispatch_time_t v45 = dispatch_time(0LL, 60000000000LL);
                if (dispatch_semaphore_wait(dsema, v45))
                {
                  __int128 v46 = objc_alloc(&OBJC_CLASS___NSError);
                  NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
                  v81 = @"No devices enumerated";
                  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
                  __int128 v48 = -[NSError initWithDomain:code:userInfo:](v46, "initWithDomain:code:userInfo:", v66, 0LL, v47);

                  unsigned int v38 = v48;
                  goto LABEL_30;
                }
              }
            }

            char v37 = 1;
            goto LABEL_25;
          }
        }

        id v36 = [v34 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v36) {
          continue;
        }
        break;
      }

- (unint64_t)getTotalFirmwareBytes:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (([v9 personalizationRequired] & 1) == 0)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 payload]);
          v6 += (unint64_t)[v10 length];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

- (id)commitAllFirmwares
{
  if (!-[SHFUDevice sendUberInitAndCommit](self, "sendUberInitAndCommit")) {
    goto LABEL_4;
  }
  __int16 v12 = -17213;
  uint64_t v3 = -[SHFUDevice setReportID:buffer:length:](self, "setReportID:buffer:length:", 178LL, &v12, 2LL);
  if (!(_DWORD)v3) {
    goto LABEL_4;
  }
  id v4 = SHFUIOReturnString(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Set uber commit report ID 0x%02X failed with %@ for device %@",  178LL,  v5,  self));

  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  __int128 v14 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v10 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v8, 26LL, v9);

  if (!v10)
  {
LABEL_4:
    -[SHFUDevice reset](self, "reset");
    id v10 = 0LL;
  }

  return v10;
}

- (void)reset
{
}

- (void)resetSecureFW
{
  v2[0] = 1;
  v2[1] = 1;
  -[SHFUDevice setReportID:buffer:length:](self, "setReportID:buffer:length:", 189LL, v2, 4LL);
}

- (BOOL)GATTServicesDiscoveryNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_100026AE0]);
  unsigned __int16 v5 = (unsigned __int16)[v4 unsignedIntValue];

  BOOL v6 = -[SHFUDevice productID](self, "productID") == 788 && v5 < 0x80u
    || -[SHFUDevice productID](self, "productID") == 789 && v5 < 0x30u;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109632;
    v10[1] = -[SHFUDevice productID](self, "productID");
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "PID 0x%04X ST FW version 0x%04X GATT service discovery needed %d",  (uint8_t *)v10,  0x14u);
  }

  return v6;
}

- (id)latestFirmwareForHardware:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  -[SHFUDevice hardwareVersion](self, "hardwareVersion")));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", 0xFFFFLL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  if (v7)
  {
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);

    if (v12)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));
      goto LABEL_8;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
    if (v10)
    {
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
      [v8 addEntriesFromDictionary:v11];
LABEL_8:
    }
  }

  return v8;
}

- (BOOL)hardwareVersionSupportedBy:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice latestFirmwareForHardware:](self, "latestFirmwareForHardware:", a3));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)firmwareVersionsOlderThan:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice latestFirmwareForHardware:](self, "latestFirmwareForHardware:", a3));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v5) {
    goto LABEL_19;
  }
  id v7 = v5;
  char v26 = 0;
  uint64_t v8 = *(void *)v28;
  *(void *)&__int128 v6 = 138412546LL;
  __int128 v25 = v6;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v10, "intValue", v25)));
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
      unsigned int v14 = [v13 unsignedIntValue];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
      unsigned int v16 = [v15 unsignedIntValue];

      if (v14)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
        if (v14 >= v16)
        {
          if (v18)
          {
            dispatch_semaphore_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
            *(_DWORD *)buf = 138412802;
            __int128 v32 = v21;
            __int16 v33 = 1024;
            LODWORD(v34[0]) = v14;
            WORD2(v34[0]) = 1024;
            *(_DWORD *)((char *)v34 + 6) = v16;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%@ has version 0x%x equal (or newer) than version 0x%x",  buf,  0x18u);
          }
        }

        else
        {
          if (v18)
          {
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
            *(_DWORD *)buf = 138412802;
            __int128 v32 = v20;
            __int16 v33 = 1024;
            LODWORD(v34[0]) = v14;
            WORD2(v34[0]) = 1024;
            *(_DWORD *)((char *)v34 + 6) = v16;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%@ has version 0x%x older than version 0x%x",  buf,  0x18u);
          }

          char v26 = 1;
        }
      }

      else
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
          *(_DWORD *)buf = v25;
          __int128 v32 = v19;
          __int16 v33 = 2112;
          v34[0] = self;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@ does not have a version number reported by %@",  buf,  0x16u);
        }
      }
    }

    id v7 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  }

  while (v7);
  if ((v26 & 1) != 0)
  {
    BOOL v22 = 1;
  }

  else
  {
LABEL_19:
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100017CB8();
    }

    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)firmwareVersionsEqualTo:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice latestFirmwareForHardware:](self, "latestFirmwareForHardware:", a3));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v5)
  {
LABEL_19:
    BOOL v21 = 1;
    goto LABEL_23;
  }

  id v7 = v5;
  uint64_t v8 = *(void *)v27;
  char v25 = 1;
  *(void *)&__int128 v6 = 138412546LL;
  __int128 v24 = v6;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v10, "intValue", v24)));
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice fwVersions](self, "fwVersions"));
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
      unsigned int v14 = [v13 unsignedIntValue];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
      unsigned int v16 = [v15 unsignedIntValue];

      if (!v14)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
        *(_DWORD *)buf = v24;
        unsigned int v31 = v19;
        __int16 v32 = 2112;
        v33[0] = self;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@ does not have a version number reported by %@",  buf,  0x16u);
        goto LABEL_12;
      }

      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v14 == v16)
      {
        if (!v18) {
          goto LABEL_16;
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
        *(_DWORD *)buf = 138412802;
        unsigned int v31 = v19;
        __int16 v32 = 1024;
        LODWORD(v33[0]) = v14;
        WORD2(v33[0]) = 1024;
        *(_DWORD *)((char *)v33 + 6) = v14;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%@ has version 0x%x equal to version 0x%x",  buf,  0x18u);
LABEL_12:

        goto LABEL_16;
      }

      if (v18)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( AUFileParser,  "auTypeString:",  [v11 unsignedIntValue]));
        *(_DWORD *)buf = 138412802;
        unsigned int v31 = v20;
        __int16 v32 = 1024;
        LODWORD(v33[0]) = v14;
        WORD2(v33[0]) = 1024;
        *(_DWORD *)((char *)v33 + 6) = v16;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%@ has version 0x%x not equal to version 0x%x",  buf,  0x18u);
      }

      char v25 = 0;
LABEL_16:
    }

    id v7 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  }

  while (v7);
  if ((v25 & 1) != 0) {
    goto LABEL_19;
  }
  BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100017CE4();
  }

  BOOL v21 = 0;
LABEL_23:

  return v21;
}

- (id)sendSingleFirmwareToDevice:(id)a3 totalPrepareBytes:(unint64_t)a4 bytesSent:(unint64_t *)a5 featureReportDelay:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100017D10(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  unsigned __int16 v19 = -[SHFUDevice writeBufferSize](self, "writeBufferSize") - 1;
  __int16 v109 = 29282;
  v107 = self;
  if (-[SHFUDevice sendOffsets](self, "sendOffsets")) {
    uint64_t v20 = 3LL;
  }
  else {
    uint64_t v20 = 0LL;
  }
  uint64_t v21 = 4096LL;
  if (v19) {
    uint64_t v21 = (unsigned __int16)(0x1000u / v19 * v19);
  }
  unint64_t v104 = v21;
  v105 = (char *)v19;
  uint64_t v106 = v20;
  v101 = v10;
  v102 = a5;
  if (!((_DWORD)v20 + v19) || (BOOL v22 = malloc(v20 + v19)) == 0LL)
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ran out of memory for device %@",  self));
    id v35 = objc_alloc(&OBJC_CLASS___NSError);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v155 = NSLocalizedDescriptionKey;
    v156 = v27;
    char v34 = 1;
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v156,  &v155,  1LL));
    __int16 v33 = -[NSError initWithDomain:code:userInfo:](v35, "initWithDomain:code:userInfo:", v30, 31LL, v31);
    uint64_t v23 = 0LL;
LABEL_13:

    if (v33) {
      goto LABEL_55;
    }
    goto LABEL_16;
  }

  uint64_t v23 = v22;
  uint64_t v24 = -[SHFUDevice setReportID:buffer:length:](self, "setReportID:buffer:length:", 176LL, &v109, 2LL);
  if ((_DWORD)v24)
  {
    char v25 = SHFUIOReturnString(v24);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Regular init report ID 0x%02X failed with %@ for device %@",  176LL,  v26,  self));

    id v28 = v9;
    __int128 v29 = objc_alloc(&OBJC_CLASS___NSError);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v153 = NSLocalizedDescriptionKey;
    v154 = v27;
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v154,  &v153,  1LL));
    __int16 v32 = v29;
    id v9 = v28;
    __int16 v33 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v30, 25LL, v31);
    char v34 = 0;
    goto LABEL_13;
  }

  -[SHFUDevice delayAfterInitReport](self, "delayAfterInitReport");
  char v34 = 0;
LABEL_16:
  uint64_t v36 = 0LL;
  unint64_t v37 = 0LL;
  unsigned int v38 = v105;
  v103 = &v23[v106];
  uint64_t v39 = v102;
  v99 = v23;
  id v100 = v9;
  while (v37 < (unint64_t)[v9 length])
  {
    if (!(v37 % v104))
    {
      __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](v107, "logHandle"));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = [v9 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "wrote %lu bytes out of %lu", buf, 0x16u);
      }

      if (v39)
      {
        double v42 = (double)(100 * *v39 / a4);
        __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice delegate](v107, "delegate"));
        [v43 progress:v42];
      }
    }

    if (&v38[v37] > [v9 length])
    {
      __int128 v44 = (char *)[v9 length];
      unsigned int v38 = &v44[v36];
    }

    if (-[SHFUDevice sendOffsets](v107, "sendOffsets"))
    {
      _BYTE *v23 = BYTE2(v37);
      v23[1] = BYTE1(v37);
      v23[2] = v37;
    }

    objc_msgSend(v9, "getBytes:range:", v103, v37, v38);
    uint64_t v45 = -[SHFUDevice setReportID:buffer:length:](v107, "setReportID:buffer:length:", 177LL, v23, &v38[v106]);
    if ((_DWORD)v45)
    {
      uint64_t v46 = v45;
      __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](v107, "logHandle"));
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v63 = [v9 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v63;
        _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "wrote %lu bytes out of %lu",  buf,  0x16u);
      }

      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v23, &v38[v106]));
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](v107, "logHandle"));
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed feature report buffer: %@",  buf,  0xCu);
      }

      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      __int128 v143 = 0u;
      __int128 v144 = 0u;
      __int128 v141 = 0u;
      __int128 v142 = 0u;
      __int128 v139 = 0u;
      __int128 v140 = 0u;
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      __int128 v135 = 0u;
      __int128 v136 = 0u;
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      memset(buf, 0, sizeof(buf));
      unsigned int v108 = 512;
      unsigned int v50 = -[SHFUDevice getReportID:buffer:length:](v107, "getReportID:buffer:length:", 178LL, buf, &v108);
      unsigned int v51 = v108;
      int v52 = buf[0];
      uint64_t v53 = SHFUIOReturnString(v46);
      uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
      id v55 = (void *)v54;
      if (v50 || v51 != 1 || v52 == 161 || v52 == 177)
      {
        __int128 v56 = v107;
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Write report ID 0x%02X failed with %@ for device %@",  177LL,  v54,  v107));
      }

      else
      {
        __int128 v56 = v107;
        BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice auErrorString:](v107, "auErrorString:", buf[0]));
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Write report ID 0x%02X failed with %@ (%@) for device %@",  177LL,  v55,  v57,  v107));
      }

      BOOL v60 = objc_alloc(&OBJC_CLASS___NSError);
      id v61 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v56, "errorDomain"));
      NSErrorUserInfoKey v120 = NSLocalizedDescriptionKey;
      v121 = v58;
      id v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
      __int16 v33 = -[NSError initWithDomain:code:userInfo:](v60, "initWithDomain:code:userInfo:", v61, 32LL, v62);

      uint64_t v23 = v99;
      id v9 = v100;
      uint64_t v39 = v102;
    }

    else
    {
      if (v39) {
        *v39 += (unint64_t)v38;
      }
      [v101 doubleValue];
      if (v59 > 0.0)
      {
        [v101 doubleValue];
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
      }

      __int16 v33 = 0LL;
    }

    v37 += (unint64_t)v105;
    v36 -= (uint64_t)v105;
    if (v33) {
      goto LABEL_55;
    }
  }

  __int128 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](v107, "logHandle"));
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    id v65 = [v9 length];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v65;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "wrote %lu bytes successfully.", buf, 0xCu);
  }

  id v66 = v23;

  unsigned int v67 = 0;
  do
  {
    __int128 v151 = 0u;
    __int128 v152 = 0u;
    __int128 v149 = 0u;
    __int128 v150 = 0u;
    __int128 v147 = 0u;
    __int128 v148 = 0u;
    __int128 v145 = 0u;
    __int128 v146 = 0u;
    __int128 v143 = 0u;
    __int128 v144 = 0u;
    __int128 v141 = 0u;
    __int128 v142 = 0u;
    __int128 v139 = 0u;
    __int128 v140 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v68 = -[SHFUDevice setReportID:buffer:length:](v107, "setReportID:buffer:length:", 178LL, buf, 1LL);
    if (v67 > 2) {
      break;
    }
    ++v67;
  }

  while ((_DWORD)v68 == -536870186);
  if (!(_DWORD)v68) {
    goto LABEL_58;
  }
  id v69 = SHFUIOReturnString(v68);
  __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  __int128 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Set regular commit report ID 0x%02X failed with %@ for device %@",  178LL,  v70,  v107));

  __int128 v72 = objc_alloc(&OBJC_CLASS___NSError);
  __int128 v73 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v107, "errorDomain"));
  NSErrorUserInfoKey v118 = NSLocalizedDescriptionKey;
  v119 = v71;
  id v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
  __int16 v33 = -[NSError initWithDomain:code:userInfo:](v72, "initWithDomain:code:userInfo:", v73, 27LL, v74);

  if (!v33)
  {
LABEL_58:
    __int128 v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  300.0));
    while (1)
    {
      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      __int128 v143 = 0u;
      __int128 v144 = 0u;
      __int128 v141 = 0u;
      __int128 v142 = 0u;
      __int128 v139 = 0u;
      __int128 v140 = 0u;
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      __int128 v135 = 0u;
      __int128 v136 = 0u;
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      memset(buf, 0, sizeof(buf));
      unsigned int v108 = 512;
      uint64_t v77 = -[SHFUDevice getReportID:buffer:length:](v107, "getReportID:buffer:length:", 178LL, buf, &v108);
      if ((_DWORD)v77)
      {
        uint64_t v86 = SHFUIOReturnString(v77);
        NSErrorUserInfoKey v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get regular commit report ID 0x%02X failed with %@ for device %@",  178LL,  v87,  v107));

        NSErrorUserInfoKey v89 = objc_alloc(&OBJC_CLASS___NSError);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v107, "errorDomain"));
        NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
        v113 = v88;
        v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v113,  &v112,  1LL));
        v92 = v89;
        v93 = v90;
        uint64_t v94 = 28LL;
        goto LABEL_69;
      }

      if (v108 != 1)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get regular commit report ID 0x%02X returned invalid payload length %u for device %@",  178LL,  v108,  v107));
        v95 = objc_alloc(&OBJC_CLASS___NSError);
        v90 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v107, "errorDomain"));
        NSErrorUserInfoKey v116 = NSLocalizedDescriptionKey;
        v117 = v88;
        v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
        v92 = v95;
        v93 = v90;
        uint64_t v94 = 29LL;
        goto LABEL_69;
      }

      uint64_t v78 = buf[0];
      if (buf[0] != 1) {
        break;
      }
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0);
      id v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v80 = [v79 compare:v76];

      if (v80 != (id)-1LL)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice auErrorString:](v107, "auErrorString:", 1LL));
        id v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get regular commit report ID 0x%02X returned invalid payload contents 0x%02X %@ for device %@",  178LL,  1LL,  v81,  v107));

        NSErrorUserInfoKey v83 = objc_alloc(&OBJC_CLASS___NSError);
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v107, "errorDomain"));
        NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
        v111 = v82;
        v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v111,  &v110,  1LL));
        __int16 v33 = -[NSError initWithDomain:code:userInfo:](v83, "initWithDomain:code:userInfo:", v84, 30LL, v85);

        goto LABEL_70;
      }
    }

    if (buf[0] == 161)
    {
      __int16 v33 = 0LL;
      goto LABEL_70;
    }

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice auErrorString:](v107, "auErrorString:", buf[0]));
    v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Get regular commit report ID 0x%02X returned invalid payload contents 0x%02X %@ for device %@",  178LL,  v78,  v96,  v107));

    v97 = objc_alloc(&OBJC_CLASS___NSError);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice errorDomain](v107, "errorDomain"));
    NSErrorUserInfoKey v114 = NSLocalizedDescriptionKey;
    v115 = v88;
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v115,  &v114,  1LL));
    v92 = v97;
    v93 = v90;
    uint64_t v94 = 30LL;
LABEL_69:
    __int16 v33 = -[NSError initWithDomain:code:userInfo:](v92, "initWithDomain:code:userInfo:", v93, v94, v91);

LABEL_70:
    uint64_t v23 = v66;
    if ((v34 & 1) == 0) {
      goto LABEL_56;
    }
    goto LABEL_57;
  }

  uint64_t v23 = v66;
LABEL_55:
  if ((v34 & 1) == 0) {
LABEL_56:
  }
    free(v23);
LABEL_57:

  return v33;
}

- (int)getReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int *)a5
{
  unsigned int v7 = a3;
  deviceRef = self->_deviceRef;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
  LODWORD(a5) = sub_10000F240(v7, a4, a5, deviceRef, v9);

  return (int)a5;
}

- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5
{
  unsigned int v6 = a3;
  uint64_t v8 = 3758097090LL;
  if (a4 || !a5)
  {
    if (a5 <= 0x200)
    {
      uint8_t report = a3;
      if (a4 && a5) {
        __memmove_chk(&v22, a4, a5, 512LL);
      }
      uint64_t v8 = IOHIDDeviceSetReport(self->_deviceRef, kIOHIDReportTypeFeature, v6, &report, a5 + 1);
    }

    else
    {
      uint64_t v8 = 3758097128LL;
    }
  }

  if (v6 != 179 && (_DWORD)v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &report, a5 + 1));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = SHFUIOReturnString(v8);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14[0] = 67109890;
      v14[1] = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "reportID 0x%02X payload %@ error 0x%08X %@",  (uint8_t *)v14,  0x22u);
    }
  }

  return v8;
}

- (id)auErrorString:(unsigned __int8)a3
{
  if ((int)a3 > 111)
  {
    if ((int)a3 > 160)
    {
      if ((int)a3 > 176)
      {
        if (a3 == 177) {
          return @"kAUErrorInvalidOperation";
        }
        if (a3 == 255) {
          return @"kAUErrorUnknown";
        }
      }

      else
      {
        if (a3 == 161) {
          return @"kAUErrorSuccessKey";
        }
        if (a3 == 176) {
          return @"kAUErrorInitKeyIncorrect";
        }
      }

      return @"Invalid Error";
    }

    else
    {
      switch(a3)
      {
        case 0x70u:
          id result = @"kAUErrorSigInvalid";
          break;
        case 0x71u:
          id result = @"kAUErrorSigDigestMismatch";
          break;
        case 0x72u:
          id result = @"kAUErrorSigInfoInvalid";
          break;
        case 0x73u:
          id result = @"kAUErrorSigBadMagic";
          break;
        case 0x74u:
          id result = @"kAUErrorSigVerUnsupported";
          break;
        case 0x75u:
          id result = @"kAUErrorSigBadDigestInfo";
          break;
        case 0x76u:
          id result = @"kAUErrorSigBadSigInfo";
          break;
        case 0x77u:
          id result = @"kAUErrorNotSigned";
          break;
        case 0x80u:
          id result = @"kAUErrorNotPersonalized";
          break;
        case 0x81u:
          id result = @"kAUErrorPersVerUnsupported";
          break;
        case 0x82u:
          id result = @"kAUErrorPersUDIDMismatch";
          break;
        case 0x83u:
          id result = @"kAUErrorPersBadMagic";
          break;
        default:
          return @"Invalid Error";
      }
    }
  }

  else
  {
    id result = @"kAUErrorNone";
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        id result = @"kAUErrorAccessoryBusy";
        break;
      case 2u:
        id result = @"kAUErrorReadFailure";
        break;
      case 3u:
        id result = @"kAUErrorStoreFailure";
        break;
      case 4u:
        id result = @"kAUErrorEraseFailure";
        break;
      case 5u:
        id result = @"kAUErrorLowBattery";
        break;
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        return @"Invalid Error";
      case 0x10u:
        id result = @"kAUErrorHdrSigInvalid";
        break;
      case 0x11u:
        id result = @"kAUErrorHdrVerUnsupported";
        break;
      case 0x12u:
        id result = @"kAUErrorHdrCRCMismatch";
        break;
      case 0x13u:
        id result = @"kAUErrorPayloadTypeInvalid";
        break;
      case 0x14u:
        id result = @"kAUErrorPayloadVerDowngrade";
        break;
      case 0x15u:
        id result = @"kAUErrorPayloadSizeInvalid";
        break;
      case 0x16u:
        id result = @"kAUErrorPayloadCRCMismatch";
        break;
      case 0x17u:
        id result = @"kAUErrorPayloadPIDMismatch";
        break;
      case 0x18u:
        id result = @"kAUErrorPayloadHWIDMismatch";
        break;
      case 0x19u:
        id result = @"kAUErrorHeaderIncomplete";
        break;
      case 0x1Au:
        id result = @"kAUErrorPayloadMinVersion";
        break;
      default:
        if (a3 != 64) {
          return @"Invalid Error";
        }
        id result = @"kAUErrorInvalidRegion";
        break;
    }
  }

  return result;
}

- (NSMutableDictionary)fwVersions
{
  fwVersions = self->_fwVersions;
  if (!fwVersions)
  {
    unsigned int v24 = 512;
    memset(v33, 0, sizeof(v33));
    if (-[SHFUDevice productID](self, "productID") == 629)
    {
      if (!-[SHFUDevice getReportID:buffer:length:](self, "getReportID:buffer:length:", 16LL, v33, &v24)
        && v24 >= 9
        && LOBYTE(v33[0]) == 2)
      {
        BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v5 = self->_fwVersions;
        self->_fwVersions = v4;

        uint64_t v6 = *(unsigned __int16 *)((char *)v33 + 5);
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)((char *)v33 + 5)));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_fwVersions,  "setObject:forKeyedSubscript:",  v7,  &off_100026AE0);

        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100017D80(v6, v8);
        }
      }
    }

    else
    {
      if (-[SHFUDevice useFWUpdateReportIDs](self, "useFWUpdateReportIDs")) {
        uint64_t v9 = 187LL;
      }
      else {
        uint64_t v9 = 206LL;
      }
      if (!-[SHFUDevice getReportID:buffer:length:](self, "getReportID:buffer:length:", v9, v33, &v24))
      {
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int16 v11 = self->_fwVersions;
        self->_fwVersions = v10;

        if ((v24 & 3) == 0)
        {
          unint64_t v14 = 4LL;
          *(void *)&__int128 v12 = 138413058LL;
          __int128 v23 = v12;
          do
          {
            uint64_t v15 = (unsigned __int16)v32[v14 / 2 + 1];
            int v16 = (unsigned __int16)v32[v14 / 2 + 2];
            __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v32[v14 / 2 + 2],  v23));
            int v18 = self->_fwVersions;
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  v15));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

            uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AUFileParser auTypeString:]( &OBJC_CLASS___AUFileParser,  "auTypeString:",  v15));
              *(_DWORD *)buf = v23;
              __int128 v26 = v22;
              __int16 v27 = 1024;
              int v28 = v15;
              __int16 v29 = 1024;
              int v30 = v16;
              __int16 v31 = 1024;
              *(_DWORD *)__int16 v32 = v16;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%@ (%d) version 0x%x (%d)",  buf,  0x1Eu);
            }

            if ((v24 & 3) != 0) {
              break;
            }
            BOOL v21 = v14 > v24 - 4;
            v14 += 4LL;
          }

          while (!v21);
        }
      }
    }

    fwVersions = self->_fwVersions;
  }

  return fwVersions;
}

- (unsigned)hardwareVersion
{
  int hardwareVersion = self->_hardwareVersion;
  if (!hardwareVersion)
  {
    unsigned int v7 = 512;
    memset(v8, 0, sizeof(v8));
    if (-[SHFUDevice productID](self, "productID") == 629)
    {
      if (-[SHFUDevice getReportID:buffer:length:](self, "getReportID:buffer:length:", 16LL, v8, &v7)
        || v7 < 9
        || LOBYTE(v8[0]) != 2)
      {
        goto LABEL_13;
      }

      BOOL v4 = (unsigned __int16 *)((char *)v8 + 7);
    }

    else
    {
      if (-[SHFUDevice useFWUpdateReportIDs](self, "useFWUpdateReportIDs")) {
        uint64_t v5 = 188LL;
      }
      else {
        uint64_t v5 = 207LL;
      }
      BOOL v4 = (unsigned __int16 *)v8;
      if (-[SHFUDevice getReportID:buffer:length:](self, "getReportID:buffer:length:", v5, v8, &v7) || v7 != 2) {
        goto LABEL_13;
      }
    }

    self->_int hardwareVersion = *v4;
LABEL_13:
    LOWORD(hardwareVersion) = self->_hardwareVersion;
  }

  return hardwareVersion;
}

- (BOOL)batteryIsCharging
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice powerSource](self, "powerSource"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Is Charging"]);

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (int)batteryCapacity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice powerSource](self, "powerSource"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Current Capacity"]);

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSDictionary)powerSource
{
  BOOL v3 = -[SHFUDevice productID](self, "productID") == 620
    || -[SHFUDevice productID](self, "productID") == 615
    || -[SHFUDevice productID](self, "productID") == 617
    || -[SHFUDevice productID](self, "productID") == 613
    || -[SHFUDevice productID](self, "productID") == 666
    || -[SHFUDevice productID](self, "productID") == 668
    || -[SHFUDevice productID](self, "productID") == 671
    || -[SHFUDevice productID](self, "productID") == 803
    || -[SHFUDevice productID](self, "productID") == 804
    || -[SHFUDevice productID](self, "productID") == 800
    || -[SHFUDevice productID](self, "productID") == 801
    || -[SHFUDevice productID](self, "productID") == 802;
  if (!-[SHFUDevice hasPowerSource](self, "hasPowerSource")
    || self->_powerSource
    || -[SHFUDevice powerSourceTimedOut](self, "powerSourceTimedOut")
    || (!v3
      ? (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice productName](self, "productName")))
      : (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialNumber](self, "serialNumber"))),
        unsigned int v7 = v6,
        id v8 = [v6 length],
        v7,
        !v8))
  {
    BOOL v4 = self->_powerSource;
  }

  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000148EC;
    v20[3] = &unk_100024870;
    v20[4] = self;
    BOOL v21 = v3;
    uint64_t v9 = objc_retainBlock(v20);
    int out_token = 0;
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialQueue](self, "serialQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100014AB4;
    handler[3] = &unk_100024898;
    handler[4] = self;
    __int16 v11 = v9;
    id v18 = v11;
    uint32_t v12 = notify_register_dispatch("com.apple.system.accpowersources.attach", &out_token, v10, handler);

    if (!v12)
    {
      uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice serialQueue](self, "serialQueue"));
      dispatch_async(v13, v11);

      dispatch_time_t v14 = dispatch_time(0LL, 15000000000LL);
      uint64_t v15 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice powerSemaphore](self, "powerSemaphore"));
      -[SHFUDevice setPowerSourceTimedOut:](self, "setPowerSourceTimedOut:", dispatch_semaphore_wait(v15, v14));

      if (-[SHFUDevice powerSourceTimedOut](self, "powerSourceTimedOut"))
      {
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUDevice logHandle](self, "logHandle"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100017E4C();
        }
      }

      notify_cancel(out_token);
    }

    BOOL v4 = self->_powerSource;
  }

  return v4;
}

- (void)setPowerSource:(id)a3
{
}

- (FudPluginDelegate)delegate
{
  return (FudPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_loadWeakRetained((id *)&self->_logHandle);
}

- (void)setLogHandle:(id)a3
{
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unsigned int)a3
{
  self->_locationID = a3;
}

- (NSNumber)interfaceNum
{
  return self->_interfaceNum;
}

- (void)setInterfaceNum:(id)a3
{
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSNumber)registryEntryID
{
  return self->_registryEntryID;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (BOOL)useFWUpdateReportIDs
{
  return self->_useFWUpdateReportIDs;
}

- (BOOL)sendOffsets
{
  return self->_sendOffsets;
}

- (BOOL)sendUberInitAndCommit
{
  return self->_sendUberInitAndCommit;
}

- (BOOL)hasPowerSource
{
  return self->_hasPowerSource;
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (unsigned)updateFlags
{
  return self->_updateFlags;
}

- (unsigned)initReportDelay
{
  return self->_initReportDelay;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144LL, 1);
}

- (OS_dispatch_semaphore)powerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 152LL, 1);
}

- (NSObject)personalizationObserver
{
  return self->_personalizationObserver;
}

- (void)setPersonalizationObserver:(id)a3
{
}

- (int64_t)powerSourceTimedOut
{
  return self->_powerSourceTimedOut;
}

- (void)setPowerSourceTimedOut:(int64_t)a3
{
  self->_powerSourceTimedOut = a3;
}

- (void).cxx_destruct
{
}

@end