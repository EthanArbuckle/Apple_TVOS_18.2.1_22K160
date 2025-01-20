@interface IapHIDDescriptor
- (BOOL)areOutReportsAvailable;
- (BOOL)handleInReport:(char *)a3 withLength:(unsigned int)a4;
- (BOOL)handleOutReport:(char *)a3 withLength:(int64_t)a4;
- (IapHIDDescriptor)init;
- (IapHIDDescriptor)initWithReportIndex:(unsigned __int8)a3 andVID:(unsigned __int16)a4 andPID:(unsigned __int16)a5 andCountryCode:(unsigned __int8)a6 andTransport:(void *)a7 andHIDDescriptor:(id)a8;
- (id)dequeueOutReport;
- (void)dealloc;
- (void)queueOutReport:(id)a3;
@end

@implementation IapHIDDescriptor

- (IapHIDDescriptor)init
{
  return 0LL;
}

- (IapHIDDescriptor)initWithReportIndex:(unsigned __int8)a3 andVID:(unsigned __int16)a4 andPID:(unsigned __int16)a5 andCountryCode:(unsigned __int8)a6 andTransport:(void *)a7 andHIDDescriptor:(id)a8
{
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___IapHIDDescriptor;
  result = -[IapHIDDescriptor init](&v41, "init");
  v15 = result;
  if (!result) {
    return v15;
  }
  if (!a7) {
    goto LABEL_7;
  }
  result->_transport = a7;
  unsigned int v16 = (*(uint64_t (**)(void *))(*(void *)a7 + 216LL))(a7);
  if (v16 <= 3) {
    v17 = *(&off_100101B18 + (int)v16);
  }
  else {
LABEL_7:
  }
    v17 = &stru_10010A828;
  v39 = v17;
  result = (IapHIDDescriptor *)sub_1000BE638();
  if (result && (result & 7) == 0)
  {
    result = (IapHIDDescriptor *)((uint64_t (*)(IapHIDDescriptor *, void *))result->super.isa[13].isa)( result,  a7);
    if (result)
    {
      v18 = (unsigned __int8 *)((uint64_t (*)(IapHIDDescriptor *))result->super.isa[13].isa)(result);
    }

    else
    {
      v18 = 0LL;
    }

    v19 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "ReportDescriptor");
    v20 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12);
    v37 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "VendorID");
    v21 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11);
    v36 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "ProductID");
    v22 = +[NSNumber numberWithChar:](&OBJC_CLASS___NSNumber, "numberWithChar:", (char)a6);
    v35 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "CountryCode");
    v23 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Transport");
    result = (IapHIDDescriptor *)&OBJC_CLASS___NSNumber;
    id v40 = a8;
    v38 = v19;
    v34 = v23;
    if (v18)
    {
      v33 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (v18[64] << 16) | (v18[65] << 8) | v18[66]);
      v32 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "VersionNumber");
      v24 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18 + 104);
      v25 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Manufacturer");
      v26 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18 + 168);
      v27 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Product");
      v28 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18 + 232);
    }

    else
    {
      v33 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL);
      v32 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "VersionNumber");
      v25 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Manufacturer");
      v27 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Product");
      v26 = &stru_10010A828;
      v24 = &stru_10010A828;
      v28 = &stru_10010A828;
    }

    v29 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v40,  v38,  v20,  v37,  v21,  v36,  v22,  v35,  @"iAP",  v34,  v33,  v32,  v24,  v25,  v26,  v27,  v28,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "SerialNumber"),  v39,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "LocationID"),  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Authenticated"),  0LL);
    result = objc_alloc_init(&OBJC_CLASS___NSLock);
    if ((((_BYTE)v15 + 32) & 7) == 0)
    {
      v15->_outReportsLock = (NSLock *)result;
      result = (IapHIDDescriptor *)IOHIDUserDeviceCreate(kCFAllocatorDefault, v29);
      if (((unint64_t)&v15->_deviceRef & 7) == 0)
      {
        v30 = result;
        v15->_deviceRef = (__IOHIDUserDevice *)result;
        if (result)
        {
          CFRunLoopRef Main = CFRunLoopGetMain();
          IOHIDUserDeviceScheduleWithRunLoop(v30, Main, kCFRunLoopDefaultMode);
          IOHIDUserDeviceRegisterSetReportCallback(v15->_deviceRef, sub_10000AB8C, v15);
          v15->_outReportsReadSinceLastEvent = 1;
          v15->_reportIndex = a3;
        }

        else
        {
          NSLog( @"ERROR - %s:%s - %d IOHIDUserDeviceCreate failed",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm",  "-[IapHIDDescriptor initWithReportIndex:andVID:andPID:andCountryCode:andTransport:andHIDDescriptor:]",  93LL);
          -[IapHIDDescriptor dealloc](v15, "dealloc");
          return 0LL;
        }

        return v15;
      }
    }
  }

