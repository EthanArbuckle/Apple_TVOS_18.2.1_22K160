@interface IDSGroupEncryptionController1
+ (BOOL)isKeyRatchetingEnabledForPlatform;
+ (id)sharedInstance;
- ($B1E54C86789B51D3361D4DB9054848AC)participantsReadyForKeyMaterialsForGroup:(SEL)a3;
- (BOOL)_alreadyLocked_shouldRatchetForGroup:(id)a3;
- (BOOL)_isMemberLightweight:(id)a3 lightweightStatusDict:(id)a4;
- (BOOL)_isMemberStandard:(id)a3 lightweightStatusDict:(id)a4;
- (BOOL)_isUsingAccount:(id)a3;
- (BOOL)_isValidPushToken:(id)a3;
- (BOOL)_shouldEnforceRemoteTimeout;
- (BOOL)_storePendingKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 hasValidMKM:(BOOL)a5 hasValidSKM:(BOOL)a6 forDevice:(id)a7;
- (BOOL)fakeMKMWrapping;
- (BOOL)isTestRunning;
- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController1)init;
- (IDSRealTimeEncryptionIdentity)identityForDevice;
- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice;
- (NSMutableDictionary)groupIDToKeyMaterialCache;
- (NSMutableDictionary)groupIDToStableKeyMaterialCache;
- (__SecKey)fullIdentityKey;
- (__SecKey)localPrivatePreKey;
- (__SecKey)localPublicPreKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousLocalPrivatePreKey;
- (__SecKey)previousLocalPublicPreKey;
- (__SecKey)publicKeyForPushToken:(id)a3;
- (double)_multiwayFTMessageSendTimeout;
- (double)mkmRatchetMaxWaitWindow;
- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5;
- (id)_ensureGroupStableKeyMaterialCacheForGroup:(id)a3;
- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6;
- (id)_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:(id)a3 waitingParticipants:(id)a4 addedParticipantsDiff:(id)a5 currentParticipantsPushTokens:(id)a6 participantType:(int64_t)a7;
- (id)_getSetofStandardParticipantsForGroup:(id)a3;
- (id)_localDevicePushToken;
- (id)_locked_ensureGroupMasterKeyMaterialCacheForGroup:(id)a3;
- (id)_protectedCachedKeyMaterialsForDestination:(id)a3 pushToken:(id)a4 forGroup:(id)a5 outURIs:(id *)a6 includePeers:(BOOL)a7;
- (id)_pruneInvalidAndLocalPushTokensFromTokens:(id)a3;
- (id)_pruneLightweightParticipantsForGroupID:(id)a3 forTokens:(id)a4;
- (id)activeParticipantsForGroup:(id)a3;
- (id)addPreKeyChangeHandler:(id)a3;
- (id)allParticipantsInfoForGroup:(id)a3;
- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4;
- (id)createStableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)deriveKeyMaterial:(id)a3 withInfo:(id)a4;
- (id)deriveMKI:(id)a3 withInfo:(id)a4;
- (id)deriveMKM:(id)a3 withInfo:(id)a4;
- (id)deriveMKS:(id)a3 withInfo:(id)a4;
- (id)destinationsExcludingSelfForDestinations:(id)a3;
- (id)getLightweightStatusDictForGroup:(id)a3;
- (id)getMembersForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4;
- (id)getParticipantsInfoForGroup:(id)a3;
- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3;
- (id)keyMaterialCacheToGroup:(id)a3;
- (id)masterKeyMaterialForGroup:(id)a3;
- (id)p2pNegotiatorProvider;
- (id)participantIDsForURIs:(id)a3 group:(id)a4;
- (id)participantInfoByURIForGroup:(id)a3;
- (id)publicKeys;
- (id)realTimeEncryptionPublicKeyData;
- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3;
- (id)realTimeEncryptionPublicKeyForDevice:(id)a3;
- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12;
- (id)remotePushTokensForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)stablekeyMaterialCacheToGroup:(id)a3;
- (int64_t)realTimeEncryptionPublicKeyWrappingMode;
- (int64_t)realTimeEncryptionPublicWrapModeForDevice:(id)a3;
- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5;
- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3;
- (unint64_t)localParticipantIDForGroupID:(id)a3;
- (unint64_t)participantIDForPushToken:(id)a3;
- (void)_alreadyLocked_sendRatchetedKeyMaterials:(id)a3 toAVC:(id)a4;
- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6;
- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6 waitingParticipantsTokens:(id)a7;
- (void)_dispatchRenewPrekeyTimer;
- (void)_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6;
- (void)_handleMkmExpirationTimerForGroup:(id)a3;
- (void)_handleMkmRollTimerForGroup:(id)a3;
- (void)_initializeParticipantsWaitingForInitialKeyMaterialsForGroup:(id)a3;
- (void)_locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:(id)a3 remoteToken:(id)a4 previousRemotePublicKey:(id)a5 newRemotePublicKey:(id)a6;
- (void)_mkmRollTimerFiredForGroup:(id)a3 sessionID:(id)a4;
- (void)_noteKeyMaterialDidSendToDestination:(id)a3 groupID:(id)a4 withSuccess:(BOOL)a5;
- (void)_noteKeyMaterialNotNeededForDestination:(id)a3 groupID:(id)a4;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9 isFirstSession:(BOOL)a10;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 shouldGenerateMKM:(BOOL)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10 isFirstSession:(BOOL)a11;
- (void)_resetKeyCacheForGroup:(id)a3;
- (void)_sendKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldIncludeCachedPeerKeyMaterial:(BOOL)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8;
- (void)_sendKeyRecoveryRequestForPendingKeys:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5 forDevice:(id)a6;
- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12;
- (void)_sendRenewedPrekeysToGroups;
- (void)_startKeyRecoveryForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6;
- (void)_startMkmExpirationTimer:(int)a3 forGroupID:(id)a4 block:(id)a5;
- (void)_startMkmRollTimer:(int)a3 forGroupID:(id)a4 block:(id)a5;
- (void)_stopMkmExpirationTimerForGroup:(id)a3;
- (void)_stopMkmRollTimerForGroup:(id)a3;
- (void)_updateAllActiveParticipantsInfoFromParticipants:(id)a3 standardParticipantsPushTokens:(id)a4 lightweightParticipantsPushTokens:(id)a5 groupID:(id)a6;
- (void)_updateLightweightParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3;
- (void)_updateStandardParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4;
- (void)cleanUpExpiredMasterKeyMaterial;
- (void)createKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4;
- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8;
- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5;
- (void)notifyPreKeyChange;
- (void)notifyStableKeyMaterialsReceivedForGroup:(id)a3 sessionID:(id)a4;
- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10;
- (void)processIncomingPrekeyAckForGroup:(id)a3;
- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9;
- (void)ratchetAndSendKeyMaterialsToAVCForGroup:(id)a3 sessionID:(id)a4;
- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6;
- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)removeAccountForGroup:(id)a3;
- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4;
- (void)removeExpiredPrekeys;
- (void)removeLocalActiveParticipantForGroup:(id)a3;
- (void)reportPrekeyAckStatus:(id)a3;
- (void)reportTimeDifferenceBetweenFirstPacketAndMKI:(int64_t)a3 forMKI:(id)a4 service:(id)a5 activeParticipants:(int64_t)a6;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
- (void)resetDevicePrekey;
- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3;
- (void)resetKeyMaterialLocalSentStatus:(id)a3;
- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4;
- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4;
- (void)resetMKMLocalSentStatus:(id)a3;
- (void)resetSKMLocalSentStatus:(id)a3;
- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4;
- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 groupID:(id)a5 sessionID:(id)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8;
- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 participantID:(id)a5 groupID:(id)a6 sessionID:(id)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9;
- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5;
- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)sendKeyMaterialsToLocal:(id)a3 sessionID:(id)a4;
- (void)sendKeyMaterialsToWaitingParticipantsForGroup:(id)a3 sessionID:(id)a4;
- (void)sendPendingKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 forDevice:(id)a5 fromURI:(id)a6;
- (void)sendPrekeyRequestToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)sendPrekeyRequestToGroup:(id)a3 sessionID:(id)a4;
- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4;
- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5;
- (void)setFakeMKMWrapping:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6;
- (void)setSessionController:(id)a3;
- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4;
- (void)unsubscribeEndpointsForGroup:(id)a3;
- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7;
- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
@end

@implementation IDSGroupEncryptionController1

+ (id)sharedInstance
{
  if (qword_1009BEC38 != -1) {
    dispatch_once(&qword_1009BEC38, &stru_1008FC190);
  }
  return (id)qword_1009BEC40;
}

- (IDSGroupEncryptionController1)init
{
  v111.receiver = self;
  v111.super_class = (Class)&OBJC_CLASS___IDSGroupEncryptionController1;
  v2 = -[IDSGroupEncryptionController1 init](&v111, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    v2->_isInternal = [v3 isInternalInstall];

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    prekeyAckCountForGroup = v2->_prekeyAckCountForGroup;
    v2->_prekeyAckCountForGroup = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    publicKeyForDevice = v2->_publicKeyForDevice;
    v2->_publicKeyForDevice = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToKeyMaterialCache = v2->_groupIDToKeyMaterialCache;
    v2->_groupIDToKeyMaterialCache = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToStableKeyMaterialCache = v2->_groupIDToStableKeyMaterialCache;
    v2->_groupIDToStableKeyMaterialCache = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToMKMExpirationTimer = v2->_groupIDToMKMExpirationTimer;
    v2->_groupIDToMKMExpirationTimer = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToMKMExpirationTimerBlock = v2->_groupIDToMKMExpirationTimerBlock;
    v2->_groupIDToMKMExpirationTimerBlock = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToMKMRollTimer = v2->_groupIDToMKMRollTimer;
    v2->_groupIDToMKMRollTimer = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToMKMRollTimerBlock = v2->_groupIDToMKMRollTimerBlock;
    v2->_groupIDToMKMRollTimerBlock = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToMKMRecoveryRetryCount = v2->_groupIDToMKMRecoveryRetryCount;
    v2->_groupIDToMKMRecoveryRetryCount = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToSKMRecoveryRetryCount = v2->_groupIDToSKMRecoveryRetryCount;
    v2->_groupIDToSKMRecoveryRetryCount = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToIsKeyMaterialRecoveryRunning = v2->_groupIDToIsKeyMaterialRecoveryRunning;
    v2->_groupIDToIsKeyMaterialRecoveryRunning = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToIsDeferredPreKeyRequestPending = v2->_groupIDToIsDeferredPreKeyRequestPending;
    v2->_groupIDToIsDeferredPreKeyRequestPending = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToInitialKeyMaterialDistributionTimeoutBlock = v2->_groupIDToInitialKeyMaterialDistributionTimeoutBlock;
    v2->_groupIDToInitialKeyMaterialDistributionTimeoutBlock = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    membersForGroup = v2->_membersForGroup;
    v2->_membersForGroup = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    membersLightweightStatusDict = v2->_membersLightweightStatusDict;
    v2->_membersLightweightStatusDict = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    participantsForGroup = v2->_participantsForGroup;
    v2->_participantsForGroup = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToTypeToParticipantsPushTokens = v2->_groupIDToTypeToParticipantsPushTokens;
    v2->_groupIDToTypeToParticipantsPushTokens = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    participantsInfoForGroup = v2->_participantsInfoForGroup;
    v2->_participantsInfoForGroup = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    endpointSubscriptionForGroup = v2->_endpointSubscriptionForGroup;
    v2->_endpointSubscriptionForGroup = v40;

    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lastKnownGroupIDToPushTokens = v2->_lastKnownGroupIDToPushTokens;
    v2->_lastKnownGroupIDToPushTokens = v42;

    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lastKnownAccountIDToPushTokens = v2->_lastKnownAccountIDToPushTokens;
    v2->_lastKnownAccountIDToPushTokens = v44;

    v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    participantsWaitingForKeyMaterials = v2->_participantsWaitingForKeyMaterials;
    v2->_participantsWaitingForKeyMaterials = v46;

    v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    participantsWaitingForStableKeyMaterials = v2->_participantsWaitingForStableKeyMaterials;
    v2->_participantsWaitingForStableKeyMaterials = v48;

    v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    participantsWaitingForInitialKeyMaterials = v2->_participantsWaitingForInitialKeyMaterials;
    v2->_participantsWaitingForInitialKeyMaterials = v50;

    v52 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingMasterKeyMaterials = v2->_pendingMasterKeyMaterials;
    v2->_pendingMasterKeyMaterials = v52;

    v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingStableKeyMaterials = v2->_pendingStableKeyMaterials;
    v2->_pendingStableKeyMaterials = v54;

    v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToResetKeyMaterialCacheTimer = v2->_groupIDToResetKeyMaterialCacheTimer;
    v2->_groupIDToResetKeyMaterialCacheTimer = v56;

    v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    accountIDs = v2->_accountIDs;
    v2->_accountIDs = v58;

    v60 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fromURIs = v2->_fromURIs;
    v2->_fromURIs = v60;

    v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    encryptionSequenceNumbers = v2->_encryptionSequenceNumbers;
    v2->_encryptionSequenceNumbers = v62;

    v64 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToLastMemberAddDate = v2->_groupIDToLastMemberAddDate;
    v2->_groupIDToLastMemberAddDate = v64;

    uint64_t v66 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    preKeyChangeHandlers = v2->_preKeyChangeHandlers;
    v2->_preKeyChangeHandlers = (NSMutableArray *)v66;

    v2->_lock._os_unfair_lock_opaque = 0;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKey:@"ids-rtencryption-mkm-expire-duration"]);

    if (v69)
    {
      v2->_unsigned int mkmExpireDuration = [v69 unsignedIntValue];
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int mkmExpireDuration = v2->_mkmExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v113 = mkmExpireDuration;
        _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Got kIDSRTEncryptionMKMExpireDurationBagKey %u",  buf,  8u);
      }
    }

    else
    {
      v2->_unsigned int mkmExpireDuration = 1200;
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_10069EB20();
      }
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKey:@"ids-rtencryption-mkm-roll-duration"]);

    if (v73)
    {
      v2->_unsigned int mkmRollDuration = [v73 unsignedIntValue];
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int mkmRollDuration = v2->_mkmRollDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v113 = mkmRollDuration;
        _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "Got kIDSRTEncryptionMKMRollDurationBagKey %u",  buf,  8u);
      }
    }

    else
    {
      v2->_unsigned int mkmRollDuration = 600;
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_10069EAC0();
      }
    }

    unsigned int v76 = IMGetDomainIntForKey(@"com.apple.ids", @"mkmExpirationDuration");
    unsigned int v77 = v76;
    if (v76)
    {
      v2->_unsigned int mkmExpireDuration = v76;
      v2->_unsigned int mkmRollDuration = v76 >> 1;
      v78 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v79 = v2->_mkmRollDuration;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v113 = v77;
        *(_WORD *)&v113[4] = 1024;
        *(_DWORD *)&v113[6] = v79;
        _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Got key duration value from user defaults write, set _mkmExpirationDuration: %u _mkmRollDuration: %u",  buf,  0xEu);
      }
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKey:@"ids-rtencryption-prekey-expire-duration"]);

    if (v81)
    {
      v2->_unsigned int prekeyExpireDuration = [v81 unsignedIntValue];
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int prekeyExpireDuration = v2->_prekeyExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v113 = prekeyExpireDuration;
        _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Got kIDSRTEncryptionExpireDurationBagKey %u",  buf,  8u);
      }
    }

    else
    {
      v2->_unsigned int prekeyExpireDuration = 3600;
      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_10069EA60();
      }
    }

    v84 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKey:@"ids-rtencryption-previous-prekey-expire-duration"]);

    if (v85)
    {
      v2->_unsigned int previousPrekeyExpireDuration = [v85 unsignedIntValue];
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int previousPrekeyExpireDuration = v2->_previousPrekeyExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v113 = previousPrekeyExpireDuration;
        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "Got kIDSRTEncryptionPreviousPrekeyExpireDurationBagKey %u",  buf,  8u);
      }
    }

    else
    {
      v2->_unsigned int previousPrekeyExpireDuration = 420;
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        sub_10069EA00();
      }
    }

    v88 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"ids-rtencryption-mkm-broadcast-enabled"]);

    if (v89) {
      unsigned __int8 v90 = [v89 BOOLValue];
    }
    else {
      unsigned __int8 v90 = 1;
    }
    v2->_shouldBroadcastAllValidMkMs = v90;
    int v91 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"enableMKMOverQR", 1LL);
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v93 = (void *)objc_claimAutoreleasedReturnValue([v92 objectForKey:@"ids-rtencryption-mkm-over-qr-enabled-v2"]);

    if (v93) {
      unsigned __int8 v94 = [v93 BOOLValue];
    }
    else {
      unsigned __int8 v94 = v91;
    }
    v2->_shouldSendMKMOverQR = v94;
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      if (v2->_shouldSendMKMOverQR) {
        v96 = @"enabled";
      }
      else {
        v96 = @"disabled";
      }
      unsigned int v97 = [v93 BOOLValue];
      v98 = @"NO";
      if (v97) {
        v99 = @"YES";
      }
      else {
        v99 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)v113 = v96;
      *(_WORD *)&v113[8] = 2112;
      v114 = v99;
      if (v91) {
        v98 = @"YES";
      }
      __int16 v115 = 2112;
      v116 = v98;
      _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "Sending MKM over QR %@ - serverBag: %@, defaults: %@",  buf,  0x20u);
    }

    v2->_mkmAcknowledgementTimeout = sub_10017C5A4(@"ids-rtencryption-mkm-ack-timeout", 30.0);
    v2->_preKeyRequestDelayDuration = sub_10017C5A4(@"ids-rtencryption-prekey-req-delay-duration", 3.0);
    dispatch_queue_attr_t v100 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v101 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v100);
    dispatch_queue_t v102 = dispatch_queue_create("com.apple.ids.realtimeencryptioncontroller", v101);
    realtimeEncryptionQueue = v2->_realtimeEncryptionQueue;
    v2->_realtimeEncryptionQueue = (OS_dispatch_queue *)v102;

    int v104 = IMGetDomainBoolForKey(@"com.apple.ids", @"forceKeyRecoveryLogic");
    byte_1009BEC48 = v104;
    if (v104)
    {
      v105 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        if (byte_1009BEC48) {
          v106 = @"YES";
        }
        else {
          v106 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v113 = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "forceKeyRecoveryLogic default %@ - the first incoming MKM will get dropped and we'll start the key recovery lo gic for the test...",  buf,  0xCu);
      }
    }

    int v107 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"forceTLE", 0LL);
    if ((_os_feature_enabled_impl("IDS", "TransportLevelEncryption") & 1) != 0 || v107)
    {
      v108 = -[IDSGlobalLinkP2PKeyNegotiatorController initWithIdentityProvider:groupMetadataProvider:]( objc_alloc(&OBJC_CLASS____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController),  "initWithIdentityProvider:groupMetadataProvider:",  v2,  v2);
      p2pNegotiatorProvider = v2->_p2pNegotiatorProvider;
      v2->_p2pNegotiatorProvider = (IDSGlobalLinkP2PKeyNegotiatorProvider *)v108;
    }
  }

  return v2;
}

- (id)p2pNegotiatorProvider
{
  return self->_p2pNegotiatorProvider;
}

- (id)remotePushTokensForGroup:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  a3));
  if (v4)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v22 = v4;
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "remotePushTokensForGroup: getting push token for %@",  buf,  0xCu);
          }

          uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 participantPushToken]);
          if (v12)
          {
            v13 = (void *)v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue([v10 participantPushToken]);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v24 rawToken]);
            unsigned __int8 v16 = [v14 isEqualToData:v15];

            if ((v16 & 1) == 0)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue([v10 participantPushToken]);
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v17));
              if (v18)
              {
                [v23 addObject:v18];
              }

              else
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                [v23 addObject:v19];
              }
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v7);
    }

    os_unfair_lock_unlock(lock);
    v4 = v22;
  }

  else
  {
    id v23 = &__NSArray0__struct;
  }

  return v23;
}

- (__SecKey)localPublicPreKey
{
  return -[IDSRealTimeEncryptionIdentity publicIdentity](self->_identityForDevice, "publicIdentity");
}

- (__SecKey)localPrivatePreKey
{
  return -[IDSRealTimeEncryptionIdentity fullIdentity](self->_identityForDevice, "fullIdentity");
}

- (__SecKey)previousLocalPublicPreKey
{
  return -[IDSRealTimeEncryptionIdentity publicIdentity](self->_previousIdentityForDevice, "publicIdentity");
}

- (__SecKey)previousLocalPrivatePreKey
{
  return -[IDSRealTimeEncryptionIdentity fullIdentity](self->_previousIdentityForDevice, "fullIdentity");
}

- (__SecKey)publicKeyForPushToken:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_publicKeyForDevice,  "objectForKeyedSubscript:",  a3));
  v4 = (__SecKey *)[v3 publicIdentity];

  return v4;
}

- (id)addPreKeyChangeHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  preKeyChangeHandlers = self->_preKeyChangeHandlers;
  id v6 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](preKeyChangeHandlers, "addObject:", v6);

  os_unfair_lock_unlock(&self->_lock);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10017C9F0;
  v10[3] = &unk_1008F8F70;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = objc_retainBlock(v10);

  return v8;
}

- (void)notifyPreKeyChange
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableArray copy](self->_preKeyChangeHandlers, "copy");
  os_unfair_lock_unlock(p_lock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (IDSDSessionController)sessionController
{
  id sessionController = self->_sessionController;
  if (sessionController) {
    return (IDSDSessionController *)sessionController;
  }
  else {
    return (IDSDSessionController *)(id)objc_claimAutoreleasedReturnValue( +[IDSDSessionController sharedInstance]( &OBJC_CLASS___IDSDSessionController,  "sharedInstance"));
  }
}

- (id)_localDevicePushToken
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushToken]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v3));

  return v4;
}

- (BOOL)_isUsingAccount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_accountIDs, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017CCD0;
  v8[3] = &unk_1008FC1B8;
  id v6 = v4;
  id v9 = v6;
  __int128 v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (id)_locked_ensureGroupMasterKeyMaterialCacheForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (IDSGroupMasterKeyMaterialCache *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionWithGroupID:v4]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 destinations]);
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    uint64_t v11 = v10;

    __int128 v12 = objc_alloc(&OBJC_CLASS___IDSGroupMasterKeyMaterialCache);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10017CE48;
    v17[3] = &unk_1008FC1E0;
    v17[4] = self;
    uint64_t v14 = im_primary_queue(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v5 = -[IDSGroupMasterKeyMaterialCache initWithIdentifier:initialMembershipURIs:automaticResetBlock:queue:]( v12,  "initWithIdentifier:initialMembershipURIs:automaticResetBlock:queue:",  v4,  v11,  v17,  v15);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  return v5;
}

- (id)_ensureGroupStableKeyMaterialCacheForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (IDSGroupStableKeyMaterialCache *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v5 = -[IDSGroupStableKeyMaterialCache initWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSGroupStableKeyMaterialCache),  "initWithIdentifier:",  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "setObject:forKeyedSubscript:",  v5,  v4);
  }

  return v5;
}

- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    id v11 = a4;
    os_unfair_lock_lock(&self->_lock);
    BOOL v12 = -[IDSGroupEncryptionController1 _isUsingAccount:](self, "_isUsingAccount:", v8);
    if (!v12)
    {
      uint64_t v14 = im_primary_queue(v12, v13);
      v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      v19 = sub_10017D0A0;
      v20 = &unk_1008F5F80;
      id v21 = v8;
      v22 = self;
      dispatch_async(v15, &v17);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_accountIDs,  "setObject:forKeyedSubscript:",  v8,  v10,  v17,  v18,  v19,  v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fromURIs, "setObject:forKeyedSubscript:", v11, v10);

    os_unfair_lock_unlock(&self->_lock);
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      __int128 v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "setAccount: added the accountID %@ for group %@",  buf,  0x16u);
    }
  }
}

- (void)removeAccountForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountIDs, "setObject:forKeyedSubscript:", 0LL, v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fromURIs, "setObject:forKeyedSubscript:", 0LL, v4);
    if (v5)
    {
      BOOL v6 = -[IDSGroupEncryptionController1 _isUsingAccount:](self, "_isUsingAccount:", v5);
      if (!v6)
      {
        uint64_t v8 = im_primary_queue(v6, v7);
        id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10017D444;
        v11[3] = &unk_1008F5F80;
        id v12 = v5;
        uint64_t v13 = self;
        dispatch_async(v9, v11);
      }
    }

    os_unfair_lock_unlock(&self->_lock);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "removeAccountForGroup: removed the account for group %@",  buf,  0xCu);
    }
  }
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  LOBYTE(v7) = a7;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:r equireMKM:requireSKM:",  a3,  a4,  a5,  0LL,  1LL,  a6,  v7);
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  BYTE2(v4) = 0;
  LOWORD(v4) = 257;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:s houldGenerateMKM:requireMKM:requireSKM:isFirstSession:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  v4);
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5
{
  BYTE2(v5) = 0;
  LOWORD(v5) = 1;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:s houldGenerateMKM:requireMKM:requireSKM:isFirstSession:",  a3,  a4,  0LL,  0LL,  0LL,  a5,  v5);
}

- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  LOWORD(v4) = 257;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:r equireMKM:requireSKM:isFirstSession:",  a3,  a4,  0LL,  1LL,  0LL,  1LL,  v4);
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 shouldGenerateMKM:(BOOL)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10 isFirstSession:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v20 = @"NO";
  BOOL obj = v13;
  BOOL v21 = !v13;
  BOOL v22 = v11;
  id v23 = v18;
  if (v21) {
    id v24 = @"NO";
  }
  else {
    id v24 = @"YES";
  }
  BOOL v134 = v12;
  if (v12) {
    __int16 v25 = @"YES";
  }
  else {
    __int16 v25 = @"NO";
  }
  if (v22) {
    __int128 v26 = @"YES";
  }
  else {
    __int128 v26 = @"NO";
  }
  if (a9) {
    __int128 v27 = @"YES";
  }
  else {
    __int128 v27 = @"NO";
  }
  if (a10) {
    __int128 v28 = @"YES";
  }
  else {
    __int128 v28 = @"NO";
  }
  if (a11) {
    v20 = @"YES";
  }
  id v29 = v19;
  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472LL;
  v157[2] = sub_10017E724;
  v157[3] = &unk_1008F6010;
  id v137 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"requestKeyMaterialForGroup %@ sessionID %@ shouldTrackDistribution %@ shouldIncludeCachedPeerKeyMaterial %@ shouldGenerateMKM: %@ requireMKM: %@ requireSKM: %@ toSepcificMembers %@ isFirstSession: %@",  v17,  v23,  v24,  v25,  v26,  v27,  v28,  v19,  v20));
  id v158 = v137;
  cut_dispatch_log_queue(v157);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 sessionWithUniqueID:v23]);

  v146 = (void *)v31;
  if (v31)
  {
    v138 = self;
    id v135 = v17;
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    v33 = (void **)&IMInsertBoolsToXPCDictionary_ptr;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v164 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: requireMKM: %@",  buf,  0xCu);
    }

    v136 = v23;

    v133 = v29;
    if (a9)
    {
      -[IDSGroupEncryptionController1 cleanUpExpiredMasterKeyMaterial](self, "cleanUpExpiredMasterKeyMaterial");
      p_os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&v138->_lock);
      v35 = v17;
      v36 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v138->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v17));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue([v36 currentLocalMasterKeyMaterial]);
      os_unfair_lock_unlock(&v138->_lock);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v164 = v37;
        __int16 v165 = 2112;
        v166 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: masterKeyMaterial: %@ shouldGenerateMKM: %@",  buf,  0x16u);
      }

      if (v37) {
        int v39 = v22;
      }
      else {
        int v39 = 1;
      }
      char v131 = v39;
      if (v39 == 1)
      {
        v40 = v138;
        -[IDSGroupEncryptionController1 createKeyMaterialForGroup:sessionID:]( v138,  "createKeyMaterialForGroup:sessionID:",  v17,  v136);
        if (obj) {
          -[IDSGroupEncryptionController1 _initializeParticipantsWaitingForInitialKeyMaterialsForGroup:]( v138,  "_initializeParticipantsWaitingForInitialKeyMaterialsForGroup:",  v17);
        }
      }

      else
      {
        v40 = v138;
        if (a11)
        {
          os_unfair_lock_lock(p_lock);
          v130 = v37;
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v37, "keyIndex"));
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 UUIDString]);
          unsigned __int8 v53 = [v36 hasClientReceivedMasterKeyIdentifier:v52];

          if ((v53 & 1) == 0)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v130, "keyIndex"));
            v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);
            [v36 noteClientReceiptOfMasterKeyIdentifier:v55];
          }

          v56 = (void *)objc_claimAutoreleasedReturnValue([v36 cachedMasterKeyMaterialCollection]);
          os_unfair_lock_unlock(p_lock);
          v57 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
          if ((v53 & 1) != 0)
          {
            if (v58)
            {
              *(_DWORD *)buf = 138412290;
              v164 = v130;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: no need to send local MKM %@ to AVC",  buf,  0xCu);
            }
          }

          else
          {
            if (v58)
            {
              *(_DWORD *)buf = 138412290;
              v164 = v130;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: send local MKM %@ to AVC",  buf,  0xCu);
            }

            [v146 recvKeyMaterial:v130];
            -[__CFString setIsSentToClient:](v130, "setIsSentToClient:", 1LL);
          }

          __int128 v155 = 0u;
          __int128 v156 = 0u;
          __int128 v153 = 0u;
          __int128 v154 = 0u;
          v129 = v56;
          obja = (void *)objc_claimAutoreleasedReturnValue([v56 masterKeyMaterials]);
          id v59 = [obja countByEnumeratingWithState:&v153 objects:v162 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v154;
            v140 = v36;
            do
            {
              for (i = 0LL; i != v60; i = (char *)i + 1)
              {
                if (*(void *)v154 != v61) {
                  objc_enumerationMutation(obja);
                }
                v63 = *(__CFString **)(*((void *)&v153 + 1) + 8LL * (void)i);
                if ((-[__CFString isGeneratedLocally](v63, "isGeneratedLocally") & 1) == 0)
                {
                  v64 = v33;
                  os_unfair_lock_lock(p_lock);
                  v65 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v63, "keyIndex"));
                  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 UUIDString]);
                  v67 = v36;
                  unsigned __int8 v68 = [v36 hasClientReceivedMasterKeyIdentifier:v66];

                  if ((v68 & 1) != 0)
                  {
                    os_unfair_lock_unlock(p_lock);
                    v33 = v64;
                    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64[219] RealTimeEncryptionController]);
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v164 = v63;
                      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: no need to send remote MKM %@ to AVC",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    v70 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v63, "keyIndex"));
                    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 UUIDString]);
                    [v67 noteClientReceiptOfMasterKeyIdentifier:v71];

                    os_unfair_lock_unlock(p_lock);
                    v33 = v64;
                    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64[219] RealTimeEncryptionController]);
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v164 = v63;
                      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: send remote MKM %@ to AVC",  buf,  0xCu);
                    }

                    [v146 recvKeyMaterial:v63];
                    -[__CFString setIsSentToClient:](v63, "setIsSentToClient:", 1LL);
                  }

                  v36 = v140;
                }
              }

              id v60 = [obja countByEnumeratingWithState:&v153 objects:v162 count:16];
            }

            while (v60);
          }

          v35 = v135;
          v40 = v138;
          v37 = v130;
        }
      }

      v50 = v133;
    }

    else
    {
      v50 = v29;
      char v131 = 0;
      v35 = v17;
      v40 = v138;
    }

    if (a10)
    {
      v73 = &v40->_lock;
      os_unfair_lock_lock(&v40->_lock);
      v74 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v40->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v35));
      v75 = (__CFString *)objc_claimAutoreleasedReturnValue([v74 currentLocalStableKeyMaterial]);

      unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v40->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v35));
      unsigned int v77 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v40->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v35));
      unsigned int v141 = [v77 sentToRemotes] ^ 1;

      os_unfair_lock_unlock(&v40->_lock);
      if (v75)
      {
        if (a11)
        {
          os_unfair_lock_lock(&v40->_lock);
          v139 = v75;
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v75, "keyIndex"));
          unsigned int v79 = (void *)objc_claimAutoreleasedReturnValue([v78 UUIDString]);
          unsigned __int8 v80 = [v76 hasClientReceivedStableKeyIdentifier:v79];

          if ((v80 & 1) == 0)
          {
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v139, "keyIndex"));
            v82 = (void *)objc_claimAutoreleasedReturnValue([v81 UUIDString]);
            [v76 noteClientReceiptOfStableKeyIdentifier:v82];
          }

          v83 = (void *)objc_claimAutoreleasedReturnValue([v76 cachedStableKeyMaterialCollection]);
          os_unfair_lock_unlock(v73);
          v84 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33[219] RealTimeEncryptionController]);
          BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
          if ((v80 & 1) != 0)
          {
            if (v85)
            {
              *(_DWORD *)buf = 138412290;
              v164 = v139;
              _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: no need to send local SKM %@ to framework",  buf,  0xCu);
            }
          }

          else
          {
            if (v85)
            {
              *(_DWORD *)buf = 138412290;
              v164 = v139;
              _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: send local SKM %@ to framework",  buf,  0xCu);
            }

            v87 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dictionaryRepresentation](v139, "dictionaryRepresentation"));
            v161 = v87;
            v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v161,  1LL));
            [v146 recvStableKeyMaterialForFrameworkCache:v88];

            -[__CFString setIsSentToClient:](v139, "setIsSentToClient:", 1LL);
          }

          __int128 v151 = 0u;
          __int128 v152 = 0u;
          __int128 v149 = 0u;
          __int128 v150 = 0u;
          v132 = v83;
          v89 = (void *)objc_claimAutoreleasedReturnValue([v83 stableKeyMaterials]);
          id v90 = [v89 countByEnumeratingWithState:&v149 objects:v160 count:16];
          if (v90)
          {
            id v91 = v90;
            uint64_t v92 = *(void *)v150;
            do
            {
              for (j = 0LL; j != v91; j = (char *)j + 1)
              {
                if (*(void *)v150 != v92) {
                  objc_enumerationMutation(v89);
                }
                unsigned __int8 v94 = *(__CFString **)(*((void *)&v149 + 1) + 8LL * (void)j);
                if ((-[__CFString isGeneratedLocally](v94, "isGeneratedLocally") & 1) == 0)
                {
                  os_unfair_lock_lock(v73);
                  v95 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v94, "keyIndex"));
                  v96 = (void *)objc_claimAutoreleasedReturnValue([v95 UUIDString]);
                  unsigned __int8 v97 = [v76 hasClientReceivedStableKeyIdentifier:v96];

                  if ((v97 & 1) != 0)
                  {
                    os_unfair_lock_unlock(v73);
                    v98 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v164 = v94;
                      _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: no need to send remote SKM %@ to framework",  buf,  0xCu);
                    }
                  }

                  else
                  {
                    v99 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString keyIndex](v94, "keyIndex"));
                    dispatch_queue_attr_t v100 = (void *)objc_claimAutoreleasedReturnValue([v99 UUIDString]);
                    [v76 noteClientReceiptOfStableKeyIdentifier:v100];

                    os_unfair_lock_unlock(v73);
                    v101 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v164 = v94;
                      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: send remote SKM %@ to framework",  buf,  0xCu);
                    }

                    dispatch_queue_t v102 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dictionaryRepresentation](v94, "dictionaryRepresentation"));
                    v159 = v102;
                    v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v159,  1LL));
                    [v146 recvStableKeyMaterialForFrameworkCache:v103];

                    -[__CFString setIsSentToClient:](v94, "setIsSentToClient:", 1LL);
                  }
                }
              }

              id v91 = [v89 countByEnumeratingWithState:&v149 objects:v160 count:16];
            }

            while (v91);
          }

          v35 = v135;
          v40 = v138;
          v75 = v139;
          v33 = (void **)&IMInsertBoolsToXPCDictionary_ptr;
        }
      }

      else
      {
        -[IDSGroupEncryptionController1 createStableKeyMaterialAndSendToFrameworkForGroup:sessionID:]( v40,  "createStableKeyMaterialAndSendToFrameworkForGroup:sessionID:",  v35,  v136);
      }

      v50 = v133;
      char v86 = v141;
    }

    else
    {
      char v86 = 0;
    }

    v48 = (__CFString *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _getSetofStandardParticipantsForGroup:]( v40,  "_getSetofStandardParticipantsForGroup:",  v35));
    int v104 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33[219] RealTimeEncryptionController]);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v164 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: standardDestinationSet: %@",  buf,  0xCu);
    }

    v105 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33[219] RealTimeEncryptionController]);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v50));
      *(_DWORD *)buf = 138412290;
      v164 = v106;
      _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: givenDestinationSet: %@",  buf,  0xCu);
    }

    int v107 = &v40->_lock;
    os_unfair_lock_lock(&v40->_lock);
    v108 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v40->_participantsForGroup,  "objectForKeyedSubscript:",  v35));
    id v109 = [v108 copy];
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v109));

    [v110 minusSet:v48];
    os_unfair_lock_unlock(v107);
    uint64_t v111 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](v138, "_localDevicePushToken"));
    id v23 = v136;
    if (v111)
    {
      -[__CFString removeObject:](v48, "removeObject:", v111);
      [v110 removeObject:v111];
    }

    objb = (void *)v111;
    if (a9)
    {
      v112 = (__CFString *)-[__CFString mutableCopy](v48, "mutableCopy");
      id v113 = [v110 mutableCopy];
      if ((v131 & 1) == 0)
      {
        v114 = v110;
        __int16 v115 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v50));
        -[__CFString intersectSet:](v112, "intersectSet:", v115);
        [v113 intersectSet:v115];
        v116 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33[219] RealTimeEncryptionController]);
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v164 = v115;
          _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: givenDestinationSet for MKM: %@",  buf,  0xCu);
        }

        v110 = v114;
      }

      if (-[__CFString count](v112, "count")) {
        v117 = v112;
      }
      else {
        v117 = v48;
      }
      v142 = v48;
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString allObjects](v117, "allObjects"));
      if ([v113 count]) {
        v119 = v113;
      }
      else {
        v119 = v110;
      }
      v120 = (void *)objc_claimAutoreleasedReturnValue([v119 allObjects]);
      id v121 = [v118 count];
      v122 = v118;
      v48 = v142;
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472LL;
      v147[2] = sub_10017E7F4;
      v147[3] = &unk_1008F6010;
      id v123 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"requestKeyMaterialForGroup standardParticipantsDestinations: %lu %@\nlightweightParticipantsDestinations: %lu %@\n\nstandardDestinationSet: %lu %@\ngivenStandardDestinations: %lu %@\n\nlightweightDestinationSet: %lu %@\ngivenLightweightDestinations: %lu %@",  v121,  v122,  [v120 count],  v120,  -[__CFString count](v142, "count"),  v142,  -[__CFString count](v112, "count"),  v112,  objc_msgSend(v110, "count"),  v110,  objc_msgSend(v113, "count"),  v113));
      id v148 = v123;
      cut_dispatch_log_queue(v147);
      v35 = v135;
      id v23 = v136;
      -[IDSGroupEncryptionController1 _sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:]( v138,  "_sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:",  v135,  v136,  v122,  v134,  1LL,  a10);
      if ([v120 count])
      {
        -[IDSGroupEncryptionController1 _sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:]( v138,  "_sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:",  v135,  v136,  v120,  0LL,  0LL,  1LL);
        v50 = v133;
      }

      else
      {
        v127 = v122;
        v128 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "_requestKeyMaterialForGroup: skipping _sendKeyMaterialsToGroup for lightweight participants because there ar e no lightweight participants",  buf,  2u);
        }

        v50 = v133;
        v122 = v127;
        v48 = v142;
      }
    }

    else
    {
      if ((v86 & 1) == 0)
      {
        v124 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v50));
        if (-[__CFString count](v124, "count"))
        {
          -[__CFString intersectSet:](v48, "intersectSet:", v124);
          [v110 intersectSet:v124];
        }

        v125 = v110;
        v126 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33[219] RealTimeEncryptionController]);
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v164 = v124;
          _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_DEFAULT,  "requestKeyMaterialForGroup: givenDestinationSet for SKM: %@",  buf,  0xCu);
        }

        v110 = v125;
      }

      v112 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString setByAddingObjectsFromSet:](v48, "setByAddingObjectsFromSet:", v110));
      id v113 = (id)objc_claimAutoreleasedReturnValue(-[__CFString allObjects](v112, "allObjects"));
      -[IDSGroupEncryptionController1 _sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:]( v138,  "_sendKeyMaterialsToGroup:sessionID:toSpecificMembers:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:",  v35,  v136,  v113,  v134,  0LL,  a10);
    }

    v49 = v137;
  }

  else
  {
    groupIDToKeyMaterialCache = self->_groupIDToKeyMaterialCache;
    p_groupIDToKeyMaterialCache = (id *)&self->_groupIDToKeyMaterialCache;
    v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v17));
    [v43 setNextLocalMasterKeyMaterial:0];

    v44 = (void *)objc_claimAutoreleasedReturnValue([*p_groupIDToKeyMaterialCache objectForKeyedSubscript:v17]);
    [v44 setCurrentLocalMasterKeyMaterial:0];

    v45 = (void *)objc_claimAutoreleasedReturnValue([p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17]);
    [v45 setCurrentLocalStableKeyMaterial:0];

    v46 = (void *)objc_claimAutoreleasedReturnValue([p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17]);
    [v46 setPreviousLocalStableKeyMaterial:0];

    v47 = (void *)objc_claimAutoreleasedReturnValue([p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17]);
    [v47 setSentToRemotes:0];

    v48 = (__CFString *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    v35 = v17;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR)) {
      sub_10069EB80();
    }
    v49 = v137;
    v50 = v29;
  }
}

- (id)_getSetofStandardParticipantsForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:&off_100947380]);
  id v8 = [v7 copy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersLightweightStatusDict,  "objectForKeyedSubscript:",  v4));
  id v11 = [v10 copy];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v4));
  id v13 = [v12 copy];

  os_unfair_lock_unlock(p_lock);
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10017EC34;
  v42[3] = &unk_1008FC208;
  id v15 = v9;
  id v43 = v15;
  id v16 = v11;
  id v44 = v16;
  id v17 = v14;
  v45 = v17;
  [v13 enumerateObjectsUsingBlock:v42];
  if (!-[NSMutableSet count](v17, "count"))
  {
    v34 = v17;
    id v35 = v15;
    id v36 = v13;
    id v37 = v4;
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v19 = v16;
    id v20 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v20)
    {
      id v22 = v20;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v21);
          char isKindOfClass = objc_opt_isKindOfClass(v25, v26);
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v25]);
          if ((isKindOfClass & 1) != 0)
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v25));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v28, v29);
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v28, v25);
          }
        }

        id v22 = [v19 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }

      while (v22);
    }

    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    id v15 = v35;
    id v13 = v36;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v47 = v35;
      __int16 v48 = 2112;
      v49 = v18;
      __int16 v50 = 2112;
      id v51 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "_getSetofStandardParticipantsForGroup - standardDestinationSet: %@, lightweightStatusDict:%@, participantInfo: %@",  buf,  0x20u);
    }

    id v4 = v37;
    id v17 = v34;
  }

  uint64_t v31 = v45;
  v32 = v17;

  return v32;
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9 isFirstSession:(BOOL)a10
{
  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:s houldGenerateMKM:requireMKM:requireSKM:isFirstSession:",  a3,  a4,  a5,  a6,  a7,  0LL,  v10);
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9
{
  BYTE2(v9) = 0;
  BYTE1(v9) = a9;
  LOBYTE(v9) = a8;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:s houldGenerateMKM:requireMKM:requireSKM:isFirstSession:",  a3,  a4,  a5,  a6,  a7,  0LL,  v9);
}

- (id)_pruneInvalidAndLocalPushTokensFromTokens:(id)a3
{
  id v4 = [a3 mutableCopy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  [v4 removeObject:v5];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity pushToken](self->_identityForDevice, "pushToken"));
  [v4 removeObject:v6];

  return v4;
}

- (id)_pruneLightweightParticipantsForGroupID:(id)a3 forTokens:(id)a4
{
  groupIDToTypeToParticipantsPushTokens = self->_groupIDToTypeToParticipantsPushTokens;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_100947398]);
  id v9 = [v8 copy];

  id v10 = [v6 mutableCopy];
  if ([v9 count]) {
    [v10 removeObjectsInArray:v9];
  }

  return v10;
}

- (void)_initializeParticipantsWaitingForInitialKeyMaterialsForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double mkmAcknowledgementTimeout = self->_mkmAcknowledgementTimeout;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _pruneInvalidAndLocalPushTokensFromTokens:]( self,  "_pruneInvalidAndLocalPushTokensFromTokens:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _pruneLightweightParticipantsForGroupID:forTokens:]( self,  "_pruneLightweightParticipantsForGroupID:forTokens:",  v4,  v8));
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v4;
    __int16 v25 = 2112;
    double v26 = *(double *)&v9;
    __int16 v27 = 2048;
    double v28 = mkmAcknowledgementTimeout;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Initializing list of participants waiting for initial key materials { groupID: %@, destinations: %@, timeout: %f }",  buf,  0x20u);
  }

  if ([v9 count] && mkmAcknowledgementTimeout > 2.22044605e-16)
  {
    id v11 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "setObject:forKeyedSubscript:",  v11,  v4);

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "objectForKeyedSubscript:",  v4));
    id v13 = v12;
    if (v12) {
      dispatch_block_cancel(v12);
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10017F228;
    block[3] = &unk_1008FC230;
    block[4] = self;
    id v14 = v4;
    id v22 = v14;
    objc_copyWeak(&v23, (id *)buf);
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);

    id v16 = objc_retainBlock(v15);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "setObject:forKeyedSubscript:",  v16,  v14);

    dispatch_time_t v17 = dispatch_walltime(0LL, (uint64_t)(mkmAcknowledgementTimeout * 1000000000.0));
    uint64_t v19 = im_primary_queue(v17, v18);
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_after(v17, v20, v15);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    dispatch_block_t v15 = (dispatch_block_t)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v25 = 2048;
      double v26 = mkmAcknowledgementTimeout;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "Not setting initial key material distribution timeout { destinations: %@, timeout: %f }",  buf,  0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_noteKeyMaterialDidSendToDestination:(id)a3 groupID:(id)a4 withSuccess:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v10 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "objectForKeyedSubscript:",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v9));
  id v12 = [v11 count];

  if (v12)
  {
    if (v5)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v9));
      [v13 removeObject:v8];

      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v9));
        id v16 = objc_retainBlock(v10);
        int v22 = 138413058;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        __int16 v27 = v15;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removed entry from list of participants waiting for initial key materials { groupID: %@, destination: %@, rema iningDestinations: %@, timeoutBlock: %@ }",  (uint8_t *)&v22,  0x2Au);
      }

      dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v9));
      id v18 = [v17 count];

      if (!v18)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v9);
        if (v10)
        {
          dispatch_block_cancel(v10);
LABEL_12:
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "setObject:forKeyedSubscript:",  0LL,  v9);
        }
      }
    }

    else
    {
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v9));
        uint64_t v21 = objc_retainBlock(v10);
        int v22 = 138413058;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        __int16 v27 = v20;
        __int16 v28 = 2112;
        id v29 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Failed to send to participant waiting for initial key materials { groupID: %@, destination: %@, remainingDesti nations: %@, timeoutBlock: %@ }",  (uint8_t *)&v22,  0x2Au);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v9);
      if (v10)
      {
        v10[2](v10);
        goto LABEL_12;
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_noteKeyMaterialNotNeededForDestination:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "objectForKeyedSubscript:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v7));
    [v11 removeObject:v6];

    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v7));
      id v14 = objc_retainBlock(v8);
      int v17 = 138413058;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      int v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Removed unneeded entry from list of participants waiting for initial key materials { groupID: %@, destination: % @, remainingDestinations: %@, timeoutBlock: %@ }",  (uint8_t *)&v17,  0x2Au);
    }

    dispatch_block_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  v7));
    id v16 = [v15 count];

    if (!v16)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v7);
      if (v8)
      {
        dispatch_block_cancel(v8);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock,  "setObject:forKeyedSubscript:",  0LL,  v7);
      }
    }
  }
}

- (void)_sendRenewedPrekeysToGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupSessionGroupIDs]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    id v10 = &IMInsertBoolsToXPCDictionary_ptr;
    *(void *)&__int128 v7 = 138412802LL;
    __int128 v22 = v7;
    do
    {
      id v11 = 0LL;
      id v23 = v8;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v12,  v22));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
        dispatch_block_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionWithGroupID:v12]);

        if (v15 && [v13 count])
        {
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10[219] RealTimeEncryptionController]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = v9;
            id v18 = v5;
            __int16 v19 = v10;
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
            *(_DWORD *)buf = v22;
            uint64_t v29 = v12;
            __int16 v30 = 2112;
            uint64_t v31 = v20;
            __int16 v32 = 2112;
            v33 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_sendRenewedPrekeysToGroups: group %@, session %@: %@",  buf,  0x20u);

            id v10 = v19;
            id v5 = v18;
            uint64_t v9 = v17;
            id v8 = v23;
          }

          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueID]);
          -[IDSGroupEncryptionController1 sendPublicKeyToGroup:sessionID:]( self,  "sendPublicKeyToGroup:sessionID:",  v12,  v21);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }

    while (v8);
  }
}

- (void)_dispatchRenewPrekeyTimer
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int prekeyExpireDuration = self->_prekeyExpireDuration;
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = prekeyExpireDuration;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "_dispatchRenewPrekeyTimer is called. We'll renew prekeys in %d",  buf,  8u);
  }

  dispatch_time_t v5 = dispatch_walltime(0LL, 1000000000LL * self->_prekeyExpireDuration);
  uint64_t v7 = im_primary_queue(v5, v6);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017FB78;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_after(v5, v8, block);
}

- (void)_sendKeyRecoveryRequestForPendingKeys:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5 forDevice:(id)a6
{
  BOOL v64 = a4;
  BOOL v65 = a5;
  id v7 = a3;
  id v8 = (__CFString *)a6;
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    if (v64) {
      unsigned int v11 = @"YES";
    }
    else {
      unsigned int v11 = @"NO";
    }
    if (v65) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    id v90 = v11;
    id v8 = v10;
    __int16 v91 = 2112;
    uint64_t v92 = v12;
    __int16 v93 = 2112;
    unsigned __int8 v94 = v10;
    __int16 v95 = 2048;
    id v96 = [v7 count];
    __int16 v97 = 2112;
    id v98 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_sendKeyRecoveryRequestForPendingKeys: requireMKM: %@, requireSKM: %@, pushToken: %@ pendingKeyMaterialsForRecover y: count: %lu, %@",  buf,  0x34u);
  }

  if (v8 && (id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8])) != 0)
  {
    id v14 = v13;
    dispatch_block_t v15 = v8;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSGroupSessionMessagesFromIDKey]);
    id v17 = [v16 copy];

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:IDSGroupSessionMessagesGroupIDKey]);
    id v19 = [v18 copy];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:IDSDSessionMessageSessionID]);
    id v21 = [v20 copy];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:IDSRealTimeEncryptionParticipantID]);
    id v23 = [v22 copy];

    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v90 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "_sendKeyRecoveryRequestForPendingKeys: send key recovery request to: %@",  buf,  0xCu);
    }

    uint64_t v27 = im_primary_queue(v25, v26);
    __int16 v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001801FC;
    block[3] = &unk_1008FC258;
    block[4] = self;
    v81 = v15;
    id v82 = v17;
    id v83 = v23;
    id v84 = v19;
    id v85 = v21;
    BOOL v86 = v64;
    BOOL v87 = v65;
    id v29 = v21;
    id v30 = v19;
    id v31 = v23;
    id v32 = v17;
    dispatch_block_t v33 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v28, v33);

    id v8 = v15;
  }

  else
  {
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v58 = v7;
    id v14 = v7;
    id v67 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v67)
    {
      v57 = v8;
      uint64_t v66 = *(void *)v77;
      uint64_t v62 = IDSGroupSessionMessagesFromIDKey;
      uint64_t v61 = IDSGroupSessionMessagesGroupIDKey;
      uint64_t v60 = IDSDSessionMessageSessionID;
      uint64_t v59 = IDSRealTimeEncryptionParticipantID;
      do
      {
        for (i = 0LL; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v77 != v66) {
            objc_enumerationMutation(v14);
          }
          id v35 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
          id v36 = [v35 copy];
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v35]);
          __int128 v38 = v37;
          if (v37)
          {
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v62]);
            id v40 = [v39 copy];

            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v61]);
            id v42 = [v41 copy];

            id v43 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v60]);
            id v44 = [v43 copy];

            v45 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v59]);
            id v46 = [v45 copy];

            uint64_t v49 = im_primary_queue(v47, v48);
            id v50 = v14;
            id v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v49);
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472LL;
            v68[2] = sub_100180234;
            v68[3] = &unk_1008FC258;
            v68[4] = self;
            id v69 = v36;
            id v70 = v40;
            id v71 = v46;
            id v72 = v42;
            id v73 = v44;
            BOOL v74 = v64;
            BOOL v75 = v65;
            id v52 = v44;
            id v53 = v42;
            id v54 = v46;
            id v55 = v40;
            dispatch_block_t v56 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v68);
            dispatch_async(v51, v56);

            id v14 = v50;
          }
        }

        id v67 = [v14 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }

      while (v67);
      id v8 = v57;
      id v7 = v58;
    }
  }
}

- (void)_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6
{
  BOOL v7 = a4;
  LODWORD(v8) = a3;
  id v10 = (NSMutableDictionary *)a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_realtimeEncryptionQueue);
  os_unfair_lock_lock(&self->_lock);
  if (!(_DWORD)v8) {
    goto LABEL_8;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_pendingMasterKeyMaterials, "allKeys"));
  id v13 = [v12 count];

  if (!v13)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRecoveryRetryCount,  "setObject:forKeyedSubscript:",  &off_1009473B0,  v11);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - recovered all _pendingMasterKeyMaterials!",  buf,  2u);
    }

LABEL_8:
    int v15 = 0;
    id v14 = 0LL;
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }

  id v14 = -[NSMutableDictionary copy](self->_pendingMasterKeyMaterials, "copy");
  int v15 = 1;
  if (!v7) {
    goto LABEL_14;
  }
LABEL_9:
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_pendingStableKeyMaterials, "allKeys"));
  id v18 = [v17 count];

  if (v18)
  {
    id v60 = -[NSMutableDictionary copy](self->_pendingStableKeyMaterials, "copy");
    int v19 = 1;
    goto LABEL_15;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToSKMRecoveryRetryCount,  "setObject:forKeyedSubscript:",  &off_1009473B0,  v11);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - recovered all _pendingStableKeyMaterials!",  buf,  2u);
  }

LABEL_14:
  id v60 = 0LL;
  int v19 = 0;
LABEL_15:
  id v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRecoveryRetryCount,  "objectForKeyedSubscript:",  v11));
  unsigned int v59 = [v21 unsignedCharValue];

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToSKMRecoveryRetryCount,  "objectForKeyedSubscript:",  v11));
  unsigned int v58 = [v22 unsignedCharValue];

  os_unfair_lock_unlock(&self->_lock);
  if ((v15 | v19) == 1)
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v24 = @"NO";
      *(_DWORD *)buf = 138413826;
      id v72 = v10;
      if (v15) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      BOOL v74 = v25;
      __int16 v73 = 2112;
      if (v19) {
        __int128 v24 = @"YES";
      }
      __int16 v75 = 2112;
      __int128 v76 = v24;
      __int16 v77 = 2112;
      id v78 = v14;
      __int16 v79 = 1024;
      unsigned int v80 = v59;
      __int16 v81 = 2112;
      id v82 = v60;
      __int16 v83 = 1024;
      unsigned int v84 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - pushtoken: %@, needMKMRecoveryRequest: %@, needSKMR ecoveryRequest: %@, current pendingMasterKeyMaterials %@, MKMRecoveryRetryCount %u, current pendingStableKeyMate rials: %@, SKMRecoveryRetryCount: %u",  buf,  0x40u);
    }

    if ((v15 & v19 & 1) != 0)
    {
      if (v10)
      {
        -[IDSGroupEncryptionController1 _sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:]( self,  "_sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:",  v14,  1LL,  1LL,  v10);
        char v26 = v59;
      }

      else
      {
        char v53 = (char)v8;
        BOOL v54 = v7;
        id v55 = self;
        id v57 = v11;
        id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v31 = (__CFString *)[v14 copy];
        id v32 = (__CFString *)[v60 copy];
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        id v56 = v14;
        id v33 = v14;
        id v34 = [v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v67;
          do
          {
            for (i = 0LL; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v67 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
              __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:v38]);

              if (v39)
              {
                id v40 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v38]);
                id v41 = [v40 copy];
                -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v41, v38);

                -[__CFString removeObjectForKey:](v31, "removeObjectForKey:", v38);
                -[__CFString removeObjectForKey:](v32, "removeObjectForKey:", v38);
              }
            }

            id v35 = [v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
          }

          while (v35);
        }

        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v72 = v8;
          __int16 v73 = 2112;
          BOOL v74 = v31;
          __int16 v75 = 2112;
          __int128 v76 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - commonKeyMaterialsForRecovery: %@, MKMRecoveryD ictionary: %@, SKMRecoveryDictionary: %@",  buf,  0x20u);
        }

        self = v55;
        -[IDSGroupEncryptionController1 _sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:]( v55,  "_sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:",  v8,  1LL,  1LL,  0LL);
        LOBYTE(v7) = v54;
        char v26 = v59;
        if (v31 && -[__CFString count](v31, "count")) {
          -[IDSGroupEncryptionController1 _sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:]( v55,  "_sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:",  v31,  1LL,  0LL,  0LL);
        }
        id v10 = 0LL;
        id v14 = v56;
        if (v32 && -[__CFString count](v32, "count")) {
          -[IDSGroupEncryptionController1 _sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:]( v55,  "_sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:",  v32,  0LL,  1LL,  0LL);
        }

        id v11 = v57;
        LOBYTE(v8) = v53;
      }

      unsigned __int8 v27 = v26 + 1;
      id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v27));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRecoveryRetryCount,  "setObject:forKeyedSubscript:",  v43,  v11);

      unsigned __int8 v29 = v58 + 1;
      id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v58 + 1)));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToSKMRecoveryRetryCount,  "setObject:forKeyedSubscript:",  v44,  v11);
    }

    else if (v15)
    {
      unsigned __int8 v27 = v59 + 1;
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  (v59 + 1)));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRecoveryRetryCount,  "setObject:forKeyedSubscript:",  v28,  v11);

      -[IDSGroupEncryptionController1 _sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:]( self,  "_sendKeyRecoveryRequestForPendingKeys:requireMKM:requireSKM:forDevice:",  v14,  1LL,  0LL,  v10);
      unsigned __int8 v29 = v58;
    }

    else
    {
      if (!v19)
      {
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v48 = "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - doesn't needMKMRecoveryRequest or needSKMRecoveryRequest";
          uint64_t v49 = v47;
          uint32_t v50 = 2;
          goto LABEL_58;
        }

- (void)_startKeyRecoveryForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_realtimeEncryptionQueue);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToIsKeyMaterialRecoveryRunning,  "objectForKeyedSubscript:",  v11));
  unsigned __int8 v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToIsKeyMaterialRecoveryRunning,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v11);
    dispatch_time_t v14 = dispatch_walltime(0LL, 3000000000LL);
    realtimeEncryptionQueue = (dispatch_queue_s *)self->_realtimeEncryptionQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100180BB4;
    v16[3] = &unk_1008FC280;
    v16[4] = self;
    BOOL v19 = a3;
    BOOL v20 = a4;
    id v17 = v10;
    id v18 = v11;
    dispatch_after(v14, realtimeEncryptionQueue, v16);
  }
}

- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = (IDSRealTimeEncryptionIdentity *)a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v79 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "createRealTimeEncryptionFullIdentity for the token %@",  buf,  0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    p_identityForDevice = &self->_identityForDevice;
    id v11 = self->_identityForDevice;
    if (v11)
    {
      uint64_t v12 = v11;
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity pushToken](v11, "pushToken"));
      unsigned int v14 = [v13 isEqual:v6];
      char v15 = v14;
      int v16 = v14 ^ 1;

      if (!-[IDSRealTimeEncryptionIdentity isExpired](v12, "isExpired") && (v16 & 1) == 0)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v79 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "createRealTimeEncryptionFullIdentity - found the existed one %@",  buf,  0xCu);
        }

        os_unfair_lock_unlock(p_lock);
        if (v7)
        {
          uint64_t v20 = im_primary_queue(v18, v19);
          id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001813FC;
          block[3] = &unk_1008F8F70;
          __int128 v76 = v12;
          id v77 = v7;
          dispatch_block_t v22 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
          dispatch_async(v21, v22);
        }

        id v23 = v12;
        uint64_t v12 = v23;
        goto LABEL_34;
      }

      if (((-[IDSRealTimeEncryptionIdentity isExpired](v12, "isExpired") | v16) & 1) != 0)
      {
        char v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) != 0)
        {
          if (v27)
          {
            *(_DWORD *)buf = 138412290;
            __int16 v79 = v12;
            __int16 v28 = "createRealTimeEncryptionFullIdentity - the previous one %@ is expired";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
          }
        }

        else if (v27)
        {
          *(_DWORD *)buf = 138412290;
          __int16 v79 = v12;
          __int16 v28 = "createRealTimeEncryptionFullIdentity - push token doesn't match, generating a new identity {old: %@}";
          goto LABEL_25;
        }

        previousIdentityForDevice = self->_previousIdentityForDevice;
        self->_previousIdentityForDevice = v12;

        uint64_t v12 = objc_alloc_init(&OBJC_CLASS___IDSRealTimeEncryptionIdentity);
        -[IDSRealTimeEncryptionIdentity setIsTestRunning:]( v12,  "setIsTestRunning:",  -[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"));
        objc_storeStrong((id *)&self->_identityForDevice, v12);
        dispatch_time_t v32 = dispatch_walltime(0LL, 1000000000LL * self->_previousPrekeyExpireDuration);
        uint64_t v34 = im_primary_queue(v32, v33);
        id v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v34);
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_1001814B4;
        v74[3] = &unk_1008F6010;
        v74[4] = self;
        dispatch_after(v32, v35, v74);

        goto LABEL_27;
      }
    }

    else
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___IDSRealTimeEncryptionIdentity);
      -[IDSRealTimeEncryptionIdentity setIsTestRunning:]( v12,  "setIsTestRunning:",  -[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"));
      objc_storeStrong((id *)&self->_identityForDevice, v12);
    }

    unsigned __int8 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v79 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "createRealTimeEncryptionFullIdentity - we'll generate the new pre-key %@",  buf,  0xCu);
    }

LABEL_27:
    double v36 = ids_monotonic_time(v30);
    -[IDSRealTimeEncryptionIdentity setPushToken:](v12, "setPushToken:", v6);
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    LODWORD(v38) = self->_prekeyExpireDuration;
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v37 dateByAddingTimeInterval:(double)v38]);
    -[IDSRealTimeEncryptionIdentity setExpirationDate:](v12, "setExpirationDate:", v39);

    -[IDSRealTimeEncryptionIdentity setWrapMode:](v12, "setWrapMode:", 1LL);
    if (-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
    {
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = *p_identityForDevice;
        id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](v12, "expirationDate"));
        *(_DWORD *)buf = 138478083;
        __int16 v79 = v41;
        __int16 v80 = 2112;
        double v81 = *(double *)&v42;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Created the full identity %{private}@ will be expired at %@",  buf,  0x16u);
      }

      os_unfair_lock_unlock(p_lock);
      if (v7)
      {
        uint64_t v45 = im_primary_queue(v43, v44);
        unsigned __int8 v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v45);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_100181530;
        v72[3] = &unk_1008F6330;
        id v73 = v7;
        dispatch_block_t v47 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v72);
        dispatch_async(v46, v47);
      }

      identityForDevice = *p_identityForDevice;
LABEL_33:
      id v23 = identityForDevice;
