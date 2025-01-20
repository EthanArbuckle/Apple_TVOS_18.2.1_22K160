@interface SDAutoUnlockAKSManager
+ (BOOL)useKeychainForLTKSyncing;
+ (id)sharedManager;
- (BOOL)autoUnlockDisabledDueToManagement;
- (BOOL)cachedEscrowSecretExistsForDeviceID:(id)a3;
- (BOOL)cachedEscrowSecretIsValidForDeviceID:(id)a3;
- (BOOL)canCreateTokenSessionForDeviceID:(id)a3;
- (BOOL)deviceEnabledAsKey:(id)a3;
- (BOOL)deviceEnabledAsKeyForAnyDevice;
- (BOOL)deviceEnabledAsKeyForAnyIDSDevice;
- (BOOL)deviceEnabledAsKeyForAnyIDSMac;
- (BOOL)deviceEnabledAsKeyForAnyMac;
- (BOOL)deviceEnabledAsKeyForIDSDeviceID:(id)a3;
- (BOOL)deviceIsLocalDevice:(id)a3;
- (BOOL)disablePairingWithKeyDevice:(id)a3;
- (BOOL)encryptMessageData:(id)a3 deviceID:(id)a4 encryptedMessage:(id *)a5 authTag:(id *)a6 nonce:(id *)a7;
- (BOOL)escrowSecretExistsForDevice:(id)a3;
- (BOOL)hashMatchesAnyRemoteLTKForDeviceID:(id)a3 ltkHash:(id)a4 isPreferred:(BOOL *)a5;
- (BOOL)isMobileActivationErrorNetworkError:(id)a3;
- (BOOL)loadLocalAttestedLTKIfNecessary;
- (BOOL)loadLocalLTK;
- (BOOL)localDeviceEnabledAsKey;
- (BOOL)localDeviceEnabledAsKeyForMac;
- (BOOL)ltkExistsForKeyDevice:(id)a3;
- (BOOL)ltkExistsForKeyDevice:(id)a3 updateLTKs:(BOOL)a4;
- (BOOL)sessionKeyExistsForDeviceID:(id)a3;
- (BOOL)signLTK:(id)a3 ltkModDate:(id)a4 modernLTK:(id)a5 modernLTKModDate:(id)a6 deviceID:(id)a7;
- (BOOL)signLTK:(id)a3 modernLTK:(id)a4 forDeviceID:(id)a5;
- (BOOL)signLTKsForDeviceID:(id)a3;
- (BOOL)storeAttestedLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5;
- (BOOL)storeEscrowSecret:(id)a3 pairingID:(id)a4 deviceID:(id)a5 requiresUnlock:(BOOL)a6;
- (BOOL)storeKeychainItemWithAttributeDictionary:(id)a3 updateDictionary:(id)a4 addDictionary:(id)a5;
- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5;
- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5 modern:(BOOL)a6;
- (BOOL)storeRangingKey:(id)a3 forDeviceID:(id)a4;
- (BOOL)t208Machine;
- (BOOL)viewSyncing;
- (BOOL)wristDetectDisabled;
- (NSData)localAttestedLTK;
- (NSData)localLTK;
- (NSMutableArray)watchIDsMissingSessionKey;
- (NSMutableDictionary)activeAKSSessions;
- (NSMutableDictionary)cachedSessionKeys;
- (NSMutableDictionary)cachedSessions;
- (NSMutableDictionary)escrowSecretForDeviceID;
- (NSMutableDictionary)preferredRemoteLTKForDeviceID;
- (NSMutableDictionary)remoteLTKs;
- (NSMutableDictionary)watchIDsToPairingRecords;
- (NSString)altDSID;
- (NSString)companionIDStorageFilePath;
- (NSString)localDeviceID;
- (NSString)remoteLTKStorageFilePath;
- (NSString)state;
- (NSString)watchIDToCompanionIDStorageFilePath;
- (NSString)watchIDsToPairingRecordsStorageFilePath;
- (OS_dispatch_source)keybagAssertionTimer;
- (SDAutoUnlockAKSManager)init;
- (id)aksAuthSessionForDeviceID:(id)a3 attestation:(BOOL)a4 sessionType:(int64_t)a5 escrowSecret:(id)a6;
- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4;
- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4 usingEscrow:(BOOL)a5 attestation:(BOOL)a6 sessionType:(int64_t)a7;
- (id)aksAuthorizationSessionForDeviceID:(id)a3 attestation:(BOOL)a4 originator:(BOOL)a5 externalACMContext:(id)a6 sessionType:(int64_t)a7;
- (id)aksAuthorizationSessionForDeviceID:(id)a3 originator:(BOOL)a4 sessionType:(int64_t)a5;
- (id)aksPairingSessionForDeviceID:(id)a3 originator:(BOOL)a4 errorCode:(int64_t *)a5 requiresAttestation:(BOOL)a6 requiresEscrow:(BOOL)a7;
- (id)aksRegistrationSessionForDeviceID:(id)a3 originator:(BOOL)a4;
- (id)allKeychainDevices;
- (id)allPairedWatchDeviceIDs;
- (id)allRemoteLTKData;
- (id)anyLongTermKeyForDeviceID:(id)a3;
- (id)attestedDictionaryForDevice:(id)a3;
- (id)autoUnlockFolderPath;
- (id)baseDictionary;
- (id)baseLocalKeysDictionary;
- (id)baseLocalKeysDictionaryForDevice:(id)a3 type:(id)a4;
- (id)baseModernSyncedDictionary;
- (id)baseRangingDictionary;
- (id)baseRangingDictionaryForDevice:(id)a3;
- (id)baseSyncedDictionary;
- (id)companionIDForWatchID:(id)a3;
- (id)decryptMessage:(id)a3 authTag:(id)a4 nonce:(id)a5 bluetoothID:(id)a6 cachedDevices:(BOOL)a7 errorCode:(int64_t *)a8;
- (id)deriveKeyFromSharedSecret:(id)a3;
- (id)deviceIDsMissingSessionKey;
- (id)escrowSecretCreationDateForDeviceID:(id)a3;
- (id)escrowSecretForDevice:(id)a3;
- (id)keyPairingIDForDeviceID:(id)a3;
- (id)keybagAssertion;
- (id)keychainDataForQuery:(id)a3;
- (id)keychainDevices:(BOOL)a3;
- (id)loadCompanionIDs;
- (id)loadLegacyWatchIDToCompanionIDMapping;
- (id)longTermKeyForDevice:(id)a3 modern:(BOOL)a4;
- (id)longTermKeyIDForDeviceID:(id)a3;
- (id)ltkHashForLocalLTK;
- (id)ltkInfoForDeviceID:(id)a3;
- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4 attested:(BOOL)a5;
- (id)ltksForRequest:(id)a3;
- (id)migrateLegacyCompanionIDs:(id)a3;
- (id)modernSignedDevices;
- (id)modernSyncedDictionaryForDevice:(id)a3;
- (id)modificationDataForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)pairingIDForWatchID:(id)a3;
- (id)rangingKeyForDeviceID:(id)a3;
- (id)remoteLTKEntryForDeviceID:(id)a3;
- (id)remoteLTKForDeviceID:(id)a3;
- (id)remoteLTKHashForDeviceID:(id)a3 modern:(BOOL)a4;
- (id)remoteLTKList;
- (id)sessionKeyForDeviceID:(id)a3;
- (id)signedDevices;
- (id)syncedDictionaryForDevice:(id)a3;
- (int)ltkSyncStatusForDeviceID:(id)a3 hash:(id)a4 modern:(BOOL)a5;
- (int64_t)keyClassForDeviceID:(id)a3;
- (int64_t)ltkKeyClassWithAttestation:(BOOL)a3;
- (os_unfair_lock_s)cachedSessionKeysLock;
- (void)addDeviceIDMissingSessionKey:(id)a3;
- (void)addObservers;
- (void)addRemoteLTK:(id)a3 ltkHash:(id)a4 ltkModDate:(id)a5 modernLTK:(id)a6 modernLTKHash:(id)a7 modernLTKModeDate:(id)a8 deviceID:(id)a9;
- (void)appleAccountSignedIn:(id)a3;
- (void)appleAccountSignedOut:(id)a3;
- (void)checkLocalLTK;
- (void)checkPhoneRemoteLTKs;
- (void)checkRemoteLTKForDeviceID:(id)a3;
- (void)clearAllDeviceIDsMissingSessionKeys;
- (void)clearRemoteLTKs;
- (void)consoleUserChanged:(id)a3;
- (void)deleteAllEscrowSecrets;
- (void)deleteAllRangingKeys;
- (void)deleteEscrowSecretForAllDevices;
- (void)deleteEscrowSecretForDeviceID:(id)a3;
- (void)deleteEscrowSecretForPhones;
- (void)deleteLegacyCompanionIDs;
- (void)deleteLegacyWatchToCompanionIDs;
- (void)deleteLocalAttestedLTK;
- (void)deleteRangingKeyForDeviceID:(id)a3;
- (void)deleteRemoteLongTermKeyForDeviceID:(id)a3 modern:(BOOL)a4 tombstone:(BOOL)a5;
- (void)disablePairingForAllKeyDevices;
- (void)disablePairingForAllLockPhones;
- (void)fetchLTKsFromCompanion:(BOOL)a3;
- (void)generateLocalAttestedLTKIfNeccessaryWithCompletion:(id)a3;
- (void)generateLocalLTKWithAttestation:(BOOL)a3;
- (void)generateLocalLTKWithAttestation:(BOOL)a3 forceDCRTRetrievalWithCompletion:(id)a4;
- (void)handleManagementChanged:(id)a3;
- (void)loadLocalUniqueIDIfNeeded;
- (void)loadRemoteLTKs;
- (void)loadRemoteLTKsIfNeeded;
- (void)migrateLegacyWatchIDToCompanionIDs;
- (void)releaseKeybagAssertion;
- (void)reloadPairingRecordsIfNeeded;
- (void)removeAllRemoteLTKsOnSignOut;
- (void)removeCompanionIDForWatchID:(id)a3;
- (void)removeDeviceIDMissingSessionKey:(id)a3;
- (void)removePairingIDForWatchID:(id)a3;
- (void)removePairingRecordForWatchID:(id)a3;
- (void)removeRemoteLTKForDeviceID:(id)a3;
- (void)restartKeybagAssertionTimer;
- (void)saveRemoteLTKs;
- (void)saveWatchIDsToPairingRecords;
- (void)screenLockUnlocked:(id)a3;
- (void)setActiveAKSSessions:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAutoUnlockDisabledDueToManagement:(BOOL)a3;
- (void)setCachedSessionKeys:(id)a3;
- (void)setCachedSessions:(id)a3;
- (void)setCompanionID:(id)a3 forWatchID:(id)a4;
- (void)setCompanionIDStorageFilePath:(id)a3;
- (void)setEscrowSecretForDeviceID:(id)a3;
- (void)setKeybagAssertion:(id)a3;
- (void)setKeybagAssertionTimer:(id)a3;
- (void)setLocalAttestedLTK:(id)a3;
- (void)setLocalDeviceID:(id)a3;
- (void)setLocalLTK:(id)a3;
- (void)setPairingID:(id)a3 forWatchID:(id)a4;
- (void)setPreferredRemoteLTKForDeviceID:(id)a3;
- (void)setRemoteLTKStorageFilePath:(id)a3;
- (void)setRemoteLTKs:(id)a3;
- (void)setState:(id)a3;
- (void)setT208Machine:(BOOL)a3;
- (void)setWatchIDToCompanionIDStorageFilePath:(id)a3;
- (void)setWatchIDsMissingSessionKey:(id)a3;
- (void)setWatchIDsToPairingRecords:(id)a3;
- (void)setWatchIDsToPairingRecordsStorageFilePath:(id)a3;
- (void)setWristDetectDisabled:(BOOL)a3;
- (void)signAndStoreRemoteLTK:(id)a3 forDeviceID:(id)a4;
- (void)start;
- (void)takeMobileKeybagAssertion;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateDynamicStoreEnabled;
- (void)updateLTKs;
- (void)updateLTKsForDeviceID:(id)a3 staleRemoteLTK:(BOOL)a4;
- (void)updateLocalLTK;
- (void)updateLocalLTKForSignout;
- (void)updatePreferredRemoteLTKForDeviceID:(id)a3;
- (void)updateRangingKeysIfNeccesary;
- (void)updateRemoteLTKs;
- (void)updateSessionKeys;
@end

@implementation SDAutoUnlockAKSManager

+ (id)sharedManager
{
  if (qword_100657010 != -1) {
    dispatch_once(&qword_100657010, &stru_1005CD5F8);
  }
  return (id)qword_100657008;
}

- (SDAutoUnlockAKSManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAKSManager;
  v2 = -[SDAutoUnlockAKSManager init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    v2->_cachedSessionKeysLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = IDSCopyLocalDeviceUniqueID();
    localDeviceID = v3->_localDeviceID;
    v3->_localDeviceID = (NSString *)v4;

    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    cachedSessions = v3->_cachedSessions;
    v3->_cachedSessions = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    preferredRemoteLTKForDeviceID = v3->_preferredRemoteLTKForDeviceID;
    v3->_preferredRemoteLTKForDeviceID = v8;

    v3->_t208Machine = variable initialization expression of SDAirDropHashStoreCDB.destroyed();
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    activeAKSSessions = v3->_activeAKSSessions;
    v3->_activeAKSSessions = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v12 addClient:v3 forIdentifer:@"A70C5EAF-F24F-48A7-B834-F5297000C7A2"];

    uint64_t v13 = auto_unlock_log(-[SDAutoUnlockAKSManager addObservers](v3, "addObservers"));
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v3->_localDeviceID;
      *(_DWORD *)buf = 138412290;
      v23 = (const __CFString *)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Local Unique ID:%@", buf, 0xCu);
    }

    uint64_t v17 = auto_unlock_log(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = @"YES";
      if (!v3->_t208Machine) {
        v19 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Touch Bar:%@", buf, 0xCu);
    }
  }

  return v3;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    -[SDAutoUnlockAKSManager loadWatchIDsToPairingRecords](self, "loadWatchIDsToPairingRecords");
    -[SDAutoUnlockAKSManager updateLTKs](self, "updateLTKs");
    -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 myAltDSID]);
    -[SDAutoUnlockAKSManager setAltDSID:](self, "setAltDSID:", v6);

    uint64_t v8 = auto_unlock_log(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager altDSID](self, "altDSID"));
      v11 = @"YES";
      if (!v10) {
        v11 = @"NO";
      }
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DSID: %@", (uint8_t *)&v12, 0xCu);
    }

    if (sub_10008AF18())
    {
      -[SDAutoUnlockAKSManager setAutoUnlockDisabledDueToManagement:]( self,  "setAutoUnlockDisabledDueToManagement:",  1LL);
      -[SDAutoUnlockAKSManager handleRequiredStateDisabled](self, "handleRequiredStateDisabled");
    }

    -[SDAutoUnlockAKSManager updateRangingKeysIfNeccesary](self, "updateRangingKeysIfNeccesary");
  }

- (void)updateLTKs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    unsigned int v5 = -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
    unsigned int v6 = -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
    -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
    if (v5) {
      -[SDAutoUnlockAKSManager checkLocalLTK](self, "checkLocalLTK");
    }
    if (v6) {
      -[SDAutoUnlockAKSManager checkLocalAttestedLTK](self, "checkLocalAttestedLTK");
    }
  }

