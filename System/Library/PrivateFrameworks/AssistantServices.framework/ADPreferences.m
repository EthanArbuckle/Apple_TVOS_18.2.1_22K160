@interface ADPreferences
+ (id)sharedPreferences;
- (ADPreferences)init;
- (ADPreferences)initWithInstanceContext:(id)a3;
- (BOOL)_validatePhsManifestData:(id)a3;
- (BOOL)allowExplicitContent;
- (BOOL)deviceWasRedirectedToProduction;
- (BOOL)getAudioSessionActiveDelay:(double *)a3;
- (BOOL)getMaximumOutputVolume:(float *)a3;
- (BOOL)getMinimumOutputVolume:(float *)a3;
- (BOOL)hasSetUpAccountStatusRecordZoneSubscription;
- (BOOL)hasSetUpKeyValueRecordZoneSubscription;
- (BOOL)hasSetUpMultiUserSharedRecordZoneSubscription;
- (BOOL)hasSetUpVoiceTriggerRecordZoneSubscription;
- (BOOL)hasSetVoiceTriggerDefault;
- (BOOL)homeAutomationServerFlowBypassed;
- (BOOL)ignoreLocationWiFiStatus;
- (BOOL)isMultiUserSyncerMeDevice;
- (BOOL)isSearchDataSharingStatusForced;
- (BOOL)isSiriFullUODSupported;
- (BOOL)isSiriNetworkActivated;
- (BOOL)isUsingDefaultLanguageSettings;
- (BOOL)metricsSenderDisabled;
- (BOOL)mirroredMultiUserSharedDataNeedsSync;
- (BOOL)multiUserIsOnboardingDevice;
- (BOOL)multiUserSharedDataNeedsSync;
- (BOOL)multiUserVoiceIdentification;
- (BOOL)proxyConnectionDisabled;
- (BOOL)siriDataSharingHomePodSetupDeviceIsValid;
- (BOOL)statisticsRecordingEnabled;
- (BOOL)voiceTriggerNeedsDataSync;
- (double)myriadDeviceVTEndTimeDistanceThreshold;
- (double)serverTimeoutInterval;
- (id)_cachedKeychainStringForKey:(id)a3;
- (id)_keychainCache;
- (id)_keychainStringForKey:(id)a3;
- (id)accessoriesLanguages;
- (id)accountIdentifiers;
- (id)accountInfoForIdentifier:(id)a3;
- (id)accountStatusServerChangeToken;
- (id)activeAccountIdentifier;
- (id)bootMuxSyncStatus;
- (id)cloudKitSharedDatabaseChangeToken;
- (id)companionIdentifier;
- (id)deviceOwner;
- (id)experimentIdentifierForConfigurationIdentifier:(id)a3;
- (id)experimentsUAFEmitted;
- (id)getExperimentStateForConfigurationIdentifier:(id)a3;
- (id)keyValueServerChangeToken;
- (id)languageCode;
- (id)languageCodeWithFallback:(BOOL)a3;
- (id)languagesForEndpoints;
- (id)lastCompanionRemoteDataFetchDate;
- (id)lastDeviceExperimentCheckDate;
- (id)lastKnownProxyStreamId;
- (id)lastMetricsUploadDate;
- (id)lastMetricsUploadFailureReportedOnDate;
- (id)lastServerExperimentCheckDate;
- (id)lastSyncVerificationDate;
- (id)loggingSharedUserIdentifier;
- (id)multiUserHomeUUIDsForDeletion;
- (id)multiUserPrimaryUser;
- (id)multiUserSetupCompleteTimes;
- (id)multiUserSetupStartTimes;
- (id)multiUserSharedDataServerChangeToken;
- (id)multiUserSharedDataServerChangeTokenForOwner:(id)a3;
- (id)multiUserSharedUsers;
- (id)multiUserSyncerBackupIdentifiersAnchor;
- (id)multiUserSyncerIdentifiersAnchor;
- (id)multiUserSyncerSADAnchor;
- (id)outputVoice;
- (id)outputVoiceWithFallback:(BOOL)a3;
- (id)overrideAudioSessionActiveDelay;
- (id)phsAssetManifest:(BOOL)a3;
- (id)productTypePrefix;
- (id)redirectForServerURLString:(id)a3;
- (id)serverAudioSessionActivationDelay;
- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold;
- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay;
- (id)serverOverride;
- (id)sharedUserIdentifier;
- (id)singleUserCompanionACEHost;
- (id)singleUserMeCard;
- (id)syncMetadata;
- (id)useDeviceAuthenticationVersion;
- (id)voiceTriggerServerChangeToken;
- (int64_t)searchQueriesDataSharingStatus;
- (int64_t)siriDataSharingOptInStatus;
- (unint64_t)lastKnownAnalyticsStoreState;
- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec;
- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec;
- (void)_cacheAndSetKeychainString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)cleanUpCachedAccessoriesLanguages:(id)a3;
- (void)clearLegacyKeyValueServerChangeTokens;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)removeMultiUserHomeUUID:(id)a3;
- (void)setAccessoriesLangauges:(id)a3;
- (void)setAccountInfo:(id)a3 forIdentifier:(id)a4;
- (void)setAccountStatusServerChangeToken:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setBootMuxSyncStatus:(id)a3;
- (void)setCloudKitSharedDatabaseChangeToken:(id)a3;
- (void)setCompanionIdentifier:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceOwner:(id)a3;
- (void)setDeviceWasRedirectedToProduction:(BOOL)a3;
- (void)setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)setExperimentState:(id)a3 forConfigurationIdentifier:(id)a4;
- (void)setExperimentsUAFEmitted:(id)a3;
- (void)setHasATVOrHomePodInHome:(BOOL)a3;
- (void)setHasPairedWatches:(BOOL)a3;
- (void)setHasSetUpAccountStatusRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetUpKeyValueRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetUpVoiceTriggerRecordZoneSubscription:(BOOL)a3;
- (void)setHasSetVoiceTriggerDefault:(BOOL)a3;
- (void)setHasSetupMultiUserSharedRecordZoneSubscription:(BOOL)a3;
- (void)setHomeAutomationServerFlowBypassed:(BOOL)a3;
- (void)setIsMediaEntitySyncDisabledSyncConfig:(BOOL)a3;
- (void)setIsMultiUserSyncerMeDevice:(BOOL)a3;
- (void)setIsSiriFullUODSupported:(BOOL)a3;
- (void)setIsSyncDisabledForFullUoDDevices:(BOOL)a3;
- (void)setIsUsingDefaultLanguageSettings:(BOOL)a3;
- (void)setKeyValueServerChangeToken:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLanguagesForEndpoints:(id)a3;
- (void)setLastCompanionRemoteDataFetchDate:(id)a3;
- (void)setLastDeviceExperimentCheckDate:(id)a3;
- (void)setLastKnownAnalyticsStoreState:(unint64_t)a3;
- (void)setLastKnownProxyStreamId:(id)a3;
- (void)setLastMetricsUploadDate:(id)a3;
- (void)setLastMetricsUploadFailureReportedOnDate:(id)a3;
- (void)setLastServerExperimentCheckDate:(id)a3;
- (void)setLastSyncVerificationDate:(id)a3;
- (void)setMirroredMultiUserSharedDataNeedsSync:(BOOL)a3;
- (void)setMultiUserHomeUUIDsForDeletion:(id)a3;
- (void)setMultiUserIsOnboardingDevice:(BOOL)a3;
- (void)setMultiUserPrimaryUser:(id)a3;
- (void)setMultiUserSetUpCompleteTimes:(id)a3;
- (void)setMultiUserSetUpStartTimes:(id)a3;
- (void)setMultiUserSharedDataNeedsSync:(BOOL)a3;
- (void)setMultiUserSharedDataServerChangeToken:(id)a3;
- (void)setMultiUserSharedDataServerChangeToken:(id)a3 forOwnerName:(id)a4;
- (void)setMultiUserSharedUsers:(id)a3;
- (void)setMultiUserSyncerBackupIdentifiersAnchor:(id)a3;
- (void)setMultiUserSyncerIdentifiersAnchor:(id)a3;
- (void)setMultiUserSyncerSADAnchor:(id)a3;
- (void)setMultiUserVoiceIdentification:(BOOL)a3;
- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPhsAssetManifest:(id)a3 onSharedZone:(BOOL)a4;
- (void)setRedirect:(id)a3 forServerURLString:(id)a4;
- (void)setSearchQueriesDataSharingStatus:(int64_t)a3;
- (void)setServerAudioSessionActivationDelay:(id)a3;
- (void)setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(id)a3;
- (void)setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(id)a3;
- (void)setSharedUserIdentifier:(id)a3 loggingSharedUserIdentifier:(id)a4;
- (void)setShouldDisableServerFallbackDomain:(BOOL)a3;
- (void)setShouldDisableServerFallbackNL:(BOOL)a3;
- (void)setSingleUserCompanionACEHost:(id)a3;
- (void)setSingleUserMeCard:(id)a3;
- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7;
- (void)setSyncMetadata:(id)a3;
- (void)setVoiceTriggerNeedsDataSync:(BOOL)a3;
- (void)setVoiceTriggerServerChangeToken:(id)a3;
- (void)synchronize;
@end

