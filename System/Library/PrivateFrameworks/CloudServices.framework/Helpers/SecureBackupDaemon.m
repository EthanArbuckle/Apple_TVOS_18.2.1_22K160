@interface SecureBackupDaemon
- (BOOL)_backupEnabled;
- (BOOL)_restoreKeychainWithBackupPassword:(id)a3 keybagDigest:(id)a4 error:(id *)a5;
- (BOOL)_restoreView:(id)a3 password:(id)a4 keybagDigest:(id)a5 restoredViews:(id)a6 error:(id *)a7;
- (BOOL)_usesEscrow;
- (BOOL)backupAllowed;
- (BOOL)backupSetConfirmedManifest:(id)a3 digest:(id)a4 manifest:(id)a5 error:(id *)a6;
- (BOOL)backupSliceKeybagHasRecoveryKey:(id)a3;
- (BOOL)backupWithChanges:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)backupWithRegisteredBackupViewWithError:(id)a3 error:(id *)a4;
- (BOOL)backupWithRegisteredBackupsWithError:(id *)a3 handler:(id)a4;
- (BOOL)forceICDP;
- (BOOL)hasRecoveryKeyInKVS:(id)a3 error:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)needInitialBackup;
- (BOOL)pendingNotification;
- (BOOL)registerSingleRecoverySecret:(id)a3 iCDP:(BOOL)a4 error:(id *)a5;
- (BOOL)removeRecoveryKey:(id *)a3;
- (BOOL)verifyRKWithKeyBag:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4;
- (NSData)iCDPKeybag;
- (NSMutableDictionary)handledNotifications;
- (NSMutableDictionary)ignoredNotifications;
- (NSString)cachedPassphrase;
- (NSString)cachedRecordID;
- (NSString)cachedRecordIDPassphrase;
- (NSString)iCloudEnvironment;
- (NSURL)cacheDirURL;
- (NSURL)cachedKeychainURL;
- (NSURL)cachedManifestURL;
- (OS_dispatch_queue)backupQueue;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)kvsQueue;
- (SBEscrowOperationLogger)operationsLogger;
- (SecureBackupDaemon)initWithOperationsLogger:(id)a3;
- (id)_EMCSBackup;
- (id)_EMCSBackupDictForKeybagDigest:(id)a3;
- (id)_KVSKeybag;
- (id)_consumeBackupJournal;
- (id)_consumeFullBackupForRecordID:(id)a3;
- (id)_consumeViewBackup:(id)a3 recordID:(id)a4;
- (id)_createBackupKeybagWithPassword:(id)a3;
- (id)_gestaltValueForKey:(__CFString *)a3;
- (id)_getDERBackupFromKVS;
- (id)_getICDPBackupFromKVS:(id)a3 forView:(id)a4;
- (id)_getKeychainItemForKey:(id)a3 status:(int *)a4;
- (id)_getLastBackupTimestamp;
- (id)_getProtectedKeychainAndKeybagDigestFromKVS:(id *)a3;
- (id)_metadata;
- (id)_pushCachedKeychainToKVS;
- (id)_pushCachedKeychainToKVSForView:(id)a3 recordID:(id)a4;
- (id)_recordIDFromLabel:(id)a3 withPrefix:(id)a4 suffix:(id)a5;
- (id)allViews;
- (id)cachedPassphraseForFD:(int)a3;
- (id)cachedRecoveryKey;
- (id)circleChangedNotification;
- (id)copyBackupKey:(id)a3;
- (id)copyBackupKeyForNewDeviceRecoverySecret:(id)a3 error:(id *)a4;
- (id)copyEncodedData:(id)a3 error:(id *)a4;
- (id)copyKVSState;
- (id)copyMyPeerID;
- (id)copyMyPeerIDWithError:(id *)a3;
- (id)copyMyPeerInfo:(id *)a3;
- (id)copyMyPeerWithNewDeviceRecoverySecret:(id)a3 error:(id *)a4;
- (id)copyOSVersion:(id)a3;
- (id)copyPeerID:(id)a3;
- (id)copySerialNumber:(id)a3;
- (id)createDERDataFromPlist:(id)a3;
- (id)createEncodedDirectBackupSliceKeybagFromData:(id)a3 error:(id *)a4;
- (id)createPeerInfoFromData:(id)a3 error:(id *)a4;
- (id)createPlistFromDERData:(id)a3;
- (id)createiCloudRecoveryPasswordWithError:(id *)a3;
- (id)currentViews;
- (id)derDataFromDict:(id)a3;
- (id)encodedStatsForViews:(id)a3;
- (id)fetchPRK:(id *)a3;
- (id)filteriCDPRecords:(id)a3;
- (id)getPendingEscrowRequest:(id *)a3;
- (id)keysOfEntriesContainingObject:(id)a3 backups:(id)a4;
- (id)kvs;
- (id)makeRecordCandidate:(id)a3 error:(id *)a4;
- (id)massageIncomingMetadataFromInfo:(id)a3;
- (id)massageOutgoingMetadataFromRequest:(id)a3;
- (id)normalizeSMSTarget:(id)a3 error:(id *)a4;
- (id)removeRKFromKeyBag:(id)a3 error:(id *)a4;
- (id)restoreBackup:(id)a3 withName:(id)a4 keybagDigest:(id)a5 keybag:(id)a6 password:(id)a7;
- (id)restoreEMCSBackup:(id)a3 keybag:(id)a4 password:(id)a5;
- (id)restoreEMCSBackup:(id)a3 withPassword:(id)a4;
- (id)secureBackups;
- (id)sortRecordsByBottleID:(id)a3;
- (id)tagStaleBottleRecords:(id)a3 suggestedBottles:(id)a4;
- (int)cachedPassphraseFD;
- (int)cachedRecordIDPassphraseFD;
- (int)cachedRecoveryKeyFD;
- (int)getPasscodeRequestFlag:(unint64_t *)a3;
- (int)notifyToken;
- (int)setPasscodeRequestFlag:(unint64_t)a3;
- (int)storeCachedPassphrase:(id)a3;
- (int64_t)compare:(id)a3 with:(id)a4 backups:(id)a5;
- (int64_t)compareEscrowDatesBetweenCurrentRecord:(id)a3 andCandidateRecord:(id)a4;
- (os_state_data_s)_stateCapture;
- (void)_backupCloudIdentityKeychainViewAndPushToKVS;
- (void)_backupCloudIdentityKeychainViewAndPushToKVSCheckBackupEnabled:(BOOL)a3;
- (void)_backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey;
- (void)_backupFullKeychain;
- (void)_backupFullKeychainWithReply:(id)a3;
- (void)_backupKeychain;
- (void)_backupKeychainFully:(BOOL)a3 reply:(id)a4;
- (void)_deleteAlliCDPRecordsWithContext:(id)a3;
- (void)_disableBackup;
- (void)_enumerateICDPBackupsUsingBlock:(id)a3;
- (void)_fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4;
- (void)_getAccountInfoWithRequest:(id)a3 reply:(id)a4;
- (void)_recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 reply:(id)a5;
- (void)_recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 reply:(id)a5;
- (void)_recoverWithRequest:(id)a3 reply:(id)a4;
- (void)_removeCachedKeychain;
- (void)_removeKVSKeybag;
- (void)_removeKeychainItemForKey:(id)a3;
- (void)_removeMetadata;
- (void)_removeProtectedKeychain;
- (void)_removeUsesEscrow;
- (void)_removeVeeTwoBackup;
- (void)_restoreKeychainAsyncWithBackupBag:(id)a3 password:(id)a4 keybagDigest:(id)a5 haveBottledPeer:(BOOL)a6 restoredViews:(id)a7 viewsNotToBeRestored:(id)a8;
- (void)_restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7;
- (void)_saveKeychainItem:(id)a3 forKey:(id)a4;
- (void)_setAutobackupEnabled;
- (void)_setAutobackupEnabledWithReply:(id)a3;
- (void)_setBackupEnabled:(BOOL)a3 iCDP:(BOOL)a4;
- (void)_setEMCSBackup:(id)a3 keybag:(id)a4;
- (void)_setKVSKeybag:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setUsesEscrow:(BOOL)a3;
- (void)_stashRecoveryDataWithRequest:(id)a3 reply:(id)a4;
- (void)_storeProtectedKeychainInKVS:(id)a3 keybagDigest:(id)a4;
- (void)_storeVeeTwoBackupInKVS:(id)a3 forViewName:(id)a4 withKeyStore:(id)a5 manifestDigest:(id)a6 keybagDigest:(id)a7;
- (void)backOffDateWithRequest:(id)a3 reply:(id)a4;
- (void)backupForRecoveryKeyWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5;
- (void)backupForRecoveryKeyWithInfoInDaemon:(id)a3 reply:(id)a4;
- (void)backupWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5;
- (void)backupWithInfo:(id)a3 reply:(id)a4;
- (void)beginHSA2PasscodeRequest:(id)a3 desirePasscodeImmediately:(BOOL)a4 uuid:(id)a5 reason:(id)a6 reply:(id)a7;
- (void)cachePassphraseWithRequest:(id)a3 reply:(id)a4;
- (void)cachePassphraseWithRequestAsync:(id)a3;
- (void)cacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4;
- (void)changeSMSTargetWithRequest:(id)a3 reply:(id)a4;
- (void)clearNotifyToken;
- (void)createICDPRecordWithRequest:(id)a3 recordContents:(id)a4 reply:(id)a5;
- (void)daemonPasscodeRequestOpinion:(id)a3;
- (void)deleteAlliCDPRecordsWithRequest:(id)a3 reply:(id)a4;
- (void)disableWithRequest:(id)a3 reply:(id)a4;
- (void)disableiCDPBackup;
- (void)doEnableEscrowMultiICSCWithRequest:(id)a3 reply:(id)a4;
- (void)doSynchronize;
- (void)enableGuitarfishTokenWithRequest:(id)a3 reply:(id)a4;
- (void)enableWithRequest:(id)a3 reply:(id)a4;
- (void)fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4;
- (void)garbageCollectEMCSBackupsExcluding:(id)a3;
- (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4;
- (void)getAccountInfoWithRequest:(id)a3 reply:(id)a4;
- (void)getCertificatesWithRequest:(id)a3 reply:(id)a4;
- (void)getCountrySMSCodesWithRequest:(id)a3 reply:(id)a4;
- (void)handleEscrowStoreResults:(id)a3 escrowError:(id)a4 request:(id)a5 peerID:(id)a6 newRecordMetadata:(id)a7 backupKeybag:(id)a8 reply:(id)a9;
- (void)handleNotification:(id)a3;
- (void)isRecoveryKeySetInDaemon:(id)a3;
- (void)knownICDPFederations:(id)a3;
- (void)moveToFederationAllowed:(id)a3 altDSID:(id)a4 reply:(id)a5;
- (void)notificationInfoWithReply:(id)a3;
- (void)notificationOccurred:(id)a3;
- (void)prepareHSA2EscrowRecordContents:(id)a3 usesComplexPassphrase:(BOOL)a4 reply:(id)a5;
- (void)recordIDAndMetadataForSilentAttempt:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 reply:(id)a6;
- (void)recordNotification:(id)a3 handled:(BOOL)a4;
- (void)recoverEscrowWithRequest:(id)a3 reply:(id)a4;
- (void)recoverGuitarfishTokenWithRequest:(id)a3 reply:(id)a4;
- (void)recoverRecordContentsWithRequest:(id)a3 reply:(id)a4;
- (void)recoverSilentWithCDPContextInDaemon:(id)a3 allRecords:(id)a4 reply:(id)a5;
- (void)recoverWithCDPContextInDaemon:(id)a3 escrowRecord:(id)a4 reply:(id)a5;
- (void)recoverWithRequest:(id)a3 reply:(id)a4;
- (void)registerForNotifyEvent:(id)a3;
- (void)removeRecoveryKeyFromBackupInDaemon:(id)a3;
- (void)restoreBackupName:(id)a3 peerID:(id)a4 keybag:(id)a5 password:(id)a6 backup:(id)a7 reply:(id)a8;
- (void)restoreKeychainAsyncWithPasswordInDaemon:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7;
- (void)restoreKeychainWithBackupPasswordInDaemon:(id)a3 reply:(id)a4;
- (void)saveTermsAcceptance:(id)a3 reply:(id)a4;
- (void)setBackOffDateWithRequest:(id)a3 reply:(id)a4;
- (void)setBackupAllowed:(BOOL)a3;
- (void)setCacheDirURL:(id)a3;
- (void)setCachedPassphrase:(id)a3;
- (void)setCachedPassphraseFD:(int)a3;
- (void)setCachedRecordID:(id)a3;
- (void)setCachedRecordIDPassphrase:(id)a3;
- (void)setCachedRecordIDPassphraseFD:(int)a3;
- (void)setCachedRecoveryKey:(id)a3;
- (void)setCachedRecoveryKeyFD:(int)a3;
- (void)setHandledNotifications:(id)a3;
- (void)setICloudEnvironment:(id)a3;
- (void)setIgnoredNotifications:(id)a3;
- (void)setNeedInitialBackup:(BOOL)a3;
- (void)setPasscodeMetadata:(id)a3 passphraseType:(int)a4;
- (void)setPendingNotification:(BOOL)a3;
- (void)setupNotifyEvents;
- (void)sortForMatchingPassphraseLengthAndPlatform:(id)a3 secureBackups:(id)a4 passphraseLength:(unint64_t)a5 platform:(unint64_t)a6 reply:(id)a7;
- (void)startSMSChallengeWithRequest:(id)a3 reply:(id)a4;
- (void)stashRecoveryDataWithRequest:(id)a3 reply:(id)a4;
- (void)stateCaptureWithReply:(id)a3;
- (void)storeDERBackupInKVS:(id)a3;
- (void)synchronizeKVSWithHandler:(id)a3;
- (void)uncachePassphraseWithRequest:(id)a3 reply:(id)a4;
- (void)uncachePassphraseWithRequestAsync:(id)a3;
- (void)uncacheRecordIDPassphrase;
- (void)uncacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4;
- (void)unregisterForNotifyEvent:(id)a3;
- (void)updateMetadataWithRequest:(id)a3 reply:(id)a4;
- (void)verifyRecoveryKeyInDaemon:(id)a3 reply:(id)a4;
@end

@implementation SecureBackupDaemon

- (id)_createBackupKeybagWithPassword:(id)a3
{
  int v18 = -1;
  id v3 = a3;
  id v4 = [v3 bytes];
  int v5 = [v3 length];

  uint64_t v6 = sub_100042FD8((uint64_t)v4, v5, 4u, &v18);
  if ((_DWORD)v6)
  {
    int v7 = v6;
    uint64_t v8 = CloudServicesLog(v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v21) = 67109120;
      HIDWORD(v21) = v7;
      v10 = "ask_create_bag() returned %d";
      v11 = (uint8_t *)&v21;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 8u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  int v17 = 1;
  v21 = 0LL;
  uint64_t v12 = sub_100043144(v18, &v21, &v17);
  if ((_DWORD)v12)
  {
    int v13 = v12;
    uint64_t v14 = CloudServicesLog(v12);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v13;
      v10 = "aks_save_bag() returned %d";
      v11 = buf;
      goto LABEL_7;
    }

- (void)_saveKeychainItem:(id)a3 forKey:(id)a4
{
  v14[0] = kSecAttrAccount;
  v14[1] = kSecAttrService;
  v15[0] = a4;
  v15[1] = @"SecureBackupService";
  v14[2] = kSecClass;
  v14[3] = kSecAttrSynchronizable;
  v15[2] = kSecClassGenericPassword;
  v15[3] = &__kCFBooleanTrue;
  v14[4] = kSecAttrAccessible;
  v14[5] = kSecValueData;
  v15[4] = kSecAttrAccessibleAfterFirstUnlock;
  v15[5] = a3;
  id v5 = a4;
  id v6 = a3;
  int v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  6LL));

  uint64_t v8 = SecItemAdd(v7, 0LL);
  if ((_DWORD)v8)
  {
    int v9 = v8;
    uint64_t v10 = CloudServicesLog(v8);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SecItemAdd() returned %ld",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)_removeKeychainItemForKey:(id)a3
{
  v11[0] = kSecAttrAccount;
  v11[1] = kSecAttrService;
  v12[0] = a3;
  v12[1] = @"SecureBackupService";
  v11[2] = kSecClass;
  v11[3] = kSecAttrSynchronizable;
  v12[2] = kSecClassGenericPassword;
  v12[3] = &__kCFBooleanTrue;
  id v3 = a3;
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));

  uint64_t v5 = SecItemDelete(v4);
  if ((_DWORD)v5)
  {
    int v6 = v5;
    uint64_t v7 = CloudServicesLog(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SecItemDelete() returned %ld",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (id)_getKeychainItemForKey:(id)a3 status:(int *)a4
{
  id v5 = a3;
  CFTypeRef result = 0LL;
  v16[0] = kSecAttrAccount;
  v16[1] = kSecAttrService;
  v17[0] = v5;
  v17[1] = @"SecureBackupService";
  v16[2] = kSecClass;
  v16[3] = kSecAttrSynchronizable;
  v17[2] = kSecClassGenericPassword;
  v17[3] = &__kCFBooleanTrue;
  v16[4] = kSecReturnData;
  v17[4] = &__kCFBooleanTrue;
  int v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  5LL));
  uint64_t v7 = SecItemCopyMatching(v6, &result);
  int v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  if ((_DWORD)v7 != -25300 && (_DWORD)v7)
  {
    uint64_t v10 = CloudServicesLog(v7);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SecItemCopyMatching() returned %ld",  buf,  0xCu);
    }

    int v9 = 0LL;
  }

  else
  {
    int v9 = (void *)result;
  }

  return v9;
}

- (void)_storeProtectedKeychainInKVS:(id)a3 keybagDigest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities posixDateFormatter](&OBJC_CLASS___CSDateUtilities, "posixDateFormatter"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringFromDate:v10]);

  uint64_t v13 = CloudServicesLog(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    int v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Storing keychain in KVS @%@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v15 setObject:v11 forKeyedSubscript:kSecureBackupTimestampKey];
  [v15 setObject:v7 forKeyedSubscript:@"com.apple.securebackup.keychain"];

  [v15 setObject:v6 forKeyedSubscript:kSecureBackupKeybagDigestKey];
  [v8 setDictionary:v15 forKey:@"com.apple.securebackup.record"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (void)_storeVeeTwoBackupInKVS:(id)a3 forViewName:(id)a4 withKeyStore:(id)a5 manifestDigest:(id)a6 keybagDigest:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v40 = a7;
  context = objc_autoreleasePoolPush();
  uint64_t v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@.%@",  @"com.apple.icdp.backup",  v12);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryForKey:v15]);
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"keybag"]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"backup"]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"backup"]);
  v37 = (void *)v17;
  if ([v18 isEqual:v19])
  {
    id v20 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"keybag"]);
    unsigned int v22 = [v21 isEqual:v17];

    id v14 = v20;
    if (v22)
    {
      uint64_t v24 = CloudServicesLog(v23);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "skipping identical backup for %@",  buf,  0xCu);
      }

      goto LABEL_9;
    }
  }

  else
  {
  }

  v25 = objc_alloc_init(&OBJC_CLASS___NSDate);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "rangeOfString:", @"-tomb")));
  id v35 = v14;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v14 hexString]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 substringToIndex:6]);

  v29 = (void *)objc_claimAutoreleasedReturnValue([v40 hexString]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 substringToIndex:6]);

  uint64_t v32 = CloudServicesLog(v31);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v28;
    __int16 v45 = 2112;
    v46 = v30;
    __int16 v47 = 2112;
    v48 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "backing up manifest digest %@, keybag digest %@, view %@",  buf,  0x20u);
  }

  v41[0] = kSecureBackupTimestampKey;
  v41[1] = @"com.apple.securebackup.keychain";
  v42[0] = v25;
  v42[1] = v11;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
  [v13 setDictionary:v34 forKey:v15];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");

  id v14 = v35;
LABEL_9:

  objc_autoreleasePoolPop(context);
}

- (void)_removeCachedKeychain
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedKeychainURL](self, "cachedKeychainURL"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedKeychainURL](self, "cachedKeychainURL"));
    id v11 = 0LL;
    unsigned __int8 v6 = [v4 removeItemAtURL:v5 error:&v11];
    id v7 = v11;

    if ((v6 & 1) == 0)
    {
      id v8 = [v7 code];
      if (v8 != (id)4)
      {
        uint64_t v9 = CloudServicesLog(v8);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v13 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "error removing keychain: %@", buf, 0xCu);
        }
      }
    }
  }

- (id)derDataFromDict:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011510;
  v8[3] = &unk_1000690D0;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon createDERDataFromPlist:](self, "createDERDataFromPlist:", v5));
  return v6;
}

- (void)storeDERBackupInKVS:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities posixDateFormatter](&OBJC_CLASS___CSDateUtilities, "posixDateFormatter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringFromDate:v7]);

  uint64_t v10 = CloudServicesLog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Storing DER keychain in KVS @%@",  (uint8_t *)&v13,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v12 setObject:v8 forKeyedSubscript:kSecureBackupTimestampKey];
  [v12 setObject:v4 forKeyedSubscript:@"com.apple.securebackup.keychain"];

  [v5 setDictionary:v12 forKey:@"DERBackup"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (id)_pushCachedKeychainToKVSForView:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v9 = -[SecureBackupViewStore initWithViewName:recordID:]( objc_alloc(&OBJC_CLASS___SecureBackupViewStore),  "initWithViewName:recordID:",  v6,  v7);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore backupData](v9, "backupData"));
  if (v10)
  {
    if ([v6 isEqualToString:@"KeychainV0-tomb"])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon _getProtectedKeychainAndKeybagDigestFromKVS:]( self,  "_getProtectedKeychainAndKeybagDigestFromKVS:",  0LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore backupDict](v9, "backupDict"));
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore keybagDigest](v9, "keybagDigest"));
      id v14 = v11;
      id v15 = v12;
      if (v14 == v15) {
        goto LABEL_6;
      }
      id v16 = [v14 hash];
      if (v16 != [v15 hash]) {
        goto LABEL_16;
      }
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v17));

      int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));

      unsigned int v31 = [v32 isEqualToSet:v19];
      if (v31)
      {
LABEL_6:
      }

      else
      {
LABEL_16:

        -[SecureBackupDaemon _storeProtectedKeychainInKVS:keybagDigest:]( self,  "_storeProtectedKeychainInKVS:keybagDigest:",  v15,  v13);
      }
    }

    else
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore keybag](v9, "keybag"));
      uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore recordID](v9, "recordID"));
      uint64_t v23 = (void *)v22;
      if (v14 && v22)
      {
        v36[0] = @"backup";
        v36[1] = @"keybag";
        v37[0] = v10;
        v37[1] = v14;
        v36[2] = @"recordID";
        v37[2] = v22;
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupViewStore manifestHash](v9, "manifestHash"));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 sha1Digest]);
        v33 = v23;
        v27 = v8;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v14 sha1Digest]);
        -[SecureBackupDaemon _storeVeeTwoBackupInKVS:forViewName:withKeyStore:manifestDigest:keybagDigest:]( self,  "_storeVeeTwoBackupInKVS:forViewName:withKeyStore:manifestDigest:keybagDigest:",  v24,  v6,  v27,  v26,  v28);

        id v8 = v27;
        uint64_t v23 = v33;
      }

      else
      {
        uint64_t v29 = CloudServicesLog(v22);
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100044C58();
        }
      }
    }
  }

  else
  {
    uint64_t v20 = CloudServicesLog(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "skipping empty backup for view %@",  buf,  0xCu);
    }
  }

  -[SecureBackupViewStore closeStore](v9, "closeStore");

  return 0LL;
}

- (id)_pushCachedKeychainToKVS
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100011D74;
  v26 = sub_100011D84;
  id v27 = 0LL;
  id obj = 0LL;
  id v3 = -[SecureBackupDaemon copyMyPeerInfo:](self, "copyMyPeerInfo:", &obj);
  objc_storeStrong(&v27, obj);
  if (v3)
  {
    id v5 = -[SecureBackupDaemon copyPeerID:](self, "copyPeerID:", v3);
    uint64_t v6 = CloudServicesLog(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "backing up peer ID %@", buf, 0xCu);
    }

    id v8 = -[SecureBackupDaemon copyBackupKey:](self, "copyBackupKey:", v3);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[os_log_s sha1Digest](v8, "sha1Digest"));
      uint64_t v11 = CloudServicesLog(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "using backup key: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v4);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044CF0();
    }
    id v5 = @"unknown";
  }

  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvsQueue](self, "kvsQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100011D8C;
  v18[3] = &unk_100069120;
  v19 = v5;
  uint64_t v20 = &v22;
  v18[4] = self;
  id v15 = v5;
  dispatch_sync(v14, v18);

  id v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (void)_removeProtectedKeychain
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"com.apple.securebackup.record"]);
  uint64_t v5 = CloudServicesLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing backup record from @%@",  (uint8_t *)&v8,  0xCu);
  }

  [v3 removeObjectForKey:@"com.apple.securebackup.record"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
  -[SecureBackupDaemon _removeCachedKeychain](self, "_removeCachedKeychain");
}

- (id)_getProtectedKeychainAndKeybagDigestFromKVS:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryForKey:@"com.apple.securebackup.record"]);
  uint64_t v6 = CloudServicesLog(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Retrieving keychain from @%@",  (uint8_t *)&v11,  0xCu);
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);

  return v9;
}

- (id)_getICDPBackupFromKVS:(id)a3 forView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@.%@-tomb",  @"com.apple.icdp.backup",  v5);

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryForKey:v7]);
  return v8;
}

- (void)_enumerateICDPBackupsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvsQueue](self, "kvsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000122C8;
  block[3] = &unk_100069148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_removeVeeTwoBackup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"com.apple.icdp.backup"]);
  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing view-based backup from @%@",  (uint8_t *)&v8,  0xCu);
  }

  [v3 removeObjectForKey:@"com.apple.icdp.backup"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (id)_getDERBackupFromKVS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"DERBackup"]);
  uint64_t v4 = CloudServicesLog(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Retrieving keychain from @%@",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  return v7;
}

- (id)_getLastBackupTimestamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:@"com.apple.securebackup.record"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kSecureBackupTimestampKey]);

  return v4;
}

