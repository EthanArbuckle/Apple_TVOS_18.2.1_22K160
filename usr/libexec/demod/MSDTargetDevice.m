@interface MSDTargetDevice
+ (MSDTargetDevice)sharedInstance;
- (BOOL)aboutToReboot;
- (BOOL)allowAccountSetup;
- (BOOL)allowEnteringDemoMode;
- (BOOL)allowSnapshotMode;
- (BOOL)allowSnapshotRevertTimer;
- (BOOL)backgroundDownloadActive;
- (BOOL)cachedBundleInstallAttempted;
- (BOOL)canLockSnapshot;
- (BOOL)canRevertSnapshot;
- (BOOL)canRunCleanUpForBetterTogetherDevice;
- (BOOL)canStartBackgroundDownload;
- (BOOL)canStartContentUpdate;
- (BOOL)canStartOSUpdate;
- (BOOL)canUnenrollWithObliteration:(BOOL)a3 consultDeviceOptions:(BOOL)a4;
- (BOOL)canUnlockSnapshot;
- (BOOL)cleanUpPreferencesFile;
- (BOOL)clearCurrentiOSBuild;
- (BOOL)createMobileStoreDemoCache;
- (BOOL)createTemporaryPasscodeIfNeeded;
- (BOOL)criticalUpdatePrioritized;
- (BOOL)dcotaOfflineModeDevice;
- (BOOL)deactivateDevice;
- (BOOL)deleteConfigurationApp;
- (BOOL)deleteNVRam:(id)a3;
- (BOOL)deleteOperationRequest;
- (BOOL)deleteOperationRequestAndQuitHelper;
- (BOOL)demoModeValueForKey:(id)a3;
- (BOOL)demoSetup;
- (BOOL)holdPowerAssertion;
- (BOOL)iCloudAccountSyncNeeded;
- (BOOL)isBetterTogetherDemo;
- (BOOL)isContentFrozen;
- (BOOL)isDemoEligible;
- (BOOL)isDemoModeOn;
- (BOOL)isOfflineMode;
- (BOOL)isPasscodeModificationAllowed;
- (BOOL)isPressDemoDevice;
- (BOOL)isVerifiedDemoDevice;
- (BOOL)isVerifiedPOSDevice;
- (BOOL)liftPowerAssertion;
- (BOOL)lockSnapshot;
- (BOOL)managedStoreDemoMode;
- (BOOL)migrateCellularSupportFlag;
- (BOOL)migrateDemoDeviceToDemoVolume;
- (BOOL)migratePreferenceAndWifiSettingsToDemoVolume;
- (BOOL)moveFilesToFinalDst:(id)a3 finalPath:(id)a4;
- (BOOL)overrideComputerNameAndHostnameIfNeeded;
- (BOOL)powerAssertionActive;
- (BOOL)pressDemoMode;
- (BOOL)proceeded;
- (BOOL)removeKeyFromPreferenceFile:(id)a3;
- (BOOL)removePerHubInfoFromPreferencesForMigration;
- (BOOL)removeTemporaryPasscodeIfNeeded;
- (BOOL)revertSnapshot;
- (BOOL)revertSnapshotAndShutdown;
- (BOOL)runCleanUpForBetterTogetherDevice;
- (BOOL)saveCurrentiOSBuild;
- (BOOL)saveHubCertificateIdentifer:(id)a3;
- (BOOL)saveHubHostNameList:(id)a3;
- (BOOL)saveHubSuppliedSettings:(id)a3;
- (BOOL)saveOperationError:(id)a3;
- (BOOL)saveOperationRequest:(id)a3 requestFlag:(int)a4 completeBy:(int)a5;
- (BOOL)setDemoDeviceFlag;
- (BOOL)setDemoEnrollmentFlag:(id)a3;
- (BOOL)setPOSDeviceFlag;
- (BOOL)setPasscodeModificationAllowed:(BOOL)a3;
- (BOOL)setSEPDemoMode:(BOOL)a3;
- (BOOL)setupDemoDeviceMetadataFolder;
- (BOOL)setupDummyPreferenceFile;
- (BOOL)setupFactoryDemoDeviceMetadataFolder;
- (BOOL)shouldForgetKnownNetworkUponUnlock;
- (BOOL)snapshotRevertFlagged;
- (BOOL)storeDemoMode;
- (BOOL)switchModeImmediately:(int)a3;
- (BOOL)toggleSEPDemoModeOnManagedPreferencesChange;
- (BOOL)turnOnDemoMode;
- (BOOL)turnOnPressDemoMode;
- (BOOL)turnOnStoreDemoMode;
- (BOOL)unenrollWithObliteration:(BOOL)a3 preserveESim:(BOOL)a4 callUnregister:(BOOL)a5 preserveDDLFlag:(BOOL)a6;
- (BOOL)unlockSnapshot;
- (BOOL)updateDeviceOptions:(id)a3 skipImutableKeys:(BOOL)a4;
- (BOOL)waitingForCommand;
- (MSDHelperAgent)helperAgent;
- (MSDTargetDevice)init;
- (NSData)certificateHash;
- (NSDate)lastRebootTime;
- (NSDictionary)wifiSettings;
- (NSNumber)buddyCompletionHandlerLock;
- (NSNumber)modeLock;
- (NSNumber)nandSize;
- (NSString)OSBuild;
- (NSString)OSVersion;
- (NSString)cachedBundleInstallState;
- (NSString)demodVersion;
- (NSString)hubHostName;
- (NSString)hubPort;
- (NSString)hubProtocolVersion;
- (NSString)installedFactoryBundleID;
- (NSString)localHubFailureReason;
- (NSString)manifestAndFileDownloadInfoPath;
- (NSString)manifestPath;
- (NSString)name;
- (NSString)packageVersion;
- (NSString)preferredStoreID;
- (NSString)productType;
- (NSString)request;
- (NSString)response;
- (NSString)s3ServerFailureReason;
- (NSString)serialNumber;
- (NSString)udid;
- (NSTimer)caLogsUploadTimer;
- (NSTimer)snapshotRevertTimer;
- (NSTimer)waitForCommandTimer;
- (id)buddyCompletionHandler;
- (id)decodeComponentIdx:(int)a3 forSavedString:(id)a4;
- (id)demoUserHomePath;
- (id)deviceInformation:(id)a3;
- (id)deviceInformation:(id)a3 appendPingInfo:(BOOL)a4;
- (id)deviceInformationForPing:(id)a3;
- (id)getCachingHubFailureEventForPing;
- (id)getDemoEnrollmentFlag;
- (id)getDeviceOptions;
- (id)getOSUpdateRequest;
- (id)getS3ServerFailureEventForPing;
- (id)getSavedError;
- (id)getSavedRequest;
- (id)hubCertificateIdentifier;
- (id)hubHostNameList;
- (id)hubSuppliedSettings;
- (id)iCloudAccountRecoveryKey;
- (id)installedDeletableSystemApps;
- (id)lastSettingsUpdatedTime;
- (id)lastShallowRefreshTime;
- (id)lastSnapshotRevertTime;
- (id)minOSVersionAvailable;
- (id)pathForDummyPreferenceFile;
- (id)previousiOSBuild;
- (id)readNVRam:(id)a3;
- (id)requiredDeletableSystemApps;
- (id)retrieveSignedManifest;
- (int)activationConfigurationFlags;
- (int)getSavedCompleteByInterval;
- (int)getSavedFlag;
- (int)mode;
- (int64_t)batteryCapacity;
- (int64_t)findMyHubRetryAtTime;
- (int64_t)getFreeSpace;
- (int64_t)hubLastOnlineTime;
- (unint64_t)backgroundDownloadState;
- (unint64_t)fetchActiveNetworkInterface;
- (unint64_t)typeOfDemoDevice;
- (unsigned)powerAssertion;
- (void)backToVirgin:(int)a3;
- (void)caLogsUploadTimerHandler:(id)a3;
- (void)cleanUpBackgroundState:(BOOL)a3;
- (void)cleanupDummyPreferenceFile;
- (void)clearMinOSVersionAvailable;
- (void)clearOSUpdateRequest;
- (void)clearUpF200FootprintIfNeeded;
- (void)clearUpNvramIfNeeded;
- (void)configureNetworkInterface;
- (void)delayRebootForTesting;
- (void)destroyWorkFolderForBootTask;
- (void)disableLaunchdServicesIfNeededForWatch;
- (void)disableSUAutoDownloadForWatch;
- (void)enableSnapshotMode:(BOOL)a3;
- (void)forceSwitchToDemoModeIfNeeded;
- (void)forceSwitchToDemoUpdateModeIfNeeded;
- (void)installAndWaitForSystemApps;
- (void)invokeHandler:(BOOL)a3;
- (void)manageDataVolume:(id)a3;
- (void)manageDemoVolume:(id)a3;
- (void)manageDeviceSnapshot:(id)a3;
- (void)manageUserVolume:(id)a3;
- (void)manualUpdateMode:(BOOL *)a3 allowChange:(BOOL *)a4;
- (void)markContentInstallingInstalled;
- (void)migrateNvramToDemoVolume;
- (void)obliterateDeviceWithAdminCredential:(id)a3;
- (void)patchBackupFolderInStaging:(id)a3;
- (void)processNewFeatureFlags:(id)a3 oldFeatureFlags:(id)a4;
- (void)reboot;
- (void)rebootForStage:(int)a3;
- (void)rebootWithSnapshotRevertForStage:(int)a3;
- (void)refreshStoreHoursManagerUsingSettings;
- (void)registerCAHearbeatActivity;
- (void)resetSystemTimeCache;
- (void)saveDeviceOptions:(id)a3;
- (void)saveFindMyHubRetryAtTime:(int64_t)a3;
- (void)saveHubLastOnlineTime:(int64_t)a3;
- (void)saveLastSettingsUpdatedTime:(id)a3;
- (void)saveLastShallowRefreshTime:(id)a3;
- (void)saveLastSnapshotRevertTime:(id)a3;
- (void)saveMinOSVersionAvailable:(id)a3;
- (void)saveOSUpdateRequest:(id)a3;
- (void)saveRequiredDeletableSystemApps;
- (void)saveSnapshotRevertFlagged:(BOOL)a3;
- (void)saveiCloudAccountRecoveryKey:(id)a3;
- (void)saveiCloudAccountSyncNeeded:(BOOL)a3;
- (void)setAboutToReboot:(BOOL)a3;
- (void)setBackgroundDownloadActive:(BOOL)a3;
- (void)setBackgroundDownloadState:(unint64_t)a3;
- (void)setBuddyCompletionHandler:(id)a3;
- (void)setBuddyCompletionHandlerLock:(id)a3;
- (void)setCaLogsUploadTimer:(id)a3;
- (void)setCachedBundleInstallState:(id)a3;
- (void)setCriticalUpdatePrioritized:(BOOL)a3;
- (void)setHelperAgent:(id)a3;
- (void)setHubHostName:(id)a3;
- (void)setHubPort:(id)a3;
- (void)setHubProtocolVersion:(id)a3;
- (void)setInstalledFactoryBundleID:(id)a3;
- (void)setLocalHubFailureReason:(id)a3;
- (void)setMode:(int)a3;
- (void)setModeLock:(id)a3;
- (void)setPowerAssertion:(unsigned int)a3;
- (void)setPreferredStoreID:(id)a3;
- (void)setProceeded:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setS3ServerFailureReason:(id)a3;
- (void)setShouldForgetKnownNetworkUponUnlock:(BOOL)a3;
- (void)setSnapshotRevertTimer:(id)a3;
- (void)setStoreDemoMode:(BOOL)a3;
- (void)setWaitForCommandTimer:(id)a3;
- (void)setWaitingForCommand:(BOOL)a3;
- (void)setWifiSettings:(id)a3;
- (void)setupCoreAnalyticsLogsUploadTimer;
- (void)setupSnapshotRevertTimer;
- (void)setupStoreHoursManager;
- (void)setupWorkFolderForBootTask;
- (void)shutdown;
- (void)snapshotRevertTimerHandler:(id)a3;
- (void)startWaitingForCommandTimer;
- (void)syncStoreDemoMode:(int)a3;
- (void)terminateConfigurationApp;
- (void)unregisterCAHeartbeatActivity;
- (void)waitForBuddy:(id)a3;
- (void)waitForBuddy:(id)a3 updateStatus:(BOOL)a4;
- (void)waitForBuddyWithTimeout;
- (void)waitForBuddyWithoutStatusUpdate:(id)a3;
- (void)waitForNetworkReachability;
- (void)waitForNetworkReachabilityWithTimeout:(unint64_t)a3;
- (void)waitForPricing:(int)a3 forReboot:(BOOL)a4;
@end

