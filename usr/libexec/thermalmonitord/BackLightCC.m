@interface BackLightCC
- (BOOL)findBacklightServices;
- (BOOL)shouldSuppressMitigations;
- (BOOL)solarBehaviorSuppressed;
- (BOOL)solarDetectorPresent;
- (BackLightCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)initBrightnessTable:(__CFArray *)a3;
- (void)initPowerTable:(__CFArray *)a3;
- (void)refreshFunctionalTelemetry;
- (void)setBrightnessKey:(id)a3 value:(int)a4;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setMaxLICeiling:(int)a3;
- (void)setMaxLICeilingSoft:(int)a3;
- (void)setSolarBehaviorSuppressed:(BOOL)a3;
- (void)setSolarDetectorPresent:(BOOL)a3;
@end

@implementation BackLightCC

- (BackLightCC)initWithParams:(__CFDictionary *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BackLightCC;
  v4 = -[ComponentControl initWithCC::](&v13, "initWithCC::", 0LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super.currentPower + 5) = 0;
    *((_BYTE *)&v4->super.currentPower + 6) = 0;
    v4->brightnessLevelDown[6] = 100;
    v4->brightnessLevelDown[5] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = -1;
    *(_DWORD *)&v4->brightnessLevelDown[7] = 100;
    v4->_maxLICeiling = 100;
    v4->_maxLICeilingSoft = -1;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d BackLight ", 0LL);
    v5->super.releaseMaxLI = 2;
    sub_100020FE0(a3, @"MaxReleaseRate", kCFNumberIntType, &v5->super.releaseMaxLI);
    if (!-[BackLightCC findBacklightServices](v5, "findBacklightServices")
      && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003D130();
    }

    v6 = objc_alloc_init(&OBJC_CLASS___BrightnessSystemClient);
    *(void *)&v5->currentPowerLevel = v6;
    if (v6)
    {
      if (byte_10007CB30)
      {
        v7 = v6;
        v8 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> brightness client %p", buf, 0xCu);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      sub_10003D104();
    }

    LOBYTE(v5->powerLevelDown[8]) = 0;
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (sub_100020F6C(a3, @"expectsCPMSSupport", 0LL))
    {
      Value = CFDictionaryGetValue(a3, @"BacklightPower");
      if (Value)
      {
        -[BackLightCC initPowerTable:](v5, "initPowerTable:", Value);
        -[BackLightCC setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1LL);
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003D0D8();
      }
    }

    v10 = CFDictionaryGetValue(a3, @"BacklightBrightness");
    if (v10) {
      -[BackLightCC initBrightnessTable:](v5, "initBrightnessTable:", v10);
    }
    LOBYTE(v5->_maxLICeilingSoftPrevious) = 0;
    *(_DWORD *)&v5->powerLevelElem = 0;
    if (LOBYTE(v5->super._minPower)) {
      int releaseRate = v5->super.releaseRate;
    }
    else {
      int releaseRate = 65000;
    }
    *(_DWORD *)&v5->powerLevelTableDefined = releaseRate;
  }

  return v5;
}

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_10007CB30)
  {
    v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = a3;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> BL set %@ to %d",  (uint8_t *)&v11,  0x12u);
    }
  }

  v8 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v4);
  if (v8)
  {
    v9 = v8;
    if (([*(id *)&self->currentPowerLevel setProperty:v8 forKey:a3] & 1) == 0)
    {
      v10 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003D15C((uint64_t)a3, v10);
      }
    }
  }

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v4 = *((unsigned __int8 *)&self->super.currentPower + 6);
  if (previousValue > *((unsigned __int8 *)&self->super.currentPower + v4 + 7))
  {
    if (!*((_BYTE *)&self->super.currentPower + 6)) {
      goto LABEL_8;
    }
    char v5 = -1;
    goto LABEL_7;
  }

  if (previousValue < self->brightnessLevels[v4 + 5]
    && *((unsigned __int8 *)&self->super.currentPower + 5) - 1 > (int)v4)
  {
    char v5 = 1;
LABEL_7:
    *((_BYTE *)&self->super.currentPower + 6) = v4 + v5;
  }

