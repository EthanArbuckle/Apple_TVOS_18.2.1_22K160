@interface PLModelingUtilities
+ (BOOL)alsCurveHigherThanDefault;
+ (BOOL)carrierBuild;
+ (BOOL)internalBuild;
+ (BOOL)isARMMac;
+ (BOOL)isAppleTV;
+ (BOOL)isAppleVision;
+ (BOOL)isHeySiriAlwaysOn;
+ (BOOL)isHomePod;
+ (BOOL)isLowPowerModeSupported;
+ (BOOL)isMac;
+ (BOOL)isNarrowScreen;
+ (BOOL)isPercentageSupported;
+ (BOOL)isTVOS;
+ (BOOL)isWatch;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (BOOL)shouldShowBatteryGraphs;
+ (double)defaultBatteryEnergyCapacity;
+ (double)duetDiscretionaryBudget;
+ (double)getDefaultL0bThresholdForDeviceType;
+ (double)networkingEnergyWithBytes:(int)a3 withDuration:(double)a4;
+ (id)valueForMobileGestaltCapability:(id)a3;
@end

@implementation PLModelingUtilities

+ (double)duetDiscretionaryBudget
{
  if (+[PLModelingUtilities isiPhone](&OBJC_CLASS___PLModelingUtilities, "isiPhone")) {
    return 280.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    uint64_t v3 = 0x4064000000000000LL;
    return *(double *)&v3;
  }

  if ((MGIsDeviceOneOfType() & 1) != 0) {
    goto LABEL_6;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0)
  {
    uint64_t v3 = 0x4054000000000000LL;
    return *(double *)&v3;
  }

  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
LABEL_6:
    uint64_t v3 = 0x404E000000000000LL;
    return *(double *)&v3;
  }

  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 110.0;
  }
  double v2 = 135.0;
  if ((MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0)
  {
    LODWORD(v9) = -1509831889;
    if ((MGIsDeviceOneOfType() & 1) == 0)
    {
      double v2 = 210.0;
      if ((MGIsDeviceOneOfType() & 1) == 0 && (MGIsDeviceOneOfType() & 1) == 0)
      {
        double v5 = 0.05;
        if (+[PLModelingUtilities isiPad]( &OBJC_CLASS___PLModelingUtilities,  "isiPad",  0LL,  0LL,  0LL,  0LL,  0x55A822A174B2879DLL,  0x83A041CA364BB786LL,  v9))
        {
          double v6 = 0.01;
        }

        else
        {
          double v6 = 0.05;
        }

        BOOL v7 = +[PLModelingUtilities isWatch](&OBJC_CLASS___PLModelingUtilities, "isWatch");
        if (!+[PLModelingUtilities isMac](&OBJC_CLASS___PLModelingUtilities, "isMac") && !v7) {
          double v5 = v6;
        }
        +[PLModelingUtilities defaultBatteryEnergyCapacity]( &OBJC_CLASS___PLModelingUtilities,  "defaultBatteryEnergyCapacity");
        return v5 * v8;
      }
    }
  }

  return v2;
}

+ (id)valueForMobileGestaltCapability:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke;
  block[3] = &unk_189E9E750;
  id v9 = v3;
  uint64_t v4 = valueForMobileGestaltCapability__once;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&valueForMobileGestaltCapability__once, block);
  }
  id v6 = (id)valueForMobileGestaltCapability__gestaltValue;

  return v6;
}

void __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke()
{
  uint64_t v0 = MGCopyAnswerWithError();
  v1 = (void *)valueForMobileGestaltCapability__gestaltValue;
  valueForMobileGestaltCapability__gestaltValue = v0;
}

+ (BOOL)isiPad
{
  if (isiPad_once != -1) {
    dispatch_once(&isiPad_once, &__block_literal_global_1);
  }
  return isiPad_isiPad;
}

void __29__PLModelingUtilities_isiPad__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPad_isiPad = [v0 isEqualToString:@"iPad"];
}

