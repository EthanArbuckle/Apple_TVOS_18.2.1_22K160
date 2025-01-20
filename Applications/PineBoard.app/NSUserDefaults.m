@interface NSUserDefaults
+ (id)pb_appleTVServicesUserDefaults;
+ (void)load;
- (BOOL)allowPowerButtonToOpenControlCenter;
- (BOOL)allowSiriOnScreenActions;
- (BOOL)alwaysShowIndeterminateOnButtonPress;
- (BOOL)alwaysUpdateVolumeLevel;
- (BOOL)controlCenterTeachableMomentShouldSkip;
- (BOOL)dialogsEnabled;
- (BOOL)emitButtonTimingLogs;
- (BOOL)emitConfigLogs;
- (BOOL)emitDiagnosticAVLog;
- (BOOL)emitPlaybackLogs;
- (BOOL)emitThermalLogs;
- (BOOL)enforceProvisioningOnSystemAppsEnabled;
- (BOOL)forceEnableSILOnTimeAccumulation;
- (BOOL)forceNight;
- (BOOL)hiliteModeDisabledForTesting;
- (BOOL)ignoreLocalHTTPCacheEnabled;
- (BOOL)isAppSwitcherEnabled;
- (BOOL)isKioskAppAutoLaunchEnabled;
- (BOOL)isSleepNever;
- (BOOL)isSystemAppearanceSelected;
- (BOOL)modeSwitchDebuggingEnabled;
- (BOOL)nowPlayingUIEnabled;
- (BOOL)pb_multiUserLegacyGameAlertEnabled;
- (BOOL)suppressIssueDataExport;
- (BOOL)useLegacyKeyboardMicButtonBehavior;
- (NSArray)appIdentifierHistory;
- (NSArray)eARCPromptHistory;
- (NSArray)odeonPromptHistory;
- (NSDate)controlCenterTeachableMomentFirstExposureTimestamp;
- (NSDictionary)bypassRestrictionsUsingCompanionDeviceUserSettingsDictionary;
- (NSNumber)currentVolumeFadeDuration;
- (NSNumber)currentVolumeFadeOutDuration;
- (NSNumber)customScheduledSleepDuration;
- (NSNumber)indeterminateAnimationDamping;
- (NSNumber)indeterminateAnimationMass;
- (NSNumber)indeterminateAnimationStartDelay;
- (NSNumber)indeterminateAnimationStiffness;
- (NSString)figaroLoggingURL;
- (NSString)kioskAppBundleIdentifier;
- (NSString)musicAppBundleIdentifier;
- (NSString)osSoftwareUpdateMonitoringURLOverride;
- (NSString)postSetupAppBundleIdentifier;
- (double)EDIDLoggingTimePeriodInSeconds;
- (double)accumulatedSILOnTimeMinutes;
- (double)actionableBulletinNotificationAutoDismissalTimeInSeconds;
- (double)bluetoothRemoteKeepAliveTimeInterval;
- (double)bluetoothRemoteSleepTimeoutInSeconds;
- (double)bulletinNotificationAutoDismissalTimeInSeconds;
- (double)channelGuideLongPressDelayInSeconds;
- (double)controlCenterTimeoutInSeconds;
- (double)crdAppTimeoutInSeconds;
- (double)hiliteModeTimeoutInSeconds;
- (double)longIdleDelayInSeconds;
- (double)menuLongPressDelayInSeconds;
- (double)microphoneLongPressDelayInSeconds;
- (double)modeSwitchDuration;
- (double)musicNowPlayingTimeoutInSeconds;
- (double)odeonDestinationCheckTimeIntervalInSeconds;
- (double)pb_largeGameInstallTimeThreshold;
- (double)pb_remoteConnectedStandbyTimeoutInSeconds;
- (double)powerLongPressDelayInSeconds;
- (double)remotePresenceDetectionDelayTimeoutInSeconds;
- (double)secondsBetweenSILOnTimeDefaultsWrite;
- (double)secondsBetweenSILOnTimePersistentWrite;
- (double)sleepTimeoutInSeconds;
- (double)tipsKioskIdleNotifyDelayInSeconds;
- (double)whatsNewCheckTimeIntervalInSeconds;
- (id)_defaultMusicAppBundleIdentifier;
- (int64_t)systemAppearance;
- (void)pb_noteMCEffectiveSettingsChanged;
- (void)setAccumulatedSILOnTimeMinutes:(double)a3;
- (void)setAppIdentifierHistory:(id)a3;
- (void)setBypassRestrictionsUsingCompanionDeviceUserSettingsDictionary:(id)a3;
- (void)setControlCenterTeachableMomentFirstExposureTimestamp:(id)a3;
- (void)setControlCenterTeachableMomentShouldSkip:(BOOL)a3;
- (void)setEARCPromptHistory:(id)a3;
- (void)setForceEnableSILOnTimeAccumulation:(BOOL)a3;
- (void)setKioskAppBundleIdentifier:(id)a3;
- (void)setOdeonPromptHistory:(id)a3;
- (void)setPostSetupAppBundleIdentifier:(id)a3;
- (void)setSecondsBetweenSILOnTimeDefaultsWrite:(double)a3;
- (void)setSecondsBetweenSILOnTimePersistentWrite:(double)a3;
- (void)setSleepTimeoutInSeconds:(double)a3;
- (void)setSystemAppearance:(int64_t)a3;
@end