- (void)defaultCPMSAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v4 = *(unsigned int *)&self->powerLevelElem;
  if (previousValue <= *(&self->powerLevelPointer + v4))
  {
    if (previousValue >= self->powerLevels[v4 + 8]
      || v4 >= LOBYTE(self->_maxLICeilingSoftPrevious) - 1)
    {
      goto LABEL_8;
    }

    int v5 = 1;
  }

  else
  {
    if (!(_DWORD)v4) {
      goto LABEL_8;
    }
    int v5 = -1;
  }

  LODWORD(v4) = v4 + v5;
  *(_DWORD *)&self->powerLevelElem = v4;
LABEL_8:
  if (self->super.previousValue == 101) {
    unsigned int releaseRate = self->super.releaseRate;
  }
  else {
    unsigned int releaseRate = self->powerLevelUp[v4 + 8];
  }
  *(_DWORD *)&self->powerLevelTableDefined = releaseRate;
  unsigned int v7 = self->super.releaseRate;
  if (releaseRate > v7)
  {
    *(_DWORD *)&self->powerLevelTableDefined = v7;
    unsigned int releaseRate = v7;
  }

  if (releaseRate != -[ComponentControl powerTarget](self, "powerTarget"))
  {
    -[ComponentControl setPowerTarget:](self, "setPowerTarget:", *(unsigned int *)&self->powerLevelTableDefined);
    if (byte_10007CB30)
    {
      v8 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        v10 = -[PidComponent nameofComponent](self, "nameofComponent");
        __int16 v11 = 1024;
        unsigned int v12 = -[ComponentControl powerTarget](self, "powerTarget");
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> DefaultCPMSAction for %@, set powerTarget:%u",  (uint8_t *)&v9,  0x12u);
      }
    }

    -[CPMSHelper addToCPMSMitigationArray:forComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "addToCPMSMitigationArray:forComponent:",  -[ComponentControl powerTarget](self, "powerTarget"),  self->super.super.mitigationType);
  }

- (void)refreshFunctionalTelemetry
{
  if (BYTE5(self->_brightnessSystemClient)) {
    *((_BYTE *)&self->super.currentPower + 4) = -[ContextAwareThermalManager isContextTriggered:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "isContextTriggered:",  0LL);
  }
}

- (BOOL)shouldSuppressMitigations
{
  if (*((_BYTE *)&self->super.currentPower + 4)) {
    return !-[BackLightCC solarBehaviorSuppressed](self, "solarBehaviorSuppressed");
  }
  else {
    return 0;
  }
}

- (void)setMaxLICeiling:(int)a3
{
  *(_DWORD *)&self->brightnessLevelDown[7] = a3;
}

- (void)setMaxLICeilingSoft:(int)a3
{
  self->_uint64_t maxLICeiling = a3;
}

- (void)initBrightnessTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0LL;
    int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    *((_BYTE *)&self->super.currentPower + 5) = Count;
    if (Count)
    {
      unint64_t v7 = 0LL;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (int v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *((_BYTE *)&self->super.currentPower + v7 + 7) = valuePtr;
          }

          unsigned int v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->brightnessLevels[v7 + 5] = v17;
          }

          __int16 v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->brightnessLevelUp[v7 + 5] = BYTE4(v17);
          }
        }

        else
        {
          int v14 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "<Error> Missing Brightness Dictionary %d",  buf,  8u);
          }
        }

        ++v7;
      }

      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 5));
    }
  }

  else
  {
    for (uint64_t i = 0LL; i != 9; ++i)
    {
      self->brightnessLevelUp[i + 5] = 100;
      self->brightnessLevels[i + 5] = 100;
      *((_BYTE *)&self->super.currentPower + i + 7) = 100;
    }

    *((_BYTE *)&self->super.currentPower + 5) = 5;
  }

