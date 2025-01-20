@interface SOSAccount
+ (id)accountFromDER:(const char *)a3 end:(const char *)a4 factory:(SOSDataSourceFactory *)a5 error:(id *)a6;
+ (id)accountFromData:(id)a3 factory:(SOSDataSourceFactory *)a4 error:(id *)a5;
+ (id)urlForSOSAccountSettings;
+ (unsigned)ghostBustGetRampSettings;
+ (void)performOnQuietAccountQueue:(id)a3;
- (BOOL)SOSMonitorModeSOSIsActive;
- (BOOL)_onQueueEnsureInBackupRings:(__CFString *)a3;
- (BOOL)accountInScriptBypassMode;
- (BOOL)accountIsChanging;
- (BOOL)accountKeyIsTrusted;
- (BOOL)circle_rings_retirements_need_attention;
- (BOOL)consolidateKeyInterest;
- (BOOL)engine_peer_state_needs_repair;
- (BOOL)ensureFactoryCircles;
- (BOOL)forceSyncForRecoveryRing;
- (BOOL)ghostBustCheckDate;
- (BOOL)hasPeerInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInCircle:(__CFError *)a3;
- (BOOL)isListeningForSync;
- (BOOL)key_interests_need_updating;
- (BOOL)need_backup_peers_created_after_backup_key_set;
- (BOOL)notifyBackupOnExit;
- (BOOL)notifyCircleChangeOnExit;
- (BOOL)notifyViewChangeOnExit;
- (BOOL)sosCompatibilityMode;
- (BOOL)sosEvaluateIfNeeded;
- (BOOL)sosTestmode;
- (BOOL)syncWaitAndFlush:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(__CFError *)a7;
- (CKKSNearFutureScheduler)performBackups;
- (CKKSNearFutureScheduler)performRingUpdates;
- (CKKSPBFileStorage)accountConfiguration;
- (CKKeyParameter)key_transport;
- (NSData)_password_tmp;
- (NSData)accountKeyDerivationParameters;
- (NSData)backup_key;
- (NSDictionary)gestalt;
- (NSString)deviceID;
- (NSString)peerID;
- (NSUserDefaults)settings;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_source)user_private_timer;
- (OctagonStateMachine)stateMachine;
- (SOSAccount)initWithGestalt:(__CFDictionary *)a3 factory:(SOSDataSourceFactory *)a4;
- (SOSAccountTrustClassic)trust;
- (SOSCKCircleStorage)ck_storage;
- (SOSDataSourceFactory)factory;
- (SOSKVSCircleStorageTransport)circle_transport;
- (SOSMessageKVS)kvs_message_transport;
- (__OpaqueSOSFullPeerInfo)fullPeerInfo;
- (__OpaqueSOSPeerInfo)peerInfo;
- (__SecKey)accountKey;
- (__SecKey)accountPrivateKey;
- (__SecKey)octagonEncryptionFullKeyRef;
- (__SecKey)octagonSigningFullKeyRef;
- (__SecKey)peerPublicKey;
- (__SecKey)previousAccountKey;
- (id)SOSMonitorModeSOSIsActiveDescription;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)encodedData:(id *)a3;
- (id)ghostBustGetDate;
- (id)performBackup;
- (id)performRingUpdate;
- (id)saveBlock;
- (int)getCircleStatus:(__CFError *)a3;
- (int)getPublicKeyStatusForKey:(int)a3 error:(id *)a4;
- (int)lock_notification_token;
- (void)SOSMonitorModeDisableSOS;
- (void)SOSMonitorModeEnableSOS;
- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3;
- (void)_onQueueRecordRetiredPeersInCircle;
- (void)accountStatus:(id)a3;
- (void)addBackupFlag;
- (void)addRingUpdateFlag;
- (void)assertStashedAccountCredential:(id)a3;
- (void)circleHash:(id)a3;
- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8;
- (void)dealloc;
- (void)ensureOctagonPeerKeys;
- (void)flattenToSaveBlock;
- (void)getWatchdogParameters:(id)a3;
- (void)ghostBust:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustInfo:(id)a3;
- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4;
- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4;
- (void)iCloudIdentityStatus:(id)a3;
- (void)iCloudIdentityStatus_internal:(id)a3;
- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4;
- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9;
- (void)keyStatusFor:(int)a3 complete:(id)a4;
- (void)kvsPerformanceCounters:(id)a3;
- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
- (void)performTransaction:(BOOL)a3 action:(id)a4;
- (void)performTransaction:(id)a3;
- (void)performTransaction_Locked:(BOOL)a3 action:(id)a4;
- (void)performTransaction_Locked:(id)a3;
- (void)rateLimitingPerformanceCounters:(id)a3;
- (void)removeV0Peers:(id)a3;
- (void)rpcTriggerBackup:(id)a3 complete:(id)a4;
- (void)rpcTriggerRingUpdate:(id)a3;
- (void)rpcTriggerSync:(id)a3 complete:(id)a4;
- (void)setAccountConfiguration:(id)a3;
- (void)setAccountInBypassMode:(BOOL)a3;
- (void)setAccountInScriptBypassMode:(BOOL)a3;
- (void)setAccountIsChanging:(BOOL)a3;
- (void)setAccountKey:(__SecKey *)a3;
- (void)setAccountKeyDerivationParameters:(id)a3;
- (void)setAccountKeyIsTrusted:(BOOL)a3;
- (void)setAccountPrivateKey:(__SecKey *)a3;
- (void)setBackup_key:(id)a3;
- (void)setBypass:(BOOL)a3 reply:(id)a4;
- (void)setCircle_rings_retirements_need_attention:(BOOL)a3;
- (void)setCircle_transport:(id)a3;
- (void)setCk_storage:(id)a3;
- (void)setConsolidateKeyInterest:(BOOL)a3;
- (void)setDeviceID:(id)a3;
- (void)setEngine_peer_state_needs_repair:(BOOL)a3;
- (void)setFactory:(SOSDataSourceFactory *)a3;
- (void)setForceSyncForRecoveryRing:(BOOL)a3;
- (void)setGestalt:(id)a3;
- (void)setIsListeningForSync:(BOOL)a3;
- (void)setKey_interests_need_updating:(BOOL)a3;
- (void)setKey_transport:(id)a3;
- (void)setKvs_message_transport:(id)a3;
- (void)setLock_notification_token:(int)a3;
- (void)setNeed_backup_peers_created_after_backup_key_set:(BOOL)a3;
- (void)setNotifyBackupOnExit:(BOOL)a3;
- (void)setNotifyCircleChangeOnExit:(BOOL)a3;
- (void)setNotifyViewChangeOnExit:(BOOL)a3;
- (void)setOctagonEncryptionFullKeyRef:(__SecKey *)a3;
- (void)setOctagonSigningFullKeyRef:(__SecKey *)a3;
- (void)setPeerPublicKey:(__SecKey *)a3;
- (void)setPerformBackups:(id)a3;
- (void)setPerformRingUpdates:(id)a3;
- (void)setPreviousAccountKey:(__SecKey *)a3;
- (void)setPublicKeyStatus:(int)a3 forKey:(int)a4;
- (void)setQueue:(id)a3;
- (void)setSaveBlock:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSosCompatibilityMode:(BOOL)a3;
- (void)setSosTestmode:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setStateMachineQueue:(id)a3;
- (void)setTrust:(id)a3;
- (void)setUser_private_timer:(id)a3;
- (void)setWatchdogParmeters:(id)a3 complete:(id)a4;
- (void)set_password_tmp:(id)a3;
- (void)setupStateMachine;
- (void)sosEnableValidityCheck;
- (void)startStateMachine;
- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8;
- (void)stashedCredentialPublicKey:(id)a3;
- (void)triggerBackupForPeers:(id)a3;
- (void)triggerRingUpdate;
- (void)triggerRingUpdateNow:(id)a3;
- (void)userPublicKey:(id)a3;
- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7;
@end

@implementation SOSAccount

- (void)dealloc
{
  if (self)
  {
    accountKey = self->_accountKey;
    if (accountKey)
    {
      self->_accountKey = 0LL;
      CFRelease(accountKey);
    }

    accountPrivateKey = self->_accountPrivateKey;
    if (accountPrivateKey)
    {
      self->_accountPrivateKey = 0LL;
      CFRelease(accountPrivateKey);
    }

    previousAccountKey = self->_previousAccountKey;
    if (previousAccountKey)
    {
      self->_previousAccountKey = 0LL;
      CFRelease(previousAccountKey);
    }

    peerPublicKey = self->_peerPublicKey;
    if (peerPublicKey)
    {
      self->_peerPublicKey = 0LL;
      CFRelease(peerPublicKey);
    }

    octagonSigningFullKeyRef = self->_octagonSigningFullKeyRef;
    if (octagonSigningFullKeyRef)
    {
      self->_octagonSigningFullKeyRef = 0LL;
      CFRelease(octagonSigningFullKeyRef);
    }

    octagonEncryptionFullKeyRef = self->_octagonEncryptionFullKeyRef;
    if (octagonEncryptionFullKeyRef)
    {
      self->_octagonEncryptionFullKeyRef = 0LL;
      CFRelease(octagonEncryptionFullKeyRef);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount performBackups](self, "performBackups"));
    [v9 cancel];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount performRingUpdates](self, "performRingUpdates"));
    [v10 cancel];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
    [v11 haltOperation];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SOSAccount;
  -[SOSAccount dealloc](&v12, "dealloc");
}

