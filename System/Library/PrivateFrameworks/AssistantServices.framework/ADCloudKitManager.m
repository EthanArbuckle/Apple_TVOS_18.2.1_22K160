@interface ADCloudKitManager
+ (id)getApplicationIdentifierFromEntitlements;
+ (id)sharedManager;
+ (void)_setAppleAccountSiriStateEnabled:(BOOL)a3 withCompletion:(id)a4;
- (ADCloudKitManager)init;
- (ADCloudKitManager)initWithInstanceContext:(id)a3;
- (ADCloudKitMirroredContainer)mirroredContainer;
- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)voiceTriggerRecordZoneInfo;
- (APSConnection)pushConnection;
- (BOOL)_forceVoiceProfileDownloadForiCloudAltDSID:(id)a3 retryCount:(int64_t)a4 completion:(id)a5;
- (BOOL)_isCloudSyncEnabledForZone:(id)a3;
- (BOOL)_isCloudSyncEnabledForZone:(id)a3 accountInfo:(id)a4;
- (BOOL)_zoneIsShareable:(id)a3;
- (BOOL)_zoneShouldUpdateMirroredZone;
- (BOOL)cloudSyncEnabled;
- (BOOL)isPastBuddy;
- (BOOL)preferencesHaveBeenSynchronized;
- (BOOL)voiceTriggerEnabled;
- (CKAccountInfo)primaryAccountInfo;
- (CKContainer)primaryContainer;
- (CKNotificationListener)listener;
- (NSMutableDictionary)ckAcctInfoDict;
- (NSMutableDictionary)containerDict;
- (NSMutableDictionary)recordZoneInfoDict;
- (NSString)applicationIdentifier;
- (NSString)userID;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)voiceTriggerSyncTimer;
- (id)_createFileAssetRecordWithDictionary:(id)a3 zone:(id)a4 version:(unint64_t)a5;
- (id)_createKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4;
- (id)_createRecordsWithDictionary:(id)a3 forZoneInfo:(id)a4;
- (id)_manateeRecordZoneInfoForName:(id)a3;
- (id)_trackedCKAccountInfoForiCloudAltDSID:(id)a3;
- (id)_trackedCKContainerForiCloudAltDSID:(id)a3;
- (id)_verifyAccountWithManateeRequired:(BOOL)a3;
- (id)containerIDs;
- (id)getContainerIDForThisDevice;
- (unsigned)preferencesDidChangeNotificationIgnoreCount;
- (unsigned)sharedUserIdentifierNotificationIgnoreCount;
- (void)_acceptSharesForMetadatas:(id)a3;
- (void)_buddyStateDidChangeNotification:(id)a3;
- (void)_cancelVoiceTriggerSyncTimer;
- (void)_cleanUpRecordZoneSubscriptionsTimers;
- (void)_cleanUpRecordZonesAndSubscriptions;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_createRecordZoneSubscriptionWithZoneID:(id)a3 name:(id)a4 recordTypes:(id)a5 container:(id)a6 completion:(id)a7;
- (void)_createRecordZoneWithID:(id)a3 shared:(BOOL)a4 onMirror:(BOOL)a5 completion:(id)a6;
- (void)_deleteRecordZoneWithZoneID:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithZoneID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_deleteRecordZoneWithZoneInfo:(id)a3 completion:(id)a4;
- (void)_deleteRecordZoneWithZoneInfo:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_deleteUserData;
- (void)_devicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)_disablePush;
- (void)_enablePush;
- (void)_executeZoneFetchCompletionBlock:(id)a3 zoneInfo:(id)a4 completion:(id)a5;
- (void)_fetchChangesFromZone:(id)a3 serverChangeToken:(id)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9;
- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8;
- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 activity:(id)a5 mirror:(BOOL)a6;
- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 mirror:(BOOL)a5;
- (void)_fetchCurrentUserIDWithCompletion:(id)a3;
- (void)_fetchManifest:(id)a3 language:(id)a4 completion:(id)a5;
- (void)_fetchManifest:(id)a3 legacy:(BOOL)a4 language:(id)a5 completion:(id)a6;
- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7;
- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 iCloudAltDSID:(id)a7 completion:(id)a8;
- (void)_forceVoiceProfileDownloadOfAllUsers:(int64_t)a3;
- (void)_handleATVUserProfilesAdded:(id)a3;
- (void)_handleATVUserProfilesRemoved:(id)a3;
- (void)_handleAccountStatusChange:(id)a3;
- (void)_handleCloudKitNotification:(id)a3;
- (void)_handleSubscriptionNotification:(id)a3 container:(id)a4;
- (void)_handleUserProfilesChanged;
- (void)_homeInfoDidChange:(id)a3;
- (void)_initializeZones;
- (void)_languageCodeDidChange;
- (void)_multiUserVoiceIdentificationDidChange:(id)a3;
- (void)_outputLanguageDidChange;
- (void)_preferencesDidChange;
- (void)_prepareZoneForResetWithZoneInfo:(id)a3;
- (void)_resetZoneFetchCompletionBlock:(id)a3;
- (void)_resetZoneWithZoneInfo:(id)a3;
- (void)_saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)_scheduleMirrorSynchronizationAfterDelay:(id)a3;
- (void)_setDefaultiCloudEnabledState;
- (void)_setUpMirroredZoneWithZoneInfo:(id)a3;
- (void)_setUpZoneWithZoneInfo:(id)a3;
- (void)_setupAccount;
- (void)_setupAccountState;
- (void)_setupAccountStatusRecordZone;
- (void)_setupKeyValueRecordZone;
- (void)_setupMultiUserSharedRecordZone;
- (void)_setupMultiUserSharedRecordZoneIfHomeIsReady;
- (void)_setupPrimaryContainer;
- (void)_setupRecordZoneSubscriptionWithZoneInfo:(id)a3 retryInterval:(double)a4 container:(id)a5;
- (void)_setupRecordZoneWithZoneInfo:(id)a3 retryInterval:(double)a4 completion:(id)a5;
- (void)_setupSecondaryAccounts;
- (void)_setupSharedZoneUpdaterForOwner;
- (void)_setupSharedZoneView;
- (void)_setupVoiceTriggerSyncTimer;
- (void)_setupZoneSubscriptionsForSecondaryAccount:(id)a3 zoneInfo:(id)a4;
- (void)_setupZonesForSecondaryAccount:(id)a3 container:(id)a4 acctInfo:(id)a5;
- (void)_sharedUserIdentifierDidChange:(id)a3;
- (void)_startVoiceTriggerSyncTimerWithInterval:(double)a3;
- (void)_synchronizeMirroredContainer:(id)a3;
- (void)_synchronizeVoiceTriggerData;
- (void)_trackCKContainer:(id)a3 accountInfo:(id)a4 foriCloudAltDSID:(id)a5;
- (void)_triggerMultiUserSharingPostBuddyOrCloudSyncChange;
- (void)_triggerVoiceProfileUploadPostBuddyOrCloudSyncChange;
- (void)_untrackiCloudAltDSID:(id)a3;
- (void)_voiceProfileFullDownloadTriggered:(id)a3;
- (void)_voiceTriggerEnabledDidChange;
- (void)_voiceTriggerPHSProfileDidChange;
- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5;
- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5 retryCount:(unint64_t)a6 object:(id)a7;
- (void)adCloudKitSharedZoneUpdater:(id)a3 didEncounterError:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)continueShareAcceptanceOperations;
- (void)dealloc;
- (void)deleteRecordFromSharedStore:(id)a3 completion:(id)a4;
- (void)deleteShareForUser:(id)a3 completion:(id)a4;
- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3;
- (void)disablePushNotifications;
- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)enablePushNotifications;
- (void)fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4;
- (void)fetchSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 completion:(id)a5;
- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 withQOS:(int64_t)a5 completion:(id)a6;
- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 completion:(id)a6;
- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 iCloudAltDSID:(id)a6 completion:(id)a7;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5;
- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3;
- (void)handleCloudKitError:(id)a3 forZone:(id)a4 mirror:(BOOL)a5 operationType:(int64_t)a6;
- (void)handleSharedDBCloudKitError:(id)a3 operationType:(int64_t)a4;
- (void)handleSharingError:(id)a3;
- (void)hasEverSetLanguageCodeWithCompletion:(id)a3;
- (void)hasVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4;
- (void)ignoreNextNotification:(id)a3;
- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 onShare:(id)a4 onContainer:(id)a5 completion:(id)a6;
- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 participants:(id)a4 completion:(id)a5;
- (void)retryShareDeletionOperation;
- (void)saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 completion:(id)a5;
- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 activity:(id)a6 completion:(id)a7;
- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 completion:(id)a6;
- (void)saveKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 completion:(id)a5;
- (void)saveParticipantsOnShare:(id)a3 forOwner:(id)a4 participants:(id)a5;
- (void)saveRecordsWithDictionary:(id)a3 inZone:(id)a4 completion:(id)a5;
- (void)setAccountStatusRecordZoneInfo:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCkAcctInfoDict:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setContainerDict:(id)a3;
- (void)setIsPastBuddy:(BOOL)a3;
- (void)setKeyValueRecordZoneInfo:(id)a3;
- (void)setListener:(id)a3;
- (void)setMirroredContainer:(id)a3;
- (void)setMultiUserRecordZoneInfo:(id)a3;
- (void)setPreferencesDidChangeNotificationIgnoreCount:(unsigned int)a3;
- (void)setPrimaryAccountInfo:(id)a3;
- (void)setPrimaryContainer:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setRecordZoneInfoDict:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSharedUserIdentifierNotificationIgnoreCount:(unsigned int)a3;
- (void)setUserID:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerRecordZoneInfo:(id)a3;
- (void)setVoiceTriggerSyncTimer:(id)a3;
- (void)setupContainerForiCloudAltDSID:(id)a3;
- (void)setupSharedZoneUpdaterForOwner;
- (void)setupZonesForSecondaryAccount:(id)a3;
- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 homes:(id)a5 completion:(id)a6;
- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 retryCount:(unint64_t)a5 homes:(id)a6 completion:(id)a7;
- (void)syncSiriRMVSetting:(BOOL)a3 iCloudAltDSID:(id)a4 homeUniqueIdentifier:(id)a5 completion:(id)a6;
- (void)synchronize;
- (void)triggerVoiceProfileUploadWithCompletion:(id)a3;
@end

@implementation ADCloudKitManager

- (ADCloudKitManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  v4 = -[ADCloudKitManager initWithInstanceContext:](self, "initWithInstanceContext:", v3);

  return v4;
}

