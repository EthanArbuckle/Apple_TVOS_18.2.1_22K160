@interface ADMultiUserService
+ (id)sharedService;
- (ADCommunalDeviceUser)deviceOwner;
- (ADCommunalDeviceUser)primaryUser;
- (ADHomeInfoManager)homeInfoManager;
- (BOOL)_homeKitSettingsDidChangeForDeviceOwner;
- (BOOL)_isCurrentLanguageMultiUserCompatible;
- (BOOL)_isHostingMultiUserLanguage;
- (BOOL)_isHubHostingMultiUserLanguage;
- (BOOL)_isTrackingUUIDForInFlightVoiceProfile:(id)a3;
- (BOOL)_multiUserListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_multiUserRemoraListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_profileLimitReached;
- (BOOL)_removeUser:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5 iCloudAltDSID:(id)a6 error:(id *)a7;
- (BOOL)_updateDeviceOwner:(id)a3 sharedUserId:(id)a4 enrollmentName:(id)a5 companionInfo:(id)a6 shareOwnerName:(id)a7 homeMemberSettings:(id)a8 loggingAllowed:(BOOL)a9;
- (BOOL)_updateHomeKitSettings:(id)a3;
- (BOOL)_updateNonHomeUserSettings:(id)a3;
- (BOOL)_updateVoiceProfileInfo;
- (BOOL)allowRmVforHomeUserRecentlyOnboardedWithHomeUserID:(id)a3;
- (BOOL)getAllowExplicitContentSettingForRecognizedUser;
- (BOOL)isMultiUserAvailable;
- (BOOL)isMultiUserInfoDirty;
- (BOOL)isRmVEnabledForHomeUser:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)personalDomainSettingsDidChange:(id)a3 newUserSettings:(id)a4;
- (BOOL)userProfileExistsWithHomeUserID:(id)a3;
- (NSDictionary)rawScores;
- (NSMutableArray)usersWithAvailableVoiceProfiles;
- (NSMutableDictionary)homeUserSettings;
- (NSMutableDictionary)sharedUsersByHomeUserUUID;
- (NSMutableDictionary)sharedUsersBySharedUserID;
- (NSMutableDictionary)sharedUsersByiCloudAltDSID;
- (NSString)cachedAssistantDataUnredactedAnchor;
- (OS_dispatch_queue)queue;
- (SSRVoiceProfileManager)voiceProfileManager;
- (id)_allUsersBySharedUserID;
- (id)_augmentUserPropertiesWithHomeInfoForUser:(id)a3;
- (id)_confidenceScoreForSharedUserID:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(int64_t)a5 confidenceScores:(id)a6;
- (id)_generateDeviceUserWithHomeUserUUID:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 adaccount:(id)a6;
- (id)_getUserAgentStringForSharedUserID:(id)a3;
- (id)_homeMembersForPlatform;
- (id)_inFlightVoiceProfilesByUUID;
- (id)_initWithPreferences:(id)a3 ssrManager:(id)a4 homeInfoManager:(id)a5;
- (id)allUsersBySharedUserID;
- (id)confidenceScoresForMultiUserTestingExpectedSpeakerSharedUserID:(id)a3 expectedSpeakerConfidenceScore:(int64_t)a4 nonspeakerConfidenceScores:(id)a5;
- (id)currentOwnerSharedUserID;
- (id)getAssistantIdentifierForIDS:(id)a3;
- (id)getCloudKitManager;
- (id)getDeviceOwnerSharedUserId;
- (id)getSharedUserIdForHomeUserId:(id)a3;
- (id)getSharedUserIdForShareOwnerName:(id)a3;
- (id)getSyncableSharedUserIdForSharedUserId:(id)a3;
- (id)getSyncableSharedUserIdsForSharedUserIds:(id)a3;
- (id)getUserAgentStringForSharedUserID:(id)a3;
- (id)homeUserIdToNames;
- (id)multiUserSAObject;
- (id)sharedRemoteDevices;
- (id)validateAndReturnScores:(id)a3 classifiedUser:(id)a4 donatedScores:(id)a5 unknownUserSharedId:(id *)a6 totalUsers:(unint64_t *)a7 ghostVoiceProfileDetected:(BOOL *)a8;
- (unint64_t)_countVoiceProfiles;
- (unint64_t)addIfSiriCloudSyncEnabledForUser:(id)a3;
- (unint64_t)countUsersWithLocationServicesEnabled;
- (unint64_t)countUsersWithMatchingSiriLanguage;
- (unint64_t)countUsersWithPersonalRequestsEnabled;
- (unint64_t)countUsersWithSiriCloudSyncEnabled;
- (unint64_t)countVoiceProfiles;
- (void)_addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13;
- (void)_addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10;
- (void)_allowVoiceIdentificationForThisUser:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)_deleteShareForUser:(id)a3;
- (void)_describeSAMultiUserInfo:(id)a3;
- (void)_forceCloudSyncedUserDownload:(id)a3;
- (void)_handleATVUserProfilesRemoved:(id)a3;
- (void)_languageCodeDidChange;
- (void)_languageCodeDidChange:(id)a3 forEndpointUUID:(id)a4;
- (void)_loadCloudSyncedUsersFromCache;
- (void)_logRelevantAnalyticsOnUserAddedWithSharedUserID:(id)a3 isPrimary:(BOOL)a4;
- (void)_notifyRemoraClientsOfAllUsers;
- (void)_notifyRemoraClientsOfDeletedUser:(id)a3;
- (void)_notifyRemoraClientsOfDeviceOwner;
- (void)_notifyRemoraClientsOfUpdatedUser:(id)a3;
- (void)_postRemovalStateCleanup;
- (void)_primaryUserSharedUserIdentifierDidChangeNotification:(id)a3;
- (void)_refreshClientWithMultiUserData:(id)a3;
- (void)_refreshClientsWithMeCard:(id)a3;
- (void)_refreshUsersAndVoiceProfiles:(BOOL)a3;
- (void)_removeGhostVoiceProfiles;
- (void)_resetAllUsers;
- (void)_resetPrimaryUser;
- (void)_saveDeviceOwnerToKeychainCache;
- (void)_savePrimaryAndDeviceOwner;
- (void)_saveSharedUsers;
- (void)_setPrimaryUserMeDevice:(BOOL)a3;
- (void)_setPrimaryUserSiriLanguage:(id)a3;
- (void)_setSharedUserMeDevice:(BOOL)a3 forSharedUser:(id)a4;
- (void)_setSharedUserSiriLanguage:(id)a3 forSharedUser:(id)a4;
- (void)_setupMultiUserListener;
- (void)_setupMultiUserRemoraListener;
- (void)_trackGhostVoiceProfile:(id)a3;
- (void)_trackHomeUserUUIDForInFlightVoiceProfile:(id)a3;
- (void)_untrackAllHomeUserUUIDsForInFlightVoiceProfile;
- (void)_untrackHomeUserUUIDForInFlightVoiceProfile:(id)a3;
- (void)_untrackUUIDsForUser:(id)a3;
- (void)_updateCommunalDeviceUser:(id)a3 withSettings:(id)a4;
- (void)_updateHomeKitSettingsForDeviceOwner;
- (void)_updateMappingsForSharedUser:(id)a3;
- (void)_updateSAMultiUserInfo;
- (void)accessoryLanguageSettingsChanged:(id)a3;
- (void)addCommunalDeviceUser:(id)a3 withAttribute:(id)a4 completion:(id)a5;
- (void)addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13;
- (void)addDeviceOwner:(id)a3 withAttribute:(id)a4 completion:(id)a5;
- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9;
- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10;
- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4 meCards:(id)a5 unredactedAnchor:(id)a6;
- (void)dealloc;
- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)fetchDeviceOwnerAsSAMultiUserInfo:(id)a3;
- (void)getCompanionAssistantIdForRecognizedUser:(id)a3;
- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getConformingSharedUserIds:(id)a3;
- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3;
- (void)getIDSIdentifierForAssistantId:(id)a3 completion:(id)a4;
- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getMultiUserCompanionInfoWithCompletion:(id)a3;
- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3;
- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4;
- (void)getPreferredMediaUserHomeUserIDForAccessoryUUID:(id)a3 completion:(id)a4;
- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3;
- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3;
- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4;
- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSharedUserIdsForiTunesAltDSID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4;
- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getSiriRMVStateForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4;
- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3;
- (void)getiCloudUserIdForSharedUserId:(id)a3 completion:(id)a4;
- (void)homeUserIdToNames:(id)a3;
- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4;
- (void)isCompanionAvailableOnWiFiWithAssistantId:(id)a3 completion:(id)a4;
- (void)localMeCardDidUpdate:(id)a3;
- (void)refreshHomeKitOnboardedUsers;
- (void)removeCommunalDeviceUserBySharedUserID:(id)a3 completion:(id)a4;
- (void)removeDeviceOwner;
- (void)removeUserWithHomeUUID:(id)a3 completion:(id)a4;
- (void)removeUserWithShareOwnerNames:(id)a3 completion:(id)a4;
- (void)removeUserWithSharedUserID:(id)a3 completion:(id)a4;
- (void)resetAllUsers;
- (void)saveHomeUserIdsForICloudAltDSID:(id)a3 homeMemberships:(id)a4;
- (void)setCachedAssistantDataUnredactedAnchor:(id)a3;
- (void)setDeviceOwner:(id)a3;
- (void)setEnrollmentName:(id)a3 forHomeUser:(id)a4;
- (void)setHomeInfoManager:(id)a3;
- (void)setHomeUserSettings:(id)a3;
- (void)setIsMultiUserInfoDirty:(BOOL)a3;
- (void)setLocalMeCard:(id)a3 completion:(id)a4;
- (void)setPrimaryUser:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRawScores:(id)a3;
- (void)setShareOwnerName:(id)a3 homeMemberSettings:(id)a4 audioAppSignals:(id)a5 loggingAllowed:(BOOL)a6 forSharedUserId:(id)a7;
- (void)setSharedUsersByHomeUserUUID:(id)a3;
- (void)setSharedUsersBySharedUserID:(id)a3;
- (void)setSharedUsersByiCloudAltDSID:(id)a3;
- (void)setSiriRMVState:(BOOL)a3 foriCloudAltDSID:(id)a4 completion:(id)a5;
- (void)setUsersWithAvailableVoiceProfiles:(id)a3;
- (void)setVoiceProfileManager:(id)a3;
- (void)showMultiUserSharedUserIDsCompletion:(id)a3;
- (void)showMultiUsersWithCompletion:(id)a3;
- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3;
- (void)syncATVRmVSettingIfAvailable;
- (void)syncToCloudATVRmVSetting:(BOOL)a3 homeID:(id)a4 homeUserID:(id)a5 notifyClients:(BOOL)a6;
- (void)triggerATVRmVStateChangeForiCloudAltDSID:(id)a3 homeUserID:(id)a4 toState:(int64_t)a5;
- (void)triggerMultiUserMetricsWithCompletion:(id)a3;
- (void)triggerVoiceProfileUploadWithCompletion:(id)a3;
- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5;
- (void)updateRmVForUserProfilesWithLanguageCode:(id)a3;
- (void)updateVoiceProfiles;
- (void)voiceProfilesOutOfSync;
@end

@implementation ADMultiUserService

- (id)_initWithPreferences:(id)a3 ssrManager:(id)a4 homeInfoManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___ADMultiUserService;
  v12 = -[ADMultiUserService init](&v48, "init");
  if (v12)
  {
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("MultiUserServiceQueue", v14);

    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_adPreferences, a3);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[ADCommunalDeviceUser saHomeMemberInfo:](&OBJC_CLASS___ADCommunalDeviceUser, "saHomeMemberInfo:", 0LL));
    saUnknownUser = v12->_saUnknownUser;
    v12->_saUnknownUser = (SAHomeMemberInfo *)v17;

    objc_storeStrong((id *)&v12->_voiceProfileManager, a4);
    objc_storeStrong((id *)&v12->_homeInfoManager, a5);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v9 languageCode]);
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = (void *)AFDefaultLanguageCode;
    }
    objc_storeStrong((id *)&v12->_currentLanguage, v21);

    -[ADMultiUserService _loadCloudSyncedUsersFromCache](v12, "_loadCloudSyncedUsersFromCache");
    if (-[ADMultiUserService _isHostingMultiUserLanguage](v12, "_isHostingMultiUserLanguage")) {
      -[ADMultiUserService _refreshUsersAndVoiceProfiles:](v12, "_refreshUsersAndVoiceProfiles:", 0LL);
    }
    else {
      -[ADMultiUserService resetAllUsers](v12, "resetAllUsers");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v12 selector:"_primaryUserSharedUserIdentifierDidChangeNotification:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:v9];
    [v22 addObserver:v12 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    [v22 addObserver:v12 selector:"_languageCodeDidChange" name:AFLanguageCodeDidChangeNotification object:0];
    [v22 addObserver:v12 selector:"_handleATVUserProfilesRemoved:" name:@"ADUserProfilesRemovedNotification" object:0];
    v12->_liveOnToken = -1;
    objc_initWeak(&location, v12);
    v23 = (dispatch_queue_s *)v12->_queue;
    v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472LL;
    v44 = sub_100299EB8;
    v45 = &unk_1004F8E08;
    objc_copyWeak(&v46, &location);
    if (notify_register_dispatch("com.apple.siri.corespeech.voiceprofilelist.change", &v12->_liveOnToken, v23, &v42))
    {
      v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ADMultiUserService _initWithPreferences:ssrManager:homeInfoManager:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Failed to listen to ProfileListModification change",  buf,  0xCu);
      }
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext", v42, v43, v44, v45));
    instanceContext = v12->_instanceContext;
    v12->_instanceContext = (AFInstanceContext *)v25;

    unsigned __int8 v27 = -[AFInstanceContext isEndpoint](v12->_instanceContext, "isEndpoint");
    v28 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v29 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if ((v27 & 1) != 0)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ADMultiUserService _initWithPreferences:ssrManager:homeInfoManager:]";
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Endpoint is listening for MU updates from hub",  buf,  0xCu);
      }

      -[ADMultiUserService _setupMultiUserRemoraListener](v12, "_setupMultiUserRemoraListener");
    }

    else
    {
      if (v29)
      {
        *(_DWORD *)buf = 136315138;
        v50 = "-[ADMultiUserService _initWithPreferences:ssrManager:homeInfoManager:]";
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Hub is registering for endpoint lifecycle changes",  buf,  0xCu);
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
      homeHubManager = v12->_homeHubManager;
      v12->_homeHubManager = (SHAFHomeHubManager *)v30;

      -[SHAFHomeHubManager registerObserverForEndpointLifeCycleChanges:]( v12->_homeHubManager,  "registerObserverForEndpointLifeCycleChanges:",  v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v32 addObserver:v12 selector:"accessoryLanguageSettingsChanged:" name:@"RemoraHomeKitSettingsLanguageChangeNotification" object:0];

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocalMeCardStore sharedStore](&OBJC_CLASS___ADLocalMeCardStore, "sharedStore"));
      [v33 addMeCardObserver:v12];
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[ADAssistantDataManager sharedDataManager]( &OBJC_CLASS___ADAssistantDataManager,  "sharedDataManager"));
    [v34 addObserver:v12];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    useriCloudAltDSIDsSettingRmVFromTV = v12->_useriCloudAltDSIDsSettingRmVFromTV;
    v12->_useriCloudAltDSIDsSettingRmVFromTV = (NSMutableSet *)v35;

    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    homeUserIDsToBeOnboarded = v12->_homeUserIDsToBeOnboarded;
    v12->_homeUserIDsToBeOnboarded = (NSMutableSet *)v37;

    id v39 = -[ADMultiUserService _setupMultiUserListener](v12, "_setupMultiUserListener");
    v12->isATVOnly = AFIsATV(v39, v40);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
  int liveOnToken = self->_liveOnToken;
  if (liveOnToken != -1) {
    notify_cancel(liveOnToken);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADMultiUserService;
  -[ADMultiUserService dealloc](&v5, "dealloc");
}

- (void)_languageCodeDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100299D80;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)allUsersBySharedUserID
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10028D180;
  id v11 = sub_10028D190;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100299D48;
  v6[3] = &unk_1004FCDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_allUsersBySharedUserID
{
  if (!self->_sharedUsersBySharedUserID)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
    self->_sharedUsersBySharedUserID = v3;
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
    [v5 setObject:primaryUser forKey:v7];
  }

  deviceOwner = self->_deviceOwner;
  if (deviceOwner && !self->_primaryUser)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_deviceOwner, "sharedUserID"));
    [v5 setObject:deviceOwner forKey:v9];
  }

  [v5 addEntriesFromDictionary:self->_sharedUsersBySharedUserID];
  id v10 = [v5 copy];

  return v10;
}

- (id)getCloudKitManager
{
  return +[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager");
}

- (void)_setupMultiUserListener
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADMultiUserService _setupMultiUserListener]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Setting up MultiUser listener with signpost",  (uint8_t *)&v9,  0xCu);
  }

  os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextMultiUser);
  objc_super v5 = (os_log_s *)AFSiriLogContextMultiUser;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "MultiUserService",  "Setting up MultiUser listener",  (uint8_t *)&v9,  2u);
  }

  self->multiUserSignpost = v4;
  uint64_t v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantMultiUserServiceName));
  multiUserListener = self->_multiUserListener;
  self->_multiUserListener = v7;

  -[NSXPCListener setDelegate:](self->_multiUserListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_multiUserListener, "resume");
}

- (BOOL)_multiUserListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v4, kAssistantMultiUserEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v6 = [v4 processIdentifier];
    uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[ADMultiUserService _multiUserListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s %@ MultiUser Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFMultiUserService));
    [v4 setExportedInterface:v8];

    [v4 setExportedObject:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100299BD8;
    v13[3] = &unk_1004F9D00;
    unsigned int v14 = v6;
    [v4 setInvalidationHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100299C90;
    v11[3] = &unk_1004F9D00;
    unsigned int v12 = v6;
    [v4 setInterruptionHandler:v11];
    [v4 resume];
  }

  else
  {
    int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ADMultiUserService _multiUserListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s %@ MultiUser Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupMultiUserRemoraListener
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADMultiUserService _setupMultiUserRemoraListener]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Setting up MultiUser Remora listener",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantMultiUserUpdateServiceName));
  multiUserRemoraListener = self->_multiUserRemoraListener;
  self->_multiUserRemoraListener = v4;

  -[NSXPCListener setDelegate:](self->_multiUserRemoraListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_multiUserRemoraListener, "resume");
}