- (void)setAccountKey:(__SecKey *)a3
{
  accountKey = self->_accountKey;
  if (accountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountKey = self->_accountKey) != 0LL)) {
      CFRelease(accountKey);
    }
    self->_accountKey = a3;
  }

- (void)setAccountPrivateKey:(__SecKey *)a3
{
  accountPrivateKey = self->_accountPrivateKey;
  if (accountPrivateKey != a3)
  {
    if (!a3 || (CFRetain(a3), (accountPrivateKey = self->_accountPrivateKey) != 0LL)) {
      CFRelease(accountPrivateKey);
    }
    self->_accountPrivateKey = a3;
  }

- (void)setPreviousAccountKey:(__SecKey *)a3
{
  previousAccountKey = self->_previousAccountKey;
  if (previousAccountKey != a3)
  {
    if (!a3 || (CFRetain(a3), (previousAccountKey = self->_previousAccountKey) != 0LL)) {
      CFRelease(previousAccountKey);
    }
    self->_previousAccountKey = a3;
  }

- (void)setPeerPublicKey:(__SecKey *)a3
{
  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey != a3)
  {
    if (!a3 || (CFRetain(a3), (peerPublicKey = self->_peerPublicKey) != 0LL)) {
      CFRelease(peerPublicKey);
    }
    self->_peerPublicKey = a3;
  }

- (BOOL)hasPeerInfo
{
  return -[SOSAccount fullPeerInfo](self, "fullPeerInfo") != 0LL;
}

- (__OpaqueSOSPeerInfo)peerInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (__OpaqueSOSPeerInfo *)[v2 peerInfo];

  return v3;
}

- (__OpaqueSOSFullPeerInfo)fullPeerInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (__OpaqueSOSFullPeerInfo *)[v2 fullPeerInfo];

  return v3;
}

- (NSString)peerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 peerID]);

  return (NSString *)v3;
}

- (BOOL)ensureFactoryCircles
{
  if (-[SOSAccount factory](self, "factory"))
  {
    v3 = (void *)(*(uint64_t (**)(void))-[SOSAccount factory](self, "factory"))();
    if (!v3)
    {
      LOBYTE(v8) = 0;
LABEL_19:

      return (char)v8;
    }

    v4 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v4, "trust"));
    id v6 = [v5 trustedCircle];
    if (v6)
    {
      v7 = v6;
      CFRetain(v6);
    }

    else
    {
      v7 = (const void *)SOSCircleCreate(0LL, v3, 0LL);
      -[SOSAccount setKey_interests_need_updating:](v4, "setKey_interests_need_updating:", 1LL);
      [v5 setTrustedCircle:v7];
      -[SOSAccount sosEvaluateIfNeeded](v4, "sosEvaluateIfNeeded");

      if (!v7)
      {
LABEL_9:
        v9 = v4;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));
          sub_1001B5054(v11);
        }

        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));
          sub_1001B4FCC(v13);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));
          sub_1001B4F14(v15);
        }

        v16 = -[CKKeyParameter initWithAccount:](objc_alloc(&OBJC_CLASS___CKKeyParameter), "initWithAccount:", v9);
        -[SOSAccount setKey_transport:](v9, "setKey_transport:", v16);

        v17 = -[SOSKVSCircleStorageTransport initWithAccount:andCircleName:]( objc_alloc(&OBJC_CLASS___SOSKVSCircleStorageTransport),  "initWithAccount:andCircleName:",  v9,  v3);
        -[SOSAccount setCircle_transport:](v9, "setCircle_transport:", v17);

        v8 = (SOSMessageKVS *)objc_claimAutoreleasedReturnValue(-[SOSAccount key_transport](v9, "key_transport"));
        if (v8)
        {
          v8 = (SOSMessageKVS *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](v9, "circle_transport"));

          if (v8)
          {
            v8 = -[SOSMessageKVS initWithAccount:andName:]( objc_alloc(&OBJC_CLASS___SOSMessageKVS),  "initWithAccount:andName:",  v9,  v3);
            -[SOSAccount setKvs_message_transport:](v9, "setKvs_message_transport:", v8);

            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](v9, "kvs_message_transport"));
            LOBYTE(v8) = v18 != 0LL;
          }
        }

        goto LABEL_19;
      }
    }

    CFRelease(v7);
    goto LABEL_9;
  }

  LOBYTE(v8) = 0;
  return (char)v8;
}

- (void)ensureOctagonPeerKeys
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](&OBJC_CLASS___CKKSLockStateTracker, "globalTracker"));
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    unsigned __int8 v5 = [v3 isLocked];
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](self, "circle_transport"));
      [v6 ensureOctagonPeerKeys:v7];

      v4 = v8;
    }
  }
}

- (SOSAccount)initWithGestalt:(__CFDictionary *)a3 factory:(SOSDataSourceFactory *)a4
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SOSAccount;
  id v6 = -[SOSAccount init](&v35, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("Account Queue", 0LL);
    v8 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v7;

    v9 = -[NSDictionary initWithDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithDictionary:", a3);
    v10 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v9;

    v11 = objc_alloc(&OBJC_CLASS___SOSAccountTrustClassic);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v14 = -[SOSAccountTrustClassic initWithRetirees:fpi:circle:departureCode:peerExpansion:]( v11,  "initWithRetirees:fpi:circle:departureCode:peerExpansion:",  v12,  0LL,  0LL,  0LL,  v13);

    v15 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v14;
    v16 = v14;

    v6[8] = 0;
    *((void *)v6 + 5) = 0LL;
    v17 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 14) = a4;
    *((void *)v6 + 15) = 0LL;

    v18 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = 0LL;

    *((_DWORD *)v6 + 6) = -1;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v20 = (void *)*((void *)v6 + 20);
    *((void *)v6 + 20) = v19;

    v21 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = 0LL;

    v22 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = 0LL;

    v23 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = 0LL;

    v24 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = 0LL;

    *(_DWORD *)(v6 + 9) = 0;
    v25 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = 0LL;

    v26 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = 0LL;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v28 = (void *)*((void *)v6 + 21);
    *((void *)v6 + 21) = v27;

    v6[13] = 0;
    v29 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = 0LL;

    *((void *)v6 + 4) = 0LL;
    *((void *)v6 + 6) = 0LL;
    *((void *)v6 + 7) = 0LL;
    v30 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = 0LL;

    v31 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.security.sosaccount");
    v32 = (void *)*((void *)v6 + 24);
    *((void *)v6 + 24) = v31;

    [v6 SOSMonitorModeSOSIsActive];
    [v6 ensureFactoryCircles];
    CFStringRef v33 = sub_1001A9474(v6);
    if (v33) {
      CFRelease(v33);
    }
    v6[21] = 0;
    *(_DWORD *)(v6 + 17) = 0;
    [v6 setupStateMachine];
  }

  return (SOSAccount *)v6;
}

- (void)startStateMachine
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  [v2 startOperation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SOSAccount);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount gestalt](self, "gestalt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 gestalt]);
    if (![v7 isEqual:v8])
    {
      BOOL v20 = 0;
LABEL_19:

      goto LABEL_20;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    id v10 = [v9 trustedCircle];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
    id v12 = [v11 trustedCircle];
    if (v10 && v12)
    {
      if (CFEqual(v10, v12))
      {
LABEL_6:
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 expansion]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v23 expansion]);
        v24 = v14;
        if ([v14 isEqual:v15])
        {
          v22 = v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
          id v17 = [v16 fullPeerInfo];
          v18 = (void *)objc_claimAutoreleasedReturnValue([v6 trust]);
          id v19 = [v18 fullPeerInfo];
          if (v17 && v19) {
            BOOL v20 = CFEqual(v17, v19) != 0;
          }
          else {
            BOOL v20 = v17 == v19;
          }

          v13 = v22;
        }

        else
        {
          BOOL v20 = 0;
        }

        goto LABEL_18;
      }
    }

    else if (v10 == v12)
    {
      goto LABEL_6;
    }

    BOOL v20 = 0;
LABEL_18:

    goto LABEL_19;
  }

  BOOL v20 = 0;
LABEL_20:

  return v20;
}

- (void)setAccountInBypassMode:(BOOL)a3
{
}

- (void)userPublicKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100190320;
  v7[3] = &unk_100291608;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)kvsPerformanceCounters:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100190314;
  v7[3] = &unk_100291630;
  id v8 = v3;
  id v6 = v3;
  SOSCloudKeychainRequestPerfCounters(v5, v7);
}

- (void)setBypass:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  dispatch_queue_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001902DC;
  block[3] = &unk_100292118;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)rateLimitingPerformanceCounters:(id)a3
{
  id v6 = (void (**)(id, id))a3;
  id v4 = sub_10018DFDC(self, (uint64_t)@"RateLimitCounters");
  if (v4)
  {
    v6[2](v6, v4);
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    v6[2](v6, v5);
  }
}

