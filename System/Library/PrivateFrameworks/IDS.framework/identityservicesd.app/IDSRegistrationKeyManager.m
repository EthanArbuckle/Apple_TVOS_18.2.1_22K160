@interface IDSRegistrationKeyManager
+ (BOOL)setupKeys;
+ (id)sharedInstance;
- (BOOL)_generateUnregisteredIdentityWithExistingLegacyIdentity:(id)a3 existingNGMIdentity:(id)a4;
- (BOOL)_isSecurelyStoringIdentity:(id)a3 withExpectedProtectionClass:(int64_t)a4;
- (BOOL)_isUnderFirstDataProtectionLock;
- (BOOL)_loadClassAIdentityIfNeeded:(id *)a3;
- (BOOL)_loadClassCIdentityIfNeeded:(id *)a3;
- (BOOL)_loadClassDIdentityIfNeeded:(id *)a3;
- (BOOL)_migrateIdentity:(id)a3 toProtectionClass:(int64_t)a4;
- (BOOL)_migrateRegisteredIdentityFromClassDtoClassCIfNeeded;
- (BOOL)_save;
- (BOOL)_serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:(BOOL)a3;
- (BOOL)_serializeAndPersistIdentityContainer:(id)a3 identityIdentifier:(int64_t)a4 deleteIfNull:(BOOL)a5;
- (BOOL)_serializeAndPersistKTRegistrationDataDeleteIfNull:(BOOL)a3;
- (BOOL)_shouldCheckUnregisteredKTData;
- (BOOL)_shouldRegenerateRegisteredIdentity;
- (BOOL)allowPairingIdentities;
- (BOOL)allowRegenerateRegisteredIdentity;
- (BOOL)forceRoll;
- (BOOL)isMigratedKeyPairSignature;
- (BOOL)isUsingSecureStorageForClassA;
- (BOOL)isUsingSecureStorageForClassC;
- (BOOL)migrateToSecureStorageForClassA;
- (BOOL)migrateToSecureStorageForClassC;
- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3 ktRegistrationKeyIndex:(unsigned __int16)a4;
- (BOOL)registrationNeedsKTDataUpdated;
- (BOOL)requiresKeychainMigration;
- (IDSKTRegistrationDataManager)ktRegistrationDataManager;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRateLimiter)loadingRateLimiter;
- (IDSRegistrationKeyConfig)config;
- (IDSRegistrationKeyManager)init;
- (IDSRegistrationKeyManager)initWithSystemMonitor:(id)a3 keychainWrapper:(id)a4 loadingRateLimiter:(id)a5 identityDataSource:(id)a6 allowPairingIdentities:(BOOL)a7 allowRegenerateRegisteredIdentity:(BOOL)a8 keyPairProvider:(id)a9 ktRegistrationDataManager:(id)a10;
- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource;
- (IDSRegistrationKeyManagerKeyPairProvider)keyPairProvider;
- (IMSystemMonitor)systemMonitor;
- (_SecMPFullIdentity)copyMessageProtectionIdentity;
- (_SecMPFullIdentity)copyPreviousMessageProtectionIdentity;
- (_SecMPFullIdentity)latestCopyMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3;
- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4;
- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3;
- (__SecKey)identityPrivateKey;
- (__SecKey)identityPublicKey;
- (double)_generationRetryDelay;
- (double)_identityRegenerationDelay;
- (double)_notifyKTReregisterDelay;
- (double)_notifyRegenerateDelay;
- (double)_purgePreviousIdentityDelay;
- (double)_randomizedIdentityRegenerationInterval;
- (id)_generateIdentityWithExistingIdentity:(id)a3 identifier:(int64_t)a4 dataProtectionClass:(int64_t)a5;
- (id)_getPublicMessageProtectionDataForIdentity:(id)a3;
- (id)_loadAndDeserializeBuildOfIdentityGenerationForItemName:(id)a3;
- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4;
- (id)createKTRegistrationDataForServiceTypes:(id)a3 withPublicIdentity:(id)a4;
- (id)errorContainerToReport;
- (id)fetchRegistrationStatusProvider;
- (id)fullDeviceIdentityContainer;
- (id)fullDeviceIdentityContainerUsableForKeyType:(unint64_t)a3;
- (id)fullMessageProtectionIdentity;
- (id)fullMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3;
- (id)generateCSRForUserID:(id)a3;
- (id)keyPairSignature;
- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3;
- (id)kvsTrustedDevices;
- (id)latestMessageProtectionFullIdentityForDataProtectionClass:(unsigned int)a3;
- (id)previousFullDeviceIdentityContainer;
- (id)previousFullMessageProtectionIdentity;
- (id)publicMessageProtectionData;
- (id)publicMessageProtectionDataToRegisterForClassA;
- (id)publicMessageProtectionDataToRegisterForClassC;
- (id)publicMessageProtectionDataToRegisterForClassD;
- (id)publicMessageProtectionDeviceIdentityContainerToRegister:(id *)a3;
- (id)publicMessageProtectionIdentityDataToRegisterWithError:(id *)a3;
- (unint64_t)generationRetryCount;
- (void)_ensureIdentity:(id *)a3 savedIndentity:(id *)a4 protectionClass:(int64_t)a5 didSaveIdentity:(BOOL *)a6;
- (void)_generateKTRegistrationData:(id)a3;
- (void)_handleKVSUpdateResponseForTrustedDevices:(id)a3 withSuccessfulKVSSync:(BOOL)a4;
- (void)_handleTransparencySignatureResponse:(id)a3 error:(id)a4;
- (void)_handleTransparencySignatureResponseForRegistration:(id)a3 error:(id)a4;
- (void)_ktDataNeedsUpdate:(id)a3;
- (void)_loadIfNeeded:(BOOL)a3;
- (void)_notifyUnregisteredIdentityRegenerated;
- (void)_notifyUnregisteredKTData;
- (void)_purgePreviousIdentityFromMemoryAndKeychain;
- (void)_purgePreviousIdentityTimerFired;
- (void)_purgePreviousIdentityTimerFiredOnMain;
- (void)_regenerateIdentityTimerFired;
- (void)_regenerateIdentityTimerFiredOnMain;
- (void)_retryGenerationAfterDelay;
- (void)_retryGenerationIfNeeded;
- (void)_saveClassXIdentity:(id *)a3 savedIdentity:(id *)a4 protectionClass:(int64_t)a5 savedUnsavedIdentity:(BOOL *)a6;
- (void)_schedulePurgeOfPreviousIdentityAfterDelay:(double)a3;
- (void)_scheduleRegenerationOfRegisteredIdentityAfterDelay:(double)a3;
- (void)_serializeAndPersistBuildOfIdentityGeneration:(id)a3 itemName:(id)a4;
- (void)_subscribeForTimeChangeNotification;
- (void)_unsubscribeForTimeChangeNotification;
- (void)dealloc;
- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 withCompletion:(id)a5;
- (void)loadPairingIdentities:(BOOL)a3;
- (void)noteBuddyFinishTime;
- (void)noteDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4;
- (void)noteManateeAvailableTime;
- (void)notePublicIdentityDidRegisterLegacyData:(id)a3 ngmIdentityData:(id)a4 ngmPrekeyData:(id)a5 keyIndexToIdentityData:(id)a6;
- (void)noteiCloudSignInTime;
- (void)purgeMessageProtectionIdentity;
- (void)regeneratePairingIdentitiesIncludingClassD:(BOOL)a3;
- (void)regenerateRegisteredIdentity;
- (void)setAllowPairingIdentities:(BOOL)a3;
- (void)setAllowRegenerateRegisteredIdentity:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setForceRoll:(BOOL)a3;
- (void)setGenerationRetryCount:(unint64_t)a3;
- (void)setIdentityDataSource:(id)a3;
- (void)setKeyPairProvider:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setKtRegistrationDataManager:(id)a3;
- (void)setLoadingRateLimiter:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)systemDidLeaveDataProtectionLock;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemRestoreStateDidChange;
- (void)updateKVSForKTRegistrationData;
@end

@implementation IDSRegistrationKeyManager

+ (id)sharedInstance
{
  if (qword_1009BE5E0 != -1) {
    dispatch_once(&qword_1009BE5E0, &stru_1008F6830);
  }
  return (id)qword_1009BE5E8;
}

+ (BOOL)setupKeys
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_1008F6850);

  return 1;
}

- (BOOL)_isUnderFirstDataProtectionLock
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager systemMonitor](self, "systemMonitor"));
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (self->_detectedMigrationNeeded)
  {
    self->_detectedMigrationNeeded = 0;
    -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    objc_msgSend( v3,  "__mainThreadPostNotificationName:object:",  @"__kIDSRegistrationKeyManagerKeychainMigrationComplete",  0);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)systemDidLeaveDataProtectionLock
{
  if (self->_pendingIdentityRegeneration) {
    -[IDSRegistrationKeyManager regeneratePairingIdentitiesIncludingClassD:]( self,  "regeneratePairingIdentitiesIncludingClassD:",  1LL);
  }
  if (!self->_hasCheckedMigrationThisLaunch) {
    -[IDSRegistrationKeyManager _migrateRegisteredIdentityFromClassDtoClassCIfNeeded]( self,  "_migrateRegisteredIdentityFromClassDtoClassCIfNeeded");
  }
  -[IDSRegistrationKeyManager loadPairingIdentities:](self, "loadPairingIdentities:", 1LL);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)systemRestoreStateDidChange
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  unsigned __int8 v4 = [v3 isSetup];

  if ((v4 & 1) == 0)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[IDSRegistrationKeyManager noteBuddyFinishTime](self, "noteBuddyFinishTime");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (void)_saveClassXIdentity:(id *)a3 savedIdentity:(id *)a4 protectionClass:(int64_t)a5 savedUnsavedIdentity:(BOOL *)a6
{
  if (self->_detectedMigrationNeeded)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100694850();
    }
LABEL_25:

    goto LABEL_26;
  }

  else {
    uint64_t v12 = qword_100717278[a5];
  }
  id v13 = *a4;
  if (*a4 || (id v13 = *a3) != 0LL)
  {
    id v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    id v27 = 0LL;
    unsigned int v16 = [v15 saveLegacyIdentity:v14 withIdentifier:v12 dataProtectionClass:a5 error:&v27];
    v17 = (os_log_s *)v27;

    if (v16)
    {
      if (*a3)
      {
        objc_storeStrong(a4, *a3);
        id v18 = *a3;
        *a3 = 0LL;

        if (a6) {
          *a6 = 1;
        }
      }

      v11 = v17;
    }

    else
    {
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1006947DC((uint64_t)v17);
      }

      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1006947B0();
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      v26 = v17;
      unsigned int v22 = [v21 removeLegacyIdentity:0 withIdentifier:v12 dataProtectionClass:a5 error:&v26];
      v11 = v26;

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeychainWrapper shortDescriptionForDataProtectionClass:]( &OBJC_CLASS___IDSKeychainWrapper,  "shortDescriptionForDataProtectionClass:",  a5));
          *(_DWORD *)buf = 138543618;
          v29 = v25;
          __int16 v30 = 2114;
          v31 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Removed keychain data for class %{public}@ message protection identity {error: %{public}@}",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        sub_100694718(a5);
      }
    }

    goto LABEL_25;
  }