+ (BOOL)isiPhone
{
  if (isiPhone_once != -1) {
    dispatch_once(&isiPhone_once, &__block_literal_global_23);
  }
  return isiPhone_isiPhone;
}

void __31__PLModelingUtilities_isiPhone__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPhone_isiPhone = [v0 isEqualToString:@"iPhone"];
}

+ (BOOL)isiPod
{
  if (isiPod_once != -1) {
    dispatch_once(&isiPod_once, &__block_literal_global_26_0);
  }
  return isiPod_isiPod;
}

void __29__PLModelingUtilities_isiPod__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isiPod_isiPod = [v0 isEqualToString:@"iPod"];
}

+ (BOOL)isWatch
{
  if (isWatch_once != -1) {
    dispatch_once(&isWatch_once, &__block_literal_global_29);
  }
  return isWatch_isWatch;
}

void __30__PLModelingUtilities_isWatch__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isWatch_isWatch = [v0 isEqualToString:@"Watch"];
}

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isARMMac
{
  return 0;
}

+ (BOOL)isTVOS
{
  return 1;
}

+ (BOOL)isHomePod
{
  if (isHomePod_onceToken != -1) {
    dispatch_once(&isHomePod_onceToken, &__block_literal_global_32);
  }
  return isHomePod___isAudioAccessory;
}

void __32__PLModelingUtilities_isHomePod__block_invoke()
{
  id v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];

  if (v1 == 7) {
    isHomePod___isAudioAccessory = 1;
  }
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_once != -1) {
    dispatch_once(&isAppleTV_once, &__block_literal_global_35);
  }
  return isAppleTV_isAppleTV;
}

void __32__PLModelingUtilities_isAppleTV__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  isAppleTV_isAppleTV = [v0 isEqualToString:@"AppleTV"];
}

+ (BOOL)isAppleVision
{
  return 0;
}

+ (BOOL)shouldShowBatteryGraphs
{
  return MGIsDeviceOneOfType() ^ 1;
}

