@interface UAUserActivityDefaults
+ (id)sharedDefaults;
- (BOOL)BOOLValueForKey:(id)a3 default:(BOOL)a4;
- (BOOL)activityAdvertisingAllowed;
- (BOOL)activityBTLESharingEnabled;
- (BOOL)activityContinuationAllowed;
- (BOOL)activityReceivingAllowed;
- (BOOL)clipboardSharingEnabled;
- (BOOL)debugCrossoverAllActivities;
- (BOOL)debugEnablePinging;
- (BOOL)debugEnablePrefetch;
- (BOOL)debugForceNewPayloadEncoder;
- (BOOL)debugForceOldPayloadEncoder;
- (BOOL)debugIgnoreAppsUsedForDevelopment;
- (BOOL)debugReadvertiseImmediately;
- (BOOL)dontSendActivityTitle;
- (BOOL)enableAutomaticRendevousPairing;
- (BOOL)enableHandoffInPowerSaverMode;
- (BOOL)enableNetworkControlListener;
- (BOOL)enableSharingFramework;
- (BOOL)ignoreLostDevice;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)localPasteboardRefection;
- (BOOL)loggingAdvertiserEnabled;
- (BOOL)multiHandoffEnabled;
- (BOOL)shouldIgnoreBluetoothDisabled;
- (NSUserDefaults)userDefaults;
- (UAUserActivityDefaults)init;
- (double)activePayloadUpdateInterval;
- (double)advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities;
- (double)bestAppSuggestionSupressionIntervalForUnchangingItem;
- (double)cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires;
- (double)cornerActionItemMaximumTimeForBTLEItemToLive;
- (double)cornerActionItemSupressionInterval;
- (double)cornerActionItemTimeout;
- (double)debugAdditionalPayloadReceiveTimeInterval;
- (double)debugValidatePayloadFetchTimeInterval;
- (double)debugValidateRetryPayloadFetchFailureInterval;
- (double)deviceLockDelayBeforeRemovingHandoffAdvertisement;
- (double)deviceLockDelayBeforeRemovingPasteboardAdvertisement;
- (double)handoffPayloadRequestTimout;
- (double)intervalToAskClientWithUnsynchronizedDocumentsToUpdate;
- (double)lastActiveItemRemovalDelay;
- (double)localPasteboardAvalibilityClearedTimeout;
- (double)localPasteboardAvalibilityTimeout;
- (double)maximumAdvertisementsTimeInterval;
- (double)maximumTimeoutAfterAdvertisingEndsThatActivityCanBeResumed;
- (double)maximumTimeoutToWaitForClientProcessToUpdateActivityInformation;
- (double)minimumIntervalBetweenAdvertisements;
- (double)minimumTimeForAnAdvertisementToLive;
- (double)minimumTimeToLiveAfterRemovingAdvertisement;
- (double)pasteboardHideUIDelay;
- (double)pasteboardPasteRequestTimeout;
- (double)pasteboardShowUIDelay;
- (double)pasteboardStreamWatchdogTimeout;
- (double)pasteboardTypeRequestTimeout;
- (double)pasteboardUIMinimumDurration;
- (double)pasteboardUITimeRemainingDelay;
- (double)payloadFetchResponseDelay;
- (double)receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued;
- (double)recentlyEligibleItemInterval;
- (double)remotePasteboardAvailableTimeout;
- (double)screenDimDelayBeforeRemovingAdvertisements;
- (double)screenDimDelayBeforeRemovingPasteboardAdvertisement;
- (double)screenSaverDelayBeforeRemovingPasteboardAdvertisement;
- (double)screenSaverDelayToRemovingAdvertisements;
- (double)systemIdleDelayBeforeRemovingAdvertisements;
- (double)timeIntervalForKey:(id)a3 default:(double)a4;
- (double)userIdleInterval;
- (double)userIdleRemovalDelay;
- (id)cornerActionItemDefaults;
- (id)defaults:(BOOL)a3;
- (id)rendevousPairingType;
- (id)statusString;
- (int)networkControlListenerPort;
- (int64_t)activityPayloadWarningSizeInBytes;
- (int64_t)debugUserActivityTimeOffset;
- (int64_t)debugValidateSampleResponseMaximumActivityPayloadSizeInBytes;
- (int64_t)debugValidateSampleResponseMinimumActivityPayloadSizeInBytes;
- (int64_t)integerValueForKey:(id)a3 default:(int64_t)a4;
- (int64_t)maximumActivityPayloadSizeInBytes;
- (int64_t)maximumAdvertisementsPerTimeInterval;
- (int64_t)pasteboardEmbeddedPayloadSizeLimitInBytes;
- (void)setDefault:(id)a3 value:(id)a4;
- (void)setEnableSharingFramework:(BOOL)a3;
- (void)setLocalPasteboardReflection:(BOOL)a3;
@end

