@interface LifetimeServoController
- (BOOL)getFastDieEngagementStatus;
- (LifetimeServoController)init;
- (LifetimeServoController)initWithParams:(id)a3 sensorList:(__CFArray *)a4;
- (__CFDictionary)newChannelForDriver:(const char *)a3 channelID:(unint64_t)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)initPerfStateVoltages:(const char *)a3 propertyName:(__CFString *)a4 voltages:(int *)a5 maxVoltageCount:(int)a6;
- (int)initPerfStateVoltagesCPU;
- (int)initPerfStateVoltagesGPU;
- (int)numberOfFields;
- (int)writeToDriverService:(unsigned int)a3 key:(__CFString *)a4 value:(int64_t)a5;
- (void)initPerfStateReportingCPU;
- (void)initPerfStateReportingGPU;
- (void)initSensorList:(__CFArray *)a3;
- (void)overrideInstantaneousAF:(id)a3 value:(float)a4;
- (void)overrideParam:(id)a3 value:(int)a4;
- (void)updateCoreAnalyticsInfo;
- (void)updateForTempMax:(int)a3 tempAverage:(int)a4;
- (void)updatePerfStateReportingCPU;
- (void)updatePerfStateReportingGPU;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation LifetimeServoController

- (LifetimeServoController)init
{
  return -[LifetimeServoController initWithParams:sensorList:](self, "initWithParams:sensorList:", 0LL, 0LL);
}

- (LifetimeServoController)initWithParams:(id)a3 sensorList:(__CFArray *)a4
{
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___LifetimeServoController;
  v6 = -[LifetimeServoController init](&v58, "init");
  v7 = v6;
  if (!v6) {
    return (LifetimeServoController *)v7;
  }
  *(void *)(v6 + 372) = 0LL;
  *((_DWORD *)v6 + 91) = -1;
  *((_DWORD *)v6 + 92) = -1;
  -[TGraphSampler addtGraphDataSource:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "addtGraphDataSource:",  v6);
  v7[398] = sub_100020F6C((const __CFDictionary *)a3, @"useRestoreSafePartition", 0LL);
  BOOL v8 = sub_100020F6C((const __CFDictionary *)a3, @"updateCPUFastDieTargetPMP", 0LL);
  v7[397] = v8;
  if (v8) {
    v9 = "ApplePMP";
  }
  else {
    v9 = "AppleDieTempController";
  }
  v10 = IOServiceMatching(v9);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v10);
  *((_DWORD *)v7 + 2) = MatchingService;
  if (!MatchingService && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003E810();
  }
  BOOL v12 = sub_100020F6C((const __CFDictionary *)a3, @"updateGPUFastDieTarget", 0LL);
  v7[396] = v12;
  if (v12)
  {
    v13 = IOServiceMatching(off_100074A90);
    io_service_t v14 = IOServiceGetMatchingService(kIOMainPortDefault, v13);
    *((_DWORD *)v7 + 3) = v14;
    if (!v14 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003E7E4();
    }
  }

  time_t v15 = time(0LL);
  *((void *)v7 + 50) = v15;
  if (v15 == -1 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003E7B8();
  }
  *((_DWORD *)v7 + 4) = 0;
  v16 = (int *)(v7 + 16);
  id v55 = a3;
  if (sub_100020FE0((CFDictionaryRef)a3, @"variant", kCFNumberIntType, v7 + 16))
  {
    if (!byte_10007CB30) {
      goto LABEL_23;
    }
    uint64_t v17 = qword_10007CF50;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v18 = *v16;
    *(_DWORD *)buf = 67109120;
    int v60 = v18;
    v19 = "<Notice> LSController: variant %d";
    v20 = (os_log_s *)v17;
    uint32_t v21 = 8;
  }

  else
  {
    if (!byte_10007CB30) {
      goto LABEL_23;
    }
    uint64_t v22 = qword_10007CF50;
    if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v19 = "<Notice> LSController: variant classic";
    v20 = (os_log_s *)v22;
    uint32_t v21 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:
  [v7 initPerfStateReportingCPU];
  uint64_t v23 = 0LL;
  *((_DWORD *)v7 + 50) = [v7 initPerfStateVoltagesCPU];
  v54 = v7 + 72;
  int v24 = byte_10007CB30;
  do
  {
    if (v24)
    {
      v25 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = *(_DWORD *)&v7[4 * v23 + 72];
        *(_DWORD *)buf = 67109376;
        int v60 = v23;
        __int16 v61 = 1024;
        int v62 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController: CPU[%d] %d",  buf,  0xEu);
        int v24 = byte_10007CB30;
      }
    }

    ++v23;
  }

  while (v23 != 16);
  v27 = @"com.apple.cltm";
  if (v7[398])
  {
    if (&_lookupPathForPersistentData)
    {
      bzero(buf, 0x400uLL);
      lookupPathForPersistentData(104LL, buf, 1024LL);
      v28 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      v29 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", buf);
      uint64_t v57 = 0LL;
      if (-[NSFileManager fileExistsAtPath:isDirectory:](v28, "fileExistsAtPath:isDirectory:", v29, 0LL)
        || -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v28,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v29,  1LL,  0LL,  &v57))
      {
        v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%@",  buf,  @"com.apple.cltm");
        goto LABEL_33;
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003E760();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003E78C();
    }

    return 0LL;
  }