- (ADCloudKitManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___ADCloudKitManager;
  v5 = -[ADCloudKitManager init](&v63, "init");
  if (v5)
  {
    v5->_usingNonManateeIdentity = _AFPreferencesGetNonManateeIdentity();
    uint64_t v6 = _AFPreferencesCloudUserID();
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    userID = v5->_userID;
    v5->_userID = (NSString *)v7;

    id v58 = v4;
    if (v4) {
      v9 = (AFInstanceContext *)v4;
    }
    else {
      v9 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.backedup",  @"subscription",  @"AssistantKeyValueRecord"));
    v12 = (void *)qword_100577B78;
    qword_100577B78 = v11;

    v13 = objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo);
    v14 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionName:]( v13,  "initWithZoneName:subscriptionName:",  @"com.apple.assistant.backedup",  qword_100577B78);
    keyValueRecordZoneInfo = v5->_keyValueRecordZoneInfo;
    v5->_keyValueRecordZoneInfo = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.account.status",  @"subscription",  @"AssistantKeyValueRecord"));
    v17 = (void *)qword_100577B80;
    qword_100577B80 = v16;

    v18 = objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo);
    v19 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionName:]( v18,  "initWithZoneName:subscriptionName:",  @"com.apple.assistant.account.status",  qword_100577B80);
    accountStatusRecordZoneInfo = v5->_accountStatusRecordZoneInfo;
    v5->_accountStatusRecordZoneInfo = v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantVoiceTriggerFileAssetRecord"));
    v22 = (void *)qword_100577B88;
    qword_100577B88 = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.assistant.multiuser.shared",  @"subscription",  @"AssistantKeyValueRecord"));
    v24 = (void *)qword_100577B90;
    qword_100577B90 = v23;

    v25 = objc_alloc(&OBJC_CLASS___ADCloudKitRecordZoneInfo);
    v69[0] = qword_100577B88;
    v69[1] = qword_100577B90;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
    v27 = -[ADCloudKitRecordZoneInfo initWithZoneName:subscriptionNames:]( v25,  "initWithZoneName:subscriptionNames:",  @"com.apple.assistant.multiuser.shared",  v26);
    multiUserRecordZoneInfo = v5->_multiUserRecordZoneInfo;
    v5->_multiUserRecordZoneInfo = v27;

    v66 = v5->_keyValueRecordZoneInfo;
    v67[0] = @"com.apple.assistant.backedup";
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
    v68[0] = v29;
    v67[1] = @"com.apple.assistant.account.status";
    v65 = v5->_accountStatusRecordZoneInfo;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
    v68[1] = v30;
    v67[2] = @"com.apple.assistant.multiuser.shared";
    v64 = v5->_multiUserRecordZoneInfo;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    v68[2] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  3LL));

    v33 = (NSMutableDictionary *)[v32 mutableCopy];
    recordZoneInfoDict = v5->_recordZoneInfoDict;
    v5->_recordZoneInfoDict = v33;

    id v35 = [(id)objc_opt_class(v5) getApplicationIdentifierFromEntitlements];
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v36;

    dispatch_queue_attr_t v38 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v39 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v38);
    dispatch_queue_attr_t v40 = dispatch_queue_attr_make_with_qos_class(v39, QOS_CLASS_USER_INITIATED, 0);
    v41 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v40);

    dispatch_queue_t v42 = dispatch_queue_create("ADCloudKitManager.Serial", v41);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager getContainerIDForThisDevice](v5, "getContainerIDForThisDevice"));
    v45 = sub_1002FE578(v44, 0LL);
    uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
    primaryContainer = v5->_primaryContainer;
    v5->_primaryContainer = (CKContainer *)v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1000A1B44;
    v61[3] = &unk_1004EF628;
    v49 = v5;
    v62 = v49;
    objc_msgSend(v48, "aa_primaryAppleAccountWithCompletion:", v61);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v50 addObserver:v49 selector:"_cloudKitAccountStatusChanged:" name:CKAccountChangedNotification object:0];
    [v50 addObserver:v49 selector:"_cloudKitAccountStatusChanged:" name:CKIdentityUpdateNotification object:0];
    [v50 addObserver:v49 selector:"_buddyStateDidChangeNotification:" name:@"ADBuddyStateDidChangeNotification" object:0];
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v50 addObserver:v49 selector:"_sharedUserIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:v51];
    [v50 addObserver:v49 selector:"_multiUserVoiceIdentificationDidChange:" name:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:v51];
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v52 addObserver:v49 selector:"_handleATVUserProfilesAdded:" name:@"ADUserProfilesAddedNotification" object:0];

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v53 addObserver:v49 selector:"_handleATVUserProfilesRemoved:" name:@"ADUserProfilesRemovedNotification" object:0];

    [v50 addObserver:v49 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v54 addObserver:v49 selector:"_voiceProfileFullDownloadTriggered:" name:kSSRTriggerPHSProfileDownload object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1CB4,  kAFPreferencesDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1D64,  AFLanguageCodeDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1E14,  AFOutputLanguageDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1EC4,  kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1EC4,  kVTPreferencesRemoraVoiceTriggerEnabledDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v49,  (CFNotificationCallback)sub_1000A1ECC,  @"com.apple.voicetrigger.PHSProfileModified",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v56 = (dispatch_queue_s *)v5->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A1ED4;
    block[3] = &unk_1004FD940;
    v60 = v49;
    dispatch_async(v56, block);

    id v4 = v58;
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];
  [v3 removeObserver:self name:CKIdentityUpdateNotification object:0];
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADMultiUserVoiceIdentificationDidChangeNotification" object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AFLanguageCodeDidChangeDarwinNotification, 0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, AFOutputLanguageDidChangeDarwinNotification, 0LL);
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification,  0LL);
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  kVTPreferencesRemoraVoiceTriggerEnabledDidChangeDarwinNotification,  0LL);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.voicetrigger.PHSProfileModified", 0LL);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADCloudKitManager;
  -[ADCloudKitManager dealloc](&v5, "dealloc");
}

- (void)_setDefaultiCloudEnabledState
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADCloudKitManager _setDefaultiCloudEnabledState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = _AFBackedUpPreferencesBoolValueForKey(kAFCloudSyncEnabledKey);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (!v5) {
    [(id)objc_opt_class(self) _setAppleAccountSiriStateEnabled:1 withCompletion:&stru_1004EF648];
  }
}

- (BOOL)_zoneIsShareable:(id)a3
{
  return [a3 isEqualToString:@"com.apple.assistant.multiuser.shared"];
}

- (BOOL)_zoneShouldUpdateMirroredZone
{
  return 0;
}

- (void)enablePushNotifications
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1A2C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)disablePushNotifications
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1A24;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_enablePush
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:self->_applicationIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager pushConnection](self, "pushConnection"));
  int v6 = v3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v4 _setEnabledTopics:v5];
}

- (void)_disablePush
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager pushConnection](self, "pushConnection"));
  [v3 _setEnabledTopics:0];
}

- (APSConnection)pushConnection
{
  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___APSConnection);
    objc_super v5 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v4,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentProduction,  @"com.apple.assistantd.aps",  self->_serialQueue);
    int v6 = self->_pushConnection;
    self->_pushConnection = v5;

    -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        v10 = "-[ADCloudKitManager pushConnection]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Failed to create push connection",  (uint8_t *)&v9,  0xCu);
        return self->_pushConnection;
      }

      pushConnection = 0LL;
    }
  }

  return pushConnection;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[ADCloudKitManager connection:didReceivePublicToken:]";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received public token (%@) on connection %@",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136316162;
    v15 = "-[ADCloudKitManager connection:didReceiveToken:forTopic:identifier:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Received per-topic push token (%@) for topic (%@) identifier (%@) on connection (%@)",  (uint8_t *)&v14,  0x34u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    int v16 = 136315650;
    id v17 = "-[ADCloudKitManager connection:didReceiveIncomingMessage:]";
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s APS message received for topic (%@) on connection (%@)",  (uint8_t *)&v16,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:self->_applicationIdentifier]);
  unsigned int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v8));
    -[ADCloudKitManager _handleCloudKitNotification:](self, "_handleCloudKitNotification:", v15);
  }
}

- (void)_handleCloudKitNotification:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 containerIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager getContainerIDForThisDevice](self, "getContainerIDForThisDevice"));
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___CKRecordZoneNotification);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v8);
    if ((isKindOfClass & 1) != 0)
    {
      id v11 = v4;
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315394;
        v24 = "-[ADCloudKitManager _handleCloudKitNotification:]";
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Received record zone notification: (%@)",  (uint8_t *)&v23,  0x16u);
      }

      if ([v11 databaseScope] == (id)2)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 recordZoneID]);
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_recordZoneInfoDict, "objectForKey:", v14));
          int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

          if (v16)
          {
            -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:",  v16,  0LL);
          }

          else
          {
            __int16 v22 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v23 = 136315394;
              v24 = "-[ADCloudKitManager _handleCloudKitNotification:]";
              __int16 v25 = 2112;
              id v26 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Unrecognized record zone notification zone name: (%@)",  (uint8_t *)&v23,  0x16u);
            }
          }
        }

        else
        {
          id v21 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            int v23 = 136315138;
            v24 = "-[ADCloudKitManager _handleCloudKitNotification:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Record zone notification contains no zone name",  (uint8_t *)&v23,  0xCu);
          }
        }
      }

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADCloudKitManager _cloudKitAccountStatusChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A19E8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_buddyStateDidChangeNotification:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADCloudKitManager _buddyStateDidChangeNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A194C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_languageCodeDidChange
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v7 = "-[ADCloudKitManager _languageCodeDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1914;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_outputLanguageDidChange
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v7 = "-[ADCloudKitManager _outputLanguageDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A18DC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_sharedUserIdentifierDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADCloudKitManager _sharedUserIdentifierDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1888;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_multiUserVoiceIdentificationDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[ADCloudKitManager _multiUserVoiceIdentificationDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1850;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_preferencesDidChange
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v7 = "-[ADCloudKitManager _preferencesDidChange]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1648;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)ignoreNextNotification:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A15E4;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_setupAccount
{
  primaryContainer = self->_primaryContainer;
  if (!primaryContainer)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager getContainerIDForThisDevice](self, "getContainerIDForThisDevice"));
    id v5 = sub_1002FE578(v4, 0LL);
    id v6 = (CKContainer *)objc_claimAutoreleasedReturnValue(v5);
    unsigned __int8 v7 = self->_primaryContainer;
    self->_primaryContainer = v6;

    if (self->_primaryAccountiCloudAltDSID)
    {
      -[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:]( self,  "_trackCKContainer:accountInfo:foriCloudAltDSID:",  self->_primaryContainer,  self->_primaryAccountInfo);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000A12F0;
      v10[3] = &unk_1004EF628;
      v10[4] = self;
      objc_msgSend(v8, "aa_primaryAppleAccountWithCompletion:", v10);
    }

    primaryContainer = self->_primaryContainer;
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A145C;
  v9[3] = &unk_1004EF698;
  v9[4] = self;
  -[CKContainer accountInfoWithCompletionHandler:](primaryContainer, "accountInfoWithCompletionHandler:", v9);
}

- (void)_handleAccountStatusChange:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!-[CKAccountInfo isEqual:](self->_primaryAccountInfo, "isEqual:", v5)
    || self->_keyChainSyncIncompleteErrorEncountered)
  {
    id v6 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v7 = v6;
      uint64_t v8 = CKStringFromAccountStatus([v5 accountStatus]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      unsigned int v10 = [v5 supportsDeviceToDeviceEncryption];
      id v11 = @"Disabled";
      BOOL usingNonManateeIdentity = self->_usingNonManateeIdentity;
      if (v10) {
        id v11 = @"Enabled";
      }
      *(_DWORD *)buf = 136315906;
      id v19 = "-[ADCloudKitManager _handleAccountStatusChange:]";
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      int v23 = v11;
      if (usingNonManateeIdentity) {
        id v13 = @"Yes";
      }
      else {
        id v13 = @"No";
      }
      __int16 v24 = 2112;
      __int16 v25 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s CloudKit account status: (%@) encryption is: %@  nonManatee: (%@)",  buf,  0x2Au);
    }

    objc_storeStrong((id *)&self->_primaryAccountInfo, a3);
    if (AFIsATV(v14, v15)) {
      -[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:]( self,  "_trackCKContainer:accountInfo:foriCloudAltDSID:",  self->_primaryContainer,  self->_primaryAccountInfo,  self->_primaryAccountiCloudAltDSID);
    }
    if ([v5 accountStatus] == (id)1)
    {
      int v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v19 = "-[ADCloudKitManager _handleAccountStatusChange:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s CloudKit account is available, ensuring default enable state is on.",  buf,  0xCu);
      }

      -[ADCloudKitManager _setDefaultiCloudEnabledState](self, "_setDefaultiCloudEnabledState");
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000A10B4;
      v17[3] = &unk_1004EF6C0;
      v17[4] = self;
      -[ADCloudKitManager _fetchCurrentUserIDWithCompletion:](self, "_fetchCurrentUserIDWithCompletion:", v17);
    }

    else
    {
      -[ADCloudKitManager _setupAccountState](self, "_setupAccountState");
    }
  }
}

- (void)_setupPrimaryContainer
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[ADCloudKitManager _setupPrimaryContainer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[ADCloudKitManager _cleanUpRecordZoneSubscriptionsTimers](self, "_cleanUpRecordZoneSubscriptionsTimers");
  -[ADCloudKitManager _setupAccountStatusRecordZone](self, "_setupAccountStatusRecordZone");
  id v4 = -[ADCloudKitManager _setupKeyValueRecordZone](self, "_setupKeyValueRecordZone");
  if (AFSupportsMultiUser(v4, v5))
  {
    -[ADCloudKitManager _setupMultiUserSharedRecordZoneIfHomeIsReady]( self,  "_setupMultiUserSharedRecordZoneIfHomeIsReady");
  }

  else
  {
    self->_multiUserSharedZoneReady = 1;
    -[ADCloudKitManager _setupMultiUserSharedRecordZone](self, "_setupMultiUserSharedRecordZone");
  }

- (void)_setupAccountState
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v10 = "-[ADCloudKitManager _setupAccountState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = -[CKAccountInfo accountStatus](self->_primaryAccountInfo, "accountStatus");
  if (v4 == (id)3)
  {
    userID = self->_userID;
    self->_userID = 0LL;

    uint64_t v7 = _AFPreferencesSetCloudUserID(0LL);
    AFBackedUpPreferencesSynchronize(v7);
    -[ADCloudKitManager _deleteUserData](self, "_deleteUserData");
LABEL_11:
    -[ADCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
    return;
  }

  if (v4 != (id)1
    || (-[CKAccountInfo supportsDeviceToDeviceEncryption]( self->_primaryAccountInfo,  "supportsDeviceToDeviceEncryption") & 1) == 0 && !self->_usingNonManateeIdentity)
  {
    goto LABEL_11;
  }

  if (AFIsMultiUserCompanion() && (mirroredContainer = self->_mirroredContainer) != 0LL)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000A10AC;
    v8[3] = &unk_1004FBD90;
    v8[4] = self;
    -[ADCloudKitMirroredContainer createMirroredZonesWithCompletion:]( mirroredContainer,  "createMirroredZonesWithCompletion:",  v8);
  }

  else
  {
    -[ADCloudKitManager _setupPrimaryContainer](self, "_setupPrimaryContainer");
  }

- (void)_deleteUserData
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[ADCloudKitManager _deleteUserData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_recordZoneInfoDict, "allValues"));
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
              int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 dataStore]);

              if (v16)
              {
                id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 dataStore]);
                [v17 deleteUserData:0];
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v12);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v6);
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v18 setPhsAssetManifest:0 onSharedZone:1];
  [v18 setPhsAssetManifest:0 onSharedZone:0];
  [v18 synchronize];
}

