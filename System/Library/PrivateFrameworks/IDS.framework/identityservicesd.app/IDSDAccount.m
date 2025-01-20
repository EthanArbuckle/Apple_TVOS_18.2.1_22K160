@interface IDSDAccount
+ (BOOL)dependentRegistration:(id)a3 hasDependentRegistrationWithURI:(id)a4 token:(id)a5;
+ (void)_sendLocallyWithSendParameters:(id)a3 service:(id)a4 uriToLocalDestination:(id)a5 data:(id)a6 protobuf:(id)a7 threadContext:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10;
+ (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 threadContext:(id)a6 sendParameters:(id)a7;
+ (void)dependentRegistration:(id)a3 findDeviceUniqueID:(id *)a4 btID:(id *)a5 forURI:(id)a6 token:(id)a7 supportsLiveDelivery:(BOOL *)a8;
+ (void)sendMessageWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8;
- (BOOL)_hasBudgetForForcedGDR;
- (BOOL)_isBuddyBlockingRegistration;
- (BOOL)_isPasswordPromptPermissibleDuringAuthentication;
- (BOOL)_issueForcedDependentCheckIfPossible;
- (BOOL)_migrateRegistrationIfNeeded;
- (BOOL)_rebuildRegistrationInfo:(BOOL)a3;
- (BOOL)_stopRegistrationAgent;
- (BOOL)forEachAdhocAccount:(id)a3;
- (BOOL)hasAliasURI:(id)a3;
- (BOOL)hasDependentRegistrationWithURI:(id)a3 token:(id)a4;
- (BOOL)hasEverRegistered;
- (BOOL)hasVettedAliasURI:(id)a3;
- (BOOL)isAdHocAccount;
- (BOOL)isBeingRemoved;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isDeviceRegistered;
- (BOOL)isEnabled;
- (BOOL)isRegistered;
- (BOOL)isRegistrationActive;
- (BOOL)isTemporary;
- (BOOL)isUsableForSending;
- (BOOL)isUserDisabled;
- (BOOL)issuingDependentCheck;
- (BOOL)pendingDependentCheck;
- (BOOL)provisionPseudonymForURI:(id)a3 properties:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completionBlock:(id)a6;
- (BOOL)revokePseudonym:(id)a3 requestProperties:(id)a4 completionBlock:(id)a5;
- (BOOL)shouldAutoRegisterAllHandles;
- (BOOL)shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3;
- (BOOL)shouldRegisterUsingDSHandle;
- (BOOL)updateKTOptInStatus:(BOOL)a3 withCompletion:(id)a4;
- (BOOL)updateKTOptInStatusWithRequest:(id)a3 withCompletion:(id)a4;
- (BOOL)wasDisabledAutomatically;
- (BOOL)wasRecentlySelectedAlias:(id)a3;
- (CUTDeferredTaskQueue)broadcastAccountInfoChangedTask;
- (IDSDAccount)initWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5;
- (IDSDAccount)initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7;
- (IDSDAccount)superAccount;
- (IDSGameCenterData)gameCenterData;
- (IDSRegistration)primaryRegistration;
- (IDSRegistration)registration;
- (IDSServiceProperties)service;
- (NSArray)dependentRegistrations;
- (NSArray)dependentRegistrationsIncludingCurrentDevice;
- (NSArray)linkedAccounts;
- (NSArray)prefixedURIStringsFromRegistration;
- (NSArray)pseudonyms;
- (NSArray)registeredDevices;
- (NSArray)unprefixedURIStringsFromRegistration;
- (NSDate)expirationDate;
- (NSDate)lastGDRDate;
- (NSDate)lastRegistrationFailureDate;
- (NSDate)lastRegistrationSuccessDate;
- (NSDictionary)accountInfo;
- (NSDictionary)accountSetupInfo;
- (NSDictionary)defaultPairedDependentRegistration;
- (NSDictionary)pseudonymURIMap;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)dsHandle;
- (NSString)dsID;
- (NSString)loginID;
- (NSString)uniqueID;
- (NSString)userUniqueIdentifier;
- (double)_maxSelectedButVettedGracePeriod;
- (id)_allUserIntentWithDefaultReason:(BOOL)a3;
- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingCurrentDevice:(BOOL)a4 includingTinker:(BOOL)a5;
- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingTinker:(BOOL)a4;
- (id)_fromIDFromDevice:(id)a3 withCBUUID:(id)a4 uniqueID:(id)a5;
- (id)_initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8 isAdHocAccount:(BOOL)a9;
- (id)_performedForcedGDRDatePeriod;
- (id)_registrationCert;
- (id)_unprefixedURIStringsFromAccountInfo;
- (id)_uriDictionariesFromAccountInfo;
- (id)_userIntentDictForAlias:(id)a3;
- (id)accountAndAdHocAccounts;
- (id)accountController;
- (id)adHocAccounts;
- (id)appleIDNotificationCenter;
- (id)defaultPairedDependentRegistrationIncludingTinker:(BOOL)a3;
- (id)dependentRegistrationMatchingUUID:(id)a3;
- (id)dependentRegistrationMatchingUUID:(id)a3 includingTinker:(BOOL)a4;
- (id)dependentRegistrationsIncludingTinker:(BOOL)a3;
- (id)fromIDForCBUUID:(id)a3 deviceID:(id)a4;
- (id)initAdHocAccountWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8;
- (id)invisibleAliases;
- (id)newSendMessageContext;
- (id)pairingManager;
- (id)peerIDManager;
- (id)primaryAccount;
- (id)primaryAccountUniqueID;
- (id)primaryServiceName;
- (id)pseudonymForPseudonymURIString:(id)a3;
- (id)pushHandler;
- (id)registrationCenter;
- (id)senderKeyDistributionManager;
- (id)serviceController;
- (id)serviceType;
- (id)smallDescription;
- (id)systemMonitor;
- (id)userDefaults;
- (id)utunDeliveryController;
- (id)vettedAliases;
- (int)_currentForcedGDRCount;
- (int)_neededRegistrationType;
- (int)accountType;
- (int)registrationErrorReason;
- (int)registrationStatus;
- (int64_t)_validationStatusForAlias:(id)a3;
- (int64_t)lastRegistrationFailureError;
- (int64_t)maxRemoteMessagingPayloadSize;
- (int64_t)registrationError;
- (unint64_t)_handleAndConvertFeatureToggleError:(int64_t)a3;
- (unint64_t)_unregistered130RetryInterval;
- (unsigned)currentAliasState:(id)a3;
- (unsigned)unselectReasonForAlias:(id)a3;
- (void)_acceptIncomingPushes;
- (void)_addAliases:(id)a3;
- (void)_addPseudonym:(id)a3;
- (void)_authenticateAccount;
- (void)_broadcastAccountInfoChanged;
- (void)_broadcastAccountMessageBlock:(id)a3;
- (void)_checkRegistration;
- (void)_cleanupAccount;
- (void)_clearForcedGDRCount;
- (void)_clearForcedGDRDate;
- (void)_clearGDRState;
- (void)_deregisterDeviceCenterNotifications;
- (void)_flushTokensForRegisteredURIs:(id)a3;
- (void)_handleKTOptInStatusUpdateError:(int64_t)a3;
- (void)_handlePseudonymProvisionError:(int64_t)a3;
- (void)_identityGenerated:(id)a3;
- (void)_identityRebuilt:(id)a3;
- (void)_ignoreIncomingPushes;
- (void)_incrementForcedGDRCount;
- (void)_issueCriticalDependentCheck;
- (void)_issueDependentCheck;
- (void)_keychainMigrationComplete:(id)a3;
- (void)_needsEncryptionIdentityRoll:(id)a3;
- (void)_notifyClientDelegatesWithBlock:(id)a3;
- (void)_notifyDelegatesAddedLocalDevice:(id)a3;
- (void)_notifyListenersAndSetDependentRegistrations:(id)a3 onRegistrationInfo:(id)a4;
- (void)_notifyListenersWithChanges:(id)a3;
- (void)_notifyRegistrationListenersAccountDidUpdateRegisteredDevices;
- (void)_parseHandlesInfo:(id)a3 currentAliases:(id)a4 currentVettedAliases:(id)a5;
- (void)_processReceivedDependentRegistration:(id)a3 oldDependentRegistrations:(id)a4;
- (void)_rapportSendWithSendParameters:(id)a3 completionBlock:(id)a4;
- (void)_reAuthenticate;
- (void)_refreshRegistration;
- (void)_registerAccount;
- (void)_registerForDeviceCenterNotifications;
- (void)_registrationAbilityChanged:(id)a3;
- (void)_removeAliases:(id)a3 withReason:(unsigned __int8)a4;
- (void)_removeAllPseudonyms;
- (void)_removeAuthenticationCredentials;
- (void)_removeAuthenticationCredentialsIncludingAuthToken:(BOOL)a3;
- (void)_removePseudonym:(id)a3;
- (void)_removePseudonyms:(id)a3;
- (void)_reregister;
- (void)_reregisterAndReProvision;
- (void)_reregisterAndReidentify:(BOOL)a3;
- (void)_resetVariables;
- (void)_retryRegister;
- (void)_saveAndNotifyGDRUpdate;
- (void)_sendLocallyWithSendParameters:(id)a3 uriToLocalDestination:(id)a4 data:(id)a5 protobuf:(id)a6 completionBlock:(id)a7;
- (void)_sendMessageWithSendParametersOnMainThread:(id)a3 filteredDestinations:(id)a4 data:(id)a5 compressedData:(id)a6 protobufToSend:(id)a7 willSendBlock:(id)a8 completionBlock:(id)a9;
- (void)_sendRemotelyWithSendParameters:(id)a3 data:(id)a4 protobuf:(id)a5 willSendBlock:(id)a6 completionBlock:(id)a7;
- (void)_setUserIntentState:(unsigned __int8)a3 forAlias:(id)a4 withReason:(unsigned __int8)a5;
- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8;
- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8 aliasProperties:(id)a9;
- (void)_setupAccount;
- (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 rapportDestinations:(id *)a6 sendParameters:(id)a7;
- (void)_stopTrackingUserIntentOfAlias:(id)a3;
- (void)_unregisterAccount;
- (void)_unvalidateAliases:(id)a3;
- (void)_updateAccountWithAccountInfo:(id)a3;
- (void)_updateCallerIDToTemporaryPhone;
- (void)_updateHandles:(BOOL)a3;
- (void)_updatePerformedForcedGDRDate;
- (void)_updatePhoneNumberCallerID;
- (void)_updatePseudonymsFromEmailInfo:(id)a3;
- (void)_updateRegistrationStatusWithError:(int64_t)a3 info:(id)a4;
- (void)_updateSessionsForAllRegisteredURIs;
- (void)_updateSessionsWithRegisteredURIs:(id)a3;
- (void)_updateSessionsWithRegisteredURIs:(id)a3 retryIfNotRegistered:(BOOL)a4;
- (void)_updateVettedAliases:(id)a3 emailInfo:(id)a4 addToCurrentHandlesIfNeeded:(BOOL)a5;
- (void)_validateAliases:(id)a3;
- (void)_validateAliases:(id)a3 validateAlreadyValid:(BOOL)a4;
- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4;
- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4 interestedSubservices:(id)a5;
- (void)activateRegistration;
- (void)addAliases:(id)a3;
- (void)addRegistrationListener:(id)a3;
- (void)askPeersToClearCacheWithURIs:(id)a3 fromURI:(id)a4 forService:(id)a5;
- (void)authenticateAccount;
- (void)authenticationChanged;
- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 failedRegionValidation:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)center:(id)a3 startedAuthenticating:(id)a4;
- (void)center:(id)a3 succeededAuthentication:(id)a4;
- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5;
- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6;
- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8;
- (void)cleanupAccount;
- (void)clearDisplayName;
- (void)deactivateAndPurgeIdentify;
- (void)deactivateRegistration;
- (void)dealloc;
- (void)decryptMessageData:(id)a3 guid:(id)a4 localURI:(id)a5 remoteURI:(id)a6 pushToken:(id)a7 groupID:(id)a8 encryptionType:(int64_t)a9 isLiveRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12;
- (void)didAddPairedDevice:(id)a3;
- (void)didRemovePairedDevice:(id)a3;
- (void)didUpdatePairedDevice:(id)a3;
- (void)didUpdateProtocolForPairedDevice:(id)a3;
- (void)findDeviceUniqueID:(id *)a3 btID:(id *)a4 forURI:(id)a5 token:(id)a6 supportsLiveDelivery:(BOOL *)a7;
- (void)gdrReAuthenticateIfNecessary;
- (void)handler:(id)a3 flushCacheForURIs:(id)a4;
- (void)handler:(id)a3 profile:(id)a4 deviceUpdated:(id)a5 service:(id)a6;
- (void)handler:(id)a3 profileHandlesUpdated:(id)a4 status:(id)a5 allowGDR:(id)a6;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)handler:(id)a3 reloadBag:(id)a4;
- (void)loadAliasUserIntentMetadataIfNeeded;
- (void)markAsSelectedAlias:(id)a3;
- (void)markAsUnselectedAlias:(id)a3 withReason:(unsigned __int8)a4;
- (void)markAsUnvettedAlias:(id)a3;
- (void)markAsVettedAlias:(id)a3;
- (void)markAsWasSelectedAlias:(id)a3;
- (void)passwordUpdated;
- (void)reIdentify;
- (void)refreshAdHocServiceNames;
- (void)refreshVettedAliases;
- (void)registerAccount;
- (void)registrationController:(id)a3 deregistrationSucceeded:(id)a4;
- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4;
- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)registrationController:(id)a3 registrationSucceeded:(id)a4;
- (void)registrationController:(id)a3 registrationUpdated:(id)a4;
- (void)registrationController:(id)a3 registrationWillStart:(id)a4;
- (void)registrationControllerNeedsNewRegistration:(id)a3;
- (void)removeAliases:(id)a3;
- (void)removeRegistrationListener:(id)a3;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6;
- (void)reportClientEvent:(id)a3 completionBlock:(id)a4;
- (void)reportMessage:(id)a3 toURI:(id)a4;
- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8;
- (void)reregister;
- (void)resetErrorState;
- (void)retrieveFeatureToggleStateForOptions:(id)a3 completionBlock:(id)a4;
- (void)sendMessage:(id)a3 params:(id)a4 bulkedPayload:(id)a5 fromID:(id)a6 toDestinations:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 encryptPayload:(BOOL)a10 wantsResponse:(BOOL)a11 expirationDate:(id)a12 command:(id)a13 wantsDeliveryStatus:(BOOL)a14 wantsCertifiedDelivery:(BOOL)a15 deliveryStatusContext:(id)a16 messageUUID:(id)a17 priority:(int64_t)a18 localDelivery:(BOOL)a19 disallowRefresh:(BOOL)a20 willSendBlock:(id)a21 completionBlock:(id)a22;
- (void)sendMessageWithSendParameters:(id)a3 willSendBlock:(id)a4 completionBlock:(id)a5;
- (void)sendSenderKeyMessageToDestinations:(id)a3 fromURI:(id)a4 guid:(id)a5 messageData:(id)a6 completionBlock:(id)a7;
- (void)sendServerMessage:(id)a3 command:(id)a4 completionBlock:(id)a5;
- (void)setDisplayName:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGameCenterData:(id)a3;
- (void)setIsBeingRemoved:(BOOL)a3;
- (void)setIsTemporary:(BOOL)a3;
- (void)setIsUserDisabled:(BOOL)a3;
- (void)setLoginID:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPendingDependentCheck:(BOOL)a3;
- (void)setRegistrationStatus:(int)a3 error:(int64_t)a4 alertInfo:(id)a5;
- (void)setUserUniqueIdentifier:(id)a3;
- (void)setWasDisabledAutomatically:(BOOL)a3;
- (void)setupAccountWithCompletionBlock:(id)a3;
- (void)systemDidFinishMigration;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidStartBackup;
- (void)systemRestoreStateDidChange;
- (void)unregisterAccount;
- (void)unvalidateAliases:(id)a3;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4;
- (void)updateFeatureToggleStateWithOptions:(id)a3 completionBlock:(id)a4;
- (void)validateAliases:(id)a3;
- (void)validateCredentialsWithDeliveryCompletionBlock:(id)a3;
- (void)validateProfile;
- (void)writeAccountDefaults:(id)a3;
@end

@implementation IDSDAccount

- (void)_cleanupAccount
{
  uint64_t v104 = 0LL;
  v105 = &v104;
  uint64_t v106 = 0x2020000000LL;
  char v107 = 0;
  uint64_t v100 = 0LL;
  v101 = &v100;
  uint64_t v102 = 0x2020000000LL;
  char v103 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  unsigned int v3 = [v75 isEqualToIgnoringCase:@"com.apple.madrid"];
  unsigned int v4 = [v75 isEqualToIgnoringCase:@"com.apple.ess"];
  unsigned int v5 = [v75 isEqualToIgnoringCase:@"com.apple.private.ac"];
  unsigned int v6 = [v75 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
  unsigned int v7 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsPhoneNumberRegistration");
  unsigned int v8 = -[IDSDAccount accountType](self, "accountType");
  BOOL v9 = v8 == 1;
  if (v8 == 1) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = 0;
  }
  unsigned int v71 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unsigned int v68 = v6;
  unsigned int v69 = v4;
  unsigned int v70 = v3;
  v64 = (void *)kIDSServiceDefaultsVettedAliasesKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountInfo, "objectForKey:"));
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_100161D30;
  v96[3] = &unk_1008FBC58;
  BOOL v99 = v9;
  id v14 = v11;
  id v97 = v14;
  v98 = &v104;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "__imArrayByApplyingBlock:", v96));

  key = (void *)kIDSServiceDefaultsAliasesKey;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountInfo, "objectForKey:"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_100161E38;
  v88[3] = &unk_1008FBC80;
  v93 = &v100;
  v94 = &v104;
  v73 = v12;
  v89 = v73;
  v90 = self;
  id v72 = v15;
  id v91 = v72;
  BOOL v95 = v9;
  id v67 = v14;
  id v92 = v67;
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByApplyingBlock:", v88));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "__imArrayByApplyingBlock:", &stru_1008FBCA0));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imSetFromArray"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray __imArrayByApplyingBlock:](v17, "__imArrayByApplyingBlock:", &stru_1008FBCC0));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "__imSetFromArray"));

  if (v76 && ([v76 isEqualToSet:v77] & 1) != 0
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration")),
        BOOL v22 = v21 == 0LL,
        v21,
        v22))
  {
    BOOL v74 = 0;
    v38 = v17;
  }

  else
  {
    id v23 = [v77 mutableCopy];
    [v23 minusSet:v76];
    id v66 = [v76 mutableCopy];
    [v66 minusSet:v77];
    if (!v17) {
      v17 = objc_alloc_init(&OBJC_CLASS___NSArray);
    }
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id obj = v23;
    id v24 = [obj countByEnumeratingWithState:&v84 objects:v123 count:16];
    uint64_t v25 = (uint64_t)v17;
    BOOL v74 = v24 != 0LL;
    if (v24)
    {
      uint64_t v26 = *(void *)v85;
      uint64_t v27 = kIDSServiceDefaultsAliasKey;
      uint64_t v28 = kIDSServiceDefaultsAliasStatusKey;
      uint64_t v29 = kIDSServiceDefaultsAliasIsUserVisibleKey;
      do
      {
        v30 = 0LL;
        v31 = (void *)v25;
        do
        {
          if (*(void *)v85 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)v30);
          v121[0] = v27;
          v121[1] = v28;
          v122[0] = v32;
          v122[1] = &off_100947368;
          v121[2] = v29;
          v122[2] = &__kCFBooleanFalse;
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v122,  v121,  3LL));
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v31 arrayByAddingObject:v33]);

          v30 = (char *)v30 + 1;
          v31 = (void *)v25;
        }

        while (v24 != v30);
        id v24 = [obj countByEnumeratingWithState:&v84 objects:v123 count:16];
      }

      while (v24);
    }

    if ([v66 count]) {
      IMSetAppBoolForKey(@"ReRegisterForAliasRepair", 1LL);
    }
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountCleanup](&OBJC_CLASS___IMRGLog, "accountCleanup"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
      unsigned int v36 = [obj count];
      unsigned int v37 = [v66 count];
      *(_DWORD *)buf = 138413314;
      v112 = v35;
      __int16 v113 = 1024;
      unsigned int v114 = v36;
      __int16 v115 = 1024;
      unsigned int v116 = v37;
      __int16 v117 = 2112;
      v118 = v77;
      __int16 v119 = 2112;
      v120 = v76;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Alias set does not match during cleanup {self: %@, registeredButNotStored.count: %d, storedButNotRegistered.coun t: %d, aliasStrings: %@, aliasesSet: %@}",  buf,  0x2Cu);
    }

    v38 = (void *)v25;
  }

  if ((v71 & (v70 | v69 | v5 | v68)) == 0)
  {
    int v46 = 0;
LABEL_31:
    v39 = self;
    goto LABEL_33;
  }

  v39 = self;
  if (!*((_BYTE *)v101 + 24) && -[IDSDAccount isRegistered](self, "isRegistered"))
  {
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountCleanup](&OBJC_CLASS___IMRGLog, "accountCleanup"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Account is missing sentinel alias, repairing...",  buf,  2u);
    }

    v41 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v38);
    v109[0] = kIDSServiceDefaultsAliasKey;
    v42 = (void *)objc_claimAutoreleasedReturnValue([kIDSServiceDefaultsSentinelAlias lowercaseString]);
    v110[0] = v42;
    v110[1] = &off_100947368;
    v109[1] = kIDSServiceDefaultsAliasStatusKey;
    v109[2] = kIDSServiceDefaultsAliasIsUserVisibleKey;
    v110[2] = &__kCFBooleanFalse;
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  3LL));

    -[NSMutableArray addObject:](v41, "addObject:", v43);
    v44 = v41;

    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountCleanup](&OBJC_CLASS___IMRGLog, "accountCleanup"));
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Indicating that we need to re-register for alias repair",  buf,  2u);
    }

    IMSetAppBoolForKey(@"ReRegisterForAliasRepair", 1LL);
    int v46 = 1;
    v38 = v44;
    goto LABEL_31;
  }

  int v46 = 0;
LABEL_33:
  v47 = (const void *)kIDSServiceDefaultsRegisteredURIs;
  v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v39->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsRegisteredURIs));

  if (*((_BYTE *)v105 + 24)) {
    int v49 = 1;
  }
  else {
    int v49 = v46;
  }
  if ((v74 | v49 | (v48 != 0LL)) == 1)
  {
    v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (*((_BYTE *)v105 + 24)) {
      int v51 = 1;
    }
    else {
      int v51 = v46;
    }
    if ((v74 | v51) == 1)
    {
      id v52 = v38;
      if (v52) {
        CFDictionarySetValue((CFMutableDictionaryRef)v50, key, v52);
      }

      if (((*((_BYTE *)v105 + 24) == 0) & ~v46) == 0)
      {
        id v53 = v72;
        if (v53) {
          CFDictionarySetValue((CFMutableDictionaryRef)v50, v64, v53);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
        [v54 setVettedEmails:v53];
      }
    }

    if (v48)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      if (v55) {
        CFDictionarySetValue((CFMutableDictionaryRef)v50, v47, v55);
      }
    }

    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountCleanup](&OBJC_CLASS___IMRGLog, "accountCleanup"));
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "  Cleaning up account!!! -- with changes: %@",  buf,  0xCu);
    }

    -[IDSDAccount _writeAccountDefaults:force:](self, "_writeAccountDefaults:force:", v50, 1LL);
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    v57 = v73;
    id v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v80,  v108,  16LL);
    if (v58)
    {
      uint64_t v59 = *(void *)v81;
      do
      {
        for (i = 0LL; i != v58; i = (char *)i + 1)
        {
          if (*(void *)v81 != v59) {
            objc_enumerationMutation(v57);
          }
          -[IDSDAccount markAsUnselectedAlias:withReason:]( self,  "markAsUnselectedAlias:withReason:",  *(void *)(*((void *)&v80 + 1) + 8LL * (void)i),  5LL);
        }

        id v58 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v80,  v108,  16LL);
      }

      while (v58);
    }
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonyms](self, "pseudonyms"));
  v62 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "__imArrayByFilteringWithBlock:", &stru_1008FBD00));

  if (-[NSMutableDictionary count](v62, "count"))
  {
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountCleanup](&OBJC_CLASS___IMRGLog, "accountCleanup"));
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "  Cleaning up expired pseudonyms {pseudonymsToRemove: %@}",  buf,  0xCu);
    }

    -[IDSDAccount _removePseudonyms:](self, "_removePseudonyms:", v62);
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
}

- (void)_resetVariables
{
  char v2 = *((_BYTE *)self + 81);
  *((_BYTE *)self + 80) &= 3u;
  *((_BYTE *)self + 81) = v2 & 0xFC;
}

- (void)_setupAccount
{
  *((_BYTE *)self + 80) |= 2u;
  registrationInfo = self->_registrationInfo;
  self->_registrationInfo = 0LL;

  unsigned int v4 = objc_autoreleasePoolPush();
  -[IDSDAccount _resetVariables](self, "_resetVariables");
  -[IDSDAccount _cleanupAccount](self, "_cleanupAccount");
  objc_autoreleasePoolPop(v4);
  unsigned int v5 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
  uint64_t v7 = im_primary_queue(v5, v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v5,  "initWithCapacity:queue:block:",  1LL,  v8,  &stru_1008FBD40);
  broadcastAccountInfoChangedTask = self->_broadcastAccountInfoChangedTask;
  self->_broadcastAccountInfoChangedTask = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v11 addConnectivityDelegate:self];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  [v12 addDelegate:self];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  objc_copyWeak(&v29, &location);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount uniqueID]( self,  "uniqueID",  _NSConcreteStackBlock,  3221225472LL,  sub_10016261C,  &unk_1008FBDD0));
  [v13 addCompletionBlock:&v28 forToken:v14];

  int64_t v15 = -[IDSDAccount registrationError](self, "registrationError");
  int v16 = -[IDSDAccount registrationErrorReason](self, "registrationErrorReason");
  if (v15 == -1)
  {
    int v17 = v16;
    if (v16 != -1)
    {
      uint64_t v18 = sub_10012EAA4(v16);
      v19 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v20 = kIDSServiceDefaultsRegistrationInfoKey;
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsRegistrationInfoKey));
      BOOL v22 = -[NSMutableDictionary initWithDictionary:](v19, "initWithDictionary:", v21);

      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
      if (v23) {
        CFDictionarySetValue(v22, kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey, v23);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v22,  v20));
      -[IDSDAccount _writeAccountDefaults:force:](self, "_writeAccountDefaults:force:", v24, 1LL);

      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = sub_10012EB10(v18);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 67109634;
        int v32 = v18;
        __int16 v33 = 2112;
        v34 = v27;
        __int16 v35 = 1024;
        int v36 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Setting registration error to %d (%@) from reason %d",  buf,  0x18u);
      }
    }
  }

  *((_BYTE *)self + 80) &= ~2u;
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (IDSDAccount)initWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v8;
    __int16 v45 = 2112;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "IDSDAccount initWithDictionary %@ service %@ uniqueID %@",  buf,  0x20u);
  }

  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___IDSDAccount;
  v12 = -[IDSDAccount init](&v42, "init");
  if (!v12) {
    goto LABEL_20;
  }
  if (v10)
  {
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSServiceDefaultsAccountTypeKey]);
      id v14 = [v13 intValue];

      if ((IDSIsValidAccountType(v14) & 1) != 0)
      {
        objc_storeStrong((id *)&v12->_uniqueID, a5);
        int64_t v15 = (NSMutableDictionary *)[v8 mutableCopy];
        accountInfo = v12->_accountInfo;
        v12->_accountInfo = v15;

        if (!v12->_accountInfo)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          uint64_t v18 = v12->_accountInfo;
          v12->_accountInfo = (NSMutableDictionary *)Mutable;
        }

        objc_storeStrong((id *)&v12->_service, a4);
        uint64_t v19 = kIDSServiceDefaultsAliasesKey;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSServiceDefaultsAliasesKey]);
        int v36 = _NSConcreteStackBlock;
        uint64_t v37 = 3221225472LL;
        v38 = sub_100163210;
        v39 = &unk_1008FBDF8;
        v21 = v12;
        v40 = v21;
        id v41 = v8;
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "__imArrayByApplyingBlock:", &v36));

        id v23 = objc_msgSend(v22, "count", v36, v37, v38, v39);
        id v24 = v12->_accountInfo;
        if (v23) {
          -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v22, v19);
        }
        else {
          -[NSMutableDictionary removeObjectForKey:](v24, "removeObjectForKey:", v19);
        }
        __int16 v33 = v12->_accountInfo;
        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 pushTopic]);
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v34, kIDSServiceDefaultsPushTopicKey);

        -[NSMutableDictionary removeObjectForKey:](v12->_accountInfo, "removeObjectForKey:", @"AuthToken");
        -[IDSDAccount _setupAccount](v21, "_setupAccount");

LABEL_20:
        int v32 = v12;
        goto LABEL_21;
      }

      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_10069DBBC((uint64_t)v14, v25, v26, v27, v28, v29, v30, v31);
      }
    }

    else
    {
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_10069DB5C();
      }
    }
  }

  else
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_10069DAFC();
    }
  }

  int v32 = 0LL;
LABEL_21:

  return v32;
}

- (id)_initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8 isAdHocAccount:(BOOL)a9
{
  uint64_t v11 = *(void *)&a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v42 = a7;
  id v18 = a8;
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 1024;
    int v51 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "IDSDAccount initWithLoginID %@ service %@ uniqueID %@ accountType %d",  buf,  0x26u);
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___IDSDAccount;
  uint64_t v20 = -[IDSDAccount init](&v43, "init");
  if (!v20) {
    goto LABEL_29;
  }
  if (!v17)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10069DAFC();
    }
    goto LABEL_32;
  }

  if ((IDSIsValidAccountType(v11) & 1) == 0)
  {
    BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_10069DBBC(v11, v22, v23, v24, v25, v26, v27, v28);
    }

    goto LABEL_33;
  }

  if (!v16)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10069DB5C();
    }
    goto LABEL_32;
  }

  if (!a9)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10069DCA0();
    }
    goto LABEL_32;
  }

  if (![v18 length])
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_10069DC24();
    }
LABEL_32:

LABEL_33:
    v40 = 0LL;
    goto LABEL_34;
  }

  [v16 adHocServiceType];
LABEL_20:
  if ([v42 count])
  {
    uint64_t v29 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v42);
    accountInfo = v20->_accountInfo;
    v20->_accountInfo = v29;
  }

  if (!v20->_accountInfo)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v32 = v20->_accountInfo;
    v20->_accountInfo = (NSMutableDictionary *)Mutable;
  }

  objc_storeStrong((id *)&v20->_service, a4);
  objc_storeStrong((id *)&v20->_uniqueID, a5);
  if ([v15 length]) {
    -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v15, kIDSServiceDefaultsLoginAsKey);
  }
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v33, kIDSServiceDefaultsServiceNameKey);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v16 pushTopic]);
  -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v34, kIDSServiceDefaultsPushTopicKey);

  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v35, kIDSServiceDefaultsAccountTypeKey);

  if (a9)
  {
    int v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 accountWithUniqueID:v18]);

    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 service]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
    -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v39, kIDSServiceDefaultsPrimaryServiceNameKey);

    -[IDSDAccount setObject:forKey:](v20, "setObject:forKey:", v18, kIDSServiceDefaultsPrimaryAccountKey);
  }

  -[IDSDAccount _setupAccount](v20, "_setupAccount");
LABEL_29:
  v40 = v20;
LABEL_34:

  return v40;
}

- (id)initAdHocAccountWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7 primaryAccount:(id)a8
{
  LOBYTE(v9) = 1;
  return -[IDSDAccount _initWithLoginID:service:uniqueID:accountType:accountConfig:primaryAccount:isAdHocAccount:]( self,  "_initWithLoginID:service:uniqueID:accountType:accountConfig:primaryAccount:isAdHocAccount:",  a3,  a4,  a5,  *(void *)&a6,  a7,  a8,  v9);
}

- (IDSDAccount)initWithLoginID:(id)a3 service:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountConfig:(id)a7
{
  LOBYTE(v8) = 0;
  return (IDSDAccount *)-[IDSDAccount _initWithLoginID:service:uniqueID:accountType:accountConfig:primaryAccount:isAdHocAccount:]( self,  "_initWithLoginID:service:uniqueID:accountType:accountConfig:primaryAccount:isAdHocAccount:",  a3,  a4,  a5,  *(void *)&a6,  a7,  0LL,  v8);
}

- (void)cleanupAccount
{
}

- (void)dealloc
{
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = uniqueID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc IDSAccount: %@", buf, 0xCu);
  }

  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_broadcastAccountInfoChangedTask, "cancelPendingExecutions");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  [v5 removeCompletionBlockForToken:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v7 removeConnectivityDelegate:self];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  [v8 removeDelegate:self];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  [v9 removeListener:self];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
  [v10 removeListener:self];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
  [v11 removeListener:self];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  [v12 removeListener:self];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v13 removeListener:self];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v14 removeObserver:self name:0 object:0];

  -[IDSDAccount _ignoreIncomingPushes](self, "_ignoreIncomingPushes");
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDRegistrationPushManager sharedInstance]( &OBJC_CLASS___IDSDRegistrationPushManager,  "sharedInstance"));
  [v15 stopTrackingRegisteredAccountID:self->_uniqueID];

  -[IDSRegistrationPushHandler removeListener:](self->_pushHandler, "removeListener:", self);
  -[IDSDAccount _stopRegistrationAgent](self, "_stopRegistrationAgent");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestoreMonitor sharedInstance](&OBJC_CLASS___IDSRestoreMonitor, "sharedInstance"));
  [v16 removeTarget:self];

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSDAccount;
  -[IDSDAccount dealloc](&v17, "dealloc");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    -[NSMutableDictionary setObject:forKey:](self->_accountInfo, "setObject:forKey:", v6, v7);
  }

  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory("Warning");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Missing object %@ or key %@ when changing accountInfo",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v11))
    {
      _IDSWarnV(@"IDSFoundation", @"Missing object %@ or key %@ when changing accountInfo");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Missing object %@ or key %@ when changing accountInfo");
      _IDSLogTransport(@"Warning", @"IDS", @"Missing object %@ or key %@ when changing accountInfo");
    }
  }
}

- (IDSServiceProperties)service
{
  return self->_service;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)userUniqueIdentifier
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsUserUniqueIdentifier);
}

- (void)setUserUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v6 = kIDSServiceDefaultsUserUniqueIdentifier;
    id v7 = a3;
    id v4 = a3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v5);

    -[IDSRegistration setUserUniqueIdentifier:](self->_registrationInfo, "setUserUniqueIdentifier:", v4);
    -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
  }

- (IDSGameCenterData)gameCenterData
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___IDSGameCenterData);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  IDSGameCenterContactsAssociationID));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  IDSGameCenterContactsSharingState));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  IDSGameCenterContactsLastUpdatedDate));
  id v7 = -[IDSGameCenterData initWithAssociationID:sharingState:lastUpdatedDate:]( v3,  "initWithAssociationID:sharingState:lastUpdatedDate:",  v4,  v5,  v6);

  return v7;
}

- (void)setGameCenterData:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 contactsAssociationID]);

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v9 contactsAssociationID]);
    -[IDSDAccount setObject:forKey:](self, "setObject:forKey:", v5, IDSGameCenterContactsAssociationID);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_accountInfo,  "removeObjectForKey:",  IDSGameCenterContactsAssociationID);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 contactsSharingState]);
  -[IDSDAccount setObject:forKey:](self, "setObject:forKey:", v6, IDSGameCenterContactsSharingState);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 contactsLastUpdatedDate]);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 contactsLastUpdatedDate]);
    -[IDSDAccount setObject:forKey:](self, "setObject:forKey:", v8, IDSGameCenterContactsLastUpdatedDate);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:]( self->_accountInfo,  "removeObjectForKey:",  IDSGameCenterContactsLastUpdatedDate);
  }
}

- (NSString)loginID
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLoginAsKey);
}

- (NSString)displayName
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsDisplayNameKey);
}

- (void)setDisplayName:(id)a3
{
  id v4 = (IDSDAccount *)a3;
  if (-[IDSDAccount length](v4, "length"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));
    unsigned __int8 v6 = [v5 isEqualToIgnoringCase:v4];

    if ((v6 & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
      unsigned int v8 = [v7 containsObject:v4];

      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));
          *(_DWORD *)buf = 138412802;
          id v16 = self;
          __int16 v17 = 2112;
          id v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Display name changed for account: %@    %@ => %@",  buf,  0x20u);
        }

        uint64_t v13 = kIDSServiceDefaultsDisplayNameKey;
        __int16 v14 = v4;
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
        -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v9);
      }

      else if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Requested display name: %@ is not part of valid account aliases: %@, ignoring!",  buf,  0x16u);
      }
    }
  }
}

- (void)clearDisplayName
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));

  if (v3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));
      *(_DWORD *)buf = 138412290;
      BOOL v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Request to clear Display Name on Account, Removing Display name %@",  buf,  0xCu);
    }

    uint64_t v7 = kIDSServiceDefaultsDisplayNameKey;
    unsigned int v8 = &stru_100912B50;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v6);
  }

- (void)setIsUserDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Account with uniqueID %@ was disabled by user",  buf,  0xCu);
    }
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v3,  kIDSServiceDefaultsUserDisabled));
  uint64_t v11 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v9);
}

- (BOOL)isUserDisabled
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsUserDisabled));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (int)accountType
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsAccountTypeKey));
  int v3 = [v2 intValue];

  return v3;
}

- (NSString)dsHandle
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dsHandle]);

  return (NSString *)v3;
}

- (NSString)dsID
{
  return (NSString *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsAuthorizationIDKey);
}

- (void)setLoginID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kIDSServiceDefaultsLoginAsKey;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLoginAsKey));
  if (([v4 isEqualToIgnoringCase:v6] & 1) == 0)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting loginID on account { oldLoginID: %@, newLoginID: %@, self: %@ }",  (uint8_t *)&v11,  0x20u);
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
    -[IDSDAccount setObject:forKey:](self, "setObject:forKey:", v8, v5);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    [v9 setMainID:v4];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    [v10 setVettedEmails:0];

    -[IDSDAccount registerAccount](self, "registerAccount");
  }
}

- (int)registrationStatus
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsRegistrationInfoKey));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsRegistrationInfoStatusKey]);
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (int)registrationErrorReason
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsRegistrationInfoKey));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsRegistrationInfoErrorCodeKey]);
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (int64_t)registrationError
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsRegistrationInfoKey));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey]);
  id v4 = v3;
  if (v3) {
    int64_t v5 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v5 = -1LL;
  }

  return v5;
}

- (BOOL)isTemporary
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsIsTemporary));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIsTemporary:(BOOL)a3
{
  if (a3)
  {
    uint64_t v10 = kIDSServiceDefaultsIsTemporary;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    int v11 = v4;
    int64_t v5 = &v11;
    unsigned __int8 v6 = &v10;
  }

  else
  {
    uint64_t v8 = kIDSServiceDefaultsIsTemporary;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v9 = v4;
    int64_t v5 = &v9;
    unsigned __int8 v6 = &v8;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v6,  1LL));
  -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v7);
}

- (NSDate)expirationDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsExpirationDate);
}

- (void)setExpirationDate:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount expirationDate](self, "expirationDate"));
  if (v4)
  {
    uint64_t v21 = kIDSServiceDefaultsExpirationDate;
    id v22 = v4;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v6);
  }

  else
  {
    uint64_t v19 = kIDSServiceDefaultsExpirationDate;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    uint64_t v20 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v7);
  }

  unsigned int v8 = -[IDSDAccount isTemporary](self, "isTemporary");
  if (v4 && v8 && !v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pushTopic]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForTopic:v11 ignoreServiceListener:1 messageContext:0]);

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountSetupInfo](self, "accountSetupInfo"));
    [v12 accountAdded:v13];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    LODWORD(v11) = [v14 isEnabledAccount:v15];

    if ((_DWORD)v11)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pushTopic]);
      [v12 accountEnabled:v16 onService:v18];
    }
  }
}

- (void)authenticationChanged
{
}

- (BOOL)isRegistered
{
  return -[IDSDAccount registrationStatus](self, "registrationStatus") == 5;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned __int8 v3 = [v2 shouldAutoRegisterAllHandles];

  return v3;
}

- (BOOL)shouldRegisterUsingDSHandle
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned __int8 v3 = [v2 shouldRegisterUsingDSHandle];

  return v3;
}

- (BOOL)isEnabled
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  unsigned __int8 v5 = [v3 isEnabledAccount:v4];

  return v5;
}

- (void)setupAccountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (_IMWillLog(@"IDSDAccount", v5))
  {
    uint64_t v25 = "-[IDSDAccount setupAccountWithCompletionBlock:]";
    _IMAlwaysLog(0LL, @"IDSDAccount", @"%s");
  }

  unsigned __int8 v6 = (void (**)(id, IDSDAccount *))objc_msgSend(v4, "copy", v25);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  [v7 enableAccountWithUniqueID:v8];

  unsigned int v9 = -[IDSDAccount registrationStatus](self, "registrationStatus");
  unsigned int v10 = v9;
  if (v9 == 5 || v9 == -1)
  {
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      *(_DWORD *)buf = 67109378;
      LODWORD(v27[0]) = v10;
      WORD2(v27[0]) = 2112;
      *(void *)((char *)v27 + 6) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "IDSDAccount status %d, calling handler: %@",  buf,  0x12u);
    }

    if (v6) {
      v6[2](v6, self);
    }
    goto LABEL_19;
  }

  if (-[IDSDAccount accountType](self, "accountType") != 1) {
    goto LABEL_13;
  }
  if (-[IDSDAccount shouldAutoRegisterAllHandles](self, "shouldAutoRegisterAllHandles")
    || -[IDSDAccount shouldRegisterUsingDSHandle](self, "shouldRegisterUsingDSHandle"))
  {
    -[IDSDAccount registerAccount](self, "registerAccount");
LABEL_13:
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:kIDSServiceDefaultsAliasesKey]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "__imArrayByApplyingBlock:", &stru_1008FBE18));

  id v22 = [v21 count];
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_DWORD *)buf = 138412290;
      v27[0] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Can configure account with aliases: %@",  buf,  0xCu);
    }

    -[IDSDAccount registerAccount](self, "registerAccount");
    -[IDSDAccount addAliases:](self, "addAliases:", v21);
    -[IDSDAccount validateAliases:](self, "validateAliases:", v21);
  }

  else
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "* No aliases to configure, nothing to do here",  buf,  2u);
    }
  }

  if (v6)
  {
LABEL_14:
    if (!self->_setupHandlers)
    {
      __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      setupHandlers = self->_setupHandlers;
      self->_setupHandlers = v13;
    }

    id v15 = [v6 copy];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10069DD00(v15, self, v16);
    }

    __int16 v17 = self->_setupHandlers;
    id v18 = objc_retainBlock(v15);
    -[NSMutableArray addObject:](v17, "addObject:", v18);
  }

- (NSArray)unprefixedURIStringsFromRegistration
{
  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uris]);
    id v5 = [v4 count];

    if (v5) {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount prefixedURIStringsFromRegistration](self, "prefixedURIStringsFromRegistration"));
    }
    else {
      unsigned __int8 v6 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v7 uris]);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_1008FBE38));

  return (NSArray *)v8;
}

- (NSArray)prefixedURIStringsFromRegistration
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uris]);

  return (NSArray *)v3;
}

- (BOOL)hasAliasURI:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uris]);
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)hasVettedAliasURI:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_registrationCert
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registrationCert]);

  return v3;
}

- (BOOL)hasEverRegistered
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsHasEverRegistered]);
  BOOL v4 = (int)[v3 intValue] > 0;

  return v4;
}

- (BOOL)isUsableForSending
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  unsigned int v5 = [v3 isEnabledAccount:v4];

  if (!v5) {
    return 0;
  }
  if (-[IDSDAccount accountType](self, "accountType") != 2)
  {
    unsigned int v7 = -[IDSDAccount accountType](self, "accountType");
    switch(v7)
    {
      case 3u:
        return -[IDSDAccount isRegistered](self, "isRegistered");
      case 1u:
        if (-[IDSDAccount isRegistered](self, "isRegistered"))
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
          if ([v9 count])
          {
            if ([v9 count] == (id)1)
            {
              unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);
              unsigned __int8 v11 = [v10 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

              char v6 = v11 ^ 1;
            }

            else
            {
              char v6 = 1;
            }
          }

          else
          {
            char v6 = 0;
          }

          return v6;
        }

        break;
      case 0u:
        return -[IDSDAccount isRegistered](self, "isRegistered");
    }

    return 0;
  }

  return 1;
}

+ (void)dependentRegistration:(id)a3 findDeviceUniqueID:(id *)a4 btID:(id *)a5 forURI:(id)a6 token:(id)a7 supportsLiveDelivery:(BOOL *)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v13 lowercaseString]);

    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v71;
      uint64_t v19 = IDSDevicePropertyPushToken;
      uint64_t v20 = IDSDevicePropertyIdentities;
      uint64_t v62 = IDSDevicePropertyIdentitiesURI;
      uint64_t v61 = IDSDevicePropertyDefaultPairedDevice;
      uint64_t v57 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v56 = IDSDevicePropertyClientData;
      uint64_t v55 = IDSPrivateDeviceDataUniqueID;
      uint64_t v54 = IDSDevicePropertyNSUUID;
      uint64_t v52 = IDSRegistrationPropertySupportsLiveDelivery;
      id v48 = v14;
      id v49 = v12;
      v60 = a5;
      id v58 = a8;
      id v47 = v15;
      uint64_t v44 = IDSDevicePropertyPushToken;
      uint64_t v45 = *(void *)v71;
      uint64_t v43 = IDSDevicePropertyIdentities;
      do
      {
        uint64_t v21 = 0LL;
        id v46 = v17;
        do
        {
          if (*(void *)v71 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v51 = v21;
          v64 = *(void **)(*((void *)&v70 + 1) + 8 * v21);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:v19]);
          uint64_t v23 = v22;
          if (v22)
          {
            __int16 v50 = v22;
            unsigned int v24 = [v22 isEqualToData:v14];
            uint64_t v23 = v50;
            if (v24)
            {
              uint64_t v25 = v64;
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKey:v20]);
              __int128 v66 = 0u;
              __int128 v67 = 0u;
              __int128 v68 = 0u;
              __int128 v69 = 0u;
              id obj = v26;
              id v27 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
              uint64_t v28 = v53;
              uint64_t v30 = v62;
              uint64_t v29 = a4;
              if (v27)
              {
                id v31 = v27;
                uint64_t v32 = *(void *)v67;
                uint64_t v59 = *(void *)v67;
                while (2)
                {
                  for (i = 0LL; i != v31; i = (char *)i + 1)
                  {
                    if (*(void *)v67 != v32) {
                      objc_enumerationMutation(obj);
                    }
                    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lowercaseString]);

                    if (v35 && [v35 isEqualToString:v28])
                    {
                      int v36 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v61]);
                      unsigned int v37 = [v36 BOOLValue];

                      if (v37)
                      {
                        id v14 = v48;
                        if (v29) {
                          *uint64_t v29 = IDSDeviceDefaultPairedDeviceUniqueID;
                        }
                        id v12 = v49;
                        if (v60) {
                          id *v60 = IDSDeviceDefaultPairedDeviceUniqueID;
                        }

                        id v15 = v47;
                        goto LABEL_35;
                      }

                      v38 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v57]);
                      v39 = (void *)objc_claimAutoreleasedReturnValue([v25 _dictionaryForKey:v56]);
                      v40 = (void *)objc_claimAutoreleasedReturnValue([v38 _stringForKey:v55]);
                      id v41 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v54]);
                      if (v29) {
                        *uint64_t v29 = v40;
                      }
                      if (v60) {
                        id *v60 = v41;
                      }
                      if (v58)
                      {
                        id v42 = (void *)objc_claimAutoreleasedReturnValue([v39 _numberForKey:v52]);
                        *id v58 = [v42 BOOLValue];

                        uint64_t v28 = v53;
                      }

                      uint64_t v30 = v62;
                      uint64_t v29 = a4;
                      uint64_t v32 = v59;
                      uint64_t v25 = v64;
                    }
                  }

                  id v31 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              id v14 = v48;
              id v12 = v49;
              id v17 = v46;
              id v15 = v47;
              uint64_t v19 = v44;
              uint64_t v18 = v45;
              uint64_t v20 = v43;
              uint64_t v23 = v50;
            }
          }

          uint64_t v21 = v51 + 1;
        }

        while ((id)(v51 + 1) != v17);
        id v17 = [v15 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }

      while (v17);
    }

- (void)findDeviceUniqueID:(id *)a3 btID:(id *)a4 forURI:(id)a5 token:(id)a6 supportsLiveDelivery:(BOOL *)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v12 && v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  [v15 wantsTinkerDevices]));

    uint64_t v17 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%@ Asked to look up device unique id for uri %@ and token %@ in our dependent registrations %@",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(1LL, @"IDSDAccount")) {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up device unique id for uri %@ and token %@ in our dependent registrations %@");
    }
    objc_msgSend( (id)objc_opt_class(self, v20),  "dependentRegistration:findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:",  v16,  a3,  a4,  v12,  v14,  a7);
  }

  else
  {
    uint64_t v21 = OSLogHandleForIDSCategory("IDSDAccount");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%@ Asked to look up device unique id for uri %@ and token %@ - failing",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v23) && _IDSShouldLog(0LL, @"IDSDAccount")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up device unique id for uri %@ and token %@ - failing");
    }
  }
}

+ (BOOL)dependentRegistration:(id)a3 hasDependentRegistrationWithURI:(id)a4 token:(id)a5
{
  id v42 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = v9;
  if (v8 && v9)
  {
    id v40 = v9;
    uint64_t v11 = OSLogHandleForIDSCategory("IDSDAccount");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v54 = a1;
      __int16 v55 = 2112;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v10;
      __int16 v59 = 2112;
      id v60 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@ Asked to look up existence of device with uri %@ and token %@ in our dependent registrations %@",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(1LL, @"IDSDAccount"))
    {
      v34 = v10;
      id v35 = v42;
      id v32 = a1;
      id v33 = v8;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up existence of device with uri %@ and token %@ in our dependent registrations %@");
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString", v32, v33, v34, v35));

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id obj = v42;
    id v41 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v41)
    {
      uint64_t v39 = *(void *)v48;
      uint64_t v38 = IDSDevicePropertyPushToken;
      uint64_t v36 = IDSDevicePropertyIdentities;
      uint64_t v15 = IDSDevicePropertyIdentitiesURI;
      do
      {
        for (i = 0LL; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v38]);
          uint64_t v19 = v18;
          if (v18 && [v18 isEqualToData:v40])
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v36]);
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            __int128 v43 = 0u;
            __int128 v44 = 0u;
            id v21 = v20;
            id v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v44;
              while (2)
              {
                for (j = 0LL; j != v22; j = (char *)j + 1)
                {
                  if (*(void *)v44 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lowercaseString]);

                  if (v26 && ([v26 isEqualToString:v14] & 1) != 0)
                  {

                    BOOL v27 = 1;
                    goto LABEL_35;
                  }
                }

                id v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }
          }
        }

        id v41 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      }

      while (v41);
    }

    BOOL v27 = 0;
LABEL_35:
    id v8 = (id)v14;
    unsigned int v10 = v40;
  }

  else
  {
    uint64_t v28 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = a1;
      __int16 v55 = 2112;
      id v56 = v8;
      __int16 v57 = 2112;
      id v58 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%@ Asked to look up existince of device with uri %@ and token %@ - failing",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v30) && _IDSShouldLog(0LL, @"IDSDAccount")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up existince of device with uri %@ and token %@ - failing");
    }
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)hasDependentRegistrationWithURI:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  [v8 wantsTinkerDevices]));

  if (objc_msgSend( (id)objc_opt_class(self, v10),  "dependentRegistration:hasDependentRegistrationWithURI:token:",  v9,  v6,  v7))
  {
    unsigned __int8 v11 = 1;
  }

  else if (-[IDSDAccount accountType](self, "accountType"))
  {
    unsigned __int8 v11 = 0;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 appleIDAccountOnService:v13]);
    unsigned __int8 v11 = [v14 hasDependentRegistrationWithURI:v6 token:v7];
  }

  return v11;
}

- (id)fromIDForCBUUID:(id)a3 deviceID:(id)a4
{
  id v6 = (IDSDAccount *)a3;
  id v7 = a4;
  unsigned int v8 = -[IDSServiceProperties shouldAllowLiveMessageDelivery]( self->_service,  "shouldAllowLiveMessageDelivery");
  uint64_t v61 = v7;
  if (v7) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  __int128 v71 = v6;
  if (v6 || v9)
  {
    unsigned int v66 = v9;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  [v11 wantsTinkerDevices]));

    uint64_t v13 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v78 = self;
      __int16 v79 = 2112;
      __int128 v80 = v6;
      __int16 v81 = 2112;
      id v82 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ Asked to look up fromID for CBUUID %@ in %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v15) && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      __int16 v59 = v6;
      id v60 = v12;
      id v58 = self;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up fromID for CBUUID %@ in %@");
    }

    if (v6)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      __int128 v70 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v16 lockedContinuityPeerID:v6]);

      uint64_t v17 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v70;
        __int16 v79 = 2112;
        __int128 v80 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found locked peer %@ for cbUUID %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        id v58 = v70;
        __int16 v59 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Found locked peer %@ for cbUUID %@");
      }

      if (!v70)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
        id v21 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v20 sessionIDforPeer:v71]);

        if (v21)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
          __int128 v70 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v22 lockedContinuityPeerID:v21]);

          uint64_t v23 = OSLogHandleForIDSCategory("IDSDAccount");
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v78 = v70;
            __int16 v79 = 2112;
            __int128 v80 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found locked peer %@ for sessionID %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v25)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            id v58 = v70;
            __int16 v59 = v21;
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Found locked peer %@ for sessionID %@");
          }
        }

        else
        {
          uint64_t v26 = OSLogHandleForIDSCategory("IDSDAccount");
          BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v78 = 0LL;
            __int16 v79 = 2112;
            __int128 v80 = v71;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Couldn't find locked peer %@ for cbUUID %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v28)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            id v58 = 0LL;
            __int16 v59 = v71;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Couldn't find locked peer %@ for cbUUID %@");
          }

          __int128 v70 = 0LL;
        }
      }
    }

    else
    {
      __int128 v70 = 0LL;
    }

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id obj = v12;
    id v29 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    if (v29)
    {
      __int128 v68 = 0LL;
      __int128 v69 = 0LL;
      __int128 v67 = 0LL;
      uint64_t v64 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v65 = *(void *)v73;
      uint64_t v63 = IDSPrivateDeviceDataUniqueID;
      uint64_t v30 = IDSDevicePropertyNSUUID;
      while (2)
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v73 != v65) {
            objc_enumerationMutation(obj);
          }
          id v32 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
          id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v64, v58, v59, v60));
          v34 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v33 _stringForKey:v63]);
          id v35 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 propertiesForDeviceWithUniqueID:v34]);
          unsigned int v37 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v30]);

          if (v71) {
            unsigned int v38 = -[IDSDAccount isEqualToString:](v37, "isEqualToString:", v71);
          }
          else {
            unsigned int v38 = 0;
          }
          if (v66) {
            unsigned int v39 = -[IDSDAccount isEqualToString:](v34, "isEqualToString:", v61);
          }
          else {
            unsigned int v39 = 0;
          }
          if (v70) {
            unsigned int v40 = -[IDSDAccount isEqualToString:](v34, "isEqualToString:");
          }
          else {
            unsigned int v40 = 0;
          }
          if ((v38 | v39) == 1)
          {
            if (((v40 | v39) & 1) != 0)
            {
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount _fromIDFromDevice:withCBUUID:uniqueID:]( self,  "_fromIDFromDevice:withCBUUID:uniqueID:",  v32,  v37,  v34));

              goto LABEL_76;
            }

            uint64_t v41 = OSLogHandleForIDSCategory("IDSDAccount");
            id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v78 = v37;
              __int16 v79 = 2112;
              __int128 v80 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "CBUUID matched, but uniqueID mismatched. Setting fallback device. { cbuuid: %@, uniqueID: %@ }",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v43)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v58 = v37;
              __int16 v59 = v34;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"CBUUID matched, but uniqueID mismatched. Setting fallback device. { cbuuid: %@, uniqueID: %@ }");
            }

            id v44 = v32;

            __int128 v45 = v37;
            __int128 v46 = v34;

            __int128 v68 = v45;
            __int128 v69 = v44;
            __int128 v67 = v46;
          }
        }

        id v29 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    else
    {
      __int128 v68 = 0LL;
      __int128 v69 = 0LL;
      __int128 v67 = 0LL;
    }

    unsigned int v47 = -[IDSServiceProperties shouldAllowLiveMessageDelivery]( self->_service,  "shouldAllowLiveMessageDelivery");
    if (v69) {
      unsigned int v48 = v47;
    }
    else {
      unsigned int v48 = 0;
    }
    if (v48 == 1)
    {
      uint64_t v49 = OSLogHandleForIDSCategory("IDSDAccount");
      __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties serviceName](self->_service, "serviceName"));
        *(_DWORD *)buf = 138412802;
        v78 = v71;
        __int16 v79 = 2112;
        __int128 v80 = v70;
        __int16 v81 = 2112;
        id v82 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Did not find any device in dependentRegistrations that matches lockedPeerID. Service supports live delivery, s o falling back to device that matches just cbuuid { cbuuid: %@, lockedPeerID: %@, service: %@ }",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v52)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        __int16 v59 = v70;
        id v60 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties serviceName](self->_service, "serviceName"));
        id v58 = v71;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Did not find any device in dependentRegistrations that matches lockedPeerID. Service supports live delivery, so falling back to device that matches just cbuuid { cbuuid: %@, lockedPeerID: %@, service: %@ }");
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount _fromIDFromDevice:withCBUUID:uniqueID:]( self,  "_fromIDFromDevice:withCBUUID:uniqueID:",  v69,  v68,  v67,  v58,  v59,  v60));
    }

    else
    {
      uint64_t v53 = OSLogHandleForIDSCategory("IDSDAccount");
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = [obj count];
        *(_DWORD *)buf = 138412802;
        v78 = v71;
        __int16 v79 = 2112;
        __int128 v80 = v70;
        __int16 v81 = 2048;
        id v82 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Did not find any device in dependentRegistrations that matches {cbuuid: %@, lockedPeerID: %@, count: %ld}",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v56)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        [obj count];
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Did not find any device in dependentRegistrations that matches {cbuuid: %@, lockedPeerID: %@, count: %ld}");
      }

      uint64_t v10 = 0LL;
    }

- (id)_fromIDFromDevice:(id)a3 withCBUUID:(id)a4 uniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[IDSServiceProperties adHocServiceType](self->_service, "adHocServiceType") == 2)
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSDAccount");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 _stringForKey:IDSDevicePropertyIdentifierOverride]);
      *(_DWORD *)buf = 138412802;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      unsigned int v37 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Returning device fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, uniqueIDOverride: %@}",  buf,  0x20u);
    }

    if ((os_log_shim_legacy_logging_enabled(v14) & 1) != 0)
    {
      int v15 = _IDSShouldLog(0LL, @"IDSDAccount");
      uint64_t v16 = IDSDevicePropertyIdentifierOverride;
      if (v15)
      {
        id v30 = v10;
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 _stringForKey:IDSDevicePropertyIdentifierOverride]);
        id v29 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Returning device fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, uniqueIDOverride: %@}");
      }
    }

    else
    {
      uint64_t v16 = IDSDevicePropertyIdentifierOverride;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_stringForKey:", v16, v29, v30, v31));
    BOOL v27 = (void *)_IDSCopyIDForDeviceUniqueID();
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 _dataForKey:IDSDevicePropertyPushToken]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    uint64_t v20 = _IDSPrefersPhoneNumbersForServiceIdentifier();

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
    id v22 = (void *)_IDSCopyCallerIDWithSelfMessagingHint(0LL, v21, 0LL, 0LL, 0LL, v20, 1LL);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 _bestGuessURIFromCanicalizedID]);

    uint64_t v24 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      unsigned int v37 = v17;
      __int16 v38 = 2112;
      unsigned int v39 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Returning token uri fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, deviceToken: %@, deviceFromID: %@}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v26) && _IDSShouldLog(0LL, @"IDSDAccount")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Returning token uri fromID for cbuuid {deviceCBUUID: %@, uniqueID: %@, deviceToken: %@, deviceFromID: %@}");
    }
    BOOL v27 = (void *)_IDSCopyIDForTokenWithURI(v17, v23);
  }

  return v27;
}

- (id)defaultPairedDependentRegistrationIncludingTinker:(BOOL)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount _dependentRegistrationsForDefaultPairedDevice:includingTinker:]( self,  "_dependentRegistrationsForDefaultPairedDevice:includingTinker:",  1LL,  a3));
  uint64_t v5 = OSLogHandleForIDSCategory("IDSDAccount");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%@ Asked to look up default paired device dependent registration in %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(1LL, @"IDSDAccount"))
  {
    id v21 = self;
    id v22 = v4;
    _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ Asked to look up default paired device dependent registration in %@");
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = IDSDevicePropertyDefaultPairedDevice;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v11, v21, v22, (void)v23));
        unsigned int v15 = [v14 BOOLValue];

        if (v15)
        {
          uint64_t v17 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v29 = self;
            __int16 v30 = 2112;
            id v31 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%@ found default paired device dependent registration %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v19)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"%@ found default paired device dependent registration %@");
          }

          id v16 = v13;
          goto LABEL_21;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_21:

  return v16;
}

- (NSDictionary)defaultPairedDependentRegistration
{
  return (NSDictionary *)-[IDSDAccount defaultPairedDependentRegistrationIncludingTinker:]( self,  "defaultPairedDependentRegistrationIncludingTinker:",  0LL);
}

- (IDSDAccount)superAccount
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superService]);

  if ([v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceWithPushTopic:v4]);

    switch(-[IDSDAccount accountType](self, "accountType"))
    {
      case 0:
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountsOnService:v6 withType:0]);

        if (![v8 count])
        {
          uint64_t v10 = 0LL;
          goto LABEL_12;
        }

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100167098;
        v13[3] = &unk_1008FB8F8;
        v13[4] = self;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v13));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

        if (v10) {
          goto LABEL_12;
        }
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 firstObject]);
        goto LABEL_11;
      case 1:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 appleIDAccountOnService:v6]);
        goto LABEL_11;
      case 2:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 localAccountOnService:v6]);
        goto LABEL_11;
      case 3:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 deviceAccountOnService:v6]);
LABEL_11:
        uint64_t v10 = (void *)v11;
LABEL_12:

        break;
      default:
        uint64_t v10 = 0LL;
        break;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return (IDSDAccount *)v10;
}

- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingTinker:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount _dependentRegistrationsForDefaultPairedDevice:includingCurrentDevice:includingTinker:]( self,  "_dependentRegistrationsForDefaultPairedDevice:includingCurrentDevice:includingTinker:",  v5,  0LL,  v4));
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (id)_dependentRegistrationsForDefaultPairedDevice:(BOOL)a3 includingCurrentDevice:(BOOL)a4 includingTinker:(BOOL)a5
{
  BOOL v141 = a3;
  v124 = objc_autoreleasePoolPush();
  v160 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dependentRegistrations]);

  v158 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 pairedDeviceUniqueID]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  uint64_t v13 = v12;
  BOOL v123 = a5;
  if (a5) {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 allPairedUniqueIDs]);
  }
  else {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 allTraditionallyPairedUniqueIDs]);
  }
  id v15 = v14;

  v140 = v15;
  v143 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v139 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIDToCbuuidsOfPairingDevicesDictionary]);

  context = objc_autoreleasePoolPush();
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  __int128 v173 = 0u;
  id obj = v9;
  id v17 = [obj countByEnumeratingWithState:&v170 objects:v180 count:16];
  v138 = (void *)v11;
  if (!v17)
  {
    char v130 = 0;
    goto LABEL_73;
  }

  id v18 = v17;
  char v130 = 0;
  uint64_t v19 = *(void *)v171;
  key = (void *)IDSDevicePropertyService;
  uint64_t v150 = IDSDevicePropertyPushToken;
  uint64_t v142 = IDSDevicePropertySubServices;
  v149 = (const void *)IDSDevicePropertyPrivateDeviceData;
  uint64_t v145 = IDSPrivateDeviceDataUniqueID;
  v136 = (void *)IDSDevicePropertyDefaultPairedDevice;
  v135 = (void *)IDSDevicePropertyIsActivePairedDevice;
  v133 = (void *)IDSDevicePropertyDefaultLocalDevice;
  v134 = (void *)IDSDevicePropertyIdentifierOverride;
  v132 = (void *)IDSDevicePropertyStableBluetoothIdentifier;
  v128 = (void *)IDSDevicePropertyPairingProtocolVersion;
  v126 = (void *)IDSDevicePropertyMaxCompatibilityVersion;
  v127 = (void *)IDSDevicePropertyMinCompatibilityVersion;
  v125 = (void *)IDSDeviceServicePropertyMinCompatibilityVersion;
  v129 = (void *)IDSDevicePropertyNSUUID;
  v131 = (void *)IDSDevicePropertyLocallyPresent;
  BOOL v137 = a4;
  uint64_t v147 = *(void *)v171;
  while (2)
  {
    uint64_t v20 = 0LL;
    id v148 = v18;
    do
    {
      if (*(void *)v171 != v19) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v170 + 1) + 8LL * (void)v20);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", key, context));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryServiceName](v160, "primaryServiceName"));
      unsigned int v24 = [v23 isEqualToIgnoringCase:v22];

      if (v24)
      {
        id v156 = (id)objc_claimAutoreleasedReturnValue([v21 objectForKey:v150]);
        if (!a4)
        {
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](v160, "primaryRegistration"));
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 pushToken]);
          unsigned __int8 v27 = [v156 isEqualToData:v26];

          if ((v27 & 1) != 0) {
            goto LABEL_67;
          }
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v160, "service"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);

        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v160, "service"));
        unsigned int v31 = [v30 adHocServiceType];

        if (v31)
        {
          if (v31 != 5)
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v142]);
            unsigned int v33 = [v32 containsObject:v29];

            if (!v33)
            {
LABEL_66:
              id v18 = v148;

              uint64_t v19 = v147;
LABEL_67:

              goto LABEL_68;
            }
          }
        }

        v153 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v149]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v153 _stringForKey:v145]);
        if (v35) {
          -[NSMutableSet removeObject:](v143, "removeObject:", v35);
        }
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString, v34);
        if ((objc_opt_isKindOfClass(v11, v36) & 1) != 0
          && (uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSString, v37), (objc_opt_isKindOfClass(v35, v38) & 1) != 0))
        {
          id v39 = [v35 isEqualToIgnoringCase:v11];
        }

        else
        {
          id v39 = 0LL;
        }

        if ((!v141 | v39) != 1)
        {
LABEL_65:

          goto LABEL_66;
        }

        unsigned int v40 = (__CFDictionary *)[v21 mutableCopy];
        id v41 = v29;
        value = v41;
        if (v41)
        {
          CFDictionarySetValue(v40, key, v41);
          id v41 = value;
        }

        v144 = v29;

        if (v31 && v31 != 5) {
          -[__CFDictionary removeObjectForKey:](v40, "removeObjectForKey:", v142);
        }
        id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
        if (v42) {
          CFDictionarySetValue(v40, v136, v42);
        }

        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
        if (v43) {
          CFDictionarySetValue(v40, v135, v43);
        }

        id v44 = v35;
        if (v35) {
          CFDictionarySetValue(v40, v134, v44);
        }

        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v140 containsObject:v44]));
        if (v45) {
          CFDictionarySetValue(v40, v133, v45);
        }

        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v139 objectForKey:v44]);
        unsigned int v47 = v46;
        if (v46)
        {
          id v48 = v46;
          CFDictionarySetValue(v40, v132, v48);
        }

        if (!(_DWORD)v39)
        {
LABEL_61:
          __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v39));
          if (v68) {
            CFDictionarySetValue(v40, v131, v68);
          }

          __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
          __int128 v70 = (void *)objc_claimAutoreleasedReturnValue([v69 propertiesForDeviceWithUniqueID:v44]);
          -[__CFDictionary addEntriesFromDictionary:](v40, "addEntriesFromDictionary:", v70);

          -[NSMutableArray addObject:](v158, "addObject:", v40);
          if ((v141 & v39 & 1) != 0)
          {

            goto LABEL_73;
          }

          a4 = v137;
          uint64_t v11 = (uint64_t)v138;
          id v29 = v144;
          goto LABEL_65;
        }

        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        id v50 = [v49 pairedDevicePairingProtocolVersion];

        if ((_DWORD)v50)
        {
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v50));
          if (v51) {
            CFDictionarySetValue(v40, v128, v51);
          }
        }

        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        id v53 = [v52 pairedDeviceMinCompatibilityVersion];

        if ((_DWORD)v53)
        {
          id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v53));
          if (v54) {
            CFDictionarySetValue(v40, v127, v54);
          }
        }

        id v55 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        id v56 = [v55 pairedDeviceMaxCompatibilityVersion];

        if ((_DWORD)v56)
        {
          __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v56));
          if (v57) {
            CFDictionarySetValue(v40, v126, v57);
          }
        }

        id v58 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        id v59 = [v58 pairedDeviceServiceMinCompatibilityVersion];

        if ((_DWORD)v59)
        {
          id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v59));
          if (v60) {
            CFDictionarySetValue(v40, v125, v60);
          }
        }

        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v61 pairedDeviceUUIDString]);

        if (v62) {
          CFDictionarySetValue(v40, v129, v62);
        }

        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v40, "objectForKey:", v149));
        id v64 = [v63 mutableCopy];

        if (v64)
        {
          uint64_t v65 = (__CFDictionary *)v64;
        }

        else
        {
          uint64_t v65 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!v65)
          {
LABEL_60:
            unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
            __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 pairedDevicePrivateData]);
            -[__CFDictionary addEntriesFromDictionary:](v65, "addEntriesFromDictionary:", v67);

            char v130 = 1;
            goto LABEL_61;
          }
        }

        CFDictionarySetValue(v40, v149, v65);

        goto LABEL_60;
      }

- (NSArray)dependentRegistrations
{
  return (NSArray *)-[IDSDAccount _dependentRegistrationsForDefaultPairedDevice:includingTinker:]( self,  "_dependentRegistrationsForDefaultPairedDevice:includingTinker:",  0LL,  0LL);
}

- (id)dependentRegistrationsIncludingTinker:(BOOL)a3
{
  return -[IDSDAccount _dependentRegistrationsForDefaultPairedDevice:includingTinker:]( self,  "_dependentRegistrationsForDefaultPairedDevice:includingTinker:",  0LL,  a3);
}

- (NSArray)dependentRegistrationsIncludingCurrentDevice
{
  return (NSArray *)-[IDSDAccount _dependentRegistrationsForDefaultPairedDevice:includingCurrentDevice:includingTinker:]( self,  "_dependentRegistrationsForDefaultPairedDevice:includingCurrentDevice:includingTinker:",  0LL,  1LL,  0LL);
}

- (NSArray)registeredDevices
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount dependentRegistrations](self, "dependentRegistrations"));
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegisteredDevice registeredDeviceFromDependentRegistrationDictionary:]( &OBJC_CLASS___IDSRegisteredDevice,  "registeredDeviceFromDependentRegistrationDictionary:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8),  (void)v11));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (id)dependentRegistrationMatchingUUID:(id)a3 includingTinker:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  v4));
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = IDSDevicePropertyIdentifierOverride;
    uint64_t v20 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v19 = IDSPrivateDeviceDataUniqueID;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_stringForKey:", v11, v19));
        if (![v14 length])
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v20]);
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 _stringForKey:v19]);

          __int128 v14 = (void *)v16;
        }

        if ([v14 isEqualToIgnoringCase:v6])
        {
          id v17 = v13;

          goto LABEL_13;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_13:

  return v17;
}

- (id)dependentRegistrationMatchingUUID:(id)a3
{
  return -[IDSDAccount dependentRegistrationMatchingUUID:includingTinker:]( self,  "dependentRegistrationMatchingUUID:includingTinker:",  a3,  0LL);
}

- (NSDate)lastGDRDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLastGDRDateKey);
}

- (NSDate)lastRegistrationSuccessDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLastRegistrationSuccessDateKey);
}

- (NSDate)lastRegistrationFailureDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLastRegistrationFailureDateKey);
}

- (int64_t)lastRegistrationFailureError
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsLastRegistrationFailureErrorKey));
  unsigned __int8 v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = -1LL;
  }

  return v4;
}

- (id)primaryAccount
{
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccountUniqueID](self, "primaryAccountUniqueID"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 accountWithUniqueID:v4]);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)primaryAccountUniqueID
{
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount")) {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsPrimaryAccountKey));
  }
  else {
    unsigned __int8 v3 = 0LL;
  }
  return v3;
}

- (IDSRegistration)primaryRegistration
{
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsPrimaryAccountKey));
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountWithUniqueID:v3]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 registration]);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  }

  return (IDSRegistration *)v6;
}

- (id)primaryServiceName
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountInfo,  "objectForKey:",  kIDSServiceDefaultsPrimaryServiceNameKey));
  if (![v3 length])
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 identifier]);

    unsigned __int8 v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)isAdHocAccount
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsPrimaryServiceNameKey]);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_broadcastAccountMessageBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if (v4)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountAndAdHocAccounts](self, "accountAndAdHocAccounts", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }
  }
}

- (void)_notifyListenersWithChanges:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    -[IMMessageContext setShouldBoost:](v5, "setShouldBoost:", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsRegistrationInfoKey]);
    if (v6)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100168AAC;
      v32[3] = &unk_1008FBE60;
      unsigned int v33 = v5;
      id v34 = v6;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v32);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsAliasesKey]);
    if (v7)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100168BE0;
      v29[3] = &unk_1008FBE60;
      __int16 v30 = v5;
      id v31 = v7;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v29);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsVettedAliasesKey]);
    if (v8)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100168D14;
      v26[3] = &unk_1008FBE60;
      unsigned __int8 v27 = v5;
      id v28 = v8;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v26);
    }

    __int128 v13 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsProfileKey]);
    if (v9)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100168E48;
      v23[3] = &unk_1008FBE60;
      __int128 v24 = v5;
      id v25 = v9;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v23);
    }

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsLoginAsKey]);
    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100168F7C;
      v20[3] = &unk_1008FBE60;
      __int128 v21 = v5;
      id v22 = v10;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v20);
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsDisplayNameKey]);
    if (v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1001690B0;
      v17[3] = &unk_1008FBE60;
      id v18 = v5;
      id v19 = v11;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v17);
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsPseudonymsKey]);
    if (v12)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1001691E4;
      v14[3] = &unk_1008FBE60;
      id v15 = v5;
      id v16 = v12;
      -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v14);
    }
  }
}

- (void)_broadcastAccountInfoChanged
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10069DDBC((uint64_t)self, v3);
  }

  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_broadcastAccountInfoChangedTask, "cancelPendingExecutions");
  id v4 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v4, "setShouldBoost:", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushTopic]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 broadcasterForTopic:v7 ignoreServiceListener:1 messageContext:v4]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountSetupInfo](self, "accountSetupInfo"));
  [v8 account:v9 accountInfoChanged:v10];

  *((_BYTE *)self + 81) &= ~4u;
}

- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4
{
}

- (void)_writeAccountDefaults:(id)a3 force:(BOOL)a4 interestedSubservices:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((*((_BYTE *)self + 80) & 2) != 0 && !v6 || (*((_BYTE *)self + 81) & 8) != 0)
  {
    unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountUpdate](&OBJC_CLASS___IMRGLog, "accountUpdate"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = (*((unsigned __int8 *)self + 80) >> 1) & 1;
      int v35 = (*((unsigned __int8 *)self + 81) >> 3) & 1;
      *(_DWORD *)buf = 136315650;
      unsigned int v71 = (IDSDAccount *)"-[IDSDAccount _writeAccountDefaults:force:interestedSubservices:]";
      __int16 v72 = 1024;
      *(_DWORD *)__int128 v73 = v34;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s returning because duringInit %d isBeingRemoved %d",  buf,  0x18u);
    }
  }

  else
  {
    __int128 v10 = objc_autoreleasePoolPush();
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
    id v12 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v12)
    {
      id v13 = v12;
      BOOL v55 = v6;
      id v56 = v9;
      uint64_t v14 = *(void *)v66;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v66 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v16]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountInfo, "objectForKey:", v16));
          if (([v17 isNull] & 1) != 0
            || !v18
            || (uint64_t v20 = objc_opt_class(v18, v19), (objc_opt_isKindOfClass(v17, v20) & 1) == 0))
          {
LABEL_37:

            context = objc_autoreleasePoolPush();
            if (-[IDSDAccount accountType](self, "accountType") != 2)
            {
              uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                unsigned int v71 = self;
                __int16 v72 = 2112;
                *(void *)__int128 v73 = v8;
                *(_WORD *)&v73[8] = 2112;
                unsigned int v74 = @"YES";
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@ - write account defaults: %@  (has changes: %@)",  buf,  0x20u);
              }
            }

            -[IDSDAccount _notifyListenersWithChanges:](self, "_notifyListenersWithChanges:", v8);
            id v37 = [v8 mutableCopy];
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
            id v39 = [v38 countByEnumeratingWithState:&v61 objects:v69 count:16];
            if (v39)
            {
              id v40 = v39;
              uint64_t v41 = *(void *)v62;
              do
              {
                for (j = 0LL; j != v40; j = (char *)j + 1)
                {
                  if (*(void *)v62 != v41) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
                  id v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v43]);
                  if (([v44 isNull] & 1) != 0
                    || (uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSString, v45), (objc_opt_isKindOfClass(v44, v46) & 1) != 0)
                    && ![v44 length])
                  {
                    [v37 removeObjectForKey:v43];
                    -[NSMutableDictionary removeObjectForKey:](self->_accountInfo, "removeObjectForKey:", v43);
                  }
                }

                id v40 = [v38 countByEnumeratingWithState:&v61 objects:v69 count:16];
              }

              while (v40);
            }

            id v9 = v56;
            if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
            {
              unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 identifier]);

              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryServiceName](self, "primaryServiceName"));
              id v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 pushTopic]);

              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
              id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 uniqueID]);

              if (v48) {
                [v37 setObject:v48 forKey:kIDSServiceDefaultsServiceNameKey];
              }
              if (v49) {
                [v37 setObject:v49 forKey:kIDSServiceDefaultsPrimaryServiceNameKey];
              }
              if (v51) {
                [v37 setObject:v51 forKey:kIDSServiceDefaultsPushTopicKey];
              }
              if (v53) {
                [v37 setObject:v53 forKey:kIDSServiceDefaultsPrimaryAccountKey];
              }
            }

            -[NSMutableDictionary addEntriesFromDictionary:](self->_accountInfo, "addEntriesFromDictionary:", v37);
            if ((*((_BYTE *)self + 81) & 4) == 0)
            {
              *((_BYTE *)self + 81) |= 4u;
              -[CUTDeferredTaskQueue cancelPendingExecutions]( self->_broadcastAccountInfoChangedTask,  "cancelPendingExecutions");
              -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_broadcastAccountInfoChangedTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  2.0);
            }

            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472LL;
            v57[2] = sub_100169B04;
            v57[3] = &unk_1008FA0A0;
            id v58 = v56;
            id v59 = v8;
            BOOL v60 = v55;
            -[IDSDAccount forEachAdhocAccount:](self, "forEachAdhocAccount:", v57);

            objc_autoreleasePoolPop(context);
            __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance"));
            [v11 delayedSaveSettings];
            goto LABEL_65;
          }

          uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v21);
          if ((objc_opt_isKindOfClass(v17, v22) & 1) != 0)
          {
          }

          else
          {
            uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary, v23);
            if ((objc_opt_isKindOfClass(v17, v24) & 1) != 0)
            {
            }

            else
            {
              uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSSet, v25);
              if ((objc_opt_isKindOfClass(v17, v26) & 1) != 0)
              {
              }

              else
              {
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSValue, v27);
                if ((objc_opt_isKindOfClass(v17, v28) & 1) != 0)
                {
                }

                else
                {
                  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v29);
                  if ((objc_opt_isKindOfClass(v17, v30) & 1) != 0)
                  {
                  }

                  else
                  {
                    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v31);
                    if ((objc_opt_isKindOfClass(v17, v32) & 1) != 0)
                    {
                    }

                    else if (![v17 isEqual:v18])
                    {
                      goto LABEL_37;
                    }
                  }
                }
              }
            }
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v13) {
          continue;
        }
        break;
      }

      id v9 = v56;
    }

- (void)writeAccountDefaults:(id)a3
{
}

- (void)_updateAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v41 = self;
    __int16 v42 = 2112;
    id v43 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ - update account with defaults: %@",  buf,  0x16u);
  }

  BOOL v6 = self;
  if (-[IDSDAccount accountType](v6, "accountType") != 2 && -[IDSDAccount isAdHocAccount](v6, "isAdHocAccount"))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](v6, "primaryAccount"));

    BOOL v6 = (IDSDAccount *)v7;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsAliasesKey]);
  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      __int128 v11 = objc_alloc(&OBJC_CLASS___NSSet);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](v6, "registration"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 candidateEmails]);
      uint64_t v14 = -[NSSet initWithArray:](v11, "initWithArray:", v13);

      id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v32 = (IDSDAccount *)v14;
      uint64_t v31 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v14);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v16 = v9;
      id v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v36;
        uint64_t v20 = kIDSServiceDefaultsAliasKey;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) objectForKey:v20]);
            -[NSMutableSet addObject:](v15, "addObject:", v22);
          }

          id v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }

        while (v18);
      }

      -[NSMutableSet minusSet:](v31, "minusSet:", v15);
      -[NSMutableSet minusSet:](v15, "minusSet:", v32);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountUpdate](&OBJC_CLASS___IMRGLog, "accountUpdate"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v32;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Current   aliases: %@", buf, 0xCu);
      }

      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountUpdate](&OBJC_CLASS___IMRGLog, "accountUpdate"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (IDSDAccount *)v31;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Aliases to remove: %@", buf, 0xCu);
      }

      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountUpdate](&OBJC_CLASS___IMRGLog, "accountUpdate"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (IDSDAccount *)v15;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Aliases to    add: %@", buf, 0xCu);
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v31, "allObjects"));
      -[IDSDAccount _removeAliases:withReason:](v6, "_removeAliases:withReason:", v26, 6LL);

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v31, "allObjects"));
      -[IDSDAccount removeAliases:](v6, "removeAliases:", v27);

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v15, "allObjects"));
      -[IDSDAccount addAliases:](v6, "addAliases:", v28);
    }
  }

  -[IDSDAccount _writeAccountDefaults:force:](v6, "_writeAccountDefaults:force:", v4, 0LL);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](v6, "linkedAccounts"));
  if ([v29 count])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10016A044;
    v33[3] = &unk_1008F9CE0;
    int v34 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v4);
    uint64_t v30 = v34;
    objc_msgSend(v29, "__imForEach:", v33);
  }
}

- (id)accountAndAdHocAccounts
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v3, "addObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount adHocAccounts](self, "adHocAccounts"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  return v3;
}

- (BOOL)forEachAdhocAccount:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 adHocServicesForIdentifier:v7]);

  id v9 = v8;
  id v10 = [v8 count];
  if (v10)
  {
    id v48 = v10;
    uint64_t v49 = v8;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v64;
      p_cache = &OBJC_CLASS___IDSActivityPushListener.cache;
      id v56 = v4;
      __int16 v57 = self;
      uint64_t v50 = *(void *)v64;
      do
      {
        id v15 = 0LL;
        id v51 = v12;
        do
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v15);
          if (-[IDSDAccount accountType](self, "accountType", v48, v49) != 1
            && -[IDSDAccount accountType](self, "accountType")
            || [v16 adHocServiceType] != 2
            || (id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pushTopic]),
                unsigned int v18 = [v17 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"],  v17,  v18)
            && (uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 258 sharedInstance]),
                unsigned int v20 = [v19 isLocalSetupEnabled],
                v19,
                v20))
          {
            if ([v16 disabledOnTinkerWatch]
              && (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance")),
                  unsigned int v22 = [v21 isCurrentDeviceTinkerConfiguredWatch],
                  v21,
                  v22))
            {
              uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v69 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Not reporting tinker disabled service {service: %@}",  buf,  0xCu);
              }
            }

            else if (![v16 enabledOnlyWhenPaired] {
                   || (uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 258 sharedInstance]),
            }
                       unsigned int v25 = [v24 isTraditionalLocalSetupEnabled],
                       v24,
                       v25))
            {
              id v54 = v15;
              context = objc_autoreleasePoolPush();
              __int128 v59 = 0u;
              __int128 v60 = 0u;
              __int128 v61 = 0u;
              __int128 v62 = 0u;
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 258 sharedInstance]);
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountsOnService:v16]);

              id v58 = v27;
              id v28 = [v27 countByEnumeratingWithState:&v59 objects:v67 count:16];
              if (v28)
              {
                id v29 = v28;
                uint64_t v30 = *(void *)v60;
                do
                {
                  uint64_t v31 = 0LL;
                  do
                  {
                    if (*(void *)v60 != v30) {
                      objc_enumerationMutation(v58);
                    }
                    uint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v31);
                    switch(-[IDSDAccount accountType](self, "accountType"))
                    {
                      case 0:
                        if (![v32 accountType])
                        {
                          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
                          int v34 = (void *)objc_claimAutoreleasedReturnValue([v32 userUniqueIdentifier]);
                          unsigned __int8 v35 = [v33 isEqualToString:v34];

                          self = v57;
                          if ((v35 & 1) != 0) {
                            goto LABEL_36;
                          }
                        }

                        break;
                      case 1:
                        if ([v32 accountType] == 1)
                        {
                          id v39 = (void *)objc_claimAutoreleasedReturnValue([v32 loginID]);
                          id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lowercaseString]);
                          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
                          __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 lowercaseString]);
                          if ((IMAreObjectsLogicallySame(v40, v42) & 1) != 0)
                          {

                            goto LABEL_36;
                          }

                          id v43 = (void *)objc_claimAutoreleasedReturnValue([v32 loginID]);
                          if ([v43 length])
                          {

                            id v4 = v56;
                          }

                          else
                          {
                            id v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
                            id v55 = [v44 length];

                            self = v57;
                            id v4 = v56;
                            if (!v55) {
                              goto LABEL_36;
                            }
                          }
                        }

                        break;
                      case 2:
                        break;
                      case 3:
                        if ([v32 accountType] == 3)
                        {
                          __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
                          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v32 userUniqueIdentifier]);
                          unsigned __int8 v38 = [v36 isEqualToString:v37];

                          if ((v38 & 1) != 0) {
LABEL_36:
                          }
                            v4[2](v4, v32);
                        }

                        break;
                      default:
                        break;
                    }

                    uint64_t v31 = (char *)v31 + 1;
                  }

                  while (v29 != v31);
                  id v45 = [v58 countByEnumeratingWithState:&v59 objects:v67 count:16];
                  id v29 = v45;
                }

                while (v45);
              }

              objc_autoreleasePoolPop(context);
              uint64_t v13 = v50;
              id v12 = v51;
              p_cache = (void **)(&OBJC_CLASS___IDSActivityPushListener + 16);
              id v15 = v54;
            }
          }

          id v15 = (char *)v15 + 1;
        }

        while (v15 != v12);
        id v12 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      }

      while (v12);
    }

    id v10 = v48;
    id v9 = v49;
  }

  BOOL v46 = v10 != 0LL;

  return v46;
}

- (id)adHocAccounts
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10016A808;
  v7[3] = &unk_1008FA0C8;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v3 = v8;
  if (-[IDSDAccount forEachAdhocAccount:](self, "forEachAdhocAccount:", v7)) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSArray)linkedAccounts
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  uint64_t v41 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 linkedServicesForService:v4]);

  if ([v5 count])
  {
    id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v32 = v5;
    id obj = v5;
    id v35 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v47;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v6;
          uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8 * v6);
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance",  v32));
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountsOnService:v7]);

          id v10 = [v9 countByEnumeratingWithState:&v42 objects:v50 count:16];
          id v11 = v41;
          if (v10)
          {
            id v12 = v10;
            uint64_t v13 = *(void *)v43;
            uint64_t v38 = *(void *)v43;
            id v39 = v9;
            do
            {
              for (i = 0LL; i != v12; i = (char *)i + 1)
              {
                if (*(void *)v43 != v13) {
                  objc_enumerationMutation(v9);
                }
                id v15 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
                switch(-[IDSDAccount accountType](v11, "accountType"))
                {
                  case 0:
                    if (![v15 accountType])
                    {
                      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userUniqueIdentifier]);
                      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](v11, "userUniqueIdentifier"));
                      unsigned int v18 = [v16 isEqualToString:v17];

                      id v11 = v41;
                      if (v18) {
                        goto LABEL_33;
                      }
                    }

                    break;
                  case 1:
                    unsigned int v22 = [v15 accountType];
                    BOOL v23 = v22 == 1;
                    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v15 loginID]);
                    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lowercaseString]);
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](v11, "loginID"));
                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lowercaseString]);
                    if ((IMAreObjectsLogicallySame(v25, v27) & 1) == 0)
                    {
                      id v28 = (void *)objc_claimAutoreleasedReturnValue([v15 loginID]);
                      if ([v28 length])
                      {
                        BOOL v23 = 0;
                      }

                      else
                      {
                        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](v41, "loginID"));
                        id v29 = [v37 length];
                        BOOL v23 = v22 == 1 && v29 == 0LL;
                      }

                      id v11 = v41;
                    }

                    uint64_t v13 = v38;
                    id v9 = v39;
                    if (v23) {
                      goto LABEL_33;
                    }
                    break;
                  case 2:
                    break;
                  case 3:
                    if ([v15 accountType] == 3)
                    {
                      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 userUniqueIdentifier]);
                      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](v11, "userUniqueIdentifier"));
                      unsigned __int8 v21 = [v19 isEqualToString:v20];

                      id v11 = v41;
                      if ((v21 & 1) != 0) {
LABEL_33:
                      }
                        -[NSMutableArray addObject:](v40, "addObject:", v15);
                    }

                    break;
                  default:
                    continue;
                }
              }

              id v12 = [v9 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }

            while (v12);
          }

          uint64_t v6 = v36 + 1;
        }

        while ((id)(v36 + 1) != v35);
        id v35 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }

      while (v35);
    }

    uint64_t v5 = v32;
  }

  else
  {
    id v40 = 0LL;
  }

  return (NSArray *)v40;
}

- (NSString)description
{
  context = objc_autoreleasePoolPush();
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  uint64_t v6 = _StringForIDSAccountType(-[IDSDAccount accountType](self, "accountType"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  if (-[IDSDAccount isRegistered](self, "isRegistered")) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  id v10 = sub_10012EB10(-[IDSDAccount registrationError](self, "registrationError"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](self, "linkedAccounts"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByApplyingSelector:"uniqueID"]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSDAccount: %p [Service: %@ Login: %@ UniqueID: %@ Account Type: %@ Registration: %@  Registered: %@  Registration Error: %@  Linked Accounts: %@]",  self,  v3,  v4,  v5,  v7,  v8,  v9,  v11,  v13));

  objc_autoreleasePoolPop(context);
  return (NSString *)v14;
}

- (NSString)debugDescription
{
  uint64_t v27 = objc_autoreleasePoolPush();
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  uint64_t v3 = _StringForIDSAccountType(-[IDSDAccount accountType](self, "accountType"));
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForArray:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForArray:options:",  v26,  0LL));
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForArray:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForArray:options:",  v25,  0LL));
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v22 debugDescription]);
  unsigned int v5 = -[IDSDAccount isRegistered](self, "isRegistered");
  uint64_t v6 = @"NO";
  if (v5) {
    uint64_t v6 = @"YES";
  }
  uint64_t v19 = v6;
  uint64_t v7 = sub_10012EB10(-[IDSDAccount registrationError](self, "registrationError"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = sub_10012EB10(-[IDSDAccount lastRegistrationFailureError](self, "lastRegistrationFailureError"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount lastRegistrationFailureDate](self, "lastRegistrationFailureDate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount lastRegistrationSuccessDate](self, "lastRegistrationSuccessDate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](self, "linkedAccounts"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 arrayByApplyingSelector:"uniqueID"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForArray:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForArray:options:",  v12,  0LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSDAccount: %p [Service: %@ Login: %@ UniqueID: %@ Account Type: %@ Vetted Aliases: %@ Aliases: %@ Registration: %@  Registered: %@  Registration Error: %@  Last Registration Failure Error: %@  Last Registration Failure Date: %@  Last Registration Success Date: %@  User Unique ID: %@ Linked Accounts: %@]",  self,  v24,  v23,  v29,  v21,  v28,  v20,  v4,  v19,  v18,  v17,  v16,  v9,  v10,  v13));

  objc_autoreleasePoolPop(v27);
  return (NSString *)v14;
}

- (id)smallDescription
{
  uint64_t v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
  uint64_t v7 = _StringForIDSAccountType(-[IDSDAccount accountType](self, "accountType"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  unsigned int v10 = -[IDSDAccount isRegistered](self, "isRegistered");
  id v11 = @"NO";
  if (v10) {
    id v11 = @"YES";
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%@:%@:%@:%@>",  v5,  v6,  v8,  v9,  v11));

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (NSDictionary)accountSetupInfo
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  if ([v4 count]) {
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, kIDSServiceDefaultsUniqueIDKey);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, kIDSServiceDefaultsServiceNameKey);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount prefixedURIStringsFromRegistration](self, "prefixedURIStringsFromRegistration"));
  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, kIDSServiceDefaultsRegisteredURIs);
  }

  return (NSDictionary *)v3;
}

- (void)_notifyClientDelegatesWithBlock:(id)a3
{
  id v11 = (void (**)(id, void *))a3;
  if (v11)
  {
    id v4 = objc_autoreleasePoolPush();
    unsigned int v5 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pushTopic]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForTopic:v8 ignoreServiceListener:1 messageContext:v5]);

    unsigned int v10 = objc_autoreleasePoolPush();
    v11[2](v11, v9);
    objc_autoreleasePoolPop(v10);

    objc_autoreleasePoolPop(v4);
  }
}

- (void)_notifyDelegatesAddedLocalDevice:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10016B374;
  v5[3] = &unk_1008FBE88;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  -[IDSDAccount _notifyClientDelegatesWithBlock:](self, "_notifyClientDelegatesWithBlock:", v5);
}

- (void)didAddPairedDevice:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyPairingType]);
  id v5 = [v4 integerValue];

  if (!v5) {
    -[IDSDAccount _notifyDelegatesAddedLocalDevice:](self, "_notifyDelegatesAddedLocalDevice:", v6);
  }
}

- (void)didRemovePairedDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDevicePropertyPairingType]);
  id v6 = [v5 integerValue];

  if (!v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10016B6B8;
    v7[3] = &unk_1008FBE88;
    void v7[4] = self;
    id v8 = v4;
    -[IDSDAccount _notifyClientDelegatesWithBlock:](self, "_notifyClientDelegatesWithBlock:", v7);
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:IDSDevicePropertyPairingType]);
  id v5 = [v4 integerValue];

  if (!v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10016B920;
    v6[3] = &unk_1008F9CE0;
    v6[4] = self;
    -[IDSDAccount _notifyClientDelegatesWithBlock:](self, "_notifyClientDelegatesWithBlock:", v6);
  }

- (void)didUpdateProtocolForPairedDevice:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:IDSDevicePropertyPairingType]);
  id v5 = [v4 integerValue];

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pushTopic]);
    if ([v7 isEqualToIgnoringCase:@"com.apple.private.alloy.bluetoothregistry"])
    {
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pushTopic]);
      unsigned int v10 = [v9 isEqualToIgnoringCase:@"com.apple.private.alloy.bluetoothregistryclassc"];

      if (!v10) {
        return;
      }
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10016BC18;
    v11[3] = &unk_1008F9CE0;
    v11[4] = self;
    -[IDSDAccount _notifyClientDelegatesWithBlock:](self, "_notifyClientDelegatesWithBlock:", v11);
  }

- (IDSRegistration)registration
{
  return self->_registrationInfo;
}

- (NSDictionary)accountInfo
{
  return &self->_accountInfo->super;
}

- (BOOL)wasDisabledAutomatically
{
  return *((_BYTE *)self + 80) & 1;
}

- (void)setWasDisabledAutomatically:(BOOL)a3
{
  *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xFE | a3;
}

- (BOOL)pendingDependentCheck
{
  return (*((unsigned __int8 *)self + 80) >> 5) & 1;
}

- (void)setPendingDependentCheck:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xDF | v3;
}

- (BOOL)issuingDependentCheck
{
  return (*((unsigned __int8 *)self + 80) >> 3) & 1;
}

- (BOOL)isBeingRemoved
{
  return (*((unsigned __int8 *)self + 81) >> 3) & 1;
}

- (void)setIsBeingRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((_BYTE *)self + 81) = *((_BYTE *)self + 81) & 0xF7 | v3;
}

- (CUTDeferredTaskQueue)broadcastAccountInfoChangedTask
{
  return self->_broadcastAccountInfoChangedTask;
}

- (void).cxx_destruct
{
}

- (id)registrationCenter
{
  return +[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance");
}

- (id)appleIDNotificationCenter
{
  return +[IDSAppleIDNotificationCenter sharedInstance](&OBJC_CLASS___IDSAppleIDNotificationCenter, "sharedInstance");
}

- (id)accountController
{
  return +[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance");
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (id)systemMonitor
{
  return +[IDSDependencyProvider systemMonitorAdapter](&OBJC_CLASS___IDSDependencyProvider, "systemMonitorAdapter");
}

- (id)senderKeyDistributionManager
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 senderKeyDistributionManager]);

  return v3;
}

- (id)userDefaults
{
  return +[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults");
}

- (BOOL)_isBuddyBlockingRegistration
{
  return +[IDSRegistrationController isBuddyBlockingRegistration]( &OBJC_CLASS___IDSRegistrationController,  "isBuddyBlockingRegistration");
}

- (int)_currentForcedGDRCount
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"performedGDROverrides"]);
  int v4 = [v3 intValue];

  return v4;
}

- (void)_incrementForcedGDRCount
{
  uint64_t v3 = -[IDSDAccount _currentForcedGDRCount](self, "_currentForcedGDRCount") + 1;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  [v5 setAppValue:v4 forKey:@"performedGDROverrides"];
}

- (void)_clearForcedGDRCount
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
  [v2 removeAppValueForKey:@"performedGDROverrides"];
}

- (void)_clearForcedGDRDate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
  [v2 removeAppValueForKey:@"last24PeriodGDRPerformed"];
}

- (id)_performedForcedGDRDatePeriod
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"last24PeriodGDRPerformed"]);
  [v3 doubleValue];
  double v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 earlierDate:v7]);

  if (v8 == v7) {
    id v9 = v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (void)_updatePerformedForcedGDRDate
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:-86400.0]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _performedForcedGDRDatePeriod](self, "_performedForcedGDRDatePeriod"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 earlierDate:v3]);

  if (v5 == v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userDefaults](self, "userDefaults"));
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v6 setAppValue:v7 forKey:@"last24PeriodGDRPerformed"];
  }
}

- (BOOL)_hasBudgetForForcedGDR
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"md-ids-gdr-day-limit"]);

  uint64_t v6 = IMGetAppIntForKey(@"forcedgdrcount");
  if ((int)v6 >= 1)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1006A0CEC(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v6 = v6;
    goto LABEL_5;
  }

  if (v4)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0)
    {
      id v15 = v4;
      id v16 = [v15 intValue];
      uint64_t v17 = OSLogHandleForIDSCategory("ForcedGDR");
      unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v30 = (int)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with %d max forced GDRs",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"ForcedGDR"))
      {
        uint64_t v28 = (uint64_t)v16;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"ForcedGDR",  @"Server Bag provided us with %d max forced GDRs");
      }

      uint64_t v6 = (int)v16;
LABEL_5:

      if (!v6) {
        return v6;
      }
      goto LABEL_21;
    }
  }

  uint64_t v20 = OSLogHandleForIDSCategory("ForcedGDR");
  unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = 1;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Server Bag has no value for max GDR per day, using the default: %d",  buf,  8u);
  }

  if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"ForcedGDR"))
  {
    uint64_t v28 = 1LL;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"ForcedGDR",  @"Server Bag has no value for max GDR per day, using the default: %d");
  }

  uint64_t v6 = 1LL;
LABEL_21:
  if (v6 <= -[IDSDAccount _currentForcedGDRCount](self, "_currentForcedGDRCount", v28))
  {
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _performedForcedGDRDatePeriod](self, "_performedForcedGDRDatePeriod"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 dateByAddingTimeInterval:-86400.0]);

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v23 earlierDate:v24]);
    LODWORD(v6) = v25 == v23;

    if ((_DWORD)v6)
    {
      -[IDSDAccount _clearForcedGDRCount](self, "_clearForcedGDRCount");
      -[IDSDAccount _clearForcedGDRDate](self, "_clearForcedGDRDate");
      id v26 = -[IDSDAccount _performedForcedGDRDatePeriod](self, "_performedForcedGDRDatePeriod");
    }
  }

  else
  {
    -[IDSDAccount _incrementForcedGDRCount](self, "_incrementForcedGDRCount");
    -[IDSDAccount _updatePerformedForcedGDRDate](self, "_updatePerformedForcedGDRDate");
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)_updatePhoneNumberCallerID
{
  registrationInfo = self->_registrationInfo;
  if (registrationInfo && !-[IDSRegistration registrationType](registrationInfo, "registrationType"))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration phoneNumber](self->_registrationInfo, "phoneNumber"));
    if ([v4 length])
    {
      uint64_t v8 = IMSingleObjectArray(v4, v5, v6, v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[IDSDAccount _updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:]( self,  "_updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:",  v9,  0LL,  1LL);

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  kIDSServiceDefaultsLoginAsKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v10);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  kIDSServiceDefaultsDisplayNameKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v11);

      if ((*((_BYTE *)self + 80) & 2) == 0) {
        -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
      }
    }

    else
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  &stru_100912B50,  kIDSServiceDefaultsLoginAsKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v12);

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  &stru_100912B50,  kIDSServiceDefaultsDisplayNameKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v13);

      if (-[IDSDAccount isRegistered](self, "isRegistered"))
      {
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_1006A0E34();
        }
      }
    }

    if ([v4 length]
      && (id)-[IDSDAccount _validationStatusForAlias:](self, "_validationStatusForAlias:", v4) != (id)3)
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1006A0E08();
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v17,  kIDSServiceDefaultsAliasesKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v18);

      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1006A0DA8();
      }

      uint64_t v23 = IMSingleObjectArray(v4, v20, v21, v22);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[IDSDAccount _addAliases:](self, "_addAliases:", v24);

      unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_1006A0D7C();
      }

      -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  3LL,  0xFFFFFFFFLL,  v4,  0LL,  1LL,  0LL);
    }

    else
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1006A0D50();
      }
    }
  }

- (void)_updateCallerIDToTemporaryPhone
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties identifier](self->_service, "identifier"));
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.madrid"];

  if ((v4 & 1) != 0)
  {
    uint64_t v5 = @"iMessage";
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties identifier](self->_service, "identifier"));
    unsigned int v7 = [v6 isEqualToString:@"com.apple.ess"];

    if (!v7) {
      return;
    }
    uint64_t v5 = @"FaceTime";
  }

  uint64_t v8 = IMPreferredAccountMap();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"guid"]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 appleIDAccountOnService:self->_service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);

  if (!v11 || ([v11 isEqualToString:v14] & 1) == 0)
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v18 = 138412802;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating preferred account to Home Number {service: %@, oldID: %@, newID: %@}",  (uint8_t *)&v18,  0x20u);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    IMUpdatePreferredAccountForService(v5, v17);
  }
}

- (int)_neededRegistrationType
{
  if (-[IDSDAccount accountType](self, "accountType"))
  {
    if (-[IDSDAccount accountType](self, "accountType") == 3) {
      return 3;
    }
    else {
      return 1;
    }
  }

  else if (-[IDSDAccount isTemporary](self, "isTemporary"))
  {
    return 2;
  }

  else
  {
    return 0;
  }

- (BOOL)_rebuildRegistrationInfo:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1006A0EE4(self);
      }
      goto LABEL_7;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
    if ([v8 requiresKeychainMigration])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
      unsigned int v10 = [v9 isUnderFirstDataProtectionLock];

      if (v10)
      {
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Under first lock and keychain upgrade pending, not loading registration for this account",  buf,  2u);
        }

        BOOL v6 = 1;
        goto LABEL_8;
      }
    }

    else
    {
    }

    if (!self->_registrationInfo)
    {
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1006A0F68();
      }
      goto LABEL_34;
    }

    unsigned int v11 = -[IDSDAccount _neededRegistrationType](self, "_neededRegistrationType");
    if (v11 == -[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
    {
      if (!self->_registrationInfo) {
        return 0;
      }
      if (+[IDSRegistrationController systemSupportsRegistrationInfo:]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsRegistrationInfo:"))
      {
        if (self->_registrationInfo)
        {
          if (-[IDSDAccount _neededRegistrationType](self, "_neededRegistrationType") == 1)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self->_registrationInfo, "email"));
            unsigned __int8 v14 = [v12 isEqualToIgnoringCase:v13];

            if ((v14 & 1) == 0)
            {
              __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_34;
              }
              id v215 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
              v216 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self->_registrationInfo, "email"));
              *(_DWORD *)buf = 138412546;
              *(void *)v239 = v215;
              *(_WORD *)&v239[8] = 2112;
              v240 = v216;
              v217 = "Emails are different, we need to rebuild  (%@ vs %@)";
              goto LABEL_223;
            }
          }

          if (!self->_registrationInfo) {
            return 0;
          }
          uint64_t v15 = objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));
          if (!v15) {
            return 0;
          }
          id v16 = (void *)v15;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
          int v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));
          unsigned __int8 v19 = [v17 isEqual:v18];

          if ((v19 & 1) != 0) {
            return 0;
          }
          __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v215 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));
            v216 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
            *(_DWORD *)buf = 138412546;
            *(void *)v239 = v215;
            *(_WORD *)&v239[8] = 2112;
            v240 = v216;
            v217 = "Push tokens are different, we need to rebuild  (%@ vs %@)";
LABEL_223:
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v217, buf, 0x16u);
          }

- (void)refreshAdHocServiceNames
{
  uint64_t v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
  unsigned int v4 = [v3 isLocalSetupEnabled];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
  unsigned int v6 = [v5 isTraditionalLocalSetupEnabled];

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 adHocServicesForIdentifier:v9]);

  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v36;
    *(void *)&__int128 v12 = 138412290LL;
    __int128 v33 = v12;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v15);
        unsigned int v17 = objc_msgSend(v16, "adHocServiceType", v33);
        if (v17) {
          BOOL v18 = v17 == 5;
        }
        else {
          BOOL v18 = 1;
        }
        if (v18) {
          goto LABEL_11;
        }
        unsigned int v19 = v17;
        unsigned int v20 = v17 == 2 ? v4 : 1;
        if (v20 != 1) {
          goto LABEL_11;
        }
        if (-[IDSDAccount accountType](self, "accountType") == 1)
        {
          if (v19 == 2) {
            goto LABEL_25;
          }
        }

        else
        {
          unsigned int v21 = -[IDSDAccount accountType](self, "accountType");
          if (v19 == 2 && v21 == 0)
          {
LABEL_25:
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v16 pushTopic]);
            unsigned int v24 = [v23 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

            if (!v24) {
              goto LABEL_11;
            }
          }
        }

        if ([v16 disabledOnTinkerWatch]
          && (uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance")),
              unsigned int v26 = [v25 isCurrentDeviceTinkerConfiguredWatch],
              v25,
              v26))
        {
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v33;
            id v40 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Ignoring tinker disabled service {service: %@}",  buf,  0xCu);
          }
        }

        else
        {
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 identifier]);
          -[NSMutableArray addObject:](v34, "addObject:", v27);
        }

LABEL_11:
        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v28 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
      id v13 = v28;
    }

    while (v28);
  }

  if (-[NSMutableArray count](v34, "count")) {
    -[IDSRegistration setAdHocServiceNames:](self->_registrationInfo, "setAdHocServiceNames:", v34);
  }
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = IMLoggingStringForArray(v34);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    registrationInfo = self->_registrationInfo;
    *(_DWORD *)buf = 138412546;
    id v40 = v31;
    __int16 v41 = 2112;
    __int128 v42 = registrationInfo;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Adding ad hoc service names %@ to %@",  buf,  0x16u);
  }
}

- (BOOL)isDeviceRegistered
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  if ([v3 registrationStatus] == (id)8)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationCert]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isDeviceAuthenticated
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  BOOL v3 = (uint64_t)[v2 registrationStatus] > 5;

  return v3;
}

- (BOOL)isRegistrationActive
{
  return (*((unsigned __int8 *)self + 81) >> 1) & 1;
}

- (void)_registrationAbilityChanged:(id)a3
{
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device Controller says I should maybe try to re-register now: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[IDSDAccount _rebuildRegistrationInfo:](self, "_rebuildRegistrationInfo:", 1LL);
  if (!-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered"))
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "This indeed necessitated a re-register, kicking it off: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[IDSDAccount _registerAccount](self, "_registerAccount");
  }

- (void)_registerForDeviceCenterNotifications
{
  id v3 = +[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_registrationAbilityChanged:" name:FaceTimeDeviceRegistrationStateChangedNotification object:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_identityRebuilt:" name:@"__kIDSRegistrationKeyManagerPrivateIdentityRebuiltNotification" object:0];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_identityGenerated:" name:@"__kIDSRegistrationKeyManagerPrivateIdentityGeneratedNotification" object:0];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"_keychainMigrationComplete:" name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"_needsEncryptionIdentityRoll:" name:@"__kIDSRegistrationKeyManagerEncryptionIdentityNeedsRollNotification" object:0];
}

- (void)_deregisterDeviceCenterNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:FaceTimeDeviceRegistrationStateChangedNotification object:0];

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:@"__kIDSRegistrationKeyManagerPrivateIdentityRebuiltNotification" object:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:@"__kIDSRegistrationKeyManagerPrivateIdentityGeneratedNotification" object:0];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:@"__kIDSRegistrationKeyManagerKeychainMigrationComplete" object:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self name:@"__kIDSRegistrationKeyManagerEncryptionIdentityNeedsRollNotification" object:0];
}

- (void)_identityRebuilt:(id)a3
{
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1006A0F94();
  }

  -[IDSDAccount reregister](self, "reregister");
}

- (void)_identityGenerated:(id)a3
{
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    BOOL v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "***** Notified that a new identity was generated -- re-registering { account: %@ }",  (uint8_t *)&v5,  0xCu);
  }

  -[IDSDAccount reregister](self, "reregister");
}

- (void)_needsEncryptionIdentityRoll:(id)a3
{
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1006A0FF8();
  }

  -[IDSDAccount reregister](self, "reregister");
}

- (void)_keychainMigrationComplete:(id)a3
{
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "***** Keychain migration completed",  (uint8_t *)&v16,  2u);
  }

  if (-[IDSDAccount isEnabled](self, "isEnabled"))
  {
    -[IDSDAccount _rebuildRegistrationInfo:](self, "_rebuildRegistrationInfo:", 1LL);
    *((_BYTE *)self + 81) |= 2u;
    -[IDSRegistration setIsDisabled:](self->_registrationInfo, "setIsDisabled:", 0LL);
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v5 startTrackingActiveRegistration:self->_registrationInfo];

    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
    if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
      [v6 notePhoneNumberRegistrationReset];
    }

    unsigned __int8 v7 = -[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered");
    if (-[IDSRegistration needsMigration](self->_registrationInfo, "needsMigration"))
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "****** Forcing Registration, needs migration ******",  (uint8_t *)&v16,  2u);
      }

      *((_BYTE *)self + 80) |= 4u;
    }

    else
    {
      if ((v7 & 1) != 0)
      {
        -[IDSDAccount _checkRegistration](self, "_checkRegistration");
LABEL_22:
        -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");
        return;
      }

      registrationInfo = self->_registrationInfo;
      if (registrationInfo)
      {
        if (!-[IDSRegistration canRegister](registrationInfo, "canRegister"))
        {
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = self->_registrationInfo;
            int v16 = 138412290;
            unsigned int v17 = (IDSDAccount *)v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "****** NOT Forcing Registration, we were active, but unregistered, however there's nothing to register: %@ ******",  (uint8_t *)&v16,  0xCu);
          }

          goto LABEL_22;
        }

        registrationInfo = self->_registrationInfo;
      }

      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](registrationInfo, "registrationCert"));
      *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xFB | (4 * (v12 != 0LL));

      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        unsigned int v17 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "****** Forcing Registration, we were active, but unregistered: %@ ******",  (uint8_t *)&v16,  0xCu);
      }
    }

    -[IDSDAccount _registerAccount](self, "_registerAccount");
    goto LABEL_22;
  }

  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
    int v16 = 138412290;
    unsigned int v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Account %@ is disabled, ignoring...",  (uint8_t *)&v16,  0xCu);
  }
}

- (void)_updatePseudonymsFromEmailInfo:(id)a3
{
  id v4 = a3;
  id v51 = self;
  -[IDSDAccount _removeAllPseudonyms](self, "_removeAllPseudonyms");
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v4;
  id v44 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v66 != v43) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        unsigned __int8 v7 = objc_autoreleasePoolPush();
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"uri"]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"pseudonyms"]);
        if (-[IDSDAccount accountType](v51, "accountType") != 1
          || ![v49 _appearsToBePhoneNumber]
          || (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( IDSRegistrationController,  "registeredPhoneNumbers")),  v10 = [v9 containsObject:v49],  v9,  (v10 & 1) == 0))
        {
          __int128 v46 = v7;
          __int128 v47 = i;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v45 = v8;
          id v52 = v8;
          id v50 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
          if (v50)
          {
            uint64_t v48 = *(void *)v62;
            do
            {
              for (j = 0LL; j != v50; j = (char *)j + 1)
              {
                if (*(void *)v62 != v48) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v12 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
                id v13 = objc_autoreleasePoolPush();
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:v12]);
                uint64_t v15 = -[IDSURI initWithPrefixedURI:](objc_alloc(&OBJC_CLASS___IDSURI), "initWithPrefixedURI:", v12);
                int v16 = objc_alloc(&OBJC_CLASS___IDSURI);
                unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v49 _stripFZIDPrefix]);
                id v53 = -[IDSURI initWithUnprefixedURI:](v16, "initWithUnprefixedURI:", v17);

                uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 objectForKey:@"featureId"]);
                id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"scopeId"]);
                unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"expiry-epoch-seconds"]);
                unsigned int v20 = v19;
                context = v13;
                if (v19) {
                  id v21 = v19;
                }
                else {
                  id v21 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"expiry"]);
                }
                unsigned int v22 = v21;
                id v56 = (void *)v18;

                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"allowedServices"]);
                unsigned int v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                __int128 v59 = 0u;
                __int128 v60 = 0u;
                id v25 = v23;
                id v26 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v58;
                  do
                  {
                    for (k = 0LL; k != v27; k = (char *)k + 1)
                    {
                      if (*(void *)v58 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)k);
                      -[NSMutableSet addObject:](v24, "addObject:", v30);
                      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v30]);
                      -[NSMutableSet addObjectsFromArray:](v24, "addObjectsFromArray:", v31);
                    }

                    id v27 = [v25 countByEnumeratingWithState:&v57 objects:v69 count:16];
                  }

                  while (v27);
                }

                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v51, "service"));
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 identifier]);
                unsigned int v34 = -[NSMutableSet containsObject:](v24, "containsObject:", v33);

                __int128 v35 = v56;
                if (v34 && v56 && v22 && -[NSMutableSet count](v24, "count"))
                {
                  id v36 = objc_alloc(&OBJC_CLASS___IDSPseudonymProperties);
                  [v22 doubleValue];
                  double v38 = v37;
                  id v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v24, "allObjects"));
                  id v40 = [v36 initWithFeatureID:v56 scopeID:v55 expiryEpoch:v39 allowedServices:v38];

                  __int16 v41 = -[IDSPseudonym initWithURI:maskedURI:properties:]( objc_alloc(&OBJC_CLASS___IDSPseudonym),  "initWithURI:maskedURI:properties:",  v15,  v53,  v40);
                  -[IDSDAccount _addPseudonym:](v51, "_addPseudonym:", v41);

                  __int128 v35 = v56;
                }

                objc_autoreleasePoolPop(context);
              }

              id v50 = [v52 countByEnumeratingWithState:&v61 objects:v70 count:16];
            }

            while (v50);
          }

          unsigned __int8 v7 = v46;
          i = v47;
          id v8 = v45;
        }

        objc_autoreleasePoolPop(v7);
      }

      id v44 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }

    while (v44);
  }
}

- (void)_updateVettedAliases:(id)a3 emailInfo:(id)a4 addToCurrentHandlesIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1001E039C;
  v49[3] = &unk_1008FDA08;
  v49[4] = self;
  id v12 = v8;
  id v50 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByApplyingBlock:", v49));
  if (v12 && v11 && [v12 isEqualToArray:v11] && !objc_msgSend(v13, "count"))
  {
    __int128 v33 = v12;
  }

  else
  {
    __int16 v41 = v10;
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      *(_DWORD *)buf = 138412802;
      id v57 = v12;
      __int16 v58 = 2112;
      __int128 v59 = v11;
      __int16 v60 = 2112;
      __int128 v61 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating vetted aliases to: %@     current: %@   ID: %@",  buf,  0x20u);
    }

    id v16 = objc_alloc(&OBJC_CLASS___IDSHandleListUpdatedMetric);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 serviceName]);
    id v19 = [v16 initWithService:v18];

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    id v39 = v19;
    [v20 logMetric:v19];

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v40 = v11;
    id v21 = v11;
    id v22 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
          if (([v12 containsObject:v26] & 1) == 0
            && ([v13 containsObject:v26] & 1) == 0)
          {
            -[IDSDAccount markAsUnvettedAlias:](self, "markAsUnvettedAlias:", v26);
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }

      while (v23);
    }

    -[IDSDAccount _removeAliases:withReason:](self, "_removeAliases:withReason:", v13, 2LL);
    __int128 v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v12 count])
    {
      unint64_t v27 = 0LL;
      char v44 = 0;
      uint64_t v43 = kIDSServiceDefaultsAliasIsUserVisibleKey;
      do
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v27]);
        if ((unint64_t)[v9 count] <= v27)
        {
          uint64_t v32 = 0LL;
        }

        else
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v27]);
          uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 objectForKey:@"is-user-visible"]);
          uint64_t v31 = (void *)v30;
          if (v30)
          {
            uint64_t v53 = v43;
            uint64_t v54 = v30;
            char v44 = 1;
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
            if (([v31 BOOLValue] & 1) == 0)
            {
              -[NSMutableArray addObject:](v42, "addObject:", v28);
              char v44 = 1;
            }
          }

          else
          {
            uint64_t v32 = 0LL;
          }
        }

        -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:aliasProperties:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:aliasProperties:",  3LL,  0xFFFFFFFFLL,  v28,  0LL,  v5,  0LL,  v32);

        ++v27;
      }

      while (v27 < (unint64_t)[v12 count]);
    }

    else
    {
      char v44 = 0;
    }

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

    unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "     Added: %@", buf, 0xCu);
    }

    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    id v11 = v40;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v13;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "   Removed: %@", buf, 0xCu);
    }

    if ([v33 count])
    {
      uint64_t v51 = kIDSServiceDefaultsVettedAliasesKey;
      id v52 = v33;
      id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      id v37 = [v36 mutableCopy];

      if ((v44 & 1) != 0) {
        [v37 setObject:v42 forKey:kIDSServiceDefaultsInvisibleAliasesKey];
      }
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v37);
    }

    else
    {
      id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      double v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v37,  kIDSServiceDefaultsVettedAliasesKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v38);
    }

    unsigned __int8 v10 = v41;
  }
}

- (void)_checkRegistration
{
  if (self->_registrationInfo)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
    unsigned int v4 = [v3 requiresKeychainMigration];

    BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
    if (v4)
    {
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1006A105C();
      }
      goto LABEL_59;
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self->_registrationInfo, "serviceType"));
    if (IDSIsFaceTimeRegistrationServiceType(v7) || IDSIsCallingRegistrationServiceType(v7))
    {
      uint64_t v8 = _IDSInvitationProtocolVersionNumber();
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    }

    else
    {
      else {
        uint64_t v19 = _IDSAlloyProtocolVersionNumber();
      }
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v19);
    }

    BOOL v6 = (os_log_s *)v9;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[IDSRegistration applicationVersion](self->_registrationInfo, "applicationVersion"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[IDSRegistration IDSVersion](self->_registrationInfo, "IDSVersion"));
    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration identityVersion](self->_registrationInfo, "identityVersion"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration keyPairSignature](self->_registrationInfo, "keyPairSignature"));
    if (!v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
      unsigned int v14 = [v13 isMigratedKeyPairSignature];

      if (v14)
      {
        registrationInfo = self->_registrationInfo;
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keyPairSignature]);
        -[IDSRegistration setKeyPairSignature:](registrationInfo, "setKeyPairSignature:", v17);

        BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration keyPairSignature](self->_registrationInfo, "keyPairSignature"));
        -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1006A110C();
        }
      }

      else
      {
        id v12 = 0LL;
      }
    }

    if (!(v10 | v11))
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_40:

LABEL_41:
        LOBYTE(v40) = 1;
        goto LABEL_42;
      }

      *(_WORD *)buf = 0;
      id v21 = "Registration protocols are empty, this is probably a new install, we'll force a register";
      goto LABEL_20;
    }

    if (v11)
    {
      uint64_t v24 = _IDSIDProtocolVersionNumber();
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      unsigned __int8 v26 = [(id)v11 isEqualToNumber:v25];

      if ((v26 & 1) != 0)
      {
        uint64_t v27 = _IDSIdentityVersionNumber();
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        unsigned __int8 v29 = [v55 isEqualToNumber:v28];

        if ((v29 & 1) != 0)
        {
          if (v10)
          {
            BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
            if ([(id)v10 isEqualToNumber:v6])
            {
              if (!v12
                || (v30 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( IDSRegistrationKeyManager,  "sharedInstance")),  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 keyPairSignature]),  v52 = objc_msgSend(v12, "isEqualToString:", v31),  v31,  BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr,  v30,  (v52 & 1) == 0))
              {
                __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[440] registration]);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
                  id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 keyPairSignature]);
                  *(_DWORD *)buf = 138412546;
                  uint64_t v57 = (uint64_t)v12;
                  __int16 v58 = 2112;
                  __int128 v59 = v50;
                  _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Registration key pair signatures are different (%@ -> %@), clearing cert - forcing redentification",  buf,  0x16u);

                  BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
                }

                -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
                goto LABEL_41;
              }

              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              unsigned int v53 = [v33 applicationKeyIndex];
              unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              unsigned int v54 = objc_msgSend( v32,  "needsPublicDataUpdatedForKeyIndex:ktRegistrationKeyIndex:",  v53,  objc_msgSend(v34, "ktRegistrationDataIndex"));

              if (v54)
              {
                BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
                unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_40;
                }
                *(_WORD *)buf = 0;
                id v21 = "Message Protection Public Data Needs Update, we'll force a re-register";
                goto LABEL_20;
              }

              if (-[IDSDAccount isRegistered](self, "isRegistered"))
              {
                uint64_t v40 = objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self->_registrationInfo, "registrationCert"));
                if (!v40)
                {
LABEL_75:
                  BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
LABEL_42:
                  if (IMGetCachedDomainBoolForKey( @"com.apple.conference",  @"ForceSMSRegistration"))
                  {
                    __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5[440] warning]);
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
                      sub_1006A10B4();
                    }

                    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
                    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration userUniqueIdentifier]( self->_registrationInfo,  "userUniqueIdentifier"));
                    [v42 setPNRReason:7 forUserUniqueIdentifier:v43];

                    -[IDSRegistration setAuthenticationCert:](self->_registrationInfo, "setAuthenticationCert:", 0LL);
                    if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
                    {
                      char v44 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPACStateTracker sharedInstance]( &OBJC_CLASS___IDSPACStateTracker,  "sharedInstance"));
                      [v44 notePhoneAuthCertLost:2];
                    }

                    if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType")) {
                      -[IDSRegistration setMainID:](self->_registrationInfo, "setMainID:", 0LL);
                    }
                    -[IDSRegistration setUris:](self->_registrationInfo, "setUris:", 0LL);
                    -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
                    -[IDSRegistration setAuthenticationToken:](self->_registrationInfo, "setAuthenticationToken:", 0LL);
                    __int128 v45 = @"ForceSMSRegistration";
                    BOOL v5 = &IMInsertBoolsToXPCDictionary_ptr;
                  }

                  else
                  {
                    if (!IMGetCachedDomainBoolForKey( @"com.apple.conference",  @"ForceRegistration"))
                    {
                      if ((v40 & 1) == 0)
                      {
LABEL_58:

LABEL_59:
                        return;
                      }

- (void)setRegistrationStatus:(int)a3 error:(int64_t)a4 alertInfo:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = sub_10012EAC8(a4);
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, kIDSServiceDefaultsRegistrationInfoStatusKey, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, kIDSServiceDefaultsRegistrationInfoErrorCodeKey, v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, kIDSServiceDefaultsRegistrationInfoInternalErrorCodeKey, v13);
  }

  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v10, kIDSServiceDefaultsRegistrationInfoAlertInfoKey, v8);
  }
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v10,  kIDSServiceDefaultsRegistrationInfoKey));
  -[IDSDAccount _writeAccountDefaults:force:](self, "_writeAccountDefaults:force:", v14, 1LL);

  if ((_DWORD)v6 == 5 || (_DWORD)v6 == -1)
  {
    int64_t v27 = a4;
    id v15 = -[NSMutableArray count](self->_setupHandlers, "count");
    if ((uint64_t)v15 - 1 >= 0)
    {
      uint64_t v16 = (uint64_t)v15;
      do
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_setupHandlers, "objectAtIndex:", --v16));
        id v18 = [v17 copy];

        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = objc_retainBlock(v18);
          *(_DWORD *)buf = 134217984;
          id v29 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Calling account setup handler %p",  buf,  0xCu);
        }

        (*((void (**)(id, IDSDAccount *))v18 + 2))(v18, self);
      }

      while (v16 > 0);
    }

    setupHandlers = self->_setupHandlers;
    self->_setupHandlers = 0LL;

    if ((_DWORD)v6 == -1)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v25,  kIDSServiceDefaultsLastRegistrationFailureDateKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v26);

      uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v27));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v23,  kIDSServiceDefaultsLastRegistrationFailureErrorKey));
    }

    else
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  &__kCFBooleanTrue,  kIDSServiceDefaultsHasEverRegistered));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v22);

      uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v23,  kIDSServiceDefaultsLastRegistrationSuccessDateKey));
    }

    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v24);
  }
}

- (void)_updateRegistrationStatusWithError:(int64_t)a3 info:(id)a4
{
  id v6 = a4;
  if ((id)-[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus") != (id)8) {
    goto LABEL_20;
  }
  unsigned int v7 = -[IDSRegistration registrationType](self->_registrationInfo, "registrationType");
  if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 1)
  {
    if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType")
      && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 2)
    {
      if (v7 != 3) {
        goto LABEL_12;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self->_registrationInfo, "uris"));
      -[IDSDAccount _updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:]( self,  "_updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:",  v8,  0LL,  1LL);
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration phoneNumber](self->_registrationInfo, "phoneNumber"));
      uint64_t v13 = IMSingleObjectArray(v8, v10, v11, v12);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[IDSDAccount _updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:]( self,  "_updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:",  v14,  0LL,  1LL);
    }

    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
  if (![v8 count]
    && !-[IDSDAccount shouldAutoRegisterAllHandles](self, "shouldAutoRegisterAllHandles")
    && !-[IDSDAccount shouldRegisterUsingDSHandle](self, "shouldRegisterUsingDSHandle"))
  {

    goto LABEL_64;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount dsHandle](self, "dsHandle"));
  if (!v9)
  {
    unsigned int v58 = -[IDSDAccount shouldRegisterUsingDSHandle](self, "shouldRegisterUsingDSHandle");

    if (!v58) {
      goto LABEL_12;
    }
LABEL_64:
    __int128 v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v66 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount dsHandle](self, "dsHandle"));
      *(_DWORD *)buf = 138412546;
      __int16 v72 = v66;
      __int16 v73 = 2112;
      unsigned int v74 = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "We were registered but we have no aliases %@ or dsHandle %@",  buf,  0x16u);
    }

    __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationToken](self->_registrationInfo, "authenticationToken"));
    if (v68) {
      uint64_t v69 = 6LL;
    }
    else {
      uint64_t v69 = 0LL;
    }
    -[IDSRegistration setRegistrationStatus:](self->_registrationInfo, "setRegistrationStatus:", v69);
    goto LABEL_12;
  }

LABEL_11:
LABEL_12:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  unsigned __int8 v16 = [v15 requiresKeychainMigration];

  if ((v16 & 1) != 0) {
    goto LABEL_20;
  }
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  if ([v17 identityPrivateKey])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
    id v19 = [v18 identityPublicKey];

    if (v19) {
      goto LABEL_20;
    }
  }

  else
  {
  }

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v72 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We were registered, but we're missing our private/public identity keys... will reregister: %@",  buf,  0xCu);
  }

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_1001E1BF0;
  v70[3] = &unk_1008F6010;
  v70[4] = self;
  im_dispatch_after_primary_queue(v70, 1.0);
LABEL_20:
  switch(-[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus"))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v23 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int16 v72 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Setting account: %@ to failed registration",  buf,  0xCu);
      }

      -[IDSDAccount _notifyListenersAndSetDependentRegistrations:onRegistrationInfo:]( self,  "_notifyListenersAndSetDependentRegistrations:onRegistrationInfo:",  0LL,  self->_registrationInfo);
      -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v24 removeRegistrationInfo:self->_registrationInfo];

      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v25 cancelActionsForRegistrationInfo:self->_registrationInfo];

      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v26 stopTrackingRegistration:self->_registrationInfo];

      int64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceHeartbeatCenter sharedInstance]( &OBJC_CLASS___IDSDeviceHeartbeatCenter,  "sharedInstance"));
      [v27 accountsChanged];

      -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  0xFFFFFFFFLL,  a3,  v6);
      goto LABEL_45;
    case 0LL:
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int16 v72 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Setting account: %@ to unregistered",  buf,  0xCu);
      }

      if (_os_feature_enabled_impl("IDS", "IDSKTDelayRegistration")
        && ((id)-[IDSDAccount registrationError](self, "registrationError") == (id)47
         || (id)-[IDSDAccount registrationError](self, "registrationError") == (id)49
         || (id)-[IDSDAccount registrationError](self, "registrationError") == (id)48))
      {
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Currently unregistered due to KT server rejection. Updating error.",  buf,  2u);
        }
      }

      else
      {
        a3 = -1LL;
      }

      -[IDSDAccount setRegistrationStatus:error:alertInfo:](self, "setRegistrationStatus:error:alertInfo:", 1LL, a3, v6);
      __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v59 removeRegistrationInfo:self->_registrationInfo];

      __int16 v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v60 stopTrackingRegistration:self->_registrationInfo];

      __int128 v61 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceHeartbeatCenter sharedInstance]( &OBJC_CLASS___IDSDeviceHeartbeatCenter,  "sharedInstance"));
      [v61 accountsChanged];

      -[IDSDAccount _updatePhoneNumberCallerID](self, "_updatePhoneNumberCallerID");
      -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
      -[IDSDAccount _notifyListenersAndSetDependentRegistrations:onRegistrationInfo:]( self,  "_notifyListenersAndSetDependentRegistrations:onRegistrationInfo:",  0LL,  self->_registrationInfo);
      -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
      __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v62 identifier]);
      unsigned int v64 = [v63 isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"];

      if (v64)
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
        [v40 updateDevicePropertiesWithDevices:0];
        break;
      }

      goto LABEL_45;
    case 1LL:
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      uint64_t v31 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      unsigned int v32 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
      *(_DWORD *)buf = 138412546;
      __int16 v72 = v31;
      __int16 v73 = 1024;
      LODWORD(v74) = v32;
      __int128 v33 = "Setting account: %@ to authenticating  (Reg status: %d) (Waiting for restore)";
      goto LABEL_41;
    case 2LL:
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      uint64_t v31 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      unsigned int v34 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
      *(_DWORD *)buf = 138412546;
      __int16 v72 = v31;
      __int16 v73 = 1024;
      LODWORD(v74) = v34;
      __int128 v33 = "Setting account: %@ to authenticating  (Reg status: %d) (Waiting for push token)";
      goto LABEL_41;
    case 3LL:
    case 4LL:
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      goto LABEL_42;
    case 5LL:
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
LABEL_40:
      uint64_t v31 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      unsigned int v35 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
      *(_DWORD *)buf = 138412546;
      __int16 v72 = v31;
      __int16 v73 = 1024;
      LODWORD(v74) = v35;
      __int128 v33 = "Setting account: %@ to authenticating  (Reg status: %d)";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v33, buf, 0x12u);

LABEL_42:
      id v36 = self;
      uint64_t v37 = 2LL;
LABEL_43:
      -[IDSDAccount setRegistrationStatus:error:alertInfo:]( v36,  "setRegistrationStatus:error:alertInfo:",  v37,  -1LL,  v6);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v38 removeRegistrationInfo:self->_registrationInfo];

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v39 stopTrackingRegistration:self->_registrationInfo];

      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceHeartbeatCenter sharedInstance]( &OBJC_CLASS___IDSDeviceHeartbeatCenter,  "sharedInstance"));
      [v40 accountsChanged];
      break;
    case 6LL:
      __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        unsigned int v44 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
        *(_DWORD *)buf = 138412546;
        __int16 v72 = v43;
        __int16 v73 = 1024;
        LODWORD(v74) = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Setting account: %@ to authenticated  (Reg status: %d)",  buf,  0x12u);
      }

      id v36 = self;
      uint64_t v37 = 3LL;
      goto LABEL_43;
    case 7LL:
      __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v46 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        unsigned int v47 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
        *(_DWORD *)buf = 138412546;
        __int16 v72 = v46;
        __int16 v73 = 1024;
        LODWORD(v74) = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Setting account: %@ to registering  (Reg status: %d)",  buf,  0x12u);
      }

      -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  4LL,  -1LL,  v6);
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v48 removeRegistrationInfo:self->_registrationInfo];

      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v49 stopTrackingRegistration:self->_registrationInfo];

      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceHeartbeatCenter sharedInstance]( &OBJC_CLASS___IDSDeviceHeartbeatCenter,  "sharedInstance"));
      [v50 accountsChanged];

      -[IDSDAccount _updatePhoneNumberCallerID](self, "_updatePhoneNumberCallerID");
      goto LABEL_45;
    case 8LL:
      uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v52 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int16 v72 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Setting account: %@ to registered",  buf,  0xCu);
      }

      -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  5LL,  -1LL,  v6);
      -[IDSDAccount _updatePhoneNumberCallerID](self, "_updatePhoneNumberCallerID");
      unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
      [v53 addRegistrationInfo:self->_registrationInfo];

      unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
      [v54 startTrackingRegistration:self->_registrationInfo];

      id v55 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeviceHeartbeatCenter sharedInstance]( &OBJC_CLASS___IDSDeviceHeartbeatCenter,  "sharedInstance"));
      [v55 accountsChanged];

      if (-[IDSDAccount accountType](self, "accountType")) {
        goto LABEL_45;
      }
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
      id v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v40 appleIDAccountOnService:v56]);
      [v57 _cleanupAccount];

      break;
    default:
      goto LABEL_45;
  }

LABEL_45:
  -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");
  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
  [v41 authKitAccountUpdate:self->_registrationInfo];
}

- (BOOL)_stopRegistrationAgent
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    registrationInfo = self->_registrationInfo;
    int v13 = 138412290;
    unsigned int v14 = registrationInfo;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "  Stop Registration Agent for: %@",  (uint8_t *)&v13,  0xCu);
  }

  if (self->_registrationInfo)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v5 cancelActionsForRegistrationInfo:self->_registrationInfo];

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v6 stopTrackingRegistration:self->_registrationInfo];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSHeartbeatCenter, "sharedInstance"));
    [v7 removeRegistrationInfo:self->_registrationInfo];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned int v10 = [v9 isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"];

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
      [v11 updateDevicePropertiesWithDevices:0];
    }
  }

  return 1;
}

- (void)_reAuthenticate
{
}

- (void)_reregisterAndReProvision
{
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A116C(self);
    }
LABEL_7:

    return;
  }

  unsigned int v4 = -[IDSDAccount isAdHocAccount](self, "isAdHocAccount");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      unsigned int v7 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
      int v9 = 138412290;
      unsigned int v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " => Forwarding to Primary: %@",  (uint8_t *)&v9,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    [v8 _reregisterAndReProvision];
  }

  else
  {
    if (v6)
    {
      int v9 = 138412290;
      unsigned int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " => Re-registering and re-provisioning: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[IDSRegistration setAuthenticationCert:](self->_registrationInfo, "setAuthenticationCert:", 0LL);
    -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
    -[IDSRegistration setUris:](self->_registrationInfo, "setUris:", 0LL);
    -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
    -[IDSDAccount _registerAccount](self, "_registerAccount");
  }

- (void)_removeAuthenticationCredentials
{
}

- (void)_removeAuthenticationCredentialsIncludingAuthToken:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "  ** Removing authentication credentials **",  (uint8_t *)&v14,  2u);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_9;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1268(self);
    }
LABEL_9:

    return;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  " => Forwarding to Primary: %@",  (uint8_t *)&v14,  0xCu);
    }

    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    [v9 _removeAuthenticationCredentials];
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
    unsigned int v11 = [v10 isUnderFirstDataProtectionLock];

    if (v11)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Device is still under first data protection lock, changing request to a deferred re-identification",  (uint8_t *)&v14,  2u);
      }

      *((_BYTE *)self + 80) |= 0x80u;
    }

    else
    {
      -[IDSRegistration setAuthenticationCert:](self->_registrationInfo, "setAuthenticationCert:", 0LL);
      if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
        [v13 notePhoneAuthCertLost:3];
      }

      if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType")) {
        -[IDSRegistration setMainID:](self->_registrationInfo, "setMainID:", 0LL);
      }
      -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
      -[IDSRegistration setUris:](self->_registrationInfo, "setUris:", 0LL);
      if (v3) {
        -[IDSRegistration setAuthenticationToken:](self->_registrationInfo, "setAuthenticationToken:", 0LL);
      }
      -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
    }
  }

- (void)_reregisterAndReidentify:(BOOL)a3
{
  BOOL v3 = a3;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v17 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon reregister/reidentify account",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v17, &state);
  if (v3)
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v6 = "  ** Re-identifying from beginning **";
  }

  else
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    BOOL v6 = "  ** Re-registering **";
  }

  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A1338();
    }

    goto LABEL_14;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A12EC();
    }

- (void)_reregister
{
}

- (void)systemDidFinishMigration
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Migration is complete, checking to see if we should re-register now",  v4,  2u);
  }

  -[IDSDAccount _rebuildRegistrationInfo:](self, "_rebuildRegistrationInfo:", 1LL);
  -[IDSDAccount _reregister](self, "_reregister");
}

- (void)systemDidStartBackup
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    BOOL v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "System started backup: %@",  (uint8_t *)&v4,  0xCu);
  }
}

- (void)systemRestoreStateDidChange
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    unsigned int v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "System restore state changed: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[IDSDAccount _rebuildRegistrationInfo:](self, "_rebuildRegistrationInfo:", 1LL);
  -[IDSDAccount _reregister](self, "_reregister");
  if ((*((_BYTE *)self + 80) & 0x20) != 0)
  {
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v6 = 138412290;
      unsigned int v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "We had a pending GDR, kicking it off now: %@",  (uint8_t *)&v6,  0xCu);
    }

    *((_BYTE *)self + 80) &= ~0x20u;
    -[IDSDAccount _issueDependentCheck](self, "_issueDependentCheck");
  }

- (void)activateRegistration
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v50 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon activate account registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v50, &state);
  if (!-[IDSDAccount isAdHocAccount](self, "isAdHocAccount") && -[IDSDAccount accountType](self, "accountType") != 2)
  {
    if ((*((_BYTE *)self + 81) & 2) != 0) {
      goto LABEL_4;
    }
    BOOL v3 = objc_autoreleasePoolPush();
    -[IDSDAccount _registerForDeviceCenterNotifications](self, "_registerForDeviceCenterNotifications");
    int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
    [v4 addListener:self];

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v5 addListener:self];

    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
    [v6 addListener:self];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
    [v7 addListener:self];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    [v8 addListener:self];

    int v9 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationPushHandler);
    pushHandler = self->_pushHandler;
    self->_pushHandler = v9;

    -[IDSRegistrationPushHandler addListener:](self->_pushHandler, "addListener:", self);
    -[IDSDAccount _acceptIncomingPushes](self, "_acceptIncomingPushes");
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDRegistrationPushManager sharedInstance]( &OBJC_CLASS___IDSDRegistrationPushManager,  "sharedInstance"));
    [v11 startTrackingRegisteredAccountID:self->_uniqueID];

    if (IMGetCachedDomainBoolForKey(@"com.apple.conference", @"ForcePurgeRegistrationData"))
    {
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_1006A1414();
      }

      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
      [v13 removeAllRegistrations];

      IMSetDomainBoolForKey(@"com.apple.conference", @"ForcePurgeRegistrationData", 0LL);
    }

    -[IDSDAccount _rebuildRegistrationInfo:](self, "_rebuildRegistrationInfo:", 1LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v48 = v3;
      char v15 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v18 = (id)objc_claimAutoreleasedReturnValue([v17 identifier]);
      if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") == 1) {
        id v19 = @"AppleID";
      }
      else {
        id v19 = @"Phone Number";
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceInformationString]);
      registrationInfo = self->_registrationInfo;
      *(_DWORD *)buf = 138413570;
      unsigned __int8 v52 = v15;
      __int16 v53 = 2112;
      id v54 = v16;
      __int16 v55 = 2112;
      id v56 = v18;
      __int16 v57 = 2112;
      unsigned int v58 = v19;
      __int16 v59 = 2112;
      __int16 v60 = v21;
      __int16 v61 = 2112;
      __int128 v62 = registrationInfo;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "*** Activating registration: %@   Login: %@   Service: %@   Type: %@   Environment: %@   Registration: %@",  buf,  0x3Eu);

      BOOL v3 = v48;
    }

    p_registrationInfo = &self->_registrationInfo;
    if (self->_registrationInfo
      && !+[IDSRegistrationController systemSupportsRegistrationInfo:]( &OBJC_CLASS___IDSRegistrationController,  "systemSupportsRegistrationInfo:"))
    {
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        sub_1006A13A8((uint64_t *)&self->_registrationInfo, v31, v32);
      }

      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_1006A137C();
      }

      int64_t v27 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      -[IDSDAccount disableAccountWithUniqueID:](v27, "disableAccountWithUniqueID:", v28);
      goto LABEL_51;
    }

    *((_BYTE *)self + 81) |= 2u;
    -[IDSRegistration setIsDisabled:](*p_registrationInfo, "setIsDisabled:", 0LL);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v24 startTrackingActiveRegistration:*p_registrationInfo];

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bagURL]);

    if (v26)
    {
      int64_t v27 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v26 host]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 port]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v27,  kIDSServiceDefaultsServerHostKey,  v28,  kIDSServiceDefaultsServerPortKey,  0LL));
      -[IDSDAccount _writeAccountDefaults:force:](self, "_writeAccountDefaults:force:", v29, 1LL);
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v52 = v27;
        __int16 v53 = 2112;
        id v54 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Using server: %@:%@", buf, 0x16u);
      }
    }

    else
    {
      uint64_t v34 = OSLogHandleForIDSCategory("Warning");
      unsigned int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Couldn't get bag url", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v36))
      {
        _IDSWarnV(@"IDSFoundation", @"Couldn't get bag url");
        _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"Couldn't get bag url");
        _IDSLogTransport(@"Warning", @"IDS", @"Couldn't get bag url");
      }

      int64_t v27 = 0LL;
      uint64_t v28 = 0LL;
    }

    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Priming Server bag", buf, 2u);
    }

    id v38 = +[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance");
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "...done", buf, 2u);
    }

    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
    if (!-[IDSRegistration registrationType](*p_registrationInfo, "registrationType"))
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
      [v40 notePhoneNumberRegistrationReset];
    }

    unsigned __int8 v41 = -[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered");
    if (-[IDSRegistration needsMigration](*p_registrationInfo, "needsMigration"))
    {
      __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "****** Forcing Registration, needs migration ******",  buf,  2u);
      }

      *((_BYTE *)self + 80) |= 4u;
    }

    else
    {
      if ((v41 & 1) != 0)
      {
        -[IDSDAccount _checkRegistration](self, "_checkRegistration");
LABEL_50:
        -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");

LABEL_51:
        objc_autoreleasePoolPop(v3);
        goto LABEL_4;
      }

      uint64_t v43 = *p_registrationInfo;
      if (*p_registrationInfo)
      {
        if (!-[IDSRegistration canRegister](v43, "canRegister"))
        {
          __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v47 = (IDSDAccount *)*p_registrationInfo;
            *(_DWORD *)buf = 138412290;
            unsigned __int8 v52 = v47;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "****** NOT Forcing Registration, we were active, but unregistered, however there's nothing to register: %@ ******",  buf,  0xCu);
          }

          goto LABEL_50;
        }

        uint64_t v43 = *p_registrationInfo;
      }

      unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](v43, "registrationCert"));
      *((_BYTE *)self + 80) = *((_BYTE *)self + 80) & 0xFB | (4 * (v44 != 0LL));

      __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v52 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "****** Forcing Registration, we were active, but unregistered: %@ ******",  buf,  0xCu);
      }
    }

    -[IDSDAccount _registerAccount](self, "_registerAccount");
    goto LABEL_50;
  }

  *((_BYTE *)self + 81) |= 2u;
LABEL_4:
  os_activity_scope_leave(&state);
  cut_arc_os_release(&v50);
}

- (void)deactivateRegistration
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon deactivate account registration",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v32, &state);
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount") || -[IDSDAccount accountType](self, "accountType") == 2)
  {
    *((_BYTE *)self + 81) &= ~2u;
  }

  else if ((*((_BYTE *)self + 81) & 2) != 0)
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = (IDSRegistration *)(id)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v6 = (id)objc_claimAutoreleasedReturnValue([v5 identifier]);
      if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") == 1) {
        unsigned int v7 = @"AppleID";
      }
      else {
        unsigned int v7 = @"Phone Number";
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInformationString]);
      registrationInfo = self->_registrationInfo;
      *(_DWORD *)buf = 138413570;
      uint64_t v34 = v30;
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      uint64_t v40 = v7;
      __int16 v41 = 2112;
      __int128 v42 = v9;
      __int16 v43 = 2112;
      unsigned int v44 = registrationInfo;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "*** Deactivating registration: %@   Login: %@   Service: %@   Type: %@   Environment: %@   Registration: %@",  buf,  0x3Eu);
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v11 stopTrackingActiveRegistration:self->_registrationInfo];

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
    [v12 cancelActionsForRegistrationInfo:self->_registrationInfo];

    -[IDSRegistration setVettedEmails:](self->_registrationInfo, "setVettedEmails:", 0LL);
    -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
    if (-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered"))
    {
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = self->_registrationInfo;
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "*** simply marking account as unregistered: %@",  buf,  0xCu);
      }

      -[IDSDAccount _unregisterAccount](self, "_unregisterAccount");
    }

    else
    {
      char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = self->_registrationInfo;
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "*** removing registration from keychain: %@",  buf,  0xCu);
      }

      -[IDSRegistration removeFromKeychain](self->_registrationInfo, "removeFromKeychain");
    }

    -[IDSDAccount _stopRegistrationAgent](self, "_stopRegistrationAgent");
    -[IDSDAccount _ignoreIncomingPushes](self, "_ignoreIncomingPushes");
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDRegistrationPushManager sharedInstance]( &OBJC_CLASS___IDSDRegistrationPushManager,  "sharedInstance"));
    [v17 stopTrackingRegisteredAccountID:self->_uniqueID];

    *((_BYTE *)self + 81) &= ~2u;
    -[IDSRegistration setIsDisabled:](self->_registrationInfo, "setIsDisabled:", 1LL);
    -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    [v18 removeListener:self];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSSMSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSSMSRegistrationCenter, "sharedInstance"));
    [v19 removeListener:self];

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
    [v20 removeListener:self];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    [v21 removeListener:self];

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
    [v22 removeListener:self];

    -[IDSDAccount _deregisterDeviceCenterNotifications](self, "_deregisterDeviceCenterNotifications");
    uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestoreMonitor sharedInstance](&OBJC_CLASS___IDSRestoreMonitor, "sharedInstance"));
    [v23 removeTarget:self];

    -[IDSRegistrationPushHandler removeListener:](self->_pushHandler, "removeListener:", self);
    pushHandler = self->_pushHandler;
    self->_pushHandler = 0LL;

    dateOfLastHandlesCheck = self->_dateOfLastHandlesCheck;
    self->_dateOfLastHandlesCheck = 0LL;

    unsigned __int8 v26 = self->_registrationInfo;
    self->_registrationInfo = 0LL;

    setupHandlers = self->_setupHandlers;
    self->_setupHandlers = 0LL;

    -[IDSDAccount _resetVariables](self, "_resetVariables");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v28,  kIDSServiceDefaultsLastGDRDateKey));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v29);
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v32);
}

- (void)_authenticateAccount
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v5 = (IDSRegistration *)objc_claimAutoreleasedReturnValue([v4 deviceInformationString]);
    int v14 = 138412546;
    char v15 = v5;
    __int16 v16 = 2112;
    unsigned int v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  " => Authenticate (Environment: %@) %@",  (uint8_t *)&v14,  0x16u);
  }

  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A1440(self);
      }
    }

    else if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A14C4(self);
      }
    }

    else if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") {
           && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 3)
    }
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));

      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          registrationInfo = self->_registrationInfo;
          int v14 = 138412290;
          char v15 = registrationInfo;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting auth for: %@",  (uint8_t *)&v14,  0xCu);
        }

        unsigned int v10 = self->_registrationInfo;
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));
        -[IDSRegistration setPushToken:](v10, "setPushToken:", v11);

        -[IDSRegistration setRunningSimpleAuthentication:]( self->_registrationInfo,  "setRunningSimpleAuthentication:",  1LL);
        if (-[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus") <= 6)
        {
          -[IDSRegistration setVettedEmails:](self->_registrationInfo, "setVettedEmails:", 0LL);
          -[IDSRegistration setRegistrationStatus:](self->_registrationInfo, "setRegistrationStatus:", 5LL);
        }

        -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
        -[os_log_s authenticateRegistration:requireSilentAuth:]( v6,  "authenticateRegistration:requireSilentAuth:",  self->_registrationInfo,  -[IDSDAccount _isPasswordPromptPermissibleDuringAuthentication]( self,  "_isPasswordPromptPermissibleDuringAuthentication") ^ 1);
      }

      else if (v8)
      {
        unsigned int v12 = (IDSRegistration *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
        int v13 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationPushHandler pushToken](self->_pushHandler, "pushToken"));
        int v14 = 138412546;
        char v15 = v12;
        __int16 v16 = 2112;
        unsigned int v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Asked to authenticate, but haven't received push token yet, waiting... (Mine: %@  APSD: %@)",  (uint8_t *)&v14,  0x16u);
      }
    }

    else
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_1006A1548();
      }
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
  }
}

- (BOOL)_isPasswordPromptPermissibleDuringAuthentication
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount serviceController](self, "serviceController"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesService]);

  if (v3 != v5) {
    return 1;
  }
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unint64_t v8 = (unint64_t)[v7 deviceType];

  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    return 0;
  }
  else {
    return -[IDSDAccount hasEverRegistered](self, "hasEverRegistered");
  }
}

- (void)authenticateAccount
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInformationString]);
    int v7 = 138412290;
    unint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Client requested re-authenticate (Environment: %@)",  (uint8_t *)&v7,  0xCu);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_9;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1574(self);
    }
LABEL_9:

    return;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A15F8(self);
    }
    goto LABEL_9;
  }

  -[IDSDAccount _authenticateAccount](self, "_authenticateAccount");
}

- (void)_retryRegister
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestoreMonitor sharedInstance](&OBJC_CLASS___IDSRestoreMonitor, "sharedInstance"));
  [v3 removeTarget:self];

  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Retrying registration, to check for backup state",  (uint8_t *)&v7,  2u);
  }

  -[IDSDAccount _registerAccount](self, "_registerAccount");
  if ((*((_BYTE *)self + 80) & 0x20) != 0)
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v7 = 138412290;
      unint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "We had a pending GDR, kicking it off now: %@",  (uint8_t *)&v7,  0xCu);
    }

    *((_BYTE *)self + 80) &= ~0x20u;
    -[IDSDAccount _issueDependentCheck](self, "_issueDependentCheck");
  }

- (BOOL)_migrateRegistrationIfNeeded
{
  if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 1) {
    return 0;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration migrationContext](self->_registrationInfo, "migrationContext"));

  if (!v3) {
    return 0;
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    registrationInfo = self->_registrationInfo;
    *(_DWORD *)buf = 138412290;
    __int128 v45 = registrationInfo;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating Apple ID based registration info: %@",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
  id v7 = [v6 _FZBestGuessFZIDType];

  BOOL v8 = v7 != 0LL;
  if (v7)
  {
    int v9 = self->_registrationInfo;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
    -[IDSRegistration setEmail:](v9, "setEmail:", v10);

    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = self->_registrationInfo;
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      *(_DWORD *)buf = 138412546;
      __int128 v45 = v12;
      __int16 v46 = 2112;
      unsigned int v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Rebuilding aliases for: %@ (%@)", buf, 0x16u);
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _unprefixedURIStringsFromAccountInfo](self, "_unprefixedURIStringsFromAccountInfo"));
    id v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(IDSRegistration **)(*((void *)&v39 + 1) + 8LL * (void)i);
          int64_t v20 = -[IDSDAccount _validationStatusForAlias:](self, "_validationStatusForAlias:", v19);
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v20 == -1)
          {
            if (v22)
            {
              *(_DWORD *)buf = 138412290;
              __int128 v45 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  " => ignoring failed validation email: %@",  buf,  0xCu);
            }
          }

          else
          {
            if (v22)
            {
              *(_DWORD *)buf = 138412290;
              __int128 v45 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  " => adding candidate email: %@",  buf,  0xCu);
            }

            -[IDSRegistration addCandidateEmail:](self->_registrationInfo, "addCandidateEmail:", v19);
          }
        }

        id v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }

      while (v16);
    }

    uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
    uint64_t v24 = (IDSRegistration *)objc_claimAutoreleasedReturnValue([v23 objectForKey:kIDSServiceDefaultsProfileKey]);

    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v45 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Existing region profile: %@", buf, 0xCu);
    }

    if (-[IDSRegistration count](v24, "count"))
    {
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration objectForKey:]( v24,  "objectForKey:",  kIDSServiceDefaultsProfileValdationStatusKey));
      unsigned int v27 = [v26 intValue];

      if (v27 == 3)
      {
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "We have a profile, and it's validated!",  buf,  2u);
        }

        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionID](self->_registrationInfo, "regionID"));
        id v30 = [v29 length];

        if (!v30)
        {
          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "No region ID, we'll use our profile's",  buf,  2u);
          }

          uint64_t v32 = self->_registrationInfo;
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration objectForKey:](v24, "objectForKey:", kIDSServiceDefaultsProfileRegionIDKey));
          -[IDSRegistration setRegionID:](v32, "setRegionID:", v33);

          uint64_t v34 = self->_registrationInfo;
          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration objectForKey:]( v24,  "objectForKey:",  kIDSServiceDefaultsProfileBaseNumberKey));
          -[IDSRegistration setRegionBasePhoneNumber:](v34, "setRegionBasePhoneNumber:", v35);

          id v36 = self->_registrationInfo;
          __int16 v37 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration objectForKey:]( v24,  "objectForKey:",  kIDSServiceDefaultsProfileServerContextKey));
          -[IDSRegistration setRegionServerContext:](v36, "setRegionServerContext:", v37);
        }
      }
    }

    BOOL v8 = 1;
  }

  -[IDSRegistration setMigrationContext:](self->_registrationInfo, "setMigrationContext:", 0LL);
  return v8;
}

- (void)_registerAccount
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v44 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon register account",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v44, &state);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 deviceInformationString]);
    *(_DWORD *)buf = 138412546;
    __int16 v46 = v5;
    __int16 v47 = 2112;
    __int128 v48 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Re-register called (Environment: %@) %@",  buf,  0x16u);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A1338();
    }

    goto LABEL_10;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A167C();
    }

- (void)registerAccount
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInformationString]);
    int v8 = 138412546;
    int v9 = v4;
    __int16 v10 = 2112;
    unsigned int v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Client requested re-register: %@ (Environment: %@)",  (uint8_t *)&v8,  0x16u);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_9;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006A16C8(self);
    }
LABEL_9:

    return;
  }

  -[IDSDAccount _registerAccount](self, "_registerAccount");
}

- (void)_unregisterAccount
{
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v11 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon unregister account",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInformationString]);
    *(_DWORD *)buf = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    unsigned int v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  " => Deregister: %@ (Environment: %@)",  buf,  0x16u);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A1338();
    }

    goto LABEL_9;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      sub_1006A174C();
    }

- (void)unregisterAccount
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInformationString]);
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Client requested de-register (Environment: %@)",  (uint8_t *)&v7,  0xCu);
  }

  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_9;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A17E4(self);
    }
LABEL_9:

    return;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1868(self);
    }
    goto LABEL_9;
  }

  -[IDSDAccount _unregisterAccount](self, "_unregisterAccount");
}

- (void)passwordUpdated
{
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A18EC(self);
    }
LABEL_7:

    return;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A1970(self);
    }
    goto LABEL_7;
  }

  if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType")
    && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 2
    && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client password updated", buf, 2u);
    }

    if (self->_registrationInfo)
    {
      BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Clearing signature, and re-registering",  v7,  2u);
      }

      int64_t v6 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
      -[IDSRegistration setAuthenticationCert:](self->_registrationInfo, "setAuthenticationCert:", 0LL);
      -[IDSRegistration setRegistrationStatus:](self->_registrationInfo, "setRegistrationStatus:", 0LL);
      -[IDSRegistration setUris:](self->_registrationInfo, "setUris:", 0LL);
      -[IDSRegistration setRegistrationCert:](self->_registrationInfo, "setRegistrationCert:", 0LL);
      if (v6 == 6) {
        -[IDSDAccount _authenticateAccount](self, "_authenticateAccount");
      }
      else {
        -[IDSDAccount _reregister](self, "_reregister");
      }
      -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
    }
  }

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1006A19F4(self);
    }
LABEL_7:

    goto LABEL_8;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1006A1A78(self);
    }
    goto LABEL_7;
  }

  if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType")
    && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 2
    && -[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 3)
  {
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Client updating auth ID: %@  token: %@",  (uint8_t *)&v16,  0x16u);
    }

    -[IDSRegistration setProfileID:](self->_registrationInfo, "setProfileID:", v6);
    -[IDSRegistration setAuthenticationToken:](self->_registrationInfo, "setAuthenticationToken:", v7);
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "... Saving", (uint8_t *)&v16, 2u);
    }

    -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    int v8 = (os_log_s *)v11;
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)v11, kIDSServiceDefaultsAuthorizationIDKey, v6);
    }
    uint64_t v12 = IDSServiceKey;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
    uint64_t v14 = IMCanonicalFormForEmail();
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    IMSetKeychainAuthToken(v7, v12, v15);

    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v8);
    goto LABEL_7;
  }

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v5 = a4;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1AFC(self);
    }
LABEL_7:

    goto LABEL_8;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1B80(self);
    }
    goto LABEL_7;
  }

  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
  if (v7)
  {
    int v8 = (void *)v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
    unsigned __int8 v10 = [v9 isEqualToData:v5];

    if ((v10 & 1) != 0)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pushToken](&OBJC_CLASS___IMRGLog, "pushToken"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
        int v20 = 138412546;
        id v21 = v5;
        __int16 v22 = 2112;
        uint32_t v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Informed of push token change to: %@, but no need to reregister (from: %@)",  (uint8_t *)&v20,  0x16u);
      }

      goto LABEL_7;
    }
  }

  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog pushToken](&OBJC_CLASS___IMRGLog, "pushToken"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
    int v20 = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    uint32_t v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Informed of push token change to: %@, reregistering (from: %@)",  (uint8_t *)&v20,  0x16u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount peerIDManager](self, "peerIDManager"));
  [v14 clearCacheAndPersistImmediately:0];

  -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  unsigned int v16 = [v15 registrationType];

  if (!v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
    [v17 setPNRReason:12 forUserUniqueIdentifier:v18];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
    [v19 notePhoneAuthCertLost:4];
  }

  -[IDSRegistration setAuthenticationCert:](self->_registrationInfo, "setAuthenticationCert:", 0LL);
  -[IDSRegistration setPushToken:](self->_registrationInfo, "setPushToken:", v5);
  -[IDSDAccount _registerAccount](self, "_registerAccount");
LABEL_8:
}

- (void)handler:(id)a3 reloadBag:(id)a4
{
  id v5 = a4;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1C04(self);
    }
LABEL_7:

    goto LABEL_8;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A1C88(self);
    }
    goto LABEL_7;
  }

  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received reload bag push for: %@",  (uint8_t *)&v27,  0xCu);
  }

  if (![v5 length]
    || (uint64_t v8 = _IDSRegistrationServiceTypeForString(v5),
        int v9 = (void *)objc_claimAutoreleasedReturnValue(v8),
        unsigned int v10 = [v9 isEqualToString:IDSRegistrationServiceTypeiMessage],
        v9,
        v10))
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  " => Reloading iMessage bag",  (uint8_t *)&v27,  2u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
    [v12 forceBagLoad];
  }

  if (![v5 length]
    || (uint64_t v13 = _IDSRegistrationServiceTypeForString(v5),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13),
        unsigned int v15 = [v14 isEqualToString:IDSRegistrationServiceTypeFaceTime],
        v14,
        v15))
  {
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  " => Reloading FaceTime bag",  (uint8_t *)&v27,  2u);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    [v17 forceBagLoad];
  }

  if (![v5 length]
    || (uint64_t v18 = _IDSRegistrationServiceTypeForString(v5),
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18),
        unsigned int v20 = [v19 isEqualToString:IDSRegistrationServiceTypeCalling],
        v19,
        v20))
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  " => Reloading FaceTime Audio bag",  (uint8_t *)&v27,  2u);
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    [v22 forceBagLoad];
  }

  if (![v5 length]
    || (uint64_t v23 = _IDSRegistrationServiceTypeForString(v5),
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23),
        unsigned int v25 = [v24 isEqualToString:IDSRegistrationServiceTypeMultiway],
        v24,
        v25))
  {
    unsigned __int8 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  " => Reloading FaceTime Multiway bag",  (uint8_t *)&v27,  2u);
    }

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    -[os_log_s forceBagLoad](v6, "forceBagLoad");
    goto LABEL_7;
  }

- (void)_parseHandlesInfo:(id)a3 currentAliases:(id)a4 currentVettedAliases:(id)a5
{
  id v7 = a3;
  id v78 = a4;
  id v82 = a5;
  id v84 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
  uint64_t v80 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int16 v81 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v101 objects:v119 count:16];
  if (!v8) {
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)v102;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v102 != v9) {
        objc_enumerationMutation(obj);
      }
      unsigned int v11 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)i);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"uri"]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _stripFZIDPrefix]);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"device-name"]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"is-user-visible"]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"status"]);
      int v17 = [v16 intValue];

      if (v17 <= 5050)
      {
        if (v17 == 5036)
        {

          -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  1LL,  5LL,  0LL,  0LL,  0LL,  0LL);
          goto LABEL_23;
        }

        if (v17 == 5038)
        {
LABEL_13:

          -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  1LL,  4LL,  0LL,  0LL,  0LL,  0LL);
          goto LABEL_23;
        }

- (void)_updateHandles:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[IDSDAccount isDeviceAuthenticated](self, "isDeviceAuthenticated"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      id v7 = " => Ignoring, we're not authenticated for: %@";
      goto LABEL_8;
    }

- (void)handler:(id)a3 profile:(id)a4 deviceUpdated:(id)a5 service:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A1D70(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A1DF4(self);
    }
    goto LABEL_7;
  }

  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v39 = 138413058;
    id v40 = v9;
    __int16 v41 = 2112;
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2112;
    uint64_t v46 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received device updated push for profile: %@   token: %@   service: %@  for: %@",  (uint8_t *)&v39,  0x2Au);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 dateLastRegistered]);
  if (v16)
  {
    int v17 = (void *)v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dateLastRegistered]);
    [v19 timeIntervalSinceNow];
    double v21 = fabs(v20);

    if (v21 < 10.0)
    {
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring update - we have recent registration events",  (uint8_t *)&v39,  2u);
      }

      goto LABEL_8;
    }
  }

  else
  {
  }

  if (-[IDSDAccount _isBuddyBlockingRegistration](self, "_isBuddyBlockingRegistration"))
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v39 = 138412290;
      id v40 = v24;
      id v25 = "System not setup, ignoring devices updated push for: %@";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v39, 0xCu);

      goto LABEL_27;
    }

    goto LABEL_27;
  }

  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
  unsigned int v27 = [v26 isUnderFirstDataProtectionLock];

  if (v27)
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v39 = 138412290;
      id v40 = v24;
      id v25 = "Device is still under first data protection lock, ignoring for: %@";
      goto LABEL_26;
    }

- (void)handler:(id)a3 profileHandlesUpdated:(id)a4 status:(id)a5 allowGDR:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A1E78(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A1EFC(self);
    }
    goto LABEL_7;
  }

  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v34 = 138413058;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    __int16 v41 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received handles updated push for profile: %@ allowGDR: %@   status: %@   for: %@",  (uint8_t *)&v34,  0x2Au);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 dateLastRegistered]);
  if (v16)
  {
    int v17 = (void *)v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dateLastRegistered]);
    [v19 timeIntervalSinceNow];
    double v21 = fabs(v20);

    if (v21 < 10.0)
    {
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Ignoring update - we have recent registration events",  (uint8_t *)&v34,  2u);
      }

      goto LABEL_8;
    }
  }

  else
  {
  }

  if (-[IDSDAccount _isBuddyBlockingRegistration](self, "_isBuddyBlockingRegistration"))
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v34 = 138412290;
    id v35 = v23;
    uint64_t v24 = "System not setup, ignoring handles update push for: %@";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v34, 0xCu);

    goto LABEL_7;
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
  unsigned int v26 = [v25 isUnderFirstDataProtectionLock];

  if (v26)
  {
    unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v34 = 138412290;
      id v35 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Device is still under first data protection lock, ignoring for: %@",  (uint8_t *)&v34,  0xCu);
    }

    *((_BYTE *)self + 80) |= 0x40u;
  }

  else
  {
    if (![v9 length])
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v34 = 138412290;
      id v35 = v23;
      uint64_t v24 = "  Empty user ID, ignoring for: %@";
      goto LABEL_23;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 3)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v34 = 138412290;
      id v35 = v23;
      uint64_t v24 = "  Device account, ignoring handles push for: %@";
      goto LABEL_23;
    }

    if (-[IDSDAccount accountType](self, "accountType") || [v9 _FZIDType])
    {
      unsigned int v29 = 1;
    }

    else
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v9 _stripFZIDPrefix]);
      unsigned int v29 = [v32 isEqualToIgnoringCase:v33] ^ 1;
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self->_registrationInfo, "profileID"));
    unsigned int v31 = [v9 isEqualToIgnoringCase:v30];

    if (!v31 && v29)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v34 = 138412290;
      id v35 = v23;
      uint64_t v24 = "  Unknown profile ID ID, not proceeding for: %@";
      goto LABEL_23;
    }

    -[IDSDAccount _updateHandles:](self, "_updateHandles:", 1LL);
    if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") != 1)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      int v34 = 138412290;
      id v35 = v23;
      uint64_t v24 = "  Not an appleID registration, not perfoming GDR for : %@";
      goto LABEL_23;
    }
  }

- (void)handler:(id)a3 flushCacheForURIs:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received flush cache push for uris: %@",  buf,  0xCu);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v6;
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
        id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v12);
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
              unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 queryUpdateNotifier]);
              uint64_t v16 = -[IDSURI initWithPrefixedURI:](objc_alloc(&OBJC_CLASS___IDSURI), "initWithPrefixedURI:", v13);
              int v17 = -[IDSURI initWithPrefixedURI:](objc_alloc(&OBJC_CLASS___IDSURI), "initWithPrefixedURI:", v7);
              [v15 handleRegistrationUpdateForHash:0 localURI:v16 remoteURI:v17 service:self->_service guid:0 forceUpdate:1];

              uint64_t v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v10);
        }

        uint64_t v6 = v21 + 1;
      }

      while ((id)(v21 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v20);
  }
}

- (void)_clearGDRState
{
  registrationInfo = self->_registrationInfo;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[IDSRegistration setDependentRegistrationsTTL:](registrationInfo, "setDependentRegistrationsTTL:", v4);

  -[IDSRegistration setDependentRegistrationAuthRetries:]( self->_registrationInfo,  "setDependentRegistrationAuthRetries:",  &off_1009474D0);
  -[IDSRegistration setDependentRegistrationResponseCode:]( self->_registrationInfo,  "setDependentRegistrationResponseCode:",  &off_1009474D0);
  -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IDSDeviceHeartbeatCenter sharedInstance](&OBJC_CLASS___IDSDeviceHeartbeatCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self->_registrationInfo, "idsUserID"));
  [v6 resetExpiryForUser:v5];
}

- (void)gdrReAuthenticateIfNecessary
{
  if (!self->_registrationInfo || -[IDSDAccount isAdHocAccount](self, "isAdHocAccount")) {
    return;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration dependentRegistrationResponseCode]( self->_registrationInfo,  "dependentRegistrationResponseCode"));
  id v4 = [v3 integerValue];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistration dependentRegistrationAuthRetries]( self->_registrationInfo,  "dependentRegistrationAuthRetries"));
  id v6 = [v5 unsignedIntValue];

  if (-[IDSDAccount isRegistered](self, "isRegistered"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self->_registrationInfo, "registrationCert"));
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationCert](self->_registrationInfo, "authenticationCert"));
      BOOL v9 = v8 == 0LL;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 gdrCenter]);
  if ([v11 shouldReAuthenticateForGDRResultCode:v4 retries:v6])
  {

LABEL_14:
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
      int v23 = 134218498;
      uint64_t v24 = (uint64_t)v4;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = (_DWORD)v6;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Should retry (resultCode %ld) (retries %d) (%@)",  (uint8_t *)&v23,  0x1Cu);
    }

    registrationInfo = self->_registrationInfo;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  ((_DWORD)v6 + 1)));
    -[IDSRegistration setDependentRegistrationAuthRetries:]( registrationInfo,  "setDependentRegistrationAuthRetries:",  v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    LODWORD(registrationInfo) = [v16 registrationType];

    if (!(_DWORD)registrationInfo)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
      [v17 setPNRReason:8 forUserUniqueIdentifier:v18];
    }

    -[IDSDAccount _reAuthenticate](self, "_reAuthenticate");
    return;
  }

  if (v4 != (id)1) {
    BOOL v9 = 0;
  }

  if (v9) {
    goto LABEL_14;
  }
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v4 == (id)6006)
  {
    if (v20)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
      int v23 = 134218242;
      uint64_t v24 = 6006LL;
      __int16 v25 = 2112;
      v26[0] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Should reregister then retry (resultCode %ld) (%@)",  (uint8_t *)&v23,  0x16u);
    }

    -[IDSDAccount reregister](self, "reregister");
  }

  else
  {
    if (v20)
    {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
      int v23 = 134218498;
      uint64_t v24 = (uint64_t)v4;
      __int16 v25 = 1024;
      LODWORD(v26[0]) = (_DWORD)v6;
      WORD2(v26[0]) = 2112;
      *(void *)((char *)v26 + 6) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Should not retry (resultCode %ld) (retries %d) (%@)",  (uint8_t *)&v23,  0x1Cu);
    }
  }

- (void)_notifyListenersAndSetDependentRegistrations:(id)a3 onRegistrationInfo:(id)a4
{
  int v17 = self;
  id v5 = a3;
  id v6 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    BOOL v9 = 0LL;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = IDSDevicePropertyService;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v11, v17));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          if (!v9) {
            BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v9, "addObject:", v13);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  else
  {
    BOOL v9 = 0LL;
  }

  objc_msgSend(v6, "setDependentRegistrations:", v9, v17);
  [v18 _notifyRegistrationListenersAccountDidUpdateRegisteredDevices];
}

- (void)_saveAndNotifyGDRUpdate
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v3, "setShouldBoost:", 0LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E8C8C;
  v5[3] = &unk_1008FBE60;
  id v6 = v3;
  id v7 = self;
  id v4 = v3;
  -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", v5);
}

- (BOOL)_issueForcedDependentCheckIfPossible
{
  if ((*((_BYTE *)self + 80) & 8) != 0) {
    goto LABEL_4;
  }
  BOOL v3 = -[IDSDAccount _hasBudgetForForcedGDR](self, "_hasBudgetForForcedGDR");
  if (v3)
  {
    -[IDSDAccount _issueCriticalDependentCheck](self, "_issueCriticalDependentCheck");
LABEL_4:
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (void)_issueCriticalDependentCheck
{
}

- (void)_issueDependentCheck
{
  if (self->_registrationInfo && !-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") == 3)
    {
      BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int128 v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Not issuing dependancy check, we're a device account: %@",  buf,  0xCu);
      }
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
    unsigned int v6 = [v5 isUnderFirstDataProtectionLock];

    if (v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int128 v20 = v8;
        BOOL v9 = "Device is still under first data protection lock, deferring request for: %@";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);

        goto LABEL_14;
      }

      goto LABEL_14;
    }

    if (-[IDSDAccount _isBuddyBlockingRegistration](self, "_isBuddyBlockingRegistration"))
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        *(_DWORD *)buf = 138412290;
        __int128 v20 = v8;
        BOOL v9 = "Not issuing dependancy check, we're not through buddy yet for: %@";
        goto LABEL_13;
      }

- (void)_processReceivedDependentRegistration:(id)a3 oldDependentRegistrations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IDSDevicePropertyService;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyService]);
  uint64_t v10 = IDSDevicePropertyPushToken;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyPushToken]);
  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyName]);
  __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyHardwareVersion]);
  __int128 v68 = (void *)v9;
  uint64_t v12 = _IDSRegistrationServiceTypeForString(v9);
  unsigned __int8 v65 = (void *)objc_claimAutoreleasedReturnValue(v12);
  __int16 v55 = v6;
  __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:IDSDevicePropertyClientData]);
  id v56 = v7;
  if (v7)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self->_registrationInfo, "pushToken"));
    unsigned __int8 v14 = [v11 isEqualToData:v13];

    if ((v14 & 1) == 0)
    {
      id v15 = sub_1001E99A0(v65);
      id v59 = (void *)objc_claimAutoreleasedReturnValue(v15);
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      id obj = v56;
      id v16 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v78;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v78 != v18) {
              objc_enumerationMutation(obj);
            }
            __int128 v20 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 _dataForKey:v10]);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 _stringForKey:v8]);
            uint64_t v23 = _IDSRegistrationServiceTypeForString(v22);
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

            __int16 v25 = v21;
            if ([v21 isEqualToData:v11]
              && (([v24 isEqualToString:v65] & 1) != 0
               || v59 && [v24 isEqualToString:v59]))
            {
              id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                __int128 v83 = v67;
                __int16 v84 = 2112;
                uint64_t v85 = v68;
                __int16 v86 = 2112;
                __int128 v87 = v66;
                _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  " *** Not notifying for device name: %@  service: %@, we already know about this one!   hardware: %@",  buf,  0x20u);
              }

              __int128 v28 = obj;
              id v29 = v25;
              goto LABEL_47;
            }
          }

          id v17 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      if (-[IDSDAccount accountType](self, "accountType") == 1)
      {
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:IDSDevicePropertyIdentities]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "__imArrayByApplyingBlock:", &stru_1008FDCC0));
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 _IDsFromURIs]);

        if ([v28 count])
        {
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          id v29 = v28;
          id v64 = [v29 countByEnumeratingWithState:&v73 objects:v90 count:16];
          if (v64)
          {
            id obja = v28;
            uint64_t v63 = *(void *)v74;
            __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
            __int128 v62 = v11;
            id v60 = v29;
            do
            {
              for (j = 0LL; j != v64; j = (char *)j + 1)
              {
                if (*(void *)v74 != v63) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v32 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
                unsigned __int8 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30[440] GDR]);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  __int128 v83 = v67;
                  __int16 v84 = 2112;
                  uint64_t v85 = v68;
                  __int16 v86 = 2112;
                  __int128 v87 = v32;
                  __int16 v88 = 2112;
                  __int128 v89 = v66;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  " Queued notification for device name: %@   service: %@  handle: %@ hardware: %@",  buf,  0x2Au);
                }

                id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount serviceController](self, "serviceController"));
                id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 serviceWithIdentifier:v68]);

                __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountController](self, "accountController"));
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 accountsOnService:v35]);

                __int128 v71 = 0u;
                __int128 v72 = 0u;
                __int128 v69 = 0u;
                __int128 v70 = 0u;
                id v38 = v37;
                id v39 = [v38 countByEnumeratingWithState:&v69 objects:v81 count:16];
                if (v39)
                {
                  id v40 = v39;
                  uint64_t v41 = *(void *)v70;
                  while (2)
                  {
                    for (k = 0LL; k != v40; k = (char *)k + 1)
                    {
                      if (*(void *)v70 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      __int16 v43 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)k);
                      unsigned int v44 = [v43 accountType];
                      if (v44 == -[IDSDAccount accountType](self, "accountType"))
                      {
                        __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
                        __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          __int128 v83 = v43;
                          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "  Found similar account: %@",  buf,  0xCu);
                        }

                        __int16 v45 = -[IDSEndpointCapabilities initWithCapabilitiesMap:]( objc_alloc(&OBJC_CLASS___IDSEndpointCapabilities),  "initWithCapabilitiesMap:",  v61);
                        __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
                        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412802;
                          __int128 v83 = v67;
                          __int16 v84 = 2112;
                          uint64_t v85 = v65;
                          __int16 v86 = 2112;
                          __int128 v87 = v32;
                          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  " Adding notification for device name: %@   service: %@  handle: %@",  buf,  0x20u);
                        }

                        __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount appleIDNotificationCenter](self, "appleIDNotificationCenter"));
                        id v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
                        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self->_registrationInfo, "mainID"));
                        if ([v32 length])
                        {
                          [v49 addUsageNotificationForSession:v50 appleID:v51 alias:v32 deviceName:v67 hardwareVersion:v66 deviceCapabilities:v45 serviceType:v65];
                        }

                        else
                        {
                          unsigned __int8 v52 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
                          __int16 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 anyObject]);
                          [v49 addUsageNotificationForSession:v50 appleID:v51 alias:v53 deviceName:v67 hardwareVersion:v66 deviceCapabilities:v45 serviceType:v65];

                          __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
                        }

                        goto LABEL_41;
                      }
                    }

                    id v40 = [v38 countByEnumeratingWithState:&v69 objects:v81 count:16];
                    if (v40) {
                      continue;
                    }
                    break;
                  }
                }

                __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
                __int16 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v35 serviceName]);
                  *(_DWORD *)buf = 138412546;
                  __int128 v83 = v46;
                  __int16 v84 = 2112;
                  uint64_t v85 = v32;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "We don't have an enabled account for service %@ with %@ as an alias, ignoring...",  buf,  0x16u);
                }

- (void)_flushTokensForRegisteredURIs:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v79 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flushing cache for: %@", buf, 0xCu);
  }

  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_1001EA844;
  v73[3] = &unk_1008F64D0;
  v73[4] = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByApplyingBlock:", v73));
  __int16 v45 = v5;
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    id v42 = v3;
    __int16 v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v5));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountAndAdHocAccounts](self, "accountAndAdHocAccounts"));
    id v7 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v70 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount dsHandle](self, "dsHandle"));
          if (v12)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
            unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v12,  v14));
            [v47 addObject:v15];
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 queryService]);
          [v6 addObject:v17];
        }

        id v8 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      }

      while (v8);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount peerIDManager](self, "peerIDManager"));
    uint64_t v19 = v47;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v47 allObjects]);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    [v18 forgetPeerTokensForURIs:v20 services:v21];

    id v3 = v42;
    id v5 = v45;
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountAndAdHocAccounts](self, "accountAndAdHocAccounts"));
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v46 = [v19 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v46)
    {
      id v43 = v3;
      uint64_t v44 = *(void *)v66;
      __int128 v22 = self;
      __int128 v48 = v19;
      do
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v66 != v44) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v65 + 1) + 8 * v23);
          uint64_t v25 = objc_claimAutoreleasedReturnValue(-[IDSDAccount dsHandle](v22, "dsHandle", v43));
          __int16 v49 = (void *)v25;
          uint64_t v50 = v23;
          if (v25)
          {
            uint64_t v26 = v25;
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v22, "service"));
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
            id v29 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v26,  v28));
            id v30 = (id)objc_claimAutoreleasedReturnValue([v5 arrayByAddingObject:v29]);
          }

          else
          {
            id v30 = v5;
          }

          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v53 = v30;
          unsigned __int8 v52 = (char *)[v53 countByEnumeratingWithState:&v61 objects:v75 count:16];
          if (v52)
          {
            uint64_t v51 = *(void *)v62;
            do
            {
              unsigned int v31 = 0LL;
              do
              {
                if (*(void *)v62 != v51) {
                  objc_enumerationMutation(v53);
                }
                id obja = v31;
                uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)v31);
                __int128 v57 = 0u;
                __int128 v58 = 0u;
                __int128 v59 = 0u;
                __int128 v60 = 0u;
                id v33 = v53;
                id v34 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
                if (v34)
                {
                  id v35 = v34;
                  uint64_t v36 = *(void *)v58;
                  do
                  {
                    for (j = 0LL; j != v35; j = (char *)j + 1)
                    {
                      if (*(void *)v58 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      uint64_t v38 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
                      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount peerIDManager](self, "peerIDManager"));
                      id v40 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
                      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 queryService]);
                      [v39 forgetPeerTokensForURI:v38 fromURI:v32 service:v41];
                    }

                    id v35 = [v33 countByEnumeratingWithState:&v57 objects:v74 count:16];
                  }

                  while (v35);
                }

                unsigned int v31 = obja + 1;
              }

              while (obja + 1 != v52);
              unsigned __int8 v52 = (char *)[v33 countByEnumeratingWithState:&v61 objects:v75 count:16];
            }

            while (v52);
          }

          uint64_t v23 = v50 + 1;
          id v5 = v45;
          __int128 v22 = self;
          uint64_t v19 = v48;
        }

        while ((id)(v50 + 1) != v46);
        id v46 = [v48 countByEnumeratingWithState:&v65 objects:v76 count:16];
      }

      while (v46);
      id v3 = v43;
    }
  }
}

- (void)_updateSessionsForAllRegisteredURIs
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]);
  -[IDSDAccount _updateSessionsWithRegisteredURIs:](self, "_updateSessionsWithRegisteredURIs:", v3);
}

- (void)_updateSessionsWithRegisteredURIs:(id)a3
{
}

- (void)_updateSessionsWithRegisteredURIs:(id)a3 retryIfNotRegistered:(BOOL)a4
{
  BOOL v4 = a4;
  id v38 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  uint64_t v7 = (uint64_t)[v6 registrationStatus];

  if (v7 > 7)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1001EAEF0;
    v44[3] = &unk_1008F64D0;
    v44[4] = self;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "__imArrayByApplyingBlock:", v44));
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      __int128 v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 queryService]);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v50 = 2112;
      uint64_t v51 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Updating active URIs: %@   service: %@",  buf,  0x16u);
    }

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v17;
    id v21 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          uint64_t v25 = objc_claimAutoreleasedReturnValue(-[IDSDAccount peerIDManager](self, "peerIDManager"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 queryService]);
          __int128 v28 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)v25 activeURIsFromURI:v24 service:v27]);

          LOBYTE(v25) = -[__CFString count](v28, "count") == 0LL;
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if ((v25 & 1) != 0)
          {
            if (v30)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v24;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "   No active sessions from: %@",  buf,  0xCu);
            }
          }

          else
          {
            if (v30)
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v50 = 2112;
              uint64_t v51 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "   Sending to active sessions for URI: %@   sessions: %@",  buf,  0x16u);
            }

            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
            unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v24 unprefixedURI]);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));
            id v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v32));
            id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  30.0));
            LOWORD(v37) = 256;
            LOWORD(v36) = 0;
            LOWORD(v35) = 0;
            -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:]( self,  "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:want sResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageU UID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:",  v29,  0LL,  0LL,  v31,  v33,  1LL,  0LL,  v35,  v34,  &off_1009474E8,  v36,  0LL,  0LL,  300LL,  v37,  0LL,  0LL);
          }
        }

        id v21 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      }

      while (v21);
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = -[IDSRegistration registrationStatus](self->_registrationInfo, "registrationStatus");
      if (v4) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 queryService]);
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v50 = 2112;
      uint64_t v51 = v10;
      __int16 v52 = 2112;
      id v53 = v38;
      __int16 v54 = 2112;
      __int16 v55 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not registered. Waiting to send the 130 { registrationStatus: %ld, retry: %@, registeredURIs: %@, service: %@ }",  buf,  0x2Au);
    }

    if (v4)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v13 = -[IDSDAccount _unregistered130RetryInterval](self, "_unregistered130RetryInterval");
      uint64_t v15 = im_primary_queue(v13, v14);
      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001EAEB0;
      block[3] = &unk_1008F93E0;
      objc_copyWeak(&v47, (id *)buf);
      id v46 = v38;
      dispatch_after(v13, v16, block);

      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (unint64_t)_unregistered130RetryInterval
{
  return dispatch_time(0LL, 10000000000LL);
}

- (void)center:(id)a3 succeededIdentification:(id)a4 phoneNumber:(id)a5 token:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!-[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 userUniqueIdentifier]);
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
    unsigned int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412802;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Succeeded SMS identification with info: %@    number: %@  token: %@",  (uint8_t *)&v17,  0x20u);
      }

      -[IDSRegistration setPhoneNumber:](self->_registrationInfo, "setPhoneNumber:", v10);
      -[IDSRegistration setMainID:](self->_registrationInfo, "setMainID:", v10);
      -[IDSRegistration setAuthenticationToken:](self->_registrationInfo, "setAuthenticationToken:", v11);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Updating caller ID to phone number: %@",  (uint8_t *)&v17,  0xCu);
      }

      -[IDSDAccount _updatePhoneNumberCallerID](self, "_updatePhoneNumberCallerID");
    }
  }
}

- (void)registrationController:(id)a3 registrationWillStart:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
      goto LABEL_8;
    }

    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A205C(self);
      }
LABEL_8:

      goto LABEL_9;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A20E0(self);
      }
      goto LABEL_8;
    }

    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting registration for: %@",  (uint8_t *)&v8,  0xCu);
    }

    if (-[IDSRegistration registrationStatus](v5, "registrationStatus") == -1) {
      -[IDSRegistration setRegistrationStatus:](v5, "setRegistrationStatus:", 3LL);
    }
    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
  }

- (void)registrationController:(id)a3 registrationUpdated:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
      goto LABEL_8;
    }

    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A2164(self);
      }
LABEL_8:

      goto LABEL_9;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A21E8(self);
      }
      goto LABEL_8;
    }

    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating registration for: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
  }

- (void)registrationController:(id)a3 registrationSucceeded:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v7)
  {
    if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
      goto LABEL_108;
    }

    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1006A226C(self);
      }
LABEL_108:

      goto LABEL_109;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1006A22F0(self);
      }
      goto LABEL_108;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController sharedInstance]( &OBJC_CLASS___IDSRegistrationController,  "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 trackedRegistrations]);
    [v10 containsObjectIdenticalTo:v7];

    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1006A2374();
    }

    -[IDSDAccount _refreshRegistration](self, "_refreshRegistration");
    unsigned int v12 = -[IDSRegistration registrationType](self->_registrationInfo, "registrationType");
    registrationInfo = self->_registrationInfo;
    if (v12)
    {
      if (-[IDSRegistration registrationType](registrationInfo, "registrationType") == 2
        && !-[IDSDAccount hasEverRegistered](self, "hasEverRegistered"))
      {
        -[IDSDAccount _updateCallerIDToTemporaryPhone](self, "_updateCallerIDToTemporaryPhone");
      }
    }

    else
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration phoneNumber](registrationInfo, "phoneNumber"));
      if (v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  kIDSServiceDefaultsLoginAsKey));
        -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v15);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceIdentifier](v7, "serviceIdentifier"));
    int v17 = IDSIsGameCenterRegistrationServiceType(v16);

    if (v17)
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[IDSRegistration contextInfo](v7, "contextInfo"));
        *(_DWORD *)buf = 138412290;
        unsigned int v111 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Getting GameCenter Data from registration with contextInfo: %@",  buf,  0xCu);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration contextInfo](v7, "contextInfo"));
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:IDSGameCenterContactsLastUpdatedDate]);

      if (v21)
      {
        [v21 doubleValue];
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
      }

      else
      {
        id v22 = 0LL;
      }

      uint64_t v23 = objc_alloc(&OBJC_CLASS___IDSGameCenterData);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration contextInfo](v7, "contextInfo"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:IDSGameCenterContactsAssociationID]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration contextInfo](v7, "contextInfo"));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:IDSGameCenterContactsSharingState]);
      __int128 v28 = -[IDSGameCenterData initWithAssociationID:sharingState:lastUpdatedDate:]( v23,  "initWithAssociationID:sharingState:lastUpdatedDate:",  v25,  v27,  v22);

      -[IDSDAccount setGameCenterData:](self, "setGameCenterData:", v28);
    }

    -[IDSRegistration saveToKeychain](v7, "saveToKeychain");
    id v29 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
    BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v111 = (NSMutableSet *)v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Saved: %@", buf, 0xCu);
    }

    unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v111 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "vettedAliases: %@", buf, 0xCu);
    }

    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v111 = (NSMutableSet *)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Checking to see if I should confirm aliases for: %@",  buf,  0xCu);
    }

    __int16 v88 = v7;
    id v89 = v6;

    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
    id v34 = [v33 countByEnumeratingWithState:&v102 objects:v109 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = 0LL;
      uint64_t v37 = *(void *)v103;
      do
      {
        for (i = 0LL; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v103 != v37) {
            objc_enumerationMutation(v33);
          }
          uint64_t v39 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)i);
          if ((-[NSMutableSet containsObject:](v29, "containsObject:", v39) & 1) == 0
            && -[IDSDAccount validationStatusForAlias:](self, "validationStatusForAlias:", v39) <= 1)
          {
            if (!v36) {
              uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            }
            -[NSMutableSet addObject:](v36, "addObject:", v39);
          }
        }

        id v35 = [v33 countByEnumeratingWithState:&v102 objects:v109 count:16];
      }

      while (v35);
    }

    else
    {
      uint64_t v36 = 0LL;
    }

    __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v111 = v36;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Aliases that are unvalidated: %@", buf, 0xCu);
    }

    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v41 = v36;
    id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v98,  v108,  16LL);
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v99;
      do
      {
        for (j = 0LL; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v99 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v98 + 1) + 8LL * (void)j);
          int IsEmail = IMStringIsEmail(v46);
          uint64_t v51 = IMSingleObjectArray(v46, v48, v49, v50);
          __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          if (IsEmail) {
            -[IDSDAccount _validateAliases:](self, "_validateAliases:", v52);
          }
          else {
            -[IDSDAccount _removeAliases:withReason:](self, "_removeAliases:withReason:", v52, 2LL);
          }
        }

        id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v98,  v108,  16LL);
      }

      while (v43);
    }

    if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") == 1)
    {
      id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v111 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Aliases that are unvalidated: %@",  buf,  0xCu);
      }

      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self->_registrationInfo, "uris"));
      id v55 = [v54 countByEnumeratingWithState:&v94 objects:v107 count:16];
      if (v55)
      {
        id v56 = v55;
        __int128 v57 = 0LL;
        uint64_t v58 = *(void *)v95;
        do
        {
          for (k = 0LL; k != v56; k = (char *)k + 1)
          {
            if (*(void *)v95 != v58) {
              objc_enumerationMutation(v54);
            }
            __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v94 + 1) + 8 * (void)k) _stripFZIDPrefix]);
            if ([v60 length])
            {
              if (!v57) {
                __int128 v57 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v57, "addObject:", v60);
              __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
              unsigned __int8 v62 = [v61 containsObject:v60];

              if ((v62 & 1) == 0)
              {
                uint64_t v66 = IMSingleObjectArray(v60, v63, v64, v65);
                __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                -[IDSDAccount _addAliases:](self, "_addAliases:", v67);
              }

              -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  3LL,  0xFFFFFFFFLL,  v60,  0LL,  1LL,  0LL);
            }
          }

          id v56 = [v54 countByEnumeratingWithState:&v94 objects:v107 count:16];
        }

        while (v56);
      }

      else
      {
        __int128 v57 = 0LL;
      }

      if (-[NSMutableArray count](v57, "count")) {
        uint64_t v68 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v57));
      }
      else {
        uint64_t v68 = 0LL;
      }
      __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount aliases](self, "aliases"));
      if ([v69 count]) {
        __int128 v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v69));
      }
      else {
        __int128 v70 = 0LL;
      }
      objc_msgSend(v70, "minusSet:", v68, v68);
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      id v71 = v70;
      id v72 = [v71 countByEnumeratingWithState:&v90 objects:v106 count:16];
      if (v72)
      {
        id v73 = v72;
        uint64_t v74 = *(void *)v91;
        uint64_t v75 = kIDSServiceDefaultsSentinelAlias;
        do
        {
          for (m = 0LL; m != v73; m = (char *)m + 1)
          {
            if (*(void *)v91 != v74) {
              objc_enumerationMutation(v71);
            }
            __int128 v77 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)m);
            if ([v77 isEqualToIgnoringCase:v75])
            {
              uint64_t v78 = 3LL;
            }

            else
            {
              if ((id)-[IDSDAccount _validationStatusForAlias:](self, "_validationStatusForAlias:", v77) == (id)2) {
                continue;
              }
              uint64_t v78 = 1LL;
            }

            -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  v78,  0xFFFFFFFFLL,  v77,  0LL,  1LL,  1LL);
          }

          id v73 = [v71 countByEnumeratingWithState:&v90 objects:v106 count:16];
        }

        while (v73);
      }
    }

    uint64_t v7 = v88;
    id v6 = v89;
    if ((*((_BYTE *)self + 80) & 4) != 0)
    {
      *((_BYTE *)self + 80) &= ~4u;
      id v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Forcing a handles query request post-register to pull the current state",  buf,  2u);
      }

      -[IDSDAccount _updateHandles:](self, "_updateHandles:", 1LL);
    }

    __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
    __int16 v81 = (const void *)kIDSServiceDefaultsAuthorizationIDKey;
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v80 objectForKey:kIDSServiceDefaultsAuthorizationIDKey]);

    id v82 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self->_registrationInfo, "profileID"));
    if (!-[os_log_s length](v8, "length") && -[NSMutableSet length](v82, "length"))
    {
      __int128 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v111 = v82;
        _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "Finished registering without profileID, setting profileID %@ onto account",  buf,  0xCu);
      }

      __int16 v84 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v85 = v84;
      if (v82) {
        CFDictionarySetValue((CFMutableDictionaryRef)v84, v81, v82);
      }
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v85);
    }

    -[IDSDAccount _issueCriticalDependentCheck](self, "_issueCriticalDependentCheck");
    __int16 v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  &__kCFBooleanTrue,  kIDSServiceDefaultsHasEverRegistered));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v86);

    goto LABEL_108;
  }

- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
      goto LABEL_80;
    }

    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1006A2400(self);
      }
      goto LABEL_80;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1006A2484(self);
      }
      goto LABEL_80;
    }

    id v11 = self;
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1006A265C();
    }

    -[os_log_s _updateRegistrationStatusWithError:info:](v11, "_updateRegistrationStatusWithError:info:", a5, v10);
    dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1006A25E4(a5);
    }

    int v14 = 0;
    switch(a5)
    {
      case 29LL:
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_1006A258C();
        }
        goto LABEL_68;
      case 30LL:
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_1006A2560();
        }
        goto LABEL_68;
      case 31LL:
      case 36LL:
      case 38LL:
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_1006A2508();
        }

        -[IDSRegistration removeFromKeychain](v9, "removeFromKeychain");
        if (-[IDSRegistration registrationType](v9, "registrationType") != 2) {
          goto LABEL_69;
        }
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_66;
        }
        goto LABEL_67;
      case 32LL:
      case 33LL:
      case 34LL:
      case 40LL:
      case 41LL:
      case 42LL:
      case 43LL:
      case 44LL:
      case 45LL:
      case 46LL:
        goto LABEL_70;
      case 35LL:
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_WORD *)buf = 0;
        __int16 v21 = " => User has disabled SMS Authentication, disabling the account";
        goto LABEL_59;
      case 37LL:
LABEL_29:
        -[IDSRegistration removeFromKeychain](v9, "removeFromKeychain");
        unsigned int v22 = -[IDSRegistration registrationType](v9, "registrationType");
        if (!-[IDSRegistration registrationType](v9, "registrationType"))
        {
          -[IDSRegistration setMainID:](v9, "setMainID:", 0LL);
          -[IDSRegistration setAuthenticationToken:](v9, "setAuthenticationToken:", 0LL);
          -[IDSRegistration setAuthenticationCert:](v9, "setAuthenticationCert:", 0LL);
          id v35 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPACStateTracker sharedInstance](&OBJC_CLASS___IDSPACStateTracker, "sharedInstance"));
          [v35 notePhoneAuthCertLost:5];

          uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v72 = (int64_t)v9;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  " => Will retry SMS Registration: %@",  buf,  0xCu);
          }

          uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v72 = (int64_t)v9;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  " => Resetting status to waiting for auth response: %@",  buf,  0xCu);
          }

          -[IDSRegistration setRegistrationStatus:](v9, "setRegistrationStatus:", 4LL);
          -[os_log_s _updateRegistrationStatusWithError:info:]( v11,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
          id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration userUniqueIdentifier](v9, "userUniqueIdentifier"));
          [v38 setPNRReason:6 forUserUniqueIdentifier:v39];

          __int128 v40 = (IMMessageContext *)objc_claimAutoreleasedReturnValue( +[IDSSMSRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSSMSRegistrationCenter,  "sharedInstance"));
          -[IMMessageContext sendRegistration:](v40, "sendRegistration:", v9);
          goto LABEL_79;
        }

        if (-[IDSRegistration registrationType](v9, "registrationType") == 1)
        {
          int v23 = -[IDSRegistration retries](v9, "retries");
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v23 <= 2)
          {
            id v60 = v10;
            __int128 v61 = v11;
            if (v25)
            {
              *(_DWORD *)buf = 138412290;
              int64_t v72 = (int64_t)v9;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  " => Will retry Authentication: %@",  buf,  0xCu);
            }

            -[IDSRegistration setRetries:]( v9,  "setRetries:",  -[IDSRegistration retries](v9, "retries") + 1);
            -[IDSRegistration setRegistrationCert:](v9, "setRegistrationCert:", 0LL);
            -[IDSRegistration setAuthenticationToken:](v9, "setAuthenticationToken:", 0LL);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](v9, "confirmedEmails"));
            -[IDSRegistration setUris:](v9, "setUris:", 0LL);
            -[IDSRegistration saveToKeychain](v9, "saveToKeychain");
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            __int128 v69 = 0u;
            id v27 = v26;
            id v28 = [v27 countByEnumeratingWithState:&v66 objects:v70 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v67;
              do
              {
                for (i = 0LL; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v67 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  int64_t v32 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
                  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v60));
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    int64_t v72 = v32;
                    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  " => Added confirmed emails: %@",  buf,  0xCu);
                  }

                  -[IDSRegistration addCandidateEmail:](v9, "addCandidateEmail:", v32);
                }

                id v29 = [v27 countByEnumeratingWithState:&v66 objects:v70 count:16];
              }

              while (v29);
            }

            id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationToken](v9, "authenticationToken"));
            if (!v34)
            {
              -[IDSRegistration setRegistrationStatus:](v9, "setRegistrationStatus:", 3LL);
              id v11 = v61;
              -[os_log_s _updateRegistrationStatusWithError:info:]( v61,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
              __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
              [v59 authenticateRegistration:v9 forceNewToken:1];

              goto LABEL_90;
            }

            id v11 = v61;
            if (-[IDSRegistration registrationStatus](v9, "registrationStatus") >= 6)
            {
              sub_10012EC70(v9);
LABEL_90:

              id v10 = v60;
LABEL_80:

              break;
            }

            int v14 = 0;
            id v10 = v60;
            goto LABEL_70;
          }

          if (!v25) {
            goto LABEL_95;
          }
          *(_WORD *)buf = 0;
        }

        else
        {
          if (-[IDSRegistration registrationType](v9, "registrationType") == 2)
          {
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
LABEL_66:
              *(_DWORD *)buf = 134218242;
              int64_t v72 = a5;
              __int16 v73 = 2112;
              uint64_t v74 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  " => Nuking Home Number user {error: %ld, registration: %@}",  buf,  0x16u);
            }

- (void)registrationController:(id)a3 deregistrationWillStart:(id)a4
{
  if (self->_registrationInfo == a4)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive", a3))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1006A26CC(self);
        }
      }

      else
      {
        if (-[IDSDAccount accountType](self, "accountType") != 2)
        {
          -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
          return;
        }

        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1006A2750(self);
        }
      }
    }

    else
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }

- (void)registrationController:(id)a3 deregistrationSucceeded:(id)a4
{
  if (self->_registrationInfo == a4)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive", a3))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1006A27D4(self);
        }
      }

      else if (-[IDSDAccount accountType](self, "accountType") == 2)
      {
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1006A2858(self);
        }
      }

      else
      {
        -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          registrationInfo = self->_registrationInfo;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
          int v8 = 138412546;
          id v9 = registrationInfo;
          __int16 v10 = 2112;
          id v11 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Deregistration succeeded for %@ - %@",  (uint8_t *)&v8,  0x16u);
        }
      }
    }

    else
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }

- (void)registrationControllerNeedsNewRegistration:(id)a3
{
  if (-[IDSRegistration isDisabled](self->_registrationInfo, "isDisabled", a3))
  {
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      registrationInfo = self->_registrationInfo;
      int v8 = 138412290;
      id v9 = registrationInfo;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Ignoring re-identification request, registration is disabled: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType"))
  {
    if (-[IDSRegistration registrationType](self->_registrationInfo, "registrationType") == 1)
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registration controller requested new SMS registration -- noting that we should re-query handles",  (uint8_t *)&v8,  2u);
      }

      *((_BYTE *)self + 80) |= 4u;
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Registration controller requested new SMS registration -- starting from scratch",  (uint8_t *)&v8,  2u);
    }

    -[IDSDAccount _reregisterAndReidentify:](self, "_reregisterAndReidentify:", 1LL);
  }

- (void)center:(id)a3 startedAuthenticating:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A28DC(self);
    }
LABEL_7:

    goto LABEL_8;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A2960(self);
    }
    goto LABEL_7;
  }

  if (self->_registrationInfo == v5)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Started authenticating for info: %@",  (uint8_t *)&v8,  0xCu);
    }

    -[IDSDAccount _updateRegistrationStatusWithError:info:](self, "_updateRegistrationStatusWithError:info:", -1LL, 0LL);
  }

- (void)center:(id)a3 succeededAuthentication:(id)a4
{
  id v5 = (IDSRegistration *)a4;
  if (self->_registrationInfo == v5)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1006A29E4(self);
        }
      }

      else if (-[IDSDAccount accountType](self, "accountType") == 2)
      {
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1006A2A68(self);
        }
      }

      else
      {
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          int v17 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Succeeded authentication for info: %@",  (uint8_t *)&v16,  0xCu);
        }

        int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = (IDSRegistration *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](v5, "profileID"));
          int v16 = 138412290;
          int v17 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating profileID: %@",  (uint8_t *)&v16,  0xCu);
        }

        id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](v5, "profileID"));
        if (v10) {
          CFDictionarySetValue(v6, kIDSServiceDefaultsAuthorizationIDKey, v10);
        }

        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationToken](v5, "authenticationToken"));
        uint64_t v12 = IDSServiceKey;
        dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
        uint64_t v14 = IMCanonicalFormForEmail();
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        IMSetKeychainAuthToken(v11, v12, v15);

        -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v6);
        -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
      }
    }

    else
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }
}

- (void)center:(id)a3 failedAuthentication:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1006A2AEC(self);
        }
      }

      else if (-[IDSDAccount accountType](self, "accountType") == 2)
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1006A2B70(self);
        }
      }

      else
      {
        id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          sub_1006A2BF4();
        }

        if (-[IDSRegistration registrationType](v9, "registrationType") == 1
          && (id v13 = -[IDSRegistration registrationStatus](v9, "registrationStatus"), a5 == 17)
          && v13 == (id)8)
        {
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Auth failed but we're registered, ignoring...",  buf,  2u);
          }
        }

        else
        {
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing profileID", v19, 2u);
          }

          int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          if (v16) {
            CFDictionarySetValue(v11, kIDSServiceDefaultsAuthorizationIDKey, v16);
          }

          int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount serviceType](self, "serviceType"));
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
          IMRemoveKeychainAuthToken(v17, v18);

          -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v11);
          if ([v10 count]) {
            -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  -[IDSDAccount registrationStatus](self, "registrationStatus"),  -[IDSDAccount registrationError](self, "registrationError"),  v10);
          }
        }
      }
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }
}

- (void)center:(id)a3 succeededCurrentEmailsRequest:(id)a4 emailInfo:(id)a5
{
  uint64_t v7 = (IDSRegistration *)a4;
  id v8 = a5;
  if (self->_registrationInfo == v7)
  {
    if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
      goto LABEL_8;
    }

    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1006A2C64(self);
      }
LABEL_8:

      goto LABEL_9;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1006A2CE8(self);
      }
      goto LABEL_8;
    }

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      int v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Succeeded Validated Email Query info: %@    Emails: %@  (Session: %@)",  (uint8_t *)&v12,  0x20u);
    }

    if (-[IDSDAccount accountType](self, "accountType") == 1)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__imArrayByApplyingBlock:", &stru_1008FDB08));
      -[IDSDAccount _updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:]( self,  "_updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:",  v11,  v8,  0LL);
    }

    -[IDSDAccount _updatePseudonymsFromEmailInfo:](self, "_updatePseudonymsFromEmailInfo:", v8);
  }

- (void)center:(id)a3 succeededRegionValidation:(id)a4 regionID:(id)a5 phoneNumber:(id)a6 extraContext:(id)a7 verified:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_registrationInfo == a4)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1006A2D6C(self);
        }
      }

      else if (-[IDSDAccount accountType](self, "accountType") == 2)
      {
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1006A2DF0(self);
        }
      }

      else
      {
        int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = @"NO";
          *(_DWORD *)uint64_t v26 = 138413058;
          *(void *)&void v26[4] = v13;
          if (v8) {
            id v18 = @"YES";
          }
          *(_WORD *)&v26[12] = 2112;
          *(void *)&v26[14] = v14;
          __int16 v27 = 2112;
          id v28 = v15;
          __int16 v29 = 2112;
          uint64_t v30 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Succeeded region validation with region ID: %@  phoneNumber: %@  context: %@  verified: %@",  v26,  0x2Au);
        }

        __int16 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int16 v16 = (os_log_s *)v19;
        if (v13) {
          CFDictionarySetValue((CFMutableDictionaryRef)v19, kIDSServiceDefaultsProfileRegionIDKey, v13);
        }
        if (v14) {
          CFDictionarySetValue(v16, kIDSServiceDefaultsProfileBaseNumberKey, v14);
        }
        if (v15) {
          CFDictionarySetValue(v16, kIDSServiceDefaultsProfileServerContextKey, v15);
        }
        if (v8) {
          uint64_t v20 = 3LL;
        }
        else {
          uint64_t v20 = 1LL;
        }
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20, *(_OWORD *)v26));
        if (v21) {
          CFDictionarySetValue(v16, kIDSServiceDefaultsProfileValdationStatusKey, v21);
        }

        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
        if (v22) {
          CFDictionarySetValue(v16, kIDSServiceDefaultsProfileValdationErrorCodeKey, v22);
        }

        int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v16,  kIDSServiceDefaultsProfileKey));
        -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v23);

        -[IDSRegistration setRegionID:](self->_registrationInfo, "setRegionID:", v13);
        -[IDSRegistration setRegionBasePhoneNumber:](self->_registrationInfo, "setRegionBasePhoneNumber:", v14);
        -[IDSRegistration setRegionServerContext:](self->_registrationInfo, "setRegionServerContext:", v15);
        if (-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered")) {
          -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
        }
        if (-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered")
          || -[IDSDAccount isDeviceAuthenticated](self, "isDeviceAuthenticated"))
        {
          -[IDSDAccount _updateRegistrationStatusWithError:info:]( self,  "_updateRegistrationStatusWithError:info:",  -1LL,  0LL);
        }

        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          registrationInfo = self->_registrationInfo;
          *(_DWORD *)uint64_t v26 = 138412290;
          *(void *)&void v26[4] = registrationInfo;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Resulting registration info: %@",  v26,  0xCu);
        }
      }
    }

    else
    {
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }
}

- (void)center:(id)a3 failedRegionValidation:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v9 = (IDSRegistration *)a4;
  id v10 = a6;
  if (self->_registrationInfo == v9)
  {
    if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
    {
      if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1006A2E74(self);
        }
      }

      else
      {
        unsigned int v12 = -[IDSDAccount accountType](self, "accountType");
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        id v11 = v13;
        if (v12 == 2)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_1006A2EF8(self);
          }
        }

        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            int v17 = sub_10012EB10(a5);
            id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
            int v19 = 138412802;
            uint64_t v20 = v9;
            __int16 v21 = 2112;
            unsigned int v22 = v18;
            __int16 v23 = 2112;
            id v24 = v10;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Failed region validation for registration info: %@      error: %@   info: %@",  (uint8_t *)&v19,  0x20u);
          }

          id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
          if (v14) {
            CFDictionarySetValue(v11, kIDSServiceDefaultsProfileValdationStatusKey, v14);
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
          if (v15) {
            CFDictionarySetValue(v11, kIDSServiceDefaultsProfileValdationErrorCodeKey, v15);
          }

          -[IDSRegistration setRegionID:](self->_registrationInfo, "setRegionID:", 0LL);
          -[IDSRegistration setRegionBasePhoneNumber:](self->_registrationInfo, "setRegionBasePhoneNumber:", 0LL);
          -[IDSRegistration setRegionServerContext:](self->_registrationInfo, "setRegionServerContext:", 0LL);
          if (-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered")) {
            -[IDSRegistration saveToKeychain](self->_registrationInfo, "saveToKeychain");
          }
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v11,  kIDSServiceDefaultsProfileKey));
          -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v16);

          if ([v10 count]) {
            -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  -[IDSDAccount registrationStatus](self, "registrationStatus"),  -[IDSDAccount registrationError](self, "registrationError"),  v10);
          }
        }
      }
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1006A11F0(self);
      }
    }
  }
}

- (void)_acceptIncomingPushes
{
}

- (void)_ignoreIncomingPushes
{
}

- (id)_unprefixedURIStringsFromAccountInfo
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = kIDSServiceDefaultsAliasKey;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) objectForKey:v8]);
        if ([v10 length])
        {
          if (IMStringIsPhoneNumber(v10))
          {
            uint64_t v11 = IMCanonicalizeFormattedString(v10, 3LL);
            uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

            id v10 = (void *)v12;
          }

          -[NSMutableArray addObject:](v3, "addObject:", v10);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_uriDictionariesFromAccountInfo
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsAliasesKey]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByApplyingBlock:", &stru_1008FDB28));

  return v4;
}

- (int64_t)_validationStatusForAlias:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) != 0
    || ([v4 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias] & 1) != 0)
  {
    int64_t v7 = 3LL;
  }

  else if ([v4 length])
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo", 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = kIDSServiceDefaultsAliasKey;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
          unsigned __int8 v17 = [v16 isEqualToString:v4];

          if ((v17 & 1) != 0)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:kIDSServiceDefaultsAliasStatusKey]);
            int64_t v7 = (int)[v18 intValue];

            goto LABEL_16;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    int64_t v7 = 0LL;
LABEL_16:
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8 aliasProperties:(id)a9
{
  id v41 = a5;
  id v15 = a6;
  id v16 = a9;
  if ([v41 length])
  {
    id v17 = v15;
    unsigned int v18 = [v41 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];
    if (v18) {
      int v19 = -1;
    }
    else {
      int v19 = a4;
    }
    int v38 = v19;
    int64_t v20 = 3LL;
    if (!v18) {
      int64_t v20 = a3;
    }
    uint64_t v39 = self;
    int64_t v40 = v20;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo"));
    __int128 v22 = (NSMutableArray *)[v21 mutableCopy];

    if (!-[NSMutableArray count](v22, "count")) {
      goto LABEL_13;
    }
    uint64_t v23 = 0LL;
    uint64_t v24 = kIDSServiceDefaultsAliasKey;
    while (1)
    {
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v23));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:v24]);
      unsigned __int8 v27 = [v26 isEqualToString:v41];

      if ((v27 & 1) != 0) {
        break;
      }
    }

    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v22, "objectAtIndex:", v23));
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v37 mutableCopy];

      char v29 = 0;
      id v15 = v17;
      if (Mutable) {
        goto LABEL_19;
      }
    }

    else
    {
LABEL_13:
      BOOL v28 = v40 == 3 && a7;
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      char v29 = 1;
      id v15 = v17;
      if (!v28 && !a8)
      {
LABEL_31:

        goto LABEL_32;
      }
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
LABEL_19:
    if (!v22) {
      __int128 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount invisibleAliases](v39, "invisibleAliases"));
    uint64_t v32 = [v31 containsObject:v41] ^ 1;

    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v40));
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v33, kIDSServiceDefaultsAliasStatusKey);

    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v41, kIDSServiceDefaultsAliasKey);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v32));
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v34, kIDSServiceDefaultsAliasIsUserVisibleKey);

    if (v16) {
      -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", v16);
    }
    if (v40 != -1 || v38 == -1)
    {
      -[__CFDictionary removeObjectForKey:]( Mutable,  "removeObjectForKey:",  kIDSServiceDefaultsAliasValidationErrorCodeKey);
    }

    else
    {
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
      -[__CFDictionary setObject:forKey:]( Mutable,  "setObject:forKey:",  v35,  kIDSServiceDefaultsAliasValidationErrorCodeKey);
    }

    if ((v29 & 1) != 0)
    {
      -[NSMutableArray addObject:](v22, "addObject:", Mutable);
      -[IDSDAccount markAsSelectedAlias:](v39, "markAsSelectedAlias:", v41);
    }

    else
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](v22, "replaceObjectAtIndex:withObject:", v23, Mutable);
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v22,  kIDSServiceDefaultsAliasesKey,  v15,  kIDSServiceDefaultsAliasValidationAlertInfoKey,  0LL));
    -[IDSDAccount writeAccountDefaults:](v39, "writeAccountDefaults:", v36);

    goto LABEL_31;
  }

- (void)_setValidationStatus:(int64_t)a3 error:(int)a4 forAlias:(id)a5 info:(id)a6 addToCurrentHandlesIfNeeded:(BOOL)a7 forceAdd:(BOOL)a8
{
}

- (void)_removeAliases:(id)a3 withReason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    *(_DWORD *)buf = 138412546;
    id v38 = v6;
    __int16 v39 = 2112;
    int64_t v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, " => Remove aliases: %@   for: %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_1008FDB48));
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to remove aliases: %@", buf, 0xCu);
  }

  if ([v9 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo"));
    id v12 = [v11 mutableCopy];

    id v13 = [v12 count];
    if ((uint64_t)v13 - 1 >= 0)
    {
      uint64_t v14 = (uint64_t)v13;
      char v34 = 0;
      uint64_t v15 = kIDSServiceDefaultsAliasKey;
      unsigned int v36 = v4;
      id v33 = v9;
      uint64_t v35 = kIDSServiceDefaultsAliasKey;
      while (1)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", --v14, v33));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);
        if (([v9 containsObject:v17] & 1) == 0)
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([@"+" stringByAppendingString:v17]);
          unsigned int v19 = [v9 containsObject:v18];

          if (!v19) {
            goto LABEL_38;
          }
        }

        [v12 removeObjectAtIndex:v14];
        if ((_DWORD)v4 == 2) {
          -[IDSDAccount markAsUnvettedAlias:](self, "markAsUnvettedAlias:", v17);
        }
        else {
          -[IDSDAccount markAsUnselectedAlias:withReason:](self, "markAsUnselectedAlias:withReason:", v17, v4);
        }
        if ((*((_BYTE *)self + 81) & 2) == 0) {
          goto LABEL_38;
        }
        int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self->_registrationInfo, "candidateEmails"));
        unsigned int v21 = [v20 containsObject:v17];

        if (v21)
        {
          -[IDSRegistration removeCandidateEmail:](self->_registrationInfo, "removeCandidateEmail:", v17);
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Removing candidate email: %@",  buf,  0xCu);
          }

          char v34 = 1;
        }

        else
        {
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Email was candidate, just removing: %@",  buf,  0xCu);
          }
        }

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](self->_registrationInfo, "confirmedEmails"));
        unsigned int v24 = [v23 containsObject:v17];

        BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (!v24) {
          break;
        }
        if (v26)
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Removing confirmed email: %@", buf, 0xCu);
        }

        if (-[IDSDAccount isDeviceRegistered](self, "isDeviceRegistered"))
        {
          BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 _bestGuessURI]);
          unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self->_registrationInfo, "uris"));
          id v28 = [v27 mutableCopy];

          unsigned int v29 = [v28 containsObject:v25];
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          if (v29)
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Alias is registered, needs re-register for: %@",  buf,  0xCu);
            }

            [v28 removeObject:v25];
            -[IDSRegistration setUris:](self->_registrationInfo, "setUris:", v28);
            char v34 = 1;
          }

          else
          {
            if (v31)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Alias wasn't registered, moving along: %@",  buf,  0xCu);
            }
          }

          id v9 = v33;
          uint64_t v15 = v35;

LABEL_37:
          uint64_t v4 = v36;
          goto LABEL_38;
        }

        uint64_t v4 = v36;
        uint64_t v15 = v35;
LABEL_38:

        if (v14 <= 0)
        {
          if (v12) {
            goto LABEL_40;
          }
          goto LABEL_41;
        }
      }

      if (v26)
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Email was unconfirmed, just removing: %@",  buf,  0xCu);
      }

      uint64_t v15 = v35;
      goto LABEL_37;
    }

    char v34 = 0;
    if (v12)
    {
LABEL_40:
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v12,  kIDSServiceDefaultsAliasesKey));
      -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v32);
    }

- (void)removeAliases:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client request to remove aliases: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[IDSDAccount _removeAliases:withReason:](self, "_removeAliases:withReason:", v4, 4LL);
}

- (void)_addAliases:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => Add aliases: %@", buf, 0xCu);
  }

  if ([v4 count])
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Request to add aliases: %@", buf, 0xCu);
    }

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " => Found my phone numbers: %@", buf, 0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _unprefixedURIStringsFromAccountInfo](self, "_unprefixedURIStringsFromAccountInfo"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = IMLoggingStringForArray(v9);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412290;
      id v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " => Current aliases: %@", buf, 0xCu);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1001EF6D0;
    v34[3] = &unk_1008FBDF8;
    id v29 = v6;
    id v35 = v29;
    id v28 = v9;
    id v36 = v28;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "__imArrayByApplyingBlock:", v34));

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _uriDictionariesFromAccountInfo](self, "_uriDictionariesFromAccountInfo"));
    uint64_t v15 = (NSMutableArray *)[v14 mutableCopy];

    if (!v15) {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    unsigned __int8 v27 = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v15,  kIDSServiceDefaultsAliasesKey));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " => Vetted aliases: %@", buf, 0xCu);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v4 = v13;
    id v19 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v4);
          }
          uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  " => Adding alias: %@  (and as candidate)",  buf,  0xCu);
          }

          -[IDSRegistration addCandidateEmail:](self->_registrationInfo, "addCandidateEmail:", v23);
          else {
            uint64_t v25 = 0LL;
          }
          -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  v25,  0xFFFFFFFFLL,  v23,  0LL,  1LL,  1LL);
        }

        id v20 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }

      while (v20);
    }

    if ([v4 count]) {
      -[IDSDAccount _reregister](self, "_reregister");
    }

    BOOL v26 = (os_log_s *)v29;
  }

  else
  {
    BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Empty alias, ignoring", buf, 2u);
    }
  }
}

- (void)addAliases:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client request to add aliases: %@  account: %@",  (uint8_t *)&v7,  0x16u);
  }

  -[IDSDAccount _addAliases:](self, "_addAliases:", v4);
}

- (void)_validateAliases:(id)a3 validateAlreadyValid:(BOOL)a4
{
  id v5 = a3;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A2F7C(self);
    }
LABEL_7:
    int v7 = v5;
    goto LABEL_8;
  }

  if (-[IDSDAccount accountType](self, "accountType") == 2)
  {
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1006A3000(self);
    }
    goto LABEL_7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _unprefixedURIStringsFromAccountInfo](self, "_unprefixedURIStringsFromAccountInfo"));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1001EFF14;
  v42[3] = &unk_1008F8348;
  int v6 = v8;
  id v43 = v6;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imArrayByApplyingBlock:", v42));

  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = IMLoggingStringForArray(v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412290;
    id v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request to validate aliases: %@", buf, 0xCu);
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = IMLoggingStringForArray(v6);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412290;
    id v45 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, " => Current aliases: %@", buf, 0xCu);
  }

  if ([v7 count])
  {
    __int128 v33 = v7;
    char v34 = v6;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    id v16 = v7;
    id v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          int64_t v22 = -[IDSDAccount _validationStatusForAlias:](self, "_validationStatusForAlias:", v21);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            unsigned int v24 = @"NO";
            if (v22 == 3) {
              unsigned int v24 = @"YES";
            }
            id v45 = v21;
            __int16 v46 = 2112;
            id v47 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ is already validated %@",  buf,  0x16u);
          }

          if (v22 != 3) {
            -[IDSDAccount _setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:]( self,  "_setValidationStatus:error:forAlias:info:addToCurrentHandlesIfNeeded:forceAdd:",  1LL,  0xFFFFFFFFLL,  v21,  0LL,  0LL,  0LL);
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }

      while (v18);
    }

    if (-[IDSDAccount isDeviceAuthenticated](self, "isDeviceAuthenticated"))
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001EFFA8;
      v37[3] = &unk_1008FDB70;
      v37[4] = self;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByFilteringWithBlock:", v37));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1001F0088;
      v35[3] = &unk_1008FDB98;
      v35[4] = self;
      id v36 = v9;
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByFilteringWithBlock:", v35));
      if ([v25 count] || objc_msgSend(v26, "count"))
      {
        unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount systemMonitor](self, "systemMonitor"));
        unsigned __int8 v28 = [v27 isUnderFirstDataProtectionLock];

        int v6 = v34;
        if ((v28 & 1) != 0)
        {
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          int v7 = v33;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "We're under first lock, not registering aliases: %@",  buf,  0xCu);
          }
        }

        else
        {
          int v7 = v33;
          if ([v26 count]) {
            -[IDSDAccount _registerAccount](self, "_registerAccount");
          }
        }
      }

      else
      {
        __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        int v6 = v34;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Alias all already validated, registered, returning",  buf,  2u);
        }

        int v7 = v33;
      }
    }

    else
    {
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      int v6 = v34;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Request to validate aliases: %@, but device is not authenticated",  buf,  0xCu);
      }

      int v7 = v33;
    }
  }

  else
  {
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Empty aliases, ignoring", buf, 2u);
    }
  }

LABEL_8:
}

- (void)_validateAliases:(id)a3
{
  id v4 = a3;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (!-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1006A3108(self);
      }
      goto LABEL_7;
    }

    dateOfLastHandlesCheck = self->_dateOfLastHandlesCheck;
    if (dateOfLastHandlesCheck)
    {
      -[NSDate timeIntervalSinceNow](dateOfLastHandlesCheck, "timeIntervalSinceNow");
      if (fabs(v7) < 60.0)
      {
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v9 = self->_dateOfLastHandlesCheck;
          int v12 = 138412290;
          id v13 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "We've recently queried the vetted handles on the account, we'll use the local vetting status (%@)",  (uint8_t *)&v12,  0xCu);
        }

        uint64_t v10 = 0LL;
        goto LABEL_20;
      }

      uint64_t v11 = self->_dateOfLastHandlesCheck;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    self->_dateOfLastHandlesCheck = 0LL;

    uint64_t v10 = 1LL;
LABEL_20:
    -[IDSDAccount _validateAliases:validateAlreadyValid:](self, "_validateAliases:validateAlreadyValid:", v4, v10);
    goto LABEL_8;
  }

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1006A3084(self);
  }
LABEL_7:

LABEL_8:
}

- (void)validateAliases:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client request to validate: %@  account: %@",  (uint8_t *)&v8,  0x16u);
  }

  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1006A318C(self);
      }
    }

    else
    {
      if (-[IDSDAccount accountType](self, "accountType") != 2)
      {
        -[IDSDAccount _validateAliases:](self, "_validateAliases:", v4);
        goto LABEL_10;
      }

      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1006A3210(self);
      }
    }
  }

  else
  {
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
  }

LABEL_10:
}

- (void)_unvalidateAliases:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  if (!-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
    goto LABEL_7;
  }

  if (!-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1006A3318(self);
      }
      goto LABEL_7;
    }

    if (-[IDSDAccount accountType](self, "accountType") == 1)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
    }

    else
    {
      int v8 = 0LL;
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001F08D0;
    v17[3] = &unk_1008F8348;
    id v5 = v8;
    id v18 = v5;
    int v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray __imArrayByApplyingBlock:](v4, "__imArrayByApplyingBlock:", v17));

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request to unlink aliases: %@", buf, 0xCu);
    }

    if (-[NSMutableArray count](v6, "count"))
    {
      if (-[IDSDAccount isDeviceAuthenticated](self, "isDeviceAuthenticated"))
      {
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
        -[IDSDAccount _removeAliases:withReason:](self, "_removeAliases:withReason:", v6, 2LL);
        if (-[NSMutableArray count](v6, "count"))
        {
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating vetted handles to remove: %@",  buf,  0xCu);
          }

          int v12 = (NSMutableArray *)[v10 mutableCopy];
          if (!v12) {
            int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray removeObjectsInArray:](v12, "removeObjectsInArray:", v6);
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, " => Final: %@", buf, 0xCu);
          }

          -[IDSDAccount _updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:]( self,  "_updateVettedAliases:emailInfo:addToCurrentHandlesIfNeeded:",  v12,  0LL,  0LL);
        }

        goto LABEL_32;
      }

      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        uint64_t v14 = "Request to unvalidate aliases: %@, but device is not authenticated";
        uint64_t v15 = (os_log_s *)v10;
        uint32_t v16 = 12;
        goto LABEL_31;
      }
    }

    else
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = "Empty aliases, ignoring";
        uint64_t v15 = (os_log_s *)v10;
        uint32_t v16 = 2;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }

- (void)unvalidateAliases:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client request to unvalidate: %@  account: %@",  (uint8_t *)&v8,  0x16u);
  }

  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1006A339C(self);
      }
    }

    else
    {
      if (-[IDSDAccount accountType](self, "accountType") != 2)
      {
        -[IDSDAccount _unvalidateAliases:](self, "_unvalidateAliases:", v4);
        goto LABEL_10;
      }

      double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1006A3420(self);
      }
    }
  }

  else
  {
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
  }

LABEL_10:
}

- (void)deactivateAndPurgeIdentify
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_1006A3604();
  }

  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1006A34A4(self);
      }
    }

    else
    {
      unsigned int v5 = -[IDSDAccount accountType](self, "accountType");
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      id v4 = v6;
      if (v5 == 2)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1006A3528(self);
        }
      }

      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          sub_1006A35D8();
        }

        -[IDSDAccount _unregisterAccount](self, "_unregisterAccount");
        double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          sub_1006A35AC();
        }

        id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance"));
        -[os_log_s purgeMessageProtectionIdentity](v4, "purgeMessageProtectionIdentity");
      }
    }
  }

  else
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
  }
}

- (void)validateCredentialsWithDeliveryCompletionBlock:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
  [v6 sendValidateCredential:v5 withDeliveryCompletionBlock:v4];
}

- (void)refreshVettedAliases
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Client request to refresh valid aliases",  buf,  2u);
  }

  if (-[IDSDAccount isDeviceAuthenticated](self, "isDeviceAuthenticated"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    [v4 queryValidatedEmailsForRegistration:self->_registrationInfo allowPasswordPrompt:1 completionBlock:0];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Request to refresh valid aliases, but device is not authenticated",  v5,  2u);
    }
  }
}

- (void)resetErrorState
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Client requested to reset error state.", v4, 2u);
  }

  -[IDSDAccount setRegistrationStatus:error:alertInfo:]( self,  "setRegistrationStatus:error:alertInfo:",  -[IDSDAccount registrationStatus](self, "registrationStatus"),  -1LL,  0LL);
}

- (unint64_t)_handleAndConvertFeatureToggleError:(int64_t)a3
{
  if (a3 == 20000) {
    return 5LL;
  }
  if (a3 != 6005) {
    return 6LL;
  }
  if (!-[IDSDAccount accountType](self, "accountType"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
    [v4 setPNRReason:11 forUserUniqueIdentifier:v5];
  }

  id v6 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
  double v7 = v6;
  if (!v6) {
    id v6 = self;
  }
  -[IDSDAccount reIdentify](v6, "reIdentify");

  return 6LL;
}

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 featureID]);

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001F0FEC;
  v12[3] = &unk_1008FDBC0;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 retrieveFeatureToggleStateForFeatureID:v9 registration:v10 completionBlock:v12];
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  id v9 = [v7 state];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 featureID]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001F1208;
  v13[3] = &unk_1008FDBC0;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v8 updateFeatureToggleState:v9 forFeatureID:v10 registration:v11 completionBlock:v13];
}

- (void)_handlePseudonymProvisionError:(int64_t)a3
{
  if (a3 == 6005)
  {
    if (!-[IDSDAccount accountType](self, "accountType"))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount userUniqueIdentifier](self, "userUniqueIdentifier"));
      [v4 setPNRReason:11 forUserUniqueIdentifier:v5];
    }

    id v6 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    id v7 = v6;
    if (!v6) {
      id v6 = self;
    }
    -[IDSDAccount reIdentify](v6, "reIdentify");
  }

- (BOOL)provisionPseudonymForURI:(id)a3 properties:(id)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 allowedServices]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    unsigned __int8 v18 = [v14 containsObject:v17];

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 allowedServices]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 service]);
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 arrayByAddingObject:v22]);

      uint64_t v24 = objc_claimAutoreleasedReturnValue([v11 withUpdatedAllowedServices:v23]);
      id v11 = (id)v24;
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    unsigned __int8 v26 = [v25 provisionPseudonymForURI:v10 properties:v11 requestProperties:v13 completionBlock:v12];
  }

  else
  {
    unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001F156C;
    v30[3] = &unk_1008FDBE8;
    v30[4] = self;
    id v33 = v12;
    id v31 = v10;
    id v11 = v11;
    id v32 = v11;
    unsigned __int8 v26 = [v27 provisionPseudonymFor:v28 withURI:v31 properties:v11 requestProperties:v13 completionBlock:v30];
  }

  return v26;
}

- (BOOL)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    unsigned __int8 v14 = [v13 renewPseudonym:v10 forUpdatedExpiryEpoch:v12 requestProperties:v11 completionBlock:a4];
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001F18A4;
    v18[3] = &unk_1008FDC10;
    v18[4] = self;
    id v20 = v11;
    id v19 = v10;
    unsigned __int8 v14 = [v15 renewPseudonym:v19 forRegistration:v16 forUpdatedExpiryEpoch:v12 requestProperties:v18 completionBlock:a4];
  }

  return v14;
}

- (BOOL)revokePseudonym:(id)a3 requestProperties:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    unsigned __int8 v12 = [v11 revokePseudonym:v8 requestProperties:v10 completionBlock:v9];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001F1B84;
    v16[3] = &unk_1008FDC10;
    v16[4] = self;
    id v18 = v9;
    id v17 = v8;
    unsigned __int8 v12 = [v13 revokePseudonym:v17 forRegistration:v14 requestProperties:v10 completionBlock:v16];
  }

  return v12;
}

- (void)_removeAllPseudonyms
{
  uint64_t v5 = kIDSServiceDefaultsPseudonymsKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  -[IDSDAccount _writeAccountDefaults:force:](self, "_writeAccountDefaults:force:", v4, 1LL);
}

- (void)_addPseudonym:(id)a3
{
  id v4 = a3;
  context = objc_autoreleasePoolPush();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  uint64_t v33 = kIDSServiceDefaultsPseudonymsKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:"));
  id v7 = [v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 maskedURI]);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 prefixedURI]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v12]);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001F219C;
  v35[3] = &unk_1008FDC38;
  id v14 = v4;
  id v36 = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "__imArrayByFilteringWithBlock:", v35));
  id v16 = [v15 mutableCopy];
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  id v19 = v18;

  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 URI]);
  int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 prefixedURI]);

  if (v22)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v20, kIDSServiceDefaultsURIKey, v22);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A36B4();
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 properties]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dictionaryRepresentation]);

  if (v24)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v20, kIDSServiceDefaultsPropertiesKey, v24);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3630();
  }

  [v19 addObject:v20];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 maskedURI]);
  unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 prefixedURI]);
  [v10 setObject:v19 forKey:v26];

  unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v14 properties]);
  unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 allowedServices]);
  id v29 = [v28 mutableCopy];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
  [v29 removeObject:v31];

  uint64_t v37 = v33;
  __int128 v38 = v10;
  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
  -[IDSDAccount _writeAccountDefaults:force:interestedSubservices:]( self,  "_writeAccountDefaults:force:interestedSubservices:",  v32,  1LL,  v29);

  objc_autoreleasePoolPop(context);
}

- (void)_removePseudonym:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  -[IDSDAccount _removePseudonyms:](self, "_removePseudonyms:", v5, v6);
}

- (void)_removePseudonyms:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  uint64_t v7 = kIDSServiceDefaultsPseudonymsKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSServiceDefaultsPseudonymsKey]);

  id v31 = v8;
  id v9 = [v8 mutableCopy];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v32 = v11;

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  id obj = v12;
  if (!v13) {
    goto LABEL_19;
  }
  id v14 = v13;
  uint64_t v27 = v7;
  unsigned __int8 v28 = self;
  id v29 = v5;
  LOBYTE(self) = 0;
  uint64_t v15 = *(void *)v35;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v35 != v15) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      id v18 = objc_autoreleasePoolPush();
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 maskedURI]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 prefixedURI]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v20]);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1001F25E0;
      v33[3] = &unk_1008FDC38;
      void v33[4] = v17;
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "__imArrayByFilteringWithBlock:", v33));
      id v23 = [v22 count];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 maskedURI]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 prefixedURI]);
      if (v23) {
        [v32 setObject:v22 forKey:v25];
      }
      else {
        [v32 removeObjectForKey:v25];
      }

      if ((self & 1) != 0)
      {
        LODWORD(self) = 1;
      }

      else
      {
        id v26 = [v22 count];
        LODWORD(self) = v26 != [v21 count];
      }

      objc_autoreleasePoolPop(v18);
    }

    id v14 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  }

  while (v14);

  uint64_t v5 = v29;
  if ((_DWORD)self)
  {
    uint64_t v38 = v27;
    __int128 v39 = v32;
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    -[IDSDAccount _writeAccountDefaults:force:](v28, "_writeAccountDefaults:force:", v12, 1LL);
LABEL_19:
  }

  objc_autoreleasePoolPop(v5);
}

- (id)pseudonymForPseudonymURIString:(id)a3
{
  id v4 = a3;
  if ([v4 _appearsToBePseudonymID])
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonyms](self, "pseudonyms", 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URI]);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 prefixedURI]);
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if ((v12 & 1) != 0)
          {
            id v6 = v9;
            goto LABEL_13;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (NSArray)pseudonyms
{
  id v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v26 = objc_autoreleasePoolPush();
  __int128 v37 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsPseudonymsKey]);

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v4;
  id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v43;
    uint64_t v36 = kIDSServiceDefaultsPropertiesKey;
    uint64_t v34 = kIDSServiceDefaultsURIKey;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v5;
        uint64_t v6 = *(void *)(*((void *)&v42 + 1) + 8 * v5);
        context = objc_autoreleasePoolPush();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v6]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v6));
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v35 = v7;
        id v8 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          do
          {
            id v11 = 0LL;
            do
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(v35);
              }
              unsigned __int8 v12 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v11);
              id v13 = objc_autoreleasePoolPush();
              id v14 = objc_alloc(&OBJC_CLASS___IDSPseudonymProperties);
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v36]);
              id v16 = [v14 initWithDictionaryRepresentation:v15];

              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allowedServices]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v37, "service"));
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
              unsigned int v20 = [v17 containsObject:v19];

              if (v20)
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v34]);
                int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v21));

                if (v22 && v16)
                {
                  id v23 = -[IDSPseudonym initWithURI:maskedURI:properties:]( objc_alloc(&OBJC_CLASS___IDSPseudonym),  "initWithURI:maskedURI:properties:",  v22,  v33,  v16);
                  -[NSMutableArray addObject:](v32, "addObject:", v23);
                }
              }

              objc_autoreleasePoolPop(v13);
              id v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v35 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v9);
        }

        objc_autoreleasePoolPop(context);
        uint64_t v5 = v31 + 1;
      }

      while ((id)(v31 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v28);
  }

  objc_autoreleasePoolPop(v26);
  id v24 = -[NSMutableArray copy](v32, "copy");

  return (NSArray *)v24;
}

- (NSDictionary)pseudonymURIMap
{
  id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v27 = objc_autoreleasePoolPush();
  __int128 v39 = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsPseudonymsKey]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v4;
  id v30 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v45;
    uint64_t v38 = kIDSServiceDefaultsPropertiesKey;
    uint64_t v36 = kIDSServiceDefaultsURIKey;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v5;
        uint64_t v6 = *(void *)(*((void *)&v44 + 1) + 8 * v5);
        context = objc_autoreleasePoolPush();
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v6]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v6));
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v37 = v7;
        id v8 = [v37 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v41;
          do
          {
            id v11 = 0LL;
            do
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(v37);
              }
              unsigned __int8 v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v11);
              id v13 = objc_autoreleasePoolPush();
              id v14 = objc_alloc(&OBJC_CLASS___IDSPseudonymProperties);
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v38]);
              id v16 = [v14 initWithDictionaryRepresentation:v15];

              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allowedServices]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v39, "service"));
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
              unsigned int v20 = [v17 containsObject:v19];

              if (v20)
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v36]);
                int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v21));

                if (v22 && v16)
                {
                  id v23 = -[IDSPseudonym initWithURI:maskedURI:properties:]( objc_alloc(&OBJC_CLASS___IDSPseudonym),  "initWithURI:maskedURI:properties:",  v22,  v35,  v16);
                  [v34 addObject:v23];
                }
              }

              objc_autoreleasePoolPop(v13);
              id v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v37 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }

          while (v9);
        }

        id v24 = [v34 copy];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v24, v35);

        objc_autoreleasePoolPop(context);
        uint64_t v5 = v33 + 1;
      }

      while ((id)(v33 + 1) != v30);
      id v30 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v30);
  }

  objc_autoreleasePoolPop(v27);
  id v25 = -[NSMutableDictionary copy](v29, "copy");

  return (NSDictionary *)v25;
}

- (BOOL)updateKTOptInStatus:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  if (+[IMUserDefaults keyTransparencyDropOptInMessageBeforeSending]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyDropOptInMessageBeforeSending")
    && CUTIsInternalInstall())
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Dropping Opt In/Out Message before sending to server because user default is set.",  buf,  2u);
    }

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties identifier](self->_service, "identifier"));
    unsigned int v11 = [v10 isEqualToString:@"com.apple.madrid"];

    if (v11)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            __int128 v17 = -[IDSURI initWithPrefixedURI:]( objc_alloc(&OBJC_CLASS___IDSURI),  "initWithPrefixedURI:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i));
            -[NSMutableArray addObject:](v8, "addObject:", v17);
          }

          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }

        while (v14);
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -8004LL,  0LL));
    id v19 = [[IDSKTOptInResult alloc] initWithSuccess:0 optedInOutURIs:v8 serverSMTByURI:v9 error:v18];
    v6[2](v6, v19);

    unsigned __int8 v20 = 0;
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001F31F0;
    v24[3] = &unk_1008FDC60;
    v24[4] = self;
    id v25 = v6;
    unsigned __int8 v20 = [v21 updateKTOptInStatusForRegistration:v22 withOptInStatus:v4 withCompletion:v24];
  }

  return v20;
}

- (BOOL)updateKTOptInStatusWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if (+[IMUserDefaults keyTransparencyDropOptInMessageBeforeSending]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyDropOptInMessageBeforeSending")
    && CUTIsInternalInstall())
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Dropping Opt In/Out Message before sending to server because user default is set.",  buf,  2u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServiceProperties identifier](self->_service, "identifier"));
    unsigned int v12 = [v11 isEqualToString:@"com.apple.madrid"];

    if (v12)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](self, "vettedAliases"));
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = -[IDSURI initWithPrefixedURI:]( objc_alloc(&OBJC_CLASS___IDSURI),  "initWithPrefixedURI:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i));
            -[NSMutableArray addObject:](v9, "addObject:", v18);
          }

          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }

        while (v15);
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -8004LL,  0LL));
    id v20 = [[IDSKTOptInResult alloc] initWithSuccess:0 optedInOutURIs:v9 serverSMTByURI:v10 error:v19];
    v7[2](v7, v20);

    unsigned __int8 v21 = 0;
  }

  else
  {
    int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registration](self, "registration"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001F3AE8;
    v25[3] = &unk_1008FDC60;
    v25[4] = self;
    __int128 v26 = v7;
    unsigned __int8 v21 = [v22 updateKTOptInStatusForRegistration:v23 withOptInOutRequest:v6 withCompletion:v25];
  }

  return v21;
}

- (void)_handleKTOptInStatusUpdateError:(int64_t)a3
{
  if (a3 == 6005)
  {
    BOOL v4 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryAccount](self, "primaryAccount"));
    uint64_t v5 = v4;
    if (!v4) {
      BOOL v4 = self;
    }
    -[IDSDAccount reIdentify](v4, "reIdentify");
  }

- (void)askPeersToClearCacheWithURIs:(id)a3 fromURI:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending 132 to peers to clear their cache { fromURI: %@ service: %@ peerURIs: %@ }",  buf,  0x20u);
  }

  if ([v8 count])
  {
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 prefixedURI]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _stripFZIDPrefix]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v15));
    LOWORD(v19) = 0;
    LOWORD(v18) = 0;
    LOWORD(v17) = 0;
    -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:]( self,  "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsRespons e:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:loc alDelivery:disallowRefresh:willSendBlock:completionBlock:",  v12,  0LL,  0LL,  v14,  v16,  1LL,  0LL,  v17,  0LL,  &off_100947500,  v18,  0LL,  0LL,  300LL,  v19,  0LL,  &stru_1008FDCA0);
  }

  else
  {
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No peers to send to { fromURI: %@ service: %@ }",  buf,  0x16u);
    }
  }
}

- (void)validateProfile
{
  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount isAdHocAccount](self, "isAdHocAccount"))
    {
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1006A3738(self);
      }
    }

    else if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1006A37BC(self);
      }
    }

    else
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
      uint64_t v5 = kIDSServiceDefaultsProfileKey;
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSServiceDefaultsProfileKey]);

      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
        int v19 = 138412546;
        id v20 = v3;
        __int16 v21 = 2112;
        __int16 v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client request to validate profile info: %@   account: %@",  (uint8_t *)&v19,  0x16u);
      }

      id v8 = (const void *)kIDSServiceDefaultsProfileRegionIDKey;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v3, "objectForKey:", kIDSServiceDefaultsProfileRegionIDKey));
      id v10 = (const void *)kIDSServiceDefaultsProfileBaseNumberKey;
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v3, "objectForKey:", kIDSServiceDefaultsProfileBaseNumberKey));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAppleIDRegistrationCenter sharedInstance]( &OBJC_CLASS___IDSAppleIDRegistrationCenter,  "sharedInstance"));
      unsigned int v13 = [v12 validateRegion:v9 phoneNumber:v11 forRegistration:self->_registrationInfo];

      if (v13)
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v15 = (__CFDictionary *)v14;
        if (v9) {
          CFDictionarySetValue((CFMutableDictionaryRef)v14, v8, v9);
        }
        if (v11) {
          CFDictionarySetValue(v15, v10, v11);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
        if (v16) {
          CFDictionarySetValue(v15, kIDSServiceDefaultsProfileValdationStatusKey, v16);
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
        if (v17) {
          CFDictionarySetValue(v15, kIDSServiceDefaultsProfileValdationErrorCodeKey, v17);
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v15,  v5));
        -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v18);
      }
    }
  }

  else
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A11F0(self);
    }
  }
}

- (void)_refreshRegistration
{
  id v3 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v3, "setShouldBoost:", 0LL);
  BOOL v4 = objc_autoreleasePoolPush();
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1001F48FC;
  id v10 = &unk_1008FBE60;
  uint64_t v5 = v3;
  unsigned int v11 = v5;
  unsigned int v12 = self;
  -[IDSDAccount _broadcastAccountMessageBlock:](self, "_broadcastAccountMessageBlock:", &v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance", v7, v8, v9, v10));
  [v6 updateTopics];

  objc_autoreleasePoolPop(v4);
}

- (void)reregister
{
}

- (void)reIdentify
{
}

- (id)vettedAliases
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsVettedAliasesKey]);

  return v3;
}

- (id)invisibleAliases
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](self, "accountInfo"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kIDSServiceDefaultsInvisibleAliasesKey]);

  return v3;
}

- (void)markAsSelectedAlias:(id)a3
{
}

- (void)markAsUnselectedAlias:(id)a3 withReason:(unsigned __int8)a4
{
}

- (void)markAsUnvettedAlias:(id)a3
{
  id v4 = a3;
  if (-[IDSDAccount currentAliasState:](self, "currentAliasState:") == 3) {
    -[IDSDAccount _setUserIntentState:forAlias:withReason:]( self,  "_setUserIntentState:forAlias:withReason:",  4LL,  v4,  1LL);
  }
  else {
    -[IDSDAccount _stopTrackingUserIntentOfAlias:](self, "_stopTrackingUserIntentOfAlias:", v4);
  }
}

- (void)markAsVettedAlias:(id)a3
{
  id v5 = a3;
  if (-[IDSDAccount currentAliasState:](self, "currentAliasState:", v5) == 4) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  -[IDSDAccount _setUserIntentState:forAlias:withReason:](self, "_setUserIntentState:forAlias:withReason:", v4, v5, 1LL);
}

- (void)markAsWasSelectedAlias:(id)a3
{
}

- (BOOL)wasRecentlySelectedAlias:(id)a3
{
  return -[IDSDAccount currentAliasState:](self, "currentAliasState:", a3) == 4;
}

- (unsigned)currentAliasState:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _userIntentDictForAlias:](self, "_userIntentDictForAlias:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsAliasIntentStateKey]);
  unsigned __int8 v5 = [v4 intValue];

  return v5;
}

- (void)loadAliasUserIntentMetadataIfNeeded
{
  id v2 = -[IDSDAccount _allUserIntentWithDefaultReason:](self, "_allUserIntentWithDefaultReason:", 1LL);
}

- (unsigned)unselectReasonForAlias:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _userIntentDictForAlias:](self, "_userIntentDictForAlias:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsAliasIntentStateKey]);
  unsigned __int8 v5 = [v4 intValue];

  if (v5 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsAliasIntentInfoKey]);
    unsigned __int8 v7 = [v6 intValue];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)_userIntentDictForAlias:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _allUserIntentWithDefaultReason:](self, "_allUserIntentWithDefaultReason:", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSServiceDefaultsAliasIntentStateKey]);
    unsigned int v8 = [v7 intValue];

    if (v8 == 4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSServiceDefaultsAliasIntentTimestampKey]);
      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v10 timeIntervalSinceDate:v9];
        double v12 = v11;
        -[IDSDAccount _maxSelectedButVettedGracePeriod](self, "_maxSelectedButVettedGracePeriod");
        if (v12 >= 0.0 && v12 < v13)
        {
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
            int v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
            int v21 = 138413314;
            __int16 v22 = v18;
            __int16 v23 = 2112;
            __int16 v24 = v19;
            __int16 v25 = 2112;
            id v26 = v4;
            __int16 v27 = 2112;
            __int128 v28 = v10;
            __int16 v29 = 2112;
            __int128 v30 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Grace period is still valid -- returing state {service: %@, loginID: %@, alias: %@, now: %@, then: %@}",  (uint8_t *)&v21,  0x34u);
          }

          id v15 = v6;
          goto LABEL_15;
        }
      }

      -[IDSDAccount _stopTrackingUserIntentOfAlias:](self, "_stopTrackingUserIntentOfAlias:", v4);
      id v15 = 0LL;
LABEL_15:

      goto LABEL_16;
    }

    id v15 = v6;
  }

  else
  {
    id v15 = 0LL;
  }

- (void)_setUserIntentState:(unsigned __int8)a3 forAlias:(id)a4 withReason:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned __int8 v10 = [v9 shouldAutoRegisterAllHandles];

  if ((v10 & 1) != 0
    || ([v8 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias] & 1) != 0)
  {
    goto LABEL_12;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _allUserIntentWithDefaultReason:](self, "_allUserIntentWithDefaultReason:", 0LL));
  id v12 = [v11 mutableCopy];

  if ((_DWORD)v6 == 4)
  {
    v40[0] = kIDSServiceDefaultsAliasIntentStateKey;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 4LL));
    v41[0] = v13;
    v40[1] = kIDSServiceDefaultsAliasIntentTimestampKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v41[1] = v14;
    id v15 = v41;
    uint64_t v16 = v40;
LABEL_8:
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v16,  2LL));

    goto LABEL_9;
  }

  if ((_DWORD)v5 != 1)
  {
    v38[0] = kIDSServiceDefaultsAliasIntentStateKey;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6));
    v39[0] = v13;
    v38[1] = kIDSServiceDefaultsAliasIntentInfoKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5));
    v39[1] = v14;
    id v15 = v39;
    uint64_t v16 = v38;
    goto LABEL_8;
  }

  uint64_t v36 = kIDSServiceDefaultsAliasIntentStateKey;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6));
  id v37 = v13;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
LABEL_9:

  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v8]);
    *(_DWORD *)buf = 138413314;
    __int16 v27 = v20;
    __int16 v28 = 2112;
    __int16 v29 = v21;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Updating user intent state {service: %@, loginID: %@, alias: %@, from: %@, to: %@}",  buf,  0x34u);
  }

  [v12 setObject:v17 forKey:v8];
  uint64_t v24 = kIDSServiceDefaultsAliasIntentKey;
  id v25 = v12;
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v23);

LABEL_12:
}

- (void)_stopTrackingUserIntentOfAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned __int8 v6 = [v5 shouldAutoRegisterAllHandles];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _allUserIntentWithDefaultReason:](self, "_allUserIntentWithDefaultReason:", 0LL));
    id v8 = [v7 mutableCopy];

    [v8 removeObjectForKey:v4];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Stopping user intent tracking {service: %@, loginID: %@, alias: %@}",  buf,  0x20u);
    }

    uint64_t v14 = kIDSServiceDefaultsAliasIntentKey;
    id v15 = v8;
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    -[IDSDAccount writeAccountDefaults:](self, "writeAccountDefaults:", v13);
  }
}

- (id)_allUserIntentWithDefaultReason:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned __int8 v6 = [v5 shouldAutoRegisterAllHandles];

  if ((v6 & 1) != 0) {
    return 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount accountInfo](v4, "accountInfo"));
  uint64_t v9 = kIDSServiceDefaultsAliasIntentKey;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSServiceDefaultsAliasIntentKey]);

  if (!v10)
  {
    double v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v12 = kIDSServiceDefaultsAliasIntentStateKey;
    double v13 = &IMInsertBoolsToXPCDictionary_ptr;
    uint64_t v36 = v9;
    if (v3)
    {
      v54[0] = kIDSServiceDefaultsAliasIntentStateKey;
      v54[1] = kIDSServiceDefaultsAliasIntentInfoKey;
      v55[0] = &off_100947518;
      v55[1] = &off_100947530;
      uint64_t v14 = (_UNKNOWN ***)v55;
      id v15 = v54;
      uint64_t v16 = 2LL;
    }

    else
    {
      uint64_t v52 = kIDSServiceDefaultsAliasIntentStateKey;
      id v53 = &off_100947518;
      uint64_t v14 = &v53;
      id v15 = &v52;
      uint64_t v16 = 1LL;
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v15,  v16));
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount vettedAliases](v4, "vettedAliases"));
    id v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v18);
          }
          -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  v17,  *(void *)(*((void *)&v42 + 1) + 8LL * (void)i));
        }

        id v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }

      while (v20);
    }

    id v35 = (void *)v17;

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v37 = v4;
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _unprefixedURIStringsFromAccountInfo](v4, "_unprefixedURIStringsFromAccountInfo"));
    id v24 = [v23 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v39;
      uint64_t v27 = kIDSServiceDefaultsSentinelAlias;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(v23);
          }
          __int16 v29 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)j);
          if (([v29 isEqualToIgnoringCase:v27] & 1) == 0)
          {
            uint64_t v48 = v12;
            uint64_t v49 = &off_100947548;
            uint64_t v30 = v12;
            id v31 = v13;
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v13[479] dictionaryWithObjects:&v49 forKeys:&v48 count:1]);
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v32, v29);

            double v13 = v31;
            uint64_t v12 = v30;
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }

      while (v25);
    }

    id v10 = -[NSMutableDictionary copy](v11, "copy");
    uint64_t v46 = v36;
    id v47 = v10;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v13[479] dictionaryWithObjects:&v47 forKeys:&v46 count:1]);
    id v4 = v37;
    -[IDSDAccount writeAccountDefaults:](v37, "writeAccountDefaults:", v33);
  }

  __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog GDR](&OBJC_CLASS___IMRGLog, "GDR"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_1006A3840(v4, v34);
  }

  return v10;
}

- (double)_maxSelectedButVettedGracePeriod
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"max-selected-tracking-grace-period"]);

  double v5 = 86400.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v8 = v7;
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8 < 0.0 || v8 > 604800.0)
      {
        double v5 = 86400.0;
        if (v10)
        {
          int v12 = 134217984;
          double v13 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Server bag overrided grace period outside acceptable range -- ignoring {gracePeriod: %f}",  (uint8_t *)&v12,  0xCu);
        }
      }

      else
      {
        if (v10)
        {
          int v12 = 134217984;
          double v13 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Server bag overrided default max selected grace period {gracePeriod: %f}",  (uint8_t *)&v12,  0xCu);
        }

        double v5 = v8;
      }
    }
  }

  return v5;
}

- (void)reportSpamWithMessages:(id)a3 toURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  [v8 reportSpamWithMessages:v7 toURI:v6 registration:self->_registrationInfo];
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  [v18 reportiMessageUnknownSender:v17 messageID:v16 isBlackholed:v10 isJunked:v9 messageServerTimestamp:v15 toURI:v14 registration:self->_registrationInfo];
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccount registrationCenter](self, "registrationCenter"));
  [v13 reportAction:a3 ofTempURI:v12 fromURI:v11 registration:self->_registrationInfo withCompletion:v10];
}

- (void)reportMessage:(id)a3 toURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  [v9 reportMessage:v7 toURI:v6 registration:v8];
}

- (void)reportClientEvent:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  [v9 reportClientEvent:v7 registration:v8 completion:v6];
}

- (id)serviceType
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryServiceName](self, "primaryServiceName"));
  uint64_t v3 = _IDSRegistrationServiceTypeForString(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)pushHandler
{
  return self->_pushHandler;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "System did leave first unlock, checking pending items",  buf,  2u);
  }

  if ((*((_BYTE *)self + 80) & 0x40) != 0)
  {
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "   We had a pending handle request, kicking off",  v13,  2u);
    }

    *((_BYTE *)self + 80) &= ~0x40u;
    if ((*((_BYTE *)self + 80) & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }

  if ((*((_BYTE *)self + 80) & 0x20) != 0)
  {
LABEL_9:
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "   We had a dependent reg request, kicking off",  v12,  2u);
    }

    *((_BYTE *)self + 80) &= ~0x20u;
LABEL_12:
    -[IDSDAccount _updateHandles:](self, "_updateHandles:", 1LL);
    -[IDSDAccount _issueDependentCheck](self, "_issueDependentCheck");
  }

  unsigned int v6 = *((char *)self + 80);
  if ((v6 & 0x80000000) != 0)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "   We had a pending re-identify request, kicking off",  v11,  2u);
    }

    *((_BYTE *)self + 80) &= ~0x80u;
    id v7 = (char *)self + 81;
  }

  else
  {
    id v7 = (char *)self + 81;
    if ((*((_BYTE *)self + 81) & 1) == 0) {
      return;
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "   We had a pending re-register request, kicking off",  v10,  2u);
    }

    *((_BYTE *)self + 80) &= ~0x80u;
  }

  *v7 &= ~1u;
  -[IDSDAccount _reregisterAndReidentify:](self, "_reregisterAndReidentify:", (v6 >> 7) & 1);
}

- (void)addRegistrationListener:(id)a3
{
  id v4 = a3;
  registrationListeners = self->_registrationListeners;
  id v8 = v4;
  if (!registrationListeners)
  {
    unsigned int v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    id v7 = self->_registrationListeners;
    self->_registrationListeners = v6;

    id v4 = v8;
    registrationListeners = self->_registrationListeners;
  }

  -[NSHashTable addObject:](registrationListeners, "addObject:", v4);
}

- (void)removeRegistrationListener:(id)a3
{
  if (!-[NSHashTable count](self->_registrationListeners, "count"))
  {
    registrationListeners = self->_registrationListeners;
    self->_registrationListeners = 0LL;
  }

- (void)_notifyRegistrationListenersAccountDidUpdateRegisteredDevices
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v3 = self->_registrationListeners;
  id v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "account:didUpdateRegisteredDevices:") & 1) != 0)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount registeredDevices](self, "registeredDevices", (void)v10));
          [v8 account:self didUpdateRegisteredDevices:v9];
        }
      }

      id v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }
}

- (void)sendSenderKeyMessageToDestinations:(id)a3 fromURI:(id)a4 guid:(id)a5 messageData:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2048;
    id v39 = [v14 length];
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Asked to send 133 to destinations: %@ fromURI: %@ GUID: %@ messageData size: %ld",  buf,  0x2Au);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 prefixedURI]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _stripFZIDPrefix]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v11));
  uint64_t v21 = IDSGetUUIDData(v13);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1001F6308;
  v29[3] = &unk_1008F7CA0;
  id v30 = v13;
  id v31 = v15;
  id v23 = v15;
  id v24 = v13;
  LOWORD(v27) = 0;
  LOWORD(v26) = 256;
  LOWORD(v25) = 256;
  -[IDSDAccount sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:]( self,  "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse: expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDe livery:disallowRefresh:willSendBlock:completionBlock:",  v17,  0LL,  0LL,  v19,  v20,  1LL,  v14,  v25,  0LL,  &off_100947560,  v26,  0LL,  v22,  300LL,  v27,  0LL,  v29);
}

+ (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 threadContext:(id)a6 sendParameters:(id)a7
{
  *(void *)&__int128 v155 = a5;
  *((void *)&v155 + 1) = a4;
  id v156 = a3;
  id v9 = a6;
  id v169 = a7;
  uint64_t v161 = v9;
  __int128 v168 = (void *)objc_claimAutoreleasedReturnValue([v9 dependentRegistrations]);
  __int16 v176 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultPairedDependentRegistrations]);
  v159 = (void *)objc_claimAutoreleasedReturnValue([v9 appleIDPrimaryDependentRegistrations]);
  __int128 v172 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceIdentifier]);
  v158 = (void *)objc_claimAutoreleasedReturnValue([v9 accountDescription]);
  unsigned int v160 = [v9 serviceAllowLocalDelivery];
  unsigned int v157 = [v9 serviceAllowWiProxDelivery];
  if ([v9 serviceAllowLiveMessageDelivery])
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceIdentifier]);
    else {
      unsigned int v163 = sub_1002CB100() ^ 1;
    }
  }

  else
  {
    unsigned int v163 = 0;
  }

  if (v155 == 0)
  {
    uint64_t v143 = OSLogHandleForIDSCategory("Warning");
    v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v199 = (uint64_t)v156;
      _os_log_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_ERROR,  "No output arrays specified for _splitDestinations %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v145))
    {
      _IDSWarnV(@"IDSFoundation", @"No output arrays specified for _splitDestinations %@");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"No output arrays specified for _splitDestinations %@");
      _IDSLogTransport(@"Warning", @"IDS", @"No output arrays specified for _splitDestinations %@");
    }
  }

  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSDAccount");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v199 = (uint64_t)a1;
      __int16 v200 = 2112;
      id v201 = v156;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ splitting destinations %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v13) && _IDSShouldLog(1LL, @"IDSDAccount"))
    {
      id v146 = a1;
      v151 = v156;
      _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"%@ splitting destinations %@");
    }

    __int128 v165 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v166 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v196 = 0u;
    __int128 v197 = 0u;
    __int128 v194 = 0u;
    __int128 v195 = 0u;
    id obj = v156;
    id v175 = [obj countByEnumeratingWithState:&v194 objects:v207 count:16];
    if (v175)
    {
      uint64_t v174 = *(void *)v195;
      uint64_t v177 = IDSDefaultPairedDevice;
      uint64_t v171 = IDSDevicePropertyPushToken;
      uint64_t v170 = IDSDevicePropertyIdentities;
      uint64_t v180 = IDSDevicePropertyPrivateDeviceData;
      uint64_t v181 = IDSDevicePropertyIdentifierOverride;
      uint64_t v179 = IDSPrivateDeviceDataUniqueID;
      __int128 v167 = (void *)IDSDeviceDefaultPairedDeviceUniqueID;
      uint64_t v164 = IDSDevicePairedDeviceID;
      do
      {
        v178 = 0LL;
        do
        {
          if (*(void *)v195 != v174) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(id *)(*((void *)&v194 + 1) + 8LL * (void)v178);
          uint64_t v15 = OSLogHandleForIDSCategory("IDSDAccount");
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v199 = (uint64_t)v14;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - looking up device for dest %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v17)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            id v146 = v14;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - looking up device for dest %@");
          }

          LODWORD(v18) = objc_msgSend(v14, "isEqualToString:", v177, v146, v151, v153, v154);
          if ((_DWORD)v18)
          {
            id v19 = v176;
            if (!v176)
            {
              __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"bt-id",  v167,  v164,  0LL));
              -[NSMutableDictionary setObject:forKey:](v165, "setObject:forKey:", v59, v177);

              goto LABEL_188;
            }

            id v20 = v19;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v171]);
            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v170]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "__imArrayByApplyingBlock:", &stru_1008FFDC0));

            uint64_t v24 = _IDSPrefersPhoneNumbersForServiceIdentifier(v172);
            uint64_t v25 = (void *)_IDSCopyCallerID(0LL, v23, 0LL, 0LL, v24);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_URIFromFZIDType:", objc_msgSend(v25, "_FZBestGuessFZIDType")));
            uint64_t v27 = (void *)_IDSCopyIDForTokenWithURI(v21, v26);

            uint64_t v28 = OSLogHandleForIDSCategory("IDSDAccount");
            __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v199 = (uint64_t)v27;
              __int16 v200 = 2112;
              id v201 = v176;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Resolved destination %@ from default paired device constant device %@.",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v30)
              && _IDSShouldLog(1LL, @"IDSDAccount"))
            {
              uint64_t v147 = v27;
              v151 = v20;
              _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Resolved destination %@ from default paired device constant device %@.");
            }
          }

          else
          {
            uint64_t v27 = v14;
          }

          if (objc_msgSend(v27, "hasPrefix:", @"device:", v147))
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue([v27 _stripFZIDPrefix]);
            uint64_t v32 = OSLogHandleForIDSCategory("IDSDAccount");
            id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v199 = (uint64_t)v31;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "(Class) Destination device uniqueID: %@",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v34)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v148 = v31;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Class) Destination device uniqueID: %@");
            }

            id v35 = v176;
            if (v176)
            {
              id v36 = v35;
              id v37 = (id)objc_claimAutoreleasedReturnValue([v35 _stringForKey:v181]);
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v180]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v38 _stringForKey:v179]);

              uint64_t v39 = OSLogHandleForIDSCategory("IDSDAccount");
              __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v199 = (uint64_t)v37;
                __int16 v200 = 2112;
                id v201 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "(Class) Default paired device uniqueID override %@   uniqueID %@",  buf,  0x16u);
              }

              if (os_log_shim_legacy_logging_enabled(v41)
                && _IDSShouldLog(2LL, @"IDSDAccount"))
              {
                id v148 = v37;
                v151 = v18;
                _IDSLogV( 2LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Class) Default paired device uniqueID override %@   uniqueID %@");
              }

              if ((objc_msgSend(v31, "isEqualToIgnoringCase:", v37, v148) & 1) == 0
                && ![v31 isEqualToIgnoringCase:v18]
                || [v169 sessionForceInternetInvitation])
              {

                goto LABEL_48;
              }

              LOBYTE(v18) = 1;
LABEL_78:

              id v60 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v171]);
              __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v170]);
              unsigned __int8 v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "__imArrayByApplyingBlock:", &stru_1008FFDE0));

              uint64_t v63 = _IDSPrefersPhoneNumbersForServiceIdentifier(v172);
              uint64_t v64 = (void *)_IDSCopyCallerID(0LL, v62, 0LL, 0LL, v63);
              char v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "_URIFromFZIDType:", objc_msgSend(v64, "_FZBestGuessFZIDType")));
              uint64_t v66 = _IDSCopyIDForTokenWithURI(v60, v65);

              uint64_t v67 = OSLogHandleForIDSCategory("IDSDAccount");
              __int128 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v199 = v66;
                __int16 v200 = 2112;
                id v201 = v36;
                _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEBUG,  "(Class) Resolved destination %@ from default paired device constant device %@.",  buf,  0x16u);
              }

              if (os_log_shim_legacy_logging_enabled(v69)
                && _IDSShouldLog(1LL, @"IDSDAccount"))
              {
                id v148 = (id)v66;
                v151 = v36;
                _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Class) Resolved destination %@ from default paired device constant device %@.");
              }

              id v37 = v36;
              uint64_t v27 = (void *)v66;
            }

            else
            {
LABEL_48:
              id v42 = v168;
              __int128 v190 = 0u;
              __int128 v191 = 0u;
              __int128 v192 = 0u;
              __int128 v193 = 0u;
              id v37 = v42;
              id v43 = [v37 countByEnumeratingWithState:&v190 objects:v206 count:16];
              if (v43)
              {
                uint64_t v44 = *(void *)v191;
LABEL_50:
                uint64_t v45 = 0LL;
                while (1)
                {
                  if (*(void *)v191 != v44) {
                    objc_enumerationMutation(v37);
                  }
                  uint64_t v46 = *(void **)(*((void *)&v190 + 1) + 8 * v45);
                  id v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "_stringForKey:", v181, v148));
                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v180]);
                  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 _stringForKey:v179]);

                  uint64_t v50 = OSLogHandleForIDSCategory("IDSDAccount");
                  uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v199 = (uint64_t)v47;
                    __int16 v200 = 2112;
                    id v201 = v49;
                    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "(Class) Device uniqueID override %@   uniqueID %@",  buf,  0x16u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v52)
                    && _IDSShouldLog(0LL, @"IDSDAccount"))
                  {
                    v149 = v47;
                    v151 = v49;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Class) Device uniqueID override %@   uniqueID %@");
                  }

                  if ((objc_msgSend(v47, "isEqualToIgnoringCase:", v31, v149) & 1) != 0
                    || [v49 isEqualToIgnoringCase:v31])
                  {
                    break;
                  }

                  if (v43 == (id)++v45)
                  {
                    id v43 = [v37 countByEnumeratingWithState:&v190 objects:v206 count:16];
                    if (v43) {
                      goto LABEL_50;
                    }
                    goto LABEL_62;
                  }
                }

                id v36 = v46;
                uint64_t v53 = OSLogHandleForIDSCategory("IDSDAccount");
                __int16 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v199 = (uint64_t)v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "(Class) Found matching device %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v55)
                  && _IDSShouldLog(0LL, @"IDSDAccount"))
                {
                  id v148 = v36;
                  _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"(Class) Found matching device %@");
                }

                if (v36)
                {
                  LOBYTE(v18) = 0;
                  goto LABEL_78;
                }
              }

              else
              {
LABEL_62:
              }

              uint64_t v56 = OSLogHandleForIDSCategory("IDSDAccount");
              int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v199 = (uint64_t)v31;
                _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "(Class) Didn't find matching device for uniqueID %@",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v58)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                id v148 = v31;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Class) Didn't find matching device for uniqueID %@");
              }

              LOBYTE(v18) = 0;
            }
          }

          id v189 = 0LL;
          __int128 v70 = (void *)objc_claimAutoreleasedReturnValue([v27 _stripPotentialTokenURIWithToken:&v189]);
          id v71 = v189;
          uint64_t v72 = OSLogHandleForIDSCategory("IDSDAccount");
          __int16 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v199 = (uint64_t)v71;
            __int16 v200 = 2112;
            id v201 = v70;
            _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - token %@ and uri %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v74)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            id v146 = v71;
            v151 = v70;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - token %@ and uri %@");
          }

          if (!v71 || !v70)
          {
            uint64_t v77 = OSLogHandleForIDSCategory("Warning");
            uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v199 = (uint64_t)v27;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Malformed destination %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v79))
            {
              _IDSWarnV(@"IDSFoundation", @"Malformed destination %@");
              _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"Malformed destination %@");
              id v146 = v27;
              _IDSLogTransport(@"Warning", @"IDS", @"Malformed destination %@");
            }

            goto LABEL_187;
          }

          char v188 = 0;
          if ([v70 localizedCaseInsensitiveContainsString:@"__localURI__"])
          {
            id v75 = v167;
            LOBYTE(v18) = 1;
            id v76 = v75;
          }

          else
          {
            uint64_t v80 = OSLogHandleForIDSCategory("IDSDAccount");
            __int16 v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              id v82 = (void *)objc_claimAutoreleasedReturnValue([v161 serviceIdentifier]);
              uint64_t v83 = IDSLoggableDescriptionForHandleOnService(v70, v82);
              id v84 = (id)objc_claimAutoreleasedReturnValue(v83);
              uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v161 serviceIdentifier]);
              uint64_t v86 = IDSLoggableDescriptionForTokenOnService(v71, v85);
              id v87 = (id)objc_claimAutoreleasedReturnValue(v86);
              *(_DWORD *)buf = 138412546;
              uint64_t v199 = (uint64_t)v84;
              __int16 v200 = 2112;
              id v201 = v87;
              _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Finding device matching URI %@ and token %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v88)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v89 = (void *)objc_claimAutoreleasedReturnValue([v161 serviceIdentifier]);
              uint64_t v90 = IDSLoggableDescriptionForHandleOnService(v70, v89);
              __int128 v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
              __int128 v92 = (void *)objc_claimAutoreleasedReturnValue([v161 serviceIdentifier]);
              uint64_t v93 = IDSLoggableDescriptionForTokenOnService(v71, v92);
              id v146 = v91;
              v151 = (void *)objc_claimAutoreleasedReturnValue(v93);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Finding device matching URI %@ and token %@");
            }

            id v186 = 0LL;
            id v187 = 0LL;
            objc_msgSend( a1,  "dependentRegistration:findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:",  v168,  &v187,  &v186,  v70,  v71,  &v188,  v146);
            id v75 = v187;
            id v76 = v186;
            uint64_t v94 = OSLogHandleForIDSCategory("IDSDAccount");
            __int128 v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v199 = (uint64_t)v75;
              __int16 v200 = 2112;
              id v201 = v76;
              _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "Found deviceID %@ and btID %@ after first try",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v96)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v146 = v75;
              v151 = v76;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Found deviceID %@ and btID %@ after first try");
            }
          }

          if (v75)
          {
            id v97 = v76;
          }

          else
          {
            uint64_t v98 = OSLogHandleForIDSCategory("IDSDAccount");
            __int128 v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v199 = (uint64_t)v158;
              _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "Did not find deviceID using account %@",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v100)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v146 = v158;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Did not find deviceID using account %@");
            }

            id v184 = v76;
            id v185 = 0LL;
            objc_msgSend( a1,  "dependentRegistration:findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:",  v159,  &v185,  &v184,  v70,  v71,  &v188,  v146);
            id v75 = v185;
            id v97 = v184;

            uint64_t v101 = OSLogHandleForIDSCategory("IDSDAccount");
            __int128 v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v199 = (uint64_t)v75;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Found deviceID %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v103)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v146 = v75;
              _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Found deviceID %@");
            }
          }

          uint64_t v104 = OSLogHandleForIDSCategory("IDSDAccount");
          __int128 v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v199 = (uint64_t)v75;
            _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - found device id %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v106)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            id v146 = v75;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - found device id %@");
          }

          int v107 = _os_feature_enabled_impl("IDS", "LiveDeliveryOverPush");
          if (v75) {
            int v108 = v107;
          }
          else {
            int v108 = 0;
          }
          if (v108 == 1 && ([v169 liveMessageDelivery] & v163) == 1 && v188)
          {
            v109 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
            id v110 = [v109 copyPeerWithID:v75];

            if (([v110 isCloudConnected] & 1) == 0)
            {
              id v111 = [v169 setLiveMessageDelivery:0];
              uint64_t v113 = im_primary_queue(v111, v112);
              unsigned int v114 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v113);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_1002CB210;
              block[3] = &unk_1008F6010;
              id v183 = v110;
              dispatch_async(v114, block);

              id v115 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
              [v115 startGlobalLinkForDevice:v75];

              uint64_t v116 = OSLogHandleForIDSCategory("IDSDAccount");
              double v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v199 = (uint64_t)v75;
                _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "Using push instead of Live Delivery while GL warms for device id %@",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v118)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                id v146 = v75;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Using push instead of Live Delivery while GL warms for device id %@");
              }
            }
          }

          if (qword_1009C0A58 != -1) {
            dispatch_once(&qword_1009C0A58, &stru_1008FFE00);
          }
          unsigned int v119 = v163;
          if (!v75) {
            unsigned int v119 = 0;
          }
          if (v119 == 1 && v97)
          {
            if (!v188)
            {
              uint64_t v120 = OSLogHandleForIDSCategory("IDSDAccount");
              v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
              if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v199 = (uint64_t)v75;
                __int16 v200 = 2112;
                id v201 = v70;
                _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}",  buf,  0x16u);
              }

              if (os_log_shim_legacy_logging_enabled(v122)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                id v146 = v75;
                v151 = v70;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}");
              }

+ (void)_sendLocallyWithSendParameters:(id)a3 service:(id)a4 uriToLocalDestination:(id)a5 data:(id)a6 protobuf:(id)a7 threadContext:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  id v15 = a3;
  id v130 = a4;
  id v133 = a5;
  id v134 = a6;
  id v132 = a7;
  id v16 = a8;
  id v129 = a9;
  id v120 = a10;
  uint64_t v135 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subService]);
  if ([v17 length]) {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v135 subService]);
  }
  else {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v135 servicePushTopic]);
  }
  id v19 = (void *)v18;

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 resourcePath]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 dataToEncrypt]);
  __int16 v22 = (char *)[v21 length];
  id v23 = [v134 length];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v132 data]);
  unint64_t v25 = (unint64_t)[v24 length];

  if (v20)
  {
    [v15 setCommand:&off_100947920];
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = &v22[(void)v23 + v25];
  }

  uint64_t v27 = v19;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 metricReportIdentifier]);

  uint64_t v131 = v27;
  if (v28)
  {
    __int16 v29 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v15 metricReportIdentifier]);
    uint64_t v131 = -[NSString initWithFormat:](v29, "initWithFormat:", @"%@-%@", v27, v30);
  }

  uint64_t v31 = OSLogHandleForIDSCategory("GUIDTRACE");
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 messageUUID]);
    uint64_t v34 = JWUUIDPushObjectToString(v33);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v27;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "OUTGOING-LOCAL_SEND:%@ SERVICE:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v36) && _IDSShouldLog(0LL, @"GUIDTRACE"))
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v15 messageUUID]);
    uint64_t v38 = JWUUIDPushObjectToString(v37);
    uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(v38);
    id v96 = v27;
    _IDSLogV(0LL, @"IDSFoundation", @"GUIDTRACE", @"OUTGOING-LOCAL_SEND:%@ SERVICE:%@");
  }

  uint64_t v39 = OSLogHandleForIDSCategory("IDSDAccount");
  __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v15 messageUUID]);
    *(_WORD *)&_BYTE buf[12] = 2048;
    id v42 = @"YES";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v41;
    if (!v20) {
      id v42 = @"NO";
    }
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    __int128 v166 = (uint64_t (*)(uint64_t, uint64_t))v42;
    *(_WORD *)__int128 v167 = 2112;
    *(void *)&v167[2] = v27;
    *(_WORD *)&v167[10] = 2112;
    *(void *)&v167[12] = v133;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v43) && _IDSShouldLog(2LL, @"IDSDAccount"))
  {
    BOOL v44 = v20 == 0LL;
    uint64_t v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageUUID", v93, v96));
    uint64_t v46 = (void *)v45;
    id v47 = @"YES";
    if (v44) {
      id v47 = @"NO";
    }
    uint64_t v100 = v27;
    id v103 = v133;
    id v96 = v26;
    uint64_t v98 = v47;
    uint64_t v93 = (void *)v45;
    _IDSLogV( 2LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]");
  }

  if (objc_msgSend(v135, "accountType", v93, v96, v98, v100, v103))
  {
    uint64_t v48 = _IDSCopyMyPhoneNumbers(0LL);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v15 fromID]);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 _stripFZIDPrefix]);
    [v49 containsObject:v51];
  }

  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v133 allValues]);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "__imArrayByApplyingBlock:", &stru_1008FFE20));
  uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v53));

  double v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v156[0] = 0LL;
  v156[1] = v156;
  v156[2] = 0x2020000000LL;
  v156[3] = 0LL;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  __int128 v166 = sub_1002CC060;
  *(void *)__int128 v167 = sub_1002CC070;
  *(void *)&v167[8] = 0LL;
  unsigned int v54 = [v135 serviceAdHocType];
  BOOL v55 = v54 == 5 || v54 == 2;
  if (v54 == 2
    || v54 == 5
    || ([v15 localDelivery] & 1) != 0
    || [v15 requireLocalWiFi])
  {
    uint64_t v56 = OSLogHandleForTransportCategory("IDSDAccount");
    int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      else {
        uint64_t v58 = @"NO";
      }
      if (v55) {
        __int128 v59 = @"YES";
      }
      else {
        __int128 v59 = @"NO";
      }
      unsigned int v60 = [v15 requireLocalWiFi];
      uint64_t v61 = objc_claimAutoreleasedReturnValue([v15 messageUUID]);
      unsigned __int8 v62 = (void *)v61;
      if (v60) {
        uint64_t v63 = @"YES";
      }
      else {
        uint64_t v63 = @"NO";
      }
      *(_DWORD *)unsigned int v157 = 138413058;
      v158 = v58;
      __int16 v159 = 2112;
      unsigned int v160 = v59;
      __int16 v161 = 2112;
      __int128 v162 = v63;
      __int16 v163 = 2112;
      uint64_t v164 = v61;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to fallback forcedLocal %@  localType %@ requireLocalWiFi %@ message %@",  v157,  0x2Au);
    }

    uint64_t v65 = os_log_shim_legacy_logging_enabled(v64);
    uint64_t v66 = [v15 localDelivery] ? @"YES" : @"NO";
    uint64_t v67 = v55 ? @"YES" : @"NO";
    unsigned int v68 = [v15 requireLocalWiFi];
    uint64_t v69 = objc_claimAutoreleasedReturnValue([v15 messageUUID]);
    __int128 v70 = (void *)v69;
    id v71 = v68 ? @"YES" : @"NO";
    __int128 v99 = v71;
    uint64_t v101 = v69;
    uint64_t v94 = v66;
    id v97 = v67;
    _IDSLogTransport( @"IDSDAccount",  @"IDS",  @"Ignoring request to fallback forcedLocal %@  localType %@ requireLocalWiFi %@ message %@");

    if (!_IDSShouldLog(0LL, @"IDSDAccount"))
    {
LABEL_62:
      uint64_t v125 = 0LL;
      goto LABEL_63;
    }

    else {
      uint64_t v72 = @"NO";
    }
    unsigned int v73 = [v15 requireLocalWiFi];
    uint64_t v74 = objc_claimAutoreleasedReturnValue([v15 messageUUID]);
    id v75 = (void *)v74;
    if (v73) {
      id v76 = @"YES";
    }
    else {
      id v76 = @"NO";
    }
    __int128 v99 = (__CFString *)v76;
    uint64_t v101 = v74;
    uint64_t v94 = (__CFString *)v72;
    id v97 = v67;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Ignoring request to fallback forcedLocal %@  localType %@ requireLocalWiFi %@ message %@");
    uint64_t v125 = 0LL;
  }

  else
  {
    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472LL;
    v144[2] = sub_1002CC078;
    v144[3] = &unk_1008FFE70;
    id v145 = v15;
    id v152 = v120;
    id v153 = buf;
    id v146 = v117;
    id v147 = v118;
    v154 = v156;
    id v148 = v131;
    __int128 v155 = v26;
    id v149 = v130;
    id v150 = v134;
    id v151 = v132;
    uint64_t v125 = objc_retainBlock(v144);

    id v75 = v145;
  }

LABEL_63:
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataToEncrypt", v94, v97, v99, v101));

  if (v77)
  {
    if (v134)
    {
      uint64_t v79 = OSLogHandleForIDSCategory("Warning");
      uint64_t v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v157 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_ERROR,  "Attempt to send both DataToEncrypt and Data, dropping data",  v157,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v81))
      {
        _IDSWarnV(@"IDSFoundation", @"Attempt to send both DataToEncrypt and Data, dropping data");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Attempt to send both DataToEncrypt and Data, dropping data");
        *(void *)&double v78 = _IDSLogTransport( @"Warning",  @"IDS",  @"Attempt to send both DataToEncrypt and Data, dropping data").n128_u64[0];
      }
    }

    uint64_t v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataToEncrypt", v78));

    id v134 = (id)v82;
  }

  uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
  uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v15 resourcePath]);
  id v126 = (void *)objc_claimAutoreleasedReturnValue([v15 resourceMetadata]);
  id v116 = [v15 priority];
  unsigned int v115 = [v135 dataProtectionClass];
  unsigned __int8 v114 = [v15 nonWaking];
  unsigned __int8 v113 = [v15 nonCloudWaking];
  unsigned __int8 v112 = [v15 requireBluetooth];
  unsigned __int8 v111 = [v15 requireLocalWiFi];
  v124 = (void *)objc_claimAutoreleasedReturnValue([v15 queueOneIdentifier]);
  int v123 = (void *)objc_claimAutoreleasedReturnValue([v15 expirationDate]);
  unsigned __int8 v110 = [v15 enforceRemoteTimeouts];
  unsigned __int8 v109 = [v15 expectsPeerResponse];
  unsigned __int8 v108 = [v15 wantsAppAck];
  unsigned __int8 v107 = [v15 compressPayload];
  unsigned __int8 v106 = [v15 compressed];
  uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue([v15 peerResponseIdentifier]);
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  id v84 = (void *)objc_claimAutoreleasedReturnValue([v15 command]);
  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue([v15 fromID]);
  uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v15 localDestinationDeviceUUID]);
  unsigned __int8 v87 = [v15 bypassDuet];
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([v15 duetIdentifiersOverride]);
  id v89 = (void *)objc_claimAutoreleasedReturnValue([v15 messageType]);
  id v90 = [v89 longLongValue];
  v136[0] = _NSConcreteStackBlock;
  v136[1] = 3221225472LL;
  v136[2] = sub_1002CD080;
  v136[3] = &unk_1008FFE98;
  id v105 = v15;
  id v137 = v105;
  __int128 v91 = v27;
  uint64_t v138 = v91;
  id v119 = v118;
  id v139 = v119;
  id v92 = v117;
  id v140 = v92;
  uint64_t v142 = buf;
  uint64_t v143 = v156;
  id v121 = v120;
  id v141 = v121;
  LOBYTE(v104) = v87;
  BYTE4(v102) = v106;
  BYTE3(v102) = v107;
  BYTE2(v102) = v108;
  BYTE1(v102) = v109;
  LOBYTE(v102) = v110;
  HIBYTE(v95) = v111;
  BYTE6(v95) = v112;
  BYTE5(v95) = v113;
  BYTE4(v95) = v114;
  LODWORD(v95) = v115;
  objc_msgSend( v128,  "sendData:service:protobuf:resourcePath:resourceMetadata:priority:dataProtectionClass:nonWaking:nonCloudWaking:requir eBluetooth:requireLocalWiFi:queueOneIdentifier:expirationDate:enforceRemoteTimeouts:expectsPeerResponse:wantsAppAck: compressPayload:compressed:peerResponseIdentifier:messageID:topic:awdTopic:command:fromID:uriToDeviceID:localDeviceD estinationDeviceUUID:bypassDuet:duetIdentifiersOverride:messageType:fallbackBlock:progressBlock:completionBlock:",  v134,  v130,  v132,  v127,  v126,  v116,  v95,  v124,  v123,  v102,  v122,  v83,  v91,  v131,  v84,  v85,  v133,  v86,  v104,  v88,  v90,  v125,  v129,  v136);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v156, 8);
}

+ (void)sendMessageWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v244 = a4;
  id v14 = a5;
  id v245 = a6;
  id v242 = a7;
  id v256 = a8;
  unsigned int v240 = [v14 accountType];
  v258 = v14;
  v257 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceIdentifier]);
  v243 = (void *)objc_claimAutoreleasedReturnValue([v14 accountDisplayName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dependentRegistrations]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 appleIDPrimaryDependentRegistrations]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryRegistrationDSHandle]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryRegistrationURIs]);
  unsigned int v254 = [v14 serviceIsDSBased];
  v247 = (void *)objc_claimAutoreleasedReturnValue([v14 aliasStrings]);
  v250 = (void *)objc_claimAutoreleasedReturnValue([v14 servicePushTopic]);
  unsigned int v19 = [v14 shouldIncludeDefaultDevice];
  unsigned int v20 = [v14 serviceWantsReflectedSend];
  unsigned __int8 v235 = [v14 serviceAllowProxyDelivery];
  unsigned int v21 = [v14 serviceUseiMessageCallerID];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v13 command]);
  else {
    unsigned int v23 = v20;
  }
  if (v23 != 1 || ([v13 isProxiedOutgoingMessage] & 1) != 0)
  {

LABEL_7:
    int v236 = 0;
    goto LABEL_8;
  }

  if (!v19) {
    goto LABEL_7;
  }
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v13 destinations]);
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 destinationURIs]);
  id v38 = [v37 mutableCopy];

  id v39 = IDSDefaultPairedDevice;
  [v38 addObject:v39];
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithStrings:]( &OBJC_CLASS___IDSDestination,  "destinationWithStrings:",  v38));
  [v13 setDestinations:v40];

  uint64_t v41 = OSLogHandleForIDSCategory("IDSDAccount");
  id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    id v43 = (id)objc_claimAutoreleasedReturnValue([v13 destinations]);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v43;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Adding local device as a destination for this message, Destinations For This Message Are Now %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v44) && _IDSShouldLog(0LL, @"IDSDAccount"))
  {
    __int128 v196 = (void *)objc_claimAutoreleasedReturnValue([v13 destinations]);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Adding local device as a destination for this message, Destinations For This Message Are Now %@");
  }

  int v236 = 1;
LABEL_8:
  if (v240 == 2)
  {
    uint64_t v24 = OSLogHandleForTransportCategory("Messaging");
    unint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Sending via account that's type Local -- forcing local delivery.",  buf,  2u);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        _IDSLogTransport( @"Messaging",  @"IDS",  @"Sending via account that's type Local -- forcing local delivery.");
        if (_IDSShouldLog(0LL, @"Messaging")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Messaging",  @"Sending via account that's type Local -- forcing local delivery.");
        }
      }
    }

    objc_msgSend(v13, "setLocalDelivery:", 1, v196);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destinations", v196));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 destinationURIs]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allObjects]);
  v300[0] = _NSConcreteStackBlock;
  v300[1] = 3221225472LL;
  v300[2] = sub_1002CF844;
  v300[3] = &unk_1008FFEC0;
  id v305 = a1;
  id v237 = v15;
  id v301 = v237;
  id v238 = v16;
  id v302 = v238;
  id v246 = v17;
  id v303 = v246;
  id v239 = v18;
  id v304 = v239;
  v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "__imArrayByApplyingBlock:", v300));

  if (v21)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v13 originalfromID]);
    BOOL v32 = [v31 length] == 0;

    if (v32)
    {
      uint64_t v45 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v243;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Service would like to use iMessage callerID for messages, Attempting to use %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v47)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        id v197 = v243;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Service would like to use iMessage callerID for messages, Attempting to use %@");
      }

      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "_stripFZIDPrefix", v197));
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v246 _stripFZIDPrefix]);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v258 pseudonyms]);
      uint64_t v51 = (void *)_IDSCopyCallerIDWithPseudonyms(v48, v247, v50, v49, v254, 1LL);
      [v13 setFromID:v51];
    }

    else
    {
      uint64_t v33 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Service would like to use iMessage callerID for messages however they specified their own FromID, so we will a ttempt to use that",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v35)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Service would like to use iMessage callerID for messages however they specified their own FromID, so we will attempt to use that");
      }
    }
  }

  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v13 fromID]);
  BOOL v53 = v52 == 0LL;

  if (v53)
  {
    unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v246 _stripFZIDPrefix]);
    uint64_t v55 = _IDSPrefersPhoneNumbersForServiceIdentifier(v257);
    uint64_t v56 = (void *)_IDSCopyCallerID(0LL, v247, v54, v254, v55);
    [v13 setFromID:v56];
  }

  int v57 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v252 firstObject]);
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v58,  v257));
  unsigned int v60 = (void *)objc_claimAutoreleasedReturnValue([v13 fromID]);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v60 _bestGuessURI]);
  unsigned __int8 v62 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v61,  v257));
  v251 = (void *)objc_claimAutoreleasedReturnValue([v57 senderCorrelationIdentifierForURI:v59 fromURI:v62 service:v257]);

  if (v251) {
    [v13 setDestinationCorrelationIdentifier:v251];
  }
  uint64_t v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 data]);
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v13 protobuf]);

  if (v64)
  {
    uint64_t v65 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v13 protobuf]);
    v255 = -[IDSProtobuf initWithDictionary:](v65, "initWithDictionary:", v66);
  }

  else
  {
    v255 = 0LL;
  }

  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v13 message]);

  if (v67)
  {
    unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue([v13 message]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKey:IDSMessageResourceTransferURLKey]);
    if (v69)
    {

      __int128 v70 = (__CFString *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:IDSMessageResourceTransferMetadataKey]);
      uint64_t v71 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v70;
        _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Sending Resource at path %@ with metadata %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v73)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        id v197 = v69;
        uint64_t v199 = v70;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending Resource at path %@ with metadata %@");
      }

      objc_msgSend(v13, "setResourcePath:", v69, v197, v199);
      [v13 setResourceMetadata:v70];
      uint64_t v63 = 0LL;
    }

    else
    {
      uint64_t v74 = JWEncodeDictionary(v68);
      __int128 v70 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v74);

      uint64_t v63 = v70;
    }
  }

  if (!v63)
  {
    uint64_t v81 = v255;
    if (!v255)
    {
      v249 = 0LL;
      goto LABEL_87;
    }

    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v255, "data"));
    id v83 = [v82 length];

    if ([v13 compressPayload])
    {
      id v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v255, "data"));
      v249 = [v84 _FTCopyOptionallyGzippedData];

      uint64_t v85 = (__CFString *)[v249 length];
      if (v83 > v85)
      {
        uint64_t v86 = OSLogHandleForIDSCategory("IDSDAccount");
        unsigned __int8 v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = (_DWORD)v83;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = (_DWORD)v85;
          _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEBUG,  "Compressed protobuf data from: %u  to: %u",  buf,  0xEu);
        }

        if (os_log_shim_legacy_logging_enabled(v88)
          && _IDSShouldLog(1LL, @"IDSDAccount"))
        {
          id v197 = v83;
          uint64_t v199 = v85;
          _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Compressed protobuf data from: %u  to: %u");
        }

        id v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v255, "data", v197, v199));
        -[IDSProtobuf setUncompressedData:](v255, "setUncompressedData:", v89);

        -[IDSProtobuf setData:](v255, "setData:", v249);
        uint64_t v63 = 0LL;
        uint64_t v80 = 1LL;
        goto LABEL_86;
      }
    }

    else
    {
      v249 = 0LL;
      uint64_t v85 = 0LL;
    }

    uint64_t v93 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = (_DWORD)v83;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = (_DWORD)v85;
      _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEBUG,  "Use uncompressed protobuf data (original: %u compressed: %u)",  buf,  0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v95) && _IDSShouldLog(1LL, @"IDSDAccount"))
    {
      id v197 = v83;
      uint64_t v199 = v85;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Use uncompressed protobuf data (original: %u compressed: %u)");
    }

    uint64_t v80 = 0LL;
    uint64_t v63 = 0LL;
    goto LABEL_86;
  }

  id v75 = -[__CFString length](v63, "length");
  if (![v13 compressPayload])
  {
    v249 = 0LL;
    id v76 = 0LL;
    goto LABEL_72;
  }

  v249 = -[__CFString _FTCopyOptionallyGzippedData](v63, "_FTCopyOptionallyGzippedData");
  id v76 = (__CFString *)[v249 length];
  if (v75 <= v76)
  {
LABEL_72:
    uint64_t v90 = OSLogHandleForIDSCategory("IDSDAccount");
    __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = (_DWORD)v75;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = (_DWORD)v76;
      _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEBUG,  "Use uncompressed message data (original: %u compressed: %u)",  buf,  0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v92) && _IDSShouldLog(1LL, @"IDSDAccount"))
    {
      id v197 = v75;
      uint64_t v199 = v76;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Use uncompressed message data (original: %u compressed: %u)");
    }

    uint64_t v80 = 0LL;
    goto LABEL_86;
  }

  uint64_t v77 = OSLogHandleForIDSCategory("IDSDAccount");
  double v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = (_DWORD)v75;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = (_DWORD)v76;
    _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEBUG,  "Compressed message data from: %u  to: %u",  buf,  0xEu);
  }

  if (os_log_shim_legacy_logging_enabled(v79) && _IDSShouldLog(1LL, @"IDSDAccount"))
  {
    id v197 = v75;
    uint64_t v199 = v76;
    _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"Compressed message data from: %u  to: %u");
  }

  v249 = v249;

  uint64_t v80 = 1LL;
  uint64_t v63 = (__CFString *)v249;
LABEL_86:
  objc_msgSend(v13, "setCompressed:", v80, v197, v199);
  uint64_t v81 = (IDSProtobuf *)v63;
LABEL_87:
  __int16 v241 = v81;
  id v96 = -[IDSProtobuf length](v81, "length");
  id v97 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v255, "data"));
  id v98 = [v97 length];

  __int128 v99 = (void *)objc_claimAutoreleasedReturnValue([v13 message]);
  unint64_t v253 = (unint64_t)v96 + (void)v98;
  if (v99)
  {
    uint64_t v100 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      id v226 = (id)objc_claimAutoreleasedReturnValue([v13 bulkedPayload]);
      id v229 = (id)objc_claimAutoreleasedReturnValue([v13 fromID]);
      __int128 v232 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue([v13 destinations]);
      uint64_t v102 = @"YES";
      else {
        id v103 = @"NO";
      }
      v222 = v103;
      else {
        uint64_t v104 = @"NO";
      }
      v218 = v104;
      else {
        id v105 = @"NO";
      }
      v216 = v105;
      [v13 timeout];
      unsigned __int8 v107 = v106;
      id v108 = (id)objc_claimAutoreleasedReturnValue([v13 command]);
      else {
        unsigned __int8 v109 = @"NO";
      }
      else {
        unsigned __int8 v110 = @"NO";
      }
      unsigned __int8 v111 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v13 deliveryStatusContext]);
      id v112 = (id)objc_claimAutoreleasedReturnValue([v13 messageUUID]);
      if ([v13 priority] == (id)300)
      {
        unsigned __int8 v113 = @"URGENT";
      }

      else if ([v13 priority] == (id)200)
      {
        unsigned __int8 v113 = @"Default";
      }

      else
      {
        unsigned __int8 v113 = @"Sync";
      }

      uint64_t v128 = (__CFString *)objc_retainBlock(v256);
      *(_DWORD *)buf = 138415874;
      *(void *)&uint8_t buf[4] = v226;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v229;
      *(_WORD *)&buf[22] = 2112;
      v307 = v232;
      *(_WORD *)v308 = 2112;
      *(void *)&v308[2] = v222;
      *(_WORD *)&v308[10] = 2112;
      *(void *)&v308[12] = v218;
      __int16 v309 = 2112;
      v310 = v216;
      __int16 v311 = 2048;
      v312 = v107;
      __int16 v313 = 2112;
      id v314 = v108;
      __int16 v315 = 2112;
      v316 = v109;
      __int16 v317 = 2112;
      v318 = v110;
      __int16 v319 = 2112;
      v320 = v111;
      __int16 v321 = 2112;
      id v322 = v112;
      __int16 v323 = 2112;
      v324 = v113;
      __int16 v325 = 2112;
      v326 = v102;
      __int16 v327 = 2048;
      v328 = v128;
      _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "sendMessage <<Redacted>>  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusCont ext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p",  buf,  0x98u);
    }

    if (os_log_shim_legacy_logging_enabled(v129)
      && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      __int128 v234 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 bulkedPayload]);
      __int128 v231 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 fromID]);
      __int128 v228 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 destinations]);
      id v130 = @"YES";
      else {
        uint64_t v131 = @"NO";
      }
      __int128 v224 = v131;
      else {
        id v132 = @"NO";
      }
      v220 = v132;
      else {
        id v133 = @"NO";
      }
      [v13 timeout];
      uint64_t v135 = v134;
      v136 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 command]);
      else {
        id v137 = @"NO";
      }
      else {
        uint64_t v138 = @"NO";
      }
      id v139 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 deliveryStatusContext]);
      id v140 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 messageUUID]);
      if ([v13 priority] == (id)300)
      {
        id v141 = @"URGENT";
      }

      else if ([v13 priority] == (id)200)
      {
        id v141 = @"Default";
      }

      else
      {
        id v141 = @"Sync";
      }

      id v153 = (__CFString *)objc_retainBlock(v256);
      int64_t v213 = v130;
      v214 = v153;
      v211 = v140;
      v212 = v141;
      v209 = v138;
      uint64_t v210 = v139;
      id v207 = v136;
      uint64_t v208 = v137;
      id v206 = v135;
      __int16 v204 = v220;
      v205 = v133;
      id v201 = v228;
      id v203 = v224;
      id v197 = v234;
      uint64_t v199 = v231;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"sendMessage <<Redacted>>  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p");
LABEL_186:
    }
  }

  else
  {
    uint64_t v114 = OSLogHandleForIDSCategory("IDSDAccount");
    unsigned int v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      id v227 = (id)objc_claimAutoreleasedReturnValue([v13 bulkedPayload]);
      __int128 v230 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue([v13 fromID]);
      id v233 = (id)objc_claimAutoreleasedReturnValue([v13 destinations]);
      id v116 = @"YES";
      else {
        double v117 = @"NO";
      }
      __int128 v223 = v117;
      else {
        uint64_t v118 = @"NO";
      }
      v219 = v118;
      else {
        id v119 = @"NO";
      }
      v217 = v119;
      [v13 timeout];
      id v121 = v120;
      uint64_t v122 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v13 command]);
      else {
        int v123 = @"NO";
      }
      else {
        v124 = @"NO";
      }
      id v125 = (id)objc_claimAutoreleasedReturnValue([v13 deliveryStatusContext]);
      id v126 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v13 messageUUID]);
      if ([v13 priority] == (id)300)
      {
        uint64_t v127 = @"URGENT";
      }

      else if ([v13 priority] == (id)200)
      {
        uint64_t v127 = @"Default";
      }

      else
      {
        uint64_t v127 = @"Sync";
      }

      id v142 = objc_retainBlock(v256);
      *(_DWORD *)buf = 134221826;
      *(void *)&uint8_t buf[4] = v253;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v227;
      *(_WORD *)&buf[22] = 2112;
      v307 = v230;
      *(_WORD *)v308 = 2112;
      *(void *)&v308[2] = v233;
      *(_WORD *)&v308[10] = 2112;
      *(void *)&v308[12] = v223;
      __int16 v309 = 2112;
      v310 = v219;
      __int16 v311 = 2112;
      v312 = v217;
      __int16 v313 = 2048;
      id v314 = v121;
      __int16 v315 = 2112;
      v316 = v122;
      __int16 v317 = 2112;
      v318 = v123;
      __int16 v319 = 2112;
      v320 = v124;
      __int16 v321 = 2112;
      id v322 = v125;
      __int16 v323 = 2112;
      v324 = v126;
      __int16 v325 = 2112;
      v326 = v127;
      __int16 v327 = 2112;
      v328 = v116;
      __int16 v329 = 2048;
      id v330 = v142;
      _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload % @  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusConte xt %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p",  buf,  0xA2u);
    }

    if (os_log_shim_legacy_logging_enabled(v143)
      && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      __int128 v234 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 bulkedPayload]);
      __int128 v231 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 fromID]);
      __int128 v228 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 destinations]);
      v144 = @"YES";
      else {
        id v145 = @"NO";
      }
      __int128 v225 = v145;
      else {
        id v146 = @"NO";
      }
      v221 = v146;
      else {
        id v147 = @"NO";
      }
      [v13 timeout];
      id v149 = v148;
      v136 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 command]);
      else {
        id v150 = @"NO";
      }
      else {
        id v151 = @"NO";
      }
      id v139 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 deliveryStatusContext]);
      id v140 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 messageUUID]);
      if ([v13 priority] == (id)300)
      {
        id v152 = @"URGENT";
      }

      else if ([v13 priority] == (id)200)
      {
        id v152 = @"Default";
      }

      else
      {
        id v152 = @"Sync";
      }

      id v153 = (__CFString *)objc_retainBlock(v256);
      v214 = v144;
      id v215 = v153;
      v212 = v140;
      int64_t v213 = v152;
      uint64_t v210 = v151;
      v211 = v139;
      uint64_t v208 = v136;
      v209 = v150;
      id v207 = v149;
      v205 = v221;
      id v206 = v147;
      id v203 = v228;
      __int16 v204 = v225;
      uint64_t v199 = v234;
      id v201 = v231;
      id v197 = (id)v253;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p");
      goto LABEL_186;
    }
  }

  unsigned __int8 v154 = objc_msgSend( v13,  "bypassSizeCheck",  v197,  v199,  v201,  v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215);
  if (v253 <= 0x500000) {
    char v155 = 1;
  }
  else {
    char v155 = v154;
  }
  if ((v155 & 1) == 0)
  {
    uint64_t v168 = OSLogHandleForIDSCategory("Warning");
    id v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);
    if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v253;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v250;
      _os_log_impl( (void *)&_mh_execute_header,  v169,  OS_LOG_TYPE_ERROR,  "Payload length %lu for topic %@ is too big to send.",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v170))
    {
      _IDSWarnV(@"IDSFoundation", @"Payload length %lu for topic %@ is too big to send.");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Payload length %lu for topic %@ is too big to send.");
      _IDSLogTransport(@"Warning", @"IDS", @"Payload length %lu for topic %@ is too big to send.");
    }

    if (v256) {
      goto LABEL_211;
    }
    goto LABEL_257;
  }

  if (([v13 bypassSizeCheck] & 1) != 0
    || [v13 priority] != (id)300
    || v253 <= 0x100000)
  {
    id v299 = 0LL;
    id v298 = 0LL;
    [a1 _splitDestinations:v252 intoLocalDestinations:&v299 remoteDestinations:&v298 threadContext:v258 sendParameters:v13];
    id v156 = (NSError *)v299;
    unsigned int v157 = (IDSDeliveryContext *)v298;
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[NSError allKeys](v156, "allKeys"));
    v296[0] = _NSConcreteStackBlock;
    v296[1] = 3221225472LL;
    v296[2] = sub_1002CFBBC;
    v296[3] = &unk_1008F64D0;
    id v159 = v244;
    id v297 = v159;
    unsigned int v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "__imArrayByApplyingBlock:", v296));

    __int16 v161 = (void *)objc_claimAutoreleasedReturnValue([v13 resourcePath]);
    if (v161)
    {
      BOOL v162 = -[IDSDeliveryContext count](v157, "count") == 0LL;

      if (!v162)
      {
        uint64_t v163 = OSLogHandleForIDSCategory("IDSDAccount");
        uint64_t v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v164,  OS_LOG_TYPE_DEFAULT,  "Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Setting Command",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v165)
          && _IDSShouldLog(0LL, @"IDSDAccount"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Setting Command");
        }

        [v13 setCommand:&off_100947920];
      }
    }

    if ([v13 localDelivery]
      && (!-[IDSDeliveryContext count](v157, "count") ? (char v166 = 1) : (char v166 = v235), (v166 & 1) == 0))
    {
      uint64_t v175 = OSLogHandleForIDSCategory("Warning");
      __int16 v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
      if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v252;
        *(_WORD *)&buf[22] = 2112;
        v307 = (uint64_t (*)(uint64_t, uint64_t))v157;
        _os_log_impl( (void *)&_mh_execute_header,  v176,  OS_LOG_TYPE_ERROR,  "Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v177))
      {
        _IDSWarnV( @"IDSFoundation",  @"Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.");
        __int16 v200 = v252;
        __int16 v202 = v157;
        id v198 = a1;
        _IDSLogTransport( @"Warning",  @"IDS",  @"Account %@ was asked to send to %@ with forced local delivery but there are unaddressible remote destinations %@ - failing message.");
      }

      char v167 = 0;
    }

    else
    {
      char v167 = 1;
    }

    if (-[IDSDeliveryContext count](v157, "count", v198, v200, v202) || -[NSError count](v156, "count"))
    {
      if ((v167 & 1) != 0)
      {
        v295[0] = 0LL;
        v295[1] = v295;
        v295[2] = 0x2020000000LL;
        v295[3] = 0LL;
        uint64_t v291 = 0LL;
        v292 = &v291;
        uint64_t v293 = 0x2020000000LL;
        char v294 = -86;
        char v294 = -[NSError count](v156, "count") == 0LL;
        v289[0] = 0LL;
        v289[1] = v289;
        v289[2] = 0x2020000000LL;
        char v290 = -86;
        v178 = v245;
        char v290 = -[IDSDeliveryContext count](v157, "count") == 0LL;
        *(void *)buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        v307 = sub_1002CC060;
        *(void *)v308 = sub_1002CC070;
        *(void *)&v308[8] = 0LL;
        if (v236)
        {
          uint64_t v179 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v288 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v180,  OS_LOG_TYPE_DEFAULT,  "Setting localLastCall to YES for this proxied outgoing message so that the completion does not rely on the local reflection",  v288,  2u);
          }

          v178 = v245;
          if (os_log_shim_legacy_logging_enabled(v181)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Setting localLastCall to YES for this proxied outgoing message so that the completion does not rely on the local reflection");
          }

          *((_BYTE *)v292 + 24) = 1;
        }

        if (-[NSError count](v156, "count"))
        {
          id v182 = [v13 copy];
          id v183 = v182;
          if (v236) {
            [v182 setTimeout:IDSMaxMessageTimeout];
          }
          [v183 setFinalDestinationURIs:v160];
          v280[0] = _NSConcreteStackBlock;
          v280[1] = 3221225472LL;
          v280[2] = sub_1002CFC24;
          v280[3] = &unk_1008FFEE8;
          char v287 = v236;
          v283 = &v291;
          v284 = buf;
          v285 = v295;
          id v281 = v13;
          id v282 = v256;
          v286 = v289;
          +[IDSDAccount _sendLocallyWithSendParameters:service:uriToLocalDestination:data:protobuf:threadContext:progressBlock:completionBlock:]( &OBJC_CLASS___IDSDAccount,  "_sendLocallyWithSendParameters:service:uriToLocalDestination:data:protobuf:threadContext:progressBlock:completionBlock:",  v183,  v159,  v156,  v241,  v255,  v258,  v242,  v280);

          v178 = v245;
        }

        if (v178)
        {
          v276[0] = _NSConcreteStackBlock;
          v276[1] = 3221225472LL;
          v276[2] = sub_1002CFF70;
          v276[3] = &unk_1008FFF10;
          v277 = v156;
          id v278 = v160;
          id v279 = v178;
          id v184 = objc_retainBlock(v276);
        }

        else
        {
          id v184 = 0LL;
        }

        id v185 = -[IDSDeliveryContext count](v157, "count");
        if (v185)
        {
          uint64_t v187 = im_primary_queue(v185, v186);
          char v188 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v187);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1002D0088;
          block[3] = &unk_1008FFFE0;
          unsigned int v274 = v240;
          unsigned __int8 v275 = v235;
          id v260 = v13;
          id v273 = a1;
          id v261 = v159;
          id v262 = v258;
          id v266 = v242;
          id v267 = v256;
          v263 = v157;
          v264 = v241;
          v265 = v255;
          v268 = v184;
          v269 = v289;
          v270 = buf;
          v271 = v295;
          v272 = &v291;
          dispatch_async(v188, block);
        }

        else
        {
          id v189 = -[NSError count](v156, "count");
          if (v245 && v189) {
            (*((void (**)(id, void *, void, void))v245 + 2))(v245, v160, 0LL, 0LL);
          }
        }

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(v289, 8);
        _Block_object_dispose(&v291, 8);
        _Block_object_dispose(v295, 8);
LABEL_255:

        goto LABEL_256;
      }
    }

    else
    {
      uint64_t v190 = OSLogHandleForIDSCategory("Warning");
      __int128 v191 = (os_log_s *)objc_claimAutoreleasedReturnValue(v190);
      if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&buf[14] = v252;
        _os_log_impl( (void *)&_mh_execute_header,  v191,  OS_LOG_TYPE_ERROR,  "Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v192))
      {
        _IDSWarnV( @"IDSFoundation",  @"Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.");
        _IDSLogTransport( @"Warning",  @"IDS",  @"Account %@ was asked to send to %@ but we were unable to resolve any actual destinations - failing message.");
      }
    }

    __int128 v193 = objc_alloc(&OBJC_CLASS___NSError);
    __int128 v194 = -[NSError initWithDomain:code:userInfo:](v193, "initWithDomain:code:userInfo:", IDSSendErrorDomain, 1LL, 0LL);
    if (v256)
    {
      __int128 v195 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  1LL,  v194,  1LL);
      (*((void (**)(id, IDSDeliveryContext *))v256 + 2))(v256, v195);
    }

    goto LABEL_255;
  }

  uint64_t v172 = OSLogHandleForIDSCategory("Warning");
  __int128 v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
  if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v253;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v250;
    _os_log_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_ERROR,  "Payload length %lu for topic %@ is too big to send as urgent",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v174))
  {
    _IDSWarnV(@"IDSFoundation", @"Payload length %lu for topic %@ is too big to send as urgent");
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Payload length %lu for topic %@ is too big to send as urgent");
    _IDSLogTransport( @"Warning",  @"IDS",  @"Payload length %lu for topic %@ is too big to send as urgent");
  }

  if (v256)
  {
LABEL_211:
    uint64_t v171 = objc_alloc(&OBJC_CLASS___NSError);
    id v156 = -[NSError initWithDomain:code:userInfo:](v171, "initWithDomain:code:userInfo:", IDSSendErrorDomain, 8LL, 0LL);
    unsigned int v157 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  8LL,  v156,  1LL);
    (*((void (**)(id, IDSDeliveryContext *))v256 + 2))(v256, v157);
LABEL_256:
  }

- (int64_t)maxRemoteMessagingPayloadSize
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDeliveryController sharedInstance](&OBJC_CLASS___IDSDeliveryController, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v5 = objc_msgSend(v3, "effectiveMaxPayloadSizeIfCanUseLargePayload:", objc_msgSend(v4, "canUseLargePayload"));

  return (int64_t)v5;
}

- (id)newSendMessageContext
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___IDSDAccountSendMessageContext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  -[IDSDAccountSendMessageContext setServiceIdentifier:](v3, "setServiceIdentifier:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
  -[IDSDAccountSendMessageContext setServicePushTopic:](v3, "setServicePushTopic:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 duetIdentifiers]);
  -[IDSDAccountSendMessageContext setServiceDuetIdentifiers:](v3, "setServiceDuetIdentifiers:", v7);

  -[IDSDAccountSendMessageContext setServiceAdHocType:]( v3,  "setServiceAdHocType:",  [v4 adHocServiceType]);
  -[IDSDAccountSendMessageContext setServiceIsDSBased:]( v3,  "setServiceIsDSBased:",  [v4 shouldRegisterUsingDSHandle]);
  -[IDSDAccountSendMessageContext setServiceAllowProxyDelivery:]( v3,  "setServiceAllowProxyDelivery:",  [v4 shouldAllowProxyDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowLocalDelivery:]( v3,  "setServiceAllowLocalDelivery:",  [v4 allowLocalDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowWiProxDelivery:]( v3,  "setServiceAllowWiProxDelivery:",  [v4 allowWiProxDelivery]);
  -[IDSDAccountSendMessageContext setServiceAllowLiveMessageDelivery:]( v3,  "setServiceAllowLiveMessageDelivery:",  [v4 shouldAllowLiveMessageDelivery]);
  -[IDSDAccountSendMessageContext setServiceUseiMessageCallerID:]( v3,  "setServiceUseiMessageCallerID:",  [v4 useiMessageCallerID]);
  -[IDSDAccountSendMessageContext setServiceWantsReflectedSend:]( v3,  "setServiceWantsReflectedSend:",  [v4 wantsLocalReflectedSend]);
  -[IDSDAccountSendMessageContext setServiceWantsTinkerDevices:]( v3,  "setServiceWantsTinkerDevices:",  [v4 wantsTinkerDevices]);
  -[IDSDAccountSendMessageContext setSilentlyFailMessagesOnSwitch:]( v3,  "setSilentlyFailMessagesOnSwitch:",  [v4 shouldSilentlyFailMessagesOnSwitch]);
  -[IDSDAccountSendMessageContext setShouldProtectTrafficUsingClassA:]( v3,  "setShouldProtectTrafficUsingClassA:",  [v4 shouldProtectTrafficUsingClassA]);
  -[IDSDAccountSendMessageContext setShouldAllowCloudDelivery:]( v3,  "setShouldAllowCloudDelivery:",  [v4 shouldAllowCloudDelivery]);
  -[IDSDAccountSendMessageContext setAccountType:]( v3,  "setAccountType:",  -[IDSDAccount accountType](self, "accountType"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dsHandle]);
  -[IDSDAccountSendMessageContext setPrimaryRegistrationDSHandle:](v3, "setPrimaryRegistrationDSHandle:", v9);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));
  -[IDSDAccountSendMessageContext setAccountDisplayName:](v3, "setAccountDisplayName:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uris]);
  -[IDSDAccountSendMessageContext setPrimaryRegistrationURIs:](v3, "setPrimaryRegistrationURIs:", v12);

  -[IDSDAccountSendMessageContext setIsRegistrationActive:]( v3,  "setIsRegistrationActive:",  -[IDSDAccount isRegistrationActive](self, "isRegistrationActive"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  [v4 wantsTinkerDevices]));
  -[IDSDAccountSendMessageContext setDependentRegistrations:](v3, "setDependentRegistrations:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount defaultPairedDependentRegistrationIncludingTinker:]( self,  "defaultPairedDependentRegistrationIncludingTinker:",  [v4 wantsTinkerDevices]));
  -[IDSDAccountSendMessageContext setDefaultPairedDependentRegistrations:]( v3,  "setDefaultPairedDependentRegistrations:",  v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appleIDAccountOnService:v4]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dependentRegistrations]);
  -[IDSDAccountSendMessageContext setAppleIDPrimaryDependentRegistrations:]( v3,  "setAppleIDPrimaryDependentRegistrations:",  v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
  -[IDSDAccountSendMessageContext setAliasStrings:](v3, "setAliasStrings:", v18);

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonyms](self, "pseudonyms"));
  -[IDSDAccountSendMessageContext setPseudonyms:](v3, "setPseudonyms:", v19);

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
  -[IDSDAccountSendMessageContext setAccountDescription:](v3, "setAccountDescription:", v20);

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  -[IDSDAccountSendMessageContext setDataProtectionClass:]( v3,  "setDataProtectionClass:",  [v21 dataProtectionClass]);

  return v3;
}

- (void)_sendMessageWithSendParametersOnMainThread:(id)a3 filteredDestinations:(id)a4 data:(id)a5 compressedData:(id)a6 protobufToSend:(id)a7 willSendBlock:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v63 = a4;
  id v60 = a5;
  id v59 = a6;
  id v61 = a7;
  id v16 = a8;
  id v17 = a9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 command]);
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v15 command]);
  if ([v19 integerValue] == (id)120)
  {
LABEL_6:

LABEL_7:
    unsigned int v21 = 0;
    goto LABEL_8;
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  if (![v20 wantsLocalReflectedSend]
    || [v15 isProxiedOutgoingMessage])
  {

    goto LABEL_6;
  }

  unsigned int v21 = -[IDSDAccount shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:]( self,  "shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:",  v15);

  if (v21)
  {
    id v43 = [v63 mutableCopy];
    id v44 = IDSDefaultPairedDevice;
    [v43 addObject:v44];
    id v45 = v43;

    uint64_t v46 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v96 = 138412290;
      *(void *)&void v96[4] = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Adding local device as a destination for this message, Destinations For This Message Are Now %@",  v96,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v48) && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      id v55 = v45;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Adding local device as a destination for this message, Destinations For This Message Are Now %@");
    }

    unsigned int v21 = 1;
    id v63 = v45;
  }

- (void)sendServerMessage:(id)a3 command:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pushTopic]);

  id v13 = -[IDSServerMessage initWithPayload:command:]( objc_alloc(&OBJC_CLASS___IDSServerMessage),  "initWithPayload:command:",  v8,  v9);
  uint64_t v14 = OSLogHandleForIDSCategory("IDSDaemon");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Sending server message: %@   command: %@   account: %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v16) && _IDSShouldLog(0LL, @"IDSDaemon"))
  {
    id v21 = v9;
    id v22 = self;
    id v20 = v8;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDaemon",  @"Sending server message: %@   command: %@   account: %@");
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeliveryController sharedInstance]( &OBJC_CLASS___IDSDeliveryController,  "sharedInstance",  v20,  v21,  v22));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002D2628;
  v23[3] = &unk_1008F7CA0;
  id v24 = v12;
  id v25 = v10;
  id v18 = v10;
  id v19 = v12;
  [v17 sendIDSMessage:v13 service:0 topic:v19 completionBlock:v23];
}

- (void)_splitDestinations:(id)a3 intoLocalDestinations:(id *)a4 remoteDestinations:(id *)a5 rapportDestinations:(id *)a6 sendParameters:(id)a7
{
  uint64_t v175 = (IDSDAccount *)a3;
  id v184 = a7;
  uint64_t v172 = a4;
  if (!a4 && !a5 && !a6)
  {
    uint64_t v9 = OSLogHandleForIDSCategory("Warning");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v212 = v175;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "No output arrays specified for _splitDestinations %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v11))
    {
      _IDSWarnV(@"IDSFoundation", @"No output arrays specified for _splitDestinations %@");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"No output arrays specified for _splitDestinations %@");
      _IDSLogTransport(@"Warning", @"IDS", @"No output arrays specified for _splitDestinations %@");
    }

    goto LABEL_221;
  }

  uint64_t v12 = OSLogHandleForIDSCategory("IDSDAccount");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v212 = self;
    __int16 v213 = 2112;
    v214 = v175;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ splitting destinations %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(1LL, @"IDSDAccount"))
  {
    uint64_t v163 = self;
    uint64_t v168 = v175;
    _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"%@ splitting destinations %@");
  }

  uint64_t v177 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v178 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v180 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v209 = 0u;
  __int128 v210 = 0u;
  __int128 v207 = 0u;
  __int128 v208 = 0u;
  id obj = v175;
  id v187 = -[IDSDAccount countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v207,  v220,  16LL);
  if (v187)
  {
    uint64_t v186 = *(void *)v208;
    uint64_t v188 = IDSDefaultPairedDevice;
    uint64_t v182 = IDSDevicePropertyPushToken;
    uint64_t v181 = IDSDevicePropertyIdentities;
    uint64_t v193 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v194 = IDSDevicePropertyIdentifierOverride;
    uint64_t v192 = IDSPrivateDeviceDataUniqueID;
    uint64_t v179 = (void *)IDSDeviceDefaultPairedDeviceUniqueID;
    uint64_t v176 = IDSDevicePairedDeviceID;
    do
    {
      uint64_t v190 = 0LL;
      do
      {
        if (*(void *)v208 != v186) {
          objc_enumerationMutation(obj);
        }
        id v15 = (IDSDAccount *)*(id *)(*((void *)&v207 + 1) + 8LL * (void)v190);
        uint64_t v16 = OSLogHandleForIDSCategory("IDSDAccount");
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v212 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - looking up device for dest %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v18)
          && _IDSShouldLog(1LL, @"IDSDAccount"))
        {
          uint64_t v163 = v15;
          _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - looking up device for dest %@");
        }

        LODWORD(v19) = -[IDSDAccount isEqualToString:]( v15,  "isEqualToString:",  v188,  v163,  v168,  v170,  v171);
        if ((_DWORD)v19)
        {
          id v20 = (IDSDAccount *)objc_claimAutoreleasedReturnValue( -[IDSDAccount defaultPairedDependentRegistration]( self,  "defaultPairedDependentRegistration"));
          id v21 = v20;
          if (!v20)
          {
            id v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"bt-id",  v179,  @"device-id",  0LL));
            -[NSMutableDictionary setObject:forKey:](v177, "setObject:forKey:", v63, v188);

            goto LABEL_190;
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount objectForKey:](v20, "objectForKey:", v182));
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount objectForKey:](v21, "objectForKey:", v181));
          id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "__imArrayByApplyingBlock:", &stru_100900090));

          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
          uint64_t v27 = _IDSPrefersPhoneNumbersForServiceIdentifier(v26);

          __int16 v28 = (void *)_IDSCopyCallerID(0LL, v24, 0LL, 0LL, v27);
          id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_URIFromFZIDType:", objc_msgSend(v28, "_FZBestGuessFZIDType")));
          __int16 v30 = (IDSDAccount *)_IDSCopyIDForTokenWithURI(v22, v29);

          uint64_t v31 = OSLogHandleForIDSCategory("IDSDAccount");
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v212 = v30;
            __int16 v213 = 2112;
            v214 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Resolved destination %@ from default paired device constant device %@.",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v33)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            uint64_t v164 = v30;
            uint64_t v168 = v21;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Resolved destination %@ from default paired device constant device %@.");
          }
        }

        else
        {
          __int16 v30 = v15;
        }

        if (-[IDSDAccount hasPrefix:](v30, "hasPrefix:", @"device:", v164))
        {
          uint64_t v34 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _stripFZIDPrefix](v30, "_stripFZIDPrefix"));
          uint64_t v35 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v212 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "(Instance) Destination device uniqueID: %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v37)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            uint64_t v165 = v34;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Destination device uniqueID: %@");
          }

          id v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service", v165));
          id v39 = (IDSDAccount *)objc_claimAutoreleasedReturnValue( -[IDSDAccount defaultPairedDependentRegistrationIncludingTinker:]( self,  "defaultPairedDependentRegistrationIncludingTinker:",  [v38 wantsTinkerDevices]));

          if (v39)
          {
            uint64_t v40 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _stringForKey:](v39, "_stringForKey:", v194));
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount objectForKey:](v39, "objectForKey:", v193));
            id v19 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v41 _stringForKey:v192]);

            uint64_t v42 = OSLogHandleForIDSCategory("IDSDAccount");
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v212 = v40;
              __int16 v213 = 2112;
              v214 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "(Instance) Default paired device uniqueID override %@   uniqueID %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v44)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              uint64_t v165 = v40;
              uint64_t v168 = v19;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Default paired device uniqueID override %@   uniqueID %@");
            }

            if ((-[IDSDAccount isEqualToIgnoringCase:](v34, "isEqualToIgnoringCase:", v40, v165) & 1) == 0
              && !-[IDSDAccount isEqualToIgnoringCase:](v34, "isEqualToIgnoringCase:", v19)
              || [v184 sessionForceInternetInvitation])
            {

              goto LABEL_48;
            }

            LOBYTE(v19) = 1;
LABEL_78:

            uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount objectForKey:](v39, "objectForKey:", v182));
            id v65 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount objectForKey:](v39, "objectForKey:", v181));
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "__imArrayByApplyingBlock:", &stru_1009000B0));

            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
            unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue([v67 identifier]);
            uint64_t v69 = _IDSPrefersPhoneNumbersForServiceIdentifier(v68);

            __int128 v70 = (void *)_IDSCopyCallerID(0LL, v66, 0LL, 0LL, v69);
            id v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_URIFromFZIDType:", objc_msgSend(v70, "_FZBestGuessFZIDType")));
            uint64_t v72 = _IDSCopyIDForTokenWithURI(v64, v71);

            uint64_t v73 = OSLogHandleForIDSCategory("IDSDAccount");
            uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v212 = (IDSDAccount *)v72;
              __int16 v213 = 2112;
              v214 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEBUG,  "(Instance) Resolved destination %@ from default paired device constant device %@.",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v75)
              && _IDSShouldLog(1LL, @"IDSDAccount"))
            {
              uint64_t v165 = (IDSDAccount *)v72;
              uint64_t v168 = v39;
              _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Resolved destination %@ from default paired device constant device %@.");
            }

            uint64_t v40 = v39;
            __int16 v30 = (IDSDAccount *)v72;
          }

          else
          {
LABEL_48:
            id v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount dependentRegistrationsIncludingTinker:]( self,  "dependentRegistrationsIncludingTinker:",  [v45 wantsTinkerDevices]));

            __int128 v206 = 0u;
            __int128 v204 = 0u;
            __int128 v205 = 0u;
            __int128 v203 = 0u;
            uint64_t v40 = v46;
            id v47 = -[IDSDAccount countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v203,  v219,  16LL);
            if (v47)
            {
              uint64_t v48 = *(void *)v204;
LABEL_50:
              uint64_t v49 = 0LL;
              while (1)
              {
                if (*(void *)v204 != v48) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v50 = *(void **)(*((void *)&v203 + 1) + 8 * v49);
                uint64_t v51 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v50 _stringForKey:v194]);
                uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:v193]);
                BOOL v53 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v52 _stringForKey:v192]);

                uint64_t v54 = OSLogHandleForIDSCategory("IDSDAccount");
                id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v212 = v51;
                  __int16 v213 = 2112;
                  v214 = v53;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "(Instance) Device uniqueID override %@   uniqueID %@",  buf,  0x16u);
                }

                if (os_log_shim_legacy_logging_enabled(v56)
                  && _IDSShouldLog(0LL, @"IDSDAccount"))
                {
                  uint64_t v165 = v51;
                  uint64_t v168 = v53;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Device uniqueID override %@   uniqueID %@");
                }

                if ((-[IDSDAccount isEqualToIgnoringCase:](v51, "isEqualToIgnoringCase:", v34, v165) & 1) != 0
                  || -[IDSDAccount isEqualToIgnoringCase:](v53, "isEqualToIgnoringCase:", v34))
                {
                  break;
                }

                if (v47 == (id)++v49)
                {
                  id v47 = -[IDSDAccount countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v203,  v219,  16LL);
                  if (v47) {
                    goto LABEL_50;
                  }
                  goto LABEL_62;
                }
              }

              id v39 = v50;
              uint64_t v57 = OSLogHandleForIDSCategory("IDSDAccount");
              uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v212 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "(Instance) Found matching device %@",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v59)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                uint64_t v165 = v39;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Found matching device %@");
              }

              if (v39)
              {
                LOBYTE(v19) = 0;
                goto LABEL_78;
              }
            }

            else
            {
LABEL_62:
            }

            uint64_t v60 = OSLogHandleForIDSCategory("IDSDAccount");
            id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v212 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "(Instance) Didn't find matching device for uniqueID %@",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v62)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              uint64_t v165 = v34;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Didn't find matching device for uniqueID %@");
            }

            LOBYTE(v19) = 0;
          }
        }

        if (-[IDSDAccount hasPrefix:](v30, "hasPrefix:", @"guest-device:", v165))
        {
          -[NSMutableArray addObject:](v180, "addObject:", v30);
          LOBYTE(v19) = 1;
        }

        id v202 = 0LL;
        id v76 = (IDSDAccount *)objc_claimAutoreleasedReturnValue( -[IDSDAccount _stripPotentialTokenURIWithToken:]( v30,  "_stripPotentialTokenURIWithToken:",  &v202));
        id v189 = (IDSDAccount *)v202;
        uint64_t v77 = OSLogHandleForIDSCategory("IDSDAccount");
        double v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v212 = v189;
          __int16 v213 = 2112;
          v214 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - token %@ and uri %@",  buf,  0x16u);
        }

        if (os_log_shim_legacy_logging_enabled(v79)
          && _IDSShouldLog(1LL, @"IDSDAccount"))
        {
          uint64_t v163 = v189;
          uint64_t v168 = v76;
          _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - token %@ and uri %@");
        }

        if (!v189 || !v76)
        {
          uint64_t v81 = OSLogHandleForIDSCategory("Warning");
          char v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v212 = v30;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "Malformed destination %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v83))
          {
            _IDSWarnV(@"IDSFoundation", @"Malformed destination %@");
            _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"Malformed destination %@");
            uint64_t v163 = v30;
            _IDSLogTransport(@"Warning", @"IDS", @"Malformed destination %@");
          }

          goto LABEL_189;
        }

        char v201 = 0;
        if (-[IDSDAccount localizedCaseInsensitiveContainsString:]( v76,  "localizedCaseInsensitiveContainsString:",  @"__localURI__"))
        {
          uint64_t v80 = v179;
          LOBYTE(v19) = 1;
          id v185 = v80;
        }

        else
        {
          uint64_t v84 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v86 = IDSLoggableDescriptionForHandleOnService(v76, 0LL);
            uint64_t v87 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue(v86);
            uint64_t v88 = IDSLoggableDescriptionForTokenOnService(v189, 0LL);
            uint64_t v89 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue(v88);
            *(_DWORD *)buf = 138412546;
            v212 = v87;
            __int16 v213 = 2112;
            v214 = v89;
            _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "Finding device matching URI %@ and token %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v90)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            uint64_t v91 = IDSLoggableDescriptionForHandleOnService(v76, 0LL);
            uint64_t v92 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(v91);
            uint64_t v93 = IDSLoggableDescriptionForTokenOnService(v189, 0LL);
            uint64_t v163 = v92;
            uint64_t v168 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(v93);
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Finding device matching URI %@ and token %@");
          }

          id v199 = 0LL;
          id v200 = 0LL;
          -[IDSDAccount findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:]( self,  "findDeviceUniqueID:btID:forURI:token:supportsLiveDelivery:",  &v200,  &v199,  v76,  v189,  &v201,  v163);
          uint64_t v80 = (IDSDAccount *)v200;
          id v185 = (IDSDAccount *)v199;
          uint64_t v94 = OSLogHandleForIDSCategory("IDSDAccount");
          id v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v212 = v80;
            __int16 v213 = 2112;
            v214 = v185;
            _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "Found deviceID %@ and btID %@ after first try",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v96)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            uint64_t v163 = v80;
            uint64_t v168 = v185;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Found deviceID %@ and btID %@ after first try");
          }
        }

        if (!v80)
        {
          uint64_t v97 = OSLogHandleForIDSCategory("IDSDAccount");
          id v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            id v99 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
            *(_DWORD *)buf = 138412290;
            v212 = v99;
            _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "Did not find deviceID using account %@",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v100)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            uint64_t v163 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(-[IDSDAccount smallDescription](self, "smallDescription"));
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Did not find deviceID using account %@");
          }

          uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance",  v163));
          uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          id v103 = (void *)objc_claimAutoreleasedReturnValue([v101 appleIDAccountOnService:v102]);

          id v197 = v185;
          id v198 = 0LL;
          [v103 findDeviceUniqueID:&v198 btID:&v197 forURI:v76 token:v189 supportsLiveDelivery:&v201];
          uint64_t v80 = (IDSDAccount *)v198;
          uint64_t v104 = v197;

          uint64_t v105 = OSLogHandleForIDSCategory("IDSDAccount");
          unsigned __int8 v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v107 = (IDSDAccount *)(id)objc_claimAutoreleasedReturnValue([v103 smallDescription]);
            *(_DWORD *)buf = 138412546;
            v212 = v80;
            __int16 v213 = 2112;
            v214 = v107;
            _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "Found deviceID %@ using primary %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v108)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            uint64_t v163 = v80;
            uint64_t v168 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v103 smallDescription]);
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Found deviceID %@ using primary %@");
          }

          id v185 = v104;
        }

        uint64_t v109 = OSLogHandleForIDSCategory("IDSDAccount");
        unsigned __int8 v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v212 = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - found device id %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v111)
          && _IDSShouldLog(1LL, @"IDSDAccount"))
        {
          uint64_t v163 = v80;
          _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - found device id %@");
        }

        id v112 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service", v163));
        if ([v112 shouldAllowLiveMessageDelivery])
        {
          unsigned __int8 v113 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue([v113 identifier]);
          else {
            unsigned int v115 = sub_1002CB100() ^ 1;
          }
        }

        else
        {
          unsigned int v115 = 0;
        }

        int v116 = _os_feature_enabled_impl("IDS", "LiveDeliveryOverPush");
        if (v80) {
          int v117 = v116;
        }
        else {
          int v117 = 0;
        }
        if (v117 == 1 && ([v184 liveMessageDelivery] & v115) == 1 && v201)
        {
          uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount utunDeliveryController](self, "utunDeliveryController"));
          id v119 = [v118 copyPeerWithID:v80];

          if (([v119 isCloudConnected] & 1) == 0)
          {
            id v120 = [v184 setLiveMessageDelivery:0];
            uint64_t v122 = im_primary_queue(v120, v121);
            int v123 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v122);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1002D47E8;
            block[3] = &unk_1008F6010;
            id v196 = v119;
            dispatch_async(v123, block);

            v124 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance"));
            [v124 startGlobalLinkForDevice:v80];

            uint64_t v125 = OSLogHandleForIDSCategory("IDSDAccount");
            id v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
            if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v212 = v80;
              _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_DEFAULT,  "Using push instead of Live Delivery while GL warms for device id %@",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v127)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              char v166 = v80;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Using push instead of Live Delivery while GL warms for device id %@");
            }
          }
        }

        if (qword_1009C0A68 != -1) {
          dispatch_once(&qword_1009C0A68, &stru_1009000D0);
        }
        uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "sessionID", v166));
        if ([v184 liveMessageDelivery]
          && (v80 ? (unsigned int v129 = v115) : (unsigned int v129 = 0), v129 == 1 && v185))
        {
          if (!v201)
          {
            uint64_t v146 = OSLogHandleForIDSCategory("IDSDAccount");
            id v147 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
            if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v212 = v80;
              __int16 v213 = 2112;
              v214 = v76;
              _os_log_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_DEFAULT,  "Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v148)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              uint64_t v163 = v80;
              uint64_t v168 = v76;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Device does not support live delivery, falling back to push {deviceID: %@, strippedURI: %@}");
            }

            goto LABEL_168;
          }
        }

        else
        {
          id v132 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          if (![v132 allowLocalDelivery] || byte_1009C0A60 || !v80)
          {

LABEL_168:
            if (byte_1009C0A60)
            {
              uint64_t v136 = OSLogHandleForIDSCategory("IDSDAccount");
              id v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
              if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_DEFAULT,  "  Local IDS is disabled... not sending locally",  buf,  2u);
              }

              if (os_log_shim_legacy_logging_enabled(v138)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"  Local IDS is disabled... not sending locally");
              }
            }

LABEL_175:
            uint64_t v139 = OSLogHandleForIDSCategory("IDSDAccount");
            id v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
            if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v212 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEBUG,  "Splitting out local destinations - no local device for URI %@, adding to remote",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v141)
              && _IDSShouldLog(1LL, @"IDSDAccount"))
            {
              uint64_t v163 = v30;
              _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Splitting out local destinations - no local device for URI %@, adding to remote");
            }

            if (v30) {
              char v142 = (char)v19;
            }
            else {
              char v142 = 1;
            }
            if ((v142 & 1) != 0)
            {
              uint64_t v143 = OSLogHandleForIDSCategory("Warning");
              v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_ERROR,  "(Instance) Dest became nil while trying to split destinations.",  buf,  2u);
              }

              if (os_log_shim_legacy_logging_enabled(v145))
              {
                _IDSWarnV( @"IDSFoundation",  @"(Instance) Dest became nil while trying to split destinations.");
                _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"(Instance) Dest became nil while trying to split destinations.");
                _IDSLogTransport( @"Warning",  @"IDS",  @"(Instance) Dest became nil while trying to split destinations.");
              }
            }

            else
            {
              -[NSMutableArray addObject:](v178, "addObject:", v30);
            }

            goto LABEL_189;
          }

          if (!v185) {
            goto LABEL_168;
          }
          unsigned int v133 = -[IDSDAccount isEqualToString:](v80, "isEqualToString:", v179);
          id v134 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          unsigned int v135 = [v134 allowWiProxDelivery];

          if (!((v133 | v135) & 1 | (v128 != 0LL)))
          {
            uint64_t v149 = OSLogHandleForIDSCategory("IDSDAccount");
            id v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
            {
              id v151 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              unsigned int v152 = [v151 allowWiProxDelivery];
              *(_DWORD *)buf = 138413058;
              id v153 = @"NO";
              if (v152) {
                id v153 = @"YES";
              }
              v212 = v30;
              __int16 v213 = 2112;
              v214 = v80;
              __int16 v215 = 2112;
              v216 = v185;
              __int16 v217 = 2112;
              v218 = v153;
              _os_log_impl( (void *)&_mh_execute_header,  v150,  OS_LOG_TYPE_DEFAULT,  "Not considering %@ for local. DeviceID is %@  (btID: %@)  and we're not already scanning/advertising. Se rvice allows wiprox? %@",  buf,  0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled(v154)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              char v155 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
              else {
                id v156 = @"NO";
              }
              uint64_t v170 = v185;
              uint64_t v171 = v156;
              uint64_t v163 = v30;
              uint64_t v168 = v80;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Not considering %@ for local. DeviceID is %@  (btID: %@)  and we're not already scanning/advertising. Service allows wiprox? %@");
            }

            goto LABEL_168;
          }

          if (v128)
          {
            uint64_t v130 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v185,  @"bt-id",  v80,  v176,  v128,  @"session-id",  0LL));
            goto LABEL_159;
          }
        }

        uint64_t v130 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v185,  @"bt-id",  v80,  v176,  0LL));
LABEL_159:
        uint64_t v131 = (void *)v130;
        -[NSMutableDictionary setObject:forKey:](v177, "setObject:forKey:", v130, v30);

LABEL_189:
        id v15 = v30;
LABEL_190:

        uint64_t v190 = (char *)v190 + 1;
      }

      while (v190 != v187);
      id v157 = -[IDSDAccount countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v207,  v220,  16LL);
      id v187 = v157;
    }

    while (v157);
  }

  uint64_t v158 = OSLogHandleForIDSCategory("IDSDAccount");
  id v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v160 = (IDSDAccount *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](v177, "count")));
    __int16 v161 = (IDSDAccount *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v178, "count")));
    *(_DWORD *)buf = 138412546;
    v212 = v160;
    __int16 v213 = 2112;
    v214 = v161;
    _os_log_impl( (void *)&_mh_execute_header,  v159,  OS_LOG_TYPE_DEFAULT,  "(Instance) Split out local destinations (%@) remote destinations (%@)",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v162) && _IDSShouldLog(0LL, @"IDSDAccount"))
  {
    char v167 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](v177, "count")));
    id v169 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](v178, "count")));
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"(Instance) Split out local destinations (%@) remote destinations (%@)");
  }

  if (v172) {
    *uint64_t v172 = v177;
  }
  if (a5) {
    *a5 = v178;
  }
  if (a6) {
    *a6 = v180;
  }

LABEL_221:
}

- (id)utunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance");
}

- (void)_sendLocallyWithSendParameters:(id)a3 uriToLocalDestination:(id)a4 data:(id)a5 protobuf:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v115 = a4;
  id v116 = a5;
  id v111 = a6;
  id v102 = a7;
  im_assert_primary_base_queue(v102, v13);
  unsigned __int8 v113 = self;
  id v112 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned int v98 = [v112 dataProtectionClass];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v112 pushTopic]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 resourcePath]);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 dataToEncrypt]);
  id v17 = (char *)[v16 length];
  id v18 = [v116 length];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v111 data]);
  unint64_t v20 = (unint64_t)[v19 length];

  if (v15)
  {
    [v12 setCommand:&off_100947920];
    id v21 = 0LL;
  }

  else
  {
    id v21 = &v17[(void)v18 + v20];
  }

  id v22 = v14;
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v12 metricReportIdentifier]);

  unsigned __int8 v110 = v22;
  if (v23)
  {
    id v24 = objc_alloc(&OBJC_CLASS___NSString);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 metricReportIdentifier]);
    unsigned __int8 v110 = -[NSString initWithFormat:](v24, "initWithFormat:", @"%@-%@", v22, v25);
  }

  uint64_t v26 = OSLogHandleForIDSCategory("IDSDAccount");
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
    *(_WORD *)&_BYTE buf[12] = 2048;
    id v29 = @"YES";
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v28;
    if (!v15) {
      id v29 = @"NO";
    }
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    id v147 = (uint64_t (*)(uint64_t, uint64_t))v29;
    *(_WORD *)uint64_t v148 = 2112;
    *(void *)&v148[2] = v22;
    *(_WORD *)&v148[10] = 2112;
    *(void *)&v148[12] = v115;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v30) && _IDSShouldLog(2LL, @"IDSDAccount"))
  {
    BOOL v31 = v15 == 0LL;
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v12 messageUUID]);
    uint64_t v33 = (void *)v32;
    uint64_t v34 = @"YES";
    if (v31) {
      uint64_t v34 = @"NO";
    }
    uint64_t v83 = v22;
    id v85 = v115;
    uint64_t v79 = v21;
    uint64_t v81 = v34;
    uint64_t v76 = v32;
    _IDSLogV( 2LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending message ID (%@) with data length %lu (resource: %@)  [Topic: %@  Local Device IDs: %@]");
  }

  if (-[IDSDAccount accountType](v113, "accountType", v76, v79, v81, v83, v85))
  {
    uint64_t v35 = _IDSCopyMyPhoneNumbers(0LL);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 _stripFZIDPrefix]);
    [v36 containsObject:v38];
  }

  id v39 = (void *)objc_claimAutoreleasedReturnValue([v115 allValues]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "__imArrayByApplyingBlock:", &stru_1009000F0));
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v40));

  id v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v139[0] = 0LL;
  v139[1] = v139;
  v139[2] = 0x2020000000LL;
  v139[3] = 0LL;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v147 = sub_1002CC060;
  *(void *)uint64_t v148 = sub_1002CC070;
  *(void *)&v148[8] = 0LL;
  if (([v12 localDelivery] & 1) != 0
    || [v12 requireLocalWiFi])
  {
    uint64_t v41 = OSLogHandleForTransportCategory("IDSDAccount");
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      else {
        id v43 = @"NO";
      }
      unsigned int v44 = [v12 requireLocalWiFi];
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v46 = (void *)v45;
      if (v44) {
        id v47 = @"YES";
      }
      else {
        id v47 = @"NO";
      }
      *(_DWORD *)id v140 = 138412802;
      uint64_t v141 = v43;
      __int16 v142 = 2112;
      uint64_t v143 = v47;
      __int16 v144 = 2112;
      uint64_t v145 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to fallback forcedLocal %@ requireLocalWiFi %@ message %@",  v140,  0x20u);
    }

    uint64_t v49 = os_log_shim_legacy_logging_enabled(v48);
    uint64_t v50 = [v12 localDelivery] ? @"YES" : @"NO";
    unsigned int v51 = [v12 requireLocalWiFi];
    uint64_t v52 = objc_claimAutoreleasedReturnValue([v12 messageUUID]);
    BOOL v53 = (void *)v52;
    uint64_t v54 = v51 ? @"YES" : @"NO";
    uint64_t v80 = v54;
    uint64_t v82 = v52;
    uint64_t v77 = v50;
    _IDSLogTransport( @"IDSDAccount",  @"IDS",  @"Ignoring request to fallback forcedLocal %@ requireLocalWiFi %@ message %@");

    if (!_IDSShouldLog(0LL, @"IDSDAccount"))
    {
LABEL_43:
      uint64_t v109 = 0LL;
      goto LABEL_46;
    }

    else {
      id v55 = @"NO";
    }
    unsigned int v56 = [v12 requireLocalWiFi];
    uint64_t v57 = objc_claimAutoreleasedReturnValue([v12 messageUUID]);
    uint64_t v58 = (void *)v57;
    if (v56) {
      uint64_t v59 = @"YES";
    }
    else {
      uint64_t v59 = @"NO";
    }
    uint64_t v80 = (__CFString *)v59;
    uint64_t v82 = v57;
    uint64_t v77 = (__CFString *)v55;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Ignoring request to fallback forcedLocal %@ requireLocalWiFi %@ message %@");
    uint64_t v109 = 0LL;
  }

  else
  {
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472LL;
    v126[2] = sub_1002D548C;
    v126[3] = &unk_100900118;
    uint64_t v136 = buf;
    id v127 = v99;
    id v128 = v100;
    id v129 = v12;
    uint64_t v130 = v113;
    id v137 = v139;
    uint64_t v131 = v110;
    uint64_t v138 = v21;
    id v132 = v112;
    id v135 = v102;
    id v133 = v116;
    id v134 = v111;
    uint64_t v109 = objc_retainBlock(v126);

    uint64_t v58 = v127;
  }

LABEL_46:
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataToEncrypt", v77, v80, v82));

  if (v60)
  {
    if (v116)
    {
      uint64_t v62 = OSLogHandleForIDSCategory("Warning");
      id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v140 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "Attempt to send both DataToEncrypt and Data, dropping data",  v140,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v64))
      {
        _IDSWarnV(@"IDSFoundation", @"Attempt to send both DataToEncrypt and Data, dropping data");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Attempt to send both DataToEncrypt and Data, dropping data");
        *(void *)&double v61 = _IDSLogTransport( @"Warning",  @"IDS",  @"Attempt to send both DataToEncrypt and Data, dropping data").n128_u64[0];
      }
    }

    uint64_t v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataToEncrypt", v61));

    id v116 = (id)v65;
  }

  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount utunDeliveryController](v113, "utunDeliveryController"));
  unsigned __int8 v107 = (void *)objc_claimAutoreleasedReturnValue([v12 resourcePath]);
  unsigned __int8 v106 = (void *)objc_claimAutoreleasedReturnValue([v12 resourceMetadata]);
  id v97 = [v12 priority];
  unsigned __int8 v96 = [v12 nonWaking];
  unsigned __int8 v95 = [v12 nonCloudWaking];
  unsigned __int8 v94 = [v12 requireBluetooth];
  unsigned __int8 v93 = [v12 requireLocalWiFi];
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v12 queueOneIdentifier]);
  uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue([v12 expirationDate]);
  unsigned __int8 v92 = [v12 enforceRemoteTimeouts];
  unsigned __int8 v91 = [v12 expectsPeerResponse];
  unsigned __int8 v90 = [v12 wantsAppAck];
  unsigned __int8 v89 = [v12 compressPayload];
  unsigned __int8 v88 = [v12 compressed];
  id v103 = (void *)objc_claimAutoreleasedReturnValue([v12 peerResponseIdentifier]);
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
  unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v12 localDestinationDeviceUUID]);
  unsigned __int8 v70 = [v12 bypassDuet];
  id v71 = (void *)objc_claimAutoreleasedReturnValue([v12 duetIdentifiersOverride]);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v12 messageType]);
  id v73 = [v72 longLongValue];
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_1002D62D0;
  v117[3] = &unk_100900140;
  id v87 = v12;
  id v118 = v87;
  uint64_t v74 = v22;
  id v119 = v74;
  id v101 = v100;
  id v120 = v101;
  id v75 = v99;
  id v121 = v75;
  uint64_t v122 = v113;
  v124 = buf;
  uint64_t v125 = v139;
  id v114 = v102;
  id v123 = v114;
  LOBYTE(v86) = v70;
  BYTE4(v84) = v88;
  BYTE3(v84) = v89;
  BYTE2(v84) = v90;
  BYTE1(v84) = v91;
  LOBYTE(v84) = v92;
  HIBYTE(v78) = v93;
  BYTE6(v78) = v94;
  BYTE5(v78) = v95;
  BYTE4(v78) = v96;
  LODWORD(v78) = v98;
  objc_msgSend( v108,  "sendData:service:protobuf:resourcePath:resourceMetadata:priority:dataProtectionClass:nonWaking:nonCloudWaking:requir eBluetooth:requireLocalWiFi:queueOneIdentifier:expirationDate:enforceRemoteTimeouts:expectsPeerResponse:wantsAppAck: compressPayload:compressed:peerResponseIdentifier:messageID:topic:awdTopic:command:fromID:uriToDeviceID:localDeviceD estinationDeviceUUID:bypassDuet:duetIdentifiersOverride:messageType:fallbackBlock:progressBlock:completionBlock:",  v116,  v112,  v111,  v107,  v106,  v97,  v78,  v105,  v104,  v84,  v103,  v66,  v74,  v110,  v67,  v68,  v115,  v69,  v86,  v71,  v73,  v109,  0,  v117);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v139, 8);
}

- (void)_sendRemotelyWithSendParameters:(id)a3 data:(id)a4 protobuf:(id)a5 willSendBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v285 = a4;
  id v284 = a5;
  id v287 = a6;
  v289 = (void (**)(id, IDSDeliveryContext *))a7;
  uint64_t v291 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v315 = _os_activity_create( (void *)&_mh_execute_header,  "IDSAccount send remotely",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v315, &state);
  v286 = (void *)objc_claimAutoreleasedReturnValue([v291 dataUsageBundleID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v291 identifier]);
  char v290 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"service-disable-%@",  v13));

  if (v290)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:v290]);

    uint64_t v16 = v15;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  v283 = v16;
  if ((int)[v16 intValue] < 1)
  {
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      uint64_t v36 = objc_alloc(&OBJC_CLASS___NSError);
      v280 = -[NSError initWithDomain:code:userInfo:]( v36,  "initWithDomain:code:userInfo:",  IDSSendErrorDomain,  7LL,  0LL);
      uint64_t v37 = OSLogHandleForIDSCategory("Warning");
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v39 = (id)objc_claimAutoreleasedReturnValue([v12 destinations]);
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v317 = v39;
        *(_WORD *)&v317[8] = 2112;
        id v318 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Failing message to: %@   from: %@    invalid caller ID",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v41))
      {
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v12 destinations]);
        __int128 v234 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
        _IDSWarnV(@"IDSFoundation", @"Failing message to: %@   from: %@    invalid caller ID");

        id v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destinations", v42, v234));
        unsigned __int8 v235 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Failing message to: %@   from: %@    invalid caller ID");

        id v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destinations", v43, v235));
        int v236 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
        _IDSLogTransport( @"Warning",  @"IDS",  @"Failing message to: %@   from: %@    invalid caller ID");
      }

      if (!v289) {
        goto LABEL_232;
      }
      unsigned int v44 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  7LL,  v280,  1LL);
      v289[2](v289, v44);
LABEL_231:

LABEL_232:
      goto LABEL_233;
    }

    uint64_t v22 = OSLogHandleForIDSCategory("GUIDTRACE");
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v25 = JWUUIDPushObjectToString(v24);
      id v26 = (id)objc_claimAutoreleasedReturnValue(v25);
      id v27 = (id)objc_claimAutoreleasedReturnValue([v291 identifier]);
      *(_DWORD *)buf = 138412546;
      *(void *)__int16 v317 = v26;
      *(_WORD *)&v317[8] = 2112;
      id v318 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "OUTGOING-REMOTE_SEND:%@ SERVICE:%@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v28) && _IDSShouldLog(0LL, @"GUIDTRACE"))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v30 = JWUUIDPushObjectToString(v29);
      __int128 v225 = (void *)objc_claimAutoreleasedReturnValue(v30);
      __int128 v232 = (void *)objc_claimAutoreleasedReturnValue([v291 identifier]);
      _IDSLogV(0LL, @"IDSFoundation", @"GUIDTRACE", @"OUTGOING-REMOTE_SEND:%@ SERVICE:%@");
    }

    if (-[IDSDAccount accountType](self, "accountType", v225, v232))
    {
      uint64_t v31 = _IDSCopyMyPhoneNumbers(0LL);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 _stripFZIDPrefix]);
      [v32 containsObject:v34];
    }

    v280 = (NSError *)objc_claimAutoreleasedReturnValue([v12 destinations]);
    theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
    if (v35)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSCommandKey, v35);
    }

    else
    {
      id v45 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1006A7610();
      }
    }

    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v12 commandContext]);
    if (v46) {
      CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSCommandContextKey, v46);
    }

    id v47 = (void *)objc_claimAutoreleasedReturnValue([v12 queueOneIdentifier]);
    if (v47) {
      CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSStorageQueueOneIdentifier, v47);
    }

    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
    if ([v48 integerValue] != (id)227)
    {
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
      if ([v49 integerValue] != (id)243)
      {
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
        if ([v50 integerValue] != (id)242)
        {
          unsigned int v98 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
          BOOL v99 = [v98 integerValue] == (id)250;

          if (!v99) {
            goto LABEL_73;
          }
          goto LABEL_40;
        }
      }
    }

LABEL_40:
    if ([v12 priority] == (id)300
      && ([v12 wantsResponse] & 1) == 0
      && ([v12 fireAndForget] & 1) == 0)
    {
      uint64_t v51 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "Urgent priority messages should require a response for reliability",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v53)
        && _IDSShouldLog(1LL, @"IDSDAccount"))
      {
        _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Urgent priority messages should require a response for reliability");
      }

      [v12 setWantsResponse:1];
    }

    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v12 expirationDate]);
    id v55 = v54;
    if (v54)
    {
      [v54 timeIntervalSinceNow];
      if (v56 < 5.0) {
        [v12 setFireAndForget:1];
      }
    }

    if ([v12 wantsResponse] && objc_msgSend(v12, "fireAndForget"))
    {
      uint64_t v57 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEBUG,  "Messages that want a response should not be fireAndForget",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v59)
        && _IDSShouldLog(1LL, @"IDSDAccount"))
      {
        _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Messages that want a response should not be fireAndForget");
      }

      [v12 setFireAndForget:0];
    }

    if (([v12 wantsResponse] & 1) == 0)
    {
      uint64_t v60 = OSLogHandleForIDSCategory("IDSDAccount");
      double v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEBUG,  "Disabling IDS-level ack for this message",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v62)
        && _IDSShouldLog(1LL, @"IDSDAccount"))
      {
        _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"Disabling IDS-level ack for this message");
      }

      id v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
      if (v63)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"ack", v63);
      }

      else
      {
        id v64 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A7590();
        }
      }
    }

LABEL_73:
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
    BOOL v66 = v65 == 0LL;

    if (v66)
    {
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
      uint64_t v68 = IDSGetUUIDData(v67);
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      [v12 setMessageUUID:v69];
    }

    if ([v12 wantsDeliveryStatus])
    {
      CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSWantsDeliveryStatusKey, &__kCFBooleanTrue);
      unsigned __int8 v70 = (void *)objc_claimAutoreleasedReturnValue([v12 deliveryStatusContext]);
      if (v70) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSDeliveryStatusContextKey, v70);
      }
    }

    if ([v12 wantsCertifiedDelivery])
    {
      id v71 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", _IDSCertifiedDeliveryVersion());
      uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
      if (v72)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSCertifiedDeliveryVersionKey, v72);
      }

      else
      {
        id v73 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A750C();
        }
      }
    }

    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v12 peerResponseIdentifier]);

    if (v74)
    {
      id v75 = (void *)objc_claimAutoreleasedReturnValue([v12 peerResponseIdentifier]);
      uint64_t v76 = IDSGetUUIDData(v75);
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(v76);

      if (v77) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSPeerResponseIdentifierKey, v77);
      }
    }

    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v12 originalTimestamp]);

    if (v78)
    {
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v12 originalTimestamp]);
      if (v79) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSOriginalTimestampKey, v79);
      }
    }

    if ([v12 isUPlusOne])
    {
      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 isUPlusOne]));
      if (v80) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSIsUPlusOneKey, v80);
      }
    }

    uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v12 isInitiator]);

    if (v81)
    {
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v12 isInitiator]);
      if (v82) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSGroupSessionIsInitiatorKey, v82);
      }
    }

    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v12 quickRelayUserType]);

    if (v83)
    {
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v12 quickRelayUserType]);
      if (v84) {
        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSQuickRelayUserTypeKey, v84);
      }
    }

    if ([v12 useDictAsTopLevel])
    {
      id v85 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
      v312[0] = _NSConcreteStackBlock;
      v312[1] = 3221225472LL;
      v312[2] = sub_1002D8F0C;
      v312[3] = &unk_1008F8418;
      __int16 v313 = theDict;
      [v85 enumerateKeysAndObjectsUsingBlock:v312];

      unsigned __int8 v275 = 0LL;
      uint64_t v86 = v313;
    }

    else
    {
      id v87 = (void *)objc_claimAutoreleasedReturnValue([v12 bulkedPayload]);

      if (v87)
      {
        unsigned __int8 v88 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
        id v89 = [v88 count];

        if (v89)
        {
          unsigned __int8 v90 = (void *)objc_claimAutoreleasedReturnValue([v12 bulkedPayload]);
          id v91 = [v90 mutableCopy];

          unsigned __int8 v92 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
          [v91 addObject:v92];

          uint64_t v86 = (NSMutableDictionary *)v91;
        }

        else
        {
          uint64_t v86 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v12 bulkedPayload]);
        }

        uint64_t v100 = JWEncodeArray(v86);
        id v101 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v100);
        id v102 = -[NSMutableDictionary length](v101, "length");
        if ([v12 compressPayload])
        {
          unsigned __int8 v275 = (NSMutableDictionary *)-[NSMutableDictionary _FTCopyOptionallyGzippedData]( v101,  "_FTCopyOptionallyGzippedData");
          id v103 = -[NSMutableDictionary length](v275, "length");
          if (v102 > v103)
          {
            uint64_t v104 = OSLogHandleForIDSCategory("IDSDAccount");
            uint64_t v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)__int16 v317 = (_DWORD)v102;
              *(_WORD *)&v317[4] = 1024;
              *(_DWORD *)&v317[6] = (_DWORD)v103;
              _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "Compressed IDS bulked payload data from:%u  to:%u",  buf,  0xEu);
            }

            if (os_log_shim_legacy_logging_enabled(v106)
              && _IDSShouldLog(0LL, @"IDSDAccount"))
            {
              id v226 = v102;
              id v233 = v103;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Compressed IDS bulked payload data from:%u  to:%u");
            }

            unsigned __int8 v275 = v275;

            id v101 = v275;
          }
        }

        else
        {
          unsigned __int8 v275 = 0LL;
        }

        if ((objc_msgSend(v12, "encryptPayload", v226, v233) & 1) != 0
          || (unsigned __int8 v107 = (void *)objc_claimAutoreleasedReturnValue([v12 dataToEncrypt]),
              BOOL v108 = v107 == 0LL,
              v107,
              !v108))
        {
          uint64_t v109 = OSLogHandleForIDSCategory("Warning");
          unsigned __int8 v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_ERROR,  "Cannot use encryption with bulked payloads!",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v111))
          {
            _IDSWarnV(@"IDSFoundation", @"Cannot use encryption with bulked payloads!");
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Cannot use encryption with bulked payloads!");
            _IDSLogTransport(@"Warning", @"IDS", @"Cannot use encryption with bulked payloads!");
          }
        }

        id v112 = v101;
        if (v112) {
          CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSBulkedPayloadKey, v112);
        }

        CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSIsBulkedPayloadKey, &__kCFBooleanTrue);
      }

      else
      {
        uint64_t v86 = (NSMutableDictionary *)v285;
        unsigned __int8 v93 = (void *)objc_claimAutoreleasedReturnValue([v12 protobuf]);

        if (v93)
        {
          if ([v12 compressed])
          {
            unsigned __int8 v94 = (void *)objc_claimAutoreleasedReturnValue([v284 dictionaryRepresentationWithUncompressedData]);
            uint64_t v95 = OSLogHandleForIDSCategory("IDSDAccount");
            unsigned __int8 v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEBUG,  "Local protobuf data is compresed, use uncompressed protobuf data for remote delivery",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v97)
              && _IDSShouldLog(1LL, @"IDSDAccount"))
            {
              _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Local protobuf data is compresed, use uncompressed protobuf data for remote delivery");
            }
          }

          else
          {
            unsigned __int8 v94 = (void *)objc_claimAutoreleasedReturnValue([v284 dictionaryRepresentation]);
          }

          uint64_t v113 = JWEncodeDictionary(v94);
          id v114 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v113);

          id v115 = -[NSMutableDictionary length](v114, "length");
          if ([v12 compressPayload])
          {
            unsigned __int8 v275 = (NSMutableDictionary *)-[NSMutableDictionary _FTCopyOptionallyGzippedData]( v114,  "_FTCopyOptionallyGzippedData");
            id v116 = -[NSMutableDictionary length](v275, "length");
            if (v115 > v116)
            {
              uint64_t v117 = OSLogHandleForIDSCategory("IDSDAccount");
              id v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)__int16 v317 = (_DWORD)v115;
                *(_WORD *)&v317[4] = 1024;
                *(_DWORD *)&v317[6] = (_DWORD)v116;
                _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "Compressed protobuf serialized data from: %u  to: %u",  buf,  0xEu);
              }

              if (os_log_shim_legacy_logging_enabled(v119)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                id v226 = v115;
                id v233 = v116;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Compressed protobuf serialized data from: %u  to: %u");
              }

              unsigned __int8 v275 = v275;

              id v114 = v275;
            }
          }

          else
          {
            unsigned __int8 v275 = 0LL;
          }

          uint64_t v86 = v114;
        }

        else
        {
          unsigned __int8 v275 = 0LL;
        }

        if (objc_msgSend(v12, "encryptPayload", v226, v233))
        {
          id v120 = (void *)objc_claimAutoreleasedReturnValue([v12 dataToEncrypt]);

          if (v120)
          {
            uint64_t v121 = OSLogHandleForIDSCategory("Warning");
            uint64_t v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_ERROR,  "Using incompatible combination of wantsEncryptedPayload and dataToEncrypt!",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v123))
            {
              _IDSWarnV( @"IDSFoundation",  @"Using incompatible combination of wantsEncryptedPayload and dataToEncrypt!");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Using incompatible combination of wantsEncryptedPayload and dataToEncrypt!");
              _IDSLogTransport( @"Warning",  @"IDS",  @"Using incompatible combination of wantsEncryptedPayload and dataToEncrypt!");
            }
          }

          uint64_t v124 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEBUG,  "Setting IDS payload to be encrypted.",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v126)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"Setting IDS payload to be encrypted.");
          }

          [v12 setDataToEncrypt:v86];
        }

        else
        {
          uint64_t v127 = OSLogHandleForIDSCategory("IDSDAccount");
          id v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v129 = -[NSMutableDictionary length](v86, "length");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)__int16 v317 = v129;
            _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "Setting IDS payload with size: %u",  buf,  8u);
          }

          if (os_log_shim_legacy_logging_enabled(v130)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            id v226 = -[NSMutableDictionary length](v86, "length");
            _IDSLogV(0LL, @"IDSFoundation", @"IDSDAccount", @"Setting IDS payload with size: %u");
          }

          uint64_t v86 = v86;
          if (v86) {
            CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSPayloadKey, v86);
          }
        }
      }
    }

    if ([v12 homeKitPayload])
    {
      id v278 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
    }

    else
    {
      uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue([v12 fromID]);
      id v278 = (void *)objc_claimAutoreleasedReturnValue([v131 _bestGuessURI]);
    }

    id v279 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount _registrationCert](self, "_registrationCert", v226));
    uint64_t v132 = OSLogHandleForIDSCategory("IDSDAccount");
    id v133 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
    {
      registrationInfo = self->_registrationInfo;
      id v135 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](registrationInfo, "uris"));
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v317 = registrationInfo;
      *(_WORD *)&v317[8] = 2112;
      id v318 = v135;
      __int16 v319 = 2112;
      id v320 = v279;
      _os_log_impl( (void *)&_mh_execute_header,  v133,  OS_LOG_TYPE_DEBUG,  "Registration %@   URIs %@  callerCert %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v136)
      && _IDSShouldLog(1LL, @"IDSDAccount"))
    {
      id v137 = self->_registrationInfo;
      id v233 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](v137, "uris"));
      unsigned int v240 = v279;
      __int128 v228 = v137;
      _IDSLogV(1LL, @"IDSFoundation", @"IDSDAccount", @"Registration %@   URIs %@  callerCert %@");
    }

    uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service", v228, v233, v240));
    id v281 = (void *)objc_claimAutoreleasedReturnValue([v138 pushTopic]);

    uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    v277 = (void *)objc_claimAutoreleasedReturnValue([v139 identifier]);

    uint64_t v140 = OSLogHandleForTransportCategory("IDSDAccount");
    uint64_t v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      id v142 = (id)objc_claimAutoreleasedReturnValue([v12 command]);
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v317 = v142;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "!setState command=%@", buf, 0xCu);
    }

    uint64_t v143 = OSLogHandleForTransportCategory("IDSDAccount");
    __int16 v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
    {
      id v145 = (id)objc_claimAutoreleasedReturnValue([v12 destinations]);
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v317 = v145;
      _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "!setState destinations=%@", buf, 0xCu);
    }

    uint64_t v146 = OSLogHandleForIDSCategory("IDSDAccount");
    id v147 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
    {
      id v148 = (id)objc_claimAutoreleasedReturnValue([v12 command]);
      uint64_t v149 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v150 = JWUUIDPushObjectToString(v149);
      id v151 = (id)objc_claimAutoreleasedReturnValue(v150);
      id v152 = (id)objc_claimAutoreleasedReturnValue([v12 destinations]);
      id v153 = (id)objc_claimAutoreleasedReturnValue([v12 destinations]);
      *(_DWORD *)buf = 138413314;
      *(void *)__int16 v317 = v148;
      *(_WORD *)&v317[8] = 2112;
      id v318 = v151;
      __int16 v319 = 2112;
      id v320 = v152;
      __int16 v321 = 2112;
      id v322 = v153;
      __int16 v323 = 2112;
      v324 = v281;
      _os_log_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_DEFAULT,  "Sending message (c = %@) %@ to filteredDestinations %@ (originally %@) for topic %@",  buf,  0x34u);
    }

    if (os_log_shim_legacy_logging_enabled(v154)
      && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      char v155 = (void *)objc_claimAutoreleasedReturnValue([v12 command]);
      id v156 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v157 = JWUUIDPushObjectToString(v156);
      uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue(v157);
      id v159 = (void *)objc_claimAutoreleasedReturnValue([v12 destinations]);
      v243 = (void *)objc_claimAutoreleasedReturnValue([v12 destinations]);
      id v245 = v281;
      id v237 = v158;
      __int16 v241 = v159;
      id v229 = v155;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending message (c = %@) %@ to filteredDestinations %@ (originally %@) for topic %@");
    }

    uint64_t v160 = OSLogHandleForTransportCategory("IDSDAccount");
    __int16 v161 = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
      uint64_t v163 = JWUUIDPushObjectToString(v162);
      id v164 = (id)objc_claimAutoreleasedReturnValue(v163);
      uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue([v12 finalDestinationURIs]);
      uint64_t v166 = IMLoggingStringForArray(v165);
      id v167 = (id)objc_claimAutoreleasedReturnValue(v166);
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v317 = v164;
      *(_WORD *)&v317[8] = 2112;
      id v318 = v167;
      __int16 v319 = 2112;
      id v320 = v281;
      _os_log_impl( (void *)&_mh_execute_header,  v161,  OS_LOG_TYPE_DEFAULT,  "Sending message ID (%@) using push to %@ for topic %@",  buf,  0x20u);
    }

    uint64_t v169 = os_log_shim_legacy_logging_enabled(v168);
    if ((_DWORD)v169)
    {
      if (_IDSShouldLogTransport(v169))
      {
        uint64_t v170 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
        uint64_t v171 = JWUUIDPushObjectToString(v170);
        uint64_t v172 = (void *)objc_claimAutoreleasedReturnValue(v171);
        __int128 v173 = (void *)objc_claimAutoreleasedReturnValue([v12 finalDestinationURIs]);
        uint64_t v174 = IMLoggingStringForArray(v173);
        id v237 = (void *)objc_claimAutoreleasedReturnValue(v174);
        __int16 v241 = v281;
        id v229 = v172;
        _IDSLogTransport( @"IDSDAccount",  @"IDS",  @"Sending message ID (%@) using push to %@ for topic %@");

        if (_IDSShouldLog(0LL, @"IDSDAccount"))
        {
          uint64_t v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageUUID", v172, v237, v281));
          uint64_t v176 = JWUUIDPushObjectToString(v175);
          uint64_t v177 = (void *)objc_claimAutoreleasedReturnValue(v176);
          v178 = (void *)objc_claimAutoreleasedReturnValue([v12 finalDestinationURIs]);
          uint64_t v179 = IMLoggingStringForArray(v178);
          id v237 = (void *)objc_claimAutoreleasedReturnValue(v179);
          __int16 v241 = v281;
          id v229 = v177;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending message ID (%@) using push to %@ for topic %@");
        }
      }
    }

    if (v287)
    {
      v310[0] = _NSConcreteStackBlock;
      v310[1] = 3221225472LL;
      v310[2] = sub_1002D8F18;
      v310[3] = &unk_1008F7C78;
      id v311 = v287;
      uint64_t v180 = objc_retainBlock(v310);
    }

    else
    {
      uint64_t v180 = 0LL;
    }

    uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interestingRegistrationProperties", v229, v237, v241, v243, v245));
    if (v181
      || (uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue([v12 requireAllRegistrationProperties])) != 0)
    {
    }

    else
    {
      __int128 v223 = (void *)objc_claimAutoreleasedReturnValue([v12 requireLackOfRegistrationProperties]);
      BOOL v224 = v223 == 0LL;

      if (v224)
      {
        id v282 = 0LL;
LABEL_211:
        if (v289)
        {
          v308[0] = _NSConcreteStackBlock;
          v308[1] = 3221225472LL;
          v308[2] = sub_1002D8F24;
          v308[3] = &unk_100900168;
          __int16 v309 = v289;
          v276 = objc_retainBlock(v308);
        }

        else
        {
          v276 = 0LL;
        }

        uint64_t v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resourcePath", v230, v238, v242));

        if (v192)
        {
          uint64_t v193 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
          if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Only MMCS transfe r is avaible at this time, uploading file",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v195)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Attempt to send a file transfer over IDS to a remote destination over File Transfer API. Only MMCS transfer is avaible at this time, uploading file");
          }

          CFDictionarySetValue((CFMutableDictionaryRef)theDict, IDSCommandKey, &off_100947920);
          id v196 = -[IDSDaemon _IMTransferServiceController]_0();
          id v197 = (void *)objc_claimAutoreleasedReturnValue(v196);
          id v198 = (void *)objc_claimAutoreleasedReturnValue([v12 resourcePath]);
          id v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
          v296[0] = _NSConcreteStackBlock;
          v296[1] = 3221225472LL;
          v296[2] = sub_1002D9038;
          v296[3] = &unk_100900190;
          id v297 = v12;
          id v298 = theDict;
          id v299 = v277;
          v300 = self;
          id v301 = v278;
          id v302 = v279;
          id v303 = v281;
          id v304 = v282;
          id v305 = v276;
          v306 = v180;
          v307 = v289;
          [v197 sendFilePath:v198 topic:v299 userInfo:0 transferID:v199 sourceAppID:v286 encryptFile:1 progressBlock:0 completionBlock:v296];

          id v200 = v297;
        }

        else
        {
          BOOL v201 = +[IDSRegistrationCacheStateTransportPolicy shouldQueryUpdateOfParams:]( &OBJC_CLASS___IDSRegistrationCacheStateTransportPolicy,  "shouldQueryUpdateOfParams:",  v12);
          if (v201)
          {
            __int128 v204 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
            __int128 v205 = (void *)objc_claimAutoreleasedReturnValue([v204 queryUpdateNotifier]);
            __int128 v206 = -[IDSURI initWithPrefixedURI:](objc_alloc(&OBJC_CLASS___IDSURI), "initWithPrefixedURI:", v278);
            __int128 v207 = (void *)objc_claimAutoreleasedReturnValue([v205 devicesHashForURI:v206 andService:v291]);

            if (v207)
            {
              id v208 = v207;
              CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"qH", v208);

              uint64_t v209 = OSLogHandleForIDSCategory("IDSDAccount");
              __int128 v210 = (os_log_s *)objc_claimAutoreleasedReturnValue(v209);
              if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
              {
                id v211 = (id)objc_claimAutoreleasedReturnValue([v208 debugDescription]);
                *(_DWORD *)buf = 138412802;
                *(void *)__int16 v317 = v211;
                *(_WORD *)&v317[8] = 2112;
                id v318 = v278;
                __int16 v319 = 2112;
                id v320 = v291;
                _os_log_impl( (void *)&_mh_execute_header,  v210,  OS_LOG_TYPE_DEFAULT,  "Added query update hash {hash: %@, fromURI: %@, service: %@}",  buf,  0x20u);
              }

              if (os_log_shim_legacy_logging_enabled(v212)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                HIDWORD(v239) = HIDWORD(v278);
                __int128 v231 = (void *)objc_claimAutoreleasedReturnValue([v208 debugDescription]);
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Added query update hash {hash: %@, fromURI: %@, service: %@}");
              }
            }
          }

          v271 = v180;
          __int16 v213 = (void *)voucher_copy(v201, v202, v203);
          v269 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDeliveryController sharedInstance]( &OBJC_CLASS___IDSDeliveryController,  "sharedInstance"));
          unsigned int v274 = (void *)objc_claimAutoreleasedReturnValue([v12 messageUUID]);
          uint64_t v214 = JWUUIDPushObjectToString(v274);
          v268 = (void *)objc_claimAutoreleasedReturnValue(v214);
          id v267 = (void *)objc_claimAutoreleasedReturnValue([v12 dataToEncrypt]);
          id v266 = (void *)objc_claimAutoreleasedReturnValue([v12 encryptionAttributes]);
          unsigned int v260 = [v12 wantsResponse];
          v265 = (void *)objc_claimAutoreleasedReturnValue([v12 expirationDate]);
          unsigned __int8 v259 = [v12 enforceRemoteTimeouts];
          id v273 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          unsigned __int8 v258 = [v273 canUseLargePayload];
          v272 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          unsigned __int8 v257 = [v272 sendOnePerToken];
          v270 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
          unsigned __int8 v256 = [v270 allowPartialSendsToSucceed];
          id v255 = [v12 priority];
          unsigned __int8 v254 = [v12 fireAndForget];
          v264 = (void *)objc_claimAutoreleasedReturnValue([v12 fromShortHandle]);
          v263 = (void *)objc_claimAutoreleasedReturnValue([v12 finalDestinationURIs]);
          id v262 = (void *)objc_claimAutoreleasedReturnValue([v12 accessToken]);
          unsigned __int8 v253 = [v12 fakeMessage];
          unsigned __int8 v252 = [v12 alwaysSkipSelf];
          unsigned __int8 v251 = [v12 alwaysIncludeSelf];
          id v250 = [v12 forceQuery];
          id v261 = (void *)objc_claimAutoreleasedReturnValue([v12 pushPriority]);
          unsigned __int8 v249 = [v12 ignoreMaxRetryCount];
          unsigned __int8 v215 = [v12 disallowRefresh];
          v216 = (void *)objc_claimAutoreleasedReturnValue([v12 originalTimestamp]);
          __int16 v217 = (void *)objc_claimAutoreleasedReturnValue([v12 prioritizedTokenList]);
          unsigned __int8 v218 = [v12 wantsFirewallDonation];
          v219 = (void *)objc_claimAutoreleasedReturnValue([v12 deliveryMinimumTimeDelay]);
          v220 = (void *)objc_claimAutoreleasedReturnValue([v12 deliveryMinimumTime]);
          v221 = (void *)objc_claimAutoreleasedReturnValue([v12 sendMode]);
          v222 = (void *)objc_claimAutoreleasedReturnValue([v12 keyTransparencyURIVerificationMap]);
          v292[0] = _NSConcreteStackBlock;
          v292[1] = 3221225472LL;
          v292[2] = sub_1002D9A34;
          v292[3] = &unk_1008FD080;
          id v293 = v12;
          id v200 = v213;
          id v294 = v200;
          v295 = v289;
          LOBYTE(v248) = v218;
          BYTE1(v247) = v215;
          LOBYTE(v247) = v249;
          BYTE2(v246) = v251;
          BYTE1(v246) = v252;
          LOBYTE(v246) = v253;
          LOBYTE(v244) = v254;
          BYTE3(v239) = v256;
          BYTE2(v239) = v257;
          BYTE1(v239) = v258;
          LOBYTE(v239) = v259;
          objc_msgSend( v269,  "sendMessageDictionary:messageID:dataToEncrypt:withEncryptedAttributes:onService:wantsResponse:expirationDate :enforceRemoteTimeouts:canUseLargePayload:sendOnePerToken:allowPartialSendsToSucceed:priority:fireAndForget: fromID:fromShortHandle:fromIdentity:toURIs:accessToken:topic:registrationProperties:fakeMessage:alwaysSkipSe lf:alwaysIncludeSelf:forceQuery:pushPriority:ignoreMaxRetryCount:disallowRefresh:originalTimestamp:prioritiz edTokenList:wantsFirewallDonation:destinationObject:deliveryMinimumTimeDelay:deliveryMinimumTime:sendMode:KT URIVerificationMap:ackBlock:willSendBlock:sendCompletionBlock:",  theDict,  v268,  v267,  v266,  v277,  v260,  v265,  v239,  v255,  v244,  v278,  v264,  v279,  v263,  v262,  v281,  v282,  v246,  v250,  v261,  v247,  v216,  v217,  v248,  v280,  v219,  v220,  v221,  v222,  v276,  v271,  v292);

          uint64_t v180 = v271;
        }

        unsigned int v44 = (IDSDeliveryContext *)theDict;
        goto LABEL_231;
      }
    }

    id v282 = objc_alloc_init(&OBJC_CLASS___IDSRegistrationProperties);
    uint64_t v182 = (void *)objc_claimAutoreleasedReturnValue([v12 requireAllRegistrationProperties]);
    -[IDSRegistrationProperties setRequireAll:](v282, "setRequireAll:", v182);

    id v183 = (void *)objc_claimAutoreleasedReturnValue([v12 requireLackOfRegistrationProperties]);
    -[IDSRegistrationProperties setLackAll:](v282, "setLackAll:", v183);

    if (v287)
    {
      id v184 = (void *)objc_claimAutoreleasedReturnValue([v12 interestingRegistrationProperties]);
      -[IDSRegistrationProperties setInteresting:](v282, "setInteresting:", v184);
    }

    uint64_t v185 = OSLogHandleForIDSCategory("IDSDAccount");
    uint64_t v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);
    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
    {
      id v187 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties requireAll](v282, "requireAll"));
      id v188 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties lackAll](v282, "lackAll"));
      id v189 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties interesting](v282, "interesting"));
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v317 = v187;
      *(_WORD *)&v317[8] = 2112;
      id v318 = v188;
      __int16 v319 = 2112;
      id v320 = v189;
      _os_log_impl( (void *)&_mh_execute_header,  v186,  OS_LOG_TYPE_DEFAULT,  "This send requires %@, a lack of %@, and is interested in %@ registration properties",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v190)
      && _IDSShouldLog(0LL, @"IDSDAccount"))
    {
      __int128 v191 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties requireAll](v282, "requireAll"));
      id v238 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties lackAll](v282, "lackAll"));
      id v242 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationProperties interesting](v282, "interesting"));
      __int128 v230 = v191;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"This send requires %@, a lack of %@, and is interested in %@ registration properties");
    }

    goto LABEL_211;
  }

  uint64_t v17 = OSLogHandleForIDSCategory("IDSDAccount");
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v317 = v291;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Server has disabled service: %@, dropping this on the floor",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v19) && _IDSShouldLog(0LL, @"IDSDAccount")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Server has disabled service: %@, dropping this on the floor");
  }
  IMLogBacktrace(@"IDSDAccount");
LABEL_233:

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v315);
}

- (void)_rapportSendWithSendParameters:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 protobuf]);
  if (v8)
  {
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);

    if (!v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 message]);
      uint64_t v13 = (IDSDeliveryContext *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pushTopic]);

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 command]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 finalDestinationURIs]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_1009001B0));

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRapportDeliveryController sharedInstance]( &OBJC_CLASS___IDSRapportDeliveryController,  "sharedInstance"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1002D9F50;
      v20[3] = &unk_1008FA288;
      id v21 = v7;
      [v19 sendMessage:v12 messageID:v13 topic:v15 command:v16 destinationIDs:v18 completionBlock:v20];

      goto LABEL_7;
    }
  }

  uint64_t v10 = IDSSendErrorDomain;
  NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
  unsigned int v23 = @"IDS doesn't support sending protobuf or data to rapport destinations";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  23LL,  v11));

  uint64_t v13 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  23LL,  v12,  1LL);
  if (v7) {
    (*((void (**)(id, IDSDeliveryContext *))v7 + 2))(v7, v13);
  }
LABEL_7:
}

- (void)sendMessageWithSendParameters:(id)a3 willSendBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v285 = a4;
  id v287 = a5;
  im_assert_primary_base_queue(v287, v9);
  v288 = self;
  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (-[IDSDAccount accountType](self, "accountType") == 2)
    {
      uint64_t v10 = OSLogHandleForTransportCategory("Messaging");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending via account that's type Local -- forcing local delivery.",  buf,  2u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport( @"Messaging",  @"IDS",  @"Sending via account that's type Local -- forcing local delivery.");
          if (_IDSShouldLog(0LL, @"Messaging")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Messaging",  @"Sending via account that's type Local -- forcing local delivery.");
          }
        }
      }

      [v8 setLocalDelivery:1];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 destinations]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 destinationURIs]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allObjects]);
    v289[0] = _NSConcreteStackBlock;
    v289[1] = 3221225472LL;
    v289[2] = sub_1002DC0A0;
    void v289[3] = &unk_1008F64D0;
    v289[4] = self;
    id v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByApplyingBlock:", v289));

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
    LODWORD(v15) = [v17 useiMessageCallerID];

    if (!(_DWORD)v15)
    {
LABEL_33:
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
      BOOL v50 = v49 == 0LL;

      if (v50)
      {
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](v288, "primaryRegistration"));
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 dsHandle]);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 _stripFZIDPrefix]);

        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
        id v55 = [v54 shouldRegisterUsingDSHandle];

        double v56 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 identifier]);
        uint64_t v58 = _IDSPrefersPhoneNumbersForServiceIdentifier(v57);

        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccount unprefixedURIStringsFromRegistration]( v288,  "unprefixedURIStringsFromRegistration"));
        uint64_t v60 = (void *)_IDSCopyCallerID(0LL, v59, v53, v55, v58);
        [v8 setFromID:v60];
      }

      v286 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
      double v61 = (void *)objc_claimAutoreleasedReturnValue([v8 protobuf]);

      if (v61)
      {
        uint64_t v62 = objc_alloc(&OBJC_CLASS___IDSProtobuf);
        id v63 = (void *)objc_claimAutoreleasedReturnValue([v8 protobuf]);
        id v284 = -[IDSProtobuf initWithDictionary:](v62, "initWithDictionary:", v63);
      }

      else
      {
        id v284 = 0LL;
      }

      id v64 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);

      if (v64)
      {
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
        BOOL v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKey:IDSMessageResourceTransferURLKey]);
        if (v66)
        {

          id v67 = (id)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:IDSMessageResourceTransferMetadataKey]);
          uint64_t v68 = OSLogHandleForIDSCategory("IDSDAccount");
          uint64_t v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)uint64_t v291 = v66;
            *(_WORD *)&v291[8] = 2112;
            id v292 = v67;
            _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "Sending Resource at path %@ with metadata %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v70)
            && _IDSShouldLog(0LL, @"IDSDAccount"))
          {
            id v197 = v66;
            os_log_t v201 = (os_log_t)v67;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Sending Resource at path %@ with metadata %@");
          }

          objc_msgSend(v8, "setResourcePath:", v66, v197, v201);
          [v8 setResourceMetadata:v67];
          v286 = 0LL;
        }

        else
        {
          uint64_t v71 = JWEncodeDictionary(v65);
          id v67 = (id)objc_claimAutoreleasedReturnValue(v71);

          v286 = v67;
        }
      }

      if (!v286)
      {
        if (!v284)
        {
          id v282 = 0LL;
          v286 = 0LL;
          id v89 = [0 length];
          goto LABEL_82;
        }

        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v284, "data"));
        id v79 = [v78 length];

        if ([v8 compressPayload])
        {
          uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v284, "data"));
          id v282 = [v80 _FTCopyOptionallyGzippedData];

          uint64_t v81 = (os_log_s *)[v282 length];
          if (v79 > v81)
          {
            uint64_t v82 = OSLogHandleForIDSCategory("IDSDAccount");
            uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v291 = (_DWORD)v79;
              *(_WORD *)&v291[4] = 1024;
              *(_DWORD *)&v291[6] = (_DWORD)v81;
              _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEBUG,  "Compressed protobuf data from: %u  to: %u",  buf,  0xEu);
            }

            if (os_log_shim_legacy_logging_enabled(v84)
              && _IDSShouldLog(1LL, @"IDSDAccount"))
            {
              id v197 = v79;
              os_log_t v201 = v81;
              _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Compressed protobuf data from: %u  to: %u");
            }

            id v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v284, "data", v197, v201));
            -[IDSProtobuf setUncompressedData:](v284, "setUncompressedData:", v85);

            -[IDSProtobuf setData:](v284, "setData:", v282);
            v286 = 0LL;
            uint64_t v77 = 1LL;
            goto LABEL_81;
          }
        }

        else
        {
          uint64_t v81 = 0LL;
          id v282 = 0LL;
        }

        uint64_t v90 = OSLogHandleForIDSCategory("IDSDAccount");
        id v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)uint64_t v291 = (_DWORD)v79;
          *(_WORD *)&v291[4] = 1024;
          *(_DWORD *)&v291[6] = (_DWORD)v81;
          _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEBUG,  "Use uncompressed protobuf data (original: %u compressed: %u)",  buf,  0xEu);
        }

        if (os_log_shim_legacy_logging_enabled(v92)
          && _IDSShouldLog(1LL, @"IDSDAccount"))
        {
          id v197 = v79;
          os_log_t v201 = v81;
          _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Use uncompressed protobuf data (original: %u compressed: %u)");
        }

        uint64_t v77 = 0LL;
        v286 = 0LL;
        goto LABEL_81;
      }

      id v72 = [v286 length];
      if ([v8 compressPayload])
      {
        id v282 = [v286 _FTCopyOptionallyGzippedData];
        id v73 = (os_log_s *)[v282 length];
        if (v72 > v73)
        {
          uint64_t v74 = OSLogHandleForIDSCategory("IDSDAccount");
          id v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v291 = (_DWORD)v72;
            *(_WORD *)&v291[4] = 1024;
            *(_DWORD *)&v291[6] = (_DWORD)v73;
            _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEBUG,  "Compressed message data from: %u  to: %u",  buf,  0xEu);
          }

          if (os_log_shim_legacy_logging_enabled(v76)
            && _IDSShouldLog(1LL, @"IDSDAccount"))
          {
            id v197 = v72;
            os_log_t v201 = v73;
            _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Compressed message data from: %u  to: %u");
          }

          id v282 = v282;

          uint64_t v77 = 1LL;
          v286 = v282;
LABEL_81:
          objc_msgSend(v8, "setCompressed:", v77, v197, v201);
          id v89 = [v286 length];
LABEL_82:
          id v93 = v89;
          unsigned __int8 v94 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProtobuf data](v284, "data"));
          id v95 = [v94 length];

          unsigned __int8 v96 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          unint64_t v283 = (unint64_t)v93 + (void)v95;
          if (!v96)
          {
            uint64_t v106 = OSLogHandleForIDSCategory("IDSDAccount");
            unsigned __int8 v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              id v272 = (id)objc_claimAutoreleasedReturnValue([v8 bulkedPayload]);
              id v275 = (id)objc_claimAutoreleasedReturnValue([v8 fromID]);
              os_log_t loga = (os_log_t)(id)objc_claimAutoreleasedReturnValue([v8 destinations]);
              BOOL v108 = @"NO";
              else {
                uint64_t v109 = @"NO";
              }
              v269 = v109;
              else {
                unsigned __int8 v110 = @"NO";
              }
              id v267 = v110;
              else {
                uint64_t v111 = @"NO";
              }
              v264 = v111;
              [v8 timeout];
              uint64_t v113 = v112;
              id v114 = (id)objc_claimAutoreleasedReturnValue([v8 command]);
              else {
                id v115 = @"NO";
              }
              else {
                id v116 = @"NO";
              }
              uint64_t v117 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v8 deliveryStatusContext]);
              id v118 = (id)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
              if ([v8 priority] == (id)300)
              {
                uint64_t v119 = @"URGENT";
              }

              else if ([v8 priority] == (id)200)
              {
                uint64_t v119 = @"Default";
              }

              else
              {
                uint64_t v119 = @"Sync";
              }

              uint64_t v122 = (__CFString *)objc_retainBlock(v287);
              *(_DWORD *)buf = 134221826;
              *(void *)uint64_t v291 = v283;
              *(_WORD *)&v291[8] = 2112;
              id v292 = v272;
              __int16 v293 = 2112;
              id v294 = v275;
              __int16 v295 = 2112;
              os_log_t v296 = loga;
              __int16 v297 = 2112;
              id v298 = v269;
              __int16 v299 = 2112;
              v300 = v267;
              __int16 v301 = 2112;
              id v302 = v264;
              __int16 v303 = 2048;
              id v304 = v113;
              __int16 v305 = 2112;
              id v306 = v114;
              __int16 v307 = 2112;
              v308 = v115;
              __int16 v309 = 2112;
              v310 = v116;
              __int16 v311 = 2112;
              v312 = v117;
              __int16 v313 = 2112;
              id v314 = v118;
              __int16 v315 = 2112;
              v316 = v119;
              __int16 v317 = 2112;
              id v318 = v108;
              __int16 v319 = 2048;
              id v320 = v122;
              _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptP ayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ del iveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p",  buf,  0xA2u);
            }

            if (!os_log_shim_legacy_logging_enabled(v123)
              || !_IDSShouldLog(0LL, @"IDSDAccount"))
            {
LABEL_202:
              unsigned __int8 v176 = objc_msgSend( v8,  "bypassSizeCheck",  v197,  v201,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v224,  v225,  v226);
              if (v283 <= 0x500000) {
                char v177 = 1;
              }
              else {
                char v177 = v176;
              }
              if ((v177 & 1) != 0)
              {
                if (([v8 bypassSizeCheck] & 1) != 0
                  || [v8 priority] != (id)300
                  || v283 <= 0x100000)
                {
                  -[IDSDAccount _sendMessageWithSendParametersOnMainThread:filteredDestinations:data:compressedData:protobufToSend:willSendBlock:completionBlock:]( v288,  "_sendMessageWithSendParametersOnMainThread:filteredDestinations:data:compressedData:protobufToSend:w illSendBlock:completionBlock:",  v8,  v281,  v286,  v282,  v284,  v285,  v287);
LABEL_214:

                  goto LABEL_215;
                }

                uint64_t v189 = OSLogHandleForIDSCategory("Warning");
                uint64_t v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v189);
                if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
                {
                  __int128 v191 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
                  id v192 = (id)objc_claimAutoreleasedReturnValue([v191 pushTopic]);
                  *(_DWORD *)buf = 134218242;
                  *(void *)uint64_t v291 = v283;
                  *(_WORD *)&v291[8] = 2112;
                  id v292 = v192;
                  _os_log_impl( (void *)&_mh_execute_header,  v190,  OS_LOG_TYPE_ERROR,  "Payload length %lu for topic %@ is too big to send as urgent",  buf,  0x16u);
                }

                if (os_log_shim_legacy_logging_enabled(v193))
                {
                  uint64_t v194 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
                  __int128 v205 = (void *)objc_claimAutoreleasedReturnValue([v194 pushTopic]);
                  _IDSWarnV( @"IDSFoundation",  @"Payload length %lu for topic %@ is too big to send as urgent");

                  uint64_t v195 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service", v283, v205));
                  __int128 v206 = (void *)objc_claimAutoreleasedReturnValue([v195 pushTopic]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Payload length %lu for topic %@ is too big to send as urgent");

                  id v196 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service", v283, v206));
                  __int128 v207 = (void *)objc_claimAutoreleasedReturnValue([v196 pushTopic]);
                  _IDSLogTransport( @"Warning",  @"IDS",  @"Payload length %lu for topic %@ is too big to send as urgent");
                }

                if (!v287) {
                  goto LABEL_214;
                }
              }

              else
              {
                uint64_t v178 = OSLogHandleForIDSCategory("Warning");
                uint64_t v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);
                if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v180 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
                  id v181 = (id)objc_claimAutoreleasedReturnValue([v180 pushTopic]);
                  *(_DWORD *)buf = 134218242;
                  *(void *)uint64_t v291 = v283;
                  *(_WORD *)&v291[8] = 2112;
                  id v292 = v181;
                  _os_log_impl( (void *)&_mh_execute_header,  v179,  OS_LOG_TYPE_ERROR,  "Payload length %lu for topic %@ is too big to send.",  buf,  0x16u);
                }

                if (os_log_shim_legacy_logging_enabled(v182))
                {
                  id v183 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service"));
                  uint64_t v202 = (void *)objc_claimAutoreleasedReturnValue([v183 pushTopic]);
                  _IDSWarnV(@"IDSFoundation", @"Payload length %lu for topic %@ is too big to send.");

                  id v184 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service", v283, v202));
                  uint64_t v203 = (void *)objc_claimAutoreleasedReturnValue([v184 pushTopic]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Payload length %lu for topic %@ is too big to send.");

                  uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](v288, "service", v283, v203));
                  __int128 v204 = (void *)objc_claimAutoreleasedReturnValue([v185 pushTopic]);
                  _IDSLogTransport( @"Warning",  @"IDS",  @"Payload length %lu for topic %@ is too big to send.");
                }

                if (!v287) {
                  goto LABEL_214;
                }
              }

              uint64_t v186 = objc_alloc(&OBJC_CLASS___NSError);
              id v187 = -[NSError initWithDomain:code:userInfo:]( v186,  "initWithDomain:code:userInfo:",  IDSSendErrorDomain,  8LL,  0LL);
              id v188 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  8LL,  v187,  1LL);
              (*((void (**)(id, IDSDeliveryContext *))v287 + 2))(v287, v188);

              goto LABEL_214;
            }

            os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue([v8 bulkedPayload]);
            v268 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
            v276 = (void *)objc_claimAutoreleasedReturnValue([v8 destinations]);
            uint64_t v124 = @"NO";
            else {
              uint64_t v125 = @"NO";
            }
            else {
              uint64_t v126 = @"NO";
            }
            else {
              uint64_t v127 = @"NO";
            }
            [v8 timeout];
            unsigned int v129 = v128;
            v265 = (void *)objc_claimAutoreleasedReturnValue([v8 command]);
            else {
              uint64_t v130 = @"NO";
            }
            else {
              uint64_t v131 = @"NO";
            }
            id v273 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 deliveryStatusContext]);
            id v262 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
            if ([v8 priority] == (id)300)
            {
              uint64_t v132 = @"URGENT";
            }

            else if ([v8 priority] == (id)200)
            {
              uint64_t v132 = @"Default";
            }

            else
            {
              uint64_t v132 = @"Sync";
            }

            v271 = (__CFString *)objc_retainBlock(v287);
            v220 = v124;
            v221 = v271;
            unsigned __int8 v218 = v262;
            v219 = v132;
            v216 = v131;
            __int16 v217 = v273;
            uint64_t v214 = v265;
            unsigned __int8 v215 = v130;
            __int16 v213 = v129;
            id v211 = v126;
            uint64_t v212 = v127;
            uint64_t v209 = v276;
            __int128 v210 = v125;
            os_log_t v201 = logb;
            id v208 = v268;
            id v197 = (id)v283;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"sendMessage of size %lu  bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p");
LABEL_201:

            goto LABEL_202;
          }

          uint64_t v97 = OSLogHandleForIDSCategory("IDSDAccount");
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue(v97);
          if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
LABEL_160:

            if (!os_log_shim_legacy_logging_enabled(v149)
              || !_IDSShouldLog(0LL, @"IDSDAccount"))
            {
              goto LABEL_202;
            }

            os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue([v8 message]);
            v268 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](logb, "objectForKey:", @"c"));
            uint64_t v151 = objc_opt_class(&OBJC_CLASS___NSString, v150);
            v276 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            id v152 = sub_1002DC420(v151, v276, @"fID");
            v265 = (void *)objc_claimAutoreleasedReturnValue(v152);
            uint64_t v154 = objc_opt_class(&OBJC_CLASS___NSNumber, v153);
            id v273 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 message]);
            id v155 = sub_1002DC420(v154, v273, @"fT");
            id v262 = (void *)objc_claimAutoreleasedReturnValue(v155);
            v271 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 message]);
            unsigned __int8 v258 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v271, "objectForKey:", @"g"));
            uint64_t v157 = objc_opt_class(&OBJC_CLASS___NSString, v156);
            char isKindOfClass = objc_opt_isKindOfClass(v258, v157);
            if ((isKindOfClass & 1) != 0)
            {
              unsigned __int8 v256 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
              unsigned __int8 v254 = (void *)objc_claimAutoreleasedReturnValue([v256 objectForKey:@"g"]);
              unsigned __int8 v252 = (void *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v254));
            }

            else
            {
              unsigned __int8 v256 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
              unsigned __int8 v254 = (void *)objc_claimAutoreleasedReturnValue([v256 objectForKey:@"g"]);
              uint64_t v159 = objc_opt_class(&OBJC_CLASS___NSData, v158);
              if ((objc_opt_isKindOfClass(v254, v159) & 1) == 0)
              {
                char v230 = 0;
                unsigned __int8 v252 = 0LL;
                goto LABEL_174;
              }

              uint64_t v228 = objc_claimAutoreleasedReturnValue([v8 message]);
              unsigned __int8 v252 = (void *)objc_claimAutoreleasedReturnValue([(id)v228 objectForKey:@"g"]);
            }

            char v230 = isKindOfClass ^ 1;
LABEL_174:
            uint64_t v160 = JWUUIDPushObjectToString(v252);
            uint64_t v246 = (void *)objc_claimAutoreleasedReturnValue(v160);
            id v250 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            uint64_t v244 = (__CFString *)objc_claimAutoreleasedReturnValue([v250 objectForKey:@"t"]);
            uint64_t v162 = objc_opt_class(&OBJC_CLASS___NSString, v161);
            uint64_t v248 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            id v163 = sub_1002DC420(v162, v248, @"tID");
            id v242 = (__CFString *)objc_claimAutoreleasedReturnValue(v163);
            unsigned int v240 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 bulkedPayload]);
            id v238 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
            int v236 = (void *)objc_claimAutoreleasedReturnValue([v8 destinations]);
            id v164 = @"YES";
            else {
              uint64_t v165 = @"NO";
            }
            __int128 v234 = v165;
            else {
              uint64_t v166 = @"NO";
            }
            __int128 v232 = v166;
            else {
              id v167 = @"NO";
            }
            [v8 timeout];
            uint64_t v169 = v168;
            uint64_t v170 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 command]);
            else {
              uint64_t v171 = @"NO";
            }
            else {
              uint64_t v172 = @"NO";
            }
            __int128 v173 = (void *)objc_claimAutoreleasedReturnValue([v8 deliveryStatusContext]);
            uint64_t v174 = (void *)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
            if ([v8 priority] == (id)300)
            {
              uint64_t v175 = @"URGENT";
            }

            else if ([v8 priority] == (id)200)
            {
              uint64_t v175 = @"Default";
            }

            else
            {
              uint64_t v175 = @"Sync";
            }

            __int128 v225 = v164;
            id v226 = objc_retainBlock(v287);
            __int128 v223 = v174;
            BOOL v224 = v175;
            v221 = v172;
            v222 = v173;
            v219 = v170;
            v220 = v171;
            unsigned __int8 v218 = v169;
            v216 = v232;
            __int16 v217 = v167;
            uint64_t v214 = v236;
            unsigned __int8 v215 = v234;
            uint64_t v212 = v240;
            __int16 v213 = v238;
            __int128 v210 = v244;
            id v211 = v242;
            id v208 = v262;
            uint64_t v209 = v246;
            id v197 = v268;
            os_log_t v201 = (os_log_t)v265;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"sendMessage { c = %@   fID = %@   fT = %@   g = %@   t = %@   tID = %@ } bulkedPayload %@ fromID %@   toDestinations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliveryStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@  completionBlock %p");

            if ((v230 & 1) != 0)
            {
            }

            if ((isKindOfClass & 1) != 0) {

            }
            goto LABEL_201;
          }

          unsigned __int8 v249 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          id v266 = (id)objc_claimAutoreleasedReturnValue([v249 objectForKey:@"c"]);
          uint64_t v99 = objc_opt_class(&OBJC_CLASS___NSString, v98);
          uint64_t v247 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          id v100 = sub_1002DC420(v99, v247, @"fID");
          id v263 = (id)objc_claimAutoreleasedReturnValue(v100);
          uint64_t v102 = objc_opt_class(&OBJC_CLASS___NSNumber, v101);
          id v245 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          id v103 = sub_1002DC420(v102, v245, @"fT");
          id v261 = (id)objc_claimAutoreleasedReturnValue(v103);
          v243 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          __int16 v241 = (void *)objc_claimAutoreleasedReturnValue([v243 objectForKey:@"g"]);
          uint64_t v105 = objc_opt_class(&OBJC_CLASS___NSString, v104);
          int v251 = objc_opt_isKindOfClass(v241, v105);
          if ((v251 & 1) != 0)
          {
            uint64_t v239 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            id v237 = (void *)objc_claimAutoreleasedReturnValue([v239 objectForKey:@"g"]);
            unsigned __int8 v235 = (void *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v237));
          }

          else
          {
            uint64_t v239 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            id v237 = (void *)objc_claimAutoreleasedReturnValue([v239 objectForKey:@"g"]);
            uint64_t v121 = objc_opt_class(&OBJC_CLASS___NSData, v120);
            if ((objc_opt_isKindOfClass(v237, v121) & 1) == 0)
            {
              LODWORD(v228) = 0;
              unsigned __int8 v235 = 0LL;
              goto LABEL_133;
            }

            id v227 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
            unsigned __int8 v235 = (void *)objc_claimAutoreleasedReturnValue([v227 objectForKey:@"g"]);
          }

          LODWORD(v228) = v251 ^ 1;
LABEL_133:
          uint64_t v133 = JWUUIDPushObjectToString(v235);
          unsigned __int8 v253 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v133);
          id v233 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          unsigned __int8 v259 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v233 objectForKey:@"t"]);
          uint64_t v135 = objc_opt_class(&OBJC_CLASS___NSString, v134);
          __int128 v231 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);
          id v136 = sub_1002DC420(v135, v231, @"tID");
          unsigned __int8 v257 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v136);
          v270 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v8 bulkedPayload]);
          id v274 = (id)objc_claimAutoreleasedReturnValue([v8 fromID]);
          id v277 = (id)objc_claimAutoreleasedReturnValue([v8 destinations]);
          id v137 = @"YES";
          else {
            uint64_t v138 = @"NO";
          }
          id v229 = v138;
          else {
            uint64_t v139 = @"NO";
          }
          else {
            uint64_t v140 = @"NO";
          }
          [v8 timeout];
          id v142 = v141;
          id v255 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v8 command]);
          else {
            uint64_t v143 = @"NO";
          }
          else {
            __int16 v144 = @"NO";
          }
          id v145 = (id)objc_claimAutoreleasedReturnValue([v8 deliveryStatusContext]);
          id v146 = (id)objc_claimAutoreleasedReturnValue([v8 messageUUID]);
          if ([v8 priority] == (id)300)
          {
            id v147 = @"URGENT";
          }

          else if ([v8 priority] == (id)200)
          {
            id v147 = @"Default";
          }

          else
          {
            id v147 = @"Sync";
          }

          id v148 = objc_retainBlock(v287);
          *(_DWORD *)buf = 138417410;
          *(void *)uint64_t v291 = v266;
          *(_WORD *)&v291[8] = 2112;
          id v292 = v263;
          __int16 v293 = 2112;
          id v294 = v261;
          __int16 v295 = 2112;
          os_log_t v296 = v253;
          __int16 v297 = 2112;
          id v298 = v259;
          __int16 v299 = 2112;
          v300 = v257;
          __int16 v301 = 2112;
          id v302 = v270;
          __int16 v303 = 2112;
          id v304 = v274;
          __int16 v305 = 2112;
          id v306 = v277;
          __int16 v307 = 2112;
          v308 = v229;
          __int16 v309 = 2112;
          v310 = v139;
          __int16 v311 = 2112;
          v312 = v140;
          __int16 v313 = 2048;
          id v314 = v142;
          __int16 v315 = 2112;
          v316 = v255;
          __int16 v317 = 2112;
          id v318 = v143;
          __int16 v319 = 2112;
          id v320 = v144;
          __int16 v321 = 2112;
          id v322 = v145;
          __int16 v323 = 2112;
          id v324 = v146;
          __int16 v325 = 2112;
          v326 = v147;
          __int16 v327 = 2112;
          v328 = v137;
          __int16 v329 = 2048;
          id v330 = v148;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "sendMessage { c = %@   fID = %@   fT = %@   g = %@   t = %@   tID = %@ } bulkedPayload %@ fromID %@   toDest inations %@   useDictAsTopLevel %@  encryptPayload %@  wantsResponse %@  timeout %f  command %@ wantsDeliver yStatus %@ wantsCertifiedDelivery %@ deliveryStatusContext %@ messageUUID %@  priority %@ localDelivery %@ completionBlock %p",  buf,  0xD4u);

          if ((v228 & 1) != 0)
          {
          }

          if ((v251 & 1) != 0) {

          }
          goto LABEL_160;
        }
      }

      else
      {
        id v73 = 0LL;
        id v282 = 0LL;
      }

      uint64_t v86 = OSLogHandleForIDSCategory("IDSDAccount");
      id v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v291 = (_DWORD)v72;
        *(_WORD *)&v291[4] = 1024;
        *(_DWORD *)&v291[6] = (_DWORD)v73;
        _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEBUG,  "Use uncompressed message data (original: %u compressed: %u)",  buf,  0xEu);
      }

      if (os_log_shim_legacy_logging_enabled(v88)
        && _IDSShouldLog(1LL, @"IDSDAccount"))
      {
        id v197 = v72;
        os_log_t v201 = v73;
        _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSDAccount",  @"Use uncompressed message data (original: %u compressed: %u)");
      }

      uint64_t v77 = 0LL;
      goto LABEL_81;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 originalfromID]);
    BOOL v19 = [v18 length] == 0;

    if (v19)
    {
      uint64_t v40 = OSLogHandleForIDSCategory("IDSDAccount");
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Service would like to use iMessage callerID for messages",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v42)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Service would like to use iMessage callerID for messages");
      }

      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount displayName](self, "displayName"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v43 _stripFZIDPrefix]);

      unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 dsHandle]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v45 _stripFZIDPrefix]);

      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v47 = [v46 shouldRegisterUsingDSHandle];

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](self, "unprefixedURIStringsFromRegistration"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonyms](self, "pseudonyms"));
      uint64_t v34 = _IDSCopyCallerIDWithPseudonyms(v25, v32, v33, v31, v47, 1LL);
    }

    else
    {
      uint64_t v20 = OSLogHandleForIDSCategory("IDSDAccount");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Service would like to use iMessage callerID for messages but provided their own FromID, attempting to use that instead",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v22)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Service would like to use iMessage callerID for messages but provided their own FromID, attempting to use that instead");
      }

      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dsHandle]);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 _stripFZIDPrefix]);

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v27 = [v26 shouldRegisterUsingDSHandle];

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonymForPseudonymURIString:](self, "pseudonymForPseudonymURIString:", v28));
      BOOL v30 = v29 == 0LL;

      if (!v30) {
        goto LABEL_32;
      }
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount unprefixedURIStringsFromRegistration](v288, "unprefixedURIStringsFromRegistration"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pseudonyms](v288, "pseudonyms"));
      uint64_t v34 = _IDSCopyCallerIDWithPseudonyms(v31, v32, v33, v25, v27, 1LL);
    }

    uint64_t v48 = (void *)v34;
    [v8 setFromID:v34];

LABEL_32:
    goto LABEL_33;
  }

  uint64_t v35 = OSLogHandleForIDSCategory("Warning");
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v291 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Registration is not active on account %@, ignoring...",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v38))
  {
    id v198 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
    _IDSWarnV(@"IDSFoundation", @"Registration is not active on account %@, ignoring...");

    id v199 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID", v198));
    _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Registration is not active on account %@, ignoring...");

    id v200 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID", v199));
    _IDSLogTransport(@"Warning", @"IDS", @"Registration is not active on account %@, ignoring...");
  }

  if (v287)
  {
    id v39 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  9LL,  0LL,  1LL);
    (*((void (**)(id, IDSDeliveryContext *))v287 + 2))(v287, v39);
  }

- (void)sendMessage:(id)a3 params:(id)a4 bulkedPayload:(id)a5 fromID:(id)a6 toDestinations:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 encryptPayload:(BOOL)a10 wantsResponse:(BOOL)a11 expirationDate:(id)a12 command:(id)a13 wantsDeliveryStatus:(BOOL)a14 wantsCertifiedDelivery:(BOOL)a15 deliveryStatusContext:(id)a16 messageUUID:(id)a17 priority:(int64_t)a18 localDelivery:(BOOL)a19 disallowRefresh:(BOOL)a20 willSendBlock:(id)a21 completionBlock:(id)a22
{
  BOOL v43 = a8;
  id v44 = a3;
  id v27 = a4;
  id v28 = a5;
  id v45 = a6;
  id v46 = a7;
  id v29 = a9;
  id v47 = a12;
  id v30 = a13;
  id v31 = a16;
  id v32 = a17;
  id v33 = a21;
  id v48 = a22;
  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive"))
  {
    if (!v27) {
      id v27 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
    }
    [v27 setMessage:v44];
    [v27 setBulkedPayload:v28];
    [v27 setFromID:v45];
    [v27 setDestinations:v46];
    [v27 setUseDictAsTopLevel:v43];
    [v27 setDataToEncrypt:v29];
    [v27 setEncryptPayload:a10];
    [v27 setWantsResponse:a11];
    if (v47)
    {
      [v47 timeIntervalSinceNow];
      objc_msgSend(v27, "setTimeout:");
    }

    [v27 setCommand:v30];
    [v27 setWantsDeliveryStatus:a14];
    [v27 setWantsCertifiedDelivery:a15];
    [v27 setDeliveryStatusContext:v31];
    [v27 setMessageUUID:v32];
    [v27 setPriority:a18];
    [v27 setLocalDelivery:a19];
    [v27 setDisallowRefresh:a20];
    -[IDSDAccount sendMessageWithSendParameters:willSendBlock:completionBlock:]( self,  "sendMessageWithSendParameters:willSendBlock:completionBlock:",  v27,  v33,  v48);
    uint64_t v34 = v48;
  }

  else
  {
    uint64_t v35 = OSLogHandleForIDSCategory("Warning");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      *(_DWORD *)buf = 138412290;
      BOOL v50 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Registration is not active on account %@, ignoring...",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v38))
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID"));
      _IDSWarnV(@"IDSFoundation", @"Registration is not active on account %@, ignoring...");

      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID", v40));
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Registration is not active on account %@, ignoring...");

      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self, "uniqueID", v41));
      _IDSLogTransport(@"Warning", @"IDS", @"Registration is not active on account %@, ignoring...");
    }

    if (v48)
    {
      id v39 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( objc_alloc(&OBJC_CLASS___IDSDeliveryContext),  "initWithResponseCode:error:lastCall:",  9LL,  0LL,  1LL);
      (*((void (**)(id, IDSDeliveryContext *))v48 + 2))(v48, v39);
    }

    uint64_t v34 = v48;
  }
}

- (void)decryptMessageData:(id)a3 guid:(id)a4 localURI:(id)a5 remoteURI:(id)a6 pushToken:(id)a7 groupID:(id)a8 encryptionType:(int64_t)a9 isLiveRetry:(BOOL)a10 replayKey:(id)a11 completionBlock:(id)a12
{
  id v60 = a3;
  id v58 = a4;
  id v18 = a5;
  id v61 = a6;
  id v19 = a7;
  id v57 = a8;
  id v59 = a11;
  id v20 = a12;
  uint64_t v21 = OSLogHandleForIDSCategory("IDSDAccount");
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v60 length];
    id v24 = objc_retainBlock(v20);
    *(_DWORD *)buf = 134219266;
    id v63 = v23;
    __int16 v64 = 2112;
    id v65 = v18;
    __int16 v66 = 2112;
    id v67 = v61;
    __int16 v68 = 2112;
    id v69 = v19;
    __int16 v70 = 2048;
    int64_t v71 = a9;
    __int16 v72 = 2048;
    id v73 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "decryptMessageData length: %lu   myURI %@   fromURI %@   token %@   encryptionType %ld   completionBlock %p",  buf,  0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled(v25) && _IDSShouldLog(0LL, @"IDSDAccount"))
  {
    id v26 = [v60 length];
    int64_t v53 = a9;
    id v54 = objc_retainBlock(v20);
    id v50 = v61;
    id v51 = v19;
    id v45 = v26;
    id v49 = v18;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"decryptMessageData length: %lu   myURI %@   fromURI %@   token %@   encryptionType %ld   completionBlock %p");
  }

  if (-[IDSDAccount isRegistrationActive](self, "isRegistrationActive", v45, v49, v50, v51, v53, v54))
  {
    if (!v18)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount loginID](self, "loginID"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 _bestGuessURI]);
      id v18 = (id)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v28));
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount primaryRegistration](self, "primaryRegistration"));
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 registrationCert]);

    int64_t v31 = a9 - 1;
    if ((unint64_t)(a9 - 1) < 6 && ((0x39u >> v31) & 1) != 0)
    {
      uint64_t v55 = qword_100717FD0[v31];
      uint64_t v38 = objc_alloc(&OBJC_CLASS___IDSCryptionContext);
      double v56 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v56 pushToken]);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v39));
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 identifier]);
      uint64_t v36 = -[IDSCryptionContext initWithGuid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:service:]( v38,  "initWithGuid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:service:",  v58,  v61,  v19,  v18,  v40,  v42);

      -[IDSCryptionContext setMessageType:](v36, "setMessageType:", 0LL);
      uint64_t v37 = (IDSDecryptionMetadata *)objc_claimAutoreleasedReturnValue( +[IDSEncryptionController sharedInstance]( &OBJC_CLASS___IDSEncryptionController,  "sharedInstance"));
      BOOL v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 identifier]);
      LOBYTE(v52) = 0;
      -[IDSDecryptionMetadata publicKeyDecryptData:decryptionContext:identity:service:priority:isRetry:replayKey:publicKeyType:completionBlock:avoidMainQueue:]( v37,  "publicKeyDecryptData:decryptionContext:identity:service:priority:isRetry:replayKey:publicKeyType:completionBlock :avoidMainQueue:",  v60,  v36,  v30,  v44,  300LL,  a10,  v59,  v55,  v20,  v52);
    }

    else
    {
      uint64_t v32 = OSLogHandleForIDSCategory("Warning");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a9));
        *(_DWORD *)buf = 138412290;
        id v63 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Invalid encryption type -- failing {encryptionType: %@}",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v35))
      {
        id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a9));
        _IDSWarnV(@"IDSFoundation", @"Invalid encryption type -- failing {encryptionType: %@}");

        id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a9, v47));
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid encryption type -- failing {encryptionType: %@}");

        id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a9, v48));
        _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid encryption type -- failing {encryptionType: %@}");
      }

      uint64_t v36 = (IDSCryptionContext *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSDecryptionErrorDomain,  16LL,  0LL,  v46));
      uint64_t v37 = -[IDSDecryptionMetadata initWithEncryptionType:]( objc_alloc(&OBJC_CLASS___IDSDecryptionMetadata),  "initWithEncryptionType:",  a9);
      (*((void (**)(id, void, void, void, void, IDSCryptionContext *, IDSDecryptionMetadata *))v20 + 2))( v20,  0LL,  0LL,  0LL,  0LL,  v36,  v37);
    }
  }

  else
  {
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1006A7714(self, v30);
    }
  }
}

- (id)pairingManager
{
  return +[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance");
}

- (BOOL)shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fromID]);
  im_assert_primary_base_queue(v5, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pairingManager](self, "pairingManager"));
  unsigned int v8 = [v7 isPaired];

  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pairingManager](self, "pairingManager"));
  unsigned __int8 v10 = [v9 isCurrentDeviceTinkerConfiguredWatch];

  if ((v10 & 1) != 0) {
    goto LABEL_15;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pairingManager](self, "pairingManager"));
  unsigned __int8 v12 = [v11 activePairedDeviceHasPairingType:1];

  if ((v12 & 1) != 0) {
    goto LABEL_15;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  unsigned int v14 = [v13 shouldAllowProxyDelivery];

  if (!v14) {
    goto LABEL_15;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount service](self, "service"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  uint64_t v17 = IDSServiceNameiMessage;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  if (![v18 isEqualToNumber:&off_100947950]
    || (id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 deliveryMinimumTime])) == 0)
  {

LABEL_12:
    goto LABEL_13;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 queueOneIdentifier]);

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount pairingManager](self, "pairingManager"));
    unsigned __int8 v22 = [v21 pairedDeviceSupportsSendLaterMessages];

    if ((v22 & 1) == 0) {
      goto LABEL_15;
    }
  }

@end