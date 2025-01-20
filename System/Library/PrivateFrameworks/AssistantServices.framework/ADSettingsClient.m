@interface ADSettingsClient
- (ADSettingsClient)initWithXPCConnection:(id)a3;
- (id)_localSpeechRecognizer;
- (id)_localizedBodyWithFormat:(id)a3 forTriggerPhrase:(id)a4 andName:(id)a5;
- (id)_serviceDelegate;
- (id)_serviceDelegateWithErrorHandler:(id)a3;
- (void)_clearSyncNeededForKey:(id)a3;
- (void)_createMockServerIfNeededAndSetActiveWithCompletion:(id)a3;
- (void)_executeBlockWithCurrentlyRoutedDevice:(id)a3 withCompletion:(id)a4;
- (void)_fetchPeerData:(id)a3;
- (void)_isInactiveDeviceSyncDisabled:(id)a3;
- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3;
- (void)_killDaemon;
- (void)_resetSessionsAtNextRequestBoundary;
- (void)_runServiceMaintenance;
- (void)_saveAccount:(id)a3 setActive:(BOOL)a4;
- (void)_setSyncNeededForReason:(id)a3;
- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5;
- (void)_shutdownSessionIfIdle;
- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 reply:(id)a6;
- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)adSyncVerificationPartialResult:(id)a3;
- (void)adSyncVerificationServerReport:(id)a3;
- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9;
- (void)areSiriSAEAssetsAvailable:(id)a3;
- (void)areSiriUODAssetsAvailable:(id)a3;
- (void)availableLanguagesInTheHome:(id)a3;
- (void)barrierWithReply:(id)a3;
- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled;
- (void)clearAnnounceNotificationsInCarPlayType;
- (void)clearMuxSyncStatusWithCompletion:(id)a3;
- (void)configOverrides:(id)a3;
- (void)connectionDisconnected;
- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6;
- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3;
- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4;
- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3;
- (void)dismissUI;
- (void)downloadMuxUserDataWithCompletion:(id)a3;
- (void)dumpAssistantState:(id)a3;
- (void)fetchActiveAccount:(id)a3;
- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3;
- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4;
- (void)fetchExperimentConfigurationsWithCompletion:(id)a3;
- (void)fetchExperimentContextWithCompletion:(id)a3;
- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3;
- (void)fetchSharedUserIdentifier:(id)a3;
- (void)fetchSupportedLanguagesWithReply:(id)a3;
- (void)fetchSyncTokenFromCompanionAssistantId:(id)a3 forAceHost:(id)a4 completion:(id)a5;
- (void)fileARadarWithReason:(id)a3 room:(id)a4 completion:(id)a5;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3;
- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5;
- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4;
- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4;
- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4;
- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3;
- (void)getAvailableVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4;
- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4;
- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3;
- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3;
- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3;
- (void)getContextCollectorsInfoWithCompletion:(id)a3;
- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3;
- (void)getCrossDeviceContextWithCompletion:(id)a3;
- (void)getCurrentAccessoryInfoWithCompletion:(id)a3;
- (void)getCurrentActiveLanguageCodesWithCompletion:(id)a3;
- (void)getCurrentContextSnapshotWithCompletion:(id)a3;
- (void)getCurrentNWActivityIDWithCompletion:(id)a3;
- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3;
- (void)getEndpointUUIDsWithCompletion:(id)a3;
- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3;
- (void)getMeCard:(id)a3;
- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3;
- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3;
- (void)getMultiUserCompanionInfo:(id)a3;
- (void)getODDDeviceProperties:(id)a3;
- (void)getOfflineAssistantStatusWithCompletion:(id)a3;
- (void)getOfflineDictationStatusWithCompletion:(id)a3;
- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4;
- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3;
- (void)getPeerIdentifiers:(id)a3;
- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3;
- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3;
- (void)getProximityTuplesWithCompletion:(id)a3;
- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3;
- (void)getSearchQueriesDataSharingStatus:(id)a3;
- (void)getSharedCompanionInfo:(id)a3;
- (void)getSharedUserID:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3;
- (void)getSidekickBoostsFileWithCompletion:(id)a3;
- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)getSiriRMVStateForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3;
- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3;
- (void)getStereoPairState:(id)a3;
- (void)getStereoPartnerLastMyriadWinDate:(id)a3;
- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4;
- (void)getSupplementalLanguagesDictionary:(id)a3;
- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5;
- (void)getSupplementalLanguagesModificationDate:(id)a3;
- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5;
- (void)getiCloudUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)hasEverSetLanguageCodeWithCompletion:(id)a3;
- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4;
- (void)isJustSiriEnabledInTheHome:(id)a3;
- (void)isSearchDataSharingStatusForced:(id)a3;
- (void)isVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)isVoiceTriggerEnabled:(id)a3;
- (void)multiUserCompanionDeviceIdentifiers:(id)a3;
- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4;
- (void)postMUXTestResultCandidateWithRcId:(id)a3 sharedUserIdToSpeechRecognitionDict:(id)a4 voiceIdConfidenceScores:(id)a5;
- (void)postMUXTestResultSelectedWithRcId:(id)a3 voiceIdConfidenceScores:(id)a4;
- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4;
- (void)postTestResultSelectedWithRcId:(id)a3;
- (void)publishFeedbackArbitrationParticipation:(id)a3;
- (void)purgeAnalyticsStoreWithCompletion:(id)a3;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)readSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 completion:(id)a5;
- (void)removeMultiUserUser:(id)a3 completion:(id)a4;
- (void)removeMultiUserUserWithSharedUserId:(id)a3 completion:(id)a4;
- (void)resetAnalyticsStoreWithCompletion:(id)a3;
- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4;
- (void)resetProfileNames:(BOOL)a3 completion:(id)a4;
- (void)retrieveAccountMessageDictionariesWithReply:(id)a3;
- (void)saveAccountWithMessageDictionary:(id)a3 setActive:(BOOL)a4;
- (void)sendMetricsToServerWithCompletion:(id)a3;
- (void)sendSampledAudioToServerWithCompletion:(id)a3;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4;
- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3;
- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3;
- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5;
- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setConfigOverrides:(id)a3 completion:(id)a4;
- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setDictationAutoPunctuationEnabled:(BOOL)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEnableAssistantLogging:(BOOL)a3;
- (void)setHardcodedBluetoothProximity:(id)a3;
- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4;
- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5;
- (void)setLanguage:(id)a3 withCompletion:(id)a4;
- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3;
- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3;
- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoCrownActivationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4;
- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4;
- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4;
- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4;
- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4;
- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3;
- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3;
- (void)setOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4;
- (void)setRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4;
- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3;
- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4;
- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7;
- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5;
- (void)setSiriRMVState:(BOOL)a3 foriCloudAltDSID:(id)a4 completion:(id)a5;
- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4;
- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3;
- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3;
- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3;
- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5;
- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6;
- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)shouldSuppressSiriDataSharingOptInAlertWithCompletion:(id)a3;
- (void)showHomeProfileNamesWithCompletion:(id)a3;
- (void)showLocalProfileNamesWithCompletion:(id)a3;
- (void)showMultiUserCompanionInfo:(id)a3;
- (void)showMultiUserSharedUserIDsCompletion:(id)a3;
- (void)showMultiUsers:(id)a3;
- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3;
- (void)siriDesignModeIsEnabled:(id)a3;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7;
- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4;
- (void)startObservingBluetoothWirelessSplitterSession;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4;
- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)startUIRequestWithSpeechAudioFileURL:(id)a3;
- (void)startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3;
- (void)stopObservingBluetoothWirelessSplitterSession;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)syncStatusWithCompletion:(id)a3;
- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3;
- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5;
- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6;
@end

@implementation ADSettingsClient

- (ADSettingsClient)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADSettingsClient;
  v6 = -[ADSettingsClient init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
  }

  return v7;
}

- (void)connectionDisconnected
{
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0LL;

  -[CoreEmbeddedSpeechRecognizer invalidate](self->_localSpeechRecognizer, "invalidate");
  localSpeechRecognizer = self->_localSpeechRecognizer;
  self->_localSpeechRecognizer = 0LL;
}

- (id)_serviceDelegate
{
  return -[NSXPCConnection remoteObjectProxy](self->_xpcConnection, "remoteObjectProxy");
}

- (id)_serviceDelegateWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_xpcConnection,  "remoteObjectProxyWithErrorHandler:",  a3);
}

- (void)fetchSupportedLanguagesWithReply:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[ADSettingsClient fetchSupportedLanguagesWithReply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Settings is fetching supported languages",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 fetchSupportedLanguagesWithCompletion:v3];
}

