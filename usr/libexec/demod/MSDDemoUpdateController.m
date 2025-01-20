@interface MSDDemoUpdateController
+ (id)sharedInstance;
- (BOOL)PLHasCompletedMomentAnalysis;
- (BOOL)PLHasCompletedRestorePostProcessing;
- (BOOL)_kickOffContentUpdateForManifest:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)_signedManifestMinimumOSVersionCheck:(id)a3 error:(id *)a4;
- (BOOL)busy;
- (BOOL)continueToUpdateAccountContent;
- (BOOL)continueToUpdateDemoContent;
- (BOOL)enrollForDeviceName:(id)a3 pairingCredential:(id)a4 hubHostName:(id)a5 hubPort:(id)a6 error:(id *)a7;
- (BOOL)enrolled;
- (BOOL)installCachedContentForCurrentLocale:(BOOL *)a3;
- (BOOL)migrateDataWithBlockingUI:(int)a3 startMigration:(BOOL)a4;
- (BOOL)migrationDone;
- (BOOL)setupAccounts:(id *)a3;
- (BOOL)updateDemoContent;
- (MSDComponentManager)componentManager;
- (MSDDemoUpdateController)init;
- (MSDHelperAgent)helperAgent;
- (MSDTargetDevice)device;
- (id)_contentPlistPathForManifest:(id)a3;
- (id)_selectCachedManifestWithError:(id *)a3;
- (void)_stageContentPlistForManifest:(id)a3;
- (void)cancelDemoContentUpdate;
- (void)checkWithTimeKeeper:(id)a3;
- (void)concludeDemoContenUpdateWithResult:(BOOL)a3 andError:(id)a4;
- (void)getDemoUpdateInProgress:(BOOL *)a3 operationAllowed:(BOOL *)a4;
- (void)setAutomatedDeviceGroupStoreID;
- (void)setBusy:(BOOL)a3;
- (void)setComponentManager:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHelperAgent:(id)a3;
- (void)setMigrationDone:(BOOL)a3;
- (void)setTVSpecificSettings;
@end

@implementation MSDDemoUpdateController

+ (id)sharedInstance
{
  if (qword_100125410 != -1) {
    dispatch_once(&qword_100125410, &stru_1000F9FB8);
  }
  return (id)qword_100125408;
}

- (MSDDemoUpdateController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDDemoUpdateController;
  v2 = -[MSDDemoUpdateController init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[MSDDemoUpdateController setDevice:](v2, "setDevice:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHelperAgent sharedInstance](&OBJC_CLASS___MSDHelperAgent, "sharedInstance"));
    -[MSDDemoUpdateController setHelperAgent:](v2, "setHelperAgent:", v4);
  }

  return v2;
}

- (void)getDemoUpdateInProgress:(BOOL *)a3 operationAllowed:(BOOL *)a4
{
  *a3 = 1;
  *a4 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
  unsigned int v8 = [v7 mode];

  if (v8 <= 5 && ((1 << v8) & 0x27) != 0)
  {
    *a4 = 1;
    if (!-[MSDDemoUpdateController busy](self, "busy")) {
      *a3 = 0;
    }
  }

- (BOOL)enrolled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"]);

  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MSDIsEnrolledRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handleRequestSync:v4]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    if (v7) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = [v6 isEnrolled];
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)enrollForDeviceName:(id)a3 pairingCredential:(id)a4 hubHostName:(id)a5 hubPort:(id)a6 error:(id *)a7
{
  id v59 = a3;
  id v58 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
  if (!-[MSDDemoUpdateController busy](v13, "busy"))
  {
    -[MSDDemoUpdateController setBusy:](v13, "setBusy:", 1LL, v58, v59);
    [v14 updateStage:1];
    v15 = objc_alloc_init(&OBJC_CLASS___MSDEnrollRequest);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollRequest getRegistrationInfoKeys](v15, "getRegistrationInfoKeys"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceInformation:v17]);
    id v19 = [v18 mutableCopy];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDNPIMaskValues sharedInstance](&OBJC_CLASS___MSDNPIMaskValues, "sharedInstance"));
    LODWORD(v17) = [v20 isNPIDevice];

    if ((_DWORD)v17) {
      v21 = &off_100106450;
    }
    else {
      v21 = &off_100106468;
    }
    [v19 setObject:v21 forKeyedSubscript:@"MSDDemoPingType"];
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v19));
    -[MSDEnrollRequest setRegistrationInfo:](v15, "setRegistrationInfo:", v22);

    if (v11 && v12)
    {
      -[MSDCommandServerRequest setServer:](v15, "setServer:", v11);
      -[MSDCommandServerRequest setPort:](v15, "setPort:", v12);
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue([v61 handleRequestSync:v15]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v60 error]);

    if (!v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      [v24 setHubHostName:v11];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      [v25 setHubPort:v12];

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v27 timeIntervalSinceReferenceDate];
      [v26 saveHubLastOnlineTime:(uint64_t)v28];

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      [v29 holdPowerAssertion];

      +[MSDBundleProgressTracker migratePreferencesFromFactoryDevicesIfNeeded]( &OBJC_CLASS___MSDBundleProgressTracker,  "migratePreferencesFromFactoryDevicesIfNeeded");
      [v14 loadBundles];
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      [v30 isBetterTogetherDemo];

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      unsigned __int8 v32 = [v31 setDemoDeviceFlag];

      if ((v32 & 1) == 0)
      {
        id v57 = sub_10003A95C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_1000984A0();
        }
        goto LABEL_20;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      [v33 setupWorkFolderForBootTask];

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
      [v34 createSecretKeyIfNeeded];

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
      unsigned int v36 = [v35 turnOnDemoMode];

      if (v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
        [v37 disableCoreAnalticsTransformSampling];

        v38 = (void *)objc_claimAutoreleasedReturnValue( +[MSDConfigurationProfileManager sharedInstance]( &OBJC_CLASS___MSDConfigurationProfileManager,  "sharedInstance"));
        [v38 installDefaultConfigurationProfile];

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
        [v39 setWaitingForCommand:1];

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
        [v40 setWaitingForCommand:1];

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
        unsigned int v42 = [v41 switchModeImmediately:1];

        if (v42)
        {
          id v43 = sub_10003A95C();
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Starting mail processor after enrolling.",  buf,  2u);
          }

          v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
          [v45 start];

          id v46 = sub_10003A95C();
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v64 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Starting mail processor ended",  v64,  2u);
          }

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
          [v48 terminateConfigurationApp];

          id v49 = sub_10003A95C();
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v63 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "terminateConfigurationApp ended",  v63,  2u);
          }

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v13, "device"));
          [v51 deleteConfigurationApp];

          id v52 = sub_10003A95C();
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v62 = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "deleteConfigurationApp ended", v62, 2u);
          }