- (void)updateLocalLTK
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceSupportsRanging];

  if (v4)
  {
    -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
    -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
  }

  else
  {
    uint64_t v6 = auto_unlock_log(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device does not support ranging, not loading localLTKs",  v8,  2u);
    }
  }

- (NSString)state
{
  id v106 = 0LL;
  v3 = (objc_class *)objc_opt_class(self, a2);
  unsigned int v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v106, "%@\n", v5);
  id v6 = v106;

  id v105 = v6;
  NSAppendPrintF(&v105, "-------------\n");
  id v7 = v105;

  id v104 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  NSAppendPrintF(&v104, "Local Unique ID: %@\n", v8);
  id v9 = v104;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  v77 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:](self, "ltkInfoForDeviceID:", v10));

  int v12 = 0LL;
  if ([v11 hasLtkID])
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v14 = objc_claimAutoreleasedReturnValue([v11 ltkID]);
    int v12 = -[NSUUID initWithUUIDBytes:](v13, "initWithUUIDBytes:", [v14 bytes]);
  }

  id v103 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](v77, "localLTK"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
  NSAppendPrintF(&v103, "Local LTK: %@\n", v16);
  id v17 = v103;

  id v102 = v17;
  v75 = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v12, "UUIDString"));
  NSAppendPrintF(&v102, "Local LTK UUID: %@\n", v18);
  id v19 = v102;

  id v101 = v19;
  v20 = sub_100011CF8();
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
  NSAppendPrintF(&v101, "Keychain UUID: %@\n", v22);
  id v23 = v101;

  id v100 = v23;
  v76 = v11;
  NSAppendPrintF(&v100, "Local LTK Info: %@\n", v11);
  id v24 = v100;

  id v99 = v24;
  NSAppendPrintF(&v99, "\n");
  id v25 = v99;

  id v98 = v25;
  if (-[SDAutoUnlockAKSManager viewSyncing](v77, "viewSyncing")) {
    v26 = @"YES";
  }
  else {
    v26 = @"NO";
  }
  NSAppendPrintF(&v98, "View Syncing: %@\n", v26);
  id v27 = v98;

  id v97 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  else {
    v29 = @"NO";
  }
  NSAppendPrintF(&v97, "Device First Unlocked: %@\n", v29);
  id v30 = v97;

  id v96 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allKeychainDevices](v77, "allKeychainDevices"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 allObjects]);
  uint64_t v33 = SFCompactStringFromCollection(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  NSAppendPrintF(&v96, "Keychain Devices: %@\n", v34);
  id v35 = v96;

  id v95 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](v77, "remoteLTKStorageFilePath"));
  NSAppendPrintF(&v95, "Remote LTK File Path: %@\n", v36);
  id v37 = v95;

  id v94 = v37;
  NSAppendPrintF(&v94, "Remote LTKs\n");
  id v38 = v94;

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](v77, "remoteLTKList"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v79 allKeys]);
  id v39 = [obj countByEnumeratingWithState:&v90 objects:v108 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v91;
    do
    {
      v42 = 0LL;
      v43 = v38;
      do
      {
        if (*(void *)v91 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v90 + 1) + 8LL * (void)v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKeyedSubscript:v44]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"LTK Data"]);
        if (!v46) {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"Attested LTK Data"]);
        }
        id v89 = v43;
        v47 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"LTK ID"]);
        uint64_t v48 = sub_10001204C(v46);
        v49 = sub_1000124BC(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v46 description]);
        NSAppendPrintF( &v89,  "Device ID: %@, Remote LTK ID: %@, ASK Peer State: %@, Remote LTK: %@\n",  v44,  v47,  v50,  v51);
        id v38 = v89;

        v42 = (char *)v42 + 1;
        v43 = v38;
      }

      while (v40 != v42);
      id v40 = [obj countByEnumeratingWithState:&v90 objects:v108 count:16];
    }

    while (v40);
  }

  id v88 = v38;
  NSAppendPrintF(&v88, "\n");
  id v52 = v88;

  v53 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v54 devicesWithLTKs]);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v55 allObjects]);

  id v57 = [v56 countByEnumeratingWithState:&v84 objects:v107 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v85;
    v60 = v77;
    do
    {
      for (i = 0LL; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v85 != v59) {
          objc_enumerationMutation(v56);
        }
        v62 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](v60, "localDeviceID"));
        v64 = v60;
        unsigned __int8 v65 = [v62 isEqualToString:v63];

        if ((v65 & 1) != 0)
        {
          v60 = v64;
        }

        else
        {
          v60 = v64;
          if (-[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](v64, "escrowSecretExistsForDevice:", v62))
          {
            -[NSMutableArray addObject:](v53, "addObject:", v62);
            id v83 = v52;
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](v64, "rangingKeyForDeviceID:", v62));
            v67 = (void *)objc_claimAutoreleasedReturnValue([v66 description]);
            NSAppendPrintF(&v83, "Ranging Key: %@ : %@\n", v62, v67);
            id v68 = v83;

            v60 = v77;
            id v82 = v68;
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keyPairingIDForDeviceID:](v77, "keyPairingIDForDeviceID:", v62));
            NSAppendPrintF(&v82, "Pairing ID: %@ : %@\n", v62, v69);
            id v52 = v82;
          }
        }
      }

      id v58 = [v56 countByEnumeratingWithState:&v84 objects:v107 count:16];
    }

    while (v58);
  }

  id v81 = v52;
  uint64_t v70 = SFCompactStringFromCollection(v53);
  v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
  NSAppendPrintF(&v81, "Escrow Exists: %@\n", v71);
  id v72 = v81;

  id v80 = v72;
  NSAppendPrintF(&v80, "\n");
  id v73 = v80;

  return (NSString *)v73;
}

- (BOOL)viewSyncing
{
  return 0;
}

- (void)loadLocalUniqueIDIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

  if (!v3)
  {
    unsigned int v4 = (void *)IDSCopyLocalDeviceUniqueID();
    -[SDAutoUnlockAKSManager setLocalDeviceID:](self, "setLocalDeviceID:", v4);

    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Reloading local unique ID: %@",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)addObservers
{
  uint64_t v3 = auto_unlock_log(self);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000BA540();
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"appleAccountSignedIn:" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"appleAccountSignedOut:" name:@"com.apple.sharingd.AppleAccountSignOut" object:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"deviceFirstUnlocked:" name:@"com.apple.sharingd.KeyBagFirstUnlock" object:0];
}

- (void)handleManagementChanged:(id)a3
{
  uint64_t v3 = SFMainQueue(self, a2);
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, &stru_1005CD618);
}

- (void)appleAccountSignedIn:(id)a3
{
  uint64_t v3 = sharing_persistent_log(self, a2, a3);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign in", v5, 2u);
  }
}

- (void)appleAccountSignedOut:(id)a3
{
  uint64_t v4 = auto_unlock_log(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AKS received Apple Account sign out", v7, 2u);
  }

  -[SDAutoUnlockAKSManager removeAllRemoteLTKsOnSignOut](self, "removeAllRemoteLTKsOnSignOut");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v6 resetAppleWatchExisted];
}

- (void)screenLockUnlocked:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor", a3));
  if ([v4 deviceSupportsRanging])
  {
    -[SDAutoUnlockAKSManager loadLocalUniqueIDIfNeeded](self, "loadLocalUniqueIDIfNeeded");
    -[SDAutoUnlockAKSManager loadLocalLTK](self, "loadLocalLTK");
    -[SDAutoUnlockAKSManager loadLocalAttestedLTKIfNecessary](self, "loadLocalAttestedLTKIfNecessary");
    -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
    -[SDAutoUnlockAKSManager checkLocalLTK](self, "checkLocalLTK");
    -[SDAutoUnlockAKSManager checkLocalAttestedLTK](self, "checkLocalAttestedLTK");
    -[SDAutoUnlockAKSManager checkRemoteLTKs](self, "checkRemoteLTKs");
    -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
  }
}

- (void)consoleUserChanged:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor", a3));
  unsigned int v4 = [v3 currentConsoleUser];

  if (v4)
  {
    uint64_t v6 = auto_unlock_log(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = getuid();
      __int16 v10 = 1024;
      pid_t v11 = getpid();
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current console user changed (uid: %d, pid: %d)",  (uint8_t *)v9,  0xEu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    [v8 updateDynamicStoreEnabled];
  }

- (id)aksPairingSessionForDeviceID:(id)a3 originator:(BOOL)a4 errorCode:(int64_t *)a5 requiresAttestation:(BOOL)a6 requiresEscrow:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v11 = a3;
  if (v7)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    -[SDAutoUnlockAKSManager checkRemoteLTKForDeviceID:](self, "checkRemoteLTKForDeviceID:", v11);
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v11));
  id v14 = (void *)v13;
  if (v13 && v12)
  {
    if (v7) {
      uint64_t v15 = 4LL;
    }
    else {
      uint64_t v15 = 1LL;
    }
    uint64_t v16 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession),  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:",  v12,  v13,  v15,  v9,  v11);
  }

  else
  {
    uint64_t v17 = auto_unlock_log(v13);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
      id v23 = @"NO";
      *(_DWORD *)id v27 = 138413827;
      *(void *)&v27[4] = v11;
      *(_WORD *)&v27[12] = 2112;
      if (v22) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      *(void *)&v27[14] = v24;
      if (v7) {
        id v25 = @"YES";
      }
      else {
        id v25 = @"NO";
      }
      *(_WORD *)&v27[22] = 2112;
      if (v12) {
        v26 = @"YES";
      }
      else {
        v26 = @"NO";
      }
      v28 = v25;
      if (v14) {
        id v23 = @"YES";
      }
      __int16 v29 = 2112;
      id v30 = v26;
      __int16 v31 = 2113;
      v32 = v12;
      __int16 v33 = 2112;
      v34 = v23;
      __int16 v35 = 2113;
      v36 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "AKS session missing keys (device: %@, syncing %@, attestation: %@, local exists %@, local LTK: %{private}@, remo te exists %@, remote LTK: %{private}@)",  v27,  0x48u);
    }

    uint64_t v16 = 0LL;
    if (a5)
    {
      if (v14)
      {
        if (v12) {
          int64_t v19 = 101LL;
        }
        else {
          int64_t v19 = 149LL;
        }
      }

      else
      {
        int64_t v19 = 148LL;
      }

      *a5 = v19;
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager activeAKSSessions]( self,  "activeAKSSessions",  *(_OWORD *)v27,  *(void *)&v27[16],  v28));
  [v20 setObject:v16 forKeyedSubscript:v11];

  return v16;
}

- (id)aksRegistrationSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));
  BOOL v9 = (void *)v8;
  if (v8 && v7)
  {
    __int16 v10 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession),  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:",  v7,  v8,  5LL,  v4,  v6);
  }

  else
  {
    uint64_t v11 = auto_unlock_log(v8);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = @"NO";
      *(_DWORD *)uint64_t v17 = 138413315;
      *(void *)&v17[4] = v6;
      if (v7) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      *(void *)&v17[14] = v16;
      *(_WORD *)&v17[12] = 2112;
      if (v9) {
        uint64_t v15 = @"YES";
      }
      *(_WORD *)&v17[22] = 2113;
      v18 = v7;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2113;
      unsigned int v22 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "AKS session missing keys (device: %@, local exists %@, local LTK: %{private}@, remote exists %@, remote LTK: %{private}@)",  v17,  0x34u);
    }

    __int16 v10 = 0LL;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager activeAKSSessions]( self,  "activeAKSSessions",  *(_OWORD *)v17,  *(void *)&v17[16]));
  [v13 setObject:v10 forKeyedSubscript:v6];

  return v10;
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4
{
  return -[SDAutoUnlockAKSManager aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:]( self,  "aksAuthSessionForDeviceID:originator:usingEscrow:attestation:sessionType:",  a3,  a4,  0LL,  0LL,  2LL);
}

- (id)aksAuthSessionForDeviceID:(id)a3 originator:(BOOL)a4 usingEscrow:(BOOL)a5 attestation:(BOOL)a6 sessionType:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  int v12 = (__CFString *)a3;
  if (v8) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  }
  id v14 = (void *)v13;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v12));
  uint64_t v16 = (void *)v15;
  if (v15 && v14)
  {
    if (v10)
    {
      if (v9)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDevice:](self, "escrowSecretForDevice:", v12));
        uint64_t v18 = auto_unlock_log(v17);
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = @"YES";
          if (!v17) {
            v20 = @"NO";
          }
          int v45 = 138412546;
          v46 = v20;
          __int16 v47 = 2112;
          uint64_t v48 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Escrow secret (exists: %@, device ID: %@)",  (uint8_t *)&v45,  0x16u);
        }

        uint64_t v22 = auto_unlock_log(v21);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1000BA598();
        }

        if (v17)
        {
          id v25 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession),  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:",  v14,  v16,  a7,  1LL,  v12,  v17);
        }

        else
        {
          uint64_t v35 = auto_unlock_log(v24);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1000BA56C();
          }

          id v25 = 0LL;
        }

        goto LABEL_25;
      }

      v28 = objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession);
      __int16 v29 = v14;
      id v30 = v16;
      int64_t v31 = a7;
      uint64_t v32 = 1LL;
      __int16 v33 = v12;
      BOOL v34 = 0LL;
    }

    else
    {
      v28 = objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession);
      __int16 v29 = v14;
      id v30 = v16;
      int64_t v31 = a7;
      uint64_t v32 = 0LL;
      __int16 v33 = v12;
      BOOL v34 = v9;
    }

    id v25 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:usingEscrow:]( v28,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:usingEscrow:",  v29,  v30,  v31,  v32,  v33,  v34);
    goto LABEL_25;
  }

  uint64_t v26 = auto_unlock_log(v15);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    unsigned int v38 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
    id v39 = @"NO";
    int v45 = 138414339;
    v46 = v12;
    __int16 v47 = 2112;
    if (v38) {
      id v40 = @"YES";
    }
    else {
      id v40 = @"NO";
    }
    uint64_t v48 = v40;
    if (v14) {
      uint64_t v41 = @"YES";
    }
    else {
      uint64_t v41 = @"NO";
    }
    __int16 v49 = 2112;
    if (v16) {
      v42 = @"YES";
    }
    else {
      v42 = @"NO";
    }
    v50 = v41;
    __int16 v51 = 2113;
    if (v10) {
      v43 = @"YES";
    }
    else {
      v43 = @"NO";
    }
    id v52 = v14;
    if (v9) {
      uint64_t v44 = @"YES";
    }
    else {
      uint64_t v44 = @"NO";
    }
    __int16 v53 = 2112;
    if (v8) {
      id v39 = @"YES";
    }
    v54 = v42;
    __int16 v55 = 2113;
    v56 = v16;
    __int16 v57 = 2112;
    id v58 = v43;
    __int16 v59 = 2112;
    v60 = v44;
    __int16 v61 = 2112;
    v62 = v39;
    _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, remot e LTK: %{private}@, originator: %@, escrow: %@, attested: %@)",  (uint8_t *)&v45,  0x5Cu);
  }

  id v25 = 0LL;
LABEL_25:

  return v25;
}

