@interface AppleTVRemoteIRInterface
+ (id)getPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4;
- (AppleTVRemoteIRInterface)init;
- (AppleTVRemoteIRInterface)initWithDeviceRef:(unsigned int)a3;
- (BOOL)activateButtonCombination:(id)a3 delay:(double)a4 activationFlag:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)getButtonMaskV1:(unsigned __int16 *)a3 forCoreIRButtonCombo:(id)a4 error:(id *)a5;
- (BOOL)getButtonMaskV2:(unsigned __int16 *)a3 forCoreIRButtonCombo:(id)a4 error:(id *)a5;
- (BOOL)isRxInterface;
- (BOOL)isTxInterface;
- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6;
- (BOOL)transmitCommand:(id)a3 pressDuration:(double)a4 error:(id *)a5;
- (BOOL)transmitFrame:(id)a3 error:(id *)a4;
- (NSString)className;
- (NSString)serialNumber;
- (NSString)transport;
- (NSString)uniqueID;
- (id)buttons;
- (id)description;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5;
- (unint64_t)maxStoredCommands;
- (unsigned)locationID;
- (unsigned)productID;
- (unsigned)vendorID;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setClassName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setTransport:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation AppleTVRemoteIRInterface

+ (id)getPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4
{
  v4 = 0LL;
  if (a3 && a4) {
    v4 = (void *)IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, 0);
  }
  return v4;
}

- (BOOL)getButtonMaskV1:(unsigned __int16 *)a3 forCoreIRButtonCombo:(id)a4 error:(id *)a5
{
  id v7 = a4;
  *a3 = 0;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8)
  {
    char v11 = 1;
    goto LABEL_34;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v19;
  char v11 = 1;
  do
  {
    v12 = 0LL;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
      if ([v13 usagePage] == 1 && objc_msgSend(v13, "usageID") == 134)
      {
        unsigned __int16 v14 = 32;
LABEL_9:
        *a3 = v14;
        goto LABEL_25;
      }

      if ([v13 usagePage] == 12)
      {
        int v15 = [v13 usageID];
        if (v15 <= 127)
        {
          switch(v15)
          {
            case 4:
              unsigned __int16 v14 = *a3 | 0x10;
              goto LABEL_9;
            case 48:
              unsigned __int16 v14 = *a3 | 0x40;
              goto LABEL_9;
            case 96:
              unsigned __int16 v14 = *a3 | 1;
              goto LABEL_9;
          }
        }

        else if (v15 > 232)
        {
          if (v15 == 233)
          {
            unsigned __int16 v14 = *a3 | 2;
            goto LABEL_9;
          }

          if (v15 == 234)
          {
            unsigned __int16 v14 = *a3 | 4;
            goto LABEL_9;
          }
        }

        else
        {
          if (v15 == 128)
          {
            unsigned __int16 v14 = *a3 | 0x80;
            goto LABEL_9;
          }

          if (v15 == 205)
          {
            unsigned __int16 v14 = *a3 | 8;
            goto LABEL_9;
          }
        }
      }

      char v11 = 0;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
      }
LABEL_25:
      v12 = (char *)v12 + 1;
    }

    while (v9 != v12);
    id v16 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    id v9 = v16;
  }

  while (v16);
LABEL_34:

  return v11 & 1;
}