@implementation MSDTargetDevice

+ (MSDTargetDevice)sharedInstance
{
  if (qword_100125508 != -1) {
    dispatch_once(&qword_100125508, &stru_1000FA558);
  }
  return (MSDTargetDevice *)(id)qword_100125500;
}

- (MSDTargetDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDTargetDevice;
  v2 = -[MSDTargetDevice init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    -[MSDTargetDevice setHelperAgent:](v2, "setHelperAgent:", v3);

    -[MSDTargetDevice setPowerAssertion:](v2, "setPowerAssertion:", 0LL);
  }

  return v2;
}

- (NSString)name
{
  return (NSString *)(id)MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
}

- (NSString)udid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v3 = [v2 macOS];

  if (v3)
  {
    v4 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByPaddingToLength:25 withString:@"0" startingAtIndex:0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uppercaseString]);
  }

  else
  {
    v6 = (void *)MGCopyAnswer(@"UniqueDeviceID", 0LL);
  }

  return (NSString *)v6;
}

- (NSString)serialNumber
{
  return (NSString *)(id)MGCopyAnswer(@"SerialNumber", 0LL);
}

- (int)mode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"demo-install-state"]);

  if (v3) {
    int v4 = [v3 integerValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)typeOfDemoDevice
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if (v4) {
    return 6LL;
  }
  if (-[MSDTargetDevice isVerifiedDemoDevice](self, "isVerifiedDemoDevice"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    unsigned int v7 = [v6 fileExistsAtPath:@"/private/var/demo_backup/Metadata/Content.plist"];

    BOOL v8 = v7 == 0;
    unint64_t v9 = 4LL;
  }

  else
  {
    if (-[MSDTargetDevice storeDemoMode](self, "storeDemoMode")) {
      return 3LL;
    }
    BOOL v8 = !-[MSDTargetDevice isVerifiedPOSDevice](self, "isVerifiedPOSDevice");
    unint64_t v9 = 1LL;
  }

  if (v8) {
    return v9;
  }
  else {
    return v9 + 1;
  }
}

- (void)setMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  [v5 setObject:v4 forKey:@"demo-install-state"];
}

- (BOOL)removeKeyFromPreferenceFile:(id)a3
{
  id v3 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = [v4 removeObjectForKey:v3];

  if ((v5 & 1) == 0)
  {
    id v7 = sub_10003A95C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009BA94();
    }
  }

  return v5;
}

- (NSString)request
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"msd-request"]);

  return (NSString *)v3;
}

- (void)setRequest:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"msd-request"];
}

- (NSString)response
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"msd-response"]);

  return (NSString *)v3;
}

- (void)setResponse:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"msd-response"];
}

- (BOOL)switchModeImmediately:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v5);
  uint64_t v6 = -[MSDTargetDevice mode](self, "mode");
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d-%d", v6, v3));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestInterface sharedInstance](&OBJC_CLASS___MSDTestInterface, "sharedInstance"));
    [v8 pushTestEvent:v7 ofType:@"deviceModeChange"];
  }

  BOOL v9 = (_DWORD)v3 == 4 && (_DWORD)v6 == 2;
  char v10 = v9;
  if (v9)
  {
    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v50 = 2;
      __int16 v51 = 1024;
      int v52 = 4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Changing mode from %d to %d, waiting for 30s...",  buf,  0xEu);
    }

    sleep(0x1Eu);
  }

  else
  {
    switch((int)v3)
    {
      case 0:
      case 9:
        -[MSDTargetDevice backToVirgin:](self, "backToVirgin:", v3);
        if ((_DWORD)v3 == 8 || (_DWORD)v3 == 6) {
          goto LABEL_17;
        }
        break;
      case 6:
      case 8:
LABEL_17:
        id v13 = sub_10003A95C();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Move device to clearing mode to change the device to virgin/obliterate...",  buf,  2u);
        }

        -[MSDTargetDevice setMode:](self, "setMode:", v3);
        -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 0LL);
        break;
      default:
        break;
    }
  }

  if ((_DWORD)v6 == (_DWORD)v3) {
    goto LABEL_111;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if ((v3 & 0xFFFFFFFE) != 4 || !v16)
  {
LABEL_28:
    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v50 = v6;
      __int16 v51 = 1024;
      int v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Changing mode from %d to %d", buf, 0xEu);
    }

    BOOL v24 = (_DWORD)v3 == 5 && (_DWORD)v6 == 0;
    BOOL v25 = (_DWORD)v3 == 1 || (_DWORD)v3 == 5;
    if (!v25 || (_DWORD)v6)
    {
      BOOL v26 = (_DWORD)v3 == 2 || (_DWORD)v3 == 5;
      if (!v26 || (_DWORD)v6 != 1)
      {
        BOOL v27 = (_DWORD)v3 == 5;
        BOOL v28 = (_DWORD)v6 == 2 && (_DWORD)v3 == 5;
        if ((_DWORD)v3 == 7 && (_DWORD)v6 == 1) {
          BOOL v28 = 1;
        }
        char v30 = v10 | v28;
        BOOL v31 = (_DWORD)v6 == 7 && (_DWORD)v3 == 5;
        if ((_DWORD)v6 != 4) {
          BOOL v27 = 0;
        }
        if ((v30 & 1) == 0 && !v31 && !v27)
        {
          BOOL v32 = (v3 - 1) <= 1 || (_DWORD)v3 == 7;
          if (!v32 || (_DWORD)v6 != 5)
          {
            id v46 = sub_10003A95C();
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              int v50 = v6;
              __int16 v51 = 1024;
              int v52 = v3;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Cannot change mode from %d to %d",  buf,  0xEu);
            }

            id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727740956LL,  @"The operation is not allowed."));
            goto LABEL_91;
          }
        }
      }
    }

    unsigned __int8 v33 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    if ([v34 macOS])
    {
      BOOL v35 = (v33 & 2) == 0;
    }

    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
      if (([v36 iOS] & 1) == 0)
      {

        goto LABEL_79;
      }

      BOOL v35 = (v33 & 2) == 0;
    }

    if (!v35)
    {
      if ((_DWORD)v3 == 4)
      {
        -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 60LL, 1LL);
        goto LABEL_80;
      }

      if ((_DWORD)v3 == 5 && (_DWORD)v6 == 4) {
        -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 0LL, 1LL);
      }
      goto LABEL_85;
    }

- (void)waitForPricing:(int)a3 forReboot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
  if (v4)
  {
    BOOL v8 = self;
    objc_sync_enter(v8);
    -[MSDTargetDevice setAboutToReboot:](v8, "setAboutToReboot:", 1LL);
    objc_sync_exit(v8);
  }

  if (([v7 completed] & 1) == 0)
  {
    if ((_DWORD)v5)
    {
      if (v4)
      {
        [v7 stopMonitor];
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLocalMessageResponder sharedInstance]( &OBJC_CLASS___MSDLocalMessageResponder,  "sharedInstance"));
        [v9 sendRebootTimeoutMessageToPricing:v5];
      }

      id v10 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      LODWORD(v20) = 67109120;
      HIDWORD(v20) = v5;
      v12 = "Defering the operation (up to %d seconds) as Pricing update is not done yet...";
      id v13 = v11;
      uint32_t v14 = 8;
    }

    else
    {
      id v15 = sub_10003A95C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
        [v16 updateStage:17];

        goto LABEL_13;
      }

      LOWORD(v20) = 0;
      v12 = "Defering the operation until the Pricing update is done...";
      id v13 = v11;
      uint32_t v14 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, v14);
    goto LABEL_12;
  }

- (void)forceSwitchToDemoModeIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if (v5)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "The device is enrolled, will force to demo mode now.",  buf,  2u);
    }

    if (-[MSDTargetDevice mode](self, "mode") == 4)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateController sharedInstance](&OBJC_CLASS___MSDDemoUpdateController, "sharedInstance"));
      objc_msgSend(v8, "migrateDataWithBlockingUI:startMigration:", -[MSDTargetDevice mode](self, "mode"), 1);
    }

    -[MSDTargetDevice deleteConfigurationApp](self, "deleteConfigurationApp");
    if (-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
      [v9 saveCurrentWiFiSettings];
    }

    if (-[MSDTargetDevice mode](self, "mode") == 2 || -[MSDTargetDevice mode](self, "mode") == 4)
    {
      -[MSDTargetDevice markContentInstallingInstalled](self, "markContentInstallingInstalled");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
      [v10 switchToBackupFolder];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleInProgress]);
      [v12 stopBundleUpdateTimer];
    }

    if (-[MSDTargetDevice mode](self, "mode") == 7) {
      -[MSDTargetDevice clearOSUpdateRequest](self, "clearOSUpdateRequest");
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    [v13 updateStage:7];

    unsigned __int8 v14 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    if (([v15 macOS] & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
      if (([v16 iOS] & 1) == 0)
      {

LABEL_22:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
        [v19 clearStagedDeviceAfterUpdateProcess];

        -[MSDTargetDevice setMode:](self, "setMode:", 5LL);
        -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 1LL);
        goto LABEL_23;
      }
    }

    if ((v14 & 2) != 0) {
      -[MSDTargetDevice waitForPricing:forReboot:](self, "waitForPricing:forReboot:", 60LL, 1LL);
    }
    goto LABEL_22;
  }

  id v17 = sub_10003A95C();
  BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "The device has not been enrolled, will not force to demo mode.",  v20,  2u);
  }

LABEL_23:
  objc_sync_exit(v3);
}

- (void)forceSwitchToDemoUpdateModeIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice modeLock](self, "modeLock"));
  objc_sync_enter(v3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if (v5)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "The device is enrolled and was updating demo content, will force to demo update mode.",  buf,  2u);
    }

    if (-[MSDTargetDevice mode](self, "mode") == 4)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
      [v8 updateStage:100];

      -[MSDTargetDevice setMode:](self, "setMode:", 2LL);
    }
  }

  else
  {
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "The device has not been enrolled, will not force to demo update mode.",  v11,  2u);
    }
  }

  objc_sync_exit(v3);
}

- (BOOL)setDemoDeviceFlag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  unsigned __int8 v4 = [v2 setObject:v3 forKey:@"DemoDevice"];

  if ((v4 & 1) == 0)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000984A0();
    }
  }

  return v4;
}

- (BOOL)setPOSDeviceFlag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  unsigned __int8 v4 = [v2 setObject:v3 forKey:@"POSDevice"];

  if ((v4 & 1) == 0)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009BAF8();
    }
  }

  return v4;
}

- (void)setPreferredStoreID:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"PreferredStoreID"];
}

- (NSString)preferredStoreID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"PreferredStoreID"]);

  return (NSString *)v3;
}

- (void)obliterateDeviceWithAdminCredential:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance", a3));
  [v3 obliterateDataPreservingPaths:0 withCompletion:&stru_1000FA598];
}