- (BOOL)_multiUserRemoraListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v4, kAssistantMultiUserUpdateEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v6 = [v4 processIdentifier];
    uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[ADMultiUserService _multiUserRemoraListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 1024;
      unsigned int v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s %@ MultiUserRemora Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SHAFMultiUserRemoraService));
    [v4 setExportedInterface:v8];

    [v4 setExportedObject:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100299A68;
    v13[3] = &unk_1004F9D00;
    unsigned int v14 = v6;
    [v4 setInvalidationHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100299B20;
    v11[3] = &unk_1004F9D00;
    unsigned int v12 = v6;
    [v4 setInterruptionHandler:v11];
    [v4 resume];
  }

  else
  {
    int v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[ADMultiUserService _multiUserRemoraListenerShouldAcceptNewConnection:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s %@ MultiUserRemora Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  unsigned int v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_multiUserListener == v6)
  {
    unsigned __int8 v9 = -[ADMultiUserService _multiUserListenerShouldAcceptNewConnection:]( self,  "_multiUserListenerShouldAcceptNewConnection:",  v7);
LABEL_6:
    BOOL v8 = v9;
    goto LABEL_7;
  }

  if (self->_multiUserRemoraListener == v6)
  {
    unsigned __int8 v9 = -[ADMultiUserService _multiUserRemoraListenerShouldAcceptNewConnection:]( self,  "_multiUserRemoraListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_6;
  }

  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (void)_primaryUserSharedUserIdentifierDidChangeNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002997B8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)refreshHomeKitOnboardedUsers
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100298D24;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_refreshUsersAndVoiceProfiles:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v114 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v115 = 1024;
    LODWORD(v116) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s liveOnOnboardedProfilesDidChange = %{BOOL}d",  buf,  0x12u);
  }

  BOOL v75 = v3;
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned __int8 v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    *(_DWORD *)buf = 136315394;
    v114 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v115 = 2112;
    v116 = currentLanguage;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s _currentLanguage = %@", buf, 0x16u);
  }

  v76 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForLocale:]( self->_voiceProfileManager,  "provisionedVoiceProfilesForLocale:",  self->_currentLanguage));
  unsigned int v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v13 = v12;
    unsigned int v14 = (NSString *)[v11 count];
    *(_DWORD *)buf = 136315394;
    v114 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
    __int16 v115 = 2048;
    v116 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s allUsers count = %lu", buf, 0x16u);
  }

  v78 = v7;
  v79 = v6;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (!v15)
  {
    char v77 = 0;
    goto LABEL_32;
  }

  id v16 = v15;
  char v77 = 0;
  uint64_t v17 = *(void *)v106;
  uint64_t v18 = SSRSpeakerRecognitionSiriDebugAppDomain;
  uint64_t v19 = SSRSpeakerRecognitionSiriAppDomain;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v106 != v17) {
        objc_enumerationMutation(obj);
      }
      v21 = *(NSString **)(*((void *)&v105 + 1) + 8LL * (void)i);
      v22 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v23 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v23)
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
        __int16 v115 = 2112;
        v116 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s user = %@", buf, 0x16u);
      }

      if (AFIsInternalInstall(v23))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSString appDomain](v21, "appDomain"));
        unsigned int v25 = [v24 isEqualToString:v18];

        if (v25)
        {
          -[NSMutableArray addObject:](v79, "addObject:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSString sharedSiriId](v21, "sharedSiriId"));
          -[NSMutableSet addObject:](v78, "addObject:", v26);
        }
      }

      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSString appDomain](v21, "appDomain"));
      if ([v27 isEqualToString:v19])
      {
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSString appDomain](v21, "appDomain"));
        unsigned int v29 = [v28 isEqualToString:v18];

        if (!v29) {
          continue;
        }
      }

      if (!self->_usersWithAvailableVoiceProfiles)
      {
        uint64_t v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
        self->_usersWithAvailableVoiceProfiles = v30;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSString sharedSiriId](v21, "sharedSiriId"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pitch](v21, "pitch"));
      if (v32)
      {
        if ((-[NSMutableArray containsObject:]( self->_usersWithAvailableVoiceProfiles,  "containsObject:",  v32) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_usersWithAvailableVoiceProfiles, "addObject:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", v32));
          -[ADMultiUserService _untrackUUIDsForUser:](self, "_untrackUUIDsForUser:", v34);

          char v77 = 1;
        }

        if (v33) {
          [v80 addObject:v33];
        }
      }
    }

    id v16 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
  }

  while (v16);
LABEL_32:

  uint64_t v35 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v80));
  pitchesForHomeMembers = self->_pitchesForHomeMembers;
  self->_pitchesForHomeMembers = v35;

  uint64_t v37 = v76;
  if (v75)
  {
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    v38 = self->_sharedUsersBySharedUserID;
    id v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v101,  v111,  16LL);
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v102;
      do
      {
        for (j = 0LL; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v102 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v101 + 1) + 8LL * (void)j);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", v43));
        }

        id v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v101,  v111,  16LL);
      }

      while (v40);
    }

    id v45 = -[NSMutableSet count](v76, "count");
    if (v45 <= -[NSMutableSet count](v78, "count"))
    {
      id v52 = -[NSMutableSet count](v78, "count");
      if (v52 <= -[NSMutableSet count](v76, "count")
        && (-[NSMutableSet isEqual:](v76, "isEqual:", v78) & 1) == 0)
      {
        v53 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v114 = "-[ADMultiUserService _refreshUsersAndVoiceProfiles:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s Counts are same, but users are different. Falling down to best effort",  buf,  0xCu);
        }
      }
    }

    else
    {
      -[NSMutableSet minusSet:](v76, "minusSet:", v78);
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      id v46 = v76;
      id v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v97,  v110,  16LL);
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v98;
        do
        {
          for (k = 0LL; k != v48; k = (char *)k + 1)
          {
            if (*(void *)v98 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)k);
            v92 = _NSConcreteStackBlock;
            uint64_t v93 = 3221225472LL;
            v94 = sub_100298A5C;
            v95 = &unk_1004FBD90;
            uint64_t v96 = v51;
            -[ADMultiUserService removeUserWithSharedUserID:completion:](self, "removeUserWithSharedUserID:completion:");
          }

          id v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v97,  v110,  16LL);
        }

        while (v48);
      }
    }
  }

  if (self->_primaryUser)
  {
    __int128 v91 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v88 = 0u;
    v81 = v79;
    id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v88,  v109,  16LL);
    if (!v54) {
      goto LABEL_70;
    }
    id v55 = v54;
    uint64_t v56 = *(void *)v89;
    while (1)
    {
      v57 = 0LL;
      do
      {
        if (*(void *)v89 != v56) {
          objc_enumerationMutation(v81);
        }
        v58 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 sharedSiriId]);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v58 homeId]);
        uint64_t v61 = objc_claimAutoreleasedReturnValue([v58 userName]);
        uint64_t v62 = SiriCoreUUIDStringCreate(v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        uint64_t v64 = SiriCoreUUIDStringCreate(v63);
        uint64_t v65 = objc_claimAutoreleasedReturnValue(v64);
        v66 = (void *)v65;
        if (v60)
        {
          if (v59) {
            goto LABEL_63;
          }
        }

        else
        {
          uint64_t v69 = SiriCoreUUIDStringCreate(v65);
          uint64_t v65 = objc_claimAutoreleasedReturnValue(v69);
          v60 = (void *)v65;
          if (v59) {
            goto LABEL_63;
          }
        }

        uint64_t v70 = SiriCoreUUIDStringCreate(v65);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v70);
LABEL_63:
        v86[0] = _NSConcreteStackBlock;
        v67 = @"whatsinaname";
        if (v61) {
          v67 = (__CFString *)v61;
        }
        v86[1] = 3221225472LL;
        v86[2] = sub_100298B30;
        v86[3] = &unk_1004FBD90;
        v87 = v67;
        v68 = v67;
        LOBYTE(v74) = 1;
        -[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloudSyncedUser:completion:]( self,  "addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloudSyncedUser:completion:",  v60,  v59,  v63,  v66,  v68,  0LL,  v74,  v86);

        v57 = (char *)v57 + 1;
      }

      while (v55 != v57);
      id v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v81,  "countByEnumeratingWithState:objects:count:",  &v88,  v109,  16LL);
      id v55 = v71;
      if (!v71)
      {
LABEL_70:

        v72 = v79;
        uint64_t v37 = v76;
        goto LABEL_73;
      }
    }
  }

  v72 = v79;
  if (-[NSMutableArray count](v79, "count")) {
    -[NSMutableArray removeAllObjects](v79, "removeAllObjects");
  }
LABEL_73:
  if ((-[NSMutableArray count](v72, "count") != 0LL) | v77 & 1)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100298C68;
    block[3] = &unk_1004FD968;
    v84 = v72;
    v85 = self;
    dispatch_async(queue, block);
  }
}

- (void)_handleATVUserProfilesRemoved:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[ADMultiUserService _handleATVUserProfilesRemoved:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0LL;
  }
  id v9 = v8;
  id v10 = v9;
  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100298628;
    v13[3] = &unk_1004FD968;
    id v14 = v9;
    id v15 = self;
    dispatch_async(queue, v13);
  }

  else
  {
    unsigned int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[ADMultiUserService _handleATVUserProfilesRemoved:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Invalid notification data", buf, 0xCu);
    }
  }
}

- (void)_updateMappingsForSharedUser:(id)a3
{
  id v4 = a3;
  if (!self->_sharedUsersBySharedUserID)
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
    self->_sharedUsersBySharedUserID = v5;
  }

  if (!self->_sharedUsersByHomeUserUUID)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
    self->_sharedUsersByHomeUserUUID = v7;
  }

  if (!self->_sharedUsersByiCloudAltDSID)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedUsersByiCloudAltDSID = self->_sharedUsersByiCloudAltDSID;
    self->_sharedUsersByiCloudAltDSID = v9;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserID]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 homeUserUUID]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v4 iCloudAltDSID]);
  id v15 = v13;
  if (v11) {
    id v13 = -[NSMutableDictionary setObject:forKey:](self->_sharedUsersBySharedUserID, "setObject:forKey:", v4, v11);
  }
  if (v12)
  {
    -[NSMutableDictionary setObject:forKey:](self->_sharedUsersByHomeUserUUID, "setObject:forKey:", v4, v12);
    id v16 = v12;
LABEL_13:
    -[ADMultiUserService _trackHomeUserUUIDForInFlightVoiceProfile:]( self,  "_trackHomeUserUUIDForInFlightVoiceProfile:",  v16);
    goto LABEL_14;
  }

  int v17 = AFIsATV(v13, v14);
  if (v11)
  {
    id v16 = v11;
    if (v17) {
      goto LABEL_13;
    }
  }

- (void)_loadCloudSyncedUsersFromCache
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences multiUserPrimaryUser](self->_adPreferences, "multiUserPrimaryUser"));
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id obj = v2;
  id v3 = [v2 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v76 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          BOOL v8 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
          id v9 = v7;
          id v10 = (void *)objc_claimAutoreleasedReturnValue([obj valueForKey:v8]);
          *(_DWORD *)buf = 136315651;
          v80 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
          __int16 v81 = 2112;
          uint64_t v82 = (uint64_t)v8;
          __int16 v83 = 2113;
          v84 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s primaryUser key (%@), value (%{private}@)",  buf,  0x20u);
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v75 objects:v89 count:16];
    }

    while (v4);
  }

  id v11 = self;
  if (obj)
  {
    unsigned int v12 = -[ADCommunalDeviceUser initWithDictionary:attribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUser),  "initWithDictionary:attribute:",  obj,  0LL);
    primaryUser = self->_primaryUser;
    self->_primaryUser = v12;

    objc_storeStrong((id *)&self->_deviceOwner, self->_primaryUser);
    -[ADMultiUserService _saveDeviceOwnerToKeychainCache](self, "_saveDeviceOwnerToKeychainCache");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));

    if (v14)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
    }

    else
    {
      uint64_t v19 = AFIsATV(v15, v16);
      if (!(_DWORD)v19
        || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID")),
            v21,
            !v21))
      {
LABEL_17:
        if (AFIsATV(v19, v20))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));
          uint64_t v23 = _AFPreferencesSiriRMVSetting(v22);

          v24 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "-[ADMultiUserService _loadCloudSyncedUsersFromCache]";
            __int16 v81 = 2048;
            uint64_t v82 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s primaryUser RMV setting, value (%ld)",  buf,  0x16u);
          }

          if (v23 == 3 || !v23)
          {
            voiceProfileManager = self->_voiceProfileManager;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
            id v27 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  v26,  0LL);
          }
        }

        goto LABEL_23;
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
    }

    uint64_t v18 = (void *)v17;
    -[ADMultiUserService _trackHomeUserUUIDForInFlightVoiceProfile:]( self,  "_trackHomeUserUUIDForInFlightVoiceProfile:",  v17);

    goto LABEL_17;
  }

- (void)_resetPrimaryUser
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    unsigned int v12 = "-[ADMultiUserService _resetPrimaryUser]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }

  if (self->_primaryUser
    && (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
  {
    voiceProfileManager = self->_voiceProfileManager;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
    id v6 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  v5,  0LL);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v7 setMultiUserPrimaryUser:0];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
  id v9 = [v8 copy];
  -[ADMultiUserService _notifyRemoraClientsOfDeletedUser:](self, "_notifyRemoraClientsOfDeletedUser:", v9);

  primaryUser = self->_primaryUser;
  self->_primaryUser = 0LL;
}

- (void)_resetAllUsers
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = "-[ADMultiUserService _resetAllUsers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v4 = self->_sharedUsersBySharedUserID;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( self->_voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i),  0LL);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    }

    while (v6);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = self->_sharedUsersByiCloudAltDSID;
  id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)j);
        -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v15,  0LL,  3LL,  (void)v26);
        -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v15,  0LL,  0LL);
      }

      id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v12);
  }

  primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](primaryUser, "iCloudAltDSID"));
    -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v17,  0LL,  3LL);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));
    -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v18,  0LL,  0LL);
  }

  -[NSMutableDictionary removeAllObjects](self->_sharedUsersBySharedUserID, "removeAllObjects", (void)v26);
  -[NSMutableDictionary removeAllObjects](self->_sharedUsersByHomeUserUUID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sharedUsersByiCloudAltDSID, "removeAllObjects");
  uint64_t v19 = self->_primaryUser;
  if (v19)
  {
    voiceProfileManager = self->_voiceProfileManager;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v19, "sharedUserID"));
    id v22 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  v21,  0LL);

    uint64_t v23 = self->_primaryUser;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  self->_primaryUser = 0LL;

  deviceOwner = self->_deviceOwner;
  self->_deviceOwner = 0LL;

  -[ADMultiUserService _savePrimaryAndDeviceOwner](self, "_savePrimaryAndDeviceOwner");
  -[ADMultiUserService _saveDeviceOwnerToKeychainCache](self, "_saveDeviceOwnerToKeychainCache");
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v25 setMultiUserSharedUsers:0];
}

- (void)_forceCloudSyncedUserDownload:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADMultiUserService _forceCloudSyncedUserDownload:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADMultiUserService _forceCloudSyncedUserDownload:]";
    uint64_t v7 = "%s Sidekick instance, ignoring Cloud sync path";
    goto LABEL_10;
  }

  if (-[ADMultiUserService _isHostingMultiUserLanguage](self, "_isHostingMultiUserLanguage"))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService getCloudKitManager](self, "getCloudKitManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100298528;
    v9[3] = &unk_1004FCC00;
    id v10 = v4;
    [v8 forceMultiUserSync:0 download:1 activity:0 completion:v9];

    goto LABEL_13;
  }

  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[ADMultiUserService _forceCloudSyncedUserDownload:]";
    uint64_t v7 = "%s Current Language is not supported for Multiuser. Skipping _forceCloudSyncedUserDownload!";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
  }

- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADMultiUserService downloadVoiceProfileForiCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService getCloudKitManager](self, "getCloudKitManager"));
  [v9 downloadVoiceProfileForiCloudAltDSID:v6 completion:v7];
}

- (void)triggerVoiceProfileUploadWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    BOOL v8 = "-[ADMultiUserService triggerVoiceProfileUploadWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService getCloudKitManager](self, "getCloudKitManager"));
  [v6 triggerVoiceProfileUploadWithCompletion:v4];
}

- (BOOL)isMultiUserAvailable
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002984D8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isHostingMultiUserLanguage
{
  return -[ADMultiUserService _isHubHostingMultiUserLanguage](self, "_isHubHostingMultiUserLanguage");
}

- (BOOL)_isCurrentLanguageMultiUserCompatible
{
  v2 = self->_currentLanguage;
  uint64_t v3 = AFPreferencesSupportedMultiUserLanguages();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2 && ([v4 containsObject:v2] & 1) != 0)
  {
    BOOL v6 = 1;
  }

  else
  {
    int v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      int v10 = "-[ADMultiUserService _isCurrentLanguageMultiUserCompatible]";
      __int16 v11 = 2112;
      id v12 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Current language %@ not supported for multi-user",  (uint8_t *)&v9,  0x16u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (id)getDeviceOwnerSharedUserId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService deviceOwner](self, "deviceOwner"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedUserID]);

  return v3;
}

- (BOOL)_isHubHostingMultiUserLanguage
{
  uint64_t v3 = AFPreferencesSupportedMultiUserLanguages(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  if (self->_currentLanguage) {
    unsigned __int8 v6 = objc_msgSend(v4, "containsObject:");
  }
  else {
    unsigned __int8 v6 = 0;
  }
  unsigned __int8 v24 = v6;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    if (*((_BYTE *)v22 + 24)) {
      int v9 = @"is";
    }
    else {
      int v9 = @"is not";
    }
    *(_DWORD *)buf = 136315650;
    __int128 v26 = "-[ADMultiUserService _isHubHostingMultiUserLanguage]";
    __int16 v27 = 2112;
    __int128 v28 = (const __CFString *)currentLanguage;
    __int16 v29 = 2112;
    __int128 v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Hub language (%@) %@ MultiUser compatible",  buf,  0x20u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoriesLanguages]);
  id v12 = [v11 mutableCopy];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1002983A8;
  v18[3] = &unk_1004F8EB8;
  id v13 = v5;
  id v19 = v13;
  uint64_t v20 = &v21;
  [v12 enumerateKeysAndObjectsUsingBlock:v18];
  uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v22 + 24)) {
      uint64_t v15 = @"is";
    }
    else {
      uint64_t v15 = @"is not";
    }
    *(_DWORD *)buf = 136315394;
    __int128 v26 = "-[ADMultiUserService _isHubHostingMultiUserLanguage]";
    __int16 v27 = 2112;
    __int128 v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Hub %@ currently supporting at least one MultiUser language",  buf,  0x16u);
  }

  BOOL v16 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
  return v16;
}

- (id)_inFlightVoiceProfilesByUUID
{
  inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
  if (!inFlightVoiceProfilesByUUID)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_inFlightVoiceProfilesByUUID;
    self->_inFlightVoiceProfilesByUUID = v4;

    inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
  }

  return inFlightVoiceProfilesByUUID;
}

- (void)_trackHomeUserUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
    unsigned __int8 v6 = [v5 containsObject:v4];

    if ((v6 & 1) == 0)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
      [v7 addObject:v4];

      uint64_t v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
        int v10 = v8;
        int v11 = 136315651;
        id v12 = "-[ADMultiUserService _trackHomeUserUUIDForInFlightVoiceProfile:]";
        __int16 v13 = 2113;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = -[NSMutableSet count](inFlightVoiceProfilesByUUID, "count");
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Tracking voice profile in-flight for %{private}@. Total profiles in-flight: %lu",  (uint8_t *)&v11,  0x20u);
      }
    }
  }
}

- (void)_untrackHomeUserUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
    unsigned int v6 = [v5 containsObject:v4];

    if (v6)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
      [v7 removeObject:v4];

      uint64_t v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
        int v10 = v8;
        int v11 = 136315651;
        id v12 = "-[ADMultiUserService _untrackHomeUserUUIDForInFlightVoiceProfile:]";
        __int16 v13 = 2113;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = -[NSMutableSet count](inFlightVoiceProfilesByUUID, "count");
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Untracking voice profile in-flight for %{private}@. Total profiles in-flight: %lu",  (uint8_t *)&v11,  0x20u);
      }
    }
  }
}

- (void)_untrackUUIDsForUser:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 homeUserUUID]);
  -[ADMultiUserService _untrackHomeUserUUIDForInFlightVoiceProfile:]( self,  "_untrackHomeUserUUIDForInFlightVoiceProfile:",  v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserID]);
  -[ADMultiUserService _untrackHomeUserUUIDForInFlightVoiceProfile:]( self,  "_untrackHomeUserUUIDForInFlightVoiceProfile:",  v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 iCloudAltDSID]);
  -[ADMultiUserService _untrackHomeUserUUIDForInFlightVoiceProfile:]( self,  "_untrackHomeUserUUIDForInFlightVoiceProfile:",  v7);
}

- (BOOL)_isTrackingUUIDForInFlightVoiceProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 homeUserUUID]);
    unsigned __int8 v7 = [v5 containsObject:v6];

    if ((v7 & 1) != 0
      || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID")),
          int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserID]),
          unsigned __int8 v10 = [v8 containsObject:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      unsigned __int8 v11 = 1;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 iCloudAltDSID]);
      unsigned __int8 v11 = [v12 containsObject:v13];
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_untrackAllHomeUserUUIDsForInFlightVoiceProfile
{
  uint64_t v3 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    inFlightVoiceProfilesByUUID = self->_inFlightVoiceProfilesByUUID;
    id v5 = v3;
    int v7 = 136315394;
    uint64_t v8 = "-[ADMultiUserService _untrackAllHomeUserUUIDsForInFlightVoiceProfile]";
    __int16 v9 = 2048;
    id v10 = -[NSMutableSet count](inFlightVoiceProfilesByUUID, "count");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Untracking all UUIDs for in-flight voice profiles. Total profiles in-flight was: %lu",  (uint8_t *)&v7,  0x16u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
  [v6 removeAllObjects];
}

