@interface IDSGroupEncryptionController2Shim
+ (id)sharedInstance;
- (BOOL)_isUsingAccount:(id)a3;
- (BOOL)_isValidPushToken:(id)a3;
- (BOOL)_shouldEnforceRemoteTimeout;
- (BOOL)fakeMKMWrapping;
- (BOOL)isTestRunning;
- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController2Shim)init;
- (IDSRealTimeEncryptionIdentity)identityForDevice;
- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice;
- (_TtC17identityservicesd29IDSGroupEncryptionController2)internal;
- (__SecKey)fullIdentityKey;
- (__SecKey)localPrivatePreKey;
- (__SecKey)localPublicPreKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousLocalPrivatePreKey;
- (__SecKey)previousLocalPublicPreKey;
- (__SecKey)publicKeyForPushToken:(id)a3;
- (double)_multiwayFTMessageSendTimeout;
- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5;
- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6;
- (id)_localDevicePushToken;
- (id)activeParticipantsForGroup:(id)a3;
- (id)addPreKeyChangeHandler:(id)a3;
- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4;
- (id)getLightweightStatusDictForGroup:(id)a3;
- (id)getMembersForGroup:(id)a3;
- (id)getParticipantPushTokensForGroup:(id)a3;
- (id)getParticipantPushTokensForGroup:(id)a3 ofType:(int64_t)a4;
- (id)getParticipantsForGroup:(id)a3;
- (id)keyMaterialCacheToGroup:(id)a3;
- (id)localPushToken;
- (id)masterKeyMaterialForGroup:(id)a3;
- (id)p2pNegotiatorProvider;
- (id)publicKeys;
- (id)realTimeEncryptionPublicKeyData;
- (id)realTimeEncryptionPublicKeyForDevice:(id)a3;
- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12;
- (id)remotePushTokensForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)stablekeyMaterialCacheToGroup:(id)a3;
- (int64_t)realTimeEncryptionPublicKeyWrappingMode;
- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5;
- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3;
- (unint64_t)localParticipantIDForGroupID:(id)a3;
- (unint64_t)participantIDForPushToken:(id)a3 inGroup:(id)a4;
- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12;
- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3;
- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4;
- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4;
- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4;
- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8;
- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)ensureSessionForID:(id)a3 groupID:(id)a4;
- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10;
- (void)processIncomingPrekeyAckForGroup:(id)a3;
- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9;
- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)removeAccountForGroup:(id)a3;
- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4;
- (void)removeLocalActiveParticipantForGroup:(id)a3;
- (void)reportPrekeyAckStatus:(id)a3;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)resetDevicePrekey;
- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3;
- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4;
- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4;
- (void)resetMKMLocalSentStatus:(id)a3;
- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4;
- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 completion:(id)a7;
- (void)sendKeyMaterialRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5;
- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)sendPreKeyMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendPreKeyRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5;
- (void)setFakeMKMWrapping:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6;
- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4;
- (void)unsubscribeEndpointsForGroup:(id)a3;
- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7;
- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
@end

@implementation IDSGroupEncryptionController2Shim

+ (id)sharedInstance
{
  if (qword_1009C0CF8 != -1) {
    dispatch_once(&qword_1009C0CF8, &stru_100903ED0);
  }
  return (id)qword_1009C0D00;
}

- (IDSGroupEncryptionController2Shim)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___IDSGroupEncryptionController2Shim;
  v2 = -[IDSGroupEncryptionController2Shim init](&v30, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    v2->_isInternal = [v3 isInternalInstall];

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    prekeyAckCountForGroup = v2->_prekeyAckCountForGroup;
    v2->_prekeyAckCountForGroup = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lastKnownGroupIDToPushTokens = v2->_lastKnownGroupIDToPushTokens;
    v2->_lastKnownGroupIDToPushTokens = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lastKnownAccountIDToPushTokens = v2->_lastKnownAccountIDToPushTokens;
    v2->_lastKnownAccountIDToPushTokens = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    accountIDs = v2->_accountIDs;
    v2->_accountIDs = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fromURIs = v2->_fromURIs;
    v2->_fromURIs = v12;

    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.ids.realtimeencryptioncontroller", v15);
    realtimeEncryptionQueue = v2->_realtimeEncryptionQueue;
    v2->_realtimeEncryptionQueue = (OS_dispatch_queue *)v16;

    v18 = objc_alloc(&OBJC_CLASS____TtC17identityservicesd31IDSGroupEncryptionConfiguration);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    v20 = -[IDSGroupEncryptionConfiguration initWithBag:](v18, "initWithBag:", v19);

    v21 = -[IDSGroupEncryptionIdentityController initWithConfig:]( objc_alloc(&OBJC_CLASS____TtC17identityservicesd36IDSGroupEncryptionIdentityController),  "initWithConfig:",  v20);
    v22 = objc_alloc(&OBJC_CLASS____TtC17identityservicesd29IDSGroupEncryptionController2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](v2, "sessionController"));
    v24 = -[IDSGroupEncryptionController2 initWithDelegate:config:sessionProvider:identityController:pushHandler:]( v22,  "initWithDelegate:config:sessionProvider:identityController:pushHandler:",  v2,  v20,  v23,  v21,  v2);
    internal = v2->_internal;
    v2->_internal = v24;

    int v26 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"forceTLE", 0LL);
    if ((_os_feature_enabled_impl("IDS", "TransportLevelEncryption") & 1) != 0 || v26)
    {
      v27 = -[IDSGlobalLinkP2PKeyNegotiatorController initWithIdentityProvider:groupMetadataProvider:]( objc_alloc(&OBJC_CLASS____TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController),  "initWithIdentityProvider:groupMetadataProvider:",  v2,  v2);
      p2pNegotiatorProvider = v2->_p2pNegotiatorProvider;
      v2->_p2pNegotiatorProvider = (IDSGlobalLinkP2PKeyNegotiatorProvider *)v27;
    }
  }

  return v2;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v3));

  return v4;
}

