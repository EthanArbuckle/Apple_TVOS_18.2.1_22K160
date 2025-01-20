@interface MCProfileServiceServer
+ (id)_descriptionForServiceSubscriptionContext:(id)a3;
+ (id)_optionsForCarrierProfileInstallationForCarrierIdentifier:(id)a3 name:(id)a4;
+ (id)sharedServer;
- (BOOL)_hasCompletedPostLoginWork;
- (BOOL)_isValidProvisioningProfileData:(id)a3;
- (BOOL)isBundleBlocked:(id)a3 outHash:(id *)a4 outHashType:(id *)a5;
- (BOOL)isOpenInRestrictionInEffect;
- (BOOL)mayOpenFromManagedToUnmanaged;
- (BOOL)mayOpenFromUnmanagedToManaged;
- (BOOL)memberQueueHasActivationRecordChangesPending;
- (BOOL)memberQueueHasMigrated;
- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6;
- (BOOL)storeCloudConfigurationDetails:(id)a3 outError:(id *)a4;
- (CoreTelephonyClient)coreTelephonyClient;
- (DMCDaemonConnectionTracker)connectionTracker;
- (LSApplicationWorkspace)appWorkspace;
- (MCBackgroundActivityManager)workerQueueBackgroundActivityManager;
- (MCProfileServiceServer)init;
- (OS_dispatch_queue)clientRestrictionQueue;
- (OS_dispatch_queue)mailAccountsQueue;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)monitorQueue;
- (OS_dispatch_queue)workerQueue;
- (double)memberQueueIdleTimeInterval;
- (id)URLForInstallingProfileInSettingsApp:(id)a3 returningToBundleID:(id)a4;
- (id)_badProvisioningProfileError;
- (id)_carrierIdentifierFromContext:(id)a3;
- (id)_carrierNameFromContext:(id)a3;
- (id)_localProvisioningProfileError;
- (id)bookmarkDictsFromBookmarks:(id)a3;
- (id)bookmarksFromBookmarkDicts:(id)a3;
- (id)cloudConfigurationMachineInfo;
- (id)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3;
- (id)powerAssertionAssertedNotificationToken;
- (id)powerAssertionDeassertedNotificationToken;
- (int)mobileKeybagLockStateChangeNotificationToken;
- (os_unfair_lock_s)checkInLock;
- (unint64_t)workerQueueLastCarrierProfileCheckTime;
- (void)_handleSettingsJumpWithProfileData:(id)a3 targetDeviceType:(unint64_t)a4 bundleID:(id)a5;
- (void)_markPostUserLoginWorkCompleted;
- (void)_sendEffectiveSettingsChangedNotification;
- (void)_sendRestrictionChangedNotification;
- (void)_workerQueueCheckCarrierProfileForCarrierIdentifier:(id)a3 name:(id)a4 atPath:(id)a5 forceReinstallation:(BOOL)a6;
- (void)_workerQueueCheckCarrierProfileOnUnlockSometimes;
- (void)_workerQueueForceCheckOfCarrierProfileOnNextUnlock;
- (void)_workerQueuePrepareForService;
- (void)_workerQueueRemoveAllCarrierProfiles;
- (void)_workerQueue_setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 assertion:(id)a11 completion:(id)a12;
- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 messageSendingAppBundleID:(id)a4 hostAppBundleID:(id)a5 accountIsManaged:(BOOL)a6 completion:(id)a7;
- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6;
- (void)applicationsDidInstall:(id)a3;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 completion:(id)a5;
- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 sender:(id)a8 localizedClientDescription:(id)a9 localizedWarningMessage:(id)a10 completion:(id)a11;
- (void)changePasscode:(id)a3 oldPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7;
- (void)changePasscode:(id)a3 recoveryPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7;
- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4;
- (void)checkInWithCompletion:(id)a3;
- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 completion:(id)a6;
- (void)clearRecoveryPasscodeWithSenderBundleID:(id)a3 completion:(id)a4;
- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4;
- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4;
- (void)createActivationLockBypassCodeWithCompletion:(id)a3;
- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4;
- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7;
- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)installProfileData:(id)a3 interactionClient:(id)a4 options:(id)a5 source:(id)a6 completion:(id)a7;
- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5;
- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4;
- (void)loadMailAccountsWithAuditToken:(id *)a3 filteringEnabled:(BOOL)a4 sourceAccountManagement:(int)a5 completion:(id)a6;
- (void)localeChanged;
- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3;
- (void)managedWiFiNetworkNamesWithCompletion:(id)a3;
- (void)managingOrganizationInformationWithCompletion:(id)a3;
- (void)markStoredProfileAsInstalledWithCompletion:(id)a3;
- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5;
- (void)mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5 completion:(id)a6;
- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4;
- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5;
- (void)monitorEnrollmentStateForClient:(id)a3 personaID:(id)a4;
- (void)notifyBatterySaverModeChanged;
- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3;
- (void)notifyDeviceUnlockedWithCompletion:(id)a3;
- (void)notifyFirstUnlock;
- (void)notifyGracePeriodChanged;
- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4;
- (void)notifyMementoEffaced;
- (void)notifyProvisioningProfilesChanged;
- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4;
- (void)notifyUserLoggedIn;
- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5;
- (void)openSettingsAppForProfileInstallation:(id)a3 bundleID:(id)a4;
- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4;
- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3;
- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4;
- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7;
- (void)reapplyAppEnforcedRestrictionsWithAssertion:(id)a3;
- (void)recomputePerClientUserComplianceWithCompletion:(id)a3;
- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3;
- (void)recomputeUserComplianceWarningWithCompletion:(id)a3;
- (void)reducedMachineInfoDataWithCompletion:(id)a3;
- (void)removeBoolSetting:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)removeExpiredProfiles;
- (void)removeExpiredProfilesWithCompletion:(id)a3;
- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3;
- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5 completion:(id)a6;
- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3;
- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6;
- (void)removeValueSetting:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)rereadManagedAppAttributesWithCompletion:(id)a3;
- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 sender:(id)a4 completion:(id)a5;
- (void)resetPasscodeMetadataWithCompletion:(id)a3;
- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3;
- (void)revalidateManagedApps;
- (void)setAllowedURLStrings:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setAppWorkspace:(id)a3;
- (void)setAutoCorrectionAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setCheckInLock:(os_unfair_lock_s)a3;
- (void)setClientRestrictionQueue:(id)a3;
- (void)setConnectionTracker:(id)a3;
- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setKeyboardShortcutsAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setMailAccountsQueue:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueHasActivationRecordChangesPending:(BOOL)a3;
- (void)setMemberQueueHasMigrated:(BOOL)a3;
- (void)setMemberQueueIdleTimeInterval:(double)a3;
- (void)setMobileKeybagLockStateChangeNotificationToken:(int)a3;
- (void)setMonitorQueue:(id)a3;
- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 completion:(id)a11;
- (void)setPowerAssertionAssertedNotificationToken:(id)a3;
- (void)setPowerAssertionDeassertedNotificationToken:(id)a3;
- (void)setPredictiveKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setSmartPunctuationAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setSpellCheckAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setURLsFromUserBookmarkDictsAsSettings:(id)a3 sender:(id)a4;
- (void)setUserBookmarks:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6;
- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)setWorkerQueue:(id)a3;
- (void)setWorkerQueueBackgroundActivityManager:(id)a3;
- (void)setWorkerQueueLastCarrierProfileCheckTime:(unint64_t)a3;
- (void)signIntoFaceTimeWithUsername:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)start;
- (void)storeActivationRecord:(id)a3 completion:(id)a4;
- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5;
- (void)storeProfileData:(id)a3 completion:(id)a4;
- (void)storedProfileDataWithCompletion:(id)a3;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
- (void)updateProfileIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 completion:(id)a6;
- (void)validateAppBundleIDs:(id)a3 completion:(id)a4;
- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3;
- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4;
- (void)workerQueueCheckForAutoInstallProfiles;
- (void)workerQueueDidRecomputeNagMessageWithResult:(BOOL)a3;
- (void)workerQueueNotifyDeviceUnlocked;
- (void)workerQueueNotifyDeviceUnlockedAndPasscodeRequired;
- (void)workerQueueNotifyMementoEffaced;
- (void)workerQueueNotifyUserLoggedIn;
- (void)workerQueueReadBiometricState;
- (void)workerQueueRecomputeNagMessage;
- (void)workerQueueRemoveExpiredProfiles;
- (void)workerQueueRevalidateManagedApps;
@end

@implementation MCProfileServiceServer

+ (id)sharedServer
{
  if (qword_1000DC010 != -1) {
    dispatch_once(&qword_1000DC010, &stru_1000C29A8);
  }
  return (id)qword_1000DC008;
}