@implementation UAUserActivityDefaults

+ (id)sharedDefaults
{
  if (qword_1000DE348 != -1) {
    dispatch_once(&qword_1000DE348, &stru_1000BD960);
  }
  return (id)qword_1000DE340;
}

- (UAUserActivityDefaults)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UAUserActivityDefaults;
  v2 = -[UAUserActivityDefaults init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    v5 = v2->_userDefaults;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](v2, "cornerActionItemDefaults"));
    -[NSUserDefaults registerDefaults:](v5, "registerDefaults:", v6);
  }

  return v2;
}

- (id)cornerActionItemDefaults
{
  return &off_1000C4698;
}

- (BOOL)BOOLValueForKey:(id)a3 default:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
    a4 = [v9 BOOLForKey:v6];
  }

  return a4;
}

- (int64_t)integerValueForKey:(id)a3 default:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
    a4 = (int64_t)[v9 integerForKey:v6];
  }

  return a4;
}

- (double)timeIntervalForKey:(id)a3 default:(double)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
    [v9 doubleForKey:v6];
    a4 = v10;
  }

  return a4;
}

- (BOOL)isBatterySaverModeEnabled
{
  if (qword_1000DE350 != -1) {
    dispatch_once(&qword_1000DE350, &stru_1000BD980);
  }
  BOOL result = dword_1000DE358;
  if (dword_1000DE358)
  {
    uint64_t state64 = 0LL;
    if (notify_get_state(dword_1000DE358, &state64)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = state64 == 0;
    }
    return !v3;
  }

  return result;
}