- (__SecKey)localPublicPreKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim identityForDevice](self, "identityForDevice"));
  v3 = (__SecKey *)[v2 publicIdentity];

  return v3;
}

- (__SecKey)localPrivatePreKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim identityForDevice](self, "identityForDevice"));
  v3 = (__SecKey *)[v2 fullIdentity];

  return v3;
}

- (__SecKey)previousLocalPublicPreKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim previousIdentityForDevice](self, "previousIdentityForDevice"));
  v3 = (__SecKey *)[v2 publicIdentity];

  return v3;
}

- (__SecKey)previousLocalPrivatePreKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim previousIdentityForDevice](self, "previousIdentityForDevice"));
  v3 = (__SecKey *)[v2 fullIdentity];

  return v3;
}

- (__SecKey)publicKeyForPushToken:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController2 objcPublicIdentityForPushToken:]( self->_internal,  "objcPublicIdentityForPushToken:",  a3));
  v4 = (__SecKey *)[v3 publicIdentity];

  return v4;
}

- (id)addPreKeyChangeHandler:(id)a3
{
  return &stru_100903EF0;
}

- (id)remotePushTokensForGroup:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 participantPushTokens]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  return v5;
}

- (id)localPushToken
{
  return -[IDSGroupEncryptionController2 pushToken](self->_internal, "pushToken");
}

- (BOOL)_isUsingAccount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_accountIDs, "allValues"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003BCD7C;
  v8[3] = &unk_1008FC1B8;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    id v11 = a4;
    os_unfair_lock_lock(&self->_lock);
    BOOL v12 = -[IDSGroupEncryptionController2Shim _isUsingAccount:](self, "_isUsingAccount:", v8);
    if (!v12)
    {
      uint64_t v14 = im_primary_queue(v12, v13);
      v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      v19 = sub_1003BCF54;
      v20 = &unk_1008F5F80;
      id v21 = v8;
      v22 = self;
      dispatch_async(v15, &v17);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_accountIDs,  "setObject:forKeyedSubscript:",  v8,  v10,  v17,  v18,  v19,  v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fromURIs, "setObject:forKeyedSubscript:", v11, v10);

    os_unfair_lock_unlock(&self->_lock);
    dispatch_queue_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      int v26 = v10;
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountIDs, "setObject:forKeyedSubscript:", 0LL, v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fromURIs, "setObject:forKeyedSubscript:", 0LL, v4);
    if (v5)
    {
      BOOL v6 = -[IDSGroupEncryptionController2Shim _isUsingAccount:](self, "_isUsingAccount:", v5);
      if (!v6)
      {
        uint64_t v8 = im_primary_queue(v6, v7);
        id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_1003BD2F8;
        v11[3] = &unk_1008F5F80;
        id v12 = v5;
        uint64_t v13 = self;
        dispatch_async(v9, v11);
      }
    }

    os_unfair_lock_unlock(&self->_lock);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
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
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4, a5, a6, a7));
  [v7 updateDesiredMaterials];
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4));
  [v4 updateDesiredMaterials];
}

- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4));
  [v4 updateDesiredMaterials];
}

- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  internal = self->_internal;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 identityController](internal, "identityController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ensurePublicIdentityForDevice:v8]);

  uint64_t v13 = im_primary_queue(v11, v12);
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003BD570;
  block[3] = &unk_1008F6330;
  id v19 = v6;
  id v15 = v6;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  dispatch_async(v14, v16);

  return v10;
}

- (int64_t)realTimeEncryptionPublicKeyWrappingMode
{
  return -[IDSGroupEncryptionController2 publicIdentityWrapMode](self->_internal, "publicIdentityWrapMode");
}

- (id)realTimeEncryptionPublicKeyData
{
  return -[IDSGroupEncryptionController2 publicIdentityData](self->_internal, "publicIdentityData");
}

- (IDSRealTimeEncryptionIdentity)identityForDevice
{
  return -[IDSGroupEncryptionController2 objcPublicIdentity](self->_internal, "objcPublicIdentity");
}

- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice
{
  return -[IDSGroupEncryptionController2 objcPreviousPublicIdentity](self->_internal, "objcPreviousPublicIdentity");
}