- (id)aksAuthSessionForDeviceID:(id)a3 attestation:(BOOL)a4 sessionType:(int64_t)a5 escrowSecret:(id)a6
{
  BOOL v8 = a4;
  BOOL v10 = (__CFString *)a3;
  id v11 = a6;
  if (v8) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  }
  uint64_t v13 = (void *)v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v10));
  uint64_t v15 = auto_unlock_log(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if (!v14 || !v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unsigned int v27 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
      int v32 = 138414083;
      v28 = @"NO";
      __int16 v33 = v10;
      __int16 v34 = 2112;
      if (v27) {
        __int16 v29 = @"YES";
      }
      else {
        __int16 v29 = @"NO";
      }
      uint64_t v35 = v29;
      if (v13) {
        id v30 = @"YES";
      }
      else {
        id v30 = @"NO";
      }
      __int16 v36 = 2112;
      if (v14) {
        int64_t v31 = @"YES";
      }
      else {
        int64_t v31 = @"NO";
      }
      id v37 = v30;
      __int16 v38 = 2113;
      if (v8) {
        v28 = @"YES";
      }
      id v39 = v13;
      __int16 v40 = 2112;
      uint64_t v41 = v31;
      __int16 v42 = 2113;
      v43 = v14;
      __int16 v44 = 2112;
      int v45 = @"YES";
      __int16 v46 = 2112;
      __int16 v47 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "AKS session missing keys (device: %@, syncing %@, local exists %@, local LTK: %{private}@, remote exists %@, rem ote LTK: %{private}@, originator: %@, attested: %@)",  (uint8_t *)&v32,  0x52u);
    }

    goto LABEL_19;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = @"YES";
    if (!v11) {
      uint64_t v18 = @"NO";
    }
    int v32 = 138412546;
    __int16 v33 = v18;
    __int16 v34 = 2112;
    uint64_t v35 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Escrow secret (exists: %@, device ID: %@)",  (uint8_t *)&v32,  0x16u);
  }

  uint64_t v20 = auto_unlock_log(v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000BA598();
  }

  if (!v11)
  {
    uint64_t v24 = auto_unlock_log(v22);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000BA56C();
    }

LABEL_19:
    id v23 = 0LL;
    goto LABEL_20;
  }

  id v23 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession),  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:",  v13,  v14,  a5,  1LL,  v10,  v11);
LABEL_20:

  return v23;
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 originator:(BOOL)a4 sessionType:(int64_t)a5
{
  return -[SDAutoUnlockAKSManager aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:]( self,  "aksAuthorizationSessionForDeviceID:attestation:originator:externalACMContext:sessionType:",  a3,  0LL,  a4,  0LL,  a5);
}

- (id)aksAuthorizationSessionForDeviceID:(id)a3 attestation:(BOOL)a4 originator:(BOOL)a5 externalACMContext:(id)a6 sessionType:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  if (a4) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  }
  else {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v12));
  uint64_t v17 = 0LL;
  if (!v16 || !v15) {
    goto LABEL_24;
  }
  if (!v9)
  {
    uint64_t v17 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession),  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:",  v15,  v16,  a7,  0LL,  v12,  v13);
    goto LABEL_24;
  }

  if (a7 != 3)
  {
    uint64_t v18 = 0LL;
LABEL_20:
    v28 = objc_alloc(&OBJC_CLASS___SDAutoUnlockAKSSession);
    if (v13) {
      __int16 v29 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:]( v28,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:externalACMContext:",  v15,  v16,  a7,  1LL,  v12,  v13);
    }
    else {
      __int16 v29 = -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:]( v28,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:",  v15,  v16,  a7,  1LL,  v12,  v18);
    }
    uint64_t v17 = v29;

    goto LABEL_24;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDevice:](self, "escrowSecretForDevice:", v12));
  uint64_t v19 = auto_unlock_log(v18);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = @"YES";
    if (!v18) {
      uint64_t v21 = @"NO";
    }
    int v31 = 138412546;
    int v32 = v21;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Escrow secret for authorization (exists: %@, device ID: %@)",  (uint8_t *)&v31,  0x16u);
  }

  uint64_t v23 = auto_unlock_log(v22);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_1000BA598();
  }

  if (v18) {
    goto LABEL_20;
  }
  uint64_t v26 = auto_unlock_log(v25);
  unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1000BA5F8();
  }

  uint64_t v17 = 0LL;
LABEL_24:

  return v17;
}

- (BOOL)canCreateTokenSessionForDeviceID:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", a3));
  BOOL v4 = v3;
  if (v3) {
    BOOL v5 = sub_10001204C(v3) == 3;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)encryptMessageData:(id)a3 deviceID:(id)a4 encryptedMessage:(id *)a5 authTag:(id *)a6 nonce:(id *)a7
{
  id v12 = a4;
  int v48 = 0;
  uint64_t v47 = 0LL;
  id v13 = [a3 mutableCopy];
  uint64_t v14 = v13;
  v46[0] = 0LL;
  v46[1] = 0LL;
  if (a5 && a6 && a7)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", v12));
    if (v15)
    {
      uint64_t v16 = RandomBytes(&v47, 12LL);
      if ((_DWORD)v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = auto_unlock_log(v16);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000BA6EC(v17, v19, v20, v21, v22, v23, v24, v25);
        }
      }

      else
      {
        uint64_t v45 = kCryptoAEADDescriptorChaCha20Poly1305;
        id v15 = v15;
        id v44 = [v15 bytes];
        id v28 = [v15 length];
        id v29 = v14;
        id v30 = [v29 mutableBytes];
        id v31 = [v29 length];
        id v32 = v29;
        uint64_t v33 = CryptoAEADEncryptMessageOneShot( v45,  v44,  v28,  &v47,  12,  0,  0,  v30,  v31,  [v32 mutableBytes],  v46,  16);
        if (!(_DWORD)v33)
        {
          *a5 = v32;
          *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v46,  16LL));
          *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v47,  12LL));
          BOOL v42 = 1;
          goto LABEL_17;
        }

        uint64_t v34 = v33;
        uint64_t v35 = auto_unlock_log(v33);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000BA684(v34, v19, v36, v37, v38, v39, v40, v41);
        }
      }
    }

    else
    {
      uint64_t v27 = auto_unlock_log(0LL);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000BA624();
      }
    }
  }

  else
  {
    uint64_t v26 = auto_unlock_log(v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1000BA754();
    }
  }

  BOOL v42 = 0;
LABEL_17:

  return v42;
}

- (id)decryptMessage:(id)a3 authTag:(id)a4 nonce:(id)a5 bluetoothID:(id)a6 cachedDevices:(BOOL)a7 errorCode:(int64_t *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v71 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v18 = v17;
  BOOL v66 = v9;
  if (v9)
  {
    uint64_t v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v17 cachedIDSDeviceIDsForBluetoothID:v16]);

    uint64_t v21 = auto_unlock_log(v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = "Decrypting with cached device IDs";
  }

  else
  {
    uint64_t v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v17 idsDeviceIDsForBluetoothID:v16]);

    uint64_t v25 = auto_unlock_log(v24);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v23 = "Decrypting without cached device IDs";
  }

  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
LABEL_7:

  id v26 = -[NSMutableArray count](v19, "count");
  if ((unint64_t)v26 >= 2)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_1000B0ACC;
    v84[3] = &unk_1005CD640;
    v84[4] = self;
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v19, "sortedArrayUsingComparator:", v84));

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    uint64_t v19 = (NSMutableArray *)v27;
  }

  uint64_t v28 = auto_unlock_log(v26);
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v86 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Attempting to decrypt message with sorted device IDs %@",  buf,  0xCu);
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id obj = v19;
  id v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v80,  v89,  16LL);
  if (v73)
  {
    v64 = a8;
    id v65 = v16;
    uint64_t v30 = 0LL;
    uint64_t v72 = *(void *)v81;
    id v69 = v15;
    id v70 = v13;
    while (2)
    {
      for (i = 0LL; i != v73; i = (char *)i + 1)
      {
        if (*(void *)v81 != v72) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(NSMutableArray **)(*((void *)&v80 + 1) + 8LL * (void)i);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", v32));
        if (v33)
        {
          uint64_t v67 = v30;
          -[NSMutableArray addObject:](v71, "addObject:", v32);
          uint64_t v34 = -[NSMutableData initWithLength:]( [NSMutableData alloc],  "initWithLength:",  [v13 length]);
          uint64_t v79 = kCryptoAEADDescriptorChaCha20Poly1305;
          id v35 = v33;
          id v78 = [v35 bytes];
          id v77 = [v35 length];
          id v36 = v15;
          id v76 = [v36 bytes];
          id v75 = [v36 length];
          id v37 = v13;
          id v38 = [v37 bytes];
          id v39 = [v37 length];
          uint64_t v40 = v34;
          id v41 = -[NSMutableData mutableBytes](v40, "mutableBytes");
          id v42 = v14;
          uint64_t v43 = CryptoAEADDecryptMessageOneShot( v79,  v78,  v77,  v76,  v75,  0,  0,  v38,  v39,  v41,  [v42 bytes],  objc_msgSend(v42, "length"));
          int v44 = v43;
          uint64_t v45 = auto_unlock_log(v43);
          __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          uint64_t v47 = v46;
          if (!v44)
          {
            uint64_t v30 = v67;
            __int16 v49 = v40;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              id v50 = -[NSMutableData length](v40, "length");
              *(_DWORD *)buf = 138412546;
              __int128 v86 = v32;
              __int16 v87 = 2048;
              id v88 = v50;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Decrypted message (deviceID: %@, length: %ld)",  buf,  0x16u);
            }

            int v48 = 1;
            id v15 = v69;
            id v13 = v70;
            goto LABEL_27;
          }

          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            __int128 v86 = v32;
            __int16 v87 = 2048;
            id v88 = (id)v44;
            _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Error decryption failure (device ID: %@, error %ld)",  buf,  0x16u);
          }

          uint64_t v30 = 190LL;
          id v15 = v69;
          id v13 = v70;
        }
      }

      id v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v80,  v89,  16LL);
      if (v73) {
        continue;
      }
      break;
    }

    int v48 = 0;
    __int16 v49 = 0LL;
LABEL_27:
    a8 = v64;
    id v16 = v65;
  }

  else
  {
    int v48 = 0;
    uint64_t v30 = 0LL;
    __int16 v49 = 0LL;
  }

  uint64_t v52 = auto_unlock_log(v51);
  __int16 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v86 = v71;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Devices with session keys: %@", buf, 0xCu);
  }

  if (((v48 | !v66) & 1) != 0)
  {
    if (-[NSMutableArray count](obj, "count"))
    {
      int64_t v55 = 191LL;
      if (v48) {
        int64_t v55 = v30;
      }
      if (!a8) {
        goto LABEL_37;
      }
    }

    else
    {
      uint64_t v62 = auto_unlock_log(0LL);
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_1000BA7C0(v16, v63);
      }

      int64_t v55 = 198LL;
      if (!a8) {
        goto LABEL_37;
      }
    }

    *a8 = v55;
LABEL_37:
    v56 = v49;
    goto LABEL_41;
  }

  uint64_t v57 = auto_unlock_log(v54);
  id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Failed to find key with cached devices, trying without cache",  buf,  2u);
  }

  __int16 v59 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v59 logBluetoothIDCache];

  v56 = (NSMutableData *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager decryptMessage:authTag:nonce:bluetoothID:cachedDevices:errorCode:]( self,  "decryptMessage:authTag:nonce:bluetoothID:cachedDevices:errorCode:",  v13,  v14,  v15,  v16,  0LL,  a8));
LABEL_41:
  v60 = v56;

  return v60;
}

- (void)addDeviceIDMissingSessionKey:(id)a3
{
  id v12 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v5) {
    id v6 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  unsigned __int8 v8 = [v7 containsObject:v12];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    [v9 addObject:v12];

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    [v4 setObject:v10 forKey:@"AutoUnlockDevicesMissingSessionKey"];

    [v4 synchronize];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v11 refreshAutoUnlockDeviceCache];
  }
}

- (void)removeDeviceIDMissingSessionKey:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v5) {
    id v6 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  }
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  [v7 removeObject:v4];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  [v10 setObject:v8 forKey:@"AutoUnlockDevicesMissingSessionKey"];

  [v10 synchronize];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v9 refreshAutoUnlockDeviceCache];
}

- (void)clearAllDeviceIDsMissingSessionKeys
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v3) {
    id v4 = -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  [v5 removeAllObjects];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
  [v8 setObject:v6 forKey:@"AutoUnlockDevicesMissingSessionKey"];

  [v8 synchronize];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  [v7 refreshAutoUnlockDeviceCache];
}

- (id)deviceIDsMissingSessionKey
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForKey:@"AutoUnlockDevicesMissingSessionKey"]);
    id v6 = [v5 mutableCopy];
    -[SDAutoUnlockAKSManager setWatchIDsMissingSessionKey:](self, "setWatchIDsMissingSessionKey:", v6);

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey"));
    if (!v7)
    {
      id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[SDAutoUnlockAKSManager setWatchIDsMissingSessionKey:](self, "setWatchIDsMissingSessionKey:", v8);
    }
  }

  return -[SDAutoUnlockAKSManager watchIDsMissingSessionKey](self, "watchIDsMissingSessionKey");
}

- (BOOL)loadLocalLTK
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));

  if (v3)
  {
    uint64_t v5 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local LTK Exists", (uint8_t *)&v41, 2u);
    }

- (BOOL)loadLocalAttestedLTKIfNecessary
{
  return 0;
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3
{
}

- (void)generateLocalLTKWithAttestation:(BOOL)a3 forceDCRTRetrievalWithCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v9 = sharing_persistent_log(v6, v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Generating local LTK", buf, 2u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v12 = [v11 runningAsSetupUser];
  int v14 = (int)v12;
  if ((_DWORD)v12)
  {
    uint64_t v15 = SFDeviceClassCodeGet(v12, v13);
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

    uint64_t v15 = SFDeviceClassCodeGet(v17, v18);
    if (v16)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000B15F4;
      v33[3] = &unk_1005CD668;
      v33[4] = self;
      BOOL v36 = a3;
      id v34 = v11;
      id v19 = v6;
      id v35 = v19;
      uint64_t v20 = objc_retainBlock(v33);
      uint64_t v21 = v20;
      if (v19)
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1000B18C4;
        v30[3] = &unk_1005CD690;
        v30[4] = self;
        id v31 = v20;
        id v32 = v19;
        sub_100012AE4(v30);
      }

      else
      {
        ((void (*)(void *))v20[2])(v20);
      }

      goto LABEL_16;
    }
  }

  uint64_t v22 = auto_unlock_log(v15);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
    unsigned int v25 = [v11 deviceKeyBagState];
    uint64_t v26 = @"NO";
    *(_DWORD *)buf = 138412802;
    uint64_t v40 = v24;
    if (v14) {
      uint64_t v26 = @"YES";
    }
    __int16 v41 = 1024;
    unsigned int v42 = v25;
    __int16 v43 = 2112;
    int v44 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Unable to generate LTK (local device ID: %@, keybag state: %d, setup user: %@)",  buf,  0x1Cu);
  }

  if (v6)
  {
    uint64_t v27 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    BOOL v38 = @"Unable to generate LTK";
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  149LL,  v28));

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v29);
  }