- (BOOL)_updateVoiceProfileInfo
{
  usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
  if (!usersWithAvailableVoiceProfiles
    || (-[NSMutableArray removeAllObjects](usersWithAvailableVoiceProfiles, "removeAllObjects"),
        !self->_usersWithAvailableVoiceProfiles))
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = self->_usersWithAvailableVoiceProfiles;
    self->_usersWithAvailableVoiceProfiles = v4;
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    *(_DWORD *)buf = 136315394;
    v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 2112;
    id v40 = currentLanguage;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s _currentLanguage = %@", buf, 0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForLocale:]( self->_voiceProfileManager,  "provisionedVoiceProfilesForLocale:",  self->_currentLanguage));
  __int16 v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    unsigned __int8 v11 = (NSString *)[v8 count];
    *(_DWORD *)buf = 136315394;
    v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 2048;
    id v40 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s allUsers = %lu", buf, 0x16u);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v12)
  {
    char v29 = 0;
    goto LABEL_26;
  }

  id v13 = v12;
  char v29 = 0;
  uint64_t v14 = *(void *)v33;
  uint64_t v15 = SSRSpeakerRecognitionSiriAppDomain;
  uint64_t v16 = SSRSpeakerRecognitionSiriDebugAppDomain;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 appDomain]);
      if ([v19 isEqualToString:v15])
      {
      }

      else
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 appDomain]);
        unsigned int v21 = [v20 isEqualToString:v16];

        if (!v21) {
          continue;
        }
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 sharedSiriId]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 pitch]);
      if (v22)
      {
        if ((-[NSMutableArray containsObject:]( self->_usersWithAvailableVoiceProfiles,  "containsObject:",  v22) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_usersWithAvailableVoiceProfiles, "addObject:", v22);
          unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersBySharedUserID, "objectForKey:", v22));
          -[ADMultiUserService _untrackUUIDsForUser:](self, "_untrackUUIDsForUser:", v24);

          char v29 = 1;
        }

        if (v23) {
          [v30 addObject:v23];
        }
      }
    }

    id v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  }

  while (v13);
LABEL_26:

  unsigned int v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v30));
  pitchesForHomeMembers = self->_pitchesForHomeMembers;
  self->_pitchesForHomeMembers = v25;

  __int16 v27 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[ADMultiUserService _updateVoiceProfileInfo]";
    __int16 v39 = 1024;
    LODWORD(v40) = v29 & 1;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Voice Profiles Did Update: %d", buf, 0x12u);
  }

  return v29 & 1;
}

- (unint64_t)_countVoiceProfiles
{
  voiceProfileManager = self->_voiceProfileManager;
  if (voiceProfileManager)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]( voiceProfileManager,  "provisionedVoiceProfilesForAppDomain:withLocale:",  @"com.apple.siri",  0LL));
    id v4 = [v3 count];

    return (unint64_t)v4;
  }

  else
  {
    unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADMultiUserService _countVoiceProfiles]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s SSRVoiceProfileManager not available",  (uint8_t *)&v7,  0xCu);
    }

    return -1LL;
  }

- (unint64_t)countVoiceProfiles
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100298378;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)addIfSiriCloudSyncEnabledForUser:(id)a3
{
  id v4 = a3;
  id v5 = sub_10016ABE0(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersSiriCloudSyncBySharedUserID,  "objectForKey:",  v4));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersSiriCloudSyncBySharedUserID,  "objectForKey:",  v4));
    unsigned int v9 = [v8 BOOLValue];

    if (v6)
    {
LABEL_3:
      unsigned int v10 = [v6 isSiriCloudSyncEnabled];
      unsigned __int8 v11 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v12)
        {
          int v18 = 136315906;
          id v19 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
          __int16 v20 = 1024;
          unsigned int v21 = v9;
          __int16 v22 = 2112;
          id v23 = v4;
          __int16 v24 = 2048;
          unsigned int v9 = 1;
          uint64_t v25 = 1LL;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s PeerInfo found - user's Siri cloud sync is enabled. oldCloudSyncEnabled: %d, sharedUserId: %@, current count: %lu",  (uint8_t *)&v18,  0x26u);
        }

        else
        {
          unsigned int v9 = 1;
        }
      }

      else
      {
        if (v12)
        {
          int v18 = 136315906;
          id v19 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
          __int16 v20 = 1024;
          unsigned int v21 = v9;
          __int16 v22 = 2112;
          id v23 = v4;
          __int16 v24 = 2048;
          uint64_t v25 = 0LL;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s PeerInfo found - user's Siri cloud sync is disabled. oldCloudSyncEnabled: %d, sharedUserId: %@, current count: %lu",  (uint8_t *)&v18,  0x26u);
        }

        unsigned int v9 = 0;
      }

      sharedUsersSiriCloudSyncBySharedUserID = self->_sharedUsersSiriCloudSyncBySharedUserID;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isSiriCloudSyncEnabled]));
      -[NSMutableDictionary setObject:forKey:](sharedUsersSiriCloudSyncBySharedUserID, "setObject:forKey:", v16, v4);

      goto LABEL_17;
    }
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      id v19 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s User's oldCloudSyncEnabled was not found. Defaulting to YES.",  (uint8_t *)&v18,  0xCu);
    }

    unsigned int v9 = 1;
    if (v6) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    id v19 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s PeerInfo NOT found",  (uint8_t *)&v18,  0xCu);
    uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315906;
    id v19 = "-[ADMultiUserService addIfSiriCloudSyncEnabledForUser:]";
    __int16 v20 = 1024;
    unsigned int v21 = v9;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2048;
    uint64_t v25 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s oldCloudSyncEnabled:%d sharedUserId: %@, current count: %lu",  (uint8_t *)&v18,  0x26u);
  }

- (unint64_t)countUsersWithSiriCloudSyncEnabled
{
  sharedUsersSiriCloudSyncBySharedUserID = self->_sharedUsersSiriCloudSyncBySharedUserID;
  if (sharedUsersSiriCloudSyncBySharedUserID)
  {
    if ((unint64_t)-[NSMutableDictionary count](sharedUsersSiriCloudSyncBySharedUserID, "count") >= 0x65)
    {
      id v4 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        __int128 v28 = self->_sharedUsersSiriCloudSyncBySharedUserID;
        char v29 = v4;
        *(_DWORD *)buf = 136315650;
        uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
        __int16 v38 = 2048;
        uint64_t v39 = 100LL;
        __int16 v40 = 2048;
        id v41 = -[NSMutableDictionary count](v28, "count");
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Clean up as the count is greater than %lu. _sharedUsersSiriCloudSyncBySharedUserID: %lu",  buf,  0x20u);
      }

      -[NSMutableDictionary removeAllObjects](self->_sharedUsersSiriCloudSyncBySharedUserID, "removeAllObjects");
    }
  }

  else
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v6 = self->_sharedUsersSiriCloudSyncBySharedUserID;
    self->_sharedUsersSiriCloudSyncBySharedUserID = v5;
  }

  int v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
    uint64_t v25 = v7;
    id v26 = -[NSMutableDictionary count](sharedUsersByHomeUserUUID, "count");
    id v27 = -[NSMutableDictionary count](self->_sharedUsersSiriCloudSyncBySharedUserID, "count");
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    __int16 v38 = 2048;
    uint64_t v39 = (uint64_t)v26;
    __int16 v40 = 2048;
    id v41 = v27;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s _sharedUsersByHomeUserUUID: %lu _sharedUsersSiriCloudSyncBySharedUserID: %lu",  buf,  0x20u);

    int v7 = (void *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEBUG,  "%s Checking if primary user has enabled cloudsync.",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
  unint64_t v9 = -[ADMultiUserService addIfSiriCloudSyncEnabledForUser:](self, "addIfSiriCloudSyncEnabledForUser:", v8);

  unsigned int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Checking if shared users have enabled cloudsync.",  buf,  0xCu);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  unsigned __int8 v11 = self->_sharedUsersBySharedUserID;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v32;
    *(void *)&__int128 v13 = 136315394LL;
    __int128 v30 = v13;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        int v18 = v15;
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  v19,  v30,  (void)v31));

        if (v15)
        {
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 sharedUserID]);
          v9 += -[ADMultiUserService addIfSiriCloudSyncEnabledForUser:](self, "addIfSiriCloudSyncEnabledForUser:", v20);
        }

        else
        {
          unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
            __int16 v38 = 2112;
            uint64_t v39 = v19;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s sharedUser was not found. sharedUserID: %@",  buf,  0x16u);
          }
        }
      }

      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
    }

    while (v14);
  }

  __int16 v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[ADMultiUserService countUsersWithSiriCloudSyncEnabled]";
    __int16 v38 = 2048;
    uint64_t v39 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s Total Siri Cloud Sync requests enabled users : %lu",  buf,  0x16u);
  }

  return v9;
}

- (unint64_t)countUsersWithPersonalRequestsEnabled
{
  primaryUser = self->_primaryUser;
  if (primaryUser)
  {
    unsigned int v4 = -[ADCommunalDeviceUser personalDomainsIsEnabled](primaryUser, "personalDomainsIsEnabled");
    id v5 = (void *)AFSiriLogContextDaemon;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
      {
        uint64_t v25 = self->_primaryUser;
        id v26 = v5;
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v25, "sharedUserID"));
        *(_DWORD *)buf = 136315650;
        __int16 v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v27;
        __int16 v41 = 2048;
        unint64_t v7 = 1LL;
        uint64_t v42 = 1LL;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s Primary user's Siri personal requests enabled. sharedUserId: %@, current count: %lu",  buf,  0x20u);
      }

      else
      {
        unint64_t v7 = 1LL;
      }

      goto LABEL_8;
    }

    if (v6)
    {
      __int128 v28 = self->_primaryUser;
      char v29 = v5;
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v28, "sharedUserID"));
      *(_DWORD *)buf = 136315650;
      __int16 v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
      __int16 v39 = 2112;
      unint64_t v40 = (unint64_t)v30;
      __int16 v41 = 2048;
      uint64_t v42 = 0LL;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Primary user's Siri personal requests disabled. sharedUserId: %@, current count: %lu",  buf,  0x20u);
    }
  }

  unint64_t v7 = 0LL;
LABEL_8:
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v8 = self->_sharedUsersBySharedUserID;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (!v9) {
    goto LABEL_23;
  }
  id v11 = v9;
  id v12 = 0LL;
  uint64_t v13 = *(void *)v33;
  *(void *)&__int128 v10 = 136315650LL;
  __int128 v31 = v10;
  do
  {
    id v14 = 0LL;
    do
    {
      uint64_t v15 = v12;
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v8);
      }
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v14),  v31,  (void)v32));

      if ([v12 personalDomainsIsEnabled])
      {
        ++v7;
        uint64_t v16 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        uint64_t v17 = v16;
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedUserID]);
        *(_DWORD *)buf = v31;
        __int16 v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v18;
        __int16 v41 = 2048;
        uint64_t v42 = v7;
        uint64_t v19 = v17;
        __int16 v20 = "%s Secondary user's personal requests enabled. sharedUserId: %@, current count: %lu";
      }

      else
      {
        unsigned int v21 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_17;
        }
        uint64_t v17 = v21;
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedUserID]);
        *(_DWORD *)buf = v31;
        __int16 v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v18;
        __int16 v41 = 2048;
        uint64_t v42 = v7;
        uint64_t v19 = v17;
        __int16 v20 = "%s Secondary user's personal requests disabled. sharedUserId: %@, current count: %lu";
      }

      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0x20u);

LABEL_17:
      id v14 = (char *)v14 + 1;
    }

    while (v11 != v14);
    id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
    id v11 = v22;
  }

  while (v22);

LABEL_23:
  id v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v38 = "-[ADMultiUserService countUsersWithPersonalRequestsEnabled]";
    __int16 v39 = 2048;
    unint64_t v40 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Total personal requests enabled users : %lu",  buf,  0x16u);
  }

  return v7;
}

- (unint64_t)countUsersWithLocationServicesEnabled
{
  unint64_t primaryUser = (unint64_t)self->_primaryUser;
  if (primaryUser)
  {
    BOOL primaryUserMeDevice = self->_primaryUserMeDevice;
    id v5 = (void *)AFSiriLogContextDaemon;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (primaryUserMeDevice)
    {
      if (v6)
      {
        char v29 = v5;
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)primaryUser sharedUserID]);
        *(_DWORD *)buf = 136315650;
        __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
        __int16 v40 = 2112;
        unint64_t v41 = (unint64_t)v30;
        __int16 v42 = 2048;
        unint64_t primaryUser = 1LL;
        uint64_t v43 = 1LL;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Primary user's location sharing enabled (meDevice). sharedUserId: %@, current count: %lu",  buf,  0x20u);
      }

      else
      {
        unint64_t primaryUser = 1LL;
      }
    }

    else
    {
      if (v6)
      {
        __int128 v31 = v5;
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([(id)primaryUser sharedUserID]);
        *(_DWORD *)buf = 136315650;
        __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
        __int16 v40 = 2112;
        unint64_t v41 = (unint64_t)v32;
        __int16 v42 = 2048;
        uint64_t v43 = 0LL;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s Primary user's location sharing disabled (not meDevice). sharedUserId: %@, current count: %lu",  buf,  0x20u);
      }

      unint64_t primaryUser = 0LL;
    }
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  unint64_t v7 = self->_sharedUsersBySharedUserID;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
  if (v8)
  {
    id v10 = v8;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v35;
    *(void *)&__int128 v9 = 136315906LL;
    __int128 v33 = v9;
    while (1)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        id v14 = v11;
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v7);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i),  v33));

        sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserID]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sharedUsersMeDeviceBySharedUserID, "objectForKey:", v16));

        if (v17)
        {
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
          {
            ++primaryUser;
            uint64_t v25 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
              goto LABEL_26;
            }
            __int16 v20 = v25;
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserID]);
            *(_DWORD *)buf = v33;
            __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v40 = 2112;
            unint64_t v41 = (unint64_t)v17;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v21;
            __int16 v44 = 2048;
            unint64_t v45 = primaryUser;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Secondary user's meDevice enablement field is corrupted. Counting as having a meDevice. value: %@, shar edUserId: %@, current count: %lu",  buf,  0x2Au);
            goto LABEL_25;
          }

          if ([v17 BOOLValue])
          {
            ++primaryUser;
            uint64_t v19 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_26;
            }
            __int16 v20 = v19;
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserID]);
            *(_DWORD *)buf = 136315650;
            __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v40 = 2112;
            unint64_t v41 = (unint64_t)v21;
            __int16 v42 = 2048;
            uint64_t v43 = primaryUser;
            id v22 = v20;
            id v23 = "%s Secondary user's device is meDevce. sharedUserId: %@, current count: %lu";
          }

          else
          {
            id v26 = (void *)AFSiriLogContextDaemon;
            if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_26;
            }
            __int16 v20 = v26;
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserID]);
            *(_DWORD *)buf = 136315650;
            __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
            __int16 v40 = 2112;
            unint64_t v41 = (unint64_t)v21;
            __int16 v42 = 2048;
            uint64_t v43 = primaryUser;
            id v22 = v20;
            id v23 = "%s Secondary user's device is not meDevice. sharedUserId: %@, current count: %lu";
          }
        }

        else
        {
          ++primaryUser;
          __int16 v24 = (void *)AFSiriLogContextDaemon;
          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
          __int16 v20 = v24;
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUserID]);
          *(_DWORD *)buf = 136315650;
          __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
          __int16 v40 = 2112;
          unint64_t v41 = (unint64_t)v21;
          __int16 v42 = 2048;
          uint64_t v43 = primaryUser;
          id v22 = v20;
          id v23 = "%s Secondary user's meDevice enablement field doesn't exist. It may not have been uploaded yet. Counting"
                " as having a meDevice. sharedUserId: %@, current count: %lu";
        }

        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, v23, buf, 0x20u);
LABEL_25:

LABEL_26:
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
      if (!v10)
      {

        break;
      }
    }
  }

  id v27 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v39 = "-[ADMultiUserService countUsersWithLocationServicesEnabled]";
    __int16 v40 = 2048;
    unint64_t v41 = primaryUser;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s Total location sharing enabled users : %lu",  buf,  0x16u);
  }

  return primaryUser;
}

- (unint64_t)countUsersWithMatchingSiriLanguage
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);

  if (self->_primaryUser)
  {
    unsigned int v5 = [v4 isEqualToString:self->_primaryUserSiriLanguage];
    BOOL v6 = (void *)AFSiriLogContextDaemon;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        unint64_t primaryUser = self->_primaryUser;
        __int128 v28 = v6;
        char v29 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](primaryUser, "sharedUserID"));
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser settings](self->_primaryUser, "settings"));
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:SAHomeMemberSettingsPreferredLanguagePListKey]);
        *(_DWORD *)buf = 136315906;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        id v54 = v29;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v31;
        __int16 v57 = 2048;
        unint64_t v8 = 1LL;
        uint64_t v58 = 1LL;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%s Primary user's Siri language matches HomePod's. sharedUserId: %@, device language: %@, current count: %lu",  buf,  0x2Au);
      }

      else
      {
        unint64_t v8 = 1LL;
      }

      goto LABEL_9;
    }

    if (v7)
    {
      primaryUserSiriLanguage = self->_primaryUserSiriLanguage;
      __int128 v33 = self->_primaryUser;
      __int128 v34 = v6;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser settings](v33, "settings"));
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:SAHomeMemberSettingsPreferredLanguagePListKey]);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
      *(_DWORD *)buf = 136316162;
      id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
      __int16 v53 = 2112;
      id v54 = primaryUserSiriLanguage;
      __int16 v55 = 2112;
      unint64_t v56 = (unint64_t)v36;
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v37;
      __int16 v59 = 2048;
      unint64_t v60 = 0LL;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "%s Primary user's Siri language (%@) doesn't match HomePod's. sharedUserId: %@, device language: %@, current count: %lu",  buf,  0x34u);
    }
  }

  unint64_t v8 = 0LL;
LABEL_9:
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = self->_sharedUsersBySharedUserID;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v46,  v50,  16LL);
  if (!v9) {
    goto LABEL_23;
  }
  id v11 = v9;
  uint64_t v12 = *(void *)v47;
  uint64_t v44 = SAHomeMemberSettingsPreferredLanguagePListKey;
  *(void *)&__int128 v10 = 136316162LL;
  __int128 v38 = v10;
  do
  {
    uint64_t v13 = 0LL;
    do
    {
      if (*(void *)v47 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sharedUsersBySharedUserID,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v46 + 1) + 8LL * (void)v13),  v38));
      sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 sharedUserID]);
      uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( sharedUsersSiriLanguageBySharedUserID,  "objectForKeyedSubscript:",  v16));

      if ([v4 isEqualToString:v17])
      {
        ++v8;
        uint64_t v18 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_18;
        }
        os_log_t log = v18;
        __int16 v40 = (NSString *)objc_claimAutoreleasedReturnValue([v14 sharedUserID]);
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v14 settings]);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v44]);
        *(_DWORD *)buf = 136315906;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        id v54 = v40;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v39;
        __int16 v57 = 2048;
        uint64_t v58 = v8;
        os_log_t v19 = log;
        __int16 v20 = log;
        unsigned int v21 = "%s Secondary user's Siri language code matches HomePod's. sharedUserId: %@, device language: %@, current count: %lu";
        uint32_t v22 = 42;
      }

      else
      {
        id v23 = (void *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_18;
        }
        os_log_t loga = v23;
        __int16 v40 = (NSString *)objc_claimAutoreleasedReturnValue([v14 sharedUserID]);
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v14 settings]);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v44]);
        *(_DWORD *)buf = v38;
        id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
        __int16 v53 = 2112;
        id v54 = v17;
        __int16 v55 = 2112;
        unint64_t v56 = (unint64_t)v40;
        __int16 v57 = 2112;
        uint64_t v58 = (uint64_t)v39;
        __int16 v59 = 2048;
        unint64_t v60 = v8;
        os_log_t v19 = loga;
        __int16 v20 = loga;
        unsigned int v21 = "%s Secondary user's Siri language code (%@) doesn't match HomePod's. sharedUserId: %@, device language: %@"
              ", current count: %lu";
        uint32_t v22 = 52;
      }

      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, v22);