@implementation NSUserDefaults

+ (void)load
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4[0] = @"UseLegacyKeyboardMicButtonBehavior";
  v4[1] = @"AllowSiriOnScreenActions";
  v5[0] = &__kCFBooleanFalse;
  v5[1] = &__kCFBooleanTrue;
  v4[2] = @"BluetoothRemoteKeepAliveTimeInterval";
  v4[3] = @"BluetoothRemoteSleepTimeoutInSeconds";
  v5[2] = &off_1003FEB90;
  v5[3] = &off_1003FEB90;
  v4[4] = @"ActionableBulletinNotificationAutoDismissalTimeInSeconds";
  v4[5] = @"BulletinNotificationAutoDismissalTimeInSeconds";
  v5[4] = &off_1003FEBA0;
  v5[5] = &off_1003FEBB0;
  v4[6] = @"CRDAppTimeout";
  v4[7] = @"LongIdleDelayInSeconds";
  v5[6] = &off_1003FEBC0;
  v5[7] = &off_1003FEB90;
  v4[8] = @"ControlCenterTimeoutInSeconds";
  v4[9] = @"HILITEModeTimeout";
  v5[8] = &off_1003FEBD0;
  v5[9] = &off_1003FEBD0;
  v4[10] = @"TipsIdleNotifyDelayInSeconds";
  v4[11] = @"ChannelGuideLongPressDelayInSeconds";
  v5[10] = &off_1003FEBE0;
  v5[11] = &off_1003FEBF0;
  v4[12] = @"MenuLongPressDelayInSeconds";
  v4[13] = @"MicLongPressDelayInSeconds";
  v5[12] = &off_1003FEBF0;
  v5[13] = &off_1003FEC00;
  v4[14] = @"PowerLongPressDelayInSeconds";
  v4[15] = @"PowerButtonCanOpenControlCenter";
  v5[14] = &off_1003FEBF0;
  v5[15] = &__kCFBooleanTrue;
  v4[16] = @"MusicNowPlayingTimeout";
  v4[17] = @"NativeModeSwitchDurationInSeconds";
  v5[16] = &off_1003FEBD0;
  v5[17] = &off_1003FEC10;
  v4[18] = @"RemotePresenceDetectionDelayTimeoutInSeconds";
  v4[19] = @"RemoteConnectedStandbyTimeoutInSeconds";
  v5[18] = &off_1003FEC20;
  v5[19] = &off_1003FEC30;
  v4[20] = @"EnforceProvisioningOnSystemApps";
  v4[21] = @"SleepTimeoutInSeconds";
  v5[20] = &__kCFBooleanTrue;
  v5[21] = &off_1003FEC40;
  v4[22] = @"SystemAppearanceKey";
  v4[23] = @"MultiUserLegacyGameAlertEnabled";
  v5[22] = &off_1003FE088;
  v5[23] = &__kCFBooleanTrue;
  v4[24] = @"SILOnTimeDefaultWritePeriod";
  v4[25] = @"SILOnTimePersistentWritePeriod";
  v5[24] = &off_1003FE0A0;
  v5[25] = &off_1003FE0B8;
  v4[26] = @"OdeonDestinationCheckTimeIntervalInSeconds";
  v4[27] = @"CurrentVolumeFadeDuration";
  v5[26] = &off_1003FEB90;
  v5[27] = &off_1003FEC50;
  v4[28] = @"CurrentVolumeFadeOutDuration";
  v4[29] = @"IndeterminateAnimationStartDelay";
  v5[28] = &off_1003FEC60;
  v5[29] = &off_1003FE0D0;
  v4[30] = @"IndeterminateAnimationMass";
  v4[31] = @"IndeterminateAnimationStiffness";
  v5[30] = &off_1003FEC70;
  v5[31] = &off_1003FEC80;
  v4[32] = @"IndeterminateAnimationDamping";
  v4[33] = @"IndeterminateAlwaysUpdateVolumeLevel";
  v5[32] = &off_1003FEC20;
  v5[33] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  34LL));
  [v2 registerDefaults:v3];
}