- (BOOL)isMobileActivationErrorNetworkError:(id)a3
{
  return 0;
}

- (void)checkLocalLTK
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceKeyBagUnlocked];

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));

    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v8, 0LL));

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", v10, 1LL));

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 ltk]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 ltk]);
      uint64_t v14 = auto_unlock_log(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Checking Local LTKs", v57, 2u);
      }

      if (!(v12 | v13))
      {
        uint64_t v26 = auto_unlock_log(v16);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_18:

LABEL_19:
          -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:]( self,  "generateLocalLTKWithAttestation:",  0LL,  *(void *)v57);
LABEL_20:
          id v24 = 0LL;
LABEL_21:

          goto LABEL_22;
        }

        *(_WORD *)uint64_t v57 = 0;
        uint64_t v27 = "Both LTKs missing, generating new LTK";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, v27, v57, 2u);
        goto LABEL_18;
      }

      if (v12 && !v13)
      {
        uint64_t v17 = sub_100011D94( (void *)v12,  -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0LL),  -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine"));
        int v18 = v17;
        uint64_t v19 = auto_unlock_log(v17);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        BOOL v21 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v21)
          {
            *(_WORD *)uint64_t v57 = 0;
            uint64_t v22 = "Modern LTK is missing: Storing legacy LTK";
LABEL_44:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, v22, v57, 2u);
            goto LABEL_45;
          }

          goto LABEL_45;
        }

        if (!v21) {
          goto LABEL_18;
        }
        *(_WORD *)uint64_t v57 = 0;
        uint64_t v27 = "Modern LTK is missing: Legacy LTK is invalid, regenerating";
        goto LABEL_17;
      }

      if (v12 || !v13)
      {
        unsigned int v34 = [(id)v12 isEqualToData:v13];
        uint64_t v35 = -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 0LL);
        int v36 = -[SDAutoUnlockAKSManager t208Machine](self, "t208Machine");
        if (v34)
        {
          uint64_t v37 = sub_100011D94((void *)v13, v35, v36);
          int v38 = v37;
          uint64_t v39 = auto_unlock_log(v37);
          uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v41 = @"NO";
            if (v38) {
              __int16 v41 = @"YES";
            }
            *(_DWORD *)uint64_t v57 = 138412290;
            *(void *)&v57[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "LTKs match (valid: %@)", v57, 0xCu);
          }

          if ((v38 & 1) != 0) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }

        uint64_t v42 = sub_100011D94((void *)v12, v35, v36);
        if ((_DWORD)v42)
        {
          uint64_t v43 = auto_unlock_log(v42);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v57 = 0;
            uint64_t v22 = "LTK Mismatch: Legacy LTK is valid, overwriting modern LTK";
            goto LABEL_44;
          }

- (id)ltkHashForLocalLTK
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));

  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    id v5 = sub_100114DC0(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)updateLocalLTKForSignout
{
  uint64_t v3 = sharing_persistent_log(self, a2);
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating local ltk for sign out", v10, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:](self, "ltkInfoForDeviceID:", v5));

  [v6 setSignout:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 computerName]);
  -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:](self, "storeLongTermKey:forDeviceID:name:", v6, v7, v9);
}

- (int64_t)ltkKeyClassWithAttestation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = SFDeviceClassCodeGet(self, a2);
  if ((_DWORD)v4 != 5)
  {
    if ((_DWORD)v4 == 7)
    {
      uint64_t v5 = auto_unlock_log(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        uint64_t v7 = "Using key class A for watch";
        uint64_t v8 = (uint8_t *)&v19;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }

    uint64_t v12 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      uint64_t v13 = "Using key class C";
      int64_t v11 = 2LL;
      uint64_t v14 = (uint8_t *)&v16;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_16;
    }

    goto LABEL_15;
  }

  uint64_t v9 = auto_unlock_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v10)
    {
      *(_WORD *)uint64_t v17 = 0;
      uint64_t v13 = "Using key class C for mac";
      int64_t v11 = 2LL;
      uint64_t v14 = v17;
      goto LABEL_14;
    }

- (int64_t)keyClassForDeviceID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceForUniqueID:v3]);

  int v8 = SFDeviceClassCodeGet(v6, v7);
  if (v5)
  {
    int v9 = v8;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    id v11 = [v10 deviceTypeForDevice:v5];

    uint64_t v12 = 1LL;
    uint64_t v13 = 1LL;
    if (v9 != 1) {
      uint64_t v13 = 2LL;
    }
    if (v11 == (id)4) {
      uint64_t v12 = v13;
    }
    if (v11 == (id)2) {
      int64_t v14 = 2LL;
    }
    else {
      int64_t v14 = v12;
    }
  }

  else
  {
    int64_t v14 = 0LL;
  }

  return v14;
}

- (BOOL)deviceIsLocalDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (int)ltkSyncStatusForDeviceID:(id)a3 hash:(id)a4 modern:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", a3));
  BOOL v10 = v9;
  if (v5) {
    id v11 = @"Modern LTK Data";
  }
  else {
    id v11 = @"LTK Data";
  }
  if (v5) {
    uint64_t v12 = @"Modern LTK Hash";
  }
  else {
    uint64_t v12 = @"LTK Hash";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);

  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v12]);
  unsigned __int8 v15 = [v8 isEqualToData:v14];

  if (v13 && (v15 & 1) != 0)
  {
    int v17 = 3;
  }

  else if (v8 && v13 && v14)
  {
    int v17 = 2;
  }

  else
  {
    char v18 = v15 ^ 1;
    if (v8) {
      BOOL v19 = v14 == 0LL;
    }
    else {
      BOOL v19 = 1;
    }
    BOOL v20 = !v19 || v13 == 0LL;
    int v17 = !v20;
    if (!v20) {
      char v18 = 1;
    }
    if ((v18 & 1) == 0)
    {
      uint64_t v21 = auto_unlock_log(v16);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_1000BA8EC();
      }

      int v17 = 0;
    }
  }

  return v17;
}

- (void)generateLocalAttestedLTKIfNeccessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:@"forcelocalAttestedLTKRegeneration"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));

  uint64_t v9 = auto_unlock_log(v8);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7 || (v6 & 1) != 0)
  {
    if (v11)
    {
      uint64_t v13 = @"NO";
      if (v6) {
        uint64_t v13 = @"YES";
      }
      int v14 = 138412290;
      unsigned __int8 v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Generating cached local attested LTK (forcedRegeneration: %@)",  (uint8_t *)&v14,  0xCu);
    }

    -[SDAutoUnlockAKSManager generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:]( self,  "generateLocalLTKWithAttestation:forceDCRTRetrievalWithCompletion:",  1LL,  v4);
  }

  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Returning cached local attested LTK",  (uint8_t *)&v14,  2u);
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
    v4[2](v4, v12, 0LL);

    id v4 = (void (**)(id, uint64_t, void))v12;
  }
}

- (void)updateLTKsForDeviceID:(id)a3 staleRemoteLTK:(BOOL)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor", a3, a4));
  unsigned int v5 = [v4 deviceSupportsRanging];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v7 = [v6 deviceWasUnlockedOnce];

    if (!v7)
    {
      uint64_t v53 = auto_unlock_log(v8);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not updating remote LTKs because device not first unlocked",  buf,  2u);
      }

      goto LABEL_38;
    }

    -[SDAutoUnlockAKSManager loadRemoteLTKsIfNeeded](self, "loadRemoteLTKsIfNeeded");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 1LL));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 0LL));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSignedDevices](self, "modernSignedDevices"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager signedDevices](self, "signedDevices"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s setByAddingObjectsFromSet:](v9, "setByAddingObjectsFromSet:", v10));
    id v14 = [v13 mutableCopy];

    uint64_t v57 = v11;
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 setByAddingObjectsFromSet:v12]);
    uint64_t v16 = auto_unlock_log(v15);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
      uint64_t v19 = SFCompactStringFromCollection(v18);
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412290;
      uint64_t v72 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Keychain devices: %@", buf, 0xCu);
    }

    __int16 v59 = v14;
    uint64_t v55 = v15;
    BOOL v56 = v12;
    if (([v15 isSubsetOfSet:v14] & 1) == 0)
    {
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      id v21 = v15;
      id v22 = [v21 countByEnumeratingWithState:&v65 objects:v70 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v66;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v66 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
            id v27 = [v59 containsObject:v26];
            if ((v27 & 1) == 0)
            {
              uint64_t v28 = auto_unlock_log(v27);
              int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v72 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Device not in keychain, removing signed key: %@",  buf,  0xCu);
              }

              -[SDAutoUnlockAKSManager removeRemoteLTKForDeviceID:](self, "removeRemoteLTKForDeviceID:", v26);
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v65 objects:v70 count:16];
        }

        while (v23);
      }

      uint64_t v12 = v56;
    }

    -[os_log_s minusSet:](v9, "minusSet:", v57);
    [v10 minusSet:v12];
    uint64_t v30 = auto_unlock_log(-[os_log_s unionSet:](v9, "unionSet:", v10));
    BOOL v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_1000BA924();
    }

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allObjects](v9, "allObjects"));
    id v33 = [v32 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v33)
    {
      id v34 = v33;
      int v54 = v10;
      __int16 v58 = v9;
      unsigned __int8 v35 = 0;
      uint64_t v36 = *(void *)v62;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v62 != v36) {
            objc_enumerationMutation(v32);
          }
          uint64_t v38 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport",  v54,  v55));
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 idsDeviceForUniqueID:v38]);

          __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport"));
          id v42 = [v41 deviceTypeForDevice:v40];

          if (v42 != (id)2) {
            unsigned __int8 v35 = -[SDAutoUnlockAKSManager signLTKsForDeviceID:](self, "signLTKsForDeviceID:", v38);
          }
        }

        id v34 = [v32 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }

      while (v34);

      uint64_t v9 = v58;
      BOOL v10 = v54;
      uint64_t v12 = v56;
      if ((v35 & 1) == 0) {
        goto LABEL_35;
      }
      uint64_t v44 = auto_unlock_log(v43);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
        unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 allKeys]);
        uint64_t v48 = SFCompactStringFromCollection(v47);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        *(_DWORD *)buf = 138412290;
        uint64_t v72 = v49;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Updated remote LTKs: %@", buf, 0xCu);
      }

      uint64_t v51 = auto_unlock_log(v50);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
        *(_DWORD *)buf = 138477827;
        uint64_t v72 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  OS_LOG_TYPE_DEFAULT,  "Remote LTK data: %{private}@",  buf,  0xCu);
      }
    }

LABEL_35:
LABEL_38:
  }

- (void)updateRemoteLTKs
{
}

- (void)checkRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0LL));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1LL));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:]( self,  "remoteLTKHashForDeviceID:modern:",  v4,  0LL));
  id v8 = sub_100114DC0(v5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = v9;
  if (v9 && (id v11 = [v9 isEqualToData:v7], (v11 & 1) == 0))
  {
    uint64_t v15 = auto_unlock_log(v11);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Remote LTK needs resigning for pairing for hash",  v17,  2u);
    }

    -[SDAutoUnlockAKSManager signLTK:modernLTK:forDeviceID:](self, "signLTK:modernLTK:forDeviceID:", v5, v6, v4);
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:]( self,  "remoteLTKHashForDeviceID:modern:",  v4,  1LL));

    id v13 = sub_100114DC0(v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      unsigned int v7 = (void *)v12;
      BOOL v10 = v14;
    }

    else
    {
      BOOL v10 = 0LL;
      unsigned int v7 = (void *)v12;
    }
  }
}

- (void)checkPhoneRemoteLTKs
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDevicesIDs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
        id v12 = [v11 deviceTypeForDeviceID:v10];

        if (v12 == (id)2
          && -[SDAutoUnlockAKSManager deviceEnabledAsKeyForIDSDeviceID:](self, "deviceEnabledAsKeyForIDSDeviceID:", v10))
        {
          -[SDAutoUnlockAKSManager removeCorruptedRemoteLTKIfNecessaryForDeviceID:]( self,  "removeCorruptedRemoteLTKIfNecessaryForDeviceID:",  v10);
          goto LABEL_12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)signLTKsForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1LL));
  LOBYTE(self) = -[SDAutoUnlockAKSManager signLTK:modernLTK:forDeviceID:]( self,  "signLTK:modernLTK:forDeviceID:",  v5,  v6,  v4);

  return (char)self;
}

- (BOOL)signLTK:(id)a3 modernLTK:(id)a4 forDeviceID:(id)a5
{
  return -[SDAutoUnlockAKSManager signLTK:ltkModDate:modernLTK:modernLTKModDate:deviceID:]( self,  "signLTK:ltkModDate:modernLTK:modernLTKModDate:deviceID:",  a3,  0LL,  a4,  0LL,  a5);
}

- (BOOL)signLTK:(id)a3 ltkModDate:(id)a4 modernLTK:(id)a5 modernLTKModDate:(id)a6 deviceID:(id)a7
{
  unint64_t v12 = (unint64_t)a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  __int128 v16 = (__CFString *)a7;
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  int64_t v18 = -[SDAutoUnlockAKSManager keyClassForDeviceID:](self, "keyClassForDeviceID:", v16);
  if (v18)
  {
    uint64_t v19 = v18;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v21 = [v20 deviceKeyBagUnlocked];

    BOOL v23 = 0;
    if (v19 != 1 && v21)
    {
      uint64_t v24 = auto_unlock_log(v22);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = @"YES";
        *(_DWORD *)buf = 138412802;
        uint64_t v45 = v16;
        if (!v12) {
          uint64_t v26 = @"NO";
        }
        __int16 v46 = 2112;
        unsigned int v47 = v26;
        __int16 v48 = 1024;
        LODWORD(v49) = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Signing remote LTK (device: %@ LTK: %@, class: %d)",  buf,  0x1Cu);
      }

      if (!(v12 | v14) || !v17)
      {
        uint64_t v33 = auto_unlock_log(v27);
        int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = @"NO";
          *(_DWORD *)buf = 138413059;
          if (v12) {
            __int16 v41 = @"YES";
          }
          else {
            __int16 v41 = @"NO";
          }
          uint64_t v45 = v41;
          __int16 v46 = 2113;
          unsigned int v47 = (const __CFString *)v12;
          if (v17) {
            uint64_t v40 = @"YES";
          }
          __int16 v48 = 2112;
          uint64_t v49 = v40;
          __int16 v50 = 2113;
          uint64_t v51 = v17;
          _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)",  buf,  0x2Au);
        }

        BOOL v23 = 0;
        goto LABEL_28;
      }

      if (v12)
      {
        id v28 = sub_100012864((void *)v12, v19, v17, 1LL);
        int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (v29)
        {
          id v30 = sub_100114DC0((void *)v12);
          uint64_t v43 = objc_claimAutoreleasedReturnValue(v30);
          BOOL v31 = v43 != 0;
          if (!v14) {
            goto LABEL_13;
          }
          goto LABEL_20;
        }
      }

      else
      {
        int v29 = 0LL;
      }

      uint64_t v43 = 0LL;
      BOOL v31 = 0;
      if (!v14)
      {
LABEL_13:
        id v32 = 0LL;
        if (!v31) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }

- (id)allKeychainDevices
{
  return -[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 0LL);
}