LABEL_18:
      uint64_t v13 = (char *)v13 + 1;
    }

    while (v11 != v13);
    id v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v46,  v50,  16LL);
    id v11 = v24;
  }

  while (v24);
LABEL_23:

  uint64_t v25 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v52 = "-[ADMultiUserService countUsersWithMatchingSiriLanguage]";
    __int16 v53 = 2112;
    id v54 = (NSString *)v4;
    __int16 v55 = 2048;
    unint64_t v56 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s Total users with matching Siri languages to HomePod's (%@): %lu",  buf,  0x20u);
  }

  return v8;
}

- (void)_describeSAMultiUserInfo:(id)a3
{
  id v3 = a3;
  unsigned int v4 = v3;
  if (!v3 || ![v3 count])
  {
    unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v21 = "-[ADMultiUserService _describeSAMultiUserInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Home members array is empty", buf, 0xCu);
    }
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v13 = v11;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 enrollmentName]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedUserId]);
          *(_DWORD *)buf = 136315651;
          unsigned int v21 = "-[ADMultiUserService _describeSAMultiUserInfo:]";
          __int16 v22 = 2113;
          id v23 = v14;
          __int16 v24 = 2113;
          uint64_t v25 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s homeMember enrollmentName: %{private}@ sharedUserId: %{private}@",  buf,  0x20u);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }

    while (v8);
  }
}

- (id)_homeMembersForPlatform
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v94 = "-[ADMultiUserService _homeMembersForPlatform]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int16 v85 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v4 = self;
  unint64_t primaryUser = self->_primaryUser;
  id v6 = (void *)AFSiriLogContextDaemon;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (primaryUser)
  {
    if (v7)
    {
      __int128 v69 = v6;
      __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionAssistantID](primaryUser, "companionAssistantID"));
      __int128 v71 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
      unint64_t v72 = -[ADCommunalDeviceUser voiceIDAllowedByUser](self->_primaryUser, "voiceIDAllowedByUser");
      unsigned int v73 = -[ADCommunalDeviceUser nonCloudSyncedUser](self->_primaryUser, "nonCloudSyncedUser");
      *(_DWORD *)buf = 136316163;
      v94 = "-[ADMultiUserService _homeMembersForPlatform]";
      __int16 v95 = 2113;
      uint64_t v96 = v70;
      __int16 v97 = 2113;
      unint64_t v98 = (unint64_t)v71;
      __int16 v99 = 2048;
      unint64_t v100 = v72;
      __int16 v101 = 2048;
      uint64_t v102 = v73;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEBUG,  "%s _primaryUser companionAssistantID: %{private}@, sharedUserID: %{private}@, voiceIDAllowedByUser=%lu, nonCloudSyncedUser=%lu",  buf,  0x34u);

      unint64_t primaryUser = self->_primaryUser;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionAssistantID](primaryUser, "companionAssistantID"));

    if (v9)
    {
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommunalDeviceUser saHomeMemberInfo:]( &OBJC_CLASS___ADCommunalDeviceUser,  "saHomeMemberInfo:",  self->_primaryUser));
      if (v10
        && (-[ADCommunalDeviceUser voiceIDAllowedByUser](self->_primaryUser, "voiceIDAllowedByUser")
         || -[ADCommunalDeviceUser nonCloudSyncedUser](self->_primaryUser, "nonCloudSyncedUser")))
      {
        usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
        LODWORD(usersWithAvailableVoiceProfiles) = -[NSMutableArray containsObject:]( usersWithAvailableVoiceProfiles,  "containsObject:",  v12);

        if ((_DWORD)usersWithAvailableVoiceProfiles)
        {
          -[NSMutableArray addObject:](v85, "addObject:", v10);
          uint64_t v13 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            __int128 v74 = self->_primaryUser;
            __int128 v75 = v13;
            __int128 v76 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v74, "sharedUserID"));
            __int128 v77 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
            __int128 v78 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));
            *(_DWORD *)buf = 136315907;
            v94 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v95 = 2113;
            uint64_t v96 = v76;
            __int16 v97 = 2113;
            unint64_t v98 = (unint64_t)v77;
            __int16 v99 = 2113;
            unint64_t v100 = (unint64_t)v78;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEBUG,  "%s Adding primaryUser with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@",  buf,  0x2Au);
          }

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 lastVisitedAceHost]);

          if (!v14)
          {
            uint64_t v15 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              __int128 v16 = self->_primaryUser;
              __int128 v17 = v15;
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v16, "sharedUserID"));
              *(_DWORD *)buf = 136315395;
              v94 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v95 = 2113;
              uint64_t v96 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s PrimaryUser %{private}@ has nil aceHost",  buf,  0x16u);
            }
          }

          if (-[ADMultiUserService _isTrackingUUIDForInFlightVoiceProfile:]( self,  "_isTrackingUUIDForInFlightVoiceProfile:",  self->_primaryUser))
          {
            __int128 v19 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              __int16 v20 = self->_primaryUser;
              unsigned int v21 = v19;
              __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](v20, "homeUserUUID"));
              *(_DWORD *)buf = 136315395;
              v94 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v95 = 2113;
              uint64_t v96 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it",  buf,  0x16u);
            }

            -[ADMultiUserService _untrackUUIDsForUser:](self, "_untrackUUIDsForUser:", self->_primaryUser);
          }
        }
      }
    }
  }

  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v94 = "-[ADMultiUserService _homeMembersForPlatform]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEBUG,  "%s _primaryUser is nil",  buf,  0xCu);
  }

  if (AFIsATV(v7, v8))
  {
    if (!self->_primaryUser)
    {
      deviceOwner = self->_deviceOwner;
      if (deviceOwner)
      {
        __int16 v24 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v94 = "-[ADMultiUserService _homeMembersForPlatform]";
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s primary User is nil but we have a device owner.",  buf,  0xCu);
          deviceOwner = self->_deviceOwner;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommunalDeviceUser saHomeMemberInfo:]( &OBJC_CLASS___ADCommunalDeviceUser,  "saHomeMemberInfo:",  deviceOwner));
        if (v25
          && (-[ADCommunalDeviceUser voiceIDAllowedByUser](self->_deviceOwner, "voiceIDAllowedByUser")
           || -[ADCommunalDeviceUser nonCloudSyncedUser](self->_deviceOwner, "nonCloudSyncedUser")))
        {
          id v26 = self->_usersWithAvailableVoiceProfiles;
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_deviceOwner, "sharedUserID"));
          LODWORD(v26) = -[NSMutableArray containsObject:](v26, "containsObject:", v27);

          if ((_DWORD)v26)
          {
            -[NSMutableArray addObject:](v85, "addObject:", v25);
            __int128 v28 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              v79 = self->_deviceOwner;
              v80 = v28;
              __int16 v81 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v79, "sharedUserID"));
              uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_deviceOwner, "homeUserUUID"));
              __int16 v83 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_deviceOwner, "iCloudAltDSID"));
              *(_DWORD *)buf = 136315907;
              v94 = "-[ADMultiUserService _homeMembersForPlatform]";
              __int16 v95 = 2113;
              uint64_t v96 = v81;
              __int16 v97 = 2113;
              unint64_t v98 = (unint64_t)v82;
              __int16 v99 = 2113;
              unint64_t v100 = (unint64_t)v83;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEBUG,  "%s Adding device owner with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@",  buf,  0x2Au);
            }

            char v29 = (void *)objc_claimAutoreleasedReturnValue([v25 lastVisitedAceHost]);

            if (!v29)
            {
              __int128 v30 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                __int128 v31 = self->_deviceOwner;
                __int128 v32 = v30;
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](v31, "sharedUserID"));
                *(_DWORD *)buf = 136315395;
                v94 = "-[ADMultiUserService _homeMembersForPlatform]";
                __int16 v95 = 2113;
                uint64_t v96 = v33;
                _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s device owner %{private}@ has nil aceHost",  buf,  0x16u);
              }
            }

            if (-[ADMultiUserService _isTrackingUUIDForInFlightVoiceProfile:]( self,  "_isTrackingUUIDForInFlightVoiceProfile:",  self->_deviceOwner))
            {
              __int128 v34 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
              {
                __int128 v35 = self->_deviceOwner;
                __int128 v36 = v34;
                __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](v35, "homeUserUUID"));
                *(_DWORD *)buf = 136315395;
                v94 = "-[ADMultiUserService _homeMembersForPlatform]";
                __int16 v95 = 2113;
                uint64_t v96 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "%s HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it",  buf,  0x16u);
              }

              -[ADMultiUserService _untrackUUIDsForUser:](self, "_untrackUUIDsForUser:", self->_deviceOwner);
            }
          }
        }
      }
    }
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id obj = self->_sharedUsersBySharedUserID;
  id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v88,  v92,  16LL);
  if (v38)
  {
    id v40 = v38;
    uint64_t v41 = *(void *)v89;
    *(void *)&__int128 v39 = 136315907LL;
    __int128 v84 = v39;
    do
    {
      __int16 v42 = 0LL;
      do
      {
        if (*(void *)v89 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)v42);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_sharedUsersBySharedUserID, "objectForKey:", v43, v84));
        unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[ADCommunalDeviceUser saHomeMemberInfo:]( &OBJC_CLASS___ADCommunalDeviceUser,  "saHomeMemberInfo:",  v44));
        __int128 v46 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          __int16 v59 = v46;
          unint64_t v60 = [v44 voiceIDAllowedByUser];
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v44 companionAssistantID]);
          unsigned int v62 = [v44 nonCloudSyncedUser];
          *(_DWORD *)buf = 136316163;
          v94 = "-[ADMultiUserService _homeMembersForPlatform]";
          __int16 v95 = 2113;
          uint64_t v96 = v43;
          __int16 v97 = 2048;
          unint64_t v98 = v60;
          __int16 v99 = 2113;
          unint64_t v100 = (unint64_t)v61;
          __int16 v101 = 2048;
          uint64_t v102 = v62;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "%s sharedUserId: %{private}@, voiceIDAllowedByUser: %lu, companionAssistantID: %{private}@, nonCloudSyncedUser: %lu",  buf,  0x34u);

          unsigned int v4 = self;
          if (!v45) {
            goto LABEL_67;
          }
        }

        else if (!v45)
        {
          goto LABEL_67;
        }

        unsigned int v47 = [v44 voiceIDAllowedByUser];
        if (v47)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue([v44 companionAssistantID]);
        }

        else if (![v44 nonCloudSyncedUser])
        {
          goto LABEL_67;
        }

        __int128 v48 = v4->_usersWithAvailableVoiceProfiles;
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v44 sharedUserID]);
        unsigned int v50 = -[NSMutableArray containsObject:](v48, "containsObject:", v49);

        if (v47)
        {

          if ((v50 & 1) == 0) {
            goto LABEL_56;
          }
        }

        else if (!v50)
        {
LABEL_56:
          unsigned int v4 = self;
          goto LABEL_67;
        }

        -[NSMutableArray addObject:](v85, "addObject:", v45);
        uint64_t v51 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          v63 = v51;
          id v64 = (void *)objc_claimAutoreleasedReturnValue([v44 sharedUserID]);
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v44 homeUserUUID]);
          v66 = (void *)objc_claimAutoreleasedReturnValue([v44 iCloudAltDSID]);
          *(_DWORD *)buf = v84;
          v94 = "-[ADMultiUserService _homeMembersForPlatform]";
          __int16 v95 = 2113;
          uint64_t v96 = v64;
          __int16 v97 = 2113;
          unint64_t v98 = (unint64_t)v65;
          __int16 v99 = 2113;
          unint64_t v100 = (unint64_t)v66;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "%s Adding user with sharedUserId %{private}@ and homeUserUUID %{private}@ and iCloudAltDSID %{private}@",  buf,  0x2Au);
        }

        id v52 = (void *)objc_claimAutoreleasedReturnValue([v45 lastVisitedAceHost]);

        if (!v52)
        {
          __int16 v53 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            id v54 = v53;
            __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v44 sharedUserID]);
            *(_DWORD *)buf = 136315395;
            v94 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v95 = 2113;
            uint64_t v96 = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s SharedUser %{private}@ has nil aceHost",  buf,  0x16u);
          }
        }

        unsigned int v4 = self;
        if (-[ADMultiUserService _isTrackingUUIDForInFlightVoiceProfile:]( self,  "_isTrackingUUIDForInFlightVoiceProfile:",  v44))
        {
          unint64_t v56 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            __int16 v57 = v56;
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v44 homeUserUUID]);
            *(_DWORD *)buf = 136315395;
            v94 = "-[ADMultiUserService _homeMembersForPlatform]";
            __int16 v95 = 2113;
            uint64_t v96 = v58;
            _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "%s removed HomeUserID (%{private}@) voice profile is available but it's still being tracked as in-flight. Stop tracking it",  buf,  0x16u);

            unsigned int v4 = self;
          }

          -[ADMultiUserService _untrackUUIDsForUser:](v4, "_untrackUUIDsForUser:", v44);
        }

- (void)_updateSAMultiUserInfo
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SAMultiUserInfo);
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAMultiUserInfo homeMembers](self->_multiUserInfo, "homeMembers"));
  BOOL v6 = [v5 count] != 0;

  BOOL v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    usersWithAvailableVoiceProfiles = self->_usersWithAvailableVoiceProfiles;
    uint64_t v9 = v7;
    id v10 = -[NSMutableArray count](usersWithAvailableVoiceProfiles, "count");
    id v11 = -[NSMutableDictionary count](self->_sharedUsersBySharedUserID, "count");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAMultiUserInfo homeMembers](self->_multiUserInfo, "homeMembers"));
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    id v46 = v11;
    __int16 v47 = 2048;
    id v48 = [v12 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s _usersWithAvailableVoiceProfiles: %lu, _sharedUsersBySharedUserID: %lu, multiUsersPreviousCount: %lu",  buf,  0x2Au);
  }

  if (-[ADMultiUserService _isHostingMultiUserLanguage](self, "_isHostingMultiUserLanguage"))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[ADMultiUserService _homeMembersForPlatform](self, "_homeMembersForPlatform"));

    unsigned int v4 = (NSMutableArray *)v13;
  }

  else
  {
    BOOL v6 = 0;
  }

  if (self->_pitchesForHomeMembers)
  {
    -[SAMultiUserInfo setMultiUserPitchComposition:](v3, "setMultiUserPitchComposition:");
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s No pitches available for HomeMembers",  buf,  0xCu);
    }
  }

  uint64_t v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int128 v35 = v15;
    id v36 = -[NSMutableArray count](v4, "count");
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v36;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%s homeMembers: %lu", buf, 0x16u);
  }

  id v16 = -[NSMutableArray count](v4, "count");
  if (v16)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    id v46 = 0LL;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100298338;
    v38[3] = &unk_1004F8EE0;
    v38[4] = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", v38);
    if (*(void *)(*(void *)&buf[8] + 24LL))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  *(void *)(*(void *)&buf[8] + 24LL)));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  -[NSMutableArray count](v4, "count")));
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      v43[0] = @"missing_count";
      v43[1] = @"total";
      v44[0] = v18;
      v44[1] = v19;
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
      [v20 logEventWithType:6117 context:v21];
    }

    if (self->_saUnknownUser)
    {
      __int16 v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[SAHomeMemberInfo sharedUserId](self->_saUnknownUser, "sharedUserId"));
        *(_DWORD *)__int128 v39 = 136315395;
        id v40 = "-[ADMultiUserService _updateSAMultiUserInfo]";
        __int16 v41 = 2113;
        __int16 v42 = v37;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s adding _saUnknownUser: %{private}@",  v39,  0x16u);
      }

      -[NSMutableArray addObject:](v4, "addObject:", self->_saUnknownUser);
    }

    -[SAMultiUserInfo setHomeMembers:](v3, "setHomeMembers:", v4);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (v6)
    {
      id v23 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Send empty MultiUserInfo",  buf,  0xCu);
      }

      id v16 = -[SAMultiUserInfo setHomeMembers:](v3, "setHomeMembers:", 0LL);
    }

    if (AFIsATV(v16, v17))
    {
      saUnknownUser = self->_saUnknownUser;
      if (saUnknownUser)
      {
        uint64_t v25 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s #multi-user-atv overriding empty MultiUserInfo and including empty home user to support MUX",  buf,  0xCu);
          saUnknownUser = self->_saUnknownUser;
        }

        -[NSMutableArray addObject:](v4, "addObject:", saUnknownUser);
        -[SAMultiUserInfo setHomeMembers:](v3, "setHomeMembers:", v4);
      }
    }
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService _inFlightVoiceProfilesByUUID](self, "_inFlightVoiceProfilesByUUID"));
  id v27 = [v26 count];

  -[SAMultiUserInfo setVoiceProfilesAreInFlight:](v3, "setVoiceProfilesAreInFlight:", v27 != 0LL);
  __int128 v28 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v27 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s MultiUserInfo profiles are in-flight: %{BOOL}d",  buf,  0x12u);
  }

  char v29 = (void *)objc_claimAutoreleasedReturnValue(-[SAMultiUserInfo dictionary](self->_multiUserInfo, "dictionary"));
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SAMultiUserInfo dictionary](v3, "dictionary"));
  unsigned __int8 v31 = [v29 isEqualToDictionary:v30];

  if ((v31 & 1) == 0)
  {
    __int128 v32 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ADMultiUserService _updateSAMultiUserInfo]";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Marking MultiUserInfo as dirty", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_multiUserInfo, v3);
    self->_isMultiUserInfoDirty = 1;
    -[ADMultiUserService _describeSAMultiUserInfo:](self, "_describeSAMultiUserInfo:", v4);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v33 sendMultiUserInfoToMUX];

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v34 postNotificationName:@"ADMultiUsersDidChangeNotification" object:0];
  }
}

- (void)_savePrimaryAndDeviceOwner
{
  if (AFIsATV(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));

    if (v3)
    {
      unint64_t primaryUser = self->_primaryUser;
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](primaryUser, "iCloudAltDSID"));
      if (_AFPreferencesSiriRMVSetting(v5) == 1)
      {
        -[ADCommunalDeviceUser setVoiceIDAllowedByUser:](primaryUser, "setVoiceIDAllowedByUser:", 1LL);
      }

      else
      {
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));
        -[ADCommunalDeviceUser setVoiceIDAllowedByUser:]( primaryUser,  "setVoiceIDAllowedByUser:",  _AFPreferencesSiriRMVSetting(v6) == 2);
      }
    }
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](self->_primaryUser, "dictionaryRepresentation"));
  [v7 setMultiUserPrimaryUser:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](self->_deviceOwner, "dictionaryRepresentation"));
  [v9 setDeviceOwner:v10];

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[ADMultiUserService _savePrimaryAndDeviceOwner]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Posting notification as primary user info updated",  (uint8_t *)&v13,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFSharedUserUpdateDarwinNotification, 0LL, 0LL, 1u);
}