- (BOOL)_save
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Saving key manager state {self: %@}",  (uint8_t *)&v33,  0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_detectedMigrationNeeded)
  {
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1006948E0();
    }
    LOBYTE(v5) = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 registeredIdentityContainer]);
    unsigned int v8 = -[IDSRegistrationKeyManager _serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:]( self,  "_serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:",  v7,  2LL,  1LL);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 unregisteredIdentityContainer]);
    unsigned int v11 = -[IDSRegistrationKeyManager _serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:]( self,  "_serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:",  v10,  1LL,  1LL);

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v12 previousRegisteredIdentityContainer]);
    unsigned int v14 = -[IDSRegistrationKeyManager _serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:]( self,  "_serializeAndPersistIdentityContainer:identityIdentifier:deleteIfNull:",  v13,  3LL,  1LL);

    LODWORD(v12) = -[IDSRegistrationKeyManager _serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:]( self,  "_serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:",  1LL);
    BOOL v5 = -[IDSRegistrationKeyManager _serializeAndPersistKTRegistrationDataDeleteIfNull:]( self,  "_serializeAndPersistKTRegistrationDataDeleteIfNull:",  1LL) & v12 & v14 & v11 & v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 buildOfIdentityGeneration]);
    -[IDSRegistrationKeyManager _serializeAndPersistBuildOfIdentityGeneration:itemName:]( self,  "_serializeAndPersistBuildOfIdentityGeneration:itemName:",  v16,  @"build-of-identity-generation");

    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s buildOfUnregisteredIdentityGeneration](v4, "buildOfUnregisteredIdentityGeneration"));
    -[IDSRegistrationKeyManager _serializeAndPersistBuildOfIdentityGeneration:itemName:]( self,  "_serializeAndPersistBuildOfIdentityGeneration:itemName:",  v17,  @"build-of-unregistered-identity-generation");
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 registeredIdentityContainer]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20 != 0LL));
  [v18 setAppValue:v21 forKey:@"hasRegIdentityContainer"];

  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 unregisteredIdentityContainer]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24 != 0LL));
  [v22 setAppValue:v25 forKey:@"hasUnregIdentityContainer"];

  if (!v5)
  {
    unsigned int v26 = -[IDSRateLimiter underLimitForItem:]( self->_loadingRateLimiter,  "underLimitForItem:",  @"registrationKeyManagerRateLimit");
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100694888();
      }

      self->_identityLoaded = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v29 setRegisteredIdentityContainer:0];

      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v30 setUnregisteredIdentityContainer:0];

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v31 setPreviousRegisteredIdentityContainer:0];

      -[IDSPerServiceApplicationKeyManager clearIdentities](self->_applicationKeyManager, "clearIdentities");
    }

    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_1006948B4();
      }
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)_serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  LOBYTE(v3) = -[IDSPerServiceApplicationKeyManager serializeAndPersistIdentitiesDeleteIfNull:]( self->_applicationKeyManager,  "serializeAndPersistIdentitiesDeleteIfNull:",  v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)_serializeAndPersistKTRegistrationDataDeleteIfNull:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  LOBYTE(v3) = -[IDSKTRegistrationDataManager serializeAndPersistKTDatasDeleteIfNull:]( self->_ktRegistrationDataManager,  "serializeAndPersistKTDatasDeleteIfNull:",  v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)_serializeAndPersistIdentityContainer:(id)a3 identityIdentifier:(int64_t)a4 deleteIfNull:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v8 = (__CFString *)a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = @"NO";
    *(_DWORD *)buf = 134218499;
    int64_t v30 = a4;
    if (v5) {
      v10 = @"YES";
    }
    __int16 v31 = 2113;
    int64_t v32 = (int64_t)v8;
    __int16 v33 = 2114;
    v34 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Persisting message protection identity container {identityIdentifier: %ld, identityContainer: %{private}@, deleteI fNull: %{public}@}",  buf,  0x20u);
  }

  if (v8)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    id v28 = 0LL;
    unsigned int v12 = [v11 saveIdentityContainer:v8 withIdentifier:a4 dataProtectionClass:0 error:&v28];
    id v13 = v28;

    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    v15 = v14;
    if (v12)
    {
      BOOL v16 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218243;
        int64_t v30 = a4;
        __int16 v31 = 2113;
        int64_t v32 = (int64_t)v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Persisted identity {identityIdentifier: %ld, identityContainer: %{private}@}",  buf,  0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543875;
        int64_t v30 = (int64_t)v13;
        __int16 v31 = 2048;
        int64_t v32 = a4;
        __int16 v33 = 2113;
        v34 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to save identity, possibly corrupted -- removing reference from keychain {error: %{public}@, identityId entifier: %ld, identityContainer: %{private}@}",  buf,  0x20u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      id v27 = v13;
      unsigned int v22 = [v21 removeIdentityContainer:v8 withIdentifier:a4 dataProtectionClass:0 error:&v27];
      id v23 = v27;

      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      v15 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218243;
          int64_t v30 = a4;
          __int16 v31 = 2113;
          int64_t v32 = (int64_t)v8;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removed identity reference from keychain {identityIdentifier: %ld, identityContainer: %{private}@}",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543875;
        int64_t v30 = (int64_t)v23;
        __int16 v31 = 2048;
        int64_t v32 = a4;
        __int16 v33 = 2113;
        v34 = v8;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "Failed to remove corrupt identity reference from keychain {error: %{public}@, identityIdentifier: %ld, identit yContainer: %{private}@}",  buf,  0x20u);
      }

      BOOL v16 = 0;
      id v13 = v23;
    }

- (void)_serializeAndPersistBuildOfIdentityGeneration:(id)a3 itemName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Persisting build of identity generation {itemName: %@, buildOfIdentityGeneration: %@}",  buf,  0x16u);
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keychainWrapper](self, "keychainWrapper"));
    id v17 = 0LL;
    unsigned __int8 v11 = [v10 saveData:v9 forIdentifier:v7 allowSync:0 dataProtectionClass:2 error:&v17];
    id v12 = v17;

    if ((v11 & 1) == 0)
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1006949F4();
      }
    }

- (id)_loadAndDeserializeBuildOfIdentityGenerationForItemName:(id)a3
{
  id v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keychainWrapper](self, "keychainWrapper"));
  id v14 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataForIdentifier:v4 error:&v14]);
  id v7 = v14;

  if (!v6)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      v10 = "Unable to load message protection identity from keychain {error: %{public}@}";
      unsigned __int8 v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }

- (BOOL)_loadClassAIdentityIfNeeded:(id *)a3
{
  BOOL v5 = -[IDSRegistrationKeyManager allowPairingIdentities](self, "allowPairingIdentities");
  if (v5)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identityClassA]);

    if (!v7)
    {
      char v24 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loadLegacyIdentityWithIdentifier:4 serializationDidChange:&v24 error:a3]);
      uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v12 setIdentityClassA:v11];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identityClassA]);

      unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 identityClassA]);
          id v19 = (void *)v18;
          __int16 v20 = @"YES";
          if (!v24) {
            __int16 v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          id v27 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded class A message protection identity {identity: %{private}@, serializationDidChange: %{public}@}",  buf,  0x16u);
        }

        if (v24)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v21 identityClassA]);

          id v23 = 0LL;
          -[IDSRegistrationKeyManager _saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:]( self,  "_saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:",  buf,  &v23,  1LL,  0LL);
        }
      }

      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0LL;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to load class A message protection identity {error: %{public}@}",  buf,  0xCu);
        }
      }
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping load class A message protection identity becuase shouldGeneratePairingIdentities == NO",  buf,  2u);
    }
  }

  return v5;
}

- (BOOL)_loadClassCIdentityIfNeeded:(id *)a3
{
  BOOL v5 = -[IDSRegistrationKeyManager allowPairingIdentities](self, "allowPairingIdentities");
  if (v5)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identityClassC]);

    if (!v7)
    {
      char v24 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loadLegacyIdentityWithIdentifier:5 serializationDidChange:&v24 error:a3]);
      uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v12 setIdentityClassC:v11];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identityClassC]);

      unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 identityClassC]);
          id v19 = (void *)v18;
          __int16 v20 = @"YES";
          if (!v24) {
            __int16 v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          id v27 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded class C message protection identity {identity: %{private}@, serializationDidChange: %{public}@}",  buf,  0x16u);
        }

        if (v24)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v21 identityClassC]);

          id v23 = 0LL;
          -[IDSRegistrationKeyManager _saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:]( self,  "_saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:",  buf,  &v23,  0LL,  0LL);
        }
      }

      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0LL;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to load class C message protection identity {error: %{public}@}",  buf,  0xCu);
        }
      }
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping load class C message protection identity becuase shouldGeneratePairingIdentities == NO",  buf,  2u);
    }
  }

  return v5;
}

- (BOOL)_loadClassDIdentityIfNeeded:(id *)a3
{
  BOOL v5 = -[IDSRegistrationKeyManager allowPairingIdentities](self, "allowPairingIdentities");
  if (v5)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identityClassD]);

    if (!v7)
    {
      char v24 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loadLegacyIdentityWithIdentifier:6 serializationDidChange:&v24 error:a3]);
      uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v12 setIdentityClassD:v11];

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identityClassD]);

      unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 identityClassD]);
          id v19 = (void *)v18;
          __int16 v20 = @"YES";
          if (!v24) {
            __int16 v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          id v27 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded class D message protection identity {identity: %{private}@, serializationDidChange: %{public}@}",  buf,  0x16u);
        }

        if (v24)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v21 identityClassD]);

          id v23 = 0LL;
          -[IDSRegistrationKeyManager _saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:]( self,  "_saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:",  buf,  &v23,  2LL,  0LL);
        }
      }

      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0LL;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to load class D message protection identity {error: %{public}@}",  buf,  0xCu);
        }
      }
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping load class D message protection identity becuase shouldGeneratePairingIdentities == NO",  buf,  2u);
    }
  }

  return v5;
}