- (id)keychainDevices:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeRef result = 0LL;
  unsigned int v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  if (v3) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseModernSyncedDictionary](self, "baseModernSyncedDictionary"));
  }
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseSyncedDictionary](self, "baseSyncedDictionary"));
  }
  id v7 = v6;
  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  [v7 setObject:kSecAttrSynchronizableAny forKeyedSubscript:kSecAttrSynchronizable];
  [v7 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
  if (!SecItemCopyMatching((CFDictionaryRef)v7, &result))
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v8 = (id)result;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)i),  "objectForKeyedSubscript:",  kSecAttrService,  (void)v15));
          if (!-[SDAutoUnlockAKSManager deviceIsLocalDevice:](self, "deviceIsLocalDevice:", v13)) {
            -[NSMutableSet addObject:](v5, "addObject:", v13);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v10);
    }
  }

  return v5;
}

- (id)modificationDataForDeviceID:(id)a3 modern:(BOOL)a4
{
  id v6 = a3;
  CFTypeRef result = 0LL;
  if (a4) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v6));
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v6));
  }
  uint64_t v8 = (void *)v7;
  id v9 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnAttributes);
  uint64_t v10 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if ((_DWORD)v10 == -25300)
  {
    id v13 = 0LL;
  }

  else
  {
    int v11 = v10;
    if ((_DWORD)v10)
    {
      uint64_t v14 = auto_unlock_log(v10);
      unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }

      id v13 = 0LL;
    }

    else
    {
      unint64_t v12 = (os_log_s *)result;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)result objectForKeyedSubscript:kSecAttrModificationDate]);
    }
  }

  return v13;
}

- (id)modernSignedDevices
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B36F0;
  v8[3] = &unk_1005CD6B8;
  id v9 = v3;
  unsigned int v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return v6;
}

- (id)signedDevices
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B380C;
  v8[3] = &unk_1005CD6B8;
  id v9 = v3;
  unsigned int v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return v6;
}

- (void)signAndStoreRemoteLTK:(id)a3 forDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = auto_unlock_log(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)BOOL v31 = 138412290;
    *(void *)&v31[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asked to store remote LTK for %@", v31, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));
  uint64_t v11 = -[SDAutoUnlockAKSManager ltkKeyClassWithAttestation:](self, "ltkKeyClassWithAttestation:", 1LL);
  uint64_t v12 = -[SDAutoUnlockAKSManager keyClassForDeviceID:](self, "keyClassForDeviceID:", v7);
  uint64_t v13 = auto_unlock_log(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  __int128 v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v16 = @"YES";
      *(_DWORD *)BOOL v31 = 138413058;
      *(_WORD *)&v31[12] = 2112;
      *(void *)&v31[4] = v7;
      if (!v6) {
        __int128 v16 = @"NO";
      }
      *(void *)&v31[14] = v16;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = v12;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Signing remote LTK (device: %@ LTK: %@, class: %d) with localLTK (class: %d)",  v31,  0x22u);
    }

    if (v6 && v10)
    {
      id v18 = sub_100012864(v6, v12, v10, v11);
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (v15)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
        id v20 = [v19 mutableCopy];

        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v7]);
        if (v21)
        {
          uint64_t v23 = auto_unlock_log(v22);
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", v31, 2u);
          }
        }

        id v35 = @"Attested LTK Data";
        uint64_t v36 = v15;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL,  *(_OWORD *)v31));
        [v20 setObject:v25 forKeyedSubscript:v7];

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
        [v26 setObject:v20 forKeyedSubscript:@"Remote LTKs"];

        -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
        -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v7);
      }

      else
      {
        uint64_t v30 = auto_unlock_log(0LL);
        id v20 = (id)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
          sub_1000BA9E4();
        }
      }
    }

    else
    {
      uint64_t v27 = auto_unlock_log(v17);
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v28 = @"NO";
        *(_DWORD *)BOOL v31 = 138413059;
        if (v6) {
          int v29 = @"YES";
        }
        else {
          int v29 = @"NO";
        }
        *(void *)&v31[4] = v29;
        *(_WORD *)&v31[12] = 2113;
        *(void *)&v31[14] = v6;
        if (v10) {
          id v28 = @"YES";
        }
        __int16 v32 = 2112;
        *(void *)uint64_t v33 = v28;
        *(_WORD *)&v33[8] = 2113;
        id v34 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Missing signing info (remoteLTK exists %@, remoteLTK %{private}@, localLTK exists %@, localLTK %{private}@)",  v31,  0x2Au);
      }
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_1000BA984();
  }
}

- (id)allRemoteLTKData
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B3CA8;
  v8[3] = &unk_1005CD6B8;
  id v9 = v3;
  unsigned int v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = -[NSMutableArray copy](v5, "copy");

  return v6;
}

- (id)remoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

    if (!v6)
    {
      -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v4);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)hashMatchesAnyRemoteLTKForDeviceID:(id)a3 ltkHash:(id)a4 isPreferred:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

  if (!v11)
  {
    -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v8);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

    if (!v11)
    {
      BOOL v22 = 0;
      char v20 = 0;
      if (!a5) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  id v28 = a5;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", v8));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"LTK Data"]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Modern LTK Data"]);
  unsigned __int8 v16 = [v14 isEqualToData:v15];
  unsigned __int8 v17 = [v11 isEqualToData:v15];
  id v18 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:]( self,  "remoteLTKHashForDeviceID:modern:",  v8,  0LL));
  uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager remoteLTKHashForDeviceID:modern:]( self,  "remoteLTKHashForDeviceID:modern:",  v8,  1LL));
  if ([v9 isEqualToData:v18])
  {
    char v20 = v16 | v17 ^ 1;
LABEL_7:
    BOOL v22 = 1;
    goto LABEL_16;
  }

  id v21 = [v9 isEqualToData:v19];
  if ((_DWORD)v21)
  {
    char v20 = v16 | v17;
    goto LABEL_7;
  }

  uint64_t v23 = auto_unlock_log(v21);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = @"nil";
    *(_DWORD *)buf = 138413058;
    if (v18) {
      uint64_t v26 = v18;
    }
    else {
      uint64_t v26 = @"nil";
    }
    id v30 = v8;
    __int16 v31 = 2112;
    if (v19) {
      uint64_t v25 = v19;
    }
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v26;
    __int16 v35 = 2112;
    uint64_t v36 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "LTK hashes do not match {\n \tdevice ID: %@, \n \trequestLTKHash: %@, \n \tlegacyRemoteLTKHash: %@, \n \tmodernRemoteLTKHash: %@\n }",  buf,  0x2Au);
  }

  BOOL v22 = 0;
  char v20 = 0;
LABEL_16:

  a5 = v28;
  if (v28) {
LABEL_17:
  }
    *a5 = v20;
LABEL_18:

  return v22;
}

- (id)remoteLTKHashForDeviceID:(id)a3 modern:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", a3));
  id v6 = v5;
  if (v4) {
    id v7 = @"Modern LTK Hash";
  }
  else {
    id v7 = @"LTK Hash";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);

  return v8;
}

- (id)remoteLTKEntryForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (id)remoteLTKList
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  if (!v3
    || (id v4 = (void *)v3,
        unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Remote LTKs"]),
        v6,
        v5,
        v4,
        !v6))
  {
    uint64_t v7 = auto_unlock_log(v3);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000BAA10(self, v8);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Remote LTKs"]);

  return v10;
}

- (void)updatePreferredRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKEntryForDeviceID:](self, "remoteLTKEntryForDeviceID:", v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"LTK Data"]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Modern LTK Data"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Attested LTK Data"]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v10 = v9;
    uint64_t v11 = v8;
LABEL_3:
    [v9 setObject:v11 forKeyedSubscript:v4];
LABEL_4:

    goto LABEL_5;
  }

  if (!(v6 | v7))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    [v10 removeObjectForKey:v4];
    goto LABEL_4;
  }

  if (v6 && !v7) {
    goto LABEL_14;
  }
  if (!v6 && v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v10 = v9;
    uint64_t v11 = (void *)v7;
    goto LABEL_3;
  }

  id v12 = [(id)v6 isEqualToData:v7];
  if ((_DWORD)v12)
  {
LABEL_14:
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v10 = v9;
    uint64_t v11 = (void *)v6;
    goto LABEL_3;
  }

  uint64_t v13 = auto_unlock_log(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "LTK's are mismatched between keychain views (device ID: %@)",  (uint8_t *)&v23,  0xCu);
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"LTK Mod Date"]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Modern LTK Mod Date"]);
  unsigned __int8 v17 = (void *)v16;
  if ((!v6 || !v15 || v16)
    && (v7 && v16 && !v15
     || v15
     && v16
     && (!v6 || ([v15 timeIntervalSinceDate:v16], v21 < 0.0))
     && v7
     && ([v17 timeIntervalSinceDate:v15], v22 >= 0.0)))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v19 = v18;
    uint64_t v20 = v7;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
    uint64_t v19 = v18;
    uint64_t v20 = v6;
  }

  [v18 setObject:v20 forKeyedSubscript:v4];

LABEL_5:
}

- (void)fetchLTKsFromCompanion:(BOOL)a3
{
}

- (id)ltksForRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000B4644;
  v26[3] = &unk_1005CD6E0;
  v26[4] = self;
  id v6 = v4;
  id v27 = v6;
  uint64_t v7 = v5;
  id v28 = v7;
  id v8 = objc_retainBlock(v26);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteDeviceID]);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteDeviceID]);
    ((void (*)(void *, void *))v8[2])(v8, v10);
  }

  else
  {
    double v21 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allKeychainDevices](self, "allKeychainDevices"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v15);
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 localID]);
          unsigned __int8 v18 = [v16 isEqualToString:v17];

          if ((v18 & 1) == 0) {
            ((void (*)(void *, void *))v8[2])(v8, v16);
          }
          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }

      while (v13);
    }

    uint64_t v7 = v21;
  }

  id v19 = -[NSMutableDictionary copy](v7, "copy");
  return v19;
}

- (void)takeMobileKeybagAssertion
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v7, 2u);
  }

  if (!self->_keybagAssertion)
  {
    v8[0] = @"MKBAssertionKey";
    v8[1] = @"MKBAssertionTimeout";
    v9[0] = @"RemoteProfile";
    v9[1] = &off_1005F7870;
    unsigned int v5 = (void *)MKBDeviceLockAssertion( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL,  0LL),  &v7);
    id keybagAssertion = self->_keybagAssertion;
    self->_id keybagAssertion = v5;

    -[SDAutoUnlockAKSManager restartKeybagAssertionTimer](self, "restartKeybagAssertionTimer");
  }

- (void)releaseKeybagAssertion
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v6, 2u);
  }

  id keybagAssertion = self->_keybagAssertion;
  self->_id keybagAssertion = 0LL;
}

- (void)restartKeybagAssertionTimer
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting keybag assertion timer", buf, 2u);
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
  if (!v5)
  {
    uint64_t v8 = SFMainQueue(v6, v7);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000B4B00;
    v15[3] = &unk_1005CB2F8;
    v15[4] = self;
    uint64_t v10 = sub_100114598(0, v9, v15);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[SDAutoUnlockAKSManager setKeybagAssertionTimer:](self, "setKeybagAssertionTimer:", v11);

    id v12 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
    dispatch_resume(v12);
  }

  id v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keybagAssertionTimer](self, "keybagAssertionTimer"));
  dispatch_time_t v14 = sub_100114580(55.0);
  sub_100114638(v13, v14);
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v7 != 308)
  {
    if (v7 == 202)
    {
      -[SDAutoUnlockAKSManager handleLTKResponse:](self, "handleLTKResponse:", v11);
    }

    else if (v7 == 201)
    {
      -[SDAutoUnlockAKSManager handleLTKRequest:](self, "handleLTKRequest:", v11);
    }

    else
    {
      uint64_t v14 = auto_unlock_log(v12);
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000BAB40();
      }
    }
  }
}

- (BOOL)localDeviceEnabledAsKey
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4) {
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyDevice](self, "deviceEnabledAsKeyForAnyDevice");
  }
  else {
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyIDSDevice](self, "deviceEnabledAsKeyForAnyIDSDevice");
  }
}

- (BOOL)localDeviceEnabledAsKeyForMac
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4) {
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyMac](self, "deviceEnabledAsKeyForAnyMac");
  }
  else {
    return -[SDAutoUnlockAKSManager deviceEnabledAsKeyForAnyIDSMac](self, "deviceEnabledAsKeyForAnyIDSMac");
  }
}

- (BOOL)deviceEnabledAsKeyForIDSDeviceID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v6 = [v5 deviceTypeForDeviceID:v4];

  BOOL v7 = -[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v4);
  if (v7)
  {
    uint64_t v8 = auto_unlock_log(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000BAB6C();
    }
LABEL_8:

    LOBYTE(v9) = 1;
    goto LABEL_10;
  }

  if (v6 != (id)2)
  {
    LOBYTE(v9) = 0;
    goto LABEL_10;
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));

  if (v9)
  {
    uint64_t v11 = auto_unlock_log(v10);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000BABCC();
    }
    goto LABEL_8;
  }

- (BOOL)deviceEnabledAsKeyForAnyIDSDevice
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDevicesIDs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0
          && -[SDAutoUnlockAKSManager deviceEnabledAsKeyForIDSDeviceID:](self, "deviceEnabledAsKeyForIDSDeviceID:", v10))
        {
          BOOL v13 = 1;
          goto LABEL_12;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)deviceEnabledAsKeyForAnyIDSMac
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDevicesIDs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          if (-[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10))
          {
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport"));
            id v14 = [v13 deviceTypeForDeviceID:v10];

            if (v14 == (id)4)
            {
              uint64_t v17 = auto_unlock_log(v15);
              __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                sub_1000BAB6C();
              }

              BOOL v16 = 1;
              goto LABEL_15;
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)deviceEnabledAsKeyForAnyDevice
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devicesWithLTKs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport"));
          id v14 = [v13 deviceTypeForDeviceID:v10];

          BOOL v15 = -[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10);
          if (v15)
          {
            uint64_t v19 = auto_unlock_log(v15);
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
              sub_1000BAB6C();
            }
            goto LABEL_17;
          }

          if (v14 == (id)2)
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v10));

            if (v16)
            {
              uint64_t v21 = auto_unlock_log(v17);
              __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                sub_1000BABCC();
              }