@implementation ADPreferences

- (ADPreferences)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADPreferences;
  v5 = -[ADPreferences init](&v13, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(0LL, v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    if (v4) {
      v10 = (AFInstanceContext *)v4;
    }
    else {
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;
  }

  return v5;
}

- (ADPreferences)init
{
  return -[ADPreferences initWithInstanceContext:](self, "initWithInstanceContext:", 0LL);
}

- (void)synchronize
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100258494;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)accountInfoForIdentifier:(id)a3
{
  uint64_t v3 = kAssistantPreferencesDomain;
  instanceContext = self->_instanceContext;
  id v5 = a3;
  uint64_t v6 = _AFPreferencesValueForKeyWithContext(@"Accounts", v3, instanceContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);

  return v8;
}

- (void)setAccountInfo:(id)a3 forIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = kAssistantPreferencesDomain;
    uint64_t v8 = _AFPreferencesValueForKeyWithContext(@"Accounts", kAssistantPreferencesDomain, self->_instanceContext);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = [v9 mutableCopy];
    v11 = v10;
    if (v10) {
      v12 = (NSMutableDictionary *)v10;
    }
    else {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    objc_super v13 = v12;

    if (v14) {
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, v6);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v6);
    }
    _AFPreferencesSetValueForKeyWithContext(v13, @"Accounts", v7, self->_instanceContext);
  }
}