- (void)_saveSharedUsers
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v41 = "-[ADMultiUserService _saveSharedUsers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  unsigned int v5 = self->_sharedUsersBySharedUserID;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)v9)));
        id v11 = [v10 nonCloudSyncedUser];
        if ((v11 & 1) == 0)
        {
          if (AFIsATV(v11, v12))
          {
            int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 iCloudAltDSID]);

            if (v13)
            {
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 iCloudAltDSID]);
              if (_AFPreferencesSiriRMVSetting(v14) == 1)
              {
                [v10 setVoiceIDAllowedByUser:1];
              }

              else
              {
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 iCloudAltDSID]);
                [v10 setVoiceIDAllowedByUser:_AFPreferencesSiriRMVSetting(v15) == 2];
              }
            }
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
          -[NSMutableArray addObject:](v4, "addObject:", v16);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v36,  v45,  16LL);
    }

    while (v7);
  }

  if (+[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled"))
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v17 = self->_sharedUsersByiCloudAltDSID;
    id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v44,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        unsigned int v21 = 0LL;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersByiCloudAltDSID,  "objectForKey:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v21),  (void)v32));
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedUserID]);

          if (!v23)
          {
            __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dictionaryRepresentation]);
            -[NSMutableArray addObject:](v4, "addObject:", v24);
          }

          unsigned int v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v44,  16LL);
      }

      while (v19);
    }
  }

  uint64_t v25 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v41 = "-[ADMultiUserService _saveSharedUsers]";
    __int16 v42 = 2112;
    uint64_t v43 = v4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (-[NSMutableArray count](v4, "count", (void)v32))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v27 = v26;
    __int128 v28 = v4;
  }

  else
  {
    char v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v41 = "-[ADMultiUserService _saveSharedUsers]";
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s Did not find any shared users to save",  buf,  0xCu);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v27 = v26;
    __int128 v28 = 0LL;
  }

  [v26 setMultiUserSharedUsers:v28];

  unint64_t primaryUser = self->_primaryUser;
  if (primaryUser && !-[ADCommunalDeviceUser nonCloudSyncedUser](primaryUser, "nonCloudSyncedUser"))
  {
    -[ADMultiUserService _savePrimaryAndDeviceOwner](self, "_savePrimaryAndDeviceOwner");
  }

  else
  {
    unsigned __int8 v31 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v41 = "-[ADMultiUserService _saveSharedUsers]";
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Did not find any primary user to save",  buf,  0xCu);
    }

    -[ADPreferences setMultiUserPrimaryUser:](self->_adPreferences, "setMultiUserPrimaryUser:", 0LL);
  }
}

- (void)_setPrimaryUserMeDevice:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADMultiUserService _setPrimaryUserMeDevice:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s meDevice:%d", (uint8_t *)&v6, 0x12u);
  }

  self->_BOOL primaryUserMeDevice = v3;
}

- (void)_setSharedUserMeDevice:(BOOL)a3 forSharedUser:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    int v13 = "-[ADMultiUserService _setSharedUserMeDevice:forSharedUser:]";
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s meDevice:%d, sharedUserID:%@",  (uint8_t *)&v12,  0x1Cu);
  }

  sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
  if (!sharedUsersMeDeviceBySharedUserID)
  {
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v10 = self->_sharedUsersMeDeviceBySharedUserID;
    self->_sharedUsersMeDeviceBySharedUserID = v9;

    sharedUsersMeDeviceBySharedUserID = self->_sharedUsersMeDeviceBySharedUserID;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[NSMutableDictionary setValue:forKey:](sharedUsersMeDeviceBySharedUserID, "setValue:forKey:", v11, v6);
}

- (void)_setPrimaryUserSiriLanguage:(id)a3
{
  BOOL v4 = (NSString *)a3;
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    __int16 v8 = "-[ADMultiUserService _setPrimaryUserSiriLanguage:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s siriLanguage:%@", (uint8_t *)&v7, 0x16u);
  }

  primaryUserSiriLanguage = self->_primaryUserSiriLanguage;
  self->_primaryUserSiriLanguage = v4;
}

- (void)_setSharedUserSiriLanguage:(id)a3 forSharedUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    int v13 = "-[ADMultiUserService _setSharedUserSiriLanguage:forSharedUser:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s siriLanguage:%@ sharedUserID:%@",  (uint8_t *)&v12,  0x20u);
  }

  sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
  if (!sharedUsersSiriLanguageBySharedUserID)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v11 = self->_sharedUsersSiriLanguageBySharedUserID;
    self->_sharedUsersSiriLanguageBySharedUserID = v10;

    sharedUsersSiriLanguageBySharedUserID = self->_sharedUsersSiriLanguageBySharedUserID;
  }

  -[NSMutableDictionary setValue:forKey:](sharedUsersSiriLanguageBySharedUserID, "setValue:forKey:", v6, v7);
}

- (void)_saveDeviceOwnerToKeychainCache
{
  deviceOwner = self->_deviceOwner;
  if (deviceOwner)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](deviceOwner, "sharedUserID"));
    if (v4)
    {
      unsigned int v5 = (void *)v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserIdentifier]);
      unsigned __int8 v8 = [v7 isEqualToString:v5];

      if ((v8 & 1) == 0)
      {
        __int16 v9 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          __int16 v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Saving Device Owner's sharedUserIdentifier to keychain cache",  (uint8_t *)&v15,  0xCu);
        }

        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_deviceOwner, "sharedUserID"));
        int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser loggableSharedUserID](self->_deviceOwner, "loggableSharedUserID"));
        [v10 setSharedUserIdentifier:v11 loggingSharedUserIdentifier:v12];
      }
    }

    else
    {
      __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315138;
        __int16 v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Device Owner exists but with a nil sharedUserId",  (uint8_t *)&v15,  0xCu);
      }

      unsigned int v5 = 0LL;
    }
  }

  else
  {
    int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      __int16 v16 = "-[ADMultiUserService _saveDeviceOwnerToKeychainCache]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Device Owner is nil, clearing sharedUserId from keychain cache",  (uint8_t *)&v15,  0xCu);
    }

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v5 setSharedUserIdentifier:0 loggingSharedUserIdentifier:0];
  }
}

- (BOOL)personalDomainSettingsDidChange:(id)a3 newUserSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"personalDomainsIsEnabled"]);
  unsigned int v8 = [v7 BOOLValue];

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowUnauthenticatedRequests"]);
  unsigned int v10 = [v9 BOOLValue];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowExplicitContent"]);
  unsigned int v12 = [v11 BOOLValue];

  if (v8 == [v5 personalDomainsIsEnabled]
    && v10 == [v5 unauthenticatedRequestsAllowed])
  {
    unsigned int v13 = v12 ^ [v5 allowExplicitContent];
  }

  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)_updateCommunalDeviceUser:(id)a3 withSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowVoiceID"]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"personalDomainsIsEnabled"]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowUnauthenticatedRequests"]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"allowExplicitContent"]);

  id v11 = [v7 integerValue];
  unsigned int v12 = [v5 personalDomainsIsEnabled];
  if (v12 != [v8 BOOLValue])
  {
    objc_msgSend(v5, "setPersonalDomainsIsEnabled:", objc_msgSend(v8, "BOOLValue"));
    unsigned int v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = v13;
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 sharedUserID]);
      int v28 = 136315395;
      char v29 = "-[ADMultiUserService _updateCommunalDeviceUser:withSettings:]";
      __int16 v30 = 2113;
      uint64_t v31 = (uint64_t)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Posting notification that Personal Domains setting changed for sharedUserId: (%{private}@)",  (uint8_t *)&v28,  0x16u);
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 postNotificationName:@"ADMultiUserSharedUserPersonalDomainsChangedNotification" object:v5];
  }

  objc_msgSend(v5, "setUnauthenticatedRequestsAllowed:", objc_msgSend(v9, "BOOLValue"));
  objc_msgSend(v5, "setAllowExplicitContent:", objc_msgSend(v10, "BOOLValue"));
  [v5 setVoiceIDAllowedByUser:v11 == (id)1];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
  if (AFIsATV(v17, v18) && v17)
  {
    id v19 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", _AFPreferencesSiriRMVSetting(v17) == 1);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

    unsigned int v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = v21;
      uint64_t v23 = _AFPreferencesSiriRMVSetting(v17);
      int v28 = 136315394;
      char v29 = "-[ADMultiUserService _updateCommunalDeviceUser:withSettings:]";
      __int16 v30 = 2048;
      uint64_t v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s #multi-user-atv Using cached ATV RmV Setting %ld",  (uint8_t *)&v28,  0x16u);
    }

    BOOL v24 = _AFPreferencesSiriRMVSetting(v17) == 1 || _AFPreferencesSiriRMVSetting(v17) == 2;
    [v5 setVoiceIDAllowedByUser:v24];
    id v7 = (void *)v20;
  }

  uint64_t v25 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v26 = v25;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 homeUserUUID]);
    int v28 = 136316419;
    char v29 = "-[ADMultiUserService _updateCommunalDeviceUser:withSettings:]";
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v10;
    __int16 v32 = 2112;
    __int128 v33 = v7;
    __int16 v34 = 2112;
    __int128 v35 = v8;
    __int16 v36 = 2112;
    __int128 v37 = v9;
    __int16 v38 = 2113;
    __int128 v39 = v27;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%s allowExplicitContent: (%@) setVoiceIDAllowedByUser: (%@) personalDomainsIsEnabled: (%@) unauthenticatedRequests Allowed: (%@) for (%{private}@)",  (uint8_t *)&v28,  0x3Eu);
  }
}

- (BOOL)_homeKitSettingsDidChangeForDeviceOwner
{
  homeUserSettings = self->_homeUserSettings;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_deviceOwner, "homeUserUUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](homeUserSettings, "objectForKey:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"allowVoiceID"]);
  BOOL v7 = [v6 integerValue] != (id)1;

  if (v7 == -[ADCommunalDeviceUser voiceIDAllowedByUser](self->_deviceOwner, "voiceIDAllowedByUser")) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = -[ADMultiUserService personalDomainSettingsDidChange:newUserSettings:]( self,  "personalDomainSettingsDidChange:newUserSettings:",  self->_deviceOwner,  v5);
  }

  return v8;
}

- (void)_updateHomeKitSettingsForDeviceOwner
{
  if (!self->_primaryUser
    && -[ADMultiUserService _homeKitSettingsDidChangeForDeviceOwner](self, "_homeKitSettingsDidChangeForDeviceOwner"))
  {
    homeUserSettings = self->_homeUserSettings;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_deviceOwner, "homeUserUUID"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](homeUserSettings, "objectForKey:", v4));

    -[ADMultiUserService _updateCommunalDeviceUser:withSettings:]( self,  "_updateCommunalDeviceUser:withSettings:",  self->_deviceOwner,  v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](self->_deviceOwner, "dictionaryRepresentation"));
    [v6 setDeviceOwner:v7];

    BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      unsigned int v10 = "-[ADMultiUserService _updateHomeKitSettingsForDeviceOwner]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Marking MultiUserInfo as dirty",  (uint8_t *)&v9,  0xCu);
    }

    self->_isMultiUserInfoDirty = 1;
  }

- (BOOL)_updateHomeKitSettings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_homeUserSettings, "objectForKey:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"allowVoiceID"]);
  BOOL v7 = (ADCommunalDeviceUser *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersByHomeUserUUID,  "objectForKey:",  v4));
  if (!v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
    unsigned int v9 = [v8 isEqualToString:v4];

    if (!v9)
    {
      BOOL v11 = 0;
      BOOL v7 = 0LL;
      goto LABEL_11;
    }

    BOOL v7 = self->_primaryUser;
  }

  if (v5) {
    BOOL v10 = v7 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    BOOL v11 = 0;
  }

  else
  {
    -[ADMultiUserService _updateCommunalDeviceUser:withSettings:]( self,  "_updateCommunalDeviceUser:withSettings:",  v7,  v5);
    BOOL v11 = 1;
  }

- (BOOL)_updateNonHomeUserSettings:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    id v19 = "-[ADMultiUserService _updateNonHomeUserSettings:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v18, 0xCu);
  }

  id v6 = (ADCommunalDeviceUser *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  v4));
  if (!v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
    unsigned int v8 = [v7 isEqualToString:v4];

    if (v8) {
      id v6 = self->_primaryUser;
    }
    else {
      id v6 = 0LL;
    }
  }

  unsigned int v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = v9;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](v6, "iCloudAltDSID"));
    int v18 = 136315394;
    id v19 = "-[ADMultiUserService _updateNonHomeUserSettings:]";
    __int16 v20 = 2112;
    unsigned int v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v18, 0x16u);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](v6, "iCloudAltDSID"));
  unsigned int v13 = (void *)v12;
  if (v6) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14;
  if (!v14)
  {
    BOOL v16 = _AFPreferencesSiriRMVSetting(v12) == 1 || _AFPreferencesSiriRMVSetting(v13) == 2;
    -[ADCommunalDeviceUser setVoiceIDAllowedByUser:](v6, "setVoiceIDAllowedByUser:", v16);
  }

  return v15;
}

- (void)_allowVoiceIdentificationForThisUser:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = (void (**)(void, void))v10;
  homeUserSettings = self->_homeUserSettings;
  if (homeUserSettings)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_homeUserSettings, "objectForKey:", v8));
    if (v14)
    {
      BOOL v16 = (void *)v14;
      if (AFIsATV(v14, v15)
        && +[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled")
        && -[NSString isEqualToString:](self->_userWithRMVEnabledDuringBuddy, "isEqualToString:", v9))
      {
        id v17 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v31 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
          __int16 v32 = 2112;
          uint64_t v33 = (uint64_t)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Now past buddy and sync is done; set RMV enabled for the user requested during buddy flow with iCloudAltDSID %@",
            buf,
            0x16u);
        }

        id v18 = [v16 mutableCopy];
        [v18 setObject:&off_100513720 forKey:@"allowVoiceID"];
        -[NSMutableDictionary setObject:forKey:](self->_homeUserSettings, "setObject:forKey:", v18, v8);

        BOOL v16 = v18;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"allowVoiceID"]);
      __int16 v20 = v19;
      if (v19 && [v19 integerValue] == (id)1)
      {
        if (v12) {
          v12[2](v12, 0LL);
        }

        goto LABEL_28;
      }

      unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v32 = 2112;
        uint64_t v33 = (uint64_t)v8;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s VoiceID disallowed for (%@) checking with HomeKit as they sometimes miss notifying us.",  buf,  0x16u);
      }
    }

    else
    {
      __int16 v22 = (os_log_s *)AFSiriLogContextDaemon;
      id v10 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if ((_DWORD)v10)
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v32 = 2112;
        uint64_t v33 = (uint64_t)v8;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Missing setting for (%@) checking with HomeKit as they sometimes miss notifying us.",  buf,  0x16u);
      }
    }
  }

  if (AFIsATV(v10, v11))
  {
    if (_AFPreferencesSiriRMVSetting(v9) == 2)
    {
      uint64_t v23 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "-[ADMultiUserService _allowVoiceIdentificationForThisUser:iCloudAltDSID:completion:]";
        __int16 v32 = 2048;
        uint64_t v33 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s #multi-user-atv Voice ID allowed for user on ATV with profile in state %ld",  buf,  0x16u);
      }

      if (v12) {
        v12[2](v12, 0LL);
      }
    }

    else if (v12)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6010LL,  &__NSDictionary0__struct));
      ((void (**)(void, void *))v12)[2](v12, v25);
    }
  }

  else
  {
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100297EE4;
    v26[3] = &unk_1004F9208;
    v26[4] = self;
    id v27 = v8;
    char v29 = v12;
    id v28 = v9;
    [v24 settingsForMultiUserWithRefresh:homeUserSettings != 0 completion:v26];
  }

- (void)_deleteShareForUser:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADMultiUserService getCloudKitManager](self, "getCloudKitManager"));
  [v5 deleteShareForUser:v4 completion:&stru_1004F8F00];
}

- (void)addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v32 = a7;
  id v22 = a8;
  id v31 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  id v26 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v46 = "-[ADMultiUserService addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrollment"
          "Name:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v27 = v18;
  if (v18 && v19 && v20 && v22)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100297DF4;
    block[3] = &unk_1004F8F28;
    void block[4] = self;
    id v34 = v18;
    id v35 = v19;
    id v36 = v20;
    id v37 = v21;
    id v38 = v32;
    id v39 = v22;
    id v40 = v31;
    id v41 = v23;
    id v42 = v24;
    BOOL v44 = a12;
    id v43 = v25;
    dispatch_async(queue, block);
  }

  else if (v25)
  {
    char v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
    (*((void (**)(id, void *))v25 + 2))(v25, v29);
  }
}

- (BOOL)_updateDeviceOwner:(id)a3 sharedUserId:(id)a4 enrollmentName:(id)a5 companionInfo:(id)a6 shareOwnerName:(id)a7 homeMemberSettings:(id)a8 loggingAllowed:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (self->_primaryUser || (deviceOwner = self->_deviceOwner) == 0LL)
  {
LABEL_2:
    BOOL v21 = 0;
    goto LABEL_3;
  }

  id v118 = v16;
  id v24 = (id)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](deviceOwner, "homeUserUUID"));
  id v25 = v15;
  id v26 = v25;
  if (v24 == v25)
  {
  }

  else
  {
    if (!v25 || !v24)
    {

      goto LABEL_17;
    }

    unsigned __int8 v27 = [v24 isEqual:v25];

    if ((v27 & 1) == 0)
    {
LABEL_17:
      id v32 = (void *)AFSiriLogContextDaemon;
      id v16 = v118;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = self->_deviceOwner;
        id v34 = v32;
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](v33, "homeUserUUID"));
        *(_DWORD *)buf = 136315650;
        v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemb"
               "erSettings:loggingAllowed:]";
        __int16 v121 = 2112;
        id v122 = v35;
        __int16 v123 = 2112;
        v124 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Not updating deviceOwner since homeUserUUIDs are different %@, %@",  buf,  0x20u);
      }

      goto LABEL_2;
    }
  }

  id v28 = (id)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser enrollmentName](self->_deviceOwner, "enrollmentName"));
  id v29 = v17;
  __int16 v30 = v29;
  id v116 = v17;
  if (v28 == v29)
  {

    goto LABEL_20;
  }

  if (v29 && v28)
  {
    unsigned __int8 v31 = [v28 isEqual:v29];

    if ((v31 & 1) == 0) {
      goto LABEL_22;
    }
LABEL_20:
    BOOL v21 = 0;
    id v36 = v118;
    goto LABEL_25;
  }

LABEL_22:
  id v37 = (os_log_s *)AFSiriLogContextDaemon;
  id v36 = v118;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Updating enrollment name", buf, 0xCu);
  }

  -[ADCommunalDeviceUser setEnrollmentName:](self->_deviceOwner, "setEnrollmentName:", v30);
  BOOL v21 = 1;
LABEL_25:
  id v38 = (id)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_deviceOwner, "sharedUserID", v116));
  id v39 = v36;
  id v40 = v39;
  if (v38 == v39)
  {

    goto LABEL_35;
  }

  if (v39 && v38)
  {
    unsigned __int8 v41 = [v38 isEqual:v39];

    if ((v41 & 1) != 0) {
      goto LABEL_35;
    }
  }

  else
  {
  }

  id v42 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSe"
           "ttings:loggingAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Updating sharedUserId", buf, 0xCu);
  }

  -[ADCommunalDeviceUser setSharedUserID:](self->_deviceOwner, "setSharedUserID:", v40);
  BOOL v21 = 1;
LABEL_35:
  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser settings](self->_deviceOwner, "settings"));
  BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v20 dictionary]);
  id v45 = v43;
  id v46 = v44;
  if (v45 == v46)
  {

LABEL_45:
    goto LABEL_46;
  }

  __int16 v47 = v46;
  if (!v45 || !v46)
  {

    goto LABEL_42;
  }

  unsigned __int8 v48 = [v45 isEqual:v46];

  if ((v48 & 1) == 0)
  {
LABEL_42:
    __int128 v49 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v120 = "-[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMember"
             "Settings:loggingAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s Updating HomeKit Settings", buf, 0xCu);
    }

    unsigned int v50 = self->_deviceOwner;
    id v45 = (id)objc_claimAutoreleasedReturnValue([v20 dictionary]);
    -[ADCommunalDeviceUser setSettings:](v50, "setSettings:", v45);
    BOOL v21 = 1;
    goto LABEL_45;
  }