LABEL_34:
      uint64_t v25 = v23;
LABEL_60:

      goto LABEL_61;
    }

    CFTypeRef cf = 0LL;
    if (qword_1009BEC58 != -1) {
      dispatch_once(&qword_1009BEC58, &stru_1008FC2A0);
    }
    if (off_1009BEC50 && (uint64_t v49 = off_1009BEC50(0LL, &cf)) != 0 && !cf)
    {
      uint32_t v50 = (const void *)v49;
      if (qword_1009BEC68 != -1) {
        dispatch_once(&qword_1009BEC68, &stru_1008FC2C0);
      }
      if (off_1009BEC60)
      {
        uint64_t v51 = off_1009BEC60(v50);
        if (v51)
        {
          id v52 = (const void *)v51;
          -[IDSRealTimeEncryptionIdentity setFullIdentity:](v12, "setFullIdentity:", v50);
          -[IDSRealTimeEncryptionIdentity setPublicIdentity:](v12, "setPublicIdentity:", v52);
          CFRelease(v50);
          CFRelease(v52);
          CFTypeRef v53 = cf;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          double v54 = ids_monotonic_time(v53);
          id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            id v56 = *p_identityForDevice;
            id v57 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](v56, "expirationDate"));
            *(_DWORD *)buf = 138478339;
            __int16 v79 = v56;
            __int16 v80 = 2048;
            double v81 = v54 - v36;
            __int16 v82 = 2112;
            __int16 v83 = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Created the full identity %{private}@, duration %f seconds, will be expired at %@",  buf,  0x20u);
          }

          os_unfair_lock_unlock(&self->_lock);
          if (v7)
          {
            uint64_t v60 = im_primary_queue(v58, v59);
            uint64_t v61 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v60);
            __int128 v66 = _NSConcreteStackBlock;
            uint64_t v67 = 3221225472LL;
            __int128 v68 = sub_100181594;
            __int128 v69 = &unk_1008F6330;
            id v70 = v7;
            dispatch_block_t v62 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  &v66);
            dispatch_async(v61, v62);
          }

          -[IDSGroupEncryptionController1 _dispatchRenewPrekeyTimer]( self,  "_dispatchRenewPrekeyTimer",  v66,  v67,  v68,  v69);
          identityForDevice = self->_identityForDevice;
          goto LABEL_33;
        }
      }

      char v64 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_10069ECB0();
      }

      CFRelease(v50);
    }

    else
    {
      id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
        sub_10069EC3C((uint64_t *)&cf, v63);
      }
    }

    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    os_unfair_lock_unlock(p_lock);
    uint64_t v25 = 0LL;
    goto LABEL_60;
  }

  __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10069EC10();
  }

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v25 = 0LL;
LABEL_61:

  return v25;
}

- (int64_t)realTimeEncryptionPublicKeyWrappingMode
{
  return (id)-[IDSRealTimeEncryptionIdentity wrapMode](self->_identityForDevice, "wrapMode") == (id)1;
}

- (id)realTimeEncryptionPublicKeyData
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "realTimeEncryptionPublicKeyData - trying to get my device identity",  (uint8_t *)&v22,  2u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v5 = self->_identityForDevice;
  os_unfair_lock_unlock(&self->_lock);
  if (!v5)
  {
    dispatch_time_t v5 = (IDSRealTimeEncryptionIdentity *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Need to create the full identity for this device first...",  (uint8_t *)&v22,  2u);
    }

    goto LABEL_32;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](v5, "expirationDate"));
  id v8 = [v6 compare:v7];

  if (v8 == (id)1)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Identity is expired. Need to roll the fresh key.",  (uint8_t *)&v22,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity pushToken](v5, "pushToken"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 createRealTimeEncryptionFullIdentityForDevice:completionBlock:]( self,  "createRealTimeEncryptionFullIdentityForDevice:completionBlock:",  v10,  0LL));

    dispatch_time_t v5 = (IDSRealTimeEncryptionIdentity *)v11;
    if (!v11)
    {
      dispatch_time_t v5 = (IDSRealTimeEncryptionIdentity *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
        sub_10069ED10();
      }
      goto LABEL_32;
    }
  }

  if (!-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
  {
    os_unfair_lock_lock(&self->_lock);
    if (-[IDSRealTimeEncryptionIdentity publicIdentity](v5, "publicIdentity"))
    {
      char v15 = 0LL;
LABEL_16:
      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity publicKeyData](v5, "publicKeyData"));
      os_unfair_lock_unlock(p_lock);
      if (v15) {
        CFRelease(v15);
      }
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Returning public key data: %@",  (uint8_t *)&v22,  0xCu);
      }

      unsigned int v14 = v16;
      goto LABEL_21;
    }

    if (qword_1009BEC78 != -1) {
      dispatch_once(&qword_1009BEC78, &stru_1008FC2E0);
    }
    if (off_1009BEC70)
    {
      uint64_t v19 = ((uint64_t (*)(__SecKey *))off_1009BEC70)(-[IDSRealTimeEncryptionIdentity fullIdentity](v5, "fullIdentity"));
      if (v19)
      {
        char v15 = (const void *)v19;
        -[IDSRealTimeEncryptionIdentity setPublicIdentity:](v5, "setPublicIdentity:", v19);
        goto LABEL_16;
      }
    }

    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10069ED3C(v5, v20);
    }

    os_unfair_lock_unlock(p_lock);
LABEL_32:
    uint64_t v18 = 0LL;
    goto LABEL_33;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity publicKeyData](v5, "publicKeyData"));
  unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Returning public key data: %@",  (uint8_t *)&v22,  0xCu);
  }

  unsigned int v14 = v12;
LABEL_21:
  uint64_t v18 = v14;

  dispatch_time_t v5 = v18;
LABEL_33:

  return v18;
}

- (void)processIncomingPrekeyAckForGroup:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 intValue] + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_prekeyAckCountForGroup,  "setObject:forKeyedSubscript:",  v6,  v4);

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current ACK'd number of prekey: %@ for group: %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)reportPrekeyAckStatus:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Report the prekey ACK'd (final count: %@) result for group: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_prekeyAckCountForGroup, "removeObjectForKey:", v4);
}

- (void)_resetKeyCacheForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "setObject:forKeyedSubscript:",  0LL,  v4);
    encryptionSequenceNumbers = self->_encryptionSequenceNumbers;
    if (encryptionSequenceNumbers) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)encryptionSequenceNumbers, v4);
    }
    os_unfair_lock_unlock(&self->_lock);
    groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
    if (groupIDToResetKeyMaterialCacheTimer) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)groupIDToResetKeyMaterialCacheTimer, v4);
    }
  }

  else
  {
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[IDSGroupEncryptionController1 _resetKeyCacheForGroup:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s invalid groupID, return",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4
{
  uint64_t v6 = (NSMutableDictionary *)a3;
  if (v6)
  {
    -[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]( self,  "resetKeyMaterialCacheTimerIfNeeded:",  v6);
    if (a4)
    {
      int v7 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
      uint64_t v9 = im_primary_queue(v7, v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      uint64_t v20 = sub_100181FA4;
      id v21 = &unk_1008FC308;
      __int16 v11 = v6;
      int v22 = v11;
      id v23 = self;
      id v12 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v7,  "initWithQueue:interval:repeats:handlerBlock:",  v10,  a4,  0LL,  &v18);

      if (v12) {
        CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToResetKeyMaterialCacheTimer, v11, v12);
      }
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController",  v18,  v19,  v20,  v21));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v26 = 2112;
        BOOL v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s dispatched keyMaterial reset timer for group: %@",  buf,  0x16u);
      }

      unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v26 = 2112;
        BOOL v27 = groupIDToResetKeyMaterialCacheTimer;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s _groupIDToResetKeyMaterialCacheTimer: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v26 = 2112;
        BOOL v27 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s interval is 0, directly reset key cache for group: %@",  buf,  0x16u);
      }

      -[IDSGroupEncryptionController1 _resetKeyCacheForGroup:](self, "_resetKeyCacheForGroup:", v6);
    }
  }

  else
  {
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s invalid groupID, return", buf, 0xCu);
    }
  }
}

- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  if (v4)
  {
    groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
    if (groupIDToResetKeyMaterialCacheTimer
      && (uint64_t v6 = (id)CFDictionaryGetValue( (CFDictionaryRef)groupIDToResetKeyMaterialCacheTimer,  v4)) != 0LL)
    {
      int v7 = v6;
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s keyMaterial reset timer invalidated for group: %@",  (uint8_t *)&v15,  0x16u);
      }

      [v7 invalidate];
    }

    else
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%s keyMaterial reset timer not found for group: %@",  (uint8_t *)&v15,  0x16u);
      }
    }

    uint64_t v9 = self->_groupIDToResetKeyMaterialCacheTimer;
    if (v9) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)v9, v4);
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = self->_groupIDToResetKeyMaterialCacheTimer;
      int v15 = 136315394;
      int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      id v12 = "%s _groupIDToResetKeyMaterialCacheTimer: %@";
      unsigned __int8 v13 = v10;
      uint32_t v14 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
      id v12 = "%s invalid groupID!";
      unsigned __int8 v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_15;
    }
  }
}

- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4
{
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_encryptionSequenceNumbers,  "objectForKeyedSubscript:",  v6));
  id v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v8 >= a3)
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ignoring encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)",  (uint8_t *)&v11,  0x20u);
    }
  }

  else
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "storing encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)",  (uint8_t *)&v11,  0x20u);
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
    if (v9)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_encryptionSequenceNumbers, v6, v9);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10069EDC0();
    }
  }
}

- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_encryptionSequenceNumbers,  "objectForKeyedSubscript:",  v4));
  id v6 = [v5 unsignedLongLongValue];

  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "returning stored encryption sequence number %llu for groupID %@ (Client <- *IDSD)",  (uint8_t *)&v9,  0x16u);
  }

  return (unint64_t)v6;
}

- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  __int16 v15 = (IDSGroupEncryptionController1 *)a3;
  id v16 = a4;
  __int16 v17 = (IDSGroupEncryptionController1 *)a5;
  uint64_t v18 = (IDSGroupEncryptionController1 *)a6;
  id v19 = a7;
  uint64_t v20 = (IDSGroupEncryptionController1 *)a8;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  unsigned int v84 = v19;
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sessionWithUniqueID:v19]);

  id v85 = v20;
  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 URIByAddingOptionalPushToken:]( v17,  "URIByAddingOptionalPushToken:",  v16));
    unsigned __int8 v24 = [v22 destinationsContainFromURI:v23];

    if ((v24 & 1) == 0)
    {
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v98 = v18;
        __int16 v99 = 2112;
        dispatch_queue_attr_t v100 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: We'll drop this pre-key message for group %@ since %@ is not in this group!",  buf,  0x16u);
      }

      BOOL v32 = 0;
      goto LABEL_46;
    }
  }

  __int16 v82 = v18;
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478595;
    id v98 = v15;
    __int16 v99 = 2112;
    dispatch_queue_attr_t v100 = v20;
    __int16 v101 = 2112;
    CFTypeRef v102 = v16;
    __int16 v103 = 2048;
    int64_t v104 = a9;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: public key: %{private}@ serverDate: %@ pushToken: %@ wrapMode: %llu",  buf,  0x2Au);
  }

  -[IDSGroupEncryptionController1 removeExpiredPrekeys](self, "removeExpiredPrekeys");
  os_unfair_lock_lock(&self->_lock);
  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_publicKeyForDevice, "objectForKeyedSubscript:", v16));
  __int16 v83 = v15;
  if (v26)
  {
    __int16 v28 = (os_log_s *)v26;
    LODWORD(v27) = self->_prekeyExpireDuration;
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 dateByAddingTimeInterval:]( v20,  "dateByAddingTimeInterval:",  (double)v27));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s expirationDate](v28, "expirationDate"));
    id v31 = [v29 compare:v30];

    if (v31 == (id)-1LL)
    {
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue(-[os_log_s publicIdentityData](v28, "publicIdentityData"));
        *(_DWORD *)buf = 138478595;
        id v98 = v83;
        __int16 v99 = 2113;
        dispatch_queue_attr_t v100 = v42;
        __int16 v101 = 2112;
        CFTypeRef v102 = v17;
        __int16 v103 = 2112;
        int64_t v104 = (int64_t)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: dropping the stale public key: %{private}@ already have new public key: %{priv ate}@ fromURI: %@ pushToken: %@",  buf,  0x2Au);
      }

      os_unfair_lock_unlock(&self->_lock);
      BOOL v32 = 0;
      __int16 v15 = v83;
      goto LABEL_46;
    }

    __int16 v15 = v83;
    uint64_t v20 = v85;
  }

  else
  {
    __int16 v28 = objc_alloc_init(&OBJC_CLASS___IDSRealTimeEncryptionIdentity);
    -[os_log_s setIsTestRunning:]( v28,  "setIsTestRunning:",  -[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_publicKeyForDevice,  "setObject:forKeyedSubscript:",  v28,  v16);
  }

  -[os_log_s setPushToken:](v28, "setPushToken:", v16);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 unprefixedURI](v17, "unprefixedURI"));
  -[os_log_s setFromID:](v28, "setFromID:", v33);

  -[os_log_s setWrapMode:](v28, "setWrapMode:", a9 == 1);
  if (!-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
  {
    CFTypeRef cf = 0LL;
    keys[0] = (void *)kSecAttrKeyType;
    keys[1] = (void *)kSecAttrKeyClass;
    values[0] = (void *)kSecAttrKeyTypeECSECPrimeRandom;
    values[1] = (void *)kSecAttrKeyClassPublic;
    CFDictionaryRef v39 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  2LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (qword_1009BEC88 != -1) {
      dispatch_once(&qword_1009BEC88, &stru_1008FC328);
    }
    if (off_1009BEC80) {
      id v40 = (const void *)off_1009BEC80(v83, v39, &cf);
    }
    else {
      id v40 = 0LL;
    }
    CFRelease(v39);
    if (v40) {
      BOOL v43 = cf == 0LL;
    }
    else {
      BOOL v43 = 0;
    }
    BOOL v32 = v43;
    if (v43)
    {
      id v78 = v17;
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s publicIdentityData](v28, "publicIdentityData"));
      unsigned __int8 v45 = [v44 isEqualToData:v83];

      if ((v45 & 1) != 0)
      {
        unsigned __int8 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v80 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue(-[os_log_s publicIdentityData](v28, "publicIdentityData"));
          __int128 v76 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s fromID](v28, "fromID"));
          uint64_t v47 = IDSLoggableDescriptionForHandleOnService(v76, 0LL);
          __int16 v75 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue(v47);
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s pushToken](v28, "pushToken"));
          uint64_t v49 = objc_claimAutoreleasedReturnValue(-[os_log_s expirationDate](v28, "expirationDate"));
          *(_DWORD *)buf = 138478595;
          id v98 = v80;
          __int16 v99 = 2112;
          dispatch_queue_attr_t v100 = v75;
          __int16 v101 = 2112;
          CFTypeRef v102 = v48;
          __int16 v103 = 2112;
          int64_t v104 = v49;
          uint32_t v50 = (void *)v49;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: received the same key %{private}@ fromID %@ pushToken %@ expiration %@",  buf,  0x2Au);
        }

        double v81 = 0LL;
      }

      else
      {
        double v81 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s publicIdentityData](v28, "publicIdentityData"));
        -[os_log_s setPublicIdentityData:](v28, "setPublicIdentityData:", v83);
        -[os_log_s setPublicIdentity:](v28, "setPublicIdentity:", v40);
        LODWORD(v53) = self->_prekeyExpireDuration;
        unsigned __int8 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 dateByAddingTimeInterval:]( v85,  "dateByAddingTimeInterval:",  (double)v53));
        -[os_log_s setExpirationDate:](v28, "setExpirationDate:", v46);
      }

      __int16 v17 = v78;
      double v54 = v82;

      CFRelease(v40);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      -[IDSGroupEncryptionController1 _locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:remoteToken:previousRemotePublicKey:newRemotePublicKey:]( self,  "_locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:remoteToken:previousRemotePublicKey:newRemotePublicKey:",  v82,  v16,  v81,  v83);
      os_unfair_lock_unlock(&self->_lock);
      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue(-[os_log_s publicIdentityData](v28, "publicIdentityData"));
        __int16 v79 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s fromID](v28, "fromID"));
        uint64_t v57 = IDSLoggableDescriptionForHandleOnService(v79, 0LL);
        id v77 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue(v57);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s pushToken](v28, "pushToken"));
        *(_DWORD *)buf = 138478339;
        id v98 = v56;
        __int16 v99 = 2112;
        dispatch_queue_attr_t v100 = v77;
        __int16 v101 = 2112;
        CFTypeRef v102 = v58;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: done: %{private}@ fromID %@ pushToken %@",  buf,  0x20u);

        double v54 = v82;
      }

      uint64_t v61 = im_primary_queue(v59, v60);
      dispatch_block_t v62 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v61);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100182F6C;
      block[3] = &unk_1008F8D18;
      void block[4] = self;
      id v63 = v54;
      id v90 = v63;
      id v64 = v84;
      id v91 = v64;
      id v92 = v16;
      __int16 v93 = v17;
      dispatch_block_t v65 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
      dispatch_async(v62, v65);

      uint64_t v68 = im_primary_queue(v66, v67);
      __int128 v69 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v68);
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472LL;
      v86[2] = sub_100182F80;
      v86[3] = &unk_1008F5F58;
      v86[4] = self;
      id v70 = v63;
      BOOL v87 = v70;
      id v71 = v64;
      id v88 = v71;
      dispatch_block_t v72 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v86);
      dispatch_async(v69, v72);

      id v73 = v71;
      uint64_t v18 = v82;
      -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v70,  v73);
      -[IDSGroupEncryptionController1 notifyPreKeyChange](self, "notifyPreKeyChange");

      __int16 v15 = v83;
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218499;
        id v98 = self;
        __int16 v99 = 2113;
        dispatch_queue_attr_t v100 = v18;
        __int16 v101 = 2112;
        CFTypeRef v102 = cf;
        _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "%p: Couldn't create the public identity for the group %{private}@ (error: %@)",  buf,  0x20u);
      }

      __int16 v15 = v83;
      if (cf) {
        CFRelease(cf);
      }
    }

- (void)_locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:(id)a3 remoteToken:(id)a4 previousRemotePublicKey:(id)a5 newRemotePublicKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  if (v14)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v10));
    unsigned int v16 = [v15 containsObject:v14];

    int v17 = v16 ^ 1;
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    int v20 = 1;
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }

  int v17 = 1;
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v10));
  unsigned int v19 = [v18 containsObject:v11];

  int v20 = v19 ^ 1;
  if (!v12) {
    goto LABEL_17;
  }
LABEL_7:
  if (v13)
  {
    unsigned __int8 v21 = [v12 isEqualToData:v13];
    if (((v17 | v20) & 1) == 0 && (v21 & 1) == 0)
    {
      int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "setRealTimeEncryptionPublicKey: will re-send key materials due to detected rolled identity for push token %@",  (uint8_t *)&v25,  0xCu);
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v10));
      unsigned __int8 v24 = (NSMutableArray *)[v23 mutableCopy];

      if ((-[NSMutableArray containsObject:](v24, "containsObject:", v11) & 1) == 0)
      {
        if (!v24) {
          unsigned __int8 v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }
        -[NSMutableArray addObject:](v24, "addObject:", v11);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "setObject:forKeyedSubscript:",  v24,  v10);
      }
    }
  }

- (id)realTimeEncryptionPublicKeyForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "realTimeEncryptionPublicKeyForDevice: %@",  (uint8_t *)&v11,  0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_publicKeyForDevice,  "objectForKeyedSubscript:",  v4));
  if (v7)
  {
    os_unfair_lock_unlock(p_lock);
    id v8 = v7;
  }

  else
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10069EE40();
    }

    os_unfair_lock_unlock(p_lock);
  }

  return v7;
}

- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "realTimeEncryptionPublicKeyDataForDevice: %@",  (uint8_t *)&v12,  0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_publicKeyForDevice,  "objectForKeyedSubscript:",  v4));
  id v8 = v7;
  if (v7)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 publicKeyData]);
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10069EEA0();
    }

    int v9 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (int64_t)realTimeEncryptionPublicWrapModeForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "realTimeEncryptionPublicWrapModeForDevice: %@",  (uint8_t *)&v11,  0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_publicKeyForDevice,  "objectForKeyedSubscript:",  v4));
  if (v7)
  {
    os_unfair_lock_unlock(p_lock);
    int64_t v8 = (int64_t)[v7 wrapMode];
  }

  else
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10069EF00();
    }

    os_unfair_lock_unlock(p_lock);
    int64_t v8 = -1LL;
  }

  return v8;
}

- (id)publicKeys
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  -[IDSGroupEncryptionController1 removeExpiredPrekeys](self, "removeExpiredPrekeys");
  os_unfair_lock_lock(&self->_lock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_publicKeyForDevice, "allKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_publicKeyForDevice,  "objectForKeyedSubscript:",  v9));
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publicKeyData]);
        -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v11, v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFMutableDictionaryRef v19 = Mutable;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "publicKeys: %@", buf, 0xCu);
  }

  return Mutable;
}

- (void)sendPrekeyRequestToGroup:(id)a3 sessionID:(id)a4
{
  membersForGroup = self->_membersForGroup;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](membersForGroup, "objectForKeyedSubscript:", v8));
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v11));
  -[IDSGroupEncryptionController1 sendPrekeyRequestToDestination:group:sessionID:]( self,  "sendPrekeyRequestToDestination:group:sessionID:",  v10,  v8,  v7);
}

- (void)sendPrekeyRequestToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34[0] = IDSFanoutMessageGroupIDKey;
  v34[1] = IDSDSessionMessageSessionID;
  v35[0] = v9;
  v35[1] = v10;
  v34[2] = IDSDSessionMessageRealTimeEncryptionPreKeyRecoveryRequestKey;
  v35[2] = &__kCFBooleanTrue;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  3LL));
  uint64_t v13 = im_primary_queue(v11, v12);
  __int128 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183A34;
  block[3] = &unk_1008F8D18;
  void block[4] = self;
  id v15 = v11;
  id v26 = v15;
  id v16 = v8;
  id v27 = v16;
  id v17 = v9;
  id v28 = v17;
  id v18 = v10;
  id v29 = v18;
  dispatch_async(v14, block);

  CFMutableDictionaryRef v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "sendPrekeyRequestToGroup: %@, (destination: %@)",  buf,  0x16u);
  }

  int v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sessionWithUniqueID:v18]);

  if (v21)
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v16 destinationURIs]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 participantIDsForURIs:group:]( self,  "participantIDsForURIs:group:",  v22,  v17));
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);
    [v21 requestMaterialsForParticipantIDs:v24 materialType:11];
  }
}

- (id)participantInfoByURIForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v4));
  id v8 = [v7 copy];

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    id v22 = v4;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          if ([v14 isKnown])
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 participantURI]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v15]);

            if (!v16)
            {
              id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 participantURI]);
              [v5 setObject:v17 forKeyedSubscript:v18];
            }

            CFMutableDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue([v14 participantURI]);
            int v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v19]);
            [v20 addObject:v14];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v11);
    }

    id v4 = v22;
  }

  return v5;
}

- (id)participantIDsForURIs:(id)a3 group:(id)a4
{
  id v6 = a3;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 participantInfoByURIForGroup:]( self,  "participantInfoByURIForGroup:",  a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v24 = *(void *)v31;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v22 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v30 + 1) + 8 * (void)i),  "_stripPotentialTokenURIWithToken:",  0,  v22));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v12]);
        __int128 v14 = v13;
        if (v13)
        {
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v27;
            do
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(v14);
                }
                CFMutableDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) participantIdentifier]));
                [v7 addObject:v19];
              }

              id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }

            while (v16);
          }
        }

        else
        {
          int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            double v36 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "participantIDsForURIs: did not find participant for uri %@",  buf,  0xCu);
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)cleanUpExpiredMasterKeyMaterial
{
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  uint32_t v50 = sub_1001844E0;
  uint64_t v51 = sub_1001844F0;
  id v52 = (id)0xAAAAAAAAAAAAAAAALL;
  id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  os_unfair_lock_lock(&self->_lock);
  __int128 v46 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v43 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_groupIDToKeyMaterialCache, "allValues"));
  id v4 = [v3 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v4)
  {
    uint64_t v40 = *(void *)v44;
    id obj = v3;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_1001844F8;
        v42[3] = &unk_1008FC350;
        void v42[4] = self;
        v42[5] = &v47;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v42));
        [v6 cleanUpMasterKeyMaterialUsingPredicate:v7];

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 currentLocalMasterKeyMaterial]);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 createdAt]);
        LODWORD(v10) = self->_mkmExpireDuration;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dateByAddingTimeInterval:(double)v10]);

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        BOOL v13 = [v12 compare:v11] == (id)1;

        if (v13)
        {
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            double v54 = v11;
            __int16 v55 = 2112;
            id v56 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "cleanUpExpiredMasterKeyMaterial: Found expired current local MkM { expirationDate: %@, MkM: %@ }",  buf,  0x16u);
          }

          [v6 setCurrentLocalMasterKeyMaterial:0];
          id v15 = (void *)v48[5];
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 groupID]);
          id v17 = v15;
          id v18 = v16;
          CFMutableDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v18]);
          if (!v19)
          {
            CFMutableDictionaryRef v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            [v17 setObject:v19 forKeyedSubscript:v18];
          }

          int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 keyIndex]);
          id v21 = [v20 copy];
          [v19 addObject:v21];
        }

        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 nextLocalMasterKeyMaterial]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 createdAt]);
        LODWORD(v24) = self->_mkmExpireDuration;
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v23 dateByAddingTimeInterval:(double)v24]);

        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        LODWORD(v23) = [v26 compare:v25] == (id)1;

        if ((_DWORD)v23)
        {
          __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            double v54 = v25;
            __int16 v55 = 2112;
            id v56 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "cleanUpExpiredMasterKeyMaterial: Found expired next MkM { expirationDate: %@, MkM: %@ }",  buf,  0x16u);
          }

          [v6 setNextLocalMasterKeyMaterial:0];
          __int128 v28 = (void *)v48[5];
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v22 groupID]);
          id v30 = v28;
          id v31 = v29;
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v31]);
          if (!v32)
          {
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            [v30 setObject:v32 forKeyedSubscript:v31];
          }

          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v22 keyIndex]);
          id v34 = [v33 copy];
          [v32 addObject:v34];
        }

        else
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v6 currentLocalMasterKeyMaterial]);
          BOOL v36 = v35 == 0LL;

          if (v36)
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v6 nextLocalMasterKeyMaterial]);
            [v6 setCurrentLocalMasterKeyMaterial:v37];

            [v6 setNextLocalMasterKeyMaterial:0];
          }
        }
      }

      v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }

    while (v4);
  }

  unint64_t v38 = (void *)v48[5];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1001846C8;
  v41[3] = &unk_1008FC378;
  v41[4] = self;
  [v38 enumerateKeysAndObjectsUsingBlock:v41];
  os_unfair_lock_unlock(&self->_lock);
  _Block_object_dispose(&v47, 8);
}

- (void)_handleMkmRollTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimer,  "objectForKeyedSubscript:",  v4));
  id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimerBlock,  "objectForKeyedSubscript:",  v4));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    int v9 = 134218240;
    unint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MKMRoll timer %p fired, block %p.",  (uint8_t *)&v9,  0x16u);
  }

  -[IDSGroupEncryptionController1 _stopMkmRollTimerForGroup:](self, "_stopMkmRollTimerForGroup:", v4);
  if (v6) {
    v6[2](v6);
  }
}

- (void)_startMkmRollTimer:(int)a3 forGroupID:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimer,  "objectForKeyedSubscript:",  v8));
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimerBlock,  "objectForKeyedSubscript:",  v8));
  BOOL v13 = (void *)v11;
  if ((unint64_t)v10 | v11)
  {
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_retainBlock(v13);
      *(_DWORD *)buf = 134218240;
      id v30 = v10;
      __int16 v31 = 2048;
      v32[0] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "MKMRoll timer %p and block %p are already scheduled.",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v16 = im_primary_queue(v11, v12);
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    unint64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v17);

    dispatch_time_t v18 = dispatch_time(0LL, 1000000000LL * a3);
    dispatch_source_set_timer(v10, v18, 1000000000LL * a3, 0x5F5E100uLL);
    __int128 v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    __int128 v25 = sub_100184C08;
    __int128 v26 = &unk_1008F5F80;
    __int128 v27 = self;
    id v19 = v8;
    id v28 = v19;
    dispatch_source_set_event_handler(v10, &v23);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRollTimer,  "setObject:forKeyedSubscript:",  v10,  v19,  v23,  v24,  v25,  v26,  v27);
    id v20 = objc_retainBlock(v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRollTimerBlock,  "setObject:forKeyedSubscript:",  v20,  v19);

    dispatch_resume(v10);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_retainBlock(v9);
      *(_DWORD *)buf = 134218496;
      id v30 = v10;
      __int16 v31 = 1024;
      LODWORD(v32[0]) = a3;
      WORD2(v32[0]) = 2048;
      *(void *)((char *)v32 + 6) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "start mkmRoll timer %p, timeout %d sec, block %p ",  buf,  0x1Cu);
    }
  }
}

- (void)_stopMkmRollTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimer,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMRollTimerBlock,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_retainBlock(v6);
      int v9 = 134218240;
      unint64_t v10 = v5;
      __int16 v11 = 2048;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "stop mkmRollTimer timer %p, block %p.",  (uint8_t *)&v9,  0x16u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRollTimer,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMRollTimerBlock,  "setObject:forKeyedSubscript:",  0LL,  v4);
  }
}

- (void)_handleMkmExpirationTimerForGroup:(id)a3
{
  groupIDToMKMExpirationTimer = self->_groupIDToMKMExpirationTimer;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupIDToMKMExpirationTimer,  "objectForKeyedSubscript:",  v5));
  id v7 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMExpirationTimerBlock,  "objectForKeyedSubscript:",  v5));

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_retainBlock(v7);
    int v10 = 134218240;
    __int16 v11 = v6;
    __int16 v12 = 2048;
    BOOL v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "mkmExpiration timer %p fired, block %p.",  (uint8_t *)&v10,  0x16u);
  }

  if (v7) {
    v7[2](v7);
  }
}

- (void)_startMkmExpirationTimer:(int)a3 forGroupID:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMExpirationTimer,  "objectForKeyedSubscript:",  v8));
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMExpirationTimerBlock,  "objectForKeyedSubscript:",  v8));
  BOOL v13 = (void *)v11;
  if ((unint64_t)v10 | v11)
  {
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_retainBlock(v13);
      *(_DWORD *)buf = 134218240;
      id v30 = v10;
      __int16 v31 = 2048;
      id v32 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "mkmExpiration timer %p and block %p are already scheduled.",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v16 = im_primary_queue(v11, v12);
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    int v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v17);

    dispatch_time_t v18 = dispatch_time(0LL, 1000000000LL * a3);
    dispatch_source_set_timer(v10, v18, 1000000000LL * a3, 0x5F5E100uLL);
    __int128 v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    __int128 v25 = sub_100185114;
    __int128 v26 = &unk_1008F5F80;
    __int128 v27 = self;
    id v19 = v8;
    id v28 = v19;
    dispatch_source_set_event_handler(v10, &v23);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMExpirationTimer,  "setObject:forKeyedSubscript:",  v10,  v19,  v23,  v24,  v25,  v26,  v27);
    id v20 = objc_retainBlock(v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMExpirationTimerBlock,  "setObject:forKeyedSubscript:",  v20,  v19);

    dispatch_resume(v10);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_retainBlock(v9);
      *(_DWORD *)buf = 134218754;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 1024;
      int v34 = a3;
      __int16 v35 = 2048;
      id v36 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "start mkmExpiration timer %p, groupID: %@, timeout %d sec, block %p ",  buf,  0x26u);
    }
  }
}

- (void)_stopMkmExpirationTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMExpirationTimer,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToMKMExpirationTimerBlock,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_retainBlock(v6);
      int v9 = 134218498;
      int v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2048;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "stop mkmExpiration timer %p, groupID: %@, block %p.",  (uint8_t *)&v9,  0x20u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMExpirationTimer,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToMKMExpirationTimerBlock,  "setObject:forKeyedSubscript:",  0LL,  v4);
  }
}