- (id)activeAccountIdentifier
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Active Account",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)accountIdentifiers
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Accounts", kAssistantPreferencesDomain, self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  return v4;
}

- (void)setActiveAccountIdentifier:(id)a3
{
}

- (BOOL)statisticsRecordingEnabled
{
  return _AFPreferencesBoolValueForKeyWithContext( @"StatisticsEnabled",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (double)serverTimeoutInterval
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Idle Timeout", kAssistantPreferencesDomain, self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }

  else
  {
    double v6 = 20.0;
  }

  return v6;
}

- (id)languageCode
{
  return -[ADPreferences languageCodeWithFallback:](self, "languageCodeWithFallback:", 1LL);
}

- (id)languageCodeWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _languageCodeWithFallback:v3]);

  return v5;
}

- (void)setLanguageCode:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100258484;
  block[3] = &unk_1004FD940;
  block[4] = self;
  id v5 = a3;
  dispatch_async(queue, block);
  _AFPreferencesSetLanguageCodeWithContext(v5, self->_instanceContext);

  -[ADPreferences synchronize](self, "synchronize");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"ADPreferencesLanguageCodeDidChangeNotification" object:self];
}

- (id)outputVoice
{
  return -[ADPreferences outputVoiceWithFallback:](self, "outputVoiceWithFallback:", 1LL);
}

- (id)outputVoiceWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _outputVoiceWithFallback:v3]);

  return v5;
}

- (void)setOutputVoice:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100258474;
  block[3] = &unk_1004FD940;
  block[4] = self;
  id v5 = a3;
  dispatch_async(queue, block);
  _AFPreferencesSetOutputVoiceWithContext(v5, self->_instanceContext);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"ADPreferencesOutputVoiceDidChangeNotification" object:self];
}

- (BOOL)isUsingDefaultLanguageSettings
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Using Default Language Settings",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setIsUsingDefaultLanguageSettings:(BOOL)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    _AFPreferencesSetValueForKeyWithContext( v4,  @"Using Default Language Settings",  kAssistantPreferencesDomain,  self->_instanceContext);
  }

  else
  {
    _AFPreferencesSetValueForKeyWithContext( 0LL,  @"Using Default Language Settings",  kAssistantPreferencesDomain,  self->_instanceContext);
  }

- (void)setCountryCode:(id)a3
{
}

- (BOOL)ignoreLocationWiFiStatus
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Ignore Location WiFi Status",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)serverOverride
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(kAFServerOverride, kAssistantPreferencesDomain, self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = v3;
  }
  else {
    unsigned __int8 v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)productTypePrefix
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Product Type Prefix",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = v3;
  }
  else {
    unsigned __int8 v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)redirectForServerURLString:(id)a3
{
  if (a3)
  {
    uint64_t v3 = kAssistantPreferencesDomain;
    instanceContext = self->_instanceContext;
    id v5 = a3;
    uint64_t v6 = _AFPreferencesValueForKeyWithContext(@"Server Redirect", v3, instanceContext);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      v9 = v7;
    }
    else {
      v9 = 0LL;
    }
    id v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v5]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      objc_super v13 = v11;
    }
    else {
      objc_super v13 = 0LL;
    }
    id v14 = v13;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (void)setRedirect:(id)a3 forServerURLString:(id)a4
{
  if (a4)
  {
    uint64_t v6 = kAssistantPreferencesDomain;
    instanceContext = self->_instanceContext;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = _AFPreferencesValueForKeyWithContext(@"Server Redirect", v6, instanceContext);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v11) & 1) != 0) {
      uint64_t v12 = (NSMutableDictionary *)[v16 mutableCopy];
    }
    else {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    objc_super v13 = v12;
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v9, v8);

    if (-[NSMutableDictionary count](v13, "count")) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }
    v15 = v14;

    _AFPreferencesSetValueForKeyWithContext(v15, @"Server Redirect", v6, self->_instanceContext);
  }

- (id)lastKnownProxyStreamId
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Last Known Proxy Stream Id",  kAssistantPreferencesDomain,  self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setLastKnownProxyStreamId:(id)a3
{
}

- (id)lastSyncVerificationDate
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Last Sync Verification Date",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setLastSyncVerificationDate:(id)a3
{
}

- (id)lastMetricsUploadDate
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Last Metrics Upload Date",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setLastMetricsUploadDate:(id)a3
{
}