- (BOOL)installCachedContentForCurrentLocale:(BOOL *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  context = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  id v7 = sub_10003A95C();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  v71 = a3;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Installing cached demo content...", buf, 2u);
  }

  v81[0] = @"IsCriticalUpdate";
  v81[1] = @"ForBackgroundDownload";
  v82[0] = &__kCFBooleanFalse;
  v82[1] = &__kCFBooleanFalse;
  v81[2] = @"VerifyHashBeforeStaging";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v82[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  3LL));

  if (!-[MSDDemoUpdateController busy](v4, "busy"))
  {
    -[MSDDemoUpdateController setBusy:](v4, "setBusy:", 1LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
    [v11 setCachedBundleInstallState:@"cachedBundleInstallInProgress"];

    id v76 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSDDemoUpdateController _selectCachedManifestWithError:]( v4,  "_selectCachedManifestWithError:",  &v76));
    id v13 = v76;
    id v14 = v13;
    if (v12)
    {
      id v75 = v13;
      unsigned int v15 = -[MSDDemoUpdateController _signedManifestMinimumOSVersionCheck:error:]( v4,  "_signedManifestMinimumOSVersionCheck:error:",  v12,  &v75);
      id v16 = v75;

      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 installedFactoryBundleID]);

        if (v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 installedFactoryBundleID]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleID]);
          unsigned int v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
            [v66 setCachedBundleInstallState:@"cachedBundleInstallDone"];

            id v67 = sub_10003A95C();
            v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue([v12 getLocaleCode]);
              v69 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
              v70 = (void *)objc_claimAutoreleasedReturnValue([v69 installedFactoryBundleID]);
              *(_DWORD *)buf = 138543618;
              v78 = v68;
              __int16 v79 = 2114;
              v80 = v70;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Bundle with locale %{public}@ & bundle ID %{public}@ already installed",  buf,  0x16u);
            }

            char v51 = 0;
            BOOL v52 = 1;
            goto LABEL_20;
          }
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v4, "helperAgent"));
        unsigned __int8 v24 = [v23 stageDeviceForUpdateProcess:0];

        if ((v24 & 1) != 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
          [v25 startFullScreenUIWith:@"CACHED_BUNDLE_INSTALL" allowCancel:0];

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
          unsigned __int8 v27 = [v26 dcotaOfflineModeDevice];

          if ((v27 & 1) == 0)
          {
            double v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
            [v28 setupDummyPreferenceFile];
          }

          [v6 startBundleUpdateMonitor:v12 inMode:0];
          v29 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleInProgress]);
          [v29 startBundleUpdateTimer];

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
          [v30 setBackgroundDownloadActive:0];

          id v31 = sub_10003A95C();
          unsigned __int8 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Stopping all apps running in the foreground...",  buf,  2u);
          }

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v5 fullScreenUIAppId]);
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v34,  @"com.apple.ist.windward",  @"com.apple.ist.DemoDiscoveryApp",  @"com.apple.PineBoard",  0LL));
          [v33 stopAllAppsExcept:v35];

          id v74 = v16;
          LODWORD(v33) = -[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:]( v4,  "_kickOffContentUpdateForManifest:withOptions:error:",  v12,  v10,  &v74);
          id v14 = v74;

          if ((_DWORD)v33)
          {
            unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleInProgress]);
            [v36 getBundleUpdateTime];
            v38 = v37;

            id v39 = sub_10003A95C();
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v78 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Total time taken for this update: %f.",  buf,  0xCu);
            }

            v41 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleInProgress]);
            [v41 stopBundleUpdateTimer];

            id v42 = sub_10003A95C();
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Done with content update, switching to real backup folder.",  buf,  2u);
            }

            v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v4, "helperAgent"));
            unsigned int v45 = [v44 switchToBackupFolder];

            if (v45)
            {
              -[MSDDemoUpdateController _stageContentPlistForManifest:](v4, "_stageContentPlistForManifest:", v12);
              id v46 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
              [v46 saveCurrentDeviceLanguageIdentifier];

              v47 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
              [v47 saveCuurentDeviceRegionCode];

              v48 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleID]);
              id v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
              [v49 setInstalledFactoryBundleID:v48];

              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
              -[os_log_s setCachedBundleInstallState:]( v50,  "setCachedBundleInstallState:",  @"cachedBundleInstallWaitMigration");
              char v51 = 1;
              BOOL v52 = 1;
              id v16 = v14;