- (void)dealloc
{
  p_deviceRef = (CFTypeRef *)&self->_deviceRef;
  CFTypeRef v4 = *p_deviceRef;
  if (*p_deviceRef)
  {
    CFRunLoopRef Main = CFRunLoopGetMain();
    IOHIDUserDeviceUnscheduleFromRunLoop(v4, Main, kCFRunLoopDefaultMode);
    CFRelease(*p_deviceRef);
    CFTypeRef *p_deviceRef = 0LL;
  }

  p_outReportsLock = &self->_outReportsLock;
  if (((unint64_t)&self->_outReportsLock & 7) != 0
    || (-[NSLock lock](self->_outReportsLock, "lock"),
        p_outReports = &self->_outReports,
        ((unint64_t)&self->_outReports & 7) != 0))
  {
LABEL_11:
    __break(0x5516u);
  }

  else
  {
    if (*p_outReports)
    {

      *p_outReports = 0LL;
    }

    -[NSLock unlock](*p_outReportsLock, "unlock");
    if (*p_outReportsLock)
    {

      *p_outReportsLock = 0LL;
    }

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___IapHIDDescriptor;
    -[IapHIDDescriptor dealloc](&v8, "dealloc");
  }

- (BOOL)handleInReport:(char *)a3 withLength:(unsigned int)a4
{
  if (((unint64_t)&self->_deviceRef & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    uint64_t v4 = IOHIDUserDeviceHandleReport(self->_deviceRef, a3, a4);
    int v5 = v4;
    if ((_DWORD)v4) {
      NSLog( @"ERROR - %s:%s - %d handling HID report failed 0x%x.",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm",  "-[IapHIDDescriptor handleInReport:withLength:]",  133LL,  v4);
    }
    LOBYTE(self) = v5 == 0;
  }

  return (char)self;
}

- (BOOL)handleOutReport:(char *)a3 withLength:(int64_t)a4
{
  if (a4 < 0)
  {
    NSLog( @"ERROR - %s:%s - %d HID report length is less than 0, not sending report",  a2,  a3,  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm",  "-[IapHIDDescriptor handleOutReport:withLength:]",  143LL);
  }

  else
  {
    int v5 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", a3, a4);
    -[IapHIDDescriptor queueOutReport:](self, "queueOutReport:", v5);
  }

  return 1;
}

- (BOOL)areOutReportsAvailable
{
  p_outReportsLock = &self->_outReportsLock;
  if (((unint64_t)&self->_outReportsLock & 7) != 0
    || (v3 = self,
        LOBYTE(self) = -[NSLock lock](self->_outReportsLock, "lock"),
        v3->_outReportsReadSinceLastEvent = 1,
        p_outReports = (id *)&v3->_outReports,
        ((unint64_t)&v3->_outReports & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    if (*p_outReports) {
      BOOL v5 = [*p_outReports count] != 0;
    }
    else {
      BOOL v5 = 0;
    }
    -[NSLock unlock](*p_outReportsLock, "unlock");
    LOBYTE(self) = v5;
  }

  return (char)self;
}

- (void)queueOutReport:(id)a3
{
  p_outReportsLock = &self->_outReportsLock;
  -[NSLock lock](self->_outReportsLock, "lock");
  unsigned int outReportsReadSinceLastEvent = self->_outReportsReadSinceLastEvent;
  if (outReportsReadSinceLastEvent >= 2)
  {
LABEL_13:
    __break(0x550Au);
    return;
  }

  self->_unsigned int outReportsReadSinceLastEvent = 0;
  p_outReports = &self->_outReports;
  if (((unint64_t)&self->_outReports & 7) != 0)
  {
LABEL_12:
    __break(0x5516u);
    goto LABEL_13;
  }

  objc_super v8 = *p_outReports;
  if (!*p_outReports)
  {
    objc_super v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id *p_outReports = v8;
  }

  -[NSMutableArray addObject:](v8, "addObject:", a3);
  -[NSLock unlock](*p_outReportsLock, "unlock");
  if (outReportsReadSinceLastEvent)
  {
    uint64_t v9 = sub_100025BE8();
    if (v9 && (v9 & 7) == 0 && (((_BYTE)self + 16) & 7) == 0)
    {
      sub_10002642C(v9, (uint64_t)self->_transport, self->_reportIndex);
      return;
    }

    goto LABEL_12;
  }

- (id)dequeueOutReport
{
  v2 = (id *)((char *)self + 32);
  if ((((unint64_t)self + 32) & 7) != 0
    || (v3 = (char *)self,
        self = [*((id *)self + 4) lock],
        v3[48] = 1,
        uint64_t v4 = (id *)(v3 + 40),
        ((unint64_t)(v3 + 40) & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    id v5 = [*v4 objectAtIndex:0];
    [*v4 removeObjectAtIndex:0];
    if (![*v4 count])
    {

      *uint64_t v4 = 0LL;
    }

    [*v2 unlock];
    return v5;
  }

  return self;
}

@end