- (void)backToVirgin:(int)a3
{
  uint64_t v5 = dispatch_semaphore_create(0LL);
  unsigned int v6 = -[MSDTargetDevice mode](self, "mode");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
  id v28 = 0LL;
  unsigned int v8 = [v7 shouldCleanUp:&v28];
  id v9 = v28;
  id v10 = v9;
  if (v8) {
    unsigned int v8 = [v9 code] == (id)3727741185;
  }

  id v11 = sub_10003A95C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 == 5 || v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v30[0]) = v6;
      WORD2(v30[0]) = 1024;
      *(_DWORD *)((char *)v30 + 6) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "mode = %d, canceling is %d, need an extra reboot to complete the operation.",  buf,  0xEu);
    }

    if (a3 == 9)
    {
      id v21 = self;
      uint64_t v22 = 8LL;
    }

    else
    {
      if (a3) {
        goto LABEL_23;
      }
      id v21 = self;
      uint64_t v22 = 6LL;
    }

    -[MSDTargetDevice switchModeImmediately:](v21, "switchModeImmediately:", v22);
    goto LABEL_23;
  }

  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Clearing all nvrams/demo volume/keychain items/preference-file used by demod.",  buf,  2u);
  }

  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"demo-install-state");
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"enable-remap-mode");
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-request");
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-reboot-at");
  -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-last-auto-reboot");
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"preserveDDLFlag"]);

  if (!v15
    || (unsigned __int8 v16 = [v15 BOOLValue],
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance")),
        [v17 removeObjectForKey:@"preserveDDLFlag"],
        v17,
        (v16 & 1) == 0))
  {
    id v18 = sub_10003A95C();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30[0] = "-[MSDTargetDevice backToVirgin:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s - Deleting DDL flag in nvram.", buf, 0xCu);
    }

    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"ownership-warning");
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](&OBJC_CLASS___MSDAccountManager, "sharedInstance"));
  [v20 removeAccounts:0];

  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", @"Delete");
  -[MSDTargetDevice unregisterCAHeartbeatActivity](self, "unregisterCAHeartbeatActivity");
  if (a3 == 9)
  {
    -[MSDTargetDevice obliterateDeviceWithAdminCredential:](self, "obliterateDeviceWithAdminCredential:", 0LL);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    -[MSDTargetDevice deactivateDevice](self, "deactivateDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
    [v23 deleteSecretKey];

    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAppPrivacyPermissionsHelper sharedInstance]( &OBJC_CLASS___MSDAppPrivacyPermissionsHelper,  "sharedInstance"));
    [v24 revokePrivacyPermissionsForAllApps];

    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v26 removeItemAtPath:v25 error:0];

    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
    [v27 deleteItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

    -[MSDTargetDevice enableSnapshotMode:](self, "enableSnapshotMode:", 0LL);
  }

LABEL_23:
}

- (BOOL)removePerHubInfoFromPreferencesForMigration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v3 = [v2 removeObjectsForKeys:&off_100106168];

  return v3;
}

- (BOOL)cleanUpPreferencesFile
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v2 = [&off_100106180 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v19;
    *(void *)&__int128 v3 = 138543362LL;
    __int128 v17 = v3;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(&off_100106180);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance", v17));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

        if (v9)
        {
          id v10 = sub_10003A95C();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removing legacy key %{public}@ from preference file",  buf,  0xCu);
          }

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
          unsigned __int8 v13 = [v12 removeObjectForKey:v7];

          if ((v13 & 1) == 0)
          {
            id v15 = sub_10003A95C();
            unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_10009BB24();
            }

            return 0;
          }
        }
      }

      id v4 = [&off_100106180 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  return 1;
}

- (BOOL)migrateDemoDeviceToDemoVolume
{
  id v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = -[MSDTargetDevice migratePreferenceAndWifiSettingsToDemoVolume]( v2,  "migratePreferenceAndWifiSettingsToDemoVolume");
  if (v3) {
    -[MSDTargetDevice migrateNvramToDemoVolume](v2, "migrateNvramToDemoVolume");
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)migratePreferenceAndWifiSettingsToDemoVolume
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", @"Setup");
  if (+[MSDPreferencesFile preferencesFileExists](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileExists"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
    unsigned int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      id v6 = sub_10003A95C();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migration already done.", buf, 2u);
      }

      id v8 = 0LL;
      id v9 = 0LL;
      BOOL v10 = 1;
      goto LABEL_19;
    }
  }

  if (+[MSDPreferencesFile preferencesFileExists](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileExists")
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile")),
        unsigned int v12 = [v3 fileExistsAtPath:v11],
        v11,
        !v12))
  {
    id v20 = sub_10003A95C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Migration encountered unexpected error.",  v24,  2u);
    }

    id v8 = 0LL;
    id v9 = 0LL;
    goto LABEL_18;
  }

  id v13 = sub_10003A95C();
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v26 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Need to migrate old preferences file and other data.",  v26,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/private/var/mnt/com.apple.mobilestoredemo.storage/Preferences/com.apple.MobileStoreDemo.WiFiSetting.plist"));
  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", @"Delete");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile preferencesFilePath](&OBJC_CLASS___MSDPreferencesFile, "preferencesFilePath"));
  id v25 = 0LL;
  unsigned __int8 v17 = [v3 moveItemAtPath:v15 toPath:v16 error:&v25];
  id v8 = v25;

  if ((v17 & 1) == 0)
  {
    id v22 = sub_10003AA3C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009BBB4();
    }
    goto LABEL_18;
  }

  if (v9) {
    -[MSDTargetDevice setWifiSettings:](self, "setWifiSettings:", v9);
  }
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  unsigned __int8 v19 = [v3 createFileAtPath:v18 contents:0 attributes:0];

  if ((v19 & 1) == 0)
  {
    id v23 = sub_10003AA3C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009BB88();
    }
LABEL_18:
    BOOL v10 = 0;
LABEL_19:

    goto LABEL_20;
  }

  BOOL v10 = 1;
LABEL_20:

  return v10;
}

- (void)migrateNvramToDemoVolume
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", @"demo-install-state"));
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( NSString, "stringWithCString:encoding:", [v4 bytes], 4));
      -[MSDTargetDevice setMode:](self, "setMode:", [v6 intValue]);
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"demo-install-state");
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", @"msd-reboot-at"));

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-reboot-at");
    }
  }

  -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", @"msd-reboot-at");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", @"enable-remap-mode"));

  if (v10) {
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"enable-remap-mode");
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", @"msd-last-auto-reboot"));

  if (v11)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-last-auto-reboot");
    }
  }

  -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", @"msd-last-auto-reboot");
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice readNVRam:](self, "readNVRam:", @"msd-request"));

  if (v17)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v14);
    if ((objc_opt_isKindOfClass(v17, v15) & 1) != 0)
    {
      unsigned __int8 v16 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v17, 4LL);
      -[MSDTargetDevice setRequest:](self, "setRequest:", v16);

      -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-request");
    }
  }
}

- (BOOL)setupDemoDeviceMetadataFolder
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  -[MSDTargetDevice manageDemoVolume:](v2, "manageDemoVolume:", @"Setup");
  if (!-[MSDTargetDevice createMobileStoreDemoCache](v2, "createMobileStoreDemoCache"))
  {
    id v8 = sub_10003AA3C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009BC64();
    }
    goto LABEL_9;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
  unsigned __int8 v5 = [v3 createFileAtPath:v4 contents:0 attributes:0];

  if ((v5 & 1) == 0)
  {
    id v10 = sub_10003AA3C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
      sub_10009BC18(v11, (uint64_t)&v12, v9);
    }

- (BOOL)setupFactoryDemoDeviceMetadataFolder
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up metadata folder for factory demo device...",  v8,  2u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
  unsigned __int8 v6 = [v5 prepareWorkDirectory:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" writableByNonRoot:1];

  objc_sync_exit(v2);
  return v6;
}

- (id)pathForDummyPreferenceFile
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/mobile/Library/Preferences" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathExtension:@"plist"]);

  return v3;
}

- (BOOL)setupDummyPreferenceFile
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up dummy preference (keep alive) file for factory demo device...",  v12,  2u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
  unsigned __int8 v7 = [v5 createFileAtPath:v6 contents:0 attributes:0];

  if ((v7 & 1) == 0)
  {
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](v2, "pathForDummyPreferenceFile"));
      sub_10009BC18(v11, (uint64_t)v12, v10);
    }
  }

  objc_sync_exit(v2);
  return v7;
}

- (void)cleanupDummyPreferenceFile
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing dummy preference (keep alive) file for factory demo device...",  v7,  2u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  [v5 removeItemAtPath:v6 error:0];
}

- (BOOL)moveFilesToFinalDst:(id)a3 finalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  unsigned __int8 v9 = [v8 moveStagingToFinal:v6 finalPath:v7];

  if ((v9 & 1) == 0)
  {
    id v11 = sub_10003A95C();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009BC90();
    }
  }

  return v9;
}

- (void)patchBackupFolderInStaging:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);

  if ([v5 fileExistsAtPath:v7])
  {
    id v8 = sub_10003A95C();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preference file already in backup path, removing it.",  buf,  2u);
    }

    id v24 = 0LL;
    unsigned __int8 v10 = [v5 removeItemAtPath:v7 error:&v24];
    id v11 = v24;
    id v12 = v11;
    if ((v10 & 1) == 0)
    {
      id v20 = sub_10003A95C();
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10009BD80();
      }
      uint64_t v14 = 0LL;
      goto LABEL_19;
    }

    uint64_t v13 = v11;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByDeletingLastPathComponent]);
  if (([v5 fileExistsAtPath:v14] & 1) == 0)
  {
    id v23 = v13;
    unsigned __int8 v15 = [v5 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v12 = v23;

    if ((v15 & 1) == 0)
    {
      id v21 = sub_10003A95C();
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10009BD00(v12, v18);
      }
      goto LABEL_19;
    }

    uint64_t v13 = v12;
  }

  id v22 = v13;
  unsigned __int8 v16 = [v5 copyItemAtPath:v6 toPath:v7 error:&v22];
  id v12 = v22;

  if ((v16 & 1) == 0)
  {
    id v17 = sub_10003A95C();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
      *(_DWORD *)buf = 138543874;
      BOOL v26 = v6;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      char v30 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Cannot copy preference file to backup path (from %{public}@ to %{public}@ - %{public}@)",  buf,  0x20u);
    }

- (void)rebootForStage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = dispatch_semaphore_create(0LL);
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Reporting progress - reboot",  (uint8_t *)&v20,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  [v8 updateStage:v3];

  if (-[MSDTargetDevice mode](self, "mode") >= 2
    && -[MSDTargetDevice mode](self, "mode") <= 4)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice lastRebootTime](self, "lastRebootTime"));
    if (v9)
    {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v10 timeIntervalSinceDate:v9];
      if (v11 >= 120.0) {
        double v12 = 0.0;
      }
      else {
        double v12 = 120.0 - v11;
      }
    }

    else
    {
      double v12 = 120.0;
    }

    id v13 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      id v21 = "-[MSDTargetDevice rebootForStage:]";
      __int16 v22 = 1024;
      int v23 = (int)v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s - sleepTime = %d", (uint8_t *)&v20, 0x12u);
    }

    if (v12 != 0.0) {
      sleep(v12);
    }
  }

  id v15 = sub_10003A95C();
  unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rebooting...", (uint8_t *)&v20, 2u);
  }

  id v17 = sub_10003A95C();
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " ", (uint8_t *)&v20, 2u);
  }

  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v19 reboot];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)rebootWithSnapshotRevertForStage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  [v5 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
  [v6 rollOverCoreAnalyticsLogs];

  -[MSDTargetDevice manageDeviceSnapshot:](self, "manageDeviceSnapshot:", @"RevertSnapshot");
  -[MSDTargetDevice saveSnapshotRevertFlagged:](self, "saveSnapshotRevertFlagged:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MSDTargetDevice saveLastSnapshotRevertTime:](self, "saveLastSnapshotRevertTime:", v7);

  if ((_DWORD)v3 == 33) {
    -[MSDTargetDevice shutdown](self, "shutdown");
  }
  else {
    -[MSDTargetDevice rebootForStage:](self, "rebootForStage:", v3);
  }
}

- (void)reboot
{
}

- (void)shutdown
{
  id v2 = dispatch_semaphore_create(0LL);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device shutting down...", v7, 2u);
  }

  id v5 = [[FBSShutdownOptions alloc] initWithReason:@"demod shutdown device"];
  [v5 setRebootType:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
  [v6 shutdownWithOptions:v5];

  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)manualUpdateMode:(BOOL *)a3 allowChange:(BOOL *)a4
{
  if (a3 && a4)
  {
    unsigned int v7 = -[MSDTargetDevice mode](self, "mode");
    if (v7 >= 2)
    {
      *a3 = 0;
      *a4 = v7 == 5;
    }

    else
    {
      *a3 = 1;
      *a4 = -[MSDTargetDevice allowEnteringDemoMode](self, "allowEnteringDemoMode");
    }
  }

  else
  {
    id v8 = sub_10003A95C();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10009BDAC();
    }
  }

- (id)deviceInformation:(id)a3
{
  return -[MSDTargetDevice deviceInformation:appendPingInfo:](self, "deviceInformation:appendPingInfo:", a3, 0LL);
}

- (id)deviceInformationForPing:(id)a3
{
  return -[MSDTargetDevice deviceInformation:appendPingInfo:](self, "deviceInformation:appendPingInfo:", a3, 1LL);
}

- (id)deviceInformation:(id)a3 appendPingInfo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100065C60;
  unsigned __int8 v16 = &unk_1000FA5C0;
  id v17 = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  id v18 = v7;
  [v6 enumerateObjectsUsingBlock:&v13];

  if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAccountManager sharedInstance]( &OBJC_CLASS___MSDAccountManager,  "sharedInstance",  v13,  v14,  v15,  v16,  v17));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 existingAccounts]);
    id v10 = [v9 mutableCopy];

    if (v10) {
      [v7 setObject:v10 forKey:@"MSDExistingAccounts"];
    }
  }

  if (objc_msgSend(v7, "count", v13, v14, v15, v16, v17)) {
    id v11 = v7;
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (id)getCachingHubFailureEventForPing
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  if ((byte_100125510 & 1) != 0)
  {
    BOOL v4 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice localHubFailureReason](self, "localHubFailureReason"));

    if (v5) {
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice localHubFailureReason](self, "localHubFailureReason"));
    }
    else {
      id v6 = @"Default:Local Hub Not Reachable";
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"CACHING_HUB_FAILURE",  @"error",  v6,  @"reason",  0LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice udid](self, "udid"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  @"UniqueDeviceID",  v7,  @"MSDCachingHubEvent",  0LL));

    byte_100125510 = 1;
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
    }

    id v3 = v9;
    BOOL v4 = v3;
  }

  return v4;
}