- (void)_addDeviceOwner:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 audioAppSignals:(id)a7 enrollmentName:(id)a8 companionInfo:(id)a9 shareOwnerName:(id)a10 homeMemberSettings:(id)a11 loggingAllowed:(BOOL)a12 completion:(id)a13
{
  id v65 = a3;
  id v67 = a4;
  id v19 = a5;
  id v20 = a6;
  id v66 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = (void (**)(id, void))a13;
  if (!self->_primaryUser)
  {
    id v64 = self;
    id v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (self->_deviceOwner)
    {
      unsigned __int8 v27 = v65;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v69 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrol"
              "lmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Device owner already exists.", buf, 0xCu);
      }

      LOBYTE(v58) = a12;
      __int16 v30 = self;
      BOOL v31 = -[ADMultiUserService _updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:]( self,  "_updateDeviceOwner:sharedUserId:enrollmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:",  v65,  v67,  v21,  v22,  v23,  v24,  v58);
      self->_isMultiUserInfoDirty = v31;
      id v28 = v19;
      if (!v31) {
        goto LABEL_9;
      }
    }

    else
    {
      unsigned __int8 v27 = v65;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315395;
        __int128 v69 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrol"
              "lmentName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
        __int16 v70 = 2113;
        id v71 = v67;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s A new device owner will be added:(%{private}@)",  buf,  0x16u);
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_homeUserSettings, "objectForKey:", v65));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"personalDomainsIsEnabled"]);
      BOOL v61 = [v36 integerValue] == (id)1;

      unsigned __int8 v62 = v35;
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"allowUnauthenticatedRequests"]);
      BOOL v60 = [v37 integerValue] == (id)1;

      id v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"allowExplicitContent"]);
      BOOL v59 = [v38 integerValue] == (id)1;

      id v28 = v19;
      id v39 = -[ADCommunalDeviceUser init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUser),  "init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:",  v65,  v67,  v19,  v20,  0LL);
      deviceOwner = v64->_deviceOwner;
      v64->_deviceOwner = v39;

      -[ADCommunalDeviceUser setEnrollmentName:](v64->_deviceOwner, "setEnrollmentName:", v21);
      unsigned __int8 v41 = v64->_deviceOwner;
      id v63 = v20;
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v22 assistantID]);
      -[ADCommunalDeviceUser setCompanionAssistantID:](v41, "setCompanionAssistantID:", v42);

      id v43 = v64->_deviceOwner;
      BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v22 speechID]);
      -[ADCommunalDeviceUser setCompanionSpeechID:](v43, "setCompanionSpeechID:", v44);

      id v45 = v64->_deviceOwner;
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v22 idsIdentifier]);
      -[ADCommunalDeviceUser setCompanionIDSIdentifier:](v45, "setCompanionIDSIdentifier:", v46);

      __int16 v47 = v64->_deviceOwner;
      unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue([v22 productPrefix]);
      -[ADCommunalDeviceUser setProductPrefix:](v47, "setProductPrefix:", v48);

      __int128 v49 = v64->_deviceOwner;
      unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue([v22 aceHost]);
      -[ADCommunalDeviceUser setAceHost:](v49, "setAceHost:", v50);

      -[ADCommunalDeviceUser setShareOwnerName:](v64->_deviceOwner, "setShareOwnerName:", v23);
      -[ADCommunalDeviceUser setAllowExplicitContent:](v64->_deviceOwner, "setAllowExplicitContent:", v59);
      id v51 = v64->_deviceOwner;
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v24 dictionary]);
      -[ADCommunalDeviceUser setSettings:](v51, "setSettings:", v52);

      -[ADCommunalDeviceUser testAndSetLoggingIsAllowed:](v64->_deviceOwner, "testAndSetLoggingIsAllowed:", a12);
      -[ADCommunalDeviceUser setVoiceIDAllowedByUser:](v64->_deviceOwner, "setVoiceIDAllowedByUser:", 0LL);
      -[ADCommunalDeviceUser setPersonalDomainsIsEnabled:](v64->_deviceOwner, "setPersonalDomainsIsEnabled:", v61);
      -[ADCommunalDeviceUser setUnauthenticatedRequestsAllowed:]( v64->_deviceOwner,  "setUnauthenticatedRequestsAllowed:",  v60);
      __int16 v53 = v64->_deviceOwner;
      unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue([v22 syncMetadata]);
      -[ADCommunalDeviceUser setCompanionSyncMetadata:](v53, "setCompanionSyncMetadata:", v54);

      id v20 = v63;
      -[ADCommunalDeviceUser setCompanionSyncMetadataCapable:]( v64->_deviceOwner,  "setCompanionSyncMetadataCapable:",  [v22 syncMetadataCapability]);
      __int16 v55 = v64->_deviceOwner;
      id v56 = [v22 peerToPeerHandoffCapability];
      __int16 v57 = v55;
      __int16 v30 = v64;
      -[ADCommunalDeviceUser setCompanionPeerToPeerHandoffCapable:](v57, "setCompanionPeerToPeerHandoffCapable:", v56);
      -[ADCommunalDeviceUser setAudioAppSignals:](v64->_deviceOwner, "setAudioAppSignals:", v66);
      v64->_isMultiUserInfoDirty = 1;

      if (!v64->_isMultiUserInfoDirty) {
        goto LABEL_9;
      }
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v33 = v20;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](v64->_deviceOwner, "dictionaryRepresentation"));
    [v32 setDeviceOwner:v34];

    id v20 = v33;
    __int16 v30 = v64;
    -[ADMultiUserService _notifyRemoraClientsOfDeviceOwner](v64, "_notifyRemoraClientsOfDeviceOwner");
LABEL_9:
    -[ADMultiUserService _saveDeviceOwnerToKeychainCache](v30, "_saveDeviceOwnerToKeychainCache");
    goto LABEL_10;
  }

  id v26 = (os_log_s *)AFSiriLogContextDaemon;
  unsigned __int8 v27 = v65;
  id v28 = v19;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v69 = "-[ADMultiUserService _addDeviceOwner:sharedUserId:loggableSharedUserId:iCloudAltDSID:audioAppSignals:enrollmen"
          "tName:companionInfo:shareOwnerName:homeMemberSettings:loggingAllowed:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Primary user already exists.", buf, 0xCu);
  }

- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 completion:(id)a9
{
  LOBYTE(v9) = 1;
  -[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloudSyncedUser:completion:]( self,  "addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloudSyncedUser:completion:",  a3,  a4,  a5,  a6,  a7,  a8,  v9,  a9);
}

- (void)addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v51 = "-[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:nonCloud"
          "SyncedUser:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  BOOL v23 = -[ADMultiUserService _isHostingMultiUserLanguage](self, "_isHostingMultiUserLanguage");
  if (v23)
  {
    if (v16)
    {
      if (!v17) {
        goto LABEL_19;
      }
    }

    else
    {
      char v27 = AFIsATV(v23, v24);
      if (!v17 || (v27 & 1) == 0)
      {
LABEL_19:
        if (v21)
        {
          uint64_t v25 = kAFAssistantErrorDomain;
          uint64_t v26 = 6002LL;
          goto LABEL_21;
        }

        goto LABEL_23;
      }
    }

    if (v18 && v20)
    {
      uint64_t v28 = _AFPreferencesSiriRMVSetting(v19);
      uint64_t v30 = AFIsATV(v28, v29);
      if ((_DWORD)v30
        && (uint64_t v30 = -[ADMultiUserService allowRmVforHomeUserRecentlyOnboardedWithHomeUserID:]( self,  "allowRmVforHomeUserRecentlyOnboardedWithHomeUserID:",  v16),  (_DWORD)v30)
        && (id v40 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService")),
            unsigned int v39 = [v40 userProfileExistsWithiCloudAltDSID:v19],
            v40,
            v39))
      {
        BOOL v31 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315651;
          id v51 = "-[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:no"
                "nCloudSyncedUser:completion:]";
          __int16 v52 = 2113;
          id v53 = v16;
          __int16 v54 = 2113;
          uint64_t v55 = (uint64_t)v19;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s #multi-user-atv Allowing RmV for previously onboarded home user %{private}@ iCloud ID %{private}@",  buf,  0x20u);
        }

        -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v19,  v16,  2LL);
      }

      else if (AFIsATVOnly(v30) && (unint64_t)(v28 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        id v34 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          id v37 = v34;
          uint64_t v38 = _AFPreferencesSiriRMVSetting(v19);
          *(_DWORD *)buf = 136315651;
          id v51 = "-[ADMultiUserService addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:no"
                "nCloudSyncedUser:completion:]";
          __int16 v52 = 2113;
          id v53 = v19;
          __int16 v54 = 2048;
          uint64_t v55 = v38;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "%s #multi-user-atv Attempting to add a user %{private}@ who does not have RmV enabled tracking. Bailing. %ld",  buf,  0x20u);
        }

        id v35 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( self->_voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  v17,  0LL);
        if (v21)
        {
          uint64_t v32 = objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1010LL,  @"RmV not enabled"));
          goto LABEL_22;
        }

        goto LABEL_23;
      }

      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100297C4C;
      block[3] = &unk_1004F8F78;
      BOOL v48 = a9;
      void block[4] = self;
      id v42 = v16;
      id v43 = v17;
      id v44 = v18;
      id v45 = v19;
      id v46 = v20;
      BOOL v49 = a8;
      id v47 = v21;
      dispatch_async(queue, block);

      goto LABEL_23;
    }

    goto LABEL_19;
  }

  if (v21)
  {
    uint64_t v25 = kAFAssistantErrorDomain;
    uint64_t v26 = 6012LL;
LABEL_21:
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v25,  v26,  &__NSDictionary0__struct));
LABEL_22:
    id v33 = (void *)v32;
    (*((void (**)(id, uint64_t))v21 + 2))(v21, v32);
  }

- (void)_addUser:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 enrollmentName:(id)a7 isPrimary:(BOOL)a8 nonCloudSyncedUser:(BOOL)a9 completion:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v106 = a5;
  id v18 = a6;
  id v19 = a7;
  __int128 v105 = (void (**)(id, void *))a10;
  __int128 v107 = v19;
  if (-[ADMultiUserService _profileLimitReached](self, "_profileLimitReached"))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersByHomeUserUUID, "objectForKey:", v16));
    if (v20)
    {
    }

    else
    {
      id v21 = v16;
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
      unsigned __int8 v23 = [v21 isEqualToString:v22];

      id v16 = v21;
      if ((v23 & 1) == 0)
      {
        __int128 v74 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:"
                 "nonCloudSyncedUser:completion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_INFO,  "%s Active voice profile limit reached",  buf,  0xCu);
        }

        __int128 v75 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        [v75 logEventWithType:6102 contextProvider:0];

        unsigned int v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6011LL,  &__NSDictionary0__struct));
        id v76 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSymptomsReporter sharedInstance]( &OBJC_CLASS___SiriCoreSymptomsReporter,  "sharedInstance"));
        id v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        id v78 = [v77 processIdentifier];
        uint64_t v79 = byte_1005780A0;
        id v80 = sub_100071CA8((uint64_t)v78);
        __int16 v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
        [v76 reportIssueForError:v73 type:6102 context:&__NSDictionary0__struct processIdentifier:v78 walkboutStatus:v79 triggerForIDSIdentifiers:v81];

        uint64_t v25 = v106;
        id v16 = v21;
        uint64_t v26 = v18;
        if (!v73) {
          goto LABEL_91;
        }
        goto LABEL_92;
      }
    }
  }

  if (!v10)
  {
    uint64_t v26 = v18;
    if (!self->_sharedUsersBySharedUserID)
    {
      BOOL v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      sharedUsersBySharedUserID = self->_sharedUsersBySharedUserID;
      self->_sharedUsersBySharedUserID = v31;
    }

    if (!self->_sharedUsersByHomeUserUUID)
    {
      id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      sharedUsersByHomeUserUUID = self->_sharedUsersByHomeUserUUID;
      self->_sharedUsersByHomeUserUUID = v33;
    }

    if (!self->_sharedUsersByiCloudAltDSID)
    {
      id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      sharedUsersByiCloudAltDSID = self->_sharedUsersByiCloudAltDSID;
      self->_sharedUsersByiCloudAltDSID = v35;
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersByHomeUserUUID, "objectForKey:", v16));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 homeUserUUID]);
    unsigned int v39 = [v38 isEqualToString:v16];

    if (v39)
    {
      id v40 = v16;
      unsigned __int8 v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sharedUsersByHomeUserUUID, "objectForKey:", v16));
      id v42 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v43 = v42;
        id v44 = (void *)objc_claimAutoreleasedReturnValue([v41 sharedUserID]);
        *(_DWORD *)buf = 136315906;
        unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:no"
               "nCloudSyncedUser:completion:]";
        __int16 v110 = 2112;
        id v111 = v17;
        __int16 v112 = 2112;
        id v113 = v18;
        __int16 v114 = 2112;
        __int16 v115 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "%s Secondary user exists for (%@) iCloudAltDSID (%@), rewriting (%@)",  buf,  0x2Au);
      }

      id v45 = (void *)objc_claimAutoreleasedReturnValue([v41 sharedUserID]);
      if (([v45 isEqualToString:v17] & 1) == 0)
      {
        id v46 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315395;
          unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimary:"
                 "nonCloudSyncedUser:completion:]";
          __int16 v110 = 2113;
          id v111 = v45;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Deleting %{private}@", buf, 0x16u);
        }

        id v47 =  -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]( self->_voiceProfileManager,  "discardSiriEnrollmentForProfileId:forLanguageCode:",  v45,  0LL);
        -[NSMutableDictionary removeObjectForKey:](self->_sharedUsersBySharedUserID, "removeObjectForKey:", v45);
        [v41 setSharedUserID:v17];
        -[NSMutableDictionary setObject:forKey:](self->_sharedUsersBySharedUserID, "setObject:forKey:", v41, v17);
      }

      uint64_t v25 = v106;
      id v16 = v40;
      uint64_t v26 = v18;
      goto LABEL_91;
    }

    BOOL v48 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
    uint64_t v25 = v106;
    if (([v48 isEqualToString:v16] & 1) == 0)
    {
      id v49 = v16;
      unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
      if (![v50 isEqualToString:v17])
      {
        __int128 v90 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));
        unsigned __int8 v91 = [v90 isEqualToString:v26];

        id v16 = v49;
        if ((v91 & 1) == 0)
        {
          v92 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimar"
                   "y:nonCloudSyncedUser:completion:]";
            __int16 v110 = 2112;
            id v111 = v107;
            _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_INFO,  "%s Secondary user added for (%@)",  buf,  0x16u);
          }

          id v56 = -[ADCommunalDeviceUser init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUser),  "init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:",  v49,  v17,  v106,  v26,  1LL);
          [v56 setEnrollmentName:v107];
          if (a9) {
            [v56 setNonCloudSyncedUserAttribute:1];
          }
          -[ADMultiUserService _updateMappingsForSharedUser:](self, "_updateMappingsForSharedUser:", v56);
          -[ADMultiUserService _saveSharedUsers](self, "_saveSharedUsers");
          id v93 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimar"
                   "y:nonCloudSyncedUser:completion:]";
            __int16 v110 = 2112;
            id v111 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_INFO,  "%s #multi-user Logging userAddedWithSharedUserID:(%@) for secondary User ",  buf,  0x16u);
          }

          -[ADMultiUserService _logRelevantAnalyticsOnUserAddedWithSharedUserID:isPrimary:]( self,  "_logRelevantAnalyticsOnUserAddedWithSharedUserID:isPrimary:",  v17,  0LL);
          id v94 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            __int16 v95 = v94;
            unsigned __int8 v96 = (void *)objc_claimAutoreleasedReturnValue([v56 sharedUserID]);
            *(_DWORD *)buf = 136315395;
            unsigned int v109 = "-[ADMultiUserService _addUser:sharedUserId:loggableSharedUserId:iCloudAltDSID:enrollmentName:isPrimar"
                   "y:nonCloudSyncedUser:completion:]";
            __int16 v110 = 2113;
            id v111 = v96;
            _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "%s Posting notification that shared user with sharedUserId: (%{private}@) has been added",  buf,  0x16u);
          }

          __int16 v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v97 postNotificationName:@"ADMultiUserSharedUserAddedNotification" object:v56];

          goto LABEL_90;
        }

- (void)removeDeviceOwner
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v7 = "-[ADMultiUserService removeDeviceOwner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100297BFC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeUserWithShareOwnerNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if (!v6 || ![v6 count])
  {
    uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[ADMultiUserService removeUserWithShareOwnerNames:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s no shareOwnerNames", buf, 0xCu);
      if (!v7) {
        goto LABEL_7;
      }
    }

    else if (!v7)
    {
      goto LABEL_7;
    }

    v7[2](v7, 0LL);
    goto LABEL_7;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002978A4;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v11 = v6;
  uint64_t v12 = v7;
  dispatch_async(queue, block);

LABEL_7:
}

- (void)_logRelevantAnalyticsOnUserAddedWithSharedUserID:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v10 = "-[ADMultiUserService _logRelevantAnalyticsOnUserAddedWithSharedUserID:isPrimary:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002977BC;
  v7[3] = &unk_1004F8F98;
  BOOL v8 = a4;
  [v6 logEventWithType:6112 contextProvider:v7];
}

- (BOOL)_removeUser:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5 iCloudAltDSID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v116 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v17 = v15;
  uint64_t v19 = AFIsATV(v17, v18);
  id v21 = v17;
  if (!v17)
  {
    id v21 = 0LL;
    if ((_DWORD)v19)
    {
      if (v12)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);
        id v21 = (void *)v19;
        if (!v13)
        {
LABEL_11:
          if (!v21)
          {
            uint64_t v25 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              __int16 v116 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s #multi-user-atv No iCloudAltDSID found for user.. checking local mapping",  buf,  0xCu);
            }

            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_iCloudAltDSIDByHomeUserID, "objectForKey:", v13));
            uint64_t v26 = (os_log_s *)AFSiriLogContextDaemon;
            uint64_t v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
            if ((_DWORD)v19)
            {
              *(_DWORD *)buf = 136315395;
              __int16 v116 = "-[ADMultiUserService _removeUser:homeUserID:sharedUserID:iCloudAltDSID:error:]";
              __int16 v117 = 2113;
              id v118 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s #multi-user-atv Found %{private}@",  buf,  0x16u);
            }
          }

          goto LABEL_16;
        }
      }

      else
      {
        id v21 = 0LL;
        if (!v13) {
          goto LABEL_11;
        }
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
      unsigned int v23 = [v22 isEqualToString:v13];

      if (v23)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser iCloudAltDSID](self->_primaryUser, "iCloudAltDSID"));

        id v21 = (void *)v24;
      }

      goto LABEL_11;
    }
  }

- (void)_postRemovalStateCleanup
{
}

- (void)removeUserWithHomeUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    id v14 = "-[ADMultiUserService removeUserWithHomeUUID:completion:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Remove user with home user id %{private}@",  buf,  0x16u);
  }

  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029772C;
    block[3] = &unk_1004FD9E0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)removeUserWithSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    id v14 = "-[ADMultiUserService removeUserWithSharedUserID:completion:]";
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Remove user with shared user id %{private}@",  buf,  0x16u);
  }

  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029769C;
    block[3] = &unk_1004FD9E0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (id)homeUserIdToNames
{
  unsigned int v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!self->_primaryUser) {
    goto LABEL_8;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommunalDeviceUser saHomeMemberInfo:](&OBJC_CLASS___ADCommunalDeviceUser, "saHomeMemberInfo:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 homeMemberSettings]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 meCard]);

  if (!v5)
  {
    BOOL v8 = (void *)AFSiriLogContextConnection;
    if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    unint64_t primaryUser = self->_primaryUser;
    id v7 = v8;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](primaryUser, "homeUserUUID"));
    *(_DWORD *)buf = 136315395;
    uint64_t v35 = "-[ADMultiUserService homeUserIdToNames]";
    __int16 v36 = 2113;
    id v37 = v26;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Empty meCard for homeUserId %{private}@",  buf,  0x16u);

    goto LABEL_5;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));

  if (v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser homeUserUUID](self->_primaryUser, "homeUserUUID"));
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v5, v7);
LABEL_5:
  }

- (id)_augmentUserPropertiesWithHomeInfoForUser:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userProperties]);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserUUID]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentHome]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
      [v5 setObject:v10 forKey:@"homeName"];
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      [v5 setObject:v13 forKey:@"homeId"];
    }
  }

  return v5;
}