- (MCProfileServiceServer)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCProfileServiceServer;
  v2 = -[MCProfileServiceServer init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    v2->_checkInLock._os_unfair_lock_opaque = 0;
    v2->_memberQueueIdleTimeInterval = 60.0;
    dispatch_queue_t v4 = dispatch_queue_create("MCProfileServiceServer worker queue", 0LL);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("MCProfileServiceServer monitor queue", &_dispatch_queue_attr_concurrent);
    monitorQueue = v3->_monitorQueue;
    v3->_monitorQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___MCBackgroundActivityManager);
    workerQueueBackgroundActivityManager = v3->_workerQueueBackgroundActivityManager;
    v3->_workerQueueBackgroundActivityManager = v8;

    -[MCBackgroundActivityManager setServer:](v3->_workerQueueBackgroundActivityManager, "setServer:", v3);
    v3->_workerQueueLastCarrierProfileCheckTime = 0LL;
    dispatch_queue_t v10 = dispatch_queue_create("MCProfileServiceServer member queue", &_dispatch_queue_attr_concurrent);
    memberQueue = v3->_memberQueue;
    v3->_memberQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("MCProfileServiceServer client restriction queue", 0LL);
    clientRestrictionQueue = v3->_clientRestrictionQueue;
    v3->_clientRestrictionQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("MCProfileServiceServer mail accounts queue", 0LL);
    mailAccountsQueue = v3->_mailAccountsQueue;
    v3->_mailAccountsQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    appWorkspace = v3->_appWorkspace;
    v3->_appWorkspace = (LSApplicationWorkspace *)v16;

    v18 = -[CoreTelephonyClient initWithQueue:]( objc_alloc(&OBJC_CLASS___CoreTelephonyClient),  "initWithQueue:",  v3->_workerQueue);
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = v18;

    v20 = -[DMCDaemonConnectionTracker initWithProcessName:connectionThreshold:requestThreshold:]( objc_alloc(&OBJC_CLASS___DMCDaemonConnectionTracker),  "initWithProcessName:connectionThreshold:requestThreshold:",  @"profiled",  2LL,  5LL);
    connectionTracker = v3->_connectionTracker;
    v3->_connectionTracker = v20;
  }

  return v3;
}

- (void)start
{
  v3 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Profile Service Server starting...", buf, 2u);
  }

  id v4 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-StartServer"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000309C;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_sync(workerQueue, block);
  dispatch_queue_t v6 = (dispatch_queue_s *)self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100003128;
  v8[3] = &unk_1000C2AA0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)notifyBatterySaverModeChanged
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer clientRestrictionQueue](self, "clientRestrictionQueue"));
  dispatch_async(v2, &stru_1000C2AC0);
}

- (void)localeChanged
{
  id v3 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-LocaleChanged"];
  -[MCProfileServiceServer reapplyAppEnforcedRestrictionsWithAssertion:]( self,  "reapplyAppEnforcedRestrictionsWithAssertion:",  v3);
}

- (void)reapplyAppEnforcedRestrictionsWithAssertion:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer clientRestrictionQueue](self, "clientRestrictionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003770;
  block[3] = &unk_1000C29D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_workerQueuePrepareForService
{
  id v3 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-WorkerQueue"];
  id v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Performing startup checks.", buf, 2u);
  }

  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003F28;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_barrier_async(v5, block);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v7 = MCCrashDetectionFilePath();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = [v6 fileExistsAtPath:v8];

  if (v9)
  {
    dispatch_queue_t v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaning up after previous crash", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
    [v11 recomputeProfileRestrictionsWithCompletionBlock:&stru_1000C2B00];

    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    [v12 removeOrphanedClientRestrictions];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v14 = MCCrashDetectionFilePath();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v13 removeItemAtPath:v15 error:0];
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
  unsigned __int8 v17 = [v16 isPasscodeSet];

  if ((v17 & 1) == 0) {
    -[MCProfileServiceServer workerQueueNotifyDeviceUnlocked](self, "workerQueueNotifyDeviceUnlocked");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v19 = MCOutstandingNagComputationFilePath();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  unsigned int v21 = [v18 fileExistsAtPath:v20];

  if (v21)
  {
    id v22 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-OutstandingNag"];
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_100003FE0;
    v56[3] = &unk_1000C2AA0;
    v56[4] = self;
    id v57 = v22;
    id v24 = v22;
    dispatch_async(workerQueue, v56);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t restarted = MCSystemRestartLogPath();
  v27 = (void *)objc_claimAutoreleasedReturnValue(restarted);
  unsigned int v28 = [v25 fileExistsAtPath:v27];

  if (v28)
  {
    uint64_t v29 = MCSystemRestartLogPath();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v30,  4LL,  0LL));

    v32 = _MCLogObjects[2];
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 138543362;
        v60 = v31;
        v34 = "Device restarted due to MDM command at %{public}@";
        v35 = v32;
        uint32_t v36 = 12;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
      }
    }

    else if (v33)
    {
      *(_WORD *)buf = 0;
      v34 = "Device restarted due to MDM command at unknown time.";
      v35 = v32;
      uint32_t v36 = 2;
      goto LABEL_17;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v38 = MCSystemRestartLogPath();
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    [v37 removeItemAtPath:v39 error:0];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v41 = MCSystemShutDownLogPath();
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  unsigned int v43 = [v40 fileExistsAtPath:v42];

  if (!v43) {
    goto LABEL_27;
  }
  uint64_t v44 = MCSystemShutDownLogPath();
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v45,  4LL,  0LL));

  v47 = _MCLogObjects[2];
  BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    if (v48)
    {
      *(_DWORD *)buf = 138543362;
      v60 = v46;
      v49 = "Device shut down due to MDM command at %{public}@";
      v50 = v47;
      uint32_t v51 = 12;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
    }
  }

  else if (v48)
  {
    *(_WORD *)buf = 0;
    v49 = "Device shut down due to MDM command at unknown time.";
    v50 = v47;
    uint32_t v51 = 2;
    goto LABEL_25;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v53 = MCSystemShutDownLogPath();
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  [v52 removeItemAtPath:v54 error:0];

LABEL_27:
  v55 = _MCLogObjects[2];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Completed startup checks.", buf, 2u);
  }
}

- (void)workerQueueDidRecomputeNagMessageWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Finished recomputing nag message. Success: %d",  (uint8_t *)v12,  8u);
  }

  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v7 = MCOutstandingNagComputationFilePath();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 removeItemAtPath:v8 error:0];
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
    uint64_t v10 = MCOutstandingNagComputationFilePath();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v9 writeToFile:v11 atomically:1];

    -[MCBackgroundActivityManager scheduleRecomputeNagMetadataJob]( self->_workerQueueBackgroundActivityManager,  "scheduleRecomputeNagMetadataJob");
  }

- (void)workerQueueRecomputeNagMessage
{
  BOOL v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Recomputing passcode requirement message", v6, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v5 = [v4 recomputeNagMetadata];

  -[MCProfileServiceServer workerQueueDidRecomputeNagMessageWithResult:]( self,  "workerQueueDidRecomputeNagMessageWithResult:",  v5);
}

- (void)workerQueueCheckForAutoInstallProfiles
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v3 = (const __CFString *)kMCHasCheckedForAutoInstalledProfiles;
  id v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue( kMCHasCheckedForAutoInstalledProfiles,  kMCNotBackedUpPreferencesDomain,  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager sharedManager](&OBJC_CLASS___MCPasscodeManager, "sharedManager"));
    unsigned int v8 = [v7 isDeviceLocked];

    if (v8)
    {
      unsigned int v9 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Cannot check for auto-install profiles: device is locked. Checking next time the device is unlocked.",  buf,  2u);
      }
    }

    else
    {
      v40 = v3;
      uint64_t v41 = v4;
      v42 = self;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 enumeratorAtPath:@"/Library/AutoInstall/Profiles/"]);

      id v13 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            [v10 addObject:*(void *)(*((void *)&v50 + 1) + 8 * (void)i)];
          }

          id v14 = [v12 countByEnumeratingWithState:&v50 objects:v60 count:16];
        }

        while (v14);
      }

      id v17 = [v10 sortedArrayUsingSelector:"compare:"];
      if ([v10 count])
      {
        os_log_t v18 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v18;
          unsigned int v20 = [v10 count];
          *(_DWORD *)buf = 67109120;
          LODWORD(v58) = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Auto-installing %d profiles.", buf, 8u);
        }
      }

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id obj = v10;
      id v21 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v47;
        uint64_t v43 = kMCInstallProfileOptionIsAutoInstalled;
        do
        {
          for (j = 0LL; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
            v26 = objc_autoreleasePoolPush();
            v27 = (void *)objc_claimAutoreleasedReturnValue([v25 pathExtension]);
            unsigned int v28 = [v27 isEqualToString:@"mobileconfig"];

            if (v28)
            {
              uint64_t v29 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v58 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Automatically installing %{public}@",  buf,  0xCu);
              }

              v30 = (void *)objc_claimAutoreleasedReturnValue( [@"/Library/AutoInstall/Profiles/" stringByAppendingPathComponent:v25]);
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v30));
              if (v31)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
                uint64_t v55 = v43;
                v56 = &__kCFBooleanTrue;
                BOOL v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
                id v45 = 0LL;
                id v34 =  [v32 installProfileData:v31 options:v33 interactionClient:0 source:@"MCProfileServiceServer.workerQueueCheckForAutoInstalledProfiles" outError:&v45];
                id v35 = v45;

                if (v35)
                {
                  os_log_t v36 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                  {
                    v37 = v36;
                    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v35 MCVerboseDescription]);
                    *(_DWORD *)buf = 138543362;
                    v58 = v38;
                    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Installation failed. Error: %{public}@",  buf,  0xCu);
                  }
                }
              }
            }

            objc_autoreleasePoolPop(v26);
          }

          id v22 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
        }

        while (v22);
      }

      CFPreferencesSetAppValue(v40, kCFBooleanTrue, v41);
      CFPreferencesAppSynchronize(v41);

      self = v42;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
    [v39 rescheduleProfileJanitorJob];
  }

- (void)_sendRestrictionChangedNotification
{
  v2 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending restriction changed notification.", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCRestrictionChangedNotification, 0LL, 0LL, 1u);
}

- (void)_sendEffectiveSettingsChangedNotification
{
  v2 = _MCLogObjects[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Sending effective settings changed notification.",  v4,  2u);
  }

  +[MCSignpostManager willPostEffectiveSettingsChangedNotification]( &OBJC_CLASS___MCSignpostManager,  "willPostEffectiveSettingsChangedNotification");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, MCEffectiveSettingsChangedNotification, 0LL, 0LL, 1u);
}