- (void)stashedCredentialPublicKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10019024C;
  v7[3] = &unk_100291608;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)assertStashedAccountCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001901F4;
  v7[3] = &unk_100291608;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)syncWaitAndFlush:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(__CFError *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = sub_10001267C("pairing");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sync and wait starting", (uint8_t *)&buf, 2u);
  }

  v16 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  sub_10018E3A0();
  uint64_t v17 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  LOBYTE(v38) = a6;
  id v19 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v16,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v11,  v12,  v13,  kSecurityRTCEventNameKVSSyncAndWait,  v18,  v38,  kSecurityRTCEventCategoryAccountDataAccessRecovery);
  dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  char v43 = 0;
  v21 = sub_10001267C("fresh");
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "EFP calling SOSCloudKeychainSynchronizeAndWait",  (uint8_t *)&buf,  2u);
  }

  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  v45 = sub_10018FF90;
  v46 = &unk_1002939C8;
  v48 = &v40;
  v49 = a7;
  dispatch_semaphore_t v47 = v20;
  v23 = v20;
  _os_activity_initiate((void *)&_mh_execute_header, "CloudCircle EFRESH", OS_ACTIVITY_FLAG_DEFAULT, &buf);

  int v24 = *((unsigned __int8 *)v41 + 24);
  _Block_object_dispose(&v40, 8);
  if (v24)
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v19,  1LL,  0LL);
    v25 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    sub_10018E3A0();
    LOBYTE(v39) = a6;
    uint64_t v27 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v25,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v11,  v12,  v13,  kSecurityRTCEventNameFlush,  v26,  v39,  v17);
    BOOL v28 = sub_10018FA68((uint64_t)a7);
    if (v28)
    {
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v27,  1LL,  0LL);
      v29 = sub_10001267C("pairing");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "finished sync and wait",  (uint8_t *)&buf,  2u);
      }
    }

    else
    {
      v34 = sub_10001267C("pairing");
      objc_super v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        if (a7) {
          v36 = *a7;
        }
        else {
          v36 = 0LL;
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "failed flush: %@", (uint8_t *)&buf, 0xCu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v27,  0LL,  *a7);
    }
  }

  else
  {
    v31 = sub_10001267C("pairing");
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (a7) {
        CFStringRef v33 = *a7;
      }
      else {
        CFStringRef v33 = 0LL;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "failed sync and wait: %@",  (uint8_t *)&buf,  0xCu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v19,  0LL,  *a7);
    BOOL v28 = 0;
  }

  return v28;
}

- (void)validatedStashedAccountCredential:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v25 = 0LL;
  if (-[SOSAccount syncWaitAndFlush:flowID:deviceSessionID:canSendMetrics:error:]( self,  "syncWaitAndFlush:flowID:deviceSessionID:canSendMetrics:error:",  v12,  v13,  v14,  v8,  &v25))
  {
    v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018FCD0;
    block[3] = &unk_100291658;
    id v19 = v12;
    id v20 = v13;
    BOOL v24 = v8;
    id v21 = v14;
    v22 = self;
    id v23 = v15;
    dispatch_async(v16, block);
  }

  else
  {
    (*((void (**)(id, void, const void *))v15 + 2))(v15, 0LL, v25);
    uint64_t v17 = v25;
    if (v25)
    {
      v25 = 0LL;
      CFRelease(v17);
    }
  }
}

- (void)stashAccountCredential:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  CFTypeRef cf = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10018F50C;
  v27[3] = &unk_1002916A8;
  v27[4] = self;
  id v19 = v15;
  id v28 = v19;
  id v20 = v16;
  id v29 = v20;
  id v21 = v17;
  id v30 = v21;
  BOOL v33 = a7;
  id v22 = v18;
  id v32 = v22;
  id v23 = v14;
  id v31 = v23;
  SOSDoWithCredentialsWhileUnlocked(&cf, v27);
  if (cf)
  {
    BOOL v24 = sub_10001267C("pairing");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      CFTypeRef v36 = cf;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to process credentials %@", buf, 0xCu);
    }

    CFTypeRef v26 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v26);
    }
  }
}

- (void)myPeerInfo:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 complete:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, uint64_t, uint64_t))a7;
  id v16 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v17 = kSecurityRTCEventNameCreatesSOSApplication;
  sub_10018E3A0();
  LOBYTE(v21) = a6;
  id v19 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v16,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v12,  v13,  v14,  v17,  v18,  v21,  kSecurityRTCEventCategoryAccountDataAccessRecovery);
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  uint64_t v23 = 0LL;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  CFTypeRef v26 = sub_10018ED10;
  uint64_t v27 = sub_10018ED20;
  id v28 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10018F3C0;
  v22[3] = &unk_100293430;
  v22[4] = &v29;
  v22[5] = &v23;
  -[SOSAccount performTransaction:](self, "performTransaction:", v22);
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v19,  v24[5] != 0,  v30[3]);
  v15[2](v15, v24[5], v30[3]);
  id v20 = (const void *)v30[3];
  if (v20)
  {
    v30[3] = 0LL;
    CFRelease(v20);
  }

  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

- (void)circleHash:(id)a3
{
  id v4 = (void (**)(id, void, CFTypeRef))a3;
  CFTypeRef v13 = 0LL;
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10018ED10;
  id v11 = sub_10018ED20;
  id v12 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018F304;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  sub_10001B930(0, &v13, (uint64_t)v6);
  v4[2](v4, v8[5], v13);
  CFTypeRef v5 = v13;
  if (v13)
  {
    CFTypeRef v13 = 0LL;
    CFRelease(v5);
  }

  _Block_object_dispose(&v7, 8);
}

- (id)ghostBustGetDate
{
  return 0LL;
}

- (void)ghostBust:(unsigned int)a3 complete:(id)a4
{
}

- (void)ghostBustPeriodic:(unsigned int)a3 complete:(id)a4
{
}

- (void)ghostBustTriggerTimed:(unsigned int)a3 complete:(id)a4
{
}

- (void)ghostBustInfo:(id)a3
{
}

- (BOOL)ghostBustCheckDate
{
  return 0;
}

- (void)iCloudIdentityStatus:(id)a3
{
}

- (void)accountStatus:(id)a3
{
}

- (void)iCloudIdentityStatus_internal:(id)a3
{
}

- (void)circleJoiningBlob:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 applicant:(id)a7 complete:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, uint64_t, uint64_t))a8;
  id v19 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v20 = kSecurityRTCEventNameCreateSOSCircleBlob;
  sub_10018E3A0();
  LOBYTE(v29) = a6;
  id v22 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v19,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v14,  v15,  v16,  v20,  v21,  v29,  kSecurityRTCEventCategoryAccountDataAccessRecovery);
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  uint64_t v50 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_10018ED10;
  v45 = sub_10018ED20;
  id v46 = 0LL;
  uint64_t v23 = (const void *)SOSPeerInfoCreateFromData(0LL, &v50, v17);
  if (v23)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    uint64_t v31 = sub_10018ED28;
    uint64_t v32 = &unk_100291720;
    BOOL v33 = self;
    v37 = &v41;
    id v34 = v14;
    id v35 = v15;
    BOOL v40 = a6;
    id v36 = v16;
    uint64_t v38 = &v47;
    uint64_t v39 = v23;
    CFTypeRef v51 = 0LL;
    if (sub_10001B63C(0, &v51))
    {
      sub_10018ED28((uint64_t)v30);
      sub_10001B7E4(0, &v51);
      CFTypeRef v24 = v51;
      if (v51)
      {
        CFTypeRef v51 = 0LL;
        CFRelease(v24);
      }
    }

    else
    {
      CFTypeRef v26 = (os_log_s *)sub_10001267C("secaks");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 67109378LL;
        __int16 v53 = 2112;
        CFTypeRef v54 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "SecAKSDoWithKeybagLockAssertionSoftly: failed to get assertion for %d proceeding bravely: %@",  (uint8_t *)&buf,  0x12u);
      }

      CFTypeRef v27 = v51;
      if (v51)
      {
        CFTypeRef v51 = 0LL;
        CFRelease(v27);
      }

      v31((uint64_t)v30);
    }

    CFRelease(v23);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v22,  v42[5] != 0,  v48[3]);
    v18[2](v18, v42[5], v48[3]);
    id v28 = (const void *)v48[3];
    if (v28)
    {
      v48[3] = 0LL;
      CFRelease(v28);
    }
  }

  else
  {
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v22,  0LL,  v48[3]);
    v18[2](v18, 0LL, v48[3]);
    uint64_t v25 = (const void *)v48[3];
    if (v25)
    {
      v48[3] = 0LL;
      CFRelease(v25);
    }
  }

  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)joinCircleWithBlob:(id)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 version:(int)a8 complete:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = (void (**)(id, void, uint64_t))a9;
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x2020000000LL;
  uint64_t v65 = 0LL;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x2020000000LL;
  char v61 = 0;
  id v46 = _NSConcreteStackBlock;
  uint64_t v47 = 3221225472LL;
  v48 = sub_10018E5F0;
  uint64_t v49 = &unk_100291748;
  id v45 = v16;
  id v50 = v45;
  id v20 = v17;
  id v51 = v20;
  id v21 = v18;
  BOOL v57 = a7;
  id v52 = v21;
  CFTypeRef v54 = &v58;
  id v22 = v15;
  int v56 = a8;
  id v53 = v22;
  v55 = &v62;
  -[SOSAccount performTransaction:](self, "performTransaction:", &v46);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  unsigned int v24 = [v23 isInCircleOnly:0];

  if (v63[3])
  {
    id v27 = [(id)objc_opt_class(CKKSAnalytics) logger];
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = v63[3];
    v66[0] = @"SOSEnabled";
    BOOL v31 = -[OTSOSActualAdapter sosEnabled]_0((uint64_t)v28, v30);
    uint64_t v32 = @"compat_disabled";
    if (v31) {
      uint64_t v32 = @"compat_enabled";
    }
    v67[0] = v32;
    v67[1] = @"Pairing";
    v66[1] = @"SOSJoinMethod";
    v66[2] = @"JoiningSOSResult";
    BOOL v33 = @"not_in_circle";
    if (v24) {
      BOOL v33 = @"in_circle";
    }
    v67[2] = v33;
    v66[3] = @"CircleContainsLegacy";
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    int IsLegacy = SOSCircleIsLegacy([v34 trustedCircle], -[SOSAccount accountKey](self, "accountKey"));
    id v36 = @"does_not_contain_legacy";
    if (IsLegacy) {
      id v36 = @"contains_legacy";
    }
    v67[3] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  4LL));
    [v28 logResultForEvent:@"SOSDeferralEventPairing" hardFailure:0 result:v29 withAttributes:v37];
  }

  else
  {
    if (-[OTSOSActualAdapter sosEnabled]_0(v25, v26)) {
      uint64_t v38 = @"compat_enabled";
    }
    else {
      uint64_t v38 = @"compat_disabled";
    }
    if (v24) {
      uint64_t v39 = @"in_circle";
    }
    else {
      uint64_t v39 = @"not_in_circle";
    }
    BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    int v41 = SOSCircleIsLegacy([v40 trustedCircle], -[SOSAccount accountKey](self, "accountKey"));
    uint64_t v42 = @"does_not_contain_legacy";
    if (v41) {
      uint64_t v42 = @"contains_legacy";
    }
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@-%@",  v38,  @"Pairing",  v39,  v42,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52));

    id v43 = [(id)objc_opt_class(CKKSAnalytics) logger];
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v43);
    [v34 logSuccessForEventNamed:v28];
  }

  v19[2](v19, *((unsigned __int8 *)v59 + 24), v63[3]);
  v44 = (const void *)v63[3];
  if (v44)
  {
    v63[3] = 0LL;
    CFRelease(v44);
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
}

