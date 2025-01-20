@interface NSLocale(NSLocale_LanguageExtras)
+ (id)_preferredMeasurementSystem;
+ (id)_preferredTemperatureUnit;
+ (id)preferredLocale;
+ (uint64_t)__effectiveLanguageForBundle:()NSLocale_LanguageExtras;
+ (uint64_t)_deviceLanguage;
+ (uint64_t)_setPreferredMeasurementSystem:()NSLocale_LanguageExtras;
+ (uint64_t)_setPreferredTemperatureUnit:()NSLocale_LanguageExtras;
+ (uint64_t)mostPreferredLanguageOf:()NSLocale_LanguageExtras forUsage:options:;
+ (uint64_t)systemLanguages;
+ (void)mostPreferredLanguageOf:()NSLocale_LanguageExtras withPreferredLanguages:forUsage:options:;
+ (void)registerPreferredLanguage:()NSLocale_LanguageExtras usage:confidence:;
+ (void)setPreferredLanguages:()NSLocale_LanguageExtras;
@end

@implementation NSLocale(NSLocale_LanguageExtras)

+ (uint64_t)_deviceLanguage
{
  return objc_msgSend(MEMORY[0x189603F90], "__effectiveLanguageForBundle:", _NSFoundationBundle());
}

+ (uint64_t)__effectiveLanguageForBundle:()NSLocale_LanguageExtras
{
  v4 = (const __CFString *)*MEMORY[0x189605170];
  v5 = (const __CFString *)*MEMORY[0x189605178];
  v6 = (void *)CFPreferencesCopyValue( @"AppleLanguages",  (CFStringRef)*MEMORY[0x189605170],  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (![v6 count])
  {
    if (v6) {
      CFRelease(v6);
    }
    v6 = (void *)CFPreferencesCopyValue(@"AppleLanguages", v4, (CFStringRef)*MEMORY[0x189605180], v5);
  }

  id v7 = -[NSArray firstObject]( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  [a3 localizations],  v6),  "firstObject");
  uint64_t v8 = [MEMORY[0x189603F90] canonicalLanguageIdentifierFromString:v7];
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

+ (id)preferredLocale
{
  return (id)_CFLocaleCopyPreferred();
}

+ (uint64_t)systemLanguages
{
  return 0x189D1CDB8LL;
}

+ (void)setPreferredLanguages:()NSLocale_LanguageExtras
{
}

+ (void)registerPreferredLanguage:()NSLocale_LanguageExtras usage:confidence:
{
  uint64_t v7 = _NormalizedLanguageIDFromString(a4);
  if ((a5 & 3) != 0 && a1 > 0.5)
  {
    uint64_t v8 = v7;
    v9 = (void *)_CFLocaleCopyPreferredLanguagesForCurrentUser();
    if (v9)
    {
      v10 = v9;
      v11 = (void *)[v9 mutableCopy];
      if (([v11 containsObject:v8] & 1) == 0)
      {
        [v11 addObject:v8];
        _SetPreferredLanguages(v11);
      }

      CFRelease(v10);
    }
  }

+ (uint64_t)mostPreferredLanguageOf:()NSLocale_LanguageExtras forUsage:options:
{
  return objc_msgSend( a1,  "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:",  a3,  objc_msgSend(a1, "preferredLanguages"),  a4,  a5);
}

+ (void)mostPreferredLanguageOf:()NSLocale_LanguageExtras withPreferredLanguages:forUsage:options:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if ((a6 & 4) != 0)
  {
    v11 = (void *)objc_opt_new();
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(a3);
          }
          if (BaseLanguageIdentifierFromIdentifier) {
            [v11 addObject:BaseLanguageIdentifierFromIdentifier];
          }
        }

        uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }

      while (v13);
    }

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v17 = [a4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
LABEL_18:
      uint64_t v20 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(a4);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * v20);
        if ([v11 containsObject:GetBaseLanguageIdentifierFromIdentifier(v10)]) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [a4 countByEnumeratingWithState:&v23 objects:v22 count:16];
          if (v18) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
    }

    else
    {
LABEL_24:
      v10 = 0LL;
    }
  }

  else
  {
    id v8 = -[NSArray firstObject]( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  a3,  a4),  "firstObject");
    if (v8 && (v9 = v8, MatchesBaseLanguageInLanguageIDs(v8, a3)))
    {
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v10;
}

+ (uint64_t)_setPreferredMeasurementSystem:()NSLocale_LanguageExtras
{
  return _CFLocaleSetPreferredMeasurementSystem();
}

+ (id)_preferredMeasurementSystem
{
  return (id)_CFLocaleCopyPreferredMeasurementSystem();
}

+ (uint64_t)_setPreferredTemperatureUnit:()NSLocale_LanguageExtras
{
  return _CFLocaleSetPreferredTemperatureUnit();
}

+ (id)_preferredTemperatureUnit
{
  return (id)_CFLocaleCopyPreferredTemperatureUnit();
}

@end