- (void)_setBackupEnabled:(BOOL)a3 iCDP:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = _os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn");
  if ((_DWORD)v7)
  {
    uint64_t v8 = CloudServicesLog(v7);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SOS Compatibility Mode enabled, ignoring setting backup enabled bit",  (uint8_t *)v14,  2u);
    }
  }

  else
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
    uint64_t v10 = @"com.apple.securebackup.enabled";
    if (v4) {
      uint64_t v10 = @"com.apple.icdpbackup.enabled";
    }
    int v11 = v10;
    uint64_t v12 = CloudServicesLog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109376;
      v14[1] = -[os_log_s BOOLForKey:](v9, "BOOLForKey:", v11);
      __int16 v15 = 1024;
      BOOL v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Changing backup status %u->%u",  (uint8_t *)v14,  0xEu);
    }

    -[os_log_s setBool:forKey:](v9, "setBool:forKey:", v5, v11);
    if (v5) {
      -[os_log_s setString:forKey:](v9, "setString:forKey:", @"1", @"BackupVersion");
    }
    else {
      -[os_log_s removeObjectForKey:](v9, "removeObjectForKey:", @"BackupVersion");
    }
    -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
  }
}

- (BOOL)_backupEnabled
{
  uint64_t v3 = _os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn");
  if ((_DWORD)v3)
  {
    uint64_t v4 = CloudServicesLog(v3);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SOS Compatibility Mode enabled, backup is no longer supported",  v9,  2u);
    }

    return 0;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
    else {
      unsigned __int8 v6 = [v7 BOOLForKey:@"com.apple.icdpbackup.enabled"];
    }
  }

  return v6;
}

- (void)_setUsesEscrow:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v6 = CloudServicesLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = [v5 BOOLForKey:@"BackupUsesEscrow"];
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Changing escrow usage %u->%u",  (uint8_t *)v8,  0xEu);
  }

  [v5 setBool:v3 forKey:@"BackupUsesEscrow"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (BOOL)_usesEscrow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"BackupUsesEscrow"];

  return v3;
}

- (void)_removeUsesEscrow
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  [v3 removeObjectForKey:@"BackupUsesEscrow"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v6 = CloudServicesLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  uint64_t v9 = kSecureBackupMetadataKey;
  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kSecureBackupMetadataKey]);
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Changing metadata old: %@\n\nnew: %@",  (uint8_t *)&v11,  0x16u);
  }

  [v5 setDictionary:v4 forKey:v9];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (id)_metadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:kSecureBackupMetadataKey]);

  return v3;
}

- (void)_removeMetadata
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v4 = CloudServicesLog(v3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  uint64_t v7 = kSecureBackupMetadataKey;
  if (v6)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecureBackupMetadataKey]);
    int v9 = 138412290;
    BOOL v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing metadata: %@", (uint8_t *)&v9, 0xCu);
  }

  [v3 removeObjectForKey:v7];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (void)_setKVSKeybag:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 dataForKey:@"BackupKeybag"]);
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = CloudServicesLog(v6);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sha1Digest]);
      int v14 = 138412290;
      __int16 v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Overwriting keybag in KVS! Old digest: %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  uint64_t v11 = CloudServicesLog(v6);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sha1Digest]);
    int v14 = 138412290;
    __int16 v15 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Saving keybag in KVS digest: %@",  (uint8_t *)&v14,  0xCu);
  }

  [v5 setData:v4 forKey:@"BackupKeybag"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (id)_KVSKeybag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataForKey:@"BackupKeybag"]);

  return v3;
}

- (void)_setEMCSBackup:(id)a3 keybag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = self;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSUbiquitousKeyValueStore additionalStoreWithIdentifier:]( &OBJC_CLASS___NSUbiquitousKeyValueStore,  "additionalStoreWithIdentifier:",  @"com.apple.sbd.emcs"));
  uint64_t v10 = CloudServicesLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saving EMCS backup", buf, 2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

  CFPreferencesSetAppValue(@"EMCSBackupUUID", v13, SECURE_BACKUP_SERVICE_NAME);
  [v9 setString:v13 forKey:@"EMCSBackupUUID"];
  v22[0] = @"backup";
  v22[1] = @"keybag";
  v23[0] = v6;
  v23[1] = v7;
  v22[2] = @"timestamp";
  int v14 = objc_alloc_init(&OBJC_CLASS___NSDate);
  v22[3] = @"uuid";
  v23[2] = v14;
  v23[3] = v13;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));

  BOOL v16 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 sha1Digest]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 hexString]);
  v19 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@-%@", @"EMCSBackupDict", v18);

  [v8 setDictionary:v15 forKey:v19];
  [v8 setDictionary:v15 forKey:@"EMCSBackupDict"];
  -[SecureBackupDaemon doSynchronize](v20, "doSynchronize");
}

- (id)_EMCSBackup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataForKey:@"EMCSBackup"]);

  return v3;
}

- (id)_EMCSBackupDictForKeybagDigest:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v6 = @"EMCSBackupDict";
  if (v4)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 hexString]);
    id v6 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@-%@", @"EMCSBackupDict", v8);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:v6]);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if (v4)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryForKey:@"EMCSBackupDict"]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"keybag"]);
      __int16 v13 = v12;
      if (v11)
      {
        if (v12)
        {
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 sha1Digest]);
          unsigned int v15 = [v4 isEqual:v14];

          if (v15)
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"timestamp"]);
            if (v16)
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"timestamp"]);
              id v18 = [v17 compare:v16];

              if (v18 == (id)1)
              {
                uint64_t v20 = CloudServicesLog(v19);
                v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Found non-tagged EMCS backup with more recent timestamp",  buf,  2u);
                }

                id v22 = v11;
                uint64_t v10 = v22;
              }
            }
          }
        }
      }

- (void)garbageCollectEMCSBackupsExcluding:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v16 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v12, "isEqualToString:", @"EMCSBackupDict", v16) & 1) == 0)
        {
          if ([v12 hasPrefix:@"EMCSBackupDict"])
          {
            id v13 = [v12 hasSuffix:v4];
            if ((v13 & 1) == 0)
            {
              uint64_t v14 = CloudServicesLog(v13);
              unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v16;
                id v22 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "garbage collecting backup %@",  buf,  0xCu);
              }

              [v5 removeObjectForKey:v12];
            }
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v9);
  }
}

- (void)_removeKVSKeybag
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  uint64_t v4 = CloudServicesLog(v3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"BackupKeybag"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sha1Digest]);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing keybag from KVS digest: %@",  (uint8_t *)&v8,  0xCu);
  }

  [v3 removeObjectForKey:@"BackupKeybag"];
  -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
}

- (void)_setAutobackupEnabledWithReply:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon circleChangedNotification](self, "circleChangedNotification"));
  -[SecureBackupDaemon unregisterForNotifyEvent:](self, "unregisterForNotifyEvent:", v4);

  -[SecureBackupDaemon setNeedInitialBackup:](self, "setNeedInitialBackup:", 0LL);
}

- (void)_setAutobackupEnabled
{
}

- (void)_backupFullKeychainWithReply:(id)a3
{
}

- (void)_backupFullKeychain
{
}

- (void)_backupKeychain
{
}

- (void)_backupKeychainFully:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  BOOL v7 = -[SecureBackupDaemon _backupEnabled](self, "_backupEnabled");
  if (v7)
  {
    v20[0] = 0LL;
    v20[1] = v20;
    v20[2] = 0x3032000000LL;
    v20[3] = sub_100011D74;
    v20[4] = sub_100011D84;
    id v21 = (id)0xAAAAAAAAAAAAAAAALL;
    id v21 = (id)os_transaction_create("backupKeychainFully");
    uint64_t v8 = CloudServicesLog(v21);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = "";
      if (!v6) {
        uint64_t v10 = "a";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling %ssynchronous backup", buf, 0xCu);
    }

    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100013A94;
    v16[3] = &unk_100069170;
    v16[4] = self;
    BOOL v19 = a3;
    id v17 = v6;
    __int128 v18 = v20;
    dispatch_async(v11, v16);

    _Block_object_dispose(v20, 8);
  }

  else
  {
    uint64_t v12 = CloudServicesLog(v7);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100044DB8();
    }

    if (v6)
    {
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      uint64_t v25 = @"Attempt to back up when backup not enabled";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  16LL,  v14));
      (*((void (**)(id, void *))v6 + 2))(v6, v15);
    }
  }
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey
{
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVS
{
}

- (void)_backupCloudIdentityKeychainViewAndPushToKVSCheckBackupEnabled:(BOOL)a3
{
  if (!a3)
  {
    uint64_t v7 = CloudServicesLog(self);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_backupCloudIdentityKeychainViewAndPushToKVS: not checking if backup is enabled",  buf,  2u);
    }

    goto LABEL_9;
  }

  BOOL v4 = -[SecureBackupDaemon _backupEnabled](self, "_backupEnabled");
  if (v4)
  {
LABEL_9:
    *(void *)buf = 0LL;
    uint64_t v12 = buf;
    uint64_t v13 = 0x3032000000LL;
    uint64_t v14 = sub_100011D74;
    unsigned int v15 = sub_100011D84;
    id v16 = (id)0xAAAAAAAAAAAAAAAALL;
    id v16 = (id)os_transaction_create("_backupCloudIdentityKeychainViewAndPushToKVS");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100013CF0;
    v10[3] = &unk_100069198;
    v10[4] = self;
    v10[5] = buf;
    dispatch_async(v9, v10);

    _Block_object_dispose(buf, 8);
    return;
  }

  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100044DE4();
  }
}

- (id)_consumeViewBackup:(id)a3 recordID:(id)a4
{
  id v5 = a3;
  id v65 = a4;
  uint64_t v6 = CloudServicesLog(v65);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "_consumeViewBackup: consuming backup for view %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v117 = 0x3032000000LL;
  v118 = sub_100011D74;
  v119 = sub_100011D84;
  id v120 = 0LL;
  uint64_t v96 = 0LL;
  v97 = &v96;
  uint64_t v98 = 0x2020000000LL;
  char v99 = 0;
  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x3032000000LL;
  v93 = sub_100011D74;
  v94 = sub_100011D84;
  id v95 = 0LL;
  uint64_t v63 = CloudServicesAnalyticsBackupForViewName;
  uint64_t v64 = kSecureBackupErrorDomain;
  uint64_t v62 = CloudServicesAnalyticsSetConfirmedManifest;
  do
  {
    uint64_t v8 = objc_autoreleasePoolPush();
    uint64_t v9 = CloudServicesLog(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 138412290;
      id v107 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "_consumeViewBackup: calling SecItemBackupWithChanges() for viewname: %@",  v106,  0xCu);
    }

    uint64_t v86 = 0LL;
    v87 = &v86;
    uint64_t v88 = 0x2020000000LL;
    int v89 = 0;
    uint64_t v82 = 0LL;
    v83 = &v82;
    uint64_t v84 = 0x2020000000LL;
    int v85 = 0;
    uint64_t v78 = 0LL;
    v79 = &v78;
    uint64_t v80 = 0x2020000000LL;
    int v81 = 0;
    id v77 = 0LL;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_100014A10;
    v68[3] = &unk_1000691C0;
    v71 = &v96;
    v72 = &v86;
    v73 = &v90;
    id v11 = v5;
    id v69 = v11;
    id v12 = v65;
    id v70 = v12;
    p___int128 buf = &buf;
    v75 = &v82;
    v76 = &v78;
    unsigned int v13 = -[SecureBackupDaemon backupWithChanges:error:handler:]( self,  "backupWithChanges:error:handler:",  v11,  &v77,  v68);
    id v14 = v77;
    uint64_t v15 = CloudServicesLog(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = "false";
      if (v13) {
        id v17 = "true";
      }
      int v18 = *((_DWORD *)v87 + 6);
      int v19 = *((_DWORD *)v83 + 6);
      int v20 = *((_DWORD *)v79 + 6);
      *(_DWORD *)v106 = 138413314;
      id v107 = v5;
      __int16 v108 = 2080;
      v109 = v17;
      __int16 v110 = 1024;
      int v111 = v18;
      __int16 v112 = 1024;
      int v113 = v19;
      __int16 v114 = 1024;
      int v115 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_consumeViewBackup: SecItemBackupWithChanges() for view %@ returned %s (%d reset, %d add, %d remove)",  v106,  0x28u);
    }

    if ((v13 & 1) == 0)
    {
      if (v14)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
        if ([v30 isEqualToString:NSPOSIXErrorDomain])
        {
          BOOL v31 = [v14 code] == (id)2;

          if (v31)
          {
            uint64_t v32 = CloudServicesLog(v21);
            NSErrorUserInfoKey v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v106 = 138412290;
              id v107 = v5;
              _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "_consumeViewBackup: SecKeychainBackupWithChanges: no journal file, skipping %@",  v106,  0xCu);
            }

            goto LABEL_31;
          }
        }

        else
        {
        }
      }

      uint64_t v43 = CloudServicesLog(v21);
      id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v106 = 138412546;
        id v107 = v5;
        __int16 v108 = 2112;
        v109 = (const char *)v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "_consumeViewBackup: SecKeychainBackupWithChanges for view %@ failed: %@",  v106,  0x16u);
      }

      if (v14)
      {
        __int16 v45 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
        v104 = @"view";
        id v105 = v11;
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
        [v45 logUnrecoverableError:v14 forEvent:v63 withAttributes:v46];
      }

      NSErrorUserInfoKey v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[os_log_s setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v14, NSUnderlyingErrorKey);
      uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v64,  24LL,  v24));
      v48 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = v47;

      goto LABEL_31;
    }

    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      uint64_t v22 = CloudServicesLog(v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v58 = *(const char **)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v106 = 138412546;
        id v107 = v5;
        __int16 v108 = 2112;
        v109 = v58;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "_consumeViewBackup: Handling events for view %@ failed: %@",  v106,  0x16u);
      }

      NSErrorUserInfoKey v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[os_log_s setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  *(void *)(*((void *)&buf + 1) + 40LL),  NSUnderlyingErrorKey);
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v64,  24LL,  v24));
      v26 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = v25;

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
      uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40LL);
      v102 = @"view";
      id v103 = v11;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
      [v27 logUnrecoverableError:v28 forEvent:v63 withAttributes:v29];

LABEL_31:
      int v42 = 0;
      goto LABEL_32;
    }

    uint64_t v33 = CloudServicesLog(v21);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v106 = 138412290;
      id v107 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "_consumeViewBackup: Successfully handled event for view: %@",  v106,  0xCu);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v35 logSuccessForEvent:v63];

    v36 = (void *)v91[5];
    if (!v36)
    {
      int v42 = 1;
      goto LABEL_33;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 keybagDigest]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([(id)v91[5] manifestHash]);
    uint64_t v39 = *((void *)&buf + 1);
    id obj = *(id *)(*((void *)&buf + 1) + 40LL);
    unsigned __int8 v40 = -[SecureBackupDaemon backupSetConfirmedManifest:digest:manifest:error:]( self,  "backupSetConfirmedManifest:digest:manifest:error:",  v11,  v37,  v38,  &obj);
    objc_storeStrong((id *)(v39 + 40), obj);

    if ((v40 & 1) == 0)
    {
      uint64_t v49 = CloudServicesLog(v41);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v59 = *(const char **)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v106 = 138412546;
        id v107 = v5;
        __int16 v108 = 2112;
        v109 = v59;
        _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "_consumeViewBackup: SecItemBackupSetConfirmedManifest for view %@ failed: %@",  v106,  0x16u);
      }

      if ([*(id *)(*((void *)&buf + 1) + 40) code] != (id)-25308
        || (v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) domain]),
            unsigned __int8 v52 = [v51 isEqualToString:NSOSStatusErrorDomain],
            v51,
            (v52 & 1) == 0))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
        uint64_t v54 = *(void *)(*((void *)&buf + 1) + 40LL);
        v100 = @"view";
        id v101 = v11;
        v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
        [v53 logUnrecoverableError:v54 forEvent:v62 withAttributes:v55];
      }

      NSErrorUserInfoKey v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[os_log_s setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  *(void *)(*((void *)&buf + 1) + 40LL),  NSUnderlyingErrorKey);
      uint64_t v56 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v64,  24LL,  v24));
      v57 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(void *)(*((void *)&buf + 1) + 40LL) = v56;

      goto LABEL_31;
    }

    NSErrorUserInfoKey v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    -[os_log_s logSuccessForEvent:](v24, "logSuccessForEvent:", v62);
    int v42 = 1;
LABEL_32:

LABEL_33:
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v86, 8);

    objc_autoreleasePoolPop(v8);
  }

  while (v42 && !*((_BYTE *)v97 + 24));
  [(id)v91[5] closeStore];
  id v60 = *(id *)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&buf, 8);

  return v60;
}

- (id)_consumeFullBackupForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "consuming full backup", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  v30 = buf;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_100011D74;
  uint64_t v33 = sub_100011D84;
  id v34 = 0LL;
  id v28 = 0LL;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  uint64_t v23 = sub_100015070;
  NSErrorUserInfoKey v24 = &unk_1000690F8;
  uint64_t v27 = buf;
  uint64_t v25 = self;
  id v7 = v4;
  id v26 = v7;
  unsigned int v8 = -[SecureBackupDaemon backupWithRegisteredBackupsWithError:handler:]( self,  "backupWithRegisteredBackupsWithError:handler:",  &v28,  &v21);
  id v9 = v28;
  uint64_t v10 = CloudServicesLog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "false";
    if (v8) {
      id v12 = "true";
    }
    *(_DWORD *)id v35 = 136315138;
    v36 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SecItemBackupWithRegisteredBackups() returned %s",  v35,  0xCu);
  }

  if ((v8 & 1) != 0)
  {
    id v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[CloudServicesAnalytics logger]( &OBJC_CLASS___CloudServicesAnalytics,  "logger",  v21,  v22,  v23,  v24,  v25));
    -[NSMutableDictionary logSuccessForEvent:](v14, "logSuccessForEvent:", CloudServicesAnalyticsBackupWithChangesFull);
  }

  else
  {
    uint64_t v15 = CloudServicesLog(v13);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100044FB0();
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  v9,  NSUnderlyingErrorKey,  v21,  v22,  v23,  v24,  v25);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v14));
    int v18 = (void *)*((void *)v30 + 5);
    *((void *)v30 + 5) = v17;
  }

  id v19 = *((id *)v30 + 5);
  _Block_object_dispose(buf, 8);

  return v19;
}

- (id)_consumeBackupJournal
{
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_100011D74;
  id v35 = sub_100011D84;
  id v36 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  id v26 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000153D4;
  v21[3] = &unk_100069210;
  NSErrorUserInfoKey v24 = &v31;
  uint64_t v22 = self;
  id v3 = -[SecureBackupDaemon copyMyPeerID](self, "copyMyPeerID");
  id v23 = v3;
  uint64_t v25 = &v27;
  unsigned int v4 = -[SecureBackupDaemon backupWithRegisteredBackupsWithError:handler:]( v22,  "backupWithRegisteredBackupsWithError:handler:",  &v26,  v21);
  id v5 = v26;
  uint64_t v6 = CloudServicesLog(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = "false";
    if (v4) {
      unsigned int v8 = "true";
    }
    *(_DWORD *)__int128 buf = 136315138;
    v38 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "SecItemBackupWithRegisteredBackups() returned %s",  buf,  0xCu);
  }

  if ((v4 & 1) == 0)
  {
    uint64_t v10 = CloudServicesLog(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100044FB0();
    }

    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v5, NSUnderlyingErrorKey);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v12));
    id v14 = (void *)v32[5];
    v32[5] = v13;
  }

  if (*((_BYTE *)v28 + 24))
  {
    uint64_t v15 = CloudServicesLog(v9);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "forcing KVS push", buf, 2u);
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _pushCachedKeychainToKVS](self, "_pushCachedKeychainToKVS"));
    int v18 = (void *)v32[5];
    v32[5] = v17;
  }

  id v19 = (id)v32[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

- (void)_disableBackup
{
}

- (void)disableiCDPBackup
{
}

- (void)registerForNotifyEvent:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v5, "Notification", v4);
    xpc_set_event("com.apple.notifyd.matching", v4, v5);
  }

- (void)unregisterForNotifyEvent:(id)a3
{
  id v3 = [a3 UTF8String];
  if (v3) {
    xpc_set_event("com.apple.notifyd.matching", v3, 0LL);
  }
}

- (id)_gestaltValueForKey:(__CFString *)a3
{
  unsigned int v11 = 0;
  id v3 = (void *)MGCopyAnswerWithError(a3, 0LL, &v11);
  if (!v3)
  {
    uint64_t v4 = CloudServicesLog(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000451FC();
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    uint64_t v7 = CloudServicesAnalyticsGestalt;
    id v12 = @"errorCode";
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
    uint64_t v13 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    [v6 logHardFailureForEventNamed:v7 withAttributes:v9];
  }

  return v3;
}

- (id)normalizeSMSTarget:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  unint64_t v7 = (2LL * (void)v6 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  unsigned int v8 = (char *)&v18 - v7;
  if (v6) {
    memset((char *)&v18 - v7, 170, 2LL * (void)v6);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 invertedSet]);

  id v11 = [v5 rangeOfCharacterFromSet:v10 options:2];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
    }

    a4 = (id *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v8,  v6));
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004527C();
    }

    if (a4)
    {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"attempt to enable backup with non-decimal digits in SMS target: %@",  v5);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v16,  NSLocalizedDescriptionKey);

      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v15));
      a4 = 0LL;
    }
  }

  return a4;
}

- (SecureBackupDaemon)initWithOperationsLogger:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SecureBackupDaemon;
  id v6 = -[SecureBackupDaemon init](&v33, "init");
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationsLogger, a3);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v32 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v32]);
    id v10 = v32;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"com.apple.sbd" isDirectory:1]);
    -[SecureBackupDaemon setCacheDirURL:](v7, "setCacheDirURL:", v11);

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.sbd.connectionQueue", v13);
    connectionQueue = v7->_connectionQueue;
    v7->_connectionQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.sbd.backupQueue", v17);
    backupQueue = v7->_backupQueue;
    v7->_backupQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.sbd.kvsQueue", v21);
    kvsQueue = v7->_kvsQueue;
    v7->_kvsQueue = (OS_dispatch_queue *)v22;

    *(void *)&v7->_cachedPassphraseFD = -1LL;
    NSErrorUserInfoKey v24 = v7->_connectionQueue;
    uint64_t v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    uint64_t v29 = sub_100016400;
    char v30 = &unk_100069238;
    uint64_t v25 = v7;
    uint64_t v31 = v25;
    os_state_add_handler(v24, &v27);
    -[SecureBackupDaemon setupNotifyEvents](v25, "setupNotifyEvents", v27, v28, v29, v30);
  }

  return v7;
}

- (void)setupNotifyEvents
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[SecureBackupDaemon setHandledNotifications:](self, "setHandledNotifications:", v3);

  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[SecureBackupDaemon setIgnoredNotifications:](self, "setIgnoredNotifications:", v4);

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000164DC;
  handler[3] = &unk_100069260;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v5, handler);
}

- (id)copyKVSState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = sub_10000545C();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"uuid");

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"com.apple.securebackup.enabled"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"backup enabled");

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"com.apple.icdpbackup.enabled"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  @"iCDP backup enabled");

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"BackupUsesEscrow"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, @"uses escrow");

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kSecureBackupMetadataKey]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, @"metadata");

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 dictionaryForKey:@"com.apple.securebackup.record"]);
    dispatch_queue_attr_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kSecureBackupTimestampKey]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v13,  @"backup timestamp");

      dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  @"keybag digest");
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000167D4;
    v20[3] = &unk_100069288;
    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = v4;
    dispatch_queue_t v22 = v15;
    dispatch_queue_attr_t v16 = v21;
    -[SecureBackupDaemon _enumerateICDPBackupsUsingBlock:](self, "_enumerateICDPBackupsUsingBlock:", v20);
    uint64_t v17 = v22;
    dispatch_queue_t v18 = v15;
  }

  else
  {
    dispatch_queue_t v18 = (NSMutableDictionary *)&__NSDictionary0__struct;
  }

  return v18;
}

- (os_state_data_s)_stateCapture
{
  uint64_t v3 = CloudServicesLog(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "capturing KVS state", buf, 2u);
  }

  id v5 = objc_autoreleasePoolPush();
  id v6 = -[SecureBackupDaemon copyKVSState](self, "copyKVSState");
  if (v6)
  {
    id v20 = 0LL;
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v20));
    unsigned int v8 = (os_log_s *)v20;
    uint64_t v9 = v8;
    if (v7)
    {
      id v10 = [v7 length];
      uint64_t v11 = CloudServicesLog(v10);
      dispatch_queue_attr_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "captured %zd bytes of KVS data", buf, 0xCu);
      }

      uint64_t v13 = (os_state_data_s *)calloc(1uLL, (size_t)v10 + 200);
      if (v13)
      {
        dispatch_queue_t v14 = v13;
        v13->var0 = 1;
        v13->var1.var1 = v10;
        __strlcpy_chk(v13->var3, "sbd KVS data", 64LL, 64LL);
        memcpy(v14->var4, [v7 bytes], (size_t)v10);
LABEL_17:

        goto LABEL_18;
      }

      uint64_t v18 = CloudServicesLog(0LL);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100045368();
      }
    }

    else
    {
      uint64_t v16 = CloudServicesLog(v8);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100045308();
      }
    }

    dispatch_queue_t v14 = 0LL;
    goto LABEL_17;
  }

  uint64_t v15 = CloudServicesLog(0LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000452DC();
  }
  dispatch_queue_t v14 = 0LL;
LABEL_18:

  objc_autoreleasePoolPop(v5);
  return v14;
}

- (NSURL)cachedKeychainURL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cacheDirURL](self, "cacheDirURL"));

  if (!v3) {
    return (NSURL *)0LL;
  }
  id v4 = sub_10000545C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cacheDirURL](self, "cacheDirURL"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v5]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathExtension:@"plist"]);
  }

  else
  {
    uint64_t v10 = CloudServicesLog(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_attr_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "no uuid, could not create cache file URL",  v12,  2u);
    }

    unsigned int v8 = 0LL;
  }

  return (NSURL *)v8;
}

- (NSURL)cachedManifestURL
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cacheDirURL](self, "cacheDirURL"));

  if (!v3) {
    return (NSURL *)0LL;
  }
  id v4 = sub_10000545C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cacheDirURL](self, "cacheDirURL"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v5]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathExtension:@"manifest"]);
  }

  else
  {
    uint64_t v10 = CloudServicesLog(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_attr_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "no uuid, could not create manifest file URL",  v12,  2u);
    }

    unsigned int v8 = 0LL;
  }

  return (NSURL *)v8;
}

- (BOOL)forceICDP
{
  return CFPreferencesGetAppBooleanValue(@"ForceICDP", SECURE_BACKUP_SERVICE_NAME, 0LL) != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"application-identifier"]);
  uint64_t v9 = CloudServicesLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v7 processIdentifier];
    dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    v31[0] = 67109634;
    v31[1] = v11;
    __int16 v32 = 2112;
    objc_super v33 = v8;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "sbd listener begin from pid %d (%@) [%@]",  (uint8_t *)v31,  0x1Cu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.securebackupd.access"]);
  if (!v13)
  {
    uint64_t v21 = CloudServicesLog(v14);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100045394(v7);
    }
    goto LABEL_13;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
  unsigned int v16 = [v15 isEqualToString:SECURE_BACKUP_SERVICE_NAME];

  if (!v16)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    unsigned int v24 = [v23 isEqualToString:SECURE_BACKUP_CONCURRENT_SERVICE_NAME];

    if (v24)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SecureBackupConcurrentProtocol));
      uint64_t v27 = SecureBackupSetupConcurrentProtocol();
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v27);

      [v7 setExportedInterface:v19];
      [v7 setExportedObject:self];
      goto LABEL_10;
    }

    uint64_t v29 = CloudServicesLog(v25);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100045414(v7, v6);
    }