- (id)lastMetricsUploadFailureReportedOnDate
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Last Metrics Failure Reported On Date",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setLastMetricsUploadFailureReportedOnDate:(id)a3
{
}

- (id)keyValueServerChangeToken
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Key Value Server Change Token v2",  kAssistantPreferencesDomain,  self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setKeyValueServerChangeToken:(id)a3
{
}

- (void)clearLegacyKeyValueServerChangeTokens
{
}

- (id)accountStatusServerChangeToken
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Account Status Server Change Token",  kAssistantPreferencesDomain,  self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setAccountStatusServerChangeToken:(id)a3
{
}

- (BOOL)hasSetUpKeyValueRecordZoneSubscription
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Has Set Up Key Value Subscription",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setHasSetUpKeyValueRecordZoneSubscription:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has Set Up Key Value Subscription",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)hasSetUpAccountStatusRecordZoneSubscription
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Has Set Up Account Status Subscription",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setHasSetUpAccountStatusRecordZoneSubscription:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has Set Up Account Status Subscription",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)cloudKitSharedDatabaseChangeToken
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"CloudKit Shared Database Change Token",  kAssistantPreferencesDomain,  self->_instanceContext);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setCloudKitSharedDatabaseChangeToken:(id)a3
{
}

- (id)phsAssetManifest:(BOOL)a3
{
  uint64_t v4 = kAssistantPreferencesDomain;
  if (a3) {
    id v5 = &kAFCloudSyncPHSAssetManifestV2;
  }
  else {
    id v5 = &kAFCloudSyncPHSAssetManifest;
  }
  uint64_t v6 = *v5;
  uint64_t v7 = _AFPreferencesValueForKeyWithContext(*v5, kAssistantPreferencesDomain, self->_instanceContext);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (-[ADPreferences _validatePhsManifestData:](self, "_validatePhsManifestData:", v8))
  {
    id v9 = v8;
    id v8 = v9;
  }

  else
  {
    uint64_t v10 = _AFPreferencesSetValueForKeyWithContext(0LL, v6, v4, self->_instanceContext);
    AFInternalPreferencesSynchronize(v10, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }

  uint64_t v12 = v9;

  return v12;
}

- (void)setPhsAssetManifest:(id)a3 onSharedZone:(BOOL)a4
{
  uint64_t v4 = &kAFCloudSyncPHSAssetManifestV2;
  if (!a4) {
    uint64_t v4 = &kAFCloudSyncPHSAssetManifest;
  }
  _AFPreferencesSetValueForKeyWithContext(a3, *v4, kAssistantPreferencesDomain, self->_instanceContext);
}

- (BOOL)_validatePhsManifestData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v11, v5) & 1) == 0) {
            goto LABEL_23;
          }
          id v12 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
          if ((objc_opt_isKindOfClass(v12, v4) & 1) == 0)
          {
LABEL_22:

LABEL_23:
            BOOL v17 = 0;
            goto LABEL_25;
          }

          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          id v12 = v12;
          id v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v21;
            while (2)
            {
              for (j = 0LL; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v21 != v15) {
                  objc_enumerationMutation(v12);
                }
                if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v20 + 1) + 8LL * (void)j), v5) & 1) == 0)
                {

                  goto LABEL_22;
                }
              }

              id v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v19;
        }

        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
        BOOL v17 = 1;
        if (v8) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v17 = 1;
    }

- (BOOL)voiceTriggerNeedsDataSync
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Voice Trigger Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setVoiceTriggerNeedsDataSync:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Voice Trigger Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)voiceTriggerServerChangeToken
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Voice Trigger Server Change Token",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = v3;
  }
  else {
    unsigned __int8 v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setVoiceTriggerServerChangeToken:(id)a3
{
}

- (BOOL)hasSetUpVoiceTriggerRecordZoneSubscription
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Has Set Up Voice Trigger Subscription",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setHasSetUpVoiceTriggerRecordZoneSubscription:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has Set Up Voice Trigger Subscription",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)multiUserSharedDataNeedsSync
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"MultiUser Shared Data Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setMultiUserSharedDataNeedsSync:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"MultiUser Shared Data Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)mirroredMultiUserSharedDataNeedsSync
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"MultiUser Shared Data Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setMirroredMultiUserSharedDataNeedsSync:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"MultiUser Shared Data Needs Sync",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)multiUserSharedDataServerChangeTokenForOwner:(id)a3
{
  if (a3)
  {
    uint64_t v3 = kAssistantPreferencesDomain;
    instanceContext = self->_instanceContext;
    id v5 = a3;
    uint64_t v6 = _AFPreferencesValueForKeyWithContext( @"MultiUser Shared Data Server Change All Tokens",  v3,  instanceContext);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)setMultiUserSharedDataServerChangeToken:(id)a3 forOwnerName:(id)a4
{
  if (a3 && a4)
  {
    uint64_t v6 = kAssistantPreferencesDomain;
    instanceContext = self->_instanceContext;
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = _AFPreferencesValueForKeyWithContext( @"MultiUser Shared Data Server Change All Tokens",  v6,  instanceContext);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v11 mutableCopy];
    id v13 = v12;
    if (v12) {
      id v14 = (NSMutableDictionary *)v12;
    }
    else {
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v15 = v14;

    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v9, v8);
    _AFPreferencesSetValueForKeyWithContext( v15,  @"MultiUser Shared Data Server Change All Tokens",  v6,  self->_instanceContext);
  }

- (BOOL)multiUserVoiceIdentification
{
  uint64_t v2 = _AFBackedUpPreferencesValueForKey(@"MultiUser VoiceIdentification Enabled");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setMultiUserVoiceIdentification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _AFBackedUpPreferencesValueForKey(@"MultiUser VoiceIdentification Enabled");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (!v6 || [v6 BOOLValue] != v3)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[ADPreferences setMultiUserVoiceIdentification:]";
      __int16 v14 = 1024;
      BOOL v15 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s voiceIdentification is %d",  (uint8_t *)&v12,  0x12u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    _AFBackedUpPreferencesSetValueForKey(v9, @"MultiUser VoiceIdentification Enabled");

    AFBackedUpPreferencesSynchronize(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:self];
  }
}