- (void)_mkmRollTimerFiredForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_mkmRollTimerFiredForGroup: %@ sessionID:%@",  (uint8_t *)&v26,  0x16u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nextLocalMasterKeyMaterial]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    [v12 setCurrentLocalMasterKeyMaterial:v11];

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentLocalMasterKeyMaterial]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v14 changeCreatedAt:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    [v16 setNextLocalMasterKeyMaterial:0];

    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentLocalMasterKeyMaterial]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 nextLocalMasterKeyMaterial]);
      int v26 = 138412546;
      id v27 = v19;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MKMRoll timer fired: current MKM: %@, next MKM: %@",  (uint8_t *)&v26,  0x16u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionWithUniqueID:v7]);

    if (v23)
    {
      if (([v11 isSentToClient] & 1) == 0)
      {
        [v23 recvKeyMaterial:v11];
        [v11 setIsSentToClient:1];
      }
    }

    else
    {
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10069EF60();
      }
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "_mkmRollTimerFiredForGroup: no new current local material. Requesting...",  (uint8_t *)&v26,  2u);
    }

    os_unfair_lock_unlock(&self->_lock);
    -[IDSGroupEncryptionController1 requestKeyMaterialForGroup:sessionID:shouldGenerateMKM:]( self,  "requestKeyMaterialForGroup:sessionID:shouldGenerateMKM:",  v6,  v7,  1LL);
  }
}

- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    if (!self->_groupIDToLocalParticipantID)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      groupIDToLocalParticipantID = self->_groupIDToLocalParticipantID;
      self->_groupIDToLocalParticipantID = Mutable;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    if (v12) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToLocalParticipantID, v8, v12);
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 stableKeyMaterialForGroup:sessionID:]( self,  "stableKeyMaterialForGroup:sessionID:",  v8,  v9));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 masterKeyMaterialForGroup:](self, "masterKeyMaterialForGroup:", v8));
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    id v16 = [v13 participantID];
    uint64_t v17 = (uint64_t)v16;
    if (v16)
    {
      if (v16 == (id)a3)
      {
        int64_t v18 = 0LL;
        uint64_t v19 = 1LL;
        goto LABEL_17;
      }

      [v13 setParticipantID:a3];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10069EFC0(v17);
      }
      uint64_t v19 = 2LL;
    }

    else
    {
      [v13 setParticipantID:a3];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218242;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "set localParticipantID: %llu for SKM: %@",  (uint8_t *)&v24,  0x16u);
      }

      uint64_t v19 = 1LL;
    }

    int64_t v18 = v19;
LABEL_17:
    id v21 = [v14 participantID];
    if (v21)
    {
      if (v21 == (id)a3)
      {
LABEL_25:
        os_unfair_lock_unlock(p_lock);

        goto LABEL_26;
      }

      [v14 setParticipantID:a3];
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10069EFC0(v17);
      }
      uint64_t v19 = 2LL;
    }

    else
    {
      [v14 setParticipantID:a3];
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218242;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "set localParticipantID: %llu for MKM: %@",  (uint8_t *)&v24,  0x16u);
      }
    }

    int64_t v18 = v19;
    goto LABEL_25;
  }

  int64_t v18 = 0LL;
LABEL_26:

  return v18;
}

- (unint64_t)localParticipantIDForGroupID:(id)a3
{
  Value = 0LL;
  if (a3)
  {
    groupIDToLocalParticipantID = self->_groupIDToLocalParticipantID;
    if (groupIDToLocalParticipantID) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)groupIDToLocalParticipantID, a3);
    }
  }

  return (unint64_t)[Value unsignedLongLongValue];
}

- (void)createKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[IDSGroupEncryptionController1 cleanUpExpiredMasterKeyMaterial](self, "cleanUpExpiredMasterKeyMaterial");
  -[IDSGroupEncryptionController1 _stopMkmRollTimerForGroup:](self, "_stopMkmRollTimerForGroup:", v6);
  -[IDSGroupEncryptionController1 _stopMkmExpirationTimerForGroup:](self, "_stopMkmExpirationTimerForGroup:", v6);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _locked_ensureGroupMasterKeyMaterialCacheForGroup:]( self,  "_locked_ensureGroupMasterKeyMaterialCacheForGroup:",  v6));
  Value = 0LL;
  if (v6 && self->_groupIDToLocalParticipantID) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_groupIDToLocalParticipantID, v6);
  }
  id v11 = [Value unsignedLongLongValue];
  if (-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
  {
    *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__buf[16] = v12;
    *(_OWORD *)__buf = v12;
    arc4random_buf(__buf, 0x20uLL);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __buf, 32LL));
    p_os_unfair_lock_t lock = &self->_lock;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", __buf, 16LL));
    id v15 = objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v17 = -[IDSGroupEncryptionKeyMaterial initWithKeyMaterial:keySalt:keyIndex:groupID:participantID:]( v15,  "initWithKeyMaterial:keySalt:keyIndex:groupID:participantID:",  v13,  v14,  v16,  v6,  v11);

    if (v17)
    {
LABEL_6:
      if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform]( &OBJC_CLASS___IDSGroupEncryptionController1,  "isKeyRatchetingEnabledForPlatform"))
      {
        int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 firstLocalMasterKeyMaterial]);

        if (!v18) {
          [v9 setFirstLocalMasterKeyMaterial:v17];
        }
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 currentLocalMasterKeyMaterial]);
      if (v19)
      {
      }

      else
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v9 nextLocalMasterKeyMaterial]);

        if (!v23)
        {
          [v9 setCurrentLocalMasterKeyMaterial:v17];
          int v48 = 1;
          goto LABEL_17;
        }
      }

      [v9 setNextLocalMasterKeyMaterial:v17];
      int v48 = 0;
LABEL_17:
      uint64_t v47 = v9;
      int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v7;
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyMaterial](v17, "keyMaterial"));
        __int128 v46 = v25;
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keySalt](v17, "keySalt"));
        __int128 v44 = v17;
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v17, "keyIndex"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v47 currentLocalMasterKeyMaterial]);
        __int128 v45 = p_lock;
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v47 nextLocalMasterKeyMaterial]);
        if (v48) {
          __int16 v31 = @"YES";
        }
        else {
          __int16 v31 = @"NO";
        }
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
        *(_DWORD *)__buf = 138479619;
        *(void *)&__uint8_t buf[4] = v26;
        *(_WORD *)&___BYTE buf[12] = 2112;
        *(void *)&__buf[14] = v27;
        *(_WORD *)&__buf[22] = 2112;
        *(void *)&__buf[24] = v28;
        __int16 v57 = 2112;
        id v58 = v6;
        __int16 v59 = 2112;
        uint64_t v60 = v29;
        __int16 v61 = 2112;
        dispatch_block_t v62 = v30;
        __int16 v63 = 2112;
        id v64 = v31;
        __int16 v65 = 2112;
        uint64_t v66 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Created MKM %{private}@, MKS %@, MKI %@ for the group %@, current: %@, next: %@, isFirstLocalGeneratedMKM: %@ for device %@",  __buf,  0x52u);

        p_os_unfair_lock_t lock = v45;
        uint64_t v17 = v44;

        id v7 = v46;
      }

      os_unfair_lock_unlock(p_lock);
      -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v6,  v7);
      uint64_t mkmExpireDuration = self->_mkmExpireDuration;
      int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 sessionWithUniqueID:v7]);

      if (v35) {
        [v35 didCreateMKM:v17];
      }
      id v36 = &off_100717000;
      if (v48)
      {
        unsigned int mkmRollDuration = self->_mkmRollDuration;
        unsigned int v38 = self->_mkmExpireDuration;
        BOOL v39 = v38 >= mkmRollDuration;
        uint64_t v40 = v38 - mkmRollDuration;
        if (v39)
        {
          uint64_t mkmExpireDuration = v40;
        }

        else
        {
          id v41 = v7;
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_10069F088();
          }

          id v7 = v41;
          id v36 = &off_100717000;
        }
      }

      else
      {
        uint64_t v43 = self->_mkmRollDuration;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_100185EA4;
        v53[3] = &unk_1008F5F58;
        v53[4] = self;
        id v54 = v6;
        id v55 = v7;
        -[IDSGroupEncryptionController1 _startMkmRollTimer:forGroupID:block:]( self,  "_startMkmRollTimer:forGroupID:block:",  v43,  v54,  v53);

        id v36 = &off_100717000;
      }

      v49[0] = _NSConcreteStackBlock;
      v49[1] = *((void *)v36 + 49);
      v49[2] = sub_100185F6C;
      v49[3] = &unk_1008F8F20;
      v49[4] = self;
      id v50 = v6;
      char v52 = v48;
      id v51 = v7;
      -[IDSGroupEncryptionController1 _startMkmExpirationTimer:forGroupID:block:]( self,  "_startMkmExpirationTimer:forGroupID:block:",  mkmExpireDuration,  v50,  v49);

      id v9 = v47;
      goto LABEL_32;
    }
  }

  else
  {
    id v20 = objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v17 = -[IDSGroupEncryptionKeyMaterial initWithIndex:groupID:participantID:]( v20,  "initWithIndex:groupID:participantID:",  v21,  v6,  v11);

    if (v17) {
      goto LABEL_6;
    }
  }

  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10069F028();
  }

  os_unfair_lock_unlock(p_lock);
LABEL_32:
}

- (id)createStableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _ensureGroupStableKeyMaterialCacheForGroup:]( self,  "_ensureGroupStableKeyMaterialCacheForGroup:",  v6));
  Value = 0LL;
  if (v6 && self->_groupIDToLocalParticipantID) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_groupIDToLocalParticipantID, v6);
  }
  id v11 = [Value unsignedLongLongValue];
  __int128 v12 = objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v14 = -[IDSGroupEncryptionKeyMaterial initWithIndex:groupID:participantID:]( v12,  "initWithIndex:groupID:participantID:",  v13,  v6,  v11);

  if (v14)
  {
    [v9 setCurrentLocalStableKeyMaterial:v14];
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyMaterial](v14, "keyMaterial"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keySalt](v14, "keySalt"));
      int64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v14, "keyIndex"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 currentLocalStableKeyMaterial]);
      id v24 = v7;
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 previousLocalStableKeyMaterial]);
      *(_DWORD *)buf = 138479107;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      __int16 v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      int v34 = v19;
      __int16 v35 = 2112;
      id v36 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Created SKM %{private}@, SKS %@, SKI %@ for the group %@, current: %@, previous: %@",  buf,  0x3Eu);

      id v7 = v24;
      p_os_unfair_lock_t lock = &self->_lock;
    }

    os_unfair_lock_unlock(p_lock);
    -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v6,  v7);
    id v21 = v14;
  }

  else
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10069F10C();
    }

    os_unfair_lock_unlock(p_lock);
  }

  return v14;
}

- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 createStableKeyMaterialForGroup:sessionID:]( self,  "createStableKeyMaterialForGroup:sessionID:",  a3,  v6));
  if (v7)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionWithUniqueID:v6]);

    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    __int128 v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "createStableKeyMaterialAndSendToFrameworkForGroup: send local SKM %@ to framework",  buf,  0xCu);
      }

      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
      id v14 = v12;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      [v10 recvStableKeyMaterialForFrameworkCache:v13];
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10069F16C();
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 groupID:(id)a5 sessionID:(id)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8
{
  LOBYTE(v8) = a8;
  -[IDSGroupEncryptionController1 sendKeyMaterialsRecoveryRequestToDevice:fromURI:participantID:groupID:sessionID:requireMKM:requireSKM:]( self,  "sendKeyMaterialsRecoveryRequestToDevice:fromURI:participantID:groupID:sessionID:requireMKM:requireSKM:",  a3,  a4,  &off_1009473B0,  a5,  a6,  a7,  v8);
}

- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 participantID:(id)a5 groupID:(id)a6 sessionID:(id)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9
{
  BOOL v58 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = im_primary_base_queue(v18);
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
  dispatch_assert_queue_V2(v20);

  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v64 = v14;
    __int16 v65 = 2112;
    id v66 = v15;
    __int16 v67 = 2112;
    id v68 = v17;
    __int16 v69 = 2112;
    id v70 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToDevice: %@ fromID: %@ groupID: %@ sessionID: %@",  buf,  0x2Au);
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyData](self, "realTimeEncryptionPublicKeyData"));
  __int128 v23 = (void *)v22;
  if (v22)
  {
    v61[0] = IDSFanoutMessageGroupIDKey;
    v61[1] = IDSDSessionMessageSessionID;
    v62[0] = v17;
    v62[1] = v18;
    v62[2] = v22;
    v61[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
    v61[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyWrappingMode]( self,  "realTimeEncryptionPublicKeyWrappingMode")));
    v62[3] = v24;
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  4LL));

    id v54 = v25;
    id v26 = -[os_log_s mutableCopy](v25, "mutableCopy");
    __int16 v27 = v26;
    if (v58) {
      [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionMKMRecoveryRequestKey];
    }
    id v28 = v18;
    id v56 = v16;
    if (a9) {
      [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionSKMRecoveryRequestKey];
    }
    __int16 v57 = v27;
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v17));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 accountWithUniqueID:v30]);

    id v55 = (void *)v31;
    if (v31)
    {
      id v52 = v15;
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v15 unprefixedURI]);
      id v33 = sub_1003B4704(v32);
      int v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v34));

      id v53 = v14;
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v35 URIByAddingOptionalPushToken:v14]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:"));
      uint64_t v37 = objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v36));

      -[IDSGroupEncryptionController1 _multiwayFTMessageSendTimeout](self, "_multiwayFTMessageSendTimeout");
      LOBYTE(v49) = 0;
      id v50 = (void *)v37;
      id v18 = v28;
      -[IDSGroupEncryptionController1 _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:]( self,  "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:",  v57,  v37,  v17,  v28,  211LL,  1LL,  v49,  0LL,  0LL);
      unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sessionWithGroupID:v17]);

      uint64_t v40 = v54;
      if (!v39)
      {
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v64 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToDevice: could not find session for group %@",  buf,  0xCu);
        }
      }

      if (v56)
      {
        id v59 = v56;
        id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
      }

      else
      {
        uint64_t v60 = v35;
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v44));
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 participantIDsForURIs:group:]( self,  "participantIDsForURIs:group:",  v45,  v17));
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v46 allObjects]);
      }

      id v14 = v53;
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      id v15 = v52;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v64 = v17;
        __int16 v65 = 2112;
        id v66 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToDevice: sending key recovery request for group %@ to participant IDs %@",  buf,  0x16u);
      }

      if (v39 && v58) {
        [v39 requestMaterialsForParticipantIDs:v42 materialType:13];
      }
      if (v39 && a9) {
        [v39 requestMaterialsForParticipantIDs:v42 materialType:14];
      }
      int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412803;
        id v64 = v35;
        __int16 v65 = 2113;
        id v66 = v53;
        __int16 v67 = 2113;
        id v68 = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToDevice: Sent the key recovery request to URI: (%@) (pushToken: %{private}@)(m essage dict: %{private}@)",  buf,  0x20u);
      }

      id v16 = v56;
      uint64_t v43 = v55;
    }

    else
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR)) {
        sub_10069F22C();
      }
      id v16 = v56;
      id v18 = v28;
      uint64_t v40 = v54;
      uint64_t v43 = 0LL;
    }
  }

  else
  {
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10069F1CC();
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = im_primary_base_queue(v8);
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyData](self, "realTimeEncryptionPublicKeyData"));
  __int128 v12 = (void *)v11;
  if (v11)
  {
    v52[0] = IDSFanoutMessageGroupIDKey;
    v52[1] = IDSDSessionMessageSessionID;
    v53[0] = v8;
    v53[1] = v8;
    v53[2] = v11;
    v52[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
    v52[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyWrappingMode]( self,  "realTimeEncryptionPublicKeyWrappingMode")));
    v53[3] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  4LL));

    id v15 = [v14 mutableCopy];
    id v16 = v15;
    BOOL v17 = v6;
    if (v6) {
      [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionMKMRecoveryRequestKey];
    }
    BOOL v18 = v5;
    if (v5) {
      [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionSKMRecoveryRequestKey];
    }
    uint64_t v43 = v16;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v8));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 accountWithUniqueID:v20]);

    id v42 = (void *)v21;
    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersForGroup,  "objectForKeyedSubscript:",  v8));
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));

      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v23));
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      BOOL v26 = v18;
      BOOL v27 = v17;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = @"NO";
        if (v17) {
          __int16 v29 = @"YES";
        }
        else {
          __int16 v29 = @"NO";
        }
        *(_DWORD *)buf = 138413059;
        if (v26) {
          id v28 = @"YES";
        }
        id v45 = v8;
        __int16 v46 = 2112;
        uint64_t v47 = v29;
        __int16 v48 = 2112;
        uint64_t v49 = v28;
        __int16 v50 = 2113;
        id v51 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToGroup: %@ requireMKM: %@, requireSKM: %@, (message dict: %{private}@)",  buf,  0x2Au);
      }

      -[IDSGroupEncryptionController1 _multiwayFTMessageSendTimeout](self, "_multiwayFTMessageSendTimeout");
      LOBYTE(v41) = 0;
      id v30 = (void *)v24;
      -[IDSGroupEncryptionController1 _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:]( self,  "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:",  v43,  v24,  v8,  0LL,  211LL,  1LL,  v41,  0LL,  0LL);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 sessionWithGroupID:v8]);

      if (!v32)
      {
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToGroup: could not find session for group %@",  buf,  0xCu);
        }
      }

      int v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 participantIDsForURIs:group:]( self,  "participantIDsForURIs:group:",  v23,  v8));
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allObjects]);

      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = @"NO";
        if (v27) {
          unsigned int v38 = @"YES";
        }
        else {
          unsigned int v38 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        if (v26) {
          uint64_t v37 = @"YES";
        }
        id v45 = v8;
        __int16 v46 = 2112;
        uint64_t v47 = v38;
        __int16 v48 = 2112;
        uint64_t v49 = v37;
        __int16 v50 = 2112;
        id v51 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToGroup: %@ requireMKM: %@, requireSKM: %@, participantIDs: %@",  buf,  0x2Au);
      }

      if (v32 && v27) {
        [v32 requestMaterialsForParticipantIDs:v35 materialType:13];
      }
      BOOL v39 = v43;
      if (v32 && v26) {
        [v32 requestMaterialsForParticipantIDs:v35 materialType:14];
      }

      uint64_t v40 = v42;
    }

    else
    {
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10069F2F0();
      }
      uint64_t v40 = 0LL;
      BOOL v39 = v43;
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10069F290();
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  BOOL v40 = a6;
  BOOL v41 = a7;
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  os_unfair_lock_lock(&self->_lock);
  BOOL v39 = self;
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v11));
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = @"NO";
    *(_DWORD *)buf = 138413058;
    if (v40) {
      id v14 = @"YES";
    }
    else {
      id v14 = @"NO";
    }
    dispatch_block_t v62 = v14;
    __int16 v63 = 2112;
    if (v41) {
      __int16 v13 = @"YES";
    }
    id v64 = v13;
    __int16 v65 = 2112;
    id v66 = v10;
    __int16 v67 = 2112;
    id v68 = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToParticipants: requireMKM: %@, requireSKM: %@, participantIDs: %@, participantsInfo: %@",  buf,  0x2Au);
  }

  if (v10)
  {
    os_unfair_lock_t lock = &self->_lock;
    id v36 = v10;
    unsigned int v38 = v11;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
    id v17 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v54 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v22 = v43;
          id v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v50;
            while (2)
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v50 != v25) {
                  objc_enumerationMutation(v22);
                }
                BOOL v27 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)j);
                id v28 = [v27 participantIdentifier];
                id v29 = [v21 unsignedLongLongValue];
                if (v28 == v29)
                {
                  uint64_t v31 = im_primary_queue(v29, v30);
                  id v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472LL;
                  block[2] = sub_100187578;
                  block[3] = &unk_1008FC3A0;
                  void block[4] = v39;
                  void block[5] = v27;
                  id v45 = v38;
                  id v46 = v42;
                  BOOL v47 = v40;
                  BOOL v48 = v41;
                  dispatch_async(v32, block);

                  goto LABEL_24;
                }
              }

              id v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionWithUniqueID:v20]);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 sessionWithGroupID:v19]);

  BOOL v26 = (void *)v25;
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v18 URIByAddingOptionalPushToken:v17]);
  if ([v23 destinationsContainFromURI:v27]
    && ([v26 destinationsContainFromURI:v27] & 1) != 0)
  {
    __int128 v49 = v26;
    __int128 v50 = v18;
    __int128 v51 = v16;
    id v52 = v21;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v19));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v54;
      while (2)
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v54 != v32) {
            objc_enumerationMutation(v29);
          }
          if ([*(id *)(*((void *)&v53 + 1) + 8 * (void)i) isEqual:v17])
          {

            BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionPublicKey]);
            BOOL v47 = (void *)objc_claimAutoreleasedReturnValue([v51 _numberForKey:IDSDSessionMessageRealTimeEncryptionWrapModeKey]);
            id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            id v18 = v50;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413571;
              double v59 = *(double *)&v19;
              __int16 v60 = 2112;
              id v61 = v20;
              __int16 v62 = 2112;
              id v63 = v52;
              __int16 v64 = 2112;
              id v65 = v17;
              __int16 v66 = 2112;
              __int16 v67 = v50;
              __int16 v68 = 2113;
              __int16 v69 = v51;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest for group %@, session %@, serverDate %@, pushToken: %@, fromI D: %@, message %{private}@",  buf,  0x3Eu);
            }

            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
            if (v38)
            {
              double v39 = ids_monotonic_time(v38);
              *(_DWORD *)buf = 134217984;
              double v59 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Receiving Key Material (Push, KeyMaterialsRecovery) [PreKey] -- %f",  buf,  0xCu);
            }

            -[IDSGroupEncryptionController1 setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:]( self,  "setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:",  v48,  v17,  v50,  v19,  v20,  v52,  [v47 integerValue]);
            if (v23)
            {
              BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v50 prefixedURI]);
              BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v17 rawToken]);
              id v46 = v20;
              uint64_t v42 = objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithAlias:pushToken:]( &OBJC_CLASS___IDSDestination,  "destinationWithAlias:pushToken:",  v40,  v41));

              -[IDSGroupEncryptionController1 sendPublicKeyToDestination:group:sessionID:]( self,  "sendPublicKeyToDestination:group:sessionID:",  v42,  v19,  v46);
              id v57 = v17;
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v57,  1LL));
              -[IDSGroupEncryptionController1 requestKeyMaterialForGroup:sessionID:toSpecificMembers:requireMKM:requireSKM:]( self,  "requestKeyMaterialForGroup:sessionID:toSpecificMembers:requireMKM:requireSKM:",  v19,  v46,  v43,  a9,  a10);

              __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v17 rawToken]);
              [v23 reportPreKeyReceivedOverPushFromToken:v44];

              id v45 = (os_log_s *)v42;
              id v20 = v46;
            }

            else
            {
              id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                double v59 = *(double *)&v19;
                __int16 v60 = 2112;
                id v61 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest - there is no group session for group %@, session %@. We wo n't send any MKM/SKM.",  buf,  0x16u);
              }
            }

            id v16 = v51;
            BOOL v26 = v49;

            goto LABEL_26;
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    BOOL v26 = v49;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v59 = *(double *)&v19;
      __int16 v60 = 2112;
      id v61 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest: We'll drop this key recovery request for group [%@] since deviceToke n [%@] is not in the active participant list!",  buf,  0x16u);
    }

    [v23 rejectedKeyRecoveryRequestFromURI:v27 reason:2];
    id v18 = v50;
    id v16 = v51;
LABEL_26:

    id v21 = v52;
  }

  else
  {
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v59 = *(double *)&v19;
      __int16 v60 = 2112;
      id v61 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest: We'll drop this prekey recovery request for group %@ since %@ is not in this group!",  buf,  0x16u);
    }

    [v23 rejectedKeyRecoveryRequestFromURI:v27 reason:1];
  }
}

- (BOOL)_storePendingKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 hasValidMKM:(BOOL)a5 hasValidSKM:(BOOL)a6 forDevice:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v9)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMasterKeyMaterials,  "objectForKeyedSubscript:",  v14));

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingMasterKeyMaterials,  "setObject:forKeyedSubscript:",  v12,  v14);
    if (!v16)
    {
      BOOL v9 = 1;
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }

    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
      int v30 = 138412546;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "_storePendingKeyMaterialForKeyRecovery: _pendingMasterKeyMaterials already has the pending key material (MKI:%@) for %@",  (uint8_t *)&v30,  0x16u);
    }

    BOOL v9 = 0;
  }

  if (!v8) {
    goto LABEL_12;
  }
LABEL_7:
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingStableKeyMaterials,  "objectForKeyedSubscript:",  v14));

  pendingStableKeyMaterials = self->_pendingStableKeyMaterials;
  if (!v19)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( pendingStableKeyMaterials,  "setObject:forKeyedSubscript:",  v12,  v14);
    os_unfair_lock_unlock(&self->_lock);
    if (!v9)
    {
LABEL_19:
      BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSRealTimeEncryptionSKI]);
        int v30 = 138412290;
        id v31 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "_storePendingKeyMaterial: moved the incoming the stable key material (SKI:%@) to temporary storage until it ge ts the prekey for it.",  (uint8_t *)&v30,  0xCu);
      }

LABEL_22:
      BOOL v24 = 1;
      goto LABEL_23;
    }

    int v23 = 1;
LABEL_13:
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:IDSRealTimeEncryptionMKI]);
      int v30 = 138412290;
      id v31 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "_storePendingKeyMaterial: moved the incoming the master key material (MKI:%@) to temporary storage until it gets the prekey for it.",  (uint8_t *)&v30,  0xCu);
    }

    if (!v23) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( pendingStableKeyMaterials,  "setObject:forKeyedSubscript:",  v13,  v14);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:IDSRealTimeEncryptionSKI]);
    int v30 = 138412546;
    id v31 = v22;
    __int16 v32 = 2112;
    id v33 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "_storePendingKeyMaterial: _pendingStableKeyMaterials already has the pending key material (SKI:%@) for %@",  (uint8_t *)&v30,  0x16u);
  }

LABEL_12:
  os_unfair_lock_unlock(p_lock);
  int v23 = 0;
  BOOL v24 = 0;
  if (v9) {
    goto LABEL_13;
  }
LABEL_23:

  return v24;
}

- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12
{
  id v18 = (os_log_s *)a3;
  id v212 = a4;
  id v19 = (__CFString *)a5;
  id v213 = a6;
  id v20 = (__CFString *)a7;
  id v21 = a8;
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = @"NO";
    id v24 = v21;
    if (a11) {
      uint64_t v25 = @"YES";
    }
    else {
      uint64_t v25 = @"NO";
    }
    BOOL v26 = v19;
    if (a12) {
      BOOL v27 = @"YES";
    }
    else {
      BOOL v27 = @"NO";
    }
    if (a9) {
      int v23 = @"YES";
    }
    v210 = v23;
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity publicIdentityData](self->_identityForDevice, "publicIdentityData"));
    *(_DWORD *)buf = 138480131;
    v224 = v18;
    __int16 v225 = 2113;
    id v226 = v212;
    __int16 v227 = 2112;
    v228 = (__SecKey *)v25;
    id v21 = v24;
    __int16 v229 = 2112;
    v230 = v27;
    id v19 = (__CFString *)v26;
    __int16 v231 = 2112;
    v232 = v26;
    __int16 v233 = 2112;
    uint64_t v234 = (uint64_t)v213;
    __int16 v235 = 2112;
    v236 = v20;
    __int16 v237 = 2112;
    id v238 = v24;
    __int16 v239 = 2112;
    v240 = v210;
    __int16 v241 = 2112;
    v242 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: %{private}@ SKM: %{private}@ for MKM: %@, for SKM: %@, forDevice: %@ fromID: %@ groupID : %@ sessionID: %@ fromSender: %@ publicKey: %@",  buf,  0x66u);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionWithUniqueID:v21]);

  v211 = v18;
  if (v30
    && (id v31 = (void *)objc_claimAutoreleasedReturnValue([v213 URIByAddingOptionalPushToken:v19]),
        unsigned __int8 v32 = [v30 destinationsContainFromURI:v31],
        v31,
        (v32 & 1) == 0))
  {
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v224 = v211;
      __int16 v225 = 2112;
      id v226 = v20;
      id v46 = "receivedAndSetKeyMaterial: Invalid session or invalid destination. We'll drop this MKM %{private}@ for group %@";
      goto LABEL_26;
    }
  }

  else
  {
    if ([v30 sharedSessionHasJoined])
    {
      id v33 = self->_identityForDevice;
      if (!v33)
      {
        __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        BOOL v48 = v212;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
          sub_10069F354();
        }
        id v47 = 0LL;
        goto LABEL_214;
      }

      v204 = v19;
      v200 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (a11)
      {
        -[IDSGroupEncryptionController1 cleanUpExpiredMasterKeyMaterial](self, "cleanUpExpiredMasterKeyMaterial");
        v199 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionMKM));
        int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionMKS));
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionMKGC));
        unsigned int v184 = [v35 unsignedIntValue];

        id v36 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionParticipantID));
        v201 = (const __CFString *)[v36 unsignedLongLongValue];

        v196 = v34;
        if (-[os_log_s length](v34, "length") == (id)16)
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionMKI));
          if ([v37 length] == (id)16)
          {
            v197 = v37;
            BOOL v38 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v37 bytes]);
            double v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 masterKeyMaterialForGroup:]( self,  "masterKeyMaterialForGroup:",  v20));
            v203 = v38;
            v194 = v39;
            if (v39
              && (BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s keyIndex](v39, "keyIndex")),
                  unsigned int v41 = [v40 isEqual:v38],
                  v40,
                  v41))
            {
              uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v43 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v203, "UUIDString"));
                *(_DWORD *)buf = 138412290;
                v224 = v43;
                __int128 v44 = v42;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This MKI %@ is local key material. skipping...",  buf,  0xCu);

                int v45 = 0;
              }

              else
              {
                int v45 = 0;
                __int128 v44 = v42;
              }
            }

            else
            {
              id v190 = v21;
              os_unfair_lock_lock(&self->_lock);
              uint64_t v51 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v20));
              id v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v38, "UUIDString"));
              unsigned int v53 = [(id)v51 hasClientReceivedMasterKeyIdentifier:v52];

              __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v38, "UUIDString"));
              __int128 v44 = (void *)v51;
              LODWORD(v51) = [(id)v51 hasCachedMasterKeyIdentifier:v54];

              os_unfair_lock_unlock(&self->_lock);
              int v55 = v51 & v53;
              if ((v51 & v53) == 1)
              {
                __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v38, "UUIDString"));
                  *(_DWORD *)buf = 138412290;
                  v224 = v57;
                  _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: has cached MKM. {MKI: %@}",  buf,  0xCu);
                }
              }

              int v45 = v55 ^ 1;
              id v21 = v190;
            }

            __int128 v50 = v194;

            uint64_t v37 = v197;
          }

          else
          {
            __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v224 = (os_log_s *)v37;
              __int16 v225 = 1024;
              LODWORD(v226) = 16;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This MKI UUID data %@ is not %d bytes. skipping...",  buf,  0x12u);
            }

            int v45 = 0;
            v203 = 0LL;
          }
        }

        else
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v224 = v196;
            __int16 v225 = 1024;
            LODWORD(v226) = 16;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This MKS data %@ is not %d bytes. skipping...",  buf,  0x12u);
          }

          int v45 = 0;
          v203 = 0LL;
        }

        id v19 = v204;
      }

      else
      {
        v199 = 0LL;
        v196 = 0LL;
        int v45 = 0;
        v201 = 0LL;
        v203 = 0LL;
        unsigned int v184 = 0;
      }

      int v185 = IMGetDomainBoolForKey(@"com.apple.ids", @"forceUpdateSKM");
      unsigned int v198 = v45;
      v189 = v33;
      if (!a12)
      {
        v193 = 0LL;
        v195 = 0LL;
        unsigned int v70 = 0;
        __int16 v69 = 0LL;
        unint64_t v60 = 0LL;
        goto LABEL_71;
      }

      v193 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKM]);
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKS]);
      double v59 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKGC]);
      unint64_t v60 = (unint64_t)[v59 unsignedIntValue];

      id v61 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionParticipantID]);
      v201 = (const __CFString *)[v61 unsignedLongLongValue];

      v195 = v58;
      if (-[os_log_s length](v58, "length") != (id)16)
      {
        __int16 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v224 = v195;
          __int16 v225 = 1024;
          LODWORD(v226) = 16;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This SKS data %@ is not %d bytes. skipping...",  buf,  0x12u);
        }

        unsigned int v70 = 0;
        __int16 v69 = 0LL;
        int v45 = v198;
        goto LABEL_70;
      }

      __int16 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKI]);
      if (-[os_log_s length](v62, "length") != (id)16)
      {
        id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        v182 = v71;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v224 = v62;
          __int16 v225 = 1024;
          LODWORD(v226) = 16;
          _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This SKI UUID data %@ is not %d bytes. skipping...",  buf,  0x12u);
        }

        unsigned int v70 = 0;
        __int16 v69 = 0LL;
        int v45 = v198;
        goto LABEL_69;
      }

      unsigned int v180 = v60;
      id v63 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", -[os_log_s bytes](v62, "bytes"));
      __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 stableKeyMaterialForGroup:sessionID:]( self,  "stableKeyMaterialForGroup:sessionID:",  v20,  v21));
      v182 = v64;
      if (v64
        && (id v65 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s keyIndex](v64, "keyIndex")),
            unsigned int v66 = [v65 isEqual:v63],
            v65,
            v66))
      {
        __int16 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        v177 = v67;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v68 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v63, "UUIDString"));
          *(_DWORD *)buf = 138412290;
          v224 = v68;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: This SKI %@ is local key. skipping...",  buf,  0xCu);

          __int16 v69 = v63;
          unsigned int v70 = 0;
        }

        else
        {
          unsigned int v70 = 0;
          __int16 v69 = v63;
        }
      }

      else
      {
        id v191 = v21;
        os_unfair_lock_lock(&self->_lock);
        uint64_t v72 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v20));
        id v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v63, "UUIDString"));
        unsigned int v74 = [(id)v72 hasClientReceivedStableKeyIdentifier:v73];

        v187 = v63;
        __int16 v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v63, "UUIDString"));
        v177 = (void *)v72;
        LODWORD(v72) = [(id)v72 hasCachedStableKeyIdentifier:v75];

        os_unfair_lock_unlock(&self->_lock);
        unsigned int v70 = v72 & v74 ^ 1 | v185;
        if ((v70 & 1) == 0)
        {
          __int128 v76 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          unint64_t v60 = v180;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v187, "UUIDString"));
            *(_DWORD *)buf = 138412290;
            v224 = v77;
            _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: has cached SKM. {SKI: %@}",  buf,  0xCu);
          }

          unsigned int v70 = 0;
          id v21 = v191;
          __int16 v69 = v187;
          goto LABEL_68;
        }

        id v21 = v191;
        __int16 v69 = v63;
      }

      unint64_t v60 = v180;