- (BOOL)isAppSwitcherEnabled
{
  return !-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NoAppSwitcher");
}

- (BOOL)isKioskAppAutoLaunchEnabled
{
  return !-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NoAutoLaunch");
}

- (NSString)kioskAppBundleIdentifier
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults stringForKey:]( self,  "stringForKey:",  @"KioskAppBundleIdentifier"));
}

- (void)setKioskAppBundleIdentifier:(id)a3
{
}

- (NSString)postSetupAppBundleIdentifier
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults stringForKey:]( self,  "stringForKey:",  @"PostBuddyAppBundleIdentifier"));
}

- (void)setPostSetupAppBundleIdentifier:(id)a3
{
}

- (NSString)musicAppBundleIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](self, "stringForKey:", @"MusicAppBundleIdentifier"));
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSUserDefaults _defaultMusicAppBundleIdentifier](self, "_defaultMusicAppBundleIdentifier"));
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSArray)appIdentifierHistory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringArrayForKey:](self, "stringArrayForKey:", @"AppIdentifierHistory"));
  v3 = v2;
  if (!v2) {
    v2 = &__NSArray0__struct;
  }
  v4 = v2;

  return v4;
}

- (void)setAppIdentifierHistory:(id)a3
{
}

- (BOOL)enforceProvisioningOnSystemAppsEnabled
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EnforceProvisioningOnSystemApps");
}

- (double)whatsNewCheckTimeIntervalInSeconds
{
  return result;
}

- (double)remotePresenceDetectionDelayTimeoutInSeconds
{
  return result;
}

- (double)pb_remoteConnectedStandbyTimeoutInSeconds
{
  return result;
}

- (double)hiliteModeTimeoutInSeconds
{
  return result;
}

- (BOOL)hiliteModeDisabledForTesting
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"DisableHiliteMode");
}

- (double)musicNowPlayingTimeoutInSeconds
{
  if (result <= 0.0) {
    return -1.0;
  }
  return result;
}

- (double)crdAppTimeoutInSeconds
{
  if (result <= 0.0) {
    return -1.0;
  }
  return result;
}

- (double)longIdleDelayInSeconds
{
  if (result <= 0.0) {
    return -1.0;
  }
  return result;
}

- (double)controlCenterTimeoutInSeconds
{
  if (result <= 0.0) {
    return -1.0;
  }
  return result;
}

- (double)sleepTimeoutInSeconds
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v4 = [v3 isDeviceSleepAllowed];

  double result = -1.0;
  if (v4) {
    -[NSUserDefaults doubleForKey:](self, "doubleForKey:", @"SleepTimeoutInSeconds", -1.0);
  }
  if (result <= 0.0) {
    return -1.0;
  }
  return result;
}

- (void)setSleepTimeoutInSeconds:(double)a3
{
}

- (BOOL)isSleepNever
{
  return v2 < 0.0;
}

- (double)tipsKioskIdleNotifyDelayInSeconds
{
  return fmax(v2, 5.0);
}