- (BOOL)deviceWasRedirectedToProduction
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Device Redirected",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setDeviceWasRedirectedToProduction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = kAssistantPreferencesDomain;
  uint64_t v6 = _AFPreferencesValueForKeyWithContext( @"Device Redirected",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = [v7 BOOLValue];

  if (v8 != v3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    _AFPreferencesSetValueForKeyWithContext(v9, @"Device Redirected", v5, self->_instanceContext);

    AFInternalPreferencesSynchronize(v10, v11);
  }

- (id)multiUserSharedDataServerChangeToken
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"MultiUser Shared Data Server Change Token",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setMultiUserSharedDataServerChangeToken:(id)a3
{
}

- (BOOL)hasSetUpMultiUserSharedRecordZoneSubscription
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Has Set Up MultiUser Shared Record Subscription",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setHasSetupMultiUserSharedRecordZoneSubscription:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has Set Up MultiUser Shared Record Subscription",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)multiUserPrimaryUser
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Multi User Primary User",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setMultiUserPrimaryUser:(id)a3
{
}

- (id)deviceOwner
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext(@"Device Owner", kAssistantPreferencesDomain, self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setDeviceOwner:(id)a3
{
}

- (id)multiUserSharedUsers
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Multi User Shared Users",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setMultiUserSharedUsers:(id)a3
{
}

- (BOOL)multiUserIsOnboardingDevice
{
  return _AFPreferencesBoolValueForKeyWithContext( @"MultiUser Device Used for Onboarding",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserIsOnboardingDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  _AFPreferencesSetValueForKeyWithContext( v5,  @"MultiUser Device Used for Onboarding",  kAssistantPreferencesDomain,  self->_instanceContext);

  objc_initWeak(&location, self);
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v7 = objc_loadWeakRetained(&location);
    [v6 postNotificationName:@"ADDeviceUsedForHomePodSetupNotification" object:v7];
  }

  objc_destroyWeak(&location);
}

- (id)multiUserSyncerSADAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Multi User Syncer SAD Anchor",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserSyncerSADAnchor:(id)a3
{
}

- (id)multiUserSyncerIdentifiersAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Multi User Syncer Identifiers Anchor",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserSyncerIdentifiersAnchor:(id)a3
{
}

- (id)multiUserSyncerBackupIdentifiersAnchor
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Multi User Syncer Backup Identifiers Anchor",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserSyncerBackupIdentifiersAnchor:(id)a3
{
}

- (BOOL)isMultiUserSyncerMeDevice
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Multi User Syncer Me Device",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setIsMultiUserSyncerMeDevice:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Multi User Syncer Me Device",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserHomeUUIDsForDeletion:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v5 = kAssistantPreferencesDomain;
    uint64_t v6 = _AFPreferencesValueForKeyWithContext( @"Multi User UUID For Deletion",  kAssistantPreferencesDomain,  self->_instanceContext);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
      id v9 = v7;
    }
    else {
      id v9 = 0LL;
    }
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v9 count]) {
      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v9);
    }
    if ([v11 count]) {
      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v11);
    }
    if (-[NSMutableArray count](v10, "count")) {
      _AFPreferencesSetValueForKeyWithContext(v10, @"Multi User UUID For Deletion", v5, self->_instanceContext);
    }
  }

  else
  {
    _AFPreferencesSetValueForKeyWithContext( 0LL,  @"Multi User UUID For Deletion",  kAssistantPreferencesDomain,  self->_instanceContext);
  }
}

- (void)removeMultiUserHomeUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = kAssistantPreferencesDomain;
    uint64_t v6 = _AFPreferencesValueForKeyWithContext( @"Multi User UUID For Deletion",  kAssistantPreferencesDomain,  self->_instanceContext);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v9 = [v7 mutableCopy];
      if ([v9 containsObject:v11])
      {
        [v9 removeObject:v11];
        if ([v9 count]) {
          id v10 = v9;
        }
        else {
          id v10 = 0LL;
        }
        _AFPreferencesSetValueForKeyWithContext(v10, @"Multi User UUID For Deletion", v5, self->_instanceContext);
      }
    }

    id v4 = v11;
  }
}