- (__CFDictionary)newChannelForDriver:(const char *)a3 channelID:(unint64_t)a4
{
  CFMutableDictionaryRef v5 = IOServiceMatching(a3);
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    v7 = (__CFDictionary *)IOReportCopyChannelsWithID(v5, a4, 0LL);
    CFRelease(v6);
    return v7;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003E83C();
    }
    return 0LL;
  }

- (void)initPerfStateReportingCPU
{
  self->_subscribedChannelsCPU = 0LL;
  p_subscribedChannelsCPU = &self->_subscribedChannelsCPU;
  self->_subscriptionCPU = 0LL;
  self->_lastReadingCPU = 0LL;
  if (self->_controllerVariant == 2) {
    uint64_t v4 = 0x43505620564F4C54LL;
  }
  else {
    uint64_t v4 = 0x43505520564F4C54LL;
  }
  CFMutableDictionaryRef v5 = -[LifetimeServoController newChannelForDriver:channelID:]( self,  "newChannelForDriver:channelID:",  "ApplePMGR",  v4);
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0LL, v5, p_subscribedChannelsCPU, 0LL, 0LL);
    self->_subscriptionCPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingCPU = (__CFDictionary *)IOReportCreateSamples(Subscription, self->_subscribedChannelsCPU, 0LL);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003E8D4();
    }

    CFRelease(v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E8A8();
  }

- (void)initPerfStateReportingGPU
{
  self->_subscribedChannelsGPU = 0LL;
  p_subscribedChannelsGPU = &self->_subscribedChannelsGPU;
  self->_subscriptionGPU = 0LL;
  self->_lastReadingGPU = 0LL;
  uint64_t v4 = -[LifetimeServoController newChannelForDriver:channelID:]( self,  "newChannelForDriver:channelID:",  off_100074A90,  0x4750555048LL);
  if (v4)
  {
    CFMutableDictionaryRef v5 = v4;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription(0LL, v4, p_subscribedChannelsGPU, 0LL, 0LL);
    self->_subscriptionGPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingGPU = (__CFDictionary *)IOReportCreateSamples(Subscription, self->_subscribedChannelsGPU, 0LL);
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003E92C();
    }

    CFRelease(v5);
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003E900();
  }

- (int)initPerfStateVoltagesCPU
{
  if (self->_controllerVariant == 2) {
    v2 = @"voltage-states5";
  }
  else {
    v2 = @"voltage-states1";
  }
  return -[LifetimeServoController initPerfStateVoltages:propertyName:voltages:maxVoltageCount:]( self,  "initPerfStateVoltages:propertyName:voltages:maxVoltageCount:",  ":/arm-io/pmgr",  v2,  self->_perfStateVoltagesCPU,  16LL);
}

- (int)initPerfStateVoltagesGPU
{
  return -[LifetimeServoController initPerfStateVoltages:propertyName:voltages:maxVoltageCount:]( self,  "initPerfStateVoltages:propertyName:voltages:maxVoltageCount:",  ":/arm-io/sgx",  @"perf-states",  self->_perfStateVoltagesGPU,  16LL);
}