- (void)retrieveAccountMessageDictionariesWithReply:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[ADSettingsClient retrieveAccountMessageDictionariesWithReply:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100335B98;
  v7[3] = &unk_1004FD6C8;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v9 = v3;
  id v5 = v3;
  id v6 = v8;
  [v6 fetchAccounts:v7];
}

- (void)saveAccountWithMessageDictionary:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = kAFAccountInfoIdentifierKey;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[ADAccount accountForIdentifier:](&OBJC_CLASS___ADAccount, "accountForIdentifier:", v8));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoAssistantIdentifierKey]);
  [v18 setAssistantIdentifier:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoHostnameKey]);
  [v18 setHostname:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoPredefinedServerKey]);
  [v18 setPredefinedServer:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoLabelKey]);
  [v18 setLabel:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoGroupKey]);
  [v18 setGroup:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoSpeechIdentifierKey]);
  [v18 setSpeechIdentifier:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoPeerAssistantIdentifierKey]);
  [v18 setPeerAssistantIdentifier:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoPeerSpeechIdentifierKey]);
  [v18 setPeerSpeechIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAFAccountInfoPeerUserAgentStringKey]);
  [v18 setPeerUserAgentString:v17];

  -[ADSettingsClient _saveAccount:setActive:](self, "_saveAccount:setActive:", v18, v4);
}

- (void)_saveAccount:(id)a3 setActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [v7 save];
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    [v5 setActiveAccountIdentifier:v6];
  }

  notify_post("com.apple.assistant.siri_settings_did_change");
}

- (void)deleteAccountWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 deleteAccountWithIdentifier:v3];
}

- (void)setActiveAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 setActiveAccountIdentifier:v3];
}

- (void)fetchActiveAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100335A84;
    v5[3] = &unk_1004FC4F8;
    id v6 = v3;
    [v4 fetchActiveAccount:v5];
  }
}

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSettingsClient setAssistantEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 setAssistantEnabled:v3];

  if (!v3)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v7, &stru_1004FC518);

    +[NLRouterCacheManager deleteAll](&OBJC_CLASS___NLRouterCacheManager, "deleteAll");
  }

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v5 setDictationEnabled:v3];

  int v7 = AFOfflineDictationCapable(v6);
  if (v3)
  {
    if (v7)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 languageIdentifier]);

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver]( &OBJC_CLASS___ADDictationOfflineStatusObserver,  "sharedDictationOfflineStatusObserver"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 offlineDictationStatus]);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));

      uint64_t v14 = AFOfflineDictationLanguageForKeyboardLanguage(v9, v13);
      id v19 = (id)objc_claimAutoreleasedReturnValue(v14);

      if (v19)
      {
        id v15 = [[SFEntitledAssetConfig alloc] initWithLanguage:v19 assetType:3];
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
        +[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:]( &OBJC_CLASS___SFEntitledAssetManager,  "subscribeToAssetWithConfig:regionId:subscriberId:expiration:",  v15,  0LL,  v16,  0LL);
      }
    }
  }

  else if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100335990;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(v18, block);
  }

- (void)setDictationAutoPunctuationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v4 _setDictationAutoPunctuationEnabledLocal:v3];
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v6 _suppressLowStorageNotificationForLanguage:v5 suppress:v4];
}

- (void)setEnableAssistantLogging:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = @"Disabling";
    if (v3) {
      id v5 = @"Enabling";
    }
    int v11 = 136315394;
    v12 = "-[ADSettingsClient setEnableAssistantLogging:]";
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s %@ extra assistant logging",  (uint8_t *)&v11,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v6 setFileLoggingIsEnabled:v3];
  [v6 setCardLoggingEnabled:v3];
  [v6 setCommandLoggingEnabled:v3];
  [v6 setAVVCLoggingEnabled:v3];
  int v7 = &kCFBooleanTrue;
  if (!v3) {
    int v7 = &kCFBooleanFalse;
  }
  VSPreferencesSetLogging(*v7);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  [v8 setFileLoggingIsEnabled:v3];

  AFInternalPreferencesSynchronize(v9, v10);
  [v6 synchronizeLogPreferencesDomain];
  [v6 synchronizeAVVCPreferencesDomain];
}

- (void)_killDaemon
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _killDaemon]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Shutting down at the request of settings",  (uint8_t *)&v4,  0xCu);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  [v3 shutdown];
}

- (void)_shutdownSessionIfIdle
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _shutdownSessionIfIdle]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v3 shutdownSessionIfIdle];
}

- (void)_resetSessionsAtNextRequestBoundary
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSettingsClient _resetSessionsAtNextRequestBoundary]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
  dispatch_async(v3, &stru_1004FC538);
}

- (void)barrierWithReply:(id)a3
{
}

- (void)setConfigOverrides:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v6 setConfigOverrides:v5];

  int v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    int v7 = v8;
  }
}

- (void)configOverrides:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 configOverrides]);
    (*((void (**)(id, void *))a3 + 2))(v4, v5);
  }

- (void)_setSyncNeededForReason:(id)a3
{
}

- (void)_clearSyncNeededForKey:(id)a3
{
  id v5 = a3;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  sub_1002D6A38(v4);
}

- (void)_isInactiveDeviceSyncDisabledByTrial:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADSyncConfigAssetManager sharedInstance](&OBJC_CLASS___ADSyncConfigAssetManager, "sharedInstance"));
    (*((void (**)(id, id))a3 + 2))(v4, [v5 isInactiveDeviceSyncDisabled]);
  }

- (void)_isInactiveDeviceSyncDisabled:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    (*((void (**)(void))a3 + 2))();
  }

- (void)_syncDataWithAnchorKeys:(id)a3 forceReset:(BOOL)a4 reason:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSettingsClient _syncDataWithAnchorKeys:forceReset:reason:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Got sync command on connection %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v24 = sub_100335700;
  v25 = sub_100335710;
  id v26 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100335830;
  v19[3] = &unk_1004FC560;
  id v15 = v12;
  id v20 = v15;
  v21 = buf;
  v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 addObserverForName:@"ADSyncFinishedNotification" object:0 queue:0 usingBlock:v19]);

  objc_storeStrong((id *)(*(void *)&buf[8] + 40LL), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v22 = v11;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  [v17 syncAnchorKeys:v10 forceReset:v8 reasons:v18];

  _Block_object_dispose(buf, 8);
}

- (void)_fetchPeerData:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 updateSharedDataFromPeerUseCache:0 completion:v3];
}

- (void)_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v5)
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_100335700;
    v24 = sub_100335710;
    id v25 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_100335718;
    v17 = &unk_1004FC560;
    id v18 = v8;
    id v19 = &v20;
    uint64_t v10 = objc_claimAutoreleasedReturnValue( [v9 addObserverForName:@"ADSyncVerificationFinishedNotification" object:0 queue:0 usingBlock:&v14]);

    id v11 = (void *)v21[5];
    v21[5] = v10;

    _Block_object_dispose(&v20, 8);
  }

  if (v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v12 setSyncDelegate:self];
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommandCenter sharedCommandCenter]( &OBJC_CLASS___ADCommandCenter,  "sharedCommandCenter",  v14,  v15,  v16,  v17));
  [v13 setSyncVerificationNeededAndFullReportNeeded:v6 shouldPostNotification:v5];
}

- (void)_runServiceMaintenance
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 runServiceMaintenanceWithCompletion:0];
}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v5)
  {
    int v9 = 136315138;
    uint64_t v10 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  if ((AFIsHorseman(v5) & 1) != 0)
  {
    BOOL v6 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (v7)
      {
        int v9 = 136315138;
        uint64_t v10 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Unsupported platform",  (uint8_t *)&v9,  0xCu);
      }

      v3[2](v3, 0LL);
    }

    else if (v7)
    {
      int v9 = 136315138;
      uint64_t v10 = "-[ADSettingsClient disableAndDeleteCloudSyncWithCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Unsupported platform. No completion handler.",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    [v8 disableAndDeleteCloudSyncWithCompletion:v3];
  }
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v7 = a3;
  BOOL v5 = (void (**)(id, void))a4;
  if ((AFIsHorseman(v5) & 1) != 0)
  {
    if (v5) {
      v5[2](v5, 0LL);
    }
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    [v6 getDevicesWithAvailablePHSAssetsForLanguage:v7 completion:v5];
  }
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  [v4 getDevicesWithAvailablePHSAssetsOnDeviceCheck:v3];
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v7 = (void (**)(id, void))a5;
  if ((AFIsHorseman(v7) & 1) != 0)
  {
    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1003356E4;
    v9[3] = &unk_1004FCC00;
    uint64_t v10 = v7;
    [v8 forceMultiUserSync:v6 download:v5 activity:0 completion:v9];
  }
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 getCurrentContextSnapshotWithCompletion:v3];
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 getCrossDeviceContextWithCompletion:v3];
}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 getOriginDeviceInfoForContextIdentifier:v6 completion:v5];
}

