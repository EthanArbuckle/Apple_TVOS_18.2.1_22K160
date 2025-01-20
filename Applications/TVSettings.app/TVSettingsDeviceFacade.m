@interface TVSettingsDeviceFacade
+ (BOOL)automaticallyNotifiesObserversOfCurrentLocale;
+ (id)sharedInstance;
- (BOOL)iCloudPhotoLibraryEnabled;
- (BOOL)iCloudSharedPhotosEnabled;
- (BOOL)isAutomaticTimeZoneSelectionEnabled;
- (BOOL)isNameModificationAllowed;
- (BOOL)isSendAppAnalyticsLockedDown;
- (BOOL)isSendDataToAppleLockedDown;
- (BOOL)isSleepDisabledByProfile;
- (BOOL)myPhotoStreamEnabled;
- (BOOL)shouldAllowAppOTA;
- (BOOL)shouldSendAppAnalytics;
- (BOOL)shouldSendDataToApple;
- (BOOL)supportsEnhancedAPFS;
- (BOOL)updateSoftwareAutomatically;
- (BOOL)use24HourTime;
- (NSArray)availableLocales;
- (NSArray)availableNames;
- (NSString)HDMIFirmwareVersion;
- (NSString)currentLocale;
- (NSString)marketingNumber;
- (NSString)modelDescription;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)systemLanguage;
- (NSString)systemSoftwareVersion;
- (NSString)threadID;
- (NSString)timeZoneCityID;
- (NSString)timeZoneCityName;
- (TVSettingsDeviceFacade)init;
- (double)sleepTimeout;
- (id)cityNameForCityID:(id)a3;
- (id)internetConfigurationSummary;
- (int64_t)preferredKeyboardType;
- (void)_updateAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)_updateCurrentLocale;
- (void)_updateLocaleForces24HourTime;
- (void)_updateSleepTimeoutValue;
- (void)setAutomaticTimeZoneSelectionEnabled:(BOOL)a3;
- (void)setAvailableNames:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setICloudPhotoLibraryEnabled:(BOOL)a3;
- (void)setICloudSharedPhotosEnabled:(BOOL)a3;
- (void)setMyPhotoStreamEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPreferredKeyboardType:(int64_t)a3;
- (void)setShouldSendAppAnalytics:(BOOL)a3;
- (void)setShouldSendDataToApple:(BOOL)a3;
- (void)setSleepTimeout:(double)a3;
- (void)setSystemLanguage:(id)a3;
- (void)setTimeZoneCityID:(id)a3;
- (void)setTimeZoneCityName:(id)a3;
- (void)setUpdateSoftwareAutomatically:(BOOL)a3;
- (void)setUse24HourTime:(BOOL)a3;
@end

@implementation TVSettingsDeviceFacade

+ (id)sharedInstance
{
  if (qword_1001E1648 != -1) {
    dispatch_once(&qword_1001E1648, &stru_10018FC78);
  }
  return (id)qword_1001E1640;
}

- (TVSettingsDeviceFacade)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsDeviceFacade;
  v2 = -[TVSettingsDeviceFacade init](&v15, "init");
  if (v2)
  {
    int out_token = 0;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    objc_initWeak(&location, v2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10002FDE0;
    handler[3] = &unk_10018E540;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("SignificantTimeChangeNotification", &out_token, v4, handler);
    -[TVSettingsDeviceFacade _updateSleepTimeoutValue](v2, "_updateSleepTimeoutValue");
    -[TVSettingsDeviceFacade _updateCurrentLocale](v2, "_updateCurrentLocale");
    -[TVSettingsDeviceFacade _updateLocaleForces24HourTime](v2, "_updateLocaleForces24HourTime");
    -[TVSettingsDeviceFacade _updateAutomaticTimeZoneEnabled:](v2, "_updateAutomaticTimeZoneEnabled:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_updateCurrentLocale" name:NSCurrentLocaleDidChangeNotification object:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_updateLocaleForces24HourTime" name:NSCurrentLocaleDidChangeNotification object:0];

    v16 = @"UserAssignedDeviceName";
    v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL);
    v8 = &_dispatch_main_q;
    MGRegisterForUpdates(v7, 0LL, &_dispatch_main_q, &stru_10018FCE0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10002FF1C,  TMLocationTimeZoneActiveNotification,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

+ (BOOL)automaticallyNotifiesObserversOfCurrentLocale
{
  return 0;
}

- (NSString)name
{
  return (NSString *)(id)MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
}

- (void)setName:(id)a3
{
}

- (BOOL)isNameModificationAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isDeviceNameModificationAllowed];

  return v3;
}

- (NSString)modelDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice modelNumber](&OBJC_CLASS___TVSDevice, "modelNumber"));
  if (v2)
  {
    id v3 = +[TVSDevice deviceCapacity](&OBJC_CLASS___TVSDevice, "deviceCapacity");
    uint64_t v4 = TSKLocString(@"AboutModelDescriptionFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v2, v3));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSString *)v6;
}

- (NSString)marketingNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice marketingPartNumber](&OBJC_CLASS___TVSDevice, "marketingPartNumber"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice regionInfo](&OBJC_CLASS___TVSDevice, "regionInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v2, v3));

  return (NSString *)v4;
}