- (void)_loadIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v243 = 0LL;
  v244 = &v243;
  uint64_t v245 = 0x2020000000LL;
  char v246 = 0;
  __int16 v242 = 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_loaded)
  {
    self->_loaded = 1;
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Registration key manager beginning locked load of identities",  buf,  2u);
    }

    v247[0] = 0LL;
    memset(v241, 0, 10);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keyPairProvider](self, "keyPairProvider"));
    id v240 = 0LL;
    [v6 copyRegistrationKeyPairForIdentifier:0 publicKey:v247 privateKey:&v241[1] keyPairSignature:&v240 isMigratedSignature:(char *)v241 + 1 isUpgradePending:v241];
    id v7 = v240;

    CFTypeRef v8 = v247[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v9 setPublicKey:v8];

    uint64_t v10 = *(void *)&v241[1];
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v11 setPrivateKey:v10];

    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v12 setSignature:v7];

    int v13 = HIBYTE(v241[0]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v14 setIsMigratedSignature:v13 != 0];

    if (v247[0])
    {
      CFRelease(v247[0]);
      v247[0] = 0LL;
    }

    if (*(void *)&v241[1])
    {
      CFRelease(*(CFTypeRef *)&v241[1]);
      *(void *)&v241[1] = 0LL;
    }

    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v7;
      v226 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      if ([v226 publicKey]) {
        __int16 v17 = @"YES";
      }
      else {
        __int16 v17 = @"NO";
      }
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      if ([v18 privateKey]) {
        id v19 = @"YES";
      }
      else {
        id v19 = @"NO";
      }
      if (v16) {
        __int16 v20 = @"YES";
      }
      else {
        __int16 v20 = @"NO";
      }
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      else {
        id v22 = @"NO";
      }
      if (LOBYTE(v241[0])) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      v249 = v17;
      __int16 v250 = 2112;
      v251 = v19;
      __int16 v252 = 2112;
      v253 = v20;
      __int16 v254 = 2112;
      v255 = v22;
      __int16 v256 = 2112;
      v257 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Loaded registration key pair {publicKey: %@, privateKey: %@, signature: %@, isMigratedSignature: %@, upgradePending: %@}",  buf,  0x34u);

      id v7 = v16;
    }

    if (LOBYTE(v241[0]))
    {
      if (-[IDSRegistrationKeyManager _isUnderFirstDataProtectionLock](self, "_isUnderFirstDataProtectionLock"))
      {
        char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Unable to load registration key pair; we're under lock, and this requires migration -- we need to migrate",
            buf,
            2u);
        }

        self->_detectedMigrationNeeded = 1;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager systemMonitor](self, "systemMonitor"));
        [v25 _addEarlyListener:self];

        self->_loaded = 0;
      }

      if (LOBYTE(v241[0])) {
        goto LABEL_49;
      }
    }

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 signature]);
    if (v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      if ([v28 publicKey])
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        BOOL v30 = [v29 privateKey] == 0;

        if (!v30)
        {
LABEL_49:

          goto LABEL_50;
        }

- (IDSRegistrationKeyManager)initWithSystemMonitor:(id)a3 keychainWrapper:(id)a4 loadingRateLimiter:(id)a5 identityDataSource:(id)a6 allowPairingIdentities:(BOOL)a7 allowRegenerateRegisteredIdentity:(BOOL)a8 keyPairProvider:(id)a9 ktRegistrationDataManager:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v17 = a6;
  id v37 = a9;
  id v36 = a10;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v31 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 740, @"Invalid parameter not satisfying: %@", @"keychainWrapper" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }

  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v30 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 739, @"Invalid parameter not satisfying: %@", @"systemMonitor" object file lineNumber description];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_9:
  int64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v32 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 741, @"Invalid parameter not satisfying: %@", @"identityDataSource" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___IDSRegistrationKeyManager;
  uint64_t v18 = -[IDSRegistrationKeyManager init](&v39, "init");
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_systemMonitor, a3);
    -[IMSystemMonitor addListener:](v19->_systemMonitor, "addListener:", v19);
    -[IMSystemMonitor setActive:](v19->_systemMonitor, "setActive:", 1LL);
    -[IMSystemMonitor setWatchesDataProtectionLockState:]( v19->_systemMonitor,  "setWatchesDataProtectionLockState:",  1LL);
    objc_storeStrong((id *)&v19->_keychainWrapper, a4);
    objc_storeStrong((id *)&v19->_loadingRateLimiter, a5);
    objc_storeStrong((id *)&v19->_identityDataSource, a6);
    __int16 v20 = -[IDSPerServiceApplicationKeyManager initWithIdentityDataSource:]( objc_alloc(&OBJC_CLASS___IDSPerServiceApplicationKeyManager),  "initWithIdentityDataSource:",  v17);
    applicationKeyManager = v19->_applicationKeyManager;
    v19->_applicationKeyManager = v20;

    v19->_allowPairingIdentities = a7;
    v19->_allowRegenerateRegisteredIdentity = a8;
    objc_storeStrong((id *)&v19->_keyPairProvider, a9);
    id v22 = objc_alloc_init(&OBJC_CLASS___IDSNGMKeyLoadingErrorContainer);
    recentKeyLoadingErrors = v19->_recentKeyLoadingErrors;
    v19->_recentKeyLoadingErrors = v22;

    objc_storeStrong((id *)&v19->_ktRegistrationDataManager, a10);
    char v24 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationKeyConfig);
    config = v19->_config;
    v19->_config = v24;

    __int16 v26 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v19->_lock;
    v19->_lock = v26;

    -[IDSRegistrationKeyManager _subscribeForTimeChangeNotification](v19, "_subscribeForTimeChangeNotification");
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v28 addObserver:v19 selector:"_ktDataNeedsUpdate:" name:@"KTEnrollmentSignatureUpdated" object:0];
  }

  return v19;
}

- (IDSRegistrationKeyManager)init
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  id v4 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
  BOOL v5 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  5LL,  86400.0);
  id v6 = -[IDSRegistrationKeyManagerIdentityDataSource initWithKeychainWrapper:]( objc_alloc(&OBJC_CLASS___IDSRegistrationKeyManagerIdentityDataSource),  "initWithKeychainWrapper:",  v4);
  id v7 = objc_alloc(&OBJC_CLASS___IDSKTRegistrationDataManager);
  CFTypeRef v8 = objc_alloc_init(&OBJC_CLASS___TransparencyDaemon);
  v9 = -[IDSKTRegistrationDataManager initWithIdentityDataSource:transparencyDaemon:]( v7,  "initWithIdentityDataSource:transparencyDaemon:",  v6,  v8);

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationKeyManagerKeyPairProvider);
  unsigned __int8 v11 = -[IDSRegistrationKeyManager initWithSystemMonitor:keychainWrapper:loadingRateLimiter:identityDataSource:allowPairingIdentities:allowRegenerateRegisteredIdentity:keyPairProvider:ktRegistrationDataManager:]( self,  "initWithSystemMonitor:keychainWrapper:loadingRateLimiter:identityDataSource:allowPairingIdentities:allowRegene rateRegisteredIdentity:keyPairProvider:ktRegistrationDataManager:",  v3,  v4,  v5,  v6,  1LL,  1LL,  v10,  v9);

  return v11;
}

- (void)dealloc
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager systemMonitor](self, "systemMonitor"));
  [v3 _removeEarlyListener:self];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager systemMonitor](self, "systemMonitor"));
  [v4 removeListener:self];

  -[IDSRegistrationKeyManager _unsubscribeForTimeChangeNotification](self, "_unsubscribeForTimeChangeNotification");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSRegistrationKeyManager;
  -[IDSRegistrationKeyManager dealloc](&v5, "dealloc");
}

- (void)setForceRoll:(BOOL)a3
{
  if (self->_forceRoll != a3)
  {
    BOOL v3 = a3;
    self->_forceRoll = a3;
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        id v6 = "!!WILL FORCE AN EC KEY ROLL ON NEXT REGISTER!!";
        id v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }

    else if (v5)
    {
      __int16 v8 = 0;
      id v6 = "!!NO LONGER FORCING EC KEY ROLL!!";
      id v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }

- (id)generateCSRForUserID:(id)a3
{
  id v4 = a3;
  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 0LL);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    if ([v5 privateKey])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v7 = [v6 publicKey];

      if (v7)
      {
        __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
        __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 SHA1HexString]);

        v22[0] = kSecOidCommonName;
        v22[1] = v9;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
        id v23 = v10;
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
        char v24 = v11;
        uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));

        int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        id v14 = [v13 publicKey];
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        CertificateRequest = (void *)SecGenerateCertificateRequest(v12, 0, v14, [v15 privateKey]);

        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = CertificateRequest;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Generated CSR with RSA public/private keypair {csr: %@}",  buf,  0xCu);
        }

        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v19 = [v18 privateKey];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    *(_DWORD *)buf = 138412802;
    id v26 = v4;
    __int16 v27 = 2048;
    id v28 = v19;
    __int16 v29 = 2112;
    id v30 = [v20 publicKey];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed generating CSR due to insufficient context {userID: %@, privateKey: %p, publicKey: %@}",  buf,  0x20u);
  }

  CertificateRequest = 0LL;
LABEL_11:

  return CertificateRequest;
}

- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
  BOOL v5 = -[IDSPerServiceApplicationKeyManager fullIdentityForKeyIndex:]( self->_applicationKeyManager,  "fullIdentityForKeyIndex:",  v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)fullDeviceIdentityContainer
{
  return -[IDSRegistrationKeyManager fullDeviceIdentityContainerUsableForKeyType:]( self,  "fullDeviceIdentityContainerUsableForKeyType:",  0LL);
}

