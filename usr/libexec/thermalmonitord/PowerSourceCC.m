@interface PowerSourceCC
- (PowerSourceCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)dealloc;
- (void)defaultAction;
- (void)getAdaptorPMUValue;
- (void)refreshTGraphTelemetry;
@end

@implementation PowerSourceCC

- (PowerSourceCC)initWithParams:(__CFDictionary *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
  v4 = -[ComponentControl initWithCC::](&v13, "initWithCC::", 1LL, a3);
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->chargeLevel = -1;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.maxLoadingIndex = 0;
    v4->previousChargeLevel = 1199570944;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d PwrSrc ", 1LL);
    unsigned int v6 = sub_100020E9C("IOPMPowerSource", @"BatteryInstalled", kCFBooleanTrue);
    LODWORD(v5->smcThermalChargeRate) = v6;
    if (!v6 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003ED74();
      if (!a3) {
        goto LABEL_11;
      }
    }

    else if (!a3)
    {
      goto LABEL_11;
    }

    if (CFDictionaryContainsKey(a3, @"ChargeLimitTable"))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a3, @"ChargeLimitTable");
      if (Value)
      {
        v8 = Value;
        *(void *)&v5->familyCode = (id)CFDictionaryGetValue(Value, @"maxLIs");
        *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)(id)CFDictionaryGetValue( v8,  @"chargeLimit");
        id v9 = [*(id *)&v5->familyCode count];
        if (v9 != [*(id *)((char *)&v5->maxLITable + 4) count]
          && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003ED48();
        }
      }

- (void)dealloc
{
  float smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0) {
    IOObjectRelease(LODWORD(smcThermalChargeRate));
  }

  *(void *)&self->familyCode = 0LL;
  *(NSArray **)((char *)&self->maxLITable + 4) = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
  -[PidComponent dealloc](&v4, "dealloc");
}

- (void)defaultAction
{
  kern_return_t v17;
  os_log_s *v18;
  _DWORD v19[2];
  if (LODWORD(self->smcThermalChargeRate))
  {
    if (self->super.previousValue != self->super.maxLoadingIndex)
    {
      v3 = (char *)[*(id *)&self->familyCode count];
      if (v3)
      {
        objc_super v4 = 0LL;
        v5 = v3 - 1;
        do
        {
          unsigned int v6 = objc_msgSend( objc_msgSend(*(id *)((char *)&self->maxLITable + 4), "objectAtIndex:", v4),  "intValue");
          unsigned int v7 = objc_msgSend(objc_msgSend(*(id *)&self->familyCode, "objectAtIndex:", v4), "intValue");
          unsigned int previousValue = self->super.previousValue;
          if (previousValue > v7) {
            break;
          }
          *(&self->super.currentPower + 1) = v6;
        }

        while (previousValue != v7 && v5 != v4++);
      }
    }

    self->super.maxLoadingIndex = self->super.previousValue;
    BOOL v10 = sub_100021808(LODWORD(self->smcThermalChargeRate), @"IsCharging");
    v11 = &self->super.currentPower + 1;
    int v12 = *(&self->super.currentPower + 1);
    if (v12 != self->chargeLevel && v10)
    {
      if (byte_10007CB30)
      {
        v14 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          v19[0] = 67109120;
          v19[1] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "<Notice> Setting chargeLimit to %d",  (uint8_t *)v19,  8u);
        }
      }

      CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, v11);
      if (v15)
      {
        CFNumberRef v16 = v15;
        v17 = IORegistryEntrySetCFProperty(LODWORD(self->smcThermalChargeRate), @"AppleChargeRateLimitIndex", v15);
        CFRelease(v16);
        if (v17)
        {
          if (((++dword_10007CAD4 & 0x1F) == 0 || byte_10007CB30)
            && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            sub_10003EE40();
          }
        }

        else
        {
          self->chargeLevel = *v11;
        }
      }

      else
      {
        v18 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_10003EDCC((int *)v11, v18);
        }
      }
    }
  }

  else if ((byte_10007CAD0 & 1) == 0)
  {
    byte_10007CAD0 = 1;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003EDA0();
    }
  }