- (void)initialSyncCredentials:(unsigned int)a3 altDSID:(id)a4 flowID:(id)a5 deviceSessionID:(id)a6 canSendMetrics:(BOOL)a7 complete:(id)a8
{
  char v12 = a3;
  CFTypeRef cf = 0LL;
  CFTypeRef v13 = (void (**)(id, const __CFArray *, CFTypeRef))a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v18 = kSecurityRTCEventNameAcceptorFetchesInitialSyncData;
  sub_10018E3A0();
  LOBYTE(v38) = a7;
  id v20 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v17,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v16,  v15,  v14,  v18,  v19,  v38,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFIndex Count = 0LL;
  if ((v12 & 1) != 0)
  {
    uint64_t v23 = sub_10010C560((uint64_t)@"inet", &qword_1002DEB38, (uint64_t)&unk_1002DEB30);
    if ((sub_10011865C( (uint64_t)Mutable,  0,  (const __CFBoolean *)@"com.apple.security.ckks",  0LL,  v23,  (__CFString **)&cf) & 1) == 0)
    {
      id v36 = (os_log_s *)sub_10001267C("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)uint64_t buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect CKKS-inet keys: %@";
      goto LABEL_30;
    }

    CFIndex Count = CFArrayGetCount(Mutable);
  }

  if ((v12 & 2) != 0)
  {
    uint64_t v25 = sub_10010C560((uint64_t)@"genp", &qword_1002DEB28, (uint64_t)&unk_1002DEB20);
    if ((sub_10011865C( (uint64_t)Mutable,  0,  (const __CFBoolean *)@"com.apple.ProtectedCloudStorage",  0LL,  v25,  (__CFString **)&cf) & 1) != 0)
    {
      uint64_t v26 = sub_10010C560((uint64_t)@"inet", &qword_1002DEB38, (uint64_t)&unk_1002DEB30);
      if ((sub_10011865C( (uint64_t)Mutable,  (v12 & 4) == 0,  (const __CFBoolean *)@"com.apple.ProtectedCloudStorage",  0LL,  v26,  (__CFString **)&cf) & 1) != 0)
      {
        CFIndex v24 = CFArrayGetCount(Mutable) - Count;
        if ((v12 & 8) != 0) {
          goto LABEL_11;
        }
LABEL_10:
        CFIndex v27 = 0LL;
        goto LABEL_15;
      }

      id v36 = (os_log_s *)sub_10001267C("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)uint64_t buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect PCS-inet keys: %@";
    }

    else
    {
      id v36 = (os_log_s *)sub_10001267C("SecError");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)uint64_t buf = 138412290;
      CFTypeRef v43 = cf;
      v37 = "failed to collect PCS-genp keys: %@";
    }

- (void)importInitialSyncCredentials:(id)a3 complete:(id)a4
{
  CFTypeRef cf = 0LL;
  CFTypeRef v5 = (void (**)(id, uint64_t, CFTypeRef))a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  v9[2] = sub_100118A84;
  v9[3] = &unk_10028F820;
  v9[4] = &cf;
  v9[5] = a3;
  uint64_t v6 = sub_100110ECC(1, 1, 0LL, (uint64_t)&cf, (uint64_t)v9);
  v5[2](v5, v6, cf);

  CFTypeRef v7 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v7);
  }

- (void)rpcTriggerSync:(id)a3 complete:(id)a4
{
  id v6 = a3;
  CFTypeRef v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  BOOL v8 = sub_10001267C("sync");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 138412290;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "trigger a forced sync for %@", buf, 0xCu);
  }

  id v10 = (CFTypeRef *)(v22 + 3);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10018E254;
  v13[3] = &unk_100291798;
  v13[4] = self;
  id v11 = v6;
  id v14 = v11;
  id v15 = &v21;
  id v16 = &v17;
  sub_10001B930(0, v10, (uint64_t)v13);
  v7[2](v7, *((unsigned __int8 *)v18 + 24), v22[3]);
  char v12 = (const void *)v22[3];
  if (v12)
  {
    v22[3] = 0LL;
    CFRelease(v12);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)rpcTriggerBackup:(id)a3 complete:(id)a4
{
  id v6 = a3;
  CFTypeRef cf = 0LL;
  CFTypeRef v7 = (void (**)(id, CFTypeRef))a4;
  if (![v6 count])
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount kvs_message_transport](self, "kvs_message_transport"));
    id v9 = [v8 SOSTransportMessageGetEngine];

    uint64_t v10 = sub_1000D53AC((uint64_t)v9, (uint64_t)&cf);
    id v6 = (id)v10;
  }

  -[SOSAccount triggerBackupForPeers:](self, "triggerBackupForPeers:", v6);
  v7[2](v7, cf);

  CFTypeRef v11 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v11);
  }
}

- (void)rpcTriggerRingUpdate:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  -[SOSAccount triggerRingUpdate](self, "triggerRingUpdate");
  v4[2](v4, 0LL);
}

- (void)getWatchdogParameters:(id)a3
{
  id v3 = (void (**)(id, id, void))a3;
  Class v4 = NSClassFromString(@"SecdWatchdog");
  if (v4)
  {
    CFTypeRef v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class watchdog](v4, "watchdog"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 watchdogParameters]);

    v3[2](v3, v8, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    uint64_t v10 = @"failed to lookup SecdWatchdog class from ObjC runtime";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    CFTypeRef v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.securityd.watchdog",  1LL,  v6));
    ((void (**)(id, id, void *))v3)[2](v3, 0LL, v7);
  }

- (void)setWatchdogParmeters:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  Class v7 = NSClassFromString(@"SecdWatchdog");
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class watchdog](v7, "watchdog"));
    id v11 = 0LL;
    [v8 setWatchdogParameters:v5 error:&v11];
    id v9 = v11;

    v6[2](v6, v9);
  }

  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFTypeRef v13 = @"failed to lookup SecdWatchdog class from ObjC runtime";
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.securityd.watchdog",  1LL,  v10));
    v6[2](v6, v9);

    id v6 = (void (**)(id, id))v10;
  }
}

- (void)removeV0Peers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10018E13C;
  v5[3] = &unk_100293978;
  id v6 = a3;
  id v4 = v6;
  -[SOSAccount performTransaction:](self, "performTransaction:", v5);
}

- (void)sosEnableValidityCheck
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SOSEnabled"]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    [v5 logSuccessForEventNamed:@"SOSInitialized"];

    id v6 = sub_10001267C("SOSMonitorMode");
    Class v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No value found for SOSMonitorMode initializing to Active",  v8,  2u);
    }

    -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
  }
}

- (void)SOSMonitorModeDisableSOS
{
  id v3 = sub_10001267C("SOSMonitorMode");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling SOS from monitor mode", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  [v5 setBool:0 forKey:@"SOSEnabled"];
}

- (void)SOSMonitorModeEnableSOS
{
  id v3 = sub_10001267C("SOSMonitorMode");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting SOS to active", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  [v5 setBool:1 forKey:@"SOSEnabled"];
}

- (void)SOSMonitorModeSOSIsActiveWithCallback:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))( v5,  -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive"));
}