- (void)_handleUserProfilesChanged
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A0C10;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_trackCKContainer:(id)a3 accountInfo:(id)a4 foriCloudAltDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_ckAcctInfoDict)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ckAcctInfoDict = self->_ckAcctInfoDict;
    self->_ckAcctInfoDict = v11;
  }

  if (!self->_containerDict)
  {
    uint64_t v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    containerDict = self->_containerDict;
    self->_containerDict = v13;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
  if (v10)
  {
    if (v8) {
      -[NSMutableDictionary setValue:forKey:](self->_containerDict, "setValue:forKey:", v8, v15);
    }
    if (v9) {
      -[NSMutableDictionary setValue:forKey:](self->_ckAcctInfoDict, "setValue:forKey:", v9, v15);
    }
  }

  else
  {
    int v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      __int16 v18 = "-[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Invalid iCloudAltDSID",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (id)_trackedCKContainerForiCloudAltDSID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_containerDict, "objectForKey:", v4));
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s no trackingKey found",  (uint8_t *)&v8,  0xCu);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (id)_trackedCKAccountInfoForiCloudAltDSID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_ckAcctInfoDict, "objectForKey:", v4));
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[ADCloudKitManager _trackedCKAccountInfoForiCloudAltDSID:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s no trackingKey found",  (uint8_t *)&v8,  0xCu);
    }

    id v5 = 0LL;
  }

  return v5;
}

- (void)_untrackiCloudAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_containerDict, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_ckAcctInfoDict, "removeObjectForKey:", v5);
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      primaryAccountiCloudAltDSID = self->_primaryAccountiCloudAltDSID;
      int v12 = 136315394;
      uint64_t v13 = "-[ADCloudKitManager _untrackiCloudAltDSID:]";
      __int16 v14 = 2112;
      uint64_t v15 = primaryAccountiCloudAltDSID;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Resetting primary iCloud Info %@",  (uint8_t *)&v12,  0x16u);
    }

    if (-[NSString isEqualToString:](self->_primaryAccountiCloudAltDSID, "isEqualToString:", v4))
    {
      int v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        uint64_t v13 = "-[ADCloudKitManager _untrackiCloudAltDSID:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Resetting primary iCloud Info",  (uint8_t *)&v12,  0xCu);
      }

      id v9 = self->_primaryAccountiCloudAltDSID;
      self->_primaryAccountiCloudAltDSID = 0LL;

      primaryAccountInfo = self->_primaryAccountInfo;
      self->_primaryAccountInfo = 0LL;

      primaryContainer = self->_primaryContainer;
      self->_primaryContainer = 0LL;

      -[ADCloudKitManager _cleanUpRecordZonesAndSubscriptions](self, "_cleanUpRecordZonesAndSubscriptions");
    }
  }
}

- (void)_handleATVUserProfilesAdded:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v16 = "-[ADCloudKitManager _handleATVUserProfilesAdded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    int v8 = v6;
  }
  else {
    int v8 = 0LL;
  }
  id v9 = v8;
  id v10 = v9;
  if (v9)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A09C8;
    v13[3] = &unk_1004FD968;
    v13[4] = self;
    id v14 = v9;
    dispatch_async(serialQueue, v13);
  }

  else
  {
    int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[ADCloudKitManager _handleATVUserProfilesAdded:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Invalid notification data", buf, 0xCu);
    }
  }
}

- (void)_handleATVUserProfilesRemoved:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v16 = "-[ADCloudKitManager _handleATVUserProfilesRemoved:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    int v8 = v6;
  }
  else {
    int v8 = 0LL;
  }
  id v9 = v8;
  id v10 = v9;
  if (v9)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000A07D0;
    v13[3] = &unk_1004FD968;
    v13[4] = self;
    id v14 = v9;
    dispatch_async(serialQueue, v13);
  }

  else
  {
    int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[ADCloudKitManager _handleATVUserProfilesRemoved:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Invalid notification data", buf, 0xCu);
    }
  }
}

- (void)setupContainerForiCloudAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v6)
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "-[ADCloudKitManager setupContainerForiCloudAltDSID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (AFIsATV(v6, v7))
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000A03E4;
    v9[3] = &unk_1004FD968;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(serialQueue, v9);
  }
}

- (void)_setupSecondaryAccounts
{
  if (AFIsATV(self, a2))
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      containerDict = self->_containerDict;
      *(_DWORD *)buf = 136315395;
      int v8 = "-[ADCloudKitManager _setupSecondaryAccounts]";
      __int16 v9 = 2113;
      id v10 = containerDict;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Tracking containers %{private}@", buf, 0x16u);
    }

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A0198;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(serialQueue, block);
  }

- (void)setupZonesForSecondaryAccount:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:](self, "_trackedCKContainerForiCloudAltDSID:", v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitManager _trackedCKAccountInfoForiCloudAltDSID:]( self,  "_trackedCKAccountInfoForiCloudAltDSID:",  v4));
  -[ADCloudKitManager _setupZonesForSecondaryAccount:container:acctInfo:]( self,  "_setupZonesForSecondaryAccount:container:acctInfo:",  v4,  v6,  v5);
}

- (void)_setupZonesForSecondaryAccount:(id)a3 container:(id)a4 acctInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v19 = "-[ADCloudKitManager _setupZonesForSecondaryAccount:container:acctInfo:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v9) {
      goto LABEL_6;
    }
  }

  else if (!v9)
  {
    goto LABEL_6;
  }

  int v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v19 = "-[ADCloudKitManager _setupZonesForSecondaryAccount:container:acctInfo:]";
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Setting up zones for container %@",  buf,  0x16u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009FC48;
  v14[3] = &unk_1004FD470;
  v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(serialQueue, v14);

LABEL_6:
}

- (void)_setupZoneSubscriptionsForSecondaryAccount:(id)a3 zoneInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subscriptionList]);
  if ([v8 count])
  {
    unsigned __int8 v9 = [v7 hasSetUpRecordZoneSubscription];

    if ((v9 & 1) != 0) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    *(_DWORD *)buf = 136315650;
    v30 = "-[ADCloudKitManager _setupZoneSubscriptionsForSecondaryAccount:zoneInfo:]";
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Set up subscriptions on zone: %@ in container: %@",  buf,  0x20u);
  }

  -[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]( self,  "_setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:",  v7,  v6,  120.0);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v20 = v7;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 subscriptionList]);
  id v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        listener = self->_listener;
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)v16) subscriptionID]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 privateCloudDatabase]);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10009FC38;
        v22[3] = &unk_1004EF710;
        v22[4] = self;
        id v23 = v6;
        -[CKNotificationListener registerForSubscriptionWithID:inDatabase:handler:]( listener,  "registerForSubscriptionWithID:inDatabase:handler:",  v18,  v19,  v22);

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v14);
  }

  id v7 = v20;
LABEL_15:
}

- (void)_handleSubscriptionNotification:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 containerIdentifier]);
  id v34 = self;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager getContainerIDForThisDevice](self, "getContainerIDForThisDevice"));
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
      __int16 v47 = 2112;
      v48 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Handle notification for container: %@",  buf,  0x16u);
    }

    if ([v6 notificationType] == (id)2)
    {
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordZoneID]);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s zoneName](v12, "zoneName"));
      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_recordZoneInfoDict, "objectForKey:", v13));
        if ([v14 count])
        {
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v16)
          {
            id v17 = v16;
            __int16 v18 = v13;
            v32 = v12;
            id v33 = v6;
            uint64_t v19 = *(void *)v41;
            do
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
                __int128 v22 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v46 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
                  __int16 v47 = 2112;
                  v48 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Updating recordZoneInfo for zone %@",  buf,  0x16u);
                }

                id v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s options](v7, "options"));
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountOverrideInfo]);

                if (v24)
                {
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s options](v7, "options"));
                  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountOverrideInfo]);
                  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountID]);

                  if (v27)
                  {
                    containerDict = v34->_containerDict;
                    v35[0] = _NSConcreteStackBlock;
                    v35[1] = 3221225472LL;
                    v35[2] = sub_10009FB28;
                    v35[3] = &unk_1004EF738;
                    id v36 = v27;
                    uint64_t v37 = v21;
                    dispatch_queue_attr_t v38 = v34;
                    v39 = v7;
                    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( containerDict,  "enumerateKeysAndObjectsUsingBlock:",  v35);
                  }
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
            }

            while (v17);

            int v12 = v32;
            id v6 = v33;
            id v13 = v18;
          }

          else
          {
          }
        }

        else
        {
          __int16 v31 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v46 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
            __int16 v47 = 2112;
            v48 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Unrecognized record zone notification zone name: (%@)",  buf,  0x16u);
          }
        }
      }

      else
      {
        v30 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v46 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Record zone notification contains no zone name",  buf,  0xCu);
        }
      }

      goto LABEL_30;
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = v11;
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 containerIdentifier]);
    *(_DWORD *)buf = 136315394;
    uint64_t v46 = "-[ADCloudKitManager _handleSubscriptionNotification:container:]";
    __int16 v47 = 2112;
    v48 = v29;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Ignoring notification for container (%@)",  buf,  0x16u);

LABEL_30:
  }
}

- (void)_fetchCurrentUserIDWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "-[ADCloudKitManager _fetchCurrentUserIDWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  primaryContainer = self->_primaryContainer;
  if (!primaryContainer)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4022LL));
    v4[2](v4, 0LL, v7);

    primaryContainer = self->_primaryContainer;
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009FAC4;
  v9[3] = &unk_1004EF760;
  id v10 = v4;
  id v8 = v4;
  -[CKContainer fetchUserRecordIDWithCompletionHandler:]( primaryContainer,  "fetchUserRecordIDWithCompletionHandler:",  v9);
}

- (void)_fetchChangesFromZone:(id)a3 serverChangeToken:(id)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v52 = a3;
  id v51 = a4;
  id v50 = a6;
  id v15 = (CKContainer *)a7;
  id v16 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  primaryContainer = v15;
  if (!v15) {
    primaryContainer = self->_primaryContainer;
  }
  __int16 v18 = primaryContainer;
  if (v9)
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));

    __int16 v18 = (CKContainer *)v19;
  }

  if (a5) {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[CKContainer sharedCloudDatabase](v18, "sharedCloudDatabase"));
  }
  else {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v18, "privateCloudDatabase"));
  }
  uint64_t v21 = (void *)v20;
  if (!v20)
  {
    if (!v16) {
      goto LABEL_23;
    }
    uint64_t v45 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4015LL));
LABEL_22:
    uint64_t v46 = (void *)v45;
    (*((void (**)(id, uint64_t, void, void, void, void))v16 + 2))(v16, v45, 0LL, 0LL, 0LL, 0LL);

    goto LABEL_23;
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v52 zoneID]);

  if (!v22)
  {
    if (!v16) {
      goto LABEL_23;
    }
    uint64_t v45 = objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4020LL));
    goto LABEL_22;
  }

  id v23 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int128 v24 = v23;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v52 zoneID]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
    uint64_t v27 = CKDatabaseScopeString([v21 databaseScope]);
    v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesFromZone:serverChangeToken:useSharedDatabase:activity:containe"
                         "r:mirror:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v71 = v28;
    LOWORD(v72) = 2112;
    *(void *)((char *)&v72 + 2) = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Fetching changes in record zone (%@) in database (%@) for container (%@)",  buf,  0x2Au);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v52 zoneID]);
  v75 = v29;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v32 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
  -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:](v32, "setPreviousServerChangeToken:", v51);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v52 zoneID]);
  v73 = v33;
  v74 = v32;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v71 = sub_100097844;
  *(void *)&__int128 v72 = sub_100097854;
  *((void *)&v72 + 1) = 0LL;
  id v34 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation),  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v49,  v48);
  -[CKFetchRecordZoneChangesOperation setFetchAllChanges:](v34, "setFetchAllChanges:", 1LL);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10009F564;
  void v68[3] = &unk_1004EF788;
  id v35 = v30;
  id v69 = v35;
  -[CKFetchRecordZoneChangesOperation setRecordChangedBlock:](v34, "setRecordChangedBlock:", v68);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10009F570;
  v66[3] = &unk_1004EF7B0;
  id v36 = v31;
  id v67 = v36;
  -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v34, "setRecordWithIDWasDeletedBlock:", v66);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_10009F57C;
  v65[3] = &unk_1004EF7D8;
  v65[4] = buf;
  -[CKFetchRecordZoneChangesOperation setRecordZoneChangeTokensUpdatedBlock:]( v34,  "setRecordZoneChangeTokensUpdatedBlock:",  v65);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10009F590;
  v62[3] = &unk_1004EF800;
  uint64_t v37 = v18;
  objc_super v63 = v37;
  v64 = buf;
  -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v34,  "setRecordZoneFetchCompletionBlock:",  v62);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10009F85C;
  v53[3] = &unk_1004EF828;
  id v38 = v21;
  id v54 = v38;
  id v39 = v35;
  id v55 = v39;
  id v40 = v36;
  id v56 = v40;
  id v57 = v52;
  id v58 = v37;
  BOOL v61 = v51 == 0LL;
  id v59 = v16;
  v60 = buf;
  id v41 = -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v34,  "setFetchRecordZoneChangesCompletionBlock:",  v53);
  else {
    uint64_t v43 = 17LL;
  }
  -[CKFetchRecordZoneChangesOperation setQualityOfService:](v34, "setQualityOfService:", v43, v32);
  if (v50)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation configuration](v34, "configuration"));
    [v44 setXpcActivity:v50];
  }

  [v38 addOperation:v34];

  _Block_object_dispose(buf, 8);