- (void)setAccessoriesLangauges:(id)a3
{
  id v3 = a3;
  if (AFSupportsRemoraHost())
  {
    _AFPreferencesSetValueForKey(v3, @"Accessories Languages");
  }

  else
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[ADPreferences setAccessoriesLangauges:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Only Remora hosts can set accessories languages",  (uint8_t *)&v5,  0xCu);
    }
  }
}

- (id)accessoriesLanguages
{
  if (AFSupportsRemoraHost(self, a2))
  {
    uint64_t v2 = _AFPreferencesValueForKey(@"Accessories Languages");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      int v5 = v3;
    }
    else {
      int v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    }
    uint64_t v8 = v5;

    return v8;
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[ADPreferences accessoriesLanguages]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Only Remora hosts can get accessories languages",  (uint8_t *)&v9,  0xCu);
    }

    return 0LL;
  }

- (void)cleanUpCachedAccessoriesLanguages:(id)a3
{
  id v4 = a3;
  if (AFSupportsRemoraHost(v4, v5))
  {
    if (v4)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences accessoriesLanguages](self, "accessoriesLanguages"));
      id v7 = [v6 mutableCopy];

      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSMutableSet);
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
      id v10 = -[NSMutableSet initWithArray:](v8, "initWithArray:", v9);

      id v19 = v4;
      -[NSMutableSet minusSet:](v10, "minusSet:", v4);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v11 = v10;
      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
            BOOL v17 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              __int128 v25 = "-[ADPreferences cleanUpCachedAccessoriesLanguages:]";
              __int16 v26 = 2112;
              uint64_t v27 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Accessory (%@) cleaned up language cached",  buf,  0x16u);
            }

            [v7 removeObjectForKey:v16];
          }

          id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
        }

        while (v13);
      }

      -[ADPreferences setAccessoriesLangauges:](self, "setAccessoriesLangauges:", v7);
      id v4 = v19;
    }
  }

  else
  {
    v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v25 = "-[ADPreferences cleanUpCachedAccessoriesLanguages:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Only Remora hosts can modify accessories languages",  buf,  0xCu);
    }
  }
}

- (id)languagesForEndpoints
{
  if (AFSupportsRemoraHost(self, a2))
  {
    uint64_t v2 = _AFPreferencesValueForKey(@"Languages for Endpoints");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v8 = v5;

    return v8;
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[ADPreferences languagesForEndpoints]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Only Remora hosts can get the languages for each endpoint",  (uint8_t *)&v9,  0xCu);
    }

    return 0LL;
  }