LABEL_20:

              if (v71) {
                BOOL *v71 = v51;
              }
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
              [v53 stopFullScreenUI:0];

              -[MSDDemoUpdateController setBusy:](v4, "setBusy:", 0LL);
              goto LABEL_23;
            }
          }

          char v51 = 1;
LABEL_33:
          id v73 = v14;
          sub_100087694(&v73, 3727744768LL, @"An error has occurred.");
          id v16 = v73;

          id v59 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDemoUpdateStatusHub sharedInstance]( &OBJC_CLASS___MSDDemoUpdateStatusHub,  "sharedInstance"));
          [v59 demoUpdateFailed:v16];

          v60 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
          unsigned __int8 v61 = [v60 dcotaOfflineModeDevice];

          if ((v61 & 1) == 0)
          {
            id v62 = sub_10003A95C();
            v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Cleaning up keep alive file and BootTask Work folder...",  buf,  2u);
            }

            v64 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
            [v64 cleanupDummyPreferenceFile];

            v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
            [v65 destroyWorkFolderForBootTask];
          }

          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v4, "device"));
          -[os_log_s setCachedBundleInstallState:]( v50,  "setCachedBundleInstallState:",  @"cachedBundleInstallDone");
          BOOL v52 = 0;
          goto LABEL_20;
        }

        id v57 = sub_10003A95C();
        id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          sub_1000984CC();
        }
      }

      char v51 = 0;
      id v14 = v16;
      goto LABEL_33;
    }

    char v51 = 0;
    goto LABEL_33;
  }

  id v55 = sub_10003A95C();
  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "demo updater is busy; ignoring install call",
      buf,
      2u);
  }

  id v12 = 0LL;
  id v16 = 0LL;
  BOOL v52 = 0;
LABEL_23:

  objc_autoreleasePoolPop(context);
  objc_sync_exit(v4);

  return v52;
}

- (BOOL)updateDemoContent
{
  v2 = self;
  objc_sync_enter(v2);
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  id v62 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
  id v5 = [v4 criticalUpdatePrioritized];

  v70[0] = @"IsCriticalUpdate";
  unsigned int v57 = v5;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v71[0] = v6;
  v71[1] = &__kCFBooleanFalse;
  v70[1] = @"ForBackgroundDownload";
  v70[2] = @"VerifyHashBeforeStaging";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v71[2] = v7;
  unsigned __int8 v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  3LL));

  unsigned int v63 = -[MSDDemoUpdateController busy](v2, "busy");
  if (!v63)
  {
    -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 1LL);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
    unsigned int v9 = [v8 switchModeImmediately:2];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v2, "helperAgent"));
      unsigned __int8 v11 = [v10 stageDeviceForUpdateProcess:0];

      if ((v11 & 1) != 0)
      {
        id v12 = sub_10003A95C();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device downloading manifest...", buf, 2u);
        }

        [v3 updateStage:2];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 retrieveSignedManifest]);

        if (v15)
        {
          id v66 = 0LL;
          unsigned int v16 = -[MSDDemoUpdateController _signedManifestMinimumOSVersionCheck:error:]( v2,  "_signedManifestMinimumOSVersionCheck:error:",  v15,  &v66);
          id v17 = v66;
          if (v16)
          {
            [v3 startBundleUpdateMonitor:v15 inMode:0];
            v18 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
            [v18 startBundleUpdateTimer];

            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAppPrivacyPermissionsHelper sharedInstance]( &OBJC_CLASS___MSDAppPrivacyPermissionsHelper,  "sharedInstance"));
            [v19 savePrivacyPermissionsForAllApps:v15];

            v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
            [v20 setBackgroundDownloadActive:0];

            [v3 updateStage:21];
            id v21 = sub_10003A95C();
            unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Stopping all apps running in the foreground...",  buf,  2u);
            }

            v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
            unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v62 fullScreenUIAppId]);
            v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v24,  @"com.apple.ist.windward",  @"com.apple.ist.DemoDiscoveryApp",  @"com.apple.PineBoard",  @"com.apple.ist.DigitalSignage.iOS",  0LL));
            [v23 stopAllAppsExcept:v25];

            [v3 updateStage:22];
            id v65 = v17;
            LODWORD(v23) = -[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:]( v2,  "_kickOffContentUpdateForManifest:withOptions:error:",  v15,  v61,  &v65);
            id v59 = v65;

            if ((_DWORD)v23)
            {
              v60 = (void *)objc_claimAutoreleasedReturnValue([v3 getContentUpdateType]);
              v26 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
              unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 downloadedContentSource]);

              double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"remote"]);
              v29 = (char *)[v28 longLongValue];
              v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"local"]);
              id v31 = [v30 longLongValue];

              unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
              id v33 = [v32 getComponentsSuccessful];
              v34 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
              uint64_t v35 = (uint64_t)[v34 getAllComponentsForUpdate];

              unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"local"]);
              id v37 = [v36 longLongValue];

              v38 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
              [v38 getBundleUpdateTime];
              double v40 = v39;

              id v41 = sub_10003A95C();
              id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                double v69 = v40;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Total time taken for this update: %f.",  buf,  0xCu);
              }

              id v43 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAnalyticsEventHandler sharedInstance]( &OBJC_CLASS___MSDAnalyticsEventHandler,  "sharedInstance"));
              [v43 sendContentUpdateCompletedEvent:&v29[(void)v31] withTimeTaken:v37 != 0 cachingHubAvailable:v57 isCriticalUpdate:v60 contentUpdateType:100 * (uint64_t)v33 / v35 and ComponentSuccess:v40];

              v44 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleInProgress]);
              [v44 stopBundleUpdateTimer];

              id v45 = sub_10003A95C();
              id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Done with content update, switching to real backup folder.",  buf,  2u);
              }

              v47 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](v2, "helperAgent"));
              unsigned int v48 = [v47 switchToBackupFolder];

              if (v48)
              {
                id v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v2, "device"));
                unsigned int v50 = [v49 switchModeImmediately:4];

                if (v50)
                {
                  -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 0LL);
                  LOBYTE(v51) = 1;
                  goto LABEL_18;
                }
              }
            }

            else
            {
              v60 = 0LL;
              unsigned __int8 v27 = 0LL;
            }

            id v17 = v59;
          }

          else
          {
            v60 = 0LL;
            unsigned __int8 v27 = 0LL;
          }

