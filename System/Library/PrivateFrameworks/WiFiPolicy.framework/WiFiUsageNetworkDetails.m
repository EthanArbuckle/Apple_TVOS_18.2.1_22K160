@interface WiFiUsageNetworkDetails
- (BOOL)addedFromApp;
- (BOOL)addedFromUI;
- (BOOL)addedViaATJ;
- (BOOL)addedViaRecommendation;
- (BOOL)addedViaSharing;
- (BOOL)addedViaSync;
- (BOOL)autoJoinDisabled;
- (BOOL)autoLoginDisabled;
- (BOOL)canExposeImsi;
- (BOOL)controlCenterDisabled;
- (BOOL)hasAmbiguousSsid;
- (BOOL)hasCustomNetworkSettings;
- (BOOL)hasEnterpriseSecurity;
- (BOOL)hasLegacyEnterpriseSecurity;
- (BOOL)hasNoMap;
- (BOOL)hasWapi;
- (BOOL)hasWeakSecurity;
- (BOOL)hasWep;
- (BOOL)hasWpa3;
- (BOOL)isAdhoc;
- (BOOL)isAppBased;
- (BOOL)isAtNonPrimaryHMHome;
- (BOOL)isAtPrimaryHMHome;
- (BOOL)isAutoHotspot;
- (BOOL)isAutoJoined;
- (BOOL)isBlueAtlas;
- (BOOL)isCarPlay;
- (BOOL)isCarrierBased;
- (BOOL)isCurrentBssOnChannel:(id)a3;
- (BOOL)isHidden;
- (BOOL)isHome;
- (BOOL)isInstantHotspot;
- (BOOL)isInternal;
- (BOOL)isKnown;
- (BOOL)isLowQuality;
- (BOOL)isManaged;
- (BOOL)isMesh;
- (BOOL)isMetered;
- (BOOL)isMoving;
- (BOOL)isOpen;
- (BOOL)isPasspoint;
- (BOOL)isPersonalHotspot;
- (BOOL)isPublic;
- (BOOL)isStandalone6E;
- (BOOL)isWalletBased;
- (BOOL)isWidelyDeployed;
- (BOOL)isWork;
- (BOOL)lowDataModeEnabled;
- (BOOL)privateMacDisabledByProfile;
- (BOOL)privateMacFeatureToggled;
- (BOOL)privateMacNetworkTypeHome;
- (BOOL)privateMacUnderClassification;
- (BOOL)privateRelayEnabled;
- (BOOL)requiresIdentity;
- (BOOL)requiresOtp;
- (BOOL)requiresPassword;
- (BOOL)requiresUsername;
- (NSDate)lastJoinDate;
- (NSMutableArray)downloadSpeedResults;
- (NSString)bssEnvironment;
- (NSString)disable6eMode;
- (NSString)networkName;
- (NSString)privateMacType;
- (NSString)privateRelayBlockedReason;
- (WiFiUsageBssDetails)connectedBss;
- (WiFiUsageNetworkDetails)initWithNetworkName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)eventDictionary:(BOOL)a3;
- (id)redactedDescription;
- (int64_t)joinFailCountInLastDay;
- (int64_t)joinFailCountInLastMonth;
- (int64_t)joinFailCountInLastWeek;
- (int64_t)joinSuccessCountInLastDay;
- (int64_t)joinSuccessCountInLastMonth;
- (int64_t)joinSuccessCountInLastWeek;
- (int64_t)networkScore;
- (int64_t)usageChargingDayTimeInLastDay;
- (int64_t)usageChargingDayTimeInLastMonth;
- (int64_t)usageChargingDayTimeInLastWeek;
- (int64_t)usageChargingNightTimeInLastDay;
- (int64_t)usageChargingNightTimeInLastMonth;
- (int64_t)usageChargingNightTimeInLastWeek;
- (int64_t)usageDayTimeInLastDay;
- (int64_t)usageDayTimeInLastMonth;
- (int64_t)usageDayTimeInLastWeek;
- (int64_t)usageNightTimeInLastDay;
- (int64_t)usageNightTimeInLastMonth;
- (int64_t)usageNightTimeInLastWeek;
- (int64_t)usageRank;
- (int64_t)usageStationaryDayTimeInLastDay;
- (int64_t)usageStationaryDayTimeInLastMonth;
- (int64_t)usageStationaryDayTimeInLastWeek;
- (int64_t)usageStationaryNightTimeInLastDay;
- (int64_t)usageStationaryNightTimeInLastMonth;
- (int64_t)usageStationaryNightTimeInLastWeek;
- (unint64_t)advertisedCountryCode;
- (unint64_t)appliedCountryCode;
- (unint64_t)captiveStatus;
- (unint64_t)colocatedNetworkCount;
- (unint64_t)colocatedScopeCount;
- (unint64_t)localeSource;
- (unint64_t)switchedAwayCount;
- (unint64_t)switchedToCount;
- (void)addDownloadSpeed:(double)a3;
- (void)setAddedFromApp:(BOOL)a3;
- (void)setAddedFromUI:(BOOL)a3;
- (void)setAddedViaATJ:(BOOL)a3;
- (void)setAddedViaRecommendation:(BOOL)a3;
- (void)setAddedViaSharing:(BOOL)a3;
- (void)setAddedViaSync:(BOOL)a3;
- (void)setAdvertisedCountryCode:(unint64_t)a3;
- (void)setAppliedCountryCode:(unint64_t)a3;
- (void)setAutoJoinDisabled:(BOOL)a3;
- (void)setAutoLoginDisabled:(BOOL)a3;
- (void)setBssEnvironment:(id)a3;
- (void)setCanExposeImsi:(BOOL)a3;
- (void)setCaptiveStatus:(unint64_t)a3;
- (void)setColocatedNetworkCount:(unint64_t)a3;
- (void)setColocatedScopeCount:(unint64_t)a3;
- (void)setConnectedBss:(id)a3;
- (void)setControlCenterDisabled:(BOOL)a3;
- (void)setDisable6eMode:(id)a3;
- (void)setDownloadSpeedResults:(id)a3;
- (void)setHasAmbiguousSsid:(BOOL)a3;
- (void)setHasCustomNetworkSettings:(BOOL)a3;
- (void)setHasEnterpriseSecurity:(BOOL)a3;
- (void)setHasLegacyEnterpriseSecurity:(BOOL)a3;
- (void)setHasNoMap:(BOOL)a3;
- (void)setHasWapi:(BOOL)a3;
- (void)setHasWeakSecurity:(BOOL)a3;
- (void)setHasWep:(BOOL)a3;
- (void)setHasWpa3:(BOOL)a3;
- (void)setIsAdhoc:(BOOL)a3;
- (void)setIsAppBased:(BOOL)a3;
- (void)setIsAtNonPrimaryHMHome:(BOOL)a3;
- (void)setIsAtPrimaryHMHome:(BOOL)a3;
- (void)setIsAutoHotspot:(BOOL)a3;
- (void)setIsAutoJoined:(BOOL)a3;
- (void)setIsBlueAtlas:(BOOL)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setIsCarrierBased:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsHome:(BOOL)a3;
- (void)setIsInstantHotspot:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsKnown:(BOOL)a3;
- (void)setIsLowQuality:(BOOL)a3;
- (void)setIsManaged:(BOOL)a3;
- (void)setIsMesh:(BOOL)a3;
- (void)setIsMetered:(BOOL)a3;
- (void)setIsMoving:(BOOL)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setIsPasspoint:(BOOL)a3;
- (void)setIsPersonalHotspot:(BOOL)a3;
- (void)setIsPublic:(BOOL)a3;
- (void)setIsStandalone6E:(BOOL)a3;
- (void)setIsWalletBased:(BOOL)a3;
- (void)setIsWidelyDeployed:(BOOL)a3;
- (void)setIsWork:(BOOL)a3;
- (void)setJoinFailCountInLastDay:(int64_t)a3;
- (void)setJoinFailCountInLastMonth:(int64_t)a3;
- (void)setJoinFailCountInLastWeek:(int64_t)a3;
- (void)setJoinSuccessCountInLastDay:(int64_t)a3;
- (void)setJoinSuccessCountInLastMonth:(int64_t)a3;
- (void)setJoinSuccessCountInLastWeek:(int64_t)a3;
- (void)setLastJoinDate:(id)a3;
- (void)setLocaleSource:(unint64_t)a3;
- (void)setLowDataModeEnabled:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkScore:(int64_t)a3;
- (void)setPrivateMacDisabledByProfile:(BOOL)a3;
- (void)setPrivateMacFeatureToggled:(BOOL)a3;
- (void)setPrivateMacNetworkTypeHome:(BOOL)a3;
- (void)setPrivateMacType:(id)a3;
- (void)setPrivateMacUnderClassification:(BOOL)a3;
- (void)setPrivateRelayBlockedReason:(id)a3;
- (void)setPrivateRelayEnabled:(BOOL)a3;
- (void)setRequiresIdentity:(BOOL)a3;
- (void)setRequiresOtp:(BOOL)a3;
- (void)setRequiresPassword:(BOOL)a3;
- (void)setRequiresUsername:(BOOL)a3;
- (void)setSwitchedAwayCount:(unint64_t)a3;
- (void)setSwitchedToCount:(unint64_t)a3;
- (void)setUsageChargingDayTimeInLastDay:(int64_t)a3;
- (void)setUsageChargingDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageChargingDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastDay:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastWeek:(int64_t)a3;
- (void)setUsageDayTimeInLastDay:(int64_t)a3;
- (void)setUsageDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageNightTimeInLastDay:(int64_t)a3;
- (void)setUsageNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageNightTimeInLastWeek:(int64_t)a3;
- (void)setUsageRank:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastDay:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastDay:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastWeek:(int64_t)a3;
@end