- (void)setLanguagesForEndpoints:(id)a3
{
  id v4 = a3;
  if (AFSupportsRemoraHost(v4, v5)
    && (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
  {
    _AFPreferencesSetValueForKey(v4, @"Languages for Endpoints");
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADPreferences setLanguagesForEndpoints:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Only Remora hosts can set languages for each endpoint",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (id)multiUserHomeUUIDsForDeletion
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Multi User UUID For Deletion",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)sharedUserIdentifier
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_10025833C;
  id v10 = sub_10025834C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100258434;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)loggingSharedUserIdentifier
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_10025833C;
  id v10 = sub_10025834C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002583F4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setSharedUserIdentifier:(id)a3 loggingSharedUserIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  -[ADPreferences _cacheAndSetKeychainString:forKey:completion:]( self,  "_cacheAndSetKeychainString:forKey:completion:",  v6,  @"User Identifier",  0LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100258394;
  v8[3] = &unk_1004FAF58;
  objc_copyWeak(&v9, &location);
  -[ADPreferences _cacheAndSetKeychainString:forKey:completion:]( self,  "_cacheAndSetKeychainString:forKey:completion:",  v7,  @"Logging User Identifier",  v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)companionIdentifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10025833C;
  id v10 = sub_10025834C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100258354;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setCompanionIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002582DC;
  v5[3] = &unk_1004FAF58;
  objc_copyWeak(&v6, &location);
  -[ADPreferences _cacheAndSetKeychainString:forKey:completion:]( self,  "_cacheAndSetKeychainString:forKey:completion:",  v4,  @"Companion Identifier",  v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)lastCompanionRemoteDataFetchDate
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Last Companion Remote Data Fetch Date",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setLastCompanionRemoteDataFetchDate:(id)a3
{
}

- (int64_t)siriDataSharingOptInStatus
{
  return _AFPreferencesSiriDataSharingOptInStatusWithContext(self->_instanceContext, a2);
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  uint64_t v14 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 136316163;
    BOOL v17 = "-[ADPreferences setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    __int16 v18 = 2049;
    int64_t v19 = a3;
    __int16 v20 = 2048;
    int64_t v21 = a5;
    __int16 v22 = 2113;
    id v23 = v12;
    __int16 v24 = 1024;
    BOOL v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Setting Siri Data Sharing OptIn status=%{private}ld from source=%ld with reason=%{private}@, and propagating to home accessories=%d",  (uint8_t *)&v16,  0x30u);
  }

  _AFPreferencesSetSiriDataSharingOptInStatusWithContext(a3, a5, v12, self->_instanceContext);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 postNotificationName:@"ADPreferencesSiriDataSharingOptInStatusDidChangeNotification" object:self];
  [v15 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
  if (v13) {
    v13[2](v13, 0LL);
  }
}

- (BOOL)siriDataSharingHomePodSetupDeviceIsValid
{
  return _AFPreferencesSiriDataSharingHomePodSetupDeviceIsValidWithContext(self->_instanceContext, a2);
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3
{
}

- (id)experimentIdentifierForConfigurationIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([@"Experiment Identifier" stringByAppendingString:a3]);
  uint64_t v4 = _AFPreferencesValueForKey(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)setExperimentIdentifier:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([@"Experiment Identifier" stringByAppendingString:a4]);
  _AFPreferencesSetValueForKey(v5, v6);
}

- (id)getExperimentStateForConfigurationIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([@"Experiment State" stringByAppendingString:a3]);
  uint64_t v4 = _AFPreferencesValueForKey(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)setExperimentState:(id)a3 forConfigurationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([@"Experiment State" stringByAppendingString:a4]);
  _AFPreferencesSetValueForKey(v5, v6);
}

- (BOOL)metricsSenderDisabled
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Metrics Sender Disabled",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)proxyConnectionDisabled
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Proxy Connection Disabled",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)lastKnownAnalyticsStoreState
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Last Known Analytics Store State",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = [v3 unsignedIntegerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

- (void)setLastKnownAnalyticsStoreState:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Last Known Analytics Store State",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)getMaximumOutputVolume:(float *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    uint64_t v4 = _AFPreferencesValueForKeyWithContext( @"Maximum Siri Output Volume",  kAssistantPreferencesDomain,  self->_instanceContext);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if ((isKindOfClass & 1) != 0)
    {
      [v5 floatValue];
      *(_DWORD *)a3 = v8;
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)getMinimumOutputVolume:(float *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    uint64_t v4 = _AFPreferencesValueForKeyWithContext( @"Minimum Siri Output Volume",  kAssistantPreferencesDomain,  self->_instanceContext);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if ((isKindOfClass & 1) != 0)
    {
      [v5 floatValue];
      *(_DWORD *)a3 = v8;
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)getAudioSessionActiveDelay:(double *)a3
{
  if (a3)
  {
    *a3 = 0.0;
    uint64_t v4 = _AFPreferencesValueForKeyWithContext( @"Audio Session Active Delay",  kAssistantPreferencesDomain,  self->_instanceContext);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);
    if ((isKindOfClass & 1) != 0)
    {
      [v5 doubleValue];
      *(void *)a3 = v8;
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)overrideAudioSessionActiveDelay
{
  uint64_t v2 = _AFPreferencesValueForKey(@"Audio Session Active Delay");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (id)serverAudioSessionActivationDelay
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Server Audio Session Activation Delay",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setServerAudioSessionActivationDelay:(id)a3
{
}

- (id)serverMediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Server Media Playback Volume Threshold for Audio Session Activation Delay",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(id)a3
{
}

- (id)serverAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Server Audio Session Activation Delay Above Media Playback Volume Threshold",  kAssistantPreferencesDomain,  self->_instanceContext);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

- (void)setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(id)a3
{
}

- (BOOL)allowExplicitContent
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v3 = [v2 allowExplicitContent];

  return v3;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  kAFAllowExplicitContent,  kAssistantSupportPreferenceDomain,  self->_instanceContext);
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3
{
}

- (int64_t)searchQueriesDataSharingStatus
{
  return _AFPreferencesSearchQueriesDataSharingStatusWithContext(self->_instanceContext, a2);
}

- (BOOL)isSearchDataSharingStatusForced
{
  return _AFPreferencesSearchQueriesDataSharingStatusIsForced(self->_instanceContext, a2);
}

- (id)_cachedKeychainStringForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences _keychainCache](self, "_keychainCache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  if (v6 == v7) {
    goto LABEL_7;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ADPreferences _keychainStringForKey:](self, "_keychainStringForKey:", v4));
    if (v10)
    {
      id v9 = (id)v10;
      [v5 setValue:v10 forKey:v4];
      goto LABEL_8;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v5 setValue:v11 forKey:v4];

LABEL_7:
    id v9 = 0LL;
    goto LABEL_8;
  }

  id v9 = v6;
LABEL_8:

  return v9;
}

- (id)_keychainStringForKey:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v5 = AFKeychainValueForAccountAndKey(AFSiriGlobalKeychainAccountIdentifier, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6) {
    id v7 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v6, 4LL);
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)_cacheAndSetKeychainString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002581A4;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (id)_keychainCache
{
  keychainCache = self->_keychainCache;
  if (!keychainCache)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = self->_keychainCache;
    self->_keychainCache = v4;

    keychainCache = self->_keychainCache;
  }

  return keychainCache;
}