- (void)cancelDemoContentUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
  [v3 canceledByUser];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [v4 forceSwitchToDemoUpdateModeIfNeeded];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  if ([v5 macOS])
  {
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v7 = [v6 iOS];

    if (!v7) {
      goto LABEL_5;
    }
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
  [v8 operationCanceled];

LABEL_5:
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
    [v10 abortProcessing];
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
  [v11 fullScreenUICanceledByUser];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  [v12 updateStage:101];

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
  [v13 sendImmediateDeviceInfoPing];
}

- (void)concludeDemoContenUpdateWithResult:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = self;
  objc_sync_enter(v7);
  if (!-[MSDDemoUpdateController busy](v7, "busy"))
  {
    id v10 = sub_10003A95C();
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "demo updater is NOT busy.", buf, 2u);
    }

    goto LABEL_8;
  }

  -[MSDDemoUpdateController setBusy:](v7, "setBusy:", 0LL);
  if (!v4)
  {
LABEL_8:
    id v13 = v6;
    sub_100087694(&v13, 3727744768LL, @"An error has occurred.");
    id v9 = v13;

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v12 demoUpdateFailed:v9];

    -[MSDDemoUpdateController checkWithTimeKeeper:](v7, "checkWithTimeKeeper:", v9);
    goto LABEL_4;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](v7, "device"));
  [v8 switchModeImmediately:5];

  id v9 = v6;
LABEL_4:
  objc_sync_exit(v7);
}

- (BOOL)setupAccounts:(id *)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAccountManager sharedInstance](&OBJC_CLASS___MSDAccountManager, "sharedInstance"));
  id v12 = 0LL;
  unsigned __int8 v5 = [v4 setupAccounts:&v12];
  id v6 = v12;

  if ((v5 & 1) == 0)
  {
    id v11 = v6;
    sub_100087694(&v11, 3727744743LL, @"An error has occurred.");
    id v7 = v11;

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v8 demoUpdateFailed:v7];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](&OBJC_CLASS___MSDAnalyticsEventHandler, "sharedInstance"));
    [v9 sendiCloudSigninFailureEvent:v7];

    if (a3)
    {
      id v6 = v7;
      *a3 = v6;
    }

    else
    {
      id v6 = v7;
    }
  }

  return v5;
}

- (BOOL)continueToUpdateAccountContent
{
  v3 = self;
  objc_sync_enter(v3);
  unsigned int v4 = -[MSDDemoUpdateController busy](v3, "busy");
  if (v4)
  {
    id v7 = sub_10003A95C();
    unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100098474();
    }
  }

  else
  {
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 1LL);
    id v8 = 0LL;
    unsigned __int8 v2 = -[MSDDemoUpdateController setupAccounts:](v3, "setupAccounts:", &v8);
    unsigned __int8 v5 = (os_log_s *)v8;
    if (v5) {
      -[MSDDemoUpdateController checkWithTimeKeeper:](v3, "checkWithTimeKeeper:", v5);
    }
    -[MSDDemoUpdateController setBusy:](v3, "setBusy:", 0LL);
  }

  objc_sync_exit(v3);
  return (v4 ^ 1) & v2;
}

- (BOOL)continueToUpdateDemoContent
{
  unsigned __int8 v2 = self;
  objc_sync_enter(v2);
  v3 = objc_autoreleasePoolPush();
  unsigned int v4 = -[MSDDemoUpdateController busy](v2, "busy");
  if (v4)
  {
    id v15 = sub_10003A95C();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100098474();
    }

    id v8 = 0LL;
    id v6 = 0LL;
  }

  else
  {
    -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 1LL);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAppPrivacyPermissionsHelper sharedInstance]( &OBJC_CLASS___MSDAppPrivacyPermissionsHelper,  "sharedInstance"));
    [v5 grantPrivacyPermissionsForAllApps];

    id v17 = 0LL;
    -[MSDDemoUpdateController setupAccounts:](v2, "setupAccounts:", &v17);
    id v6 = v17;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"locale"]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"language"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"region"]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
      [v11 setDeviceLanguage:v9 andRegion:v10 sbRestartNeeded:0 sbRestartHandler:0];

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
      [v12 removeObjectForKey:@"locale"];
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalytics sharedInstance](&OBJC_CLASS___MSDAnalytics, "sharedInstance"));
    [v13 disableCoreAnalticsTransformSampling];

    -[MSDDemoUpdateController setBusy:](v2, "setBusy:", 0LL);
  }

  objc_autoreleasePoolPop(v3);
  objc_sync_exit(v2);

  return v4 ^ 1;
}