- (BOOL)SOSMonitorModeSOSIsActive
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount settings](self, "settings"));
  unsigned __int8 v4 = [v3 BOOLForKey:@"SOSEnabled"];

  return v4;
}

- (id)SOSMonitorModeSOSIsActiveDescription
{
  if (-[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive")) {
    return @"[SOS is active]";
  }
  else {
    return @"[SOS is monitoring]";
  }
}

- (BOOL)sosEvaluateIfNeeded
{
  if (qword_1002DEB80 != -1) {
    dispatch_once(&qword_1002DEB80, &stru_10028EFC8);
  }
  int v3 = byte_1002DEB78;
  unsigned __int8 v4 = sub_10001267C("SOSMonitorMode");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "sosEvaluateIfNeeded - SOS Compatibility Mode enabled, checking mode",  buf,  2u);
    }

    BOOL v9 = -[OTSOSActualAdapter sosEnabled]_0(v7, v8);
    uint64_t v10 = sub_10001267C("SOSMonitorMode");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sosEvaluateIfNeeded - Turning on SOS for Compatibility mode",  v32,  2u);
      }

      -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
    }

    else
    {
      if (v12)
      {
        *(_WORD *)BOOL v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sosEvaluateIfNeeded - Turning off SOS for Compatibility mode",  v31,  2u);
      }

      -[SOSAccount SOSMonitorModeDisableSOS](self, "SOSMonitorModeDisableSOS");
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    uint64_t v19 = v18;
    char v20 = @"SOSCompatMode";
    goto LABEL_22;
  }

  if (v6)
  {
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sosEvaluateIfNeeded - checking circle", v30, 2u);
  }

  if (!-[SOSAccount accountKeyIsTrusted](self, "accountKeyIsTrusted"))
  {
    if (!-[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive")) {
      return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
    }
    id v22 = sub_10001267C("SOSMonitorMode");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    __int16 v29 = 0;
    uint64_t v24 = "SOS is in monitor mode since the account key isn't trusted";
    uint64_t v25 = (uint8_t *)&v29;
    goto LABEL_30;
  }

  CFTypeRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  int IsLegacy = SOSCircleIsLegacy([v13 trustedCircle], -[SOSAccount accountKey](self, "accountKey"));

  unsigned int v15 = -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
  if (!IsLegacy)
  {
    if (!v15) {
      return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
    }
    id v26 = sub_10001267C("SOSMonitorMode");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    LOWORD(v27) = 0;
    uint64_t v24 = "Putting SOS into monitor mode due to circle change";
    uint64_t v25 = (uint8_t *)&v27;
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
LABEL_31:

    -[SOSAccount SOSMonitorModeDisableSOS](self, "SOSMonitorModeDisableSOS");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    uint64_t v19 = v18;
    char v20 = @"SOSMonitorMode";
LABEL_22:
    objc_msgSend(v18, "logSuccessForEventNamed:", v20, v27);

    return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
  }

  if ((v15 & 1) == 0)
  {
    id v16 = sub_10001267C("SOSMonitorMode");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Putting SOS into active mode for circle change",  v28,  2u);
    }

    -[SOSAccount SOSMonitorModeEnableSOS](self, "SOSMonitorModeEnableSOS");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAnalytics logger](&OBJC_CLASS___SOSAnalytics, "logger"));
    uint64_t v19 = v18;
    char v20 = @"SOSLegacyMode";
    goto LABEL_22;
  }

  return -[SOSAccount SOSMonitorModeSOSIsActive](self, "SOSMonitorModeSOSIsActive");
}

- (void)flattenToSaveBlock
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount saveBlock](self, "saveBlock"));

  if (v3)
  {
    id v7 = 0LL;
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount encodedData:](self, "encodedData:", &v7));
    id v5 = v7;
    BOOL v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[SOSAccount saveBlock](self, "saveBlock"));
    ((void (**)(void, void *, id))v6)[2](v6, v4, v5);
  }

- (int)getCircleStatus:(__CFError *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  int v6 = [v5 getCircleStatusOnly:a3];

  int result = -1;
  if (a3 && !v6)
  {
    uint64_t v8 = *a3;
    if (*a3)
    {
      *a3 = 0LL;
      CFRelease(v8);
    }

    SOSCreateError( 2LL,  @"Public Key isn't available, this peer is in the circle, but invalid. The iCloud Password must be provided to keychain syncing subsystem to repair this.",  0LL,  a3);
    return -1;
  }

  return result;
}

- (BOOL)isInCircle:(__CFError *)a3
{
  unsigned int v4 = -[SOSAccount getCircleStatus:](self, "getCircleStatus:");
  if (v4) {
    SOSErrorCreate(1037LL, a3, 0LL, @"Not in circle");
  }
  return v4 == 0;
}

- (BOOL)_onQueueEnsureInBackupRings:(__CFString *)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  int v6 = self;
  if (!v6 || !a3)
  {
    sub_1000194E0(-50, 0LL, @"NULL account or viewName parameter");
    goto LABEL_27;
  }

  CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@-tomb", a3);
  if (!v7)
  {
LABEL_27:

    return 0;
  }

  CFStringRef v8 = v7;
  BOOL v9 = sub_10019D600(v6, v7);
  if (!v9)
  {
    CFRelease(v8);
    goto LABEL_27;
  }

  uint64_t v10 = v9;
  id v11 = sub_1001AC124(kCFAllocatorDefault, v6, 0LL);
  BOOL v12 = (const void *)sub_1001ABF60(v10);
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  MutableForSOSPeerInfosByID = (const void *)CFSetCreateMutableForSOSPeerInfosByID(kCFAllocatorDefault);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v6, "trust"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001959A4;
  v22[3] = &unk_100292FD0;
  v22[4] = Mutable;
  v22[5] = MutableForSOSPeerInfosByID;
  SOSCircleForEachBackupCapablePeerForView( [v15 trustedCircle],  -[SOSAccount accountKey](v6, "accountKey"),  a3,  v22);

  CFMutableSetRef v16 = sub_1001D5DE0((uint64_t)v10);
  int v17 = CFEqual(Mutable, v16);
  else {
    int v18 = 1;
  }
  if (v17) {
    int v19 = 0;
  }
  else {
    int v19 = v18;
  }
  CFRelease(v8);
  CFRelease(v10);
  if (v16) {
    CFRelease(v16);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (MutableForSOSPeerInfosByID)
  {
    CFRelease(MutableForSOSPeerInfosByID);

    if ((v19 & 1) == 0) {
      return 0;
    }
LABEL_24:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10018E050;
    v21[3] = &unk_100291CE0;
    v21[4] = v6;
    v21[5] = a3;
    return sub_100194CF8(v6, (uint64_t)a3, 0LL, v21);
  }

  if (v19) {
    goto LABEL_24;
  }
  return 0;
}

- (void)setPublicKeyStatus:(int)a3 forKey:(int)a4
{
  uint64_t valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
  CFStringRef v7 = @"kSOSBackupKeyStatus";
  if (a4 != 1) {
    CFStringRef v7 = 0LL;
  }
  if (a4 == 2) {
    CFStringRef v8 = @"kSOSRecoveryKeyStatus";
  }
  else {
    CFStringRef v8 = v7;
  }
  if (v8) {
    sub_1001A93D0(self, (uint64_t)v8, (uint64_t)v6, 0LL);
  }
  if (v6) {
    CFRelease(v6);
  }
}

- (int)getPublicKeyStatusForKey:(int)a3 error:(id *)a4
{
  uint64_t valuePtr = -1LL;
  id v5 = @"kSOSBackupKeyStatus";
  if (a3 != 1) {
    id v5 = 0LL;
  }
  if (a3 == 2) {
    CFNumberRef v6 = @"kSOSRecoveryKeyStatus";
  }
  else {
    CFNumberRef v6 = v5;
  }
  if (v6)
  {
    BOOL v9 = (const __CFNumber *)sub_10018DFDC(self, (uint64_t)v6);
    if (v9)
    {
      CFNumberGetValue(v9, kCFNumberCFIndexType, &valuePtr);
      if (a3 == 1)
      {
        if ((SOSPeerInfoHasBackupKey(-[SOSAccount peerInfo](self, "peerInfo")) & 1) == 0) {
          return 0LL;
        }
      }

      else if (a3 == 2)
      {
        uint64_t v10 = sub_1001AC124(kCFAllocatorDefault, self, 0LL);
        if (!v10) {
          return 0LL;
        }
LABEL_51:
        CFRelease(v10);
      }

      return valuePtr;
    }

    uint64_t valuePtr = 0LL;
    if (a3 != 1)
    {
      if (a3 != 2)
      {
        uint64_t valuePtr = -1LL;
        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSOSErrorDomain,  9LL,  0LL));
        }
        return valuePtr;
      }

      BOOL v12 = self;
      CFTypeRef cf = 0LL;
      CFTypeRef v13 = sub_1001AC124(kCFAllocatorDefault, v12, 0LL);
      if (!v13)
      {

        goto LABEL_49;
      }

      id v14 = v13;
      CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@-tomb", kSOSViewiCloudIdentity);
      CFMutableSetRef v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](v12, "trust"));
      int v17 = [v16 copyRing:v15 err:&cf];

      if (v15) {
        CFRelease(v15);
      }
      if (v17)
      {
        uint64_t v18 = sub_1001ABCE8(v17, (uint64_t)&cf);
        if (v18 && (uint64_t v19 = SOSBackupSliceKeyBagCreateFromData(kCFAllocatorDefault, v18, &cf)) != 0)
        {
          char v20 = (const void *)v19;
          int v21 = SOSBKSBPrefixedKeyIsInKeyBag(v19, bskbRkbgPrefix, v14);
          CFRelease(v20);
        }

        else
        {
          int v21 = 0;
        }

        CFRelease(v17);
      }

      else
      {
        int v21 = 0;
        uint64_t v18 = 0LL;
      }

      CFRelease(v14);
      if (cf)
      {
        id v22 = sub_10001267C("backup");
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 138412802;
          uint64_t v39 = v18;
          __int16 v40 = 2112;
          uint64_t v41 = 0LL;
          __int16 v42 = 2112;
          CFTypeRef v43 = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Failed to find BKSB: %@, %@ (%@)",  buf,  0x20u);
        }

        CFTypeRef v24 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v24);

          if ((v21 & 1) != 0) {
            return 2LL;
          }