- (double)channelGuideLongPressDelayInSeconds
{
  return fmax(v2, 0.25);
}

- (double)menuLongPressDelayInSeconds
{
  return fmax(v2, 0.25);
}

- (double)microphoneLongPressDelayInSeconds
{
  double v3 = v2;
  int v4 = _os_feature_enabled_impl("PineBoard", "PressToDictate");
  double v5 = 0.2;
  if (!v4) {
    double v5 = 0.25;
  }
  return fmax(v3, v5);
}

- (double)powerLongPressDelayInSeconds
{
  return fmax(v2, 0.25);
}

- (BOOL)allowPowerButtonToOpenControlCenter
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"PowerButtonCanOpenControlCenter");
}

- (NSString)osSoftwareUpdateMonitoringURLOverride
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults stringForKey:]( self,  "stringForKey:",  @"OSSWUMonitoringURLOverride"));
}

- (double)actionableBulletinNotificationAutoDismissalTimeInSeconds
{
  return result;
}

- (double)bulletinNotificationAutoDismissalTimeInSeconds
{
  return result;
}

- (BOOL)emitDiagnosticAVLog
{
  if (-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EmitAVLog")) {
    return 1;
  }
  else {
    return +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  }
}

- (BOOL)emitPlaybackLogs
{
  if (-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EmitPlaybackLogs")) {
    return 1;
  }
  else {
    return +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  }
}

- (BOOL)emitThermalLogs
{
  if (-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EmitThermalLogs")) {
    return 1;
  }
  else {
    return +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  }
}

- (BOOL)emitConfigLogs
{
  if (-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EmitConfigLogs")) {
    return 1;
  }
  else {
    return +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  }
}

- (BOOL)emitButtonTimingLogs
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"EmitButtonTimingLogs");
}

- (double)EDIDLoggingTimePeriodInSeconds
{
  return result;
}

- (NSString)figaroLoggingURL
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults stringForKey:]( self,  "stringForKey:",  @"FigaroLoggingURL"));
}

- (BOOL)suppressIssueDataExport
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NoIssueDataExport");
}

- (double)bluetoothRemoteKeepAliveTimeInterval
{
  return result;
}

- (double)bluetoothRemoteSleepTimeoutInSeconds
{
  return result;
}

- (NSArray)odeonPromptHistory
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringArrayForKey:](self, "stringArrayForKey:", @"OdeonPromptHistory"));
  double v3 = v2;
  if (!v2) {
    double v2 = &__NSArray0__struct;
  }
  int v4 = v2;

  return v4;
}

- (void)setOdeonPromptHistory:(id)a3
{
}

- (double)odeonDestinationCheckTimeIntervalInSeconds
{
  return result;
}

- (NSArray)eARCPromptHistory
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringArrayForKey:](self, "stringArrayForKey:", @"eARCPromptHistory"));
  double v3 = v2;
  if (!v2) {
    double v2 = &__NSArray0__struct;
  }
  int v4 = v2;

  return v4;
}

- (void)setEARCPromptHistory:(id)a3
{
}

- (BOOL)useLegacyKeyboardMicButtonBehavior
{
  else {
    return 1;
  }
}

- (BOOL)allowSiriOnScreenActions
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"AllowSiriOnScreenActions");
}

- (int64_t)systemAppearance
{
  int64_t result = -[NSUserDefaults integerForKey:](self, "integerForKey:", @"SystemAppearanceKey");
  if ((result & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 1LL;
  }
  return result;
}

- (void)setSystemAppearance:(int64_t)a3
{
}

- (BOOL)isSystemAppearanceSelected
{
  return -[NSUserDefaults integerForKey:](self, "integerForKey:", @"SystemAppearanceKey") != -1;
}

- (double)accumulatedSILOnTimeMinutes
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self, "objectForKey:", @"SILOnTime"));
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = objc_opt_self(&OBJC_CLASS___NSNumber, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v6);

    if ((isKindOfClass & 1) != 0)
    {
      [v3 doubleValue];
      double v4 = v8;
    }
  }

  return v4;
}

- (void)setAccumulatedSILOnTimeMinutes:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[NSUserDefaults setObject:forKey:](self, "setObject:forKey:", v4, @"SILOnTime");
}