- (int)initPerfStateVoltages:(const char *)a3 propertyName:(__CFString *)a4 voltages:(int *)a5 maxVoltageCount:(int)a6
{
  int v9 = snprintf(__str, 0x200uLL, "%s%s", "IODeviceTree", a3);
  if (v9 <= 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003E958();
    }
    return 0;
  }

  if (v9 >= 0x200)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003E9B8();
    }
    return 0;
  }

  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EA18();
    }
    return 0;
  }

  io_object_t v11 = v10;
  BOOL v12 = (const __CFData *)sub_100020F34(a4, v10);
  if (v12)
  {
    v13 = v12;
    BytePtr = CFDataGetBytePtr(v12);
    int Length = CFDataGetLength(v13);
    int v16 = Length + 7;
    if (Length >= 0) {
      int v16 = Length;
    }
    if (v16 >> 3 <= a6)
    {
      a6 = v16 >> 3;
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003EAD8();
    }

    if (a6 >= 1)
    {
      uint64_t v17 = a6;
      int v18 = (int *)(BytePtr + 4);
      do
      {
        int v20 = *v18;
        v18 += 2;
        int v19 = v20;
        if (v20) {
          *a5 = v19;
        }
        ++a5;
        --v17;
      }

      while (v17);
    }

    CFRelease(v13);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EA78();
    }
    a6 = 0;
  }

  IOObjectRelease(v11);
  return a6;
}

- (void)initSensorList:(__CFArray *)a3
{
  if (self->_controllerVariant)
  {
    uint64_t v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    int v20 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    int v19 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v5 = 0LL;
      CFArrayRef theArray = a3;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v5);
        Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"lsSensorType");
        if (Value)
        {
          BOOL v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            CFIndex v9 = 0LL;
            do
            {
              io_registry_entry_t v10 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v10, @"coreTypeE", 0LL) == kCFCompareEqualTo)
              {
                -[NSMutableArray addObject:]( v4,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
                io_object_t v11 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor coreTypeE index %d",  buf,  8u);
                }
              }

              BOOL v12 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v12, @"coreTypeP", 0LL) == kCFCompareEqualTo)
              {
                -[NSMutableArray addObject:]( v20,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
                v13 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor coreTypeP index %d",  buf,  8u);
                }
              }

              io_service_t v14 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFStringCompare(v14, @"coreTypeG", 0LL) == kCFCompareEqualTo)
              {
                -[NSMutableArray addObject:]( v19,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
                time_t v15 = (os_log_s *)qword_10007CF50;
                if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor coreTypeG index %d",  buf,  8u);
                }
              }

              ++v9;
            }

            while (CFArrayGetCount(v8) > v9);
          }
        }

        ++v5;
        a3 = theArray;
      }

      while (CFArrayGetCount(theArray) > v5);
    }

    if (-[NSMutableArray count](v4, "count", self))
    {
      objc_msgSend(v17[3], "initSensorIndexSet:", -[NSMutableArray copy](v4, "copy"));
    }

    if (-[NSMutableArray count](v20, "count"))
    {
      objc_msgSend(v17[4], "initSensorIndexSet:", -[NSMutableArray copy](v20, "copy"));
    }

    if (-[NSMutableArray count](v19, "count"))
    {
      objc_msgSend(v17[5], "initSensorIndexSet:", -[NSMutableArray copy](v19, "copy"));
    }
  }

- (int)writeToDriverService:(unsigned int)a3 key:(__CFString *)a4 value:(int64_t)a5
{
  kern_return_t v9;
  int64_t valuePtr;
  valuePtr = a5;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EB38();
    }
    return 5;
  }

  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EB64();
    }
    return 5;
  }

  CFNumberRef v8 = v7;
  CFIndex v9 = IORegistryEntrySetCFProperty(a3, a4, v7);
  if (v9 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003EB90();
  }
  CFRelease(v8);
  return v9;
}

- (void)updateForTempMax:(int)a3 tempAverage:(int)a4
{
  LODWORD(v4) = a4;
  -[LifetimeServoController updatePerfStateReportingCPU](self, "updatePerfStateReportingCPU");
  if (self->_gCoreLoop) {
    -[LifetimeServoController updatePerfStateReportingGPU](self, "updatePerfStateReportingGPU");
  }
  unsigned int override_tempMax = self->_override_tempMax;
  if (override_tempMax == -1) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = override_tempMax;
  }
  unsigned int override_tempAverage = self->_override_tempAverage;
  if (override_tempAverage == -1) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = override_tempAverage;
  }
  int controllerVariant = self->_controllerVariant;
  switch(controllerVariant)
  {
    case 2:
      uint64_t v13 = -[LifetimeServoControlLoop updateTempMax:](self->_pCoreLoop, "updateTempMax:", v8);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_pCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  self->_perfStateFractionCPU,  self->_perfStateCountCPU,  v13,  v4);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_gCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  self->_perfStateFractionGPU,  self->_perfStateCountGPU,  -[LifetimeServoControlLoop updateTempMax:](self->_gCoreLoop, "updateTempMax:", v13),  v4);
      signed int v14 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      goto LABEL_15;
    case 1:
      uint64_t v15 = -[LifetimeServoControlLoop updateTempMax:](self->_eCoreLoop, "updateTempMax:", v8);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_eCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  self->_perfStateFractionCPU,  3LL,  v15,  v4);
      uint64_t v16 = -[LifetimeServoControlLoop updateTempMax:](self->_pCoreLoop, "updateTempMax:", v15);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_pCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  &self->_perfStateFractionCPU[3],  (self->_perfStateCountCPU - 3),  v16,  v4);
      -[LifetimeServoControlLoop updateForPerfStateResidency:count:tempMax:tempAverage:]( self->_gCoreLoop,  "updateForPerfStateResidency:count:tempMax:tempAverage:",  self->_perfStateFractionGPU,  self->_perfStateCountGPU,  -[LifetimeServoControlLoop updateTempMax:](self->_gCoreLoop, "updateTempMax:", v16),  v4);
      self->_dieTempTargetCPU = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
      signed int v14 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
      if (v14 >= self->_dieTempTargetCPU)
      {
LABEL_16:
        unsigned int v11 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
        goto LABEL_18;
      }