- (BOOL)activityAdvertisingAllowed
{
  if (!byte_1000DE35C)
  {
    int v3 = MKBDeviceUnlockedSinceBoot(self);
    byte_1000DE35C = v3 != 0;
    if (!v3) {
      return 0;
    }
  }

  if (!-[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"ActivityAdvertisingAllowed",  1LL)
    || !-[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"EnableHandoffInPowerSaverMode",  1LL)
    && -[UAUserActivityDefaults isBatterySaverModeEnabled](self, "isBatterySaverModeEnabled"))
  {
    return 0;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v4 = [v5 isActivityContinuationAllowed];

  return v4;
}

- (BOOL)activityReceivingAllowed
{
  if (!byte_1000DE35C)
  {
    int v3 = MKBDeviceUnlockedSinceBoot(self);
    byte_1000DE35C = v3 != 0;
    if (!v3) {
      return 0;
    }
  }

  if (!-[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"ActivityReceivingAllowed",  1LL)
    || !-[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"EnableHandoffInPowerSaverMode",  1LL)
    && -[UAUserActivityDefaults isBatterySaverModeEnabled](self, "isBatterySaverModeEnabled"))
  {
    return 0;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v4 = [v5 isActivityContinuationAllowed];

  return v4;
}

- (BOOL)activityContinuationAllowed
{
  if (!-[UAUserActivityDefaults activityAdvertisingAllowed](self, "activityAdvertisingAllowed")
    || !-[UAUserActivityDefaults activityReceivingAllowed](self, "activityReceivingAllowed"))
  {
    return 0;
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v4 = [v3 isActivityContinuationAllowed];

  return v4;
}

- (BOOL)clipboardSharingEnabled
{
  BOOL v3 = -[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"ClipboardSharingEnabled",  1LL);
  if (v3) {
    LOBYTE(v3) = -[UAUserActivityDefaults activityContinuationAllowed](self, "activityContinuationAllowed");
  }
  return v3;
}

- (BOOL)multiHandoffEnabled
{
  return -[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"MultiHandoffEnabled",  0LL);
}

- (BOOL)enableHandoffInPowerSaverMode
{
  return -[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"EnableHandoffInPowerSaverMode",  1LL);
}

- (BOOL)activityBTLESharingEnabled
{
  return -[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"ActivityBTLESharingEnabled",  1LL);
}

- (BOOL)loggingAdvertiserEnabled
{
  return -[UAUserActivityDefaults BOOLValueForKey:default:]( self,  "BOOLValueForKey:default:",  @"LoggingAdvertiserEnabled",  1LL);
}

- (double)userIdleInterval
{
  return result;
}

- (double)userIdleRemovalDelay
{
  return result;
}

- (double)deviceLockDelayBeforeRemovingHandoffAdvertisement
{
  return result;
}

- (double)deviceLockDelayBeforeRemovingPasteboardAdvertisement
{
  return result;
}

- (double)minimumTimeForAnAdvertisementToLive
{
  return result;
}

- (double)minimumTimeToLiveAfterRemovingAdvertisement
{
  return result;
}

- (double)recentlyEligibleItemInterval
{
  return result;
}

- (double)screenSaverDelayToRemovingAdvertisements
{
  return result;
}

- (double)screenSaverDelayBeforeRemovingPasteboardAdvertisement
{
  return result;
}

- (double)screenDimDelayBeforeRemovingAdvertisements
{
  return result;
}

- (double)screenDimDelayBeforeRemovingPasteboardAdvertisement
{
  return result;
}

- (double)systemIdleDelayBeforeRemovingAdvertisements
{
  return result;
}

- (double)maximumTimeoutAfterAdvertisingEndsThatActivityCanBeResumed
{
  return result;
}

- (double)cornerActionItemSupressionInterval
{
  return result;
}

- (double)bestAppSuggestionSupressionIntervalForUnchangingItem
{
  return result;
}

- (double)advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities
{
  return result;
}

- (double)intervalToAskClientWithUnsynchronizedDocumentsToUpdate
{
  return result;
}

- (double)cornerActionItemTimeout
{
  return result;
}

- (double)cornerActionItemAdditionalTimeToLiveAfterValidIntervalExpires
{
  return result;
}

- (double)cornerActionItemMaximumTimeForBTLEItemToLive
{
  return result;
}

- (double)receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued
{
  return result;
}

- (double)activePayloadUpdateInterval
{
  return result;
}

- (double)maximumTimeoutToWaitForClientProcessToUpdateActivityInformation
{
  return result;
}

- (int64_t)maximumActivityPayloadSizeInBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"MaximumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (BOOL)enableNetworkControlListener
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableNetworkControlListener"];

  return v3;
}

- (BOOL)enableAutomaticRendevousPairing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableAutomaticRendevousPairing"];

  return v3;
}

- (id)rendevousPairingType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"RendevousPairingType"]);

  return v3;
}

- (int)networkControlListenerPort
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  int v3 = [v2 integerForKey:@"NetworkControlListenerPort"];

  return v3;
}

- (int64_t)activityPayloadWarningSizeInBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"ActivityPayloadWarningSizeInBytes"];

  return (int64_t)v3;
}

- (double)minimumIntervalBetweenAdvertisements
{
  return result;
}

- (int64_t)maximumAdvertisementsPerTimeInterval
{
  return -[UAUserActivityDefaults integerValueForKey:default:]( self,  "integerValueForKey:default:",  @"MaximumAdvertisementsPerTimeInterval",  5LL);
}

- (double)maximumAdvertisementsTimeInterval
{
  return result;
}

- (double)debugValidatePayloadFetchTimeInterval
{
  return result;
}

- (double)debugAdditionalPayloadReceiveTimeInterval
{
  return result;
}

- (double)debugValidateRetryPayloadFetchFailureInterval
{
  return result;
}

- (int64_t)debugValidateSampleResponseMinimumActivityPayloadSizeInBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"DEBUGValidateSampleResponseMinimumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (int64_t)debugValidateSampleResponseMaximumActivityPayloadSizeInBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"DEBUGValidateSampleResponseMaximumActivityPayloadSizeInBytes"];

  return (int64_t)v3;
}

- (int64_t)debugUserActivityTimeOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"DEBUGUserActivityTimeOffset"];

  return (int64_t)v3;
}

- (BOOL)debugForceNewPayloadEncoder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGForceNewPayloadEncoder"];

  return v3;
}

- (BOOL)debugForceOldPayloadEncoder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGForceOldPayloadEncoder"];

  return v3;
}

- (BOOL)dontSendActivityTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGDontSendActivityTitle"];

  return v3;
}