@implementation WiFiUsageNetworkDetails

- (WiFiUsageNetworkDetails)initWithNetworkName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageNetworkDetails;
  id v3 = a3;
  v4 = -[WiFiUsageNetworkDetails init](&v8, sel_init);
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  networkName = v4->_networkName;
  v4->_networkName = (NSString *)v5;

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"NetworkName:%@ BSSDetails:%@", self->_networkName, self->_connectedBss];
}

- (id)redactedDescription
{
  v2 = (void *)NSString;
  -[WiFiUsageBssDetails redactedDescription](self->_connectedBss, "redactedDescription");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"NetworkName:REDACTED BSSDetails:%@", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = objc_alloc((Class)objc_opt_class());
  -[WiFiUsageNetworkDetails networkName](self, "networkName");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[v4 initWithNetworkName:v5];

  [v6 setIsKnown:self->_isKnown];
  [v6 setIsOpen:self->_isOpen];
  [v6 setIsOpen:self->_isOpen];
  [v6 setCaptiveStatus:self->_captiveStatus];
  [v6 setIsPublic:self->_isPublic];
  [v6 setIsLowQuality:self->_isLowQuality];
  [v6 setIsHome:self->_isHome];
  [v6 setIsWork:self->_isWork];
  [v6 setIsInternal:self->_isInternal];
  [v6 setIsManaged:self->_isManaged];
  [v6 setIsCarrierBased:self->_isCarrierBased];
  [v6 setIsCarPlay:self->_isCarPlay];
  [v6 setIsAppBased:self->_isAppBased];
  [v6 setIsWalletBased:self->_isWalletBased];
  [v6 setIsPersonalHotspot:self->_isPersonalHotspot];
  [v6 setIsMoving:self->_isMoving];
  [v6 setIsMesh:self->_isMesh];
  [v6 setIsWidelyDeployed:self->_isWidelyDeployed];
  [v6 setIsAutoJoined:self->_isAutoJoined];
  [v6 setIsAdhoc:self->_isAdhoc];
  [v6 setIsHidden:self->_isHidden];
  [v6 setIsPasspoint:self->_isPasspoint];
  [v6 setIsMetered:self->_isMetered];
  [v6 setIsBlueAtlas:self->_isBlueAtlas];
  [v6 setHasWapi:self->_hasWapi];
  [v6 setHasWeakSecurity:self->_hasWeakSecurity];
  [v6 setHasWpa3:self->_hasWpa3];
  [v6 setHasWep:self->_hasWep];
  [v6 setHasEnterpriseSecurity:self->_hasEnterpriseSecurity];
  [v6 setHasLegacyEnterpriseSecurity:self->_hasLegacyEnterpriseSecurity];
  [v6 setHasNoMap:self->_hasNoMap];
  [v6 setHasAmbiguousSsid:self->_hasAmbiguousSsid];
  [v6 setHasCustomNetworkSettings:self->_hasCustomNetworkSettings];
  [v6 setRequiresUsername:self->_requiresUsername];
  [v6 setRequiresPassword:self->_requiresPassword];
  [v6 setRequiresIdentity:self->_requiresIdentity];
  [v6 setRequiresOtp:self->_requiresOtp];
  [v6 setCanExposeImsi:self->_canExposeImsi];
  [v6 setAddedFromUI:self->_addedFromUI];
  [v6 setAddedFromApp:self->_addedFromApp];
  [v6 setAddedViaSync:self->_addedViaSync];
  [v6 setAddedViaATJ:self->_addedViaATJ];
  [v6 setAddedViaRecommendation:self->_addedViaRecommendation];
  [v6 setAddedViaSharing:self->_addedViaSharing];
  [v6 setUsageRank:self->_usageRank];
  [v6 setAutoJoinDisabled:self->_autoJoinDisabled];
  [v6 setAutoLoginDisabled:self->_autoLoginDisabled];
  [v6 setLowDataModeEnabled:self->_lowDataModeEnabled];
  [v6 setControlCenterDisabled:self->_controlCenterDisabled];
  [v6 setPrivateRelayEnabled:self->_privateRelayEnabled];
  [v6 setPrivateRelayBlockedReason:self->_privateRelayBlockedReason];
  [v6 setAdvertisedCountryCode:self->_advertisedCountryCode];
  [v6 setAppliedCountryCode:self->_appliedCountryCode];
  [v6 setLocaleSource:self->_localeSource];
  [v6 setBssEnvironment:self->_bssEnvironment];
  [v6 setLastJoinDate:self->_lastJoinDate];
  [v6 setConnectedBss:self->_connectedBss];
  [v6 setColocatedNetworkCount:self->_colocatedNetworkCount];
  [v6 setSwitchedToCount:self->_switchedToCount];
  [v6 setSwitchedAwayCount:self->_switchedAwayCount];
  [v6 setNetworkScore:self->_networkScore];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v7 = self->_downloadSpeedResults;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "doubleValue", (void)v13);
        objc_msgSend(v6, "addDownloadSpeed:");
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v9);
  }

  [v6 setPrivateMacType:self->_privateMacType];
  [v6 setPrivateMacFeatureToggled:self->_privateMacFeatureToggled];
  [v6 setPrivateMacUnderClassification:self->_privateMacUnderClassification];
  [v6 setPrivateMacDisabledByProfile:self->_privateMacDisabledByProfile];
  [v6 setPrivateMacNetworkTypeHome:self->_privateMacNetworkTypeHome];
  [v6 setUsageDayTimeInLastDay:self->_usageDayTimeInLastDay];
  [v6 setUsageDayTimeInLastWeek:self->_usageDayTimeInLastWeek];
  [v6 setUsageDayTimeInLastMonth:self->_usageDayTimeInLastMonth];
  [v6 setUsageNightTimeInLastDay:self->_usageNightTimeInLastDay];
  [v6 setUsageNightTimeInLastWeek:self->_usageNightTimeInLastWeek];
  [v6 setUsageNightTimeInLastMonth:self->_usageNightTimeInLastMonth];
  [v6 setUsageStationaryDayTimeInLastDay:self->_usageStationaryDayTimeInLastDay];
  [v6 setUsageStationaryDayTimeInLastWeek:self->_usageStationaryDayTimeInLastWeek];
  [v6 setUsageStationaryDayTimeInLastMonth:self->_usageStationaryDayTimeInLastMonth];
  [v6 setUsageStationaryNightTimeInLastDay:self->_usageStationaryNightTimeInLastDay];
  [v6 setUsageStationaryNightTimeInLastWeek:self->_usageStationaryNightTimeInLastWeek];
  [v6 setUsageStationaryNightTimeInLastMonth:self->_usageStationaryNightTimeInLastMonth];
  [v6 setUsageChargingDayTimeInLastDay:self->_usageChargingDayTimeInLastDay];
  [v6 setUsageChargingDayTimeInLastWeek:self->_usageChargingDayTimeInLastWeek];
  [v6 setUsageChargingDayTimeInLastMonth:self->_usageChargingDayTimeInLastMonth];
  [v6 setUsageChargingNightTimeInLastDay:self->_usageChargingNightTimeInLastDay];
  [v6 setUsageChargingNightTimeInLastWeek:self->_usageChargingNightTimeInLastWeek];
  [v6 setUsageChargingNightTimeInLastMonth:self->_usageChargingNightTimeInLastMonth];
  [v6 setIsAtPrimaryHMHome:self->_isAtPrimaryHMHome];
  [v6 setIsAtNonPrimaryHMHome:self->_isAtNonPrimaryHMHome];
  [v6 setJoinSuccessCountInLastDay:self->_joinSuccessCountInLastDay];
  [v6 setJoinSuccessCountInLastWeek:self->_joinSuccessCountInLastWeek];
  [v6 setJoinSuccessCountInLastMonth:self->_joinSuccessCountInLastMonth];
  [v6 setJoinFailCountInLastDay:self->_joinFailCountInLastDay];
  [v6 setJoinFailCountInLastWeek:self->_joinFailCountInLastWeek];
  [v6 setJoinFailCountInLastMonth:self->_joinFailCountInLastMonth];
  [v6 setColocatedScopeCount:self->_colocatedScopeCount];
  [v6 setDisable6eMode:self->_disable6eMode];
  [v6 setIsStandalone6E:self->_isStandalone6E];
  return v6;
}

