@interface TMPreferences
- (BOOL)NTPUseServicePort;
- (BOOL)areTimeZonePopupsEnabled;
- (BOOL)isAppleTV;
- (BOOL)isAutomaticTimeEnabled;
- (BOOL)isAutomaticTimeZoneEnabled;
- (BOOL)isMac;
- (BOOL)isWatch;
- (BOOL)shouldAlertWhenIslanded;
- (BOOL)shouldAllowTimeTool;
- (BOOL)shouldClamp;
- (BOOL)shouldCorrectOnWake;
- (BOOL)shouldFetchOnWake;
- (BOOL)shouldPowerAssertionsBeOptional;
- (BOOL)shouldUseFilesystemTimestamp;
- (BOOL)supportsBasebandAPTimeSync;
- (NSString)NTPServerAddress;
- (NSString)NTPServerPort;
- (NSString)providerName;
- (TMPreferences)init;
- (TMPreferences)initWithDefaults:(id)a3;
- (double)NTPBurstRetryInterval;
- (double)NTPSchedulingInterval;
- (double)NTPUnsetSchedulingInterval;
- (double)NTPWantedThreshold;
- (double)RTCFrequencyNoiseDensity;
- (double)RTCFrequencyTolerance;
- (double)RTCMachSyncInterval;
- (double)RTCWakeUncertainty;
- (double)basebandWantedThreshold;
- (double)settimeofdayThreshold;
- (id)description;
- (int64_t)NTPBurstRetryAttempts;
- (int64_t)NTPServicePortMaxRetries;
- (int64_t)commandHistorySizeKey;
- (void)dealloc;
- (void)setAccurateThresholds:(BOOL)a3;
- (void)setAutomaticTimeEnabled:(BOOL)a3;
- (void)setAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)setNTPUseServicePort:(BOOL)a3;
@end

@implementation TMPreferences

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMPreferences;
  -[TMPreferences dealloc](&v3, "dealloc");
}

- (TMPreferences)initWithDefaults:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TMPreferences;
  v4 = -[TMPreferences init](&v6, "init");
  if (v4)
  {
    _CFPreferencesSetFileProtectionClass( kCFPreferencesCurrentApplication,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  0LL,  4LL);
    v4->_defaults = (NSUserDefaults *)a3;
    sub_100015CA8((id *)&v4->super.isa);
  }

  return v4;
}

- (TMPreferences)init
{
  return -[TMPreferences initWithDefaults:]( self,  "initWithDefaults:",  +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
}

- (BOOL)isAppleTV
{
  v2 = (const void *)MGCopyAnswer(@"DeviceClass", 0LL);
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  BOOL v4 = CFEqual(v2, @"AppleTV") != 0;
  CFRelease(v3);
  return v4;
}

- (BOOL)isMac
{
  return 0;
}

- (BOOL)supportsBasebandAPTimeSync
{
  v2 = (const void *)MGCopyAnswer(@"HXTqT3UXOKuTEklxz+wMAA", 0LL);
  objc_super v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0LL;
}

- (BOOL)isWatch
{
  return objc_msgSend( (id)MGCopyAnswer(@"DeviceClass", 0),  "isEqualToString:",  @"Watch");
}

- (void)setAccurateThresholds:(BOOL)a3
{
  id v3 = (id)a3;
  id v5 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"ForceAccurateTime");
  if (v5)
  {
    id v3 = [v5 BOOLValue];
    objc_super v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      if ((_DWORD)v3) {
        v7 = "enabled";
      }
      *(_DWORD *)buf = 136315138;
      v17 = (void *)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Forcing accurate thresholds to be %s, from defaults.",  buf,  0xCu);
    }
  }

  v8 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    v9 = "inaccurate";
    if ((_DWORD)v3) {
      v9 = "accurate";
    }
    *(_DWORD *)buf = 136315138;
    v17 = (void *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting thresholds to be %s", buf, 0xCu);
  }

  v14[0] = @"BBTimeWantedThreshold";
  if ((_DWORD)v3)
  {
    unsigned int v10 = -[TMPreferences supportsBasebandAPTimeSync](self, "supportsBasebandAPTimeSync", v14[0]);
    double v11 = INFINITY;
    if (v10) {
      double v11 = 0.048;
    }
  }

  else
  {
    double v11 = INFINITY;
  }

  v15[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11, v14[0]);
  v15[1] = &off_10002C278;
  v14[1] = @"NtpTimeWantedThreshold";
  v14[2] = @"CorrectTimeOnWake";
  v15[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3);
  v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL);
  v13 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Registering these thresholds: %@", buf, 0xCu);
  }

  -[NSUserDefaults registerDefaults:](self->_defaults, "registerDefaults:", v12);
}