- (void)checkInWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Client waiting to check in...", buf, 2u);
  }

  p_checkInLock = &self->_checkInLock;
  os_unfair_lock_lock(p_checkInLock);
  if (v4) {
    v4[2](v4, 0LL);
  }
  uint64_t v7 = (os_log_s *)_MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Client checked in with profiled", v8, 2u);
  }

  os_unfair_lock_unlock(p_checkInLock);
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000493C;
  block[3] = &unk_1000C2B28;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, block);
}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004A44;
  block[3] = &unk_1000C2B28;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, block);
}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004B4C;
  v9[3] = &unk_1000C2B50;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(workerQueue, v9);
}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100004CE0;
  v21[3] = &unk_1000C2BA0;
  BOOL v27 = a6;
  v25 = self;
  id v26 = v15;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(workerQueue, v21);
}

- (BOOL)_isValidProvisioningProfileData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (const void *)MISProfileCreateWithData(0LL, v3);
    if (v4)
    {
      uint64_t DeviceUUID = MCGestaltGetDeviceUUID();
      id v6 = (void *)objc_claimAutoreleasedReturnValue(DeviceUUID);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      int v8 = MISProvisioningProfileCheckValidity(v4, v6, v7);
      CFRelease(v4);
      LOBYTE(v4) = v8 == 0;
      if (v8)
      {
        unsigned int v9 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v11[0] = 67109120;
          v11[1] = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Profile UI installation path encountered invalid provisioning profile with MIS error: %d",  (uint8_t *)v11,  8u);
        }
      }
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (void)installProfileData:(id)a3 interactionClient:(id)a4 options:(id)a5 source:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-InstallProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000052C8;
  block[3] = &unk_1000C2BF0;
  id v26 = v12;
  id v27 = v14;
  id v28 = v13;
  id v29 = v15;
  id v31 = v17;
  id v32 = v16;
  v30 = self;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  dispatch_async(workerQueue, block);
}

- (void)updateProfileIdentifier:(id)a3 interactionClient:(id)a4 source:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-UpdateProfileID"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005588;
  block[3] = &unk_1000C2C18;
  id v22 = v10;
  id v23 = v11;
  id v25 = v14;
  id v26 = v13;
  id v24 = v12;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(workerQueue, block);
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 source:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RemoveProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100005750;
  v19[3] = &unk_1000C2C68;
  id v20 = v10;
  id v21 = v11;
  id v24 = v12;
  int64_t v25 = a4;
  id v22 = self;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(workerQueue, v19);
}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RemoveUninstalledProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005958;
  block[3] = &unk_1000C2C90;
  int64_t v21 = a4;
  unint64_t v22 = a5;
  id v19 = v12;
  id v20 = v11;
  id v18 = v10;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workerQueue, block);
}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 sender:(id)a8 localizedClientDescription:(id)a9 localizedWarningMessage:(id)a10 completion:(id)a11
{
  BOOL v29 = a4;
  v30 = (void (**)(id, void, BOOL, id))a11;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ApplyRestrictions"];
  __int16 v33 = 0;
  unsigned __int8 v32 = 0;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  id v31 = 0LL;
  LOBYTE(v27) = 1;
  [v24 setClientRestrictions:v22 overrideRestrictions:v29 appsAndOptions:v21 system:1 clientType:v20 clientUUID:v19 sender:v18 localizedClientDescrip tion:v17 localizedWarning:v16 shouldRecomputeNag:v27 outRestrictionsChanged:(char *)&v33 + 1 outEffectiveSettingsChanged:&v33 outRecomputedNag:&v32 outError:&v31];

  id v25 = v31;
  -[MCProfileServiceServer workerQueueDidRecomputeNagMessageWithResult:]( self,  "workerQueueDidRecomputeNagMessageWithResult:",  v32);
  if (HIBYTE(v33)) {
    -[MCProfileServiceServer _sendRestrictionChangedNotification](self, "_sendRestrictionChangedNotification");
  }
  if ((_BYTE)v33)
  {
    -[MCProfileServiceServer _sendEffectiveSettingsChangedNotification]( self,  "_sendEffectiveSettingsChangedNotification");
    BOOL v26 = (_BYTE)v33 != 0;
  }

  else
  {
    BOOL v26 = 0LL;
  }

  v30[2](v30, HIBYTE(v33), v26, v25);
}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005C94;
  block[3] = &unk_1000C2B28;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, block);
}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 sender:(id)a5 completion:(id)a6
{
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetUserInfo"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setUserInfo:v12 forClientUUID:v11 sender:v10];

  v9[2](v9, 0LL);
}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006018;
  block[3] = &unk_1000C2CB8;
  void block[4] = self;
  void block[5] = &v19;
  block[6] = &v16;
  dispatch_sync(v7, block);

  if (a3)
  {
LABEL_13:
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    _DWORD v12[2] = sub_10000605C;
    v12[3] = &unk_1000C2B28;
    id v13 = v6;
    dispatch_async_and_wait(workerQueue, v12);

    goto LABEL_14;
  }

  if (!*((_BYTE *)v20 + 24))
  {
    unsigned int v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Waiting for migration.", buf, 2u);
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  if (*((_BYTE *)v17 + 24))
  {
LABEL_11:
    id v10 = _MCLogObjects[2];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Waiting for activation record change to be committed.",  buf,  2u);
    }

    goto LABEL_13;
  }

  id v8 = _MCLogObjects[2];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Allowing client to proceed.", buf, 2u);
  }

  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
LABEL_14:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v19, 8);
}

- (BOOL)isOpenInRestrictionInEffect
{
  if (-[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged")) {
    return !-[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
  }
  else {
    return 1;
  }
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:MCFeatureOpenFromUnmanagedToManagedAllowed] != 2;

  return v3;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  BOOL v3 = [v2 effectiveRestrictedBoolForSetting:MCFeatureOpenFromManagedToUnmanagedAllowed] != 2;

  return v3;
}

- (void)mayShareToWhitelistedSourceUnmanagedTargetAppWithServiceName:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, BOOL, void))a6;
  id v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 1024;
    BOOL v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Checking if app is allowed to share to %{public}@. App bundle ID: %{public}@, account is managed: %d.",  (uint8_t *)&v19,  0x1Cu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));

  if (!-[MCProfileServiceServer isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v11) & 1) != 0)
  {
    goto LABEL_7;
  }

  if ((MCIsAppAccountBasedSourceForOpenIn(v11) & 1) != 0)
  {
    if (!v7)
    {
LABEL_7:
      BOOL v17 = 1LL;
      goto LABEL_8;
    }
  }

  else if (([v16 containsObject:v11] & 1) == 0)
  {
    goto LABEL_7;
  }

  BOOL v17 = -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
LABEL_8:
  uint64_t v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v19 = 67109120;
    LODWORD(v20) = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Result: %d", (uint8_t *)&v19, 8u);
  }

  v12[2](v12, v17, 0LL);
}

- (BOOL)shouldApplyFilterForBundleID:(id)a3 sourceAccountManagement:(int)a4 outAllowManagedAccounts:(BOOL *)a5 outAllowUnmanagedAccounts:(BOOL *)a6
{
  id v10 = a3;
  if (!-[MCProfileServiceServer isOpenInRestrictionInEffect](self, "isOpenInRestrictionInEffect")
    || (MCIsAppExemptFromOpenInSourceRestrictions(v10) & 1) != 0)
  {
    goto LABEL_3;
  }

  if (!MCIsAppAccountBasedSourceForOpenIn(v10))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));

    LODWORD(v15) = [v17 containsObject:v10];
    if ((_DWORD)v15) {
      goto LABEL_11;
    }