LABEL_13:

    BOOL v28 = 0;
    goto LABEL_14;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SecureBackupProtocol));
  uint64_t v18 = SecureBackupSetupProtocol();
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  [v7 setExportedInterface:v19];
  [v7 setExportedObject:self];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v7 _setQueue:v20];

LABEL_10:
  [v7 resume];
  BOOL v28 = 1;
LABEL_14:

  return v28;
}

- (void)recordNotification:(id)a3 handled:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon handledNotifications](self, "handledNotifications"));
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon ignoredNotifications](self, "ignoredNotifications"));
  }
  id v10 = v7;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v8 integerValue] + 1));
  [v10 setObject:v9 forKeyedSubscript:v6];
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.security.itembackup"];
  unsigned int v6 = [v4 isEqualToString:@"com.apple.security.keychainchanged"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon circleChangedNotification](self, "circleChangedNotification"));
  unsigned int v8 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0 && !v6)
  {
    if (!v8 || (BOOL v9 = -[SecureBackupDaemon needInitialBackup](self, "needInitialBackup")))
    {
      -[SecureBackupDaemon notificationOccurred:](self, "notificationOccurred:", v4);
      goto LABEL_16;
    }

    uint64_t v18 = CloudServicesLog(v9);
    dispatch_queue_attr_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      uint64_t v13 = "ignoring circle changed notification";
      goto LABEL_14;
    }

    goto LABEL_15;
  }

  BOOL v10 = -[SecureBackupDaemon pendingNotification](self, "pendingNotification");
  if (v10)
  {
    uint64_t v11 = CloudServicesLog(v10);
    dispatch_queue_attr_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      uint64_t v13 = "notification already pending";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v23, 2u);
    }

- (void)notificationOccurred:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(-[SecureBackupDaemon recordNotification:handled:](self, "recordNotification:handled:", v4, 1LL));
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got notification: %@", buf, 0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.security.itembackup"])
  {
    -[SecureBackupDaemon _backupKeychain](self, "_backupKeychain");
  }

  else if ([v4 isEqualToString:@"com.apple.security.keychainchanged"])
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    uint64_t v8 = CloudServicesLog(v7);
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Backing up EMCS in response to keychain changed",  buf,  2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000176F0;
    v19[3] = &unk_1000692D8;
    dispatch_semaphore_t v20 = v7;
    BOOL v10 = v7;
    -[SecureBackupDaemon backupWithInfo:reply:](self, "backupWithInfo:reply:", 0LL, v19);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon circleChangedNotification](self, "circleChangedNotification"));
    unsigned int v12 = [v4 isEqualToString:v11];

    if (v12)
    {
      uint64_t v14 = CloudServicesLog(v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Performing initial backup", buf, 2u);
      }

      -[SecureBackupDaemon _setAutobackupEnabled](self, "_setAutobackupEnabled");
    }

    else
    {
      id v16 = [v4 isEqualToString:@"com.apple.sbd.kvstorechange"];
      if ((_DWORD)v16)
      {
        uint64_t v17 = CloudServicesLog(v16);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "handling notification %@", buf, 0xCu);
        }

        -[SecureBackupDaemon doSynchronize](self, "doSynchronize");
      }
    }
  }
}

- (id)massageIncomingMetadataFromInfo:(id)a3
{
  uint64_t v3 = kSecureBackupClientMetadataKey;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v3]);
  id v6 = [v5 mutableCopy];

  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSecureBackupTimestampKey]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSecureBackupMetadataTimestampKey]);
  uint64_t v9 = kSecureBackupUsesComplexPassphraseKey;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey]);
  unsigned __int8 v11 = [v10 isEqual:&__kCFBooleanTrue];

  uint64_t v12 = kSecureBackupUsesNumericPassphraseKey;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSecureBackupUsesNumericPassphraseKey]);
  uint64_t v14 = v13;
  if ((v11 & 1) == 0)
  {
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:v12];
    uint64_t v20 = kSecureBackupNumericPassphraseLengthKey;
    uint64_t v18 = &off_10006DAE0;
LABEL_11:
    id v19 = v6;
    goto LABEL_12;
  }

  if (!v13 || ![v13 BOOLValue])
  {
    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
    uint64_t v20 = kSecureBackupNumericPassphraseLengthKey;
    uint64_t v18 = &off_10006DAF8;
    goto LABEL_11;
  }

  uint64_t v15 = kSecureBackupNumericPassphraseLengthKey;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey]);
  unsigned int v17 = [v16 intValue];

  if (v17 != 6)
  {
    if (v17 != 4)
    {
LABEL_13:
      [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
      uint64_t v18 = &off_10006DAF8;
      id v19 = v6;
      uint64_t v20 = v15;
      goto LABEL_12;
    }

    [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v12];
    [v6 setObject:&off_10006DAF8 forKeyedSubscript:v15];
  }

  uint64_t v18 = (_UNKNOWN **)&__kCFBooleanFalse;
  id v19 = v6;
  uint64_t v20 = v9;
LABEL_12:
  [v19 setObject:v18 forKeyedSubscript:v20];

  return v6;
}

- (id)filteriCDPRecords:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon _getICDPBackupFromKVS:forView:]( self,  "_getICDPBackupFromKVS:forView:",  v6,  @"iCloudIdentity"));

  __int16 v45 = v5;
  if (!v7)
  {
    uint64_t v33 = CloudServicesLog(v8);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000454BC();
    }
    goto LABEL_27;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"keybag"]);

  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v12 logSuccessForEvent:CloudServicesAnalyticsiCDPKeybag];

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s backupKeyDigests](v10, "backupKeyDigests"));
    uint64_t v13 = CloudServicesLog(v46);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s peerIDs](v10, "peerIDs"));
      *(_DWORD *)__int128 buf = 138412290;
      unsigned __int8 v52 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "iCloudIdentity backup keybag peers: %@",  buf,  0xCu);
    }

    uint64_t v17 = CloudServicesLog(v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      unsigned __int8 v52 = v46;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "keybag contains key digests %@", buf, 0xCu);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v19 = v4;
    id v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v20)
    {
      id v21 = v20;
      int v42 = v10;
      uint64_t v43 = v7;
      id v44 = v4;
      uint64_t v22 = *(void *)v48;
      uint64_t v23 = kSecureBackupKeybagDigestKey;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"metadata"]);
          id v27 = (id)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);
          id v28 = v27;
          if (v27 && (id v27 = [v46 containsObject:v27], (_DWORD)v27))
          {
            -[NSMutableSet addObject:](v5, "addObject:", v25);
          }

          else
          {
            uint64_t v29 = CloudServicesLog(v27);
            char v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"recordID"]);
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v28 hexString]);
              *(_DWORD *)__int128 buf = 138412546;
              unsigned __int8 v52 = v31;
              __int16 v53 = 2112;
              uint64_t v54 = v32;
              _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "record id %@ cannot recover iCloudIdentity backup! (backup key digest: %@)",  buf,  0x16u);

              uint64_t v5 = v45;
            }
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }

      while (v21);

      dispatch_semaphore_t v7 = v43;
      id v4 = v44;
      BOOL v10 = v42;
    }

    else
    {
    }

- (BOOL)hasRecoveryKeyInKVS:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon _getICDPBackupFromKVS:forView:]( self,  "_getICDPBackupFromKVS:forView:",  a3,  @"iCloudIdentity"));
  dispatch_semaphore_t v7 = v6;
  if (!v6)
  {
    uint64_t v16 = CloudServicesLog(0LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100045548();
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  204LL,  0LL,  @"could not get iCloudIdentity backup!"));
    uint64_t v9 = v18;
    if (a4)
    {
      LOBYTE(v12) = 0;
      *a4 = v18;
      goto LABEL_16;
    }

- (id)_recordIDFromLabel:(id)a3 withPrefix:(id)a4 suffix:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (char *)[a4 length];
  id v10 = [v8 length];

  unint64_t v11 = (unint64_t)v10 + (void)(v9 + 1);
  if ((unint64_t)[v7 length] > v11
    && [v7 characterAtIndex:v9] == 46)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v9 + 1, (char *)objc_msgSend(v7, "length") - v11));
  }

  else
  {
    BOOL v12 = 0LL;
  }

  return v12;
}

- (void)_getAccountInfoWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CloudServicesLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v25 = "-[SecureBackupDaemon _getAccountInfoWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v10 = objc_alloc(&OBJC_CLASS___EscrowService);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  BOOL v12 = -[EscrowService initWithOperationsLogger:](v10, "initWithOperationsLogger:", v11);

  uint64_t v14 = CloudServicesLog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "calling getAccountInfoWithRequest: in daemon",  buf,  2u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000183AC;
  v19[3] = &unk_100069328;
  id v20 = v6;
  id v21 = self;
  uint64_t v22 = v12;
  id v23 = v7;
  uint64_t v16 = v12;
  id v17 = v6;
  id v18 = v7;
  -[EscrowService getAccountInfoWithRequest:completionBlock:]( v16,  "getAccountInfoWithRequest:completionBlock:",  v17,  v19);
}

- (void)_fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = CloudServicesLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v20 = "-[SecureBackupDaemon _fetchStingrayAccountStatusInDaemon:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v10 = objc_alloc(&OBJC_CLASS___EscrowService);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  BOOL v12 = -[EscrowService initWithOperationsLogger:](v10, "initWithOperationsLogger:", v11);

  uint64_t v14 = CloudServicesLog(v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "calling getAccountInfoWithRequest: in daemon",  buf,  2u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001A33C;
  v17[3] = &unk_100069350;
  id v18 = v6;
  id v16 = v6;
  -[EscrowService getAccountInfoWithRequest:completionBlock:]( v12,  "getAccountInfoWithRequest:completionBlock:",  v7,  v17);
}

- (id)tagStaleBottleRecords:(id)a3 suggestedBottles:(id)a4
{
  id v5 = a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", a3));
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = kEscrowServiceRecordMetadataKey;
    uint64_t v26 = kSecureBackupBottleIDKey;
    uint64_t v23 = kSecureBackupRecordStatusInvalid;
    uint64_t v22 = kSecureBackupBottleValidityKey;
    uint64_t v24 = kEscrowServiceRecordMetadataKey;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v26]);
        if (v14)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredBottleIDs]);
          if ([v15 containsObject:v14])
          {
          }

          else
          {
            id v16 = v7;
            uint64_t v17 = v8;
            id v18 = v5;
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 partialRecoveryBottleIDs]);
            unsigned __int8 v20 = [v19 containsObject:v14];

            id v5 = v18;
            uint64_t v8 = v17;
            id v7 = v16;
            uint64_t v9 = v24;

            if ((v20 & 1) == 0) {
              [v13 setObject:v23 forKeyedSubscript:v22];
            }
          }
        }

        [v11 setObject:v13 forKeyedSubscript:v9];
      }

      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v7);
  }

  return obj;
}

- (id)sortRecordsByBottleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CloudServicesLog(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)uint64_t v98 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sorting %d records", buf, 8u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  id v8 = sub_1000105E4();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setAltDSID:v9];

  [v7 setContext:OTDefaultContext];
  id v95 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OTClique findOptimalBottleIDsWithContextData:error:]( &OBJC_CLASS___OTClique,  "findOptimalBottleIDsWithContextData:error:",  v7,  &v95));
  id v11 = v95;
  BOOL v12 = v11;
  if (!v10 || v11)
  {
    uint64_t v73 = CloudServicesLog(v11);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      sub_1000455A0();
    }
    goto LABEL_47;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
  if (!v13
    || (uint64_t v14 = (void *)v13,
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]),
        id v16 = [v15 count],
        v15,
        v14,
        !v16))
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
    if (!v17
      || (id v18 = (void *)v17,
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]),
          id v20 = [v19 count],
          v19,
          v18,
          !v20))
    {
      uint64_t v75 = CloudServicesLog(v17);
      v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_100045600();
      }
LABEL_47:

      v76 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon tagStaleBottleRecords:suggestedBottles:]( self,  "tagStaleBottleRecords:suggestedBottles:",  v4,  v10));
      goto LABEL_52;
    }
  }

  id v80 = v7;
  uint64_t v21 = CloudServicesLog(v17);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
    unsigned int v24 = [v23 count];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
    unsigned int v26 = [v25 count];
    *(_DWORD *)__int128 buf = 67109376;
    *(_DWORD *)uint64_t v98 = v24;
    *(_WORD *)&v98[4] = 1024;
    *(_DWORD *)&v98[6] = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Returned %d preferred bottles, %d partial recovery bottles",  buf,  0xEu);
  }

  __int128 v27 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
  __int128 v29 = -[NSMutableArray initWithCapacity:](v27, "initWithCapacity:", [v28 count]);

  __int128 v30 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
  __int16 v32 = -[NSMutableArray initWithCapacity:](v30, "initWithCapacity:", [v31 count]);

  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
  id v34 = [v33 count];

  if (v34)
  {
    unint64_t v35 = 0LL;
    do
    {
      -[NSMutableArray setObject:atIndexedSubscript:]( v29,  "setObject:atIndexedSubscript:",  &__NSDictionary0__struct,  v35++);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredBottleIDs]);
      id v37 = [v36 count];
    }

    while (v35 < (unint64_t)v37);
  }

  uint64_t v84 = v29;
  v79 = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
  id v39 = [v38 count];

  if (v39)
  {
    unint64_t v40 = 0LL;
    do
    {
      -[NSMutableArray setObject:atIndexedSubscript:]( v32,  "setObject:atIndexedSubscript:",  &__NSDictionary0__struct,  v40++);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v10 partialRecoveryBottleIDs]);
      id v42 = [v41 count];
    }

    while (v40 < (unint64_t)v42);
  }

  v83 = v32;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  id v81 = v4;
  id v43 = v4;
  id v90 = [v43 countByEnumeratingWithState:&v91 objects:v96 count:16];
  if (v90)
  {
    uint64_t v89 = *(void *)v92;
    uint64_t v44 = kEscrowServiceRecordMetadataKey;
    uint64_t v88 = kSecureBackupBottleIDKey;
    uint64_t v86 = kSecureBackupRecordStatusValid;
    uint64_t v85 = kSecureBackupBottleValidityKey;
    id obj = v43;
    do
    {
      for (i = 0LL; i != v90; i = (char *)i + 1)
      {
        if (*(void *)v92 != v89) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v46));
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"recordID"]);
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v44]);
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v49));

        v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v88]);
        if (!v51)
        {
          uint64_t v63 = CloudServicesLog(0LL);
          v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)uint64_t v98 = v48;
            v61 = v59;
            uint64_t v62 = "Record %@ does not have a bottle, ignoring it";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, v62, buf, 0xCu);
          }

- (void)doSynchronize
{
}

- (void)synchronizeKVSWithHandler:(id)a3
{
  id v4 = a3;
  if (qword_100078FB0 != -1) {
    dispatch_once(&qword_100078FB0, &stru_1000693B0);
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  if (v5)
  {
    kdebug_trace(733021364LL, 0LL, 0LL, 0LL, 0LL);
    id v6 = _CloudServicesSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_signpost_id_t v8 = _CloudServicesSignpostCreate(v7);
    uint64_t v10 = v9;

    id v11 = _CloudServicesSignpostLogSystem();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "KVSSynchronize",  " enableTelemetry=YES ",  buf,  2u);
    }

    id v14 = _CloudServicesSignpostLogSystem();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      os_signpost_id_t v30 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: KVSSynchronize  enableTelemetry=YES ",  buf,  0xCu);
    }

    uint64_t v17 = CloudServicesLog(v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "waiting for sync group", buf, 2u);
    }

    dispatch_group_wait((dispatch_group_t)qword_100078FB8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_enter((dispatch_group_t)qword_100078FB8);
    uint64_t v20 = CloudServicesLog(v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "calling synchronizeWithCompletionHandler",  buf,  2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001B840;
    v24[3] = &unk_100069428;
    os_signpost_id_t v27 = v8;
    uint64_t v28 = v10;
    v24[4] = self;
    id v26 = v4;
    id v25 = v5;
    [v25 synchronizeWithCompletionHandler:v24];
  }

  else
  {
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    __int16 v32 = @"KVS not available";
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  32LL,  v22));
    (*((void (**)(id, void *))v4 + 2))(v4, v23);
  }
}

- (void)getAccountInfoWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = (void *)os_transaction_create("getAccountInfoWithRequest");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001BE04;
  v21[3] = &unk_100069450;
  id v9 = v7;
  id v23 = v9;
  id v10 = v8;
  id v22 = v10;
  id v11 = objc_retainBlock(v21);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v13)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, NSUnderlyingErrorKey);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v14));
    ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v16);
  }

  else
  {
    id v17 = [v6 synchronize];
    if ((_DWORD)v17 && OctagonPlatformSupportsSOS(v17))
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001BE10;
      v18[3] = &unk_100069478;
      uint64_t v20 = v11;
      v18[4] = self;
      id v19 = v6;
      -[SecureBackupDaemon synchronizeKVSWithHandler:](self, "synchronizeKVSWithHandler:", v18);
    }

    else
    {
      -[SecureBackupDaemon _getAccountInfoWithRequest:reply:](self, "_getAccountInfoWithRequest:reply:", v6, v11);
    }
  }
}

- (void)fetchStingrayAccountStatusInDaemon:(id)a3 reply:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)os_transaction_create("fetchStingrayAccountStatusInDaemon");
  os_signpost_id_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v13 setQueue:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, NSUnderlyingErrorKey);

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v10));
    v6[2](v6, 0LL, v12);
  }

  else
  {
    -[SecureBackupDaemon _fetchStingrayAccountStatusInDaemon:reply:]( self,  "_fetchStingrayAccountStatusInDaemon:reply:",  v13,  v6);
  }
}

- (id)massageOutgoingMetadataFromRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  id v5 = [v4 mutableCopy];

  if (v5
    && ([v3 stingray] & 1) == 0
    && ([v3 usesRandomPassphrase] & 1) == 0)
  {
    uint64_t v6 = kSecureBackupUsesComplexPassphraseKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey]);
    unsigned int v8 = [v7 isEqual:&__kCFBooleanTrue];

    if (v8)
    {
      [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      uint64_t v9 = kSecureBackupNumericPassphraseLengthKey;
      id v10 = &off_10006DAF8;
      id v11 = v5;
LABEL_9:
      [v11 setObject:v10 forKeyedSubscript:v9];
      goto LABEL_13;
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecureBackupNumericPassphraseLengthKey]);
    unsigned int v13 = [v12 intValue];

    if (v13 != 4)
    {
      if (v13 == 6)
      {
        id v10 = (_UNKNOWN **)&__kCFBooleanTrue;
        id v11 = v5;
        uint64_t v9 = v6;
        goto LABEL_9;
      }

      uint64_t v15 = CloudServicesLog(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10004579C();
      }
    }
  }

- (void)_stashRecoveryDataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v23 = "-[SecureBackupDaemon _stashRecoveryDataWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    BOOL v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = kSecureBackupErrorDomain;
    uint64_t v15 = 5LL;
LABEL_10:
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  v15,  v12));
    v7[2](v7, v19);

    goto LABEL_11;
  }

  id v16 = [v6 emcsMode];
  if (!(_DWORD)v16)
  {
    uint64_t v17 = CloudServicesLog(v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000457FC();
    }

    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    uint64_t v21 = @"stashRecoveryDataWithRequest called without EMCS mode set?";
    BOOL v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    uint64_t v14 = kSecureBackupErrorDomain;
    uint64_t v15 = 4LL;
    goto LABEL_10;
  }

  BOOL v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  41LL,  0LL));
  v7[2](v7, v12);
LABEL_11:
}

- (void)stashRecoveryDataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace(733020572LL, 0LL, 0LL, 0LL, 0LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001C400;
  v10[3] = &unk_1000694A0;
  id v11 = (id)os_transaction_create("stashRecoveryDataWithRequest");
  id v12 = v6;
  id v8 = v11;
  id v9 = v6;
  -[SecureBackupDaemon _stashRecoveryDataWithRequest:reply:](self, "_stashRecoveryDataWithRequest:reply:", v7, v10);
}

- (void)enableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 guitarfish] || !objc_msgSend(v6, "guitarfishToken"))
  {
    if ([v6 guitarfishToken])
    {
      -[SecureBackupDaemon enableGuitarfishTokenWithRequest:reply:]( self,  "enableGuitarfishTokenWithRequest:reply:",  v6,  v7);
      goto LABEL_150;
    }

    id v9 = _CloudServicesSignpostLogSystem();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_signpost_id_t v11 = _CloudServicesSignpostCreate(v10);
    uint64_t v13 = v12;

    id v14 = _CloudServicesSignpostLogSystem();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
      *(_DWORD *)__int128 buf = 138543362;
      *(void *)v181 = v17;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "EnableWithRequest",  " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0xCu);
    }

    id v18 = _CloudServicesSignpostLogSystem();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
      *(_DWORD *)__int128 buf = 134218242;
      *(void *)v181 = v11;
      *(_WORD *)&v181[8] = 2114;
      v182 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: EnableWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0x16u);
    }

    uint64_t v21 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v6,  100LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    [v22 updateStoreWithEvent:v21];

    v175[0] = _NSConcreteStackBlock;
    v175[1] = 3221225472LL;
    v175[2] = sub_10001DBF0;
    v175[3] = &unk_1000694C8;
    os_signpost_id_t v178 = v11;
    uint64_t v179 = v13;
    v175[4] = self;
    id v23 = v21;
    v176 = v23;
    id v177 = v7;
    unsigned int v24 = objc_retainBlock(v175);
    uint64_t v25 = CloudServicesLog(v24);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)v181 = "-[SecureBackupDaemon enableWithRequest:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
    }

    os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
    [v6 setQueue:v27];

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    if (v28)
    {
      __int128 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
      os_signpost_id_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v30,  NSUnderlyingErrorKey);

      NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v29));
      ((void (*)(void *, void *))v24[2])(v24, v31);

LABEL_149:
      goto LABEL_150;
    }

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudEnv]);
    -[SecureBackupDaemon setICloudEnvironment:](self, "setICloudEnvironment:", v32);

    if (([v6 stingray] & 1) == 0 && (objc_msgSend(v6, "icdp") & 1) == 0)
    {
      if (-[SecureBackupDaemon _backupEnabled](self, "_backupEnabled"))
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
        BOOL v34 = v33 == 0LL;

        if (v34)
        {
          uint64_t v86 = CloudServicesLog(v35);
          v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Backup already enabled", buf, 2u);
          }

          -[SecureBackupDaemon _backupKeychain](self, "_backupKeychain");
          ((void (*)(void *, void))v24[2])(v24, 0LL);
          goto LABEL_149;
        }
      }
    }

    if (([v6 stingray] & 1) == 0
      && [v6 usesRandomPassphrase]
      && (id v36 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]),
          BOOL v37 = v36 == 0LL,
          v36,
          v37))
    {
      int v158 = 0;
    }

    else
    {
      id v38 = [v6 stingray];
      if ((v38 & 1) == 0)
      {
        id v38 = [v6 usesMultipleiCSC];
        if ((_DWORD)v38)
        {
          uint64_t v39 = CloudServicesLog(v38);
          unint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Heading down multi-icsc path", buf, 2u);
          }

          -[SecureBackupDaemon doEnableEscrowMultiICSCWithRequest:reply:]( self,  "doEnableEscrowMultiICSCWithRequest:reply:",  v6,  v24);
          goto LABEL_149;
        }
      }

      int v158 = 1;
    }

    uint64_t v41 = CloudServicesLog(v38);
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v43 = [v6 stingray];
      unsigned int v44 = [v6 usesRandomPassphrase];
      unsigned int v45 = [v6 usesMultipleiCSC];
      *(_DWORD *)__int128 buf = 67109632;
      *(_DWORD *)v181 = v43;
      *(_WORD *)&v181[4] = 1024;
      *(_DWORD *)&v181[6] = v44;
      LOWORD(v182) = 1024;
      *(_DWORD *)((char *)&v182 + 2) = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Heading down spaghetti path: s: %d, uRP: %d, uMiCSC:%d",  buf,  0x14u);
    }

    v164 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon massageOutgoingMetadataFromRequest:]( self,  "massageOutgoingMetadataFromRequest:",  v6));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
    v163 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey]);

    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
    v162 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"duplicateEncodedMetadata"]);

    v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if ([v6 stingray])
    {
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
      if ([v48 length])
      {
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
        if ([v49 length])
        {
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudIdentityData]);
          BOOL v51 = [v50 length] == 0;

          if (!v51)
          {
            id v53 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v6 iCloudIdentityData]);
            if ([v6 guitarfish])
            {
              uint64_t v54 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary sha256Digest](v53, "sha256Digest"));
              [v165 setObject:v54 forKeyedSubscript:kSecureBackupKeybagSHA256Key];
              v150 = (NSMutableDictionary *)v54;
              v55 = 0LL;
              uint64_t v56 = 0LL;
              uint64_t v57 = 0LL;
              goto LABEL_78;
            }

            uint64_t v56 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary sha1Digest](v53, "sha1Digest"));
            [v165 setObject:v56 forKeyedSubscript:kSecureBackupKeybagDigestKey];
            v55 = 0LL;
            goto LABEL_76;
          }