- (BOOL)getButtonMaskV2:(unsigned __int16 *)a3 forCoreIRButtonCombo:(id)a4 error:(id *)a5
{
  id v7 = a4;
  *a3 = 0;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8)
  {
    char v11 = 1;
    goto LABEL_41;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v19;
  char v11 = 1;
  do
  {
    v12 = 0LL;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
      if ([v13 usagePage] == 1 && objc_msgSend(v13, "usageID") == 134)
      {
        unsigned __int16 v14 = 64;
LABEL_9:
        *a3 = v14;
        goto LABEL_28;
      }

      if ([v13 usagePage] == 12)
      {
        int v15 = [v13 usageID];
        if (v15 <= 95)
        {
          switch(v15)
          {
            case 'B':
              unsigned __int16 v14 = *a3 | 0x200;
              goto LABEL_9;
            case 'C':
              unsigned __int16 v14 = *a3 | 0x800;
              goto LABEL_9;
            case 'D':
              unsigned __int16 v14 = *a3 | 0x1000;
              goto LABEL_9;
            case 'E':
              unsigned __int16 v14 = *a3 | 0x400;
              goto LABEL_9;
            default:
              if (v15 == 4)
              {
                unsigned __int16 v14 = *a3 | 0x20;
              }

              else
              {
                if (v15 != 48) {
                  goto LABEL_26;
                }
                unsigned __int16 v14 = *a3 | 0x10;
              }

              break;
          }

          goto LABEL_9;
        }

        if (v15 > 225)
        {
          switch(v15)
          {
            case 226:
              unsigned __int16 v14 = *a3 | 0x80;
              goto LABEL_9;
            case 233:
              unsigned __int16 v14 = *a3 | 2;
              goto LABEL_9;
            case 234:
              unsigned __int16 v14 = *a3 | 4;
              goto LABEL_9;
          }
        }

        else
        {
          switch(v15)
          {
            case 96:
              unsigned __int16 v14 = *a3 | 1;
              goto LABEL_9;
            case 128:
              unsigned __int16 v14 = *a3 | 8;
              goto LABEL_9;
            case 205:
              unsigned __int16 v14 = *a3 | 0x100;
              goto LABEL_9;
          }
        }
      }

- (AppleTVRemoteIRInterface)init
{
  return 0LL;
}

- (AppleTVRemoteIRInterface)initWithDeviceRef:(unsigned int)a3
{
  if (!a3)
  {

    return 0LL;
  }

  uint64_t v3 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AppleTVRemoteIRInterface;
  v4 = -[AppleTVRemoteIRInterface init](&v18, "init");
  if (!v4) {
    return v4;
  }
  v5 = IOHIDDeviceCreate(kCFAllocatorDefault, v3);
  v4->_deviceRef = v5;
  if (!v5)
  {

    return 0LL;
  }

  if (IOHIDDeviceOpen(v5, 0))
  {

    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    return 0LL;
  }

  if (!IORegistryEntryGetName(v3, name))
  {
    id v7 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  name,  4LL);
    className = v4->_className;
    v4->_className = v7;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"Transport"));
  transport = v4->_transport;
  v4->_transport = (NSString *)v9;

  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"SerialNumber"));
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v11;

  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"PhysicalDeviceUniqueID"));
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSString *)v13;

  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"ProductID"));
  v4->_productID = (unsigned __int16)[v15 intValue];
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"VendorID"));

  v4->_vendorID = (unsigned __int16)[v16 intValue];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"LocationID"));

  v4->_locationID = [v17 unsignedIntValue];
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  return v4;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    if (IOHIDDeviceClose(deviceRef, 0)
      && gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    CFRelease(self->_deviceRef);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTVRemoteIRInterface;
  -[AppleTVRemoteIRInterface dealloc](&v4, "dealloc");
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVRemoteIRInterface serialNumber](self, "serialNumber"));
  unsigned int v4 = -[AppleTVRemoteIRInterface productID](self, "productID");
  unsigned int v5 = -[AppleTVRemoteIRInterface vendorID](self, "vendorID");
  uint64_t v6 = -[AppleTVRemoteIRInterface locationID](self, "locationID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVRemoteIRInterface uniqueID](self, "uniqueID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[serialNumber %@ PID 0x%x VID 0x%x locationID 0x%x uniqueID %@]",  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (int)setReportID:(unsigned __int8)a3 buffer:(char *)a4 length:(unsigned int)a5
{
  unsigned int v6 = a3;
  IOReturn v8 = -536870208;
  if (!a4 && a5)
  {
    IOReturn v8 = -536870206;
LABEL_23:
    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    return v8;
  }

  if (a5 > 0x200)
  {
    IOReturn v8 = -536870168;
    goto LABEL_23;
  }

  if (!self->_deviceRef) {
    goto LABEL_23;
  }
  uint8_t report = a3;
  if (a4 && a5) {
    __memmove_chk(v15, a4, a5, 512LL);
  }
  if (gLogCategory_CoreRCInterface <= 20
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 20LL)))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"0x%02X",  report));
    if (a5)
    {
      uint64_t v10 = v15;
      uint64_t v11 = a5 + 1 - 1LL;
      do
      {
        unsigned int v12 = *v10++;
        objc_msgSend(v9, "appendFormat:", @" 0x%02X", v12);
        --v11;
      }

      while (v11);
    }

    if (gLogCategory_CoreRCInterface < 21
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 20LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }
  }

  IOReturn v8 = IOHIDDeviceSetReport(self->_deviceRef, kIOHIDReportTypeFeature, v6, &report, a5 + 1);
  if (v8) {
    goto LABEL_23;
  }
  return v8;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (gLogCategory_CoreRCInterface <= 20)
  {
    id v6 = v3;
    if (gLogCategory_CoreRCInterface != -1
      || (v5 = _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 20LL), unsigned int v4 = v6, v5))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
      unsigned int v4 = v6;
    }
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (gLogCategory_CoreRCInterface <= 20)
  {
    id v6 = v3;
    if (gLogCategory_CoreRCInterface != -1
      || (v5 = _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 20LL), unsigned int v4 = v6, v5))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
      unsigned int v4 = v6;
    }
  }
}