- (id)fullDeviceIdentityContainerUsableForKeyType:(unint64_t)a3
{
  if (a3 >= 2 && (a3 != 2 || self->_failedToGeneratedPublicDataForNGMIdentity)) {
    goto LABEL_9;
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 unregisteredIdentityContainer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  __int16 v8 = v7;
  uint64_t v9 = v6
     ? objc_claimAutoreleasedReturnValue([v7 unregisteredIdentityContainer])
     : objc_claimAutoreleasedReturnValue([v7 registeredIdentityContainer]);
  uint64_t v10 = (void *)v9;

  if (!v10)
  {
LABEL_9:
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100694BDC(self);
    }

    uint64_t v10 = 0LL;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v10;
}

- (id)previousFullDeviceIdentityContainer
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previousRegisteredIdentityContainer]);

  if (!v4)
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100694C54(self);
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
  id v7 = -[IDSPerServiceApplicationKeyManager copyPublicIdentityDataToRegisterForKeyIndex:withError:]( self->_applicationKeyManager,  "copyPublicIdentityDataToRegisterForKeyIndex:withError:",  v5,  a4);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4
{
  uint64_t v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock", a3, a4);
  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
  ktRegistrationDataManager = self->_ktRegistrationDataManager;
  id v12 = 0LL;
  id v7 = -[IDSKTRegistrationDataManager copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:]( ktRegistrationDataManager,  "copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:",  v4,  0LL,  &v12);
  id v8 = v12;
  if (!v7)
  {
    uint64_t v9 = self->_ktRegistrationDataManager;
    uint64_t v11 = 0LL;
    id v7 = -[IDSKTRegistrationDataManager copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:]( v9,  "copyKTRegistrationDataToRegisterForKeyIndex:isRegistered:withError:",  v4,  1LL,  &v11);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v7;
}

- (id)fetchRegistrationStatusProvider
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager createRegistrationStatusProvider]( self->_ktRegistrationDataManager,  "createRegistrationStatusProvider"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_handleTransparencySignatureResponse:(id)a3 error:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  LODWORD(lock) = -[IDSKTRegistrationDataManager handleTransparencySignatureResponse:error:]( self->_ktRegistrationDataManager,  "handleTransparencySignatureResponse:error:",  v8,  v7);

  if ((_DWORD)lock) {
    -[IDSRegistrationKeyManager _notifyUnregisteredKTData](self, "_notifyUnregisteredKTData");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_handleTransparencySignatureResponseForRegistration:(id)a3 error:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IDSKTRegistrationDataManager handleTransparencySignatureResponse:error:]( self->_ktRegistrationDataManager,  "handleTransparencySignatureResponse:error:",  v8,  v7);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)publicMessageProtectionIdentityDataToRegisterWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 unregisteredIdentityContainer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v8 = v7;
  if (v6) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 unregisteredIdentityContainer]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 registeredIdentityContainer]);
  }
  uint64_t v10 = (void *)v9;

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 ngmFullDeviceIdentity]);
  if (!v11
    || (id v12 = (void *)v11,
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 ngmVersion]),
        v13,
        v12,
        !v13))
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Asked for public identity, but missing NGM identity. Attempting to repair",  buf,  2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 legacyFullIdentity]);
    unsigned int v16 = -[IDSRegistrationKeyManager _generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:]( self,  "_generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:",  v15,  0LL);

    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 unregisteredIdentityContainer]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      __int16 v20 = v19;
      if (v18) {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 unregisteredIdentityContainer]);
      }
      else {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 registeredIdentityContainer]);
      }
      id v22 = (void *)v21;

      uint64_t v10 = v22;
    }
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  char v24 = (void *)objc_claimAutoreleasedReturnValue([v23 unregisteredIdentityContainer]);
  -[IDSNGMKeyLoadingErrorContainer setHasUnregisteredContainer:]( self->_recentKeyLoadingErrors,  "setHasUnregisteredContainer:",  v24 != 0LL);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 registeredIdentityContainer]);
  -[IDSNGMKeyLoadingErrorContainer setHasRegisteredContainer:]( self->_recentKeyLoadingErrors,  "setHasRegisteredContainer:",  v26 != 0LL);

  if (v10)
  {
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 publicIdentityWithError:a3]);
    if (!v27)
    {
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100694D44((uint64_t)a3, self, v35);
      }
      __int16 v31 = 0LL;
      int64_t v32 = 0LL;
      __int16 v33 = 0LL;
      v34 = 0LL;
      goto LABEL_75;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 ngmFullDeviceIdentity]);
    v74 = v28;
    if (([v28 shouldRollEncryptionIdentity] & 1) == 0)
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 unappliedRollingTicket]);
      if (v30)
      {
      }

      else
      {
        BOOL forceRoll = self->_forceRoll;

        if (!forceRoll)
        {
          __int16 v33 = 0LL;
          v35 = 0LL;
          int64_t v32 = 0LL;
LABEL_57:
          v53 = (void *)objc_claimAutoreleasedReturnValue([v27 ngmPublicDeviceIdentity]);
          uint64_t v54 = objc_claimAutoreleasedReturnValue([v53 identityData]);

          v55 = (void *)objc_claimAutoreleasedReturnValue([v27 ngmPublicDeviceIdentity]);
          uint64_t v56 = objc_claimAutoreleasedReturnValue([v55 prekeyData]);

          int64_t v32 = (void *)v56;
          __int16 v33 = (void *)v54;
LABEL_58:
          int failedToGeneratedPublicDataForNGMIdentity = self->_failedToGeneratedPublicDataForNGMIdentity;
          if (v33) {
            BOOL v58 = v32 == 0LL;
          }
          else {
            BOOL v58 = 1;
          }
          int v59 = v58;
          if (v58)
          {
            v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              v73 = (void *)objc_claimAutoreleasedReturnValue([v27 ngmPublicDeviceIdentity]);
              uint64_t v68 = objc_claimAutoreleasedReturnValue([v73 debugDescription]);
              v71 = (void *)v68;
              v69 = @"YES";
              if (v33) {
                v70 = @"YES";
              }
              else {
                v70 = @"NO";
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v77 = v68;
              uint64_t v79 = (uint64_t)v70;
              __int16 v78 = 2112;
              if (!v32) {
                v69 = @"NO";
              }
              __int16 v80 = 2112;
              v81 = v69;
              _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "Failed to get NGM public data to register -- returning nil for EC {ngmPublicDeviceIdentity: %@, NGMIdent ityToRegister: %@, NGMPrekeyToRegister: %@}",  buf,  0x20u);
            }

            BOOL v61 = 1;
          }

          else
          {
            BOOL v61 = 0;
          }

          self->_int failedToGeneratedPublicDataForNGMIdentity = v61;
          if (failedToGeneratedPublicDataForNGMIdentity != v59)
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
            [v62 setAppBool:self->_failedToGeneratedPublicDataForNGMIdentity forKey:@"failedToGeneratedPublicDataForNGMIdentity"];
          }

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "legacyPublicIdentity", v71));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v63 dataRepresentationWithError:a3]);

          if (!v34)
          {
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
              sub_100694E18((uint64_t)a3, v27);
            }
          }

          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v27 ngmVersion]);

LABEL_75:
          goto LABEL_76;
        }
      }
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 unappliedRollingTicket]);

    if (v38)
    {
      v35 = 0LL;
    }

    else
    {
      id v75 = 0LL;
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v28 keyRollingTicketWithError:&v75]);
      v35 = (os_log_s *)v75;
      if (IMGetAppBoolForKey(@"ShowNGMKeyRollingNotifications"))
      {
        if (v38) {
          objc_super v39 = @"Rolling key";
        }
        else {
          objc_super v39 = @"Tried and failed to generate new key to roll";
        }
        sub_10012E874(1, @"NGM Key Rolling", v39, 1109LL);
      }

      if (!v38)
      {
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100694EB0();
        }
        id v38 = 0LL;
        int64_t v32 = 0LL;
        __int16 v33 = 0LL;
        goto LABEL_48;
      }
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v40 setUnappliedRollingTicket:v38];

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 unregisteredIdentityContainer]);

    if (!v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 registeredIdentityContainer]);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v45 setUnregisteredIdentityContainer:v44];

      if (!-[IDSRegistrationKeyManager _save](self, "_save"))
      {
        -[NSRecursiveLock unlock](self->_lock, "unlock");

        __int16 v31 = 0LL;
        int64_t v32 = 0LL;
        __int16 v33 = 0LL;
        v34 = 0LL;
LABEL_81:
        v66 = 0LL;
        goto LABEL_82;
      }
    }

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v38 identityData]);
    uint64_t v46 = objc_claimAutoreleasedReturnValue([v38 prekeyData]);
    int64_t v32 = (void *)v46;
    if (v33 && v46)
    {
LABEL_49:
      if (self->_forceRoll)
      {
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "!!FORCING A ROLL!!", buf, 2u);
        }
      }

      -[IDSNGMKeyLoadingErrorContainer setRollingError:](self->_recentKeyLoadingErrors, "setRollingError:", v35);

      if (v33 && v32) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }

    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue([v27 ngmPublicDeviceIdentity]);
      uint64_t v49 = objc_claimAutoreleasedReturnValue([v48 debugDescription]);
      v72 = (void *)v49;
      v50 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v77 = (uint64_t)v38;
      if (v33) {
        v51 = @"YES";
      }
      else {
        v51 = @"NO";
      }
      if (v32) {
        v50 = @"YES";
      }
      __int16 v78 = 2112;
      uint64_t v79 = v49;
      __int16 v80 = 2112;
      v81 = v51;
      __int16 v82 = 2112;
      v83 = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Failed to get NGM public data from ticket to register -- cancelling roll {ticket: %@, ngmPublicDeviceIdentity: % @, NGMIdentityToRegister: %@, NGMPrekeyToRegister: %@}",  buf,  0x2Au);
    }

- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3
{
  return -[IDSKTRegistrationDataManager keyTransparencyVersionNumberToRegisterForServiceType:]( self->_ktRegistrationDataManager,  "keyTransparencyVersionNumberToRegisterForServiceType:",  a3);
}

- (id)publicMessageProtectionDeviceIdentityContainerToRegister:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 unregisteredIdentityContainer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  id v8 = v7;
  if (v6) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 unregisteredIdentityContainer]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 registeredIdentityContainer]);
  }
  uint64_t v10 = (void *)v9;

  if (!v10)
  {
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100694CCC(self);
    }
    goto LABEL_12;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 publicIdentityWithError:a3]);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  int v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100694D44((uint64_t)a3, self, v13);
    }
LABEL_12:
    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unregisteredIdentityContainer]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 registeredIdentityContainer]);
    int v19 = 138478339;
    __int16 v20 = v11;
    __int16 v21 = 2113;
    id v22 = v15;
    __int16 v23 = 2113;
    char v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Returning publicIdentity to register {publicIdentityContainer: %{private}@, unregisteredContainer: %{private}@, re gisteredContainer: %{private}@}",  (uint8_t *)&v19,  0x20u);
  }

- (id)_generateIdentityWithExistingIdentity:(id)a3 identifier:(int64_t)a4 dataProtectionClass:(int64_t)a5
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Immediately returning existing message protection identity {identity: %@}",  buf,  0xCu);
    }

    id v10 = v8;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    id v17 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 generateLegacyIdentityWithIdentifier:a4 dataProtectionClass:a5 error:&v17]);
    id v13 = v17;

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    id v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v13;
        __int16 v20 = 2048;
        int64_t v21 = a5;
        __int16 v22 = 2112;
        __int16 v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Created new message protection identity {error: %@, protectionClass: %ld, identity: %@}",  buf,  0x20u);
      }
    }

    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      sub_100694F34((uint64_t)v13);
    }

    id v10 = v12;
  }

  return v10;
}

- (id)_getPublicMessageProtectionDataForIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v14 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 publicIdentityWithError:&v14]);
    id v6 = v14;
    id v7 = v6;
    if (v5)
    {
      id v13 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataRepresentationWithError:&v13]);
      uint64_t v9 = (os_log_s *)v13;

      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      uint64_t v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1006950A4((uint64_t)v5);
        }
      }

      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_100695038((uint64_t)v9);
        }
        id v8 = 0LL;
      }
    }

    else
    {
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100694FCC((uint64_t)v7);
      }
      id v8 = 0LL;
      uint64_t v9 = (os_log_s *)v7;
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100694FA0();
    }
    id v8 = 0LL;
  }

  return v8;
}