- (void)getContextCollectorsInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10033555C;
  v6[3] = &unk_1004FC588;
  id v7 = v3;
  id v5 = v3;
  [v4 getContextCollectorDeviceIdentifiersWithCompletion:v6];
}

- (void)setHardcodedBluetoothProximity:(id)a3
{
}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  [v4 getManagedLocalAndRemotePeerInfoWithCompletion:v3];
}

- (void)getCapabilitiesDataFromReachableDevicesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003353A4;
  v6[3] = &unk_1004FC5F0;
  id v7 = v3;
  id v5 = v3;
  [v4 getCapabilitiesForReachableDevicesWithCompletion:v6];
}

- (void)getProximityTuplesWithCompletion:(id)a3
{
  id v3 = a3;
  if ((AFSupportsHALProximityScanning(v3, v4) & 1) != 0)
  {
    if (v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceProximityManager sharedManager](&OBJC_CLASS___ADDeviceProximityManager, "sharedManager"));
      [v5 performProximityScan];

      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1003352DC;
      v7[3] = &unk_1004FC5F0;
      id v8 = v3;
      [v6 getCrossDeviceContextWithCompletion:v7];
    }
  }

  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

- (void)getExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003351E8;
    v8[3] = &unk_1004FC618;
    id v9 = v5;
    [v7 getExperimentForConfigurationIdentifier:v6 completion:v8];
  }
}

- (void)synchronizeExperimentConfigurationsIfApplicableWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
  [v4 synchronizeExperimentConfigurationsIfApplicableWithCompletion:v3];
}

- (void)resetExperimentForConfigurationIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
  [v7 resetExperimentForConfigurationIdentifier:v6 completion:v5];
}

- (void)getCurrentNWActivityIDWithCompletion:(id)a3
{
  id v3 = a3;
  if (sub_10005F480())
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1003351C0;
    v14[3] = &unk_1004FC640;
    id v5 = &v15;
    id v15 = v3;
    id v6 = v3;
    id v7 = (void ***)v14;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    id v11 = sub_1003351D4;
    id v12 = &unk_1004FC640;
    id v5 = &v13;
    id v13 = v3;
    id v8 = v3;
    id v7 = &v9;
  }

  objc_msgSend(v4, "currentNetworkActivityTokenWithCompletion:", v7, v9, v10, v11, v12);
}

- (void)getAudioSessionCoordinationSnapshotWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 audioSessionCoordinator]);
    [v4 getSnapshotWithCompletion:v3];
  }

- (void)handleCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADSettingsClient handleCommand:completion:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received %@", buf, 0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v5));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1003350BC;
    v12[3] = &unk_1004FC668;
    id v13 = v6;
    [v9 handleCommand:v8 completion:v12];

    uint64_t v10 = v13;
LABEL_9:

    goto LABEL_10;
  }

  if (v6)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 11LL));
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[ADSettingsClient handleCommand:completion:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Responding %@", buf, 0x16u);
    }

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v10);
    goto LABEL_9;
  }

- (void)getAvailableVoicesIncludingAssetInfo:(BOOL)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  char v6 = sub_1001EA0D0();
  if (v5 && (v6 & 1) == 0) {
    v5[2](v5, 0LL);
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100334BC8;
  v10[3] = &unk_1004FC6B8;
  BOOL v12 = a3;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, v10);
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v10 = a4;
  id v5 = a3;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
  [v6 logEventWithType:3202 context:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v8 setOutputVoice:v5];

  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    id v9 = v10;
  }
}

- (void)setLanguage:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  char v6 = (__CFString *)a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = @"nil";
  }
  id v11 = @"language";
  BOOL v12 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  [v7 logEventWithType:3201 context:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 setLanguageCode:v6 withCompletion:v5];
}

- (void)setLanguage:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (__CFString *)a3;
  id v10 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryRepresentation]);
  id v15 = -[NSMutableDictionary initWithDictionary:](v10, "initWithDictionary:", v11);

  if (v9) {
    BOOL v12 = v9;
  }
  else {
    BOOL v12 = @"nil";
  }
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v12, @"language");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v13 logEventWithType:3201 context:v15];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v14 setLanguageCode:v9 outputVoice:v8 withCompletion:v7];
}

- (id)_localSpeechRecognizer
{
  localSpeechRecognizer = self->_localSpeechRecognizer;
  if (!localSpeechRecognizer)
  {
    id v4 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]( objc_alloc(&OBJC_CLASS___CoreEmbeddedSpeechRecognizer),  "initWithDelegate:instanceUUID:",  0LL,  &CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
    id v5 = self->_localSpeechRecognizer;
    self->_localSpeechRecognizer = v4;

    localSpeechRecognizer = self->_localSpeechRecognizer;
  }

  return localSpeechRecognizer;
}

- (void)getOfflineAssistantStatusWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 detailedInstallationStatusForLanguagesWithAssetType:3 subscriberId:v5]);

  v3[2](v3, v6, 0LL);
}

- (void)getOfflineDictationStatusWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SFEntitledAssetManager sharedInstance](&OBJC_CLASS___SFEntitledAssetManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SFEntitledAssetManager subscriberIdForDictationAssets]( &OBJC_CLASS___SFEntitledAssetManager,  "subscriberIdForDictationAssets"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 detailedInstallationStatusForLanguagesWithAssetType:3 subscriberId:v5]);

  v3[2](v3, v6, 0LL);
}

- (void)createOfflineSpeechProfileWithLanguage:(id)a3 modelOverridePath:(id)a4 JSONData:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ADSettingsClient _localSpeechRecognizer](self, "_localSpeechRecognizer"));
  [v14 createSpeechProfileWithLanguage:v13 modelOverridePath:v12 JSONData:v11 completion:v10];
}

- (void)setOfflineDictationProfileOverridePath:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v6 setOfflineDictationProfileOverridePath:v5];

  v7[2](v7, 0LL);
}

- (void)setSpeechProfileExternalOfflineModelRootPath:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v6 setSpeechProfileExternalOfflineModelRootPath:v5];

  v7[2](v7, 0LL);
}

- (void)startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100334B38;
  v9[3] = &unk_1004FC6E0;
  id v10 = v5;
  id v8 = v5;
  [v7 handleExternalActivationRequest:v6 completion:v9];
}

- (void)startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  -[AFRequestInfo setText:](v7, "setText:", v6);

  -[AFRequestInfo setActivationEvent:](v7, "setActivationEvent:", 8LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100334AA8;
  v10[3] = &unk_1004FC6E0;
  id v11 = v5;
  id v9 = v5;
  [v8 handleExternalActivationRequest:v7 completion:v10];
}

- (void)startMultiUserUIRequestWithText:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(unint64_t)a5 nonspeakerConfidenceScores:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (AFSupportsMultiUser(v14, v15))
  {
    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "-[ADSettingsClient startMultiUserUIRequestWithText:expectedSpeakerSharedUserID:expectedSpeakerConfidenceScor"
            "e:nonspeakerConfidenceScores:completion:]";
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2048;
      unint64_t v29 = a5;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@ %@ %lu %@", buf, 0x34u);
    }

    id v17 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
    -[AFRequestInfo setText:](v17, "setText:", v11);
    -[AFRequestInfo setExpectedSpeakerSharedUserID:](v17, "setExpectedSpeakerSharedUserID:", v12);
    -[AFRequestInfo setExpectedSpeakerConfidenceScore:](v17, "setExpectedSpeakerConfidenceScore:", a5);
    -[AFRequestInfo setNonspeakerConfidenceScores:](v17, "setNonspeakerConfidenceScores:", v13);
    -[AFRequestInfo setActivationEvent:](v17, "setActivationEvent:", 8LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100334A58;
    v20[3] = &unk_1004FC6E0;
    id v21 = v14;
    [v18 handleExternalActivationRequest:v17 completion:v20];
  }

  else if (v14)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  0LL));
    (*((void (**)(id, void *))v14 + 2))(v14, v19);
  }
}