- (void)showMultiUsersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100297184;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getMultiUserCompanionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100296F38;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)showPrimaryUserSharedUserIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100296ED8;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)showMultiUserSharedUserIDsCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100296D58;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100296D44;
  v25[3] = &unk_1004FC7E8;
  id v19 = a3;
  id v26 = v19;
  uint64_t v18 = objc_retainBlock(v25);
  id v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService allUsersBySharedUserID](self, "allUsersBySharedUserID"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v12]);
        id v14 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryRepresentation]);
        id v16 = -[NSMutableDictionary initWithDictionary:copyItems:](v14, "initWithDictionary:copyItems:", v15, 1LL);

        LODWORD(v15) = [v20 isSATEnrolledForSiriProfileId:v12 forLanguageCode:v4->_currentLanguage];
        -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", @"homeMemberSettings");
        if ((_DWORD)v15) {
          id v17 = @"YES";
        }
        else {
          id v17 = @"NO";
        }
        -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, @"isSATEnrolledForSiriProfileId");
        -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v16, v12);
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v9);
  }

  ((void (*)(void *, NSMutableDictionary *))v18[2])(v18, v6);
}

- (id)multiUserSAObject
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10028D180;
  uint64_t v10 = sub_10028D190;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100296D0C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)fetchDeviceOwnerAsSAMultiUserInfo:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (self->_deviceOwner)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommunalDeviceUser saMultiUserInfo:](&OBJC_CLASS___ADCommunalDeviceUser, "saMultiUserInfo:"));
      v4[2](v4, v5);
    }

    else
    {
      uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v11 = "-[ADMultiUserService fetchDeviceOwnerAsSAMultiUserInfo:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Device Owner does not exist. Falling back to creating an ephemeral device owner",  buf,  0xCu);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100296B48;
      v8[3] = &unk_1004F8FE8;
      v8[4] = self;
      id v9 = v4;
      [v7 fetchActiveAccount:v8];
    }
  }
}

- (id)_generateDeviceUserWithHomeUserUUID:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 adaccount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v43 = "-[ADMultiUserService _generateDeviceUserWithHomeUserUUID:sharedUserId:loggableSharedUserId:adaccount:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _cachedAssistantData]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aa_primaryAppleAccount"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aa_altDSID"));

  uint64_t v40 = v11;
  unsigned __int8 v41 = v10;
  id v20 = -[ADCommunalDeviceUser init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:]( objc_alloc(&OBJC_CLASS___ADCommunalDeviceUser),  "init:sharedUserId:loggableSharedUserId:iCloudAltDSID:attribute:",  v10,  v11,  v12,  v19,  0LL);
  __int128 v21 = (NSString *)objc_claimAutoreleasedReturnValue([v15 unredactedAnchor]);
  cachedAssistantDataUnredactedAnchor = self->_cachedAssistantDataUnredactedAnchor;
  self->_cachedAssistantDataUnredactedAnchor = v21;

  [v20 setEnrollmentName:@"primary_user"];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v13 aceHost]);
  [v20 setAceHost:v23];

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v13 speechIdentifier]);
  [v20 setSpeechID:v24];

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 peerAssistantIdentifier]);
  [v20 setCompanionAssistantID:v25];

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v13 peerSpeechIdentifier]);
  [v20 setCompanionSpeechID:v26];

  [v20 setVoiceIDAllowedByUser:0];
  id v27 = objc_alloc_init(&OBJC_CLASS___SAHomeMemberSettings);
  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v16 region]);
  [v27 setRegion:v28];

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v16 ttsVoice]);
  [v27 setTtsVoice:v29];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v16 twentyFourHourTimeDisplay]);
  [v27 setTwentyFourHourTimeDisplay:v30];

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v16 temperatureUnit]);
  [v27 setTemperatureUnit:v31];

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v16 countryCode]);
  [v27 setCountryCode:v32];

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v16 parentalRestrictions]);
  [v27 setParentalRestrictions:v33];

  objc_msgSend( v27,  "setMediaPlayerExplicitContentDisallowed:",  objc_msgSend(v16, "mediaPlayerExplicitContentDisallowed"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v15 _unredactedMeCards]);
  id v35 = [v34 count];

  if (v35)
  {
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v15 _unredactedMeCards]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndexedSubscript:0]);
    [v27 setMeCard:v37];
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v27 dictionary]);
  [v20 setSettings:v38];

  return v20;
}

- (id)sharedRemoteDevices
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002968AC;
  v9[3] = &unk_1004FD968;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)validateAndReturnScores:(id)a3 classifiedUser:(id)a4 donatedScores:(id)a5 unknownUserSharedId:(id *)a6 totalUsers:(unint64_t *)a7 ghostVoiceProfileDetected:(BOOL *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:t"
                         "otalUsers:ghostVoiceProfileDetected:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Incoming scores %@", buf, 0x16u);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v52 = sub_10028D180;
  id v53 = sub_10028D190;
  id v54 = 0LL;
  uint64_t v41 = 0LL;
  BOOL v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v44 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10029607C;
  block[3] = &unk_1004F9038;
  void block[4] = self;
  uint64_t v38 = &v41;
  id v20 = v14;
  id v33 = v20;
  uint64_t v40 = a8;
  id v21 = v13;
  id v34 = v21;
  id v22 = v15;
  id v35 = v22;
  __int128 v23 = v18;
  __int16 v36 = v23;
  __int128 v24 = v17;
  id v37 = v24;
  uint64_t v39 = buf;
  dispatch_sync(queue, block);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v49[0] = @"local_scores";
  v49[1] = @"donated_scores";
  v50[0] = v24;
  v50[1] = v23;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL));
  [v25 logEventWithType:6115 context:v26];

  id v27 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v45 = 136315394;
    id v46 = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:totalUsers:ghost"
          "VoiceProfileDetected:]";
    __int16 v47 = 2112;
    id v48 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s (%@)", v45, 0x16u);
    id v27 = (os_log_s *)AFSiriLogContextDaemon;
  }

  if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  *(_DWORD *)id v45 = 136315395;
  id v46 = "-[ADMultiUserService validateAndReturnScores:classifiedUser:donatedScores:unknownUserSharedId:totalUsers:ghostVo"
        "iceProfileDetected:]";
  __int16 v47 = 2113;
  id v48 = v23;
  _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s (%{private}@)", v45, 0x16u);
  if (a6) {
LABEL_7:
  }
    *a6 = *(id *)(*(void *)&buf[8] + 40LL);
LABEL_8:
  if (a7) {
    *a7 = v42[3];
  }
  unsigned int v28 = v37;
  __int128 v29 = v24;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  return v29;
}

- (void)resetAllUsers
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100295EFC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceProfilesOutOfSync
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100295C4C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setPrimaryUser:(id)a3
{
  id v9 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(current_queue);
  queue = self->_queue;

  if (v6 == queue)
  {
    objc_storeStrong((id *)&self->_primaryUser, a3);
  }

  else
  {
    uint64_t v8 = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100295C40;
    block[3] = &unk_1004FD968;
    void block[4] = self;
    id v11 = v9;
    dispatch_sync(v8, block);
  }
}

- (id)getUserAgentStringForSharedUserID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10028D180;
  id v17 = sub_10028D190;
  id v18 = 0LL;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100295C04;
    block[3] = &unk_1004FBE80;
    id v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(queue, block);

    id v7 = (void *)v14[5];
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)getUserAgentStringForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100295BB8;
    block[3] = &unk_1004FD9E0;
    void block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(queue, block);
  }
}

- (id)_getUserAgentStringForSharedUserID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t primaryUser = (ADCommunalDeviceUser *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  v4));
    id v6 = primaryUser;
    if (!primaryUser)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser sharedUserID](self->_primaryUser, "sharedUserID"));
      unsigned int v9 = [v8 isEqualToString:v4];

      if (!v9)
      {
        id v7 = 0LL;
        goto LABEL_9;
      }

      unint64_t primaryUser = self->_primaryUser;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser productPrefix](primaryUser, "productPrefix"));
LABEL_9:

    goto LABEL_10;
  }

  id v7 = 0LL;
LABEL_10:

  return v7;
}

- (void)setSiriRMVState:(BOOL)a3 foriCloudAltDSID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(id, uint64_t))a5;
  if (!+[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled"))
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
LABEL_14:
    id v18 = (void *)v15;
    v9[2](v9, v15);

    goto LABEL_15;
  }

  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_DWORD *)buf = 136315395;
    uint64_t v25 = "-[ADMultiUserService setSiriRMVState:foriCloudAltDSID:completion:]";
    __int16 v26 = 2113;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s iCloudAltDSID: %{private}@", buf, 0x16u);
  }

  if ((AFIsATV(v11, v12) & 1) == 0)
  {
    id v16 = @"Siri RMV state only supported from ATV";
    uint64_t v17 = 1010LL;
LABEL_13:
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:description:](&OBJC_CLASS___AFError, "errorWithCode:description:", v17, v16));
    goto LABEL_14;
  }

  if (!v8)
  {
    id v16 = @"iCloudAltDSID is nil";
    uint64_t v17 = 0LL;
    goto LABEL_13;
  }

  if (v6) {
    uint64_t v13 = 2LL;
  }
  else {
    uint64_t v13 = 3LL;
  }
  -[ADMultiUserService triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:]( self,  "triggerATVRmVStateChangeForiCloudAltDSID:homeUserID:toState:",  v8,  0LL,  v13);
  queue = (dispatch_queue_s *)self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100294DAC;
  v19[3] = &unk_1004FBFC0;
  id v20 = v8;
  id v21 = self;
  id v22 = v9;
  BOOL v23 = v6;
  dispatch_async(queue, v19);

LABEL_15:
}

- (void)getSiriRMVStateForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    id v18 = "-[ADMultiUserService getSiriRMVStateForiCloudAltDSID:completion:]";
    __int16 v19 = 2113;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s iCloudAltDSID: %{private}@", buf, 0x16u);
  }

  id v9 = +[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled");
  if (!(_DWORD)v9)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
LABEL_8:
    uint64_t v13 = (void *)v12;
    v7[2](v7, 0LL, v12);

    goto LABEL_9;
  }

  if ((AFIsATV(v9, v10) & 1) == 0)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  1010LL,  @"Siri RMV state only supported from ATV"));
    goto LABEL_8;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100294B14;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  dispatch_async(queue, block);

LABEL_9:
}

- (void)updateRmVForUserProfilesWithLanguageCode:(id)a3
{
  id v4 = a3;
  if ((AFIsATV(v4, v5) & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100294728;
    v8[3] = &unk_1004FD968;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v11 = "-[ADMultiUserService updateRmVForUserProfilesWithLanguageCode:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Operation only allowed on AppleTV", buf, 0xCu);
    }
  }
}

- (void)saveHomeUserIdsForICloudAltDSID:(id)a3 homeMemberships:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[ADMultiUserService saveHomeUserIdsForICloudAltDSID:homeMemberships:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002945E4;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (BOOL)isRmVEnabledForHomeUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADMultiUserService isRmVEnabledForHomeUser:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100294450;
  block[3] = &unk_1004FBE80;
  void block[4] = self;
  id v11 = v4;
  p___int128 buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  char v8 = *(_BYTE *)(*((void *)&buf + 1) + 24LL);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (BOOL)allowRmVforHomeUserRecentlyOnboardedWithHomeUserID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100294414;
  block[3] = &unk_1004FBE80;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)triggerATVRmVStateChangeForiCloudAltDSID:(id)a3 homeUserID:(id)a4 toState:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->isATVOnly)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002938A0;
    v11[3] = &unk_1004FD510;
    id v12 = v8;
    id v13 = v9;
    char v14 = self;
    int64_t v15 = a5;
    dispatch_async(queue, v11);
  }
}

- (void)syncATVRmVSettingIfAvailable
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100293450;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)syncToCloudATVRmVSetting:(BOOL)a3 homeID:(id)a4 homeUserID:(id)a5 notifyClients:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v20 = "-[ADMultiUserService syncToCloudATVRmVSetting:homeID:homeUserID:notifyClients:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100292E98;
  v15[3] = &unk_1004FC250;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a3;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (BOOL)userProfileExistsWithHomeUserID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ADMultiUserService userProfileExistsWithHomeUserID:]";
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #multi-user-atv %{private}@", buf, 0x16u);
  }

  if (v4)
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v13 = 0;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100292D94;
    block[3] = &unk_1004FBE80;
    void block[4] = self;
    id v10 = v4;
    uint64_t v11 = buf;
    dispatch_sync(queue, block);
    BOOL v7 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;

    _Block_object_dispose(buf, 8);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_trackGhostVoiceProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315395;
    id v10 = "-[ADMultiUserService _trackGhostVoiceProfile:]";
    __int16 v11 = 2113;
    id v12 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s sharedUserID %{private}@",  (uint8_t *)&v9,  0x16u);
  }

  ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  if (!ghostVoiceProfileSharedUserIDs)
  {
    BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v8 = self->_ghostVoiceProfileSharedUserIDs;
    self->_ghostVoiceProfileSharedUserIDs = v7;

    ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  }

  -[NSMutableSet addObject:](ghostVoiceProfileSharedUserIDs, "addObject:", v4);
}

- (void)_removeGhostVoiceProfiles
{
  ghostVoiceProfileSharedUserIDs = self->_ghostVoiceProfileSharedUserIDs;
  if (ghostVoiceProfileSharedUserIDs)
  {
    if (-[NSMutableSet count](ghostVoiceProfileSharedUserIDs, "count"))
    {
      id v4 = self->_ghostVoiceProfileSharedUserIDs;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100292CAC;
      v6[3] = &unk_1004F91A0;
      v6[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", v6);
      -[NSMutableSet removeAllObjects](self->_ghostVoiceProfileSharedUserIDs, "removeAllObjects");
      uint64_t v5 = self->_ghostVoiceProfileSharedUserIDs;
      self->_ghostVoiceProfileSharedUserIDs = 0LL;
    }
  }

- (void)updateVoiceProfiles
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    BOOL v7 = "-[ADMultiUserService updateVoiceProfiles]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100292C6C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)triggerMultiUserMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      if (-[ADMultiUserService _isCurrentLanguageMultiUserCompatible](self, "_isCurrentLanguageMultiUserCompatible"))
      {
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1002927F0;
        v11[3] = &unk_1004FCA28;
        void v11[4] = self;
        id v12 = v6;
        [v7 getVoiceSettingsForHomeMembers:v11];

        goto LABEL_8;
      }

      uint64_t v8 = kAFAssistantErrorDomain;
      uint64_t v9 = 6012LL;
    }

    else
    {
      uint64_t v8 = kAFAssistantErrorDomain;
      uint64_t v9 = 6004LL;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  v9,  &__NSDictionary0__struct));
    ((void (**)(void, void *))v6)[2](v6, v10);
  }

- (void)updateMultiUserWithSharedUserId:(id)a3 companionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADMultiUserService updateMultiUserWithSharedUserId:companionInfo:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
  }

  if ((AFSupportsMultiUser(v12, v13) & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 assistantID]);
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 speechID]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 idsIdentifier]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 productPrefix]);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v9 aceHost]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v9 syncMetadata]);
    id v34 = v15;
    if ([v9 meDevice])
    {
      LODWORD(v25) = [v9 meDevice];
    }

    else
    {
      BOOL v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADMultiUserService updateMultiUserWithSharedUserId:companionInfo:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s meDevice field not found",  (uint8_t *)&buf,  0xCu);
      }

      LODWORD(v25) = 1;
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "siriLanguage", v25));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v55 = 0x3032000000LL;
    unsigned int v56 = sub_10028D180;
    __int16 v57 = sub_10028D190;
    id v58 = 0LL;
    v52[0] = 0LL;
    v52[1] = v52;
    v52[2] = 0x3032000000LL;
    v52[3] = sub_10028D180;
    v52[4] = sub_10028D190;
    id v53 = 0LL;
    v50[0] = 0LL;
    v50[1] = v50;
    void v50[2] = 0x2020000000LL;
    char v51 = 0;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100291704;
    block[3] = &unk_1004F9230;
    void block[4] = self;
    id v32 = v8;
    id v36 = v8;
    id v37 = v14;
    id v38 = v15;
    id v39 = v16;
    id v40 = v33;
    id v41 = v30;
    __int16 v47 = v50;
    p___int128 buf = &buf;
    id v46 = v52;
    id v42 = v28;
    id v43 = v9;
    id v44 = v19;
    char v49 = v26;
    id v45 = v10;
    id v27 = v19;
    id v29 = v28;
    id v31 = v30;
    id v21 = v33;
    id v22 = v16;
    id v23 = v34;
    id v24 = v14;
    dispatch_async(queue, block);

    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v52, 8);

    _Block_object_dispose(&buf, 8);
    id v8 = v32;
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v17);
    }
  }
}

- (void)setEnrollmentName:(id)a3 forHomeUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002916BC;
    block[3] = &unk_1004FD4C0;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
}

- (void)setShareOwnerName:(id)a3 homeMemberSettings:(id)a4 audioAppSignals:(id)a5 loggingAllowed:(BOOL)a6 forSharedUserId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002915A0;
  v21[3] = &unk_1004F9258;
  v21[4] = self;
  id v22 = v15;
  BOOL v26 = a6;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(queue, v21);
}

- (BOOL)_profileLimitReached
{
  id v3 = (char *)-[NSMutableDictionary count](self->_sharedUsersBySharedUserID, "count");
  if (self->_primaryUser) {
    id v4 = v3 + 1;
  }
  else {
    id v4 = v3;
  }
  return (unint64_t)v4 >= AFMultiUserServiceUserProfileLimit;
}

- (id)getSharedUserIdForShareOwnerName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10028D180;
  id v16 = sub_10028D190;
  id v17 = 0LL;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002913F0;
    block[3] = &unk_1004FBE80;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];
  }

  else
  {
    id v7 = 0LL;
  }

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)getSyncableSharedUserIdForSharedUserId:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10028D180;
  id v17 = sub_10028D190;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002912EC;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)getSyncableSharedUserIdsForSharedUserIds:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10028D180;
  id v17 = sub_10028D190;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100291150;
  block[3] = &unk_1004FBE80;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)getSharedUserIdForHomeUserId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    uint64_t v15 = sub_10028D180;
    id v16 = sub_10028D190;
    id v17 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10029104C;
    block[3] = &unk_1004FBE80;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)getAllowExplicitContentSettingForRecognizedUser
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v4 = [v3 allowExplicitContent];

  unsigned __int8 v14 = v4;
  if (AFSupportsMultiUser(v5, v6))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100290DEC;
    v10[3] = &unk_1004FCDB0;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(queue, v10);
  }

  char v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)getHomeUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    char v8 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      *(_DWORD *)__int128 buf = 136315395;
      id v17 = "-[ADMultiUserService getHomeUserIdForSharedUserId:completion:]";
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %{private}@", buf, 0x16u);
      if (!v6) {
        goto LABEL_7;
      }
    }

    else if (!v6)
    {
      goto LABEL_7;
    }

    if ((AFSupportsMultiUser(v9, v10) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100290B3C;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v14 = v6;
      id v15 = v7;
      dispatch_async(queue, block);

      goto LABEL_8;
    }

- (void)isCompanionAvailableOnWiFiWithAssistantId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[ADMultiUserService isCompanionAvailableOnWiFiWithAssistantId:completion:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Checking if %@ is present on WiFi",  (uint8_t *)&v12,  0x16u);
      if (v5)
      {
LABEL_4:
        id v8 = sub_10016ABE0(v5);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        BOOL v10 = v9 != 0LL;
        if (v9)
        {
          uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            int v12 = 136315138;
            uint64_t v13 = "-[ADMultiUserService isCompanionAvailableOnWiFiWithAssistantId:completion:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Companion available on WiFi",  (uint8_t *)&v12,  0xCu);
          }
        }

        goto LABEL_10;
      }
    }

    else if (v5)
    {
      goto LABEL_4;
    }

    BOOL v10 = 0LL;
LABEL_10:
    v6[2](v6, v10);
  }
}