- (void)updatePerfStateReportingCPU
{
  subscriptionCPU = self->_subscriptionCPU;
  if (subscriptionCPU)
  {
    subscribedChannelsCPU = self->_subscribedChannelsCPU;
    if (subscribedChannelsCPU)
    {
      *(_OWORD *)&self->_perfStateFractionCPU[12] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[4] = 0u;
      *(_OWORD *)self->_perfStateFractionCPU = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples(subscriptionCPU, subscribedChannelsCPU, 0LL);
      SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->_lastReadingCPU, Samples, 0LL);
      CFRelease(self->_lastReadingCPU);
      self->_lastReadingCPU = Samples;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10002F3D8;
      v7[3] = &unk_100061AB0;
      v7[4] = self;
      IOReportIterate(SamplesDelta, v7);
      CFRelease(SamplesDelta);
    }
  }

- (void)updatePerfStateReportingGPU
{
  subscriptionGPU = self->_subscriptionGPU;
  if (subscriptionGPU)
  {
    subscribedChannelsGPU = self->_subscribedChannelsGPU;
    if (subscribedChannelsGPU)
    {
      *(_OWORD *)&self->_perfStateFractionGPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[12] = 0u;
      *(_OWORD *)self->_perfStateFractionGPU = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[4] = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples(subscriptionGPU, subscribedChannelsGPU, 0LL);
      SamplesDelta = (const void *)IOReportCreateSamplesDelta(self->_lastReadingGPU, Samples, 0LL);
      CFRelease(self->_lastReadingGPU);
      self->_lastReadingGPU = Samples;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10002F648;
      v7[3] = &unk_100061AB0;
      v7[4] = self;
      IOReportIterate(SamplesDelta, v7);
      CFRelease(SamplesDelta);
    }
  }

- (void)overrideInstantaneousAF:(id)a3 value:(float)a4
{
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_E"])
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_7:
    *(float *)&double v7 = a4;
    -[LifetimeServoControlLoop overrideInstantaneousAF:](eCoreLoop, "overrideInstantaneousAF:", v7);
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_P"])
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_7;
  }

  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_G"])
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D84C();
  }
}

