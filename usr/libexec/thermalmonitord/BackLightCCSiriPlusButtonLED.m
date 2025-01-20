@interface BackLightCCSiriPlusButtonLED
- (BOOL)findBacklightServices;
- (BOOL)solarBehaviorSuppressed;
- (BOOL)solarDetectorPresent;
- (BackLightCCSiriPlusButtonLED)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)refreshFunctionalTelemetry;
- (void)setBrightnessKey:(id)a3 value:(int)a4;
- (void)setSolarBehaviorSuppressed:(BOOL)a3;
- (void)setSolarDetectorPresent:(BOOL)a3;
@end

@implementation BackLightCCSiriPlusButtonLED

- (BackLightCCSiriPlusButtonLED)initWithParams:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
  v3 = -[BackLightCC initWithParams:](&v6, "initWithParams:", a3);
  v4 = (BackLightCCSiriPlusButtonLED *)v3;
  if (v3)
  {
    *(_DWORD *)(v3 + 330) = -1;
    *(_DWORD *)(v3 + 338) = -1;
    *(_DWORD *)(v3 + 346) = 100;
    *(_DWORD *)(v3 + 334) = -1;
    *(_DWORD *)(v3 + 342) = -1;
    *(_DWORD *)(v3 + 350) = 100;
    [v3 setSolarBehaviorSuppressed:0];
  }

  return v4;
}

- (BOOL)findBacklightServices
{
  kern_return_t MatchingServices;
  BOOL v6;
  io_object_t v7;
  os_log_s *v8;
  int v9;
  unsigned int v10;
  io_object_t v11;
  io_iterator_t existing;
  uint8_t buf[4];
  int v15;
  void *v16;
  void *v17;
  void *values;
  void *keys;
  keys = @"backlight-control";
  values = kCFBooleanTrue;
  *(&self->super._solarDetectorPresent + 5) = 0;
  CFDictionaryRef v3 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v16 = v3;
  v17 = @"IOPropertyMatch";
  v4 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&v17,  (const void **)&v16,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(v3);
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  objc_super v6 = 0;
  if (!MatchingServices)
  {
    if (*((unsigned __int8 *)&self->super._solarDetectorPresent + 5) > 1u)
    {
      objc_super v6 = 0;
    }

    else
    {
      v7 = IOIteratorNext(existing);
      *(_DWORD *)((char *)&self->super._brightnessSystemClient
      objc_super v6 = v7 != 0;
      if (v7)
      {
        do
        {
          if (byte_10007CB30)
          {
            v8 = (os_log_s *)qword_10007CF50;
            if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *((unsigned __int8 *)&self->super._solarDetectorPresent + 5);
              *(_DWORD *)buf = 67109120;
              v15 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "<Notice> Found display no:%d",  buf,  8u);
            }
          }

          v10 = ++*(&self->super._solarDetectorPresent + 5);
          if (v10 >= 2) {
            break;
          }
          v11 = IOIteratorNext(existing);
          *(_DWORD *)((char *)&self->super._brightnessSystemClient
        }

        while (v11);
      }
    }

    IOObjectRelease(existing);
  }

  return v6;
}

- (void)refreshFunctionalTelemetry
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
  -[BackLightCC refreshFunctionalTelemetry](&v26, "refreshFunctionalTelemetry");
  if (*(&self->super._solarDetectorPresent + 5))
  {
    uint64_t v3 = 0LL;
    for (i = self; ; i = (BackLightCCSiriPlusButtonLED *)((char *)i + 4))
    {
      *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = 0;
      CFTypeRef v5 = sub_100020F34(@"IODisplayParameters", *(_DWORD *)((char *)&i->super._brightnessSystemClient + 6));
      objc_super v6 = v5;
      if (v5)
      {
        CFTypeID v7 = CFGetTypeID(v5);
        if (v7 == CFDictionaryGetTypeID()) {
          break;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_100038A28(&v14, v15);
        if (!v6) {
          goto LABEL_36;
        }
      }

      else if (!v6)
      {
        goto LABEL_36;
      }

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_10007CB30)
  {
    CFTypeID v7 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = a3;
      __int16 v30 = 1024;
      int v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "<Notice> BL set %@ to %d",  (uint8_t *)&v28,  0x12u);
    }
  }

  v8 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v4);
  v9 = objc_alloc(&OBJC_CLASS___NSNumber);
  else {
    uint64_t v10 = v4;
  }
  int v11 = -[NSNumber initWithInt:](v9, "initWithInt:", v10);
  int v12 = v11;
  if (v8) {
    BOOL v13 = v11 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ([*(id *)&self->super.currentPowerLevel setProperty:@"DisplayTypeSiri" forKey:@"DisplaySelect"])
    {
      if (([*(id *)&self->super.currentPowerLevel setProperty:v12 forKey:a3] & 1) == 0)
      {
        char v14 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038B58((uint64_t)a3, v14, v15, v16, v17, v18, v19, v20);
        }
      }
    }

    if ([*(id *)&self->super.currentPowerLevel setProperty:@"DisplayTypeIcon" forKey:@"DisplaySelect"])
    {
      if (([*(id *)&self->super.currentPowerLevel setProperty:v8 forKey:a3] & 1) == 0)
      {
        v21 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038AF0((uint64_t)a3, v21, v22, v23, v24, v25, v26, v27);
        }
      }
    }
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
  return -[BackLightCC numberOfFields](&v3, "numberOfFields") + 6;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
  if (-[BackLightCC numberOfFields](&v9, "numberOfFields") <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
    unsigned int v6 = v3 - -[BackLightCC numberOfFields](&v7, "numberOfFields");
    if (v6 > 5) {
      return 0LL;
    }
    else {
      return off_100060D10[v6];
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
    return -[BackLightCC copyHeaderForIndex:](&v8, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
  if (-[BackLightCC numberOfFields](&v13, "numberOfFields") <= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
    switch((_DWORD)v3 - -[BackLightCC numberOfFields](&v11, "numberOfFields"))
    {
      case 0:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v7 = 330LL;
        goto LABEL_7;
      case 1:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v7 = 338LL;
LABEL_7:
        int v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v7);
        goto LABEL_12;
      case 2:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v9 = *(unsigned int *)((char *)&self->_brightnessMilliNitsCurrent[1] + 2);
        goto LABEL_14;
      case 3:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v10 = 330LL;
        goto LABEL_11;
      case 4:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v10 = 338LL;
LABEL_11:
        int v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v10 + 4);
LABEL_12:
        uint64_t v9 = ((v8 + 500) / 1000);
        goto LABEL_14;
      case 5:
        unsigned int v6 = kCFAllocatorDefault;
        uint64_t v9 = *(unsigned int *)((char *)self->_brightnessMilliNitsMaximum + 2);
LABEL_14:
        result = (__CFString *)CFStringCreateWithFormat(v6, 0LL, @"%d", v9);
        break;
      default:
        result = 0LL;
        break;
    }
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___BackLightCCSiriPlusButtonLED;
    return -[BackLightCC copyFieldCurrentValueForIndex:](&v12, "copyFieldCurrentValueForIndex:", v3);
  }

  return result;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE2(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE2(self->_brightnessMilliNitsMaximum[1]) = a3;
}

- (BOOL)solarDetectorPresent
{
  return HIBYTE(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  HIBYTE(self->_brightnessMilliNitsMaximum[1]) = a3;
}

@end