- (id)getS3ServerFailureEventForPing
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice s3ServerFailureReason](self, "s3ServerFailureReason"));

  if (v4) {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice s3ServerFailureReason](self, "s3ServerFailureReason"));
  }
  else {
    id v5 = @"Default:S3 Server Not Reachable";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"S3_SERVER_FAILURE",  @"error",  v5,  @"reason",  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice udid](self, "udid"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  @"UniqueDeviceID",  v6,  @"MSDS3ServerEvent",  0LL));

  id v9 = sub_10003A95C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reporting event:%{public}@", buf, 0xCu);
  }

  return v8;
}

- (NSString)manifestPath
{
  return (NSString *)@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
}

- (NSString)manifestAndFileDownloadInfoPath
{
  return (NSString *)@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/ManifestAndFileDownloadInfo.plist";
}

- (BOOL)criticalUpdatePrioritized
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"criticalContentUpdateOnly"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCriticalUpdatePrioritized:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting criticalupdate:%d", (uint8_t *)v8, 8u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKey:@"criticalContentUpdateOnly"];
}

- (BOOL)saveOperationRequest:(id)a3 requestFlag:(int)a4 completeBy:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (([v8 isEqualToString:@"UpdateContent"] & 1) == 0
    && ([v8 isEqualToString:@"RevertSnapshot"] & 1) == 0)
  {
    uint64_t v6 = -[MSDTargetDevice getSavedFlag](self, "getSavedFlag");
  }

  if (([v8 isEqualToString:@"UpdateContent"] & 1) == 0
    && ([v8 isEqualToString:@"UpdateOS"] & 1) == 0)
  {
    uint64_t v5 = -[MSDTargetDevice getSavedCompleteByInterval](self, "getSavedCompleteByInterval");
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@:%d:%d",  v8,  &stru_1000FB848,  &stru_1000FB848,  v6,  v5));
  -[MSDTargetDevice setRequest:](self, "setRequest:", v9);

  return 1;
}

- (BOOL)saveOperationError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getSavedRequest](self, "getSavedRequest"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedFailureReason]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v8 = [v4 code];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    id v10 = (void *)v9;
    if (v6)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedFailureReason]);
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"demoUpdateFailed: %@:0x%lx: %@ - %@",  v7,  v8,  v10,  v11));
    }

    else
    {
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"demoUpdateFailed: %@:0x%lx: %@",  v7,  v8,  v9));
    }

    id v13 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Saving error message: %{public}@", buf, 0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"0x%08lX",  [v4 code]));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@:%@",  v15,  v16,  v17));
    -[MSDTargetDevice setResponse:](self, "setResponse:", v18);
  }

  else
  {
    id v20 = sub_10003A95C();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009BE30();
    }
  }

  return v5 != 0LL;
}

- (BOOL)deleteOperationRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));

  if (!v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance")),
        [v4 removeObjectForKey:@"criticalContentUpdateOnly"],
        v4,
        BOOL v5 = -[MSDTargetDevice removeKeyFromPreferenceFile:](self, "removeKeyFromPreferenceFile:", @"msd-request")))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));

    if (v6) {
      LOBYTE(v5) = -[MSDTargetDevice removeKeyFromPreferenceFile:]( self,  "removeKeyFromPreferenceFile:",  @"msd-response");
    }
    else {
      LOBYTE(v5) = 1;
    }
  }

  return v5;
}

- (BOOL)deleteOperationRequestAndQuitHelper
{
  BOOL v3 = -[MSDTargetDevice deleteOperationRequest](self, "deleteOperationRequest");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    unsigned __int8 v5 = [v4 quitHelper];

    LOBYTE(v3) = v5;
  }

  return v3;
}

- (id)decodeComponentIdx:(int)a3 forSavedString:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@":"]);
    id v8 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = a3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
      v16[0] = 67109378;
      v16[1] = a3;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "components[%d] = %{public}@",  (uint8_t *)v16,  0x12u);
    }

    if ((unint64_t)[v7 count] > a3
      && (id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]),
          id v14 = [v13 length],
          v13,
          v14))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v10]);
    }

    else
    {
      double v12 = 0LL;
    }
  }

  else
  {
    double v12 = 0LL;
  }

  return v12;
}

- (id)getSavedRequest
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  0LL,  v3));

  return v4;
}

- (int)getSavedFlag
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  3LL,  v3));

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 1;
  }

  return v5;
}

- (int)getSavedCompleteByInterval
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  4LL,  v3));

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (id)getSavedError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  0LL,  v3));

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  1LL,  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice response](self, "response"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDTargetDevice decodeComponentIdx:forSavedString:]( self,  "decodeComponentIdx:forSavedString:",  2LL,  v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v4));
  uint64_t v10 = v9;
  if (v4)
  {
    if ([v9 scanHexInt:&v16])
    {
      uint64_t v11 = v16;
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      id v20 = v8;
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  v11,  v12));
    }

    else
    {
      id v14 = sub_10003A95C();
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unable to decode saved error code: %{public}@; ignoring",
          buf,
          0xCu);
      }

      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (NSDate)lastRebootTime
{
  size_t v6 = 16LL;
  *(void *)id v8 = 0x1500000001LL;
  if (sysctl(v8, 2u, &v7, &v6, 0LL, 0LL) != -1 && v7 != 0) {
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v7));
  }
  id v4 = sub_10003A95C();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10009BE5C();
  }

  return (NSDate *)0LL;
}

- (NSNumber)nandSize
{
  *(void *)mainPort = 0LL;
  if (IOMasterPort(0, &mainPort[1]))
  {
    id v6 = sub_10003A95C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009BF64();
    }
  }

  else
  {
    id v2 = IOBSDNameMatching(mainPort[1], 0, "disk0");
    if (v2)
    {
      if (IOServiceGetMatchingServices(mainPort[1], v2, mainPort))
      {
        id v9 = sub_10003A95C();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10009BF38();
        }
      }

      else if (mainPort[0])
      {
        io_registry_entry_t v3 = IOIteratorNext(mainPort[0]);
        if (v3)
        {
          CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"Size", kCFAllocatorDefault, 0);
          if (CFProperty) {
            goto LABEL_7;
          }
          id v12 = sub_10003A95C();
          uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_10009BF0C();
          }
        }

        else
        {
          id v11 = sub_10003A95C();
          uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_10009BEE0();
          }
        }
      }

      else
      {
        id v10 = sub_10003A95C();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10009BEB4();
        }
      }
    }

    else
    {
      id v8 = sub_10003A95C();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10009BE88();
      }
    }
  }

  CFProperty = 0LL;
LABEL_7:
  if (mainPort[0]) {
    IOObjectRelease(mainPort[0]);
  }
  return (NSNumber *)CFProperty;
}

- (NSString)OSVersion
{
  return (NSString *)(id)MGCopyAnswer(@"ProductVersion", 0LL);
}

- (NSString)OSBuild
{
  return (NSString *)(id)MGCopyAnswer(@"BuildVersion", 0LL);
}

- (NSString)demodVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  io_registry_entry_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForInfoDictionaryKey:@"CFBundleVersion"]);

  return (NSString *)v3;
}

- (NSString)packageVersion
{
  return 0LL;
}

- (NSString)productType
{
  return (NSString *)(id)MGCopyAnswer(@"ProductType", 0LL);
}

- (int64_t)batteryCapacity
{
  id v2 = (void *)MGCopyAnswer(@"BatteryCurrentCapacity", 0LL);
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)demoSetup
{
  if (-[MSDTargetDevice mode](self, "mode")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice request](self, "request"));

  return v4 != 0LL;
}

- (int)activationConfigurationFlags
{
  id v10 = 0LL;
  uint64_t v2 = MAECopyActivationRecordWithError(&v10, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v10;
  if (v4)
  {
    id v8 = sub_10003A95C();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009BFBC(v4, v5);
    }
    goto LABEL_9;
  }

  if (!v3)
  {
    id v9 = sub_10003A95C();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009BF90();
    }
LABEL_9:
    int v6 = 0;
    goto LABEL_4;
  }

  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DeviceConfigurationFlags"]);
  int v6 = -[os_log_s intValue](v5, "intValue");
LABEL_4:

  return v6;
}

- (BOOL)isVerifiedDemoDevice
{
  if (os_variant_has_internal_content("com.apple.mobilestoredemod")
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance")),
        unsigned int v4 = [v3 fakeActivationDemoBit],
        v3,
        v4))
  {
    id v5 = sub_10003A95C();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device is running internal build and wants to fake demo bit; Pass as demo device!",
        v9,
        2u);
    }

    LOBYTE(v7) = 1;
  }

  else
  {
    return (-[MSDTargetDevice activationConfigurationFlags](self, "activationConfigurationFlags") >> 1) & 1;
  }

  return v7;
}

- (BOOL)isVerifiedPOSDevice
{
  return (-[MSDTargetDevice activationConfigurationFlags](self, "activationConfigurationFlags") >> 2) & 1;
}

- (BOOL)isPressDemoDevice
{
  if (!+[MSDOSFeatureFlags isPressDemoModeEnabled](&OBJC_CLASS___MSDOSFeatureFlags, "isPressDemoModeEnabled"))
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubSuppliedSettings](self, "hubSuppliedSettings"));
    id v5 = v4;
    if (v4)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DemoMode"]);
      if (v7)
      {
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString, v6);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          unsigned __int8 v3 = [v7 isEqualToString:@"press"];
LABEL_15:

          return v3;
        }
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
    BOOL v7 = v9;
    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"demo_mode"]);
      if (v11 && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v10), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)) {
        unsigned __int8 v3 = [v11 isEqualToString:@"press"];
      }
      else {
        unsigned __int8 v3 = 0;
      }
    }

    else
    {
      unsigned __int8 v3 = 0;
    }

    goto LABEL_15;
  }

  return 1;
}

- (BOOL)isContentFrozen
{
  if (-[MSDTargetDevice mode](self, "mode") == 5) {
    return -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
  }
  else {
    return 0;
  }
}