- (void)initPowerTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0LL;
    unsigned int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    LOBYTE(self->_maxLICeilingSoftPrevious) = Count;
    if (Count)
    {
      unint64_t v7 = 0LL;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (int v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *(&self->powerLevelPointer + v7) = valuePtr;
          }

          unsigned int v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->powerLevels[v7 + 8] = v17;
          }

          __int16 v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->powerLevelUp[v7 + 8] = HIDWORD(v17);
          }
        }

        else
        {
          int v14 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "<Error> Missing Display Power Dictionary %d",  buf,  8u);
          }
        }

        ++v7;
      }

      while (v7 < LOBYTE(self->_maxLICeilingSoftPrevious));
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003D1D0();
    }
    for (uint64_t i = 0LL; i != 9; ++i)
    {
      self->powerLevelUp[i + 8] = 65000;
      self->powerLevels[i + 8] = 100;
      *(unsigned int *)((char *)&self->powerLevelPointer + i * 4) = 100;
    }

    LOBYTE(self->_maxLICeilingSoftPrevious) = 5;
  }

  LOBYTE(self->powerLevelDown[8]) = 1;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  if (a3)
  {
    if (LOBYTE(self->powerLevelDown[8]))
    {
      *(void *)&a3 = 1LL;
    }

    else
    {
      uint64_t v4 = (os_log_s *)qword_10007CF50;
      BOOL v5 = os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT);
      *(void *)&a3 = 0LL;
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> No powerLevelTable defined, cannot enable CPMS Mitigations for backlightCC",  buf,  2u);
        *(void *)&a3 = 0LL;
      }
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BackLightCC;
  -[ComponentControl setCPMSMitigationState:](&v6, "setCPMSMitigationState:", a3);
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BackLightCC;
  return -[ComponentControl numberOfFields](&v3, "numberOfFields") + 3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BackLightCC;
  if (-[ComponentControl numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___BackLightCC;
    unsigned int v6 = v3 - -[ComponentControl numberOfFields](&v7, "numberOfFields");
    if (v6 > 2) {
      return 0LL;
    }
    else {
      return off_100061A10[v6];
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___BackLightCC;
    return -[ComponentControl copyHeaderForIndex:](&v8, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BackLightCC;
  if (-[ComponentControl numberOfFields](&v11, "numberOfFields") > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___BackLightCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v10, "copyFieldCurrentValueForIndex:", v3);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BackLightCC;
  int v6 = v3 - -[ComponentControl numberOfFields](&v9, "numberOfFields");
  if (v6 == 2)
  {
    objc_super v7 = kCFAllocatorDefault;
    uint64_t maxLICeiling = self->_maxLICeiling;
    return (__CFString *)CFStringCreateWithFormat(v7, 0LL, @"%d", maxLICeiling);
  }

  if (v6 == 1)
  {
    objc_super v7 = kCFAllocatorDefault;
    uint64_t maxLICeiling = self->brightnessLevelDown[5];
    return (__CFString *)CFStringCreateWithFormat(v7, 0LL, @"%d", maxLICeiling);
  }

  if (v6) {
    return 0LL;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  -[ContextAwareThermalManager getContextState:]( +[ContextAwareThermalManager sharedInstance]( &OBJC_CLASS___ContextAwareThermalManager,  "sharedInstance"),  "getContextState:",  0LL));
  }
}

- (BOOL)findBacklightServices
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D1FC();
  }
  return 0;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE4(self->_brightnessSystemClient);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE4(self->_brightnessSystemClient) = a3;
}

- (BOOL)solarDetectorPresent
{
  return BYTE5(self->_brightnessSystemClient);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  BYTE5(self->_brightnessSystemClient) = a3;
}

@end