- (void)handleEscrowStoreResults:(id)a3 escrowError:(id)a4 request:(id)a5 peerID:(id)a6 newRecordMetadata:(id)a7 backupKeybag:(id)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  NSErrorUserInfoKey v20 = (void (**)(void, void))v19;
  if (v15)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    unsigned int v22 = [v21 isEqualToString:kEscrowServiceErrorDomain];

    if (v22)
    {
      id v23 = [v15 code];
      if (v23 == (id)-5012LL)
      {
        uint64_t v24 = kSecureBackupErrorDomain;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
        uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  29LL,  v25));

        id v15 = (id)v26;
      }
    }

    uint64_t v27 = CloudServicesLog(v23);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000459B4();
    }

    ((void (**)(void, id))v20)[2](v20, v15);
  }

  else
  {
    uint64_t v29 = CloudServicesLog(v19);
    os_signpost_id_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "escrowService storeRecordWithRequest: succeeded",  buf,  2u);
    }

    if (([v16 stingray] & 1) == 0)
    {
      -[SecureBackupDaemon _setUsesEscrow:](self, "_setUsesEscrow:", 1LL);
      -[SecureBackupDaemon _setMetadata:](self, "_setMetadata:", v17);
      id v31 = sub_10000545C();
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      if (!v32)
      {
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);
        sub_1000054A4(v34);
      }

      -[SecureBackupDaemon _setBackupEnabled:iCDP:](self, "_setBackupEnabled:iCDP:", 1, [v16 icdp]);
      -[SecureBackupDaemon _removeProtectedKeychain](self, "_removeProtectedKeychain");
      if (v18) {
        -[SecureBackupDaemon _setKVSKeybag:](self, "_setKVSKeybag:", v18);
      }
      -[SecureBackupDaemon _removeKeychainItemForKey:]( self,  "_removeKeychainItemForKey:",  @"SecureBackupEscrowCert");
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"EscrowServiceCertificate"]);
      -[SecureBackupDaemon _saveKeychainItem:forKey:]( self,  "_saveKeychainItem:forKey:",  v35,  @"SecureBackupEscrowCert");

      uint64_t v36 = CloudServicesLog( -[SecureBackupDaemon _backupCloudIdentityKeychainViewAndPushToKVS]( self,  "_backupCloudIdentityKeychainViewAndPushToKVS"));
      BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v38 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "backing up the rest of the keychain!",  v38,  2u);
      }

      -[SecureBackupDaemon _setAutobackupEnabled](self, "_setAutobackupEnabled");
    }

    v20[2](v20, 0LL);
  }
}

- (BOOL)backupAllowed
{
  v2 = sem_open("com.apple.sbd.backupAllowed", 0);
  id v3 = v2;
  if (v2 != (sem_t *)-1LL) {
    sem_close(v2);
  }
  return v3 != (sem_t *)-1LL;
}

- (void)setBackupAllowed:(BOOL)a3
{
  id v3 = sem_open("com.apple.sbd.backupAllowed", 512, a3, 256LL, 0LL);
  if (v3 == (sem_t *)-1LL)
  {
    uint64_t v4 = CloudServicesLog(-1LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100045A14(v5);
    }
  }

  else
  {
    sem_close(v3);
  }

- (void)backupForRecoveryKeyWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5
{
  id v6 = (void (**)(id, void))a5;
  uint64_t v7 = CloudServicesLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[SecureBackupDaemon backupForRecoveryKeyWithInfo:garbageCollect:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v9, 0xCu);
  }

  -[SecureBackupDaemon _backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey]( self,  "_backupCloudIdentityKeychainViewAndPushToKVSForRecoveryKey");
  v6[2](v6, 0LL);
}

- (void)backupWithInfo:(id)a3 garbageCollect:(BOOL)a4 reply:(id)a5
{
  id v6 = (void (**)(id, void))a5;
  uint64_t v7 = CloudServicesLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[SecureBackupDaemon backupWithInfo:garbageCollect:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v9, 0xCu);
  }

  -[SecureBackupDaemon _backupFullKeychain](self, "_backupFullKeychain");
  v6[2](v6, 0LL);
}

- (void)backupForRecoveryKeyWithInfoInDaemon:(id)a3 reply:(id)a4
{
}

- (void)backupWithInfo:(id)a3 reply:(id)a4
{
}

- (id)restoreBackup:(id)a3 withName:(id)a4 keybagDigest:(id)a5 keybag:(id)a6 password:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = sub_100011D74;
  id v42 = sub_100011D84;
  id v43 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon createPlistFromDERData:](self, "createPlistFromDERData:", v12));
  if (v18)
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v18, v19);
    if ((isKindOfClass & 1) != 0)
    {
      [v18 enumerateKeysAndObjectsUsingBlock:&stru_100069530];
    }

    else
    {
      uint64_t v23 = CloudServicesLog(isKindOfClass);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100045A88();
      }
    }

    if ([v13 isEqualToString:@"KeychainV0-tomb"])
    {
      uint64_t v25 = (id *)(v39 + 5);
      id obj = (id)v39[5];
      uint64_t v26 = objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon createEncodedDirectBackupSliceKeybagFromData:error:]( self,  "createEncodedDirectBackupSliceKeybagFromData:error:",  v15,  &obj));
      objc_storeStrong(v25, obj);

      id v15 = (id)v26;
    }

    uint64_t v27 = (void *)v39[5];
    if (!v27)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v15 peerIDForKeybagDigest:v14]);
      uint64_t v29 = (void *)v28;
      if (v28)
      {
        uint64_t v30 = CloudServicesLog(v28);
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v15 peerIDs]);
          *(_DWORD *)__int128 buf = 138412546;
          unsigned int v45 = v29;
          __int16 v46 = 2112;
          __int128 v47 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "using peerID %@ from backup keybag peers: %@",  buf,  0x16u);
        }
      }

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10001E854;
      v34[3] = &unk_100069558;
      id v35 = v13;
      uint64_t v36 = &v38;
      -[SecureBackupDaemon restoreBackupName:peerID:keybag:password:backup:reply:]( self,  "restoreBackupName:peerID:keybag:password:backup:reply:",  v35,  v29,  v15,  v16,  v12,  v34);

      uint64_t v27 = (void *)v39[5];
    }

    id v22 = v27;
  }

  else
  {
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    __int128 v49 = @"could not create plist from DER backup";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  19LL,  v21));
  }

  _Block_object_dispose(&v38, 8);
  return v22;
}

- (id)encodedStatsForViews:(id)a3
{
  id v3 = a3;
  if (qword_100078FD0 != -1) {
    dispatch_once(&qword_100078FD0, &stru_100069578);
  }
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (id)qword_100078FC8;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        os_signpost_id_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100078FC0, "objectForKeyedSubscript:", v10, (void)v15));
        -[NSMutableString appendString:](v4, "appendString:", v13);
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)_restoreView:(id)a3 password:(id)a4 keybagDigest:(id)a5 restoredViews:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvs](self, "kvs"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _getICDPBackupFromKVS:forView:](self, "_getICDPBackupFromKVS:forView:", v16, v12));

  if (!v17)
  {
    if (a7) {
      goto LABEL_17;
    }
LABEL_20:
    BOOL v30 = 0;
    id v29 = 0LL;
    goto LABEL_22;
  }

  uint64_t v38 = v15;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"com.apple.securebackup.keychain"]);
  uint64_t v19 = CloudServicesLog(v18);
  NSErrorUserInfoKey v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v14;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    *(_DWORD *)__int128 buf = 138412546;
    id v40 = v12;
    __int16 v41 = 2112;
    id v42 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Retrieving backup for view %@ from %@",  buf,  0x16u);

    id v14 = v21;
  }

  if (!v18)
  {

    id v15 = v38;
    if (a7) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }

  id v37 = v13;
  uint64_t v24 = CloudServicesLog(v23);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v40 = v12;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "restoring backup view %@", buf, 0xCu);
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"keybag"]);
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"backup"]);
  uint64_t v28 = (void *)v27;
  id v29 = 0LL;
  BOOL v30 = 0;
  if (v26 && v27)
  {
    id v31 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@-tomb", v12);
    id v32 = v14;
    uint64_t v33 = v31;
    BOOL v34 = self;
    id v35 = v32;
    id v29 = (id)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon restoreBackup:withName:keybagDigest:keybag:password:]( v34,  "restoreBackup:withName:keybagDigest:keybag:password:",  v28,  v33));
    BOOL v30 = v29 == 0LL;
    if (!v29) {
      [v38 addObject:v12];
    }

    id v14 = v35;
  }

  if (!a7)
  {
    id v13 = v37;
    id v15 = v38;
    goto LABEL_22;
  }

  id v13 = v37;
  id v15 = v38;
  if (!v30)
  {
    if (v29)
    {
LABEL_18:
      id v29 = v29;
      BOOL v30 = 0;
      *a7 = v29;
      goto LABEL_22;
    }

- (void)_restoreKeychainAsyncWithBackupBag:(id)a3 password:(id)a4 keybagDigest:(id)a5 haveBottledPeer:(BOOL)a6 restoredViews:(id)a7 viewsNotToBeRestored:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  char v34 = 0;
  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10001F090;
  v25[3] = &unk_1000695A0;
  v25[4] = self;
  id v26 = v16;
  id v30 = v14;
  id v31 = v33;
  id v27 = v18;
  id v28 = v15;
  id v29 = v17;
  BOOL v32 = a6;
  id v20 = v14;
  id v21 = v17;
  id v22 = v15;
  id v23 = v18;
  id v24 = v16;
  dispatch_async(v19, v25);

  _Block_object_dispose(v33, 8);
}

- (BOOL)_restoreKeychainWithBackupPassword:(id)a3 keybagDigest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v52 = 0LL;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  v55 = sub_100011D74;
  uint64_t v56 = sub_100011D84;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  __int128 v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  __int128 v49 = sub_100011D74;
  __int128 v50 = sub_100011D84;
  BOOL v51 = (NSMutableSet *)0xAAAAAAAAAAAAAAAALL;
  BOOL v51 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v42 = 0LL;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 0;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F9E8;
  block[3] = &unk_1000695C8;
  block[4] = self;
  id v11 = v8;
  id v37 = v11;
  id v12 = v9;
  id v38 = v12;
  uint64_t v39 = &v46;
  id v40 = &v52;
  __int16 v41 = &v42;
  dispatch_sync(v10, block);

  uint64_t v14 = CloudServicesLog(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v47[5];
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v59 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "restoredViews: %@", buf, 0xCu);
  }

  uint64_t v18 = CloudServicesLog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "kicking off async restore of the other keychain views",  buf,  2u);
  }

  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  _DWORD v31[2] = sub_10001FB04;
  v31[3] = &unk_1000695F0;
  v31[4] = self;
  id v21 = v12;
  id v32 = v21;
  char v34 = &v42;
  id v22 = v11;
  id v33 = v22;
  id v35 = &v46;
  dispatch_async(v20, v31);

  uint64_t v23 = sub_1000052A8();
  if ((_DWORD)v23)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon encodedStatsForViews:](self, "encodedStatsForViews:", v47[5]));
    [v24 setObject:v25 forKeyedSubscript:@"views"];

    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[CloudServicesAnalytics logger](&OBJC_CLASS___CloudServicesAnalytics, "logger"));
    [v26 logSoftFailureForEventNamed:CloudServicesSOSRestoreMetrics withAttributes:v24];
  }

  if (!*((_BYTE *)v43 + 24))
  {
    uint64_t v27 = CloudServicesLog(v23);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100045C68();
    }

    if (a5) {
      *a5 = (id) v53[5];
    }
  }

  BOOL v29 = *((_BYTE *)v43 + 24) != 0;

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v29;
}

- (id)secureBackups
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001FE1C;
  v5[3] = &unk_100069618;
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = v3;
  -[SecureBackupDaemon _enumerateICDPBackupsUsingBlock:](self, "_enumerateICDPBackupsUsingBlock:", v5);

  return v3;
}

- (void)recordIDAndMetadataForSilentAttempt:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = CloudServicesLog(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "looking for record for silent attempt of passphrase length %lu",  buf,  0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100020124;
  v16[3] = &unk_100069640;
  id v18 = v11;
  unint64_t v19 = a4;
  v16[4] = self;
  id v17 = v10;
  int v20 = a5;
  id v14 = v10;
  id v15 = v11;
  -[SecureBackupDaemon getAccountInfoWithRequest:reply:](self, "getAccountInfoWithRequest:reply:", v14, v16);
}

- (id)restoreEMCSBackup:(id)a3 keybag:(id)a4 password:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  kdebug_trace(733020980LL, 0LL, 0LL, 0LL, 0LL);
  id v10 = _CloudServicesSignpostLogSystem();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = _CloudServicesSignpostCreate(v11);
  uint64_t v14 = v13;

  id v15 = _CloudServicesSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v34) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "RestoreEMCSBackup",  " enableTelemetry=YES ",  (uint8_t *)&v34,  2u);
  }

  id v18 = _CloudServicesSignpostLogSystem();
  unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134217984;
    os_signpost_id_t v35 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RestoreEMCSBackup  enableTelemetry=YES ",  (uint8_t *)&v34,  0xCu);
  }

  int v20 = _SecKeychainRestoreBackup(v9, v8, v7);
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v12, v14);
  id v22 = _CloudServicesSignpostLogSystem();
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = v23;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    int v34 = 67240192;
    LODWORD(v35) = v20 == 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v12,  "RestoreEMCSBackup",  " CloudServicesSignpostNameRestoreEMCSBackup=%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameRest oreEMCSBackup}d ",  (uint8_t *)&v34,  8u);
  }

  id v25 = _CloudServicesSignpostLogSystem();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134218496;
    os_signpost_id_t v35 = v12;
    __int16 v36 = 2048;
    double v37 = Nanoseconds / 1000000000.0;
    __int16 v38 = 1026;
    BOOL v39 = v20 == 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RestoreEMCSBackup  CloudServicesSignpostNameRestoreEMCSBackup=%{public,signpost.telemetry:number1, name=CloudServicesSignpostNameRestoreEMCSBackup}d ",  (uint8_t *)&v34,  0x1Cu);
  }

  uint64_t v27 = kdebug_trace(733020984LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v28 = CloudServicesLog(v27);
  BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 134217984;
    os_signpost_id_t v35 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "_SecKeychainRestoreBackup() returned %ld",  (uint8_t *)&v34,  0xCu);
  }

  if (v20)
  {
    id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  @"_SecKeychainRestoreBackup() failed",  NSLocalizedDescriptionKey);
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v20,  0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, NSUnderlyingErrorKey);

    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v30));
  }

  else
  {
    id v32 = 0LL;
  }

  return v32;
}

- (id)restoreEMCSBackup:(id)a3 withPassword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _metadata](self, "_metadata"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"timestamp"]);
  if (v10) {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v10));
  }
  else {
    id v11 = @"before we saved timestamps";
  }
  uint64_t v39 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"backup"]);
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"keybag"]);
  id v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 sha1Digest]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"uuid"]);
  uint64_t v14 = CloudServicesLog(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138413058;
    uint64_t v42 = v11;
    __int16 v43 = 2112;
    uint64_t v44 = v40;
    __int16 v45 = 2112;
    uint64_t v46 = v9;
    __int16 v47 = 2112;
    uint64_t v48 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "found backup from %@, keybag digest %@, metadataDigest %@, uuid %@",  buf,  0x2Au);
  }

  __int16 v38 = v11;
  if (v13)
  {
    double v37 = v10;
    id v17 = v9;
    id v18 = v8;
    id v19 = v7;
    int v20 = (__CFString *)CFPreferencesCopyAppValue(@"EMCSBackupUUID", SECURE_BACKUP_SERVICE_NAME);
    id v21 = -[__CFString isEqualToString:](v20, "isEqualToString:", v13);
    int v22 = (int)v21;
    uint64_t v23 = CloudServicesLog(v21);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      id v7 = v19;
      if (v25)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found matching backup from this device, skipping keychain restore",  buf,  2u);
      }

      id v26 = 0LL;
      id v8 = v18;
      id v9 = v17;
      id v10 = v37;
      goto LABEL_29;
    }

    if (v25)
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v42 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Backup does not match this device's last backup uuid (%@)",  buf,  0xCu);
    }

    id v7 = v19;
    id v8 = v18;
    id v9 = v17;
    id v10 = v37;
    id v11 = v38;
  }

  uint64_t v27 = (void *)v39;
  if (!v12 || !v39)
  {
    uint64_t v28 = CloudServicesLog(v16);
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    id v36 = v7;
    if (v39) {
      id v31 = @"non-";
    }
    else {
      id v31 = &stru_10006AB28;
    }
    if (v30)
    {
      if (v12) {
        id v32 = @"non-";
      }
      else {
        id v32 = &stru_10006AB28;
      }
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v42 = (__CFString *)v31;
      __int16 v43 = 2112;
      uint64_t v44 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "attempted restore with backup = %@nil, keybag = %@nil",  buf,  0x16u);
    }

    else if (v12)
    {
      id v32 = @"non-";
    }

    else
    {
      id v32 = &stru_10006AB28;
    }

    id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v34 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"attempted restore with backup = %@nil, keybag = %@nil",  v31,  v32);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  v34,  NSLocalizedDescriptionKey);

    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v33));
    id v7 = v36;
LABEL_29:
    id v11 = v38;
    uint64_t v27 = (void *)v39;
    goto LABEL_30;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon restoreEMCSBackup:keybag:password:]( self,  "restoreEMCSBackup:keybag:password:",  v39,  v12,  v7));
LABEL_30:

  return v26;
}

- (void)recoverEscrowWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CloudServicesSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _CloudServicesSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _CloudServicesSignpostLogSystem();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 138543362;
    os_signpost_id_t v50 = (os_signpost_id_t)v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "RecoverEscrowWithRequest",  " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0xCu);
  }

  id v17 = _CloudServicesSignpostLogSystem();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 134218242;
    os_signpost_id_t v50 = v10;
    __int16 v51 = 2114;
    uint64_t v52 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverEscrowWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0x16u);
  }

  uint64_t v21 = CloudServicesLog(v20);
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    *(_DWORD *)__int128 buf = 138412546;
    os_signpost_id_t v50 = (os_signpost_id_t)v23;
    __int16 v51 = 2112;
    uint64_t v52 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Attempting recovery of record %@ with metadata: %@",  buf,  0x16u);
  }

  BOOL v25 = objc_alloc(&OBJC_CLASS___EscrowService);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  uint64_t v27 = -[EscrowService initWithOperationsLogger:](v25, "initWithOperationsLogger:", v26);

  id v28 = _CloudServicesSignpostLogSystem();
  BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  os_signpost_id_t v30 = _CloudServicesSignpostCreate(v29);
  uint64_t v32 = v31;

  id v33 = _CloudServicesSignpostLogSystem();
  int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  os_signpost_id_t v35 = v34;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 138543362;
    os_signpost_id_t v50 = (os_signpost_id_t)v36;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  v30,  "RecoverRecordWithRequest",  " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0xCu);
  }

  id v37 = _CloudServicesSignpostLogSystem();
  __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 134218242;
    os_signpost_id_t v50 = v30;
    __int16 v51 = 2114;
    uint64_t v52 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverRecordWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0x16u);
  }

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  void v42[2] = sub_100021060;
  v42[3] = &unk_100069668;
  uint64_t v46 = v32;
  os_signpost_id_t v47 = v10;
  uint64_t v48 = v12;
  id v44 = v7;
  os_signpost_id_t v45 = v30;
  v42[4] = self;
  id v43 = v6;
  id v40 = v6;
  id v41 = v7;
  -[EscrowService recoverRecordWithRequest:completionBlock:](v27, "recoverRecordWithRequest:completionBlock:", v40, v42);
}

- (id)keysOfEntriesContainingObject:(id)a3 backups:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _DWORD v8[2] = sub_100022210;
  v8[3] = &unk_100069010;
  id v9 = a3;
  id v5 = v9;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 keysOfEntriesPassingTest:v8]);

  return v6;
}

- (int64_t)compareEscrowDatesBetweenCurrentRecord:(id)a3 andCandidateRecord:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[a3 creationDate]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v5 creationDate]));
  id v8 = [v6 compare:v7];
  uint64_t v9 = CloudServicesLog(v8);
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 == (id)-1LL)
  {
    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 recordId]);
      int v15 = 138412290;
      uint64_t v16 = v12;
      id v13 = "candidate record (%@) is newer";
      goto LABEL_6;
    }
  }

  else if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 recordId]);
    int v15 = 138412290;
    uint64_t v16 = v12;
    id v13 = "candidate record (%@) is not newer";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
  }

  return (int64_t)v8;
}

- (int64_t)compare:(id)a3 with:(id)a4 backups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 escrowInformationMetadata]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 backupKeybagDigest]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 escrowInformationMetadata]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 backupKeybagDigest]);

  int v15 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon keysOfEntriesContainingObject:backups:]( self,  "keysOfEntriesContainingObject:backups:",  v12,  v10));
  uint64_t v16 = (void *)v14;
  id v53 = v10;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon keysOfEntriesContainingObject:backups:]( self,  "keysOfEntriesContainingObject:backups:",  v14,  v10));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v8 creationDate]));
  id v54 = v9;
  uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v9 creationDate]));
  v55 = (void *)v19;
  if ([v15 isEqualToSet:v17])
  {
    int64_t v20 = (int64_t)[v18 compare:v19];
    uint64_t v21 = CloudServicesLog(v20);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    id v24 = v18;
    BOOL v25 = v16;
    if (v20 == -1)
    {
      id v26 = v53;
      if (v23)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover same views but is newer",  buf,  2u);
      }

      int64_t v20 = -1LL;
    }

    else
    {
      id v26 = v53;
      if (v23)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "candidate can recover same views but is not newer",  buf,  2u);
      }
    }

    id v36 = v54;
    goto LABEL_30;
  }

  __int16 v51 = v12;
  id v52 = v8;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v27 = [&off_10006DAC8 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (!v27) {
    goto LABEL_14;
  }
  id v28 = v27;
  uint64_t v29 = *(void *)v57;
  while (2)
  {
    for (i = 0LL; i != v28; i = (char *)i + 1)
    {
      if (*(void *)v57 != v29) {
        objc_enumerationMutation(&off_10006DAC8);
      }
      uint64_t v31 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)i);
      id v32 = [v15 compareMembershipOfObject:v31 withSet:v17];
      int64_t v20 = (int64_t)v32;
      if (v32 == (id)1)
      {
        uint64_t v37 = CloudServicesLog(1LL);
        int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v61 = v31;
          __int16 v38 = "candidate cannot recover %@";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
        }

- (void)sortForMatchingPassphraseLengthAndPlatform:(id)a3 secureBackups:(id)a4 passphraseLength:(unint64_t)a5 platform:(unint64_t)a6 reply:(id)a7
{
  id v9 = a3;
  id v78 = a4;
  id v10 = (void (**)(id, void *, void *, void))a7;
  uint64_t v11 = CloudServicesLog(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v94 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "looking for record for silent attempt of passphrase length %llu",  buf,  0xCu);
  }

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id v13 = v9;
  id v88 = [v13 countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (!v88)
  {
    v83 = 0LL;
    uint64_t v71 = 0LL;
    id v68 = 0LL;
    v74 = (os_log_s *)v13;
    unint64_t v75 = a5;
    goto LABEL_82;
  }

  uint64_t v77 = v10;
  id v81 = 0LL;
  uint64_t v82 = 0LL;
  v83 = 0LL;
  uint64_t v14 = &ACAccountTypeIdentifierAppleAccount_ptr;
  uint64_t v87 = *(void *)v90;
  unint64_t v86 = a5;
  id v84 = v13;
  do
  {
    int v15 = 0LL;
    do
    {
      if (*(void *)v90 != v87) {
        objc_enumerationMutation(v13);
      }
      uint64_t v16 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)v15);
      id v17 = objc_autoreleasePoolPush();
      id v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14[73],  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)objc_msgSend(v16, "creationDate")));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 recordId]);
      uint64_t v20 = CloudServicesLog(v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v18));
        *(_DWORD *)__int128 buf = 138412546;
        unint64_t v94 = (unint64_t)v19;
        __int16 v95 = 2112;
        unint64_t v96 = (unint64_t)v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "checking escrow record: %@ from %@",  buf,  0x16u);
      }

      id v23 = [v16 remainingAttempts];
      id v24 = [v16 silentAttemptAllowed];
      if (v23 == (id)10 && v24 != 0LL)
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v16 escrowInformationMetadata]);
        os_signpost_id_t v30 = (void *)objc_claimAutoreleasedReturnValue([v16 escrowInformationMetadata]);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 clientMetadata]);

        uint64_t v33 = CloudServicesLog(v32);
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          unint64_t v94 = (unint64_t)v29;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "metadata containing bottle: %@",  buf,  0xCu);
        }

        id v36 = [v31 devicePlatform];
        id v37 = [v31 secureBackupUsesNumericPassphrase];
        if (v36 == (id)a6)
        {
          if (v37)
          {
            id v38 = [v31 secureBackupNumericPassphraseLength];
            uint64_t v39 = CloudServicesLog(v38);
            id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
            if ((unint64_t)v38 > a5)
            {
              if (v41)
              {
                *(_DWORD *)__int128 buf = 134218240;
                unint64_t v94 = (unint64_t)v38;
                __int16 v95 = 2048;
                unint64_t v96 = a5;
                uint64_t v42 = v40;
                id v43 = "escrow passphrase length (%llu) longer than silent attempt passphrase (%llu), skipping";
                uint32_t v44 = 22;
                goto LABEL_29;
              }

              goto LABEL_30;
            }

            if (v41)
            {
              *(_DWORD *)__int128 buf = 134217984;
              unint64_t v94 = (unint64_t)v38;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "found clean record with passwordLength: %llu",  buf,  0xCu);
            }

            uint64_t v51 = _os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn");
            if ((_DWORD)v51)
            {
              id v52 = v83;
              if (!v83
                || (uint64_t v51 = -[SecureBackupDaemon compareEscrowDatesBetweenCurrentRecord:andCandidateRecord:]( self,  "compareEscrowDatesBetweenCurrentRecord:andCandidateRecord:",  v83,  v16)) != 0)
              {
                uint64_t v53 = CloudServicesLog(v51);
                id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = @"better";
                  if (!v83) {
                    v55 = @"first";
                  }
                  goto LABEL_66;
                }

                goto LABEL_67;
              }

              uint64_t v65 = CloudServicesLog(0LL);
              id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
LABEL_71:
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "keeping current candidate",  buf,  2u);
              }