- (_SecMPFullIdentity)copyMessageProtectionIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredIdentityContainer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);

  id v6 = (_SecMPFullIdentity *)[v5 fullIdentity];
  id v7 = v6;
  if (v6)
  {
    CFRetain(v6);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100695120();
    }

    IMLogBacktrace(0LL);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v7;
}

- (_SecMPFullIdentity)latestCopyMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:]( self,  "latestMessageProtectionFullIdentityForDataProtectionClass:",  *(void *)&a3));
  uint64_t v4 = (_SecMPFullIdentity *)[v3 fullIdentity];
  uint64_t v5 = v4;
  if (v4)
  {
    CFRetain(v4);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10069514C();
    }

    IMLogBacktrace(0LL);
  }

  return v5;
}

- (_SecMPFullIdentity)copyPreviousMessageProtectionIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previousRegisteredIdentityContainer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);

  id v6 = (_SecMPFullIdentity *)[v5 fullIdentity];
  id v7 = v6;
  if (v6)
  {
    CFRetain(v6);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No previous message protection identity present -- not returning previous message protection identity",  v10,  2u);
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v7;
}

- (id)latestMessageProtectionFullIdentityForDataProtectionClass:(unsigned int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v13 = 0LL;
      -[IDSRegistrationKeyManager _loadClassAIdentityIfNeeded:](self, "_loadClassAIdentityIfNeeded:", &v13);
      id v5 = v13;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 identityClassA]);
    }

    else
    {
      id v11 = 0LL;
      -[IDSRegistrationKeyManager _loadClassDIdentityIfNeeded:](self, "_loadClassDIdentityIfNeeded:", &v11);
      id v5 = v11;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 identityClassD]);
    }
  }

  else
  {
    id v12 = 0LL;
    -[IDSRegistrationKeyManager _loadClassCIdentityIfNeeded:](self, "_loadClassCIdentityIfNeeded:", &v12);
    id v5 = v12;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 identityClassC]);
  }

  id v8 = (void *)v7;

  if (!v8)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1006951B0();
    }

    IMLogBacktrace(0LL);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v8;
}

- (id)publicMessageProtectionDataToRegisterForClassA
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:]( self,  "latestMessageProtectionFullIdentityForDataProtectionClass:",  1LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v3));
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v4;
}

- (id)publicMessageProtectionDataToRegisterForClassC
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:]( self,  "latestMessageProtectionFullIdentityForDataProtectionClass:",  0LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v3));
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v4;
}

- (id)publicMessageProtectionDataToRegisterForClassD
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:]( self,  "latestMessageProtectionFullIdentityForDataProtectionClass:",  2LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v3));
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v4;
}

- (id)publicMessageProtectionData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredIdentityContainer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v5));

  return v6;
}

- (void)_ensureIdentity:(id *)a3 savedIndentity:(id *)a4 protectionClass:(int64_t)a5 didSaveIdentity:(BOOL *)a6
{
  if (!*a4)
  {
    if (*a3) {
      goto LABEL_5;
    }
    else {
      uint64_t v11 = qword_100717278[a5];
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager _generateIdentityWithExistingIdentity:identifier:dataProtectionClass:]( self,  "_generateIdentityWithExistingIdentity:identifier:dataProtectionClass:",  0LL,  v11,  a5));
    id v13 = *a3;
    *a3 = v12;

    -[IDSRegistrationKeyManager _save](self, "_save");
  }

  if (*a3) {
LABEL_5:
  }
    -[IDSRegistrationKeyManager _saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:]( self,  "_saveClassXIdentity:savedIdentity:protectionClass:savedUnsavedIdentity:",  a3,  a4,  a5,  a6);
}

- (void)_subscribeForTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10002CC28,  @"SignificantTimeChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unsubscribeForTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0LL);
}

- (void)_retryGenerationIfNeeded
{
  if (!-[IDSRegistrationKeyManager _isUnderFirstDataProtectionLock](self, "_isUnderFirstDataProtectionLock"))
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 unregisteredIdentityContainer]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v6 = v5;
    if (v4) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 unregisteredIdentityContainer]);
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 registeredIdentityContainer]);
    }
    id v8 = (void *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 ngmFullDeviceIdentity]);
    if (!v9
      || (id v10 = (void *)v9,
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 ngmVersion]),
          v11,
          v10,
          !v11))
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Retrying generation due to missing NGM component.",  v15,  2u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 legacyFullIdentity]);
      unsigned int v14 = -[IDSRegistrationKeyManager _generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:]( self,  "_generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:",  v13,  0LL);

      if (v14) {
        -[IDSRegistrationKeyManager _notifyUnregisteredIdentityRegenerated]( self,  "_notifyUnregisteredIdentityRegenerated");
      }
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

- (void)_retryGenerationAfterDelay
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(v3 * 1000000000.0));
  uint64_t v6 = im_primary_queue(v4, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CEC4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_after(v4, v7, block);
}

- (BOOL)_generateUnregisteredIdentityWithExistingLegacyIdentity:(id)a3 existingNGMIdentity:(id)a4
{
  id v54 = a3;
  id v56 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 unregisteredIdentityContainer]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 ngmFullDeviceIdentity]);
  if (!v8)
  {

LABEL_7:
    int64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v54));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Generating unregistered identity", buf, 2u);
    }

    __int16 v20 = v55;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    id v57 = 0LL;
    id v58 = 0LL;
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 generateIdentityContainerWithIdentifier:1 existingLegacyIdentity:v55 existingNGMIdentity:v56 dataProtectionC lass:0 nonLegacyError:&v58 error:&v57]);
    id v24 = v58;
    unsigned int v16 = (os_log_s *)v57;

    -[IDSNGMKeyLoadingErrorContainer setGenerationError:](self->_recentKeyLoadingErrors, "setGenerationError:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 registeredIdentityContainer]);
    unsigned int v27 = [v23 isEqual:v26];

    if (v27)
    {
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 registeredIdentityContainer]);
        *(_DWORD *)buf = 138412546;
        v60 = v23;
        __int16 v61 = 2112;
        v62 = v30;
        __int16 v31 = "generatedIdentityContainer isEqual to registeredIdentityContainer -- no changes {generatedIdentityContaine"
              "r: %@, registeredIdentityContainer: %@}";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);

        goto LABEL_18;
      }

      goto LABEL_18;
    }

    int64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 unregisteredIdentityContainer]);
    unsigned int v34 = [v23 isEqual:v33];

    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v35 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 unregisteredIdentityContainer]);
        *(_DWORD *)buf = 138412546;
        v60 = v23;
        __int16 v61 = 2112;
        v62 = v30;
        __int16 v31 = "generatedIdentityContainer isEqual unregisteredIdentityContainer -- no changes {generatedIdentityContainer"
              ": %@, unregisteredIdentityContainer: %@}";
        goto LABEL_17;
      }

- (BOOL)_migrateRegisteredIdentityFromClassDtoClassCIfNeeded
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredIdentityContainer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);

  LODWORD(v4) = -[IDSRegistrationKeyManager _isSecurelyStoringIdentity:withExpectedProtectionClass:]( self,  "_isSecurelyStoringIdentity:withExpectedProtectionClass:",  v5,  0LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v4)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found internet message protection identity in class C -- no need to move it",  (uint8_t *)&v11,  2u);
    }

    LOBYTE(v6) = 1;
  }

  else
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Moving internet messsage protection identity from class D to class C",  (uint8_t *)&v11,  2u);
    }

    LODWORD(v6) = -[IDSRegistrationKeyManager _migrateIdentity:toProtectionClass:]( self,  "_migrateIdentity:toProtectionClass:",  v5,  0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"NO";
      if ((_DWORD)v6) {
        uint64_t v9 = @"YES";
      }
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Result of moving internet messsage protection identity from D to C is %@",  (uint8_t *)&v11,  0xCu);
    }

    if ((_DWORD)v6)
    {
      LOBYTE(v6) = 1;
      self->_hasCheckedMigrationThisLaunch = 1;
    }
  }

  return (char)v6;
}

- (void)_notifyUnregisteredIdentityRegenerated
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 unregisteredIdentityContainer]);
  if (v4)
  {
  }

  else
  {
    unsigned __int8 v5 = -[IDSPerServiceApplicationKeyManager hasUnregisteredIdentity]( self->_applicationKeyManager,  "hasUnregisteredIdentity");

    if ((v5 & 1) == 0) {
      return;
    }
  }

  self->_needsReRegister = 1;
  -[IDSRegistrationKeyManager _notifyRegenerateDelay](self, "_notifyRegenerateDelay");
  double v7 = v6;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Delaying notification of identity regeneration {delay: %f seconds}",  buf,  0xCu);
  }

  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(v7 * 1000000000.0));
  uint64_t v11 = im_primary_queue(v9, v10);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D864;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_after(v9, v12, block);
}

- (BOOL)registrationNeedsKTDataUpdated
{
  BOOL v3 = -[IDSKTRegistrationDataManager registrationNeedKTDataUpdated]( self->_ktRegistrationDataManager,  "registrationNeedKTDataUpdated");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)_notifyUnregisteredKTData
{
  if (-[IDSKTRegistrationDataManager hasUnregisteredKTData](self->_ktRegistrationDataManager, "hasUnregisteredKTData"))
  {
    self->_needsReRegister = 1;
    -[IDSRegistrationKeyManager _notifyKTReregisterDelay](self, "_notifyKTReregisterDelay");
    double v4 = v3;
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Delaying notification of unregistered KT data {delay: %f seconds}",  buf,  0xCu);
    }

    dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(v4 * 1000000000.0));
    uint64_t v8 = im_primary_queue(v6, v7);
    dispatch_time_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002DB34;
    block[3] = &unk_1008F6010;
    block[4] = self;
    dispatch_after(v6, v9, block);
  }

- (id)fullMessageProtectionIdentity
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredIdentityContainer]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)previousFullMessageProtectionIdentity
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previousRegisteredIdentityContainer]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 legacyFullIdentity]);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)fullMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3
{
  double v3 = -[IDSRegistrationKeyManager latestCopyMessageProtectionIdentityForDataProtectionClass:]( self,  "latestCopyMessageProtectionIdentityForDataProtectionClass:",  *(void *)&a3);
  if (v3)
  {
    double v4 = v3;
    unsigned __int8 v5 = -[IDSMPFullLegacyIdentity initWithFullIdentity:]( objc_alloc(&OBJC_CLASS___IDSMPFullLegacyIdentity),  "initWithFullIdentity:",  v3);
    CFRelease(v4);
  }

  else
  {
    unsigned __int8 v5 = 0LL;
  }

  return v5;
}