LABEL_17:

              BOOL v18 = 1;
              goto LABEL_18;
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (BOOL)deviceEnabledAsKeyForAnyMac
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devicesWithLTKs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          if (-[SDAutoUnlockAKSManager escrowSecretExistsForDevice:](self, "escrowSecretExistsForDevice:", v10))
          {
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport"));
            id v14 = [v13 deviceTypeForDeviceID:v10];

            if (v14 == (id)4)
            {
              uint64_t v17 = auto_unlock_log(v15);
              BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                sub_1000BAB6C();
              }

              BOOL v16 = 1;
              goto LABEL_15;
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)deviceEnabledAsKey:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDForWatchID:](self, "companionIDForWatchID:", v4));
  BOOL v7 = v6 != 0LL;

  unsigned int v8 = -[SDAutoUnlockAKSManager viewSyncing](self, "viewSyncing");
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
  uint64_t v10 = (void *)v9;
  if (v5)
  {
    uint64_t v11 = auto_unlock_log(v9);
    unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000BACB8(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v21 = [v20 deviceTypeForDeviceID:v4];

  int v24 = SFDeviceClassCodeGet(v22, v23);
  int v25 = v24;
  if (v24 == 8 || v24 == 1)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localAttestedLTK](self, "localAttestedLTK"));

    BOOL v7 = 1;
    unsigned int v8 = 1;
    uint64_t v10 = (void *)v26;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));
  id v28 = v27;
  if (v25 == 5 && v21 == (id)7)
  {
    if (!v27) {
      goto LABEL_21;
    }
LABEL_15:
    *(_DWORD *)__int16 v50 = 0;
    uint64_t v29 = sub_1000131A0(v10, v27, 0, 1, 0, 0, 0LL, 1, v50);
    uint64_t v30 = v29;
    if (*(_DWORD *)v50 == -536363002 || *(_DWORD *)v50 == -536870194)
    {
      if (v25 == 5)
      {
        uint64_t v31 = auto_unlock_log(v29);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Attempting to fix remote LTK for check",  buf,  2u);
        }

        -[SDAutoUnlockAKSManager resignRemoteLTKForDeviceID:](self, "resignRemoteLTKForDeviceID:", v4);
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));

        uint64_t v29 = sub_1000131A0(v10, v33, 0, 1, 0, 0, 0LL, 1, 0LL);
        uint64_t v30 = v29;
        id v28 = v33;
      }

      else
      {
        uint64_t v37 = auto_unlock_log(v29);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Local and remote LTKs don't match",  buf,  2u);
        }
      }
    }

    if (v30 < 0) {
      goto LABEL_39;
    }
    int v36 = 1;
    goto LABEL_31;
  }

  if (!v27)
  {
LABEL_21:
    uint64_t v34 = auto_unlock_log(v27);
    __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_1000BAC58();
    }

    id v28 = 0LL;
    goto LABEL_39;
  }

  if (v25 == 7 && v21 == (id)5) {
    goto LABEL_15;
  }
  uint64_t v29 = sub_10001204C(v27);
  if (!v29)
  {
LABEL_39:
    uint64_t v43 = auto_unlock_log(v29);
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_1000BABF8();
    }

    BOOL v40 = 0;
    goto LABEL_42;
  }

  int v36 = 0;
  uint64_t v30 = -1LL;
LABEL_31:
  if (v5) {
    BOOL v39 = v7;
  }
  else {
    BOOL v39 = 0;
  }
  BOOL v40 = v39 & v8;
  if ((v39 & v8 & 1) == 0)
  {
    uint64_t v41 = auto_unlock_log(v29);
    BOOL v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = @"NO";
      if (v5) {
        unsigned int v47 = @"YES";
      }
      else {
        unsigned int v47 = @"NO";
      }
      *(_DWORD *)__int16 v50 = 138413058;
      id v51 = v4;
      if (v7) {
        __int16 v48 = @"YES";
      }
      else {
        __int16 v48 = @"NO";
      }
      uint64_t v53 = v47;
      __int16 v52 = 2112;
      __int16 v54 = 2112;
      if (v8) {
        __int16 v46 = @"YES";
      }
      uint64_t v55 = v48;
      __int16 v56 = 2112;
      uint64_t v57 = v46;
      _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Device not enabled but can create session (device: %@, ranging key exists: %@, companion ID exists: %@, view syncing: %@)",  v50,  0x2Au);
    }
  }

  if (v36) {
    sub_100013D3C(v30);
  }
LABEL_42:

  return v40;
}

- (void)deleteEscrowSecretForAllDevices
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devicesWithLTKs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 autoUnlockDeviceForDeviceID:v10]);

          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keyPairingIDForDeviceID:](self, "keyPairingIDForDeviceID:", v10));
          -[SDAutoUnlockAKSManager deleteEscrowSecretForDeviceID:](self, "deleteEscrowSecretForDeviceID:", v10);
          -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v10);
          if ([v14 type] == (id)2 || v15 != 0)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
            [v17 sendDisableMessageToDeviceID:v10 pairingID:v15];
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  -[SDAutoUnlockAKSManager deleteAllEscrowSecrets](self, "deleteAllEscrowSecrets");
  -[SDAutoUnlockAKSManager deleteAllRangingKeys](self, "deleteAllRangingKeys");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v18 clearAllKeysWithTokens];

  -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
}

- (void)deleteEscrowSecretForPhones
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devicesWithLTKs]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v20 = v7;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport",  v20));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 autoUnlockDeviceForDeviceID:v11]);

        if ([v13 type] == (id)2)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
          unsigned __int8 v15 = [v11 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            uint64_t v17 = auto_unlock_log(v16);
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              uint64_t v26 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Disabling feature for device: %@",  buf,  0xCu);
            }

            -[SDAutoUnlockAKSManager deleteEscrowSecretForDeviceID:](self, "deleteEscrowSecretForDeviceID:", v11);
            -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v11);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
            [v19 sendDisableMessageToDeviceID:v11 pairingID:0];
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }
}

- (void)disablePairingForAllKeyDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager allPairedWatchDeviceIDs](self, "allPairedWatchDeviceIDs"));
  uint64_t v4 = auto_unlock_log(v3);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all keys %@", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v3;
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
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager pairingIDForWatchID:](self, "pairingIDForWatchID:", v11, (void)v16));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockSessionManager sharedManager]( &OBJC_CLASS___SDAutoUnlockSessionManager,  "sharedManager"));
        [v13 sendDisableMessageToDeviceID:v11 pairingID:v12];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
        unsigned __int8 v15 = [v11 isEqualToString:v14];

        if ((v15 & 1) == 0) {
          -[SDAutoUnlockAKSManager disablePairingWithKeyDevice:](self, "disablePairingWithKeyDevice:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  -[SDAutoUnlockAKSManager deleteAllRangingKeys](self, "deleteAllRangingKeys");
}

- (void)disablePairingForAllLockPhones
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 devicesWithLTKs]);

  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Disabling pairing for all phones", buf, 2u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      unsigned __int8 v12 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockTransport sharedTransport]( &OBJC_CLASS___SDAutoUnlockTransport,  "sharedTransport",  (void)v20));
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceForUniqueID:v13]);

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
        id v17 = [v16 deviceTypeForDevice:v15];

        if (v17 == (id)2)
        {
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
          unsigned __int8 v19 = [v13 isEqualToString:v18];

          if ((v19 & 1) == 0)
          {
            -[SDAutoUnlockAKSManager disablePairingWithKeyDevice:](self, "disablePairingWithKeyDevice:", v13);
            -[SDAutoUnlockAKSManager removeRemoteLTKForDeviceID:](self, "removeRemoteLTKForDeviceID:", v13);
          }
        }

        unsigned __int8 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v10);
  }
}

- (void)removeAllRemoteLTKsOnSignOut
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing all remote LTKs on sign out", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDevices:](self, "keychainDevices:", 1LL));
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
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SDAutoUnlockAKSManager deleteRemoteLongTermKeyForDeviceID:modern:tombstone:]( self,  "deleteRemoteLongTermKeyForDeviceID:modern:tombstone:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v11),  0LL,  0LL);
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v9);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SDAutoUnlockAKSManager deleteRemoteLongTermKeyForDeviceID:modern:tombstone:]( self,  "deleteRemoteLongTermKeyForDeviceID:modern:tombstone:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v16),  1LL,  0LL,  (void)v17);
        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }

    while (v14);
  }

  -[SDAutoUnlockAKSManager clearRemoteLTKs](self, "clearRemoteLTKs");
}

- (BOOL)ltkExistsForKeyDevice:(id)a3
{
  return -[SDAutoUnlockAKSManager ltkExistsForKeyDevice:updateLTKs:](self, "ltkExistsForKeyDevice:updateLTKs:", a3, 0LL);
}

- (BOOL)ltkExistsForKeyDevice:(id)a3 updateLTKs:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));

  if (v7) {
    LOBYTE(v8) = 1;
  }
  else {
    LOBYTE(v8) = v4;
  }
  if (v4 && !v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager anyLongTermKeyForDeviceID:](self, "anyLongTermKeyForDeviceID:", v6));

    if (v8)
    {
      uint64_t v10 = auto_unlock_log(v9);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Updating remote LTK for %@",  (uint8_t *)&v13,  0xCu);
      }

      -[SDAutoUnlockAKSManager updateRemoteLTKs](self, "updateRemoteLTKs");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v6));
      LOBYTE(v8) = v11 != 0LL;
    }
  }

  return (char)v8;
}

- (BOOL)disablePairingWithKeyDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKForDeviceID:](self, "remoteLTKForDeviceID:", v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localLTK](self, "localLTK"));
    BOOL v7 = sub_10001371C(v6, v5);
  }

  else
  {
    BOOL v7 = 0;
  }

  -[SDAutoUnlockAKSManager removePairingRecordForWatchID:](self, "removePairingRecordForWatchID:", v4);
  -[SDAutoUnlockAKSManager deleteRangingKeyForDeviceID:](self, "deleteRangingKeyForDeviceID:", v4);

  -[SDAutoUnlockAKSManager updateDynamicStoreEnabled](self, "updateDynamicStoreEnabled");
  return v7;
}

- (void)addRemoteLTK:(id)a3 ltkHash:(id)a4 ltkModDate:(id)a5 modernLTK:(id)a6 modernLTKHash:(id)a7 modernLTKModeDate:(id)a8 deviceID:(id)a9
{
  id v30 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  id v22 = [v21 mutableCopy];

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v20]);
  if (v23)
  {
    uint64_t v25 = auto_unlock_log(v24);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Overriding existing LTK", buf, 2u);
    }
  }

  id v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v28 = v27;
  if (v30) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v30, @"LTK Data");
  }
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v15, @"LTK Hash");
  }
  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v16, @"LTK Mod Date");
  }
  if (v17) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v17,  @"Modern LTK Data");
  }
  if (v18) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v18,  @"Modern LTK Hash");
  }
  if (v19) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v19,  @"Modern LTK Mod Date");
  }
  [v22 setObject:v28 forKeyedSubscript:v20];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  [v29 setObject:v22 forKeyedSubscript:@"Remote LTKs"];

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  -[SDAutoUnlockAKSManager updatePreferredRemoteLTKForDeviceID:](self, "updatePreferredRemoteLTKForDeviceID:", v20);
}

- (void)removeRemoteLTKForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
  id v8 = [v5 mutableCopy];

  [v8 removeObjectForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  [v6 setObject:v8 forKeyedSubscript:@"Remote LTKs"];

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  [v7 removeObjectForKey:v4];
}

- (void)clearRemoteLTKs
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v3);

  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
  [v5 setObject:v4 forKeyedSubscript:@"Remote LTKs"];

  -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
  [v6 removeAllObjects];
}

- (void)saveRemoteLTKs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](self, "remoteLTKStorageFilePath"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
    id v16 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v16));
    id v6 = v16;

    if (v5)
    {
      id v15 = v6;
      unsigned int v8 = [v5 writeToFile:v3 options:1 error:&v15];
      id v9 = v15;

      uint64_t v11 = auto_unlock_log(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      int v13 = v12;
      if (v8)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_1000BAD88(self, v13);
        }
      }

      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_1000BAE08();
      }
    }

    else
    {
      uint64_t v14 = auto_unlock_log(v7);
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000BAD28();
      }
      id v9 = v6;
    }
  }
}

- (void)loadRemoteLTKsIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));

  if (!v3) {
    -[SDAutoUnlockAKSManager loadRemoteLTKs](self, "loadRemoteLTKs");
  }
}

- (void)loadRemoteLTKs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKStorageFilePath](self, "remoteLTKStorageFilePath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:0];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = auto_unlock_log(v6);
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating Remote LTK file", buf, 2u);
    }

    id v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v9);

    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
    [v11 setObject:v10 forKeyedSubscript:@"Remote LTKs"];

    -[SDAutoUnlockAKSManager saveRemoteLTKs](self, "saveRemoteLTKs");
  }

  if (v3)
  {
    id v35 = 0LL;
    id v12 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v3,  0LL,  &v35);
    id v13 = v35;
    uint64_t v14 = v13;
    if (v12)
    {
      id v34 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  0LL,  0LL,  &v34));
      id v16 = v34;

      if (v15)
      {
        id v18 = [v15 mutableCopy];
        -[SDAutoUnlockAKSManager setRemoteLTKs:](self, "setRemoteLTKs:", v18);

        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager preferredRemoteLTKForDeviceID](self, "preferredRemoteLTKForDeviceID"));
        [v19 removeAllObjects];

        uint64_t v21 = auto_unlock_log(v20);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKList](self, "remoteLTKList"));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allKeys]);
          uint64_t v25 = SFCompactStringFromCollection(v24);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Loaded remote LTKs: %@", buf, 0xCu);
        }

        uint64_t v28 = auto_unlock_log(v27);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager remoteLTKs](self, "remoteLTKs"));
          *(_DWORD *)buf = 138477827;
          uint64_t v37 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Remote LTK Data: %{private}@", buf, 0xCu);
        }
      }

      else
      {
        uint64_t v33 = auto_unlock_log(v17);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_1000BAEC8();
        }
      }
    }

    else
    {
      if ([v13 code] == (id)-1100) {
        goto LABEL_22;
      }
      if ([v14 code] == (id)260) {
        goto LABEL_22;
      }
      id v31 = [v14 code];
      if (v31 == (id)4) {
        goto LABEL_22;
      }
      uint64_t v32 = auto_unlock_log(v31);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_1000BAE68();
      }
      id v16 = v14;
    }

    uint64_t v14 = v16;
LABEL_22:
  }
}

- (NSString)remoteLTKStorageFilePath
{
  remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  if (!remoteLTKStorageFilePath)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    unsigned __int8 v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"ltk.plist"]);
    uint64_t v6 = self->_remoteLTKStorageFilePath;
    self->_remoteLTKStorageFilePath = v5;

    remoteLTKStorageFilePath = self->_remoteLTKStorageFilePath;
  }

  return remoteLTKStorageFilePath;
}

- (void)reloadPairingRecordsIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));

  if (!v3)
  {
    uint64_t v5 = auto_unlock_log(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reloading pairing records", v7, 2u);
    }

    -[SDAutoUnlockAKSManager loadWatchIDsToPairingRecords](self, "loadWatchIDsToPairingRecords");
  }

- (id)allPairedWatchDeviceIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return v3;
}

- (void)setCompanionID:(id)a3 forWatchID:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v13]);
    uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];
  }

  else
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, @"Companion ID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  [v12 setObject:v11 forKeyedSubscript:v13];

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (id)companionIDForWatchID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Companion ID"]);
  return v7;
}

- (void)removeCompanionIDForWatchID:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v10]);
    unsigned int v8 = (NSMutableDictionary *)[v7 mutableCopy];
  }

  else
  {
    unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", @"Companion ID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  [v9 setObject:v8 forKeyedSubscript:v10];

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)setPairingID:(id)a3 forWatchID:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v13]);
    uint64_t v11 = (NSMutableDictionary *)[v10 mutableCopy];
  }

  else
  {
    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, @"Pairing ID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  [v12 setObject:v11 forKeyedSubscript:v13];

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (id)pairingIDForWatchID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Pairing ID"]);
  return v7;
}