LABEL_23:
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4
{
  BOOL v4 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(serialQueue);
  -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:activity:mirror:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:activity:mirror:",  v7,  v4,  0LL,  0LL);
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 mirror:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v9 = a3;
  dispatch_assert_queue_V2(serialQueue);
  -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:activity:mirror:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:activity:mirror:",  v9,  v6,  0LL,  v5);
}

- (void)_fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4 activity:(id)a5 mirror:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v11 = a5;
  id v12 = a3;
  dispatch_assert_queue_V2(serialQueue);
  -[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:mirror:]( self,  "_fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:mirror:",  v12,  0LL,  v7,  v11,  0LL,  v6);
}

- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8
{
}

- (void)_fetchChangesWithZoneInfo:(id)a3 retryCount:(unint64_t)a4 useSharedDatabase:(BOOL)a5 activity:(id)a6 container:(id)a7 mirror:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  BOOL v12 = a5;
  id v15 = a3;
  id v46 = a6;
  id v16 = a7;
  id v47 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = @"private";
    if (v12) {
      uint64_t v43 = @"shared";
    }
    *(_DWORD *)id v69 = 136315394;
    *(void *)&v69[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:container:m"
                         "irror:completion:]";
    *(_WORD *)&v69[12] = 2112;
    *(void *)&v69[14] = v43;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s (%@)", v69, 0x16u);
  }

  *(void *)id v69 = 0LL;
  *(void *)&v69[8] = v69;
  *(void *)&v69[16] = 0x3032000000LL;
  v70 = sub_100097844;
  v71 = sub_100097854;
  id v72 = 0LL;
  id v18 = v16;
  uint64_t v19 = v18;
  if (v9)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));
  }

  if (v12
    || self->_multiUserSharedZoneReady
    || (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]),
        unsigned int v21 = [v20 isEqualToString:@"com.apple.assistant.multiuser.shared"],
        v20,
        !v21))
  {
    if (a4 >= 2)
    {
      __int128 v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCloudKitManager _fetchChangesWithZoneInfo:retryCount:useSharedDatabase:activity:contain"
                             "er:mirror:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Exceeded fetch retry attempts for zone: (%@)",  buf,  0x16u);
      }

- (void)_executeZoneFetchCompletionBlock:(id)a3 zoneInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  BOOL v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneName]);
  if ([v10 isEqualToString:@"com.apple.assistant.multiuser.shared"])
  {
    id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;

    if (vtZoneFetchCompletion)
    {
      BOOL v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        id v15 = "-[ADCloudKitManager _executeZoneFetchCompletionBlock:zoneInfo:completion:]";
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s error (%@)", (uint8_t *)&v14, 0x16u);
      }

      (*((void (**)(void))self->_vtZoneFetchCompletion + 2))();
      id v13 = self->_vtZoneFetchCompletion;
      self->_id vtZoneFetchCompletion = 0LL;
    }
  }

  else
  {
  }

  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)_resetZoneFetchCompletionBlock:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  unsigned int v5 = [v4 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v5)
  {
    BOOL v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ADCloudKitManager _resetZoneFetchCompletionBlock:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Clearing zone fetch completion block",  (uint8_t *)&v8,  0xCu);
    }

    id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;
    self->_id vtZoneFetchCompletion = 0LL;
  }

- (BOOL)_isCloudSyncEnabledForZone:(id)a3
{
  if ((-[CKAccountInfo supportsDeviceToDeviceEncryption]( self->_primaryAccountInfo,  "supportsDeviceToDeviceEncryption") & 1) == 0 && !self->_usingNonManateeIdentity)
  {
    unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (!v4) {
      return v4;
    }
    int v8 = 136315138;
    BOOL v9 = "-[ADCloudKitManager _isCloudSyncEnabledForZone:]";
    BOOL v6 = "%s Manatee is disabled for primary account";
    goto LABEL_9;
  }

  if (!self->_isPastBuddy)
  {
    unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (!v4) {
      return v4;
    }
    int v8 = 136315138;
    BOOL v9 = "-[ADCloudKitManager _isCloudSyncEnabledForZone:]";
    BOOL v6 = "%s Still in Buddy";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v8, 0xCu);
    LOBYTE(v4) = 0;
    return v4;
  }

  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)_isCloudSyncEnabledForZone:(id)a3 accountInfo:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v5) {
    goto LABEL_10;
  }
  if (([v5 supportsDeviceToDeviceEncryption] & 1) == 0)
  {
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      int v14 = "-[ADCloudKitManager _isCloudSyncEnabledForZone:accountInfo:]";
      __int16 v15 = 2112;
      id v16 = v5;
      int v8 = "%s Manatee is disabled for CKAccount: %@";
      BOOL v9 = v7;
      uint32_t v10 = 22;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v13, v10);
    }

- (id)_manateeRecordZoneInfoForName:(id)a3
{
  return 0LL;
}

- (void)_setupRecordZoneWithZoneInfo:(id)a3 retryInterval:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[ADCloudKitRetryManager cancelRecordZoneSetupTimerForZoneInfo:]( self->_ckRetryManager,  "cancelRecordZoneSetupTimerForZoneInfo:",  v8);
  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  BOOL v11 = -[ADCloudKitManager _zoneIsShareable:](self, "_zoneIsShareable:", v10);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
  id v13 = [v12 isMirroredDataStore];

  int v14 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  id v16 = -[CKRecordZoneID initWithZoneName:ownerName:](v14, "initWithZoneName:ownerName:", v15, CKCurrentUserDefaultName);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10009DF8C;
  v19[3] = &unk_1004EF910;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  char v23 = (char)v13;
  double v22 = a4;
  id v17 = v9;
  id v18 = v8;
  -[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]( self,  "_createRecordZoneWithID:shared:onMirror:completion:",  v16,  v11,  v13,  v19);
}

- (void)_createRecordZoneWithID:(id)a3 shared:(BOOL)a4 onMirror:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  unsigned __int8 v13 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v12);

  if ((v13 & 1) != 0)
  {
    if (a5) {
      int v14 = (CKContainer *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));
    }
    else {
      int v14 = self->_primaryContainer;
    }
    id v18 = v14;
    uint64_t v19 = (void *)AFSiriLogContextDaemon;
    if (v14)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v20 = v19;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        int v22 = 136315394;
        char v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
        __int16 v24 = 2112;
        __int128 v25 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Creating zone: (%@)",  (uint8_t *)&v22,  0x16u);
      }

      sub_1002FE818(v10, v18, v8, v11);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315138;
        char v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_ERROR,  "%s No container found",  (uint8_t *)&v22,  0xCu);
      }

      id v18 = 0LL;
    }

    goto LABEL_16;
  }

  __int16 v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    int v22 = 136315394;
    char v23 = "-[ADCloudKitManager _createRecordZoneWithID:shared:onMirror:completion:]";
    __int16 v24 = 2112;
    __int128 v25 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Unable to create zone: (%@)",  (uint8_t *)&v22,  0x16u);
  }

  if (v11)
  {
    id v18 = (CKContainer *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4014LL));
    (*((void (**)(id, CKContainer *, void))v11 + 2))(v11, v18, 0LL);
LABEL_16:
  }
}

- (void)_deleteRecordZoneWithZoneInfo:(id)a3 completion:(id)a4
{
}

- (void)_deleteRecordZoneWithZoneInfo:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zone]);
  id v11 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue([v10 zoneID]);

  if (!v11)
  {
    BOOL v12 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    id v11 = -[CKRecordZoneID initWithZoneName:ownerName:]( v12,  "initWithZoneName:ownerName:",  v13,  CKCurrentUserDefaultName);
  }

  int v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](v11, "zoneName"));
    *(_DWORD *)buf = 136315394;
    int v30 = "-[ADCloudKitManager _deleteRecordZoneWithZoneInfo:qualityOfService:completion:]";
    __int16 v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Deleting zone: (%@)", buf, 0x16u);
  }

  id v17 = self->_primaryContainer;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
  unsigned int v19 = [v18 isMirroredDataStore];

  if (v19)
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));

    id v17 = (CKContainer *)v20;
  }

  if (v17)
  {
    id v21 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    BOOL v28 = v11;
    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    char v23 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v21,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v22);

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10009DE54;
    v25[3] = &unk_1004FB748;
    __int128 v26 = v11;
    id v27 = v9;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v23,  "setModifyRecordZonesCompletionBlock:",  v25);
    -[CKModifyRecordZonesOperation setQualityOfService:](v23, "setQualityOfService:", a4);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v17, "privateCloudDatabase"));
    [v24 addOperation:v23];

LABEL_11:
    goto LABEL_12;
  }

  if (v9)
  {
    char v23 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4022LL));
    (*((void (**)(id, CKModifyRecordZonesOperation *))v9 + 2))(v9, v23);
    goto LABEL_11;
  }

- (void)_deleteRecordZoneWithZoneID:(id)a3 completion:(id)a4
{
}

- (void)_deleteRecordZoneWithZoneID:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v25 = a3;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = self->_primaryContainer;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));
  group = dispatch_group_create();
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_100097844;
  v39[4] = sub_100097854;
  id v40 = 0LL;
  if (v8)
  {
    if (v9) {
      dispatch_group_enter(group);
    }
    id v10 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    id v42 = v25;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
    BOOL v12 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v10,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v11);

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10009DAD8;
    v33[3] = &unk_1004EF938;
    id v13 = v25;
    id v34 = v13;
    uint64_t v37 = v39;
    id v14 = v7;
    id v36 = v14;
    BOOL v38 = v9 != 0LL;
    __int16 v15 = group;
    id v35 = v15;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v12,  "setModifyRecordZonesCompletionBlock:",  v33);
    -[CKModifyRecordZonesOperation setQualityOfService:](v12, "setQualityOfService:", a4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v8, "privateCloudDatabase"));
    [v16 addOperation:v12];

    if (v9)
    {
      dispatch_group_enter(v15);
      id v17 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
      id v41 = v13;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
      unsigned int v19 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v17,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v18);

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10009DC44;
      v29[3] = &unk_1004EF960;
      id v30 = v13;
      v32 = v39;
      uint64_t v20 = v15;
      __int16 v31 = v20;
      -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v19,  "setModifyRecordZonesCompletionBlock:",  v29);
      -[CKModifyRecordZonesOperation setQualityOfService:](v19, "setQualityOfService:", a4);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 privateCloudDatabase]);
      [v21 addOperation:v19];

      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10009DD90;
      block[3] = &unk_1004FC1D8;
      id v27 = v14;
      BOOL v28 = v39;
      dispatch_group_notify(v20, serialQueue, block);
    }

    goto LABEL_9;
  }

  if (v7)
  {
    BOOL v12 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4022LL));
    (*((void (**)(id, CKModifyRecordZonesOperation *))v7 + 2))(v7, v12);
LABEL_9:
  }

  _Block_object_dispose(v39, 8);
}

- (void)_initializeZones
{
  id vtZoneFetchCompletion = self->_vtZoneFetchCompletion;
  self->_id vtZoneFetchCompletion = 0LL;
}

- (void)_resetZoneWithZoneInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    id v17 = "-[ADCloudKitManager _resetZoneWithZoneInfo:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v16, 0xCu);
  }

  [v4 setZone:0];
  [v4 setSubscriptionList:0];
  [v4 setHasSetUpRecordZoneSubscription:0];
  [v4 setServerChangeToken:0];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataStore]);
  unsigned __int8 v7 = [v6 dataStoreIsOnSharedDatabase];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataStore]);
  unsigned __int8 v9 = [v8 isMirroredDataStore];

  if ((v9 & 1) != 0)
  {
    -[ADCloudKitManager _setUpMirroredZoneWithZoneInfo:](self, "_setUpMirroredZoneWithZoneInfo:", v4);
  }

  else if ((v7 & 1) != 0)
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315138;
      id v17 = "-[ADCloudKitManager _resetZoneWithZoneInfo:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Resetting shared zone",  (uint8_t *)&v16,  0xCu);
    }

    id v11 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
    id v13 = -[CKRecordZoneID initWithZoneName:ownerName:]( v11,  "initWithZoneName:ownerName:",  v12,  CKCurrentUserDefaultName);

    if (v13)
    {
      shareeOperations = self->_shareeOperations;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID ownerName](v13, "ownerName"));
      -[ADCloudKitShareeOperations deleteShareForUser:markForReinvitation:completion:]( shareeOperations,  "deleteShareForUser:markForReinvitation:completion:",  v15,  1LL,  &stru_1004EF980);
    }
  }

  else
  {
    -[ADCloudKitManager _setUpZoneWithZoneInfo:](self, "_setUpZoneWithZoneInfo:", v4);
  }
}

- (void)_setUpZoneWithZoneInfo:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  unsigned int v5 = [v4 isEqualToString:@"com.apple.assistant.backedup"];

  if (v5)
  {
    -[ADCloudKitManager _setupKeyValueRecordZone](self, "_setupKeyValueRecordZone");
  }

  else
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
    unsigned int v7 = [v6 isEqualToString:@"com.apple.assistant.account.status"];

    if (v7)
    {
      -[ADCloudKitManager _setupAccountStatusRecordZone](self, "_setupAccountStatusRecordZone");
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
      unsigned int v9 = [v8 isEqualToString:@"com.apple.assistant.multiuser.shared"];

      if (v9) {
        -[ADCloudKitManager _setupMultiUserSharedRecordZone](self, "_setupMultiUserSharedRecordZone");
      }
    }
  }
}