LABEL_68:
      int v45 = v198;

LABEL_69:
LABEL_70:

      id v19 = v204;
LABEL_71:
      if (((v45 | v70) & 1) == 0)
      {
        __int16 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        v207 = v80;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: not received any valid MKM or SKM",  buf,  2u);
        }

        id v47 = 0LL;
        BOOL v48 = v212;
        __int128 v49 = (os_log_s *)v200;
        id v33 = v189;
        goto LABEL_213;
      }

      unsigned int v183 = v70;
      v186 = self;
      v188 = v69;
      id v192 = v21;
      unsigned int v181 = v60;
      if (-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
      {
        v207 = (os_log_s *)[v199 mutableCopy];
        id v78 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v224 = (os_log_s *)v199;
          _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: the simulator can't decrypt protectedMKMData %@",  buf,  0xCu);
        }

        id v205 = 0LL;
        __int16 v79 = v201;
        id v33 = v189;
        goto LABEL_191;
      }

      if (a11 || a12)
      {
        if (a11) {
          double v81 = v211;
        }
        else {
          double v81 = (os_log_s *)v212;
        }
        __int16 v82 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s _numberForKey:]( v81,  "_numberForKey:",  IDSDSessionMessageRealTimeEncryptionWrapModeKey));
        uint64_t v208 = [v82 integerValue] == (id)1;
      }

      else
      {
        uint64_t v208 = -1LL;
      }

      id v33 = v189;
      __int16 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        v206 = -[IDSRealTimeEncryptionIdentity publicIdentity](self->_identityForDevice, "publicIdentity");
        if (v198) {
          unsigned int v84 = @"YES";
        }
        else {
          unsigned int v84 = @"NO";
        }
        if (v183) {
          id v85 = @"YES";
        }
        else {
          id v85 = @"NO";
        }
        if (v203) {
          BOOL v86 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v203, "UUIDString"));
        }
        else {
          BOOL v86 = 0LL;
        }
        if (v69) {
          BOOL v87 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v69, "UUIDString"));
        }
        else {
          BOOL v87 = 0LL;
        }
        *(_DWORD *)buf = 138413826;
        v224 = v206;
        __int16 v225 = 2112;
        id v226 = (id)v84;
        __int16 v227 = 2112;
        v228 = (__SecKey *)v85;
        __int16 v229 = 2112;
        v230 = v86;
        __int16 v231 = 2112;
        v232 = v87;
        __int16 v233 = 2048;
        uint64_t v234 = v208;
        __int16 v235 = 2048;
        v236 = v201;
        _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: local pub key: %@, receivedValidMKM: %@, receivedValidSKM: %@, MKI: %@, SKI: %@ wra pMode: %llu, participantID: %llu",  buf,  0x48u);
        if (v69) {

        }
        id v19 = v204;
        self = v186;
        if (v203) {
      }
        }

      unsigned int v88 = v198;
      if (v198)
      {
        v89 = -[IDSRealTimeEncryptionIdentity fullIdentity](self->_identityForDevice, "fullIdentity");
        id v220 = 0LL;
        uint64_t v90 = objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping unwrapSeed:usingKey:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "unwrapSeed:usingKey:legacy:error:",  v199,  v89,  v208 == 0,  &v220));
        id v91 = v220;
        id v92 = v91;
        if ((!v90 || v91) && self->_previousIdentityForDevice)
        {
          __int16 v93 = (os_log_s *)v91;
          v178 = (void *)v90;
          unsigned __int8 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v95 = -[IDSRealTimeEncryptionIdentity publicIdentity](self->_identityForDevice, "publicIdentity");
            id v96 = -[IDSRealTimeEncryptionIdentity publicIdentity](self->_previousIdentityForDevice, "publicIdentity");
            *(_DWORD *)buf = 138412802;
            v224 = v93;
            __int16 v225 = 2112;
            id v226 = v95;
            __int16 v227 = 2112;
            v228 = v96;
            _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: MKM: failed SecMWCopyUnwrappedSessionSeed (error: %@) local pub key %@, but try again using the previous identity %@",  buf,  0x20u);
          }

          __int16 v97 = -[IDSRealTimeEncryptionIdentity fullIdentity](self->_previousIdentityForDevice, "fullIdentity");
          id v219 = 0LL;
          uint64_t v90 = objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping unwrapSeed:usingKey:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "unwrapSeed:usingKey:legacy:error:",  v199,  v97,  v208 == 0,  &v219));
          id v92 = v219;
        }

        unsigned int v88 = v198;
      }

      else
      {
        id v92 = 0LL;
        uint64_t v90 = 0LL;
      }

      v176 = v92;
      v179 = (void *)v90;
      unsigned int v98 = v183;
      if (v183)
      {
        __int16 v99 = -[IDSRealTimeEncryptionIdentity fullIdentity](self->_identityForDevice, "fullIdentity");
        id v218 = 0LL;
        dispatch_queue_attr_t v100 = (void *)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping unwrapSeed:usingKey:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "unwrapSeed:usingKey:legacy:error:",  v193,  v99,  v208 == 0,  &v218));
        __int16 v101 = (os_log_s *)v218;
        if ((!v100 || v101) && self->_previousIdentityForDevice)
        {
          v174 = v101;
          CFTypeRef v102 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v103 = -[IDSRealTimeEncryptionIdentity publicIdentity](self->_identityForDevice, "publicIdentity");
            int64_t v104 = -[IDSRealTimeEncryptionIdentity publicIdentity](self->_previousIdentityForDevice, "publicIdentity");
            *(_DWORD *)buf = 138412802;
            v224 = v174;
            __int16 v225 = 2112;
            id v226 = v103;
            __int16 v227 = 2112;
            v228 = v104;
            _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: SKM: failed SecMWCopyUnwrappedSessionSeed (error: %@) local pub key %@, but try again using the previous identity %@",  buf,  0x20u);
          }

          v105 = -[IDSRealTimeEncryptionIdentity fullIdentity](self->_previousIdentityForDevice, "fullIdentity");
          id v217 = 0LL;
          uint64_t v106 = objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping unwrapSeed:usingKey:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "unwrapSeed:usingKey:legacy:error:",  v100,  v105,  v208 == 0,  &v217));
          int v107 = (os_log_s *)v217;

          __int16 v101 = v107;
          dispatch_queue_attr_t v100 = (void *)v106;
        }

        id v92 = v176;
        uint64_t v90 = (uint64_t)v179;
        unsigned int v98 = v183;
        if (!v198) {
          goto LABEL_120;
        }
      }

      else
      {
        __int16 v101 = 0LL;
        dispatch_queue_attr_t v100 = 0LL;
        if (!v88)
        {
LABEL_120:
          int v108 = 0;
          goto LABEL_128;
        }
      }

      if (v90) {
        BOOL v109 = v92 == 0LL;
      }
      else {
        BOOL v109 = 0;
      }
      int v108 = !v109;
LABEL_128:
      v173 = v100;
      if (v98)
      {
        if (v100) {
          BOOL v110 = v101 == 0LL;
        }
        else {
          BOOL v110 = 0;
        }
        int v111 = !v110;
      }

      else
      {
        int v111 = 0;
      }

      v175 = v101;
      if (byte_1009BEC48) {
        int v112 = 1;
      }
      else {
        int v112 = v108;
      }
      char v172 = v112 | v111;
      if ((v112 | v111) == 1)
      {
        if (byte_1009BEC48)
        {
          id v113 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: force starting the key recovery logic on this device",  buf,  2u);
          }

          byte_1009BEC48 = 0;
        }

        v114 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v115 = -[IDSRealTimeEncryptionIdentity publicIdentity](v186->_identityForDevice, "publicIdentity");
          v116 = @"NO";
          *(_DWORD *)buf = 138413314;
          v224 = (os_log_s *)v176;
          if (v108) {
            v117 = @"YES";
          }
          else {
            v117 = @"NO";
          }
          __int16 v225 = 2112;
          id v226 = v175;
          if (v111) {
            v116 = @"YES";
          }
          __int16 v227 = 2112;
          v228 = v115;
          __int16 v229 = 2112;
          v230 = v117;
          __int16 v231 = 2112;
          v232 = v116;
          _os_log_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: failed SecMWCopyUnwrappedSessionSeed (MKMError: %@, SKMError: %@) local pub key % @ (MKMProcessingFailed: %@, SKMProcessingFailed: %@)",  buf,  0x34u);
        }

        id v209 = -[os_log_s mutableCopy](v211, "mutableCopy");
        uint64_t v118 = v198;
        if (v209) {
          unsigned int v119 = v198;
        }
        else {
          unsigned int v119 = 0;
        }
        if (v119 == 1)
        {
          [v209 setObject:v213 forKeyedSubscript:IDSGroupSessionMessagesFromIDKey];
          [v209 setObject:v20 forKeyedSubscript:IDSGroupSessionMessagesGroupIDKey];
          [v209 setObject:v192 forKeyedSubscript:IDSDSessionMessageSessionID];
          v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v201));
          [v209 setObject:v120 forKeyedSubscript:IDSRealTimeEncryptionParticipantID];

          uint64_t v118 = v198;
        }

        id v121 = [v212 mutableCopy];
        v122 = v121;
        uint64_t v123 = v183;
        if (v121) {
          unsigned int v124 = v183;
        }
        else {
          unsigned int v124 = 0;
        }
        if (v124 == 1)
        {
          [v121 setObject:v213 forKeyedSubscript:IDSGroupSessionMessagesFromIDKey];
          [v122 setObject:v20 forKeyedSubscript:IDSGroupSessionMessagesGroupIDKey];
          [v122 setObject:v192 forKeyedSubscript:IDSDSessionMessageSessionID];
          v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v201));
          [v122 setObject:v125 forKeyedSubscript:IDSRealTimeEncryptionParticipantID];

          uint64_t v123 = v183;
          uint64_t v118 = v198;
        }

        id v19 = v204;
        if (a9
          && -[IDSGroupEncryptionController1 _storePendingKeyMaterial:stableKeyMaterial:hasValidMKM:hasValidSKM:forDevice:]( v186,  "_storePendingKeyMaterial:stableKeyMaterial:hasValidMKM:hasValidSKM:forDevice:",  v209,  v122,  v118,  v123,  v204)
          && (v126 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v186->_participantsForGroup,  "objectForKeyedSubscript:",  v20)),  unsigned int v127 = [v126 containsObject:v204],  v126,  v127))
        {
          realtimeEncryptionQueue = (dispatch_queue_s *)v186->_realtimeEncryptionQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100189B7C;
          block[3] = &unk_1008F5F58;
          void block[4] = v186;
          v215 = v204;
          v216 = v20;
          dispatch_async(realtimeEncryptionQueue, block);

          id v21 = v192;
          __int16 v69 = v188;
        }

        else
        {
          BOOL v134 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          id v21 = v192;
          __int16 v69 = v188;
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            if (v211) {
              id v135 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v211,  "objectForKeyedSubscript:",  IDSRealTimeEncryptionMKI));
            }
            else {
              id v135 = 0LL;
            }
            if (v212) {
              v136 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKI]);
            }
            else {
              v136 = 0LL;
            }
            id v137 = @"NO";
            *(_DWORD *)buf = 138412802;
            v224 = v135;
            __int16 v225 = 2112;
            if (a9) {
              id v137 = @"YES";
            }
            id v226 = v136;
            __int16 v227 = 2112;
            v228 = (__SecKey *)v137;
            _os_log_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: skip _startKeyRecoveryForMKM for MKI %@ SKI: %@. this is already in the pending key material list, or, it's not from the key owner.(fromSender: %@)",  buf,  0x20u);
            if (v212) {

            }
            if (v211) {
            id v21 = v192;
            }
            __int16 v69 = v188;
          }
        }

        if (a10)
        {
          id v138 = v21;
          v139 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: setting error",  buf,  2u);
          }

          NSErrorUserInfoKey v221 = NSDebugDescriptionErrorKey;
          v222 = @"Failed to decrypt key material";
          v140 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v222,  &v221,  1LL));
          *a10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSRealTimeEncryptionControllerErrorDomain",  -2000LL,  v140));

          id v21 = v138;
          __int16 v69 = v188;
        }

        id v205 = 0LL;
        v207 = 0LL;
        v132 = v179;
        v133 = v173;
      }

      else
      {
        os_unfair_lock_lock(&v186->_lock);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v186->_pendingMasterKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v19);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v186->_pendingStableKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v19);
        os_unfair_lock_unlock(&v186->_lock);
        v129 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        {
          pendingMasterKeyMaterials = v186->_pendingMasterKeyMaterials;
          pendingStableKeyMaterials = v186->_pendingStableKeyMaterials;
          *(_DWORD *)buf = 138412802;
          v224 = (os_log_s *)v19;
          __int16 v225 = 2112;
          id v226 = pendingMasterKeyMaterials;
          __int16 v227 = 2112;
          v228 = (__SecKey *)pendingStableKeyMaterials;
          _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: SecMWCopyUnwrappedSessionSeed succeeded. Removed the pending key material for %@ (_pendingMasterKeyMaterials: %@), _pendingStableKeyMaterials: %@",  buf,  0x20u);
        }

        v132 = v179;
        v207 = v179;
        v133 = v173;
        id v205 = v173;
        id v21 = v192;
        __int16 v69 = v188;
      }

      if ((v172 & 1) != 0)
      {
        id v47 = 0LL;
        __int128 v49 = (os_log_s *)v200;
LABEL_212:

        BOOL v48 = v212;
LABEL_213:

LABEL_214:
        goto LABEL_215;
      }

      __int16 v79 = v201;
      unint64_t v60 = v181;
LABEL_191:
      if (v207)
      {
        unsigned int v141 = v203;
        v142 = -[IDSGroupEncryptionKeyMaterial initWithKeyMaterial:keySalt:keyIndex:groupID:generationCounter:participantID:]( objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial),  "initWithKeyMaterial:keySalt:keyIndex:groupID:generationCounter:participantID:",  v207,  v196,  v203,  v20,  v184,  v79);
        v143 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyMaterial](v142, "keyMaterial"));
          v145 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keySalt](v142, "keySalt"));
          v146 = (__SecKey *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v142, "keyIndex"));
          *(_DWORD *)buf = 138478595;
          v224 = v144;
          __int16 v225 = 2112;
          id v226 = v145;
          __int16 v227 = 2112;
          v228 = v146;
          __int16 v229 = 2048;
          v230 = v79;
          _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: done: MKM: %{private}@ MKS: %@ MKI: %@, participantID: %llu",  buf,  0x2Au);

          unsigned int v141 = v203;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v200,  "setObject:forKeyedSubscript:",  v142,  @"ids-rtencryption-master-key-material-key");
        p_os_unfair_lock_t lock = &v186->_lock;
        os_unfair_lock_lock(&v186->_lock);
        id v148 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v186->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v20));
        if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform]( &OBJC_CLASS___IDSGroupEncryptionController1,  "isKeyRatchetingEnabledForPlatform"))
        {
          [v148 noteReceivedFirstKeyMaterial:v142 forRemoteParticipant:v79];
        }

        v202 = v79;
        __int128 v149 = v141;
        __int128 v150 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v141, "UUIDString"));
        unsigned __int8 v151 = [v148 hasClientReceivedMasterKeyIdentifier:v150];

        if ((v151 & 1) != 0)
        {
          os_unfair_lock_unlock(p_lock);
          __int128 v152 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v142, "keyIndex"));
            *(_DWORD *)buf = 138412290;
            v224 = v153;
            _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: not delivering key material to client -- already delivered MKI: %@",  buf,  0xCu);
          }
        }

        else
        {
          __int128 v154 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v149, "UUIDString"));
          [v148 noteClientReceiptOfMasterKeyIdentifier:v154];

          os_unfair_lock_unlock(p_lock);
          [v30 recvKeyMaterial:v142];
          -[IDSGroupEncryptionKeyMaterial setIsSentToClient:](v142, "setIsSentToClient:", 1LL);
        }

        __int16 v79 = v202;
        unint64_t v60 = v181;
        -[IDSGroupEncryptionController1 requestPendingKeyMaterialsForGroup:sessionID:]( v186,  "requestPendingKeyMaterialsForGroup:sessionID:",  v20,  v192);

        id v19 = v204;
        __int16 v69 = v188;
      }

      if (v205)
      {
        __int128 v155 = -[IDSGroupEncryptionKeyMaterial initWithKeyMaterial:keySalt:keyIndex:groupID:generationCounter:participantID:]( objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial),  "initWithKeyMaterial:keySalt:keyIndex:groupID:generationCounter:participantID:",  v205,  v195,  v69,  v20,  v60,  v79);
        __int128 v156 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        v157 = v79;
        id v158 = v200;
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
        {
          v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyMaterial](v155, "keyMaterial"));
          v160 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keySalt](v155, "keySalt"));
          v161 = v155;
          v162 = (__SecKey *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v155, "keyIndex"));
          *(_DWORD *)buf = 138478595;
          v224 = v159;
          __int16 v225 = 2112;
          id v226 = v160;
          __int16 v227 = 2112;
          v228 = v162;
          __int16 v229 = 2048;
          v230 = v157;
          _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: done: SKM: %{private}@ SKS: %@ SKI: %@, participantID: %llu",  buf,  0x2Au);

          __int128 v155 = v161;
          id v158 = v200;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v158,  "setObject:forKeyedSubscript:",  v155,  @"ids-rtencryption-stable-key-material-key");
        v163 = &v186->_lock;
        os_unfair_lock_lock(&v186->_lock);
        v164 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v186->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v20));
        __int16 v165 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v188, "UUIDString"));
        v166 = v155;
        unsigned int v167 = [v164 hasClientReceivedStableKeyIdentifier:v165];

        if ((v167 ^ 1 | v185) == 1)
        {
          v168 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v188, "UUIDString"));
          [v164 noteClientReceiptOfStableKeyIdentifier:v168];

          -[IDSGroupEncryptionKeyMaterial setIsSentToClient:](v166, "setIsSentToClient:", 1LL);
          os_unfair_lock_unlock(v163);
          -[IDSGroupEncryptionController1 notifyStableKeyMaterialsReceivedForGroup:sessionID:]( v186,  "notifyStableKeyMaterialsReceivedForGroup:sessionID:",  v20,  v192);
        }

        else
        {
          os_unfair_lock_unlock(v163);
          v169 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionKeyMaterial keyIndex](v166, "keyIndex"));
            *(_DWORD *)buf = 138412290;
            v224 = v170;
            _os_log_impl( (void *)&_mh_execute_header,  v169,  OS_LOG_TYPE_DEFAULT,  "receivedAndSetKeyMaterial: not delivering key material to client -- already delivered SKI: %@",  buf,  0xCu);
          }
        }

        id v19 = v204;
        __int16 v69 = v188;
      }

      __int128 v49 = (os_log_s *)v200;
      id v47 = -[NSMutableDictionary copy](v200, "copy");
      id v21 = v192;
      goto LABEL_212;
    }

    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      v224 = v211;
      __int16 v225 = 2112;
      id v226 = v20;
      id v46 = "receivedAndSetKeyMaterial: Local has not joined. We'll drop this MKM %{private}@ for group %@";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v46, buf, 0x16u);
    }
  }

  id v47 = 0LL;
  BOOL v48 = v212;
LABEL_215:

  return v47;
}

- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionWithUniqueID:v7]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cachedMasterKeyMaterialCollection]);

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "masterKeyMaterials", 0));
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if (([v17 isGeneratedLocally] & 1) == 0
            && ([v17 isSentToClient] & 1) == 0)
          {
            [v9 recvKeyMaterial:v17];
            [v17 setIsSentToClient:1];
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v14);
    }
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10069F38C();
    }
  }
}

- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionWithUniqueID:v10]);

  if (v12)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (v8 && v9)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _locked_ensureGroupMasterKeyMaterialCacheForGroup:]( self,  "_locked_ensureGroupMasterKeyMaterialCacheForGroup:",  v14));

      id v16 = objc_alloc(&OBJC_CLASS___IDSGroupMasterKeyMaterialCollection);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
      __int128 v18 = -[IDSGroupMasterKeyMaterialCollection initWithMasterKeyMaterials:membershipURIs:]( v16,  "initWithMasterKeyMaterials:membershipURIs:",  v8,  v17);

      [v15 noteReceivedGroupMasterKeyMaterialCollection:v18];
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 groupID]);
        int v22 = 138412546;
        id v23 = v15;
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "noteReceivedGroupMasterKeyMaterials: updated the cache %@ for the group %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "noteReceivedGroupMasterKeyMaterials: couldn't find the session %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionWithUniqueID:v12]);

  if (v15)
  {
    os_unfair_lock_lock(&self->_lock);
    if (v10)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _ensureGroupStableKeyMaterialCacheForGroup:]( self,  "_ensureGroupStableKeyMaterialCacheForGroup:",  v16));

      id v24 = v11;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 updateGroupStableKeyMaterialCacheForPushToken:v11 SKM:v10]);
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
        *(_DWORD *)buf = 138412546;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "receivedGroupStableKeyMaterials: updated the cache %@ for the group %@",  buf,  0x16u);
      }

      os_unfair_lock_unlock(&self->_lock);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
      uint64_t v25 = v21;
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      [v15 recvStableKeyMaterialForFrameworkCache:v22];

      id v11 = v24;
      if (v18)
      {
        [v15 hasOutdatedSKI:v18];
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }

    -[IDSGroupEncryptionController1 notifyStableKeyMaterialsReceivedForGroup:sessionID:]( self,  "notifyStableKeyMaterialsReceivedForGroup:sessionID:",  v13,  v12);
  }

  else
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "receivedGroupStableKeyMaterials: couldn't find the session %@",  buf,  0xCu);
    }
  }
}

- (void)notifyStableKeyMaterialsReceivedForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionWithUniqueID:v7]);

  if (v9)
  {
    BOOL v26 = v9;
    id v27 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cachedStableKeyMaterialCollection]);

    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 stableKeyMaterials]);
      *(_DWORD *)buf = 138412290;
      int v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "notifyStableKeyMaterialsReceivedForGroup: keyMaterialCollection.stableKeyMaterials: %@",  buf,  0xCu);
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v25 = (os_log_s *)v11;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 stableKeyMaterials]);
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          __int128 v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          if (([v20 isSentToClient] & 1) == 0)
          {
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dictionaryRepresentation]);
            -[NSMutableArray addObject:](v12, "addObject:", v21);

            [v20 setIsSentToClient:1];
            int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              int v34 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "notifyStableKeyMaterialsReceivedForGroup: add stableKeyMaterial: %@ to updateArray",  buf,  0xCu);
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v17);
    }

    id v9 = v26;
    if (-[NSMutableArray count](v12, "count"))
    {
      id v23 = -[NSMutableArray copy](v12, "copy");
      [v26 recvStableKeyMaterialForFrameworkCache:v23];
    }

    id v6 = v27;
    id v24 = v25;
  }

  else
  {
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10069F3EC();
    }
  }
}

- (id)masterKeyMaterialForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v4));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 currentLocalMasterKeyMaterial]);
  id v8 = (void *)v7;
  if (!v6)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      id v10 = "We never got the key material for the group %@";
      goto LABEL_7;
    }

- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v5 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v5));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 currentLocalStableKeyMaterial]);
  id v9 = (void *)v8;
  if (!v7)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      id v11 = "We never got the stable key material for the group %@";
      goto LABEL_7;
    }

- (void)sendPendingKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 forDevice:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    pendingMasterKeyMaterials = self->_pendingMasterKeyMaterials;
    *(_DWORD *)buf = 138412546;
    id v24 = v10;
    __int16 v25 = 2112;
    BOOL v26 = pendingMasterKeyMaterials;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sendPendingKeyMaterialsToGroup: %@, pendingMasterKeyMaterials: %@",  buf,  0x16u);
  }

  id v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingMasterKeyMaterials,  "objectForKeyedSubscript:",  v12));
  if (v17)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pendingMasterKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v12);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      BOOL v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "sendPendingKeyMaterialsToGroup: %@ - found the pending key %@",  buf,  0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
    LOWORD(v22) = 1;
    LOBYTE(v21) = 1;
    id v19 =  -[IDSGroupEncryptionController1 receivedAndSetKeyMaterial:stableKeyMaterial:forDevice:fromURI:groupID:sessionID:fromSender:error:forMKM:forSKM:]( self,  "receivedAndSetKeyMaterial:stableKeyMaterial:forDevice:fromURI:groupID:sessionID:fromSender:error:forMKM:forSKM:",  v17,  0LL,  v12,  v13,  v10,  v11,  v21,  0LL,  v22);
  }

  else
  {
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "sendPendingKeyMaterialsToGroup: %@ - didn't find any pending keys.",  buf,  0xCu);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_protectedCachedKeyMaterialsForDestination:(id)a3 pushToken:(id)a4 forGroup:(id)a5 outURIs:(id *)a6 includePeers:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = (os_log_s *)a3;
  __int16 v67 = (os_log_s *)a4;
  id v12 = a5;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v66 = self;
  __int16 v62 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentLocalMasterKeyMaterial]);
  if (v7) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 groupMasterKeyCollectionToBroadcastForDestinationURI:v11]);
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 localMasterKeyCollectionToBroadcastForDestinationURI:v11]);
  }
  id v63 = (void *)v15;
  id v61 = v13;
  if (!v15)
  {
    os_unfair_lock_unlock(&self->_lock);
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v86 = v11;
      __int16 v87 = 2112;
      unsigned int v88 = (os_log_s *)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "_protectedCachedKeyMaterialsForDestination: keyMaterialCollection is nil for %@ (%@)!",  buf,  0x16u);
    }

    __int128 v56 = 0LL;
    goto LABEL_57;
  }

  os_unfair_lock_t lock = &self->_lock;
  id v65 = v14;
  __int16 v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_publicKeyForDevice, "allValues"));
  id v17 = [v16 countByEnumeratingWithState:&v81 objects:v95 count:16];
  if (!v17)
  {
LABEL_13:

    id v14 = v65;
    goto LABEL_50;
  }

  id v18 = v17;
  uint64_t v19 = *(void *)v82;
LABEL_7:
  uint64_t v20 = 0LL;
  while (1)
  {
    if (*(void *)v82 != v19) {
      objc_enumerationMutation(v16);
    }
    uint64_t v21 = *(void **)(*((void *)&v81 + 1) + 8 * v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pushToken]);
    unsigned int v23 = [v22 isEqual:v67];

    if (v23) {
      break;
    }
    if (v18 == (id)++v20)
    {
      id v18 = [v16 countByEnumeratingWithState:&v81 objects:v95 count:16];
      if (!v18) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
  }

  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 pushToken]);
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v21 publicKeyData]);
    *(_DWORD *)buf = 138412802;
    BOOL v86 = (os_log_s *)v21;
    __int16 v87 = 2112;
    unsigned int v88 = v25;
    __int16 v89 = 2112;
    id v90 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "_protectedCachedKeyMaterialsForDestination: Found _publicIdentity %@ for pushToken: %@ and publicKey: %@",  buf,  0x20u);
  }

  id v27 = v21;
  id v14 = v65;
  __int16 v75 = v27;
  if (!v27)
  {
LABEL_50:
    os_unfair_lock_unlock(lock);
    __int16 v75 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      sub_10069F44C();
    }
    __int128 v56 = 0LL;
    __int128 v29 = (os_log_s *)v64;
    goto LABEL_53;
  }

  id v58 = v11;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v63 masterKeyMaterials]);
  id v28 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
  __int128 v29 = (os_log_s *)v64;
  if (!v28) {
    goto LABEL_45;
  }
  id v30 = v28;
  uint64_t v31 = *(void *)v78;
  uint64_t v72 = IDSRealTimeEncryptionMKI;
  uint64_t v70 = IDSRealTimeEncryptionMKM;
  uint64_t v71 = IDSRealTimeEncryptionMKS;
  uint64_t v68 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
  uint64_t v69 = IDSRealTimeEncryptionParticipantID;
  uint64_t v73 = *(void *)v78;
  do
  {
    for (i = 0LL; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v78 != v31) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
      if (![v14 isEqual:v33])
      {
        id v35 = -[os_log_s wrapMode](v75, "wrapMode");
        if (v35 == (id)1)
        {
          uint64_t v36 = 0LL;
LABEL_29:
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v33 keyMaterial]);
          id v38 = -[os_log_s publicIdentity](v75, "publicIdentity");
          id v76 = 0LL;
          double v39 = (void *)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping wrapSeed:to:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "wrapSeed:to:legacy:error:",  v37,  v38,  v36,  &v76));
          int v34 = (os_log_s *)v76;

          if (v39) {
            BOOL v40 = v34 == 0LL;
          }
          else {
            BOOL v40 = 0;
          }
          if (!v40)
          {
            uint64_t v31 = v73;
            goto LABEL_37;
          }

          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v44 = (os_log_s *)-[os_log_s wrapMode](v75, "wrapMode");
            int v45 = -[IDSRealTimeEncryptionIdentity publicIdentity](v66->_identityForDevice, "publicIdentity");
            id v46 = -[os_log_s publicIdentity](v75, "publicIdentity");
            id v47 = (void *)objc_claimAutoreleasedReturnValue([v33 keyIndex]);
            BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v47 UUIDString]);
            *(_DWORD *)buf = 134218754;
            BOOL v86 = v44;
            __int16 v87 = 2112;
            unsigned int v88 = v45;
            __int16 v89 = 2112;
            id v90 = v46;
            __int128 v29 = (os_log_s *)v64;
            __int16 v91 = 2112;
            id v92 = v48;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "_protectedCachedKeyMaterialsForDestination: Encrypted the key material - wrapMode: %llu, local pub key: %@ , remote pub key: %@, MKI: %@",  buf,  0x2Au);

            id v14 = v65;
          }

          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v33 keyIndex]);
          uint64_t v50 = IDSGetUUIDDataFromNSUUID(v49);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v51, v72);

          id v52 = (void *)objc_claimAutoreleasedReturnValue([v33 keySalt]);
          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v52, v71);

          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v39, v70);
          unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v33 participantID]));
          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v53, v69);

          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[os_log_s wrapMode](v75, "wrapMode")));
          -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v54, v68);

          -[os_log_s addObject:](v29, "addObject:", Mutable);
          int v34 = 0LL;
          uint64_t v31 = v73;
        }

        else
        {
          if (!v35)
          {
            uint64_t v36 = 1LL;
            goto LABEL_29;
          }

          unsigned int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            sub_10069F4AC((uint64_t)v93, v75);
          }

          double v39 = 0LL;
          int v34 = 0LL;
