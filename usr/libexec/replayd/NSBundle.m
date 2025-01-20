@interface NSBundle
+ (NSBundle)bundleWithPID:(int)a3;
+ (id)_rpFrameworkBundle;
+ (id)_rpLocalizedAppNameFromBundleID:(id)a3;
+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:(id)a3;
+ (id)baseIdentifier:(id)a3;
+ (id)executablePathWithPID:(int)a3;
+ (id)fallbackLanguage;
+ (id)preferredLanguage;
- (id)_rpLocalizedAppName;
@end

@implementation NSBundle

+ (id)_rpFrameworkBundle
{
  if (qword_100084778 != -1) {
    dispatch_once(&qword_100084778, &stru_100071908);
  }
  return (id)qword_100084770;
}

- (id)_rpLocalizedAppName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", _kCFBundleDisplayNameKey));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", kCFBundleNameKey))) != 0LL)
  {
    id v4 = v3;
    v5 = v4;
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", kCFBundleExecutableKey));
    v5 = 0LL;
  }

  return v4;
}

+ (id)_rpLocalizedAppNameFromBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", v3));
  id v5 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
    v8 = v7;
    if (v7
      && ([v7 isEqualToString:&stru_100073210] & 1) == 0
      && ![v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
    {
      goto LABEL_8;
    }
  }

  else
  {
    v8 = 0LL;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 _rpLocalizedAppName]);

  v8 = (void *)v9;
  if (!v9)
  {
LABEL_10:
    id v10 = v3;

    v8 = v10;
    goto LABEL_11;
  }

+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](&OBJC_CLASS___NSBundle, "_rpFrameworkBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 preferredLanguage]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v6]);

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 fallbackLanguage]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v8]);

    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v4 value:0 table:@"Localizable"]);
    }
  }

  return v7;
}

+ (id)fallbackLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"-"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v5;
}

+ (id)preferredLanguage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  id v4 = [(id)objc_opt_class(a1) _rpFrameworkBundle];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizations]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v6,  v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  return v8;
}

+ (id)baseIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  id v4 = [v3 mutableCopy];

  [v4 removeLastObject];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@"."]);

  return v5;
}

+ (id)executablePathWithPID:(int)a3
{
  return  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  proc_pidpath(a3, buffer, 0x1000u),  4LL);
}

+ (NSBundle)bundleWithPID:(int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle executablePathWithPID:](&OBJC_CLASS___NSBundle, "executablePathWithPID:", *(void *)&a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));

  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    uint64_t v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
    __int16 v10 = 1024;
    int v11 = 115;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d  executableURL:%@",  (uint8_t *)&v8,  0x1Cu);
  }

  if (v4)
  {
    id v5 = (void *)_CFBundleCopyBundleURLForExecutableURL(v4);
    if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446722;
      uint64_t v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
      __int16 v10 = 1024;
      int v11 = 119;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d  bundleURL:%@",  (uint8_t *)&v8,  0x1Cu);
    }

    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v5));
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return (NSBundle *)v6;
}

@end