- (BOOL)debugReadvertiseImmediately
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGReadvertiseImmediately"];

  return v3;
}

- (BOOL)debugEnablePinging
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGEnablePinging"];

  return v3;
}

- (BOOL)debugEnablePrefetch
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGEnablePrefetch"];

  return v3;
}

- (BOOL)debugCrossoverAllActivities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGCrossoverAllActivities"];

  return v3;
}

- (BOOL)debugIgnoreAppsUsedForDevelopment
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"DEBUGIgnoreAppsUsedForDevelopment"];

  return v3;
}

- (BOOL)enableSharingFramework
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"EnableSharingFramework"];

  return v3;
}

- (void)setEnableSharingFramework:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v4 setBool:v3 forKey:@"EnableSharingFramework"];
}

- (double)localPasteboardAvalibilityTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardLocalAdvertisementTime"];

  return v3;
}

- (double)localPasteboardAvalibilityClearedTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardLocalClearedAdvertisementTime"];

  return v3;
}

- (double)remotePasteboardAvailableTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  double v3 = (double)(uint64_t)[v2 integerForKey:@"UASharedPboardRemoteAvailableTimeout"];

  return v3;
}

- (BOOL)localPasteboardRefection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"UASharedPboardLocalReflection"];

  return v3;
}

- (void)setLocalPasteboardReflection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v4 setBool:v3 forKey:@"UASharedPboardLocalReflection"];
}

- (int64_t)pasteboardEmbeddedPayloadSizeLimitInBytes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  id v3 = [v2 integerForKey:@"UASharedPboardEmbeddedPayloadSizeLimitInBytes"];

  return (int64_t)v3;
}

- (double)pasteboardUITimeRemainingDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"TimeRemainingDelay"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardShowUIDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"UASharedPboardShowUIDelayInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardUIMinimumDurration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"UASharedPboardUIMinimumDurrationInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardHideUIDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"UASharedPboardHideUIDelayInSec"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardTypeRequestTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"TypeRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardPasteRequestTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"PasteRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)pasteboardStreamWatchdogTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"PasteboardStreamWatchdogTimeout"];
  double v4 = v3;

  return v4;
}

- (double)handoffPayloadRequestTimout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"HandoffRequestTimeout"];
  double v4 = v3;

  return v4;
}

- (double)payloadFetchResponseDelay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  [v2 doubleForKey:@"PayloadFetchResponseDelay"];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldIgnoreBluetoothDisabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"IgnoreBluetoothDisabled"];

  return v3;
}

- (BOOL)ignoreLostDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"IgnoreLostDevice"];

  return v3;
}

- (double)lastActiveItemRemovalDelay
{
  return result;
}

- (id)statusString
{
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryRepresentation](self->_userDefaults, "dictionaryRepresentation"));
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](self, "cornerActionItemDefaults"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"compare:"]);

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v29 valueForKey:v7]);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](self, "cornerActionItemDefaults"));
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:v7]);
        unsigned __int8 v11 = [v8 isEqual:v10];

        v12 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
        id v13 = sub_10005BF18(v12);
        if ((v11 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          -[NSMutableString appendFormat:](v25, "appendFormat:", @" %@=%@", v7, v14);
        }

        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](self, "cornerActionItemDefaults"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v7]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
          id v18 = sub_10005BF18(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          -[NSMutableString appendFormat:](v26, "appendFormat:", @" %@=%@ (%@)", v7, v14, v19);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v5);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
  [v24 appendFormat:@"\nDefaults: (domain=%@) %@\n", v21, v26];

  id v22 = [v24 copy];
  return v22;
}

- (id)defaults:(BOOL)a3
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](self, "cornerActionItemDefaults"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (a3) {
          goto LABEL_8;
        }
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults cornerActionItemDefaults](self, "cornerActionItemDefaults"));
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v9]);
        unsigned __int8 v14 = [v11 isEqual:v13];

        if ((v14 & 1) == 0)
        {
LABEL_8:
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v9]);
          [v20 setValue:v16 forKey:v9];
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v6);
  }

  id v17 = [v20 copy];
  return v17;
}

- (void)setDefault:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
    [v7 setObject:v6 forKey:v8];
LABEL_6:

    goto LABEL_7;
  }

  if (v8)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UAUserActivityDefaults userDefaults](self, "userDefaults"));
    [v7 removeObjectForKey:v8];
    goto LABEL_6;
  }

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end