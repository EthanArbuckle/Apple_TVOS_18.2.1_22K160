@interface iAP2Platform
+ (BOOL)IsiPad;
+ (id)GetInstance;
+ (id)accessoryHomeDirectory;
- (BOOL)HasE75;
- (BOOL)HasLineIn;
- (BOOL)HasLineOut;
- (BOOL)HasUSBDigitalAudioIn;
- (BOOL)HasUSBDigitalAudioOut;
- (BOOL)HasVideoOut;
- (BOOL)IAPLoggingEnabled;
- (BOOL)SupportNestedPlaylist;
- (BOOL)SupportRestoreVolumeOnExit;
- (BOOL)SupportsAccessibilityAssistiveTouch;
- (BOOL)SupportsAccessibilityOverIap;
- (BOOL)SupportsAccessibilityPreference;
- (BOOL)SupportsApplicationAutolaunch;
- (BOOL)SupportsDisplayPort;
- (BOOL)SupportsDisplayPortToHDMI;
- (BOOL)SupportsGeniusMixes;
- (BOOL)SupportsGeniusPlaylist;
- (BOOL)SupportsITunesU;
- (BOOL)SupportsUSBHostMode;
- (BOOL)SupportsUSBHostModeAudioInput;
- (BOOL)SupportsUSBHostModeAudioOutput;
- (BOOL)SupportsVideoBrowsing;
- (iAP2Platform)init;
- (id)OSVersion;
- (void)dealloc;
- (void)loadLoggingPreferences;
@end

@implementation iAP2Platform

+ (id)accessoryHomeDirectory
{
  return objc_msgSend( objc_msgSend( objc_msgSend((id)CPSharedResourcesDirectory(a1, a2), "stringByAppendingPathComponent:", @"Media"),  "stringByAppendingPathComponent:",  @"iTunes_Control"),  "stringByAppendingPathComponent:",  @"Device");
}

+ (id)GetInstance
{
  if (qword_1000222F0 != -1) {
    dispatch_once(&qword_1000222F0, &stru_10001C6A8);
  }
  return (id)qword_1000222F8;
}

+ (BOOL)IsiPad
{
  return MGGetBoolAnswer(@"ipad", a2);
}

- (iAP2Platform)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___iAP2Platform;
  v2 = -[iAP2Platform init](&v5, "init");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10000DE00,  @"com.apple.iapd.LoggingPreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  -[iAP2Platform loadLoggingPreferences](v2, "loadLoggingPreferences");
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___iAP2Platform;
  -[iAP2Platform dealloc](&v2, "dealloc");
}

- (void)loadLoggingPreferences
{
  v3 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults addSuiteNamed:](v3, "addSuiteNamed:", @"com.apple.Preferences");
  self->_IAPLoggingEnabled = -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"IAPLogging");
}

- (BOOL)SupportRestoreVolumeOnExit
{
  return 0;
}

- (BOOL)SupportNestedPlaylist
{
  return 1;
}

- (BOOL)SupportsGeniusMixes
{
  return 1;
}

- (BOOL)SupportsITunesU
{
  return 1;
}

- (BOOL)SupportsVideoBrowsing
{
  return 1;
}

- (BOOL)SupportsDisplayPortToHDMI
{
  return -[iAP2Platform SupportsDisplayPort](self, "SupportsDisplayPort");
}

- (BOOL)SupportsDisplayPort
{
  if ((byte_100022300 & 1) == 0) {
    byte_100022300 = 1;
  }
  return 0;
}

- (BOOL)SupportsApplicationAutolaunch
{
  return 1;
}

- (BOOL)SupportsAccessibilityOverIap
{
  return 1;
}

- (BOOL)SupportsAccessibilityPreference
{
  return 1;
}

- (BOOL)SupportsAccessibilityAssistiveTouch
{
  return 1;
}

- (BOOL)SupportsGeniusPlaylist
{
  return 1;
}

- (BOOL)HasE75
{
  return MGGetBoolAnswer(@"DeviceSupports9Pin", a2);
}

- (BOOL)HasVideoOut
{
  return 1;
}

- (BOOL)HasLineIn
{
  return 0;
}

- (BOOL)HasLineOut
{
  return 1;
}

- (BOOL)HasUSBDigitalAudioIn
{
  return 1;
}

- (BOOL)HasUSBDigitalAudioOut
{
  return 1;
}

- (BOOL)SupportsUSBHostMode
{
  return 1;
}

- (BOOL)SupportsUSBHostModeAudioOutput
{
  return 1;
}

- (BOOL)SupportsUSBHostModeAudioInput
{
  return 1;
}

- (id)OSVersion
{
  unsigned int v8 = 0;
  objc_super v2 = (const void *)MGCopyAnswerWithError(@"ProductVersion", 0LL, &v8);
  v3 = v2;
  if (v2) {
    BOOL v4 = v8 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v2);
    if (v6 == CFStringGetTypeID())
    {
      objc_super v5 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3);
    }

    else
    {
      NSLog(@"%s got non-string when querying key", "-[iAP2Platform OSVersion]");
      objc_super v5 = 0LL;
    }
  }

  else
  {
    NSLog( @"%s MG error: 0x%08x retrieving key:(%@)",  "-[iAP2Platform OSVersion]",  v8,  @"ProductVersion");
    objc_super v5 = 0LL;
    if (!v3) {
      return v5;
    }
  }

  CFRelease(v3);
  return v5;
}

- (BOOL)IAPLoggingEnabled
{
  return self->_IAPLoggingEnabled;
}

@end