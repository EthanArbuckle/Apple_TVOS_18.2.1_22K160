@interface FanCC
- (FanCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (int)setFanRPM:(unsigned int)a3;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation FanCC

- (FanCC)initWithParams:(__CFDictionary *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FanCC;
  v4 = -[ComponentControl initWithCC::](&v15, "initWithCC::", 8LL, a3);
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->fanRPM = 0;
    v4->previousFanRPM = 0;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    p_currentFanRPM = &v4->currentFanRPM;
    if ((sub_100020FE0(a3, @"minRPM", kCFNumberIntType, &v4->currentFanRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003B540();
    }

    p_minRPM = &v5->minRPM;
    if ((sub_100020FE0(a3, @"maxRPM", kCFNumberIntType, &v5->minRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003B514();
    }

    unsigned int v8 = *p_currentFanRPM;
    unsigned int v9 = *p_minRPM;
    if (*p_currentFanRPM > *p_minRPM)
    {
      v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "<Error> FanCC: maxRPM not greater than minRPM",  buf,  2u);
        unsigned int v9 = *p_minRPM;
        unsigned int v8 = *p_currentFanRPM;
      }
    }

    *(float *)&v5->maxRPM = (float)((v9 - v8) / 0x64);
    v5->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d Fan ", 8LL);
    v5->super.maxLoadingIndex = 101;
    v11 = IOServiceMatching("ApplePMPThermal");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
    if (!MatchingService && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B4E8();
    }
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&v5->scalingFactor)
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003B4BC();
    }

    IOObjectRelease(MatchingService);
    -[FanCC setFanRPM:](v5, "setFanRPM:", 0LL);
  }

  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  if (previousValue == 101)
  {
    *(&self->super.currentPower + 1) = 0;
  }

  else if (previousValue != self->super.maxLoadingIndex)
  {
    unsigned int currentFanRPM = self->currentFanRPM + (int)(float)(*(float *)&self->maxRPM * (float)(100 - previousValue));
    if ((currentFanRPM & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003B56C();
      }
      unsigned int currentFanRPM = 0;
    }

    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->currentFanRPM > currentFanRPM) {
      unsigned int currentFanRPM = self->currentFanRPM;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->minRPM < currentFanRPM) {
      unsigned int currentFanRPM = self->minRPM;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    dword_10007D4E8 = currentFanRPM;
  }

  self->super.maxLoadingIndex = self->super.previousValue;
  uint64_t v5 = *(&self->super.currentPower + 1);
  unsigned int fanRPM = self->fanRPM;
  if ((_DWORD)v5 != fanRPM)
  {
    if (byte_10007CB30)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109376;
        v8[1] = v5;
        __int16 v9 = 1024;
        unsigned int v10 = fanRPM;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> FanCC: cur RPM %u, prev RPM %u",  (uint8_t *)v8,  0xEu);
        uint64_t v5 = *(&self->super.currentPower + 1);
      }
    }

    -[FanCC setFanRPM:](self, "setFanRPM:", v5);
  }

- (int)setFanRPM:(unsigned int)a3
{
  kern_return_t v5;
  os_log_s *v7;
  int v8;
  uint64_t input;
  uint8_t buf[4];
  int v11;
  input = a3;
  uint64_t v5 = IOConnectCallScalarMethod(LODWORD(self->scalingFactor), 0, &input, 1u, 0LL, 0LL);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003B598();
    }
  }

  else
  {
    self->unsigned int fanRPM = a3;
    if (byte_10007CB30)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = *(&self->super.currentPower + 1);
        *(_DWORD *)buf = 67109120;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> FanCC: set fan RPM to %u", buf, 8u);
      }
    }
  }

  return v5;
}

- (void)refreshTGraphTelemetry
{
  self->previousFanRPM = *(&self->super.currentPower + 1);
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FanCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FanCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___FanCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      v7 = @"FanCC current RPM";
    }
    else {
      v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"FanCC target RPM";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___FanCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FanCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___FanCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FanCC;
  int v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 148LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%u",  *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }

  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 140LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%u",  *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }

  return 0LL;
}

@end