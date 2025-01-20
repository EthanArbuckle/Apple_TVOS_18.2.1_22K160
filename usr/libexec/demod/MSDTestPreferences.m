@interface MSDTestPreferences
+ (id)sharedInstance;
- (BOOL)bailOnStashedStagingRestoreFailure;
- (BOOL)disableParallelProcessing;
- (BOOL)enableAIModelAutoUpdate;
- (BOOL)fakeActivationDemoBit;
- (BOOL)mockForBetterTogetherDemo;
- (BOOL)pauseContentUpdateOnError;
- (double)appUsagePollingInterval;
- (double)caLogsUploadInterval;
- (double)cachingHubRetryInterval;
- (id)demoUnitServerURL;
- (id)getValueFromTestPreferencesForKey:(id)a3;
- (id)mockAccountSettingsFile;
- (id)mockOSUpdateRequestFile;
- (id)mockPeerProtocolVersion;
- (id)screenSaverIdleDelay;
- (int64_t)concurrentDownloadOperation;
- (int64_t)concurrentDownloadRequest;
- (int64_t)concurrentSession;
- (int64_t)deviceActivationFlag;
- (int64_t)findMyHubRetryDelay;
- (unsigned)rebootDelayForStaging;
- (unsigned)systemAppPollingInterval;
- (unsigned)systemAppTimeoutInterval;
- (unsigned)timeShowingFatalError;
@end

@implementation MSDTestPreferences

+ (id)sharedInstance
{
  if (qword_1001252A8 != -1) {
    dispatch_once(&qword_1001252A8, &stru_1000F9918);
  }
  return (id)qword_1001252A0;
}

- (BOOL)fakeActivationDemoBit
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"FakeActivationDemoBit"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)demoUnitServerURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DemoUnitServerURL"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  }
  else {
    unsigned __int8 v5 = 0LL;
  }

  return v5;
}

- (int64_t)findMyHubRetryDelay
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"FMHRetryDelay"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (unsigned)rebootDelayForStaging
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"RebootDelayForStaging"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unsigned)timeShowingFatalError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"TimeShowingFatalError"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (BOOL)disableParallelProcessing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DisableParallelProcessing"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)pauseContentUpdateOnError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"PauseContentUpdateOnError"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"BailOnStashedStagingRestoreFailure"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (int64_t)concurrentDownloadRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentDownloadRequest"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (int64_t)concurrentDownloadOperation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentDownloadOperation"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (int64_t)concurrentSession
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentSession"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (double)cachingHubRetryInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"CachingHubRetryInterval"));
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
      double v4 = (double)(uint64_t)[v3 integerValue];
    }
  }

  return v4;
}

- (double)caLogsUploadInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"CALogsUploadInterval"));
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
      double v4 = (double)(uint64_t)[v3 integerValue];
    }
  }

  return v4;
}

- (double)appUsagePollingInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"AppUsagePollingInterval"));
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
      double v4 = (double)(uint64_t)[v3 integerValue];
    }
  }

  return v4;
}

- (unsigned)systemAppTimeoutInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"SystemAppTimeoutInterval"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unsigned)systemAppPollingInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"SystemAppPollingInterval"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (int64_t)deviceActivationFlag
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DeviceActivationFlag"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    int64_t v5 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v5 = -1LL;
  }

  return v5;
}

- (BOOL)mockForBetterTogetherDemo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockForBetterTogetherDemo"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)mockAccountSettingsFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockAccountSettingsFile"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)mockOSUpdateRequestFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockOSUpdateRequestFile"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)screenSaverIdleDelay
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ScreenSaverIdleDelay"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)mockPeerProtocolVersion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockPeerProtocolVersion"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)enableAIModelAutoUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"EnableAIModelAutoUpdate"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  v3 = (__CFString *)a3;
  if (!CFPreferencesSynchronize( @"com.apple.MobileStoreDemo.test",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost))
  {
    id v4 = sub_10003A95C();
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100093390(v5);
    }
  }

  v6 = (void *)CFPreferencesCopyValue( v3,  @"com.apple.MobileStoreDemo.test",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);

  return v6;
}

@end