- (void)_recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 reply:(id)a5
{
  id v64 = a3;
  id v61 = a4;
  id v62 = a5;
  uint64_t v8 = CloudServicesLog(v62);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverSilentWithCDPContext:allRecords:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v63 = (void *)objc_claimAutoreleasedReturnValue( +[OTEscrowTranslation CDPRecordContextToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "CDPRecordContextToDictionary:",  v64));
  id v10 = -[SecureBackup initWithUserActivityLabel:]( objc_alloc(&OBJC_CLASS___SecureBackup),  "initWithUserActivityLabel:",  @"silent escrow recovery");
  -[SecureBackup populateWithInfo:](v10, "populateWithInfo:", v63);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  -[SecureBackup setQueue:](v10, "setQueue:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup error](v10, "error"));
  if (!v12)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v88 = 0x3032000000LL;
    __int128 v89 = sub_100011D74;
    __int128 v90 = sub_100011D84;
    id v91 = (id)0xAAAAAAAAAAAAAAAALL;
    id v91 = (id)os_transaction_create("Recovery");
    uint64_t v16 = CloudServicesLog(v91);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100046074();
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup passphrase](v10, "passphrase"));
    BOOL v19 = [v18 length] == 0;

    if (!v19) {
      goto LABEL_8;
    }
    id v48 = -[SecureBackup useCachedPassphrase](v10, "useCachedPassphrase");
    if ((_DWORD)v48)
    {
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedPassphrase](self, "cachedPassphrase"));
      -[SecureBackup setPassphrase:](v10, "setPassphrase:", v49);

      BOOL v50 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup passphrase](v10, "passphrase"));
      BOOL v51 = [v50 length] == 0;

      if (!v51)
      {
LABEL_8:
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup passphrase](v10, "passphrase"));
        id v60 = [v20 length];

        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        id v21 = v61;
        id v22 = [v21 countByEnumeratingWithState:&v74 objects:v82 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v75;
          while (2)
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v75 != v23) {
                objc_enumerationMutation(v21);
              }
              BOOL v25 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
              id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recordId", v60));
              if (v26)
              {
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedRecordID](self, "cachedRecordID"));
                unsigned int v28 = [v27 isEqualToString:v26];

                if (v28)
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v25 creationDate]));
                  uint64_t v36 = CloudServicesLog(v35);
                  id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities localStringFromDate:]( &OBJC_CLASS___CSDateUtilities,  "localStringFromDate:",  v35));
                    *(_DWORD *)id v78 = 138412546;
                    v79 = v26;
                    __int16 v80 = 2112;
                    id v81 = v38;
                    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "found preferred record: %@ from %@",  v78,  0x16u);
                  }

                  -[SecureBackup setRecordID:](v10, "setRecordID:", v26);
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v25 escrowInformationMetadata]);
                  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[OTEscrowTranslation metadataToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "metadataToDictionary:",  v39));
                  -[SecureBackup setMetadata:](v10, "setMetadata:", v40);

                  uint64_t v42 = CloudServicesLog(v41);
                  id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    uint32_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup metadata](v10, "metadata"));
                    *(_DWORD *)id v78 = 138412290;
                    v79 = v44;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "using metadata :%@", v78, 0xCu);
                  }

                  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedRecordID](self, "cachedRecordID"));
                  unsigned int v46 = [v45 isEqualToString:v26];

                  if (v46)
                  {
                    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedRecordIDPassphrase](self, "cachedRecordIDPassphrase"));
                    -[SecureBackup setPassphrase:](v10, "setPassphrase:", v47);
                  }

                  else
                  {
                    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup passphrase](v10, "passphrase"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue([v47 substringToIndex:v60]);
                    -[SecureBackup setPassphrase:](v10, "setPassphrase:", v55);
                  }

                  v71[0] = _NSConcreteStackBlock;
                  v71[1] = 3221225472LL;
                  v71[2] = sub_100023D0C;
                  v71[3] = &unk_100069690;
                  id v72 = v62;
                  p___int128 buf = &buf;
                  -[SecureBackupDaemon recoverEscrowWithRequest:reply:]( self,  "recoverEscrowWithRequest:reply:",  v10,  v71);

                  uint64_t v32 = v21;
                  goto LABEL_40;
                }
              }
            }

            id v22 = [v21 countByEnumeratingWithState:&v74 objects:v82 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        uint64_t v30 = CloudServicesLog(v29);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v78 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "sorting through backups!", v78, 2u);
        }

        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon secureBackups](self, "secureBackups"));
        if ([v32 count]
          || !OctagonPlatformSupportsSOS(0LL)
          || (uint64_t v33 = _os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn"), (_DWORD)v33))
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          v67[2] = sub_100023D44;
          v67[3] = &unk_1000696B8;
          v70[0] = v62;
          id v68 = v10;
          uint64_t v69 = self;
          v70[1] = &buf;
          -[SecureBackupDaemon sortForMatchingPassphraseLengthAndPlatform:secureBackups:passphraseLength:platform:reply:]( self,  "sortForMatchingPassphraseLengthAndPlatform:secureBackups:passphraseLength:platform:reply:",  v21,  v32,  v60,  1LL,  v67);

          id v34 = (void **)v70;
        }

        else
        {
          uint64_t v58 = CloudServicesLog(v33);
          id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_100046048();
          }

          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472LL;
          v65[2] = sub_100024054;
          v65[3] = &unk_100069350;
          id v66 = v62;
          -[SecureBackupDaemon _recoverWithRequest:reply:](self, "_recoverWithRequest:reply:", v10, v65);
          id v34 = &v66;
        }

        id v26 = *v34;
        goto LABEL_40;
      }

      uint64_t v53 = CloudServicesLog(v52);
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v78 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Missing cached passphrase", v78, 2u);
      }

      NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
      unint64_t v86 = @"Missing cached passphrase";
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  9LL,  v32));
      (*((void (**)(id, void, void *))v62 + 2))(v62, 0LL, v26);
    }

    else
    {
      uint64_t v56 = CloudServicesLog(v48);
      uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v78 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "attempted to recover with empty passphrase",  v78,  2u);
      }

      NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
      id v84 = @"attempted to recover with empty passphrase";
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v32));
      (*((void (**)(id, void, void *))v62 + 2))(v62, 0LL, v26);
    }

- (void)_recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = CloudServicesLog(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverWithCDPContext:escrowRecord:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v13 = -[SecureBackup initWithUserActivityLabel:]( objc_alloc(&OBJC_CLASS___SecureBackup),  "initWithUserActivityLabel:",  @"escrow recovery");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[OTEscrowTranslation CDPRecordContextToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "CDPRecordContextToDictionary:",  v8));
  -[SecureBackup populateWithInfo:](v13, "populateWithInfo:", v14);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 escrowInformationMetadata]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[OTEscrowTranslation metadataToDictionary:]( &OBJC_CLASS___OTEscrowTranslation,  "metadataToDictionary:",  v15));
  -[SecureBackup setMetadata:](v13, "setMetadata:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 recordId]);
  -[SecureBackup setRecordID:](v13, "setRecordID:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  -[SecureBackup setQueue:](v13, "setQueue:", v18);

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup error](v13, "error"));
  if (v19)
  {
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackup error](v13, "error"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, NSUnderlyingErrorKey);

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v20));
    v10[2](v10, 0LL, v22);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = sub_100011D74;
    uint64_t v31 = sub_100011D84;
    id v32 = (id)0xAAAAAAAAAAAAAAAALL;
    id v32 = (id)os_transaction_create("Recovery");
    uint64_t v23 = CloudServicesLog(v32);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100046114();
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000244E0;
    v25[3] = &unk_100069690;
    id v26 = v10;
    p___int128 buf = &buf;
    -[SecureBackupDaemon recoverEscrowWithRequest:reply:](self, "recoverEscrowWithRequest:reply:", v13, v25);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  id v24 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void))a7;
  uint64_t v15 = CloudServicesLog(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v26 = "-[SecureBackupDaemon _restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v17 = (void *)os_transaction_create("Restore Keychain");
  uint64_t v18 = CloudServicesLog(v17);
  BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100046188();
  }

  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _KVSKeybag](self, "_KVSKeybag"));
  id v22 = [v13 mutableCopy];
  id v23 = -[NSMutableSet mutableCopy](v20, "mutableCopy");
  -[SecureBackupDaemon _restoreKeychainAsyncWithBackupBag:password:keybagDigest:haveBottledPeer:restoredViews:viewsNotToBeRestored:]( self,  "_restoreKeychainAsyncWithBackupBag:password:keybagDigest:haveBottledPeer:restoredViews:viewsNotToBeRestored:",  v21,  v24,  v12,  v9,  v23,  v22);
  v14[2](v14, 0LL);
}

- (void)_recoverWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 guitarfish] && objc_msgSend(v6, "guitarfishToken"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  0LL));
    v7[2](v7, 0LL, v8);

    goto LABEL_50;
  }

  id v9 = [v6 guitarfishToken];
  if ((_DWORD)v9)
  {
    -[SecureBackupDaemon recoverGuitarfishTokenWithRequest:reply:]( self,  "recoverGuitarfishTokenWithRequest:reply:",  v6,  v7);
    goto LABEL_50;
  }

  uint64_t v10 = CloudServicesLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SecureBackupDaemon _recoverWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v13)
  {
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, NSUnderlyingErrorKey);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v14));
    v7[2](v7, 0LL, v16);

    goto LABEL_50;
  }

  id v17 = [v6 idmsRecovery];
  if ((_DWORD)v17)
  {
    uint64_t v18 = CloudServicesLog(v17);
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Performing IDMS Recovery",  (uint8_t *)&buf,  2u);
    }

    [v6 setIcdp:1];
    [v6 setUseRecoveryPET:1];
    uint64_t v20 = objc_alloc(&OBJC_CLASS___EscrowService);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    id v22 = -[EscrowService initWithOperationsLogger:](v20, "initWithOperationsLogger:", v21);

    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = sub_1000253C4;
    v83[3] = &unk_1000696E0;
    unint64_t v86 = v7;
    id v84 = v6;
    NSErrorUserInfoKey v85 = self;
    -[EscrowService recoverRecordWithRequest:completionBlock:]( v22,  "recoverRecordWithRequest:completionBlock:",  v84,  v83);

    goto LABEL_50;
  }

  id v23 = [v6 fmipRecovery];
  if ((_DWORD)v23)
  {
    uint64_t v24 = CloudServicesLog(v23);
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Performing FMIP recovery",  (uint8_t *)&buf,  2u);
    }

    [v6 setIcdp:1];
    id v26 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    unsigned int v28 = -[EscrowService initWithOperationsLogger:](v26, "initWithOperationsLogger:", v27);

    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472LL;
    v81[2] = sub_100025938;
    v81[3] = &unk_100069350;
    uint64_t v82 = v7;
    -[EscrowService recoverRecordWithRequest:completionBlock:]( v28,  "recoverRecordWithRequest:completionBlock:",  v6,  v81);

    goto LABEL_50;
  }

  id v29 = [v6 stingray];
  if ((_DWORD)v29)
  {
    uint64_t v30 = CloudServicesLog(v29);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Performing Stingray recovery",  (uint8_t *)&buf,  2u);
    }

    id v32 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    id v34 = -[EscrowService initWithOperationsLogger:](v32, "initWithOperationsLogger:", v33);

    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_100025CA0;
    v79[3] = &unk_100069350;
    __int16 v80 = v7;
    -[EscrowService recoverRecordWithRequest:completionBlock:]( v34,  "recoverRecordWithRequest:completionBlock:",  v6,  v79);

    goto LABEL_50;
  }

  id v35 = [v6 usesRecoveryKey];
  if (!(_DWORD)v35) {
    goto LABEL_27;
  }
  uint64_t v36 = CloudServicesLog(v35);
  id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Using cached recovery key",  (uint8_t *)&buf,  2u);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedRecoveryKey](self, "cachedRecoveryKey"));
  [v6 setRecoveryKey:v38];

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v6 recoveryKey]);
  LODWORD(v38) = v39 == 0LL;

  if ((_DWORD)v38)
  {
    uint64_t v67 = CloudServicesLog(v40);
    id v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_1000461FC();
    }

    uint64_t v69 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v69,  "setObject:forKeyedSubscript:",  @"silent attempt with missing cached recovery key",  NSLocalizedDescriptionKey);
    id v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v69));
    v7[2](v7, 0LL, v70);
  }

  else
  {
LABEL_27:
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
    BOOL v42 = [v41 length] == 0;

    if (!v42) {
      goto LABEL_28;
    }
    id v52 = [v6 useCachedPassphrase];
    if ((_DWORD)v52)
    {
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedPassphrase](self, "cachedPassphrase"));
      [v6 setPassphrase:v53];

      id v54 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
      BOOL v55 = [v54 length] == 0;

      if (!v55)
      {
LABEL_28:
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v88 = 0x3032000000LL;
        __int128 v89 = sub_100011D74;
        __int128 v90 = sub_100011D84;
        id v91 = (id)0xAAAAAAAAAAAAAAAALL;
        id v91 = (id)os_transaction_create("Recovery");
        if (([v6 icdp] & 1) != 0
          || (BOOL v43 = -[SecureBackupDaemon _usesEscrow](self, "_usesEscrow")))
        {
          id v44 = [v6 icdp];
          if ((_DWORD)v44 && (id v44 = [v6 silent], (_DWORD)v44))
          {
            uint64_t v45 = CloudServicesLog(v44);
            unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_100046228();
            }

            id v47 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
            id v48 = [v47 length];
            v74[0] = _NSConcreteStackBlock;
            v74[1] = 3221225472LL;
            v74[2] = sub_100026250;
            v74[3] = &unk_100069708;
            __int128 v77 = v7;
            id v75 = v6;
            __int128 v76 = self;
            p___int128 buf = &buf;
            -[SecureBackupDaemon recordIDAndMetadataForSilentAttempt:passphraseLength:platform:reply:]( self,  "recordIDAndMetadataForSilentAttempt:passphraseLength:platform:reply:",  v75,  v48,  1LL,  v74);

            uint64_t v49 = v77;
          }

          else
          {
            uint64_t v50 = CloudServicesLog(v44);
            BOOL v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
              sub_100046114();
            }

            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472LL;
            v71[2] = sub_100026498;
            v71[3] = &unk_100069690;
            id v72 = v7;
            uint64_t v73 = &buf;
            -[SecureBackupDaemon recoverEscrowWithRequest:reply:](self, "recoverEscrowWithRequest:reply:", v6, v71);
            uint64_t v49 = v72;
          }
        }

        else
        {
          uint64_t v65 = CloudServicesLog(v43);
          id v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_100046254();
          }

          v7[2](v7, 0LL, 0LL);
          uint64_t v49 = *(void **)(*((void *)&buf + 1) + 40LL);
          *(void *)(*((void *)&buf + 1) + 40LL) = 0LL;
        }

        _Block_object_dispose(&buf, 8);
        goto LABEL_50;
      }

      uint64_t v57 = CloudServicesLog(v56);
      uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Missing cached passphrase",  (uint8_t *)&buf,  2u);
      }

      NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
      __int16 v95 = @"Missing cached passphrase";
      id v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
      id v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  9LL,  v59));
      v7[2](v7, 0LL, v60);
    }

    else
    {
      uint64_t v61 = CloudServicesLog(v52);
      id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "attempted to recover with empty passphrase",  (uint8_t *)&buf,  2u);
      }

      NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
      __int128 v93 = @"attempted to recover with empty passphrase";
      id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
      id v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v63));
      v7[2](v7, 0LL, v64);
    }
  }

- (void)recoverWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000265A4;
  v10[3] = &unk_100069450;
  id v11 = (id)os_transaction_create("recoverWithRequest");
  id v12 = v6;
  id v8 = v11;
  id v9 = v6;
  -[SecureBackupDaemon _recoverWithRequest:reply:](self, "_recoverWithRequest:reply:", v7, v10);
}

- (void)recoverWithCDPContextInDaemon:(id)a3 escrowRecord:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002670C;
  v13[3] = &unk_100069450;
  id v14 = (id)os_transaction_create("recoverWithCDPContextInDaemon");
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  -[SecureBackupDaemon _recoverWithCDPContext:escrowRecord:reply:]( self,  "_recoverWithCDPContext:escrowRecord:reply:",  v10,  v9,  v13);
}

- (void)recoverSilentWithCDPContextInDaemon:(id)a3 allRecords:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100026874;
  v13[3] = &unk_100069450;
  id v14 = (id)os_transaction_create("recoverSilentWithCDPContextInDaemon");
  id v15 = v8;
  id v11 = v14;
  id v12 = v8;
  -[SecureBackupDaemon _recoverSilentWithCDPContext:allRecords:reply:]( self,  "_recoverSilentWithCDPContext:allRecords:reply:",  v10,  v9,  v13);
}

- (void)restoreKeychainWithBackupPasswordInDaemon:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, BOOL, id))a4;
  id v7 = a3;
  kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
  id v10 = 0LL;
  BOOL v8 = -[SecureBackupDaemon _restoreKeychainWithBackupPassword:keybagDigest:error:]( self,  "_restoreKeychainWithBackupPassword:keybagDigest:error:",  v7,  0LL,  &v10);

  id v9 = v10;
  kdebug_trace(733020568LL, 0LL, 0LL, 0LL, 0LL);
  v6[2](v6, v8, v9);
}

- (void)removeRecoveryKeyFromBackupInDaemon:(id)a3
{
  id v7 = 0LL;
  uint64_t v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = -[SecureBackupDaemon removeRecoveryKey:](self, "removeRecoveryKey:", &v7);
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (BOOL)removeRecoveryKey:(id *)a3
{
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = sub_100011D74;
  uint64_t v40 = sub_100011D84;
  id v41 = 0LL;
  uint64_t v33 = 0LL;
  v34[0] = &v33;
  v34[1] = 0x2020000000LL;
  char v35 = 0;
  uint64_t v30 = 0LL;
  v31[0] = &v30;
  v31[1] = 0x2020000000LL;
  char v32 = 0;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon kvsQueue](self, "kvsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026C48;
  block[3] = &unk_100069730;
  block[4] = self;
  void block[5] = &v36;
  block[6] = &v33;
  block[7] = &v30;
  dispatch_sync(v5, block);

  if (*(_BYTE *)(v34[0] + 24LL) && *(_BYTE *)(v31[0] + 24LL))
  {
    uint64_t v7 = CloudServicesLog(v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "recovery key removed from iCloudIdentity and PCS keybags",  v28,  2u);
    }

    BOOL v9 = 1;
  }

  else
  {
    uint64_t v10 = CloudServicesLog(v6);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000462EC((uint64_t)v34, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v19 = CloudServicesLog(v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100046280((uint64_t)v31, v20, v21, v22, v23, v24, v25, v26);
    }

    BOOL v9 = 0;
    if (a3) {
      *a3 = (id) v37[5];
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v36, 8);

  return v9;
}

- (void)verifyRecoveryKeyInDaemon:(id)a3 reply:(id)a4
{
  id v9 = 0LL;
  uint64_t v6 = (void (**)(id, BOOL, id))a4;
  BOOL v7 = -[SecureBackupDaemon verifyRecoveryKey:error:](self, "verifyRecoveryKey:error:", a3, &v9);
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = sub_100011D74;
  id v37 = sub_100011D84;
  id v38 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon backupQueue](self, "backupQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000275BC;
  block[3] = &unk_100069758;
  id v8 = v6;
  id v20 = v8;
  uint64_t v21 = self;
  uint64_t v22 = &v29;
  uint64_t v23 = &v33;
  uint64_t v24 = &v25;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v30 + 24))
  {
    if (*((_BYTE *)v26 + 24))
    {
      uint64_t v10 = CloudServicesLog(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "recovery key verified against iCloudIdentity and PCSMasterKey keybags",  buf,  2u);
      }

- (void)isRecoveryKeySetInDaemon:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL, id))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  id v8 = 0LL;
  BOOL v6 = -[SecureBackupDaemon hasRecoveryKeyInKVS:error:](self, "hasRecoveryKeyInKVS:error:", v5, &v8);
  id v7 = v8;
  v4[2](v4, v6, v7);
}

- (void)restoreKeychainAsyncWithPasswordInDaemon:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 reply:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
  uint64_t v16 = (void *)os_transaction_create("restoreKeychainAsyncWithBackupBagInDaemon");
  uint64_t v17 = CloudServicesLog(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v25 = "-[SecureBackupDaemon restoreKeychainAsyncWithPasswordInDaemon:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100027C40;
  v21[3] = &unk_1000694A0;
  id v22 = v16;
  id v23 = v12;
  id v19 = v16;
  id v20 = v12;
  -[SecureBackupDaemon _restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:]( self,  "_restoreKeychainAsyncWithPassword:keybagDigest:haveBottledPeer:viewsNotToBeRestored:reply:",  v15,  v14,  v8,  v13,  v21);
}

- (void)recoverRecordContentsWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = (void *)os_transaction_create("recoverRecordContentsWithRequest");
  uint64_t v9 = CloudServicesLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v22 = "-[SecureBackupDaemon recoverRecordContentsWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v12)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, NSUnderlyingErrorKey);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v13));
    v7[2](v7, 0LL, v15);
  }

  else
  {
    kdebug_trace(733020564LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v16 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    id v13 = -[EscrowService initWithOperationsLogger:](v16, "initWithOperationsLogger:", v17);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100027F00;
    v18[3] = &unk_100069450;
    id v20 = v7;
    id v19 = v8;
    -[NSMutableDictionary recoverRecordWithRequest:completionBlock:]( v13,  "recoverRecordWithRequest:completionBlock:",  v6,  v18);

    id v15 = v20;
  }
}

- (void)createICDPRecordWithRequest:(id)a3 recordContents:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v11 = (void *)os_transaction_create("createICDPRecordWithRequest");
  uint64_t v12 = CloudServicesLog(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)id v59 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v14 = sub_1000052A8();
  if ((v14 & 1) == 0)
  {
    uint64_t v19 = CloudServicesLog(v14);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)id v59 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s is only available on internal releases",  buf,  0xCu);
    }

    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = v21;
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v23 = @"Invalid OS version for call";
    goto LABEL_28;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v8 setQueue:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
  if (v16)
  {
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, NSUnderlyingErrorKey);

LABEL_29:
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v17));
    v10[2](v10, v35);
    goto LABEL_30;
  }

  id v24 = [v8 icdp];
  if (!(_DWORD)v24
    || (id v24 = [v8 usesMultipleiCSC], !(_DWORD)v24)
    || (uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 passphrase]),
        id v26 = [v25 length],
        v25,
        !v26))
  {
    uint64_t v45 = CloudServicesLog(v24);
    unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)id v59 = "-[SecureBackupDaemon createICDPRecordWithRequest:recordContents:reply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "In %s, request doesn't look right",  buf,  0xCu);
    }

    uint64_t v48 = CloudServicesLog(v47);
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v50 = [v8 icdp];
      unsigned int v51 = [v8 usesMultipleiCSC];
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v8 passphrase]);
      id v53 = [v52 length];
      id v54 = @"present";
      *(_DWORD *)__int128 buf = 67109634;
      *(_DWORD *)id v59 = v50;
      if (!v53) {
        id v54 = @"not present";
      }
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v51;
      __int16 v60 = 2112;
      uint64_t v61 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "request: icdp:%d multipleICSC:%d passphrase:%@",  buf,  0x18u);
    }

    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = v21;
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    id v23 = @"Request must be a multiple-icsc request with a passphrase";
LABEL_28:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v22);
    goto LABEL_29;
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);

  if (!v27)
  {
    uint64_t v29 = CloudServicesLog(v28);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "setting DSID", buf, 2u);
    }

    id v31 = sub_100010494();
    char v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    [v8 setDsid:v32];
  }

  uint64_t v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecureBackupUsesMultipleiCSCKey);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities localStringFromDate:](&OBJC_CLASS___CSDateUtilities, "localStringFromDate:", v33));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v34,  kSecureBackupTimestampKey);

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon massageOutgoingMetadataFromRequest:]( self,  "massageOutgoingMetadataFromRequest:",  v8));
  if (v35)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v35 setObject:v36 forKeyedSubscript:kSecureBackupMetadataTimestampKey];

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v35,  kSecureBackupClientMetadataKey);
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _gestaltValueForKey:](self, "_gestaltValueForKey:", @"SerialNumber"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v37,  kSecureBackupSerialNumberKey);

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _gestaltValueForKey:](self, "_gestaltValueForKey:", @"BuildVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v38,  kSecureBackupBuildVersionKey);

  [v8 setMetadata:v17];
  id v39 = [v9 mutableCopy];
  if ([v8 requiresDoubleEnrollment])
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 UUIDString]);
    [v39 setObject:v41 forKeyedSubscript:@"DoubleEnrollmentPassword"];

    [v39 setObject:&off_10006DB10 forKeyedSubscript:@"DoubleEnrollmentVersion"];
  }

  [v8 setEscrowRecord:v39];
  BOOL v42 = objc_alloc(&OBJC_CLASS___EscrowService);
  BOOL v43 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  id v44 = -[EscrowService initWithOperationsLogger:](v42, "initWithOperationsLogger:", v43);

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100028694;
  v55[3] = &unk_100069450;
  uint64_t v57 = v10;
  id v56 = v11;
  -[EscrowService storeRecordWithRequest:completionBlock:](v44, "storeRecordWithRequest:completionBlock:", v8, v55);

LABEL_30:
}

- (void)_deleteAlliCDPRecordsWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordIDs]);
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordIDs]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recordIDs]);
    [v9 removeObjectAtIndex:0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    [v10 setRecordID:v8];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 escrowService]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000288BC;
    v15[3] = &unk_100069780;
    id v16 = v4;
    uint64_t v17 = self;
    [v11 deleteRecordWithRequest:v12 completionBlock:v15];
  }

  else
  {
    id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completionBlock]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 deleteError]);
    ((void (**)(void, void *))v13)[2](v13, v14);
  }
}

- (void)deleteAlliCDPRecordsWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v20 = "-[SecureBackupDaemon deleteAlliCDPRecordsWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100028B7C;
    v15[3] = &unk_1000696E0;
    uint64_t v18 = v7;
    id v16 = v6;
    uint64_t v17 = self;
    -[SecureBackupDaemon getAccountInfoWithRequest:reply:](self, "getAccountInfoWithRequest:reply:", v16, v15);

    uint64_t v12 = v18;
  }
}

- (void)backOffDateWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v18 = "-[SecureBackupDaemon backOffDateWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, 0LL, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100028FD0;
    v15[3] = &unk_100069350;
    id v16 = v7;
    -[SecureBackupDaemon getAccountInfoWithRequest:reply:](self, "getAccountInfoWithRequest:reply:", v6, v15);
    uint64_t v12 = v16;
  }
}

- (void)setBackOffDateWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    unsigned int v51 = "-[SecureBackupDaemon setBackOffDateWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, v14);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 backOffDate]);
    if (v16 && v14)
    {
      uint64_t v18 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v14,  0LL);
      if (v18)
      {
        id v41 = 0LL;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v18,  0LL,  0LL,  &v41));
        id v20 = (NSMutableDictionary *)v41;
        uint64_t v12 = v20;
        if (v19)
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kSecureBackupClientMetadataKey]);
          if (v21)
          {
            [v6 setStingray:1];
            [v6 setMetadata:v21];
            -[SecureBackupDaemon updateMetadataWithRequest:reply:](self, "updateMetadataWithRequest:reply:", v6, v7);
          }

          else
          {
            uint64_t v36 = CloudServicesLog(0LL);
            id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              sub_10004663C();
            }

            NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
            BOOL v43 = @"missing kSecureBackupClientMetadataKey";
            id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
            uint64_t v39 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v38));

            v7[2](v7, (void *)v39);
            uint64_t v12 = (NSMutableDictionary *)v39;
          }
        }

        else
        {
          uint64_t v33 = CloudServicesLog(v20);
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_1000465DC();
          }

          v44[0] = NSLocalizedDescriptionKey;
          v44[1] = NSUnderlyingErrorKey;
          v45[0] = @"metadata could not be decoded";
          v45[1] = v12;
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
          uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v21));

          v7[2](v7, (void *)v35);
          uint64_t v12 = (NSMutableDictionary *)v35;
        }
      }

      else
      {
        uint64_t v31 = CloudServicesLog(0LL);
        char v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_1000465B0();
        }

        NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
        uint64_t v47 = @"encodedMetadata not base64";
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
        uint64_t v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v19));
        v7[2](v7, v12);
      }
    }

    else
    {
      uint64_t v40 = v14;
      uint64_t v22 = CloudServicesLog(v17);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000464A4(v6, v23);
      }

      id v24 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
      if (v25) {
        id v26 = @"have";
      }
      else {
        id v26 = @"missing";
      }
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 backOffDate]);
      if (v27) {
        uint64_t v28 = @"have";
      }
      else {
        uint64_t v28 = @"missing";
      }
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedMetadata]);
      if (v29) {
        uint64_t v30 = @"have";
      }
      else {
        uint64_t v30 = @"missing";
      }
      uint64_t v18 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"missing parameter: %@ metadataHash, %@ backOffDate, %@ encodedMetadata",  v26,  v28,  v30);

      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      uint64_t v49 = v18;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
      uint64_t v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v19));
      v7[2](v7, v12);
      uint64_t v14 = v40;
    }
  }
}