LABEL_49:
          uint64_t v10 = sub_1001AC124(kCFAllocatorDefault, v12, 0LL);
          if (!v10) {
            return valuePtr;
          }
          uint64_t valuePtr = 1LL;
          goto LABEL_51;
        }
      }

      if (!v21) {
        goto LABEL_49;
      }
      return 2LL;
    }

    uint64_t v25 = self;
    id v26 = v25;
    if (!v25
      || ((uint64_t v27 = kSOSViewiCloudIdentity, v28 = -[SOSAccount peerInfo](v25, "peerInfo"), v27)
        ? (BOOL v29 = v28 == 0LL)
        : (BOOL v29 = 1),
          v29))
    {
      sub_1000194E0(-50, 0LL, @"NULL account/peerInfo or viewName parameter");

      goto LABEL_56;
    }

    CFStringRef v30 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@-tomb", v27);
    BOOL v31 = sub_10019D600(v26, v30);
    uint64_t v32 = v31;
    if (v31)
    {
      BOOL v33 = (const void *)sub_1001ABF60(v31);
      int v34 = SOSBKSBPeerBackupKeyIsInKeyBag(v33, -[SOSAccount peerInfo](v26, "peerInfo"));
      if (!v30) {
        goto LABEL_41;
      }
    }

    else
    {
      BOOL v33 = 0LL;
      int v34 = 0;
      if (!v30)
      {
LABEL_41:
        if (v32) {
          CFRelease(v32);
        }
        if (v33)
        {
          CFRelease(v33);

          if ((v34 & 1) != 0) {
            return 2LL;
          }
        }

        else
        {

          if (v34) {
            return 2LL;
          }
        }

- (void)keyStatusFor:(int)a3 complete:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = 0LL;
  CFNumberRef v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = -[SOSAccount getPublicKeyStatusForKey:error:](self, "getPublicKeyStatusForKey:error:", v4, &v9);
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)_onQueueRecordRetiredPeersInCircle
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[SOSAccount isInCircle:](self, "isInCircle:", 0LL))
  {
    uint64_t v11 = 0LL;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    char v14 = 0;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount circle_transport](self, "circle_transport"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10018DD10;
    v7[3] = &unk_1002918F0;
    id v6 = v4;
    id v8 = v6;
    id v9 = self;
    uint64_t v10 = &v11;
    [v6 modifyCircle:v5 err:0 action:v7];

    if (*((_BYTE *)v12 + 24)) {
      sub_1001957A4(self);
    }

    _Block_object_dispose(&v11, 8);
  }

- (void)setupStateMachine
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v4 = objc_alloc(&OBJC_CLASS___CKKSPBFileStorage);
  id v5 = [(id)objc_opt_class(self) urlForSOSAccountSettings];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[CKKSPBFileStorage initWithStoragePath:storageClass:]( v4,  "initWithStoragePath:storageClass:",  v6,  objc_opt_class(&OBJC_CLASS___SOSAccountConfiguration));
  -[SOSAccount setAccountConfiguration:](self, "setAccountConfiguration:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  if (v8)
  {
    CFTypeRef v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2 object:self file:@"SOSAccount.m" lineNumber:3372 description:@"can't bootstrap more than once"];
  }

  dispatch_queue_t v9 = dispatch_queue_create("SOS-statemachine", 0LL);
  -[SOSAccount setStateMachineQueue:](self, "setStateMachineQueue:", v9);

  uint64_t v10 = objc_alloc(&OBJC_CLASS___OctagonStateMachine);
  if (qword_1002DED68 != -1) {
    dispatch_once(&qword_1002DED68, &stru_100291C20);
  }
  id v11 = (id)qword_1002DED60;
  if (qword_1002DED78 != -1) {
    dispatch_once(&qword_1002DED78, &stru_100291C40);
  }
  id v12 = (id)qword_1002DED70;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  char v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](&OBJC_CLASS___CKKSLockStateTracker, "globalTracker"));
  CFStringRef v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:]( v10,  "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:",  @"sosaccount",  v11,  v12,  @"ready",  v13,  self,  @"com.apple.security.sosaccount.state",  v14,  0LL);
  -[SOSAccount setStateMachine:](self, "setStateMachine:", v15);

  CFMutableSetRef v16 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10018DB50;
  v27[3] = &unk_100291A38;
  objc_copyWeak(&v28, &location);
  int v17 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v16,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"performBackups",  5000000000LL,  120000000000LL,  1LL,  0LL,  v27,  2.0);
  -[SOSAccount setPerformBackups:](self, "setPerformBackups:", v17);

  uint64_t v18 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10018DB7C;
  v25[3] = &unk_100291A38;
  objc_copyWeak(&v26, &location);
  uint64_t v19 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v18,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"performRingUpdates",  1000000000LL,  10000000000LL,  1LL,  0LL,  v25,  2.0);
  -[SOSAccount setPerformRingUpdates:](self, "setPerformRingUpdates:", v19);

  char v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount accountConfiguration](self, "accountConfiguration"));
  int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 storage]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pendingBackupPeers]);
  id v23 = [v22 count];

  if (v23) {
    -[SOSAccount addBackupFlag](self, "addBackupFlag");
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)addBackupFlag
{
  uint64_t v4 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"trigger_backup",  1LL);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)addRingUpdateFlag
{
  uint64_t v4 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"trigger_ring_update",  1LL);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerBackupForPeers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = v5;
  if (v4) {
    [v5 addObjectsFromArray:v4];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10018D998;
  v10[3] = &unk_100291A60;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)triggerRingUpdateNow:(id)a3
{
  id v4 = a3;
  -[SOSAccount setForceSyncForRecoveryRing:](self, "setForceSyncForRecoveryRing:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  if ([v5 isPaused])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentState]);
    unsigned __int8 v8 = [v7 isEqualToString:@"ready"];

    if ((v8 & 1) != 0) {
      goto LABEL_6;
    }
  }

  else
  {
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  id v10 = [v9 waitForState:@"ready" wait:10000000000];

LABEL_6:
  id v22 = @"perform_ring_update";
  char v20 = @"ready";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  int v21 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  id v23 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  char v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v13));

  CFStringRef v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachine](self, "stateMachine"));
  uint64_t v19 = @"ready";
  CFMutableSetRef v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  id v18 =  [v15 doWatchedStateMachineRPC:@"rpc-perform-rings" sourceStates:v17 path:v14 reply:v4];
}

- (void)triggerRingUpdate
{
  if (!-[SOSAccount consolidateKeyInterest](self, "consolidateKeyInterest"))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10018D850;
    v4[3] = &unk_100291A38;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

- (id)performBackup
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10018D694;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"perform-backup-state",  @"ready",  @"error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)performRingUpdate
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10018CD70;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"perform-ring-update",  @"ready",  @"error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount stateMachineQueue](self, "stateMachineQueue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_10001267C("sos-sm");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Entering state: %@ [flags: %@]",  (uint8_t *)&v17,  0x16u);
  }

  if ([v7 isEqualToString:@"ready"])
  {
    if ([v8 _onqueueContains:@"trigger_backup"])
    {
      [v8 _onqueueRemoveFlag:@"trigger_backup"];
      id v12 = @"perform-backup-flag";
      id v13 = @"perform_backup";
LABEL_11:
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  v12,  v13));
      goto LABEL_12;
    }

    if ([v8 _onqueueContains:@"trigger_ring_update"])
    {
      [v8 _onqueueRemoveFlag:@"trigger_ring_update"];
      id v12 = @"perform-ring-update-flag";
      id v13 = @"perform_ring_update";
      goto LABEL_11;
    }

- (__SecKey)accountKey
{
  return self->_accountKey;
}

- (__SecKey)accountPrivateKey
{
  return self->_accountPrivateKey;
}

- (__SecKey)previousAccountKey
{
  return self->_previousAccountKey;
}

- (__SecKey)peerPublicKey
{
  return self->_peerPublicKey;
}

- (NSDictionary)gestalt
{
  return self->_gestalt;
}

- (void)setGestalt:(id)a3
{
}

- (NSData)backup_key
{
  return self->_backup_key;
}

- (void)setBackup_key:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (SOSAccountTrustClassic)trust
{
  return self->_trust;
}

- (void)setTrust:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)user_private_timer
{
  return self->_user_private_timer;
}