LABEL_37:
          CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(Mutable, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v86 = v67;
            __int16 v87 = 2112;
            unsigned int v88 = v34;
            _os_log_error_impl( (void *)&_mh_execute_header,  Mutable,  OS_LOG_TYPE_ERROR,  "_protectedCachedKeyMaterialsForDestination: Couldn't protect the key material for pushToken: %@ (error: %@)",  buf,  0x16u);
          }
        }

        goto LABEL_43;
      }

      int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v86 = (os_log_s *)v33;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "_protectedCachedKeyMaterialsForDestination: This is the local key material -- ignoring { keyMaterial: %@ }",  buf,  0xCu);
      }

- (void)resetMKMLocalSentStatus:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLocalMasterKeyMaterial]);
  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "resetMKMLocalSentStatus: reset MKM %@ status",  buf,  0xCu);
    }

    [v4 setIsSentToClient:0];
  }

  id v14 = v4;
  uint64_t v15 = v3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 cachedMasterKeyMaterialCollection]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 masterKeyMaterials]);
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "resetMKMLocalSentStatus: from cache: reset MKM %@ status",  buf,  0xCu);
        }

        [v11 setIsSentToClient:0];
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  [v15 resetClientMasterKeyIdentifierReceipts];
}

- (void)resetSKMLocalSentStatus:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  a3));
  [v3 resetSKMSentToClientStatus];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLocalStableKeyMaterial]);
  id v5 = v4;
  if (v4)
  {
    [v4 setIsSentToClient:0];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "resetSKMLocalSentStatus: reset SKM %@ status",  buf,  0xCu);
    }
  }

  uint64_t v15 = v5;
  __int128 v16 = v3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 cachedStableKeyMaterialCollection]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 stableKeyMaterials]);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        [v12 setIsSentToClient:0];
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v23 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "resetSKMLocalSentStatus: from cache: reset SKM %@ status",  buf,  0xCu);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }
}

- (void)resetKeyMaterialLocalSentStatus:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[IDSGroupEncryptionController1 resetMKMLocalSentStatus:](self, "resetMKMLocalSentStatus:", v5);
  -[IDSGroupEncryptionController1 resetSKMLocalSentStatus:](self, "resetSKMLocalSentStatus:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)destinationsExcludingSelfForDestinations:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v18;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v16 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (-[IDSGroupEncryptionController1 _isValidPushToken:](self, "_isValidPushToken:", v13, v16, (void)v17)
          && [v13 isEqual:v5])
        {
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v22 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: filtering out own push token %@",  buf,  0xCu);
          }
        }

        else
        {
          [v6 addObject:v13];
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v10);
  }

  return v6;
}

- (void)_sendKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldIncludeCachedPeerKeyMaterial:(BOOL)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8
{
  BOOL v178 = a8;
  BOOL v8 = a7;
  BOOL v172 = a6;
  id v198 = a3;
  id v180 = a4;
  id v146 = a5;
  -[IDSGroupEncryptionController1 removeExpiredPrekeys](self, "removeExpiredPrekeys");
  v202 = self;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v189 = v8;
  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v198));
    v171 = (void *)objc_claimAutoreleasedReturnValue([v12 currentLocalMasterKeyMaterial]);
    __int128 v153 = (void *)objc_claimAutoreleasedReturnValue([v171 keyMaterial]);
  }

  else
  {
    __int128 v153 = 0LL;
    v171 = 0LL;
    id v12 = 0LL;
  }

  if (v178)
  {
    v145 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v198));
    v164 = (void *)objc_claimAutoreleasedReturnValue([v145 currentLocalStableKeyMaterial]);
    v144 = (void *)objc_claimAutoreleasedReturnValue([v164 keyMaterial]);
  }

  else
  {
    v164 = 0LL;
    v144 = 0LL;
    v145 = 0LL;
  }

  unsigned int v141 = v12;
  if (!v8
    || (id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentLocalMasterKeyMaterial]),
        v13,
        v13)
    && v153)
  {
    int v14 = 0;
  }

  else
  {
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v198;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v153;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "sendKeyMaterialsToGroup: There is no key material yet for %@. This shouldn't happen... (keyMaterialCache: %@, mkmData: %@)",  buf,  0x20u);
    }

    int v14 = 1;
  }

  if (!v178
    || (__int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v145 currentLocalStableKeyMaterial]),
        v16,
        v16)
    && v144)
  {
    char v143 = 0;
  }

  else
  {
    v139 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v139, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v198;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v145;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v144;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_FAULT,  "sendKeyMaterialsToGroup: There is no stable key material yet for %@. This shouldn't happen... (stableKeyMaterial Cache: %@, skmData: %@)",  buf,  0x20u);
    }

    if (v14)
    {
      v140 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: both hasValidMKM and hasValidSKM are invalid, return",  buf,  2u);
      }

      os_unfair_lock_unlock(lock);
      id v138 = v12;
      goto LABEL_149;
    }

    char v143 = 1;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 destinationsExcludingSelfForDestinations:]( self,  "destinationsExcludingSelfForDestinations:",  v146));
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: destinations: %@",  buf,  0xCu);
  }

  v142 = v17;
  id v19 = [v17 count];
  __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      participantsForGroup = self->_participantsForGroup;
      if (v189) {
        unsigned int v23 = @"YES";
      }
      else {
        unsigned int v23 = @"NO";
      }
      if (v178) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      *(_DWORD *)buf = 138414082;
      *(void *)&uint8_t buf[4] = v198;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v24;
      __int16 v231 = 2112;
      id v232 = v153;
      __int16 v233 = 2112;
      uint64_t v234 = v141;
      __int16 v235 = 2112;
      v236 = v144;
      __int16 v237 = 2112;
      id v238 = v145;
      __int16 v239 = 2112;
      v240 = participantsForGroup;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: %@, requireMKM: %@, requireSKM: %@, mkmData: %@, keyMaterialCache: %@, skmData: %@, sta bleKeyMaterialCache: %@, _participantsForGroup: %@",  buf,  0x52u);
    }

    __int128 v222 = 0u;
    __int128 v223 = 0u;
    __int128 v220 = 0u;
    __int128 v221 = 0u;
    id obj = v142;
    id v201 = [obj countByEnumeratingWithState:&v220 objects:v249 count:16];
    if (v201)
    {
      uint64_t v200 = *(void *)v221;
      char v148 = v14 | !v189;
      __int16 v25 = @"YES";
      if (v189) {
        BOOL v26 = @"YES";
      }
      else {
        BOOL v26 = @"NO";
      }
      unsigned __int8 v151 = v26;
      uint64_t v170 = IDSFanoutMessageGroupIDKey;
      if (!v178) {
        __int16 v25 = @"NO";
      }
      __int128 v150 = v25;
      uint64_t v169 = IDSDSessionMessageSessionID;
      uint64_t v163 = IDSRealTimeEncryptionMKI;
      uint64_t v162 = IDSRealTimeEncryptionMKS;
      id v27 = &IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey;
      uint64_t v161 = IDSRealTimeEncryptionMKM;
      uint64_t v160 = IDSRealTimeEncryptionMKGC;
      uint64_t v167 = IDSRealTimeEncryptionParticipantID;
      uint64_t v168 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
      uint64_t v158 = IDSRealTimeEncryptionSKI;
      uint64_t v159 = IDSDSessionMessageRealTimeEncryptionKeyMaterialKey;
      uint64_t v156 = IDSRealTimeEncryptionSKM;
      uint64_t v157 = IDSRealTimeEncryptionSKS;
      uint64_t v154 = IDSDSessionMessageRealTimeEncryptionStableKeyMaterialKey;
      uint64_t v155 = IDSRealTimeEncryptionSKGC;
      uint64_t v147 = IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey;
      uint64_t v152 = IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsURIsKey;
      do
      {
        id v28 = 0LL;
        do
        {
          if (*(void *)v221 != v200) {
            objc_enumerationMutation(obj);
          }
          __int128 v29 = *(void **)(*((void *)&v220 + 1) + 8LL * (void)v28);
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNull, v27);
          if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
          {
            uint64_t v31 = 0LL;
            unsigned __int8 v32 = 0LL;
            id v33 = 0LL;
LABEL_103:

            goto LABEL_104;
          }

          __int128 v218 = 0u;
          __int128 v219 = 0u;
          __int128 v216 = 0u;
          __int128 v217 = 0u;
          int v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v202->_publicKeyForDevice, "allValues"));
          id v35 = [v34 countByEnumeratingWithState:&v216 objects:v248 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = v28;
            uint64_t v38 = *(void *)v217;
            while (2)
            {
              for (i = 0LL; i != v36; i = (char *)i + 1)
              {
                if (*(void *)v217 != v38) {
                  objc_enumerationMutation(v34);
                }
                BOOL v40 = *(void **)(*((void *)&v216 + 1) + 8LL * (void)i);
                unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue([v40 pushToken]);
                unsigned int v42 = [v41 isEqual:v29];

                if (v42)
                {
                  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v40 pushToken]);
                    int v45 = (void *)objc_claimAutoreleasedReturnValue([v40 publicKeyData]);
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v40;
                    *(_WORD *)&_BYTE buf[12] = 2112;
                    *(void *)&buf[14] = v44;
                    *(_WORD *)&buf[22] = 2112;
                    *(void *)&buf[24] = v45;
                    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Found _publicIdentity %@ for pushToken: %@ and publicKey: %@",  buf,  0x20u);
                  }

                  id v33 = v40;
                  goto LABEL_53;
                }
              }

              id v36 = [v34 countByEnumeratingWithState:&v216 objects:v248 count:16];
              if (v36) {
                continue;
              }
              break;
            }

            id v33 = 0LL;
LABEL_53:
            id v28 = v37;
          }

          else
          {
            id v33 = 0LL;
          }

          if (-[IDSGroupEncryptionController1 isTestRunning](v202, "isTestRunning")
            || -[IDSGroupEncryptionController1 fakeMKMWrapping](v202, "fakeMKMWrapping"))
          {
            *(void *)&__int128 v46 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&buf[16] = v46;
            *(_OWORD *)buf = v46;
            arc4random_buf(buf, 0x20uLL);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 32LL));
            id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v244 = 138412546;
              v245 = v31;
              __int16 v246 = 2112;
              id v247 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: the test is going to use protectedMKMData %@, publicIdentity %@",  v244,  0x16u);
            }

            -[IDSGroupEncryptionController1 _sendingKeysToMembers:](v202, "_sendingKeysToMembers:", obj);
            unsigned __int8 v32 = 0LL;
            int v48 = 1;
            int v49 = 1;
            goto LABEL_60;
          }

          if (!v33)
          {
            loga = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v29;
              _os_log_error_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_ERROR,  "Couldn't find the publicIdentity for pushToken: %@",  buf,  0xCu);
            }

            uint64_t v31 = 0LL;
            unsigned __int8 v32 = 0LL;
            id v33 = 0LL;
            goto LABEL_91;
          }

          id v105 = [v33 wrapMode];
          if (v105 == (id)1)
          {
            uint64_t v106 = 0LL;
          }

          else
          {
            if (v105)
            {
              unsigned int v119 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT)) {
                sub_10069F4AC((uint64_t)v243, v33);
              }
              uint64_t v31 = 0LL;
              unsigned __int8 v32 = 0LL;
              loga = 0LL;
              id v120 = 0LL;
              goto LABEL_117;
            }

            uint64_t v106 = 1LL;
          }

          if ((v148 & 1) != 0)
          {
            uint64_t v31 = 0LL;
            loga = 0LL;
          }

          else
          {
            id v121 = (void *)objc_claimAutoreleasedReturnValue([v171 keyMaterial]);
            id v122 = [v33 publicIdentity];
            id v215 = 0LL;
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping wrapSeed:to:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "wrapSeed:to:legacy:error:",  v121,  v122,  v106,  &v215));
            loga = (os_log_s *)v215;
          }

          if (!v178 || (v143 & 1) != 0)
          {
            unsigned __int8 v32 = 0LL;
            id v120 = 0LL;
            goto LABEL_118;
          }

          unsigned int v119 = (os_log_s *)objc_claimAutoreleasedReturnValue([v164 keyMaterial]);
          id v123 = [v33 publicIdentity];
          id v214 = 0LL;
          unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping wrapSeed:to:legacy:error:]( &OBJC_CLASS___GFTKeyWrapping,  "wrapSeed:to:legacy:error:",  v119,  v123,  v106,  &v214));
          id v120 = v214;
LABEL_117:

LABEL_118:
          if (v189 && (!v31 || loga))
          {
            unsigned int v124 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&_BYTE buf[12] = 2112;
              *(void *)&buf[14] = loga;
              _os_log_error_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_ERROR,  "Couldn't protect the key material for pushToken: %@ (error: %@)",  buf,  0x16u);
            }

            int v48 = 0;
          }

          else
          {
            int v48 = 1;
          }

          if (v178 && (!v32 || v120))
          {
            v132 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v29;
              *(_WORD *)&_BYTE buf[12] = 2112;
              *(void *)&buf[14] = v120;
              _os_log_error_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_ERROR,  "Couldn't protect the stable key material for pushToken: %@ (error: %@)",  buf,  0x16u);
            }

            if (!v48)
            {

LABEL_91:
              goto LABEL_103;
            }

            int v49 = 0;
          }

          else
          {
            int v49 = 1;
          }

          v125 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
          {
            id v188 = [v33 wrapMode];
            unsigned int v184 = -[IDSRealTimeEncryptionIdentity publicIdentity](v202->_identityForDevice, "publicIdentity");
            id v182 = [v33 publicIdentity];
            id v195 = v33;
            v186 = v28;
            v126 = (void *)objc_claimAutoreleasedReturnValue([v171 keyIndex]);
            v193 = v31;
            unsigned int v127 = (void *)objc_claimAutoreleasedReturnValue([v126 UUIDString]);
            v128 = v32;
            v129 = (void *)objc_claimAutoreleasedReturnValue([v164 keyIndex]);
            id v191 = v120;
            v130 = (void *)objc_claimAutoreleasedReturnValue([v129 UUIDString]);
            id v131 = [v171 participantID];
            *(_DWORD *)buf = 138414338;
            *(void *)&uint8_t buf[4] = v29;
            *(_WORD *)&_BYTE buf[12] = 2048;
            *(void *)&buf[14] = v188;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v184;
            __int16 v231 = 2112;
            id v232 = v182;
            __int16 v233 = 2112;
            uint64_t v234 = v127;
            __int16 v235 = 2112;
            v236 = v130;
            __int16 v237 = 2048;
            id v238 = v131;
            __int16 v239 = 2112;
            v240 = (NSMutableDictionary *)v151;
            __int16 v241 = 2112;
            v242 = v150;
            _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: Encrypted key material for pushToken: %@, wrapMode: %llu, local pub key: %@, remo te pub key: %@, MKI: %@, SKI: %@, participantID: %llu, requireMKM: %@, requireSKM: %@",  buf,  0x5Cu);

            unsigned __int8 v32 = v128;
            id v28 = v186;
            id v33 = v195;

            id v120 = v191;
            uint64_t v31 = v193;
          }

LABEL_60:
          if (-[IDSGroupEncryptionController1 isTestRunning](v202, "isTestRunning")) {
            goto LABEL_103;
          }
          v187 = v32;
          id v192 = v31;
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v33 fromID]);
          id v51 = sub_1003B4704(v50);
          id v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v52));

          v194 = v33;
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v33 pushToken]);
          unsigned int v183 = v53;
          int v55 = (void *)objc_claimAutoreleasedReturnValue([v53 URIByAddingPushToken:v54]);

          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v55));
          v179 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v56));

          os_unfair_lock_unlock(lock);
          id v213 = 0LL;
          id v190 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _protectedCachedKeyMaterialsForDestination:pushToken:forGroup:outURIs:includePeers:]( v202,  "_protectedCachedKeyMaterialsForDestination:pushToken:forGroup:outURIs:includePeers:",  v55,  v29,  v198,  &v213,  v172));
          id v181 = v213;
          os_unfair_lock_lock(lock);
          v228[0] = v170;
          v228[1] = v169;
          v229[0] = v198;
          v229[1] = v180;
          id v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v229,  v228,  2LL));
          os_log_t log = (os_log_t)[v57 mutableCopy];

          int v185 = v28;
          if ((v48 & v189) == 1)
          {
            v226[0] = v163;
            v173 = (void *)objc_claimAutoreleasedReturnValue([v171 keyIndex]);
            uint64_t v58 = IDSGetUUIDDataFromNSUUID(v173);
            double v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
            v227[0] = v59;
            v226[1] = v162;
            unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v171 keySalt]);
            v227[1] = v60;
            v227[2] = v192;
            v226[2] = v161;
            v226[3] = v160;
            id v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v171 generationCounter]));
            v227[3] = v61;
            v226[4] = v168;
            __int16 v62 = v55;
            id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v194 wrapMode]));
            v227[4] = v63;
            v226[5] = v167;
            int v64 = v49;
            id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v171 participantID]));
            v227[5] = v65;
            unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v227,  v226,  6LL));
            id v67 = [v66 mutableCopy];
            -[os_log_s setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v67, v159);

            int v49 = v64;
            int v55 = v62;

            id v28 = v185;
          }

          int v174 = v49 & v178;
          if ((v49 & v178) == 1)
          {
            v224[0] = v158;
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v164 keyIndex]);
            uint64_t v69 = IDSGetUUIDDataFromNSUUID(v68);
            uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
            v225[0] = v70;
            v224[1] = v157;
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v164 keySalt]);
            v225[1] = v71;
            v225[2] = v187;
            v224[2] = v156;
            v224[3] = v155;
            __int16 v165 = v55;
            uint64_t v72 = v28;
            uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v164 generationCounter]));
            v225[3] = v73;
            v224[4] = v168;
            unsigned int v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v194 wrapMode]));
            v225[4] = v74;
            v224[5] = v167;
            __int16 v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v164 participantID]));
            v225[5] = v75;
            id v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v225,  v224,  6LL));
            id v77 = [v76 mutableCopy];
            -[os_log_s setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v77, v154);

            int v55 = v165;
            id v28 = v72;
          }

          id v33 = v194;
          __int128 v78 = v181;
          if (v189)
          {
            if ([v190 count] && v202->_shouldBroadcastAllValidMkMs) {
              -[os_log_s setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v190, v147);
            }
            if ([v181 count])
            {
              __int128 v79 = (void *)objc_claimAutoreleasedReturnValue([v181 allObjects]);
              __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "__imArrayByApplyingBlock:", &stru_1008FC3C0));
              -[os_log_s setObject:forKeyedSubscript:](log, "setObject:forKeyedSubscript:", v80, v152);
            }
          }

          __int128 v81 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          __int128 v82 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v202->_accountIDs,  "objectForKeyedSubscript:",  v198));
          __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v81 accountWithUniqueID:v82]);

          if (v83)
          {
            __int128 v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](v202, "sessionController"));
            id v85 = (void *)objc_claimAutoreleasedReturnValue([v84 sessionWithUniqueID:v180]);

            BOOL v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](v202, "sessionController"));
            __int16 v87 = (void *)objc_claimAutoreleasedReturnValue([v86 sessionWithGroupID:v198]);

            if ([v85 destinationsContainFromURI:v55]
              && (id v88 = [v87 destinationsContainFromURI:v55], (v88 & 1) != 0))
            {
              v166 = v83;
              uint64_t v90 = im_primary_queue(v88, v89);
              __int16 v91 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v90);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10018D11C;
              block[3] = &unk_1008FC438;
              void block[4] = v202;
              id v92 = v171;
              id v206 = v92;
              id v207 = v85;
              __int128 v149 = log;
              uint64_t v208 = v149;
              id v209 = v179;
              id v210 = v198;
              id v211 = v180;
              id v212 = v29;
              dispatch_block_t v93 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
              dispatch_async(v91, v93);

              unsigned __int8 v94 = v150;
              if (v174)
              {
                __int16 v95 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                {
                  id v96 = (void *)objc_claimAutoreleasedReturnValue([v164 keyIndex]);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v96;
                  *(_WORD *)&_BYTE buf[12] = 2112;
                  *(void *)&buf[14] = v183;
                  _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: Sent SKM: %@ to URI: (%@)",  buf,  0x16u);
                }

                unsigned __int8 v94 = @"YES";
              }

              __int16 v97 = (void *)objc_claimAutoreleasedReturnValue([v92 keyIndex]);
              v175 = v92;
              unsigned int v98 = v85;
              __int16 v99 = v55;
              dispatch_queue_attr_t v100 = (void *)objc_claimAutoreleasedReturnValue([v97 UUIDString]);
              __int16 v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"sendKeyMaterialsToGroup: requireMKM: %@, requireSKM: %@, Sent MKI %@ to URI: (%@) (pushToken: %@)(protectedMKM size: %lu)(MKM size: %lu)(message dict: %@)",  v151,  v94,  v100,  v183,  v29,  [v192 length],  objc_msgSend(v153, "length"),  v149));

              int v55 = v99;
              id v85 = v98;

              v203[0] = _NSConcreteStackBlock;
              v203[1] = 3221225472LL;
              v203[2] = sub_10018D40C;
              v203[3] = &unk_1008F6010;
              id v204 = v101;
              id v102 = v101;
              cut_dispatch_log_queue(v203);
              __int16 v103 = (void *)objc_claimAutoreleasedReturnValue([v29 rawToken]);
              [v175 sentToDevice:v103];

              int v104 = 0;
              id v28 = v185;
              __int128 v78 = v181;
              __int128 v83 = v166;
            }

            else
            {
              int v107 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v202->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v198));
              id v108 = [v107 mutableCopy];
              BOOL v109 = v108;
              if (v108) {
                id v110 = v108;
              }
              else {
                id v110 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
              }
              int v112 = v110;

              if (([v112 containsObject:v29] & 1) == 0)
              {
                [v112 addObject:v29];
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v202->_participantsWaitingForKeyMaterials,  "setObject:forKeyedSubscript:",  v112,  v198);
              }

              id v113 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              id v28 = v185;
              if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
              {
                v114 = (void *)objc_claimAutoreleasedReturnValue([v85 destinations]);
                v176 = v87;
                __int16 v115 = v83;
                v116 = v85;
                v117 = v55;
                uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v202->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v198));
                *(_DWORD *)buf = 138413314;
                *(void *)&uint8_t buf[4] = v183;
                *(_WORD *)&_BYTE buf[12] = 2112;
                *(void *)&buf[14] = v198;
                __int128 v78 = v181;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&buf[24] = v180;
                __int16 v231 = 2112;
                id v232 = v114;
                __int16 v233 = 2112;
                uint64_t v234 = v118;
                _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToGroup: aborting send of key material message to %@ for group %@ and session %@ since this destination is not in group membership: %@ (pending participants %@)",  buf,  0x34u);

                int v55 = v117;
                id v85 = v116;
                __int128 v83 = v115;
                __int16 v87 = v176;
              }

              int v104 = 3;
            }
          }

          else
          {
            int v111 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              accountIDs = v202->_accountIDs;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v198;
              *(_WORD *)&_BYTE buf[12] = 2112;
              *(void *)&buf[14] = accountIDs;
              _os_log_error_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_ERROR,  "sendKeyMaterialsToGroup: %@ - failed to get the account for this group! (accountsID %@)",  buf,  0x16u);
            }

            os_unfair_lock_unlock(lock);
            int v104 = 1;
          }

          if (!v104)
          {
            uint64_t v31 = v192;
            unsigned __int8 v32 = v187;
            goto LABEL_103;
          }

          if (v104 != 3)
          {

            goto LABEL_148;
          }

- (void)sendKeyMaterialsToLocal:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionWithUniqueID:v7]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentLocalMasterKeyMaterial]);

    if (!v11
      || (id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyIndex]), v12, !v12))
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10069F5B8();
      }
      goto LABEL_14;
    }

    if ([v11 isSentToClient])
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        __int128 v16 = v11;
        __int16 v17 = 2112;
        id v18 = v7;
        int v14 = "sendKeyMaterialsToLocal: currentLocalMKM %@ to the session %@, but already sent...";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0x16u);
      }
    }

    else
    {
      [v9 recvKeyMaterial:v11];
      [v11 setIsSentToClient:1];
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        __int128 v16 = v11;
        __int16 v17 = 2112;
        id v18 = v7;
        int v14 = "sendKeyMaterialsToLocal: currentLocalMKM %@ to the session %@";
        goto LABEL_13;
      }
    }

- (double)_multiwayFTMessageSendTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"]);

  double v5 = 605.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      if (v7 > 0.0)
      {
        double v8 = v7;
        __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 134217984;
          double v12 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with a send timeout of %f ",  (uint8_t *)&v11,  0xCu);
        }

        double v5 = v8;
      }
    }
  }

  return v5;
}

- (BOOL)_shouldEnforceRemoteTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-multiway-ftmessage-enforce-remote-timeout"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    unsigned int v6 = [v3 BOOLValue];
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = @"NO";
      if (v6) {
        double v8 = @"YES";
      }
      int v10 = 138412290;
      int v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with should enforce remote timeout %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)resetDevicePrekey
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset the device prekey", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  identityForDevice = self->_identityForDevice;
  self->_identityForDevice = 0LL;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)activeParticipantsForGroup:(id)a3
{
  if (a3)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v5));

    id v7 = [v6 copy];
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)removeLocalActiveParticipantForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  -[IDSGroupEncryptionController1 removeActiveParticipant:forGroup:](self, "removeActiveParticipant:forGroup:", v5, v4);
}

- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v8));
    id v11 = [v10 mutableCopy];

    double v12 = &IMInsertBoolsToXPCDictionary_ptr;
    if ([v11 containsObject:v6])
    {
      [v11 removeObject:v6];
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsForGroup,  "setObject:forKeyedSubscript:",  v11,  v8);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v8));
      id v14 = [v13 mutableCopy];

      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v50 objects:v61 count:16];
      id v44 = v11;
      int v45 = self;
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v51;
LABEL_6:
        uint64_t v19 = 0LL;
        while (1)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          __int128 v20 = *(void **)(*((void *)&v50 + 1) + 8 * v19);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v20]);

          if (v17 == (id)++v19)
          {
            id v17 = [v15 countByEnumeratingWithState:&v50 objects:v61 count:16];
            if (v17) {
              goto LABEL_6;
            }

            id v22 = 0LL;
            id v23 = 0LL;
            goto LABEL_16;
          }
        }

        id v23 = v20;
        id v22 = [v21 mutableCopy];
        [v22 removeObject:v6];

        if (v23)
        {
          [v15 setObject:v22 forKeyedSubscript:v23];
          self = v45;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v45->_groupIDToTypeToParticipantsPushTokens,  "setObject:forKeyedSubscript:",  v15,  v8);
          goto LABEL_17;
        }

- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_groupIDToKeyMaterialCache)
    {
      if (!+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform]( &OBJC_CLASS___IDSGroupEncryptionController1,  "isKeyRatchetingEnabledForPlatform")
        || v4)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "setObject:forKeyedSubscript:",  0LL,  v6);
      }
    }

    groupIDToStableKeyMaterialCache = self->_groupIDToStableKeyMaterialCache;
    if (groupIDToStableKeyMaterialCache)
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
      int v10 = v9;
      if (v9)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 currentLocalStableKeyMaterial]);
        [v10 setPreviousLocalStableKeyMaterial:v11];

        [v10 setCurrentLocalStableKeyMaterial:0];
        [v10 setSentToRemotes:0];
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "setObject:forKeyedSubscript:",  0LL,  v6);
    if (v4)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsForGroup,  "setObject:forKeyedSubscript:",  0LL,  v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsInfoForGroup,  "setObject:forKeyedSubscript:",  0LL,  v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "setObject:forKeyedSubscript:",  0LL,  v6);
    }

    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingMasterKeyMaterials = self->_pendingMasterKeyMaterials;
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    BOOL v21 = sub_10018E1EC;
    id v22 = &unk_1008FC460;
    id v14 = v6;
    id v23 = v14;
    id v15 = v12;
    id v24 = v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( pendingMasterKeyMaterials,  "enumerateKeysAndObjectsUsingBlock:",  &v19);
    -[NSMutableDictionary removeObjectsForKeys:]( self->_pendingMasterKeyMaterials,  "removeObjectsForKeys:",  v15,  v19,  v20,  v21,  v22);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      groupIDToKeyMaterialCache = self->_groupIDToKeyMaterialCache;
      uint64_t v18 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (v4) {
        uint64_t v18 = @"YES";
      }
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = groupIDToKeyMaterialCache;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "resetKeysForGroup: %@ keyMaterialCache: %@, shouldRemoveCurrentParticipants: %@",  buf,  0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)unsubscribeEndpointsForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_membersForGroup, "setObject:forKeyedSubscript:", 0LL, v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_membersLightweightStatusDict,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_endpointSubscriptionForGroup,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsForGroup,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsInfoForGroup,  "setObject:forKeyedSubscript:",  0LL,  v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "setObject:forKeyedSubscript:",  0LL,  v4);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      membersForGroup = self->_membersForGroup;
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      int v10 = membersForGroup;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "unsubscribeEndpointsForGroup: %@ updatedMembers: %@",  (uint8_t *)&v7,  0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)reportTimeDifferenceBetweenFirstPacketAndMKI:(int64_t)a3 forMKI:(id)a4 service:(id)a5 activeParticipants:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    int v14 = 134218242;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "reportTimeDifferenceBetweenFirstPacketAndMKI: timeDelta: %lld MKI: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
  [v13 IDSRealTimeEncryptionServiceName:v10 activeParticipants:a6 firstReceivedPacketMKMtimeDelta:a3];
}