- (id)description
{
  return -[NSDictionary description]( -[NSUserDefaults dictionaryRepresentation](self->_defaults, "dictionaryRepresentation"),  "description");
}

- (NSString)NTPServerPort
{
  return -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", @"NtpTimeServerPort");
}

- (BOOL)shouldFetchOnWake
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"FetchTimeOnWake");
}

- (BOOL)shouldCorrectOnWake
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"CorrectTimeOnWake");
}

- (double)RTCMachSyncInterval
{
  return result;
}

- (double)RTCWakeUncertainty
{
  return result;
}

- (double)settimeofdayThreshold
{
  return result;
}

- (int64_t)commandHistorySizeKey
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", @"CommandHistorySize");
}

- (double)NTPSchedulingInterval
{
  return result;
}

- (double)NTPBurstRetryInterval
{
  return result;
}

- (int64_t)NTPBurstRetryAttempts
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", @"NtpBurstRetryAttempts");
}

- (double)NTPUnsetSchedulingInterval
{
  return result;
}

- (BOOL)NTPUseServicePort
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"NtpUseServicePort");
}

- (NSString)providerName
{
  return -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", @"TimeProvider");
}

- (double)basebandWantedThreshold
{
  return result;
}

- (double)NTPWantedThreshold
{
  return result;
}

- (int64_t)NTPServicePortMaxRetries
{
  return -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", @"NtpServicePortMaxRetries");
}

- (BOOL)areTimeZonePopupsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"TimeZonePopups");
}

- (BOOL)shouldUseFilesystemTimestamp
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"UseFilesystemTimestamp");
}

- (double)RTCFrequencyTolerance
{
  return result;
}

- (double)RTCFrequencyNoiseDensity
{
  return result;
}

- (NSString)NTPServerAddress
{
  if (!os_variant_allows_internal_security_policies("com.apple.timed", a2)
    || (double result = -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", @"NtpTimeServer")) == 0LL)
  {
    if (self) {
      return (NSString *)@"time.apple.com";
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)shouldClamp
{
  id v3 = -[TMPreferences NTPServerAddress](self, "NTPServerAddress");
  if (self) {
    BOOL v4 = @"time.apple.com";
  }
  else {
    BOOL v4 = 0LL;
  }
  return -[NSString isEqualToString:](v3, "isEqualToString:", v4);
}

- (BOOL)shouldAlertWhenIslanded
{
  return os_variant_has_internal_ui("com.apple.timed", a2);
}

- (BOOL)shouldAllowTimeTool
{
  return os_variant_allows_internal_security_policies("com.apple.timed", a2);
}

- (BOOL)shouldPowerAssertionsBeOptional
{
  return os_variant_is_darwinos("com.apple.timed", a2);
}

- (BOOL)isAutomaticTimeEnabled
{
  BOOL v3 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"TMAutomaticTimeOnlyEnabled");
  if (v3) {
    LOBYTE(v3) = !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"DisableAutomaticTime");
  }
  return v3;
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  BOOL v3 = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"TMAutomaticTimeZoneEnabled");
  if (v3) {
    LOBYTE(v3) = !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", @"DisableAutomaticTime");
  }
  return v3;
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
}

- (void)setNTPUseServicePort:(BOOL)a3
{
}

@end