LABEL_12:
    BOOL v13 = -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged");
    BOOL v11 = 1;
    BOOL v12 = 1;
    goto LABEL_5;
  }

  if (a4 == 1) {
    goto LABEL_12;
  }
  if (a4 == 2)
  {
LABEL_11:
    BOOL v12 = -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged");
    BOOL v11 = 1;
    goto LABEL_4;
  }

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *, void))a5;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCCommunicationServiceRulesUtilities defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:]( &OBJC_CLASS___MCCommunicationServiceRulesUtilities,  "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:",  a3,  a4));
  if (v8) {
    v8[2](v8, v7, 0LL);
  }
}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = MCContainingBundleIDForBundleID(a4);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v34;
    __int16 v45 = 1024;
    BOOL v46 = v7;
    __int16 v47 = 2114;
    id v48 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Checking for app bundle IDs allowed for Open In. Originating Bundle: %{public}@, account is managed: %d. Original list: %{public}@",  buf,  0x1Cu);
  }

  __int16 v33 = v11;
  uint64_t v14 = MCBundleIDToContainingBundleIDMap(v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Resolved app extension containers to: %{public}@",  buf,  0xCu);
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:]( &OBJC_CLASS___MCRestrictionManager,  "allowedOpenInAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountI sManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppB undleIDAccountBasedBlock:",  v17,  v19,  v34,  v7,  -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"),  -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"),  &stru_1000C2CF8,  &stru_1000C2D18));

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v23 = v10;
  id v24 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v28]);
      }

      id v25 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v25);
  }

  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }

  if (v33)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unsigned __int8 v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000694C;
    block[3] = &unk_1000C2C40;
    id v37 = v33;
    id v36 = v22;
    dispatch_async(v32, block);
  }
}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = MCContainingBundleIDForBundleID(a4);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v34;
    __int16 v45 = 1024;
    BOOL v46 = v7;
    __int16 v47 = 2114;
    id v48 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Checking for app bundle IDs allowed for Import From. Originating Bundle: %{public}@, account is managed: %d. Origi nal list: %{public}@",  buf,  0x1Cu);
  }

  __int16 v33 = v11;
  uint64_t v14 = MCBundleIDToContainingBundleIDMap(v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Resolved app extension containers to: %{public}@",  buf,  0xCu);
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAccountIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:isAppBundleIDAccountBasedBlock:]( &OBJC_CLASS___MCRestrictionManager,  "allowedImportFromAppBundleIDsWithOriginalAppBundleIDs:managedAppBundleIDs:localAppBundleID:localAcco untIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:isAppBundleIDExemptBlock:is AppBundleIDAccountBasedBlock:",  v17,  v19,  v34,  v7,  -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"),  -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged"),  &stru_1000C2D38,  &stru_1000C2D58));

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v23 = v10;
  id v24 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v28]);
      }

      id v25 = [v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v25);
  }

  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }

  if (v33)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unsigned __int8 v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006D4C;
    block[3] = &unk_1000C2C40;
    id v37 = v33;
    id v36 = v22;
    dispatch_async(v32, block);
  }
}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 messageSendingAppBundleID:(id)a4 hostAppBundleID:(id)a5 accountIsManaged:(BOOL)a6 completion:(id)a7
{
  unint64_t v8 = a6;
  id v12 = a3;
  id v45 = a7;
  id v13 = a4;
  uint64_t v14 = MCContainingBundleIDForBundleID(a5);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = MCContainingBundleIDForBundleID(v13);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  uint64_t v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v55 = v15;
    __int16 v56 = 1024;
    int v57 = v8;
    __int16 v58 = 2114;
    id v59 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Checking for 3rd party keyboards allowed for Bundle ID %{public}@, account is managed: %d. Original list: %{public}@",  buf,  0x1Cu);
  }

  id v19 = v17;
  if (MCIsAppBasicallySafari(v15))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 effectiveUnionValuesForSetting:MCFeatureManagedWebDomains]);
    unint64_t v8 = v21 != 0LL;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCAccountUtilities accountDataclassesForBundleID:]( &OBJC_CLASS___MCAccountUtilities,  "accountDataclassesForBundleID:",  v15));
    if (v20)
    {
      unint64_t v8 = (unint64_t)+[MCAccountUtilities hasManagedAccountOfDataclasses:]( &OBJC_CLASS___MCAccountUtilities,  "hasManagedAccountOfDataclasses:",  v20);
    }

    else if ((MCIsAppAccountBasedSourceForOpenIn(v19) & 1) == 0)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MDMManagedMediaReader attributesByAppID]( &OBJC_CLASS___MDMManagedMediaReader,  "attributesByAppID"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
      unint64_t v8 = (unint64_t)[v23 containsObject:v19];
    }
  }

  uint64_t v43 = v19;
  uint64_t v44 = (void *)v15;

  uint64_t v24 = MCBundleIDToContainingBundleIDMap(v12);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v55 = (uint64_t)v25;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Resolved keyboard extension containers to: %{public}@",  buf,  0xCu);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 allValues]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MDMManagedMediaReader attributesByAppID](&OBJC_CLASS___MDMManagedMediaReader, "attributesByAppID"));
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenFromUnmanagedToManaged:mayOpenFromManagedToUnmanaged:]( &OBJC_CLASS___MCRestrictionManager,  "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:managedAppBundleIDs:hostAppIsManaged:mayOpenF romUnmanagedToManaged:mayOpenFromManagedToUnmanaged:",  v27,  v29,  v8,  -[MCProfileServiceServer mayOpenFromUnmanagedToManaged](self, "mayOpenFromUnmanagedToManaged"),  -[MCProfileServiceServer mayOpenFromManagedToUnmanaged](self, "mayOpenFromManagedToUnmanaged")));

  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));
  unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v33 = v12;
  id v34 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v38]);
      }

      id v35 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }

    while (v35);
  }

  __int128 v40 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v55 = (uint64_t)v32;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Result: %{public}@", buf, 0xCu);
  }

  if (v45)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007210;
    block[3] = &unk_1000C2C40;
    id v48 = v45;
    id v47 = v32;
    dispatch_async(v42, block);
  }
}

- (void)loadMailAccountsWithAuditToken:(id *)a3 filteringEnabled:(BOOL)a4 sourceAccountManagement:(int)a5 completion:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v7 = a4;
  id v10 = a6;
  uint64_t v11 = MCBundleIDFromAuditToken(a3);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](&OBJC_CLASS___MailAccount, "activeAccounts"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_1000C2D98));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v14]);

    if (v7
      && -[MCProfileServiceServer shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:]( self,  "shouldApplyFilterForBundleID:sourceAccountManagement:outAllowManagedAccounts:outAllowUnmanagedAccounts:",  v12,  v6,  buf,  v37))
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100007560;
      v34[3] = &unk_1000C2DB8;
      uint8_t v35 = buf[0];
      char v36 = v37[0];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v34));
      id v17 = (id)objc_claimAutoreleasedReturnValue([v15 filteredArrayUsingPredicate:v16]);
    }

    else
    {
      id v17 = v15;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000075C4;
    v32[3] = &unk_1000C2DE0;
    id v33 = v18;
    id v19 = v18;
    [v17 enumerateObjectsUsingBlock:v32];
    id v20 = [v19 copy];

    __int16 v21 = 0LL;
  }

  else
  {
    id v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Could not retrieve the bundle ID of the calling process for filtered mail sheets.",  buf,  2u);
    }

    uint64_t v23 = MCXPCErrorDomain;
    uint64_t v24 = MCErrorArray(@"XPC_ERROR_LACKS_BUNDLE_IDENTIFIER_CODE");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v24);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v23,  39001LL,  v17,  MCErrorTypeFatal,  0LL));
    id v20 = 0LL;
  }

  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100007608;
    block[3] = &unk_1000C2E08;
    id v30 = v10;
    id v28 = v20;
    id v29 = v21;
    dispatch_async(v26, block);
  }
}

- (void)setAutoCorrectionAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetAutoCorrectionAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeatureAutoCorrectionAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setSmartPunctuationAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetSmartPunctuationAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeatureSmartPunctuationAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetPredictiveKeyboardAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeaturePredictiveKeyboardAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetContinuousPathKeyboardAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeatureContinuousPathKeyboardAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetKeyboardShortcutsAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeatureKeyboardShortcutsAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setSpellCheckAllowed:(BOOL)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetSpellCheckAllowed"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v11 setSenderPID:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setBoolValue:v8 forSetting:MCFeatureSpellCheckAllowed sender:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)setAllowedURLStrings:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  unsigned int v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a3;
  id v15 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetAllowedURLStrings"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v12 setSenderPID:v7];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v13 setIntersectionValues:v11 forSetting:MCFeatureWebContentFilterAutoPermittedURLs sender:v10];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v14 setSenderPID:getpid()];

  v9[2](v9, 0LL);
}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-StartComplianceTimer"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007DE4;
  block[3] = &unk_1000C2E30;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(workerQueue, block);
}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-HaveSeenComplianceMessage"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081EBC();
  }
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000803C;
  block[3] = &unk_1000C2E30;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(workerQueue, block);
}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RecomputeUserComplianceWarning"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081F3C();
  }
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000081A8;
  block[3] = &unk_1000C2E30;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(workerQueue, block);
}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RecomputePerClientUserCompliance"];
  if (os_log_type_enabled(_MCLogObjects[2], OS_LOG_TYPE_DEBUG)) {
    sub_100081FBC();
  }
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000082B8;
  v9[3] = &unk_1000C2C40;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(workerQueue, v9);
}

- (void)clearRecoveryPasscodeWithSenderBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-clearRecoveryPasscode"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000083D4;
  block[3] = &unk_1000C2E30;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(workerQueue, block);
}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ChangePasscode"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008640;
  v23[3] = &unk_1000C2E58;
  id v24 = v14;
  id v25 = v13;
  BOOL v29 = a5;
  id v27 = v16;
  id v28 = v15;
  id v26 = v12;
  id v18 = v16;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  dispatch_async(workerQueue, v23);
}

- (void)changePasscode:(id)a3 recoveryPasscode:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ChangePasscodeWithRecovery"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008970;
  v23[3] = &unk_1000C2E58;
  id v24 = v14;
  id v25 = v13;
  BOOL v29 = a5;
  id v27 = v16;
  id v28 = v15;
  id v26 = v12;
  id v18 = v16;
  id v19 = v15;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  dispatch_async(workerQueue, v23);
}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-CreateMDMUnlockToken"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008B6C;
  block[3] = &unk_1000C2E30;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(workerQueue, block);
}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ClearPasscode"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100008D98;
  v21[3] = &unk_1000C2E80;
  id v22 = v12;
  id v23 = v10;
  id v24 = v11;
  id v25 = self;
  id v26 = v14;
  id v27 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  dispatch_async(workerQueue, v21);
}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_100008F5C;
  v11[3] = &unk_1000C2EA8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, v11);
}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ResetPasscodeMetadata"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000090B4;
  v9[3] = &unk_1000C2C40;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(workerQueue, v9);
}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, id, void))a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCVPNPayloadHandlerBase managedServiceIDs](&OBJC_CLASS___MCNewVPNPayloadHandler, "managedServiceIDs"));
  v3[2](v3, v4, 0LL);
}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, id, void))a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MCNewWiFiPayloadHandler managedWiFiNetworkNames]( &OBJC_CLASS___MCNewWiFiPayloadHandler,  "managedWiFiNetworkNames"));
  v3[2](v3, v4, 0LL);
}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-MigrateWithContext"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000092A0;
  block[3] = &unk_1000C2ED0;
  int v16 = a3;
  BOOL v17 = a4;
  id v14 = v9;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workerQueue, block);
}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-MigrationCleanupWithContext"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_1000093D4;
  v11[3] = &unk_1000C2EF8;
  int v14 = a3;
  id v12 = v7;
  id v13 = v6;
  void v11[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, v11);
}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
  [v4 recomputeProfileRestrictionsWithCompletionBlock:v3];
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 completion:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v21 = a11;
  id v22 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetParameterForSettings"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009674;
  block[3] = &unk_1000C2F20;
  void block[4] = self;
  id v33 = v16;
  BOOL v41 = a5;
  BOOL v42 = a6;
  id v34 = v17;
  id v35 = v18;
  int v40 = a9;
  id v36 = v19;
  id v37 = v20;
  id v38 = v22;
  id v39 = v21;
  id v24 = v21;
  id v25 = v22;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  dispatch_async(workerQueue, block);
}