- (void)setSingleUserMeCard:(id)a3
{
  if (a3) {
    _AFPreferencesSetValueForKeyWithContext( a3,  @"Local MeCard",  kAssistantPreferencesDomain,  self->_instanceContext);
  }
}

- (id)singleUserMeCard
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Local MeCard",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setSingleUserCompanionACEHost:(id)a3
{
  if (a3) {
    _AFPreferencesSetValueForKeyWithContext( a3,  @"Companion ACE Host",  kAssistantPreferencesDomain,  self->_instanceContext);
  }
}

- (id)singleUserCompanionACEHost
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Companion ACE Host",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (id)multiUserSetupStartTimes
{
  return (id)_AFPreferencesValueForKeyWithContext( @"MultiUser Setup Start Times",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserSetUpStartTimes:(id)a3
{
}

- (id)multiUserSetupCompleteTimes
{
  return (id)_AFPreferencesValueForKeyWithContext( @"MultiUser Setup Complete Times",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setMultiUserSetUpCompleteTimes:(id)a3
{
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v4 setMyriadDeviceVTEndTimeDistanceThreshold:a3];
}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v2 myriadDeviceVTEndTimeDistanceThreshold];
  double v4 = v3;

  return v4;
}

- (id)useDeviceAuthenticationVersion
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Use Device Authentication Version",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setLastServerExperimentCheckDate:(id)a3
{
}

- (id)lastServerExperimentCheckDate
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Last server experiment check date",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setLastDeviceExperimentCheckDate:(id)a3
{
}

- (id)lastDeviceExperimentCheckDate
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Last client experiment check date",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setExperimentsUAFEmitted:(id)a3
{
}

- (id)experimentsUAFEmitted
{
  return (id)_AFPreferencesValueForKeyWithContext( @"UAF AssetSet Experiments emitted",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setBootMuxSyncStatus:(id)a3
{
}

- (id)bootMuxSyncStatus
{
  return (id)_AFPreferencesValueForKeyWithContext( @"MUX Sync Status",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)hasSetVoiceTriggerDefault
{
  uint64_t v2 = _AFBackedUpPreferencesValueForKey(@"Has Set Voice Trigger Default");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  double v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setHasSetVoiceTriggerDefault:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = _AFBackedUpPreferencesValueForKey(@"Has Set Voice Trigger Default");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (!v9 || (v5 = [v9 BOOLValue] == v3, id v6 = v9, !v5))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    _AFBackedUpPreferencesSetValueForKey(v7, @"Has Set Voice Trigger Default");

    AFBackedUpPreferencesSynchronize(v8);
    id v6 = v9;
  }
}

- (void)setSyncMetadata:(id)a3
{
}

- (id)syncMetadata
{
  return (id)_AFPreferencesValueForKeyWithContext( @"Sync Metadata",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)homeAutomationServerFlowBypassed
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"Home Automation Server Flow Bypassed",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setHomeAutomationServerFlowBypassed:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Home Automation Server Flow Bypassed",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setHasPairedWatches:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has paired watches",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setHasATVOrHomePodInHome:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Has ATV or HomePods in the home",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setIsMediaEntitySyncDisabledSyncConfig:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Is Trial config set to disable media entity sync",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setIsSyncDisabledForFullUoDDevices:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Is Trial config set to disable sync for FullUoD en_US devices",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)isSiriFullUODSupported
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Is Siri full UOD Supported",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setIsSiriFullUODSupported:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Is Siri full UOD Supported",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setShouldDisableServerFallbackNL:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Is Trial config set to disable NL Server Fallback for NL",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (void)setShouldDisableServerFallbackDomain:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  _AFPreferencesSetValueForKeyWithContext( v4,  @"Is Trial config set to disable NL Server Fallback for Domain",  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (BOOL)isSiriNetworkActivated
{
  return _AFPreferencesBoolValueForKeyWithContext( @"Is SiriNetwork activated",  0LL,  kAssistantPreferencesDomain,  self->_instanceContext);
}

- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerStartDelayMillisec
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"AnalyticsIdentifiersConsistencyTimerStartDelayMillisec",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = [v3 unsignedLongValue];
  }
  else {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

- (unint64_t)siriAnalyticsIdentifiersConsistencyTimerIntervalMillisec
{
  uint64_t v2 = _AFPreferencesValueForKeyWithContext( @"AnalyticsIdentifiersConsistencyTimerIntervalMillisec",  kAssistantPreferencesDomain,  self->_instanceContext);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = [v3 unsignedLongValue];
  }
  else {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

- (void)dumpAssistantStateChunk:(id)a3
{
  uint64_t v4 = (void (**)(id, NSMutableDictionary *))a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences sharedUserIdentifier](self, "sharedUserIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v5,  @"sharedUserIdentifier");

  v4[2](v4, v6);
}

- (void).cxx_destruct
{
}

+ (id)sharedPreferences
{
  if (qword_100578270 != -1) {
    dispatch_once(&qword_100578270, &stru_1004F7A98);
  }
  return (id)qword_100578278;
}

@end