- (void)checkWithTimeKeeper:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
  id v16 = 0LL;
  unsigned int v5 = [v4 shouldCleanUp:&v16];
  id v6 = v16;
  id v7 = v6;
  if (v5)
  {
    if ([v6 code] != (id)3727741184)
    {
      if ([v7 code] == (id)3727741185)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
        [v8 forceSwitchToDemoUpdateModeIfNeeded];
LABEL_15:

        goto LABEL_18;
      }

      id v13 = sub_10003A95C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unknown clean up reason!", buf, 2u);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v8 forceSwitchToDemoModeIfNeeded];
    goto LABEL_15;
  }

  if ([v3 code] == (id)3727740939)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    [v8 updateStage:24];
    goto LABEL_15;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  uint64_t v10 = (uint64_t)[v9 timeShowingFatalError];

  if ((_DWORD)v10)
  {
    id v11 = sub_10003A95C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Override MSDTimeShowingFatalError timeout: %u",  buf,  8u);
    }
  }

  else
  {
    uint64_t v10 = 900LL;
  }

  id v15 = [v4 setCompletionTimeForFatalError:v10];
LABEL_18:
}

- (BOOL)PLHasCompletedRestorePostProcessing
{
  char v13 = 0;
  id v2 = objc_alloc(&OBJC_CLASS___PLAssetsdClient);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryURL]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryURL"));
  id v4 = [v2 initWithPhotoLibraryURL:v3];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 demoClient]);
  id v12 = 0LL;
  unsigned __int8 v6 = [v5 hasCompletedRestorePostProcessing:&v13 error:&v12];
  id v7 = v12;

  if ((v6 & 1) != 0)
  {
    BOOL v8 = v13 != 0;
  }

  else
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000984F8();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)PLHasCompletedMomentAnalysis
{
  char v13 = 0;
  id v2 = objc_alloc(&OBJC_CLASS___PLAssetsdClient);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PLPhotoLibraryPathManager systemLibraryURL]( &OBJC_CLASS___PLPhotoLibraryPathManager,  "systemLibraryURL"));
  id v4 = [v2 initWithPhotoLibraryURL:v3];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 demoClient]);
  id v12 = 0LL;
  unsigned __int8 v6 = [v5 hasCompletedMomentAnalysis:&v13 error:&v12];
  id v7 = v12;

  if ((v6 & 1) != 0)
  {
    BOOL v8 = v13 != 0;
  }

  else
  {
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100098558();
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)migrateDataWithBlockingUI:(int)a3 startMigration:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[MSDDemoUpdateController migrationDone](self, "migrationDone", *(void *)&a3))
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
    [v6 updateStage:14];

    id v7 = sub_10003A95C();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Waiting for data migration to finish; startMigration=%{BOOL}d",
        (uint8_t *)&v41,
        8u);
    }

    if (v4) {
      DMPerformMigration(@"Demod is waiting for data migration to finish.");
    }
    else {
      DMPerformMigrationIfNeeded();
    }
    id v9 = sub_10003A95C();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Data migration finished.",  (uint8_t *)&v41,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
    unsigned int v12 = [v11 isOfflineMode];

    char v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDUIHelper sharedInstance](&OBJC_CLASS___MSDUIHelper, "sharedInstance"));
    id v14 = v13;
    if (v12) {
      id v15 = @"CACHED_BUNDLE_INSTALL";
    }
    else {
      id v15 = @"IN_PROGRESS";
    }
    [v13 startFullScreenUIWith:v15 allowCancel:1 disableIdleTimer:1];

    id v16 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Checking photo library migration.",  (uint8_t *)&v41,  2u);
    }

    int v18 = 0;
    id v19 = 0LL;
    v20 = 0LL;
    do
    {
      id v21 = v20;
      unsigned int v22 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

      unsigned int v23 = -[MSDDemoUpdateController PLHasCompletedRestorePostProcessing](self, "PLHasCompletedRestorePostProcessing");
      sleep(2u);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

      [v19 timeIntervalSinceDate:v20];
      v18 += (int)v24;
    }

    while ((v23 & 1) == 0 && v18 < 900);
    id v25 = sub_10003A95C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v27) {
        goto LABEL_23;
      }
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v18;
      double v28 = "Photo library migration finished after %d seconds.";
    }

    else
    {
      if (!v27) {
        goto LABEL_23;
      }
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v18;
      double v28 = "Photo library migration timeout after %d seconds.";
    }

    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v41, 8u);
LABEL_23:

    id v29 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Checking photo moment analysis.",  (uint8_t *)&v41,  2u);
    }

    int v31 = 0;
    do
    {
      unsigned __int8 v32 = v20;
      id v33 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v41));

      unsigned int v34 = -[MSDDemoUpdateController PLHasCompletedMomentAnalysis](self, "PLHasCompletedMomentAnalysis");
      sleep(5u);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

      [v19 timeIntervalSinceDate:v20];
      v31 += (int)v35;
    }

    while ((v34 & 1) == 0 && v31 < 300);
    id v36 = sub_10003A95C();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v38)
      {
        LODWORD(v41) = 67109120;
        HIDWORD(v41) = v31;
        double v39 = "Photo moment analysis finished after %d seconds.";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v41, 8u);
      }
    }

    else if (v38)
    {
      LODWORD(v41) = 67109120;
      HIDWORD(v41) = v31;
      double v39 = "Photo moment analysis timeout after %d seconds.";
      goto LABEL_33;
    }

    -[MSDDemoUpdateController setMigrationDone:](self, "setMigrationDone:", 1LL);
  }

  return 1;
}