- (void)getAdaptorPMUValue
{
  v3 = IOPSCopyExternalPowerAdapterDetails();
  if (v3)
  {
    objc_super v4 = v3;
    if (CFDictionaryContainsKey(v3, @"AdapterID"))
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"AdapterID");
      if (Value)
      {
        unsigned int v6 = Value;
        CFTypeID v7 = CFGetTypeID(Value);
        if (v7 == CFNumberGetTypeID()) {
          CFNumberGetValue(v6, kCFNumberShortType, (char *)&self->pmuPowerService + 2);
        }
      }
    }

    if (CFDictionaryContainsKey(v4, @"Watts"))
    {
      v8 = (const __CFNumber *)CFDictionaryGetValue(v4, @"Watts");
      if (v8)
      {
        id v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFNumberGetTypeID()) {
          CFNumberGetValue(v9, kCFNumberIntType, &self->inputCurrent);
        }
      }
    }

    if (CFDictionaryContainsKey(v4, @"FamilyCode"))
    {
      v11 = (const __CFNumber *)CFDictionaryGetValue(v4, @"FamilyCode");
      if (v11)
      {
        int v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 == CFNumberGetTypeID()) {
          CFNumberGetValue(v12, kCFNumberIntType, &self->watts);
        }
      }
    }

    if (CFDictionaryContainsKey(v4, @"Current"))
    {
      v14 = (const __CFNumber *)CFDictionaryGetValue(v4, @"Current");
      if (v14)
      {
        CFNumberRef v15 = v14;
        CFTypeID v16 = CFGetTypeID(v14);
        if (v16 == CFNumberGetTypeID()) {
          CFNumberGetValue(v15, kCFNumberShortType, &self->pmuPowerService);
        }
      }
    }

    if (CFDictionaryContainsKey(v4, @"PMUConfiguration"))
    {
      v17 = (const __CFNumber *)CFDictionaryGetValue(v4, @"PMUConfiguration");
      if (v17)
      {
        v18 = v17;
        CFTypeID v19 = CFGetTypeID(v17);
        if (v19 == CFNumberGetTypeID()) {
          CFNumberGetValue(v18, kCFNumberShortType, &self->availableCurrent);
        }
      }
    }

    CFRelease(v4);
  }

- (void)refreshTGraphTelemetry
{
  float smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0)
  {
    if (sub_100021808(LODWORD(smcThermalChargeRate), @"IsCharging")) {
      unsigned int previousValue = self->super.previousValue;
    }
    else {
      unsigned int previousValue = sub_100021808(LODWORD(self->smcThermalChargeRate), @"ExternalConnected");
    }
    *(_DWORD *)&self->super.allowLIOverride = previousValue;
    self->previousChargeLevel = -[SensorDispatcherHelper getValueFromSMCForKey:]( +[SensorDispatcherHelper sharedInstance]( &OBJC_CLASS___SensorDispatcherHelper,  "sharedInstance"),  "getValueFromSMCForKey:",  @"B1TI");
  }

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
    unsigned int v6 = -[ComponentControl numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      CFTypeID v7 = @"B1TI - Charge rate thermal";
    }
    else {
      CFTypeID v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"PwrSrc - Charge limit index";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
  if (-[ComponentControl numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
    int v6 = v3 - -[ComponentControl numberOfFields](&v7, "numberOfFields");
    if (v6 == 1)
    {
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%f",  *(float *)&self->previousChargeLevel);
    }

    else if (v6)
    {
      return 0LL;
    }

    else
    {
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  *(&self->super.currentPower + 1));
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PowerSourceCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v8, "copyFieldCurrentValueForIndex:", v3);
  }

@end