- (void)removePairingIDForWatchID:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v10]);
    unsigned int v8 = (NSMutableDictionary *)[v7 mutableCopy];
  }

  else
  {
    unsigned int v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", @"Pairing ID");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  [v9 setObject:v8 forKeyedSubscript:v10];

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)removePairingRecordForWatchID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
  [v5 removeObjectForKey:v4];

  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
}

- (void)saveWatchIDsToPairingRecords
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager watchIDsToPairingRecordsStorageFilePath]( self,  "watchIDsToPairingRecordsStorageFilePath"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager watchIDsToPairingRecords](self, "watchIDsToPairingRecords"));
    id v16 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v16));
    id v6 = v16;

    if (v5)
    {
      id v15 = v6;
      unsigned int v8 = [v5 writeToFile:v3 options:1 error:&v15];
      id v9 = v15;

      uint64_t v11 = auto_unlock_log(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = v12;
      if (v8)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_1000BAF88(self, v13);
        }
      }

      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_1000BB008();
      }
    }

    else
    {
      uint64_t v14 = auto_unlock_log(v7);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000BAF28();
      }
      id v9 = v6;
    }
  }
}

- (NSString)watchIDsToPairingRecordsStorageFilePath
{
  watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  if (!watchIDsToPairingRecordsStorageFilePath)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"pairing-records.plist"]);
    id v6 = self->_watchIDsToPairingRecordsStorageFilePath;
    self->_watchIDsToPairingRecordsStorageFilePath = v5;

    watchIDsToPairingRecordsStorageFilePath = self->_watchIDsToPairingRecordsStorageFilePath;
  }

  return watchIDsToPairingRecordsStorageFilePath;
}

- (void)migrateLegacyWatchIDToCompanionIDs
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager loadLegacyWatchIDToCompanionIDMapping]( self,  "loadLegacyWatchIDToCompanionIDMapping"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B7578;
  v4[3] = &unk_1005CD708;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  -[SDAutoUnlockAKSManager saveWatchIDsToPairingRecords](self, "saveWatchIDsToPairingRecords");
  -[SDAutoUnlockAKSManager deleteLegacyWatchToCompanionIDs](self, "deleteLegacyWatchToCompanionIDs");
}

- (void)deleteLegacyWatchToCompanionIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager watchIDToCompanionIDStorageFilePath]( self,  "watchIDToCompanionIDStorageFilePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0 && [v5 code] != (id)-1100 && objc_msgSend(v5, "code") != (id)260)
  {
    id v6 = [v5 code];
    if (v6 != (id)4)
    {
      uint64_t v7 = auto_unlock_log(v6);
      unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000BB068();
      }
    }
  }
}

- (id)loadLegacyWatchIDToCompanionIDMapping
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager watchIDToCompanionIDStorageFilePath]( self,  "watchIDToCompanionIDStorageFilePath"));
  if (v3)
  {
    id v19 = 0LL;
    unsigned __int8 v4 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v3,  0LL,  &v19);
    id v5 = v19;
    id v6 = v5;
    if (v4)
    {
      id v18 = 0LL;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  &v18));
      id v8 = v18;

      if (v7)
      {
        id v10 = [v7 mutableCopy];
        uint64_t v11 = auto_unlock_log(v10);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_1000BB188();
        }
      }

      else
      {
        uint64_t v14 = auto_unlock_log(v9);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000BB128();
        }
        id v10 = 0LL;
      }
    }

    else
    {
      if ([v5 code] == (id)-1100
        || [v6 code] == (id)260
        || (id v13 = [v6 code], v13 == (id)4))
      {
        id v10 = 0LL;
LABEL_16:

        goto LABEL_17;
      }

      uint64_t v17 = auto_unlock_log(v13);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        sub_1000BB0C8();
      }
      id v10 = 0LL;
      id v8 = v6;
    }

    id v6 = v8;
    goto LABEL_16;
  }

  id v6 = 0LL;
  id v10 = 0LL;
LABEL_17:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager migrateLegacyCompanionIDs:](self, "migrateLegacyCompanionIDs:", v10));

  return v15;
}

- (NSString)watchIDToCompanionIDStorageFilePath
{
  watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  if (!watchIDToCompanionIDStorageFilePath)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager autoUnlockFolderPath](self, "autoUnlockFolderPath"));
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"watch-companion-mapping.plist"]);
    id v6 = self->_watchIDToCompanionIDStorageFilePath;
    self->_watchIDToCompanionIDStorageFilePath = v5;

    watchIDToCompanionIDStorageFilePath = self->_watchIDToCompanionIDStorageFilePath;
  }

  return watchIDToCompanionIDStorageFilePath;
}

- (id)migrateLegacyCompanionIDs:(id)a3
{
  if (a3) {
    unsigned __int8 v4 = (NSMutableDictionary *)[a3 mutableCopy];
  }
  else {
    unsigned __int8 v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  id v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager loadCompanionIDs](self, "loadCompanionIDs"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_1000B79B8;
  v9[3] = &unk_1005CD708;
  uint64_t v7 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  -[SDAutoUnlockAKSManager deleteLegacyCompanionIDs](self, "deleteLegacyCompanionIDs");

  return v7;
}

- (void)deleteLegacyCompanionIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDStorageFilePath](self, "companionIDStorageFilePath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0 && [v5 code] != (id)-1100 && objc_msgSend(v5, "code") != (id)260)
  {
    id v6 = [v5 code];
    if (v6 != (id)4)
    {
      uint64_t v7 = auto_unlock_log(v6);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000BB1E8();
      }
    }
  }
}

- (id)loadCompanionIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager companionIDStorageFilePath](self, "companionIDStorageFilePath"));
  if (v2)
  {
    id v17 = 0LL;
    id v3 = -[NSData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfFile:options:error:",  v2,  0LL,  &v17);
    id v4 = v17;
    id v5 = v4;
    if (v3)
    {
      id v16 = 0LL;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v3,  0LL,  0LL,  &v16));
      id v7 = v16;

      if (v6)
      {
        id v9 = [v6 mutableCopy];
        uint64_t v10 = auto_unlock_log(v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded companion IDs: %@", buf, 0xCu);
        }
      }

      else
      {
        uint64_t v13 = auto_unlock_log(v8);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000BB2A8();
        }
        id v9 = 0LL;
      }
    }

    else
    {
      if ([v4 code] == (id)-1100
        || [v5 code] == (id)260
        || (id v12 = [v5 code], v12 == (id)4))
      {
        id v9 = 0LL;
LABEL_16:

        goto LABEL_17;
      }

      uint64_t v15 = auto_unlock_log(v12);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        sub_1000BB248();
      }
      id v9 = 0LL;
      id v7 = v5;
    }

    id v5 = v7;
    goto LABEL_16;
  }

  id v5 = 0LL;
  id v9 = 0LL;
LABEL_17:

  return v9;
}

- (NSString)companionIDStorageFilePath
{
  companionIDStorageFilePath = self->_companionIDStorageFilePath;
  if (!companionIDStorageFilePath)
  {
    id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"Sharing"]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = 0LL;
    unsigned int v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v10 = v16;

    if (v9)
    {
      id v12 = (NSString *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"companion-paired-devices.plist"]);
      uint64_t v13 = self->_companionIDStorageFilePath;
      self->_companionIDStorageFilePath = v12;
    }

    else
    {
      uint64_t v14 = auto_unlock_log(v11);
      uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        sub_1000BB308();
      }
    }

    companionIDStorageFilePath = self->_companionIDStorageFilePath;
  }

  return companionIDStorageFilePath;
}

- (id)autoUnlockFolderPath
{
  id v2 = sub_100115468();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"AutoUnlock"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v12 = 0LL;
  unsigned __int8 v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    uint64_t v9 = auto_unlock_log(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000BB368();
    }
  }

  return v4;
}

+ (BOOL)useKeychainForLTKSyncing
{
  return 1;
}

- (BOOL)storeKeychainItemWithAttributeDictionary:(id)a3 updateDictionary:(id)a4 addDictionary:(id)a5
{
  id v7 = (const __CFDictionary *)a3;
  uint64_t v8 = (const __CFDictionary *)a4;
  uint64_t v9 = (const __CFDictionary *)a5;
  uint64_t v10 = SecItemAdd(v9, 0LL);
  if (!(_DWORD)v10)
  {
    uint64_t v16 = auto_unlock_log(v10);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      id v17 = "Added keychain item";
      id v18 = (uint8_t *)&v21;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }

- (id)escrowSecretForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  v4,  &off_1005F7888));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v5));

  uint64_t v8 = auto_unlock_log(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded escrowSecret from keychain", buf, 2u);
  }

  if (v6)
  {
    uint64_t v10 = -[SDAutoUnlockEscrowSecretInfo initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockEscrowSecretInfo),  "initWithData:",  v6);
    uint64_t v11 = v10;
    if (v10
      && (uint64_t v10 = (SDAutoUnlockEscrowSecretInfo *)-[SDAutoUnlockEscrowSecretInfo hasSecret](v10, "hasSecret"), (_DWORD)v10))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo secret](v11, "secret"));
      uint64_t v13 = auto_unlock_log(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using new secret", v28, 2u);
      }
    }

    else
    {
      uint64_t v15 = auto_unlock_log(v10);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000BB428(v11, v14);
      }
      uint64_t v12 = 0LL;
    }

- (BOOL)cachedEscrowSecretExistsForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDeviceID](self, "escrowSecretForDeviceID"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6 != 0LL;
}

- (BOOL)cachedEscrowSecretIsValidForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager escrowSecretForDeviceID](self, "escrowSecretForDeviceID"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6) {
    unsigned __int8 v7 = [v6 isValid];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)keyPairingIDForDeviceID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  a3,  &off_1005F7888));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v4));

  if (v5)
  {
    unsigned __int8 v6 = -[SDAutoUnlockEscrowSecretInfo initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockEscrowSecretInfo),  "initWithData:",  v5);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo pairingID](v6, "pairingID"));
  }

  else
  {
    unsigned __int8 v7 = 0LL;
  }

  return v7;
}

- (BOOL)storeEscrowSecret:(id)a3 pairingID:(id)a4 deviceID:(id)a5 requiresUnlock:(BOOL)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  a5,  &off_1005F7888));
  uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockEscrowSecretInfo);
  -[SDAutoUnlockEscrowSecretInfo setSecret:](v13, "setSecret:", v10);

  -[SDAutoUnlockEscrowSecretInfo setPairingID:](v13, "setPairingID:", v9);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo data](v13, "data"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, kSecValueData);

  uint64_t v15 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v11);
  -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v12);
  LOBYTE(self) = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:]( self,  "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:",  v11,  v12,  v15);

  return (char)self;
}

- (BOOL)escrowSecretExistsForDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  a3,  0LL));
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnPersistentRef];
  uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, 0LL);
  int v5 = v4;
  if ((_DWORD)v4 != -25308 && (_DWORD)v4 != -25300 && (_DWORD)v4)
  {
    uint64_t v6 = auto_unlock_log(v4);
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000BB4C8();
    }
  }

  if (v5) {
    BOOL v8 = v5 == -25308;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8;

  return v9;
}

- (id)escrowSecretCreationDateForDeviceID:(id)a3
{
  CFTypeRef result = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  a3,  0LL));
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
  uint64_t v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if ((_DWORD)v4 == -25300)
  {
    unsigned __int8 v7 = 0LL;
  }

  else
  {
    int v5 = v4;
    if ((_DWORD)v4)
    {
      uint64_t v8 = auto_unlock_log(v4);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Query for attributtes status: %d", buf, 8u);
      }

      unsigned __int8 v7 = 0LL;
    }

    else
    {
      uint64_t v6 = (os_log_s *)result;
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([(id)result objectForKeyedSubscript:kSecAttrCreationDate]);
    }
  }

  return v7;
}

- (void)deleteEscrowSecretForDeviceID:(id)a3
{
  id v4 = a3;
  int v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseLocalKeysDictionaryForDevice:type:]( self,  "baseLocalKeysDictionaryForDevice:type:",  v4,  0LL));
  uint64_t v6 = SecItemDelete(v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      uint64_t v9 = auto_unlock_log(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000BB528();
      }
    }

    else
    {
      uint64_t v7 = auto_unlock_log(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deleted escrow secret for device %@",  (uint8_t *)&v10,  0xCu);
      }
    }
  }
}

- (void)deleteAllEscrowSecrets
{
  id v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionary](self, "baseLocalKeysDictionary"));
  uint64_t v3 = SecItemDelete(v2);
  if ((_DWORD)v3 != -25300)
  {
    if ((_DWORD)v3)
    {
      uint64_t v6 = auto_unlock_log(v3);
      int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000BB588();
      }
    }

    else
    {
      uint64_t v4 = auto_unlock_log(v3);
      int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleted all escrow secrets", v7, 2u);
      }
    }
  }
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 0;
  if (-[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:modern:]( self,  "storeLongTermKey:forDeviceID:name:modern:",  v8,  v9,  v10,  0LL))
  {
    BOOL v11 = -[SDAutoUnlockAKSManager storeLongTermKey:forDeviceID:name:modern:]( self,  "storeLongTermKey:forDeviceID:name:modern:",  v8,  v9,  v10,  1LL);
  }

  return v11;
}

- (BOOL)storeLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5 modern:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v11));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v11));
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  kSecAttrAccessibleAfterFirstUnlock,  kSecAttrAccessible);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  @"Auto Unlock",  v12));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, kSecAttrLabel);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, kSecValueData);

  uint64_t v18 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v14);
  id v19 = -[NSMutableDictionary addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v15);
  uint64_t v21 = sharing_persistent_log(v19, v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = @"YES";
    *(_DWORD *)buf = 138413571;
    if (!v10) {
      uint64_t v23 = @"NO";
    }
    uint64_t v27 = v23;
    __int16 v28 = 2113;
    id v29 = v10;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    __int16 v34 = 2113;
    id v35 = v15;
    __int16 v36 = 2113;
    uint64_t v37 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Store LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)",  buf,  0x3Eu);
  }

  BOOL v24 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:]( self,  "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:",  v14,  v15,  v18);
  return v24;
}

- (BOOL)storeAttestedLongTermKey:(id)a3 forDeviceID:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager attestedDictionaryForDevice:](self, "attestedDictionaryForDevice:", v9));
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  kSecAttrAccessibleAfterFirstUnlock,  kSecAttrAccessible);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  @"Auto Unlock",  v10));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, kSecAttrLabel);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, kSecValueData);

  uint64_t v15 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v11);
  id v16 = -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v12);
  uint64_t v18 = sharing_persistent_log(v16, v17);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = @"YES";
    *(_DWORD *)buf = 138413571;
    if (!v8) {
      uint64_t v20 = @"NO";
    }
    BOOL v24 = v20;
    __int16 v25 = 2113;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v11;
    __int16 v31 = 2113;
    __int16 v32 = v12;
    __int16 v33 = 2113;
    __int16 v34 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Store attested LTK (ltkInfo exists: %@, ltkInfo: %{private}@, deviceID: %@ attributes: %@, update: %{private}@, add: %{private}@)",  buf,  0x3Eu);
  }

  BOOL v21 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:]( self,  "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:",  v11,  v12,  v15);
  return v21;
}