- (void)setTVSpecificSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v2 setSleepTimeout:-1.0];

  +[CLLocationManager setLocationServicesEnabled:](&OBJC_CLASS___CLLocationManager, "setLocationServicesEnabled:", 1LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSTimeZoneUtility sharedInstance](&OBJC_CLASS___TVSTimeZoneUtility, "sharedInstance"));
  [v3 setAutomaticTimeZoneSelectionEnabled:1];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v4 setBoolValue:1 forSetting:MCFeatureDiagnosticsSubmissionAllowed];
}

- (void)setAutomatedDeviceGroupStoreID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getDeviceOptions]);

  if (v4) {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"store_id"]);
  }
  else {
    unsigned int v5 = 0LL;
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);

  BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration automatedDeviceGroup]( &OBJC_CLASS___OSASystemConfiguration,  "automatedDeviceGroup"));
  if (!v8)
  {
    id v12 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000985B8(v11, v13, v14);
    }
    id v15 = 0LL;
    id v9 = 0LL;
    goto LABEL_26;
  }

  id v9 = v8;
  if (!v5)
  {
    id v16 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100098640(v11, v17, v18);
    }
    goto LABEL_25;
  }

  if (!v7)
  {
    id v24 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000986C8(v11, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_25;
  }

  if (-[__CFString containsString:](v8, "containsString:", v5)
    && -[__CFString containsString:](v9, "containsString:", v7))
  {
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v33 = @"AutomatedDeviceGroup";
      __int16 v34 = 2114;
      double v35 = v9;
      __int16 v36 = 2114;
      id v37 = v5;
      __int16 v38 = 2114;
      double v39 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ key with value %{public}@ already contains store ID %{public}@ and serial number %{public}@, skip app ending store ID and serial number again",  buf,  0x2Au);
    }

- (BOOL)_signedManifestMinimumOSVersionCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getInfo]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"MinimumOSVersion"]);

  id v9 = sub_10003A95C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 getInfo]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"PartNumber"]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 getInfo]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"Revision"]);
    int v22 = 138543874;
    id v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    __int16 v26 = 2114;
    uint64_t v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manifest partnumber/revision: %{public}@_%{public}@, minimum OS version is %{public}@",  (uint8_t *)&v22,  0x20u);
  }

  if (v8
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device")),
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 OSVersion]),
        unsigned int v17 = [v8 higherVersionThan:v16],
        v16,
        v15,
        v17))
  {
    id v20 = sub_10003A95C();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000987D0((uint64_t)v8, self, v21);
    }

    sub_100087694(a4, 3727740976LL, @"iOS version mismatch.");
    BOOL v18 = 0;
  }

  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)_kickOffContentUpdateForManifest:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 mutableCopy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  if ([v10 macOS])
  {
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v12 = [v11 iOS];

    if (!v12) {
      goto LABEL_13;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 getAppList]);
  uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.retailtech.arkenstone"]);
  if (v14
    || (uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.apple.ist.windward"])) != 0
    || (uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.apple.ist.DemoDiscoveryApp"])) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController device](self, "device"));
    unsigned __int8 v16 = [v15 getSavedFlag];

    if ((v16 & 2) != 0)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPricingUpdateController sharedInstance]( &OBJC_CLASS___MSDPricingUpdateController,  "sharedInstance"));
      unsigned __int8 v18 = [v17 completed];

      if ((v18 & 1) == 0)
      {
        id v19 = sub_10003A95C();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v66 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Request builder to defer the update of app: %{public}@",  buf,  0xCu);
        }

        [v9 setObject:v14 forKey:@"AppItemToDefer"];
      }
    }
  }