- (void)_workerQueue_setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 senderPID:(int)a9 sender:(id)a10 assertion:(id)a11 completion:(id)a12
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  id v24 = (void (**)(id, void))a12;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v23 setSenderPID:a9];
  [v23 setParametersForSettingsByType:v22 configurationUUID:v21 toSystem:v15 user:v14 passcode:v20 credentialSet:v19 sender:v18];

  [v23 setSenderPID:getpid()];
  if (v24) {
    v24[2](v24, 0LL);
  }
}

- (void)removeBoolSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RemoveBoolSetting"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000990C;
  v17[3] = &unk_1000C2F48;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(workerQueue, v17);
}

- (void)removeValueSetting:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RemoveValueForSetting"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100009A80;
  v17[3] = &unk_1000C2F48;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(workerQueue, v17);
}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009BA0;
  block[3] = &unk_1000C2F70;
  BOOL v16 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workerQueue, block);
}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = MCPostSetupAutoInstallSetAsideProfilePath();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v4 fileExistsAtPath:v6])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v8 = MCPostSetupAutoInstallSetAsideProfilePath();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v13 = 0LL;
    unsigned __int8 v10 = [v7 removeItemAtPath:v9 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      id v12 = _MCLogObjects[8];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to remove set aside mdm profile. Error: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {

    id v11 = 0LL;
  }

  if (v3) {
    v3[2](v3, v11);
  }
}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = MCCloudConfigurationSetAsideDetailsFilePath();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v4 fileExistsAtPath:v6])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v8 = MCCloudConfigurationSetAsideDetailsFilePath();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v13 = 0LL;
    unsigned __int8 v10 = [v7 removeItemAtPath:v9 error:&v13];
    id v11 = v13;

    if ((v10 & 1) == 0)
    {
      id v12 = _MCLogObjects[8];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to remove set aside cloud configuration. Error: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {

    id v11 = 0LL;
  }

  if (v3) {
    v3[2](v3, v11);
  }
}

- (void)_handleSettingsJumpWithProfileData:(id)a3 targetDeviceType:(unint64_t)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      unsigned __int8 v10 = &kMCSettingsURLProfilesInstallation;
      goto LABEL_7;
    case 2uLL:
      unsigned __int8 v10 = &kMCBridgeURLProfilesInstallation;
      goto LABEL_7;
    case 3uLL:
      unsigned __int8 v10 = &kMCHomeURLProfilesInstallation;
LABEL_7:
      -[MCProfileServiceServer openSettingsAppForProfileInstallation:bundleID:]( self,  "openSettingsAppForProfileInstallation:bundleID:",  *v10,  v9);
      break;
    default:
      id v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v12 = 134217984;
        unint64_t v13 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Profile Settings Jump is not supported for target device type: %lu",  (uint8_t *)&v12,  0xCu);
      }

      break;
  }
}

- (id)URLForInstallingProfileInSettingsApp:(id)a3 returningToBundleID:(id)a4
{
  id v4 = @"com.apple.springboard";
  if (a4) {
    id v4 = (const __CFString *)a4;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@&sender=%@",  a3,  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));

  return v6;
}

- (void)openSettingsAppForProfileInstallation:(id)a3 bundleID:(id)a4
{
  id v4 = @"com.apple.springboard";
  if (a4) {
    id v4 = (const __CFString *)a4;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@&sender=%@",  a3,  v4));
  id v6 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v9 = MCSBSApplicationLaunchFromURLOptionUnlockDeviceKey();
  unsigned __int8 v10 = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  [v7 openSensitiveURL:v6 withOptions:v8];

  notify_post((const char *)[MCProfileWasQueuedNotification UTF8String]);
}

- (void)signIntoFaceTimeWithUsername:(id)a3
{
}

- (void)_workerQueueRemoveAllCarrierProfiles
{
  id v3 = _MCLogObjects[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing all carrier profiles.", buf, 2u);
  }

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiersOfProfilesWithFilterFlags:2]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller", (void)v14));
        [v13 removeProfileWithIdentifier:v12 installationType:1 source:@"Carrier Profile Removal"];
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }
}

+ (id)_descriptionForServiceSubscriptionContext:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
    id v5 = [v3 slotID];

    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@, %s]",  v4,  CTSubscriptionSlotAsString(v5));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = @"<nil>";
  }

  return v7;
}

- (void)_workerQueueCheckCarrierProfileForCarrierIdentifier:(id)a3 name:(id)a4 atPath:(id)a5 forceReinstallation:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  unint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v13);

  __int128 v14 = _MCLogObjects[2];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v15 = @"<nil>";
    if (v12) {
      __int128 v15 = v12;
    }
    *(_DWORD *)buf = 138543362;
    v60 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: (wq) Evaluating carrier profile at path: %{public}@",  buf,  0xCu);
  }

  if (v12)
  {
    id v56 = v11;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifiersOfProfilesWithFilterFlags:2]);
    id v18 = v17;
    if (v17)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 lastObject]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCManifest installedProfileWithIdentifier:]( &OBJC_CLASS___MCManifest,  "installedProfileWithIdentifier:",  v19));
    }

    else
    {
      id v20 = 0LL;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v23 = [v22 fileExistsAtPath:v12];

    if (!v23)
    {
      id v33 = _MCLogObjects[2];
      id v26 = v20;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: No configuration profile found in carrier bundle.",  buf,  2u);
      }

      id v11 = v56;
      if ([v18 count])
      {
        id v34 = _MCLogObjects[2];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Removing carrier configuration profile.",  buf,  2u);
        }

        -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
      }

      goto LABEL_53;
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v12));
    id v25 = _MCLogObjects[2];
    id v26 = v20;
    uint64_t v55 = (void *)v24;
    if (!v24)
    {
      id v11 = v56;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Could not load configuration profile from carrier bundle.",  buf,  2u);
      }

      goto LABEL_52;
    }

    id v54 = v10;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Installing carrier configuration profile if needed...",  buf,  2u);
    }

    id v58 = 0LL;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v55,  &v58));
    id v28 = v58;
    if (!v28)
    {
      if (!a6 && v20)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
        if ([v29 isEqualToString:v30])
        {
          __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v27 UUID]);
          __int128 v51 = v29;
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
          unsigned __int8 v50 = [v52 isEqualToString:v31];

          if ((v50 & 1) != 0)
          {
            unsigned __int8 v32 = _MCLogObjects[2];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Carrier profile was already installed.",  buf,  2u);
            }

            id v28 = 0LL;
            goto LABEL_49;
          }
        }

        else
        {
        }
      }

      __int128 v53 = v20;
      -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
      id v35 = [(id)objc_opt_class(self) _optionsForCarrierProfileInstallationForCarrierIdentifier:v54 name:v56];
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
      id v57 = 0LL;
      id v38 =  [v37 installProfileData:v55 options:v36 interactionClient:0 source:@"MCProfileServiceServer._workerQueueCheckCarrierProfileAtPath" outError:&v57];
      id v28 = v57;

      if (!v28)
      {
        id v48 = _MCLogObjects[2];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Successfully installed carrier configuration profile.",  buf,  2u);
        }

        id v28 = 0LL;
        id v11 = v56;
        id v26 = v53;
        goto LABEL_50;
      }

      id v26 = v20;
    }

    os_log_t v39 = _MCLogObjects[2];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v40 = v39;
      BOOL v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      v60 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Error installing carrier profile: %{public}@",  buf,  0xCu);
    }

    -[MCProfileServiceServer _workerQueueRemoveAllCarrierProfiles](self, "_workerQueueRemoveAllCarrierProfiles");
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
    uint64_t v42 = MCInstallationErrorDomain;
    if ([v27 isEqual:MCInstallationErrorDomain])
    {
      id v43 = [v28 code];

      if (v43 != (id)4001)
      {
        id v26 = v20;
        id v11 = v56;
LABEL_51:

        id v10 = v54;
LABEL_52:

LABEL_53:
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
        [v49 rescheduleProfileJanitorJob];

        goto LABEL_54;
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v28 userInfo]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if (v27)
      {
        uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSError);
        id v26 = v20;
        if ((objc_opt_isKindOfClass(v27, v45) & 1) != 0)
        {
          BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
          id v11 = v56;
          if ([v46 isEqual:v42])
          {
            id v47 = [v27 code];

            if (v47 == (id)4009) {
              -[MCProfileServiceServer _workerQueueForceCheckOfCarrierProfileOnNextUnlock]( self,  "_workerQueueForceCheckOfCarrierProfileOnNextUnlock");
            }
          }

          else
          {
          }

          goto LABEL_50;
        }
      }

      else
      {
        id v26 = v20;
      }
    }