- (NSString)serialNumber
{
  return (NSString *)+[TVSDevice serialNumber](&OBJC_CLASS___TVSDevice, "serialNumber");
}

- (NSString)systemSoftwareVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemVersion](&OBJC_CLASS___TVSDevice, "systemVersion"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
  if (OTAImplementationType() == 2) {
    uint64_t v4 = @"%@ [%@]";
  }
  else {
    uint64_t v4 = @"%@ (%@)";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v2, v3));

  return (NSString *)v5;
}

- (NSString)HDMIFirmwareVersion
{
  return (NSString *)+[TVSDevice HDMIFirmwareVersion](&OBJC_CLASS___TVSDevice, "HDMIFirmwareVersion");
}

- (id)internetConfigurationSummary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSNetworkInterface preferredInterface](&OBJC_CLASS___TVSNetworkInterface, "preferredInterface"));
  else {
    id v3 = @"Manual";
  }
  uint64_t v4 = TSKLocString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (NSString)threadID
{
  return (NSString *)MGGetStringAnswer(@"ThreadRadioMacAddress64Bit", a2);
}

- (BOOL)isSendDataToAppleLockedDown
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isBoolSettingLockedDownByRestrictions:MCFeatureDiagnosticsSubmissionAllowed];

  return v3;
}

- (BOOL)shouldSendDataToApple
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureDiagnosticsSubmissionAllowed] == 1;

  return v3;
}

- (void)setShouldSendDataToApple:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 setBoolValue:v3 forSetting:MCFeatureDiagnosticsSubmissionAllowed];
}

- (BOOL)isSendAppAnalyticsLockedDown
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isBoolSettingLockedDownByRestrictions:MCFeatureAppAnalyticsAllowed];

  return v3;
}

- (BOOL)shouldSendAppAnalytics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppAnalyticsAllowed] == 1;

  return v3;
}

- (void)setShouldSendAppAnalytics:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 setBoolValue:v3 forSetting:MCFeatureAppAnalyticsAllowed];
}

- (NSString)systemLanguage
{
  return (NSString *)+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage");
}

- (void)setSystemLanguage:(id)a3
{
  id v6 = a3;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 isDictationSupportedForSystemLanguage:v6];

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
    [v5 setDictationEnabled:0];
  }

  +[TVSInternationalization setSystemLanguage:](&OBJC_CLASS___TVSInternationalization, "setSystemLanguage:", v6);
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (void)setCurrentLocale:(id)a3
{
}

- (void)_updateCurrentLocale
{
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization region](&OBJC_CLASS___TVSInternationalization, "region"));
  currentLocale = self->_currentLocale;
  self->_currentLocale = v3;

  -[TVSettingsDeviceFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"currentLocale");
}

- (NSArray)availableLocales
{
  return (NSArray *)+[TVSInternationalization availableRegions]( &OBJC_CLASS___TVSInternationalization,  "availableRegions");
}

- (void)setPreferredKeyboardType:(int64_t)a3
{
  unsigned __int8 v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UIKit");
  -[NSUserDefaults setInteger:forKey:](v4, "setInteger:forKey:", a3, @"UserPreferredKeyboardStyle");
}

- (int64_t)preferredKeyboardType
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.UIKit");
  NSInteger v3 = -[NSUserDefaults integerForKey:](v2, "integerForKey:", @"UserPreferredKeyboardStyle");

  return v3;
}

- (void)setAutomaticTimeZoneSelectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  [v5 setAutomaticTimeZoneSelectionEnabled:v3];

  if (!v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
    id v7 = [v6 systemAppearance];

    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAppearanceFacade sharedInstance]( &OBJC_CLASS___TVSettingsAppearanceFacade,  "sharedInstance"));
      [v8 setSystemAppearance:0];
    }
  }

  self->_automaticTimeZoneSelectionEnabled = v3;
}

