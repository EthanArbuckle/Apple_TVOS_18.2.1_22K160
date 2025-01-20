@interface LinkChargerCC
- (BOOL)canSystemSleep;
- (BOOL)isCurrentlyCloaked;
- (BOOL)isOnCharger;
- (BOOL)updateCloakingState:(BOOL)a3;
- (LinkChargerCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
- (void)setChargerType:(int)a3;
@end

@implementation LinkChargerCC

- (LinkChargerCC)initWithParams:(__CFDictionary *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
  v4 = -[ComponentControl initWithCC::](&v11, "initWithCC::", 1LL, a3);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = v4->super.currentLoadingIndex;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d Link ", 1LL);
    unsigned int v6 = sub_100020E9C("IOPMPowerSource", @"BatteryInstalled", kCFBooleanTrue);
    *(&v5->super.currentPower + 1) = v6;
    if (!v6)
    {
      v7 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_1000397FC(v7);
      }
    }

    HIDWORD(v5->_remainingInitialNoCloakTime) = 100;
    if (a3)
    {
      sub_100020FE0(a3, @"cloakingInterval", kCFNumberDoubleType, (char *)&v5->_targetTimeCharging + 4);
      sub_100020FE0(a3, @"chargingInterval", kCFNumberDoubleType, (char *)&v5->_defaultTargetTimeCloaking + 4);
      sub_100020FE0( a3,  @"wirelessCloakingInterval",  kCFNumberDoubleType,  (char *)&v5->_defaultTargetTimeCharging + 4);
      sub_100020FE0( a3,  @"wirelessChargingInterval",  kCFNumberDoubleType,  (char *)&v5->_targetTimeWirelessMatCloaking + 4);
      sub_100020FE0( a3,  @"skipFirstChargeThreshold",  kCFNumberIntType,  (char *)&v5->_remainingInitialNoCloakTime + 4);
    }

    double v8 = *(double *)((char *)&v5->_targetTimeCharging + 4);
    if (v8 == 0.0) {
      double v8 = 60.0;
    }
    *(double *)(&v5->pmuPowerService + 1) = v8;
    double v9 = *(double *)((char *)&v5->_defaultTargetTimeCloaking + 4);
    if (v9 == 0.0) {
      double v9 = 240.0;
    }
    *(double *)((char *)&v5->_targetTimeCloaking + 4) = v9;
    *(double *)((char *)&v5->_targetTimeWirelessMatCharging + 4) = 0.0;
    *(double *)((char *)&v5->_remainingTimeInterval + 4) = *(double *)((char *)&v5->_targetTimeCloaking + 4);
    LOBYTE(v5->_chargerType) = 0;
    *(CFAbsoluteTime *)(&v5->_isOnCharger + 3) = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (void)defaultAction
{
  int chargerType_low = LOBYTE(self->_chargerType);
  double Current = CFAbsoluteTimeGetCurrent();
  int skipFirstChargeThreshold = self->_skipFirstChargeThreshold;
  double v6 = Current - *(double *)(&self->_isOnCharger + 3);
  BOOL v7 = skipFirstChargeThreshold == 50;
  if (skipFirstChargeThreshold == 50) {
    double v8 = &OBJC_IVAR___LinkChargerCC__targetTimeWirelessMatCloaking;
  }
  else {
    double v8 = &OBJC_IVAR___LinkChargerCC__defaultTargetTimeCloaking;
  }
  *(void *)(&self->pmuPowerService + 1) = *(Class *)((char *)&self->super.super.super.isa + *v8);
  if (v7) {
    double v9 = &OBJC_IVAR___LinkChargerCC__targetTimeWirelessMatCharging;
  }
  else {
    double v9 = &OBJC_IVAR___LinkChargerCC__defaultTargetTimeCharging;
  }
  *(void *)((char *)&self->_targetTimeCloaking + 4) = *(Class *)((char *)&self->super.super.super.isa + *v9);
  if (v6 <= 0.0)
  {
    objc_super v11 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136315394;
      v35 = "-[LinkChargerCC defaultAction]";
      __int16 v36 = 2048;
      *(double *)v37 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: Calculated elapsed time was negative: %f, don't update remaining time interval\n",  (uint8_t *)&v34,  0x16u);
    }
  }

  else
  {
    double v10 = *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4);
    if (v6 >= v10) {
      *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4) = 0.0;
    }
    else {
      *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4) = v10 - v6;
    }
  }

  *(double *)(&self->_isOnCharger + 3) = Current;
  BOOL v12 = LOBYTE(self->_chargerType) == 0;
  double v13 = *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4);
  BOOL v14 = chargerType_low != 0;
  if (LOBYTE(self->_chargerType))
  {
    int v15 = 156;
    if (v13 != 0.0) {
      goto LABEL_19;
    }
LABEL_18:
    *(void *)((char *)&self->_targetTimeWirelessMatCharging + 4) = *(Class *)((char *)&self->super.super.super.isa
                                                                              + v15);
    BOOL v14 = v12;
    goto LABEL_19;
  }

  if (v13 == 0.0)
  {
    int v15 = 148;
    if (self->super.previousValue < 0x64) {
      goto LABEL_18;
    }
  }