- (BOOL)isBetterTogetherDemo
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  unsigned __int8 v3 = v2;
  if (v2)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"enable_better_together"]);
    id v5 = v4;
    if (v4) {
      unsigned __int8 v6 = [v4 BOOLValue];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)deactivateDevice
{
  id v7 = 0LL;
  char v2 = MAEDeactivateDeviceWithError(&v7, a2);
  id v3 = v7;
  if ((v2 & 1) == 0)
  {
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Deactivation failed with error - %{public}@",  buf,  0xCu);
    }
  }

  return v2;
}

- (NSData)certificateHash
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"CertificateHash"]);

  return (NSData *)v3;
}

- (BOOL)isDemoEligible
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"DemoEligible"]);

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)isOfflineMode
{
  return 0;
}

- (BOOL)dcotaOfflineModeDevice
{
  return 0;
}

- (BOOL)cachedBundleInstallAttempted
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"CachedBundleInstallState"]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (NSString)cachedBundleInstallState
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"CachedBundleInstallState"]);

  return (NSString *)v3;
}

- (void)setCachedBundleInstallState:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"CachedBundleInstallState"];
}

- (NSString)installedFactoryBundleID
{
  return 0LL;
}

- (void)setInstalledFactoryBundleID:(id)a3
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    unsigned __int8 v6 = @"InstalledFactoryBundleID";
    __int16 v7 = 2114;
    uint64_t v8 = @"com.apple.demo-settings";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ key not supported in %{public}@ outside of iOS",  (uint8_t *)&v5,  0x16u);
  }
}

- (id)hubCertificateIdentifier
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubCertificateIdentifier"]);

  return v3;
}

- (BOOL)saveHubCertificateIdentifer:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"HubCertificateIdentifier"];

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  LOBYTE(v3) = [v5 removeObjectsForKeys:&off_100106198];

  return (char)v3;
}

- (NSString)hubHostName
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubHostName"]);

  return (NSString *)v3;
}

- (void)setHubHostName:(id)a3
{
  id v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileExists"))
  {
    id v4 = sub_10003A95C();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Saving hub host name: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v6 setObject:v3 forKey:@"HubHostName"];
  }
}

- (id)hubHostNameList
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"HubHostNameList"]);

  if (!v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
    if (v5) {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v5));
    }
    else {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }
    id v4 = (void *)v6;
    -[MSDTargetDevice saveHubHostNameList:](self, "saveHubHostNameList:", v6);
  }

  return v4;
}

- (BOOL)saveHubHostNameList:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"HubHostNameList"];

  return v5;
}

- (NSString)hubPort
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubPort"]);

  return (NSString *)v3;
}

- (void)setHubPort:(id)a3
{
  id v3 = a3;
  if (+[MSDPreferencesFile preferencesFileExists](&OBJC_CLASS___MSDPreferencesFile, "preferencesFileExists"))
  {
    id v4 = sub_10003A95C();
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Saving hub port: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v6 setObject:v3 forKey:@"HubPort"];
  }
}

- (int64_t)findMyHubRetryAtTime
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"FMHRetryAtTime"]);

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (void)saveFindMyHubRetryAtTime:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  if (a3 <= 0)
  {
    [v5 removeObjectForKey:@"FMHRetryAtTime"];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v5 setObject:v4 forKey:@"FMHRetryAtTime"];
  }
}

- (int64_t)hubLastOnlineTime
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubLastOnlineTime"]);

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0LL;
  }

  return (int64_t)v4;
}

- (void)saveHubLastOnlineTime:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  if (a3 <= 0)
  {
    [v5 removeObjectForKey:@"HubLastOnlineTime"];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a3));
    [v5 setObject:v4 forKey:@"HubLastOnlineTime"];
  }
}

- (id)lastSnapshotRevertTime
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LastSnapshotRevertTime"]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  id v5 = v4;

  return v5;
}

- (void)saveLastSnapshotRevertTime:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastSnapshotRevertTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastSnapshotRevertTime"];
  }
}

- (BOOL)snapshotRevertFlagged
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SnapshotRevertFlagged"]);

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)saveSnapshotRevertFlagged:(BOOL)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v5 = v4;
  if (a3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"SnapshotRevertFlagged"];
  }
  else {
    [v4 removeObjectForKey:@"SnapshotRevertFlagged"];
  }
}

- (id)lastShallowRefreshTime
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v2 reload];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"LastShallowRefreshTime"]);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)saveLastShallowRefreshTime:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastShallowRefreshTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastShallowRefreshTime"];
  }
}

- (id)lastSettingsUpdatedTime
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LastSettingsUpdatedTime"]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  id v5 = v4;

  return v5;
}

- (void)saveLastSettingsUpdatedTime:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"LastSettingsUpdatedTime"];
  }
  else {
    [v3 removeObjectForKey:@"LastSettingsUpdatedTime"];
  }
}

- (id)hubSuppliedSettings
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubSuppliedSettings"]);

  if (!v3 || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4), (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
  {
LABEL_9:
    id v7 = 0LL;
    goto LABEL_5;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SettingsID"]);

  if (!v6)
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009C03C(v10, v11, v12);
    }

    goto LABEL_9;
  }

  id v7 = v3;
LABEL_5:

  return v7;
}

- (BOOL)saveHubSuppliedSettings:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    goto LABEL_10;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"SettingsID"]);

  if (!v7)
  {
    id v14 = sub_10003A95C();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10009C0B0(v15, v16, v17);
    }

    goto LABEL_10;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned int v9 = [v8 setObject:v5 forKey:@"HubSuppliedSettings"];

  if (!v9)
  {
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_6;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[MSDTargetDevice saveLastSettingsUpdatedTime:](self, "saveLastSettingsUpdatedTime:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  BOOL v12 = 1;
  [v11 postNotificationName:@"com.apple.MobileStoreDemo.SettingsUpdated" object:0 userInfo:0 deliverImmediately:1];

LABEL_6:
  return v12;
}

- (id)iCloudAccountRecoveryKey
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"iCloudAccountRecoveryKey"]);

  return v3;
}

- (void)saveiCloudAccountRecoveryKey:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"iCloudAccountRecoveryKey"];
  }
  else {
    [v3 removeObjectForKey:@"iCloudAccountRecoveryKey"];
  }
}

- (BOOL)iCloudAccountSyncNeeded
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"iCloudAccountSyncNeeded"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)saveiCloudAccountSyncNeeded:(BOOL)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v5 = v4;
  if (a3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"iCloudAccountSyncNeeded"];
  }
  else {
    [v4 removeObjectForKey:@"iCloudAccountSyncNeeded"];
  }
}

- (id)demoUserHomePath
{
  return NSHomeDirectoryForUser(@"mobile");
}

- (void)saveRequiredDeletableSystemApps
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100068D24;
  v5[3] = &unk_1000FA5E8;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  id v3 = v6;
  [v2 enumerateBundlesOfType:7 block:v5];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"RequiredDeletableSystemApps"];
}

- (id)requiredDeletableSystemApps
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"RequiredDeletableSystemApps"]);

  return v3;
}

- (id)installedDeletableSystemApps
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice requiredDeletableSystemApps](self, "requiredDeletableSystemApps"));
  id v5 = [v4 mutableCopy];

  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  BOOL v12 = sub_100068EFC;
  id v13 = &unk_1000FA610;
  id v14 = v5;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  id v6 = v15;
  id v7 = v5;
  [v3 enumerateBundlesOfType:1 block:&v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6, v10, v11, v12, v13));

  return v8;
}

- (void)installAndWaitForSystemApps
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice requiredDeletableSystemApps](self, "requiredDeletableSystemApps"));
  id v5 = [v4 mutableCopy];

  uint64_t v29 = 0LL;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    unsigned int v8 = [v7 systemAppTimeoutInterval];

    if (v8)
    {
      id v9 = sub_10003A95C();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v34 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Override system app timeout interval: %lu",  buf,  0xCu);
      }
    }

    else
    {
      unsigned int v8 = 1800;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    unsigned int v12 = [v11 systemAppPollingInterval];

    if (v12)
    {
      id v13 = sub_10003A95C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v34 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Override system app polling interval: %lu",  buf,  0xCu);
      }

      goto LABEL_13;
    }
  }

  else
  {
    unsigned int v8 = 1800;
  }

  unsigned int v12 = 30;
LABEL_13:
  unint64_t v15 = v8;
  *(void *)&__int128 v6 = 138543362LL;
  __int128 v25 = v6;
  while (objc_msgSend(v5, "count", v25))
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100069390;
    v26[3] = &unk_1000FA638;
    id v16 = v5;
    id v27 = v16;
    id v28 = &v29;
    [v3 enumerateBundlesOfType:1 block:v26];
    if (![v16 count])
    {
      id v19 = sub_10003A95C();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v21 = "All system apps have been installed. Move forward.";
        __int16 v22 = v20;
        uint32_t v23 = 2;
        goto LABEL_24;
      }

- (BOOL)isPasscodeModificationAllowed
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isPasscodeModificationAllowed];

  return v3;
}

- (BOOL)setPasscodeModificationAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 errorCheckedSetBoolValue:v3 forSetting:MCFeaturePasscodeModificationAllowed]);
  if (v5)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009C124(v3, v5, v7);
    }
  }

  return v5 == 0LL;
}

- (BOOL)createTemporaryPasscodeIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating temporary device passcode...", buf, 2u);
  }

  if ([v3 isPasscodeSet])
  {
    id v6 = 0LL;
    unsigned __int8 v7 = 1;
    goto LABEL_12;
  }

  unsigned __int8 v8 = -[MSDTargetDevice isPasscodeModificationAllowed](self, "isPasscodeModificationAllowed");
  if ((v8 & 1) == 0)
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Passcode modification is NOT allowed. Temporarily lifting the restriction!",  v15,  2u);
    }

    if (!-[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 1LL))
    {
      id v6 = 0LL;
      unsigned __int8 v7 = 0;
      goto LABEL_11;
    }
  }

  id v14 = 0LL;
  unsigned __int8 v7 = [v3 changePasscodeFrom:0 to:@"123456" outError:&v14];
  id v6 = v14;
  if ((v7 & 1) != 0)
  {
    if ((v8 & 1) != 0) {
      goto LABEL_12;
    }
LABEL_11:
    -[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 0LL);
    goto LABEL_12;
  }

  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10009C1D4(v6, v13);
  }

  if ((v8 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (BOOL)removeTemporaryPasscodeIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing temporary device passcode...", buf, 2u);
  }

  if (![v3 isPasscodeSet])
  {
    id v10 = 0LL;
    BOOL v11 = 1;
    goto LABEL_15;
  }

  unsigned __int8 v6 = -[MSDTargetDevice isPasscodeModificationAllowed](self, "isPasscodeModificationAllowed");
  if ((v6 & 1) == 0)
  {
    id v7 = sub_10003A95C();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Passcode modification is NOT allowed. Temporarily lifting the restriction!",  v16,  2u);
    }

    if (!-[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 1LL))
    {
      id v10 = 0LL;
      BOOL v11 = 0;
      goto LABEL_10;
    }
  }

  id v15 = 0LL;
  unsigned __int8 v9 = [v3 changePasscodeFrom:@"123456" to:0 outError:&v15];
  id v10 = v15;
  if ((v9 & 1) != 0)
  {
    BOOL v11 = 1;
    if ((v6 & 1) == 0) {
LABEL_10:
    }
      -[MSDTargetDevice setPasscodeModificationAllowed:](self, "setPasscodeModificationAllowed:", 0LL);
  }

  else
  {
    id v12 = sub_10003A95C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009C254(v10, v13);
    }

    BOOL v11 = 0;
  }

- (id)readNVRam:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    id v8 = sub_10003A95C();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C300();
    }
    goto LABEL_9;
  }

  io_registry_entry_t v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    id v10 = sub_10003A95C();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C2D4();
    }
LABEL_9:

    CFProperty = 0LL;
    goto LABEL_4;
  }

  io_object_t v5 = v4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, v3, kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
LABEL_4:

  return CFProperty;
}