- (void)startUIRequestWithSpeechAudioFileURL:(id)a3
{
  id v3 = a3;
  id v9 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  19LL);
  -[AFSpeechRequestOptions setAudioFileURL:](v9, "setAudioFileURL:", v3);

  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[AFSpeechRequestOptions setNotifyState:](v9, "setNotifyState:", v5);

  if (AFIsHorseman(v6))
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
    -[AFRequestInfo setActivationEvent:](v7, "setActivationEvent:", 8LL);
    -[AFRequestInfo setSpeechRequestOptions:](v7, "setSpeechRequestOptions:", v9);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v8 handleExternalActivationRequest:v7 completion:0];
  }

  else
  {
    id v7 = (AFRequestInfo *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    -[AFRequestInfo handleRemoteSpeechRequest:completion:](v7, "handleRemoteSpeechRequest:completion:", v9, 0LL);
  }
}

- (void)dismissUI
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 dismissAssistant];
}

- (void)startUIMockServerRequestWithReplayFileURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003347F4;
  v11[3] = &unk_1004FC708;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v14 = v7;
  id v8 = v13;
  id v9 = v7;
  id v10 = v6;
  [v8 fetchActiveAccountIdentifier:v11];
}

- (void)_createMockServerIfNeededAndSetActiveWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003346CC;
  v7[3] = &unk_1004FC770;
  void v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 fetchAccounts:v7];
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 handoffOriginDeviceName]);

  if (!v10)
  {
    uint64_t v13 = AFUserAssignedDeviceName();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v7 setHandoffOriginDeviceName:v14];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    id v11 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    -[ADPeerInfo startRemoteRequest:completion:](v11, "startRemoteRequest:completion:", v7, v9);
    goto LABEL_6;
  }

  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v11 = -[ADPeerInfo initWithIDSIdentifer:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithIDSIdentifer:", v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10033466C;
  v15[3] = &unk_1004FDA58;
  id v16 = v9;
  [v12 startRemoteRequest:v7 onPeer:v11 completion:v15];

LABEL_6:
}

- (void)getPeerIdentifiers:(id)a3
{
  id v3 = (void (**)(id, NSMutableArray *))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 peers]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) dictionaryRepresentation]);
        -[NSMutableArray addObject:](v4, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  if (v3) {
    v3[2](v3, v4);
  }
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 audioPlaybackService]);
  [v9 startRequest:v8 options:a4 completion:v7];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 audioPlaybackService]);
  [v6 stopRequest:v5 immediately:v4];
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 audioPlaybackService]);
  [v4 stopAllRequests:v3 completion:0];
}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, uint64_t, void))a3;
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    __int128 v13 = "-[ADSettingsClient hasEverSetLanguageCodeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _languageCodeWithFallback:0]);

  if (v6)
  {
    v3[2](v3, 1LL, 0LL);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    uint64_t v8 = [v7 cloudSyncEnabled];

    if ((v8 & 1) != 0
      && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager")),
          unsigned int v10 = [v9 preferencesHaveBeenSynchronized],
          v9,
          !v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
      [v11 hasEverSetLanguageCodeWithCompletion:v3];
    }

    else
    {
      v3[2](v3, 0LL, 0LL);
    }
  }
}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 postTestResultCandidateWithRcId:v6 recognitionSausage:v5];
}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 postTestResultSelectedWithRcId:v3];
}

- (void)postMUXTestResultCandidateWithRcId:(id)a3 sharedUserIdToSpeechRecognitionDict:(id)a4 voiceIdConfidenceScores:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v10 postMUXTestResultCandidateWithRcId:v9 sharedUserIdToSpeechRecognitionDict:v8 voiceIdConfidenceScores:v7];
}

- (void)postMUXTestResultSelectedWithRcId:(id)a3 voiceIdConfidenceScores:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 postMUXTestResultSelectedWithRcId:v6 voiceIdConfidenceScores:v5];
}

- (void)setSupplementalLanguageDictionary:(id)a3 forProduct:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, id))a5 + 2))(v6, v7);
  }

- (void)setSupplementalLanguages:(id)a3 forProduct:(id)a4 forBuildVersion:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, id))a6 + 2))(v7, v8);
  }

- (void)getSupplementalLanguagesDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
  }

- (void)getSupplementalLanguagesModificationDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
  }

- (void)getSupplementalLanguageDictionaryForProduct:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
  }

- (void)getSupplementalLanguagesForProduct:(id)a3 forBuildVersion:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 0LL));
    (*((void (**)(id, void, id))a5 + 2))(v6, 0LL, v7);
  }

- (void)getMeCard:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334620;
  v6[3] = &unk_1004FC5F0;
  id v7 = v3;
  id v5 = v3;
  [v4 getMeCardsWithCompletion:v6];
}

- (void)getStereoPartnerLastMyriadWinDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMyriadService sharedService](&OBJC_CLASS___ADMyriadService, "sharedService"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100334614;
    v5[3] = &unk_1004FC798;
    id v6 = v3;
    [v4 lastMyriadWinForStereoPartner:v5];
  }
}

- (void)getStereoPairState:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (v3)
  {
    id v5 = v3;
    if (AFIsHorseman(v3))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v4 isStereoPairConfigured];
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    }

    v5[2]();

    id v3 = v5;
  }
}

- (void)publishFeedbackArbitrationParticipation:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADArbitrationFeedbackManager sharedManager](&OBJC_CLASS___ADArbitrationFeedbackManager, "sharedManager"));
  [v4 publishParticipation:v3];
}

- (void)setNanoAssistantEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoDictationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoDictationAutoPunctuationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoPhraseSpotterEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoRaiseToSpeakEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoUseDeviceSpeakerForTTS:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoTTSSpeakerVolume:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoOutputVoice:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoLanguage:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoCrownActivationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoMessageWithoutConfirmationEnabled:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoSiriResponseShouldAlwaysPrint:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)setNanoAlwaysShowRecognizedSpeech:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)getSharedCompanionInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100334608;
    v5[3] = &unk_1004FC7C0;
    id v6 = v3;
    [v4 getSharedCompanionInfoWithCompletion:v5];
  }
}

- (void)getPersonalMultiUserDeviceIdentifiers:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, NSMutableArray *))a3;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      id v6 = v5;
      int v7 = 136315394;
      id v8 = "-[ADSettingsClient getPersonalMultiUserDeviceIdentifiers:]";
      __int16 v9 = 2048;
      id v10 = -[NSMutableArray count](v4, "count");
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Found %lu MU device identifiers",  (uint8_t *)&v7,  0x16u);
    }

    v3[2](v3, v4);
  }

- (void)multiUserCompanionDeviceIdentifiers:(id)a3
{
  id v3 = (void (**)(id, NSMutableArray *))a3;
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[ADSettingsClient multiUserCompanionDeviceIdentifiers:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Finding personal devices", buf, 0xCu);
    if (!v3) {
      goto LABEL_15;
    }
  }

  else if (!v3)
  {
    goto LABEL_15;
  }

  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allUsersBySharedUserID]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v14 personalDomainsIsEnabled])
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_1003345B8;
          v20[3] = &unk_1004FD2E8;
          void v20[4] = v14;
          id v15 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v20);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 managedPeerInfoMatchingPeerInfo:v15]);

          if (v16)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 rapportEffectiveIdentifier]);
            -[NSMutableArray addObject:](v19, "addObject:", v17);
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  v3[2](v3, v19);
LABEL_15:
}

- (void)addMultiUserUser:(id)a3 sharedId:(id)a4 loggableSharedId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void *))a9;
  if ((AFSupportsMultiUser(v18, v19) & 1) != 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v20 addUser:v21 sharedUserId:v14 loggableSharedUserId:v15 iCloudAltDSID:v16 enrollmentName:v17 isPrimary:v9 completion:v18];
LABEL_5:

    goto LABEL_6;
  }

  if (v18)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
    v18[2](v18, v20);
    goto LABEL_5;
  }

- (void)removeMultiUserUser:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ((AFSupportsMultiUser(v5, v6) & 1) != 0)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v7 removeUserWithHomeUUID:v8 completion:v5];
LABEL_5:

    goto LABEL_6;
  }

  if (v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
    v5[2](v5, v7);
    goto LABEL_5;
  }

- (void)removeMultiUserUserWithSharedUserId:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ((AFSupportsMultiUser(v5, v6) & 1) != 0)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v7 removeUserWithSharedUserID:v8 completion:v5];
LABEL_5:

    goto LABEL_6;
  }

  if (v5)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
    v5[2](v5, v7);
    goto LABEL_5;
  }

- (void)showMultiUsers:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if ((AFSupportsMultiUser(v5, v3) & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v4 showMultiUsersWithCompletion:v5];
  }

  else if (v5)
  {
    v5[2](v5, 0LL);
  }
}