- (void)overrideParam:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_10007CB30)
  {
    double v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = a3;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> LSController: setting %@ to %d",  (uint8_t *)&v10,  0x12u);
    }
  }

  if ([a3 isEqualToString:@"LifetimeServoDieTempMaxMax"])
  {
    self->_unsigned int override_tempMax = v4;
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoDieTempMaxAverage"])
  {
    self->_unsigned int override_tempAverage = v4;
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoDieTempTarget"])
  {
    self->_int override_dieTempTarget = v4;
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_E"])
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_20:
    -[LifetimeServoControlLoop overrideIS:](eCoreLoop, "overrideIS:", v4);
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_E"])
  {
    pCoreLoop = self->_eCoreLoop;
LABEL_23:
    -[LifetimeServoControlLoop overrideAFi:](pCoreLoop, "overrideAFi:", v4);
    return;
  }

  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_P"])
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_20;
  }

  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_P"])
  {
    pCoreLoop = self->_pCoreLoop;
    goto LABEL_23;
  }

  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_G"])
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_20;
  }

  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_G"])
  {
    pCoreLoop = self->_gCoreLoop;
    goto LABEL_23;
  }

  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D84C();
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
  if (a3)
  {
    if (self->_lastSleepEntry == -1)
    {
      if (byte_10007CB30)
      {
        uint64_t v9 = qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          int v10 = "<Notice> LSController: last update time unavailable";
          id v11 = (os_log_s *)v9;
          uint32_t v12 = 2;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
        }
      }
    }

    else
    {
      time_t v4 = time(0LL);
      if (v4 == -1)
      {
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003ECC4();
        }
      }

      else
      {
        time_t v5 = v4;
        int64_t lastSleepEntry = self->_lastSleepEntry;
        time_t v7 = v4 - lastSleepEntry;
        if (v4 < lastSleepEntry)
        {
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003ECF0();
          }
          return;
        }

        -[LifetimeServoControlLoop processSleepInterval:](self->_pCoreLoop, "processSleepInterval:", v7);
        -[LifetimeServoControlLoop processSleepInterval:](self->_gCoreLoop, "processSleepInterval:", v7);
        -[LifetimeServoControlLoop processSleepInterval:](self->_eCoreLoop, "processSleepInterval:", v7);
        if (byte_10007CB30)
        {
          uint64_t v13 = qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v14 = self->_lastSleepEntry;
            int v15 = 134218496;
            int64_t v16 = v14;
            __int16 v17 = 2048;
            time_t v18 = v5;
            __int16 v19 = 2048;
            time_t v20 = v7;
            int v10 = "<Notice> LSController: lastSleepEntry %ld, now %ld, delta %ld";
            id v11 = (os_log_s *)v13;
            uint32_t v12 = 32;
            goto LABEL_18;
          }
        }
      }
    }
  }

  else
  {
    time_t v8 = time(0LL);
    self->_int64_t lastSleepEntry = v8;
    if (v8 == -1 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003ED1C();
    }
  }

- (BOOL)getFastDieEngagementStatus
{
  return -[PowerZoneTelemetry isFastDieEngaged]( +[PowerZoneTelemetry sharedInstance](&OBJC_CLASS___PowerZoneTelemetry, "sharedInstance"),  "isFastDieEngaged");
}

- (void)updateCoreAnalyticsInfo
{
  unsigned __int8 v3 = -[LifetimeServoController getFastDieEngagementStatus](self, "getFastDieEngagementStatus");
  unsigned int v4 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
  int v5 = v4 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_eCoreLoop, "defaultDieTempTarget");
  if (v5 >= 0) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = -v5;
  }
  unsigned int v7 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
  int v8 = v7 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_pCoreLoop, "defaultDieTempTarget");
  if (v8 >= 0) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = -v8;
  }
  unsigned int v10 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
  int v11 = v10 - -[LifetimeServoControlLoop defaultDieTempTarget](self->_gCoreLoop, "defaultDieTempTarget");
  if (v11 >= 0) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = -v11;
  }
  signed int v13 = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget") - self->_previousECoreDieTempTarget;
  if (v13 >= 0) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = -v13;
  }
  signed int v15 = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget") - self->_previousPCoreDieTempTarget;
  if (v15 >= 0) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = -v15;
  }
  signed int v17 = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget") - self->_previousGCoreDieTempTarget;
  if (v17 < 0) {
    signed int v17 = -v17;
  }
  if ((v14 > 1 || v16 > 1 || v17 >= 2)
    && (v6 / 0xC8 != dword_10007CAC4 || v9 / 0xC8 != dword_10007CAC8 || v12 / 0xC8 != dword_10007CACC))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10002FEC4;
    v20[3] = &unk_100061AD8;
    v20[4] = self;
    unsigned int v21 = v6;
    unsigned int v22 = v9;
    unsigned int v23 = v12;
    unsigned __int8 v24 = v3;
    AnalyticsSendEventLazy(@"com.apple.lifetimeservo", v20);
    self->_previousECoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_eCoreLoop, "dieTempTarget");
    self->_previousPCoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_pCoreLoop, "dieTempTarget");
    self->_previousGCoreDieTempTarget = -[LifetimeServoControlLoop dieTempTarget](self->_gCoreLoop, "dieTempTarget");
    dword_10007CAC4 = v6 / 0xC8;
    dword_10007CAC8 = v9 / 0xC8;
    dword_10007CACC = v12 / 0xC8;
  }

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  unsigned __int8 v3 = @"LS-target-GPU";
  if (a3 != 1) {
    unsigned __int8 v3 = 0LL;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"LS-target-CPU";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (!a3)
  {
    uint64_t v3 = 372LL;
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  *(unsigned int *)((char *)&self->super.isa + v3));
  }

  if (a3 == 1)
  {
    uint64_t v3 = 376LL;
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  *(unsigned int *)((char *)&self->super.isa + v3));
  }

  return 0LL;
}

@end