@interface AppleHPMManager
+ (id)create;
- (NSMutableDictionary)_analyticsDict;
- (int)_rid;
- (int)collectAllAnalytics;
- (int)getAppLoaded;
- (int)getBootFlags;
- (int)getFWVersion;
- (int)getHealthCheck;
- (int)getMode;
- (int)initialize:(unsigned int)a3 withLogger:(id)a4;
- (void)set_analyticsDict:(id)a3;
- (void)set_rid:(int)a3;
@end

@implementation AppleHPMManager

+ (id)create
{
  return objc_alloc_init((Class)a1);
}

- (int)initialize:(unsigned int)a3 withLogger:(id)a4
{
  kern_return_t matched;
  io_service_t v16;
  io_registry_entry_t appleHPMDeviceService;
  CFNumberRef v19;
  CFNumberRef v20;
  uint8_t v22[4];
  int valuePtr;
  BOOLean_t matches;
  io_registry_entry_t child;
  int v6 = -536870212;
  v7 = (os_log_s *)a4;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  analyticsDict = self->_analyticsDict;
  self->_analyticsDict = v8;

  if (self->_analyticsDict)
  {
    v10 = IOServiceMatching("AppleTCController");
    v11 = IOServiceMatching("AppleHPMDevice");
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, @"RID", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v13 = CFProperty;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &self->_rid);
      CFRelease(v13);
    }

    IORegistryEntryGetChildEntry(a3, "IOService", &child);
    io_service_t v14 = child;
    if (child)
    {
      while (1)
      {
        matches = 0;
        matched = IOServiceMatchPropertyTable(v14, v11, &matches);
        v16 = child;
        if (!matched && matches)
        {
          IOObjectRetain(child);
          v16 = child;
          self->appleHPMDeviceService = child;
        }

        if (!IOServiceMatchPropertyTable(v16, v10, &matches) && matches != 0) {
          break;
        }
        IOObjectRelease(child);
        IORegistryEntryGetChildEntry(child, "IOService", &child);
        io_service_t v14 = child;
        if (!child) {
          goto LABEL_14;
        }
      }

      IOObjectRetain(child);
      self->appleHPMInterfaceService = child;
    }

- (int)getFWVersion
{
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( self->appleHPMDeviceService,  @"Version",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v4 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberIntType, valuePtr);
    CFRelease(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%x.%x.%x",  ((v9 << 16) | (v10 << 24)) >> 20,  (((v9 << 16) | (valuePtr[1] << 8)) >> 8) & 0xFFF,  valuePtr[0]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v5,  @"FWVersion");

    return 0;
  }

  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled(self->logger, OS_LOG_TYPE_ERROR)) {
      sub_100003558();
    }
  }

  return v6;
}

- (int)getBootFlags
{
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( self->appleHPMInterfaceService,  @"Boot Flags",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v4 = CFProperty;
    BytePtr = CFDataGetBytePtr(CFProperty);
    if (BytePtr)
    {
      int v6 = BytePtr;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  BytePtr[1] >> 3));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v7,  @"DFUReason");

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6[2] & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v8,  @"NoVINFlag");

      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6[2] >> 7));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v9,  @"MainThermalShutdown");

      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6[4] & 3));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v10,  @"TrustEvaluationStatus");

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v6[4] >> 3) & 0xF));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v11,  @"Img4DecodeError");

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  v6[5] & 0x1F));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v12,  @"Img4PropertyErrorCode");

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 1) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v13,  @"PatchPresent");

      io_service_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 2) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v14,  @"PatchValid");

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 3) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v15,  @"ACSRAMPresent");

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 4) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v16,  @"ACSRAMValid");

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 5) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v17,  @"ACOTPPresent");

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v6[7] >> 6) & 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v18,  @"ACOTPValid");

      CFRelease(v4);
      return 0;
    }

    else
    {
      int v19 = -536870212;
      CFRelease(v4);
    }
  }

  else
  {
    int v19 = -536870212;
    if (os_log_type_enabled(self->logger, OS_LOG_TYPE_ERROR)) {
      sub_100003584();
    }
  }

  return v19;
}

- (int)getHealthCheck
{
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( self->appleHPMInterfaceService,  @"HChk",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v4 = CFProperty;
    BytePtr = CFDataGetBytePtr(CFProperty);
    if (BytePtr)
    {
      int v6 = (unsigned __int8 *)BytePtr;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *BytePtr));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v7,  @"SoftWDTCount");

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6[1]));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v8,  @"HardWDTCount");

      BOOL v9 = v6[2] || v6[3] || v6[4] || v6[5] != 0;
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v10,  @"ParityFailureFound");

      CFRelease(v4);
      return 0;
    }

    else
    {
      int v11 = -536870212;
      CFRelease(v4);
    }
  }

  else
  {
    int v11 = -536870212;
    if (os_log_type_enabled(self->logger, OS_LOG_TYPE_ERROR)) {
      sub_1000035B0();
    }
  }

  return v11;
}

- (int)getAppLoaded
{
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( self->appleHPMInterfaceService,  @"AppLoaded Count",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v4 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    CFRelease(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", valuePtr));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v5,  @"AppLoaded");

    return 0;
  }

  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled(self->logger, OS_LOG_TYPE_ERROR)) {
      sub_1000035DC();
    }
  }

  return v6;
}

- (int)getMode
{
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( self->appleHPMDeviceService,  @"HPM Mode Register on Boot",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v4 = CFProperty;
    v9.location = 0LL;
    v9.length = 4LL;
    CFDataGetBytes(CFProperty, v9, buffer);
    CFRelease(v4);
    v5 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  4LL,  1LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsDict,  "setObject:forKeyedSubscript:",  v5,  @"Mode");

    return 0;
  }

  else
  {
    int v6 = -536870212;
    if (os_log_type_enabled(self->logger, OS_LOG_TYPE_ERROR)) {
      sub_100003608();
    }
  }

  return v6;
}

- (int)collectAllAnalytics
{
  unsigned int v3 = -[AppleHPMManager getMode](self, "getMode");
  unsigned int v4 = -[AppleHPMManager getAppLoaded](self, "getAppLoaded") | v3;
  unsigned int v5 = -[AppleHPMManager getFWVersion](self, "getFWVersion");
  unsigned int v6 = v4 | v5 | -[AppleHPMManager getBootFlags](self, "getBootFlags");
  if (v6 | -[AppleHPMManager getHealthCheck](self, "getHealthCheck")) {
    return -536870212;
  }
  else {
    return 0;
  }
}

- (NSMutableDictionary)_analyticsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)set_analyticsDict:(id)a3
{
}

- (int)_rid
{
  return self->_rid;
}

- (void)set_rid:(int)a3
{
  self->_rid = a3;
}

- (void).cxx_destruct
{
}

@end