- (void)showMultiUserCompanionInfo:(id)a3
{
  id v3 = a3;
  if ((AFSupportsMultiUser(v3, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1003343B4;
    v6[3] = &unk_1004FC7E8;
    id v7 = v3;
    [v5 getMultiUserCompanionInfoWithCompletion:v6];
  }

  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

- (void)getMultiUserCompanionInfo:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if ((AFSupportsMultiUser(v5, v3) & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v4 getMultiUserCompanionInfoWithCompletion:v5];
  }

  else if (v5)
  {
    v5[2](v5, 0LL);
  }
}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  if ((AFSupportsMultiUser(v5, v3) & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v4 showPrimaryUserSharedUserIDWithCompletion:v5];
  }

  else if (v5)
  {
    v5[2](v5, 0LL);
  }
}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v5 = a3;
  if ((AFSupportsMultiUser(v5, v3) & 1) != 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    [v4 showMultiUserSharedUserIDsCompletion:v5];
  }

  else if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }
}

- (void)showLocalProfileNamesWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void *))a3;
  if ((AFSupportsMultiUser(v6, v3) & 1) != 0)
  {
    if (v6)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getLocalProfileNames]);
      v6[2](v6, v5);
    }
  }

  else if (v6)
  {
    v6[2](v6, 0LL);
  }
}

- (void)resetProfileNames:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, void))a4;
  if ((AFSupportsMultiUser(v7, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService"));
    [v6 resetAllProfiles:v4 withCompletion:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL);
  }
}

- (void)showHomeProfileNamesWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  if ((AFSupportsMultiUser(v7, v3) & 1) != 0)
  {
    if (v7)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getUserProfileAceCommand]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 names]);
      v7[2](v7, v6);
    }
  }

  else if (v7)
  {
    v7[2](v7, 0LL);
  }
}

- (void)updateVoiceIdScoreToUser:(id)a3 score:(id)a4 reset:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a6;
  if ((AFSupportsMultiUser(v10, v11) & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserTestSupport sharedService](&OBJC_CLASS___ADMultiUserTestSupport, "sharedService"));
    [v12 updateVoiceIdScoreToUser:v13 score:v9 reset:v7 completion:v10];
  }

  else if (v10)
  {
    v10[2](v10, 0LL);
  }
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v5 = (void (**)(id, void, void *))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  BOOL v7 = v6;
  if (v6)
  {
    [v6 getHomeUserIdForSharedUserId:v9 completion:v5];
  }

  else if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    v5[2](v5, 0LL, v8);
  }
}

- (void)getiCloudUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v5 = (void (**)(id, void, void *))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  BOOL v7 = v6;
  if (v6)
  {
    [v6 getiCloudUserIdForSharedUserId:v9 completion:v5];
  }

  else if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    v5[2](v5, 0LL, v8);
  }
}

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v5 = (void (**)(id, void, void *))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  BOOL v7 = v6;
  if (v6)
  {
    [v6 getSharedUserIdForHomeUserId:v9 completion:v5];
  }

  else if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    v5[2](v5, 0LL, v8);
  }
}

- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v10 = v9;
  if (v9)
  {
    [v9 updateMultiUserWithSharedUserId:v12 companionInfo:v7 completion:v8];
  }

  else if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    v8[2](v8, v11);
  }
}

- (void)getSharedUserID:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void (**)(id, void *, void *, void))a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserIdentifier]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 loggingSharedUserIdentifier]);
    v3[2](v3, v4, v5, 0LL);
  }

- (void)fetchMultiUserVoiceIdentificationSetting:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void (**)(id, id))a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    v3[2](v3, [v4 multiUserVoiceIdentification]);
  }

- (void)homeOnboardingFlowInvoked:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v5 setMultiUserIsOnboardingDevice:v4];

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    id v6 = v7;
  }
}

- (void)fetchEventRecordsFromAnalyticsStoreAtPath:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100334398;
  v12[3] = &unk_1004FC810;
  id v6 = a4;
  id v13 = v6;
  id v7 = objc_retainBlock(v12);
  if (v5)
  {
    id v8 = -[ADAnalyticsStore initWithPath:](objc_alloc(&OBJC_CLASS___ADAnalyticsStore), "initWithPath:", v5);
    ((void (*)(void *, ADAnalyticsStore *))v7[2])(v7, v8);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1003343A8;
    v10[3] = &unk_1004FC810;
    uint64_t v11 = v7;
    [v9 accessStoreUsingBlock:v10];

    id v8 = v11;
  }
}

- (void)purgeAnalyticsStoreWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334310;
  v6[3] = &unk_1004FC810;
  id v7 = v3;
  id v5 = v3;
  [v4 accessStoreUsingBlock:v6];
}

- (void)resetAnalyticsStoreWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334288;
  v6[3] = &unk_1004FC810;
  id v7 = v3;
  id v5 = v3;
  [v4 accessStoreUsingBlock:v6];
}

- (void)sendMetricsToServerWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334270;
  v6[3] = &unk_1004FC838;
  id v7 = v3;
  id v5 = v3;
  [v4 sendMetricsToServerWithTimeout:0 requiresUnlimitedPower:0 requiresActiveSession:0 purgesOversizedStorage:1 ignoresMetricsSen derDisabledSetting:0 scheduledActivity:v6 completion:3600.0];
}

- (void)fetchExperimentConfigurationsWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334258;
  v6[3] = &unk_1004FC5F0;
  id v7 = v3;
  id v5 = v3;
  [v4 getConfigurationsWithCompletion:v6];
}

- (void)fetchExperimentContextWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334240;
  v6[3] = &unk_1004FC860;
  id v7 = v3;
  id v5 = v3;
  [v4 getContextWithCompletion:v6];
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10033422C;
  v9[3] = &unk_1004FC888;
  id v10 = v5;
  id v8 = v5;
  [v7 getSiriOutputVolumeForAudioRoute:v6 completion:v9];
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100334218;
  v12[3] = &unk_1004FCC00;
  id v13 = v7;
  id v10 = v7;
  *(float *)&double v11 = a3;
  [v9 setSiriOutputVolume:v8 forAudioRoute:1 operationType:v12 completion:v11];
}

- (void)_executeBlockWithCurrentlyRoutedDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = sub_1000FCF8C(0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 btAddress]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceWithAddress:v9]);

  if (v11)
  {
    v5[2](v5, v11);
  }

  else
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      id v15 = "-[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to get bluetooth device",  (uint8_t *)&v14,  0xCu);
    }

    id v13 = +[AFBluetoothDeviceBooleanSettingResponse newWithBuilder:]( &OBJC_CLASS___AFBluetoothDeviceBooleanSettingResponse,  "newWithBuilder:",  &stru_1004FC8C8);
    v6[2](v6, v13);
  }
}

- (void)setConversationAwarenessForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003341D0;
  v6[3] = &unk_1004FC8F0;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v6,  v5);
}

- (void)getConversationAwarenessForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003341C4;
  v5[3] = &unk_1004FC918;
  id v6 = a3;
  id v4 = v6;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v5,  v4);
}

- (void)setPersonalVolumeForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1003341B4;
  v6[3] = &unk_1004FC8F0;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v6,  v5);
}

- (void)getPersonalVolumeForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003341A8;
  v5[3] = &unk_1004FC918;
  id v6 = a3;
  id v4 = v6;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v5,  v4);
}

- (void)setHeadGesturesForCurrentlyRoutedDevice:(BOOL)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100334198;
  v6[3] = &unk_1004FC8F0;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v6,  v5);
}

- (void)getHeadGesturesForCurrentlyRoutedDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033418C;
  v5[3] = &unk_1004FC918;
  id v6 = a3;
  id v4 = v6;
  -[ADSettingsClient _executeBlockWithCurrentlyRoutedDevice:withCompletion:]( self,  "_executeBlockWithCurrentlyRoutedDevice:withCompletion:",  v5,  v4);
}

- (void)getBluetoothDeviceInfoWithAddress:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceWithAddress:v6]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100334178;
  v10[3] = &unk_1004FC940;
  id v11 = v5;
  id v9 = v5;
  [v8 getDeviceInfo:v10];
}

- (void)getBluetoothDeviceInfoWithUID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceWithUID:v6]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100334164;
  v10[3] = &unk_1004FC940;
  id v11 = v5;
  id v9 = v5;
  [v8 getDeviceInfo:v10];
}

- (void)getConnectedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100333E4C;
  v8[3] = &unk_1004FD6C8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 getConnectedDevicesWithCompletion:v8];
}

- (void)getPairedBluetoothDeviceInfoArrayWithCompletion:(id)a3
{
}

- (void)getBluetoothWirelessSplitterSessionInfoWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 wirelessSplitterSession]);

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100333E38;
    v6[3] = &unk_1004FC990;
    id v7 = v3;
    [v5 getSessionInfo:v6];
  }

  else if (v3)
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