- (void)addDownloadSpeed:(double)a3
{
  downloadSpeedResults = self->_downloadSpeedResults;
  if (!downloadSpeedResults)
  {
    [MEMORY[0x189603FA8] array];
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_downloadSpeedResults;
    self->_downloadSpeedResults = v6;

    downloadSpeedResults = self->_downloadSpeedResults;
  }

  [MEMORY[0x189607968] numberWithInt:(int)a3];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](downloadSpeedResults, "addObject:", v8);
}

- (BOOL)isCurrentBssOnChannel:(id)a3
{
  id v4 = a3;
  -[WiFiUsageNetworkDetails connectedBss](self, "connectedBss");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = [v5 isOnChannel:v4];

  return v6;
}

- (id)eventDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  v97[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[WiFiUsagePrivacyFilter localTimestamp:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "localTimestamp:",  self->_lastJoinDate);
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v6 forKeyedSubscript:@"NetworkJoinDate"];

LABEL_9:
    [v5 setObject:self->_networkName forKeyedSubscript:@"NetworkName"];
    goto LABEL_10;
  }

  if ((self->_isPublic || self->_isCarrierBased)
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  1LL)
    || +[WiFiUsagePrivacyFilter isInternalInstall](&OBJC_CLASS___WiFiUsagePrivacyFilter, "isInternalInstall")
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  3LL))
  {
    goto LABEL_9;
  }