- (BOOL)forceEnableSILOnTimeAccumulation
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"SILForceOnTimeAccumulation");
}

- (void)setForceEnableSILOnTimeAccumulation:(BOOL)a3
{
}

- (double)secondsBetweenSILOnTimeDefaultsWrite
{
  return v2;
}

- (void)setSecondsBetweenSILOnTimeDefaultsWrite:(double)a3
{
}

- (double)secondsBetweenSILOnTimePersistentWrite
{
  return v2;
}

- (void)setSecondsBetweenSILOnTimePersistentWrite:(double)a3
{
}

- (BOOL)ignoreLocalHTTPCacheEnabled
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"IgnoreLocalHTTPCache");
}

- (BOOL)forceNight
{
  unsigned int v3 = +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  if (v3) {
    LOBYTE(v3) = -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"ForceNight");
  }
  return v3;
}

- (double)modeSwitchDuration
{
  return result;
}

- (BOOL)modeSwitchDebuggingEnabled
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NativeModeSwitchDebuggingEnabled");
}

- (double)pb_largeGameInstallTimeThreshold
{
  unsigned int v3 = +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  double result = 0.0;
  if (v3) {
    -[NSUserDefaults doubleForKey:](self, "doubleForKey:", @"LargeGameInstallTimeThreshold", 0.0);
  }
  return result;
}

- (BOOL)dialogsEnabled
{
  return !-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NoDialogs");
}

- (BOOL)nowPlayingUIEnabled
{
  return !-[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"NoNowPlayingUI");
}

- (BOOL)pb_multiUserLegacyGameAlertEnabled
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"MultiUserLegacyGameAlertEnabled");
}

- (BOOL)controlCenterTeachableMomentShouldSkip
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"PBControlCenterManagerTeachableMomentSkip");
}

- (void)setControlCenterTeachableMomentShouldSkip:(BOOL)a3
{
}

- (NSDate)controlCenterTeachableMomentFirstExposureTimestamp
{
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"PBControlCenterManagerTeachableMomentFirstExposureTimestamp"));
}

- (void)setControlCenterTeachableMomentFirstExposureTimestamp:(id)a3
{
}

- (NSDictionary)bypassRestrictionsUsingCompanionDeviceUserSettingsDictionary
{
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"RestrictionsBypassUsingCompanionDeviceUserSettings"));
}

- (void)setBypassRestrictionsUsingCompanionDeviceUserSettingsDictionary:(id)a3
{
}

- (NSNumber)customScheduledSleepDuration
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"CustomScheduledSleepDuration"));
}

- (NSNumber)currentVolumeFadeDuration
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"CurrentVolumeFadeDuration"));
}

- (NSNumber)currentVolumeFadeOutDuration
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"CurrentVolumeFadeOutDuration"));
}

- (NSNumber)indeterminateAnimationStartDelay
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"IndeterminateAnimationStartDelay"));
}

- (NSNumber)indeterminateAnimationMass
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"IndeterminateAnimationMass"));
}

- (NSNumber)indeterminateAnimationStiffness
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"IndeterminateAnimationStiffness"));
}

- (NSNumber)indeterminateAnimationDamping
{
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self,  "objectForKey:",  @"IndeterminateAnimationDamping"));
}

- (BOOL)alwaysShowIndeterminateOnButtonPress
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"IndeterminateAlwaysShowsOnButtonPress");
}

- (BOOL)alwaysUpdateVolumeLevel
{
  return -[NSUserDefaults BOOLForKey:](self, "BOOLForKey:", @"IndeterminateAlwaysUpdateVolumeLevel");
}

- (id)_defaultMusicAppBundleIdentifier
{
  if (qword_1004712B8 != -1) {
    dispatch_once(&qword_1004712B8, &stru_1003DB338);
  }
  return (id)qword_1004712B0;
}

- (void)pb_noteMCEffectiveSettingsChanged
{
}

+ (id)pb_appleTVServicesUserDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F7044;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471498 != -1) {
    dispatch_once(&qword_100471498, block);
  }
  return (id)qword_100471490;
}

@end