- (void)notePublicIdentityDidRegisterLegacyData:(id)a3 ngmIdentityData:(id)a4 ngmPrekeyData:(id)a5 keyIndexToIdentityData:(id)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (__CFString *)a6;
  -[NSRecursiveLock lock](self->_lock, "lock");
  unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v157 = v10;
    __int16 v158 = 2112;
    uint64_t v159 = (uint64_t)v11;
    __int16 v160 = 2112;
    id v161 = v12;
    __int16 v162 = 2112;
    v163 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Registration key manager noting registration of keys { legacyData: %@, ngmIdentityData: %@, ngmPrekeyData: %@, key IndexToIdentityData: %@ }",  buf,  0x2Au);
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 unregisteredIdentityContainer]);

  v132 = v11;
  v133 = v12;
  if (v16)
  {
    v138 = v13;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 unregisteredIdentityContainer]);
    id v154 = 0LL;
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 publicIdentityWithError:&v154]);
    __int16 v20 = (__CFString *)v154;

    if (v19)
    {
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 legacyPublicIdentity]);
      v153 = v20;
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 dataRepresentationWithError:&v153]);
      __int16 v23 = v153;

      v140 = (void *)v22;
      if (!v22)
      {
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10069551C();
        }
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 unappliedRollingTicket]);

      if (v26)
      {
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 unappliedRollingTicket]);
        id v29 = (id)objc_claimAutoreleasedReturnValue([v28 identityData]);

        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 unappliedRollingTicket]);
        int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 prekeyData]);
      }

      else
      {
        unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v19 ngmPublicDeviceIdentity]);
        id v29 = (id)objc_claimAutoreleasedReturnValue([v34 identityData]);

        id v30 = (void *)objc_claimAutoreleasedReturnValue([v19 ngmPublicDeviceIdentity]);
        int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 prekeyData]);
      }

      if (v29 && v32)
      {
LABEL_19:

        BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 unregisteredIdentityContainer]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 legacyFullIdentity]);
        id v38 =  -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v37);

        if (v10) {
          unsigned int v39 = [v140 isEqualToData:v10];
        }
        else {
          unsigned int v39 = 0;
        }
        if (v29 == v11)
        {
          unsigned int v40 = 1;
        }

        else if (v11)
        {
          unsigned int v40 = [v29 isEqualToData:v11];
        }

        else
        {
          unsigned int v40 = 0;
        }

        if (v32 == v133)
        {
          uint64_t v41 = 1LL;
        }

        else
        {
          if (!v133)
          {
            LODWORD(v41) = 0;
            goto LABEL_40;
          }

          uint64_t v41 = (uint64_t)[v32 isEqualToData:v133];
        }

        if ((v39 & v40) == 1 && (_DWORD)v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 unappliedRollingTicket]);

          if (v43)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 unregisteredIdentityContainer]);
            uint64_t v41 = objc_claimAutoreleasedReturnValue([v45 ngmFullDeviceIdentity]);
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            v47 = (void *)objc_claimAutoreleasedReturnValue([v46 unappliedRollingTicket]);
            id v152 = 0LL;
            unsigned int v48 = [(id)v41 updateWithRegisteredTicket:v47 error:&v152];
            id v136 = v152;

            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            [v49 setUnappliedRollingTicket:0];

            if (IMGetAppBoolForKey(@"ShowNGMKeyRollingNotifications"))
            {
              v50 = @"NO";
              if (v48) {
                v50 = @"YES";
              }
              v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rolled key, did succeed %@",  v50));
              sub_10012E874(1, @"NGM Key Rolling", v51, 1109LL);

              if ((v48 & 1) == 0) {
                goto LABEL_56;
              }
            }

            else if (!v48)
            {
LABEL_56:
              uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              v76 = v136;
              id v13 = v138;
              if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
                sub_10069538C(self, (uint64_t)v136, v77);
              }

LABEL_59:
LABEL_60:

              goto LABEL_61;
            }
          }

          else
          {
            id v136 = 0LL;
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 registeredIdentityContainer]);
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v55 setPreviousRegisteredIdentityContainer:v54];

          id v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 unregisteredIdentityContainer]);
          id v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v58 setRegisteredIdentityContainer:v57];

          int v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v59 setUnregisteredIdentityContainer:0];

          v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v60 buildOfUnregisteredIdentityGeneration]);
          v62 = v61;
          if (!v61)
          {
            uint64_t v41 = objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            v62 = (void *)objc_claimAutoreleasedReturnValue([(id)v41 buildOfIdentityGeneration]);
          }

          v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v63 setBuildOfIdentityGeneration:v62];

          if (!v61)
          {
          }

          v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v64 setBuildOfUnregisteredIdentityGeneration:0];

          id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            v66 = (__CFString *)objc_claimAutoreleasedReturnValue([v134 previousRegisteredIdentityContainer]);
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 registeredIdentityContainer]);
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
            v70 = v10;
            v71 = (void *)objc_claimAutoreleasedReturnValue([v69 buildOfIdentityGeneration]);
            *(_DWORD *)buf = 138412802;
            v157 = v66;
            __int16 v158 = 2112;
            uint64_t v159 = (uint64_t)v68;
            __int16 v160 = 2112;
            id v161 = v71;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Completed registration of previously unregistered identity {previousIdentity: %@, identity: %@, buildOfIde ntityGeneration: %@}",  buf,  0x20u);

            uint64_t v10 = v70;
          }

          -[IDSRegistrationKeyManager _save](self, "_save");
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          v73 = (void *)objc_claimAutoreleasedReturnValue([v72 previousRegisteredIdentityContainer]);

          id v13 = v138;
          if (v73)
          {
            +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
            id v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v74 + 3196800.0));
            IMSetAppValueForKey(@"PurgePreviousIdentityInterval", v75);

            -[IDSRegistrationKeyManager _schedulePurgeOfPreviousIdentityAfterDelay:]( self,  "_schedulePurgeOfPreviousIdentityAfterDelay:",  3196800.0);
          }

          v76 = v136;
          goto LABEL_59;
        }

- (void)noteDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled"))
  {
    if (v6) {
      -[IDSKTRegistrationDataManager notePublicIdentityDidRegisterKTData:forKeyIndex:]( self->_ktRegistrationDataManager,  "notePublicIdentityDidRegisterKTData:forKeyIndex:",  v6,  v4);
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)purgeMessageProtectionIdentity
{
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removing current message protection identity and key pair",  buf,  2u);
  }

  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
  -[NSRecursiveLock lock](self->_lock, "lock");
  *(_WORD *)&self->_loaded = 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v4 setPrivateKey:0];

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v5 setPublicKey:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v6 setSignature:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 registeredIdentityContainer]);
  id v30 = 0LL;
  unsigned __int8 v10 = [v7 removeIdentityContainer:v9 withIdentifier:2 dataProtectionClass:0 error:&v30];
  id v11 = v30;

  if ((v10 & 1) == 0)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10069564C();
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unregisteredIdentityContainer]);
  id v29 = v11;
  unsigned __int8 v16 = [v13 removeIdentityContainer:v15 withIdentifier:1 dataProtectionClass:0 error:&v29];
  id v17 = v29;

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1006955E8();
    }
  }

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 previousRegisteredIdentityContainer]);
  id v28 = v17;
  unsigned __int8 v22 = [v19 removeIdentityContainer:v21 withIdentifier:3 dataProtectionClass:0 error:&v28];
  id v23 = v28;

  if ((v22 & 1) == 0)
  {
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_100695584();
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v25 setRegisteredIdentityContainer:0];

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v26 setUnregisteredIdentityContainer:0];

  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  [v27 setPreviousRegisteredIdentityContainer:0];

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_purgePreviousIdentityFromMemoryAndKeychain
{
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Purging previous message protection identity from memory and keychain",  buf,  2u);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 previousRegisteredIdentityContainer]);
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 previousRegisteredIdentityContainer]);
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredIdentityContainer]);

    if (v8 != v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 previousRegisteredIdentityContainer]);
      id v26 = 0LL;
      unsigned int v14 = [v11 removeIdentityContainer:v13 withIdentifier:3 dataProtectionClass:0 error:&v26];
      double v15 = (os_log_s *)v26;

      unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      id v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 previousRegisteredIdentityContainer]);
          *(_DWORD *)buf = 138477827;
          id v28 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Removed previous identity from memory and keychain {previousIdentity: %{private}@}",  buf,  0xCu);
        }

        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
        [v20 setPreviousRegisteredIdentityContainer:0];

        if ((IMGetAppBoolForKey(@"ShowKeyRollingNotifications") & 1) == 0) {
          goto LABEL_18;
        }
        int64_t v21 = @"Purged previous identity";
      }

      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1006956B0();
        }

        int64_t v21 = @"Failed to purge previous identity";
      }

      sub_10012E874(1, @"Key Rolling", v21, 1109LL);
LABEL_18:
      -[IDSRegistrationKeyManager _save](self, "_save");
      goto LABEL_19;
    }
  }

  else
  {
  }

  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 previousRegisteredIdentityContainer]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 registeredIdentityContainer]);
    *(_DWORD *)buf = 138412546;
    id v28 = v23;
    __int16 v29 = 2112;
    id v30 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No previous identity to purge -- ignoring request {previousIdentity: %@, identity: %@}",  buf,  0x16u);
  }

- (void)_ktDataNeedsUpdate:(id)a3
{
  unsigned __int8 v4 = +[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled",  a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  id v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received notification that KT data needs updating.",  buf,  2u);
    }

    id v14 = 0LL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager publicMessageProtectionIdentityDataToRegisterWithError:]( self,  "publicMessageProtectionIdentityDataToRegisterWithError:",  &v14));
    id v6 = (os_log_s *)v14;
    uint64_t v9 = im_primary_queue(v6, v8);
    unsigned __int8 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002F7B0;
    block[3] = &unk_1008F5F80;
    block[4] = self;
    id v13 = v7;
    id v11 = v7;
    dispatch_async(v10, block);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100694A58();
  }
}

- (void)_generateKTRegistrationData:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IDSKTRegistrationDataManager requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:applicationKeyManager:]( self->_ktRegistrationDataManager,  "requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:applicationKeyManager:",  v5,  self->_applicationKeyManager);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 withCompletion:(id)a5
{
  lock = self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IDSKTRegistrationDataManager fetchKTSignatureDataForServiceTypes:publicIdentityData:applicationKeyManager:withCompletion:]( self->_ktRegistrationDataManager,  "fetchKTSignatureDataForServiceTypes:publicIdentityData:applicationKeyManager:withCompletion:",  v11,  v10,  self->_applicationKeyManager,  v9);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_handleKVSUpdateResponseForTrustedDevices:(id)a3 withSuccessfulKVSSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully synced KVS with trusted devices. { trustedDevices: %@ }",  (uint8_t *)&v9,  0xCu);
    }

    -[IDSKTRegistrationDataManager noteSuccessfulKVSSyncOfTrustedDevices:]( self->_ktRegistrationDataManager,  "noteSuccessfulKVSSyncOfTrustedDevices:",  v6);
  }

  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to sync trusted devices to KVS. Scheduling next sync attempt. { trustedDevices: %@ }",  (uint8_t *)&v9,  0xCu);
    }

    -[IDSKTRegistrationDataManager scheduleNextKVSSync](self->_ktRegistrationDataManager, "scheduleNextKVSSync");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)updateKVSForKTRegistrationData
{
  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "isKeyTransparencyEnabled"))
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[IDSKTRegistrationDataManager updateKVSWithCurrentKTRegistrationData]( self->_ktRegistrationDataManager,  "updateKVSWithCurrentKTRegistrationData");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }
  }