- (BOOL)isKnown
{
  return self->_isKnown;
}

- (void)setIsKnown:(BOOL)a3
{
  self->_isKnown = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (void)setIsPublic:(BOOL)a3
{
  self->_isPublic = a3;
}

- (BOOL)isLowQuality
{
  return self->_isLowQuality;
}

- (void)setIsLowQuality:(BOOL)a3
{
  self->_isLowQuality = a3;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (void)setIsHome:(BOOL)a3
{
  self->_isHome = a3;
}

- (BOOL)isWork
{
  return self->_isWork;
}

- (void)setIsWork:(BOOL)a3
{
  self->_isWork = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

- (BOOL)isCarrierBased
{
  return self->_isCarrierBased;
}

- (void)setIsCarrierBased:(BOOL)a3
{
  self->_isCarrierBased = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isAppBased
{
  return self->_isAppBased;
}

- (void)setIsAppBased:(BOOL)a3
{
  self->_isAppBased = a3;
}

- (BOOL)isWalletBased
{
  return self->_isWalletBased;
}

- (void)setIsWalletBased:(BOOL)a3
{
  self->_isWalletBased = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_isPersonalHotspot;
}

- (void)setIsPersonalHotspot:(BOOL)a3
{
  self->_isPersonalHotspot = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

- (BOOL)isMesh
{
  return self->_isMesh;
}

- (void)setIsMesh:(BOOL)a3
{
  self->_isMesh = a3;
}

- (BOOL)isWidelyDeployed
{
  return self->_isWidelyDeployed;
}

- (void)setIsWidelyDeployed:(BOOL)a3
{
  self->_isWidelyDeployed = a3;
}

- (BOOL)isAutoJoined
{
  return self->_isAutoJoined;
}

- (void)setIsAutoJoined:(BOOL)a3
{
  self->_isAutoJoined = a3;
}

- (BOOL)isAdhoc
{
  return self->_isAdhoc;
}

- (void)setIsAdhoc:(BOOL)a3
{
  self->_isAdhoc = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (BOOL)isMetered
{
  return self->_isMetered;
}

- (void)setIsMetered:(BOOL)a3
{
  self->_isMetered = a3;
}

- (BOOL)isBlueAtlas
{
  return self->_isBlueAtlas;
}

- (void)setIsBlueAtlas:(BOOL)a3
{
  self->_isBlueAtlas = a3;
}

- (BOOL)isStandalone6E
{
  return self->_isStandalone6E;
}

- (void)setIsStandalone6E:(BOOL)a3
{
  self->_isStandalone6E = a3;
}

- (BOOL)hasWapi
{
  return self->_hasWapi;
}

- (void)setHasWapi:(BOOL)a3
{
  self->_hasWapi = a3;
}

- (BOOL)hasWeakSecurity
{
  return self->_hasWeakSecurity;
}

- (void)setHasWeakSecurity:(BOOL)a3
{
  self->_hasWeakSecurity = a3;
}

- (BOOL)hasWpa3
{
  return self->_hasWpa3;
}

- (void)setHasWpa3:(BOOL)a3
{
  self->_hasWpa3 = a3;
}

- (BOOL)hasWep
{
  return self->_hasWep;
}

- (void)setHasWep:(BOOL)a3
{
  self->_hasWep = a3;
}

- (BOOL)hasEnterpriseSecurity
{
  return self->_hasEnterpriseSecurity;
}

- (void)setHasEnterpriseSecurity:(BOOL)a3
{
  self->_hasEnterpriseSecurity = a3;
}

- (BOOL)hasLegacyEnterpriseSecurity
{
  return self->_hasLegacyEnterpriseSecurity;
}

- (void)setHasLegacyEnterpriseSecurity:(BOOL)a3
{
  self->_hasLegacyEnterpriseSecurity = a3;
}

- (BOOL)hasNoMap
{
  return self->_hasNoMap;
}

- (void)setHasNoMap:(BOOL)a3
{
  self->_hasNoMap = a3;
}

- (BOOL)hasAmbiguousSsid
{
  return self->_hasAmbiguousSsid;
}

- (void)setHasAmbiguousSsid:(BOOL)a3
{
  self->_hasAmbiguousSsid = a3;
}

- (BOOL)hasCustomNetworkSettings
{
  return self->_hasCustomNetworkSettings;
}

- (void)setHasCustomNetworkSettings:(BOOL)a3
{
  self->_hasCustomNetworkSettings = a3;
}

- (BOOL)requiresUsername
{
  return self->_requiresUsername;
}

- (void)setRequiresUsername:(BOOL)a3
{
  self->_requiresUsername = a3;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (BOOL)requiresIdentity
{
  return self->_requiresIdentity;
}

- (void)setRequiresIdentity:(BOOL)a3
{
  self->_requiresIdentity = a3;
}

- (BOOL)requiresOtp
{
  return self->_requiresOtp;
}

- (void)setRequiresOtp:(BOOL)a3
{
  self->_requiresOtp = a3;
}

- (BOOL)canExposeImsi
{
  return self->_canExposeImsi;
}

- (void)setCanExposeImsi:(BOOL)a3
{
  self->_canExposeImsi = a3;
}

- (BOOL)addedFromUI
{
  return self->_addedFromUI;
}

- (void)setAddedFromUI:(BOOL)a3
{
  self->_addedFromUI = a3;
}

- (BOOL)addedFromApp
{
  return self->_addedFromApp;
}

- (void)setAddedFromApp:(BOOL)a3
{
  self->_addedFromApp = a3;
}

- (BOOL)addedViaSync
{
  return self->_addedViaSync;
}

- (void)setAddedViaSync:(BOOL)a3
{
  self->_addedViaSync = a3;
}

- (BOOL)addedViaATJ
{
  return self->_addedViaATJ;
}

- (void)setAddedViaATJ:(BOOL)a3
{
  self->_addedViaATJ = a3;
}

- (BOOL)addedViaRecommendation
{
  return self->_addedViaRecommendation;
}

- (void)setAddedViaRecommendation:(BOOL)a3
{
  self->_addedViaRecommendation = a3;
}

- (BOOL)addedViaSharing
{
  return self->_addedViaSharing;
}

- (void)setAddedViaSharing:(BOOL)a3
{
  self->_addedViaSharing = a3;
}

- (int64_t)usageRank
{
  return self->_usageRank;
}

- (void)setUsageRank:(int64_t)a3
{
  self->_usageRank = a3;
}

- (BOOL)autoJoinDisabled
{
  return self->_autoJoinDisabled;
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  self->_autoJoinDisabled = a3;
}

- (BOOL)autoLoginDisabled
{
  return self->_autoLoginDisabled;
}

- (void)setAutoLoginDisabled:(BOOL)a3
{
  self->_autoLoginDisabled = a3;
}

- (BOOL)lowDataModeEnabled
{
  return self->_lowDataModeEnabled;
}

- (void)setLowDataModeEnabled:(BOOL)a3
{
  self->_lowDataModeEnabled = a3;
}

- (BOOL)controlCenterDisabled
{
  return self->_controlCenterDisabled;
}

- (void)setControlCenterDisabled:(BOOL)a3
{
  self->_controlCenterDisabled = a3;
}

- (BOOL)privateRelayEnabled
{
  return self->_privateRelayEnabled;
}

- (void)setPrivateRelayEnabled:(BOOL)a3
{
  self->_privateRelayEnabled = a3;
}

- (NSString)privateRelayBlockedReason
{
  return self->_privateRelayBlockedReason;
}

- (void)setPrivateRelayBlockedReason:(id)a3
{
}

- (unint64_t)advertisedCountryCode
{
  return self->_advertisedCountryCode;
}

- (void)setAdvertisedCountryCode:(unint64_t)a3
{
  self->_advertisedCountryCode = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (unint64_t)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(unint64_t)a3
{
  self->_localeSource = a3;
}

- (NSString)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (unint64_t)colocatedNetworkCount
{
  return self->_colocatedNetworkCount;
}

- (void)setColocatedNetworkCount:(unint64_t)a3
{
  self->_colocatedNetworkCount = a3;
}

- (WiFiUsageBssDetails)connectedBss
{
  return self->_connectedBss;
}

- (void)setConnectedBss:(id)a3
{
}

- (unint64_t)switchedAwayCount
{
  return self->_switchedAwayCount;
}

- (void)setSwitchedAwayCount:(unint64_t)a3
{
  self->_switchedAwayCount = a3;
}

- (unint64_t)switchedToCount
{
  return self->_switchedToCount;
}

- (void)setSwitchedToCount:(unint64_t)a3
{
  self->_switchedToCount = a3;
}

- (int64_t)networkScore
{
  return self->_networkScore;
}

- (void)setNetworkScore:(int64_t)a3
{
  self->_networkScore = a3;
}

- (NSMutableArray)downloadSpeedResults
{
  return self->_downloadSpeedResults;
}

- (void)setDownloadSpeedResults:(id)a3
{
}

- (NSDate)lastJoinDate
{
  return self->_lastJoinDate;
}

- (void)setLastJoinDate:(id)a3
{
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
}

- (BOOL)privateMacFeatureToggled
{
  return self->_privateMacFeatureToggled;
}

- (void)setPrivateMacFeatureToggled:(BOOL)a3
{
  self->_privateMacFeatureToggled = a3;
}

- (BOOL)privateMacUnderClassification
{
  return self->_privateMacUnderClassification;
}

- (void)setPrivateMacUnderClassification:(BOOL)a3
{
  self->_privateMacUnderClassification = a3;
}

- (BOOL)privateMacDisabledByProfile
{
  return self->_privateMacDisabledByProfile;
}

- (void)setPrivateMacDisabledByProfile:(BOOL)a3
{
  self->_privateMacDisabledByProfile = a3;
}

- (BOOL)privateMacNetworkTypeHome
{
  return self->_privateMacNetworkTypeHome;
}

- (void)setPrivateMacNetworkTypeHome:(BOOL)a3
{
  self->_privateMacNetworkTypeHome = a3;
}

- (unint64_t)captiveStatus
{
  return self->_captiveStatus;
}

- (void)setCaptiveStatus:(unint64_t)a3
{
  self->_captiveStatus = a3;
}

- (int64_t)usageDayTimeInLastDay
{
  return self->_usageDayTimeInLastDay;
}

- (void)setUsageDayTimeInLastDay:(int64_t)a3
{
  self->_usageDayTimeInLastDay = a3;
}

- (int64_t)usageDayTimeInLastWeek
{
  return self->_usageDayTimeInLastWeek;
}

- (void)setUsageDayTimeInLastWeek:(int64_t)a3
{
  self->_usageDayTimeInLastWeek = a3;
}

- (int64_t)usageDayTimeInLastMonth
{
  return self->_usageDayTimeInLastMonth;
}

- (void)setUsageDayTimeInLastMonth:(int64_t)a3
{
  self->_usageDayTimeInLastMonth = a3;
}

- (int64_t)usageNightTimeInLastDay
{
  return self->_usageNightTimeInLastDay;
}

- (void)setUsageNightTimeInLastDay:(int64_t)a3
{
  self->_usageNightTimeInLastDay = a3;
}

- (int64_t)usageNightTimeInLastWeek
{
  return self->_usageNightTimeInLastWeek;
}

- (void)setUsageNightTimeInLastWeek:(int64_t)a3
{
  self->_usageNightTimeInLastWeek = a3;
}

- (int64_t)usageNightTimeInLastMonth
{
  return self->_usageNightTimeInLastMonth;
}

- (void)setUsageNightTimeInLastMonth:(int64_t)a3
{
  self->_usageNightTimeInLastMonth = a3;
}

- (int64_t)usageStationaryDayTimeInLastDay
{
  return self->_usageStationaryDayTimeInLastDay;
}

- (void)setUsageStationaryDayTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastDay = a3;
}

- (int64_t)usageStationaryDayTimeInLastWeek
{
  return self->_usageStationaryDayTimeInLastWeek;
}

- (void)setUsageStationaryDayTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastWeek = a3;
}

- (int64_t)usageStationaryDayTimeInLastMonth
{
  return self->_usageStationaryDayTimeInLastMonth;
}

- (void)setUsageStationaryDayTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastMonth = a3;
}

- (int64_t)usageStationaryNightTimeInLastDay
{
  return self->_usageStationaryNightTimeInLastDay;
}

- (void)setUsageStationaryNightTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastDay = a3;
}

- (int64_t)usageStationaryNightTimeInLastWeek
{
  return self->_usageStationaryNightTimeInLastWeek;
}

- (void)setUsageStationaryNightTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastWeek = a3;
}

- (int64_t)usageStationaryNightTimeInLastMonth
{
  return self->_usageStationaryNightTimeInLastMonth;
}

- (void)setUsageStationaryNightTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastMonth = a3;
}

- (int64_t)usageChargingDayTimeInLastDay
{
  return self->_usageChargingDayTimeInLastDay;
}

- (void)setUsageChargingDayTimeInLastDay:(int64_t)a3
{
  self->_usageChargingDayTimeInLastDay = a3;
}

- (int64_t)usageChargingDayTimeInLastWeek
{
  return self->_usageChargingDayTimeInLastWeek;
}

- (void)setUsageChargingDayTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingDayTimeInLastWeek = a3;
}

- (int64_t)usageChargingDayTimeInLastMonth
{
  return self->_usageChargingDayTimeInLastMonth;
}

- (void)setUsageChargingDayTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingDayTimeInLastMonth = a3;
}