- (void)startObservingBluetoothWirelessSplitterSession
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver]( &OBJC_CLASS___ADBluetoothWirelessSplitterSessionObserver,  "sharedWirelessSplitterSessionObserver"));
  [v2 startObserving];
}

- (void)stopObservingBluetoothWirelessSplitterSession
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[ADBluetoothWirelessSplitterSessionObserver sharedWirelessSplitterSessionObserver]( &OBJC_CLASS___ADBluetoothWirelessSplitterSessionObserver,  "sharedWirelessSplitterSessionObserver"));
  [v2 stopObserving];
}

- (void)getInEarDetectionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v14 = "-[ADSettingsClient getInEarDetectionStateForBTAddress:withCompletion:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Getting in-ear detection state for %@",  buf,  0x16u);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceWithAddress:v5]);

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100333D50;
    v10[3] = &unk_1004FC9B8;
    id v11 = v5;
    id v12 = v6;
    [v9 getHeadphoneInEarDetectionState:v10];
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (id)_localizedBodyWithFormat:(id)a3 forTriggerPhrase:(id)a4 andName:(id)a5
{
  id v7 = a5;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByReplacingOccurrencesOfString:@"%TRIGGER_PHRASE%" withString:a4]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:@"%HEADPHONES_NAME%" withString:v7]);

  return v9;
}

- (void)postJSDiscoveryNotificationForBTDeviceWithInfo:(id)a3 withCompletion:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v44;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s 🎧 Posting JS discovery notification for %@",  buf,  0x16u);
  }

  v42 = -[ADUserNotificationServiceProvider initWithConnection:bundleIdentifier:notificationCategories:]( objc_alloc(&OBJC_CLASS___ADUserNotificationServiceProvider),  "initWithConnection:bundleIdentifier:notificationCategories:",  0LL,  0LL,  0LL);
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 languageCode]);

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
    __int16 v49 = 2112;
    uint64_t v50 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s 🎧 JS discovery notification languageCode: %@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"ASSISTANT_SERVICES_BT_JS_DISCOVERY_NOTIFICATION_TITLE" table:0 bundle:v14 languageCode:v10]);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v16 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v41 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ASSISTANT_SERVICES_BT_JS_DISCOVERY_NOTIFICATION_BODY" table:0 bundle:v17 languageCode:v10]);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=SIRI"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  v40 = (void *)v10;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedTriggerPhraseForLanguageCode:v10]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v44 name]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v44 address]);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceWithAddress:v21]);

  v37 = v22;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceInfo]);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
  v36 = v23;
  if ([v24 length])
  {
    id v25 = v6;
    __int16 v26 = self;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
    unsigned __int8 v28 = [v19 isEqualToString:v27];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v23 name]);

      __int16 v30 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[ADSettingsClient postJSDiscoveryNotificationForBTDeviceWithInfo:withCompletion:]";
        __int16 v49 = 2112;
        uint64_t v50 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s 🎧 Using updated name %@ for JS discovery notification",  buf,  0x16u);
      }

      uint64_t v19 = (void *)v29;
    }

    self = v26;
    id v6 = v25;
  }

  else
  {
  }

  -[UNMutableNotificationContent setTitle:](v8, "setTitle:", v43);
  id v31 = (void *)objc_claimAutoreleasedReturnValue( -[ADSettingsClient _localizedBodyWithFormat:forTriggerPhrase:andName:]( self,  "_localizedBodyWithFormat:forTriggerPhrase:andName:",  v41,  v38,  v19));
  -[UNMutableNotificationContent setBody:](v8, "setBody:", v31);

  -[UNMutableNotificationContent setHasDefaultAction:](v8, "setHasDefaultAction:", 1LL);
  -[UNMutableNotificationContent setDefaultActionURL:](v8, "setDefaultActionURL:", v39);
  -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v8, "setShouldBackgroundDefaultAction:", 1LL);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v44 address]);
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"com.apple.siri.notification.js.discovery.%lull",  [v32 hash]));

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v33,  v8,  0LL));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100333D3C;
  v45[3] = &unk_1004FCC00;
  id v46 = v6;
  id v35 = v6;
  -[ADUserNotificationServiceProvider postNotificationRequest:completion:]( v42,  "postNotificationRequest:completion:",  v34,  v45);
}

- (void)startObservingBluetoothInEarDetectionStateForBTAddress:(id)a3 forObserverID:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[ADBluetoothInEarDetectionStateObserver sharedObserver]( &OBJC_CLASS___ADBluetoothInEarDetectionStateObserver,  "sharedObserver"));
  [v6 startObservingForBTAddress:v5 forObserverID:a4];
}

- (void)stopObservingBluetoothInEarDetectionStateForObserverID:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[ADBluetoothInEarDetectionStateObserver sharedObserver]( &OBJC_CLASS___ADBluetoothInEarDetectionStateObserver,  "sharedObserver"));
  [v4 stopObservingForObserverID:a3];
}

- (void)getSpokenNotificationIsAlwaysOpportuneWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t IsAlwaysOpportune = _AFPreferencesSpokenNotificationIsAlwaysOpportune();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, IsAlwaysOpportune);
}

- (void)setSpokenNotificationIsAlwaysOpportune:(BOOL)a3
{
}

- (void)getSpokenNotificationShouldAnnounceAllNotificationsWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldAnnounceAllNotifications = _AFPreferencesSpokenNotificationShouldAnnounceAllNotifications();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShouldAnnounceAllNotifications);
}

- (void)setSpokenNotificationShouldAnnounceAllNotifications:(BOOL)a3
{
}

- (void)getSpokenNotificationShouldSkipTriggerlessRepliesWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldSkipTriggerlessReplies = _AFPreferencesSpokenNotificationShouldSkipTriggerlessReplies();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShouldSkipTriggerlessReplies);
}

- (void)setSpokenNotificationShouldSkipTriggerlessReplies:(BOOL)a3
{
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForPlatform:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForPlatform(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, id))a4 + 2))(v6, v8);
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 platform:(int64_t)a4
{
}

- (void)getAnnounceNotificationsTemporarilyDisabledEndDateForApp:(id)a3 platform:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = _AFPreferencesAnnounceNotificationsTemporarilyDisabledEndDateForAppOnPlatform(a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  (*((void (**)(id, id))a5 + 2))(v8, v10);
}

- (void)setAnnounceNotificationsTemporarilyDisabledUntil:(id)a3 forApp:(id)a4 platform:(int64_t)a5
{
}

- (void)fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[AFHeadphonesAnnouncementRequestCapabilityProvider provider]( &OBJC_CLASS___ADHeadphonesAnnouncementRequestCapabilityProvider,  "provider"));
  [v4 fetchCurrentlyRoutedHeadphonesCBUUIDWithCompletion:v3];
}

- (void)getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = _AFPreferencesAnnounceNotificationsInCarPlayTemporarilyDisabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADSettingsClient setAnnounceNotificationsInCarPlayTemporarilyDisabled:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Setting temporarily disable announce notifications in CarPlay: %i",  (uint8_t *)&v5,  0x12u);
  }

  _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled(v3);
}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[ADSettingsClient clearAnnounceNotificationsInCarPlayTemporarilyDisabled]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Clearing temporarily disable announce notifications in CarPlay.",  (uint8_t *)&v3,  0xCu);
  }

  _AFPreferencesClearAnnounceNotificationsInCarPlayTemporarilyDisabled();
}

- (void)getAnnounceNotificationsInCarPlayTypeWithCompletion:(id)a3
{
  id v6 = a3;
  uint64_t v5 = _AFPreferencesAnnounceNotificationsInCarPlayType(v6, v4);
  (*((void (**)(id, uint64_t))a3 + 2))(v6, v5);
}

- (void)setAnnounceNotificationsInCarPlayType:(int64_t)a3
{
  uint64_t v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    uint64_t Name = AFSiriCarPlayAnnounceEnablementTypeGetName(a3);
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v8 = 136315394;
    uint64_t v9 = "-[ADSettingsClient setAnnounceNotificationsInCarPlayType:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Setting announce notifications in CarPlay type to: %@",  (uint8_t *)&v8,  0x16u);
  }

  _AFPreferencesSetAnnounceNotificationsInCarPlayType(a3);
  +[AFTipKitDonator donateAnnounceNotificationsInCarPlaySettingsChange:]( &OBJC_CLASS___AFTipKitDonator,  "donateAnnounceNotificationsInCarPlaySettingsChange:",  a3);
}