+ (id)_optionsForCarrierProfileInstallationForCarrierIdentifier:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", &off_1000CBEF0, kMCInstallProfileOptionFilterFlag);
  if (v5) {
    -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v5, kMCInstallProfileOptionCarrierIdentifier);
  }
  if (v6) {
    -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v6, kMCInstallProfileOptionCarrierName);
  }
  id v8 = -[NSMutableDictionary copy](v7, "copy");

  return v8;
}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _MCLogObjects[2];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: checkCarrierProfileAndForceReinstallation:completion:",  buf,  2u);
  }

  coreTelephonyClient = self->_coreTelephonyClient;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000AD34;
  v10[3] = &unk_1000C3010;
  BOOL v12 = a3;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  -[CoreTelephonyClient getPreferredDataSubscriptionContext:]( coreTelephonyClient,  "getPreferredDataSubscriptionContext:",  v10);
}

- (id)_carrierIdentifierFromContext:(id)a3
{
  return [a3 labelID];
}

- (id)_carrierNameFromContext:(id)a3
{
  id v4 = a3;
  id v5 = [[CTBundle alloc] initWithBundleType:1];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v16 = 0LL;
  id v7 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:]( coreTelephonyClient,  "copyCarrierBundleValue:key:bundleType:error:",  v4,  @"CarrierName",  v5,  &v16);

  id v8 = v16;
  if (!v7)
  {
    os_log_t v11 = _MCLogObjects[2];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = v11;
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 MCVerboseDescription]);
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Could not get carrier name: %{public}@",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    __int128 v14 = _MCLogObjects[2];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CheckCarrierProfile: Returned carrier name is not a string.",  buf,  2u);
    }

- (void)_workerQueueForceCheckOfCarrierProfileOnNextUnlock
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Forcing check of carrier profile on next unlock.",  v5,  2u);
  }

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v4);

  -[MCProfileServiceServer setWorkerQueueLastCarrierProfileCheckTime:]( self,  "setWorkerQueueLastCarrierProfileCheckTime:",  0LL);
}

- (void)_workerQueueCheckCarrierProfileOnUnlockSometimes
{
  id v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Device was unlocked, determining if we should check.",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer workerQueue](self, "workerQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_10000B9A8;
  __int128 v17 = &unk_1000C3038;
  id v18 = self;
  SEL v19 = a2;
  if (qword_1000DC030 != -1) {
    dispatch_once(&qword_1000DC030, &v14);
  }
  uint64_t v6 = mach_continuous_time();
  if (!-[MCProfileServiceServer workerQueueLastCarrierProfileCheckTime]( self,  "workerQueueLastCarrierProfileCheckTime",  v14,  v15,  v16,  v17,  v18,  v19))
  {
    BOOL v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Device was unlocked, never checked before, will check.",  buf,  2u);
    }

    goto LABEL_17;
  }

  unint64_t v7 = -[MCProfileServiceServer workerQueueLastCarrierProfileCheckTime](self, "workerQueueLastCarrierProfileCheckTime");
  if (byte_1000DC028) {
    unint64_t v8 = 86400LL;
  }
  else {
    unint64_t v8 = 0LL;
  }
  uint64_t v9 = _MCLogObjects[0];
  unint64_t v10 = (v6 - v7) * dword_1000DC018 / qword_1000DC020;
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v11 = @"will not";
    if (v10 > v8) {
      os_log_t v11 = @"will";
    }
    *(_DWORD *)buf = 134218242;
    unint64_t v21 = v10;
    __int16 v22 = 2112;
    unsigned int v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Device was unlocked, %qu seconds since last check, %@ check",  buf,  0x16u);
  }

  if (v10 > v8)
  {
LABEL_17:
    unint64_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CheckCarrierProfile: Device was unlocked, checking carrier profile.",  buf,  2u);
    }

    -[MCProfileServiceServer setWorkerQueueLastCarrierProfileCheckTime:]( self,  "setWorkerQueueLastCarrierProfileCheckTime:",  v6);
    -[MCProfileServiceServer checkCarrierProfileAndForceReinstallation:completion:]( self,  "checkCarrierProfileAndForceReinstallation:completion:",  0LL,  &stru_1000C3058);
  }

- (void)workerQueueReadBiometricState
{
  uint64_t v7 = 0LL;
  sub_100049A70();
  id v2 = 0LL;
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
    id v4 = [v2 BOOLValue];
    [v3 setBoolValue:v4 forSetting:MCFeatureFingerprintUnlockAllowed sender:@"MCProfileServiceServer.workerQueueReadBiometricState"];
  }

  else
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Fingerprint unlock state is not available yet. Ignoring.",  v6,  2u);
    }
  }
}

- (void)workerQueueNotifyDeviceUnlocked
{
}

- (void)workerQueueNotifyDeviceUnlockedAndPasscodeRequired
{
}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:",  buf,  2u);
  }

  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000BC58;
  v8[3] = &unk_1000C2EA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workerQueue, v8);
}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifyDeviceUnlockedWithCompletion:", buf, 2u);
  }

  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000BD64;
  v8[3] = &unk_1000C2EA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workerQueue, v8);
}

- (void)notifyFirstUnlock
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BDFC;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)notifyGracePeriodChanged
{
}

- (void)notifyProvisioningProfilesChanged
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BEEC;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (BOOL)_hasCompletedPostLoginWork
{
  id v2 = sem_open("profiled.firstboot_check", 0);
  id v3 = v2;
  if (v2 != (sem_t *)-1LL) {
    sem_close(v2);
  }
  return v3 != (sem_t *)-1LL;
}

- (void)_markPostUserLoginWorkCompleted
{
  id v2 = sem_open("profiled.firstboot_check", 512, 256LL, 0LL);
  if (v2 == (sem_t *)-1LL)
  {
    id v3 = (void *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      id v5 = __error();
      uint64_t v6 = strerror(*v5);
      *(_DWORD *)buf = 136446466;
      unint64_t v8 = "profiled.firstboot_check";
      __int16 v9 = 2082;
      unint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create semaphore %{public}s: %{public}s",  buf,  0x16u);
    }
  }

  else
  {
    sem_close(v2);
  }

- (void)notifyUserLoggedIn
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C1A8;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)workerQueueNotifyUserLoggedIn
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
  [v2 rescheduleProfileJanitorJob];
}

- (void)notifyMementoEffaced
{
  id v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received memento effaced notification. Clearing related opaque data.",  buf,  2u);
  }

  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C280;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)workerQueueNotifyMementoEffaced
{
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C30C;
  block[3] = &unk_1000C29D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, block);
}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-StoreCertificate"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000C5FC;
  v17[3] = &unk_1000C2F48;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(workerQueue, v17);
}

- (id)_badProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"PROVISIONING_ERROR_BAD_PROFILE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  25000LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_localProvisioningProfileError
{
  uint64_t v2 = MCProvisioningProfileErrorDomain;
  uint64_t v3 = MCErrorArray(@"PROVISIONING_ERROR_LOCAL_PROFILE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  25004LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-InstallProvisioningProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C8E0;
  block[3] = &unk_1000C2C18;
  id v18 = v8;
  id v19 = self;
  id v21 = v11;
  id v22 = v10;
  id v20 = v9;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(workerQueue, block);
}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-RemoveProvisioningProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CC8C;
  block[3] = &unk_1000C2C18;
  id v22 = v10;
  id v23 = v12;
  id v25 = v14;
  id v26 = v13;
  id v24 = v11;
  id v16 = v14;
  id v17 = v13;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  dispatch_async(workerQueue, block);
}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-AddTrustedProvisioningProfile"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000CF78;
  v17[3] = &unk_1000C2BC8;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(workerQueue, v17);
}

- (void)provisiongProfileUUIDsForSignerIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[MDMProvisioningProfileTrust provisioningProfileUUIDsForSignerIdentity:]( &OBJC_CLASS___MDMProvisioningProfileTrust,  "provisioningProfileUUIDsForSignerIdentity:",  a3));
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0LL);
}

- (BOOL)isBundleBlocked:(id)a3 outHash:(id *)a4 outHashType:(id *)a5
{
  if (!a3) {
    return 0;
  }
  id v11 = 0LL;
  int v10 = 26;
  char v7 = MISQueryBlacklistForBundle(a3, 0LL, 0LL, 0LL, &v11, &v10, 0LL);
  id v8 = v11;
  if (v11)
  {
    if (a4)
    {
      *a4 = v11;
      id v8 = v11;
    }

    CFRelease(v8);
  }

  if (a5 && v10) {
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
  }
  return v7;
}

- (void)workerQueueRemoveExpiredProfiles
{
  id v4 = objc_alloc_init(&OBJC_CLASS___MCProfileJanitor);
  -[MCProfileJanitor removeExpiredProfiles](v4, "removeExpiredProfiles");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
  [v3 rescheduleProfileJanitorJob];
}

- (void)removeExpiredProfiles
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D6D4;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)workerQueueRevalidateManagedApps
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
  [v3 updateMISTrust];

  id v4 = (id)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer workerQueueBackgroundActivityManager]( self,  "workerQueueBackgroundActivityManager"));
  [v4 rescheduleManagedAppValidationJob];
}