- (void)_updateAutomaticTimeZoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000306D0;
  v8[3] = &unk_10018E810;
  objc_copyWeak(&v9, &location);
  unsigned __int8 v4 = objc_retainBlock(v8);
  v5 = v4;
  if (v3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v7, v5);
  }

  else
  {
    ((void (*)(void *))v4[2])(v4);
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSString)timeZoneCityID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 timeZoneCityID]);

  return (NSString *)v3;
}

- (void)setTimeZoneCityID:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  [v4 setTimeZoneCityID:v3];
}

- (NSString)timeZoneCityName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 timeZoneCityName]);

  return (NSString *)v3;
}

- (id)cityNameForCityID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cityNameForCityID:v3]);

  return v5;
}

- (BOOL)use24HourTime
{
  if (self->_localeForces24HourTime) {
    return CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", kCFPreferencesAnyApplication, 0LL) == 0;
  }
  else {
    return CFPreferencesGetAppBooleanValue(@"AppleICUForce24HourTime", kCFPreferencesAnyApplication, 0LL) != 0;
  }
}

- (void)setUse24HourTime:(BOOL)a3
{
  BOOL v3 = !self->_localeForces24HourTime || a3;
  if (!self->_localeForces24HourTime && a3) {
    CFBooleanRef v4 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v4 = 0LL;
  }
  if (v3) {
    CFBooleanRef v5 = 0LL;
  }
  else {
    CFBooleanRef v5 = kCFBooleanTrue;
  }
  CFPreferencesSetAppValue(@"AppleICUForce12HourTime", v5, kCFPreferencesAnyApplication);
  CFPreferencesSetAppValue(@"AppleICUForce24HourTime", v4, kCFPreferencesAnyApplication);
  CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"AppleTimePreferencesChangedNotification",  0LL,  0LL,  1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0LL, 0LL, 1u);
}

- (void)_updateLocaleForces24HourTime
{
  BOOL v3 = (const __CFString *)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFLocaleRef v5 = CFLocaleCreate(0LL, v3);
    CFRelease(v4);
    if (!v5) {
      return;
    }
    goto LABEL_3;
  }

  CFLocaleRef v5 = CFLocaleCopyCurrent();
  if (v5)
  {
LABEL_3:
    self->_localeForces24HourTime = PSLocaleUses24HourClock(v5);
    CFRelease(v5);
  }

- (void)setSleepTimeout:(double)a3
{
  self->_sleepTimeout = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v4 setSleepTimeout:a3];
}

- (void)_updateSleepTimeoutValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100030BC4;
  v3[3] = &unk_10018FD08;
  objc_copyWeak(&v4, &location);
  [v2 sleepTimeoutWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)isSleepDisabledByProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  char v3 = [v2 isDeviceSleepAllowed] ^ 1;

  return v3;
}

- (BOOL)shouldAllowAppOTA
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSNetworkInterface preferredInterface](&OBJC_CLASS___TVSNetworkInterface, "preferredInterface"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 IPAddress]);

  if (v3) {
    BOOL v4 = [v3 rangeOfString:@"17."] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)updateSoftwareAutomatically
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 shouldAutomaticallyApplyUpdates];

  return v3;
}

- (void)setUpdateSoftwareAutomatically:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  [v4 setShouldAutomaticallyApplyUpdates:v3];
}

- (BOOL)supportsEnhancedAPFS
{
  if (qword_1001E1660 != -1) {
    dispatch_once(&qword_1001E1660, &stru_10018FD28);
  }
  return byte_1001E1658;
}

- (NSArray)availableNames
{
  return self->_availableNames;
}

- (void)setAvailableNames:(id)a3
{
}

- (BOOL)isAutomaticTimeZoneSelectionEnabled
{
  return self->_automaticTimeZoneSelectionEnabled;
}

- (void)setTimeZoneCityName:(id)a3
{
}

- (double)sleepTimeout
{
  return self->_sleepTimeout;
}

- (BOOL)iCloudSharedPhotosEnabled
{
  return self->_iCloudSharedPhotosEnabled;
}

- (void)setICloudSharedPhotosEnabled:(BOOL)a3
{
  self->_iCloudSharedPhotosEnabled = a3;
}

- (BOOL)myPhotoStreamEnabled
{
  return self->_myPhotoStreamEnabled;
}

- (void)setMyPhotoStreamEnabled:(BOOL)a3
{
  self->_myPhotoStreamEnabled = a3;
}

- (BOOL)iCloudPhotoLibraryEnabled
{
  return self->_iCloudPhotoLibraryEnabled;
}

- (void)setICloudPhotoLibraryEnabled:(BOOL)a3
{
  self->_iCloudPhotoLibraryEnabled = a3;
}

- (void).cxx_destruct
{
}

@end