- (int64_t)usageChargingNightTimeInLastDay
{
  return self->_usageChargingNightTimeInLastDay;
}

- (void)setUsageChargingNightTimeInLastDay:(int64_t)a3
{
  self->_usageChargingNightTimeInLastDay = a3;
}

- (int64_t)usageChargingNightTimeInLastWeek
{
  return self->_usageChargingNightTimeInLastWeek;
}

- (void)setUsageChargingNightTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingNightTimeInLastWeek = a3;
}

- (int64_t)usageChargingNightTimeInLastMonth
{
  return self->_usageChargingNightTimeInLastMonth;
}

- (void)setUsageChargingNightTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingNightTimeInLastMonth = a3;
}

- (BOOL)isAtPrimaryHMHome
{
  return self->_isAtPrimaryHMHome;
}

- (void)setIsAtPrimaryHMHome:(BOOL)a3
{
  self->_isAtPrimaryHMHome = a3;
}

- (BOOL)isAtNonPrimaryHMHome
{
  return self->_isAtNonPrimaryHMHome;
}

- (void)setIsAtNonPrimaryHMHome:(BOOL)a3
{
  self->_isAtNonPrimaryHMHome = a3;
}

- (int64_t)joinSuccessCountInLastDay
{
  return self->_joinSuccessCountInLastDay;
}