- (void)processIncomingPrekeyAckForGroup:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v5 intValue] + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_prekeyAckCountForGroup,  "setObject:forKeyedSubscript:",  v6,  v4);

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
    int v9 = 138412546;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current ACK'd number of prekey: %@ for group: %@",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)reportPrekeyAckStatus:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prekeyAckCountForGroup,  "objectForKeyedSubscript:",  v4));
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Report the prekey ACK'd (final count: %@) result for group: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_prekeyAckCountForGroup, "removeObjectForKey:", v4);
}

- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4
{
  id v4 =  -[IDSGroupEncryptionController2Shim stableKeyMaterialForGroup:sessionID:]( self,  "stableKeyMaterialForGroup:sessionID:",  a3,  a4);
}

- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4
{
}

- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  [v3 cancelKMCacheReset];
}

- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4
{
  id v6 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v6));
  id v8 = [v7 encryptionSequenceNumber];
  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
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

    [v7 setEncryptionSequenceNumber:a3];
  }
}

- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v4));
  id v6 = [v5 encryptionSequenceNumber];
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
  return 1;
}

- (id)realTimeEncryptionPublicKeyForDevice:(id)a3
{
  return -[IDSGroupEncryptionController2 objcPublicIdentityForPushToken:]( self->_internal,  "objcPublicIdentityForPushToken:",  a3);
}

- (id)publicKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 publicKeys](self->_internal, "publicKeys"));
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "publicKeys: %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5
{
  if (!a3) {
    return 0LL;
  }
  internal = self->_internal;
  id v8 = a4;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", v8));
  id v10 = [v9 localParticipantID];

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v8));
  [v11 setLocalParticipantID:a3];

  if (v10) {
    return 2LL * (v10 != (id)a3);
  }
  else {
    return 1LL;
  }
}

- (unint64_t)localParticipantIDForGroupID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  id v4 = [v3 localParticipantID];

  return (unint64_t)v4;
}

- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionWithGroupID:v8]);

  if (v10)
  {
    id v19 = v8;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v8));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 participants]);
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
          [v17 recoverKeyMaterialForSessionID:v18 mkm:v6 skm:v5];

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v14);
    }

    id v8 = v19;
  }

  else
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToGroup: no session",  buf,  2u);
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  BOOL v25 = a7;
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a4));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v27;
    *(void *)&__int128 v16 = 138412290LL;
    __int128 v24 = v16;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v14);
        }
        __int128 v20 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "participantForID:", objc_msgSend(v20, "unsignedLongLongValue", v24)));
        __int128 v22 = v21;
        if (v21)
        {
          [v21 recoverKeyMaterialForSessionID:v12 mkm:v7 skm:v25];
        }

        else
        {
          __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v31 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "sendKeyMaterialsRecoveryRequestToParticipants: participant not found for ID %@",  buf,  0xCu);
          }
        }
      }

      id v17 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v17);
  }
}

- (void)sendKeyMaterialRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = a3;
  -[IDSGroupEncryptionController2Shim _multiwayFTMessageSendTimeout](self, "_multiwayFTMessageSendTimeout");
  LOBYTE(v13) = 0;
  -[IDSGroupEncryptionController2Shim _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:]( self,  "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:",  v14,  v12,  v11,  v10,  211LL,  1LL,  v13,  0LL,  0LL);
}

- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sessionWithUniqueID:v20]);

  v66 = self;
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v24 sessionWithGroupID:v19]);

  uint64_t v68 = objc_claimAutoreleasedReturnValue([v18 URIByAddingOptionalPushToken:v17]);
  if (objc_msgSend(v23, "destinationsContainFromURI:")
    && ([v25 destinationsContainFromURI:v68] & 1) != 0)
  {
    v59 = v25;
    id v60 = v20;
    v64 = v23;
    id v65 = v21;
    id v61 = v19;
    v62 = v16;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](v66->_internal, "groupForID:", v19));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v63 participants]);
    id v26 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v71;
      while (2)
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v71 != v28) {
            objc_enumerationMutation(obj);
          }
          objc_super v30 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 pushToken]);
          unsigned int v32 = [v31 isEqual:v17];

          if (v32)
          {
            v33 = objc_alloc(&OBJC_CLASS___IDSURI);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v30 allocatedURI]);
            v35 = -[IDSURI initWithPrefixedURI:](v33, "initWithPrefixedURI:", v34);
            unsigned __int8 v36 = [v18 isEqual:v35];

            if ((v36 & 1) != 0)
            {
              id v45 = v30;

              id v16 = v62;
              v58 = (void *)objc_claimAutoreleasedReturnValue( [v62 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionPublicKey]);
              v57 = (void *)objc_claimAutoreleasedReturnValue([v62 _numberForKey:IDSDSessionMessageRealTimeEncryptionWrapModeKey]);
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              id v20 = v60;
              id v19 = v61;
              id v21 = v65;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413571;
                double v75 = *(double *)&v61;
                __int16 v76 = 2112;
                v77 = (IDSURI *)v60;
                __int16 v78 = 2112;
                id v79 = v65;
                __int16 v80 = 2112;
                id v81 = v17;
                __int16 v82 = 2112;
                id v83 = v18;
                __int16 v84 = 2113;
                v85 = v62;
                _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest for group %@, session %@, serverDate %@, pushToken: %@, fro mID: %@, message %{private}@",  buf,  0x3Eu);
              }

              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
              BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
              __int128 v23 = v64;
              if (v48)
              {
                double v49 = ids_monotonic_time(v48);
                *(_DWORD *)buf = 134217984;
                double v75 = v49;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Receiving Key Material (Push, KeyMaterialsRecovery) [PreKey] -- %f",  buf,  0xCu);
              }

              -[IDSGroupEncryptionController2Shim setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:]( v66,  "setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:",  v58,  v17,  v18,  v61,  v60,  v65,  [v57 integerValue]);
              if (v64)
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURI]);
                v51 = (void *)objc_claimAutoreleasedReturnValue([v17 rawToken]);
                uint64_t v67 = objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithAlias:pushToken:]( &OBJC_CLASS___IDSDestination,  "destinationWithAlias:pushToken:",  v50,  v51));

                __int128 v23 = v64;
                v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](v66->_internal, "groupForID:", v61));
                v53 = (void *)objc_claimAutoreleasedReturnValue([v52 ensureSessionForID:v60]);
                [v53 setKeyMaterialIsNeededForParticipant:v45 forMKM:a9 forSKM:a10];

                id v21 = v65;
                -[IDSGroupEncryptionController2Shim sendPublicKeyToDestination:group:sessionID:]( v66,  "sendPublicKeyToDestination:group:sessionID:",  v67,  v61,  v60);
                v54 = (void *)objc_claimAutoreleasedReturnValue([v17 rawToken]);
                [v64 reportPreKeyReceivedOverPushFromToken:v54];

                v55 = (void *)v67;
                v43 = v59;
              }

              else
              {
                v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  double v75 = *(double *)&v61;
                  __int16 v76 = 2112;
                  v77 = (IDSURI *)v60;
                  _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest - there is no group session for group %@, session %@. We won't send any MKM/SKM.",  buf,  0x16u);
                }

                v43 = v59;
                v55 = v56;
              }

              v42 = (void *)v68;

              goto LABEL_31;
            }

            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = objc_alloc(&OBJC_CLASS___IDSURI);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v30 allocatedURI]);
              v40 = -[IDSURI initWithPrefixedURI:](v38, "initWithPrefixedURI:", v39);
              *(_DWORD *)buf = 138412546;
              double v75 = *(double *)&v18;
              __int16 v76 = 2112;
              v77 = v40;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest: found a participant with different URI %@ vs %@.",  buf,  0x16u);
            }
          }
        }

        id v27 = [obj countByEnumeratingWithState:&v70 objects:v86 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    id v19 = v61;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v75 = *(double *)&v61;
      __int16 v76 = 2112;
      v77 = (IDSURI *)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest: We'll drop this key recovery request for group [%@] since deviceToke n [%@] is not in the active participant list!",  buf,  0x16u);
    }

    __int128 v23 = v64;
    v42 = (void *)v68;
    [v64 rejectedKeyRecoveryRequestFromURI:v68 reason:2];
    id v16 = v62;
    v43 = v59;
    id v20 = v60;
    id v21 = v65;
LABEL_31:
  }

  else
  {
    v43 = v25;
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v75 = *(double *)&v19;
      __int16 v76 = 2112;
      v77 = (IDSURI *)v68;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "processIncomingKeyMaterialsRecoveryRequest: We'll drop this prekey recovery request for group %@ since %@ is not in this group!",  buf,  0x16u);
    }

    v42 = (void *)v68;
    [v23 rejectedKeyRecoveryRequestFromURI:v68 reason:1];
  }
}

- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  if (!v18)
  {
    CFMutableDictionaryRef Mutable = 0LL;
    if (!v19) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v22));
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 receiveMKMWithKeyMaterialDictionary:v18 fromPushToken:v20 fromURI:v21 sessionID:v23 isFromSender:a9]);

  if (v25)
  {
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue([v25 keyIndex]);

    if (Mutable)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v25,  @"ids-rtencryption-master-key-material-key");
    }
  }

  else
  {
    CFMutableDictionaryRef Mutable = 0LL;
  }

  if (v19)
  {
LABEL_9:
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v22));
    id v28 =  [v27 receiveSKMWithKeyMaterialDictionary:v19 fromPushToken:v20 fromURI:v21 sessionID:v23 isFromSender:a9];
  }

- (id)masterKeyMaterialForGroup:(id)a3
{
  return 0LL;
}

- (id)stableKeyMaterialForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stableKeyMaterial]);

  return v4;
}

- (void)resetMKMLocalSentStatus:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  [v3 resetKeysSentToClient];
}

- (double)_multiwayFTMessageSendTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"]);

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
        int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
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
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-multiway-ftmessage-enforce-remote-timeout"]);

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
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset the device prekey", v6, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 identityController](self->_internal, "identityController"));
  [v5 resetPreKey];

  os_unfair_lock_unlock(p_lock);
}

- (id)activeParticipantsForGroup:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v5));

    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 participantPushTokens]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    double v8 = 0LL;
  }

  return v8;
}

- (void)removeLocalActiveParticipantForGroup:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim _localDevicePushToken](self, "_localDevicePushToken"));
  -[IDSGroupEncryptionController2Shim removeActiveParticipant:forGroup:]( self,  "removeActiveParticipant:forGroup:",  v5,  v4);
}

- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      p_lock = &self->_lock;
      id v7 = a4;
      id v8 = a3;
      os_unfair_lock_lock(p_lock);
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v7));

      [v9 removeParticipantForToken:v8];
      os_unfair_lock_unlock(p_lock);
    }
  }

- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v6));
    id v9 = v8;
    if (v4)
    {
      [v8 removeAllParticipants];
      [v9 resetKeysToPropagate];
      [v9 resetKeysSentToClient];
      [v9 hardRoll];
    }

    else
    {
      [v8 resetKeysToPropagate];
      [v9 resetKeysSentToClient];
    }

    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = @"NO";
      if (v4) {
        int v11 = @"YES";
      }
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "resetKeysForGroup: %@, shouldRemoveCurrentParticipants: %@",  (uint8_t *)&v12,  0x16u);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)unsubscribeEndpointsForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v4));
    [v6 removeAllMembers];
    [v6 removeAllParticipants];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "setObject:forKeyedSubscript:",  0LL,  v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "unsubscribeEndpointsForGroup: %@",  (uint8_t *)&v8,  0xCu);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (__SecKey)fullIdentityKey
{
  return -[IDSGroupEncryptionController2 fullIdentityKey](self->_internal, "fullIdentityKey");
}

- (__SecKey)previousFullIdentityKey
{
  return -[IDSGroupEncryptionController2 previousFullIdentityKey](self->_internal, "previousFullIdentityKey");
}

- (unint64_t)participantIDForPushToken:(id)a3 inGroup:(id)a4
{
  internal = self->_internal;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", a4));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 participantForToken:v6]);

  id v9 = [v8 participantID];
  return (unint64_t)v9;
}

- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  internal = self->_internal;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", a3));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ensureSessionForID:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 skmController]);
  [v9 ensureKey];

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 skmController]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentObjcMaterial]);

  return v11;
}

- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  -[IDSGroupEncryptionController2Shim _multiwayFTMessageSendTimeout](self, "_multiwayFTMessageSendTimeout");
  double v18 = v17;
  BOOL shouldSendMKMOverQR = self->_shouldSendMKMOverQR;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1003BF258;
  v22[3] = &unk_100903F58;
  id v23 = v12;
  id v20 = v12;
  LOBYTE(v21) = shouldSendMKMOverQR;
  -[IDSGroupEncryptionController2Shim _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:]( self,  "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:",  v16,  v15,  v14,  v13,  211LL,  1LL,  v18,  v21,  &stru_100903F30,  v22);
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
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v20));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 accountWithUniqueID:v22]);

  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fromURIs, "objectForKeyedSubscript:", v20));
  BOOL v25 = (void *)v24;
  if (v23 && v24)
  {
    *(void *)v85 = 0LL;
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
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionWithUniqueID:v57]);

      if (a7 == 211 && a10)
      {
        objc_super v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "sendMessage: calling _generateMKMBlobForQRFromMessage",  buf,  2u);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController2Shim _generateMKMBlobForQRFromMessage:account:destination:fromURI:]( self,  "_generateMKMBlobForQRFromMessage:account:destination:fromURI:",  v58,  v23,  v19,  v25));
        if (v31)
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472LL;
          v70[2] = sub_1003BFB28;
          v70[3] = &unk_1008FC488;
          double v75 = v85;
          __int16 v76 = v77;
          __int128 v71 = (os_log_s *)v20;
          id v72 = v57;
          id v73 = v55;
          id v74 = v56;
          [v27 sendKeyMaterialMessageDataOverQR:v31 toDestination:v19 completionBlock:v70];

          unsigned int v32 = v71;
        }

        else
        {
          unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v80 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Failed to generate a blob to send via QR, only using push {session: %@}",  buf,  0xCu);
          }
        }
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      id v33 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v25 unprefixedURI]);
      [v33 setFromID:v34];

      [v33 setMessage:v58];
      [v33 setEncryptPayload:1];
      [v33 setPriority:300];
      [v33 setDestinations:v19];
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      [v33 setCommand:v35];

      [v33 setIdentifier:v54];
      [v33 setAlwaysSkipSelf:1];
      uint64_t v36 = IDSGetUUIDData(v54);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      [v33 setMessageUUID:v37];

      [v33 setTimeout:a8];
      [v33 setIgnoreMaxRetryCount:1];
      [v33 setWantsResponse:1];
      if (v12) {
        objc_msgSend( v33,  "setEnforceRemoteTimeouts:",  -[IDSGroupEncryptionController2Shim _shouldEnforceRemoteTimeout](self, "_shouldEnforceRemoteTimeout"));
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
      id v39 = [v38 count];

      if (v39)
      {
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
          *(_DWORD *)buf = 138412290;
          __int16 v80 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Group session encryption message requires lack of properties {requiredLackOfCapabilities: %@}",  buf,  0xCu);
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredLackOfCapabilities]);
        [v33 setRequireLackOfRegistrationProperties:v42];
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
      id v44 = [v43 count];

      if (v44)
      {
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
          *(_DWORD *)buf = 138412290;
          __int16 v80 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Group session encryption message requires properties {requiredCapabilities: %@}",  buf,  0xCu);
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue([v27 requiredCapabilities]);
        [v33 setRequireAllRegistrationProperties:v47];
      }

      BOOL v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        [v33 timeout];
        *(_DWORD *)buf = 138412802;
        __int16 v80 = v54;
        __int16 v81 = 2048;
        int64_t v82 = a7;
        __int16 v83 = 2048;
        uint64_t v84 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Sending group session encryption message { GUID: %@, command: %ld, timeout: %f }",  buf,  0x20u);
      }

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_1003BFC98;
      v61[3] = &unk_1008FC4B0;
      id v50 = v54;
      id v62 = v50;
      uint64_t v67 = v85;
      uint64_t v68 = v77;
      int64_t v69 = a7;
      id v63 = v20;
      id v64 = v57;
      id v65 = v55;
      id v66 = v56;
      [v23 sendMessageWithSendParameters:v33 willSendBlock:0 completionBlock:v61];
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sendMessage: Sent messageID %@ to the destination %@ command %@ (message: %@)",  v50,  v19,  v51,  v58));

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_1003BFF0C;
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
      *(_DWORD *)v85 = 138412802;
      *(void *)&v85[4] = v23;
      *(_WORD *)&v85[12] = 2112;
      *(void *)&v85[14] = v25;
      *(_WORD *)&v85[22] = 2112;
      id v86 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "sendMessage: account: %@ fromID: %@ - failed to get the account forGroup: %@",  v85,  0x20u);
    }
  }
}

- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
}

- (void)sendPreKeyMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = im_primary_queue(v13, v14);
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C00F0;
  block[3] = &unk_1008F8D18;
  void block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v16, block);
}

- (void)sendPreKeyRequestMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = im_primary_queue(v13, v14);
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003C0260;
  block[3] = &unk_1008F8D18;
  void block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v16, block);
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
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
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
        id v24 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
        if (v24 && ([*(id *)(*((void *)&v72 + 1) + 8 * (void)i) isNull] & 1) == 0)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "__imHexString"));
          [v18 addObject:v25];
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v72 objects:v82 count:16];
    }

    while (v21);
  }

  int v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  id v81 = v15;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
  id v60 = v14;
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v26 endpointsForURIs:v27 service:v29 fromURI:v16]);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v15]);
  id v58 = v16;
  id v59 = v15;
  id v57 = v30;
  if ([v19 count])
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_1003C08A8;
    v70[3] = &unk_1008FC528;
    id v71 = v18;
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 sortedArrayUsingComparator:v70]);

    v31 = (void *)v32;
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
        v37 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
        id v65 = 0LL;
        id v39 = (void *)objc_claimAutoreleasedReturnValue( [v38 publicKeyDecryptData:v64 fromEndpoint:v37 pkType:1 priority:300 error:&v65]);
        id v40 = v65;

        if (v40)
        {
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v77 = v40;
            __int16 v78 = 2112;
            id v79 = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Failed to process QRMKM payload {error: %@, endpoint: %@}",  buf,  0x16u);
          }
        }

        else if (v39)
        {
          id v49 = v37;

          uint64_t v50 = JWDecodeDictionary(v39);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          id v44 = v61;
          v52 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController2Shim _compactKeyMaterialMessage:isOutgoing:groupID:]( self,  "_compactKeyMaterialMessage:isOutgoing:groupID:",  v51,  0LL,  v61));
          id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v77 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Decoded QR MKM Payload {decodedPayload: %@}",  buf,  0xCu);
          }

          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
          v46 = v58;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v77 = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Expanded QR MKM Payload {expandedPayload: %@}",  buf,  0xCu);
          }

          v47 = v62;
          if (v62)
          {
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v49 pushToken]);
            (*((void (**)(id, void *, void *))v62 + 2))(v62, v52, v55);

            v47 = v62;
          }

          id v45 = v59;
          v43 = v60;
          BOOL v48 = v57;
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

  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Unable to decrypt the incoming MKM QR blob -- returning nil",  buf,  2u);
  }

  v43 = v60;
  id v44 = v61;
  v46 = v58;
  id v45 = v59;
  v47 = v62;
  BOOL v48 = v57;
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
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationURIs]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 anyObject]);

    id v56 = 0LL;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 _stripPotentialTokenURIWithToken:&v56]);
    id v20 = v56;
    if (v20)
    {
      id v45 = self;
      id v49 = v16;
      id v50 = v12;
      id v53 = v10;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      id v23 = v19;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
      id v47 = v20;
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v20,  v24));
      int v26 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
      BOOL v48 = v23;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v23,  v27));
      id v52 = v11;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
      objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
      id v51 = v13;
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v21 endpointForPushToken:v25 URI:v28 service:v30 fromURI:v13]);

      uint64_t v32 = (os_log_s *)v31;
      if (v31)
      {
        id v10 = v53;
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupEncryptionController2Shim _compactKeyMaterialMessage:isOutgoing:groupID:]( v45,  "_compactKeyMaterialMessage:isOutgoing:groupID:",  v53,  1LL,  0LL));
        uint64_t v34 = JWEncodeDictionary(v33);
        uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
        unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
        id v54 = 0LL;
        v46 = (void *)v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue( [v36 publicKeyEncryptData:v35 encryptionContext:0 forceSizeOptimizations:0 resetState:0 withEncryptedAttribut es:0 toEndpoint:v32 usedEncryptionType:&v55 priority:300 metadata:0 error:&v54]);
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
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
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
    id v10 = &off_100948958;
  }
  else {
    id v10 = &off_100948970;
  }
  if (v6) {
    id v11 = &off_100948970;
  }
  else {
    id v11 = &off_100948958;
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

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:2]);
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

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:4]);
      [v20 setObject:v22 forKeyedSubscript:v24];
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:5]);
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v25]);

    if (v26)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:5]);
      [v20 removeObjectForKey:v27];

      id v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:5]);
      [v20 setObject:v26 forKeyedSubscript:v28];
    }

    id v42 = v7;
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:6]);
    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v29]);

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

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:7]);
      [v20 setObject:v34 forKeyedSubscript:v36];
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:2]);
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
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3, a4));
  [v4 updateDesiredMaterials];
}

- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4
{
  id v5 = a3;
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld",  buf,  0x16u);
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld",  buf,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim identityForDevice](self, "identityForDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pushToken]);
  id v10 = [v9 copy];

  -[IDSGroupEncryptionController2Shim resetDevicePrekey](self, "resetDevicePrekey");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v24;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        uint64_t v18 = im_primary_queue(v12, v13);
        id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1003C164C;
        block[3] = &unk_1008F5F58;
        void block[4] = self;
        void block[5] = v17;
        id v22 = v10;
        dispatch_async(v19, block);

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v14 = v12;
    }

    while (v12);
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
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)v15) pushTokenObject]);
        [v10 addObject:v16];

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }

    while (v13);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "objectForKeyedSubscript:",  v9));
  uint64_t v18 = objc_autoreleasePoolPush();
  id v19 = [v17 mutableCopy];
  [v19 intersectsSet:v10];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1003C1DFC;
  v37[3] = &unk_1008F6010;
  id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"newPushTokensForGroup: %@, previousPushTokensForGroup: %@, intersection: %@",  v10,  v17,  v19));
  id v20 = v38;
  cut_dispatch_log_queue(v37);

  objc_autoreleasePoolPop(v18);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastKnownGroupIDToPushTokens,  "setObject:forKeyedSubscript:",  v10,  v9);
  os_unfair_lock_unlock(&self->_lock);
  if ([v17 isEqualToSet:v10])
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
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

    __int128 v25 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
    uint64_t v27 = im_primary_queue(v25, v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1003C1ECC;
    v32[3] = &unk_1008FC578;
    id v33 = (os_log_s *)v11;
    id v34 = v9;
    id v35 = v17;
    uint64_t v36 = self;
    id v29 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v25,  "initWithQueue:interval:repeats:handlerBlock:",  v28,  2LL,  0LL,  v32);
    __int16 v30 = self->_endpointUpdateTimer;
    self->_endpointUpdateTimer = v29;

    id v21 = v33;
  }
}

- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v13));
  id v16 = &IMInsertBoolsToXPCDictionary_ptr;
  if (a5)
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v17 = v11;
    id v18 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v18)
    {
      id v19 = v18;
      __int128 v39 = p_lock;
      id v41 = v13;
      id v37 = v12;
      id v38 = v11;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v22, v37, v38));
          id v24 = [v23 BOOLValue];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v22));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v15 memberForURI:v25]);
          [v26 setIsLightweight:v24];
        }

        id v19 = [v17 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }

      while (v19);
      id v12 = v37;
      id v11 = v38;
      p_lock = v39;
      id v13 = v41;
      id v16 = &IMInsertBoolsToXPCDictionary_ptr;
    }
  }

  else
  {
    __int128 v40 = p_lock;
    id v42 = v13;
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v27 = v12;
    id v28 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v48;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)j)));
          [v17 addObject:v32];
        }

        id v29 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }

      while (v29);
    }

    [v15 updateMembersWithURIs:v17 lightweightStatusDict:v11];
    id v16 = &IMInsertBoolsToXPCDictionary_ptr;
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    id v13 = v42;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v15 memberURIs]);
      *(_DWORD *)buf = 138412546;
      id v53 = v34;
      __int16 v54 = 2112;
      id v55 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "updateLightweightMemberTypes: membersForGroup: %@ for group: %@",  buf,  0x16u);
    }

    p_lock = v40;
  }

  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16[219] RealTimeEncryptionController]);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v15 allMembers]);
    *(_DWORD *)buf = 138412546;
    id v53 = v36;
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "updateLightweightMemberTypes: members: %@ for group: %@",  buf,  0x16u);
  }

  [v15 updateDesiredMaterials];
  os_unfair_lock_unlock(p_lock);
}

- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6
{
  id v10 = a3;
  id v11 = (IDSEndpointSubscription *)a4;
  id v35 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", v11));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));
  id v34 = v12;
  [v13 updateMembersWithURIs:v14 lightweightStatusDict:v12];

  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1006AB8F4(v13, (uint64_t)v11, v15);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v17 = v10;
  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
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

      id v19 = [v17 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }

    while (v19);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_accountIDs, "objectForKeyedSubscript:", v11));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 accountWithUniqueID:v23]);

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fromURIs, "objectForKeyedSubscript:", v11));
  uint64_t v26 = objc_alloc(&OBJC_CLASS___IDSEndpointSubscription);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  id v29 = -[IDSEndpointSubscription initWithServiceIdentifier:localURI:subscribedURIs:queue:]( v26,  "initWithServiceIdentifier:localURI:subscribedURIs:queue:",  v28,  v25,  v16,  self->_realtimeEncryptionQueue);

  [v13 setEndpointSubscription:v29];
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    __int128 v46 = v29;
    __int16 v47 = 2112;
    __int128 v48 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "setMembers: endpointSubscription %p forGroup: %@",  buf,  0x16u);
  }

  if (self->_isInternal)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_prekeyAckCountForGroup, "objectForKey:", v11));

    if (!v31)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_prekeyAckCountForGroup,  "setObject:forKeyedSubscript:",  &off_100947FF8,  v11);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v46 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "ACK'd prekey count is reset to 0 forGroup: %@",  buf,  0xCu);
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  if (!-[IDSGroupEncryptionController2Shim isTestRunning](self, "isTestRunning"))
  {
    realtimeEncryptionQueue = (dispatch_queue_s *)self->_realtimeEncryptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003C27A8;
    block[3] = &unk_1008F60E8;
    id v37 = v29;
    id v38 = self;
    __int128 v39 = v11;
    id v40 = v35;
    dispatch_async(realtimeEncryptionQueue, block);
  }
}

- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  internal = self->_internal;
  id v16 = a6;
  id v17 = a3;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", v13));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

  [v18 updateMembersWithURIs:v19 lightweightStatusDict:v16];
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (a7)
  {
    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 allMembers]);
      int v23 = 138412546;
      id v24 = v22;
      __int16 v25 = 2112;
      uint64_t v26 = @"YES";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "didUpdateMembers to %@, didChangeStandardMembers: %@",  (uint8_t *)&v23,  0x16u);
    }

    -[IDSGroupEncryptionController2Shim _updateRelevantEncryptedDataBlobForSession:]( self,  "_updateRelevantEncryptedDataBlobForSession:",  v14);
    -[IDSGroupEncryptionController2Shim updateServerDesiredKeyMaterialsForGroup:sessionID:]( self,  "updateServerDesiredKeyMaterialsForGroup:sessionID:",  v13,  v14);
  }

  else
  {
    if (v21)
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "didUpdateMembers doesn't do anything because hasChangedStandardMembers=NO.",  (uint8_t *)&v23,  2u);
    }
  }
}

- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionWithUniqueID:v4]);

  if (v6)
  {
    [v6 updateRelevantEncryptedDataBlob];
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006AB9A0((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (BOOL)_isValidPushToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6
{
  internal = self->_internal;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", a5));
  [v10 updateParticipants:v9 lightweight:a4 == 1];
}

- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v35 = self;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2Shim sessionController](self, "sessionController"));
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
          block[2] = sub_1003C3184;
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

  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
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
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "pushToken", v33));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 service]);
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
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v20, v30);

  os_unfair_lock_unlock(&v35->_lock);
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    *(_DWORD *)buf = 138412546;
    id v47 = obj;
    __int16 v48 = 2112;
    __int128 v49 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "didUpdateRegisteredDevices: %@ for account: %@",  buf,  0x16u);
  }

  if ((-[NSMutableSet isEqualToSet:](v20, "isEqualToSet:", v33) & 1) == 0) {
    -[IDSGroupEncryptionController2Shim rollNewKeysAfterResettingPrekeysForGroups:withReason:]( v35,  "rollNewKeysAfterResettingPrekeysForGroups:withReason:",  v34,  1LL);
  }
}

- (void)ensureSessionForID:(id)a3 groupID:(id)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a4));
  id v7 = [v6 ensureSessionForID:v8];
}

- (void)cleanUpSessionForID:(id)a3 groupID:(id)a4
{
  internal = self->_internal;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](internal, "groupForID:", a4));
  [v7 cleanUpSessionForID:v6];
}

- (id)p2pNegotiatorProvider
{
  return self->_p2pNegotiatorProvider;
}

- (id)keyMaterialCacheToGroup:(id)a3
{
  return 0LL;
}

- (id)stablekeyMaterialCacheToGroup:(id)a3
{
  return 0LL;
}

- (id)getParticipantPushTokensForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 participantPushTokens]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  return v5;
}

- (id)getParticipantPushTokensForGroup:(id)a3 ofType:(int64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  id v6 = v5;
  if (a4) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lightweightParticipantPushTokens]);
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 standardParticipantPushTokens]);
  }
  id v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  return v9;
}

- (id)getParticipantsForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 participants]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  return v5;
}

- (id)getMembersForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 memberURIs]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  return v5;
}

- (id)getLightweightStatusDictForGroup:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupEncryptionController2 groupForID:](self->_internal, "groupForID:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allMembers", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isLightweight]));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uri]);
        [v4 setObject:v11 forKeyedSubscript:v12];
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (_TtC17identityservicesd29IDSGroupEncryptionController2)internal
{
  return self->_internal;
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

- (void).cxx_destruct
{
}

@end