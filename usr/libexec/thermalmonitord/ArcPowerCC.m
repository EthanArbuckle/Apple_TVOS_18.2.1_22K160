@interface ArcPowerCC
- (ArcPowerCC)initWithParams:(__CFDictionary *)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)updatePowerTarget;
@end

@implementation ArcPowerCC

- (ArcPowerCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
  v6 = -[ComponentControl initWithCC::](&v18, "initWithCC::", 11LL, 0LL);
  v7 = (ArcPowerCC *)v6;
  if (v6)
  {
    *(void *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 42) = -1;
    *((void *)v6 + 6) = CFStringCreateWithFormat(0LL, 0LL, @"%d Arc ", 11LL);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    int v8 = sub_100020FE0(a3, @"thresholdModule", kCFNumberIntType, (char *)&v7->_product + 4);
    p_latestModuleTemperature = &v7->_latestModuleTemperature;
    int v10 = sub_100020FE0(a3, @"maxArcPower", kCFNumberIntType, &v7->_latestModuleTemperature);
    int v11 = sub_100020FE0(a3, @"minArcPower", kCFNumberIntType, &v7->_maxArcPower);
    if (v8 && v10 && v11)
    {
      if (byte_10007CB30)
      {
        v12 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int product_high = HIDWORD(v7->_product);
          int v14 = *p_latestModuleTemperature;
          int maxArcPower = v7->_maxArcPower;
          *(_DWORD *)buf = 67109632;
          int v20 = product_high;
          __int16 v21 = 1024;
          int v22 = v14;
          __int16 v23 = 1024;
          int v24 = maxArcPower;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "<Notice> ArcPowerCC ModuleThreshold: %d, MaxPower: %d, MinPower: %d",  buf,  0x14u);
        }
      }

      v7->_minArcPower = *p_latestModuleTemperature;
    }

    else
    {
      v16 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A4D0(v16);
      }
    }

    -[ComponentControl updatePowerParameters:](v7, "updatePowerParameters:", a3);
    if (sub_100020F6C(a3, @"expectsCPMSSupport", 0LL)) {
      -[ComponentControl setCPMSMitigationState:](v7, "setCPMSMitigationState:", 1LL);
    }
  }

  return v7;
}

- (void)defaultAction
{
  self->_thresholdModuleTemperature = [*(id *)(&self->super.currentPower + 1) arcModuleTemperature];
  -[ArcPowerCC updatePowerTarget](self, "updatePowerTarget");
}

- (void)updatePowerTarget
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (self->super.maxLoadingIndex == currentLoadingIndex)
  {
    int minArcPower = self->_minArcPower;
  }

  else
  {
    self->super.maxLoadingIndex = currentLoadingIndex;
    if (self->_thresholdModuleTemperature <= SHIDWORD(self->_product))
    {
      int minArcPower = self->_latestModuleTemperature;
    }

    else
    {
      int latestModuleTemperature = self->_latestModuleTemperature;
      int minArcPower = latestModuleTemperature * self->super.currentLoadingIndex / 0x64;
      if (minArcPower >= latestModuleTemperature) {
        int minArcPower = self->_latestModuleTemperature;
      }
      if (minArcPower <= self->_maxArcPower) {
        int minArcPower = self->_maxArcPower;
      }
    }
  }

  if (minArcPower != self->_minArcPower) {
    self->_int minArcPower = minArcPower;
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      v7 = @"ArcCC current power";
    }
    else {
      v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"ArcCC target power";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ArcPowerCC;
  int v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 168LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%d",  *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }

  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 164LL;
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%d",  *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }

  return 0LL;
}

@end