- (void)disableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CloudServicesSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _CloudServicesSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _CloudServicesSignpostLogSystem();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    id v16 = (char *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 138543362;
    unsigned int v51 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "DisableWithRequest",  " enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0xCu);
  }

  id v17 = _CloudServicesSignpostLogSystem();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 activityLabel]);
    *(_DWORD *)__int128 buf = 134218242;
    unsigned int v51 = (const char *)v10;
    __int16 v52 = 2114;
    id v53 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: DisableWithRequest  enableTelemetry=YES  Activity=%{public,signpost.telemetry:string1,name=Activity}@ ",  buf,  0x16u);
  }

  id v20 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v6,  101LL);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  [v21 updateStoreWithEvent:v20];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  void v45[2] = sub_100029CA8;
  v45[3] = &unk_1000694C8;
  os_signpost_id_t v48 = v10;
  uint64_t v49 = v12;
  v45[4] = self;
  uint64_t v22 = v20;
  NSErrorUserInfoKey v46 = v22;
  id v23 = v7;
  id v47 = v23;
  id v24 = objc_retainBlock(v45);
  uint64_t v25 = CloudServicesLog(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    unsigned int v51 = "-[SecureBackupDaemon disableWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v27 = (void *)os_transaction_create("disableWithRequest");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v28];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v29)
  {
    uint64_t v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, NSUnderlyingErrorKey);

    char v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v30));
    ((void (*)(void *, void *))v24[2])(v24, v32);

    goto LABEL_18;
  }

  if ([v6 icdp] && objc_msgSend(v6, "deleteAll"))
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    void v42[2] = sub_100029ECC;
    v42[3] = &unk_1000697A8;
    v42[4] = self;
    id v44 = v24;
    id v43 = v27;
    -[SecureBackupDaemon deleteAlliCDPRecordsWithRequest:reply:]( self,  "deleteAlliCDPRecordsWithRequest:reply:",  v6,  v42);

    goto LABEL_18;
  }

  if ([v6 stingray])
  {
LABEL_17:
    id v34 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v36 = -[EscrowService initWithOperationsLogger:](v34, "initWithOperationsLogger:", v35);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100029F1C;
    void v37[3] = &unk_1000697D0;
    id v38 = v6;
    uint64_t v39 = self;
    id v41 = v24;
    id v40 = v27;
    -[EscrowService deleteRecordWithRequest:completionBlock:](v36, "deleteRecordWithRequest:completionBlock:", v38, v37);

    goto LABEL_18;
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  if (v33)
  {

    goto LABEL_17;
  }

  if (-[SecureBackupDaemon _usesEscrow](self, "_usesEscrow")) {
    goto LABEL_17;
  }
  -[SecureBackupDaemon _disableBackup](self, "_disableBackup");
  if (v24) {
    ((void (*)(void *, void))v24[2])(v24, 0LL);
  }
LABEL_18:
}

- (void)updateMetadataWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    unsigned int v50 = "-[SecureBackupDaemon updateMetadataWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (!v11)
  {
    id v15 = [v6 stingray];
    if ((v15 & 1) == 0)
    {
      uint64_t v32 = CloudServicesLog(v15);
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000466F8();
      }

      NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
      id v56 = @" metadata only supported for stingray records";
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v16));
      v7[2](v7, v34);
      goto LABEL_21;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
    uint64_t v17 = kSecureBackupKeybagSHA256Key;
    uint64_t v46 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupKeybagSHA256Key]);
    uint64_t v18 = kSecureBackupKeybagDigestKey;
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupKeybagDigestKey]);
    uint64_t v20 = kSecureBackupTimestampKey;
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupTimestampKey]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey]);
    uint64_t v22 = kSecureBackupBackOffDateKey;
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupBackOffDateKey]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    id v44 = (void *)v21;
    if (v23 && v46 | v19 && v45)
    {

      if (v21)
      {
        uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v46, v17);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v19, v18);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v45, v20);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v26,  kSecureBackupClientMetadataKey);

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 backOffDate]);
        if (v27)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 backOffDate]);
          [v28 timeIntervalSinceReferenceDate];
          BOOL v30 = v29 > 0.0;

          if (v30)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v6 backOffDate]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v31, v22);
          }
        }

        else if (v43)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v43, v22);
        }

        id v38 = objc_alloc(&OBJC_CLASS___EscrowService);
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
        id v40 = -[EscrowService initWithOperationsLogger:](v38, "initWithOperationsLogger:", v39);

        [v6 setEncodedMetadata:v44];
        uint64_t v41 = CloudServicesLog([v6 setMetadata:v25]);
        NSErrorUserInfoKey v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Attempting to update record metadata",  buf,  2u);
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10002A7DC;
        v47[3] = &unk_100069350;
        os_signpost_id_t v48 = v7;
        -[EscrowService updateRecordMetadataWithRequest:completionBlock:]( v40,  "updateRecordMetadataWithRequest:completionBlock:",  v6,  v47);

        id v34 = 0LL;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
    }

    else
    {
    }

    uint64_t v35 = CloudServicesLog(v24);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (char *)objc_claimAutoreleasedReturnValue([v6 appleID]);
      *(_DWORD *)__int128 buf = 138412546;
      unsigned int v50 = v37;
      __int16 v51 = 2112;
      __int16 v52 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "attempted to update stingray metadata, with invalid parameters: %@, %@ metadata hash",  buf,  0x16u);
    }

    NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
    id v54 = @"attempted to update stingray metadata, with incomplete metadata hash";
    uint64_t v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v25));
    v7[2](v7, v34);
    goto LABEL_20;
  }

  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
  v7[2](v7, v14);

LABEL_22:
}

- (int)storeCachedPassphrase:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    uint64_t v28 = CloudServicesLog(0LL);
    double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100046724();
    }
    goto LABEL_27;
  }

  id v4 = objc_autoreleasePoolPush();
  BOOL v5 = NSTemporaryDirectory();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  id v9 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);
  os_signpost_id_t v10 = (const char *)[v9 fileSystemRepresentation];

  uint64_t v11 = open_dprotected_np(v10, 1794, 1, 0, 384LL);
  if ((v11 & 0x80000000) != 0)
  {
    uint64_t v30 = CloudServicesLog(v11);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_100046750(v31);
    }

    objc_autoreleasePoolPop(v4);
    goto LABEL_28;
  }

  int v12 = v11;
  uint64_t v13 = unlink(v10);
  if ((v13 & 0x80000000) != 0)
  {
    uint64_t v32 = CloudServicesLog(v13);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100046838(v19);
    }
    goto LABEL_24;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

  v43[0] = kSecureBackupPassphraseKey;
  v43[1] = @"uuid";
  v44[0] = v3;
  v44[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
  id v40 = 0LL;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v16,  200LL,  0LL,  &v40));
  uint64_t v18 = (os_log_s *)v40;
  uint64_t v19 = v18;
  if (!v17)
  {
    uint64_t v33 = CloudServicesLog(v18);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000468AC();
    }
    goto LABEL_23;
  }

  uint64_t v20 = ftruncate(v12, (off_t)[v17 length]);
  if ((v20 & 0x80000000) != 0)
  {
    uint64_t v34 = CloudServicesLog(v20);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10004690C(v27);
    }
    goto LABEL_23;
  }

  id v21 = v17;
  ssize_t v22 = pwrite(v12, [v21 bytes], (size_t)objc_msgSend(v21, "length"), 0);
  if (v22 < 0)
  {
    uint64_t v35 = CloudServicesLog(v22);
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100046980(v27);
    }
    goto LABEL_23;
  }

  uint64_t v23 = v22;
  uint64_t v39 = v15;
  id v24 = [v21 length];
  uint64_t v25 = CloudServicesLog(v24);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = v26;
  if (v23 < (uint64_t)v24)
  {
    id v15 = v39;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000469F4(v21, v23, v27);
    }
LABEL_23:

LABEL_24:
    objc_autoreleasePoolPop(v4);
    uint64_t v36 = close(v12);
    if ((v36 & 0x80000000) == 0)
    {
LABEL_28:
      int v12 = -1;
      goto LABEL_29;
    }

    uint64_t v37 = CloudServicesLog(v36);
    double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000467C4(v29);
    }
LABEL_27:

    goto LABEL_28;
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    NSErrorUserInfoKey v42 = v39;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "saving uuid %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v4);
LABEL_29:

  return v12;
}

- (void)setCachedPassphrase:(id)a3
{
}

- (void)setCachedRecordIDPassphrase:(id)a3
{
}

- (void)setCachedRecoveryKey:(id)a3
{
}

- (id)cachedPassphraseForFD:(int)a3
{
  id v4 = objc_autoreleasePoolPush();
  if (a3 < 0) {
    goto LABEL_13;
  }
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)v27.st_qspare = v5;
  *(timespec *)&v27.st_size = v5;
  *(timespec *)&v27.st_blksize = v5;
  v27.st_ctimespec = v5;
  v27.st_birthtimespec = v5;
  v27.st_atimespec = v5;
  v27.st_mtimespec = v5;
  *(timespec *)&v27.st_dev = v5;
  *(timespec *)&v27.st_uid = v5;
  uint64_t v6 = fstat(a3, &v27);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v14 = CloudServicesLog(v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100046A84();
    }
    goto LABEL_12;
  }

  id v7 = objc_alloc(&OBJC_CLASS___NSMutableData);
  uint64_t v8 = -[NSMutableData initWithLength:](v7, "initWithLength:", v27.st_size);
  id v9 = -[os_log_s mutableBytes](v8, "mutableBytes");
  ssize_t v10 = pread(a3, v9, v27.st_size, 0LL);
  if (v10 < 0)
  {
    uint64_t v15 = CloudServicesLog(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100046B04(v13);
    }
    goto LABEL_11;
  }

  uint64_t v11 = v10;
  if (v10 < v27.st_size)
  {
    uint64_t v12 = CloudServicesLog(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100046B78(&v27.st_size, v11, v13);
    }
LABEL_11:

LABEL_12:
LABEL_13:
    objc_autoreleasePoolPop(v4);
    id v16 = 0LL;
    goto LABEL_14;
  }

  id v26 = 0LL;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  0LL,  &v26));
  id v20 = v26;
  id v21 = v20;
  if (v19)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kSecureBackupPassphraseKey]);
    uint64_t v22 = CloudServicesLog(v16);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"uuid"]);
      *(_DWORD *)__int128 buf = 138412290;
      double v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "fetched uuid %@", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v25 = CloudServicesLog(v20);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100046BEC();
    }
    id v16 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  if (v19)
  {
    id v16 = v16;
    uint64_t v17 = v16;
    goto LABEL_15;
  }

- (NSString)cachedPassphrase
{
  return (NSString *)-[SecureBackupDaemon cachedPassphraseForFD:]( self,  "cachedPassphraseForFD:",  -[SecureBackupDaemon cachedPassphraseFD](self, "cachedPassphraseFD"));
}

- (NSString)cachedRecordIDPassphrase
{
  return (NSString *)-[SecureBackupDaemon cachedPassphraseForFD:]( self,  "cachedPassphraseForFD:",  -[SecureBackupDaemon cachedRecordIDPassphraseFD](self, "cachedRecordIDPassphraseFD"));
}

- (id)cachedRecoveryKey
{
  return -[SecureBackupDaemon cachedPassphraseForFD:]( self,  "cachedPassphraseForFD:",  -[SecureBackupDaemon cachedRecoveryKeyFD](self, "cachedRecoveryKeyFD"));
}

- (void)uncacheRecordIDPassphrase
{
  uint64_t v3 = CloudServicesLog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    timespec v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedRecordID](self, "cachedRecordID"));
    int v9 = 138412290;
    ssize_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "uncaching recordID %@", (uint8_t *)&v9, 0xCu);
  }

  if ((-[SecureBackupDaemon cachedRecordIDPassphraseFD](self, "cachedRecordIDPassphraseFD") & 0x80000000) == 0)
  {
    uint64_t v6 = close(-[SecureBackupDaemon cachedRecordIDPassphraseFD](self, "cachedRecordIDPassphraseFD"));
    if ((v6 & 0x80000000) != 0)
    {
      uint64_t v7 = CloudServicesLog(v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000467C4(v8);
      }
    }

    -[SecureBackupDaemon setCachedRecordIDPassphraseFD:](self, "setCachedRecordIDPassphraseFD:", 0xFFFFFFFFLL);
    -[SecureBackupDaemon setCachedRecordID:](self, "setCachedRecordID:", 0LL);
  }

- (void)cachePassphraseWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    id v20 = "-[SecureBackupDaemon cachePassphraseWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v19, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    if (v7)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  NSUnderlyingErrorKey);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
      v7[2](v7, v14);
    }
  }

  else
  {
    do
      unsigned int v15 = __ldxr(&dword_100078FE8);
    while (__stxr(v15 + 1, &dword_100078FE8));
    if (!v15)
    {
      uint64_t v16 = os_transaction_create("sbdCachedPassword");
      uint64_t v17 = (void *)qword_100078FD8;
      qword_100078FD8 = v16;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
    -[SecureBackupDaemon setCachedPassphrase:](self, "setCachedPassphrase:", v18);

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)cachePassphraseWithRequestAsync:(id)a3
{
}

- (void)uncachePassphraseWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[SecureBackupDaemon uncachePassphraseWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v20, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    if (v7)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  NSUnderlyingErrorKey);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
      v7[2](v7, v14);

LABEL_15:
    }
  }

  else
  {
    uint64_t v15 = close(-[SecureBackupDaemon cachedPassphraseFD](self, "cachedPassphraseFD"));
    if ((v15 & 0x80000000) != 0)
    {
      uint64_t v16 = CloudServicesLog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000467C4(v17);
      }
    }

    -[SecureBackupDaemon setCachedPassphraseFD:](self, "setCachedPassphraseFD:", 0xFFFFFFFFLL);
    if (v7) {
      v7[2](v7, 0LL);
    }
    do
    {
      unsigned int v18 = __ldxr(&dword_100078FE8);
      unsigned int v19 = v18 - 1;
    }

    while (__stxr(v19, &dword_100078FE8));
    if (!v19)
    {
      uint64_t v12 = (NSMutableDictionary *)qword_100078FD8;
      qword_100078FD8 = 0LL;
      goto LABEL_15;
    }
  }
}

- (void)cacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    int v20 = "-[SecureBackupDaemon cacheRecoveryKeyWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v19, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    if (v7)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  NSUnderlyingErrorKey);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
      v7[2](v7, v14);
    }
  }

  else
  {
    do
      unsigned int v15 = __ldxr(&dword_100078FEC);
    while (__stxr(v15 + 1, &dword_100078FEC));
    if (!v15)
    {
      uint64_t v16 = os_transaction_create("sbdCachedRecoveryKey");
      uint64_t v17 = (void *)qword_100078FE0;
      qword_100078FE0 = v16;
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 recoveryKey]);
    -[SecureBackupDaemon setCachedRecoveryKey:](self, "setCachedRecoveryKey:", v18);

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)uncacheRecoveryKeyWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[SecureBackupDaemon uncacheRecoveryKeyWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v20, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    if (v7)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  NSUnderlyingErrorKey);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
      v7[2](v7, v14);

LABEL_15:
    }
  }

  else
  {
    uint64_t v15 = close(-[SecureBackupDaemon cachedRecoveryKeyFD](self, "cachedRecoveryKeyFD"));
    if ((v15 & 0x80000000) != 0)
    {
      uint64_t v16 = CloudServicesLog(v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000467C4(v17);
      }
    }

    -[SecureBackupDaemon setCachedRecoveryKeyFD:](self, "setCachedRecoveryKeyFD:", 0xFFFFFFFFLL);
    if (v7) {
      v7[2](v7, 0LL);
    }
    do
    {
      unsigned int v18 = __ldxr(&dword_100078FEC);
      unsigned int v19 = v18 - 1;
    }

    while (__stxr(v19, &dword_100078FEC));
    if (!v19)
    {
      uint64_t v12 = (NSMutableDictionary *)qword_100078FE0;
      qword_100078FE0 = 0LL;
      goto LABEL_15;
    }
  }
}

- (void)uncachePassphraseWithRequestAsync:(id)a3
{
}

- (void)startSMSChallengeWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v21 = "-[SecureBackupDaemon startSMSChallengeWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, 0LL, v14);
  }

  else
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v17 = -[EscrowService initWithOperationsLogger:](v15, "initWithOperationsLogger:", v16);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002BDCC;
    v18[3] = &unk_100069350;
    unsigned int v19 = v7;
    -[EscrowService startSMSChallengeWithRequest:completionBlock:]( v17,  "startSMSChallengeWithRequest:completionBlock:",  v6,  v18);
  }
}

- (void)getCountrySMSCodesWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v21 = "-[SecureBackupDaemon getCountrySMSCodesWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, 0LL, v14);
  }

  else
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v17 = -[EscrowService initWithOperationsLogger:](v15, "initWithOperationsLogger:", v16);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002C334;
    v18[3] = &unk_100069350;
    unsigned int v19 = v7;
    -[EscrowService getCountrySMSCodesWithRequest:completionBlock:]( v17,  "getCountrySMSCodesWithRequest:completionBlock:",  v6,  v18);
  }
}

- (void)changeSMSTargetWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v52 = "-[SecureBackupDaemon changeSMSTargetWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  ssize_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, v14);

    goto LABEL_31;
  }

  BOOL v15 = -[SecureBackupDaemon _backupEnabled](self, "_backupEnabled");
  if (v15)
  {
    BOOL v16 = -[SecureBackupDaemon _usesEscrow](self, "_usesEscrow");
    if (v16)
    {
      uint64_t v17 = objc_alloc(&OBJC_CLASS___EscrowService);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
      unsigned int v19 = -[EscrowService initWithOperationsLogger:](v17, "initWithOperationsLogger:", v18);

      int v20 = (void *)objc_claimAutoreleasedReturnValue([v6 countryDialCode]);
      if ([v20 length])
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
        if ([v21 length])
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
          if ([v22 length])
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
            if ([v23 length])
            {
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
              BOOL v25 = [v24 length] == 0;

              if (!v25)
              {
                stat v27 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
                id v48 = 0LL;
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon normalizeSMSTarget:error:]( self,  "normalizeSMSTarget:error:",  v27,  &v48));
                id v29 = v48;
                [v6 setSmsTarget:v28];

                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
                LODWORD(v27) = v30 == 0LL;

                if ((_DWORD)v27)
                {
                  v7[2](v7, v29);
                  goto LABEL_30;
                }

                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472LL;
                v46[2] = sub_10002CC78;
                v46[3] = &unk_100069350;
                id v47 = v7;
                -[EscrowService changeSMSTargetWithRequest:completionBlock:]( v19,  "changeSMSTargetWithRequest:completionBlock:",  v6,  v46);
                uint64_t v31 = v47;
LABEL_29:

LABEL_30:
                goto LABEL_31;
              }

- (void)notificationInfoWithReply:(id)a3
{
  uint64_t v11 = (void (**)(id, NSMutableDictionary *, void))a3;
  id v4 = objc_autoreleasePoolPush();
  timespec v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon handledNotifications](self, "handledNotifications"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  @"handled_notifications");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon ignoredNotifications](self, "ignoredNotifications"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"ignored_notifications");

  uint64_t v8 = xpc_copy_event("com.apple.notifyd.matching", 0LL);
  int v9 = (void *)v8;
  if (v8)
  {
    ssize_t v10 = (void *)_CFXPCCreateCFObjectFromXPCObject(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, @"events");
  }

  v11[2](v11, v5, 0LL);

  objc_autoreleasePoolPop(v4);
}

- (void)stateCaptureWithReply:(id)a3
{
  id v6 = (void (**)(id, id, void))a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = -[SecureBackupDaemon copyKVSState](self, "copyKVSState");
  v6[2](v6, v5, 0LL);

  objc_autoreleasePoolPop(v4);
}

- (id)getPendingEscrowRequest:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](&OBJC_CLASS___SecEscrowRequest, "request:"));
  id v5 = v4;
  if (v4) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchRequestWaitingOnPasscode:a3]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)beginHSA2PasscodeRequest:(id)a3 desirePasscodeImmediately:(BOOL)a4 uuid:(id)a5 reason:(id)a6 reply:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = (void (**)(id, void, void *))a7;
  uint64_t v16 = CloudServicesLog(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "beginning an HSA2 passcode request", buf, 2u);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v12 setQueue:v18];

  [v12 setIcdp:1];
  id v19 = [v14 reason];
  if ((_DWORD)v19 == 1)
  {
    uint64_t v20 = CloudServicesLog(v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 expectedFederationID]);
      *(_DWORD *)__int128 buf = 138412290;
      v44[0] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "will attempt federation move to %@",  buf,  0xCu);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 expectedFederationID]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v23 integerValue]));
    [v12 setSpecifiedFederation:v24];
  }

  BOOL v25 = (void *)os_transaction_create("beginHSA2PasscodeRequest:desirePasscodeImmediately:uuid");
  if (v10) {
    uint64_t v26 = 2LL;
  }
  else {
    uint64_t v26 = 1LL;
  }
  uint64_t v27 = -[SecureBackupDaemon setPasscodeRequestFlag:](self, "setPasscodeRequestFlag:", v26);
  int v28 = v27;
  uint64_t v29 = CloudServicesLog(v27);
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v28)
  {
    if (v31)
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v44[0]) = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "unable to set state for token: %d", buf, 8u);
    }

    uint64_t v32 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    uint64_t v46 = @"unable to set state for token";
    uint64_t v33 = (EscrowService *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v32,  24LL,  v33));
    v15[2](v15, 0LL, v34);
  }

  else
  {
    if (v31)
    {
      *(_DWORD *)__int128 buf = 67109376;
      LODWORD(v44[0]) = v26;
      WORD2(v44[0]) = 1024;
      *(_DWORD *)((char *)v44 + 6) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "successfully set notify state for request to %d (desire immediately: %d)",  buf,  0xEu);
    }

    uint64_t v35 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v37 = -[EscrowService initWithOperationsLogger:](v35, "initWithOperationsLogger:", v36);

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10002D378;
    v38[3] = &unk_1000697F8;
    NSErrorUserInfoKey v42 = v15;
    uint64_t v39 = v37;
    id v40 = v13;
    id v41 = v25;
    uint64_t v33 = v37;
    -[EscrowService fetchCertificatesAndDuplicateRequest:completionBlock:]( v33,  "fetchCertificatesAndDuplicateRequest:completionBlock:",  v12,  v38);

    uint64_t v34 = v42;
  }
}

- (int)notifyToken
{
  v2 = self;
  objc_sync_enter(v2);
  if (dword_100078DD8 == -1)
  {
    uint64_t v3 = notify_register_check( (const char *)[SecureBackupPasscodeRequestNotifyTokenName UTF8String],  &dword_100078DD8);
    int v4 = v3;
    if ((_DWORD)v3)
    {
      uint64_t v5 = CloudServicesLog(v3);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109120;
        v8[1] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "unable to fetch notify token: %d",  (uint8_t *)v8,  8u);
      }

      dword_100078DD8 = -1;
    }
  }

  objc_sync_exit(v2);

  return dword_100078DD8;
}

- (void)clearNotifyToken
{
  id obj = self;
  objc_sync_enter(obj);
  if (dword_100078DD8 != -1) {
    notify_cancel(dword_100078DD8);
  }
  dword_100078DD8 = -1;
  objc_sync_exit(obj);
}

- (int)setPasscodeRequestFlag:(unint64_t)a3
{
  int v5 = -[SecureBackupDaemon notifyToken](self, "notifyToken");
  if (v5 != -1)
  {
    int result = notify_set_state(v5, a3);
    if (result != 2) {
      return result;
    }
    -[SecureBackupDaemon clearNotifyToken](self, "clearNotifyToken");
  }

  return 2;
}

- (int)getPasscodeRequestFlag:(unint64_t *)a3
{
  int v5 = -[SecureBackupDaemon notifyToken](self, "notifyToken");
  if (v5 != -1)
  {
    int result = notify_get_state(v5, a3);
    if (result != 2) {
      return result;
    }
    -[SecureBackupDaemon clearNotifyToken](self, "clearNotifyToken");
  }

  return 2;
}