- (void)_setUpMirroredZoneWithZoneInfo:(id)a3
{
  id v4 = a3;
  mirroredContainer = self->_mirroredContainer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10009D800;
  v7[3] = &unk_1004FBD90;
  id v8 = v4;
  id v6 = v4;
  -[ADCloudKitMirroredContainer resynchronizeMirroredZone:completion:]( mirroredContainer,  "resynchronizeMirroredZone:completion:",  v6,  v7);
}

- (void)_prepareZoneForResetWithZoneInfo:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  unsigned int v4 = [v3 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v5 setMultiUserSharedDataNeedsSync:1];
    [v5 synchronize];
  }

- (void)_setupAccountStatusRecordZone
{
  accountStatusRecordZoneInfo = self->_accountStatusRecordZoneInfo;
  if (accountStatusRecordZoneInfo)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](accountStatusRecordZoneInfo, "zoneName"));
    unsigned int v5 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v4);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](self->_accountStatusRecordZoneInfo, "zone"));

      if (!v6)
      {
        -[ADCloudKitManager _setupRecordZoneWithZoneInfo:retryInterval:completion:]( self,  "_setupRecordZoneWithZoneInfo:retryInterval:completion:",  self->_accountStatusRecordZoneInfo,  0LL,  120.0);
        return;
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitRecordZoneInfo subscriptionList]( self->_accountStatusRecordZoneInfo,  "subscriptionList"));
      if ([v7 count])
      {
        unsigned __int8 v8 = -[ADCloudKitRecordZoneInfo hasSetUpRecordZoneSubscription]( self->_accountStatusRecordZoneInfo,  "hasSetUpRecordZoneSubscription");

        if ((v8 & 1) != 0)
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitRecordZoneInfo serverChangeToken]( self->_accountStatusRecordZoneInfo,  "serverChangeToken"));

          if (!v9) {
            -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:",  self->_accountStatusRecordZoneInfo,  0LL);
          }
          return;
        }
      }

      else
      {
      }

      -[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]( self,  "_setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:",  self->_accountStatusRecordZoneInfo,  0LL,  120.0);
    }
  }

- (void)_setupKeyValueRecordZone
{
  keyValueRecordZoneInfo = self->_keyValueRecordZoneInfo;
  if (keyValueRecordZoneInfo)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](keyValueRecordZoneInfo, "zoneName"));
    unsigned int v5 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v4);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](self->_keyValueRecordZoneInfo, "zone"));

      if (!v6)
      {
        -[ADCloudKitManager _setupRecordZoneWithZoneInfo:retryInterval:completion:]( self,  "_setupRecordZoneWithZoneInfo:retryInterval:completion:",  self->_keyValueRecordZoneInfo,  0LL,  120.0);
        return;
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo subscriptionList](self->_keyValueRecordZoneInfo, "subscriptionList"));
      if ([v7 count])
      {
        unsigned __int8 v8 = -[ADCloudKitRecordZoneInfo hasSetUpRecordZoneSubscription]( self->_keyValueRecordZoneInfo,  "hasSetUpRecordZoneSubscription");

        if ((v8 & 1) != 0)
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitRecordZoneInfo serverChangeToken]( self->_keyValueRecordZoneInfo,  "serverChangeToken"));

          if (!v9) {
            -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:",  self->_keyValueRecordZoneInfo,  0LL);
          }
          return;
        }
      }

      else
      {
      }

      -[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]( self,  "_setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:",  self->_keyValueRecordZoneInfo,  0LL,  120.0);
    }
  }

- (void)_setupMultiUserSharedRecordZoneIfHomeIsReady
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10009D744;
  v4[3] = &unk_1004EF9A8;
  v4[4] = self;
  [v3 getCurrentHomeMemberIds:v4];
}

- (void)_setupMultiUserSharedRecordZone
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[ADCloudKitManager _setupMultiUserSharedRecordZone]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ((-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
    multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
    if (multiUserRecordZoneInfo)
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](multiUserRecordZoneInfo, "zoneName"));
      unsigned int v6 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v5);

      if (v6)
      {
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](self->_multiUserRecordZoneInfo, "zone"));

        unsigned __int8 v8 = self->_multiUserRecordZoneInfo;
        if (!v7)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_10009D6A0;
          v16[3] = &unk_1004FD940;
          v16[4] = self;
          -[ADCloudKitManager _setupRecordZoneWithZoneInfo:retryInterval:completion:]( self,  "_setupRecordZoneWithZoneInfo:retryInterval:completion:",  v8,  v16,  120.0);
LABEL_22:
          -[ADCloudKitManager setupSharedZoneUpdaterForOwner](self, "setupSharedZoneUpdaterForOwner");
          -[ADCloudKitManager _setupSharedZoneView](self, "_setupSharedZoneView");
          return;
        }

        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo subscriptionList](self->_multiUserRecordZoneInfo, "subscriptionList"));
        if ([v9 count])
        {
          unsigned __int8 v10 = -[ADCloudKitRecordZoneInfo hasSetUpRecordZoneSubscription]( self->_multiUserRecordZoneInfo,  "hasSetUpRecordZoneSubscription");

          if ((v10 & 1) != 0)
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitRecordZoneInfo serverChangeToken]( self->_multiUserRecordZoneInfo,  "serverChangeToken"));

            if (!v11) {
              id v12 = -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:",  self->_multiUserRecordZoneInfo,  0LL);
            }
            goto LABEL_16;
          }
        }

        else
        {
        }

        id v12 = -[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]( self,  "_setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:",  self->_multiUserRecordZoneInfo,  0LL,  120.0);
LABEL_16:
        if (AFIsMultiUserCompanion(v12))
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
          unsigned int v15 = [v14 multiUserVoiceIdentification];
        }

        else
        {
          unsigned int v15 = 0;
        }

        if (self->_voiceTriggerEnabled || v15) {
          -[ADCloudKitManager _setupVoiceTriggerSyncTimer](self, "_setupVoiceTriggerSyncTimer");
        }
        goto LABEL_22;
      }
    }

    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[ADCloudKitManager _setupMultiUserSharedRecordZone]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s CloudSync disabled", buf, 0xCu);
    }
  }

- (void)_triggerVoiceProfileUploadPostBuddyOrCloudSyncChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  [v2 setMultiUserSharedDataNeedsSync:1];
  [v2 setVoiceTriggerNeedsDataSync:1];
  [v2 synchronize];
}

- (void)_triggerMultiUserSharingPostBuddyOrCloudSyncChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v2 restartSharing];
}

- (void)_voiceTriggerEnabledDidChange
{
  unsigned __int8 v3 = sub_1001EBF24(self->_instanceContext);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10009D518;
  v5[3] = &unk_1004FC4D0;
  v5[4] = self;
  unsigned __int8 v6 = v3;
  dispatch_async(serialQueue, v5);
}

- (void)_voiceTriggerPHSProfileDidChange
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009D2F4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_forceVoiceProfileDownloadOfAllUsers:(int64_t)a3
{
  if (a3 >= 4)
  {
    unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[ADCloudKitManager _forceVoiceProfileDownloadOfAllUsers:]";
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s Voice Trigger PHS full download failed after %lu retries.",  buf,  0x16u);
    }
  }

  multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
  if (!multiUserRecordZoneInfo) {
    goto LABEL_12;
  }
  if (self->_multiUserSharedZoneReady)
  {
    -[ADCloudKitRecordZoneInfo setServerChangeToken:](multiUserRecordZoneInfo, "setServerChangeToken:", 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](self->_multiUserRecordZoneInfo, "zoneName"));
    unsigned int v8 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v7);

    if (v8) {
      id v9 = -[ADCloudKitManager _fetchChangesWithZoneInfo:useSharedDatabase:]( self,  "_fetchChangesWithZoneInfo:useSharedDatabase:",  self->_multiUserRecordZoneInfo,  0LL);
    }
  }

  if (!self->_multiUserRecordZoneInfo || !self->_multiUserSharedZoneReady)
  {
LABEL_12:
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v16 = "-[ADCloudKitManager _forceVoiceProfileDownloadOfAllUsers:]";
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s MultiUserInfo not ready. Rescheduling. Retry count = %lu",  buf,  0x16u);
    }

    dispatch_time_t v12 = dispatch_time(0LL, 60000000000LL);
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009D2D0;
    v14[3] = &unk_1004FD0A0;
    v14[4] = self;
    void v14[5] = a3;
    dispatch_after(v12, serialQueue, v14);
  }

- (BOOL)_forceVoiceProfileDownloadForiCloudAltDSID:(id)a3 retryCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (!v8)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Error: no iCloudAltDSID", buf, 0xCu);
      if (v9) {
        goto LABEL_9;
      }
    }

    else if (v9)
    {
LABEL_9:
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 31LL));
      v9[2](v9, v15);
      goto LABEL_17;
    }

    BOOL v18 = 0;
    goto LABEL_19;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    containerDict = self->_containerDict;
    dispatch_time_t v12 = v10;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](containerDict, "allKeys"));
    *(_DWORD *)buf = 136315651;
    BOOL v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
    __int16 v29 = 2113;
    id v30 = v8;
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Choosing container for %{private}@ from %@",  buf,  0x20u);
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:](self, "_trackedCKContainerForiCloudAltDSID:", v8));
  if (!v14)
  {
    unsigned int v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s No container found for %@",  buf,  0x16u);
      if (!v9) {
        goto LABEL_13;
      }
    }

    else if (!v9)
    {
LABEL_13:
      unsigned int v15 = 0LL;
      goto LABEL_17;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4022LL));
    v9[2](v9, v20);

    goto LABEL_13;
  }

  unsigned int v15 = (void *)v14;
  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](self->_multiUserRecordZoneInfo, "zoneName"));
  unsigned int v17 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v16);

  if (!v17)
  {
    id v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      multiUserRecordZoneInfo = self->_multiUserRecordZoneInfo;
      id v25 = v21;
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](multiUserRecordZoneInfo, "zoneName"));
      *(_DWORD *)buf = 136315394;
      BOOL v28 = "-[ADCloudKitManager _forceVoiceProfileDownloadForiCloudAltDSID:retryCount:completion:]";
      __int16 v29 = 2112;
      id v30 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s Cloud sync is not enabled for zone: %@",  buf,  0x16u);

      if (!v9) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    if (v9)
    {
LABEL_16:
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4020LL));
      v9[2](v9, v22);
    }

- (void)_voiceProfileFullDownloadTriggered:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009D2C4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_homeInfoDidChange:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009D200;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_setupVoiceTriggerSyncTimer
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v4 = [v3 multiUserSharedDataNeedsSync];

  double v5 = 30.0;
  if ((v4 & 1) == 0)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    unsigned __int8 v7 = [v6 voiceTriggerNeedsDataSync];

    if ((v7 & 1) == 0)
    {
      if (AFIsMultiUserCompanion(v8))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
        unsigned int v10 = [v9 mirroredMultiUserSharedDataNeedsSync];

        if (v10) {
          double v5 = 30.0;
        }
        else {
          double v5 = 86400.0;
        }
      }

      else
      {
        double v5 = 86400.0;
      }
    }
  }

  -[ADCloudKitManager _startVoiceTriggerSyncTimerWithInterval:](self, "_startVoiceTriggerSyncTimerWithInterval:", v5);
}

- (void)_startVoiceTriggerSyncTimerWithInterval:(double)a3
{
  double v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[ADCloudKitManager _startVoiceTriggerSyncTimerWithInterval:]";
    __int16 v15 = 2048;
    double v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Synching Voice Trigger data in %f seconds",  buf,  0x16u);
  }

  -[ADCloudKitManager _cancelVoiceTriggerSyncTimer](self, "_cancelVoiceTriggerSyncTimer");
  if (-[ADCloudKitManager cloudSyncEnabled](self, "cloudSyncEnabled"))
  {
    unsigned __int8 v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_serialQueue);
    voiceTriggerSyncTimer = self->_voiceTriggerSyncTimer;
    self->_voiceTriggerSyncTimer = v6;

    uint64_t v8 = self->_voiceTriggerSyncTimer;
    dispatch_time_t v9 = dispatch_time(0LL, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    unsigned int v10 = self->_voiceTriggerSyncTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10009D150;
    handler[3] = &unk_1004FD940;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
    dispatch_resume((dispatch_object_t)self->_voiceTriggerSyncTimer);
  }

  else
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[ADCloudKitManager _startVoiceTriggerSyncTimerWithInterval:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Voice Trigger setup timer cancelled",  buf,  0xCu);
    }
  }