- (BOOL)deleteNVRam:(id)a3
{
  id v4 = a3;
  io_object_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  unsigned __int8 v6 = [v5 deleteNvram:v4];

  return v6;
}

- (BOOL)setSEPDemoMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_10003A95C();
  io_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting SEP demo mode to: %{BOOL}d",  (uint8_t *)v10,  8u);
  }

  int v6 = AMFIDemoModeSetState(v3);
  if (v6)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009C32C(v6, v8);
    }
  }

  return v6 == 0;
}

- (BOOL)toggleSEPDemoModeOnManagedPreferencesChange
{
  return -[MSDTargetDevice setSEPDemoMode:]( self,  "setSEPDemoMode:",  -[MSDTargetDevice managedStoreDemoMode](self, "managedStoreDemoMode"));
}

- (BOOL)turnOnDemoMode
{
  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice")) {
    return -[MSDTargetDevice turnOnPressDemoMode](self, "turnOnPressDemoMode");
  }
  else {
    return -[MSDTargetDevice turnOnStoreDemoMode](self, "turnOnStoreDemoMode");
  }
}

- (BOOL)turnOnStoreDemoMode
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Turning on Store Demo Mode.", v7, 2u);
  }

  if (!-[MSDTargetDevice storeDemoMode](self, "storeDemoMode"))
  {
    io_object_t v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
    -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"StoreDemoMode");
    -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"LockIcons");
    -[NSUserDefaults synchronize](v5, "synchronize");
  }

  return 1;
}

- (BOOL)turnOnPressDemoMode
{
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Turning on Press Demo Mode.", v7, 2u);
  }

  if (!-[MSDTargetDevice pressDemoMode](self, "pressDemoMode"))
  {
    io_object_t v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
    -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", &__kCFBooleanTrue, @"PressDemoMode");
    -[NSUserDefaults synchronize](v5, "synchronize");
  }

  return 1;
}

- (BOOL)isDemoModeOn
{
  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice")) {
    return -[MSDTargetDevice pressDemoMode](self, "pressDemoMode");
  }
  else {
    return -[MSDTargetDevice storeDemoMode](self, "storeDemoMode");
  }
}

- (BOOL)allowEnteringDemoMode
{
  return -[MSDTargetDevice isDemoModeOn](self, "isDemoModeOn") || -[MSDTargetDevice mode](self, "mode") == 1;
}

- (BOOL)managedStoreDemoMode
{
  int IsForced = CFPreferencesAppValueIsForced(@"StoreDemoMode", @"com.apple.demo-settings");
  if (IsForced) {
    LOBYTE(IsForced) = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", 0LL) != 0;
  }
  return IsForced;
}

- (BOOL)storeDemoMode
{
  return -[MSDTargetDevice demoModeValueForKey:](self, "demoModeValueForKey:", @"StoreDemoMode");
}

- (BOOL)pressDemoMode
{
  return -[MSDTargetDevice demoModeValueForKey:](self, "demoModeValueForKey:", @"PressDemoMode");
}

- (BOOL)demoModeValueForKey:(id)a3
{
  id v3 = a3;
  id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v4, "objectForKey:", v3));
  if (!v6)
  {
LABEL_7:
    unsigned __int8 v8 = 0;
    goto LABEL_8;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009C39C();
    }

    goto LABEL_7;
  }

  unsigned __int8 v8 = [v6 BOOLValue];
LABEL_8:

  return v8;
}

- (void)setStoreDemoMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[NSUserDefaults setObject:forKey:](v5, "setObject:forKey:", v4, @"StoreDemoMode");

  -[NSUserDefaults synchronize](v5, "synchronize");
}

- (void)syncStoreDemoMode:(int)a3
{
  if (a3 == 1)
  {
    if (!-[MSDTargetDevice storeDemoMode](self, "storeDemoMode")) {
      return;
    }
    -[MSDTargetDevice setStoreDemoMode:](self, "setStoreDemoMode:", 0LL);
    id v7 = sub_10003A95C();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v8 = 136315138;
    id v9 = "-[MSDTargetDevice syncStoreDemoMode:]";
    int v6 = "%s - Turn StoreDemoMode OFF.";
    goto LABEL_9;
  }

  if (a3 == 5 && !-[MSDTargetDevice storeDemoMode](self, "storeDemoMode"))
  {
    -[MSDTargetDevice setStoreDemoMode:](self, "setStoreDemoMode:", 1LL);
    id v4 = sub_10003A95C();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      return;
    }

    int v8 = 136315138;
    id v9 = "-[MSDTargetDevice syncStoreDemoMode:]";
    int v6 = "%s - Turn StoreDemoMode ON.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    goto LABEL_10;
  }

- (void)enableSnapshotMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
  {
    uint64_t v5 = self;
    uint64_t v6 = 27LL;
    goto LABEL_5;
  }

  if (v3)
  {
    -[MSDTargetDevice removeTemporaryPasscodeIfNeeded](self, "removeTemporaryPasscodeIfNeeded");
    -[MSDTargetDevice manageDeviceSnapshot:](self, "manageDeviceSnapshot:", @"CreateSnapshot");
    uint64_t v5 = self;
    uint64_t v6 = 8LL;
LABEL_5:
    -[MSDTargetDevice rebootForStage:](v5, "rebootForStage:", v6);
    return;
  }

  -[MSDTargetDevice rebootWithSnapshotRevertForStage:](self, "rebootWithSnapshotRevertForStage:", 0LL);
}

- (void)manageDeviceSnapshot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"UnmountSnapshot"])
  {
    -[MSDTargetDevice manageUserVolume:](self, "manageUserVolume:", v4);
    -[MSDTargetDevice manageDataVolume:](self, "manageDataVolume:", v4);
  }

  else
  {
    -[MSDTargetDevice manageDataVolume:](self, "manageDataVolume:", v4);
    -[MSDTargetDevice manageUserVolume:](self, "manageUserVolume:", v4);
  }
}

- (void)manageDataVolume:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v5 manageDataVolume:v4];
}

- (void)manageDemoVolume:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v5 manageDemoVolume:v4];
}

- (void)manageUserVolume:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v5 manageUserVolume:v4 forUser:@"mobile"];
}

- (void)disableLaunchdServicesIfNeededForWatch
{
  id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  if ((id)-[NSUserDefaults integerForKey:](v4, "integerForKey:", @"FProgramNumber") != (id)300)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    [v3 disableLaunchdServicesForWatch];
  }
}

- (void)disableSUAutoDownloadForWatch
{
  char v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.subridge");
  -[NSUserDefaults setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, @"SUDisableAutoScan");
  -[NSUserDefaults setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanTrue, @"SkipAutoDownload");
  -[NSUserDefaults synchronize](v2, "synchronize");
}

- (void)setupWorkFolderForBootTask
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v3 prepareWorkDirectory:@"/private/var/demo_backup" writableByNonRoot:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v5 = [v4 macOS];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    [v6 prepareWorkDirectory:@"/private/var/dekota" writableByNonRoot:0];
  }

- (void)destroyWorkFolderForBootTask
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
  [v3 removeWorkDirectory:@"/private/var/demo_backup"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v5 = [v4 macOS];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice helperAgent](self, "helperAgent"));
    [v6 removeWorkDirectory:@"/private/var/dekota"];
  }

- (BOOL)deleteConfigurationApp
{
  unsigned __int8 v2 = +[IXAppInstallCoordinator uninstallAppWithBundleID:error:]( &OBJC_CLASS___IXAppInstallCoordinator,  "uninstallAppWithBundleID:error:",  @"com.apple.DemoUpdate",  0LL);
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = v4;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Configuration app deleted.", v9, 2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10009C40C(v5, v7, v8);
  }

  return v2;
}

- (void)markContentInstallingInstalled
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  [v2 markBundleInProgressAsBundleCompleted];
}

- (BOOL)powerAssertionActive
{
  return self->_powerAssertion != 0;
}

- (BOOL)holdPowerAssertion
{
  p_powerAssertion = &self->_powerAssertion;
  if (self->_powerAssertion) {
    return 1;
  }
  id v4 = sub_10003A95C();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Taking power assertion to prevent device sleep.",  v8,  2u);
  }

  if (!IOPMAssertionCreateWithName( @"PreventUserIdleSystemSleep",  0xFFu,  @"com.apple.demod.noSleep",  p_powerAssertion)) {
    return 1;
  }
  id v6 = sub_10003A95C();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10009C480();
  }

  return 0;
}

- (BOOL)liftPowerAssertion
{
  if (!self->_powerAssertion) {
    return 1;
  }
  id v3 = sub_10003A95C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Lifting power assertion to enable device sleep.",  v8,  2u);
  }

  if (!IOPMAssertionRelease(self->_powerAssertion))
  {
    self->_powerAssertion = 0;
    return 1;
  }

  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10009C4AC();
  }

  return 0;
}

- (BOOL)createMobileStoreDemoCache
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCache sharedInstance](&OBJC_CLASS___MSDCache, "sharedInstance"));
  if (([v2 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob"] & 1) == 0 && (objc_msgSend(v3, "createContainer:", @"com.apple.mobilestoredemo.blob") & 1) == 0)
  {
    id v8 = sub_10003AA3C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C504();
    }
    id v4 = 0LL;
    goto LABEL_12;
  }

  if (([v2 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata"] & 1) == 0)
  {
    id v11 = 0LL;
    BOOL v5 = 1;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" withIntermediateDirectories:1 attributes:0 error:&v11];
    id v4 = v11;
    if ((v6 & 1) != 0) {
      goto LABEL_6;
    }
    id v10 = sub_10003AA3C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C4D8();
    }
LABEL_12:

    BOOL v5 = 0;
    goto LABEL_6;
  }

  id v4 = 0LL;
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (void)clearUpNvramIfNeeded
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!-[MSDTargetDevice storeDemoMode](self, "storeDemoMode")
    || (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice pathForDummyPreferenceFile](self, "pathForDummyPreferenceFile")),
        unsigned __int8 v4 = [v5 fileExistsAtPath:v3],
        v3,
        (v4 & 1) == 0))
  {
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"demo-install-state");
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"enable-remap-mode");
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-request");
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-reboot-at");
    -[MSDTargetDevice deleteNVRam:](self, "deleteNVRam:", @"msd-last-auto-reboot");
  }
}

- (void)clearUpF200FootprintIfNeeded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v3 fileExistsAtPath:@"/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData"])
  {
    id v9 = 0LL;
    unsigned __int8 v4 = [v3 removeItemAtPath:@"/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/F200EventsData" error:&v9];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      id v6 = sub_10003A95C();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10009C530(v5, v7);
      }
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"F200EventDbCleanupTime"]);

  if (v8) {
    [v2 removeObjectForKey:@"F200EventDbCleanupTime"];
  }
}

- (void)refreshStoreHoursManagerUsingSettings
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MSDStoreHoursManager sharedInstance](&OBJC_CLASS___MSDStoreHoursManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubSuppliedSettings](self, "hubSuppliedSettings"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"StoreHours"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice lastSettingsUpdatedTime](self, "lastSettingsUpdatedTime"));
  [v6 updateStoreHours:v4 lastSettingsUpdatedDate:v5];
  [v6 evaluateStoreStatusAgainstCurrentTime];
  [v6 setupStoreOpenCloseTimers];
}

- (void)setupStoreHoursManager
{
  id v3 = sub_10003A95C();
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up store hours manager!", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  _DWORD v16[2] = sub_10006AC18;
  v16[3] = &unk_1000F9508;
  v16[4] = self;
  id v7 =  [v5 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.Expired" object:0 queue:v6 usingBlock:v16];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006AC90;
  v15[3] = &unk_1000F9508;
  v15[4] = self;
  id v10 =  [v8 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.StoreOpen" object:0 queue:v9 usingBlock:v15];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006AC98;
  v14[3] = &unk_1000F9508;
  v14[4] = self;
  id v13 =  [v11 addObserverForName:@"com.apple.MobileStoreDemo.StoreHours.StoreClosed" object:0 queue:v12 usingBlock:v14];

  -[MSDTargetDevice refreshStoreHoursManagerUsingSettings](self, "refreshStoreHoursManagerUsingSettings");
}

- (void)caLogsUploadTimerHandler:(id)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000FA658);
}