- (void)getiCloudUserIdForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      *(_DWORD *)__int128 buf = 136315395;
      id v17 = "-[ADMultiUserService getiCloudUserIdForSharedUserId:completion:]";
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %{private}@", buf, 0x16u);
      if (!v6) {
        goto LABEL_7;
      }
    }

    else if (!v6)
    {
      goto LABEL_7;
    }

    if ((AFSupportsMultiUser(v9, v10) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002909F0;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v14 = v6;
      id v15 = v7;
      dispatch_async(queue, block);

      goto LABEL_8;
    }

- (void)getSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      *(_DWORD *)__int128 buf = 136315395;
      id v17 = "-[ADMultiUserService getSharedUserIdForHomeUserId:completion:]";
      __int16 v18 = 2113;
      id v19 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Retrieving shared user id for homeUserId = %{private}@",  buf,  0x16u);
      if (!v6) {
        goto LABEL_7;
      }
    }

    else if (!v6)
    {
      goto LABEL_7;
    }

    if ((AFSupportsMultiUser(v9, v10) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002906F8;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v14 = v6;
      id v15 = v7;
      dispatch_async(queue, block);

      goto LABEL_8;
    }

- (void)getSharedUserIdsForiTunesAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = (void (**)(void, void, void))v7;
  if (v7)
  {
    if (!AFIsATV(v7, v8))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1010LL));
LABEL_10:
      id v22 = (void *)v21;
      v9[2](v9, 0LL, v21);

      goto LABEL_11;
    }

    uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      *(_DWORD *)__int128 buf = 136315395;
      __int128 v30 = "-[ADMultiUserService getSharedUserIdsForiTunesAltDSID:completion:]";
      __int16 v31 = 2113;
      id v32 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Retrieving shared user ids for iTunesAltDSID = %{private}@",  buf,  0x16u);
      if (v6)
      {
LABEL_5:
        if ((AFSupportsMultiUser(v11, v12) & 1) != 0)
        {
          uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userProfilesSnapshot]);

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userProfiles]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);

          queue = (dispatch_queue_s *)self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10029045C;
          block[3] = &unk_1004FCBB0;
          id v24 = v17;
          id v25 = v6;
          BOOL v26 = self;
          id v27 = v13;
          unsigned int v28 = v9;
          id v19 = v13;
          id v20 = v17;
          dispatch_async(queue, block);

          goto LABEL_11;
        }
      }
    }

    else if (v6)
    {
      goto LABEL_5;
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
    goto LABEL_10;
  }

- (void)getFirstNameForSharedUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = (void (**)(void, void, void))v7;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser(v7, v8) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002902C4;
      block[3] = &unk_1004FD9E0;
      id v13 = v6;
      id v14 = self;
      id v15 = v9;
      dispatch_async(queue, block);
    }

    else
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
    }
  }
}

- (void)getConformingSharedUserIdForHomeUserId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = (void (**)(void, void, void, void))v7;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser(v7, v8) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10028FFD8;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v13 = v6;
      id v14 = v9;
      dispatch_async(queue, block);
    }

    else
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void, void *))v9)[2](v9, 0LL, 0LL, v11);
    }
  }
}

- (void)getConformingSharedUserIds:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028FB74;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getRecognizableUsersConfromingSharedUserIds:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028F6F0;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  13LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getHomeUserIdOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028F288;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getiCloudAltDSIDOfRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028EF5C;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getMultiUserSettingsForRecognizedUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028ED5C;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getCompanionAssistantIdForRecognizedUser:(id)a3
{
  id v4 = a3;
  id v6 = (void (**)(void, void, void))v4;
  if (v4)
  {
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10028EA30;
      v9[3] = &unk_1004FD990;
      void v9[4] = self;
      uint64_t v10 = v6;
      dispatch_async(queue, v9);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
    }
  }
}

- (void)getMultiUserSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = (void (**)(void, void, void))v7;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser(v7, v8) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10028E684;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v13 = v6;
      id v14 = v9;
      dispatch_async(queue, block);
    }

    else
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
    }
  }
}

- (void)getMultiUserAudioAppSignalsForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = (void (**)(void, void, void))v7;
  if (v7)
  {
    if (v6 && (AFSupportsMultiUser(v7, v8) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10028E3F8;
      block[3] = &unk_1004FD9E0;
      void block[4] = self;
      id v14 = v9;
      id v13 = v6;
      dispatch_async(queue, block);
    }

    else
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6002LL,  &__NSDictionary0__struct));
      ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
    }
  }
}

- (void)homeUserIdToNames:(id)a3
{
  id v6 = (void (**)(id, void *, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADMultiUserService homeUserIdToNames](self, "homeUserIdToNames"));
  if (v4)
  {
    v6[2](v6, v4, 0LL);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6001LL,  0LL));
    ((void (**)(id, void *, void *))v6)[2](v6, 0LL, v5);
  }
}

- (void)getPreferredMediaUserHomeUserIDWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (v4)
  {
    id v7 = v4;
    if ((AFSupportsMultiUser(v4, v5) & 1) != 0)
    {
      -[ADMultiUserService getPreferredMediaUserHomeUserIDForAccessoryUUID:completion:]( self,  "getPreferredMediaUserHomeUserIDForAccessoryUUID:completion:",  0LL,  v7);
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
      v7[2](v7, 0LL, v6);
    }

    id v4 = v7;
  }
}

- (void)getPreferredMediaUserHomeUserIDForAccessoryUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    *(_DWORD *)__int128 buf = 136315395;
    __int16 v18 = "-[ADMultiUserService getPreferredMediaUserHomeUserIDForAccessoryUUID:completion:]";
    __int16 v19 = 2113;
    id v20 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s accessoryUUID = %{private}@", buf, 0x16u);
    if (!v7) {
      goto LABEL_7;
    }
  }

  else if (!v7)
  {
    goto LABEL_7;
  }

  if ((AFSupportsMultiUser(v9, v10) & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10028DD38;
    block[3] = &unk_1004FD9E0;
    id v14 = v6;
    id v15 = self;
    id v16 = v7;
    dispatch_async(queue, block);

    uint64_t v12 = v14;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  6004LL,  &__NSDictionary0__struct));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
  }

LABEL_7:
}

- (void)getIDSIdentifierForAssistantId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v18 = "-[ADMultiUserService getIDSIdentifierForAssistantId:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
      if (!v6) {
        goto LABEL_7;
      }
    }

    else if (!v6)
    {
      goto LABEL_7;
    }

    if ((AFSupportsMultiUser(v9, v10) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10028D9D8;
      block[3] = &unk_1004FD9E0;
      id v14 = v6;
      id v15 = self;
      id v16 = v7;
      dispatch_async(queue, block);

      uint64_t v12 = v14;
LABEL_8:

      goto LABEL_9;
    }

- (id)getAssistantIdentifierForIDS:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v35 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_29;
    }
  }

  else if (!v4)
  {
    goto LABEL_29;
  }

  unint64_t primaryUser = self->_primaryUser;
  if (!primaryUser
    || (BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionIDSIdentifier](primaryUser, "companionIDSIdentifier")),
        unsigned int v10 = [v9 isEqualToString:v4],
        v9,
        !v10))
  {
    deviceOwner = self->_deviceOwner;
    if (deviceOwner)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser companionIDSIdentifier](deviceOwner, "companionIDSIdentifier"));
      unsigned int v15 = [v14 isEqualToString:v4];

      if (v15)
      {
        id v16 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v35 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Matched device owner companion",  buf,  0xCu);
        }

        uint64_t v12 = self->_deviceOwner;
        goto LABEL_14;
      }
    }

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int16 v18 = self->_sharedUsersBySharedUserID;
    id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        id v22 = 0LL;
        do
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_sharedUsersBySharedUserID,  "objectForKey:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v22),  (void)v29));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 companionIDSIdentifier]);
          unsigned int v25 = [v24 isEqualToString:v4];

          if (v25)
          {
            id v27 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 136315138;
              id v35 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
              _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s Matched secondary user companion",  buf,  0xCu);
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v23 companionAssistantID]);

            goto LABEL_30;
          }

          id v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
        if (v20) {
          continue;
        }
        break;
      }
    }

    BOOL v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v35 = "-[ADMultiUserService getAssistantIdentifierForIDS:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s Primary user not present or home user not found",  buf,  0xCu);
    }

- (id)currentOwnerSharedUserID
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_10028D180;
  unsigned int v10 = sub_10028D190;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10028D99C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getSharedUserInfoForSharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10028D870;
    block[3] = &unk_1004FD9E0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)getSharedUserInfoForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10028D484;
    block[3] = &unk_1004FD9E0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)getSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10028D358;
    v9[3] = &unk_1004F92A8;
    id v11 = v7;
    id v10 = v6;
    -[ADMultiUserService getSharedUserInfoForiCloudAltDSID:completion:]( self,  "getSharedUserInfoForiCloudAltDSID:completion:",  v10,  v9);
  }
}

- (id)confidenceScoresForMultiUserTestingExpectedSpeakerSharedUserID:(id)a3 expectedSpeakerConfidenceScore:(int64_t)a4 nonspeakerConfidenceScores:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10028D180;
  id v24 = sub_10028D190;
  unsigned int v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028D198;
  block[3] = &unk_1004F92D0;
  void block[4] = self;
  id v16 = v8;
  __int16 v18 = &v20;
  int64_t v19 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)_confidenceScoreForSharedUserID:(id)a3 expectedSpeakerSharedUserID:(id)a4 expectedSpeakerConfidenceScore:(int64_t)a5 confidenceScores:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(&OBJC_CLASS___SAUserConfidenceScore);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uppercaseString]);
  [v12 setSharedUserId:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 uppercaseString]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v14]);

  if (v15)
  {
    id v16 = [v15 integerValue];
  }

  else if ([v10 caseInsensitiveCompare:v9])
  {
    id v16 = 0LL;
  }

  else
  {
    id v16 = (id)a5;
  }

  [v12 setConfidenceScore:v16];

  return v12;
}

- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v12 = "-[ADMultiUserService homehubManager:didActivateEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10028D0EC;
  v9[3] = &unk_1004FD968;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v13 = "-[ADMultiUserService homehubManager:didDeactivateEndpointWithContext:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10028CF90;
  v9[3] = &unk_1004FD968;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v12 = "-[ADMultiUserService homehubManager:didReceiveLaunchNotificationForEndpointUUID:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s endpointUUID = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10028CF84;
  v9[3] = &unk_1004FD968;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_notifyRemoraClientsOfDeviceOwner
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v21 = "-[ADMultiUserService _notifyRemoraClientsOfDeviceOwner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  deviceOwner = self->_deviceOwner;
  if (deviceOwner)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser attributes](deviceOwner, "attributes"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeRemoraClients, "allValues", 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommunalDeviceUser dictionaryRepresentation]( self->_deviceOwner,  "dictionaryRepresentation"));
          [v13 addDeviceOwner:v14 withAttribute:v7 completion:&stru_1004F92F0];

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }

- (void)_notifyRemoraClientsOfAllUsers
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v15 = "-[ADMultiUserService _notifyRemoraClientsOfAllUsers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_primaryUser) {
    -[ADMultiUserService _notifyRemoraClientsOfUpdatedUser:](self, "_notifyRemoraClientsOfUpdatedUser:");
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sharedUsersBySharedUserID, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ADMultiUserService _notifyRemoraClientsOfUpdatedUser:]( self,  "_notifyRemoraClientsOfUpdatedUser:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_notifyRemoraClientsOfUpdatedUser:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v22 = "-[ADMultiUserService _notifyRemoraClientsOfUpdatedUser:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeRemoraClients, "allValues", 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        __int16 v13 = 0LL;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v13);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
          [v14 addCommunalDeviceUser:v15 withAttribute:v8 completion:&stru_1004F9310];

          __int16 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v11);
    }
  }
}

- (void)_notifyRemoraClientsOfDeletedUser:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v17 = "-[ADMultiUserService _notifyRemoraClientsOfDeletedUser:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeRemoraClients, "allValues", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) removeCommunalDeviceUserBySharedUserID:v4 completion:&stru_1004F9330];
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }
}

- (void)_refreshClientWithMultiUserData:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v34 = "-[ADMultiUserService _refreshClientWithMultiUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_activeRemoraClients, "objectForKey:", v4));
  if (v6)
  {
    deviceOwner = self->_deviceOwner;
    if (deviceOwner)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser attributes](deviceOwner, "attributes"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 attributes]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);

      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](self->_deviceOwner, "dictionaryRepresentation"));
      [v6 addDeviceOwner:v11 withAttribute:v10 completion:&stru_1004F9350];
    }

    id v27 = v4;
    unint64_t primaryUser = self->_primaryUser;
    if (primaryUser)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser attributes](primaryUser, "attributes"));
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 attributes]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommunalDeviceUser dictionaryRepresentation](self->_primaryUser, "dictionaryRepresentation"));
      [v6 addCommunalDeviceUser:v16 withAttribute:v15 completion:&stru_1004F9370];
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sharedUsersByHomeUserUUID, "allValues"));
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 attributes]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 attributes]);
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);

          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v22 dictionaryRepresentation]);
          [v6 addCommunalDeviceUser:v26 withAttribute:v25 completion:&stru_1004F9390];
        }

        id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v19);
    }

    id v4 = v27;
  }
}

- (void)localMeCardDidUpdate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionary]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  0LL));

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10028C9F0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_refreshClientsWithMeCard:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v17 = "-[ADMultiUserService _refreshClientsWithMeCard:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeRemoraClients, "allValues", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setLocalMeCard:v4 completion:&stru_1004F93B0];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4 meCards:(id)a5 unredactedAnchor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int128 v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADMultiUserService assistantDataManager:didUpdateAssistantData:meCards:unredactedAnchor:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }

  if (!self->_deviceOwner
    && !-[NSString isEqualToString:](self->_cachedAssistantDataUnredactedAnchor, "isEqualToString:", v13))
  {
    __int128 v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      cachedAssistantDataUnredactedAnchor = self->_cachedAssistantDataUnredactedAnchor;
      int v17 = 136315650;
      id v18 = "-[ADMultiUserService assistantDataManager:didUpdateAssistantData:meCards:unredactedAnchor:]";
      __int16 v19 = 2112;
      uint64_t v20 = cachedAssistantDataUnredactedAnchor;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Marking MultiUserInfo as dirty. Previous anchor=%@. New anchor=%@",  (uint8_t *)&v17,  0x20u);
    }

    self->_isMultiUserInfoDirty = 1;
    objc_storeStrong((id *)&self->_cachedAssistantDataUnredactedAnchor, a6);
  }
}

- (void)addDeviceOwner:(id)a3 withAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    *(_DWORD *)__int128 buf = 136315651;
    id v23 = "-[ADMultiUserService addDeviceOwner:withAttribute:completion:]";
    __int16 v24 = 2113;
    unsigned int v25 = v13;
    __int16 v26 = 2113;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Adding device owner:\n%{private}@ attribute:%{private}@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10028C7F0;
  v18[3] = &unk_1004FDA30;
  void v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  dispatch_async(queue, v18);
}

- (void)addCommunalDeviceUser:(id)a3 withAttribute:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    *(_DWORD *)__int128 buf = 136315651;
    __int16 v24 = "-[ADMultiUserService addCommunalDeviceUser:withAttribute:completion:]";
    __int16 v25 = 2113;
    __int16 v26 = v13;
    __int16 v27 = 2113;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Adding user:\n%{private}@ attribute:%{private}@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10028C0F4;
  v18[3] = &unk_1004FDA30;
  id v19 = v9;
  id v20 = v8;
  id v21 = self;
  id v22 = v10;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(queue, v18);
}

- (void)removeCommunalDeviceUserBySharedUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    id v16 = "-[ADMultiUserService removeCommunalDeviceUserBySharedUserID:completion:]";
    __int16 v17 = 2113;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Removing user:\n%{private}@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028C06C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)setLocalMeCard:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADMultiUserService setLocalMeCard:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Received MeCard", (uint8_t *)&v9, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocalMeCardStore sharedStore](&OBJC_CLASS___ADLocalMeCardStore, "sharedStore"));
  [v8 storeMeCard:v5];

  if (v6) {
    v6[2](v6, 0LL);
  }
}

- (void)accessoryLanguageSettingsChanged:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v18 = "-[ADMultiUserService accessoryLanguageSettingsChanged:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"accessoryUniqueIdentifier"]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"siriInputLanguage"]);

  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v18 = "-[ADMultiUserService accessoryLanguageSettingsChanged:]";
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s endpointUUID = %@, inputSiriLanguage = %@",  buf,  0x20u);
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSUUID);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10028C05C;
      block[3] = &unk_1004FD4C0;
      void block[4] = self;
      id v15 = v9;
      id v16 = v7;
      dispatch_async(queue, block);
    }
  }
}

- (void)_languageCodeDidChange:(id)a3 forEndpointUUID:(id)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 UUIDString]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoriesLanguages]);
    id v10 = [v9 mutableCopy];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
    uint64_t v12 = v11;
    if (v11 && [v11 isEqualToString:v6])
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        __int16 v17 = "-[ADMultiUserService _languageCodeDidChange:forEndpointUUID:]";
        __int16 v18 = 2112;
        __int16 v19 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s languageCode for %@ did not change",  (uint8_t *)&v16,  0x16u);
      }
    }

    else
    {
      [v10 setObject:v6 forKey:v7];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      [v14 setAccessoriesLangauges:v10];

      id v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        __int16 v17 = "-[ADMultiUserService _languageCodeDidChange:forEndpointUUID:]";
        __int16 v18 = 2112;
        __int16 v19 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s languageCode for %@ changed",  (uint8_t *)&v16,  0x16u);
      }

      if (-[ADMultiUserService _isHostingMultiUserLanguage](self, "_isHostingMultiUserLanguage"))
      {
        -[ADMultiUserService _refreshUsersAndVoiceProfiles:](self, "_refreshUsersAndVoiceProfiles:", 1LL);
        -[ADMultiUserService refreshHomeKitOnboardedUsers](self, "refreshHomeKitOnboardedUsers");
      }

      else
      {
        -[ADMultiUserService resetAllUsers](self, "resetAllUsers");
      }
    }
  }
}

- (NSMutableDictionary)sharedUsersBySharedUserID
{
  return self->_sharedUsersBySharedUserID;
}

- (void)setSharedUsersBySharedUserID:(id)a3
{
}

- (ADCommunalDeviceUser)primaryUser
{
  return self->_primaryUser;
}

- (ADCommunalDeviceUser)deviceOwner
{
  return self->_deviceOwner;
}

- (void)setDeviceOwner:(id)a3
{
}

- (BOOL)isMultiUserInfoDirty
{
  return self->_isMultiUserInfoDirty;
}

- (void)setIsMultiUserInfoDirty:(BOOL)a3
{
  self->_isMultiUserInfoDirty = a3;
}

- (NSString)cachedAssistantDataUnredactedAnchor
{
  return self->_cachedAssistantDataUnredactedAnchor;
}

- (void)setCachedAssistantDataUnredactedAnchor:(id)a3
{
}

- (NSDictionary)rawScores
{
  return self->_rawScores;
}

- (void)setRawScores:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)usersWithAvailableVoiceProfiles
{
  return self->_usersWithAvailableVoiceProfiles;
}

- (void)setUsersWithAvailableVoiceProfiles:(id)a3
{
}

- (NSMutableDictionary)sharedUsersByHomeUserUUID
{
  return self->_sharedUsersByHomeUserUUID;
}

- (void)setSharedUsersByHomeUserUUID:(id)a3
{
}

- (NSMutableDictionary)sharedUsersByiCloudAltDSID
{
  return self->_sharedUsersByiCloudAltDSID;
}

- (void)setSharedUsersByiCloudAltDSID:(id)a3
{
}

- (NSMutableDictionary)homeUserSettings
{
  return self->_homeUserSettings;
}

- (void)setHomeUserSettings:(id)a3
{
}

- (ADHomeInfoManager)homeInfoManager
{
  return self->_homeInfoManager;
}

- (void)setHomeInfoManager:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (AFSupportsMultiUser(a1, a2))
  {
    if (qword_100578318 != -1) {
      dispatch_once(&qword_100578318, &stru_1004F8DE0);
    }
    id v2 = (id)qword_100578310;
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

@end