- (void)_cancelVoiceTriggerSyncTimer
{
  unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[ADCloudKitManager _cancelVoiceTriggerSyncTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  voiceTriggerSyncTimer = self->_voiceTriggerSyncTimer;
  if (voiceTriggerSyncTimer)
  {
    dispatch_source_cancel((dispatch_source_t)voiceTriggerSyncTimer);
    double v5 = self->_voiceTriggerSyncTimer;
    self->_voiceTriggerSyncTimer = 0LL;
  }

- (void)_synchronizeVoiceTriggerData
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](self->_multiUserRecordZoneInfo, "dataStore"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10009CFD0;
  v4[3] = &unk_1004FB0E0;
  v4[4] = self;
  [v3 synchronizeWithCompletion:v4];
}

- (id)_createKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 count])
  {
    if (a4)
    {
      unsigned __int8 v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 136315138;
        uint64_t v20 = "-[ADCloudKitManager _createKeyValueRecordsWithDictionary:mirror:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s mirrored", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v8 = (ADCloudKitRecordZoneInfo *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer keyValueRecordZoneInfo]( self->_mirroredContainer,  "keyValueRecordZoneInfo"));
    }

    else
    {
      uint64_t v8 = self->_keyValueRecordZoneInfo;
    }

    unsigned int v10 = v8;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](v8, "zone"));
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo rateLimitTimer](v10, "rateLimitTimer"));

      if (!v13)
      {
        unsigned int v17 = sub_100102F50(v6, v12);
        dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_14;
      }

      uint64_t v14 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = v14;
        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zoneName](v10, "zoneName"));
        int v19 = 136315394;
        uint64_t v20 = "-[ADCloudKitManager _createKeyValueRecordsWithDictionary:mirror:]";
        __int16 v21 = 2112;
        int v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Unable to save records for zone because zone is rate limited: (%@)",  (uint8_t *)&v19,  0x16u);
      }
    }

    dispatch_time_t v9 = 0LL;
LABEL_14:

    goto LABEL_15;
  }

  dispatch_time_t v9 = 0LL;
LABEL_15:

  return v9;
}

- (id)_createFileAssetRecordWithDictionary:(id)a3 zone:(id)a4 version:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v8 count])
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"fileName"]);
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0 && [v11 length])
    {
      dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"fileCompressionType"]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"fileAssetSize"]);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          double v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"fileAsset"]);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___CKAsset);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"languages"]);
            uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0 && [v18 count])
            {
              id v36 = v16;
              uint64_t v37 = v14;
              __int128 v41 = 0u;
              __int128 v42 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              id v35 = v18;
              id obj = v18;
              id v20 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v40;
                while (2)
                {
                  for (i = 0LL; i != v21; i = (char *)i + 1)
                  {
                    if (*(void *)v40 != v22) {
                      objc_enumerationMutation(obj);
                    }
                    if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v39 + 1) + 8LL * (void)i), v10) & 1) == 0)
                    {
                      __int128 v26 = 0LL;
                      BOOL v28 = obj;
                      goto LABEL_30;
                    }
                  }

                  id v21 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
                  if (v21) {
                    continue;
                  }
                  break;
                }
              }

              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"productType"]);
              if ((objc_opt_isKindOfClass(v24, v10) & 1) != 0)
              {
                id v34 = v24;
                id v25 = [v24 length];
                double v16 = v36;
                uint64_t v14 = v37;
                if (v25)
                {
                  id v33 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"buildVersion"]);
                  BOOL v18 = v35;
                  if ((objc_opt_isKindOfClass(v33, v10) & 1) != 0 && [v33 length])
                  {
                    __int16 v31 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v11,  v9);
                    __int128 v26 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AssistantVoiceTriggerFileAssetRecord",  v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](v26, "encryptedValuesByKey"));
                    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a5));
                    [v32 setObject:v27 forKey:@"version"];

                    [v32 setObject:v11 forKey:@"fileName"];
                    [v32 setObject:v12 forKey:@"fileCompressionType"];
                    [v32 setObject:v37 forKey:@"fileAssetSize"];
                    [v32 setObject:obj forKey:@"languages"];
                    BOOL v28 = v34;
                    [v32 setObject:v34 forKey:@"productType"];
                    __int16 v29 = v33;
                    [v32 setObject:v33 forKey:@"buildVersion"];
                    -[CKRecord setObject:forKey:](v26, "setObject:forKey:", v36, @"fileAsset");
                  }

                  else
                  {
                    __int128 v26 = 0LL;
                    __int16 v29 = v33;
                    BOOL v28 = v34;
                  }
                }

                else
                {
                  __int128 v26 = 0LL;
                  BOOL v28 = v34;
                  BOOL v18 = v35;
                }
              }

              else
              {
                __int128 v26 = 0LL;
                BOOL v28 = v24;
LABEL_30:
                double v16 = v36;
                uint64_t v14 = v37;
                BOOL v18 = v35;
              }
            }

            else
            {
              __int128 v26 = 0LL;
            }
          }

          else
          {
            __int128 v26 = 0LL;
          }
        }

        else
        {
          __int128 v26 = 0LL;
        }
      }

      else
      {
        __int128 v26 = 0LL;
      }
    }

    else
    {
      __int128 v26 = 0LL;
    }
  }

  else
  {
    __int128 v26 = 0LL;
  }

  return v26;
}

- (id)_createRecordsWithDictionary:(id)a3 forZoneInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zone]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 rateLimitTimer]);

      if (!v9)
      {
        uint64_t v14 = sub_100102F50(v5, v8);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
        goto LABEL_9;
      }

      uint64_t v10 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v11 = v10;
        dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
        int v16 = 136315394;
        uint64_t v17 = "-[ADCloudKitManager _createRecordsWithDictionary:forZoneInfo:]";
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Unable to save records for zone because zone is rate limited: (%@)",  (uint8_t *)&v16,  0x16u);
      }
    }

    uint64_t v13 = 0LL;
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v13 = 0LL;
LABEL_10:

  return v13;
}

- (void)saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009CFB8;
  block[3] = &unk_1004F3C80;
  BOOL v13 = a3;
  BOOL v14 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(serialQueue, block);
}

- (void)_saveCloudSyncEnabledRecord:(BOOL)a3 mirror:(BOOL)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = @"NO";
    if (v7) {
      id v12 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    id v36 = "-[ADCloudKitManager _saveCloudSyncEnabledRecord:mirror:qualityOfService:completion:]";
    __int16 v37 = 2112;
    BOOL v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s mirrored : (%@)", buf, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v7)
  {
    BOOL v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v36 = "-[ADCloudKitManager _saveCloudSyncEnabledRecord:mirror:qualityOfService:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s mirrored", buf, 0xCu);
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer accountStatusRecordZoneInfo]( self->_mirroredContainer,  "accountStatusRecordZoneInfo"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zone]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  }

  else
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo zone](self->_accountStatusRecordZoneInfo, "zone"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
  }

  if (v16)
  {
    int64_t v29 = a5;
    uint64_t v17 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"SyncEnabled",  v16);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitRecordZoneInfo dataStore](self->_accountStatusRecordZoneInfo, "dataStore"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 supportedRecordTypes]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

    id v21 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  v20,  v17);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](v21, "encryptedValuesByKey"));
    char v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
    [v22 setObject:v23 forKey:@"version"];

    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](v21, "encryptedValuesByKey"));
    [v24 setObject:@"SyncEnabled" forKey:@"key"];

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[CKRecord _ad_setData:](v21, "_ad_setData:", v25);

    if (v7) {
      __int128 v26 = (CKContainer *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));
    }
    else {
      __int128 v26 = self->_primaryContainer;
    }
    id v27 = v26;
    id v34 = v21;
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10009CCC4;
    v30[3] = &unk_1004EF9D0;
    BOOL v33 = v7;
    int64_t v32 = v29;
    v30[4] = self;
    id v31 = v10;
    sub_100103390(v28, 0LL, v29, v27, 1, 0LL, v30);

    goto LABEL_17;
  }

  if (v10)
  {
    uint64_t v17 = (CKRecordID *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4020LL));
    (*((void (**)(id, CKRecordID *, void))v10 + 2))(v10, v17, 0LL);
LABEL_17:
  }
}

- (void)saveKeyValueRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[ADCloudKitManager saveKeyValueRecordsWithDictionary:mirror:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10009C664;
  v14[3] = &unk_1004FBFC0;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = a4;
  v14[4] = self;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(serialQueue, v14);
}

- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 completion:(id)a6
{
}

- (void)saveFileAssetRecordsWithDictionary:(id)a3 mirror:(BOOL)a4 onZone:(id)a5 activity:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10009BF40;
  v21[3] = &unk_1004F5B98;
  id v24 = v14;
  id v25 = v15;
  BOOL v26 = a4;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  id v20 = v15;
  dispatch_async(serialQueue, v21);
}

- (void)saveRecordsWithDictionary:(id)a3 inZone:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[ADCloudKitManager saveRecordsWithDictionary:inZone:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10009BB58;
  v16[3] = &unk_1004FDA30;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(serialQueue, v16);
}

- (void)_setupRecordZoneSubscriptionWithZoneInfo:(id)a3 retryInterval:(double)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = (CKContainer *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v48) = 136315138;
    *(void *)((char *)&v48 + 4) = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v48, 0xCu);
  }

  -[ADCloudKitRetryManager cancelSubscriptionSetupTimerForZoneInfo:]( self->_ckRetryManager,  "cancelSubscriptionSetupTimerForZoneInfo:",  v8);
  *(void *)&__int128 v48 = 0LL;
  *((void *)&v48 + 1) = &v48;
  uint64_t v49 = 0x3032000000LL;
  id v50 = sub_100097844;
  id v51 = sub_100097854;
  id v52 = 0LL;
  uint64_t v40 = 0LL;
  __int128 v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  unsigned __int8 v12 = -[ADCloudKitManager _isCloudSyncEnabledForZone:](self, "_isCloudSyncEnabledForZone:", v11);

  unsigned __int8 v43 = v12;
  if (v9)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer options](v9, "options"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountOverrideInfo]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountID]);
      id v16 = v15;
      if (v15)
      {
        containerDict = self->_containerDict;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_10009B4C4;
        v34[3] = &unk_1004EF850;
        id v35 = v15;
        id v36 = self;
        BOOL v38 = &v48;
        __int128 v39 = &v40;
        id v37 = v8;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( containerDict,  "enumerateKeysAndObjectsUsingBlock:",  v34);
      }
    }
  }

  else
  {
    id v9 = self->_primaryContainer;
  }

  if (*((_BYTE *)v41 + 24))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 zone]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneID]);

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 zone]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 subscriptionNames]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 supportedRecordTypes]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10009B5E0;
      v28[3] = &unk_1004EFA48;
      v28[4] = self;
      id v29 = v8;
      id v31 = &v40;
      int64_t v32 = &v48;
      double v33 = a4;
      id v30 = v9;
      -[ADCloudKitManager _createRecordZoneSubscriptionWithZoneID:name:recordTypes:container:completion:]( self,  "_createRecordZoneSubscriptionWithZoneID:name:recordTypes:container:completion:",  v21,  v22,  v24,  v30,  v28);
    }

    else
    {
      id v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v45 = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Unable to create zone subscription without a record zone",  buf,  0xCu);
      }

      -[ADCloudKitRetryManager cancelSubscriptionSetupTimerForZoneInfo:]( self->_ckRetryManager,  "cancelSubscriptionSetupTimerForZoneInfo:",  v8);
    }
  }

  else
  {
    id v25 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
      *(_DWORD *)buf = 136315394;
      uint64_t v45 = "-[ADCloudKitManager _setupRecordZoneSubscriptionWithZoneInfo:retryInterval:container:]";
      __int16 v46 = 2112;
      id v47 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s iCloud sync is disabled. Unable to create subscription for zone: (%@)",  buf,  0x16u);
    }
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v48, 8);
}

- (void)_createRecordZoneSubscriptionWithZoneID:(id)a3 name:(id)a4 recordTypes:(id)a5 container:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "-[ADCloudKitManager _createRecordZoneSubscriptionWithZoneID:name:recordTypes:container:completion:]";
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Creating zone subscription: (%@)", buf, 0x16u);
  }

  if (v15)
  {
    id v18 = (CKContainer *)v15;
LABEL_6:
    id v31 = v18;
    int64_t v32 = v16;
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v14 count])
    {
      uint64_t v20 = 0LL;
      unsigned int v21 = 1;
      do
      {
        id v22 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v20]);
        id v24 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:]( v22,  "initWithZoneID:subscriptionID:",  v12,  v23);

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v20]);
        -[CKRecordZoneSubscription setRecordType:](v24, "setRecordType:", v25);

        BOOL v26 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
        -[CKNotificationInfo setShouldSendContentAvailable:](v26, "setShouldSendContentAvailable:", 1LL);
        -[CKRecordZoneSubscription setNotificationInfo:](v24, "setNotificationInfo:", v26);
        -[NSMutableArray addObject:](v19, "addObject:", v24);

        uint64_t v20 = v21;
      }

      while ((unint64_t)[v14 count] > v21++);
    }

    BOOL v28 = -[CKModifySubscriptionsOperation initWithSubscriptionsToSave:subscriptionIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifySubscriptionsOperation),  "initWithSubscriptionsToSave:subscriptionIDsToDelete:",  v19,  0LL);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10009B36C;
    v33[3] = &unk_1004FB748;
    id v34 = v13;
    id v16 = v32;
    id v35 = v32;
    -[CKModifySubscriptionsOperation setModifySubscriptionsCompletionBlock:]( v28,  "setModifySubscriptionsCompletionBlock:",  v33);
    -[CKModifySubscriptionsOperation setQualityOfService:](v28, "setQualityOfService:", 17LL);
    id v29 = v31;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](v31, "privateCloudDatabase"));
    [v30 addOperation:v28];

    goto LABEL_10;
  }

  id v18 = self->_primaryContainer;
  if (v18) {
    goto LABEL_6;
  }
  if (!v16) {
    goto LABEL_11;
  }
  id v29 = (CKContainer *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4003LL));
  (*((void (**)(id, CKContainer *, void))v16 + 2))(v16, v29, 0LL);