- (id)kvsTrustedDevices
{
  double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:]( self->_ktRegistrationDataManager,  "_createKTTrustedDeviceForKVSisRegistered:",  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:]( self->_ktRegistrationDataManager,  "_createKTTrustedDeviceForKVSisRegistered:",  1LL));
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }
  if (v5) {
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v3;
}

- (void)noteiCloudSignInTime
{
}

- (void)noteBuddyFinishTime
{
}

- (void)noteManateeAvailableTime
{
}

- (void)loadPairingIdentities:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[IDSRegistrationKeyManager allowPairingIdentities](self, "allowPairingIdentities"))
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    id v58 = 0LL;
    -[IDSRegistrationKeyManager _loadClassAIdentityIfNeeded:](self, "_loadClassAIdentityIfNeeded:", &v58);
    id v5 = (os_log_s *)v58;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identityClassA]);
    id v8 =  -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v7);

    id v57 = 0LL;
    -[IDSRegistrationKeyManager _loadClassCIdentityIfNeeded:](self, "_loadClassCIdentityIfNeeded:", &v57);
    id v9 = v57;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identityClassC]);
    id v12 =  -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v11);

    id v56 = 0LL;
    -[IDSRegistrationKeyManager _loadClassDIdentityIfNeeded:](self, "_loadClassDIdentityIfNeeded:", &v56);
    id v13 = v56;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identityClassD]);
    id v16 =  -[IDSRegistrationKeyManager _getPublicMessageProtectionDataForIdentity:]( self,  "_getPublicMessageProtectionDataForIdentity:",  v15);

    if (v3)
    {
      __int16 v55 = 0;
      char v54 = 0;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identityClassA]);
      if (v18)
      {
      }

      else
      {
        unsigned __int8 v19 = +[IDSKeychainWrapper isInteractionNotAllowedError:]( &OBJC_CLASS___IDSKeychainWrapper,  "isInteractionNotAllowedError:",  v5);

        if ((v19 & 1) == 0)
        {
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v20 unSavedidentityClassA]);

          int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          id v52 = (id)objc_claimAutoreleasedReturnValue([v21 identityClassA]);

          -[IDSRegistrationKeyManager _ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:]( self,  "_ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:",  buf,  &v52,  1LL,  (char *)&v55 + 1);
          id v22 = *(id *)buf;
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v23 setUnSavedidentityClassA:v22];

          id v24 = v52;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v25 setIdentityClassA:v24];
        }
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identityClassC]);
      if (v27)
      {
      }

      else
      {
        unsigned __int8 v28 = +[IDSKeychainWrapper isInteractionNotAllowedError:]( &OBJC_CLASS___IDSKeychainWrapper,  "isInteractionNotAllowedError:",  v9);

        if ((v28 & 1) == 0)
        {
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v29 unSavedidentityClassC]);

          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          id v52 = (id)objc_claimAutoreleasedReturnValue([v30 identityClassC]);

          -[IDSRegistrationKeyManager _ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:]( self,  "_ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:",  buf,  &v52,  0LL,  &v55);
          id v31 = *(id *)buf;
          int64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v32 setUnSavedidentityClassC:v31];

          id v33 = v52;
          unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v34 setIdentityClassC:v33];
        }
      }

      BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 identityClassD]);
      if (v36)
      {
      }

      else
      {
        unsigned __int8 v39 = +[IDSKeychainWrapper isInteractionNotAllowedError:]( &OBJC_CLASS___IDSKeychainWrapper,  "isInteractionNotAllowedError:",  v13);

        if ((v39 & 1) == 0)
        {
          unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          *(void *)buf = objc_claimAutoreleasedReturnValue([v40 unSavedidentityClassD]);

          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          id v52 = (id)objc_claimAutoreleasedReturnValue([v41 identityClassD]);

          -[IDSRegistrationKeyManager _ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:]( self,  "_ensureIdentity:savedIndentity:protectionClass:didSaveIdentity:",  buf,  &v52,  2LL,  &v54);
          id v42 = *(id *)buf;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v43 setUnSavedidentityClassD:v42];

          id v44 = v52;
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
          [v45 setIdentityClassD:v44];
        }
      }

      uint64_t v46 = im_primary_queue(v37, v38);
      v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v46);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100030034;
      block[3] = &unk_1008F68A0;
      char v49 = HIBYTE(v55);
      char v50 = v55;
      char v51 = v54;
      block[4] = self;
      dispatch_async(v47, block);
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Skipping loadPairingIdentities becuase shouldGeneratePairingIdentities == NO",  buf,  2u);
    }
  }
}

- (void)regeneratePairingIdentitiesIncludingClassD:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IDSRegistrationKeyManager _loadIfNeeded:](self, "_loadIfNeeded:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager systemMonitor](self, "systemMonitor"));
  unsigned int v6 = [v5 isUnderDataProtectionLock];

  if (v6)
  {
    self->_pendingIdentityRegeneration = 1;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identityClassA]);
    id v44 = 0LL;
    unsigned __int8 v10 = [v7 removeLegacyIdentity:v9 withIdentifier:4 dataProtectionClass:1 error:&v44];
    id v11 = v44;

    if ((v10 & 1) == 0)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100695854();
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v13 setIdentityClassA:0];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 unSavedidentityClassA]);
    id v43 = v11;
    [v15 purgeFromKeychain:&v43];
    id v16 = v43;

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v17 setUnSavedidentityClassA:0];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identityClassC]);
    id v42 = v16;
    unsigned __int8 v21 = [v18 removeLegacyIdentity:v20 withIdentifier:5 dataProtectionClass:0 error:&v42];
    id v22 = v42;

    if ((v21 & 1) == 0)
    {
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1006957C8();
      }
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v24 setIdentityClassC:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 unSavedidentityClassC]);
    id v41 = v22;
    [v26 purgeFromKeychain:&v41];
    id v27 = v41;

    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    [v28 setUnSavedidentityClassC:0];

    if (v3)
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager identityDataSource](self, "identityDataSource"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identityClassD]);
      id v40 = v27;
      unsigned __int8 v32 = [v29 removeLegacyIdentity:v31 withIdentifier:6 dataProtectionClass:2 error:&v40];
      id v33 = v40;

      if ((v32 & 1) == 0)
      {
        unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10069573C();
        }
      }

      BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v35 setIdentityClassD:0];

      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 unSavedidentityClassD]);
      id v39 = v33;
      [v37 purgeFromKeychain:&v39];
      id v27 = v39;

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
      [v38 setUnSavedidentityClassD:0];
    }

    -[IDSRegistrationKeyManager loadPairingIdentities:](self, "loadPairingIdentities:", 1LL);
    self->_pendingIdentityRegeneration = 0;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (__SecKey)identityPrivateKey
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  BOOL v4 = (__SecKey *)[v3 privateKey];

  return v4;
}

- (__SecKey)identityPublicKey
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  BOOL v4 = (__SecKey *)[v3 publicKey];

  return v4;
}

- (id)keyPairSignature
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signature]);

  return v4;
}

- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3 ktRegistrationKeyIndex:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v61 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager publicMessageProtectionDeviceIdentityContainerToRegister:]( self,  "publicMessageProtectionDeviceIdentityContainerToRegister:",  &v61));
  id v8 = v61;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 legacyPublicIdentity]);
  id v60 = v8;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataRepresentationWithError:&v60]);
  id v11 = (os_log_s *)v60;

  if (!-[IDSRegistrationKeyManager requiresKeychainMigration](self, "requiresKeychainMigration"))
  {
    if (![v10 length])
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1006958E0();
      }
      BOOL v12 = 0;
      goto LABEL_57;
    }

    if (self->_needsReRegister)
    {
      BOOL v12 = 1;
      goto LABEL_58;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keychainWrapper](self, "keychainWrapper"));
    int v59 = v11;
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v14 dataForIdentifier:@"message-protection-public-data-registered" error:&v59]);
    char v54 = v59;

    if (-[os_log_s length](v13, "length"))
    {
      if ((-[os_log_s isEqualToData:](v13, "isEqualToData:", v10) & 1) != 0)
      {
        BOOL v12 = 0;
LABEL_17:
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 ngmPublicDeviceIdentity]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identityData]);

        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 ngmPublicDeviceIdentity]);
        __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v19 prekeyData]);

        if (![v18 length] || !objc_msgSend(v55, "length"))
        {
          __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            v45 = @"YES";
            *(_DWORD *)buf = 138544131;
            v63 = v54;
            if (v18) {
              uint64_t v46 = @"YES";
            }
            else {
              uint64_t v46 = @"NO";
            }
            if (!v55) {
              v45 = @"NO";
            }
            __int16 v64 = 2113;
            id v65 = v7;
            __int16 v66 = 2113;
            v67 = v46;
            __int16 v68 = 2113;
            v69 = v45;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "Missing publicNGMIdentityData or publicNGMPrekeyData -- Not checking ngm data {error: %{public}@, publicCo ntainer: %{private}@, publicNGMIdentityData: %{private}@, publicNGMPrekeyData: %{private}@}",  buf,  0x2Au);
          }
        }

        uint64_t v21 = objc_claimAutoreleasedReturnValue([v7 ngmVersion]);
        id v22 = (void *)v21;
        v53 = v18;
        if (!v21)
        {
          unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            sub_100695948();
          }
          goto LABEL_47;
        }

        if (!v18 || !v55) {
          goto LABEL_48;
        }
        unsigned int v48 = v13;
        id v52 = (void *)v21;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keychainWrapper](self, "keychainWrapper"));
        id v58 = v54;
        uint64_t v24 = objc_claimAutoreleasedReturnValue( [v23 dataForIdentifier:@"ngm-message-protection-public-data-registered" error:&v58]);
        v25 = v58;

        id v26 = (os_log_s *)v24;
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager keychainWrapper](self, "keychainWrapper"));
        id v57 = v25;
        unsigned __int8 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v27 dataForIdentifier:@"ngm-message-protection-public-prekey-data-registered" error:&v57]);
        char v51 = v57;

        char v50 = v28;
        if (-[os_log_s length](v26, "length") && -[os_log_s length](v28, "length"))
        {
          if ((-[os_log_s isEqualToData:](v26, "isEqualToData:", v53) & 1) != 0)
          {
            unsigned __int8 v29 = -[os_log_s isEqualToData:](v28, "isEqualToData:", v55);
            id v30 = v52;
            id v13 = v48;
            if ((v29 & 1) != 0) {
              goto LABEL_38;
            }
            id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              v63 = v50;
              __int16 v64 = 2113;
              id v65 = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Registered ngm prekey data doesn't match current data -- returning YES {registeredNGMPrekeyData: %{priva te}@, publicNGMPrekeyData: %{private}@}",  buf,  0x16u);
            }

- (id)createKTRegistrationDataForServiceTypes:(id)a3 withPublicIdentity:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKTRegistrationDataManager createKTRegistrationDataForServiceTypes:usingPublicIdentityData:withApplicationKeyManager:]( self->_ktRegistrationDataManager,  "createKTRegistrationDataForServiceTypes:usingPublicIdentityData:withApplicationKeyManager:",  v8,  v7,  self->_applicationKeyManager));

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v9;
}