LABEL_13:
  id v21 = -[MSDComponentBuilder initWithSignedManifest:andOptions:]( objc_alloc(&OBJC_CLASS___MSDComponentBuilder),  "initWithSignedManifest:andOptions:",  v7,  v9);
  int v22 = (void *)objc_claimAutoreleasedReturnValue( +[MSDConfigurationProfileManager sharedInstance]( &OBJC_CLASS___MSDConfigurationProfileManager,  "sharedInstance"));
  [v22 uninstallAllDemoBundleConfigurationProfiles];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder buildComponentsNotInManifest](v21, "buildComponentsNotInManifest"));
  if (v23)
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder buildComponentsFromManifest](v21, "buildComponentsFromManifest"));
    if (v24)
    {
      uint64_t v25 = v24;
      v47 = a5;
      id v50 = v9;
      id v51 = v8;

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
      id v54 = (void *)objc_claimAutoreleasedReturnValue([v26 date]);

      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      unsigned int v48 = (void *)v25;
      id v49 = v23;
      v63[0] = v23;
      v63[1] = v25;
      id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
      id v27 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (!v27)
      {
        id v29 = 0LL;
LABEL_31:

        id v21 = 0LL;
        id v7 = 0LL;
        BOOL v42 = 1;
        id v9 = v50;
        id v8 = v51;
        id v43 = v48;
        id v23 = v49;
        goto LABEL_32;
      }

      id v28 = v27;
      id v29 = 0LL;
      uint64_t v30 = *(void *)v58;
LABEL_17:
      uint64_t v31 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v32 = *(void **)(*((void *)&v57 + 1) + 8 * v31);
        id v33 = objc_autoreleasePoolPush();
        if ([v32 count])
        {
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue( +[MSDDemoUpdateTimeKeeper sharedInstance]( &OBJC_CLASS___MSDDemoUpdateTimeKeeper,  "sharedInstance"));
          id v56 = v29;
          unsigned int v35 = [v34 shouldCleanUp:&v56];
          id v36 = v56;

          if (v35)
          {
            id v45 = sub_10003A95C();
            id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v66 = "-[MSDDemoUpdateController _kickOffContentUpdateForManifest:withOptions:error:]";
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s - Content update has been cancelled by users request",  buf,  0xCu);
            }

            id v29 = v36;
LABEL_37:
            id v9 = v50;
            id v8 = v51;
            a5 = v47;
            id v43 = v48;
            id v23 = v49;

            objc_autoreleasePoolPop(v33);
            id v21 = 0LL;
            id v7 = 0LL;
            if (!v47) {
              goto LABEL_42;
            }
LABEL_38:
            id v29 = v29;
            BOOL v42 = 0;
            *a5 = v29;
            goto LABEL_32;
          }

          id v37 = -[MSDComponentProcessor initWithQoS:]( objc_alloc(&OBJC_CLASS___MSDComponentProcessor),  "initWithQoS:",  33LL);
          __int16 v38 = -[MSDComponentManager initWithComponents:andProcessor:]( objc_alloc(&OBJC_CLASS___MSDComponentManager),  "initWithComponents:andProcessor:",  v32,  v37);
          -[MSDDemoUpdateController setComponentManager:](self, "setComponentManager:", v38);
          double v39 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
          [v39 startProcessingAllComponents];

          double v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController componentManager](self, "componentManager"));
          id v55 = v36;
          unsigned __int8 v41 = [v40 waitForProcessingCompletionTillDate:v54 outError:&v55];
          id v29 = v55;

          if ((v41 & 1) == 0
            && ([v29 code] == (id)3727741184 || objc_msgSend(v29, "code") == (id)3727741185))
          {

            goto LABEL_37;
          }
        }

        else
        {
          id v37 = 0LL;
          __int16 v38 = 0LL;
        }

        objc_autoreleasePoolPop(v33);
        if (v28 == (id)++v31)
        {
          id v28 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
          if (v28) {
            goto LABEL_17;
          }
          goto LABEL_31;
        }
      }
    }

    unsigned __int8 v61 = 0LL;
    sub_100087610(&v61, 3727740938LL, (uint64_t)@"Manifest is corrupted.");
    id v46 = v61;
  }

  else
  {
    id v62 = 0LL;
    sub_100087610(&v62, 3727740938LL, (uint64_t)@"Manifest is corrupted.");
    id v46 = v62;
  }

  id v29 = v46;
  id v43 = 0LL;
  id v54 = 0LL;
  if (a5) {
    goto LABEL_38;
  }
LABEL_42:
  BOOL v42 = 0;
LABEL_32:

  return v42;
}

- (void)_stageContentPlistForManifest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Staging Content.plist...", buf, 2u);
  }

  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MSDDemoUpdateController _contentPlistPathForManifest:]( self,  "_contentPlistPathForManifest:",  v4));
  if (!v8)
  {
    id v30 = sub_10003A95C();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100098880();
    }
    goto LABEL_25;
  }

  unsigned __int8 v9 = [v5 fileExistsAtPath:v8];
  id v10 = sub_10003A95C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  unsigned int v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100098A68();
    }
LABEL_25:
    uint64_t v13 = 0LL;
    id v19 = 0LL;
    id v14 = 0LL;
LABEL_35:

    goto LABEL_20;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v43 = v8;
    __int16 v44 = 2114;
    id v45 = @"/private/var/demo_backup/backup/var/mobile/Media/Content.plist";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Copying %{public}@ to %{public}@...",  buf,  0x16u);
  }

  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"/private/var/demo_backup/backup/var/mobile/Media/Content.plist" stringByDeletingLastPathComponent]);
  if ([v5 fileExistsAtPath:v13])
  {
    id v14 = 0LL;
  }

  else
  {
    id v15 = sub_10003A95C();
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    id v41 = 0LL;
    unsigned __int8 v17 = [v5 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v41];
    id v14 = v41;
    if ((v17 & 1) == 0)
    {
      id v32 = sub_10003A95C();
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000989FC();
      }
      id v19 = 0LL;
      goto LABEL_35;
    }
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](&OBJC_CLASS___NSURL, "fileURLWithString:", v8));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fileHash]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
  unsigned __int8 v21 = [v20 cloneFile:v8 to:@"/private/var/demo_backup/backup/var/mobile/Media/Content.plist" expectingHash:v19];

  id v22 = sub_10003A95C();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  unsigned int v12 = v23;
  if ((v21 & 1) == 0)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10009898C();
    }
    goto LABEL_35;
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v43 = v8;
    __int16 v44 = 2114;
    id v45 = @"/private/var/demo_backup/Metadata/.Content.plist";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Copying %{public}@ to %{public}@...",  buf,  0x16u);
  }

  if (([v5 fileExistsAtPath:@"/private/var/demo_backup/Metadata"] & 1) == 0)
  {
    id v24 = sub_10003A95C();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = @"/private/var/demo_backup/Metadata";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Creating %{public}@...", buf, 0xCu);
    }

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
    unsigned __int8 v27 = [v26 prepareWorkDirectory:@"/private/var/demo_backup/Metadata" writableByNonRoot:0];

    if ((v27 & 1) == 0)
    {
      id v33 = sub_10003A95C();
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10009891C(v12, v34, v35, v36, v37, v38, v39, v40);
      }
      goto LABEL_35;
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateController helperAgent](self, "helperAgent"));
  unsigned __int8 v29 = [v28 cloneFile:v8 to:@"/private/var/demo_backup/Metadata/.Content.plist" expectingHash:v19];

  if ((v29 & 1) == 0)
  {
    id v31 = sub_10003A95C();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000988AC();
    }
    goto LABEL_35;
  }

