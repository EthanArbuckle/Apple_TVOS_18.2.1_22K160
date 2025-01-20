@interface MSDHubFeatureFlags
+ (BOOL)disableBackgroundInstall;
+ (BOOL)disableNightlyLowPowerMode;
+ (BOOL)disableNightlySnapshotRevert;
+ (BOOL)disableScreenDarkHours;
+ (BOOL)disableStudioDisplayUpdate;
+ (BOOL)disableUserHomeDeepClean;
+ (BOOL)enableAIModelAutoUpdate;
+ (BOOL)isSupportedFeatureFlag:(id)a3;
+ (BOOL)readBoolValueForFeatureFlag:(id)a3;
+ (id)supportedFeatureFlags;
@end

@implementation MSDHubFeatureFlags

+ (id)supportedFeatureFlags
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"DisableStudioDisplayUpdate",  @"DisableNightlySnapshotRevert",  @"DisableUserHomeDeepClean",  @"DisableNightlyLowPowerMode",  @"DisableScreenDarkHours",  @"DisableBackgroundInstall",  @"EnableAIModelAutoUpdate",  0LL);
}

+ (BOOL)isSupportedFeatureFlag:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHubFeatureFlags supportedFeatureFlags](&OBJC_CLASS___MSDHubFeatureFlags, "supportedFeatureFlags"));
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

+ (BOOL)disableStudioDisplayUpdate
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableStudioDisplayUpdate");
}

+ (BOOL)disableNightlySnapshotRevert
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableNightlySnapshotRevert");
}

+ (BOOL)disableUserHomeDeepClean
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableUserHomeDeepClean");
}

+ (BOOL)disableNightlyLowPowerMode
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableNightlyLowPowerMode");
}

+ (BOOL)disableScreenDarkHours
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableScreenDarkHours");
}

+ (BOOL)disableBackgroundInstall
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"DisableBackgroundInstall");
}

+ (BOOL)enableAIModelAutoUpdate
{
  return +[MSDHubFeatureFlags readBoolValueForFeatureFlag:]( &OBJC_CLASS___MSDHubFeatureFlags,  "readBoolValueForFeatureFlag:",  @"EnableAIModelAutoUpdate");
}

+ (BOOL)readBoolValueForFeatureFlag:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"HubSuppliedSettings"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"FeatureFlags"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v3]);

  LOBYTE(v3) = [v7 BOOLValue];
  return (char)v3;
}

@end