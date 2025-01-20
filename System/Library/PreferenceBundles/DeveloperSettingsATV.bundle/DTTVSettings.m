@interface DTTVSettings
+ (id)sharedInstance;
- (BOOL)EUVolumeLimitEnabled;
- (BOOL)UIAutomationEnabled;
- (BOOL)airPlay2Enabled;
- (BOOL)hangTracerEnabled;
- (BOOL)logGraphicsPerformance;
- (BOOL)playbackHUDEnabled;
- (BOOL)showGraphicsHUD;
- (BOOL)swcDeveloperModeEnabled;
- (DTTVSettings)init;
- (id)_prefValueForKey:(id)a3 domain:(id)a4;
- (void)_setPrefValue:(id)a3 forKey:(id)a4 domain:(id)a5;
- (void)setAirPlay2Enabled:(BOOL)a3;
- (void)setEUVolumeLimitEnabled:(BOOL)a3;
- (void)setLogGraphicsPerformance:(BOOL)a3;
- (void)setPlaybackHUDEnabled:(BOOL)a3;
- (void)setShowGraphicsHUD:(BOOL)a3;
- (void)setSwcDeveloperModeEnabled:(BOOL)a3;
- (void)setUIAutomationEnabled:(BOOL)a3;
@end

@implementation DTTVSettings

+ (id)sharedInstance
{
  if (qword_1E670 != -1) {
    dispatch_once(&qword_1E670, &stru_187A0);
  }
  return (id)qword_1E668;
}

- (DTTVSettings)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTTVSettings;
  v2 = -[DTTVSettings init](&v4, "init");
  if (v2) {
    v2->_swcDeveloperModeEnabled = +[_SWCServiceDetails isDeveloperModeEnabled]( &OBJC_CLASS____SWCServiceDetails,  "isDeveloperModeEnabled");
  }
  return v2;
}

- (void)setUIAutomationEnabled:(BOOL)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[DTTVSettings _setPrefValue:forKey:domain:]( self,  "_setPrefValue:forKey:domain:",  v4,  @"UIAutomationEnabled",  @"com.apple.UIAutomation");

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.springboard.appIconVisibilityPreferencesChanged",  0LL,  0LL,  1u);
}

- (BOOL)UIAutomationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DTTVSettings _prefValueForKey:domain:]( self,  "_prefValueForKey:domain:",  @"UIAutomationEnabled",  @"com.apple.UIAutomation"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAirPlay2Enabled:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[DTTVSettings _setPrefValue:forKey:domain:]( self,  "_setPrefValue:forKey:domain:",  v4,  @"enableAirPlay2",  @"com.apple.airplay");
}

- (BOOL)airPlay2Enabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DTTVSettings _prefValueForKey:domain:]( self,  "_prefValueForKey:domain:",  @"enableAirPlay2",  @"com.apple.airplay"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEUVolumeLimitEnabled:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[DTTVSettings _setPrefValue:forKey:domain:]( self,  "_setPrefValue:forKey:domain:",  v4,  @"MPDebugEUVolumeLimit",  @".GlobalPreferences");
}

- (BOOL)EUVolumeLimitEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DTTVSettings _prefValueForKey:domain:]( self,  "_prefValueForKey:domain:",  @"MPDebugEUVolumeLimit",  @".GlobalPreferences"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPlaybackHUDEnabled:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[DTTVSettings _setPrefValue:forKey:domain:]( self,  "_setPrefValue:forKey:domain:",  v4,  @"enable",  @"com.apple.avfoundation.videoperformancehud");
}

- (BOOL)playbackHUDEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DTTVSettings _prefValueForKey:domain:]( self,  "_prefValueForKey:domain:",  @"enable",  @"com.apple.avfoundation.videoperformancehud"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSwcDeveloperModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_swcDeveloperModeEnabled = a3;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_BD08;
  v4[3] = &unk_187F0;
  objc_copyWeak(&v5, &location);
  +[_SWCServiceDetails setDeveloperModeEnabled:completionHandler:]( &OBJC_CLASS____SWCServiceDetails,  "setDeveloperModeEnabled:completionHandler:",  v3,  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)logGraphicsPerformance
{
  return CFPreferencesGetAppBooleanValue(@"MetalHudLoggingEnabled", @".GlobalPreferences", 0LL) != 0;
}

- (void)setLogGraphicsPerformance:(BOOL)a3
{
}

- (BOOL)showGraphicsHUD
{
  return CFPreferencesGetAppBooleanValue(@"MetalForceHudEnabled", @".GlobalPreferences", 0LL) != 0;
}

- (void)setShowGraphicsHUD:(BOOL)a3
{
}

- (BOOL)hangTracerEnabled
{
  v2 = objc_opt_new(&OBJC_CLASS___HTDeveloperSettings);
  unsigned __int8 v3 = -[HTDeveloperSettings isEnabled](v2, "isEnabled");

  return v3;
}

- (void)_setPrefValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a4, a3, applicationID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(applicationID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)_prefValueForKey:(id)a3 domain:(id)a4
{
  return (id)(id)CFPreferencesCopyValue( (CFStringRef)a3,  (CFStringRef)a4,  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
}

- (BOOL)swcDeveloperModeEnabled
{
  return self->_swcDeveloperModeEnabled;
}

@end