- (id)_selectCachedManifestWithError:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 manifestPath]);

  v77 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByDeletingLastPathComponent]);
  __int16 v79 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v8);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
  id v76 = (void *)objc_claimAutoreleasedReturnValue([v9 getCurrentDevicePreferredLanguage]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSDLanguageAndRegionManager sharedInstance]( &OBJC_CLASS___MSDLanguageAndRegionManager,  "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getCurrentDeviceRegion]);

  id v12 = sub_10003A95C();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v92 = v76;
    __int16 v93 = 2114;
    v94 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Selecting cached bundle with preferred language code %{public}@; region %{public}@",
      buf,
      0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactoryMetadata loadManifestMetadata:]( &OBJC_CLASS___MSDSignedManifestFactoryMetadata,  "loadManifestMetadata:",  @"/var/MSDWorkContainer/.MSD_cache_content_plist"));
  id v74 = v14;
  id v75 = (void *)v5;
  if (!v14 && [0 count])
  {
    id v70 = sub_10003A95C();
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
      sub_100098D14();
    }

    id v88 = 0LL;
    sub_100087610(&v88, 3727740942LL, (uint64_t)@"Failed to load cached manifest file");
    id v57 = v88;
    unsigned __int8 v18 = 0LL;
    id v37 = 0LL;
    id v50 = 0LL;
    v47 = 0LL;
    if (a3) {
      goto LABEL_67;
    }
    goto LABEL_71;
  }

  v72 = a3;
  id v73 = self;
  v78 = v7;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v16)
  {
    id v17 = v16;
    unsigned __int8 v18 = 0LL;
    uint64_t v19 = *(void *)v85;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v85 != v19) {
          objc_enumerationMutation(v15);
        }
        unsigned __int8 v21 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 supportedRegions]);
        unsigned int v23 = [v22 containsObject:v11];

        if (v23) {
          [v79 addObject:v21];
        }
        if ([v21 isPrimaryBundle])
        {
          id v24 = v21;

          id v25 = sub_10003A95C();
          __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v92 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Found default primary bundle: %{public}@",  buf,  0xCu);
          }

          unsigned __int8 v18 = v24;
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v84 objects:v97 count:16];
    }

    while (v17);
  }

  else
  {
    unsigned __int8 v18 = 0LL;
  }

  id v7 = v78;
  if ([v79 count])
  {
    id v27 = sub_10003A95C();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v79 count];
      *(_DWORD *)buf = 134218498;
      id v92 = v29;
      __int16 v93 = 2114;
      v94 = v11;
      __int16 v95 = 2114;
      v96 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Found %lu bundles for region %{public}@: %{public}@",  buf,  0x20u);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactoryMetadata languageIdentifiersForMetadataList:]( &OBJC_CLASS___MSDSignedManifestFactoryMetadata,  "languageIdentifiersForMetadataList:",  v79));
    v90 = v76;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v90, 1LL));
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale matchedLanguagesFromAvailableLanguages:forPreferredLanguages:]( &OBJC_CLASS___NSLocale,  "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:",  v30,  v31));

    if ([v32 count])
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 firstObject]);
      id v34 = sub_10003A95C();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v92 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Found matched language code: %{public}@",  buf,  0xCu);
      }

      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[MSDSignedManifestFactoryMetadata metadataWithLanugageIdentifier:fromList:]( &OBJC_CLASS___MSDSignedManifestFactoryMetadata,  "metadataWithLanugageIdentifier:fromList:",  v33,  v79));
      if (v36)
      {
        id v37 = (id)v36;

        goto LABEL_35;
      }

      id v38 = sub_10003A95C();
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_100098CB4();
      }
    }
  }

  id v40 = sub_10003A95C();
  id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Did not find matching bundle; selecting default primary bundle",
      buf,
      2u);
  }

  id v37 = v18;
LABEL_35:
  id v42 = sub_10003A95C();
  id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v92 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Selected bundle metadata: %{public}@",  buf,  0xCu);
  }

  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v37 fileName]);
  if (!v44)
  {
    id v64 = sub_10003A95C();
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_100098AC8();
    }

    id v83 = 0LL;
    sub_100087610(&v83, 3727740942LL, (uint64_t)@"Selected bundle metadata do not contain file name");
    id v57 = v83;
    id v50 = 0LL;
    v47 = 0LL;
LABEL_66:
    a3 = v72;
    if (v72)
    {
LABEL_67:
      id v57 = v57;
      id v62 = 0LL;
      *a3 = v57;
      goto LABEL_53;
    }

- (id)_contentPlistPathForManifest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PartNumber"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 getInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Revision"]);

  if (!v5)
  {
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100098D40(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }

  if (!v7)
  {
    id v19 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100098DB0(v11, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_9:

    uint64_t v8 = 0LL;
    goto LABEL_4;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@/%@_%d.plist",  @"/var/MSDWorkContainer/.MSD_cache_content_plist",  v5,  [v7 intValue]));
LABEL_4:

  return v8;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)migrationDone
{
  return self->_migrationDone;
}

- (void)setMigrationDone:(BOOL)a3
{
  self->_migrationDone = a3;
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MSDHelperAgent)helperAgent
{
  return self->_helperAgent;
}

- (void)setHelperAgent:(id)a3
{
}

- (MSDComponentManager)componentManager
{
  return self->_componentManager;
}

- (void)setComponentManager:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end