- (void)revalidateManagedApps
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D78C;
  block[3] = &unk_1000C29D0;
  void block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  id v4 = a3;
  -[MCProfileServiceServer removeExpiredProfiles](self, "removeExpiredProfiles");
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000D830;
    block[3] = &unk_1000C2B28;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, id))a4;
  id v8 = _MCLogObjects[2];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forgetting post-setup profile.", buf, 2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v16 = MCPostSetupAutoInstallProfilePath();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v15 removeItemAtPath:v17 error:0];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v19 = MCPostSetupAutoInstallSetAsideProfilePath();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v18 removeItemAtPath:v20 error:0];

    id v12 = 0LL;
    if (v7) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }

  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remembering post-setup profile.", buf, 2u);
  }

  uint64_t v10 = MCPostSetupAutoInstallProfilePath();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v30 = 0LL;
  [v6 writeToFile:v11 options:0 error:&v30];
  id v12 = v30;

  if (v12)
  {
    id v13 = _MCLogObjects[2];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138543362;
    id v32 = v12;
    id v14 = "Failed to store profile data with error: %{public}@";
    goto LABEL_14;
  }

  uint64_t v21 = MCPostSetupAutoInstallSetAsideProfilePath();
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v29 = 0LL;
  [v6 writeToFile:v22 options:0 error:&v29];
  id v12 = v29;

  if (!v12)
  {
    uint64_t v23 = MCPostSetupAutoInstallSetAsideProfilePath();
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    MCSetSkipBackupAttributeToItemAtPath(v24, 1LL);

    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 details]);
    id v27 = [v26 mutableCopy];

    id v28 = 0LL;
    -[MCProfileServiceServer storeCloudConfigurationDetails:outError:]( self,  "storeCloudConfigurationDetails:outError:",  v27,  &v28);
    id v12 = v28;

    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  id v13 = _MCLogObjects[2];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = v12;
    id v14 = "Failed to store set aside profile data with error: %{public}@";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
  }

- (void)storedProfileDataWithCompletion:(id)a3
{
  uint64_t v10 = (void (**)(id, void *, void))a3;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v4 = MCPostSetupAutoInstallProfilePath();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = [v3 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = MCPostSetupAutoInstallProfilePath();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v8));
  }

  else
  {
    BOOL v9 = 0LL;
  }

  v10[2](v10, v9, 0LL);
}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  uint64_t v3 = ((uint64_t (*)(void))MCCloudConfigurationDetailsFilePath)();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v4));

  if (v5)
  {
    uint64_t v6 = MCCloudConfigurationDetailsFilePath([v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 MCWriteToBinaryFile:v7];

    MCSendCloudConfigurationDetailsChangedNotification();
  }

  v8[2](v8, 0LL);
}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-ResetSettingsToDefault"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000DD6C;
  v15[3] = &unk_1000C3138;
  BOOL v19 = a3;
  id v17 = v10;
  id v18 = v9;
  id v16 = v8;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workerQueue, v15);
}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  id v4 = a3;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DE84;
  block[3] = &unk_1000C2B28;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, block);
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void, void))a3 + 2))(a3, 1LL, 0LL, 0LL);
  }
}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  id v6 = @"PRODUCT";
  uint64_t v7 = @"VERSION";
  id v8 = @"LANGUAGE";
  id v9 = @"OS_VERSION";
  id v10 = @"SUPPLEMENTAL_BUILD_VERSION";
  id v11 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
  id v12 = @"SOFTWARE_UPDATE_DEVICE_ID";
  uint64_t v3 = (void (**)(id, void *, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 7LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCMachineInfo machineInfoWithKeys:outError:]( &OBJC_CLASS___MCMachineInfo,  "machineInfoWithKeys:outError:",  v4,  0LL,  v6,  v7,  v8,  v9,  v10,  v11,  v12));
  v3[2](v3, v5, 0LL);
}

- (id)cloudConfigurationMachineInfo
{
  return -[MCProfileServiceServer cloudConfigurationMachineInfoDataWithAdditionalInfo:]( self,  "cloudConfigurationMachineInfoDataWithAdditionalInfo:",  &__NSDictionary0__struct);
}

- (id)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3
{
  uint64_t v7 = @"UDID";
  id v8 = @"SERIAL";
  id v9 = @"PRODUCT";
  id v10 = @"VERSION";
  id v11 = @"IMEI";
  id v12 = @"MEID";
  id v13 = @"LANGUAGE";
  id v14 = @"OS_VERSION";
  id v15 = @"SUPPLEMENTAL_BUILD_VERSION";
  id v16 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
  id v17 = @"SOFTWARE_UPDATE_DEVICE_ID";
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 11LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MCMachineInfo machineInfoWithKeys:challenge:identity:additionalInfo:outError:]( &OBJC_CLASS___MCMachineInfo,  "machineInfoWithKeys:challenge:identity:additionalInfo:outError:",  v4,  0LL,  0LL,  v3,  0LL,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17));

  return v5;
}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[MCProfileServiceServer cloudConfigurationMachineInfoDataWithAdditionalInfo:]( self,  "cloudConfigurationMachineInfoDataWithAdditionalInfo:",  a3));
  v6[2](v6, v7, 0LL);
}

- (BOOL)storeCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MCCloudConfigurationWriter sharedInstance]( &OBJC_CLASS___MCCloudConfigurationWriter,  "sharedInstance"));
  LOBYTE(a4) = [v6 saveCloudConfigurationDetails:v5 outError:a4];

  return (char)a4;
}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-CloudConfigStoreDetails"];
  id v19 = 0LL;
  -[MCProfileServiceServer storeCloudConfigurationDetails:outError:]( self,  "storeCloudConfigurationDetails:outError:",  v7,  &v19);

  id v9 = v19;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000E38C;
  v15[3] = &unk_1000C2E08;
  id v17 = v8;
  id v18 = v6;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  id v14 = v6;
  dispatch_async(v11, v15);
}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = _MCLogObjects[2];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Restoring cloud config & mdm profile from set aside data...",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v6 = MDMCloudConfigurationSetAsideDetailsFilePath();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (([v5 fileExistsAtPath:v7] & 1) == 0)
  {

    goto LABEL_11;
  }

  uint64_t v8 = MDMCloudConfigurationDetailsFilePath();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = [v5 fileExistsAtPath:v9];

  if ((v10 & 1) != 0)
  {
LABEL_11:
    int v18 = 0;
    goto LABEL_12;
  }

  id v11 = _MCLogObjects[2];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Restoring set aside cloud config...", buf, 2u);
  }

  uint64_t v12 = MDMCloudConfigurationSetAsideDetailsFilePath();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = MDMCloudConfigurationDetailsFilePath();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v31 = 0LL;
  DMCSafelyCopyItemAtPathToDestinationPathFM(v5, v13, v15, &v31);
  id v16 = v31;

  if (!v16)
  {
    int v18 = 1;
LABEL_12:
    uint64_t v19 = MDMPostSetupAutoInstallSetAsideProfilePath();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ([v5 fileExistsAtPath:v20])
    {
      uint64_t v21 = MDMPostSetupAutoInstallProfilePath();
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      unsigned __int8 v23 = [v5 fileExistsAtPath:v22];

      if ((v23 & 1) != 0)
      {
        id v16 = 0LL;
        if (!v18) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }

      id v24 = _MCLogObjects[2];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Restoring set aside mdm profile...",  buf,  2u);
      }

      uint64_t v25 = MDMPostSetupAutoInstallSetAsideProfilePath();
      id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = MDMPostSetupAutoInstallProfilePath();
      id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v30 = 0LL;
      DMCSafelyCopyItemAtPathToDestinationPathFM(v5, v26, v28, &v30);
      id v16 = v30;

      if (!v16) {
        goto LABEL_24;
      }
      id v29 = _MCLogObjects[2];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to restore set aside mdm profile",  buf,  2u);
      }
    }

    else
    {

      id v16 = 0LL;
    }

    if ((v18 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_24:
    MCSendCloudConfigurationDetailsChangedNotification();
    goto LABEL_25;
  }

  id v17 = _MCLogObjects[2];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to restore set aside cloud config",  buf,  2u);
  }

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, id))a3;
  id v4 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-CreateActivationLockBypass"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  unsigned int v6 = [v5 isSupervised];

  if (v6) {
    id v7 =  +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded]( &OBJC_CLASS___MCCrypto,  "createAndStoreNewActivationLockBypassCodeAndHashIfNeeded");
  }
  id v10 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MCCrypto storedActivationLockBypassCodeWithOutError:]( &OBJC_CLASS___MCCrypto,  "storedActivationLockBypassCodeWithOutError:",  &v10));
  id v9 = v10;
  if (v3) {
    v3[2](v3, v8, v9);
  }
}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  unsigned int v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-StoreActivationRecord"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kDMCActivationRecordDeviceFlagsKey]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMCFeatureOverrides activationRecordFlagsWithFlags:]( &OBJC_CLASS___DMCFeatureOverrides,  "activationRecordFlagsWithFlags:",  v9));
  if (v10)
  {
    if ((objc_opt_respondsToSelector(v10, "intValue") & 1) != 0)
    {
      unsigned __int8 v11 = [v10 intValue];
      uint64_t v12 = (CFPropertyListRef *)&kCFBooleanTrue;
      if ((v11 & 1) == 0) {
        uint64_t v12 = (CFPropertyListRef *)&kCFBooleanFalse;
      }
      id v13 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
      CFPreferencesSetAppValue( kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey,  *v12,  kMCNotBackedUpPreferencesDomain);
      CFPreferencesSetAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, 0LL, v13);
      uint64_t v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Wait for preferences to flush its caches",  buf,  2u);
      }

      _CFPreferencesFlushCachesForIdentifier(v13, kMCPreferencesMobileUserName);
      id v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saved activation configuration.", buf, 2u);
      }

      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer memberQueue](self, "memberQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000EB10;
      block[3] = &unk_1000C29D0;
      void block[4] = self;
      dispatch_barrier_async(v16, block);

      workerQueue = (dispatch_queue_s *)self->_workerQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10000EB1C;
      v23[3] = &unk_1000C2AA0;
      void v23[4] = self;
      id v24 = v8;
      dispatch_async(workerQueue, v23);

      goto LABEL_16;
    }

    int v18 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "The activation record configuration flags entry is invalid.",  buf,  2u);
    }
  }

  uint64_t v19 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  id v20 = (const __CFString *)kMCPreferencesMobileUserName;
  CFPreferencesSetValue( kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey,  kCFBooleanFalse,  kMCNotBackedUpPreferencesDomain,  kMCPreferencesMobileUserName,  kCFPreferencesCurrentHost);
  CFPreferencesSetValue( kMCPreferencesLockdownCloudConfigurationAvailableKey,  kCFBooleanFalse,  v19,  v20,  kCFPreferencesCurrentHost);
  uint64_t v21 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Wait for preferences to flush its caches",  buf,  2u);
  }

  _CFPreferencesFlushCachesForIdentifier(v19, v20);
  id v22 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "No activation configuration was received.",  buf,  2u);
  }