- (void)setUser_private_timer:(id)a3
{
}

- (SOSDataSourceFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(SOSDataSourceFactory *)a3
{
  self->_factory = a3;
}

- (NSData)_password_tmp
{
  return self->__password_tmp;
}

- (void)set_password_tmp:(id)a3
{
}

- (BOOL)isListeningForSync
{
  return self->_isListeningForSync;
}

- (void)setIsListeningForSync:(BOOL)a3
{
  self->_isListeningForSync = a3;
}

- (int)lock_notification_token
{
  return self->_lock_notification_token;
}

- (void)setLock_notification_token:(int)a3
{
  self->_lock_notification_token = a3;
}

- (CKKeyParameter)key_transport
{
  return self->_key_transport;
}

- (void)setKey_transport:(id)a3
{
}

- (SOSKVSCircleStorageTransport)circle_transport
{
  return self->_circle_transport;
}

- (void)setCircle_transport:(id)a3
{
}

- (SOSMessageKVS)kvs_message_transport
{
  return self->_kvs_message_transport;
}

- (void)setKvs_message_transport:(id)a3
{
}

- (SOSCKCircleStorage)ck_storage
{
  return self->_ck_storage;
}

- (void)setCk_storage:(id)a3
{
}

- (BOOL)circle_rings_retirements_need_attention
{
  return self->_circle_rings_retirements_need_attention;
}

- (void)setCircle_rings_retirements_need_attention:(BOOL)a3
{
  self->_circle_rings_retirements_need_attention = a3;
}

- (BOOL)engine_peer_state_needs_repair
{
  return self->_engine_peer_state_needs_repair;
}

- (void)setEngine_peer_state_needs_repair:(BOOL)a3
{
  self->_engine_peer_state_needs_repair = a3;
}

- (BOOL)key_interests_need_updating
{
  return self->_key_interests_need_updating;
}

- (void)setKey_interests_need_updating:(BOOL)a3
{
  self->_key_interests_need_updating = a3;
}

- (BOOL)need_backup_peers_created_after_backup_key_set
{
  return self->_need_backup_peers_created_after_backup_key_set;
}

- (void)setNeed_backup_peers_created_after_backup_key_set:(BOOL)a3
{
  self->_need_backup_peers_created_after_backup_key_set = a3;
}

- (NSData)accountKeyDerivationParameters
{
  return self->_accountKeyDerivationParameters;
}

- (void)setAccountKeyDerivationParameters:(id)a3
{
}

- (BOOL)accountKeyIsTrusted
{
  return self->_accountKeyIsTrusted;
}

- (void)setAccountKeyIsTrusted:(BOOL)a3
{
  self->_accountKeyIsTrusted = a3;
}

- (id)saveBlock
{
  return objc_getProperty(self, a2, 184LL, 1);
}

- (void)setSaveBlock:(id)a3
{
}

- (BOOL)notifyCircleChangeOnExit
{
  return self->_notifyCircleChangeOnExit;
}

- (void)setNotifyCircleChangeOnExit:(BOOL)a3
{
  self->_notifyCircleChangeOnExit = a3;
}

- (BOOL)notifyViewChangeOnExit
{
  return self->_notifyViewChangeOnExit;
}

- (void)setNotifyViewChangeOnExit:(BOOL)a3
{
  self->_notifyViewChangeOnExit = a3;
}

- (BOOL)notifyBackupOnExit
{
  return self->_notifyBackupOnExit;
}

- (void)setNotifyBackupOnExit:(BOOL)a3
{
  self->_notifyBackupOnExit = a3;
}

- (NSUserDefaults)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (__SecKey)octagonSigningFullKeyRef
{
  return self->_octagonSigningFullKeyRef;
}

- (void)setOctagonSigningFullKeyRef:(__SecKey *)a3
{
  self->_octagonSigningFullKeyRef = a3;
}

- (__SecKey)octagonEncryptionFullKeyRef
{
  return self->_octagonEncryptionFullKeyRef;
}

- (void)setOctagonEncryptionFullKeyRef:(__SecKey *)a3
{
  self->_octagonEncryptionFullKeyRef = a3;
}

- (BOOL)accountIsChanging
{
  return self->_accountIsChanging;
}

- (void)setAccountIsChanging:(BOOL)a3
{
  self->_accountIsChanging = a3;
}

- (BOOL)sosTestmode
{
  return self->_sosTestmode;
}

- (void)setSosTestmode:(BOOL)a3
{
  self->_sosTestmode = a3;
}

- (BOOL)consolidateKeyInterest
{
  return self->_consolidateKeyInterest;
}

- (void)setConsolidateKeyInterest:(BOOL)a3
{
  self->_consolidateKeyInterest = a3;
}

- (BOOL)accountInScriptBypassMode
{
  return self->_accountInScriptBypassMode;
}

- (void)setAccountInScriptBypassMode:(BOOL)a3
{
  self->_accountInScriptBypassMode = a3;
}

- (BOOL)sosCompatibilityMode
{
  return self->_sosCompatibilityMode;
}

- (void)setSosCompatibilityMode:(BOOL)a3
{
  self->_sosCompatibilityMode = a3;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setStateMachineQueue:(id)a3
{
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (CKKSPBFileStorage)accountConfiguration
{
  return (CKKSPBFileStorage *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setAccountConfiguration:(id)a3
{
}

- (CKKSNearFutureScheduler)performBackups
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setPerformBackups:(id)a3
{
}

- (CKKSNearFutureScheduler)performRingUpdates
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setPerformRingUpdates:(id)a3
{
}

- (BOOL)forceSyncForRecoveryRing
{
  return self->_forceSyncForRecoveryRing;
}

- (void)setForceSyncForRecoveryRing:(BOOL)a3
{
  self->_forceSyncForRecoveryRing = a3;
}

- (void).cxx_destruct
{
}

+ (unsigned)ghostBustGetRampSettings
{
  return 0;
}

+ (id)urlForSOSAccountSettings
{
  return sub_10001B988((uint64_t)@"SOSAccountSettings.pb");
}

- (id)encodedData:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self, "trust"));
  id v6 = [v5 getDEREncodedSize:self err:a3];

  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10019C624;
    v9[3] = &unk_100292040;
    v9[4] = self;
    v9[5] = a3;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithSpace:DEREncode:]( &OBJC_CLASS___NSMutableData,  "dataWithSpace:DEREncode:",  v6,  v9));
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)accountFromDER:(const char *)a3 end:(const char *)a4 factory:(SOSDataSourceFactory *)a5 error:(id *)a6
{
  CFTypeRef v85 = 0LL;
  v88 = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v89 = 0LL;
  id v9 = (const char *)ccder_decode_constructed_tl(0x2000000000000010LL, &v88, *a3, a4);
  *a3 = v9;
  id v10 = (const char *)ccder_decode_uint64(&v89, v9, v88);
  *a3 = v10;
  if (!v10)
  {
    SOSCreateError(1035LL, @"Version parsing failed", 0LL, &v85);
    if (!a6) {
      goto LABEL_30;
    }
    goto LABEL_96;
  }

  if (v89 == 6)
  {
    CFTypeRef v35 = v88;
    *(void *)uint64_t buf = 0LL;
    *(void *)v100 = 0LL;
    uint64_t v36 = ((uint64_t (*)(SOSDataSourceFactory *))a5->var0)(a5);
    uint64_t v99 = 0LL;
    v37 = (const char *)sub_1000126F8( kCFAllocatorDefault,  (CFMutableDictionaryRef *)&v99,  &v85,  (uint64_t)*a3,  (uint64_t)v35);
    *a3 = v37;
    if (!v37) {
      goto LABEL_95;
    }
    CFMutableDictionaryRef v38 = (CFMutableDictionaryRef)v99;
    uint64_t v39 = sub_100190D30(v99, (uint64_t)a5);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (v38) {
      CFRelease(v38);
    }
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 trust]);
    __int16 v42 = (const char *)sub_10001A18C(kCFAllocatorDefault, (CFMutableArrayRef *)buf, &v85, (uint64_t)*a3, (uint64_t)v35);
    *a3 = v42;
    uint64_t v99 = 5LL;
    *a3 = (const char *)ccder_decode_uint64(&v99, v42, v35);
    [v41 setDepartureCode:v99];
    char v98 = -86;
    *a3 = (const char *)sub_100018C70((BOOL *)&v98, (uint64_t)*a3, (uint64_t)v35);
    [v40 setAccountKeyIsTrusted:v98];
    v96 = 0LL;
    v97 = 0LL;
    *a3 = (const char *)sub_100198924((uint64_t)kCFAllocatorDefault, &v97);
    *a3 = (const char *)sub_100198924((uint64_t)kCFAllocatorDefault, &v96);
    [v40 setAccountKey:v97];
    [v40 setPreviousAccountKey:v96];
    CFTypeRef v43 = v97;
    if (v97)
    {
      v97 = 0LL;
      CFRelease(v43);
    }

    v44 = v96;
    if (v96)
    {
      v96 = 0LL;
      CFRelease(v44);
    }

    v95 = 0LL;
    *a3 = (const char *)der_decode_data_or_null(kCFAllocatorDefault, &v95);
    id v45 = v95;
    [v40 setAccountKeyDerivationParameters:v95];

    id v46 = (const char *)sub_1000126F8( kCFAllocatorDefault,  (CFMutableDictionaryRef *)v100,  &v85,  (uint64_t)*a3,  (uint64_t)v35);
    *a3 = v46;
    if (v46 == v35)
    {
      CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
      context[0] = _NSConcreteStackBlock;
      context[1] = (CFTypeRef)3221225472LL;
      context[2] = sub_10019D350;
      context[3] = &unk_100293110;
      context[4] = Mutable;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)v100, (CFDictionaryApplierFunction)sub_10019D3D4, context);
      [v41 setRetirees:Mutable];
      if (Mutable) {
        CFRelease(Mutable);
      }
      uint64_t v47 = *(const __CFArray **)buf;
      if (*(void *)buf)
      {
        if (*a3)
        {
          cf[0] = _NSConcreteStackBlock;
          cf[1] = (CFTypeRef)3221225472LL;
          cf[2] = sub_10019D3EC;
          cf[3] = &unk_100293E20;
          v92 = &v85;
          uint64_t v93 = v36;
          id v91 = v41;
          v102.length = CFArrayGetCount(v47);
          v102.id location = 0LL;
          CFArrayApplyFunction(v47, v102, (CFArrayApplierFunction)sub_10019D568, cf);
          *(void *)uint64_t buf = 0LL;
          CFRelease(v47);
          if ([v40 ensureFactoryCircles])
          {
            id v65 = v40;
          }

          else
          {
            SOSCreateError(1035LL, @"Cannot EnsureFactoryCircles", v85, &v85);
            id v65 = 0LL;
          }

          uint64_t v47 = (const __CFArray *)v65;
        }

        else
        {
          uint64_t v47 = 0LL;
        }
      }
    }

    else
    {
      uint64_t v47 = 0LL;
      *a3 = 0LL;
    }

    if (!v47)
    {
LABEL_95:
      if (a6) {
        goto LABEL_96;
      }
      goto LABEL_30;
    }

    goto LABEL_92;
  }

  if (v89 != 7)
  {
    if (v89 == 8)
    {
      id v11 = v88;
      cf[0] = 0LL;
      id v12 = (const char *)sub_1000126F8( kCFAllocatorDefault,  (CFMutableDictionaryRef *)cf,  &v85,  (uint64_t)v10,  (uint64_t)v88);
      *a3 = v12;
      CFTypeRef v13 = cf[0];
      if (v12)
      {
        uint64_t v14 = sub_100190D30((uint64_t)cf[0], (uint64_t)a5);
        CFStringRef v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v13) {
          CFRelease(v13);
        }
        CFMutableSetRef v16 = (void *)objc_claimAutoreleasedReturnValue([v15 trust]);
        int v17 = (const void *)SOSCircleCreateFromDER(kCFAllocatorDefault, &v85, a3, v11);
        [v16 setTrustedCircle:v17];
        if (v17) {
          CFRelease(v17);
        }
        cf[0] = 0LL;
        *a3 = (const char *)sub_100198794(cf, (uint64_t)&v85, (uint64_t)*a3, (uint64_t)v11);
        [v16 setFullPeerInfo:cf[0]];
        CFTypeRef v18 = cf[0];
        if (cf[0])
        {
          cf[0] = 0LL;
          CFRelease(v18);
        }

        cf[0] = (CFTypeRef)5;
        *a3 = (const char *)ccder_decode_uint64(cf, *a3, v11);
        [v16 setDepartureCode:LODWORD(cf[0])];
        LOBYTE(v99) = -86;
        *a3 = (const char *)sub_100018C70((BOOL *)&v99, (uint64_t)*a3, (uint64_t)v11);
        [v15 setAccountKeyIsTrusted:v99];
        context[0] = 0LL;
        *a3 = (const char *)sub_100198924((uint64_t)kCFAllocatorDefault, context);
        [v15 setAccountKey:context[0]];
        CFTypeRef v19 = context[0];
        if (context[0])
        {
          context[0] = 0LL;
          CFRelease(v19);
        }

        context[0] = 0LL;
        *a3 = (const char *)sub_100198924((uint64_t)kCFAllocatorDefault, context);
        [v15 setPreviousAccountKey:context[0]];
        CFTypeRef v20 = context[0];
        if (context[0])
        {
          context[0] = 0LL;
          CFRelease(v20);
        }

        context[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        *a3 = (const char *)der_decode_data_or_null(kCFAllocatorDefault, context);
        int v21 = (void *)context[0];
        [v15 setAccountKeyDerivationParameters:context[0]];

        id v22 = (const void *)SOSPeerInfoSetCreateFromArrayDER(kCFAllocatorDefault, &kSOSPeerSetCallbacks, &v85, a3, v11);
        [v16 setRetirees:v22];
        if (v22) {
          CFRelease(v22);
        }
        context[0] = 0LL;
        id v23 = *a3;
        CFTypeRef v24 = sub_10001A6E4(kCFAllocatorDefault, (CFDataRef *)context, 0LL, (uint64_t)*a3, (uint64_t)v11);
        if (v24) {
          uint64_t v25 = (const char *)v24;
        }
        else {
          uint64_t v25 = v23;
        }
        *a3 = v25;
        if (v25 != v11)
        {
          *(void *)uint64_t buf = 0LL;
          id v26 = (const char *)sub_1000126F8( kCFAllocatorDefault,  (CFMutableDictionaryRef *)buf,  &v85,  (uint64_t)v25,  (uint64_t)v11);
          *a3 = v26;
          if (!v26)
          {
            v66 = sub_10001267C("persistence");
            v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v100 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Error Processing expansion dictionary der - dropping account object",  v100,  2u);
            }

            CFTypeRef v68 = context[0];
            if (context[0])
            {
              context[0] = 0LL;
              CFRelease(v68);
            }

            if (*(void *)buf) {
              CFRelease(*(CFTypeRef *)buf);
            }
            goto LABEL_89;
          }

          uint64_t v27 = *(const __CFArray **)buf;
          if (*(void *)buf)
          {
            [v16 setExpansion:*(void *)buf];
            CFRelease(v27);
          }
        }

        CFTypeRef v28 = context[0];
        BOOL v29 = sub_10001267C("backupKey");
        CFStringRef v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v31)
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Setting backup key from metadata",  buf,  2u);
          }

          uint64_t v32 = -[NSData initWithData:](objc_alloc(&OBJC_CLASS___NSData), "initWithData:", v28);
          objc_msgSend(v15, "setBackup_key:", v32);

          CFRelease(v28);
        }

        else
        {
          if (v31)
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Failed to set backup key from metadata - no key found",  buf,  2u);
          }
        }

        if (*a3 && *a3 == v11)
        {
          uint64_t v47 = v15;
LABEL_90:

          goto LABEL_91;
        }

        SOSCreateError(1035LL, @"Didn't consume all bytes v7", v85, &v85);