- (void)setupCoreAnalyticsLogsUploadTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006AE00;
  v2[3] = &unk_1000F96A8;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)snapshotRevertTimerHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 messageQueue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006B110;
  v7[3] = &unk_1000F96A8;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setupSnapshotRevertTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10006B218;
  v2[3] = &unk_1000F96A8;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)registerCAHearbeatActivity
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10009C5BC();
  }

  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 7200LL);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, 300LL);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, 0LL);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_register("com.apple.MobileStoreDemo.heartbeat", v4, &stru_1000FA678);
}

- (void)unregisterCAHeartbeatActivity
{
}

- (id)previousiOSBuild
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"PreviousOSBuild"]);

  return v3;
}

- (BOOL)saveCurrentiOSBuild
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice OSBuild](self, "OSBuild"));
  unsigned __int8 v5 = [v3 setObject:v4 forKey:@"PreviousOSBuild"];

  return v5;
}

- (BOOL)clearCurrentiOSBuild
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v3 = [v2 removeObjectForKey:@"PreviousOSBuild"];

  return v3;
}

- (id)minOSVersionAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"MinOSVersionAvailable"]);

  return v3;
}

- (void)saveMinOSVersionAvailable:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"MinOSVersionAvailable"];
}

- (void)clearMinOSVersionAvailable
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v2 removeObjectForKey:@"MinOSVersionAvailable"];
}

- (void)saveOSUpdateRequest:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"OSUpdateRequest"];
}

- (id)getOSUpdateRequest
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  id v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v2 mockOSUpdateRequestFile]);

  if (!v3)
  {
LABEL_12:

LABEL_13:
    id v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v3, "objectForKey:", @"OSUpdateRequest"));
    goto LABEL_14;
  }

  id v4 = sub_10003A95C();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Loading mock OS update request from file: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

  id v6 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v3);
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009C614();
    }

    goto LABEL_12;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Mock OS update request successfully loaded: %{public}@",  (uint8_t *)&v11,  0xCu);
  }

LABEL_14:
  return v6;
}

- (void)clearOSUpdateRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v2 removeObjectForKey:@"OSUpdateRequest"];
}

- (BOOL)waitingForCommand
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"WaitingForCommand"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setWaitingForCommand:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MSDTargetDevice waitingForCommand](self, "waitingForCommand") != a3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    unsigned __int8 v6 = v5;
    if (v3)
    {
      [v5 setObject:&__kCFBooleanTrue forKey:@"WaitingForCommand"];

      -[MSDTargetDevice startWaitingForCommandTimer](self, "startWaitingForCommandTimer");
    }

    else
    {
      [v5 removeObjectForKey:@"WaitingForCommand"];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006BB9C;
      block[3] = &unk_1000F9768;
      block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)startWaitingForCommandTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006BC30;
  block[3] = &unk_1000F9768;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)waitForBuddy:(id)a3 updateStatus:(BOOL)a4
{
}

- (void)waitForBuddy:(id)a3
{
}

- (void)waitForBuddyWithoutStatusUpdate:(id)a3
{
}

- (void)waitForBuddyWithTimeout
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  dispatch_time_t v4 = dispatch_time(0LL, 60000000000LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  int v8[2] = sub_10006BEAC;
  v8[3] = &unk_1000F9F48;
  uint64_t v5 = v3;
  id v9 = v5;
  -[MSDTargetDevice waitForBuddy:](self, "waitForBuddy:", v8);
  if (dispatch_semaphore_wait(v5, v4))
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = 60;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Buddy setup timed out after %d seconds.",  buf,  8u);
    }
  }
}

- (void)invokeHandler:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice buddyCompletionHandlerLock](self, "buddyCompletionHandlerLock"));
  objc_sync_enter(obj);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice buddyCompletionHandler](self, "buddyCompletionHandler"));

  if (v5)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[MSDTargetDevice buddyCompletionHandler]( self,  "buddyCompletionHandler"));
    v6[2](v6, v3);
  }

  objc_sync_exit(obj);
}

- (void)terminateConfigurationApp
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  @"com.apple.DemoUpdate"));
  id v21 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v2,  &v21));
  id v4 = v21;

  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
    unsigned int v6 = [v5 taskState];

    if (!v4) {
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v6 = 1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  if ([v4 code] != (id)3)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10009C640();
    }
  }

- (BOOL)allowSnapshotMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"disable_snapshot_mode"]);

  if (v3
    && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    && [v3 BOOLValue])
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device snapshot mode is disabled as requested by DeviceOptions.",  v10,  2u);
    }

    BOOL v8 = 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)allowSnapshotRevertTimer
{
  if (+[MSDHubFeatureFlags disableNightlySnapshotRevert]( &OBJC_CLASS___MSDHubFeatureFlags,  "disableNightlySnapshotRevert"))
  {
    id v3 = sub_10003A95C();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Snapshot revert timer is disabled by feature flag!",  v11,  2u);
    }

    return 0;
  }

  if (-[MSDTargetDevice isPressDemoDevice](self, "isPressDemoDevice")
    || !-[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode"))
  {
    return 0;
  }

  uint64_t v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v5, "objectForKey:", @"DisableNightlyRefresh"));
  BOOL v9 = 1;
  if (v7)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  }

  return v9;
}

- (BOOL)allowAccountSetup
{
  id v3 = (void *)MGCopyAnswer(@"PasswordConfigured", 0LL);
  else {
    BOOL v4 = -[MSDTargetDevice isDemoModeOn](self, "isDemoModeOn");
  }

  return v4;
}

- (void)configureNetworkInterface
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
  [v3 enableWiFi:1];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getPersistentWiFiSsid]);

  if (v4)
  {
    [v3 configureWiFiWithPersistentSettings];
  }

  else if (-[MSDTargetDevice isContentFrozen](self, "isContentFrozen"))
  {
    [v3 disassociateAndForgetWiFi];
  }

  else if (-[MSDTargetDevice shouldForgetKnownNetworkUponUnlock](self, "shouldForgetKnownNetworkUponUnlock"))
  {
    id v5 = sub_10003A95C();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Forgetting known wifi network after device unlock...",  v7,  2u);
    }

    [v3 disassociateAndForgetWiFi];
    -[MSDTargetDevice setShouldForgetKnownNetworkUponUnlock:](self, "setShouldForgetKnownNetworkUponUnlock:", 0LL);
  }
}

- (void)waitForNetworkReachability
{
}

- (void)waitForNetworkReachabilityWithTimeout:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)a3));
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_10006C83C;
  id v28 = sub_10006C84C;
  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSCondition);
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_10006C83C;
  v18[4] = sub_10006C84C;
  uint32_t v19 = self;
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Waiting for network to become reachable...",  buf,  2u);
  }

  uint64_t v8 = nw_path_monitor_create();
  if (v8)
  {
    BOOL v9 = &_dispatch_main_q;
    nw_path_monitor_set_queue(v8, &_dispatch_main_q);

    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472LL;
    update_handler[2] = sub_10006C854;
    update_handler[3] = &unk_1000FA6C8;
    update_handler[4] = &v24;
    update_handler[5] = &v20;
    update_handler[6] = v18;
    nw_path_monitor_set_update_handler(v8, update_handler);
    nw_path_monitor_start(v8);
    [(id)v25[5] lock];
    while (!v21[3])
    {
      if (([(id)v25[5] waitUntilDate:v5] & 1) == 0)
      {
        id v10 = sub_10003A95C();
        int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v31 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Timeout waiting %lus for desired network interface to come up.",  buf,  0xCu);
        }

        break;
      }
    }

    [(id)v25[5] unlock];
    nw_path_monitor_cancel(v8);
  }

  else
  {
    id v15 = sub_10003A95C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009C6B0();
    }
  }

  id v12 = sub_10003A95C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = v21[3] != 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v31) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Network reachability after wait: %{BOOL}d",  buf,  8u);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (unint64_t)fetchActiveNetworkInterface
{
  uint64_t v10 = 0LL;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  id v2 = nw_parameters_create();
  nw_parameters_set_multipath_service(v2, nw_multipath_service_handover);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(0LL, v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006CA40;
  v7[3] = &unk_1000FA6F0;
  id v4 = (id)nw_path_evaluator_copy_path();
  id v8 = v4;
  BOOL v9 = &v10;
  nw_path_enumerate_interfaces((nw_path_t)v4, v7);
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)migrateCellularSupportFlag
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"enable_cellular_support"]);
  if ([v4 BOOLValue])
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      int v11 = @"enable_cellular_support";
      __int16 v12 = 1024;
      unsigned int v13 = [v4 BOOLValue];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@=%{BOOL}d; disconnecting & forgetting all wifi SSID...",
        (uint8_t *)&v10,
        0x12u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWiFiHelper sharedInstance](&OBJC_CLASS___MSDWiFiHelper, "sharedInstance"));
    [v7 disassociateAndForgetWiFi];

    BOOL v8 = -[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]( self,  "updateDeviceOptions:skipImutableKeys:",  v3,  1LL);
  }

  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)resetSystemTimeCache
{
  id v2 = sub_10003A95C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting system time cache...", v6, 2u);
  }

  if (!TMResetToFirstLaunch())
  {
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10009C6DC();
    }
  }

- (int64_t)getFreeSpace
{
  id v2 = (const __CFDictionary *)MGCopyAnswer(@"DiskUsage", 0LL);
  if (v2)
  {
    id v3 = v2;
    sub_100066784(v2, kMGQDiskUsageTotalDataAvailable, &v7);
    CFRelease(v3);
    return v7;
  }

  else
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10009C708();
    }

    return 0LL;
  }

- (BOOL)updateDeviceOptions:(id)a3 skipImutableKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = sub_10003A95C();
  int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating device options dictionary on device",  buf,  2u);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"device_options"]);

  int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if (([v16 isEqualToString:@"disable_snapshot_mode"] & 1) != 0
          || [v16 isEqualToString:@"enable_better_together"])
        {
          if (v4)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v16]);

            if (!v17) {
              continue;
            }
            id v18 = v9;
          }

          else
          {
            id v18 = v11;
          }

          uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v16]);
          if (v19)
          {
LABEL_20:
            -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v19, v16);

            continue;
          }
        }

        else
        {
          uint32_t v19 = &__kCFBooleanFalse;
          BOOL v20 = v4;
          id v21 = v10;
          uint64_t v22 = v9;
          unsigned int v23 = [v16 isEqualToString:@"device_info"];
          uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v16]);
          if (v23)
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
            [v24 saveDeviceInfo:v19];
          }

          BOOL v9 = v22;
          int v10 = v21;
          BOOL v4 = v20;
          if (v19) {
            goto LABEL_20;
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v13);
  }

  -[MSDTargetDevice saveDeviceOptions:](self, "saveDeviceOptions:", v10);
  return 1;
}

- (void)saveDeviceOptions:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"device_options"];
}

- (id)getDeviceOptions
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"device_options"]);
  id v4 = (NSMutableDictionary *)[v3 mutableCopy];

  if (!v4 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    int64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

    id v4 = v7;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
  unsigned int v9 = [v8 isNPIDevice];

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getMaskValueForKey:@"ProductType"]);

    if (v11)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"product_type");
      }
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 getMaskValueForKey:@"part_description"]);

    if (v15)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
      if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"part_description");
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
    uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 getMaskValueForKey:@"device_family"]);

    if (v19)
    {
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"device_family");
      }
    }
  }

  else
  {
    id v11 = (void *)MGCopyAnswer(@"ProductType", 0LL);
    if (v11)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString, v22);
      if ((objc_opt_isKindOfClass(v11, v23) & 1) != 0) {
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"product_type");
      }
    }
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    unsigned int v25 = [v24 mockForBetterTogetherDemo];

    if (v25) {
      -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  &__kCFBooleanTrue,  @"enable_better_together");
    }
  }

  return v4;
}