- (id)buttons
{
  id v3 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:96];
  id v4 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:233];
  id v5 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:234];
  id v6 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:205];
  id v7 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:4];
  id v8 = [[CoreIRButton alloc] initWithUsagePage:1 usageID:134];
  id v9 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:48];
  id v10 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:128];
  __int128 v21 = v4;
  v22 = v3;
  v24[0] = v3;
  v24[1] = v4;
  v24[2] = v5;
  v24[3] = v6;
  v24[4] = v7;
  v24[5] = v8;
  v24[6] = v9;
  v24[7] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 8LL));
  if (-[AppleTVRemoteIRInterface productID](self, "productID") != 614
    && -[AppleTVRemoteIRInterface productID](self, "productID") != 621)
  {
    id v20 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:226];
    id v18 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:66];
    id v12 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:69];
    id v19 = v5;
    id v13 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:67];
    id v14 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:68];
    v23[0] = v20;
    v23[1] = v18;
    v23[2] = v12;
    v23[3] = v13;
    v23[4] = v14;
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 5LL));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 arrayByAddingObjectsFromArray:v15]);

    id v5 = v19;
    uint64_t v11 = (void *)v17;
  }

  return v11;
}

- (unint64_t)maxStoredCommands
{
  return 32LL;
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    id v9 = self;
    uint64_t v10 = mach_absolute_time();
    id v8 = "-[AppleTVRemoteIRInterface clearAllStoredCommands:]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  __int16 v11 = 21930;
  signed int v5 = -[AppleTVRemoteIRInterface setReportID:buffer:length:]( self,  "setReportID:buffer:length:",  128LL,  &v11,  2LL,  v8,  v9,  v10);
  signed int v6 = v5;
  if (a3)
  {
    if (v5)
    {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v5,  0LL));
      if (gLogCategory_CoreRCInterface <= 90
        && (gLogCategory_CoreRCInterface != -1
         || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
      {
        LogPrintF(&gLogCategory_CoreRCInterface);
      }
    }
  }

  return v6 == 0;
}

- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    uint64_t v35 = mach_absolute_time();
    double v34 = a5;
    id v32 = v10;
    id v33 = v11;
    v30 = "-[AppleTVRemoteIRInterface setCommand:forButtonCombination:delay:error:]";
    v31 = self;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  __int16 v36 = 0;
  if (-[AppleTVRemoteIRInterface productID](self, "productID", v30, v31, v32, v33, *(void *)&v34, v35) == 614
    || -[AppleTVRemoteIRInterface productID](self, "productID") == 621)
  {
    if (-[AppleTVRemoteIRInterface getButtonMaskV1:forCoreIRButtonCombo:error:]( self,  "getButtonMaskV1:forCoreIRButtonCombo:error:",  &v36,  v11,  a6))
    {
      goto LABEL_8;
    }

- (BOOL)transmitCommand:(id)a3 pressDuration:(double)a4 error:(id *)a5
{
  id v8 = a3;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    mach_absolute_time();
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (a4 < 0.0 || a4 > 25.5)
  {
    if (!a5)
    {
LABEL_19:
      BOOL v14 = 0;
      goto LABEL_20;
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
    BOOL v14 = 0;
    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
  unsigned __int8 v10 = [v9 protocolID];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
  unsigned __int8 v12 = [v11 options];

  v17[0] = vcvtmd_s64_f64((a4 + 0.05) / 0.1);
  v17[1] = v10;
  v17[2] = v12;
  unint64_t v18 = bswap64((unint64_t)[v8 payload]);
  signed int v13 = -[AppleTVRemoteIRInterface setReportID:buffer:length:](self, "setReportID:buffer:length:", 18LL, v17, 11LL);
  BOOL v14 = v13 == 0;
  if (a5 && v13)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v13,  0LL));
LABEL_12:
    *a5 = v15;
  }

  if (a5 && !v14)
  {
    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    goto LABEL_19;
  }

- (BOOL)transmitFrame:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    mach_absolute_time();
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if (a4)
  {
    id v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6735LL, 0LL));
    *a4 = v6;

    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }
  }

  return 0;
}

- (BOOL)activateButtonCombination:(id)a3 delay:(double)a4 activationFlag:(unsigned __int8)a5 error:(id *)a6
{
  id v10 = a3;
  __int16 v18 = 0;
  if (-[AppleTVRemoteIRInterface productID](self, "productID") == 614
    || -[AppleTVRemoteIRInterface productID](self, "productID") == 621)
  {
    if (!-[AppleTVRemoteIRInterface getButtonMaskV1:forCoreIRButtonCombo:error:]( self,  "getButtonMaskV1:forCoreIRButtonCombo:error:",  &v18,  v10,  a6)) {
      goto LABEL_13;
    }
  }

  else if (!-[AppleTVRemoteIRInterface getButtonMaskV2:forCoreIRButtonCombo:error:]( self,  "getButtonMaskV2:forCoreIRButtonCombo:error:",  &v18,  v10,  a6))
  {
    goto LABEL_13;
  }

  if (a4 < 0.0 || a4 > 25.5)
  {
    if (a6)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
      BOOL v14 = 0;
LABEL_18:
      *a6 = v13;
      goto LABEL_19;
    }

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  id v8 = a3;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    uint64_t v15 = mach_absolute_time();
    double v14 = a4;
    uint64_t v12 = self;
    id v13 = v8;
    char v11 = "-[AppleTVRemoteIRInterface enableButtonCombination:delay:error:]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  BOOL v9 = -[AppleTVRemoteIRInterface activateButtonCombination:delay:activationFlag:error:]( self,  "activateButtonCombination:delay:activationFlag:error:",  v8,  1LL,  a5,  a4,  v11,  v12,  v13,  *(void *)&v14,  v15);
  if (!v9
    && gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  return v9;
}

- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  id v8 = a3;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    uint64_t v15 = mach_absolute_time();
    double v14 = a4;
    uint64_t v12 = self;
    id v13 = v8;
    char v11 = "-[AppleTVRemoteIRInterface disableButtonCombination:delay:error:]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  BOOL v9 = -[AppleTVRemoteIRInterface activateButtonCombination:delay:activationFlag:error:]( self,  "activateButtonCombination:delay:activationFlag:error:",  v8,  0LL,  a5,  a4,  v11,  v12,  v13,  *(void *)&v14,  v15);
  if (!v9
    && gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  return v9;
}

- (BOOL)isTxInterface
{
  return 1;
}

- (BOOL)isRxInterface
{
  return 0;
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVRemoteIRInterface uniqueID](self, "uniqueID"));

  if (!v6)
  {
    if (a4)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870160LL,  0LL));
      id v7 = 0LL;
      *a4 = v8;
      return v7;
    }

- (unsigned)locationID
{
  return self->_locationID;
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
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

- (void).cxx_destruct
{
}

@end