- (void)prepareHSA2EscrowRecordContents:(id)a3 usesComplexPassphrase:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  uint64_t v10 = CloudServicesLog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    BOOL v105 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "beginning an prepare HSA2 contents request: usesComplexPassphrase: %d",  buf,  8u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v8 setQueue:v12];

  uint64_t v13 = -[SecureBackupDaemon setPasscodeRequestFlag:](self, "setPasscodeRequestFlag:", 4LL);
  int v14 = v13;
  uint64_t v15 = CloudServicesLog(v13);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v17) {
      sub_100047110();
    }

    uint64_t v18 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
    id v103 = @"unable to set state (to 0) for token";
    id v19 = &v103;
    uint64_t v20 = &v102;
    goto LABEL_13;
  }

  if (v17) {
    sub_1000470E4();
  }

  if (![v8 stingray])
  {
    if ([v8 usesRandomPassphrase])
    {
      uint64_t v18 = kSecureBackupErrorDomain;
      NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
      BOOL v99 = @"Cannot prepare HSA2 Escrow record for a usesRandomPassphrase request";
      id v19 = &v99;
      uint64_t v20 = &v98;
      goto LABEL_13;
    }

    id v23 = [v8 usesMultipleiCSC];
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = CloudServicesLog(v23);
      BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "record preparation requires a multiple iCSC world, so do that",  buf,  2u);
      }

      [v8 setUsesMultipleiCSC:1];
    }

    id v26 = [v8 icdp];
    if ((v26 & 1) == 0)
    {
      uint64_t v27 = CloudServicesLog(v26);
      int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "record preparation requires an ICDP world, so do that",  buf,  2u);
      }

      [v8 setIcdp:1];
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]);

    if (!v29)
    {
      uint64_t v31 = CloudServicesLog(v30);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "setting record DSID", buf, 2u);
      }

      id v33 = sub_100010494();
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      [v8 setDsid:v34];
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
    uint64_t v36 = kSecureBackupUsesComplexPassphraseKey;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:kSecureBackupUsesComplexPassphraseKey]);

    id v37 = [v21 integerValue];
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
    id v39 = [v38 mutableCopy];
    id v40 = v39;
    if (v37 || v6)
    {
      if (v39) {
        id v42 = v39;
      }
      else {
        id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }
      id v43 = v42;

      [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:v36];
      [v43 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      [v43 setObject:&off_10006DAF8 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    }

    else
    {
      if (v39) {
        id v41 = v39;
      }
      else {
        id v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }
      id v43 = v41;

      [v43 setObject:&__kCFBooleanFalse forKeyedSubscript:v36];
      [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v8 passphrase]);
      NSErrorUserInfoKey v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v44 length]));
      [v43 setObject:v45 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    }

    [v8 setMetadata:v43];

    id v95 = 0LL;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](&OBJC_CLASS___SecEscrowRequest, "request:", &v95));
    id v47 = v95;
    uint64_t v22 = v47;
    if (!v46)
    {
      uint64_t v55 = CloudServicesLog(v47);
      id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_100046E44();
      }

      v9[2](v9, v22);
      goto LABEL_84;
    }

    id v94 = v47;
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v46 fetchRequestWaitingOnPasscode:&v94]);
    id v49 = v94;

    if (!v48 || v49)
    {
      uint64_t v57 = CloudServicesLog(v50);
      uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_100046EA4();
      }

      if (!v49)
      {
        uint64_t v59 = kSecureBackupErrorDomain;
        NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
        id v97 = @"No outstanding escrow request";
        __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v59,  -1LL,  v60));
        v9[2](v9, v61);

        id v49 = 0LL;
        goto LABEL_83;
      }

- (id)fetchPRK:(id *)a3
{
  id v3 = sub_10003DE74();
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  int v5 = (void *)v4;
  if (v4)
  {
    uint64_t v10 = @"prk";
    uint64_t v11 = v4;
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  0LL));
  }

  else
  {
    uint64_t v8 = CloudServicesLog(0LL);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004713C();
    }
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)daemonPasscodeRequestOpinion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v33 = 0LL;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](&OBJC_CLASS___SecEscrowRequest, "request:", &v33));
  id v6 = v33;
  uint64_t v7 = v6;
  if (v5)
  {
    id v32 = v6;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchRequestWaitingOnPasscode:&v32]);
    id v9 = v32;

    if (v9)
    {
      uint64_t v11 = CloudServicesLog(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100047228();
      }

      v4[2](v4, 0LL, v9);
    }

    else
    {
      uint64_t v15 = CloudServicesLog(v10);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v17)
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "daemonPasscodeRequestOpinion: found outstanding request %@",  buf,  0xCu);
        }

        *(void *)__int128 buf = 0LL;
        uint64_t v18 = -[SecureBackupDaemon getPasscodeRequestFlag:](self, "getPasscodeRequestFlag:", buf);
        if ((_DWORD)v18)
        {
          uint64_t v19 = CloudServicesLog(v18);
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1000471C8();
          }
        }

        if (!*(void *)buf)
        {
          uint64_t v21 = CloudServicesLog(v18);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v31[0] = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "daemonPasscodeRequestOpinion: notify lost our state. Setting back on...",  (uint8_t *)v31,  2u);
          }

          -[SecureBackupDaemon setPasscodeRequestFlag:](self, "setPasscodeRequestFlag:", 1LL);
        }

        id v23 = v4[2];
        uint64_t v24 = v4;
        uint64_t v25 = 2LL;
      }

      else
      {
        if (v17)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "daemonPasscodeRequestOpinion: no outstanding request",  buf,  2u);
        }

        uint64_t v26 = -[SecureBackupDaemon setPasscodeRequestFlag:](self, "setPasscodeRequestFlag:", 4LL);
        int v27 = v26;
        uint64_t v28 = CloudServicesLog(v26);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        if (v27)
        {
          if (v30) {
            sub_100047110();
          }
        }

        else if (v30)
        {
          sub_1000470E4();
        }

        id v23 = v4[2];
        uint64_t v24 = v4;
        uint64_t v25 = 1LL;
      }

      v23(v24, v25, 0LL);
    }
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v6);
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100047168();
    }

    v4[2](v4, 0LL, v7);
    id v9 = v7;
  }
}

- (void)getCertificatesWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v18 = "-[SecureBackupDaemon getCertificatesWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v7 setQueue:v10];

  uint64_t v11 = objc_alloc(&OBJC_CLASS___EscrowService);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
  uint64_t v13 = -[EscrowService initWithOperationsLogger:](v11, "initWithOperationsLogger:", v12);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002E654;
  v15[3] = &unk_100069820;
  id v16 = v6;
  id v14 = v6;
  -[EscrowService fetchCertificatesWithRequest:completionBlock:]( v13,  "fetchCertificatesWithRequest:completionBlock:",  v7,  v15);
}

- (void)saveTermsAcceptance:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = CloudServicesLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v18 = "-[SecureBackupDaemon saveTermsAcceptance:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
  if (v9)
  {
    +[CSCertOperations storeTerms:withAltDSID:reply:]( &OBJC_CLASS___CSCertOperations,  "storeTerms:withAltDSID:reply:",  v5,  v9,  v6);
  }

  else
  {
    uint64_t v10 = CloudServicesLog(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to store terms: no altDSID provided",  buf,  2u);
    }

    uint64_t v12 = kSecureBackupErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    id v16 = @"missing altDSID";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  4LL,  v13));

    v6[2](v6, v14);
  }
}

- (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v13 = "-[SecureBackupDaemon getAcceptedTermsForAltDSID:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002E9C4;
  v10[3] = &unk_100069848;
  id v11 = v5;
  id v9 = v5;
  +[CSCertOperations fetchTermsWithAltDSID:reply:]( &OBJC_CLASS___CSCertOperations,  "fetchTermsWithAltDSID:reply:",  v6,  v10);
}

- (void)moveToFederationAllowed:(id)a3 altDSID:(id)a4 reply:(id)a5
{
  uint64_t v7 = (void (**)(id, id, void))a5;
  id v8 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 integerValue]));
  id v9 = +[CSCertOperations moveToFederationAllowed:altDSID:]( &OBJC_CLASS___CSCertOperations,  "moveToFederationAllowed:altDSID:",  v10,  v8);

  v7[2](v7, v9, 0LL);
}

- (void)knownICDPFederations:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  uint64_t v4 = CloudServicesLog(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[SecureBackupDaemon knownICDPFederations:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCertOperations knownICDPFederations](&OBJC_CLASS___CSCertOperations, "knownICDPFederations"));
  v3[2](v3, v6, 0LL);
}

- (void)enableGuitarfishTokenWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v38 = "-[SecureBackupDaemon enableGuitarfishTokenWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v12));
    v7[2](v7, v14);
  }

  else
  {
    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue([v6 metadata]);
    uint64_t v12 = (NSMutableDictionary *)[v15 mutableCopy];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey]);

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudIdentityData]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v33 sha256Digest]);
    uint64_t v19 = kSecureBackupKeybagSHA256Key;
    uint64_t v34 = (void *)v18;
    objc_msgSend(v17, "setObject:forKeyedSubscript:");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[CSDateUtilities posixDateFormatter](&OBJC_CLASS___CSDateUtilities, "posixDateFormatter"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v32 = v20;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 stringFromDate:v21]);

    uint64_t v23 = kSecureBackupTimestampKey;
    [v17 setObject:v22 forKeyedSubscript:kSecureBackupTimestampKey];
    if (v12)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v22,  kSecureBackupMetadataTimestampKey);
      [v17 setObject:v12 forKeyedSubscript:kSecureBackupClientMetadataKey];
    }

    uint64_t v24 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v31 = -[EscrowService initWithOperationsLogger:](v24, "initWithOperationsLogger:", v25);

    uint64_t v26 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v34, v19);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  v33,  kSecureBackupBagPasswordKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  @"1",  @"BackupVersion");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v22, v23);
    [v6 setEscrowRecord:v26];
    [v6 setMetadata:v17];
    [v6 setEncodedMetadata:v14];
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedMetadata]);

    if (v27)
    {
      uint64_t v29 = CloudServicesLog(v28);
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "enableWithInfo(): beginning an update request",  buf,  2u);
      }
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10002EFC4;
    v35[3] = &unk_100069350;
    uint64_t v36 = v7;
    -[EscrowService storeRecordWithRequest:completionBlock:](v31, "storeRecordWithRequest:completionBlock:", v6, v35);
  }
}

- (void)recoverGuitarfishTokenWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v23 = "-[SecureBackupDaemon recoverGuitarfishTokenWithRequest:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon connectionQueue](self, "connectionQueue"));
  [v6 setQueue:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v11)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  @"error decoding request properties",  NSLocalizedDescriptionKey);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, NSUnderlyingErrorKey);

    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  5LL,  v13));
    v7[2](v7, 0LL, v15);
  }

  else
  {
    uint64_t v16 = CloudServicesLog(v12);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Performing Guitarfish token recovery",  buf,  2u);
    }

    uint64_t v18 = objc_alloc(&OBJC_CLASS___EscrowService);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](self, "operationsLogger"));
    uint64_t v13 = -[EscrowService initWithOperationsLogger:](v18, "initWithOperationsLogger:", v19);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10002F2EC;
    v20[3] = &unk_100069350;
    uint64_t v21 = v7;
    -[NSMutableDictionary recoverRecordWithRequest:completionBlock:]( v13,  "recoverRecordWithRequest:completionBlock:",  v6,  v20);
    NSErrorUserInfoKey v15 = v21;
  }
}

- (SBEscrowOperationLogger)operationsLogger
{
  return self->_operationsLogger;
}

- (NSURL)cacheDirURL
{
  return self->_cacheDirURL;
}

- (void)setCacheDirURL:(id)a3
{
}

- (NSData)iCDPKeybag
{
  return self->_iCDPKeybag;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_queue)backupQueue
{
  return self->_backupQueue;
}

- (OS_dispatch_queue)kvsQueue
{
  return self->_kvsQueue;
}

- (BOOL)needInitialBackup
{
  return self->_needInitialBackup;
}

- (void)setNeedInitialBackup:(BOOL)a3
{
  self->_needInitialBackup = a3;
}

- (NSString)cachedRecordID
{
  return self->_cachedRecordID;
}

- (void)setCachedRecordID:(id)a3
{
}

- (int)cachedPassphraseFD
{
  return self->_cachedPassphraseFD;
}

- (void)setCachedPassphraseFD:(int)a3
{
  self->_cachedPassphraseFD = a3;
}

- (int)cachedRecordIDPassphraseFD
{
  return self->_cachedRecordIDPassphraseFD;
}

- (void)setCachedRecordIDPassphraseFD:(int)a3
{
  self->_cachedRecordIDPassphraseFD = a3;
}

- (int)cachedRecoveryKeyFD
{
  return self->_cachedRecoveryKeyFD;
}

- (void)setCachedRecoveryKeyFD:(int)a3
{
  self->_cachedRecoveryKeyFD = a3;
}

- (NSString)iCloudEnvironment
{
  return self->_iCloudEnvironment;
}

- (void)setICloudEnvironment:(id)a3
{
}

- (BOOL)pendingNotification
{
  return self->_pendingNotification;
}

- (void)setPendingNotification:(BOOL)a3
{
  self->_pendingNotification = a3;
}

- (NSMutableDictionary)ignoredNotifications
{
  return self->_ignoredNotifications;
}

- (void)setIgnoredNotifications:(id)a3
{
}

- (NSMutableDictionary)handledNotifications
{
  return self->_handledNotifications;
}

- (void)setHandledNotifications:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)kvs
{
  if (!OctagonPlatformSupportsSOS(self))
  {
LABEL_7:
    id v3 = 0LL;
    return v3;
  }

  BOOL v2 = sub_1000103A0();
  if (!v2)
  {
    uint64_t v4 = CloudServicesLog(v2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004837C(v5);
    }

    goto LABEL_7;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUbiquitousKeyValueStore defaultStore](&OBJC_CLASS___NSUbiquitousKeyValueStore, "defaultStore"));
  return v3;
}

- (void)restoreBackupName:(id)a3 peerID:(id)a4 keybag:(id)a5 password:(id)a6 backup:(id)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = _CloudServicesSignpostLogSystem();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  os_signpost_id_t v21 = _CloudServicesSignpostCreate(v20);
  uint64_t v23 = v22;

  id v24 = _CloudServicesSignpostLogSystem();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = v25;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "BackupRestore",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v27 = _CloudServicesSignpostLogSystem();
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v40 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: BackupRestore  enableTelemetry=YES ",  buf,  0xCu);
  }

  uint64_t v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  id v33 = sub_10003F334;
  uint64_t v34 = &unk_100069F88;
  os_signpost_id_t v37 = v21;
  uint64_t v38 = v23;
  id v35 = v13;
  id v36 = v14;
  id v29 = v14;
  id v30 = v13;
  SecItemBackupRestore(v30, v18, v17, v16);
}

- (BOOL)verifyRKWithKeyBag:(id)a3 password:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v20 = 0LL;
  uint64_t v8 = SOSBackupSliceKeyBagCreateFromData(kCFAllocatorDefault, a3, &v20);
  if (v8) {
    BOOL v9 = v20 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    uint64_t v10 = CloudServicesLog(v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000483BC();
    }
LABEL_13:

    BOOL v17 = 0;
    if (a5) {
      *a5 = v20;
    }
    goto LABEL_15;
  }

  uint64_t v12 = (const void *)v8;
  int v13 = SOSBSKBLoadAndUnlockWithWrappingSecret();
  CFRelease(v12);
  uint64_t v15 = CloudServicesLog(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  id v11 = v16;
  if (v13 == -1)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10004841C();
    }
    goto LABEL_13;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RK checks out", v19, 2u);
  }

  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (id)removeRKFromKeyBag:(id)a3 error:(id *)a4
{
  id v21 = 0LL;
  uint64_t v5 = SOSBackupSliceKeyBagCreateFromData(kCFAllocatorDefault, a3, &v21);
  if (v5) {
    BOOL v6 = v21 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v10 = (const void *)v5;
    uint64_t v11 = SOSBSKBRemoveRecoveryKey();
    uint64_t v12 = CloudServicesLog(v11);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "removed recovery key from bskb",  (uint8_t *)&v20,  2u);
    }

    id v20 = 0LL;
    uint64_t v14 = SOSBSKBCopyEncoded(v10, &v20);
    uint64_t v15 = (void *)v14;
    if (v14) {
      BOOL v16 = v20 == 0LL;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      CFRelease(v10);
      id v19 = v15;
    }

    else
    {
      uint64_t v17 = CloudServicesLog(v14);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10004847C();
      }

      if (a4) {
        *a4 = v20;
      }
      CFRelease(v10);
      id v19 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = CloudServicesLog(v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000483BC();
    }

    if (a4)
    {
      *a4 = v21;
      return 0LL;
    }

    id v19 = 0LL;
  }

  return v19;
}

- (BOOL)backupWithRegisteredBackupsWithError:(id *)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = _CloudServicesSignpostLogSystem();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_signpost_id_t v8 = _CloudServicesSignpostCreate(v7);
  uint64_t v10 = v9;

  id v11 = _CloudServicesSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  int v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "BackupWithRegisteredBackups",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v14 = _CloudServicesSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v30 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: BackupWithRegisteredBackups  enableTelemetry=YES ",  buf,  0xCu);
  }

  id v28 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10003FA14;
  v26[3] = &unk_100069FB0;
  id v16 = v5;
  id v27 = v16;
  int v17 = SecItemBackupWithRegisteredBackups(&v28, v26);
  BOOL v18 = v17;
  if (a3 && (v17 & 1) == 0) {
    *a3 = v28;
  }
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v8, v10);
  id v20 = _CloudServicesSignpostLogSystem();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = v21;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v30) = v18;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  v8,  "BackupWithRegisteredBackups",  " CloudServicesSignpostNameSecItemBackupWithRegisteredBackups=%{public,signpost.telemetry:number1,name=CloudService sSignpostNameSecItemBackupWithRegisteredBackups}d ",  buf,  8u);
  }

  id v23 = _CloudServicesSignpostLogSystem();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218496;
    os_signpost_id_t v30 = v8;
    __int16 v31 = 2048;
    double v32 = Nanoseconds / 1000000000.0;
    __int16 v33 = 1026;
    BOOL v34 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: BackupWithRegisteredBackups  CloudServicesSignpostNameSecItemBackupWithRegisteredBackups=%{public, signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithRegisteredBackups}d ",  buf,  0x1Cu);
  }

  return v18;
}

- (BOOL)backupWithRegisteredBackupViewWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = SecItemBackupWithRegisteredViewBackup();
  uint64_t v7 = CloudServicesLog();
  os_signpost_id_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "registered view!! %@", buf, 0xCu);
    }
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to register view: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = 0LL;
    }
  }

  return v6;
}

- (BOOL)backupSetConfirmedManifest:(id)a3 digest:(id)a4 manifest:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = CloudServicesLog(v11);
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 sha1Digest]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hexString]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 hexString]);
    *(_DWORD *)id v19 = 138412546;
    *(void *)&void v19[4] = v15;
    __int16 v20 = 2112;
    id v21 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setting manifest hash: %@, digest: %@",  v19,  0x16u);
  }

  *(void *)id v19 = 0LL;
  char v17 = SecItemBackupSetConfirmedManifest(v11, v9, v10, v19);

  if (a6 && (v17 & 1) == 0) {
    *a6 = *(id *)v19;
  }

  return v17;
}

- (BOOL)backupWithChanges:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _CloudServicesSignpostLogSystem();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t v11 = _CloudServicesSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _CloudServicesSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "BackupWithChanges",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v17 = _CloudServicesSignpostLogSystem();
  BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: BackupWithChanges  enableTelemetry=YES ",  buf,  0xCu);
  }

  id v31 = 0LL;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10003FF6C;
  v29[3] = &unk_100069FD8;
  id v19 = v8;
  id v30 = v19;
  int v20 = SecItemBackupWithChanges(v7, &v31, v29);
  BOOL v21 = v20;
  if (a4 && (v20 & 1) == 0) {
    *a4 = v31;
  }
  double Nanoseconds = _CloudServicesSignpostGetNanoseconds(v11, v13);
  id v23 = _CloudServicesSignpostLogSystem();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  uint64_t v25 = v24;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)__int128 buf = 138543618;
    os_signpost_id_t v33 = (os_signpost_id_t)v7;
    __int16 v34 = 1026;
    LODWORD(v35) = v21;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  v11,  "BackupWithChanges",  " CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:string1,name=CloudServicesSignpostN ameSecItemBackupWithChanges}@  CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:numbe r1,name=CloudServicesSignpostNameSecItemBackupWithChanges}d ",  buf,  0x12u);
  }

  id v26 = _CloudServicesSignpostLogSystem();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218754;
    os_signpost_id_t v33 = v11;
    __int16 v34 = 2048;
    double v35 = Nanoseconds / 1000000000.0;
    __int16 v36 = 2114;
    id v37 = v7;
    __int16 v38 = 1026;
    BOOL v39 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: BackupWithChanges  CloudServicesSignpostNameSecItemBackupWithChanges=%{public,signpost.telemetry:s tring1,name=CloudServicesSignpostNameSecItemBackupWithChanges}@  CloudServicesSignpostNameSecItemBackupWithChanges =%{public,signpost.telemetry:number1,name=CloudServicesSignpostNameSecItemBackupWithChanges}d ",  buf,  0x26u);
  }

  return v21;
}

- (id)copyMyPeerInfo:(id *)a3
{
  id v7 = 0LL;
  uint64_t v4 = SOSCCCopyMyPeerInfo(&v7, a2);
  id v5 = (void *)v4;
  if (a3 && !v4) {
    *a3 = v7;
  }
  return v5;
}

- (id)copyPeerID:(id)a3
{
  id result = (id)SOSPeerInfoGetPeerID(a3, a2);
  if (result) {
    return (id)CFStringCreateCopy(0LL, (CFStringRef)result);
  }
  return result;
}

- (id)copyMyPeerID
{
  id v16 = 0LL;
  id v3 = -[SecureBackupDaemon copyMyPeerInfo:](self, "copyMyPeerInfo:", &v16);
  id v4 = v16;
  id v5 = v4;
  if (v3)
  {
    int v6 = -[SecureBackupDaemon copyPeerID:](self, "copyPeerID:", v3);
  }

  else
  {
    uint64_t v7 = CloudServicesLog(v4);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000484DC((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }

    int v6 = @"unknown";
  }

  return (id)v6;
}

- (id)copyMyPeerIDWithError:(id *)a3
{
  id v4 = -[SecureBackupDaemon copyMyPeerInfo:](self, "copyMyPeerInfo:");
  if (v4)
  {
    id v5 = -[SecureBackupDaemon copyPeerID:](self, "copyPeerID:", v4);
  }

  else
  {
    uint64_t v6 = CloudServicesLog(0LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100048540();
    }

    id v5 = 0LL;
  }

  return v5;
}

- (id)copyBackupKey:(id)a3
{
  return (id)SOSPeerInfoCopyBackupKey(a3, a2);
}

- (id)copyBackupKeyForNewDeviceRecoverySecret:(id)a3 error:(id *)a4
{
  id v8 = 0LL;
  uint64_t v5 = SOSCopyDeviceBackupPublicKey(a3, &v8);
  uint64_t v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = v8;
  }
  return v6;
}

- (id)copyMyPeerWithNewDeviceRecoverySecret:(id)a3 error:(id *)a4
{
  id v8 = 0LL;
  uint64_t v5 = SOSCCCopyMyPeerWithNewDeviceRecoverySecret(a3, &v8);
  uint64_t v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = v8;
  }
  return v6;
}

- (id)copyEncodedData:(id)a3 error:(id *)a4
{
  id v8 = 0LL;
  uint64_t v5 = SOSPeerInfoCopyEncodedData(a3, 0LL, &v8);
  uint64_t v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = v8;
  }
  return v6;
}

- (BOOL)registerSingleRecoverySecret:(id)a3 iCDP:(BOOL)a4 error:(id *)a5
{
  id v9 = 0LL;
  char v6 = SOSCCRegisterSingleRecoverySecret(a3, !a4, &v9);
  BOOL v7 = v6;
  if (a5 && (v6 & 1) == 0) {
    *a5 = v9;
  }
  return v7;
}

- (id)createPeerInfoFromData:(id)a3 error:(id *)a4
{
  id v8 = 0LL;
  uint64_t v5 = SOSPeerInfoCreateFromData(0LL, &v8, a3);
  char v6 = (void *)v5;
  if (a4 && !v5) {
    *a4 = v8;
  }
  return v6;
}

- (id)copySerialNumber:(id)a3
{
  return (id)SOSPeerInfoV2DictionaryCopyString(a3, sSerialNumberKey);
}

- (id)copyOSVersion:(id)a3
{
  id result = (id)SOSPeerInfoLookupGestaltValue(a3, @"OSVersion");
  if (result) {
    return (id)CFStringCreateCopy(0LL, (CFStringRef)result);
  }
  return result;
}

- (id)allViews
{
  BOOL v2 = (void *)SOSViewCopyViewSet(0LL, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"compare:"]);

  return v4;
}

- (id)currentViews
{
  AllCurrent = (void *)SOSViewsGetAllCurrent(self, a2);
  if (AllCurrent)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([AllCurrent allObjects]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"compare:"]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)circleChangedNotification
{
  if (OctagonPlatformSupportsSOS(self)
    && !_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn"))
  {
    BOOL v2 = &kSOSCCCircleChangedNotification;
  }

  else
  {
    BOOL v2 = &OTTrustStatusChangeNotification;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *v2));
}

- (id)createEncodedDirectBackupSliceKeybagFromData:(id)a3 error:(id *)a4
{
  uint64_t v14 = 0LL;
  uint64_t v5 = SOSBackupSliceKeyBagCreateDirect(0LL, a3, &v14);
  char v6 = (void *)v5;
  if (v5)
  {
    uint64_t v14 = 0LL;
    BOOL v7 = (void *)SOSBSKBCopyEncoded(v5, &v14);
    if (v7) {
      goto LABEL_10;
    }
    uint64_t v8 = CloudServicesLog(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100048614();
    }
  }

  else
  {
    uint64_t v10 = CloudServicesLog(0LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000485B4();
    }
  }

  if (a4)
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = v14;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, NSUnderlyingErrorKey);

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  19LL,  v11));
  }

  BOOL v7 = 0LL;
LABEL_10:

  return v7;
}