- (void)processNewFeatureFlags:(id)a3 oldFeatureFlags:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHubFeatureFlags supportedFeatureFlags](&OBJC_CLASS___MSDHubFeatureFlags, "supportedFeatureFlags"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&__int128 v9 = 138543874LL;
    __int128 v20 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v13, v20));
        unsigned int v15 = [v14 BOOLValue];

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v13]);
        unsigned int v17 = [v16 BOOLValue];

        if (v15 != v17)
        {
          id v18 = sub_10003A95C();
          uint32_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            __int128 v27 = v13;
            __int16 v28 = 1024;
            unsigned int v29 = v15;
            __int16 v30 = 1024;
            unsigned int v31 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Feature flag '%{public}@' has new value set: %{BOOL}d -> %{BOOL}d",  buf,  0x18u);
          }

          if ([v13 isEqualToString:@"DisableNightlySnapshotRevert"])
          {
            if (-[MSDTargetDevice isContentFrozen](self, "isContentFrozen")) {
              -[MSDTargetDevice setupSnapshotRevertTimer](self, "setupSnapshotRevertTimer");
            }
          }

          else if (([v13 isEqualToString:@"DisableNightlyLowPowerMode"] & 1) == 0)
          {
            [v13 isEqualToString:@"DisableScreenDarkHours"];
          }
        }
      }

      id v10 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }

    while (v10);
  }
}

- (BOOL)setDemoEnrollmentFlag:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned __int8 v5 = [v4 setObject:v3 forKey:@"enrollmentFlag"];

  return v5;
}

- (id)getDemoEnrollmentFlag
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"enrollmentFlag"]);

  return v3;
}

- (BOOL)lockSnapshot
{
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 5LL);
}

- (BOOL)unlockSnapshot
{
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 1LL);
}

- (BOOL)revertSnapshot
{
  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 2LL);
}

- (BOOL)revertSnapshotAndShutdown
{
  return 1;
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 preserveESim:(BOOL)a4 callUnregister:(BOOL)a5 preserveDDLFlag:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  BOOL v8 = a3;
  if (a5)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubPort](self, "hubPort"));

      if (v12)
      {
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MSDUnEnrollRequest);
        -[MSDUnEnrollRequest setObliterate:](v13, "setObliterate:", v8);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDServerRequestHandler sharedInstance]( &OBJC_CLASS___MSDServerRequestHandler,  "sharedInstance"));
        id v15 = [v14 handleRequestSync:v13];
      }
    }
  }

  if (v6)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v16 setObject:&__kCFBooleanTrue forKey:@"preserveDDLFlag"];
  }

  if (!v8) {
    return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 0LL);
  }
  if (v7)
  {
    id v17 = sub_10003A95C();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received request to preserve installed eSim across device obliteration.",  v21,  2u);
    }

    uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v19 setObject:&__kCFBooleanTrue forKey:@"PreserveESimRequested"];
  }

  return -[MSDTargetDevice switchModeImmediately:](self, "switchModeImmediately:", 9LL);
}

- (BOOL)runCleanUpForBetterTogetherDevice
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubHostName](self, "hubHostName"));
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice hubPort](self, "hubPort"));

    if (v5)
    {
      BOOL v6 = objc_alloc_init(&OBJC_CLASS___MSDUnEnrollRequest);
      -[MSDUnEnrollRequest setObliterate:](v6, "setObliterate:", 1LL);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
      id v8 = [v7 handleRequestSync:v6];
    }
  }

  -[MSDTargetDevice manageDemoVolume:](self, "manageDemoVolume:", @"Delete");
  return 1;
}

- (BOOL)canLockSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 1 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canUnlockSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 5 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canRevertSnapshot
{
  return -[MSDTargetDevice mode](self, "mode") == 5 && -[MSDTargetDevice allowSnapshotMode](self, "allowSnapshotMode");
}

- (BOOL)canStartContentUpdate
{
  unsigned int v3 = -[MSDTargetDevice mode](self, "mode");
  if (v3 != 1) {
    LOBYTE(v3) = -[MSDTargetDevice mode](self, "mode") == 5;
  }
  return v3;
}

- (BOOL)canStartBackgroundDownload
{
  return -[MSDTargetDevice mode](self, "mode") == 5;
}

- (BOOL)canStartOSUpdate
{
  unsigned int v3 = -[MSDTargetDevice mode](self, "mode");
  if (v3 != 1) {
    LOBYTE(v3) = -[MSDTargetDevice mode](self, "mode") == 5;
  }
  return v3;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3 consultDeviceOptions:(BOOL)a4
{
  if (!a4)
  {
    if (!a3) {
      return 0;
    }
    goto LABEL_9;
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice getDeviceOptions](self, "getDeviceOptions"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"enable_on_device_unenroll"]);

  id v8 = sub_10003A95C();
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    uint64_t v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Consulting device options before unenroll: %{public}@",  (uint8_t *)&v12,  0xCu);
  }

  if (!v7)
  {

    return 1;
  }

  unsigned int v10 = [v7 BOOLValue];

  BOOL result = 0;
  if (v10 && a3)
  {
LABEL_9:
    if (-[MSDTargetDevice mode](self, "mode") != 5 && -[MSDTargetDevice mode](self, "mode")) {
      return -[MSDTargetDevice mode](self, "mode") == 1;
    }
    return 1;
  }

  return result;
}

- (BOOL)canRunCleanUpForBetterTogetherDevice
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldForgetKnownNetworkUponUnlock
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ForgetKnownNetworkUponUnlock"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setShouldForgetKnownNetworkUponUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_10003A95C();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    __int128 v9 = @"ForgetKnownNetworkUponUnlock";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Set %{public}@ to %{BOOL}d",  (uint8_t *)&v8,  0x12u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKey:@"ForgetKnownNetworkUponUnlock"];
}

- (BOOL)backgroundDownloadActive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"BackgroundDownloadActive"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBackgroundDownloadActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_10003A95C();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting bg:%d", (uint8_t *)v14, 8u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  BOOL v7 = v6;
  if (v3)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    unsigned __int8 v9 = [v7 setObject:v8 forKey:@"BackgroundDownloadActive"];

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10003A95C();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009C734();
      }
LABEL_11:
    }
  }

  else
  {
    int v12 = [v6 removeObjectForKey:@"BackgroundDownloadActive"];

    if ((v12 & 1) == 0)
    {
      id v13 = sub_10003A95C();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009C760();
      }
      goto LABEL_11;
    }
  }

- (unint64_t)backgroundDownloadState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 backgroundBundle]);

  if (v3) {
    unint64_t v4 = [v3 bundleState];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (void)setBackgroundDownloadState:(unint64_t)a3
{
  id v5 = sub_10003A95C();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "setting background download state:%lu",  (uint8_t *)&v9,  0xCu);
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundBundle]);
  [v8 setBundleStateAs:a3];

  if (a3 - 3 <= 1) {
    -[MSDTargetDevice setBackgroundDownloadActive:](self, "setBackgroundDownloadActive:", 0LL);
  }
}

- (void)setHubProtocolVersion:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting hub proto version:%{public}@",  (uint8_t *)&v7,  0xCu);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v6 setObject:v3 forKey:@"HubProtocolVersion"];
}

- (NSString)hubProtocolVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HubProtocolVersion"]);

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"HubProtocolVersion"]);
  }

  else
  {
    id v5 = @"2";
  }

  return (NSString *)v5;
}

- (BOOL)proceeded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"Proceeded"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setProceeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v5 = v4;
  if (v3)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    unsigned __int8 v7 = [v5 setObject:v6 forKey:@"Proceeded"];

    if ((v7 & 1) != 0) {
      return;
    }
  }

  else
  {
    int v8 = [v4 removeObjectForKey:@"Proceeded"];

    if ((v8 & 1) != 0) {
      return;
    }
  }

  id v9 = sub_10003A95C();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10009C78C(v10);
  }
}

- (void)cleanUpBackgroundState:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v4 removeObjectsForKeys:&off_1001061B0];
  }

  +[MSDBundleProgressTracker removeBundleFromPreferences:]( &OBJC_CLASS___MSDBundleProgressTracker,  "removeBundleFromPreferences:",  @"Content.Downloading");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  [v5 resetTrackerForBundleType:1];

  -[MSDTargetDevice setBackgroundDownloadActive:](self, "setBackgroundDownloadActive:", 0LL);
}

- (NSDictionary)wifiSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"WiFiSettings"]);

  return (NSDictionary *)v3;
}

- (void)setWifiSettings:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  uint64_t v5 = v4;
  if (v3) {
    unsigned __int8 v6 = [v4 setObject:v3 forKey:@"WiFiSettings"];
  }
  else {
    unsigned __int8 v6 = [v4 removeObjectForKey:@"WiFiSettings"];
  }
  unsigned __int8 v7 = v6;

  if ((v7 & 1) == 0)
  {
    id v8 = sub_10003A95C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009C78C(v9);
    }
  }
}

- (void)delayRebootForTesting
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  unsigned int v4 = [v3 rebootDelayForStaging];

  if (v4)
  {
    id v5 = sub_10003A95C();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Waiting for %u seconds to run test.",  (uint8_t *)v7,  8u);
    }

    sleep(v4);
  }
}

- (id)retrieveSignedManifest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileDownloadCredentials sharedInstance]( &OBJC_CLASS___MSDFileDownloadCredentials,  "sharedInstance"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (!v8
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath")),
        id v10 = (id)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactory createSignedManifestFromManifestFile:]( &OBJC_CLASS___MSDSignedManifestFactory,  "createSignedManifestFromManifestFile:",  v9)),  v9,  !v10))
  {
    BOOL v11 = objc_alloc_init(&OBJC_CLASS___MSDDownloadManifestRequest);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v3 manifestInfo]);
    -[MSDDownloadManifestRequest setManifestInfo:](v11, "setManifestInfo:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
    -[MSDServerRequest setSavePath:](v11, "setSavePath:", v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handleRequestSync:v11]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 error]);
    if (v16)
    {
      id v43 = 0LL;
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTargetDevice manifestPath](self, "manifestPath"));
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactory createSignedManifestFromManifestFile:]( &OBJC_CLASS___MSDSignedManifestFactory,  "createSignedManifestFromManifestFile:",  v17));

      if (v10)
      {

        goto LABEL_6;
      }

      id v47 = 0LL;
      sub_100087610(&v47, 3727740938LL, (uint64_t)@"Manifest is corrupted.");
      id v43 = v47;
    }

    id v10 = 0LL;
LABEL_24:

    id v46 = v43;
    sub_100087694(&v46, 3727740940LL, @"Could not download manifest.");
    id v29 = v46;

    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v28 demoUpdateFailed:v29];
    BOOL v40 = 0LL;
    goto LABEL_17;
  }

- (BOOL)overrideComputerNameAndHostnameIfNeeded
{
  return 0;
}

- (BOOL)aboutToReboot
{
  return self->_aboutToReboot;
}

- (void)setAboutToReboot:(BOOL)a3
{
  self->_aboutToReboot = a3;
}

- (NSString)localHubFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLocalHubFailureReason:(id)a3
{
}

- (NSString)s3ServerFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setS3ServerFailureReason:(id)a3
{
}

- (unsigned)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(unsigned int)a3
{
  self->_powerAssertion = a3;
}

- (NSTimer)snapshotRevertTimer
{
  return self->_snapshotRevertTimer;
}

- (void)setSnapshotRevertTimer:(id)a3
{
}

- (NSTimer)caLogsUploadTimer
{
  return self->_caLogsUploadTimer;
}

- (void)setCaLogsUploadTimer:(id)a3
{
}

- (NSTimer)waitForCommandTimer
{
  return self->_waitForCommandTimer;
}

- (void)setWaitForCommandTimer:(id)a3
{
}

- (id)buddyCompletionHandler
{
  return self->_buddyCompletionHandler;
}

- (void)setBuddyCompletionHandler:(id)a3
{
}

- (NSNumber)modeLock
{
  return self->_modeLock;
}

- (void)setModeLock:(id)a3
{
}

- (NSNumber)buddyCompletionHandlerLock
{
  return self->_buddyCompletionHandlerLock;
}

- (void)setBuddyCompletionHandlerLock:(id)a3
{
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end