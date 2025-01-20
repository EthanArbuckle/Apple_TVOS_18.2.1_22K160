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
  if (qword_10004F868 != -1) {
    dispatch_once(&qword_10004F868, &stru_100044DA8);
  }
  return (id)qword_10004F860;
}

- (BOOL)fakeActivationDemoBit
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"FakeActivationDemoBit"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)demoUnitServerURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DemoUnitServerURL"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
  }
  else {
    unsigned __int8 v4 = 0LL;
  }

  return v4;
}

- (int64_t)findMyHubRetryDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"FMHRetryDelay"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (unsigned)rebootDelayForStaging
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"RebootDelayForStaging"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)timeShowingFatalError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"TimeShowingFatalError"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)disableParallelProcessing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DisableParallelProcessing"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)pauseContentUpdateOnError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"PauseContentUpdateOnError"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)bailOnStashedStagingRestoreFailure
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"BailOnStashedStagingRestoreFailure"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)concurrentDownloadRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentDownloadRequest"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (int64_t)concurrentDownloadOperation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentDownloadOperation"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (int64_t)concurrentSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ConcurrentSession"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (double)cachingHubRetryInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"CachingHubRetryInterval"));
  double v3 = 0.0;
  if (v2)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
      double v3 = (double)(uint64_t)[v2 integerValue];
    }
  }

  return v3;
}

- (double)caLogsUploadInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"CALogsUploadInterval"));
  double v3 = 0.0;
  if (v2)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
      double v3 = (double)(uint64_t)[v2 integerValue];
    }
  }

  return v3;
}

- (double)appUsagePollingInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"AppUsagePollingInterval"));
  double v3 = 0.0;
  if (v2)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
      double v3 = (double)(uint64_t)[v2 integerValue];
    }
  }

  return v3;
}

- (unsigned)systemAppTimeoutInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"SystemAppTimeoutInterval"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unsigned)systemAppPollingInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"SystemAppPollingInterval"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned int v4 = [v2 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (int64_t)deviceActivationFlag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"DeviceActivationFlag"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = -1LL;
  }

  return v4;
}

- (BOOL)mockForBetterTogetherDemo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockForBetterTogetherDemo"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)mockAccountSettingsFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockAccountSettingsFile"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)mockOSUpdateRequestFile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockOSUpdateRequestFile"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)screenSaverIdleDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"ScreenSaverIdleDelay"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)mockPeerProtocolVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"MockPeerProtocolVersion"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)enableAIModelAutoUpdate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTestPreferences getValueFromTestPreferencesForKey:]( self,  "getValueFromTestPreferencesForKey:",  @"EnableAIModelAutoUpdate"));
  if (v2 && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v2, v3) & 1) != 0)) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)getValueFromTestPreferencesForKey:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  if (!CFPreferencesSynchronize( @"com.apple.MobileStoreDemo.test",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost))
  {
    id v4 = sub_100021D84();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A57C(v5);
    }
  }

  v6 = (void *)CFPreferencesCopyValue( v3,  @"com.apple.MobileStoreDemo.test",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);

  return v6;
}

@end