- (void)deleteRemoteLongTermKeyForDeviceID:(id)a3 modern:(BOOL)a4 tombstone:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6) {
    id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:]( self,  "modernSyncedDictionaryForDevice:",  v8));
  }
  else {
    id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager syncedDictionaryForDevice:]( self,  "syncedDictionaryForDevice:",  v8));
  }
  id v10 = v9;
  if (!a5) {
    -[__CFDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecUseTombstones);
  }
  uint64_t v11 = SecItemDelete(v10);
  if ((_DWORD)v11 != -25300)
  {
    int v12 = v11;
    if ((_DWORD)v11)
    {
      uint64_t v13 = auto_unlock_log(v11);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000BB5E8((uint64_t)v10, v12, v14);
      }
    }
  }
}

- (id)anyLongTermKeyForDeviceID:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 1LL));
  BOOL v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager longTermKeyForDevice:modern:](self, "longTermKeyForDevice:modern:", v4, 0LL));
  }
  id v8 = v7;

  return v8;
}

- (id)longTermKeyForDevice:(id)a3 modern:(BOOL)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", a3, a4));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ltk]);

  return v5;
}

- (id)longTermKeyIDForDeviceID:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager ltkInfoForDeviceID:](self, "ltkInfoForDeviceID:", a3));
  if ([v3 hasLtkID])
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v5 = objc_claimAutoreleasedReturnValue([v3 ltkID]);
    BOOL v6 = -[NSUUID initWithUUIDBytes:](v4, "initWithUUIDBytes:", [v5 bytes]);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)ltkInfoForDeviceID:(id)a3
{
  return -[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:](self, "ltkInfoForDeviceID:modern:", a3, 0LL);
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4
{
  return -[SDAutoUnlockAKSManager ltkInfoForDeviceID:modern:attested:]( self,  "ltkInfoForDeviceID:modern:attested:",  a3,  a4,  0LL);
}

- (id)ltkInfoForDeviceID:(id)a3 modern:(BOOL)a4 attested:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v5)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager attestedDictionaryForDevice:](self, "attestedDictionaryForDevice:", v8));
  }

  else if (v6)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager modernSyncedDictionaryForDevice:](self, "modernSyncedDictionaryForDevice:", v8));
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager syncedDictionaryForDevice:](self, "syncedDictionaryForDevice:", v8));
  }

  id v10 = (void *)v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v9));
  if (v11) {
    int v12 = -[SDAutoUnlockLTKInfo initWithData:](objc_alloc(&OBJC_CLASS___SDAutoUnlockLTKInfo), "initWithData:", v11);
  }
  else {
    int v12 = 0LL;
  }

  return v12;
}

- (void)deleteLocalAttestedLTK
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager localDeviceID](self, "localDeviceID"));
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager attestedDictionaryForDevice:]( self,  "attestedDictionaryForDevice:",  v3));

  uint64_t v5 = SecItemDelete(v4);
  if ((_DWORD)v5 != -25300)
  {
    if ((_DWORD)v5)
    {
      uint64_t v8 = auto_unlock_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000BB668();
      }
    }

    else
    {
      uint64_t v6 = auto_unlock_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleted local attested LTK", v9, 2u);
      }
    }
  }
}

- (void)updateRangingKeysIfNeccesary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceWasUnlockedOnce];

  if (v4)
  {
    CFTypeRef result = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionary](self, "baseRangingDictionary"));
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
    [v5 setObject:kSecAttrSynchronizableAny forKeyedSubscript:kSecAttrSynchronizable];
    [v5 setObject:kSecMatchLimitAll forKeyedSubscript:kSecMatchLimit];
    if (!SecItemCopyMatching((CFDictionaryRef)v5, &result))
    {
      uint64_t v18 = v5;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      uint64_t v6 = (id)result;
      id v7 = [v6 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
            int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kSecAttrIsInvisible]);

            if (!v12)
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kSecAttrService]);
              if (v13)
              {
                uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v13));
                uint64_t v15 = (void *)v14;
                if (v14)
                {
                  uint64_t v16 = auto_unlock_log(v14);
                  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    __int16 v25 = v13;
                    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating session key (device id: %@)",  buf,  0xCu);
                  }

                  -[SDAutoUnlockAKSManager storeRangingKey:forDeviceID:](self, "storeRangingKey:forDeviceID:", v15, v13);
                }
              }
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }

        while (v8);
      }

      uint64_t v5 = v18;
    }
  }

- (void)updateSessionKeys
{
  p_cachedSessionKeysLock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));

  if (!v4)
  {
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[SDAutoUnlockAKSManager setCachedSessionKeys:](self, "setCachedSessionKeys:", v5);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = [0 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(0LL);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

        if (!v12)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v10));
          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager deriveKeyFromSharedSecret:]( self,  "deriveKeyFromSharedSecret:",  v13));
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
            [v15 setObject:v14 forKeyedSubscript:v10];
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v6 = [0 countByEnumeratingWithState:&v20 objects:v26 count:16];
      id v7 = v6;
    }

    while (v6);
  }

  uint64_t v16 = auto_unlock_log(v6);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
    *(_DWORD *)buf = 138412290;
    __int16 v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cached session keys for devices %@", buf, 0xCu);
  }

  os_unfair_lock_unlock(p_cachedSessionKeysLock);
}

- (id)deriveKeyFromSharedSecret:(id)a3
{
  if (a3)
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v3 = kCryptoHashDescriptor_SHA512;
    id v4 = a3;
    id v5 = [v4 bytes];
    id v6 = [v4 length];

    CryptoHKDF(v3, v5, v6, "AutoUnlockSalt", 15LL, "AutoUnlockInfo", 15LL, 32LL, v9);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v9, 32LL));
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)sessionKeyExistsForDeviceID:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager sessionKeyForDeviceID:](self, "sessionKeyForDeviceID:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)sessionKeyForDeviceID:(id)a3
{
  id v4 = a3;
  p_cachedSessionKeysLock = &self->_cachedSessionKeysLock;
  os_unfair_lock_lock(&self->_cachedSessionKeysLock);
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);

    if (!v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager rangingKeyForDeviceID:](self, "rangingKeyForDeviceID:", v4));
      if (v9)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager deriveKeyFromSharedSecret:](self, "deriveKeyFromSharedSecret:", v9));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
        [v10 setObject:v8 forKeyedSubscript:v4];
      }

      else
      {
        uint64_t v8 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v11 = auto_unlock_log(v6);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000BB6C8();
    }

    uint64_t v8 = 0LL;
  }

  os_unfair_lock_unlock(p_cachedSessionKeysLock);

  return v8;
}

- (id)rangingKeyForDeviceID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:](self, "baseRangingDictionaryForDevice:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager keychainDataForQuery:](self, "keychainDataForQuery:", v4));

  return v5;
}

- (BOOL)storeRangingKey:(id)a3 forDeviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:](self, "baseRangingDictionaryForDevice:", v6));
  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, kSecValueData);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecAttrIsInvisible);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  kSecAttrAccessibleAfterFirstUnlock,  kSecAttrAccessible);
  uint64_t v10 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);
  uint64_t v11 = auto_unlock_log(-[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v9));
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138413059;
    id v17 = v6;
    __int16 v18 = 2113;
    __int128 v19 = v8;
    __int16 v20 = 2113;
    __int128 v21 = v9;
    __int16 v22 = 2113;
    __int128 v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Storing Session Key (deviceID: %@ attributes: %{private}@, update: %{private}@, add: %{private}@)",  (uint8_t *)&v16,  0x2Au);
  }

  BOOL v13 = -[SDAutoUnlockAKSManager storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:]( self,  "storeKeychainItemWithAttributeDictionary:updateDictionary:addDictionary:",  v8,  v9,  v10);
  if (v13)
  {
    os_unfair_lock_lock(&self->_cachedSessionKeysLock);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
    [v14 removeObjectForKey:v6];

    os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
    -[SDAutoUnlockAKSManager removeDeviceIDMissingSessionKey:](self, "removeDeviceIDMissingSessionKey:", v6);
    -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
  }

  return v13;
}

- (void)deleteRangingKeyForDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[SDAutoUnlockAKSManager baseRangingDictionaryForDevice:]( self,  "baseRangingDictionaryForDevice:",  v4));
  uint64_t v6 = SecItemDelete(v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      uint64_t v10 = auto_unlock_log(v6);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000BB6F4();
      }
    }

    else
    {
      uint64_t v7 = auto_unlock_log(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deleting session key (device ID: %@)",  (uint8_t *)&v12,  0xCu);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
      [v9 removeObjectForKey:v4];

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      -[SDAutoUnlockAKSManager removeDeviceIDMissingSessionKey:](self, "removeDeviceIDMissingSessionKey:", v4);
      -[SDAutoUnlockAKSManager updateSessionKeys](self, "updateSessionKeys");
    }
  }
}

- (void)deleteAllRangingKeys
{
  uint64_t v3 = auto_unlock_log(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting all ranging keys", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v5 setObject:@"com.apple.continuity.auto-unlock.rangingkeys" forKeyedSubscript:kSecAttrAccount];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecUseDataProtectionKeychain];
  uint64_t v6 = SecItemDelete((CFDictionaryRef)v5);
  if ((_DWORD)v6 != -25300)
  {
    if ((_DWORD)v6)
    {
      uint64_t v10 = auto_unlock_log(v6);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000BB754();
      }
    }

    else
    {
      uint64_t v7 = auto_unlock_log(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted all ranging keys", v12, 2u);
      }

      os_unfair_lock_lock(&self->_cachedSessionKeysLock);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager cachedSessionKeys](self, "cachedSessionKeys"));
      [v9 removeAllObjects];

      os_unfair_lock_unlock(&self->_cachedSessionKeysLock);
      -[SDAutoUnlockAKSManager clearAllDeviceIDsMissingSessionKeys](self, "clearAllDeviceIDsMissingSessionKeys");
    }
  }
}

- (id)keychainDataForQuery:(id)a3
{
  CFTypeRef result = 0LL;
  id v3 = a3;
  id v4 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v3);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnData);
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
  if ((_DWORD)v5 == -25300)
  {
LABEL_7:
    uint64_t v7 = 0LL;
    goto LABEL_8;
  }

  int v6 = v5;
  if ((_DWORD)v5)
  {
    uint64_t v8 = auto_unlock_log(v5);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Query status: %d", buf, 8u);
    }

    goto LABEL_7;
  }

  uint64_t v7 = (void *)result;
LABEL_8:

  return v7;
}

- (id)baseRangingDictionaryForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseRangingDictionary](self, "baseRangingDictionary"));
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  return v5;
}

- (id)baseRangingDictionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v2 setObject:@"com.apple.continuity.auto-unlock.rangingkeys" forKeyedSubscript:kSecAttrAccount];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecUseDataProtectionKeychain];
  return v2;
}

- (id)syncedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseSyncedDictionary](self, "baseSyncedDictionary"));
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  return v5;
}

- (id)baseSyncedDictionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v2 setObject:@"com.apple.continuity.auto-unlock.sync" forKeyedSubscript:kSecAttrAccount];
  return v2;
}

- (id)modernSyncedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseModernSyncedDictionary](self, "baseModernSyncedDictionary"));
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  return v5;
}

- (id)attestedDictionaryForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v5 setObject:@"com.apple.continuity.auto-unlock.attested" forKeyedSubscript:kSecAttrAccount];
  [v5 setObject:v4 forKeyedSubscript:kSecAttrService];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrIsInvisible];
  return v5;
}

- (id)baseModernSyncedDictionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v2 setObject:@"com.apple.continuity.auto-unlock.sync" forKeyedSubscript:kSecAttrAccount];
  [v2 setObject:@"AutoUnlock" forKeyedSubscript:kSecAttrSyncViewHint];
  return v2;
}

- (id)baseLocalKeysDictionaryForDevice:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseLocalKeysDictionary](self, "baseLocalKeysDictionary"));
  [v8 setObject:v7 forKeyedSubscript:kSecAttrService];

  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:kSecAttrKeyType];
  }

  return v8;
}

- (id)baseLocalKeysDictionary
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSManager baseDictionary](self, "baseDictionary"));
  [v2 setObject:@"com.apple.continuity.auto-unlock.localkeys" forKeyedSubscript:kSecAttrAccount];
  return v2;
}

- (id)baseDictionary
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  kSecClassGenericPassword,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  @"com.apple.continuity.unlock",  kSecAttrAccessGroup);
  return v2;
}

- (void)updateDynamicStoreEnabled
{
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (BOOL)wristDetectDisabled
{
  return self->_wristDetectDisabled;
}

- (void)setWristDetectDisabled:(BOOL)a3
{
  self->_wristDetectDisabled = a3;
}

- (NSMutableDictionary)activeAKSSessions
{
  return self->_activeAKSSessions;
}

- (void)setActiveAKSSessions:(id)a3
{
}

- (NSData)localAttestedLTK
{
  return self->_localAttestedLTK;
}

- (void)setLocalAttestedLTK:(id)a3
{
}

- (BOOL)autoUnlockDisabledDueToManagement
{
  return self->_autoUnlockDisabledDueToManagement;
}

- (void)setAutoUnlockDisabledDueToManagement:(BOOL)a3
{
  self->_autoUnlockDisabledDueToManagement = a3;
}

- (BOOL)t208Machine
{
  return self->_t208Machine;
}

- (void)setT208Machine:(BOOL)a3
{
  self->_t208Machine = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (OS_dispatch_source)keybagAssertionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setKeybagAssertionTimer:(id)a3
{
}

- (NSMutableDictionary)remoteLTKs
{
  return self->_remoteLTKs;
}

- (void)setRemoteLTKs:(id)a3
{
}

- (NSMutableDictionary)cachedSessions
{
  return self->_cachedSessions;
}

- (void)setCachedSessions:(id)a3
{
}

- (NSMutableDictionary)cachedSessionKeys
{
  return self->_cachedSessionKeys;
}

- (void)setCachedSessionKeys:(id)a3
{
}

- (NSMutableDictionary)watchIDsToPairingRecords
{
  return self->_watchIDsToPairingRecords;
}

- (void)setWatchIDsToPairingRecords:(id)a3
{
}

- (NSMutableDictionary)preferredRemoteLTKForDeviceID
{
  return self->_preferredRemoteLTKForDeviceID;
}

- (void)setPreferredRemoteLTKForDeviceID:(id)a3
{
}

- (NSMutableDictionary)escrowSecretForDeviceID
{
  return self->_escrowSecretForDeviceID;
}

- (void)setEscrowSecretForDeviceID:(id)a3
{
}

- (NSMutableArray)watchIDsMissingSessionKey
{
  return self->_watchIDsMissingSessionKey;
}

- (void)setWatchIDsMissingSessionKey:(id)a3
{
}

- (void)setRemoteLTKStorageFilePath:(id)a3
{
}

- (void)setWatchIDsToPairingRecordsStorageFilePath:(id)a3
{
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setKeybagAssertion:(id)a3
{
}

- (void)setCompanionIDStorageFilePath:(id)a3
{
}

- (void)setWatchIDToCompanionIDStorageFilePath:(id)a3
{
}

- (os_unfair_lock_s)cachedSessionKeysLock
{
  return self->_cachedSessionKeysLock;
}

- (void).cxx_destruct
{
}

@end