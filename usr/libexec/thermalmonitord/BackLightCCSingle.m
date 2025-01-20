@interface BackLightCCSingle
- (BOOL)findBacklightServices;
- (BackLightCCSingle)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)refreshFunctionalTelemetry;
- (void)updateSensorExchangeTelemetry;
@end

@implementation BackLightCCSingle

- (BackLightCCSingle)initWithParams:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  v3 = -[BackLightCC initWithParams:](&v6, "initWithParams:", a3);
  v4 = (BackLightCCSingle *)v3;
  if (v3)
  {
    *((_DWORD *)v3 + 18) = 100;
    *(_DWORD *)(v3 + 322) = -1;
    *(_DWORD *)(v3 + 326) = -1;
    [v3 setSolarBehaviorSuppressed:0];
    if (byte_10007D470)
    {
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  5LL,  @"zETM",  5LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  4LL,  @"zETM",  4LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  9LL,  @"zETM",  9LL);
      -[SensorExchangeHelper registerCLTMSensorIndex:forSMCKey:atSMCIndex:]( +[SensorExchangeHelper sharedInstance](&OBJC_CLASS___SensorExchangeHelper, "sharedInstance"),  "registerCLTMSensorIndex:forSMCKey:atSMCIndex:",  16LL,  @"zETM",  16LL);
    }
  }

  return v4;
}

- (BOOL)findBacklightServices
{
  unsigned int v3 = sub_100020E9C("AppleARMBacklight", @"backlight-control", kCFBooleanTrue);
  *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6) = v3;
  if (!v3 && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003D130();
  }
  return v3 != 0;
}

- (void)refreshFunctionalTelemetry
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  -[BackLightCC refreshFunctionalTelemetry](&v14, "refreshFunctionalTelemetry");
  *(_DWORD *)&self->super.super.allowLIOverride = 0;
  unsigned int v3 = (const __CFDictionary *)sub_100020F34( @"IODisplayParameters",  *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6));
  v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"brightness");
      v7 = CFDictionaryGetValue(v4, @"BrightnessMilliNits");
      if (Value && (CFTypeID v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
      {
        if (sub_100020FE0(Value, @"value", kCFNumberIntType, &v13)
          && sub_100020FE0(Value, @"max", kCFNumberIntType, &v12))
        {
          int v9 = v12;
          if (v12)
          {
            if (v12 >= 0) {
              int v10 = v12;
            }
            else {
              int v10 = v12 + 1;
            }
            int v9 = (100 * v13 + (v10 >> 1)) / v12;
          }

          *(_DWORD *)&self->super.super.allowLIOverride = v9;
          if (!v7) {
            goto LABEL_31;
          }
LABEL_22:
          CFTypeID v11 = CFGetTypeID(v7);
          if (v11 == CFDictionaryGetTypeID())
          {
            if (!sub_100020FE0( (CFDictionaryRef)v7,  @"value",  kCFNumberIntType,  &self->super._solarDetectorPresent + 1)
              || (sub_100020FE0( (CFDictionaryRef)v7,  @"max",  kCFNumberIntType,  &self->super._solarDetectorPresent + 5) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
                sub_10003D280();
              }
              *(_DWORD *)(&self->super._solarDetectorPresent + 1) = -1;
              *(_DWORD *)(&self->super._solarDetectorPresent + 5) = -1;
            }

            goto LABEL_33;
          }

          goto LABEL_31;
        }

        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
        {
          sub_10003D2D8();
          if (v7) {
            goto LABEL_22;
          }
LABEL_31:
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
            sub_10003D254();
          }
          goto LABEL_33;
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
      {
        sub_10003D2AC();
        if (v7) {
          goto LABEL_22;
        }
        goto LABEL_31;
      }

      if (v7) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }

  if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    if (!v4) {
      return;
    }
LABEL_33:
    CFRelease(v4);
    return;
  }

  sub_10003D228();
  if (v4) {
    goto LABEL_33;
  }
}

- (void)updateSensorExchangeTelemetry
{
  uint64_t v2 = 274877907LL * (*(_DWORD *)(&self->super._solarDetectorPresent + 5) + 500);
  *(float *)&dword_10007D180 = (float)(int)((v2 >> 38) + ((unint64_t)v2 >> 63));
  *(float *)&dword_10007D194 = (float)*(unsigned int *)&self->super.super.allowLIOverride;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  return -[BackLightCC numberOfFields](&v3, "numberOfFields") + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  if (-[BackLightCC numberOfFields](&v10, "numberOfFields") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
    unsigned int v6 = -[BackLightCC numberOfFields](&v8, "numberOfFields");
    if ((_DWORD)v3 - v6 == 1) {
      v7 = @"Backlight - nits maximum";
    }
    else {
      v7 = 0LL;
    }
    if ((_DWORD)v3 == v6) {
      return @"Backlight - nits current";
    }
    else {
      return v7;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
    return -[BackLightCC copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  if (-[BackLightCC numberOfFields](&v12, "numberOfFields") > a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
    return -[BackLightCC copyFieldCurrentValueForIndex:](&v11, "copyFieldCurrentValueForIndex:", v3);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BackLightCCSingle;
  int v6 = v3 - -[BackLightCC numberOfFields](&v10, "numberOfFields");
  if (v6 == 1)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 326LL;
    goto LABEL_7;
  }

  if (!v6)
  {
    v7 = kCFAllocatorDefault;
    uint64_t v8 = 322LL;
LABEL_7:
    uint64_t v9 = 274877907LL * (*(_DWORD *)((char *)&self->super.super.super.super.isa + v8) + 500);
    return (__CFString *)CFStringCreateWithFormat( v7,  0LL,  @"%d",  (v9 >> 38) + ((unint64_t)v9 >> 63));
  }

  return 0LL;
}

@end