LABEL_89:
        uint64_t v47 = 0LL;
        goto LABEL_90;
      }

      if (!cf[0]) {
        goto LABEL_95;
      }
      CFRelease(cf[0]);
      if (!a6) {
        goto LABEL_30;
      }
    }

    else
    {
      SOSCreateErrorWithFormat(1035LL, 0LL, &v85, 0LL, @"Unsupported version (%llu)");
      if (!a6) {
        goto LABEL_30;
      }
    }

+ (id)accountFromData:(id)a3 factory:(SOSDataSourceFactory *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (char *)[v8 length];
  id v10 = v8;
  id v11 = [v10 bytes];

  id v13 = v11;
  return (id)objc_claimAutoreleasedReturnValue( [a1 accountFromDER:&v13 end:&v9[(void)v11] factory:a4 error:a5]);
}

- (void)performTransaction_Locked:(id)a3
{
}

- (void)performTransaction_Locked:(BOOL)a3 action:(id)a4
{
  BOOL v4 = a3;
  id v8 = (void (**)(id, SOSAccountTransaction *))a4;
  id v6 = objc_autoreleasePoolPush();
  id v7 = -[SOSAccountTransaction initWithAccount:quiet:]( objc_alloc(&OBJC_CLASS___SOSAccountTransaction),  "initWithAccount:quiet:",  self,  v4);
  v8[2](v8, v7);
  -[SOSAccountTransaction finish](v7, "finish");

  objc_autoreleasePoolPop(v6);
}

- (void)performTransaction:(id)a3
{
}

- (void)performTransaction:(BOOL)a3 action:(id)a4
{
  id v6 = a4;
  off_1002DE660();
  id v10 = v7;
  if (*v8)
  {
    -[SOSAccount performTransaction_Locked:action:](self, "performTransaction_Locked:action:", 1LL, v7, v7);
  }

  else
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019FE20;
    block[3] = &unk_100292118;
    void block[4] = self;
    BOOL v13 = a3;
    id v12 = v10;
    dispatch_sync(v9, block);
  }
}

+ (void)performOnQuietAccountQueue:(id)a3
{
  int v3 = (void (**)(void))a3;
  id v5 = sub_1001C2128(1LL, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10019FF98;
    v9[3] = &unk_100293978;
    id v10 = v3;
    [v6 performTransaction:1 action:v9];
  }

  else
  {
    id v7 = sub_10001267C("acct-txn");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 67109120;
      uid_t v12 = getuid();
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "UID: %d - No account; running block on local thread",
        buf,
        8u);
    }

    v3[2](v3);
  }
}

@end