- (void)setURLsFromUserBookmarkDictsAsSettings:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v7 setObject:v8 forKeyedSubscript:MCIntersectionKey];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v8 setObject:v9 forKeyedSubscript:MCFeatureWebContentFilterWhitelistedURLs];
  if (v5)
  {
    id v20 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v5 count]));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v21 = v5;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      uint64_t v15 = kMCWCFAddressKey;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v22 + 1) + 8 * (void)v16) objectForKeyedSubscript:v15]);
          if (v17) {
            [v10 addObject:v17];
          }

          id v16 = (char *)v16 + 1;
        }

        while (v13 != v16);
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v13);
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    [v9 setObject:v18 forKeyedSubscript:MCSettingParameterValuesKey];

    id v6 = v20;
    id v5 = v21;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v19 setParametersForSettingsByType:v7 sender:v6];
}

- (id)bookmarksFromBookmarkDicts:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
          id v12 = objc_alloc(&OBJC_CLASS___MCBookmark);
          id v13 = objc_msgSend(v12, "initWithSerializableDictionary:", v11, (void)v15);
          if (v13) {
            [v5 addObject:v13];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)bookmarkDictsFromBookmarks:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "serializableDictionary",  (void)v13));
          if (v11) {
            [v5 addObject:v11];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)setUserBookmarks:(id)a3 senderPID:(int)a4 sender:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = (void (**)(id, void))a6;
  id v11 = a5;
  id v12 = a3;
  id v17 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-SetUserBookmarks"];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceServer bookmarksFromBookmarkDicts:](self, "bookmarksFromBookmarkDicts:", v12));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCBookmarkManager sharedManager](&OBJC_CLASS___MCBookmarkManager, "sharedManager"));
  [v14 setUserBookmarks:v13];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v15 setSenderPID:v7];

  -[MCProfileServiceServer setURLsFromUserBookmarkDictsAsSettings:sender:]( self,  "setURLsFromUserBookmarkDictsAsSettings:sender:",  v12,  v11);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v16 setSenderPID:getpid()];

  v10[2](v10, 0LL);
}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCProvisioningProfileJanitor sharedJanitor]( &OBJC_CLASS___MCProvisioningProfileJanitor,  "sharedJanitor"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000F254;
  v9[3] = &unk_1000C3160;
  id v10 = v5;
  id v8 = v5;
  [v7 updateMISTrustAndValidateApps:v6 validateManagedApps:1 completion:v9];
}

- (void)monitorEnrollmentStateForClient:(id)a3 personaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  monitorQueue = (dispatch_queue_s *)self->_monitorQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_10000F30C;
  v11[3] = &unk_1000C2AA0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(monitorQueue, v11);
}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  [v4 refreshDetailsFromDisk];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 memberQueueOrganizationInfo]);
  if (v5) {
    goto LABEL_2;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 details]);

  uint64_t v8 = kCCOrganizationNameKey;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kCCOrganizationNameKey]);

  if (v9)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v27 = v8;
    v36[0] = v8;
    v36[1] = kCCOrganizationShortNameKey;
    v36[2] = kCCOrganizationDepartmentKey;
    v36[3] = kCCOrganizationAddressKey;
    v36[4] = kCCOrganizationAddressLine1Key;
    v36[5] = kCCOrganizationAddressLine2Key;
    v36[6] = kCCOrganizationAddressLine3Key;
    v36[7] = kCCOrganizationCityKey;
    v36[8] = kCCOrganizationRegionKey;
    v36[9] = kCCOrganizationZipCodeKey;
    v36[10] = kCCOrganizationCountryKey;
    v36[11] = kCCOrganizationPhoneKey;
    v36[12] = kCCOrganizationEmailKey;
    v36[13] = kCCOrganizationSupportPhoneKey;
    v36[14] = kCCOrganizationSupportEmailKey;
    v36[15] = kCCOrganizationVendorID;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 16LL));
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);

          if (v16)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v15]);
            [v5 setObject:v17 forKeyedSubscript:v15];
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }

      while (v12);
    }

    uint64_t v8 = v27;
    if (v5) {
      goto LABEL_2;
    }
  }

  else
  {
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 memberQueueManagingProfileIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 installedProfileWithIdentifier:v19]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 organization]);
  if (v21)
  {
    uint64_t v34 = v8;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 organization]);
    id v35 = v22;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));

    if (v5) {
      goto LABEL_2;
    }
  }

  else
  {
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 memberQueueServerURL]);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 host]);

  if (v24)
  {
    uint64_t v32 = v8;
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v4 memberQueueServerURL]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 host]);
    id v33 = v26;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
  }

  else
  {
    id v5 = 0LL;
  }

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:]( v21,  "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:decl arationConfiguration:completion:",  v20,  v19,  v18,  v11,  v17,  v16,  v15);
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager unstageMDMEnrollmentInfoForPairingWatchWithCompletion:]( v4,  "unstageMDMEnrollmentInfoForPairingWatchWithCompletion:",  v3);
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:]( v4,  "fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:",  v3);
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:]( v7,  "fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:",  v6,  v5);
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:]( v4,  "fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:",  v3);
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v13 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCCloudConfigurationWriter sharedInstance]( &OBJC_CLASS___MCCloudConfigurationWriter,  "sharedInstance"));
  -[MCPairedWatchManager applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:]( v13,  "applyPairingWatchMDMEnrollmentData:source:usingProfileInstaller:cloudConfigReader:cloudConfigWriter:completion:",  v10,  v9,  self,  v11,  v12,  v8);
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___MCPairedWatchManager);
  -[MCPairedWatchManager updateMDMEnrollmentInfoForPairingWatch:completion:]( v7,  "updateMDMEnrollmentInfoForPairingWatch:completion:",  v6,  v5);
}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [[DMCPowerAssertion alloc] initWithReason:@"profiled-DebugRescheduleBackgroundActivity"];
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000FBA0;
  block[3] = &unk_1000C3188;
  id v28 = v15;
  int64_t v29 = a3;
  void block[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workerQueue, block);
}

- (DMCDaemonConnectionTracker)connectionTracker
{
  return self->_connectionTracker;
}

- (void)setConnectionTracker:(id)a3
{
}

- (os_unfair_lock_s)checkInLock
{
  return self->_checkInLock;
}

- (void)setCheckInLock:(os_unfair_lock_s)a3
{
  self->_checkInLock = a3;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (MCBackgroundActivityManager)workerQueueBackgroundActivityManager
{
  return self->_workerQueueBackgroundActivityManager;
}

- (void)setWorkerQueueBackgroundActivityManager:(id)a3
{
}

- (OS_dispatch_queue)monitorQueue
{
  return self->_monitorQueue;
}

- (void)setMonitorQueue:(id)a3
{
}

- (unint64_t)workerQueueLastCarrierProfileCheckTime
{
  return self->_workerQueueLastCarrierProfileCheckTime;
}

- (void)setWorkerQueueLastCarrierProfileCheckTime:(unint64_t)a3
{
  self->_workerQueueLastCarrierProfileCheckTime = a3;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (double)memberQueueIdleTimeInterval
{
  return self->_memberQueueIdleTimeInterval;
}

- (void)setMemberQueueIdleTimeInterval:(double)a3
{
  self->_memberQueueIdleTimeInterval = a3;
}

- (BOOL)memberQueueHasMigrated
{
  return self->_memberQueueHasMigrated;
}

- (void)setMemberQueueHasMigrated:(BOOL)a3
{
  self->_memberQueueHasMigrated = a3;
}

- (BOOL)memberQueueHasActivationRecordChangesPending
{
  return self->_memberQueueHasActivationRecordChangesPending;
}

- (void)setMemberQueueHasActivationRecordChangesPending:(BOOL)a3
{
  self->_memberQueueHasActivationRecordChangesPending = a3;
}

- (OS_dispatch_queue)clientRestrictionQueue
{
  return self->_clientRestrictionQueue;
}

- (void)setClientRestrictionQueue:(id)a3
{
}

- (OS_dispatch_queue)mailAccountsQueue
{
  return self->_mailAccountsQueue;
}

- (void)setMailAccountsQueue:(id)a3
{
}

- (id)powerAssertionAssertedNotificationToken
{
  return self->_powerAssertionAssertedNotificationToken;
}

- (void)setPowerAssertionAssertedNotificationToken:(id)a3
{
}

- (id)powerAssertionDeassertedNotificationToken
{
  return self->_powerAssertionDeassertedNotificationToken;
}

- (void)setPowerAssertionDeassertedNotificationToken:(id)a3
{
}

- (int)mobileKeybagLockStateChangeNotificationToken
{
  return self->_mobileKeybagLockStateChangeNotificationToken;
}

- (void)setMobileKeybagLockStateChangeNotificationToken:(int)a3
{
  self->_mobileKeybagLockStateChangeNotificationToken = a3;
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end