+ (double)defaultBatteryEnergyCapacity
{
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 7449.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 11080.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 6176.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 10480.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 6484.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 11100.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 6870.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 5608.6;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 5427.2;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 5173.9;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 26700.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 38500.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 19120.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 23120.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 27900.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 31590.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 42500.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 31590.0;
  }
  double v3 = 28570.0;
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return v3;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 36210.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 28370.0;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 36636.0;
  }
  double v4 = 19020.0;
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return v4;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 29620.0;
  }
  char v5 = MGIsDeviceOneOfType();
  double result = 31590.0;
  if ((v5 & 1) == 0)
  {
    char v6 = MGIsDeviceOneOfType();
    double result = 28570.0;
    if ((v6 & 1) == 0)
    {
      double v3 = 28650.0;
      if ((MGIsDeviceOneOfType() & 1) != 0) {
        return v3;
      }
      if ((MGIsDeviceOneOfType() & 1) != 0)
      {
        return 28760.0;
      }

      else if ((MGIsDeviceOneOfType() & 1) != 0)
      {
        return 41160.0;
      }

      else
      {
        char v7 = MGIsDeviceOneOfType();
        double result = 28650.0;
        if ((v7 & 1) == 0)
        {
          char v8 = MGIsDeviceOneOfType();
          double result = 19020.0;
          if ((v8 & 1) == 0)
          {
            if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 28990.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 36730.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 3975.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 10030.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 12060.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11160.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11920.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 11750.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 15100.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 6960.0;
            }

            else if ((MGIsDeviceOneOfType() & 1) != 0)
            {
              return 8670.0;
            }

            else
            {
              double v4 = 10960.0;
              if ((MGIsDeviceOneOfType() & 1) != 0) {
                return v4;
              }
              char v9 = MGIsDeviceOneOfType();
              double result = 10960.0;
              if ((v9 & 1) == 0)
              {
                if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14620.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12129.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17024.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 9467.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12563.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 7909.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12823.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 16872.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12449.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17070.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 12872.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17305.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 13162.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 17181.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14052.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 18260.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 14006.0;
                }

                else if ((MGIsDeviceOneOfType() & 1) != 0)
                {
                  return 18089.0;
                }

                else
                {
                  BOOL v10 = +[PLModelingUtilities isiPad]( &OBJC_CLASS___PLModelingUtilities,  "isiPad",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
                  double result = 7000.0;
                  if (v10) {
                    return 19120.0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

+ (BOOL)internalBuild
{
  return internalBuild_result;
}

uint64_t __36__PLModelingUtilities_internalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  internalBuild_uint64_t result = result;
  return result;
}

+ (BOOL)carrierBuild
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__PLModelingUtilities_carrierBuild__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (carrierBuild_onceToken != -1) {
    dispatch_once(&carrierBuild_onceToken, block);
  }
  return carrierBuild_carrierBuild;
}

void __35__PLModelingUtilities_carrierBuild__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) internalBuild])
  {
    carrierBuild_carrierBuild = 0;
  }

  else
  {
    int v1 = (const __CFBoolean *)MGCopyAnswer();
    carrierBuild_carrierBuild = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }

+ (double)getDefaultL0bThresholdForDeviceType
{
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 110.4;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0) {
    return 132.25;
  }
  int v3 = MGIsDeviceOneOfType();
  double result = 115.0;
  if (v3) {
    return 155.25;
  }
  return result;
}

+ (BOOL)alsCurveHigherThanDefault
{
  double v3 = v2;
  double v4 = (void *)CFPreferencesCopyValue( @"BKALSUserPreferences",  @"com.apple.backboardd",  @"mobile",  (CFStringRef)*MEMORY[0x189605190]);
  char v5 = v4;
  if (v4)
  {
    [v4 objectForKeyedSubscript:@"L0b"];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      BOOL v9 = v8 > v3;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (double)networkingEnergyWithBytes:(int)a3 withDuration:(double)a4
{
  return 0.0;
}

+ (BOOL)isPercentageSupported
{
  return 1;
}

+ (BOOL)isLowPowerModeSupported
{
  if (isLowPowerModeSupported_onceToken != -1) {
    dispatch_once(&isLowPowerModeSupported_onceToken, &__block_literal_global_183);
  }
  return isLowPowerModeSupported__retValue;
}

void __46__PLModelingUtilities_isLowPowerModeSupported__block_invoke()
{
  id v0 = (const __CFString *)MGCopyAnswer();
  int v1 = v0;
  if (!v0) {
    isLowPowerModeSupported__retValue = 0;
  }
  isLowPowerModeSupported__retValue = CFStringCompare(v0, @"iPhone", 0LL) == kCFCompareEqualTo;
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[PLModelingUtilities isiPad](&OBJC_CLASS___PLModelingUtilities, "isiPad")
      || +[PLModelingUtilities isiPod](&OBJC_CLASS___PLModelingUtilities, "isiPod");
    isLowPowerModeSupported__retValue |= v2;
  }

  CFRelease(v1);
}

+ (BOOL)isNarrowScreen
{
  if (isNarrowScreen_onceToken != -1) {
    dispatch_once(&isNarrowScreen_onceToken, &__block_literal_global_188);
  }
  return isNarrowScreen__retValue;
}

uint64_t __37__PLModelingUtilities_isNarrowScreen__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  if ((_DWORD)result) {
    isNarrowScreen__retValue = 1;
  }
  return result;
}

+ (BOOL)isHeySiriAlwaysOn
{
  if (isHeySiriAlwaysOn_onceToken != -1) {
    dispatch_once(&isHeySiriAlwaysOn_onceToken, &__block_literal_global_197);
  }
  return isHeySiriAlwaysOn__retValue;
}

uint64_t __40__PLModelingUtilities_isHeySiriAlwaysOn__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isHeySiriAlwaysOn__retValue = result;
  return result;
}

@end