- (void)setJoinSuccessCountInLastDay:(int64_t)a3
{
  self->_joinSuccessCountInLastDay = a3;
}

- (int64_t)joinSuccessCountInLastWeek
{
  return self->_joinSuccessCountInLastWeek;
}

- (void)setJoinSuccessCountInLastWeek:(int64_t)a3
{
  self->_joinSuccessCountInLastWeek = a3;
}

- (int64_t)joinSuccessCountInLastMonth
{
  return self->_joinSuccessCountInLastMonth;
}

- (void)setJoinSuccessCountInLastMonth:(int64_t)a3
{
  self->_joinSuccessCountInLastMonth = a3;
}

- (int64_t)joinFailCountInLastDay
{
  return self->_joinFailCountInLastDay;
}

- (void)setJoinFailCountInLastDay:(int64_t)a3
{
  self->_joinFailCountInLastDay = a3;
}

- (int64_t)joinFailCountInLastWeek
{
  return self->_joinFailCountInLastWeek;
}

- (void)setJoinFailCountInLastWeek:(int64_t)a3
{
  self->_joinFailCountInLastWeek = a3;
}

- (int64_t)joinFailCountInLastMonth
{
  return self->_joinFailCountInLastMonth;
}

- (void)setJoinFailCountInLastMonth:(int64_t)a3
{
  self->_joinFailCountInLastMonth = a3;
}

- (unint64_t)colocatedScopeCount
{
  return self->_colocatedScopeCount;
}

- (void)setColocatedScopeCount:(unint64_t)a3
{
  self->_colocatedScopeCount = a3;
}

- (NSString)disable6eMode
{
  return self->_disable6eMode;
}

- (void)setDisable6eMode:(id)a3
{
  self->_disable6eMode = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end