LABEL_10:

LABEL_11:
}

- (void)_cleanUpRecordZoneSubscriptionsTimers
{
}

- (void)_cleanUpRecordZonesAndSubscriptions
{
  unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCloudKitManager _cleanUpRecordZonesAndSubscriptions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[ADCloudKitManager _cleanUpRecordZoneSubscriptionsTimers](self, "_cleanUpRecordZoneSubscriptionsTimers");
  -[ADCloudKitRecordZoneInfo setZone:](self->_accountStatusRecordZoneInfo, "setZone:", 0LL);
  -[ADCloudKitRecordZoneInfo setSubscriptionList:](self->_accountStatusRecordZoneInfo, "setSubscriptionList:", 0LL);
  -[ADCloudKitRecordZoneInfo setZone:](self->_keyValueRecordZoneInfo, "setZone:", 0LL);
  -[ADCloudKitRecordZoneInfo setSubscriptionList:](self->_keyValueRecordZoneInfo, "setSubscriptionList:", 0LL);
  -[ADCloudKitRecordZoneInfo setZone:](self->_voiceTriggerRecordZoneInfo, "setZone:", 0LL);
  -[ADCloudKitRecordZoneInfo setSubscriptionList:](self->_voiceTriggerRecordZoneInfo, "setSubscriptionList:", 0LL);
  -[ADCloudKitRecordZoneInfo setZone:](self->_multiUserRecordZoneInfo, "setZone:", 0LL);
  -[ADCloudKitRecordZoneInfo setSubscriptionList:](self->_multiUserRecordZoneInfo, "setSubscriptionList:", 0LL);
}

- (id)getContainerIDForThisDevice
{
  if (self->_usingNonManateeIdentity) {
    return @"com.apple.siri.zonesharing";
  }
  return @"com.apple.siri.profile";
}

- (void)_synchronizeMirroredContainer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[ADCloudKitManager _synchronizeMirroredContainer:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  unsigned int v7 = [v6 isEqualToString:@"com.apple.assistant.backedup"];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer keyValueRecordZoneInfo]( self->_mirroredContainer,  "keyValueRecordZoneInfo"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10009B01C;
    v21[3] = &unk_1004FB0E0;
    v21[4] = self;
    [v9 synchronizeWithCompletion:v21];
    [v9 synchronizeKeychainPreferencesWithCompletion:&stru_1004EFA68];

    goto LABEL_10;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  unsigned int v11 = [v10 isEqualToString:@"com.apple.assistant.account.status"];

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer accountStatusRecordZoneInfo]( self->_mirroredContainer,  "accountStatusRecordZoneInfo"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataStore]);
    id v14 = v13;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10009B0F0;
    v20[3] = &unk_1004FB0E0;
    v20[4] = self;
    id v15 = v20;
LABEL_9:
    [v13 synchronizeWithCompletion:v15];

    goto LABEL_10;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
  unsigned int v17 = [v16 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  if (v17)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer multiUserRecordZoneInfo]( self->_mirroredContainer,  "multiUserRecordZoneInfo"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataStore]);
    id v14 = v13;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10009B1C4;
    v19[3] = &unk_1004FB0E0;
    v19[4] = self;
    id v15 = v19;
    goto LABEL_9;
  }

  id v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[ADCloudKitManager _synchronizeMirroredContainer:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Unknown zone (%@)", buf, 0x16u);
  }

- (void)_scheduleMirrorSynchronizationAfterDelay:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0LL, 600000000000LL);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009AF08;
  v8[3] = &unk_1004FD968;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_after(v5, serialQueue, v8);
}

- (void)_setupSharedZoneUpdaterForOwner
{
  unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCloudKitManager _setupSharedZoneUpdaterForOwner]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  if (!self->_sharedZoneUpdater)
  {
    id v4 = (ADCloudKitRecordZoneInfo *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer multiUserRecordZoneInfo]( self->_mirroredContainer,  "multiUserRecordZoneInfo"));
    if (!v4) {
      id v4 = self->_multiUserRecordZoneInfo;
    }
    dispatch_time_t v5 = (CKContainer *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](self->_mirroredContainer, "container"));
    if (!v5 || self->_usingNonManateeIdentity)
    {
      id v6 = self->_primaryContainer;

      dispatch_time_t v5 = v6;
    }

    id v7 = -[ADCloudKitSharedZoneUpdater initWithQueue:container:sharedZone:zoneOwner:delegate:]( objc_alloc(&OBJC_CLASS___ADCloudKitSharedZoneUpdater),  "initWithQueue:container:sharedZone:zoneOwner:delegate:",  self->_serialQueue,  v5,  v4,  1LL,  self);
    sharedZoneUpdater = self->_sharedZoneUpdater;
    self->_sharedZoneUpdater = v7;
  }

- (void)setupSharedZoneUpdaterForOwner
{
  if (!self->_sharedZoneUpdater)
  {
    unsigned __int8 v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[ADCloudKitManager setupSharedZoneUpdaterForOwner]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s _sharedZoneUpdater is nil, scheduling the retryManager",  buf,  0xCu);
    }

    id v4 = (ADCloudKitRecordZoneInfo *)objc_claimAutoreleasedReturnValue( -[ADCloudKitMirroredContainer multiUserRecordZoneInfo]( self->_mirroredContainer,  "multiUserRecordZoneInfo"));
    if (!v4) {
      id v4 = self->_multiUserRecordZoneInfo;
    }
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009AEB0;
    v7[3] = &unk_1004FD968;
    void v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(serialQueue, v7);
  }

- (void)adCloudKitSharedZoneUpdater:(id)a3 didEncounterError:(id)a4
{
  id v5 = a4;
  -[ADCloudKitManager handleCloudKitError:forZone:mirror:operationType:]( self,  "handleCloudKitError:forZone:mirror:operationType:",  v5,  @"com.apple.assistant.multiuser.shared",  AFIsMultiUserCompanion(v5),  2LL);
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009AE9C;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10009AE10;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(serialQueue, v15);
}

- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  unsigned int v11 = v10;
  if (v8 | v9)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10009AD84;
    v13[3] = &unk_1004FDA30;
    v13[4] = self;
    id v16 = v10;
    id v14 = (id)v8;
    id v15 = (id)v9;
    dispatch_async(serialQueue, v13);
  }

  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4
{
}

- (void)deleteRecordFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 completion:(id)a5
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 container:(id)a4 withQOS:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009AD2C;
  block[3] = &unk_1004F8BA0;
  void block[4] = self;
  id v18 = v11;
  id v20 = v12;
  int64_t v21 = a5;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(serialQueue, block);
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10009AC9C;
  v13[3] = &unk_1004FBA38;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(serialQueue, v13);
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10009AC0C;
    v11[3] = &unk_1004FBA38;
    v11[4] = self;
    id v13 = v9;
    id v12 = v8;
    int64_t v14 = a4;
    dispatch_async(serialQueue, v11);
  }

  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)fetchSharedUserIdForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        containerDict = self->_containerDict;
        id v10 = v8;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](containerDict, "allKeys"));
        *(_DWORD *)buf = 136315651;
        int64_t v16 = "-[ADCloudKitManager fetchSharedUserIdForiCloudAltDSID:completion:]";
        __int16 v17 = 2113;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Choosing container for %{private}@ from %@",  buf,  0x20u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:]( self,  "_trackedCKContainerForiCloudAltDSID:",  v6));
    }

    else
    {
      id v12 = 0LL;
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10009A92C;
    v13[3] = &unk_1004F6CC0;
    v13[4] = self;
    id v14 = v7;
    -[ADCloudKitManager fetchValueForKeyFromSharedStore:container:completion:]( self,  "fetchValueForKeyFromSharedStore:container:completion:",  @"meDeviceSharedUserID",  v12,  v13);
  }
}

- (void)_setupSharedZoneView
{
  if (!self->_shareeOperations)
  {
    unsigned __int8 v3 = -[ADCloudKitShareeOperations initWithQueue:container:instanceContext:]( objc_alloc(&OBJC_CLASS___ADCloudKitShareeOperations),  "initWithQueue:container:instanceContext:",  self->_serialQueue,  self->_primaryContainer,  self->_instanceContext);
    shareeOperations = self->_shareeOperations;
    self->_shareeOperations = v3;
  }

- (id)containerIDs
{
  if (self->_usingNonManateeIdentity)
  {
    id v5 = @"com.apple.siri.zonesharing";
    id v2 = &v5;
  }

  else
  {
    id v4 = @"com.apple.siri.data";
    id v2 = &v4;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v2,  1LL));
}

- (void)continueShareAcceptanceOperations
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue frontObject](self->_shareAcceptanceQueue, "frontObject"));
  if (v3)
  {
    id v4 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v4;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
      int v10 = 136315394;
      id v11 = "-[ADCloudKitManager continueShareAcceptanceOperations]";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s Retry for url (%@)",  (uint8_t *)&v10,  0x16u);
    }

    objc_msgSend(v3, "setRetryCount:", (char *)objc_msgSend(v3, "retryCount") + 1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 token]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 containerID]);
    -[ADCloudKitManager acceptShare:token:containerID:retryCount:object:]( self,  "acceptShare:token:containerID:retryCount:object:",  v5,  v6,  v7,  [v3 retryCount],  v3);
  }
}

- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5
{
}

- (void)acceptShare:(id)a3 token:(id)a4 containerID:(id)a5 retryCount:(unint64_t)a6 object:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100099D98;
  v21[3] = &unk_1004EFAB8;
  id v22 = v15;
  id v23 = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  unint64_t v27 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(serialQueue, v21);
}

- (void)_acceptSharesForMetadatas:(id)a3
{
  id v4 = a3;
  id v5 = -[CKAcceptSharesOperation initWithShareMetadatas:]( objc_alloc(&OBJC_CLASS___CKAcceptSharesOperation),  "initWithShareMetadatas:",  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000998CC;
  v13[3] = &unk_1004FC2C8;
  v13[4] = v7;
  void v13[5] = v7;
  -[CKAcceptSharesOperation setAcceptSharesCompletionBlock:](v5, "setAcceptSharesCompletionBlock:", v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100099A9C;
  v11[3] = &unk_1004EFAE0;
  v11[4] = v7;
  void v11[5] = v7;
  id v8 = v6;
  id v12 = v8;
  -[CKAcceptSharesOperation setPerShareCompletionBlock:](v5, "setPerShareCompletionBlock:", v11);
  mirroredContainer = v7->_mirroredContainer;
  if (mirroredContainer)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitMirroredContainer container](mirroredContainer, "container"));
    [v10 addOperation:v5];
  }

  else
  {
    -[CKContainer addOperation:](v7->_primaryContainer, "addOperation:", v5);
  }
}

- (void)deleteShareForUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  shareeOperations = self->_shareeOperations;
  if (!shareeOperations)
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[ADCloudKitManager deleteShareForUser:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Request to delete data when sharee operations not setup",  (uint8_t *)&v10,  0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }

    else if (!v7)
    {
      goto LABEL_6;
    }

    v7[2](v7);
    goto LABEL_6;
  }

  -[ADCloudKitShareeOperations deleteShareForUser:markForReinvitation:completion:]( shareeOperations,  "deleteShareForUser:markForReinvitation:completion:",  v6,  0LL,  v7);
LABEL_6:
}

- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 participants:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 mutableCopy];
  [v10 removeObjectForKey:v8];
  id v11 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v12 = [v10 copy];
  id v13 = -[NSDictionary initWithObjectsAndKeys:]( v11,  "initWithObjectsAndKeys:",  v12,  @"ADCloudKitShareParticipants",  0LL);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100099674;
  v18[3] = &unk_1004F79D8;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  id v22 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  id v17 = self;
  -[ADCloudKitManager addDictionaryToSharedStore:completion:](v17, "addDictionaryToSharedStore:completion:", v13, v18);
}

- (void)removeHomeOwnerCKParticipantAssociation:(id)a3 onShare:(id)a4 onContainer:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100098A48;
  v16[3] = &unk_1004F35C0;
  id v17 = v10;
  id v18 = self;
  id v20 = a5;
  id v21 = a6;
  id v19 = v11;
  id v12 = v20;
  id v13 = v11;
  id v14 = v21;
  id v15 = v10;
  -[ADCloudKitManager fetchValueForKeyFromSharedStore:completion:]( self,  "fetchValueForKeyFromSharedStore:completion:",  @"ADCloudKitShareParticipants",  v16);
}

- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 homes:(id)a5 completion:(id)a6
{
}

- (void)shareWithOwner:(id)a3 addShare:(BOOL)a4 retryCount:(unint64_t)a5 homes:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a5 < 0x10)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000981D0;
    v18[3] = &unk_1004F89D8;
    void v18[4] = self;
    BOOL v23 = a4;
    id v19 = v12;
    unint64_t v22 = a5;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(serialQueue, v18);

    goto LABEL_6;
  }

  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[ADCloudKitManager shareWithOwner:addShare:retryCount:homes:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Account not ready or giving up after failures.",  buf,  0xCu);
    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }

  if (v14)
  {
LABEL_4:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4013LL));
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0LL, 0LL, v16);
  }