- (void)clearAnnounceNotificationsInCarPlayType
{
  id v2 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSettingsClient clearAnnounceNotificationsInCarPlayType]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Clearing announce notifications in CarPlay type.",  (uint8_t *)&v5,  0xCu);
  }

  uint64_t v3 = _AFPreferencesClearAnnounceNotificationsInCarPlayType();
  +[AFTipKitDonator donateAnnounceNotificationsInCarPlaySettingsChange:]( &OBJC_CLASS___AFTipKitDonator,  "donateAnnounceNotificationsInCarPlaySettingsChange:",  _AFPreferencesAnnounceNotificationsInCarPlayType(v3, v4));
}

- (void)setAnnounceNotificationsOnHearingAidsEnabled:(BOOL)a3
{
}

- (void)setAnnounceNotificationsOnHearingAidsSupported:(BOOL)a3
{
}

- (void)setAnnounceNotificationsOnBuiltInSpeakerEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationEnabled = _AFPreferencesGetMessageWithoutConfirmationEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationEnabled);
}

- (void)setMessageWithoutConfirmationEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationInCarPlayEnabled = _AFPreferencesGetMessageWithoutConfirmationInCarPlayEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationInCarPlayEnabled);
}

- (void)setMessageWithoutConfirmationInCarPlayEnabled:(BOOL)a3
{
}

- (void)getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t MessageWithoutConfirmationHeadphonesEnabled = _AFPreferencesGetMessageWithoutConfirmationHeadphonesEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, MessageWithoutConfirmationHeadphonesEnabled);
}

- (void)setMessageWithoutConfirmationHeadphonesEnabled:(BOOL)a3
{
}

- (void)getShowAppsBehindSiriInCarPlayEnabledWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShowAppsBehindSiriInCarPlayEnabled = _AFPreferencesGetShowAppsBehindSiriInCarPlayEnabled();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, ShowAppsBehindSiriInCarPlayEnabled);
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
}

- (void)setOpportuneSpeakingEdgeDetectorSignalOverride:(int64_t)a3
{
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  __int16 v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADSettingsClient setSiriDataSharingOptInStatus:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100333D28;
  v9[3] = &unk_1004FCC00;
  id v10 = v6;
  id v8 = v6;
  -[ADSettingsClient setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]( self,  "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:",  a3,  0LL,  0LL,  @"Legacy setter",  v9);
}

- (void)getSiriDataSharingOptInStatusWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  uint64_t v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADSettingsClient getSiriDataSharingOptInStatusWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v6 = [v5 siriDataSharingOptInStatus];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)setSiriDataSharingOptInStatus:(int64_t)a3 propagateToHomeAccessories:(BOOL)a4 source:(int64_t)a5 reason:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  int v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v22 = "-[ADSettingsClient setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v15 setSiriDataSharingOptInStatus:a3 propagateToHomeAccessories:v9 source:a5 reason:v12 completion:0];

  if (a3 != 1)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100333C88;
    block[3] = &unk_1004FD940;
    block[4] = self;
    dispatch_async(v17, block);

    id v18 = objc_alloc_init(&OBJC_CLASS___ADAnalyticsFBFDeliveryInfrastructure);
    -[ADAnalyticsFBFDeliveryInfrastructure deliverLogViewerIdentifier:](v18, "deliverLogViewerIdentifier:", 0LL);
  }

  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
  dispatch_async(v19, &stru_1004FC9D8);

  if (v13) {
    v13[2](v13, 0LL);
  }
}

- (void)setSiriDataSharingOptInAlertPresented:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  _AFPreferencesSetSiriDataSharingOptInAlertPresented(v4);
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

- (void)setSiriDataSharingHomePodSetupDeviceIsValid:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    BOOL v9 = "-[ADSettingsClient setSiriDataSharingHomePodSetupDeviceIsValid:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v7 setSiriDataSharingHomePodSetupDeviceIsValid:v4];

  if (v5) {
    v5[2](v5);
  }
}

- (void)setIsHomePodInHH2Mode:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[ADSettingsClient setIsHomePodInHH2Mode:completion:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Setting isHomePodInHH2Mode = %d",  (uint8_t *)&v7,  0x12u);
  }

  _AFPreferencesSetIsHomePodInHH2Mode(v4);
  if (v5) {
    v5[2](v5);
  }
}

- (void)sendSampledAudioToServerWithCompletion:(id)a3
{
  id v4 = a3;
  sub_10024FF84(0LL, 1);
  sub_10024FF84(1LL, 1);
  uint64_t v3 = v4;
  if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
    uint64_t v3 = v4;
  }
}

- (void)shouldSuppressSiriDataSharingOptInAlertWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t ShouldSuppressSiriDataSharingOptInAlert = _AFPreferencesShouldSuppressSiriDataSharingOptInAlert();
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, ShouldSuppressSiriDataSharingOptInAlert);
    id v4 = v5;
  }
}

- (void)deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    BOOL v10 = "-[ADSettingsClient deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v8 _deleteSiriHistoryWithContext:v5 withCompletion:v6];
}

- (void)setSearchQueriesDataSharingStatus:(int64_t)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = v6;
    uint64_t Name = AFSearchQueriesDataSharingStatusGetName(a3);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v11 = 136315395;
    id v12 = "-[ADSettingsClient setSearchQueriesDataSharingStatus:completion:]";
    __int16 v13 = 2113;
    int v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Setting Search Queries Data Sharing option to = %{private}@",  (uint8_t *)&v11,  0x16u);
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v10 setSearchQueriesDataSharingStatus:a3];

  if (v5) {
    v5[2](v5);
  }
}

- (void)getSearchQueriesDataSharingStatus:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[ADSettingsClient getSearchQueriesDataSharingStatus:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v6 = [v5 searchQueriesDataSharingStatus];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)isSearchDataSharingStatusForced:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[ADSettingsClient isSearchDataSharingStatusForced:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v6 = [v5 isSearchDataSharingStatusForced];

  if (v3) {
    v3[2](v3, v6);
  }
}

- (void)setOnDeviceDictationAvailableAlertPresented:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v4 _setOnDeviceDictationAvailableAlertPresentedLocal:v3];
}

- (void)setSiriDesignModeEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  _AFPreferencesSetSiriDesignModeEnabled(v4);
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

- (void)siriDesignModeIsEnabled:(id)a3
{
  id v5 = a3;
  uint64_t IsEnabled = _AFPreferencesSiriDesignModeIsEnabled();
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, IsEnabled);
    BOOL v4 = v5;
  }
}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 accessRecordedAudioWithIdentifier:v6 completion:v5];
}

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v13 trimRecordedAudioWithIdentifier:v12 offset:a6 duration:v11 outputFileType:a4 completion:a5];
}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 getRecordedAudioDirectoryPathsWithCompletion:v3];
}

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 isWatchAuthenticatedWithCompletion:v3];
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 pushMyriadAdvertisementContext:v6 completionHandler:v5];
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 pushSCDAAdvertisementContext:v6 completionHandler:v5];
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 getSpeakerCapabilityForAccessoryWithUUID:v6 completionHandler:v5];
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 getAccessoryInfoForAccessoryWithUUID:v6 completionHandler:v5];
}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[ADMyriadSettingsManager sharedSettingsManager]( &OBJC_CLASS___ADMyriadSettingsManager,  "sharedSettingsManager"));
  [v10 getTrialEnables:v9 doubleFactors:v8 withCompletion:v7];
}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[ADMyriadSettingsManager sharedSettingsManager]( &OBJC_CLASS___ADMyriadSettingsManager,  "sharedSettingsManager"));
  [v4 getSidekickBoostsFileWithCompletion:v3];
}

- (void)triggerABCForType:(id)a3 subType:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100333B50;
  v19[3] = &unk_1004FDA30;
  id v20 = v11;
  id v21 = v9;
  id v22 = v10;
  id v23 = v12;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, v19);
}

- (void)adSyncVerificationPartialResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADSettingsClient _serviceDelegate](self, "_serviceDelegate"));
  [v5 syncVerificationPartialResult:v4];
}

- (void)adSyncVerificationServerReport:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADSettingsClient _serviceDelegate](self, "_serviceDelegate"));
  [v5 syncVerificationServerReport:v4];
}

- (void)getCurrentAccessoryInfoWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100333B44;
    v5[3] = &unk_1004FCA00;
    id v6 = v3;
    [v4 getCurrentAccessoryInfoWithCompletion:v5];
  }
}

- (void)setRecognizeMyVoiceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v4 setRecognizeMyVoiceEnabled:v3];
}

- (void)availableLanguagesInTheHome:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v4 availableLanguagesInTheHome:v3];
}

- (void)isJustSiriEnabledInTheHome:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v4 isJustSiriEnabledInTheHome:v3];
}