- (BOOL)updateCloakingState:(BOOL)a3
{
  kern_return_t v7;
  os_log_s *v8;
  os_log_s *v9;
  CFBooleanRef v11;
  void *keys;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  BOOL v16;
  __int16 v17;
  kern_return_t v18;
  BOOL v3 = a3;
  keys = @"EngageCloak";
  v5 = &kCFBooleanTrue;
  if (!a3) {
    v5 = &kCFBooleanFalse;
  }
  objc_super v11 = *v5;
  CFDictionaryRef v6 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&v11,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  BOOL v7 = IORegistryEntrySetCFProperties(*(&self->super.currentPower + 1), v6);
  if (v7)
  {
    double v8 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003983C(v7, v8);
      if (!v6) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  if (v6) {
LABEL_6:
  }
    CFRelease(v6);
LABEL_7:
  if (byte_10007CB30)
  {
    double v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v14 = "-[LinkChargerCC updateCloakingState:]";
      int v15 = 1024;
      double v16 = v3;
      int v17 = 1024;
      v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> %s: state %d, err 0x%08x",  buf,  0x18u);
    }
  }

  return v7 == 0;
}

- (void)refreshTGraphTelemetry
{
  *(_DWORD *)&self->super.allowLIOverride = self->super.currentLoadingIndex;
}

- (BOOL)isCurrentlyCloaked
{
  return self->_chargerType;
}

- (BOOL)isOnCharger
{
  return BYTE1(self->_chargerType);
}

- (BOOL)canSystemSleep
{
  double v3 = *(double *)((char *)&self->_targetTimeWirelessMatCharging + 4);
  BOOL v4 = v3 > 10.0 || v3 <= 0.0;
  if (byte_10007CB30)
  {
    v5 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int chargerType_low = LOBYTE(self->_chargerType);
      v8[0] = 67109632;
      v8[1] = v4;
      __int16 v9 = 2048;
      double v10 = v3;
      __int16 v11 = 1024;
      int v12 = chargerType_low;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> SystemSleepAllowed: %d, remainingInterval: %f, currentlyCloaked: %d",  (uint8_t *)v8,  0x18u);
    }
  }

  return v4;
}

- (void)setChargerType:(int)a3
{
  self->_int skipFirstChargeThreshold = a3;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 4;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
  if (-[ComponentControl numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
    unsigned int v6 = v3 - -[ComponentControl numberOfFields](&v7, "numberOfFields");
    if (v6 > 3) {
      return 0LL;
    }
    else {
      return *(&off_100061368 + (int)v6);
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
    return -[ComponentControl copyHeaderForIndex:](&v8, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
  if (-[ComponentControl numberOfFields](&v13, "numberOfFields") <= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
    switch((_DWORD)v3 - -[ComponentControl numberOfFields](&v11, "numberOfFields"))
    {
      case 0:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v7 = 220LL;
        goto LABEL_8;
      case 1:
        result = (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%f",  *(void *)((char *)&self->_targetTimeWirelessMatCharging + 4));
        break;
      case 2:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v7 = 221LL;
LABEL_8:
        BOOL v8 = *((_BYTE *)&self->super.super.super.isa + v7) == 0;
        uint64_t v9 = 100LL;
        if (v8) {
          uint64_t v9 = 0LL;
        }
        result = (__CFString *)CFStringCreateWithFormat(v6, 0LL, @"%d", v9);
        break;
      case 3:
        uint64_t v10 = sub_100021D08();
        result = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", v10);
        break;
      default:
        result = 0LL;
        break;
    }
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___LinkChargerCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v12, "copyFieldCurrentValueForIndex:", v3);
  }

  return result;
}

@end