- (BOOL)backupSliceKeybagHasRecoveryKey:(id)a3
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a3 bskb]);
  id v4 = (void *)v3;
  if (v3) {
    char v5 = SOSBSKBHasRecoveryKey(v3);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)createDERDataFromPlist:(id)a3
{
  uint64_t v13 = 0LL;
  uint64_t v3 = (void *)CFPropertyListCreateDERData(0LL, a3, &v13);
  if (!v3)
  {
    uint64_t v4 = CloudServicesLog(0LL);
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100048674(&v13, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  return v3;
}

- (id)createPlistFromDERData:(id)a3
{
  uint64_t v13 = 0LL;
  uint64_t v3 = (void *)CFPropertyListCreateWithDERData(0LL, a3, 0LL, 0LL, &v13);
  if (!v3)
  {
    uint64_t v4 = CloudServicesLog(0LL);
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000486E4(&v13, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  return v3;
}

- (id)createiCloudRecoveryPasswordWithError:(id *)a3
{
  uint64_t v12 = 0LL;
  uint64_t v4 = (void *)SecPasswordGenerate(1LL, &v12, 0LL);
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  }

  else
  {
    uint64_t v7 = CloudServicesLog(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100048754();
    }

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  @"SecPasswordGenerate() failed",  NSLocalizedDescriptionKey);
    uint64_t v10 = v12;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, NSUnderlyingErrorKey);

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v9));
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)doEnableEscrowMultiICSCWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon massageOutgoingMetadataFromRequest:]( self,  "massageOutgoingMetadataFromRequest:",  v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSecureBackupEncodedMetadataKey]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 metadataHash]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"duplicateEncodedMetadata"]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  BOOL v14 = -[SecureBackupDaemon forceICDP](self, "forceICDP");
  if (v14)
  {
    uint64_t v15 = CloudServicesLog(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FORCING ICDP + MULTIPLE ICSC", buf, 2u);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
  if ([v17 length])
  {
  }

  else
  {
    unsigned int v18 = [v6 useCachedPassphrase];

    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon cachedPassphrase](self, "cachedPassphrase"));
      [v6 setPassphrase:v19];

      int v20 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
      id v21 = [v20 length];

      if (!v21)
      {
        uint64_t v96 = CloudServicesLog(v22);
        id v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          sub_1000487B4();
        }

        __int16 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v34,  "setObject:forKeyedSubscript:",  @"Missing cached passphrase",  NSLocalizedDescriptionKey);
        NSErrorUserInfoKey v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  9LL,  v34));
        v7[2](v7, v98);

        goto LABEL_115;
      }
    }
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
  v182 = v13;
  __int16 v183 = v8;
  if ([v23 length])
  {
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 hsa2CachedPrerecordUUID]);

    if (!v24)
    {
LABEL_70:
      uint64_t v179 = v12;
      v181 = v10;
      v106 = v7;
      uint64_t v107 = CloudServicesLog(v25);
      __int16 v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
        sub_1000487E0(v6, v108);
      }

      unsigned int v109 = objc_alloc(&OBJC_CLASS___NSString);
      __int16 v110 = (void *)objc_claimAutoreleasedReturnValue([v6 passphrase]);
      if (v110) {
        int v111 = @"non-";
      }
      else {
        int v111 = &stru_10006AB28;
      }
      __int16 v112 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
      uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
      uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
      if (v114) {
        int v115 = @"non-";
      }
      else {
        int v115 = &stru_10006AB28;
      }
      __int16 v34 = -[NSString initWithFormat:]( v109,  "initWithFormat:",  @"attempted to enable backup, with invalid parameters: %@nil recovery password, %@, %@, %@nil iCloud password",  v111,  v112,  v113,  v115);

      id v116 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v116,  "setObject:forKeyedSubscript:",  v34,  NSLocalizedDescriptionKey);
      uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  4LL,  v116));
      uint64_t v7 = v106;
      v106[2](v106, v117);

      uint64_t v13 = v182;
      uint64_t v8 = v183;
      uint64_t v12 = v179;
      uint64_t v10 = v181;
      goto LABEL_115;
    }
  }

  id v43 = (void *)objc_claimAutoreleasedReturnValue([v6 countryDialCode]);
  if (![v43 length])
  {
LABEL_69:

    goto LABEL_70;
  }

  id v44 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
  if (![v44 length])
  {
LABEL_68:

    goto LABEL_69;
  }

  NSErrorUserInfoKey v45 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
  if (![v45 length])
  {
LABEL_67:

    goto LABEL_68;
  }

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v6 appleID]);
  if (![v46 length])
  {

    goto LABEL_67;
  }

  id v47 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudPassword]);
  id v48 = v12;
  id v49 = self;
  uint64_t v50 = v10;
  id v51 = v6;
  uint64_t v52 = v7;
  uint64_t v53 = v47;
  id v177 = [v47 length];

  uint64_t v7 = v52;
  id v6 = v51;
  uint64_t v10 = v50;
  self = v49;
  uint64_t v12 = v48;

  uint64_t v13 = v182;
  uint64_t v8 = v183;
  if (!v177) {
    goto LABEL_70;
  }
LABEL_13:
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 hsa2CachedPrerecordUUID]);

  uint64_t v28 = CloudServicesLog(v27);
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v30)
    {
      id v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 hsa2CachedPrerecordUUID]);
      *(_DWORD *)__int128 buf = 138412290;
      v197 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "enableWithRequest to escrow a prerecord: %@",  buf,  0xCu);
    }

    id v195 = 0LL;
    double v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](&OBJC_CLASS___SecEscrowRequest, "request:", &v195));
    os_signpost_id_t v33 = (NSMutableDictionary *)v195;
    __int16 v34 = v33;
    if (v32)
    {
      double v35 = (void *)objc_claimAutoreleasedReturnValue([v6 hsa2CachedPrerecordUUID]);
      v194 = v34;
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary fetchPrerecord:error:](v32, "fetchPrerecord:error:", v35, &v194));
      id v37 = v194;

      if (v36 && !v37)
      {
        BOOL v39 = -[EscrowPrerecord initWithData:](objc_alloc(&OBJC_CLASS___EscrowPrerecord), "initWithData:", v36);
        if (!v39)
        {
          uint64_t v118 = CloudServicesLog(0LL);
          uint64_t v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
            sub_100048C70();
          }

          id v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  38LL,  0LL));
          v7[2](v7, v120);

          __int16 v34 = v32;
          goto LABEL_113;
        }

        v180 = v10;
        [v6 setPrerecord:v39];
        uint64_t v40 = CloudServicesLog( -[SecureBackupDaemon setPasscodeMetadata:passphraseType:]( self,  "setPasscodeMetadata:passphraseType:",  v183,  -[EscrowPrerecord passphraseType](v39, "passphraseType")));
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "prepareHSA2: acquired prerecord",  buf,  2u);
        }

        id v42 = v7;

        __int16 v34 = 0LL;
LABEL_33:
        os_signpost_id_t v178 = self;

        uint64_t v13 = v182;
        [v182 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecureBackupUsesMultipleiCSCKey];
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord timestamp](v39, "timestamp"));
        [v182 setObject:v55 forKeyedSubscript:kSecureBackupTimestampKey];

        id v56 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord sosBackupKeybagDigest](v39, "sosBackupKeybagDigest"));
        uint64_t v175 = kSecureBackupKeybagDigestKey;
        objc_msgSend(v182, "setObject:forKeyedSubscript:", v56);

        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord escrowedSPKI](v39, "escrowedSPKI"));
        [v182 setObject:v57 forKeyedSubscript:kSecureBackupEscrowedSPKIKey];

        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord bottleID](v39, "bottleID"));
        [v182 setObject:v58 forKeyedSubscript:kSecureBackupBottleIDKey];

        uint64_t v59 = objc_claimAutoreleasedReturnValue(-[EscrowPrerecord passcodeGeneration](v39, "passcodeGeneration"));
        if (v59)
        {
          __int16 v60 = (void *)v59;
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord passcodeGeneration](v39, "passcodeGeneration"));
          unsigned int v62 = [v61 hasValue];

          if (v62)
          {
            uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord passcodeGeneration](v39, "passcodeGeneration"));
            uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v63 value]));
            [v182 setObject:v64 forKeyedSubscript:kSecureBackupPasscodeGenerationKey];
          }
        }

        if (v183)
        {
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord timestamp](v39, "timestamp"));
          [v183 setObject:v65 forKeyedSubscript:kSecureBackupMetadataTimestampKey];

          [v182 setObject:v183 forKeyedSubscript:kSecureBackupClientMetadataKey];
        }

        BOOL v66 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);

        if (v66)
        {
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);
          v192 = v34;
          id v68 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon normalizeSMSTarget:error:](self, "normalizeSMSTarget:error:", v67, &v192));
          id v69 = v192;

          [v6 setSmsTarget:v68];
          id v70 = (void *)objc_claimAutoreleasedReturnValue([v6 smsTarget]);

          if (!v70)
          {
            uint64_t v7 = v42;
            v42[2](v42, v69);

            __int16 v34 = v69;
            uint64_t v10 = v180;
LABEL_114:
            uint64_t v8 = v183;
            goto LABEL_115;
          }

          __int16 v34 = v69;
        }

        uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _gestaltValueForKey:](self, "_gestaltValueForKey:", @"SerialNumber"));
        [v182 setObject:v71 forKeyedSubscript:kSecureBackupSerialNumberKey];

        id v72 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon _gestaltValueForKey:](self, "_gestaltValueForKey:", @"BuildVersion"));
        [v182 setObject:v72 forKeyedSubscript:kSecureBackupBuildVersionKey];

        if (!OctagonPlatformSupportsSOS(v73)
          || (_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn") & 1) != 0)
        {
          id v74 = (__CFString *)objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
          id v75 = sub_1000105E4();
          uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
          -[__CFString setAltDSID:](v74, "setAltDSID:", v76);

          -[__CFString setContext:](v74, "setContext:", OTDefaultContext);
          id v77 = [[OTClique alloc] initWithContextData:v74];
          id v189 = 0LL;
          id v78 = (void *)objc_claimAutoreleasedReturnValue([v77 cliqueMemberIdentifier:&v189]);
          id v79 = v189;
          [v6 setRecordID:v78];

          uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
          uint64_t v7 = v42;
          if (!v80 || v79)
          {
            id v102 = v79;
            uint64_t v103 = CloudServicesLog(v81);
            uint64_t v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
            uint64_t v10 = v180;
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
              sub_100048968();
            }

            unint64_t v86 = v102;
            if (!v102)
            {
              BOOL v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"OTClique no cliqueMemberIdentifier",  NSLocalizedDescriptionKey,  0LL));
              unint64_t v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  44LL,  v105));
            }

            v7[2](v7, v86);

            goto LABEL_112;
          }

          id v173 = 0LL;
          v176 = v39;
          uint64_t v82 = v74;
          uint64_t v10 = v180;
          goto LABEL_46;
        }

        uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord sosBackupKeybagPassword](v39, "sosBackupKeybagPassword"));
        id v191 = 0LL;
        id v77 = -[SecureBackupDaemon copyMyPeerWithNewDeviceRecoverySecret:error:]( self,  "copyMyPeerWithNewDeviceRecoverySecret:error:",  v121,  &v191);
        id v174 = (__CFString *)v191;

        uint64_t v7 = v42;
        if (v77)
        {
          id v123 = -[SecureBackupDaemon copyPeerID:](v178, "copyPeerID:", v77);
          if (v123)
          {
            id v74 = v123;
            id v172 = v42;
            [v6 setRecordID:v123];
            uint64_t v124 = objc_claimAutoreleasedReturnValue(-[EscrowPrerecord sosPeerID](v39, "sosPeerID"));
            if (v124)
            {
              uint64_t v125 = (void *)v124;
              uint64_t v126 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord sosPeerID](v39, "sosPeerID"));
              v127 = (__CFString *)v126;
              v128 = v126 ? (__CFString *)v126 : @"not possible";
              unsigned __int8 v129 = -[__CFString isEqualToString:](v74, "isEqualToString:", v128);

              if ((v129 & 1) != 0)
              {
                uint64_t v130 = CloudServicesLog(v124);
                v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(v130);
                if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)__int128 buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "Escrow record peer ID matches peer ID at backup time",  buf,  2u);
                }

                uint64_t v133 = CloudServicesLog(v132);
                v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v135 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 recordID]);
                  *(_DWORD *)__int128 buf = 138412290;
                  v197 = v135;
                  _os_log_impl( (void *)&_mh_execute_header,  v134,  OS_LOG_TYPE_DEFAULT,  "Escrow record ID will be %@",  buf,  0xCu);
                }

                id v136 = -[SecureBackupDaemon copyBackupKey:](v178, "copyBackupKey:", v77);
                v137 = v136;
                if (v136)
                {
                  id v171 = v136;
                  v138 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v136 sha1Digest]);
                  v139 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord sosBackupKeybagDigest](v39, "sosBackupKeybagDigest"));
                  unsigned __int8 v140 = -[NSMutableDictionary isEqual:](v138, "isEqual:", v139);

                  uint64_t v142 = CloudServicesLog(v141);
                  v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
                  v144 = v143;
                  if ((v140 & 1) != 0)
                  {
                    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)__int128 buf = 138412802;
                      v197 = v74;
                      __int16 v198 = 2112;
                      id v199 = v171;
                      __int16 v200 = 2112;
                      v201 = v138;
                      _os_log_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_DEFAULT,  "SOSCCCopyMyPeerWithNewDeviceRecoverySecret() called got peer ID: %@, backup key: %@, digest: %@",  buf,  0x20u);
                    }

                    [v182 setObject:v138 forKeyedSubscript:v175];
                    v190 = v174;
                    id v145 = -[SecureBackupDaemon copyEncodedData:error:](v178, "copyEncodedData:error:", v77, &v190);
                    uint64_t v82 = v190;

                    uint64_t v7 = v172;
                    if (v145)
                    {
                      [v182 setObject:v145 forKeyedSubscript:kSecureBackupPeerInfoDataKey];
                      v147 = v145;
                      uint64_t v10 = v180;
                      v148 = v171;
                    }

                    else
                    {
                      uint64_t v169 = CloudServicesLog(v146);
                      id v170 = (os_log_s *)objc_claimAutoreleasedReturnValue(v169);
                      uint64_t v10 = v180;
                      if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR)) {
                        sub_100048B84();
                      }

                      v148 = v171;
                      v147 = 0LL;
                    }

                    v176 = v39;

                    id v173 = v74;
LABEL_46:

                    [v6 setMetadata:v182];
                    [v6 setEncodedMetadata:v10];
                    [v6 setDuplicateEncodedMetadata:v12];
                    uint64_t v83 = objc_alloc(&OBJC_CLASS___EscrowService);
                    id v84 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupDaemon operationsLogger](v178, "operationsLogger"));
                    uint64_t v85 = -[EscrowService initWithOperationsLogger:](v83, "initWithOperationsLogger:", v84);

                    unint64_t v86 = v85;
                    v184[0] = _NSConcreteStackBlock;
                    v184[1] = 3221225472LL;
                    v184[2] = sub_100042214;
                    v184[3] = &unk_1000694F0;
                    v184[4] = v178;
                    id v185 = v6;
                    v186 = v173;
                    id v187 = v182;
                    v188 = v7;
                    id v74 = v173;
                    -[EscrowService storeRecordWithRequest:completionBlock:]( v85,  "storeRecordWithRequest:completionBlock:",  v185,  v184);

                    BOOL v39 = v176;
LABEL_112:

LABEL_113:
                    uint64_t v13 = v182;
                    goto LABEL_114;
                  }

                  if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
                    sub_100048BE4();
                  }

                  uint64_t v167 = kSecureBackupErrorDomain;
                  NSErrorUserInfoKey v202 = NSLocalizedDescriptionKey;
                  v203 = @"SOS backup keybag digest mismatch";
                  uint64_t v168 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v203,  &v202,  1LL));
                  id v166 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v167,  37LL,  v168));

                  __int16 v34 = (NSMutableDictionary *)v168;
                  v137 = v171;
                  uint64_t v7 = v172;
                }

                else
                {
                  uint64_t v163 = CloudServicesLog(0LL);
                  v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
                  if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                    sub_100048B24();
                  }

                  v138 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v138,  "setObject:forKeyedSubscript:",  @"SOSPeerInfoCopyBackupKey() returned no backup public key for peer",  NSLocalizedDescriptionKey);
                  v165 = objc_alloc(&OBJC_CLASS___NSError);
                  id v166 = -[NSError initWithDomain:code:userInfo:]( v165,  "initWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  20LL,  v138);
                  uint64_t v7 = v172;
                }

                v7[2](v7, v166);
                __int16 v34 = (NSMutableDictionary *)v166;
                uint64_t v10 = v180;
LABEL_111:
                unint64_t v86 = v174;
                goto LABEL_112;
              }
            }

            uint64_t v155 = CloudServicesLog(v124);
            v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
            if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR)) {
              sub_100048A74((uint64_t)v74, v39, v156);
            }

            uint64_t v157 = kSecureBackupErrorDomain;
            NSErrorUserInfoKey v204 = NSLocalizedDescriptionKey;
            v205 = @"SOS peer ID mismatch";
            int v158 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v205,  &v204,  1LL));
            uint64_t v159 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v157,  24LL,  v158));

            uint64_t v7 = v42;
            v42[2](v42, (void *)v159);
            __int16 v34 = (NSMutableDictionary *)v159;
LABEL_110:
            uint64_t v10 = v180;

            goto LABEL_111;
          }

          uint64_t v160 = CloudServicesLog(0LL);
          v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
          if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR)) {
            sub_100048A48();
          }

          v153 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v151 = v153;
          NSErrorUserInfoKey v152 = NSLocalizedDescriptionKey;
          v154 = @"SOSPeerInfoGetPeerID() failed";
        }

        else
        {
          uint64_t v149 = CloudServicesLog(v122);
          v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
          if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
            sub_1000489C8(v174, v150);
          }

          v151 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v151,  "setObject:forKeyedSubscript:",  @"SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed",  NSLocalizedDescriptionKey);
          NSErrorUserInfoKey v152 = NSUnderlyingErrorKey;
          v153 = v151;
          v154 = v174;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v154, v152);
        uint64_t v162 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  17LL,  v151));

        v42[2](v42, (void *)v162);
        id v74 = 0LL;
        __int16 v34 = (NSMutableDictionary *)v162;
        goto LABEL_110;
      }

      id v89 = v12;
      id v90 = v10;
      id v91 = v7;
      uint64_t v92 = CloudServicesLog(v38);
      id v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        sub_100048C10();
      }

      id v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v94 setObject:v37 forKeyedSubscript:NSUnderlyingErrorKey];
      [v94 setObject:@"unable to fetch a prerecord" forKeyedSubscript:NSLocalizedDescriptionKey];
      id v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  38LL,  v94));
      v91[2](v91, v95);

      uint64_t v7 = v91;
      __int16 v34 = v37;
      uint64_t v10 = v90;
      uint64_t v13 = v182;
      uint64_t v8 = v183;
      uint64_t v12 = v89;
    }

    else
    {
      uint64_t v87 = CloudServicesLog(v33);
      uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        sub_100046E44();
      }

      v7[2](v7, v34);
      uint64_t v13 = v182;
    }
  }

  else
  {
    v180 = v10;
    if (v30)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "enableWithRequest to escrow a password",  buf,  2u);
    }

    id v193 = 0LL;
    BOOL v39 = (EscrowPrerecord *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon makeRecordCandidate:error:]( self,  "makeRecordCandidate:error:",  v6,  &v193));
    id v54 = (NSMutableDictionary *)v193;
    __int16 v34 = v54;
    if (v39)
    {
      id v42 = v7;
      double v32 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[EscrowPrerecord recordContents](v39, "recordContents"));
      [v6 setEscrowRecord:v32];
      goto LABEL_33;
    }

    uint64_t v8 = v183;
    if (!v54)
    {
      BOOL v99 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v99,  "setObject:forKeyedSubscript:",  @"could not create escrow record contents",  NSLocalizedDescriptionKey);
      __int16 v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v99));
    }

    uint64_t v100 = CloudServicesLog(v54);
    id v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      sub_100048908();
    }

    v7[2](v7, v34);
  }

- (void)setPasscodeMetadata:(id)a3 passphraseType:(int)a4
{
  id v5 = a3;
  if (a4 <= 3)
  {
    uint64_t v6 = (uint64_t)*(&off_10006A020 + a4);
    uint64_t v7 = (uint64_t)*(&off_10006A040 + a4);
    uint64_t v8 = (&off_10006A060)[a4];
    id v9 = v5;
    [v5 setObject:v6 forKeyedSubscript:kSecureBackupUsesComplexPassphraseKey];
    [v9 setObject:v7 forKeyedSubscript:kSecureBackupUsesNumericPassphraseKey];
    [v9 setObject:v8 forKeyedSubscript:kSecureBackupNumericPassphraseLengthKey];
    id v5 = v9;
  }
}

- (id)makeRecordCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SecureBackupEscrowRecordCandidate);
  id v76 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SecureBackupDaemon createiCloudRecoveryPasswordWithError:]( self,  "createiCloudRecoveryPasswordWithError:",  &v76));
  id v9 = v76;
  id v10 = -[SecureBackupEscrowRecordCandidate setSosBackupKeybagPassword:](v7, "setSosBackupKeybagPassword:", v8);
  if (v8)
  {
    uint64_t v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[CSDateUtilities posixDateFormatter]( &OBJC_CLASS___CSDateUtilities,  "posixDateFormatter"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary stringFromDate:](v11, "stringFromDate:", v12));

    if (!OctagonPlatformSupportsSOS(-[SecureBackupEscrowRecordCandidate setTimestamp:](v7, "setTimestamp:", v13))
      || (_os_feature_enabled_impl("CoreCDP", "DeferSOSFromSignIn") & 1) != 0)
    {
      id v54 = v9;
      goto LABEL_5;
    }

    id v75 = v9;
    id v37 = -[SecureBackupDaemon copyMyPeerIDWithError:](self, "copyMyPeerIDWithError:", &v75);
    id v54 = v75;

    -[SecureBackupEscrowRecordCandidate setSosPeerID:](v7, "setSosPeerID:", v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowRecordCandidate sosPeerID](v7, "sosPeerID"));
    if (v38) {
      BOOL v39 = v54 == 0LL;
    }
    else {
      BOOL v39 = 0;
    }
    int v40 = !v39;

    uint64_t v42 = CloudServicesLog(v41);
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    id v44 = v43;
    if (v40)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_100048CFC();
      }

      if (a4)
      {
        id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  @"SOSCopyPeerID() failed",  NSLocalizedDescriptionKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v54,  NSUnderlyingErrorKey);
        id v45 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  17LL,  v19));
LABEL_53:
        int v20 = 0LL;
        *a4 = v45;
        goto LABEL_43;
      }
    }

    else
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowRecordCandidate sosPeerID](v7, "sosPeerID"));
        LODWORD(v81) = 138412290;
        *(void *)((char *)&v81 + 4) = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Creating record candidate with SOS peerID %@",  (uint8_t *)&v81,  0xCu);
      }

      id v74 = 0LL;
      id v49 = -[SecureBackupDaemon copyBackupKeyForNewDeviceRecoverySecret:error:]( self,  "copyBackupKeyForNewDeviceRecoverySecret:error:",  v8,  &v74);
      id v54 = v74;
      if (v49)
      {
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 sha1Digest]);
        -[SecureBackupEscrowRecordCandidate setSosBackupKeybagDigest:](v7, "setSosBackupKeybagDigest:", v50);

LABEL_5:
        id v14 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
        id v15 = sub_1000105E4();
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v14 setAltDSID:v16];

        [v14 setContext:OTDefaultContext];
        id v17 = [[OTClique alloc] initWithContextData:v14];
        *(void *)&__int128 v81 = 0LL;
        *((void *)&v81 + 1) = &v81;
        uint64_t v82 = 0x3032000000LL;
        uint64_t v83 = sub_100042C04;
        id v84 = sub_100042C14;
        id v85 = 0LL;
        uint64_t v68 = 0LL;
        id v69 = &v68;
        uint64_t v70 = 0x3032000000LL;
        uint64_t v71 = sub_100042C04;
        id v72 = sub_100042C14;
        id v73 = 0LL;
        uint64_t v62 = 0LL;
        uint64_t v63 = &v62;
        uint64_t v64 = 0x3032000000LL;
        uint64_t v65 = sub_100042C04;
        BOOL v66 = sub_100042C14;
        id v67 = 0LL;
        uint64_t v56 = 0LL;
        uint64_t v57 = &v56;
        uint64_t v58 = 0x3032000000LL;
        uint64_t v59 = sub_100042C04;
        __int16 v60 = sub_100042C14;
        id v61 = 0LL;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472LL;
        v55[2] = sub_100042C1C;
        v55[3] = &unk_10006A000;
        void v55[4] = &v56;
        v55[5] = &v62;
        v55[6] = &v81;
        v55[7] = &v68;
        [v17 fetchEscrowContents:v55];
        unsigned int v18 = (void *)v57[5];
        if (v18)
        {
          if (a4)
          {
            id v19 = 0LL;
            int v20 = 0LL;
            *a4 = v18;
LABEL_42:
            _Block_object_dispose(&v56, 8);

            _Block_object_dispose(&v62, 8);
            _Block_object_dispose(&v68, 8);

            _Block_object_dispose(&v81, 8);
LABEL_43:

LABEL_44:
            id v9 = v54;
            goto LABEL_45;
          }
        }

        else
        {
          if (*(void *)(*((void *)&v81 + 1) + 40LL) && v69[5] && v63[5])
          {
            uint64_t v23 = CloudServicesLog(0LL);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = *(void *)(*((void *)&v81 + 1) + 40LL);
              id v26 = [(id)v69[5] length];
              *(_DWORD *)__int128 buf = 138412546;
              uint64_t v78 = v25;
              __int16 v79 = 2048;
              id v80 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Including contents for bottle ID %@ (%llu bytes)",  buf,  0x16u);
            }

            -[SecureBackupEscrowRecordCandidate setEscrowedSPKI:](v7, "setEscrowedSPKI:", v63[5]);
            -[SecureBackupEscrowRecordCandidate setBottleID:]( v7,  "setBottleID:",  *(void *)(*((void *)&v81 + 1) + 40LL));
            id v19 = (NSMutableDictionary *)(id)v69[5];
            uint64_t v53 = (void *)MKBGetDeviceConfigurations(0LL);
            if (v53)
            {
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:@"PasscodeGeneration"]);
              uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber, v28);
              if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0)
              {
                BOOL v30 = objc_alloc_init(&OBJC_CLASS___EscrowPrerecordPasscodeGeneration);
                -[SecureBackupEscrowRecordCandidate setPasscodeGeneration:](v7, "setPasscodeGeneration:", v30);

                id v51 = [v27 unsignedLongLongValue];
                id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowRecordCandidate passcodeGeneration](v7, "passcodeGeneration"));
                [v31 setValue:v51];
              }
            }

            double v32 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
            os_signpost_id_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SecureBackupEscrowRecordCandidate sosBackupKeybagDigest](v7, "sosBackupKeybagDigest"));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v33,  kSecureBackupKeybagDigestKey);

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v8,  kSecureBackupBagPasswordKey);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  @"1",  @"BackupVersion");
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v13,  kSecureBackupTimestampKey);
            if ([v6 requiresDoubleEnrollment])
            {
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
              __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v52 UUIDString]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v34,  @"DoubleEnrollmentPassword");

              -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  &off_10006DB88,  @"DoubleEnrollmentVersion");
            }

            double v35 = (void *)objc_claimAutoreleasedReturnValue([v6 idmsData]);

            if (v35)
            {
              __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v6 idmsData]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v36,  kSecureBackupIDMSDataKey);
            }

            if (v19) {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v19,  @"BottledPeerEntropy");
            }
            -[SecureBackupEscrowRecordCandidate setRecordContents:](v7, "setRecordContents:", v32);
            int v20 = v7;

            goto LABEL_42;
          }

          if (a4)
          {
            uint64_t v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v46,  "setObject:forKeyedSubscript:",  @"fetchEscrowContents failed",  NSLocalizedDescriptionKey);
            *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  46LL,  v46));
          }
        }

        id v19 = 0LL;
        int v20 = 0LL;
        goto LABEL_42;
      }

      if (a4)
      {
        id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  @"copyBackupKeyForNewDeviceRecoverySecret() failed",  NSLocalizedDescriptionKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v54,  NSUnderlyingErrorKey);
        id v45 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  17LL,  v19));
        goto LABEL_53;
      }
    }

    int v20 = 0LL;
    goto LABEL_44;
  }

  uint64_t v21 = CloudServicesLog(v10);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100048C9C();
  }

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  @"could not create backup bag password",  NSLocalizedDescriptionKey);
  int v20 = 0LL;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kSecureBackupErrorDomain,  24LL,  v11));
  }
LABEL_45:

  return v20;
}

@end