- (void)saveParticipantsOnShare:(id)a3 forOwner:(id)a4 participants:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097CA4;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(serialQueue, block);
}

- (void)retryShareDeletionOperation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  [v2 restartShareDeletion];
}

- (BOOL)preferencesHaveBeenSynchronized
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyValueServerChangeToken]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)synchronize
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097C20;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)disableAndDeleteCloudSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCloudKitManager disableAndDeleteCloudSyncWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100097394;
  v8[3] = &unk_1004FD990;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)triggerVoiceProfileUploadWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1004LL));
  if (v4) {
    v4[2](v4, v3);
  }
}

- (void)downloadVoiceProfileForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[ADCloudKitManager downloadVoiceProfileForiCloudAltDSID:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s iCloudAltDSID: %@", buf, 0x16u);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097214;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (id)_verifyAccountWithManateeRequired:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    id v20 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
    __int16 v21 = 1024;
    BOOL v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Requires manatee: %d", (uint8_t *)&v19, 0x12u);
  }

  BOOL v6 = self->_usingNonManateeIdentity || !v3;
  if ((v6
     || -[CKAccountInfo supportsDeviceToDeviceEncryption]( self->_primaryAccountInfo,  "supportsDeviceToDeviceEncryption"))
    && -[CKAccountInfo accountStatus](self->_primaryAccountInfo, "accountStatus") == (id)1)
  {
    if (self->_cloudSyncEnabled)
    {
      primaryContainer = self->_primaryContainer;
      if (!primaryContainer)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCloudKitManager getContainerIDForThisDevice](self, "getContainerIDForThisDevice"));
        id v9 = sub_1002FE578(v8, 0LL);
        id v10 = (CKContainer *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = self->_primaryContainer;
        self->_primaryContainer = v10;

        if (self->_primaryAccountiCloudAltDSID) {
          -[ADCloudKitManager _trackCKContainer:accountInfo:foriCloudAltDSID:]( self,  "_trackCKContainer:accountInfo:foriCloudAltDSID:",  self->_primaryContainer,  0LL);
        }

        primaryContainer = self->_primaryContainer;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](primaryContainer, "privateCloudDatabase"));
      if (v12)
      {
        if (self->_multiUserRecordZoneInfo)
        {
          id v13 = 0LL;
LABEL_27:

          goto LABEL_28;
        }

        uint64_t v17 = 4016LL;
      }

      else
      {
        uint64_t v17 = 4015LL;
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v17));
      goto LABEL_27;
    }

    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      id v20 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Cloud sync is disabled",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v15 = 4014LL;
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      id v20 = "-[ADCloudKitManager _verifyAccountWithManateeRequired:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s CloudKit account is unavailable",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v15 = 4013LL;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v15));
LABEL_28:

  return v13;
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 completion:(id)a4
{
}

- (void)getDevicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100097128;
  v8[3] = &unk_1004FCEE8;
  id v9 = a5;
  id v7 = v9;
  -[ADCloudKitManager _devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:]( self,  "_devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:",  a3,  0LL,  v8);
}

- (void)_devicesWithAvailablePHSAssetsForLanguage:(id)a3 iCloudAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[ADCloudKitManager _devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v10)
  {
    if ([v8 length])
    {
      if (v9)
      {
        id v12 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          containerDict = self->_containerDict;
          id v14 = v12;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](containerDict, "allKeys"));
          *(_DWORD *)buf = 136315651;
          id v25 = "-[ADCloudKitManager _devicesWithAvailablePHSAssetsForLanguage:iCloudAltDSID:completion:]";
          __int16 v26 = 2113;
          id v27 = v9;
          __int16 v28 = 2112;
          id v29 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Choosing container for %{private}@ from %@",  buf,  0x20u);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADCloudKitManager _trackedCKContainerForiCloudAltDSID:]( self,  "_trackedCKContainerForiCloudAltDSID:",  v9));
      }

      else
      {
        id v16 = 0LL;
      }

      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100096D58;
      v19[3] = &unk_1004FDA30;
      id v20 = v8;
      __int16 v21 = self;
      id v22 = v16;
      id v23 = v10;
      id v18 = v16;
      dispatch_async(serialQueue, v19);
    }

    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

- (void)getDevicesWithAvailablePHSAssetsOnDeviceCheck:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100096BF4;
    v7[3] = &unk_1004FD990;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
}

- (void)_fetchManifest:(id)a3 language:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100096B98;
  v10[3] = &unk_1004EFC40;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  -[ADCloudKitManager _fetchManifest:legacy:language:completion:]( v11,  "_fetchManifest:legacy:language:completion:",  v8,  0LL,  v7,  v10);
}

- (void)_fetchManifest:(id)a3 legacy:(BOOL)a4 language:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"com.apple.assistant.backedup",  CKCurrentUserDefaultName);
  id v13 = objc_alloc(&OBJC_CLASS___CKRecordID);
  if (v7) {
    id v14 = @"PHS Language Manifest";
  }
  else {
    id v14 = @"PHS Language Manifest V2";
  }
  uint64_t v15 = -[CKRecordID initWithRecordName:zoneID:](v13, "initWithRecordName:zoneID:", v14, v12);
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = @"manifest lookup";
    if (v7) {
      uint64_t v17 = @"legacy manifest lookup";
    }
    *(_DWORD *)buf = 136315394;
    double v33 = "-[ADCloudKitManager _fetchManifest:legacy:language:completion:]";
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v18 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
  id v31 = v15;
  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  id v20 = -[CKFetchRecordsOperation initWithRecordIDs:](v18, "initWithRecordIDs:", v19);

  id v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  __int16 v26 = sub_1000966D4;
  id v27 = &unk_1004F68A0;
  __int16 v28 = v15;
  id v29 = v9;
  id v30 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v15;
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v20, "setFetchRecordsCompletionBlock:", &v24);
  -[CKFetchRecordsOperation setQualityOfService:](v20, "setQualityOfService:", 25LL, v24, v25, v26, v27);
  [v11 addOperation:v20];
}

- (void)hasEverSetLanguageCodeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCloudKitManager hasEverSetLanguageCodeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100095EC0;
  v8[3] = &unk_1004FD990;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 completion:(id)a6
{
}

- (void)forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 activity:(id)a5 iCloudAltDSID:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[ADCloudKitManager forceMultiUserSync:download:activity:iCloudAltDSID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (a3 || a4)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100095EA4;
    block[3] = &unk_1004F5C10;
    void block[4] = self;
    BOOL v22 = a3;
    BOOL v23 = a4;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    dispatch_async(serialQueue, block);
  }

  else if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 6002LL));
    (*((void (**)(id, void *))v14 + 2))(v14, v16);
  }
}

- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 completion:(id)a7
{
}

- (void)_forceMultiUserSync:(BOOL)a3 download:(BOOL)a4 retryCount:(unint64_t)a5 activity:(id)a6 iCloudAltDSID:(id)a7 completion:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (a5 < 4)
  {
    if (!-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
    {
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000952F8;
      v22[3] = &unk_1004EFCB8;
      id v23 = v15;
      id v24 = self;
      BOOL v28 = a3;
      id v26 = v16;
      BOOL v29 = a4;
      id v25 = v14;
      unint64_t v27 = a5;
      dispatch_async(serialQueue, v22);

      id v20 = v23;
      goto LABEL_12;
    }

    id v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v31 = "-[ADCloudKitManager _forceMultiUserSync:download:retryCount:activity:iCloudAltDSID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Skipping MU cloud sync on sidekick",  buf,  0xCu);
    }

    if (v16)
    {
      uint64_t v18 = 13LL;
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v31 = "-[ADCloudKitManager _forceMultiUserSync:download:retryCount:activity:iCloudAltDSID:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Too many retries. Bailing out",  buf,  0xCu);
      if (!v16) {
        goto LABEL_13;
      }
      goto LABEL_4;
    }

    if (v16)
    {
LABEL_4:
      uint64_t v18 = 6001LL;
LABEL_10:
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v18));
      (*((void (**)(id, void *))v16 + 2))(v16, v20);
LABEL_12:
    }
  }

- (void)fetchChangesWithZoneInfo:(id)a3 useSharedDatabase:(BOOL)a4
{
  id v6 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000952E8;
  block[3] = &unk_1004FC188;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(serialQueue, block);
}

- (void)handleCloudKitError:(id)a3 forZone:(id)a4 mirror:(BOOL)a5 operationType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 copy];
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000947D4;
  v17[3] = &unk_1004F7DA8;
  BOOL v23 = a5;
  id v18 = v11;
  id v19 = self;
  id v20 = v12;
  id v21 = v10;
  int64_t v22 = a6;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(serialQueue, v17);
}

- (void)handleSharingError:(id)a3
{
}

- (void)hasVoiceProfileAvailableForiCloudAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009457C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)syncSiriRMVSetting:(BOOL)a3 iCloudAltDSID:(id)a4 homeUniqueIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[AFFeatureFlags isLassoEnabled](&OBJC_CLASS___AFFeatureFlags, "isLassoEnabled"))
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[ADCloudKitManager syncSiriRMVSetting:iCloudAltDSID:homeUniqueIdentifier:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100094220;
    block[3] = &unk_1004F95C8;
    void block[4] = self;
    id v16 = v10;
    id v18 = v12;
    id v17 = v11;
    BOOL v19 = a3;
    dispatch_async(serialQueue, block);
  }
}

- (void)handleSharedDBCloudKitError:(id)a3 operationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 8)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100093D04;
    v9[3] = &unk_1004FD968;
    id v10 = v6;
    id v11 = self;
    dispatch_async(serialQueue, v9);
  }
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (void)setIsPastBuddy:(BOOL)a3
{
  self->_isPastBuddy = a3;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (void)setPushConnection:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (CKAccountInfo)primaryAccountInfo
{
  return self->_primaryAccountInfo;
}

- (void)setPrimaryAccountInfo:(id)a3
{
}

- (CKContainer)primaryContainer
{
  return self->_primaryContainer;
}

- (void)setPrimaryContainer:(id)a3
{
}

- (ADCloudKitMirroredContainer)mirroredContainer
{
  return self->_mirroredContainer;
}

- (void)setMirroredContainer:(id)a3
{
}

- (NSMutableDictionary)ckAcctInfoDict
{
  return self->_ckAcctInfoDict;
}

- (void)setCkAcctInfoDict:(id)a3
{
}

- (NSMutableDictionary)containerDict
{
  return self->_containerDict;
}

- (void)setContainerDict:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSMutableDictionary)recordZoneInfoDict
{
  return self->_recordZoneInfoDict;
}

- (void)setRecordZoneInfoDict:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo
{
  return self->_accountStatusRecordZoneInfo;
}

- (void)setAccountStatusRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo
{
  return self->_keyValueRecordZoneInfo;
}

- (void)setKeyValueRecordZoneInfo:(id)a3
{
}

- (CKNotificationListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (ADCloudKitRecordZoneInfo)voiceTriggerRecordZoneInfo
{
  return self->_voiceTriggerRecordZoneInfo;
}

- (void)setVoiceTriggerRecordZoneInfo:(id)a3
{
}

- (OS_dispatch_source)voiceTriggerSyncTimer
{
  return self->_voiceTriggerSyncTimer;
}

- (void)setVoiceTriggerSyncTimer:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo
{
  return self->_multiUserRecordZoneInfo;
}

- (void)setMultiUserRecordZoneInfo:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (unsigned)preferencesDidChangeNotificationIgnoreCount
{
  return self->_preferencesDidChangeNotificationIgnoreCount;
}

- (void)setPreferencesDidChangeNotificationIgnoreCount:(unsigned int)a3
{
  self->_preferencesDidChangeNotificationIgnoreCount = a3;
}

- (unsigned)sharedUserIdentifierNotificationIgnoreCount
{
  return self->_sharedUserIdentifierNotificationIgnoreCount;
}

- (void)setSharedUserIdentifierNotificationIgnoreCount:(unsigned int)a3
{
  self->_sharedUserIdentifierNotificationIgnoreCount = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2574;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100577B68 != -1) {
    dispatch_once(&qword_100577B68, block);
  }
  return (id)qword_100577B70;
}

+ (id)getApplicationIdentifierFromEntitlements
{
  id v2 = (void *)xpc_copy_entitlement_for_self([@"application-identifier" UTF8String]);
  BOOL v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_string)
  {
    id v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v3));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v4 = 0LL;
  }

  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "+[ADCloudKitManager getApplicationIdentifierFromEntitlements]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s application identifier = (%@)",  (uint8_t *)&v8,  0x16u);
  }

  return v4;
}

+ (void)_setAppleAccountSiriStateEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v7 = @"disabled";
    if (v4) {
      id v7 = @"enabled";
    }
    *(_DWORD *)buf = 136315394;
    id v15 = "+[ADCloudKitManager _setAppleAccountSiriStateEnabled:withCompletion:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Setting Siri Account State to %@.", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000A2450;
  v10[3] = &unk_1004EF670;
  BOOL v13 = v4;
  id v11 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v12 = v5;
  id v8 = v5;
  id v9 = v11;
  -[ACAccountStore aa_primaryAppleAccountWithCompletion:](v9, "aa_primaryAppleAccountWithCompletion:", v10);
}

@end