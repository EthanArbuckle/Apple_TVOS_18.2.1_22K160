@interface UEIRemoteIRInterface
+ (id)getPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4;
- (BOOL)activateButtonCombination:(id)a3 delay:(double)a4 activationFlag:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)isRxInterface;
- (BOOL)isTxInterface;
- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6;
- (BOOL)transmitCommand:(id)a3 pressDuration:(double)a4 error:(id *)a5;
- (BOOL)transmitFrame:(id)a3 error:(id *)a4;
- (NSString)className;
- (NSString)serialNumber;
- (NSString)transport;
- (NSString)uniqueID;
- (UEIRemoteIRInterface)init;
- (UEIRemoteIRInterface)initWithDeviceRef:(unsigned int)a3;
- (id)buttons;
- (id)description;
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

@implementation UEIRemoteIRInterface

+ (id)getPropertyFromService:(unsigned int)a3 withKey:(__CFString *)a4
{
  v4 = 0LL;
  if (a3 && a4) {
    v4 = (void *)IORegistryEntrySearchCFProperty(a3, "IOService", a4, kCFAllocatorDefault, 0);
  }
  return v4;
}

- (UEIRemoteIRInterface)init
{
  return 0LL;
}

- (UEIRemoteIRInterface)initWithDeviceRef:(unsigned int)a3
{
  if (!a3)
  {

    return 0LL;
  }

  uint64_t v3 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___UEIRemoteIRInterface;
  v4 = -[UEIRemoteIRInterface init](&v18, "init");
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
    v7 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  name,  4LL);
    className = v4->_className;
    v4->_className = v7;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"Transport"));
  transport = v4->_transport;
  v4->_transport = (NSString *)v9;

  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"SerialNumber"));
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v11;

  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"PhysicalDeviceUniqueID"));
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSString *)v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"ProductID"));
  v4->_productID = (unsigned __int16)[v15 intValue];
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"VendorID"));

  v4->_vendorID = (unsigned __int16)[v16 intValue];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v3,  @"LocationID"));

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
  v4.super_class = (Class)&OBJC_CLASS___UEIRemoteIRInterface;
  -[UEIRemoteIRInterface dealloc](&v4, "dealloc");
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[UEIRemoteIRInterface serialNumber](self, "serialNumber"));
  unsigned int v4 = -[UEIRemoteIRInterface productID](self, "productID");
  unsigned int v5 = -[UEIRemoteIRInterface vendorID](self, "vendorID");
  uint64_t v6 = -[UEIRemoteIRInterface locationID](self, "locationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UEIRemoteIRInterface uniqueID](self, "uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[serialNumber %@ PID 0x%x VID 0x%x locationID 0x%x uniqueID %@]",  v3,  v4,  v5,  v6,  v7));

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
      v10 = v15;
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

- (BOOL)isTxInterface
{
  return 1;
}

- (BOOL)isRxInterface
{
  return 0;
}

- (id)buttons
{
  id v2 = [[CoreIRButton alloc] initWithUsagePage:1 usageID:134];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v2));

  for (uint64_t i = 0LL; i != 68; ++i)
  {
    id v5 = [[CoreIRButton alloc] initWithUsagePage:12 usageID:dword_3ED0[i]];
    [v3 addObject:v5];
  }

  return v3;
}

- (unint64_t)maxStoredCommands
{
  return 3LL;
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  __int16 v7 = 21930;
  signed int v4 = -[UEIRemoteIRInterface setReportID:buffer:length:](self, "setReportID:buffer:length:", 128LL, &v7, 2LL);
  signed int v5 = v4;
  if (a3 && v4) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v4,  0LL));
  }
  return v5 == 0;
}

- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    uint64_t v26 = mach_absolute_time();
    double v25 = a5;
    id v23 = v10;
    id v24 = v11;
    v21 = "-[UEIRemoteIRInterface setCommand:forButtonCombination:delay:error:]";
    v22 = self;
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  if ((unint64_t)objc_msgSend(v11, "count", v21, v22, v23, v24, *(void *)&v25, v26) < 2)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);
    v27[0] = bswap32([v12 usagePage]) >> 16;
    v27[1] = bswap32([v12 usageID]) >> 16;
    if (v10)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 protocol]);
      unsigned __int8 v28 = [v13 protocolID];

      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 protocol]);
      unsigned __int8 v29 = [v14 options];

      unint64_t v30 = bswap64((unint64_t)[v10 payload]);
      v15 = self;
      uint64_t v16 = 1LL;
      uint64_t v17 = 14LL;
    }

    else
    {
      v15 = self;
      uint64_t v16 = 2LL;
      uint64_t v17 = 4LL;
    }

    signed int v18 = -[UEIRemoteIRInterface setReportID:buffer:length:](v15, "setReportID:buffer:length:", v16, v27, v17);
    BOOL v19 = v18 == 0;
    if (a6 && v18) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v18,  0LL));
    }
    if (a6
      && !v19
      && gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }
  }

  else
  {
    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    BOOL v19 = 0;
  }

  return v19;
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

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
  unsigned __int8 v10 = [v9 protocolID];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);
  unsigned __int8 v12 = [v11 options];

  v17[0] = vcvtmd_s64_f64((a4 + 0.05) / 0.1);
  v17[1] = v10;
  v17[2] = v12;
  unint64_t v18 = bswap64((unint64_t)[v8 payload]);
  signed int v13 = -[UEIRemoteIRInterface setReportID:buffer:length:](self, "setReportID:buffer:length:", 18LL, v17, 11LL);
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
  id v11 = v10;
  if (a4 < 0.0 || a4 > 25.5)
  {
    char v15 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
    }
  }

  else
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      char v15 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          unsigned __int8 v21 = 0;
          int v20 = 0;
          LOWORD(v20) = bswap32([v17 usagePage]) >> 16;
          HIWORD(v20) = bswap32([v17 usageID]) >> 16;
          unsigned __int8 v21 = a5;
          signed int v18 = -[UEIRemoteIRInterface setReportID:buffer:length:](self, "setReportID:buffer:length:", 3LL, &v20, 5LL);
          v15 &= v18 == 0;
          if (v18 && a6)
          {
            char v15 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v18,  0LL));
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v13);
    }

    else
    {
      char v15 = 1;
    }
  }

  return v15;
}

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  id v8 = a3;
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 50LL)))
  {
    uint64_t v15 = mach_absolute_time();
    double v14 = a4;
    id v12 = self;
    id v13 = v8;
    id v11 = "-[UEIRemoteIRInterface enableButtonCombination:delay:error:]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  BOOL v9 = -[UEIRemoteIRInterface activateButtonCombination:delay:activationFlag:error:]( self,  "activateButtonCombination:delay:activationFlag:error:",  v8,  1LL,  a5,  a4,  v11,  v12,  v13,  *(void *)&v14,  v15);
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
    id v12 = self;
    id v13 = v8;
    id v11 = "-[UEIRemoteIRInterface disableButtonCombination:delay:error:]";
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  BOOL v9 = -[UEIRemoteIRInterface activateButtonCombination:delay:activationFlag:error:]( self,  "activateButtonCombination:delay:activationFlag:error:",  v8,  0LL,  a5,  a4,  v11,  v12,  v13,  *(void *)&v14,  v15);
  if (!v9
    && gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
  {
    LogPrintF(&gLogCategory_CoreRCInterface);
  }

  return v9;
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