- (void)ratchetAndSendKeyMaterialsToAVCForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 sessionWithUniqueID:v7]);

  double v59 = (void *)v9;
  if (v6 && v9)
  {
    os_unfair_lock_lock(&self->_lock);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 groupIDToKeyMaterialCache](self, "groupIDToKeyMaterialCache"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);

    if (v11)
    {
      __int16 v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstLocalMasterKeyMaterial]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 currentLocalMasterKeyMaterial]);
      int v14 = v13;
      if (v13) {
        BOOL v15 = (int)[v13 ratchetIndex] > 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v14) {
        BOOL v17 = 0;
      }
      else {
        BOOL v17 = v15;
      }
      if (((v12 == 0LL) & ~v15) != 0 || v17)
      {
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10069F688(v43, v44, v45, v46, v47, v48, v49, v50);
        }
      }

      else
      {
        id v57 = self;
        unsigned __int8 v18 = -[IDSGroupEncryptionController1 _alreadyLocked_shouldRatchetForGroup:]( self,  "_alreadyLocked_shouldRatchetForGroup:",  v6);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if ((v18 & 1) != 0)
        {
          os_unfair_lock_t lock = &self->_lock;
          if (v20)
          {
            BOOL v21 = @"YES";
            *(_DWORD *)buf = 138412802;
            id v67 = v6;
            __int16 v68 = 2112;
            if (v15) {
              BOOL v21 = @"NO";
            }
            id v69 = v7;
            __int16 v70 = 2112;
            uint64_t v71 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "ratchetAndSendKeyMaterialsToAVCForGroup for groupID: %@ sessionID: %@ isFirstRatchetForLocal: %@",  buf,  0x20u);
          }

          id v55 = v7;

          __int128 v52 = v14;
          __int128 v53 = v12;
          if (v15) {
            id v22 = v14;
          }
          else {
            id v22 = v12;
          }
          uint64_t v23 = objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 deriveKeyMaterial:withInfo:]( self,  "deriveKeyMaterial:withInfo:",  v22,  v6));
          [v11 setCurrentLocalMasterKeyMaterial:v23];
          __int128 v51 = (void *)v23;
          -[NSMutableArray addObject:](v58, "addObject:", v23);
          id v24 = v11;
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteMasterKeyMaterialCollectionToSend]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 masterKeyMaterials]);

          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          id obj = v26;
          id v27 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
          id v28 = v59;
          if (v27)
          {
            id v29 = v27;
            uint64_t v30 = *(void *)v61;
            do
            {
              for (i = 0LL; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v61 != v30) {
                  objc_enumerationMutation(obj);
                }
                unsigned __int8 v32 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
                unsigned int v33 = [v32 ratchetIndex];
                unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 deriveKeyMaterial:withInfo:]( self,  "deriveKeyMaterial:withInfo:",  v32,  v6));
                if (v33)
                {
                  -[NSMutableArray addObject:](v58, "addObject:", v34);
                  objc_msgSend( v24,  "updateLastRatchetedKeyMaterial:forRemoteParticipant:",  v34,  objc_msgSend(v32, "participantID"));
                  id v35 = [v32 participantID];
                  id v36 = (void *)objc_claimAutoreleasedReturnValue([v34 keyIndex]);
                  [v28 reportSendRatchetedMKMToAVCForParticipantID:v35 mki:v36];
                }

                else
                {
                  id v36 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 deriveKeyMaterial:withInfo:]( self,  "deriveKeyMaterial:withInfo:",  v34,  v6));
                  v64[0] = v34;
                  v64[1] = v36;
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v64,  2LL));
                  -[NSMutableArray addObjectsFromArray:](v58, "addObjectsFromArray:", v37);

                  objc_msgSend( v24,  "updateLastRatchetedKeyMaterial:forRemoteParticipant:",  v36,  objc_msgSend(v32, "participantID"));
                  id v38 = [v32 participantID];
                  id v39 = v6;
                  id v40 = (void *)objc_claimAutoreleasedReturnValue([v34 keyIndex]);
                  [v59 reportSendRatchetedMKMToAVCForParticipantID:v38 mki:v40];

                  id v41 = [v32 participantID];
                  unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v36 keyIndex]);
                  [v59 reportSendRatchetedMKMToAVCForParticipantID:v41 mki:v42];

                  id v6 = v39;
                  id v28 = v59;
                }

                self = v57;
              }

              id v29 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
            }

            while (v29);
          }

          -[IDSGroupEncryptionController1 _alreadyLocked_sendRatchetedKeyMaterials:toAVC:]( self,  "_alreadyLocked_sendRatchetedKeyMaterials:toAVC:",  v58,  v28);
          os_unfair_lock_unlock(lock);

          id v7 = v55;
          id v11 = v24;
          int v14 = v52;
          double v12 = v53;
          goto LABEL_43;
        }

        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We are staying put, sending current local key material %@ to AVC...",  buf,  0xCu);
        }

        [v59 recvKeyMaterial:v14];
      }

      os_unfair_lock_unlock(&self->_lock);
LABEL_43:

      goto LABEL_44;
    }

    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10069F618();
    }

    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10069F6F8();
    }
  }

- (BOOL)_alreadyLocked_shouldRatchetForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToLastMemberAddDate,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = v6;
  if (v5
    && ([v6 timeIntervalSince1970],
        double v9 = v8,
        [v5 timeIntervalSince1970],
        double v11 = v9 - v10,
        -[IDSGroupEncryptionController1 mkmRatchetMaxWaitWindow](self, "mkmRatchetMaxWaitWindow"),
        v11 < v12))
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSGroupEncryptionController1 mkmRatchetMaxWaitWindow](self, "mkmRatchetMaxWaitWindow");
      int v18 = 134217984;
      uint64_t v19 = (uint64_t)v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding a member within mkmRatchetMaxWaitWindow: %ld - not advancing ratchet",  (uint8_t *)&v18,  0xCu);
    }

    BOOL v15 = 0;
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_groupIDToLastMemberAddDate, "setObject:forKey:", v7, v4);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSGroupEncryptionController1 mkmRatchetMaxWaitWindow](self, "mkmRatchetMaxWaitWindow");
      int v18 = 134217984;
      uint64_t v19 = (uint64_t)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding a member past mkmRatchetMaxWaitWindow: %ld - we need to ratchet",  (uint8_t *)&v18,  0xCu);
    }

    BOOL v15 = 1;
  }

  return v15;
}

- (void)_alreadyLocked_sendRatchetedKeyMaterials:(id)a3 toAVC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&__int128 v8 = 138412546LL;
    __int128 v15 = v8;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController",  v15));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
          *(_DWORD *)buf = v15;
          BOOL v21 = v12;
          __int16 v22 = 2112;
          uint64_t v23 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Sending ratcheted key material %@ to AVC for the session %@ - and marking as sent...",  buf,  0x16u);
        }

        [v6 recvKeyMaterial:v12];
        [v12 setIsSentToClient:1];
        double v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v9);
  }
}

- (id)deriveKeyMaterial:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 keyIndex]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 deriveMKI:withInfo:](self, "deriveMKI:withInfo:", v8, v7));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 keyMaterial]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 deriveMKM:withInfo:](self, "deriveMKM:withInfo:", v10, v7));

    double v12 = (void *)objc_claimAutoreleasedReturnValue([v6 keySalt]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 deriveMKS:withInfo:](self, "deriveMKS:withInfo:", v12, v7));

    double v14 = objc_alloc(&OBJC_CLASS___IDSGroupEncryptionKeyMaterial);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 groupID]);
    __int128 v16 = -[IDSGroupEncryptionKeyMaterial initWithKeyMaterial:keySalt:keyIndex:groupID:participantID:]( v14,  "initWithKeyMaterial:keySalt:keyIndex:groupID:participantID:",  v11,  v13,  v9,  v15,  [v6 participantID]);

    else {
      uint64_t v17 = 1LL;
    }
    -[IDSGroupEncryptionKeyMaterial setRatchetIndex:](v16, "setRatchetIndex:", v17);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      BOOL v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Generated ratcheted key material: %@ from original: %@",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    __int128 v16 = 0LL;
  }

  return v16;
}

- (id)deriveMKM:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = [a3 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSHKDFWrapper deriveKeyMaterialFrom:info:]( &OBJC_CLASS____TtC17identityservicesd14IDSHKDFWrapper,  "deriveKeyMaterialFrom:info:",  v6,  v5));

  return v7;
}

- (id)deriveMKS:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = [a3 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSHKDFWrapper deriveRandomDataFrom:info:]( &OBJC_CLASS____TtC17identityservicesd14IDSHKDFWrapper,  "deriveRandomDataFrom:info:",  v6,  v5));

  return v7;
}

- (id)deriveMKI:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  [v6 getUUIDBytes:v13];

  -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", v13, 16LL);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSHKDFWrapper deriveRandomDataFrom:info:]( &OBJC_CLASS____TtC17identityservicesd14IDSHKDFWrapper,  "deriveRandomDataFrom:info:",  v7,  v5));

  id v9 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v10 = v8;
  double v11 = -[NSUUID initWithUUIDBytes:](v9, "initWithUUIDBytes:", [v10 bytes]);

  return v11;
}

+ (BOOL)isKeyRatchetingEnabledForPlatform
{
  return _os_feature_enabled_impl("IDS", "GFTKeyRatcheting");
}

- (double)mkmRatchetMaxWaitWindow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-rtencryption-mkm-ratchet-max-wait-window"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  double v6 = 5.0;
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    double v6 = (double)(uint64_t)[v3 integerValue];
  }

  return v6;
}

- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12
{
  BOOL v12 = a9;
  id v58 = a3;
  id v19 = a4;
  id v20 = a5;
  id v57 = a6;
  id v55 = a11;
  id v56 = a12;
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v20));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 accountWithUniqueID:v22]);

  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fromURIs, "objectForKeyedSubscript:", v20));
  id v25 = (void *)v24;
  if (v23 && v24)
  {
    *(void *)id v85 = 0LL;
    *(void *)&v85[8] = v85;
    *(void *)&v85[16] = 0x2020000000LL;
    LOBYTE(v86) = 0;
    v77[0] = 0LL;
    v77[1] = v77;
    v77[2] = 0x2020000000LL;
    char v78 = 0;
    int v26 = IMGetDomainBoolForKey(@"com.apple.ids", @"disableSendMKMPush") ^ 1;
    if (a7 != 211) {
      LOBYTE(v26) = 1;
    }
    if ((v26 & 1) != 0)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionWithUniqueID:v57]);

      if (a7 == 211 && a10)
      {
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "sendMessage: calling _generateMKMBlobForQRFromMessage",  buf,  2u);
        }

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _generateMKMBlobForQRFromMessage:account:destination:fromURI:]( self,  "_generateMKMBlobForQRFromMessage:account:destination:fromURI:",  v58,  v23,  v19,  v25));
        if (v31)
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472LL;
          v70[2] = sub_10018FAD8;
          v70[3] = &unk_1008FC488;
          __int16 v75 = v85;
          id v76 = v77;
          uint64_t v71 = (os_log_s *)v20;
          id v72 = v57;
          id v73 = v55;
          id v74 = v56;
          [v27 sendKeyMaterialMessageDataOverQR:v31 toDestination:v19 completionBlock:v70];

          unsigned __int8 v32 = v71;
        }

        else
        {
          unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v80 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Failed to generate a blob to send via QR, only using push {session: %@}",  buf,  0xCu);
          }
        }
      }

      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      id v33 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
      unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue([v25 unprefixedURI]);
      [v33 setFromID:v34];

      [v33 setMessage:v58];
      [v33 setEncryptPayload:1];
      [v33 setPriority:300];
      [v33 setDestinations:v19];
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      [v33 setCommand:v35];

      [v33 setIdentifier:v54];
      [v33 setAlwaysSkipSelf:1];
      uint64_t v36 = IDSGetUUIDData(v54);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      [v33 setMessageUUID:v37];

      [v33 setTimeout:a8];
      [v33 setIgnoreMaxRetryCount:1];
      [v33 setWantsResponse:1];
      if (v12) {
        objc_msgSend( v33,  "setEnforceRemoteTimeouts:",  -[IDSGroupEncryptionController1 _shouldEnforceRemoteTimeout](self, "_shouldEnforceRemoteTimeout"));
      }
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
      id v39 = [v38 count];

      if (v39)
      {
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
          *(_DWORD *)buf = 138412290;
          __int128 v80 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Group session encryption message requires lack of properties {requiredLackOfCapabilities: %@}",  buf,  0xCu);
        }

        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
        [v33 setRequireLackOfRegistrationProperties:v42];
      }

      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
      id v44 = [v43 count];

      if (v44)
      {
        uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
          *(_DWORD *)buf = 138412290;
          __int128 v80 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Group session encryption message requires properties {requiredCapabilities: %@}",  buf,  0xCu);
        }

        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
        [v33 setRequireAllRegistrationProperties:v47];
      }

      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        [v33 timeout];
        *(_DWORD *)buf = 138412802;
        __int128 v80 = v54;
        __int16 v81 = 2048;
        int64_t v82 = a7;
        __int16 v83 = 2048;
        uint64_t v84 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Sending group session encryption message { GUID: %@, command: %ld, timeout: %f }",  buf,  0x20u);
      }

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_10018FC48;
      v61[3] = &unk_1008FC4B0;
      id v50 = v54;
      id v62 = v50;
      id v67 = v85;
      __int16 v68 = v77;
      int64_t v69 = a7;
      id v63 = v20;
      id v64 = v57;
      id v65 = v55;
      id v66 = v56;
      [v23 sendMessageWithSendParameters:v33 willSendBlock:0 completionBlock:v61];
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sendMessage: Sent messageID %@ to the destination %@ command %@ (message: %@)",  v50,  v19,  v51,  v58));

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_10018FEBC;
      v59[3] = &unk_1008F6010;
      id v53 = v52;
      id v60 = v53;
      cut_dispatch_log_queue(v59);
    }

    else
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "sendMessage: do not send MKM over push, return",  buf,  2u);
      }
    }

    _Block_object_dispose(v77, 8);
    _Block_object_dispose(v85, 8);
  }

  else
  {
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v85 = 138412802;
      *(void *)&v85[4] = v23;
      *(_WORD *)&v85[12] = 2112;
      *(void *)&v85[14] = v25;
      *(_WORD *)&v85[22] = 2112;
      id v86 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "sendMessage: account: %@ fromID: %@ - failed to get the account forGroup: %@",  v85,  0x20u);
    }
  }
}

- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4
{
  membersForGroup = self->_membersForGroup;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](membersForGroup, "objectForKeyedSubscript:", v8));
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v11));
  -[IDSGroupEncryptionController1 sendPublicKeyToDestination:group:sessionID:]( self,  "sendPublicKeyToDestination:group:sessionID:",  v10,  v8,  v7);
  -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v8,  v7);
}

- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyData](self, "realTimeEncryptionPublicKeyData"));
  BOOL v12 = (void *)v11;
  if (v9)
  {
    if (v11)
    {
      if (v10)
      {
        v37[0] = IDSFanoutMessageGroupIDKey;
        v37[1] = IDSDSessionMessageSessionID;
        v38[0] = v9;
        v38[1] = v10;
        v38[2] = v11;
        v37[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
        v37[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyWrappingMode]( self,  "realTimeEncryptionPublicKeyWrappingMode")));
        v38[3] = v13;
        double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  4LL));

        uint64_t v17 = im_primary_queue(v15, v16);
        __int128 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001903B8;
        block[3] = &unk_1008F8D18;
        void block[4] = self;
        id v19 = v14;
        id v27 = v19;
        id v20 = v8;
        id v28 = v20;
        id v21 = v9;
        id v29 = v21;
        id v30 = v10;
        dispatch_block_t v22 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
        dispatch_async(v18, v22);

        LODWORD(v22) = self->_isInternal;
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v22)
        {
          if (v24)
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v21));
            *(_DWORD *)buf = 138412802;
            id v32 = v21;
            __int16 v33 = 2112;
            id v34 = v25;
            __int16 v35 = 2112;
            id v36 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sendPublicKeyToGroup: %@, ACK'd: %@ (destination: %@)",  buf,  0x20u);
          }
        }

        else if (v24)
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sendPublicKeyToGroup: %@ (destination: %@)",  buf,  0x16u);
        }
      }

      else
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
          sub_10069F80C();
        }
      }
    }

    else
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_10069F7AC();
      }
    }
  }

  else
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_10069F780();
    }
  }
}

- (void)removeExpiredPrekeys
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  os_unfair_lock_lock(&self->_lock);
  publicKeyForDevice = self->_publicKeyForDevice;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001904D4;
  v6[3] = &unk_1008FC4D8;
  id v7 = v3;
  uint64_t v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( publicKeyForDevice,  "enumerateKeysAndObjectsUsingBlock:",  v6);
  -[NSMutableDictionary removeObjectsForKeys:](self->_publicKeyForDevice, "removeObjectsForKeys:", v5);
  os_unfair_lock_unlock(&self->_lock);
}

- ($B1E54C86789B51D3361D4DB9054848AC)participantsReadyForKeyMaterialsForGroup:(SEL)a3
{
  id v20 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[IDSGroupEncryptionController1 removeExpiredPrekeys](self, "removeExpiredPrekeys");
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v20));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10019072C;
  v24[3] = &unk_1008FC500;
  v24[4] = self;
  id v11 = v9;
  id v25 = v11;
  id v12 = v6;
  id v26 = v12;
  [v10 enumerateObjectsUsingBlock:v24];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v20));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100190798;
  v21[3] = &unk_1008FC500;
  v21[4] = self;
  id v15 = v13;
  id v22 = v15;
  id v16 = v7;
  id v23 = v16;
  [v14 enumerateObjectsUsingBlock:v21];

  os_unfair_lock_unlock(p_lock);
  [v16 removeObjectsInArray:v12];
  retstr->var2 = 0LL;
  retstr->var3 = 0LL;
  id v17 = v12;
  retstr->var0 = v17;
  id v18 = v16;
  retstr->var1 = v18;
  retstr->var2 = (id)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  retstr->var3 = (id)objc_claimAutoreleasedReturnValue([v15 allObjects]);

  return result;
}

- (void)sendKeyMaterialsToWaitingParticipantsForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v41 = v8;
  __int128 v42 = v8;
  -[IDSGroupEncryptionController1 participantsReadyForKeyMaterialsForGroup:]( self,  "participantsReadyForKeyMaterialsForGroup:",  v6);
  id v9 = (id)v41;
  id v10 = *((id *)&v41 + 1);
  id v11 = [(id)v42 mutableCopy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "setObject:forKeyedSubscript:",  v11,  v6);

  id v12 = [*((id *)&v42 + 1) mutableCopy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "setObject:forKeyedSubscript:",  v12,  v6);

  if (v6) {
    BOOL v13 = v7 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v13 || ![v9 count])
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v6));
      *(_DWORD *)buf = 138412802;
      id v44 = v9;
      __int16 v45 = 2112;
      id v46 = v6;
      __int16 v47 = 2112;
      uint64_t v48 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "sendKeyMaterialsToWaitingParticipantsForGroup - didn't send any MKMs to %@ of the group %@ (pending participants %@)",  buf,  0x20u);
    }

    if (!v14) {
      goto LABEL_19;
    }
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v6));
      *(_DWORD *)buf = 138412802;
      id v44 = v9;
      __int16 v45 = 2112;
      id v46 = v6;
      __int16 v47 = 2112;
      uint64_t v48 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToWaitingParticipantsForGroup - Sending the MKMs to %@ of the group %@ (pending participants %@)",  buf,  0x20u);
    }

    uint64_t v19 = im_primary_queue(v17, v18);
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100190D24;
    block[3] = &unk_1008F60E8;
    void block[4] = self;
    id v38 = v6;
    id v39 = v7;
    id v40 = v9;
    dispatch_block_t v21 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v20, v21);
  }

  if ([v10 count])
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v6));
      *(_DWORD *)buf = 138412802;
      id v44 = v10;
      __int16 v45 = 2112;
      id v46 = v6;
      __int16 v47 = 2112;
      uint64_t v48 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsToWaitingParticipantsForGroup - Sending the SKMs to %@ of the group %@ (pending participants %@)",  buf,  0x20u);
    }

    uint64_t v27 = im_primary_queue(v25, v26);
    id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v27);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100190D3C;
    v33[3] = &unk_1008F60E8;
    v33[4] = self;
    id v34 = v6;
    id v35 = v7;
    id v36 = v10;
    dispatch_block_t v29 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  v33);
    dispatch_async(v28, v29);

    goto LABEL_22;
  }

- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9
{
  id v64 = a3;
  id v61 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v62 = a9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v73;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v73 != v22) {
          objc_enumerationMutation(v19);
        }
        BOOL v24 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
        if (v24 && ([*(id *)(*((void *)&v72 + 1) + 8 * (void)i) isNull] & 1) == 0)
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "__imHexString"));
          [v18 addObject:v25];
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v72 objects:v82 count:16];
    }

    while (v21);
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  id v81 = v15;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
  id v60 = v14;
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
  dispatch_block_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 endpointsForURIs:v27 service:v29 fromURI:v16]);

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v15]);
  id v58 = v16;
  id v59 = v15;
  id v57 = v30;
  if ([v19 count])
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100191330;
    v70[3] = &unk_1008FC528;
    id v71 = v18;
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 sortedArrayUsingComparator:v70]);

    uint64_t v31 = (void *)v32;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = v31;
  id v33 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v67;
    while (2)
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v67 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
        id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
        id v65 = 0LL;
        id v39 = (void *)objc_claimAutoreleasedReturnValue( [v38 publicKeyDecryptData:v64 fromEndpoint:v37 pkType:1 priority:300 error:&v65]);
        id v40 = v65;

        if (v40)
        {
          __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v77 = v40;
            __int16 v78 = 2112;
            __int128 v79 = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Failed to process QRMKM payload {error: %@, endpoint: %@}",  buf,  0x16u);
          }
        }

        else if (v39)
        {
          id v49 = v37;

          uint64_t v50 = JWDecodeDictionary(v39);
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          id v44 = v61;
          __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _compactKeyMaterialMessage:isOutgoing:groupID:]( self,  "_compactKeyMaterialMessage:isOutgoing:groupID:",  v51,  0LL,  v61));
          id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v77 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Decoded QR MKM Payload {decodedPayload: %@}",  buf,  0xCu);
          }

          __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          id v46 = v58;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v77 = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Expanded QR MKM Payload {expandedPayload: %@}",  buf,  0xCu);
          }

          __int16 v47 = v62;
          if (v62)
          {
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v49 pushToken]);
            (*((void (**)(id, void *, void *))v62 + 2))(v62, v52, v55);

            __int16 v47 = v62;
          }

          __int16 v45 = v59;
          uint64_t v43 = v60;
          uint64_t v48 = v57;
          goto LABEL_37;
        }
      }

      id v34 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Unable to decrypt the incoming MKM QR blob -- returning nil",  buf,  2u);
  }

  uint64_t v43 = v60;
  id v44 = v61;
  id v46 = v58;
  __int16 v45 = v59;
  __int16 v47 = v62;
  uint64_t v48 = v57;
  if (v62) {
    (*((void (**)(id, void, void))v62 + 2))(v62, 0LL, 0LL);
  }
  id v49 = 0LL;
  id v39 = 0LL;
LABEL_37:
}

- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationURIs]);
  id v15 = [v14 count];

  if ((unint64_t)v15 < 2)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationURIs]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 anyObject]);

    id v56 = 0LL;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 _stripPotentialTokenURIWithToken:&v56]);
    id v20 = v56;
    if (v20)
    {
      __int16 v45 = self;
      id v49 = v16;
      id v50 = v12;
      id v53 = v10;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      id v23 = v19;
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
      id v47 = v20;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v20,  v24));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
      uint64_t v48 = v23;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v23,  v27));
      id v52 = v11;
      dispatch_block_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
      id v51 = v13;
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v21 endpointForPushToken:v25 URI:v28 service:v30 fromURI:v13]);

      uint64_t v32 = (os_log_s *)v31;
      if (v31)
      {
        id v10 = v53;
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _compactKeyMaterialMessage:isOutgoing:groupID:]( v45,  "_compactKeyMaterialMessage:isOutgoing:groupID:",  v53,  1LL,  0LL));
        uint64_t v34 = JWEncodeDictionary(v33);
        uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
        unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
        id v54 = 0LL;
        id v46 = (void *)v35;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 publicKeyEncryptData:v35 encryptionContext:0 forceSizeOptimizations:0 resetState:0 withEncryptedAttribut es:0 toEndpoint:v32 usedEncryptionType:&v55 priority:300 metadata:0 error:&v54]);
        id v38 = v54;

        id v44 = v38;
        if (v37)
        {
          unint64_t v39 = v55;
          id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          id v16 = v49;
          id v12 = v50;
          id v20 = v47;
          if (v39 == 4)
          {
            id v13 = v51;
            if (v41)
            {
              *(_DWORD *)buf = 138412290;
              id v58 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Encoded QR MKM Payload {compactPayload: %@}",  buf,  0xCu);
            }

            id v17 = v37;
          }

          else
          {
            id v13 = v51;
            if (v41)
            {
              *(_DWORD *)buf = 138412290;
              id v58 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "QR MKM payload used legacy encryption -- returning nil {endpointToTarget: %@}",  buf,  0xCu);
            }

            id v17 = 0LL;
          }
        }

        else
        {
          __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          id v16 = v49;
          id v12 = v50;
          id v20 = v47;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = (os_log_s *)v38;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "QR MKM payload failed to encrypt -- returning nil {error: %@}",  buf,  0xCu);
          }

          id v17 = 0LL;
          id v13 = v51;
        }

        id v19 = v48;
      }

      else
      {
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        id v10 = v53;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v47;
          id v19 = v48;
          id v58 = (os_log_s *)v48;
          __int16 v59 = 2112;
          id v60 = v47;
          __int16 v61 = 2112;
          id v13 = v51;
          id v62 = v51;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No endpoint found to target, not triggering a query -- returning nil {destinationURIString: %@, tokenFromURL : %@, fromURI: %@}",  buf,  0x20u);
          id v17 = 0LL;
          id v16 = v49;
          id v12 = v50;
        }

        else
        {
          id v17 = 0LL;
          id v12 = v50;
          id v13 = v51;
          id v19 = v48;
          id v16 = v49;
          id v20 = v47;
        }
      }

      id v11 = v52;
    }

    else
    {
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = (os_log_s *)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Unable to generate a QR MKM payload to a non-specific URI -- returning nil {fullDestinationURIString: %@}",  buf,  0xCu);
      }

      id v17 = 0LL;
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = (os_log_s *)v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Unable to generate a QR MKM payload to more than 1 destination -- returning nil {destination: %@}",  buf,  0xCu);
    }

    id v17 = 0LL;
  }

  return v17;
}

- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_autoreleasePoolPush();
  if (v6) {
    id v10 = &off_100948880;
  }
  else {
    id v10 = &off_100948898;
  }
  if (v6) {
    id v11 = &off_100948898;
  }
  else {
    id v11 = &off_100948880;
  }
  id v12 = [v7 mutableCopy];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsURIsKey];
  [v12 removeObjectForKey:IDSFanoutMessageGroupIDKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionStableKeyMaterialKey];
  if (v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
    [v12 setObject:v8 forKeyedSubscript:v13];
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 _arrayForKey:v14]);

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
    [v12 removeObjectForKey:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
    [v12 setObject:v15 forKeyedSubscript:v17];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:2]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 _dictionaryForKey:v18]);
  id v20 = [v19 mutableCopy];

  if (v20)
  {
    id v40 = v9;
    id v41 = v8;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:4]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 _numberForKey:v21]);

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:4]);
      [v20 removeObjectForKey:v23];

      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:4]);
      [v20 setObject:v22 forKeyedSubscript:v24];
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:5]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v25]);

    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:5]);
      [v20 removeObjectForKey:v27];

      id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:5]);
      [v20 setObject:v26 forKeyedSubscript:v28];
    }

    id v42 = v7;
    dispatch_block_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:6]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v29]);

    if (v30)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:6]);
      [v20 removeObjectForKey:v31];

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:6]);
      [v20 setObject:v30 forKeyedSubscript:v32];
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:7]);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v33]);

    if (v34)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:7]);
      [v20 removeObjectForKey:v35];

      id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:7]);
      [v20 setObject:v34 forKeyedSubscript:v36];
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:2]);
    [v12 removeObjectForKey:v37];

    id v38 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:2]);
    [v12 setObject:v20 forKeyedSubscript:v38];

    id v8 = v41;
    id v7 = v42;
    id v9 = v40;
  }

  objc_autoreleasePoolPop(v9);
  return v12;
}

- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v87 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v109 = v6;
    __int16 v110 = 2112;
    id v111 = v87;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup groupID:%@ sessionID:%@",  buf,  0x16u);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  dispatch_block_t v93 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _getSetofStandardParticipantsForGroup:]( self,  "_getSetofStandardParticipantsForGroup:",  v6));
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v6));
  id v10 = [v9 copy];

  __int16 v99 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 realTimeEncryptionPublicKeyData](self, "realTimeEncryptionPublicKeyData"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentLocalMasterKeyMaterial]);
  __int128 v80 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 nextLocalMasterKeyMaterial]);
  id v81 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  v6));
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v81 currentLocalStableKeyMaterial]);
  id v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v13) {
    [v86 addObject:v13];
  }
  if (v14) {
    [v86 addObject:v14];
  }
  __int16 v83 = v13;
  uint64_t v84 = (void *)v8;
  int64_t v82 = (void *)v11;
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v86 count];
    id v17 = [v10 count];
    *(_DWORD *)buf = 134218240;
    id v109 = v16;
    __int16 v110 = 2048;
    id v111 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup will include %lu mkms for up to %lu participants",  buf,  0x16u);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  __int16 v97 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v87]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v85 = v6;
  id v88 = (void *)objc_claimAutoreleasedReturnValue([v19 sessionWithGroupID:v6]);

  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id obj = v10;
  id v100 = [obj countByEnumeratingWithState:&v103 objects:v120 count:16];
  if (v100)
  {
    uint64_t v98 = *(void *)v104;
    unsigned __int8 v94 = v14;
    id v92 = self;
    do
    {
      for (i = 0LL; i != v100; i = (char *)i + 1)
      {
        if (*(void *)v104 != v98) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v99 rawToken]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 participantPushToken]);

        if (v22 != v23)
        {
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v21 participantPushTokenObject]);
          unsigned int v25 = [v93 containsObject:v24];

          publicKeyForDevice = self->_publicKeyForDevice;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v21 participantPushTokenObject]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( publicKeyForDevice,  "objectForKeyedSubscript:",  v27));

          if (v28)
          {
            dispatch_block_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 fromID]);
            id v96 = v29;
          }

          else
          {
            dispatch_block_t v29 = (void *)objc_claimAutoreleasedReturnValue([v21 participantURI]);
            uint64_t v90 = v29;
          }

          id v30 = sub_1003B4704(v29);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v31));

          if (v28)
          {

            id v13 = (void *)objc_claimAutoreleasedReturnValue([v28 pushToken]);
            uint64_t v33 = objc_claimAutoreleasedReturnValue([v13 rawToken]);
            __int16 v95 = (void *)v33;
          }

          else
          {

            uint64_t v33 = objc_claimAutoreleasedReturnValue([v21 participantPushToken]);
            id v10 = (id)v33;
          }

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 prefixedURI]);
          uint64_t v35 = (void *)_IDSCopyIDForTokenWithURI(v33, v34);
          id v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v35));

          uint64_t v37 = v10;
          if (v28)
          {

            uint64_t v37 = v13;
          }

          id v14 = v94;
          if ([v97 destinationsContainFromURI:v36]
            && ([v88 destinationsContainFromURI:v36] & 1) != 0)
          {
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              id v39 = [v21 participantIdentifier];
              *(_DWORD *)buf = 134219266;
              id v40 = @"YES";
              if (v25) {
                id v40 = @"NO";
              }
              id v109 = v39;
              __int16 v110 = 2112;
              id v111 = (id)v40;
              __int16 v112 = 2112;
              id v113 = v28;
              __int16 v114 = 2112;
              __int16 v115 = v83;
              __int16 v116 = 2112;
              v117 = v94;
              __int16 v118 = 2112;
              unsigned int v119 = v89;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup participantId:%llu lightweight:%@ publicIdentity:%@ keyMaterial: %@ nextKeyMaterial:%@ stableKeyMaterial:%@",  buf,  0x3Eu);
            }

            id v41 = [v86 count];
            if (v28) {
              BOOL v42 = v41 == 0LL;
            }
            else {
              BOOL v42 = 1;
            }
            if (v42) {
              unsigned int v43 = 0;
            }
            else {
              unsigned int v43 = v25;
            }
            if (v43 == 1)
            {
              id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                id v45 = [v21 participantIdentifier];
                *(_DWORD *)buf = 134218242;
                id v109 = v45;
                __int16 v110 = 2112;
                id v111 = v83;
                _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup participantId:%llu keyMaterial:%@",  buf,  0x16u);
              }

              id v46 = -[IDSServerDesiredKeyMaterialSet initWithKMs:type:forPublicIdentity:forParticipantID:]( [IDSServerDesiredKeyMaterialSet alloc],  "initWithKMs:type:forPublicIdentity:forParticipantID:",  v86,  13,  [v28 publicIdentity],  objc_msgSend(v21, "participantIdentifier"));
              [v84 addObject:v46];
            }

            if (v89 && v28)
            {
              id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                id v48 = [v21 participantIdentifier];
                *(_DWORD *)buf = 134218242;
                id v109 = v48;
                __int16 v110 = 2112;
                id v111 = v89;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup participantId:%llu stableKeyMaterial:%@",  buf,  0x16u);
              }

              id v49 = objc_alloc(&OBJC_CLASS___IDSServerDesiredKeyMaterialSet);
              int v107 = v89;
              id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v107,  1LL));
              id v51 = -[IDSServerDesiredKeyMaterialSet initWithKMs:type:forPublicIdentity:forParticipantID:]( v49,  "initWithKMs:type:forPublicIdentity:forParticipantID:",  v50,  14,  [v28 publicIdentity],  objc_msgSend(v21, "participantIdentifier"));
              [v84 addObject:v51];

              id v14 = v94;
              goto LABEL_48;
            }
          }

          else
          {
            id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              id v52 = (void *)objc_claimAutoreleasedReturnValue([v97 destinations]);
              *(_DWORD *)buf = 138413058;
              id v109 = v36;
              __int16 v110 = 2112;
              id v111 = v85;
              __int16 v112 = 2112;
              id v113 = v87;
              __int16 v114 = 2112;
              __int16 v115 = v52;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "updateServerDesiredKeyMaterialsForGroup: aborting send of key material message to %@ for group %@ and se ssion %@ since this destination is not in group membership: %@",  buf,  0x2Au);
            }

- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v6;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld",  buf,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity pushToken](self->_identityForDevice, "pushToken"));
  id v9 = [v8 copy];

  -[IDSGroupEncryptionController1 resetDevicePrekey](self, "resetDevicePrekey");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v22;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v14);
        uint64_t v16 = im_primary_queue(v10, v11);
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100192ED0;
        block[3] = &unk_1008F5F58;
        void block[4] = self;
        void block[5] = v15;
        id v20 = v9;
        dispatch_async(v17, block);

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v12 = v10;
    }

    while (v10);
  }
}

- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)v15) pushTokenObject]);
        [v10 addObject:v16];

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }

    while (v13);
  }

  os_unfair_lock_lock(&self->_lock);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "objectForKeyedSubscript:",  v9));
  uint64_t v18 = objc_autoreleasePoolPush();
  id v19 = [v17 mutableCopy];
  [v19 intersectsSet:v10];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100193680;
  v37[3] = &unk_1008F6010;
  id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"newPushTokensForGroup: %@, previousPushTokensForGroup: %@, intersection: %@",  v10,  v17,  v19));
  id v20 = v38;
  cut_dispatch_log_queue(v37);

  objc_autoreleasePoolPop(v18);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "setObject:forKeyedSubscript:",  v10,  v9);
  os_unfair_lock_unlock(&self->_lock);
  if ([v17 isEqualToSet:v10])
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v44 = v11;
      __int16 v45 = 2112;
      id v46 = v9;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "didReceiveEndpointsUpdate: %@ forGroup: %@ - nothing changed.(previous %@)",  buf,  0x20u);
    }
  }

  else
  {
    endpointUpdateTimer = self->_endpointUpdateTimer;
    if (endpointUpdateTimer)
    {
      -[IMDispatchTimer invalidate](endpointUpdateTimer, "invalidate");
      __int128 v23 = self->_endpointUpdateTimer;
      self->_endpointUpdateTimer = 0LL;

      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v44 = v11;
        __int16 v45 = 2112;
        id v46 = v9;
        __int16 v47 = 2048;
        uint64_t v48 = 0x4000000000000000LL;
        __int16 v49 = 2112;
        id v50 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "didReceiveEndpointsUpdate: %@ forGroup: %@ - invalidated the previous key rolling timer. Wait %f seconds more again to get more endpoint updates... (previous %@)",  buf,  0x2Au);
      }
    }

    unsigned int v25 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v27 = im_primary_queue(v25, v26);
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100193750;
    void v32[3] = &unk_1008FC578;
    uint64_t v33 = (os_log_s *)v11;
    id v34 = v9;
    id v35 = v17;
    id v36 = self;
    int64_t v29 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v25,  "initWithQueue:interval:repeats:handlerBlock:",  v28,  2LL,  0LL,  v32);
    id v30 = self->_endpointUpdateTimer;
    self->_endpointUpdateTimer = v29;

    __int128 v21 = v33;
  }
}

- (BOOL)_isMemberStandard:(id)a3 lightweightStatusDict:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:a3]);
  unsigned __int8 v5 = [v4 isEqualToNumber:&off_1009473B0];

  return v5;
}

- (BOOL)_isMemberLightweight:(id)a3 lightweightStatusDict:(id)a4
{
  return !-[IDSGroupEncryptionController1 _isMemberStandard:lightweightStatusDict:]( self,  "_isMemberStandard:lightweightStatusDict:",  a3,  a4);
}

- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersLightweightStatusDict,  "objectForKeyedSubscript:",  v14));
  id v18 = [v17 copy];
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  unsigned int v43 = v20;

  id v21 = [v12 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_membersLightweightStatusDict,  "setObject:forKeyedSubscript:",  v21,  v14);

  __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersLightweightStatusDict,  "objectForKeyedSubscript:",  v14));
    *(_DWORD *)buf = 138412546;
    id v50 = v23;
    __int16 v51 = 2112;
    id v52 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "updateLightweightMemberTypes: membersLightweightStatusDict: %@ for group: %@",  buf,  0x16u);
  }

  if (!a5)
  {
    __int128 v42 = v16;
    id v39 = v15;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_membersForGroup,  "setObject:forKeyedSubscript:",  v13,  v14);
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersForGroup,  "objectForKeyedSubscript:",  v14));
      *(_DWORD *)buf = 138412546;
      id v50 = v25;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "updateLightweightMemberTypes: membersForGroup: %@ for group: %@",  buf,  0x16u);
    }

    id v40 = v14;

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v41 = v13;
    id v26 = v13;
    id v27 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          if (-[IDSGroupEncryptionController1 _isMemberLightweight:lightweightStatusDict:]( self,  "_isMemberLightweight:lightweightStatusDict:",  v31,  v12))
          {
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v31;
              uint64_t v33 = v32;
              id v34 = "updateLightweightMemberTypes: member %@ is lightweight; should not get MKMs";
              goto LABEL_20;
            }

            goto LABEL_21;
          }

          unsigned int v35 = -[IDSGroupEncryptionController1 _isMemberStandard:lightweightStatusDict:]( self,  "_isMemberStandard:lightweightStatusDict:",  v31,  v43);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          BOOL v36 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v36)
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v31;
              uint64_t v33 = v32;
              id v34 = "updateLightweightMemberTypes: member %@ was already a standard member";
LABEL_20:
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
            }

- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6
{
  id v10 = (IDSEndpointSubscription *)a3;
  id v11 = (IDSEndpointSubscription *)a4;
  id v35 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = -[IDSEndpointSubscription copy](v10, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_membersForGroup, "setObject:forKeyedSubscript:", v13, v11);

  id v34 = v12;
  id v14 = [v12 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_membersLightweightStatusDict,  "setObject:forKeyedSubscript:",  v14,  v11);

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int128 v47 = v10;
    __int16 v48 = 2112;
    __int16 v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "setMembers: %@ forGroup: %@", buf, 0x16u);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v17 = v10;
  id v18 = -[IDSEndpointSubscription countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 addObject:*(void *)(*((void *)&v41 + 1) + 8 * (void)i)];
      }

      id v19 = -[IDSEndpointSubscription countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v41,  v45,  16LL);
    }

    while (v19);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v11));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 accountWithUniqueID:v23]);

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fromURIs, "objectForKeyedSubscript:", v11));
  id v26 = objc_alloc(&OBJC_CLASS___IDSEndpointSubscription);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  uint64_t v29 = -[IDSEndpointSubscription initWithServiceIdentifier:localURI:subscribedURIs:queue:]( v26,  "initWithServiceIdentifier:localURI:subscribedURIs:queue:",  v28,  v25,  v16,  self->_realtimeEncryptionQueue);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_endpointSubscriptionForGroup,  "setObject:forKeyedSubscript:",  v29,  v11);
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int128 v47 = v29;
    __int16 v48 = 2112;
    __int16 v49 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "setMembers: endpointSubscription %p forGroup: %@",  buf,  0x16u);
  }

  if (self->_isInternal)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_prekeyAckCountForGroup, "objectForKey:", v11));

    if (!v31)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_prekeyAckCountForGroup,  "setObject:forKeyedSubscript:",  &off_1009473B0,  v11);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v47 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "ACK'd prekey count is reset to 0 forGroup: %@",  buf,  0xCu);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  if (!-[IDSGroupEncryptionController1 isTestRunning](self, "isTestRunning"))
  {
    realtimeEncryptionQueue = (dispatch_queue_s *)self->_realtimeEncryptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001941E0;
    block[3] = &unk_1008F60E8;
    uint64_t v37 = v29;
    id v38 = v11;
    id v39 = self;
    id v40 = v35;
    dispatch_async(realtimeEncryptionQueue, block);
  }
}

- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a6;
  id v18 = [a3 copy];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingSelector:"compare:"]);

  id v20 = [v17 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_membersForGroup, "setObject:forKeyedSubscript:", v19, v14);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_membersLightweightStatusDict,  "setObject:forKeyedSubscript:",  v20,  v14);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersForGroup,  "objectForKeyedSubscript:",  v14));
    __int128 v23 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v31 = v22;
    __int16 v32 = 2112;
    if (v9) {
      __int128 v23 = @"YES";
    }
    uint64_t v33 = v23;
    __int16 v34 = 2112;
    id v35 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "didUpdateMembers to %@, hasChangedStandardMembers: %@, newlyAddedMembers: %@",  buf,  0x20u);
  }

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v16));
  if (v24 && [v16 count]) {
    -[IDSGroupEncryptionController1 sendPublicKeyToDestination:group:sessionID:]( self,  "sendPublicKeyToDestination:group:sessionID:",  v24,  v14,  v15);
  }
  if (v9)
  {
    unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "didUpdateMembers: standard members changed",  buf,  2u);
    }

    if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform]( &OBJC_CLASS___IDSGroupEncryptionController1,  "isKeyRatchetingEnabledForPlatform"))
    {
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "GFTKeyRatcheting is enabled - we will be ratcheting on member add",  buf,  2u);
      }

      -[IDSGroupEncryptionController1 ratchetAndSendKeyMaterialsToAVCForGroup:sessionID:]( self,  "ratchetAndSendKeyMaterialsToAVCForGroup:sessionID:",  v14,  v15);
    }

    -[IDSGroupEncryptionController1 requestKeyMaterialForGroup:sessionID:]( self,  "requestKeyMaterialForGroup:sessionID:",  v14,  v15);
    -[IDSGroupEncryptionController1 _updateRelevantEncryptedDataBlobForSession:]( self,  "_updateRelevantEncryptedDataBlobForSession:",  v15);
  }

  else if ([v16 count])
  {
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "didUpdateMembers: no standard members changed, but still have newly added. Sending to newly added.",  buf,  2u);
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
    BYTE2(v29) = 0;
    LOWORD(v29) = 257;
    -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:]( self,  "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial :shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:",  v14,  v15,  v28,  0LL,  0LL,  0LL,  v29);
  }

  -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v14,  v15);
}

- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionWithUniqueID:v4]);

  if (v6)
  {
    [v6 updateRelevantEncryptedDataBlob];
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10069F934();
    }
  }
}

- (BOOL)_isValidPushToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSPushToken, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)allParticipantsInfoForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  id v5 = [v4 copy];

  return v5;
}

- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6 waitingParticipantsTokens:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([a4 count]) {
    double preKeyRequestDelayDuration = self->_preKeyRequestDelayDuration;
  }
  else {
    double preKeyRequestDelayDuration = 0.01;
  }
  dispatch_time_t v17 = dispatch_walltime(0LL, (uint64_t)(preKeyRequestDelayDuration * 1000000000.0));
  uint64_t v19 = im_primary_queue(v17, v18);
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100194B94;
  v25[3] = &unk_1008FC5F0;
  v25[4] = self;
  id v26 = v12;
  double v30 = preKeyRequestDelayDuration;
  id v27 = v15;
  id v28 = v13;
  id v29 = v14;
  id v21 = v14;
  id v22 = v13;
  id v23 = v15;
  id v24 = v12;
  dispatch_after(v17, v20, v25);
}

- (void)_updateAllActiveParticipantsInfoFromParticipants:(id)a3 standardParticipantsPushTokens:(id)a4 lightweightParticipantsPushTokens:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v13));

  if (!v14)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "setObject:forKeyedSubscript:",  Mutable,  v13);
  }

  id v16 = [v11 mutableCopy];
  dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v13));
  [v17 setObject:v16 forKeyedSubscript:&off_100947380];

  id v18 = [v12 mutableCopy];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v13));
  [v19 setObject:v18 forKeyedSubscript:&off_100947398];

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v13));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:&off_100947380]);
    *(_DWORD *)buf = 138412290;
    id v52 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "current standard participants: %@", buf, 0xCu);
  }

  __int128 v45 = v12;

  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10069F994();
  }
  id v24 = v11;

  unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v13));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:&off_100947398]);
    *(_DWORD *)buf = 138412290;
    id v52 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "current lightweight participants: %@",  buf,  0xCu);
  }

  __int128 v44 = v13;

  id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v30 = v10;
  id v31 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v35 participantPushTokenObject]);
        if (-[IDSGroupEncryptionController1 _isValidPushToken:](self, "_isValidPushToken:", v36)
          && (-[NSMutableArray containsObject:](v28, "containsObject:", v35) & 1) == 0)
        {
          if ([v24 containsObject:v36])
          {
            -[NSMutableArray addObject:](v28, "addObject:", v35);
            -[NSMutableArray addObject:](v29, "addObject:", v36);
          }

          if ([v45 containsObject:v36])
          {
            -[NSMutableArray addObject:](v28, "addObject:", v35);
            -[NSMutableArray addObject:](v29, "addObject:", v36);
          }
        }
      }

      id v32 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }

    while (v32);
  }

  id v37 = -[NSMutableArray mutableCopy](v28, "mutableCopy");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsInfoForGroup,  "setObject:forKeyedSubscript:",  v37,  v44);

  id v38 = -[NSMutableArray mutableCopy](v29, "mutableCopy");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsForGroup,  "setObject:forKeyedSubscript:",  v38,  v44);

  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v44));
    *(_DWORD *)buf = 138412290;
    id v52 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "_participantsInfoForGroup[groupID]: %@",  buf,  0xCu);
  }

  __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v44));
    *(_DWORD *)buf = 138412290;
    id v52 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "_participantsForGroup[groupID]: %@", buf, 0xCu);
  }

  os_unfair_lock_unlock(lock);
}

- (id)_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:(id)a3 waitingParticipants:(id)a4 addedParticipantsDiff:(id)a5 currentParticipantsPushTokens:(id)a6 participantType:(int64_t)a7
{
  id v12 = a3;
  id v13 = (NSMutableArray *)a4;
  id v14 = a5;
  id v50 = a6;
  __int128 v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  if (!v13) {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSMutableArray count](v13, "count"))
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v13));

    id v16 = (NSMutableArray *)v17;
  }

  if ([v14 count])
  {
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v14);
  }

  else
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v57 = [v14 count];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "addedParticipantsDiff count = %lu, no need to be added to participantsNeedsKeyMaterial",  buf,  0xCu);
    }
  }

  if (!-[NSMutableArray count](v16, "count"))
  {
    id v32 = v13;
    goto LABEL_52;
  }

  id v46 = v12;
  int64_t v47 = a7;
  id v45 = v14;
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v16;
    __int16 v58 = 2112;
    __int16 v59 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "before processing participantsNeedsKeyMaterial: %@, local: %@",  buf,  0x16u);
  }

  __int128 v48 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v20 = v16;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v52;
    do
    {
      id v24 = 0LL;
      do
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned int v25 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v24);
        if (!-[IDSGroupEncryptionController1 _isValidPushToken:](self, "_isValidPushToken:", v25))
        {
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v25;
            id v27 = v26;
            id v28 = "invalid participant push token %@, continue";
            goto LABEL_29;
          }

- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v24 = a4;
  id v11 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v10));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v10));
  if (v14)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromArray:v14]);

    id v13 = (void *)v16;
  }

  if (v15)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromArray:v15]);

    id v13 = (void *)v17;
  }

  if ([v13 count]
    && (id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToIsDeferredPreKeyRequestPending,  "objectForKeyedSubscript:",  v10)),  v19 = [v18 BOOLValue],  v18,  (v19 & 1) == 0))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupIDToIsDeferredPreKeyRequestPending,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v10);
    os_unfair_lock_unlock(&self->_lock);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "_dispatchDeferredPrekeyRequestForGroupID - participants have been updated but we are not yet able to send key ma terial to participants %@",  buf,  0xCu);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
    uint64_t v23 = self;
    id v20 = v24;
    -[IDSGroupEncryptionController1 _dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:waitingParticipantsTokens:]( v23,  "_dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:waitin gParticipantsTokens:",  v10,  v24,  v11,  v12,  v22);
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v20 = v24;
  }
}

- (void)_updateLightweightParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v58 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v9));

  if (!v11)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsInfoForGroup,  "setObject:forKeyedSubscript:",  v12,  v9);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v9));
  id v15 = [v14 mutableCopy];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100947380]);
  id v57 = v10;
  os_unfair_lock_t lock = &self->_lock;
  id v63 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100947398]);
  os_unfair_lock_unlock(&self->_lock);
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100196394;
  v84[3] = &unk_1008FC618;
  v84[4] = self;
  id v64 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v85 = v64;
  id v65 = v13;
  id v86 = v65;
  id v17 = v16;
  id v87 = v17;
  id v59 = v8;
  [v8 enumerateObjectsUsingBlock:v84];
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v81;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v81 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 participantPushTokenObject]);
        unsigned int v25 = [v17 containsObject:v24];

        if (v25) {
          [v65 addObject:v23];
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v80 objects:v95 count:16];
    }

    while (v20);
  }

  id v26 = [v17 copy];
  id v27 = [v64 copy];
  -[IDSGroupEncryptionController1 _updateAllActiveParticipantsInfoFromParticipants:standardParticipantsPushTokens:lightweightParticipantsPushTokens:groupID:]( self,  "_updateAllActiveParticipantsInfoFromParticipants:standardParticipantsPushTokens:lightweightParticipantsPushTokens:groupID:",  v65,  v26,  v27,  v9);

  id v28 = [v64 mutableCopy];
  id v29 = [v63 mutableCopy];
  os_unfair_lock_lock(lock);
  [v28 removeObjectsInArray:v63];
  [v29 removeObjectsInArray:v64];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_1001964C8;
  v78[3] = &unk_1008F6010;
  id v79 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateLightweightParticipants: groupID: %@, previous %@, new %@",  v9,  v63,  v64));
  id v30 = v79;
  cut_dispatch_log_queue(v78);
  id v56 = v29;
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateLightweightParticipants: groupID: %@, added diff %@, removed diff %@",  v9,  v28,  v29));

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100196598;
  v76[3] = &unk_1008F6010;
  id v55 = v31;
  id v77 = v55;
  cut_dispatch_log_queue(v76);
  id v60 = v28;
  if ([v28 count])
  {
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v32 = v28;
    id v33 = [v32 countByEnumeratingWithState:&v72 objects:v94 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v73;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v73 != v35) {
            objc_enumerationMutation(v32);
          }
          -[IDSGroupEncryptionController1 _noteKeyMaterialNotNeededForDestination:groupID:]( self,  "_noteKeyMaterialNotNeededForDestination:groupID:",  *(void *)(*((void *)&v72 + 1) + 8LL * (void)j),  v9);
        }

        id v34 = [v32 countByEnumeratingWithState:&v72 objects:v94 count:16];
      }

      while (v34);
    }

    id v28 = v60;
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v9));
  id v38 = [v37 mutableCopy];

  __int128 v54 = v38;
  id v39 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:waitingParticipants:addedParticipantsDiff:currentParticipantsPushTokens:participantType:]( self,  "_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:waitingParticipants:addedParticipantsDiff:cu rrentParticipantsPushTokens:participantType:",  v9,  v38,  v28,  v64,  1LL));
  os_unfair_lock_unlock(lock);
  if ([v39 count])
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v9));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateLightweightParticipants - Sending the stable key material to %@ of the group %@ (pending participants %@)",  v39,  v9,  v40));

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100196668;
    v70[3] = &unk_1008F6010;
    id v71 = v41;
    os_unfair_lock_t locka = v41;
    uint64_t v42 = cut_dispatch_log_queue(v70);
    uint64_t v44 = im_primary_queue(v42, v43);
    id v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v44);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100196738;
    block[3] = &unk_1008F60E8;
    void block[4] = self;
    id v46 = v9;
    id v67 = v46;
    int64_t v47 = v58;
    id v48 = v58;
    id v68 = v48;
    id v69 = v39;
    dispatch_block_t v49 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v45, v49);

    -[IDSGroupEncryptionController1 requestPendingKeyMaterialsForGroup:sessionID:]( self,  "requestPendingKeyMaterialsForGroup:sessionID:",  v46,  v48);
    id v50 = v46;
    __int128 v51 = (os_log_s *)locka;
    -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v50,  v48);

    __int128 v52 = v59;
  }

  else
  {
    __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    int64_t v47 = v58;
    __int128 v52 = v59;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  v9));
      *(_DWORD *)buf = 138412802;
      uint64_t v89 = v39;
      __int16 v90 = 2112;
      id v91 = v9;
      __int16 v92 = 2112;
      dispatch_block_t v93 = v53;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "_updateLightweightParticipants - didn't send any stable key materials to %@ of the group %@ (pending participants %@)",  buf,  0x20u);
    }
  }

  -[IDSGroupEncryptionController1 _dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:]( self,  "_dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:",  v9,  v63,  v52,  v47);
}

- (void)_updateStandardParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v66 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v9));

  if (!v11)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_participantsInfoForGroup,  "setObject:forKeyedSubscript:",  v12,  v9);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  v9));
  id v15 = [v14 mutableCopy];

  id v71 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100947380]);
  id v65 = v10;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:&off_100947398]);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_unlock(&self->_lock);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472LL;
  v93[2] = sub_100196EEC;
  v93[3] = &unk_1008FC618;
  v93[4] = self;
  id v72 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v94 = v72;
  id v73 = v13;
  id v95 = v73;
  id v17 = v16;
  id v96 = v17;
  id v68 = v8;
  [v8 enumerateObjectsUsingBlock:v93];
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v89 objects:v104 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v90;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v90 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 participantPushTokenObject]);
        unsigned int v25 = [v17 containsObject:v24];

        if (v25) {
          [v73 addObject:v23];
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v89 objects:v104 count:16];
    }

    while (v20);
  }

  id v26 = [v72 copy];
  id v27 = [v17 copy];
  -[IDSGroupEncryptionController1 _updateAllActiveParticipantsInfoFromParticipants:standardParticipantsPushTokens:lightweightParticipantsPushTokens:groupID:]( self,  "_updateAllActiveParticipantsInfoFromParticipants:standardParticipantsPushTokens:lightweightParticipantsPushTokens:groupID:",  v73,  v26,  v27,  v9);

  id v28 = [v72 mutableCopy];
  id v29 = [v71 mutableCopy];
  os_unfair_lock_lock(lock);
  [v28 removeObjectsInArray:v71];
  [v29 removeObjectsInArray:v72];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_100197020;
  v87[3] = &unk_1008F6010;
  id v88 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateStandardParticipants: groupID: %@, previous %@, new %@",  v9,  v71,  v72));
  id v30 = v88;
  cut_dispatch_log_queue(v87);
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateStandardParticipants: groupID: %@, added diff %@, removed diff %@",  v9,  v28,  v29));

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1001970F0;
  v85[3] = &unk_1008F6010;
  id v63 = v31;
  id v86 = v63;
  cut_dispatch_log_queue(v85);
  id v67 = v29;
  if ([v29 count])
  {
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    id v32 = v29;
    id v33 = [v32 countByEnumeratingWithState:&v81 objects:v103 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v82;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v82 != v35) {
            objc_enumerationMutation(v32);
          }
          -[IDSGroupEncryptionController1 _noteKeyMaterialNotNeededForDestination:groupID:]( self,  "_noteKeyMaterialNotNeededForDestination:groupID:",  *(void *)(*((void *)&v81 + 1) + 8LL * (void)j),  v9);
        }

        id v34 = [v32 countByEnumeratingWithState:&v81 objects:v103 count:16];
      }

      while (v34);
    }
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v9));
  id v38 = [v37 mutableCopy];

  id v62 = v38;
  id v64 = v28;
  id v39 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController1 _getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:waitingParticipants:addedParticipantsDiff:currentParticipantsPushTokens:participantType:]( self,  "_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:waitingParticipants:addedParticipantsDiff:cu rrentParticipantsPushTokens:participantType:",  v9,  v38,  v28,  v72,  0LL));
  uint64_t v40 = objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 _localDevicePushToken](self, "_localDevicePushToken"));
  __int16 v61 = (void *)v40;
  __int128 v41 = v71;
  if (v40)
  {
    unsigned __int8 v42 = [v71 containsObject:v40];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsForGroup,  "objectForKeyedSubscript:",  v9));
    unsigned __int8 v44 = [v43 containsObject:v40];

    LOBYTE(v40) = v42 & v44;
  }

  os_unfair_lock_unlock(lock);
  id v45 = v68;
  if ([v39 count])
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v9));
    int64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_updateStandardParticipants - Sending the key material to %@ of the group %@ (pending participants %@)",  v39,  v9,  v46));

    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_1001971C0;
    v79[3] = &unk_1008F6010;
    id v80 = v47;
    os_unfair_lock_t locka = v47;
    uint64_t v48 = cut_dispatch_log_queue(v79);
    uint64_t v50 = im_primary_queue(v48, v49);
    __int128 v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v50);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100197290;
    block[3] = &unk_1008FC640;
    void block[4] = self;
    id v52 = v9;
    id v75 = v52;
    id v53 = v66;
    id v76 = v53;
    id v77 = v39;
    char v78 = v40;
    dispatch_block_t v54 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
    dispatch_async(v51, v54);

    id v55 = v66;
    __int128 v41 = v71;

    id v56 = v52;
    id v45 = v68;
    -[IDSGroupEncryptionController1 requestPendingKeyMaterialsForGroup:sessionID:]( self,  "requestPendingKeyMaterialsForGroup:sessionID:",  v56,  v53);

    id v57 = locka;
    id v58 = v65;
  }

  else
  {
    id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      id v60 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  v9));
      *(_DWORD *)buf = 138412802;
      uint64_t v98 = v39;
      __int16 v99 = 2112;
      id v100 = v9;
      __int16 v101 = 2112;
      id v102 = v60;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "_updateStandardParticipants - didn't send any key materials to %@ of the group %@ (pending participants %@)",  buf,  0x20u);
    }

    id v58 = v65;
    id v55 = v66;
    id v57 = v59;
  }

  -[IDSGroupEncryptionController1 _dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:]( self,  "_dispatchDeferredPrekeyRequestForGroupID:previousParticipantsPushTokens:currentActiveParticipants:sessionID:",  v9,  v41,  v45,  v55);
}

- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  -[IDSGroupEncryptionController1 removeExpiredPrekeys](self, "removeExpiredPrekeys");
  if (a4 == 1)
  {
    -[IDSGroupEncryptionController1 _updateLightweightParticipants:forGroup:sessionID:]( self,  "_updateLightweightParticipants:forGroup:sessionID:",  v10,  v12,  v11);
  }

  else if (a4)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10069FA00();
    }
  }

  else
  {
    -[IDSGroupEncryptionController1 _updateStandardParticipants:forGroup:sessionID:]( self,  "_updateStandardParticipants:forGroup:sessionID:",  v10,  v12,  v11);
  }

  -[IDSGroupEncryptionController1 updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v12,  v11);
}

- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController1 sessionController](self, "sessionController"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 groupSessionGroupIDs]);

  if (([v6 isRegistered] & 1) == 0)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v9 = v34;
    id v10 = [v9 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v43;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)v14);
          uint64_t v16 = im_primary_queue(v10, v11);
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100197770;
          block[3] = &unk_1008F5F80;
          void block[4] = v35;
          void block[5] = v15;
          dispatch_async(v17, block);

          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v10 = [v9 countByEnumeratingWithState:&v42 objects:v51 count:16];
        id v12 = v10;
      }

      while (v10);
    }
  }

  lastKnownAccountIDToPushTokens = v35->_lastKnownAccountIDToPushTokens;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( lastKnownAccountIDToPushTokens,  "objectForKeyedSubscript:",  v19));

  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v7;
  id v21 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "pushToken", v33));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 service]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v25,  v27));
        -[NSMutableSet addObject:](v20, "addObject:", v28);
      }

      id v22 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
    }

    while (v22);
  }

  os_unfair_lock_lock(&v35->_lock);
  id v29 = v35->_lastKnownAccountIDToPushTokens;
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v20, v30);

  os_unfair_lock_unlock(&v35->_lock);
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    *(_DWORD *)buf = 138412546;
    id v47 = obj;
    __int16 v48 = 2112;
    uint64_t v49 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "didUpdateRegisteredDevices: %@ for account: %@",  buf,  0x16u);
  }

  if ((-[NSMutableSet isEqualToSet:](v20, "isEqualToSet:", v33) & 1) == 0) {
    -[IDSGroupEncryptionController1 rollNewKeysAfterResettingPrekeysForGroups:withReason:]( v35,  "rollNewKeysAfterResettingPrekeysForGroups:withReason:",  v34,  1LL);
  }
}

- (id)keyMaterialCacheToGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToKeyMaterialCache,  "objectForKeyedSubscript:",  a3);
}

- (id)stablekeyMaterialCacheToGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToStableKeyMaterialCache,  "objectForKeyedSubscript:",  a3);
}

- (id)getParticipantsWaitingForKeyMaterials:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForKeyMaterials,  "objectForKeyedSubscript:",  a3);
}

- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForStableKeyMaterials,  "objectForKeyedSubscript:",  a3);
}

- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsWaitingForInitialKeyMaterials,  "objectForKeyedSubscript:",  a3);
}

- (id)getParticipantsForGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_participantsForGroup, "objectForKeyedSubscript:", a3);
}

- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToTypeToParticipantsPushTokens,  "objectForKeyedSubscript:",  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  return v7;
}

- (id)getParticipantsInfoForGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_participantsInfoForGroup,  "objectForKeyedSubscript:",  a3);
}

- (id)getMembersForGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_membersForGroup, "objectForKeyedSubscript:", a3);
}

- (id)getLightweightStatusDictForGroup:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:]( self->_membersLightweightStatusDict,  "objectForKeyedSubscript:",  a3);
}

- (__SecKey)fullIdentityKey
{
  return -[IDSRealTimeEncryptionIdentity fullIdentity](self->_identityForDevice, "fullIdentity");
}

- (unint64_t)participantIDForPushToken:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_participantsInfoForGroup;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "participantPushToken", (void)v14));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);
        unsigned __int8 v12 = [v10 isEqualToData:v11];

        if ((v12 & 1) != 0)
        {
          id v6 = [v9 participantIdentifier];
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (__SecKey)previousFullIdentityKey
{
  return -[IDSRealTimeEncryptionIdentity fullIdentity](self->_previousIdentityForDevice, "fullIdentity");
}

- (void)setSessionController:(id)a3
{
}

- (BOOL)isTestRunning
{
  return self->_isTestRunning;
}

- (void)setIsTestRunning:(BOOL)a3
{
  self->_isTestRunning = a3;
}

- (BOOL)fakeMKMWrapping
{
  return self->_fakeMKMWrapping;
}

- (void)setFakeMKMWrapping:(BOOL)a3
{
  self->_fakeMKMWrapping = a3;
}

- (NSMutableDictionary)groupIDToStableKeyMaterialCache
{
  return self->_groupIDToStableKeyMaterialCache;
}

- (NSMutableDictionary)groupIDToKeyMaterialCache
{
  return self->_groupIDToKeyMaterialCache;
}

- (IDSRealTimeEncryptionIdentity)identityForDevice
{
  return self->_identityForDevice;
}

- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice
{
  return self->_previousIdentityForDevice;
}

- (void).cxx_destruct
{
}

  ;
}

@end