- (void)setAllowJustSiriHomeKitSetting:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v6 setAllowJustSiriHomeKitSetting:v4 withCompletion:v5];
}

- (void)isVoiceTriggerEnabled:(id)a3
{
  id v5 = a3;
  id v4 = sub_1001EBF24(0LL);
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0LL);
}

- (void)setVoiceTriggerEnabled:(BOOL)a3 withCompletion:(id)a4
{
}

- (void)dumpAssistantState:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 dumpAssistantState]);
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)fetchSharedUserIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserIdentifier]);
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)areSiriUODAssetsAvailable:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(id, uint64_t, void))a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 languageCode]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssetManager sharedInstance](&OBJC_CLASS___ADAssetManager, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetsAvailableStatusForLanguage:v8]);

    uint64_t v7 = AFUODStatusSupportedFull(v6, v8);
    v3[2](v3, v7, 0LL);
  }

- (void)areSiriSAEAssetsAvailable:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);

    id v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ADSettingsClient areSiriSAEAssetsAvailable:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Fetching SAE assets availability for %@ locale",  buf,  0x16u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssetManager sharedInstance](&OBJC_CLASS___ADAssetManager, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100333A1C;
    v9[3] = &unk_1004FCA28;
    id v10 = v5;
    id v11 = v3;
    id v8 = v5;
    [v7 fetchAssetsAvailabilityForLanguage:v8 completion:v9];
  }
}

- (void)getAssetStatusForLanguage:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = (void (**)(id, id))a4;
    id v6 = a3;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssetManager sharedInstance](&OBJC_CLASS___ADAssetManager, "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 assetsAvailableStatusForLanguage:v6]);

    v5[2](v5, v8);
  }

- (void)getAssistantIsEnabledForDeviceWithSiriInfo:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, BOOL, void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"peerData"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = -[ADDeviceCirclePeerData initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___ADDeviceCirclePeerData),  "initWithDictionaryRepresentation:",  v6);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData assistantIdentifier](v8, "assistantIdentifier"));

  id v10 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    id v12 = "-[ADSettingsClient getAssistantIsEnabledForDeviceWithSiriInfo:withCompletion:]";
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Extracted assistant Id - %@",  (uint8_t *)&v11,  0x16u);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (v5) {
LABEL_6:
  }
    v5[2](v5, v9 != 0LL, 0LL);
LABEL_7:
}

- (void)getCurrentActiveLanguageCodesWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 getCurrentASRLanguages]);
    (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0LL);
  }

- (void)getEndpointUUIDsWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100333A0C;
    v5[3] = &unk_1004FCA50;
    id v6 = v3;
    [v4 fetchEndpointUUIDsWithCompletion:v5];
  }
}

- (void)downloadMuxUserDataWithCompletion:(id)a3
{
  id v7 = a3;
  uint64_t v3 = AFDeviceSupportsSiriMUX(v7);
  if ((_DWORD)v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _syncControllerService]);
    [v5 createDownloadTasksForAllUsersWithCompletion:&stru_1004FCA70];
  }

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v3);
    id v6 = v7;
  }
}

- (void)fetchSyncTokenFromCompanionAssistantId:(id)a3 forAceHost:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (AFDeviceSupportsSiriMUX(v9))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100333934;
    v11[3] = &unk_1004FCA98;
    id v12 = v8;
    id v13 = v9;
    [v10 fetchSyncTokenForCompanionAssistantId:v7 aceHost:v12 completion:v11];
  }

  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
}

- (void)readSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (v9)
  {
    if (AFDeviceSupportsSiriMUX(v9))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADMUXSyncTokenManager sharedInstance](&OBJC_CLASS___ADMUXSyncTokenManager, "sharedInstance"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getSyncTokenForAssistantId:v7 aceHost:v8]);
      ((void (**)(void, void *))v10)[2](v10, v12);
    }

    else
    {
      v10[2](v10, 0LL);
    }
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "-[ADSettingsClient readSyncTokenForAssistantId:aceHost:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Completion is nil", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)syncStatusWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = (void (**)(void, void))v3;
  if (v3)
  {
    if (AFDeviceSupportsSiriMUX(v3))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _syncControllerService]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentMuxSyncStatus]);
      ((void (**)(void, void *))v4)[2](v4, v7);
    }

    else
    {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSettingsClient syncStatusWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Completion is nil", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)clearMuxSyncStatusWithCompletion:(id)a3
{
  id v7 = a3;
  uint64_t v3 = AFDeviceSupportsSiriMUX(v7);
  if ((_DWORD)v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _syncControllerService]);
    [v5 clearMuxSyncStatus];
  }

  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v3);
    id v6 = v7;
  }
}

- (void)createRadarForCrashWithReason:(id)a3 process:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (AFDeviceSupportsFileACrashRadar())
    {
      id v10 = objc_alloc_init(&OBJC_CLASS___ADRadarManagerDraft);
      int v11 = (void *)objc_claimAutoreleasedReturnValue([@"Crash issue - " stringByAppendingString:v8]);
      -[ADRadarManagerDraft setTitle:](v10, "setTitle:", v11);

      -[ADRadarManagerDraft setProblemDescription:]( v10,  "setProblemDescription:",  @"Radar triggered via crash signal trap. For more info, see: https://at.apple.com/SieS8l");
      -[ADRadarManagerDraft setIsUserInitiated:](v10, "setIsUserInitiated:", 0LL);
      id v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v13 = v12;
        int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADRadarManagerDraft title](v10, "title"));
        *(_DWORD *)buf = 136315394;
        id v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Attempting to create radar draft for: %@",  buf,  0x16u);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADRadarManager sharedInstance](&OBJC_CLASS___ADRadarManager, "sharedInstance"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1003337F4;
      v18[3] = &unk_1004FCC00;
      id v19 = v9;
      [v15 createDraft:v10 withDisplayReason:0 completionHandler:v18];
    }

    else
    {
      id v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Feature not enabled", buf, 0xCu);
      }

      id v10 = (ADRadarManagerDraft *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 32LL));
      (*((void (**)(id, ADRadarManagerDraft *))v9 + 2))(v9, v10);
    }
  }

  else
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[ADSettingsClient createRadarForCrashWithReason:process:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Completion is nil", buf, 0xCu);
    }
  }
}

- (void)fileARadarWithReason:(id)a3 room:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    int v10 = AFDeviceSupportsFileARadar();
    int v11 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315650;
        id v20 = "-[ADSettingsClient fileARadarWithReason:room:completion:]";
        __int16 v21 = 2112;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@/%@", buf, 0x20u);
      }

      uint64_t v18 = HMAccessoryCategoryTypeHomePod;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1003332B0;
      v16[3] = &unk_1004FCEE8;
      id v17 = v9;
      [v14 fetchAccessoriesInRoom:v8 matchingCategoryTypes:v13 completion:v16];
    }

    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        id v20 = "-[ADSettingsClient fileARadarWithReason:room:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Feature not enabled", buf, 0xCu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 32LL));
      (*((void (**)(id, void *))v9 + 2))(v9, v13);
    }
  }

  else
  {
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[ADSettingsClient fileARadarWithReason:room:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Completion is nil", buf, 0xCu);
    }
  }
}

- (void)setSiriRMVState:(BOOL)a3 foriCloudAltDSID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if ((AFSupportsMultiUser(v8, v9) & 1) == 0)
  {
    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
LABEL_7:
    BOOL v12 = (void *)v11;
    v8[2](v8, v11);

    goto LABEL_8;
  }

  if (!v7)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  0LL,  @"iCloudAltDSID is nil"));
    goto LABEL_7;
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003332A4;
  v13[3] = &unk_1004FCC00;
  int v14 = v8;
  [v10 setSiriRMVState:v6 foriCloudAltDSID:v7 completion:v13];

LABEL_8:
}

- (void)getSiriRMVStateForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((AFSupportsMultiUser(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100333298;
    v10[3] = &unk_1004FCAC0;
    id v11 = v6;
    [v8 getSiriRMVStateForiCloudAltDSID:v5 completion:v10];
  }

  else if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v9);
  }
}

- (void)isVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    [v7 hasVoiceProfileAvailableForiCloudAltDSID:v6 completion:v5];
  }

- (void)getODDDeviceProperties:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ADDeviceProperties);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100333288;
  v6[3] = &unk_1004FCAE8;
  id v7 = v3;
  id v5 = v3;
  -[ADDeviceProperties getODDDevicePropertiesWithCompletion:](v4, "getODDDevicePropertiesWithCompletion:", v6);
}

- (void).cxx_destruct
{
}

@end