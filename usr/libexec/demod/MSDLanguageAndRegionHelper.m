@interface MSDLanguageAndRegionHelper
+ (id)sharedInstance;
- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4;
- (id)_systemLocalizedLanguageCodeFromArray:(id)a3;
- (id)getCurrentDeviceLanguage;
- (id)getCurrentDevicePreferredLanguage;
- (id)getCurrentDeviceRegion;
- (id)getCurrentLocaleCode;
- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4;
@end

@implementation MSDLanguageAndRegionHelper

+ (id)sharedInstance
{
  if (qword_100125530 != -1) {
    dispatch_once(&qword_100125530, &stru_1000FA758);
  }
  return (id)qword_100125528;
}

- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:]( self,  "_systemLocalizedLanguageCodeFromArray:",  v8));

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543874;
    id v17 = v6;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting device language to %{public}@ (%{public}@) and region code to %{public}@.",  (uint8_t *)&v16,  0x20u);
  }

  if (-[MSDLanguageAndRegionHelper _isCurrentDeviceLanguage:andRegion:]( self,  "_isCurrentDeviceLanguage:andRegion:",  v9,  v7))
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      id v17 = v6;
      __int16 v18 = 2114;
      v19 = v9;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Device already has language %{public}@ (%{public}@) and region %{public}@",  (uint8_t *)&v16,  0x20u);
    }

    int v14 = 2;
  }

  else
  {
    +[IPSettingsUtilities setRegion:](&OBJC_CLASS___IPSettingsUtilities, "setRegion:", v7);
    +[IPSettingsUtilities setLanguage:](&OBJC_CLASS___IPSettingsUtilities, "setLanguage:", v9);
    int v14 = 0;
  }

  return v14;
}

- (id)getCurrentDeviceLanguage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:]( self,  "_systemLocalizedLanguageCodeFromArray:",  v3));

  return v4;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);

  return v3;
}

- (id)getCurrentLocaleCode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDLanguageAndRegionHelper getCurrentDevicePreferredLanguage]( self,  "getCurrentDevicePreferredLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v3, v4));

  return v5;
}

- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage"));
  unsigned int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_systemLocalizedLanguageCodeFromArray:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLanguages](&OBJC_CLASS___NSLocale, "systemLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v4,  v3));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  return v6;
}

@end