- (BOOL)isMigratedKeyPairSignature
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = [v3 isMigratedSignature];

  return v4;
}

- (BOOL)requiresKeychainMigration
{
  return self->_detectedMigrationNeeded;
}

- (BOOL)isUsingSecureStorageForClassA
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identityClassA]);
  BOOL v5 = -[IDSRegistrationKeyManager _isSecurelyStoringIdentity:withExpectedProtectionClass:]( self,  "_isSecurelyStoringIdentity:withExpectedProtectionClass:",  v4,  1LL);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)isUsingSecureStorageForClassC
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identityClassC]);
  BOOL v5 = -[IDSRegistrationKeyManager _isSecurelyStoringIdentity:withExpectedProtectionClass:]( self,  "_isSecurelyStoringIdentity:withExpectedProtectionClass:",  v4,  0LL);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)_isSecurelyStoringIdentity:(id)a3 withExpectedProtectionClass:(int64_t)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (v5)
  {
    id v13 = 0LL;
    id v7 = [v5 dataProtectionClassWithError:&v13];
    id v8 = v13;
    int64_t v9 = +[IDSKeychainWrapper idsKeychainWrapperDataProtectionClassFromIMDataProtectionClass:]( &OBJC_CLASS___IDSKeychainWrapper,  "idsKeychainWrapperDataProtectionClassFromIMDataProtectionClass:",  v7);
    if (v8)
    {
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218499;
        int64_t v15 = a4;
        __int16 v16 = 2114;
        id v17 = v8;
        __int16 v18 = 2113;
        unsigned __int8 v19 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to get identity data protection class {expectedProtectionClass: %ld, error: %{public}@, identity: %{private}@}",  buf,  0x20u);
      }

      BOOL v11 = 0;
    }

    else
    {
      BOOL v11 = v9 == a4;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)migrateToSecureStorageForClassA
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identityClassA]);
  BOOL v5 = -[IDSRegistrationKeyManager _migrateIdentity:toProtectionClass:]( self,  "_migrateIdentity:toProtectionClass:",  v4,  1LL);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)migrateToSecureStorageForClassC
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identityClassC]);
  BOOL v5 = -[IDSRegistrationKeyManager _migrateIdentity:toProtectionClass:]( self,  "_migrateIdentity:toProtectionClass:",  v4,  0LL);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)_migrateIdentity:(id)a3 toProtectionClass:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v10 = 0LL;
    unsigned __int8 v6 = objc_msgSend( v5,  "updateIdentityToDataProtectionClass:error:",  +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:]( IDSKeychainWrapper,  "imDataProtectionClassFromDataProtectionClass:",  a4),  &v10);
    id v7 = v10;
    if ((v6 & 1) == 0)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543875;
        id v12 = v7;
        __int16 v13 = 2113;
        id v14 = v5;
        __int16 v15 = 2048;
        int64_t v16 = a4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to migrate identity data protection class {error: %{public}@, identity: %{private}@, protectionClass: %ld}",  buf,  0x20u);
      }
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)regenerateRegisteredIdentity
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 unregisteredIdentityContainer]);

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Roll of encryption portion of registered identity requested, but we've already generated an unregistered identit y -- ignoring request",  v10,  2u);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requesting roll of encryption portion of registered identity",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 registeredIdentityContainer]);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ngmFullDeviceIdentity]);
    -[IDSRegistrationKeyManager _generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:]( self,  "_generateUnregisteredIdentityWithExistingLegacyIdentity:existingNGMIdentity:",  0LL,  v9);

    -[IDSRegistrationKeyManager _notifyUnregisteredIdentityRegenerated](self, "_notifyUnregisteredIdentityRegenerated");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_shouldRegenerateRegisteredIdentity
{
  if (-[IDSRegistrationKeyManager allowRegenerateRegisteredIdentity](self, "allowRegenerateRegisteredIdentity"))
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager config](self, "config"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 buildOfIdentityGeneration]);

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "returning NO from _shouldRegenerateRegisteredIdentity becuase allowRegenerateRegisteredIdentity == NO",  v8,  2u);
    }

    return 0;
  }

  return v5;
}

- (double)_randomizedIdentityRegenerationInterval
{
  double v3 = v2;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  else {
    double v5 = 2592000.0;
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v7 = [v6 isInternalInstall];

  double v8 = v3 + v5;
  if (v7) {
    uint32_t v9 = 1800;
  }
  else {
    uint32_t v9 = 2592000;
  }
  return v8 + (double)arc4random_uniform(v9);
}

- (void)_schedulePurgeOfPreviousIdentityAfterDelay:(double)a3
{
  uint64_t v5 = im_primary_queue(self, a2);
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000317DC;
  v7[3] = &unk_1008F68C8;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_async(v6, v7);
}

- (void)_purgePreviousIdentityTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000319B0;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_purgePreviousIdentityTimerFired
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Purge previous identity timer fired!", buf, 2u);
  }

  uint64_t v6 = im_primary_queue(v4, v5);
  unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031A84;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v7, block);

  -[IDSRegistrationKeyManager _purgePreviousIdentityFromMemoryAndKeychain]( self,  "_purgePreviousIdentityFromMemoryAndKeychain");
  IMRemoveAppValueForKey(@"PurgePreviousIdentityInterval");
}

- (void)_scheduleRegenerationOfRegisteredIdentityAfterDelay:(double)a3
{
  uint64_t v5 = im_primary_queue(self, a2);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100031B34;
  v7[3] = &unk_1008F68C8;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  dispatch_async(v6, v7);
}

- (void)_regenerateIdentityTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031D08;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_regenerateIdentityTimerFired
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Regenerate identity timer fired!", buf, 2u);
  }

  uint64_t v6 = im_primary_queue(v4, v5);
  unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031E3C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v7, block);

  if (-[IDSRegistrationKeyManager _shouldRegenerateRegisteredIdentity](self, "_shouldRegenerateRegisteredIdentity"))
  {
    -[IDSRegistrationKeyManager regenerateRegisteredIdentity](self, "regenerateRegisteredIdentity");
  }

  else
  {
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "We no longer need to re-generate our identity -- continuing without re-generation",  buf,  2u);
    }
  }

  IMRemoveAppValueForKey(@"RegenerateIdentityInterval");
}

- (double)_notifyRegenerateDelay
{
  return 60.0;
}

- (double)_notifyKTReregisterDelay
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-rereg-debounce-delay"]);

  double v5 = 0.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v5 = v7;
    }
  }

  return v5;
}

- (double)_purgePreviousIdentityDelay
{
  uint64_t v2 = IMGetAppValueForKey(@"PurgePreviousIdentityInterval", a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v8 = v6 - v7;
  }

  else
  {
    double v8 = 3196800.0;
  }

  if (v8 >= 2.22044605e-16) {
    double v9 = v8;
  }
  else {
    double v9 = 1.0;
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    __int16 v13 = v4;
    __int16 v14 = 2048;
    double v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Queried _purgePreviousIdentityDelay {purgeDateNumber: %{public}@, delay: %f}",  (uint8_t *)&v12,  0x16u);
  }

  return v9;
}

- (double)_identityRegenerationDelay
{
  uint64_t v3 = IMGetAppValueForKey(@"RegenerateIdentityInterval", a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    -[IDSRegistrationKeyManager _randomizedIdentityRegenerationInterval]( self,  "_randomizedIdentityRegenerationInterval");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    IMSetAppValueForKey(@"RegenerateIdentityInterval", v4);
  }

  [v4 doubleValue];
  double v6 = v5;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v8 = v6 - v7;
  if (v8 >= 2.22044605e-16) {
    double v9 = v8;
  }
  else {
    double v9 = 1.0;
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    __int16 v13 = v4;
    __int16 v14 = 2048;
    double v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Queried _identityRegenrationDelay {regenerationIntervalNumber: %{public}@, delay: %f}",  (uint8_t *)&v12,  0x16u);
  }

  return v9;
}

- (double)_generationRetryDelay
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"key-generation-retry-delay"]);

  double v6 = 30.0;
  if (v4)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    {
      [v4 doubleValue];
      double v6 = v8;
    }
  }

  double v9 = v6 * (double)self->_generationRetryCount;

  return v9;
}

- (BOOL)_shouldCheckUnregisteredKTData
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"should-check-unreg-kt-data"]);

  if (v3)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)errorContainerToReport
{
  return self->_recentKeyLoadingErrors;
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (IDSRateLimiter)loadingRateLimiter
{
  return self->_loadingRateLimiter;
}

- (void)setLoadingRateLimiter:(id)a3
{
}

- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource
{
  return self->_identityDataSource;
}

- (void)setIdentityDataSource:(id)a3
{
}

- (BOOL)allowPairingIdentities
{
  return self->_allowPairingIdentities;
}

- (void)setAllowPairingIdentities:(BOOL)a3
{
  self->_allowPairingIdentities = a3;
}

- (BOOL)allowRegenerateRegisteredIdentity
{
  return self->_allowRegenerateRegisteredIdentity;
}

- (void)setAllowRegenerateRegisteredIdentity:(BOOL)a3
{
  self->_allowRegenerateRegisteredIdentity = a3;
}

- (IDSRegistrationKeyConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)forceRoll
{
  return self->_forceRoll;
}

- (IDSRegistrationKeyManagerKeyPairProvider)keyPairProvider
{
  return self->_keyPairProvider;
}

- (void)setKeyPairProvider:(id)a3
{
}

- (unint64_t)generationRetryCount
{
  return self->_generationRetryCount;
}

- (void)setGenerationRetryCount:(unint64_t)a3
{
  self->_generationRetryCount = a3;
}

- (IDSKTRegistrationDataManager)ktRegistrationDataManager
{
  return self->_ktRegistrationDataManager;
}

- (void)setKtRegistrationDataManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end