@interface PBSoftwareUpdateService
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_okToCheckForOSSoftwareUpdate;
- (BOOL)_serverAllowsAutoApplyUpdates;
- (BOOL)_shouldStopAfterDownloadAndBeforeApplyWithData:(id)a3;
- (BOOL)isPresenting;
- (BOOL)monitoringEnabled;
- (BOOL)powerManagerAllowSystemToSleep:(id)a3;
- (BOOL)precheckingOSUpdateConditions;
- (NSTimer)vendorBagRefetchTimeoutTimer;
- (PBSoftwareUpdateService)init;
- (PBSystemOverlayController)overlayController;
- (PCSimpleTimer)dailyReportingTimer;
- (PCSimpleTimer)darkWakeTimer;
- (PCSimpleTimer)updateDelayExpirationTimer;
- (TVSBackgroundTask)osSoftwareUpdateInitialCheckTask;
- (TVSBackgroundTask)osSoftwareUpdatePeriodicCheckTask;
- (UIViewController)updateViewController;
- (id)_versionForUpdate:(id)a3;
- (id)osSoftwareUpdateCheckResponse;
- (id)singleLineDescriptionFor:(id)a3;
- (void)_cancelOSUpdateDarkWakeTimer;
- (void)_currentDownload:(id)a3;
- (void)_dailyOSUpdateReportingTimerFired:(id)a3;
- (void)_didFinishLegacyCheckWithData:(id)a3;
- (void)_didFinishTvOSUCheckWithData:(id)a3;
- (void)_dismiss;
- (void)_handleManagedConfigurationSettingsChangedNotification:(id)a3;
- (void)_handleOSUpdatePrefsDidChange;
- (void)_handlePineBoardPrefsDidChange;
- (void)_osUpdateDarkWakeTimerFired:(id)a3;
- (void)_osUpdateDelayedUpdateExpirationTimerFired:(id)a3;
- (void)_postVendorBagReloadContinueAutoApply;
- (void)_presentModalUpdateScreen;
- (void)_presentWithCompletion:(id)a3;
- (void)_promptForApplyConfirmationWithData:(id)a3 thenDo:(id)a4;
- (void)_reloadVendorBag;
- (void)_scheduleDailyOSUpdateReporting;
- (void)_scheduleOSUpdateCheck;
- (void)_scheduleOSUpdateCheckForExpiredDelay;
- (void)_scheduleOSUpdateDarkWakeAt:(id)a3;
- (void)_scheduleOSUpdateOnSleepCheck;
- (void)_scheduleOSUpdateTimerForNextDarkWake;
- (void)_showApplyConfirmationDialogIfNeededWithData:(id)a3;
- (void)_showOSUpdateDownloadAndApplyConfirmationForUpdate:(id)a3 largeUpdate:(BOOL)a4 assetIsDownloaded:(BOOL)a5;
- (void)_showOSUpdateError:(id)a3 inDomain:(id)a4 description:(id)a5 underlyingError:(id)a6;
- (void)_showOSUpdateUpToDateDialog:(BOOL)a3;
- (void)_startOSUpdateCheckForAction:(unint64_t)a3;
- (void)cancelDownload:(id)a3;
- (void)cancelOSSoftwareUpdate;
- (void)checkForOSUpdatesWithOptions:(id)a3 response:(id)a4;
- (void)currentDownload:(id)a3;
- (void)installUpdate:(id)a3 withOptions:(id)a4 withResult:(id)a5;
- (void)isOSSoftwareUpdateChecking:(id)a3;
- (void)isOSSoftwareUpdateRunning:(id)a3;
- (void)isUpdate:(id)a3 readyForInstallation:(id)a4;
- (void)notePlaybackStateChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)osUpdateProcessDidFinishApplyWithData:(id)a3;
- (void)osUpdateProcessDidFinishCheckWithData:(id)a3;
- (void)osUpdateProcessDidFinishDownloadWithData:(id)a3;
- (void)osUpdateProcessDidStartApplyWithData:(id)a3;
- (void)osUpdateProcessDidStartCheckWithData:(id)a3;
- (void)osUpdateProcessDidStartDownloadWithData:(id)a3;
- (void)osUpdateProcessDidStartRedownloadWithData:(id)a3;
- (void)osUpdateProcessDidUpdateApplyProgressWithData:(id)a3;
- (void)osUpdateProcessDidUpdateDownloadProgressWithData:(id)a3;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)purgeAssetsWithCompletion:(id)a3;
- (void)purgeDownload:(id)a3;
- (void)purgeableAssetSpaceWithCompletion:(id)a3;
- (void)reallyPerformMDMOSSoftwareUpdateCheck;
- (void)reallyPerformOSSoftwareRestore;
- (void)reallyPerformOSSoftwareUpdateCheck;
- (void)setAssetDownloadIsDiscretionary:(BOOL)a3;
- (void)setDailyReportingTimer:(id)a3;
- (void)setDarkWakeTimer:(id)a3;
- (void)setMonitoringEnabled:(BOOL)a3;
- (void)setOsSoftwareUpdateCheckResponse:(id)a3;
- (void)setOsSoftwareUpdateInitialCheckTask:(id)a3;
- (void)setOsSoftwareUpdatePeriodicCheckTask:(id)a3;
- (void)setPrecheckingOSUpdateConditions:(BOOL)a3;
- (void)setUpdateDelayExpirationTimer:(id)a3;
- (void)setVendorBagRefetchTimeoutTimer:(id)a3;
- (void)startDownload:(id)a3;
- (void)startSoftwareUpdateMonitoring;
@end

@implementation PBSoftwareUpdateService

+ (PBDependencyDescription)dependencyDescription
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100187B3C;
  v17[3] = &unk_1003CFF78;
  v17[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v17);
  if (OTAImplementationType() == 2)
  {
    uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v19[0] = v5;
    uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v19[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);
  }

  else
  {
    uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBOSSoftwareUpdateProcess, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18[0] = v5;
    uint64_t v12 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v18[1] = v8;
    uint64_t v14 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v18[2] = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
    -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v15);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100471210 != -1) {
    dispatch_once(&qword_100471210, &stru_1003DA880);
  }
  return (id)qword_100471208;
}

- (PBSoftwareUpdateService)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBSoftwareUpdateService;
  v2 = -[PBSoftwareUpdateService init](&v25, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    id osSoftwareUpdateCheckResponse = v2->_osSoftwareUpdateCheckResponse;
    v2->_id osSoftwareUpdateCheckResponse = 0LL;

    v3->_precheckingOSUpdateConditions = 0;
    __int128 v39 = 0u;
    memset(v40, 0, sizeof(v40));
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    *(_OWORD *)location = 0u;
    id v5 = sub_1000836CC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    v24[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  location,  250LL,  &_mh_execute_header,  v6,  0LL,  "------- OTA Service Start -------",  v24,  2);
    v9 = v8;

    id v10 = sub_1000836CC();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != location) {
      free(v9);
    }
    logOTABanner(v12);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100187EBC;
    v22[3] = &unk_1003D0FA8;
    uint64_t v13 = v3;
    v23 = v13;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v13,  v22);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v14 addObserver:v13 forKeyPath:@"SleepTimeoutInSeconds" options:5 context:&off_1003DA8A0];

    id v15 = +[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance");
    objc_initWeak(location, v13);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10018800C;
    v20[3] = &unk_1003D0890;
    objc_copyWeak(&v21, location);
    id v16 =  +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  PBSOSUpdatePreferenceDomain,  v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v17 addObserver:v13 selector:"_handleManagedConfigurationSettingsChangedNotification:" name:MCEffectiveSettingsChangedNotification object:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003DA8A0)
  {
    -[PBSoftwareUpdateService _handlePineBoardPrefsDidChange](self, "_handlePineBoardPrefsDidChange", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBSoftwareUpdateService;
    -[PBSoftwareUpdateService observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)startSoftwareUpdateMonitoring
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001880DC;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)isOSSoftwareUpdateChecking:(id)a3
{
  uint64_t v3 = (void (**)(id, BOOL, void))a3;
  v3[2](v3, +[PBOSUpdateSwitch isCheckingForUpdate](&OBJC_CLASS___PBOSUpdateSwitch, "isCheckingForUpdate"), 0LL);
}

- (void)currentDownload:(id)a3
{
}

- (void)setAssetDownloadIsDiscretionary:(BOOL)a3
{
}

- (void)isOSSoftwareUpdateRunning:(id)a3
{
  uint64_t v3 = (void (**)(id, BOOL, void))a3;
  v3[2](v3, +[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning"), 0LL);
}

- (void)isUpdate:(id)a3 readyForInstallation:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(id, void, void *))a4;
  if (+[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning"))
  {
    __int128 v50 = 0u;
    memset(v51, 0, sizeof(v51));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    id v7 = sub_1000836CC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    LOWORD(v35) = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  &v37,  250LL,  &_mh_execute_header,  v8,  16LL,  "Failed readyForInstallation check because an update is already running.",  &v35,  2);
    uint64_t v11 = v10;

    id v12 = sub_1000836CC();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 16LL, v13);

    if (v11 != &v37) {
      free(v11);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  4LL,  0LL));
    v6[2](v6, 0LL, v14);
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBOSUpdateSwitch isAssetReadyToInstallForUpdate:]( &OBJC_CLASS___PBOSUpdateSwitch,  "isAssetReadyToInstallForUpdate:",  v5));
    __int128 v50 = 0u;
    memset(v51, 0, sizeof(v51));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    id v15 = sub_1000836CC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    v18 = @"did not find";
    if (!v14) {
      v18 = @"found";
    }
    int v35 = 138412290;
    __int128 v36 = v18;
    _os_log_send_and_compose_impl( v17,  0LL,  &v37,  250LL,  &_mh_execute_header,  v16,  0LL,  "%@ asset ready to install.",  &v35,  12);
    v20 = v19;

    id v21 = sub_1000836CC();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    _os_log_message_persist_impl(v20, 0LL, v22);

    if (v20 != &v37) {
      free(v20);
    }
    unsigned int v23 = +[PBOSUpdateSwitch IsAwaitingRebootToApply](&OBJC_CLASS___PBOSUpdateSwitch, "IsAwaitingRebootToApply");
    __int128 v50 = 0u;
    memset(v51, 0, sizeof(v51));
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    id v24 = sub_1000836CC();
    objc_super v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = 3LL;
    }
    else {
      uint64_t v26 = 2LL;
    }
    __int128 v27 = @"not";
    if (v23) {
      __int128 v27 = &stru_1003E2910;
    }
    int v35 = 138412290;
    __int128 v36 = v27;
    LODWORD(v34) = 12;
    _os_log_send_and_compose_impl( v26,  0LL,  &v37,  250LL,  &_mh_execute_header,  v25,  0LL,  "%@ awaiting reboot to finish.",  &v35,  v34);
    __int128 v29 = v28;

    id v30 = sub_1000836CC();
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    _os_log_message_persist_impl(v29, 0LL, v31);

    if (v29 != &v37) {
      free(v29);
    }
    if (v14) {
      uint64_t v32 = v23;
    }
    else {
      uint64_t v32 = 1LL;
    }
    if (v23) {
      __int128 v33 = 0LL;
    }
    else {
      __int128 v33 = v14;
    }
    v6[2](v6, v32, v33);
  }
}

- (void)checkForOSUpdatesWithOptions:(id)a3 response:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001887EC;
  v9[3] = &unk_1003DA8D8;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = a4;
  SEL v13 = a2;
  id v7 = v10;
  id v8 = v12;
  +[PBOSUpdateSwitch startWithCompletion:](&OBJC_CLASS___PBOSUpdateSwitch, "startWithCompletion:", v9);
}

- (void)reallyPerformOSSoftwareUpdateCheck
{
  id v3 = sub_1000836CC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "OS update check started: manual request",  v5,  2u);
  }

  -[PBSoftwareUpdateService _startOSUpdateCheckForAction:](self, "_startOSUpdateCheckForAction:", 2LL);
}

- (void)reallyPerformMDMOSSoftwareUpdateCheck
{
  id v3 = sub_1000836CC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "OS update check started: MDM-triggered request",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned int v6 = [v5 shouldSkipMDMCommands];

  if (v6)
  {
    __int128 v28 = 0u;
    memset(v29, 0, sizeof(v29));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    *(_OWORD *)buf = 0u;
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    v14[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  buf,  250LL,  &_mh_execute_header,  v8,  0LL,  "Skipped MDM update check - default set",  v14,  2);
    uint64_t v11 = v10;

    id v12 = sub_1000836CC();
    SEL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != buf) {
      free(v11);
    }
  }

  else
  {
    -[PBSoftwareUpdateService _startOSUpdateCheckForAction:](self, "_startOSUpdateCheckForAction:", 5LL);
  }

- (void)startDownload:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  if ((id)+[PBOSUpdateSwitch action](&OBJC_CLASS___PBOSUpdateSwitch, "action") == (id)7
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance")),
        unsigned int v6 = [v5 shouldSkipMDMCommands],
        v5,
        v6))
  {
    memset(v18, 0, 250);
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    v17[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  v18,  250LL,  &_mh_execute_header,  v8,  0LL,  "Skipped download start - default set",  v17,  2);
    uint64_t v11 = v10;

    id v12 = sub_1000836CC();
    SEL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != v18) {
      free(v11);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  16LL,  0LL));
    v4[2](v4, 0LL, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100189010;
    v15[3] = &unk_1003DA900;
    __int128 v16 = v4;
    -[PBSoftwareUpdateService currentDownload:](self, "currentDownload:", v15);
    uint64_t v14 = v16;
  }
}

- (void)cancelDownload:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  if ((id)+[PBOSUpdateSwitch action](&OBJC_CLASS___PBOSUpdateSwitch, "action") == (id)7)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v5 = [v4 shouldSkipMDMCommands];

    if (!v5)
    {
      +[PBOSUpdateSwitch cancelForReason:](&OBJC_CLASS___PBOSUpdateSwitch, "cancelForReason:", 1LL);
      v3[2](v3, 1LL, 0LL);
      goto LABEL_17;
    }

    __int128 v37 = 0u;
    memset(v38, 0, sizeof(v38));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v24 = 0u;
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    v23[0] = 0;
    _os_log_send_and_compose_impl( v8,  0LL,  &v24,  250LL,  &_mh_execute_header,  v7,  0LL,  "Skipped cancel download start - default set",  v23,  2);
    id v10 = v9;

    id v11 = sub_1000836CC();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 0LL, v12);

    if (v10 != &v24) {
      free(v10);
    }
    uint64_t v13 = PBSOSUpdateServiceErrorDomain;
    uint64_t v14 = 16LL;
  }

  else
  {
    __int128 v37 = 0u;
    memset(v38, 0, sizeof(v38));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v24 = 0u;
    id v15 = sub_1000836CC();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    v23[0] = 0;
    _os_log_send_and_compose_impl( v17,  0LL,  &v24,  250LL,  &_mh_execute_header,  v16,  16LL,  "Attempt to cancel download for operation other than download only.",  v23,  2);
    __int128 v19 = v18;

    id v20 = sub_1000836CC();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 16LL, v21);

    if (v19 != &v24) {
      free(v19);
    }
    uint64_t v13 = PBSOSUpdateServiceErrorDomain;
    uint64_t v14 = 13LL;
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  v14,  0LL));
  ((void (**)(id, uint64_t, void *))v3)[2](v3, 0LL, v22);

LABEL_17:
}

- (void)purgeDownload:(id)a3
{
  id v3 = a3;
  if (+[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning"))
  {
    memset(v19, 0, 250);
    id v4 = sub_1000836CC();
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    v18[0] = 0;
    _os_log_send_and_compose_impl( v6,  0LL,  v19,  250LL,  &_mh_execute_header,  v5,  16LL,  "Attempt to purge download while update is running.",  v18,  2);
    uint64_t v8 = v7;

    id v9 = sub_1000836CC();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    _os_log_message_persist_impl(v8, 16LL, v10);

    if (v8 != v19) {
      free(v8);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100189780;
    block[3] = &unk_1003D2560;
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  4LL,  0LL));
    id v17 = v3;
    id v11 = v3;
    id v12 = v16;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001897A4;
    v13[3] = &unk_1003D1BA0;
    id v14 = v3;
    id v12 = v3;
    +[PBOSUpdateSwitch purgeDownloadWithCompletion:]( &OBJC_CLASS___PBOSUpdateSwitch,  "purgeDownloadWithCompletion:",  v13);
    id v11 = v14;
  }
}

- (void)reallyPerformOSSoftwareRestore
{
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  v10[0] = 0;
  _os_log_send_and_compose_impl( v5,  0LL,  v11,  250LL,  &_mh_execute_header,  v4,  0LL,  "OS update check started: restore",  v10,  2);
  id v7 = v6;

  id v8 = sub_1000836CC();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  _os_log_message_persist_impl(v7, 0LL, v9);

  if (v7 != v11) {
    free(v7);
  }
  -[PBSoftwareUpdateService _startOSUpdateCheckForAction:](self, "_startOSUpdateCheckForAction:", 9LL);
}

- (void)installUpdate:(id)a3 withOptions:(id)a4 withResult:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned int v9 = [v8 shouldSkipMDMCommands];

  if (v9)
  {
    memset(v21, 0, 250);
    id v10 = sub_1000836CC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = 3LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
    v20[0] = 0;
    _os_log_send_and_compose_impl( v12,  0LL,  v21,  250LL,  &_mh_execute_header,  v11,  0LL,  "Skipped install only - default set",  v20,  2);
    id v14 = v13;

    id v15 = sub_1000836CC();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    _os_log_message_persist_impl(v14, 0LL, v16);

    if (v14 != v21) {
      free(v14);
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  16LL,  0LL));
    v7[2](v7, 0LL, v17);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateScanOptions defaultOptions](&OBJC_CLASS___PBSOSUpdateScanOptions, "defaultOptions"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100189B64;
    void v18[3] = &unk_1003D0048;
    __int128 v19 = v7;
    +[PBOSUpdateSwitch installOnlyWithDescriptor:options:completion:]( &OBJC_CLASS___PBOSUpdateSwitch,  "installOnlyWithDescriptor:options:completion:",  v6,  v17,  v18);
  }
}

- (void)cancelOSSoftwareUpdate
{
}

- (void)notePlaybackStateChanged
{
  if (+[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    else {
      unsigned int v3 = 0;
    }
    unsigned int v5 = [v2 playing] & (v3 ^ 1);
    unint64_t v6 = +[PBOSUpdateSwitch action](&OBJC_CLASS___PBOSUpdateSwitch, "action");
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 playbackRate]);
    id v8 = sub_1000836CC();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v7 floatValue];
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = v3;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v5;
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v34) = v6 == 2;
      WORD2(v34) = 2048;
      *(double *)((char *)&v34 + 6) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Playback state change (vid:%d other:%d manual:%d rate:%f)",  buf,  0x1Eu);
    }

    [v7 floatValue];
    if (v11 == 0.0)
    {
      id v12 = sub_1000836CC();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        [v7 floatValue];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v3;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v5;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v34) = v6 == 2;
        WORD2(v34) = 2048;
        *(double *)((char *)&v34 + 6) = v14;
        id v15 = "Ignoring notification because rate is 0 (vid:%d other:%d manual:%d rate:%f)";
LABEL_17:
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v15, buf, 0x1Eu);
      }
    }

    else
    {
      int v16 = v5 ^ 1;
      if (v6 == 2) {
        int v16 = 1;
      }
      if (((v3 ^ 1) & v16 & 1) == 0)
      {
        BOOL v19 = v6 == 2;
        __int128 v46 = 0u;
        memset(v47, 0, sizeof(v47));
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        *(_OWORD *)buf = 0u;
        id v20 = sub_1000836CC();
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v22 = 3LL;
        }
        else {
          uint64_t v22 = 2LL;
        }
        [v7 floatValue];
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v5;
        HIWORD(v29) = 1024;
        BOOL v30 = v19;
        __int16 v31 = 2048;
        double v32 = v23;
        _os_log_send_and_compose_impl( v22,  0LL,  buf,  250LL,  &_mh_execute_header,  v21,  0LL,  "Canceling update on playback state change (vid:%d other:%d manual:%d rate:%f)",  &v28,  30,  67109888,  v29);
        __int128 v25 = v24;

        id v26 = sub_1000836CC();
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        _os_log_message_persist_impl(v25, 0LL, v27);

        if (v25 != buf) {
          free(v25);
        }
        +[PBOSUpdateSwitch cancelForReason:](&OBJC_CLASS___PBOSUpdateSwitch, "cancelForReason:", 2LL);
        goto LABEL_19;
      }

      id v17 = sub_1000836CC();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        [v7 floatValue];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v3;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v5;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v34) = v6 == 2;
        WORD2(v34) = 2048;
        *(double *)((char *)&v34 + 6) = v18;
        id v15 = "Not canceling update on playback state change (vid:%d other:%d manual:%d rate:%f)";
        goto LABEL_17;
      }
    }

LABEL_19:
    goto LABEL_20;
  }

  id v4 = sub_1000836CC();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEBUG)) {
    sub_100289724((os_log_t)v2);
  }
LABEL_20:
}

- (void)purgeableAssetSpaceWithCompletion:(id)a3
{
  unsigned int v3 = (void (**)(id, _UNKNOWN **))a3;
  if (OTAImplementationType() == 2)
  {
    if (v3) {
      v3[2](v3, &off_1003FDEA8);
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateProcess sharedProcess](&OBJC_CLASS___PBOSSoftwareUpdateProcess, "sharedProcess"));
    [v4 purgeableAssetSpaceWithCompletion:v3];
  }
}

- (void)purgeAssetsWithCompletion:(id)a3
{
  unsigned int v3 = (void (**)(id, _UNKNOWN **))a3;
  if (+[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning"))
  {
    memset(v13, 0, 250);
    id v4 = sub_1000836CC();
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    v12[0] = 0;
    _os_log_send_and_compose_impl( v6,  0LL,  v13,  250LL,  &_mh_execute_header,  v5,  16LL,  "Attempt to purge download while update is running.",  v12,  2);
    id v8 = v7;

    id v9 = sub_1000836CC();
    float v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    _os_log_message_persist_impl(v8, 16LL, v10);

    if (v8 != v13) {
      free(v8);
    }
LABEL_9:
    v3[2](v3, &off_1003FDEA8);
    goto LABEL_11;
  }

  if (OTAImplementationType() != 2)
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateProcess sharedProcess](&OBJC_CLASS___PBOSSoftwareUpdateProcess, "sharedProcess"));
    [v11 purgeAssetsWithCompletion:v3];

    goto LABEL_11;
  }

  if (v3) {
    goto LABEL_9;
  }
LABEL_11:
}

- (BOOL)_okToCheckForOSSoftwareUpdate
{
  if (OTAImplementationType(self, a2) == 2) {
    return +[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode") ^ 1;
  }
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 shouldScheduleUpdateChecks];

  if ((v4 & 1) == 0)
  {
    id v5 = sub_1000836CC();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OS update checks disabled by pref", v7, 2u);
    }
  }

  return v4 & ~+[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode");
}

- (BOOL)_shouldStopAfterDownloadAndBeforeApplyWithData:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_numberForKey:", PBSOSUpdateServiceKeyTriggerAction));
  id v5 = [v4 unsignedLongLongValue];

  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    unsigned __int8 v7 = objc_msgSend(v3, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRestore, 0);
    LOBYTE(v8) = 0;
    if (v5 != (id)2 && (v7 & 1) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
      unsigned int v10 = [v9 playing];

      int v11 = sub_10014877C();
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
      unsigned int v13 = [v12 isPresenting];

      unsigned int v14 = +[PBAttentionMonitor _isRemainingActiveFor:]( &OBJC_CLASS___PBAttentionMonitor,  "_isRemainingActiveFor:",  1LL);
      int v8 = v10 | v11 | v14 | v13;
      memset(v34, 0, 250);
      id v15 = sub_1000836CC();
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      int v24 = 136316162;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = 3LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      float v18 = "Not stopping";
      if (v8) {
        float v18 = "Stopping";
      }
      __int128 v25 = v18;
      __int16 v26 = 1024;
      unsigned int v27 = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      unsigned int v31 = v14;
      __int16 v32 = 1024;
      unsigned int v33 = v13;
      _os_log_send_and_compose_impl( v17,  0LL,  v34,  250LL,  &_mh_execute_header,  v16,  0LL,  "%s before Apply+Reboot [playing:%{BOOL}d ARC:%{BOOL}d HKV:%{BOOL}d AirPlay:%{BOOL}d]",  &v24,  36);
      id v20 = v19;

      id v21 = sub_1000836CC();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      _os_log_message_persist_impl(v20, 0LL, v22);

      if (v20 != v34) {
        free(v20);
      }
    }
  }

  return v8;
}

- (void)_scheduleOSUpdateCheck
{
  if (-[PBSoftwareUpdateService _okToCheckForOSSoftwareUpdate](self, "_okToCheckForOSSoftwareUpdate"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService osSoftwareUpdateInitialCheckTask](self, "osSoftwareUpdateInitialCheckTask"));
    if (v4)
    {
      [v3 unregisterBackgroundTask:v4];
      -[PBSoftwareUpdateService setOsSoftwareUpdateInitialCheckTask:](self, "setOsSoftwareUpdateInitialCheckTask:", 0LL);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v6 = [v5 shouldAutomaticallyApplyUpdates];

    if (v6)
    {
      __int128 v56 = 0uLL;
      memset(v57, 0, sizeof(v57));
      __int128 v54 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v50 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v48 = 0uLL;
      __int128 v49 = 0uLL;
      __int128 v46 = 0uLL;
      __int128 v47 = 0uLL;
      __int128 v44 = 0uLL;
      __int128 v45 = 0uLL;
      __int128 v43 = 0uLL;
      id v7 = sub_1000836CC();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      LOWORD(v41) = 0;
      _os_log_send_and_compose_impl( v9,  0LL,  &v43,  250LL,  &_mh_execute_header,  v8,  0LL,  "Auto-apply enabled. Not scheduling initial check timer.",  &v41,  2);
      int v11 = v10;

      id v12 = sub_1000836CC();
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      _os_log_message_persist_impl(v11, 0LL, v13);

      if (v11 != &v43) {
        free(v11);
      }
    }

    else
    {
      __int128 v56 = 0uLL;
      memset(v57, 0, sizeof(v57));
      __int128 v54 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v50 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v48 = 0uLL;
      __int128 v49 = 0uLL;
      __int128 v46 = 0uLL;
      __int128 v47 = 0uLL;
      __int128 v44 = 0uLL;
      __int128 v45 = 0uLL;
      __int128 v43 = 0uLL;
      id v14 = sub_1000836CC();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
      int v41 = 134217984;
      v42[0] = 0x4072C00000000000LL;
      _os_log_send_and_compose_impl( v16,  0LL,  &v43,  250LL,  &_mh_execute_header,  v15,  0LL,  "Auto-apply disabled. Scheduling one-shot initial check task in %.2fs.",  COERCE_DOUBLE(&v41));
      float v18 = v17;

      id v19 = sub_1000836CC();
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      _os_log_message_persist_impl(v18, 0LL, v20);

      if (v18 != &v43) {
        free(v18);
      }
      id v21 = -[TVSBackgroundTask initWithType:interval:delay:async:]( objc_alloc(&OBJC_CLASS___TVSBackgroundTask),  "initWithType:interval:delay:async:",  1LL,  0LL,  0.0,  300.0);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10018AB10;
      v40[3] = &unk_1003CFF08;
      v40[4] = self;
      -[TVSBackgroundTask setPerformBlock:](v21, "setPerformBlock:", v40);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBackgroundTaskManager sharedInstance]( &OBJC_CLASS___TVSBackgroundTaskManager,  "sharedInstance"));
      [v22 registerBackgroundTask:v21];

      -[PBSoftwareUpdateService setOsSoftwareUpdateInitialCheckTask:](self, "setOsSoftwareUpdateInitialCheckTask:", v21);
    }

    float v23 = (void *)objc_claimAutoreleasedReturnValue( -[PBSoftwareUpdateService osSoftwareUpdatePeriodicCheckTask]( self,  "osSoftwareUpdatePeriodicCheckTask"));

    if (v23)
    {
      [v3 unregisterBackgroundTask:v23];
      -[PBSoftwareUpdateService setOsSoftwareUpdatePeriodicCheckTask:]( self,  "setOsSoftwareUpdatePeriodicCheckTask:",  0LL);
    }

    if (v6)
    {
      -[PBSoftwareUpdateService _scheduleOSUpdateTimerForNextDarkWake](self, "_scheduleOSUpdateTimerForNextDarkWake");
    }

    else
    {
      int v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      [v24 periodicCheckInterval];
      double v26 = v25;

      uint32_t v27 = arc4random_uniform(v26);
      __int128 v56 = 0u;
      memset(v57, 0, sizeof(v57));
      if (v27 <= 0x258) {
        unsigned int v28 = 600;
      }
      else {
        unsigned int v28 = v27;
      }
      __int128 v54 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v50 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v48 = 0uLL;
      __int128 v49 = 0uLL;
      __int128 v46 = 0uLL;
      __int128 v47 = 0uLL;
      __int128 v44 = 0uLL;
      __int128 v45 = 0uLL;
      __int128 v43 = 0uLL;
      id v29 = sub_1000836CC();
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      int v41 = 67109376;
      LODWORD(v42[0]) = v28;
      WORD2(v42[0]) = 2048;
      *(double *)((char *)v42 + 6) = v26;
      LODWORD(v38) = 18;
      _os_log_send_and_compose_impl( v31,  0LL,  &v43,  250LL,  &_mh_execute_header,  v30,  0LL,  "Scheduling repeating check task (delay:%us period:%.2fs).",  &v41,  v38);
      unsigned int v33 = v32;

      id v34 = sub_1000836CC();
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      _os_log_message_persist_impl(v33, 0LL, v35);

      if (v33 != &v43) {
        free(v33);
      }
      __int128 v36 = -[TVSBackgroundTask initWithType:interval:delay:async:]( objc_alloc(&OBJC_CLASS___TVSBackgroundTask),  "initWithType:interval:delay:async:",  1LL,  0LL,  v26,  (double)v28);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10018AC7C;
      v39[3] = &unk_1003CFF08;
      v39[4] = self;
      -[TVSBackgroundTask setPerformBlock:](v36, "setPerformBlock:", v39);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBackgroundTaskManager sharedInstance]( &OBJC_CLASS___TVSBackgroundTaskManager,  "sharedInstance"));
      [v37 registerBackgroundTask:v36];

      -[PBSoftwareUpdateService setOsSoftwareUpdatePeriodicCheckTask:]( self,  "setOsSoftwareUpdatePeriodicCheckTask:",  v36);
    }

    -[PBSoftwareUpdateService _scheduleOSUpdateCheckForExpiredDelay](self, "_scheduleOSUpdateCheckForExpiredDelay");
  }

- (void)_scheduleOSUpdateOnSleepCheck
{
  if (-[PBSoftwareUpdateService _okToCheckForOSSoftwareUpdate](self, "_okToCheckForOSSoftwareUpdate"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v4 = [v3 shouldAutomaticallyApplyUpdates];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v6 = [v5 isSleepNever];

      if (v6)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService darkWakeTimer](self, "darkWakeTimer"));

        if (v7)
        {
          __int128 v41 = 0u;
          memset(v42, 0, sizeof(v42));
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v28 = 0u;
          id v8 = sub_1000836CC();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v10 = 3LL;
          }
          else {
            uint64_t v10 = 2LL;
          }
          LOWORD(v27[0]) = 0;
          _os_log_send_and_compose_impl( v10,  0LL,  &v28,  250LL,  &_mh_execute_header,  v9,  0LL,  "Skipping OS check on sleep: sleep set to Never and dark wake timer present.",  v27,  2,  v27[0]);
LABEL_13:
          id v14 = v11;

          id v15 = sub_1000836CC();
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          _os_log_message_persist_impl(v14, 0LL, v16);

          if (v14 != &v28) {
            free(v14);
          }
          return;
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService darkWakeTimer](self, "darkWakeTimer"));

        if (!v17)
        {
          __int128 v41 = 0u;
          memset(v42, 0, sizeof(v42));
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v28 = 0u;
          id v18 = sub_1000836CC();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
          LOWORD(v27[0]) = 0;
          _os_log_send_and_compose_impl( v20,  0LL,  &v28,  250LL,  &_mh_execute_header,  v19,  16LL,  "No dark wake timer but we are set to never sleep. Scheduling a new dark wake timer.",  v27,  2);
          uint64_t v22 = v21;

          id v23 = sub_1000836CC();
          int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          _os_log_message_persist_impl(v22, 16LL, v24);

          if (v22 != &v28) {
            free(v22);
          }
        }
      }

      -[PBSoftwareUpdateService _cancelOSUpdateDarkWakeTimer](self, "_cancelOSUpdateDarkWakeTimer");
      double v25 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      [v25 sleepCheckDelay];
      double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

      -[PBSoftwareUpdateService _scheduleOSUpdateDarkWakeAt:](self, "_scheduleOSUpdateDarkWakeAt:", v26);
      return;
    }

    __int128 v41 = 0u;
    memset(v42, 0, sizeof(v42));
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v28 = 0u;
    id v12 = sub_1000836CC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = 3LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    LOWORD(v27[0]) = 0;
    _os_log_send_and_compose_impl( v13,  0LL,  &v28,  250LL,  &_mh_execute_header,  v9,  0LL,  "Skipping OS check on sleep: auto-apply not enabled.",  v27,  2,  v27[0]);
    goto LABEL_13;
  }

- (void)_scheduleOSUpdateTimerForNextDarkWake
{
  if ((+[NSDate tvs_networkTimeIsApproximatelyCorrect]( &OBJC_CLASS___NSDate,  "tvs_networkTimeIsApproximatelyCorrect") & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 components:30 fromDate:v4]);

    [v5 setHour:2];
    [v5 setMinute:arc4random() % 0x1E];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dateFromComponents:v5]);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setDay:](v7, "setDay:", 3LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingComponents:v7 toDate:v6 options:0]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    [v9 periodicCheckInterval];
    double v11 = v10;

    if (v11 > 0.0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v11));

      id v8 = (void *)v12;
    }

    -[PBSoftwareUpdateService _scheduleOSUpdateDarkWakeAt:](self, "_scheduleOSUpdateDarkWakeAt:", v8);
  }

  else
  {
    memset(v21, 0, 250);
    id v13 = sub_1000836CC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      uint64_t v15 = 3LL;
    }
    else {
      uint64_t v15 = 2LL;
    }
    v20[0] = 0;
    _os_log_send_and_compose_impl( v15,  0LL,  v21,  250LL,  &_mh_execute_header,  v14,  16LL,  "Not scheduling dark wake: bad system time.",  v20,  2);
    uint64_t v17 = v16;

    id v18 = sub_1000836CC();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    _os_log_message_persist_impl(v17, 16LL, v19);

    if (v17 != v21) {
      free(v17);
    }
  }

- (void)_cancelOSUpdateDarkWakeTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService darkWakeTimer](self, "darkWakeTimer"));
  unsigned int v4 = v3;
  if (v3 && [v3 isValid])
  {
    [v4 invalidate];
    -[PBSoftwareUpdateService setDarkWakeTimer:](self, "setDarkWakeTimer:", 0LL);
  }
}

- (void)_scheduleOSUpdateDarkWakeAt:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v7 = [v6 powerState];

  id v8 = -[PCSimpleTimer initWithFireDate:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCSimpleTimer),  "initWithFireDate:serviceIdentifier:target:selector:userInfo:",  v4,  @"AppleTV.SWU.CheckTimer",  self,  "_osUpdateDarkWakeTimerFired:",  0LL);
  memset(v25, 0, 250);
  id v9 = sub_1000836CC();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionWithLocale:v5]);

  id v13 = @"no";
  int v19 = 138543874;
  uint64_t v20 = v12;
  __int16 v21 = 2114;
  if (v7 == (id)3) {
    id v13 = @"yes";
  }
  uint64_t v22 = v8;
  __int16 v23 = 2114;
  int v24 = v13;
  _os_log_send_and_compose_impl( v11,  0LL,  v25,  250LL,  &_mh_execute_header,  v10,  0LL,  "scheduling timer-based check at %{public}@ [%{public}@]. (sleeping: %{public}@)",  &v19,  32);
  uint64_t v15 = v14;

  id v16 = sub_1000836CC();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  _os_log_message_persist_impl(v15, 0LL, v17);

  if (v15 != v25) {
    free(v15);
  }
  -[PBSoftwareUpdateService setDarkWakeTimer:](self, "setDarkWakeTimer:", v8);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  -[PCSimpleTimer scheduleInRunLoop:](v8, "scheduleInRunLoop:", v18);
}

- (void)_osUpdateDarkWakeTimerFired:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService vendorBagRefetchTimeoutTimer](self, "vendorBagRefetchTimeoutTimer"));
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    -[PBSoftwareUpdateService setVendorBagRefetchTimeoutTimer:](self, "setVendorBagRefetchTimeoutTimer:", 0LL);
  }

  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService darkWakeTimer](self, "darkWakeTimer"));
  if (v7 == v4)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    id v18 = [v17 powerState];

    __int128 v52 = 0u;
    memset(v53, 0, sizeof(v53));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    id v19 = sub_1000836CC();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    uint64_t v22 = @"yes";
    if (v18 != (id)3) {
      uint64_t v22 = @"no";
    }
    int v35 = 138543618;
    __int128 v36 = v4;
    __int16 v37 = 2112;
    __int128 v38 = v22;
    _os_log_send_and_compose_impl( v21,  0LL,  &v39,  250LL,  &_mh_execute_header,  v20,  0LL,  "Dark wake check timer [%{public}@] fired. (sleeping: %@)",  &v35,  22);
    int v24 = v23;

    id v25 = sub_1000836CC();
    double v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    _os_log_message_persist_impl(v24, 0LL, v26);

    if (v24 != &v39) {
      free(v24);
    }
    if (v18 == (id)3) {
      +[PBDataReportingService incrementOccurrenceCountForAction:]( &OBJC_CLASS___PBDataReportingService,  "incrementOccurrenceCountForAction:",  29LL);
    }
    -[PBSoftwareUpdateService setDarkWakeTimer:](self, "setDarkWakeTimer:", 0LL);
    uint32_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v28 = [v27 shouldAutomaticallyApplyUpdates];

    if (v28)
    {
      -[PBSoftwareUpdateService _reloadVendorBag](self, "_reloadVendorBag");
      goto LABEL_25;
    }

    __int128 v52 = 0u;
    memset(v53, 0, sizeof(v53));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    id v29 = sub_1000836CC();
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v31 = 3LL;
    }
    else {
      uint64_t v31 = 2LL;
    }
    LOWORD(v35) = 0;
    LODWORD(v34) = 2;
    _os_log_send_and_compose_impl( v31,  0LL,  &v39,  250LL,  &_mh_execute_header,  v30,  0LL,  "Ignoring timer check: auto-apply disabled.",  &v35,  v34);
    uint64_t v12 = v32;

    id v33 = sub_1000836CC();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v15 = v12;
    uint64_t v16 = 0LL;
  }

  else
  {
    __int128 v52 = 0u;
    memset(v53, 0, sizeof(v53));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    id v8 = sub_1000836CC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    int v35 = 138543618;
    __int128 v36 = v4;
    __int16 v37 = 2114;
    __int128 v38 = v7;
    _os_log_send_and_compose_impl( v10,  0LL,  &v39,  250LL,  &_mh_execute_header,  v9,  16LL,  "Ignoring timer %{public}@ != dark timer %{public}@",  &v35,  22);
    uint64_t v12 = v11;

    id v13 = sub_1000836CC();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = v12;
    uint64_t v16 = 16LL;
  }

  _os_log_message_persist_impl(v15, v16, v14);

  if (v12 != &v39) {
    free(v12);
  }
LABEL_25:
}

- (void)_scheduleOSUpdateCheckForExpiredDelay
{
  if ((+[PBSSystemStatus isInternetAvailable](&OBJC_CLASS___PBSSystemStatus, "isInternetAvailable") & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService updateDelayExpirationTimer](self, "updateDelayExpirationTimer"));
    id v4 = v3;
    if (v3 && [v3 isValid])
    {
      [v4 invalidate];
      -[PBSoftwareUpdateService setUpdateDelayExpirationTimer:](self, "setUpdateDelayExpirationTimer:", 0LL);
    }

    objc_initWeak(location, self);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10018BAF0;
    v7[3] = &unk_1003DA928;
    objc_copyWeak(&v8, location);
    [v5 dateAtWhichDelayedUpdatesExpireWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(location);
  }

  else
  {
    id v6 = sub_1000836CC();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "Not scheduling update delay expiration timer - not connected to the internet.",  (uint8_t *)location,  2u);
    }
  }
}

- (void)_osUpdateDelayedUpdateExpirationTimerFired:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService updateDelayExpirationTimer](self, "updateDelayExpirationTimer"));
  if (v5 == v4)
  {
    id v13 = sub_1000836CC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Delayed update expiration timer [%{public}@] fired.",  buf,  0xCu);
    }

    -[PBSoftwareUpdateService setUpdateDelayExpirationTimer:](self, "setUpdateDelayExpirationTimer:", 0LL);
    -[PBSoftwareUpdateService reallyPerformMDMOSSoftwareUpdateCheck](self, "reallyPerformMDMOSSoftwareUpdateCheck");
  }

  else
  {
    __int128 v32 = 0u;
    memset(v33, 0, sizeof(v33));
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    *(_OWORD *)buf = 0u;
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    int v15 = 138543618;
    id v16 = v4;
    __int16 v17 = 2114;
    id v18 = v5;
    _os_log_send_and_compose_impl( v8,  0LL,  buf,  250LL,  &_mh_execute_header,  v7,  16LL,  "Ignoring timer %{public}@ != delay expiration timer %{public}@",  &v15,  22);
    uint64_t v10 = v9;

    id v11 = sub_1000836CC();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 16LL, v12);

    if (v10 != buf) {
      free(v10);
    }
  }
}

- (void)_scheduleDailyOSUpdateReporting
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService dailyReportingTimer](self, "dailyReportingTimer"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService dailyReportingTimer](self, "dailyReportingTimer"));
    [v4 invalidate];

    -[PBSoftwareUpdateService setDailyReportingTimer:](self, "setDailyReportingTimer:", 0LL);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 components:30 fromDate:v6]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  [v9 dailyReportIntervalOverride];
  double v11 = v10;

  if (v11 == 0.0)
  {
    [v7 setHour:1];
    [v7 setMinute:arc4random() % 0x1E];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromComponents:v7]);
    id v13 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setSecond:](v13, "setSecond:", 86400LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 dateByAddingComponents:v13 toDate:v12 options:0]);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v11));
    __int128 v52 = 0u;
    memset(v53, 0, sizeof(v53));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v39 = 0u;
    id v15 = sub_1000836CC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    int v33 = 134218240;
    double v34 = v11;
    __int16 v35 = 2048;
    __int128 v36 = self;
    _os_log_send_and_compose_impl( v17,  0LL,  &v39,  250LL,  &_mh_execute_header,  v16,  0LL,  "Using override internal %f from defaults [%p]",  COERCE_DOUBLE(&v33),  22);
    id v19 = v18;

    id v20 = sub_1000836CC();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != &v39) {
      free(v19);
    }
  }

  __int128 v22 = -[PCSimpleTimer initWithFireDate:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCSimpleTimer),  "initWithFireDate:serviceIdentifier:target:selector:userInfo:",  v14,  @"com.apple.PineBoard.OSUpdate.daily",  self,  "_dailyOSUpdateReportingTimerFired:",  0LL);
  __int128 v52 = 0u;
  memset(v53, 0, sizeof(v53));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v39 = 0u;
  id v23 = sub_1000836CC();
  __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v25 = 3LL;
  }
  else {
    uint64_t v25 = 2LL;
  }
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v14 descriptionWithLocale:v8]);
  int v33 = 138543874;
  double v34 = *(double *)&v26;
  __int16 v35 = 2048;
  __int128 v36 = self;
  __int16 v37 = 2048;
  __int128 v38 = v22;
  LODWORD(v32) = 32;
  _os_log_send_and_compose_impl( v25,  0LL,  &v39,  250LL,  &_mh_execute_header,  v24,  0LL,  "Scheduling next daily report at %{public}@ [%p -> %p]",  &v33,  v32);
  __int128 v28 = v27;

  id v29 = sub_1000836CC();
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  _os_log_message_persist_impl(v28, 0LL, v30);

  if (v28 != &v39) {
    free(v28);
  }
  -[PBSoftwareUpdateService setDailyReportingTimer:](self, "setDailyReportingTimer:", v22);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  -[PCSimpleTimer scheduleInRunLoop:](v22, "scheduleInRunLoop:", v31);
}

- (void)_dailyOSUpdateReportingTimerFired:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService dailyReportingTimer](self, "dailyReportingTimer"));

  if (v6 != v5)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"timer == [self dailyReportingTimer]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289764(a2, (uint64_t)self);
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x10018C4F0LL);
  }

  memset(v18, 0, 250);
  id v7 = sub_1000836CC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = 3LL;
  }
  else {
    uint64_t v9 = 2LL;
  }
  int v16 = 134217984;
  id v17 = v5;
  _os_log_send_and_compose_impl( v9,  0LL,  v18,  250LL,  &_mh_execute_header,  v8,  0LL,  "Daily report timer fired [%p]",  &v16);
  double v11 = v10;

  id v12 = sub_1000836CC();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  _os_log_message_persist_impl(v11, 0LL, v13);

  if (v11 != v18) {
    free(v11);
  }
  +[PBOSSoftwareUpdateMonitor noteStage:](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "noteStage:", off_10046C3D8[0]);
  -[PBSoftwareUpdateService _scheduleDailyOSUpdateReporting](self, "_scheduleDailyOSUpdateReporting");
  if (+[PBSSystemStatus isInternetAvailable](&OBJC_CLASS___PBSSystemStatus, "isInternetAvailable"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService updateDelayExpirationTimer](self, "updateDelayExpirationTimer"));

    if (!v14) {
      -[PBSoftwareUpdateService _scheduleOSUpdateCheckForExpiredDelay](self, "_scheduleOSUpdateCheckForExpiredDelay");
    }
  }
}

- (void)_reloadVendorBag
{
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Reloading vendor bag to check for disabled auto updates.",  (uint8_t *)&v10,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_postVendorBagReloadContinueAutoApply" name:TVSURLBagDidLoadNotification object:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  [v6 reload];

  id v7 = sub_1000836CC();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = 300LL;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Starting timer for failed bag load (%lds).",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_postVendorBagReloadContinueAutoApply",  0LL,  0LL,  300.0));
  -[PBSoftwareUpdateService setVendorBagRefetchTimeoutTimer:](self, "setVendorBagRefetchTimeoutTimer:", v9);
}

- (void)_postVendorBagReloadContinueAutoApply
{
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Vendor bag reload complete/timed out - continuing.",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService vendorBagRefetchTimeoutTimer](self, "vendorBagRefetchTimeoutTimer"));
  id v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    -[PBSoftwareUpdateService setVendorBagRefetchTimeoutTimer:](self, "setVendorBagRefetchTimeoutTimer:", 0LL);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self name:TVSURLBagDidLoadNotification object:0];
  unsigned int v8 = -[PBSoftwareUpdateService _serverAllowsAutoApplyUpdates](self, "_serverAllowsAutoApplyUpdates");
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v10 = [v9 shouldForceAllowAutoApply];

    if (v10)
    {
      __int128 v81 = 0u;
      memset(v82, 0, sizeof(v82));
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      *(_OWORD *)buf = 0u;
      id v11 = sub_1000836CC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      LOWORD(v66) = 0;
      _os_log_send_and_compose_impl( v13,  0LL,  buf,  250LL,  &_mh_execute_header,  v12,  0LL,  "Forcing auto-apply to YES via default.",  &v66,  2);
      id v15 = v14;

      id v16 = sub_1000836CC();
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      _os_log_message_persist_impl(v15, 0LL, v17);

      if (v15 != buf) {
        free(v15);
      }
      unsigned int v8 = 1;
    }
  }

  id v18 = sub_1000836CC();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = @"disallowed";
    if (v8) {
      id v20 = @"allowed";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Auto-apply updates %@.", buf, 0xCu);
  }

  if (v8)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    [v21 periodicCheckInterval];
    double v23 = v22;

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 lastCheckDate]);

    if (v25
      && (__int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
          [v26 timeIntervalSinceDate:v25],
          double v28 = v27,
          v26,
          v28 < v23))
    {
      __int128 v81 = 0u;
      memset(v82, 0, sizeof(v82));
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      *(_OWORD *)buf = 0u;
      id v29 = sub_1000836CC();
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v32 timeIntervalSinceDate:v25];
      int v66 = 134217984;
      *(void *)v67 = v33;
      _os_log_send_and_compose_impl( v31,  0LL,  buf,  250LL,  &_mh_execute_header,  v30,  0LL,  "Auto-apply check skipped: last checked %2.2fs ago.",  COERCE_DOUBLE(&v66));
      __int16 v35 = v34;

      id v36 = sub_1000836CC();
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      _os_log_message_persist_impl(v35, 0LL, v37);

      if (v35 == buf) {
        goto LABEL_47;
      }
      __int128 v38 = v35;
    }

    else
    {
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
      id v47 = [v46 powerState];

      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      if ([v48 isSleepNever])
      {
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBackgroundTaskManager sharedInstance]( &OBJC_CLASS___TVSBackgroundTaskManager,  "sharedInstance"));
        unsigned int v50 = [v49 tasksEnabledOfType:1];
      }

      else
      {
        unsigned int v50 = 0;
      }

      if (v47 == (id)3 || v50)
      {
        __int128 v81 = 0u;
        memset(v82, 0, sizeof(v82));
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        *(_OWORD *)buf = 0u;
        id v58 = sub_1000836CC();
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v60 = 3LL;
        }
        else {
          uint64_t v60 = 2LL;
        }
        LOWORD(v66) = 0;
        LODWORD(v65) = 2;
        _os_log_send_and_compose_impl( v60,  0LL,  buf,  250LL,  &_mh_execute_header,  v59,  0LL,  "Auto-apply check started: timer",  &v66,  v65);
        v62 = v61;

        id v63 = sub_1000836CC();
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        _os_log_message_persist_impl(v62, 0LL, v64);

        if (v62 != buf) {
          free(v62);
        }
        -[PBSoftwareUpdateService _startOSUpdateCheckForAction:](self, "_startOSUpdateCheckForAction:", 4LL);
        goto LABEL_47;
      }

      __int128 v81 = 0u;
      memset(v82, 0, sizeof(v82));
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      *(_OWORD *)buf = 0u;
      id v51 = sub_1000836CC();
      __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v53 = 3LL;
      }
      else {
        uint64_t v53 = 2LL;
      }
      int v66 = 67109376;
      *(_DWORD *)v67 = 1;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = 1;
      _os_log_send_and_compose_impl( v53,  0LL,  buf,  250LL,  &_mh_execute_header,  v52,  0LL,  "Auto-apply check skipped: device not asleep (%d) or not idle (%d).",  &v66,  14);
      __int128 v55 = v54;

      id v56 = sub_1000836CC();
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      _os_log_message_persist_impl(v55, 0LL, v57);

      if (v55 == buf)
      {
LABEL_47:

        goto LABEL_48;
      }

      __int128 v38 = v55;
    }

    free(v38);
    goto LABEL_47;
  }

  __int128 v81 = 0u;
  memset(v82, 0, sizeof(v82));
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  *(_OWORD *)buf = 0u;
  id v39 = sub_1000836CC();
  __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v41 = 3LL;
  }
  else {
    uint64_t v41 = 2LL;
  }
  LOWORD(v66) = 0;
  LODWORD(v65) = 2;
  _os_log_send_and_compose_impl( v41,  0LL,  buf,  250LL,  &_mh_execute_header,  v40,  0LL,  "Auto-apply check skipped: Server disallowed updates.",  &v66,  v65);
  __int128 v43 = v42;

  id v44 = sub_1000836CC();
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  _os_log_message_persist_impl(v43, 0LL, v45);

  if (v43 != buf) {
    free(v43);
  }
LABEL_48:
  -[PBSoftwareUpdateService _scheduleOSUpdateTimerForNextDarkWake](self, "_scheduleOSUpdateTimerForNextDarkWake");
}

- (BOOL)_serverAllowsAutoApplyUpdates
{
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreFront sharedInstance](&OBJC_CLASS___TVSStoreFront, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 vendorBags]);

  id v4 = [v3 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v61;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v61 != v6) {
        objc_enumerationMutation(v3);
      }
      unsigned int v8 = *(void **)(*((void *)&v60 + 1) + 8 * v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"vendor-gk-8"]);
      unsigned int v10 = v9;
      if (v9)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
        id v59 = 0LL;
        id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v11,  0LL,  0LL,  &v59));
        id v13 = v59;

        if (v13)
        {
          __int128 v79 = 0u;
          memset(v80, 0, sizeof(v80));
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v68 = 0u;
          memset(buf, 0, sizeof(buf));
          id v14 = sub_1000836CC();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          uint64_t v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
          int v65 = 138543362;
          id v66 = v13;
          LODWORD(v53) = 12;
          _os_log_send_and_compose_impl( v16,  0LL,  buf,  250LL,  &_mh_execute_header,  v15,  16LL,  "Failed to deserialize vendor bag %{public}@",  &v65,  v53);
          id v18 = v17;

          id v19 = sub_1000836CC();
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          _os_log_message_persist_impl(v18, 16LL, v20);

          if (v18 != buf) {
            free(v18);
          }
        }
      }

      else
      {
        id v12 = v8;
      }

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_stringForKey:", @"merchant"));
      unsigned __int8 v22 = [v21 isEqualToString:@"itms"];

      if ((v22 & 1) != 0) {
        break;
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v60 objects:v81 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }

    if (!v12) {
      goto LABEL_42;
    }
    double v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemVersion](&OBJC_CLASS___TVSDevice, "systemVersion"));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_arrayForKey:", @"vendor-bag-versions"));
    id v25 = [v24 countByEnumeratingWithState:&v55 objects:v64 count:16];
    id v54 = v24;
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v56;
      while (2)
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v56 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tvs_stringForKey:", @"maximum-version"));
            uint64_t v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tvs_stringForKey:", @"minimum-required-version"));
            uint64_t v33 = (void *)v32;
            double v34 = @"4.2";
            if (v32) {
              double v34 = (__CFString *)v32;
            }
            __int16 v35 = v34;

            unint64_t v36 = (unint64_t)[v31 compare:v23 options:64];
            id v37 = -[__CFString compare:options:](v35, "compare:options:", v23, 64LL);
            if ((v36 & 0x8000000000000000LL) == 0 && (uint64_t)v37 <= 0)
            {
              id v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tvs_dictionaryForKey:", @"metadata"));
              __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tvs_numberForKey:", @"swu-allow-autoapply"));
              unsigned int v42 = [v48 BOOLValue];
              id v49 = sub_1000836CC();
              unsigned int v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                id v51 = @"disallowed";
                *(_DWORD *)buf = 138543874;
                *(void *)&buf[4] = v35;
                if (v42) {
                  id v51 = @"allowed";
                }
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v31;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&buf[24] = v51;
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Bag [%{public}@,%{public}@] matches, metadata %@ auto-apply updates.",  buf,  0x20u);
              }

              __int128 v45 = v54;
              uint64_t v41 = v54;
              goto LABEL_50;
            }

            id v38 = sub_1000836CC();
            id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v35;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Bag [%{public}@,%{public}@] does not meet requirements [%@].",  buf,  0x20u);
            }

            id v24 = v54;
          }

          else
          {
            id v40 = sub_1000836CC();
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v29;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEFAULT,  "Skipped invalid bag: %{public}@",  buf,  0xCu);
            }
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_dictionaryForKey:", @"metadata"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "tvs_numberForKey:", @"swu-allow-autoapply"));
    unsigned int v42 = [v31 BOOLValue];
    id v43 = sub_1000836CC();
    __int16 v35 = (__CFString *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = @"disallowed";
      if (v42) {
        id v44 = @"allowed";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v44;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v35,  OS_LOG_TYPE_DEFAULT,  "Old-style vendor bag metadata %@ auto-apply updates.",  buf,  0xCu);
    }

    __int128 v45 = v54;
LABEL_50:
  }

  else
  {
LABEL_18:

LABEL_42:
    id v46 = sub_1000836CC();
    id v12 = (id)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Failed to load a valid vendor bag.",  buf,  2u);
    }

    LOBYTE(v42) = 0;
  }

  return v42;
}

- (void)_startOSUpdateCheckForAction:(unint64_t)a3
{
  if (-[PBSoftwareUpdateService _okToCheckForOSSoftwareUpdate](self, "_okToCheckForOSSoftwareUpdate"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateScanOptions defaultOptions](&OBJC_CLASS___PBSOSUpdateScanOptions, "defaultOptions"));
    +[PBOSUpdateSwitch startAction:withOptions:completion:]( &OBJC_CLASS___PBOSUpdateSwitch,  "startAction:withOptions:completion:",  a3,  v4,  &stru_1003DA948);
  }

- (void)_currentDownload:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSSoftwareUpdateProcess sharedProcess](&OBJC_CLASS___PBOSSoftwareUpdateProcess, "sharedProcess"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDownload]);
  if (v5 || ([v4 isInitializing] & 1) != 0)
  {
    v3[2](v3, v5, 0LL);
  }

  else
  {
    id v6 = sub_1000836CC();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No download in progress. Checking installed updates.",  buf,  2u);
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10018D69C;
    v9[3] = &unk_1003DA970;
    unsigned int v10 = v3;
    [v8 descriptorForCurrentlyInstalledAssetWithCompletion:v9];
  }
}

- (void)_handlePineBoardPrefsDidChange
{
  if (-[PBSoftwareUpdateService monitoringEnabled](self, "monitoringEnabled"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = [v3 isSleepNever];

    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService darkWakeTimer](self, "darkWakeTimer"));
      if (v5)
      {

        return;
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBSoftwareUpdateService osSoftwareUpdatePeriodicCheckTask]( self,  "osSoftwareUpdatePeriodicCheckTask"));

      if (v13) {
        return;
      }
    }

    __int128 v35 = 0u;
    memset(v36, 0, sizeof(v36));
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    id v14 = sub_1000836CC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = 3LL;
    }
    else {
      uint64_t v16 = 2LL;
    }
    v21[0] = 0;
    _os_log_send_and_compose_impl( v16,  0LL,  &v22,  250LL,  &_mh_execute_header,  v15,  0LL,  "Resetting OS update timer/tasks because sleep timeout changed.",  v21,  2);
    id v18 = v17;

    id v19 = sub_1000836CC();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    _os_log_message_persist_impl(v18, 0LL, v20);

    if (v18 != &v22) {
      free(v18);
    }
    +[PBOSUpdateSwitch scheduleUpdateChecks:](&OBJC_CLASS___PBOSUpdateSwitch, "scheduleUpdateChecks:", 0LL);
  }

  else
  {
    __int128 v35 = 0u;
    memset(v36, 0, sizeof(v36));
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    id v6 = sub_1000836CC();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    v21[0] = 0;
    _os_log_send_and_compose_impl( v8,  0LL,  &v22,  250LL,  &_mh_execute_header,  v7,  0LL,  "Skipping timer reset on PineBoard prefs change because monitoring hasn't started.",  v21,  2);
    unsigned int v10 = v9;

    id v11 = sub_1000836CC();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 0LL, v12);

    if (v10 != &v22) {
      free(v10);
    }
  }

- (void)_handleOSUpdatePrefsDidChange
{
  if (-[PBSoftwareUpdateService monitoringEnabled](self, "monitoringEnabled"))
  {
    __int128 v30 = 0uLL;
    memset(v31, 0, sizeof(v31));
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v20 = 0uLL;
    __int128 v21 = 0uLL;
    __int128 v18 = 0uLL;
    __int128 v19 = 0uLL;
    __int128 v17 = 0uLL;
    id v2 = sub_1000836CC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v4 = 3LL;
    }
    else {
      uint64_t v4 = 2LL;
    }
    v16[0] = 0;
    _os_log_send_and_compose_impl( v4,  0LL,  &v17,  250LL,  &_mh_execute_header,  v3,  0LL,  "Resetting OS update timer/tasks because auto-apply changed.",  v16,  2);
    id v6 = v5;

    id v7 = sub_1000836CC();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    _os_log_message_persist_impl(v6, 0LL, v8);

    if (v6 != &v17) {
      free(v6);
    }
    +[PBOSUpdateSwitch scheduleUpdateChecks:](&OBJC_CLASS___PBOSUpdateSwitch, "scheduleUpdateChecks:", 0LL);
  }

  else
  {
    __int128 v30 = 0uLL;
    memset(v31, 0, sizeof(v31));
    __int128 v28 = 0uLL;
    __int128 v29 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v20 = 0uLL;
    __int128 v21 = 0uLL;
    __int128 v18 = 0uLL;
    __int128 v19 = 0uLL;
    __int128 v17 = 0uLL;
    id v9 = sub_1000836CC();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    v16[0] = 0;
    _os_log_send_and_compose_impl( v11,  0LL,  &v17,  250LL,  &_mh_execute_header,  v10,  0LL,  "Skipping timer reset on osupdate prefs change because monitoring hasn't started.",  v16,  2);
    id v13 = v12;

    id v14 = sub_1000836CC();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    _os_log_message_persist_impl(v13, 0LL, v15);

    if (v13 != &v17) {
      free(v13);
    }
  }

- (void)_handleManagedConfigurationSettingsChangedNotification:(id)a3
{
}

- (id)_versionForUpdate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productVersion]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);

  unsigned int v6 = +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  if ([v4 length])
  {
    id v7 = [v5 length];
    uint64_t v8 = @"OSUpdateVersionInternalWithBuild";
    if (v7)
    {
      id v9 = @"OSUpdateVersionWithBuild";
    }

    else
    {
      uint64_t v8 = @"OSUpdateVersionInternal";
      id v9 = @"OSUpdateVersion";
    }

    if (v6) {
      unsigned int v10 = (__CFString *)v8;
    }
    else {
      unsigned int v10 = (__CFString *)v9;
    }
    id v11 = sub_1001C307C(v10, 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v4, v5));
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (void)_showOSUpdateDownloadAndApplyConfirmationForUpdate:(id)a3 largeUpdate:(BOOL)a4 assetIsDownloaded:(BOOL)a5
{
  id v8 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  unsigned int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018DE10;
  block[3] = &unk_1003DA9D8;
  void block[4] = self;
  id v13 = v8;
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v11 = v8;
  dispatch_async(v10, block);
}

- (void)_showApplyConfirmationDialogIfNeededWithData:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_msgSend(v3, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRestore, 0);
  unsigned int v5 = objc_msgSend(v3, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsManagedAction, 0);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10018E7CC;
  v61[3] = &unk_1003DAA18;
  char v62 = v4;
  __int128 v55 = objc_retainBlock(v61);
  unsigned int v6 = objc_msgSend(v3, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAutoCheck, 0);
  unsigned int v54 = objc_msgSend(v3, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRedownload, 0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned int v8 = [v7 shouldAutomaticallyApplyUpdates];

  id v56 = v3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_numberForKey:", PBSOSUpdateServiceKeyTriggerAction));
  id v10 = [v9 unsignedLongLongValue];

  unsigned int v11 = +[PBOSUpdateSwitch performsBackgroundApply](&OBJC_CLASS___PBOSUpdateSwitch, "performsBackgroundApply");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentApplicationSceneHandle]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientProcessBundleIdentifier]);

  unsigned int v15 = [v14 isEqualToString:@"com.apple.TVSettings"];
  if (!v6 || !v8 || (v5 & 1) != 0)
  {
    if (v4)
    {
      __int128 v78 = 0u;
      memset(v79, 0, sizeof(v79));
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v65 = 0u;
      id v27 = sub_1000836CC();
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v29 = 3LL;
      }
      else {
        uint64_t v29 = 2LL;
      }
      LOWORD(v63) = 0;
      _os_log_send_and_compose_impl( v29,  0LL,  &v65,  250LL,  &_mh_execute_header,  v28,  0LL,  "Restoring; continuing with Apply.",
        &v63,
        2);
      __int128 v31 = v30;

      id v32 = sub_1000836CC();
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      _os_log_message_persist_impl(v31, 0LL, v33);

      __int128 v25 = v55;
      if (v31 == &v65) {
        goto LABEL_19;
      }
    }

    else
    {
      __int128 v25 = v55;
      if (((v54 ^ 1 | v11) & 1) != 0)
      {
        if (v5)
        {
          __int128 v78 = 0u;
          memset(v79, 0, sizeof(v79));
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v65 = 0u;
          id v35 = sub_1000836CC();
          unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v37 = 3LL;
          }
          else {
            uint64_t v37 = 2LL;
          }
          LOWORD(v63) = 0;
          _os_log_send_and_compose_impl( v37,  0LL,  &v65,  250LL,  &_mh_execute_header,  v36,  0LL,  "Managed action; continuing with Apply.",
            &v63,
            2);
        }

        else
        {
          if (v10 == (id)2) {
            unsigned int v41 = v15;
          }
          else {
            unsigned int v41 = 0;
          }
          if (v41 != 1)
          {
            __int128 v78 = 0uLL;
            memset(v79, 0, sizeof(v79));
            __int128 v76 = 0uLL;
            __int128 v77 = 0uLL;
            __int128 v74 = 0uLL;
            __int128 v75 = 0uLL;
            __int128 v72 = 0uLL;
            __int128 v73 = 0uLL;
            __int128 v70 = 0uLL;
            __int128 v71 = 0uLL;
            __int128 v68 = 0uLL;
            __int128 v69 = 0uLL;
            __int128 v66 = 0uLL;
            __int128 v67 = 0uLL;
            __int128 v65 = 0uLL;
            id v46 = sub_1000836CC();
            id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v48 = 3LL;
            }
            else {
              uint64_t v48 = 2LL;
            }
            LOWORD(v63) = 0;
            _os_log_send_and_compose_impl( v48,  0LL,  &v65,  250LL,  &_mh_execute_header,  v47,  0LL,  "Prompting for apply before continuing.",  &v63,  2);
            unsigned int v50 = v49;

            id v51 = sub_1000836CC();
            __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
            _os_log_message_persist_impl(v50, 0LL, v52);

            if (v50 != &v65) {
              free(v50);
            }
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472LL;
            v59[2] = sub_10018EB80;
            v59[3] = &unk_1003CFF30;
            __int128 v34 = (id *)&v60;
            __int128 v60 = v55;
            __int128 v24 = v56;
            -[PBSoftwareUpdateService _promptForApplyConfirmationWithData:thenDo:]( self,  "_promptForApplyConfirmationWithData:thenDo:",  v56,  v59);
            __int128 v26 = v14;
            goto LABEL_21;
          }

          __int128 v78 = 0uLL;
          memset(v79, 0, sizeof(v79));
          __int128 v76 = 0uLL;
          __int128 v77 = 0uLL;
          __int128 v74 = 0uLL;
          __int128 v75 = 0uLL;
          __int128 v72 = 0uLL;
          __int128 v73 = 0uLL;
          __int128 v70 = 0uLL;
          __int128 v71 = 0uLL;
          __int128 v68 = 0uLL;
          __int128 v69 = 0uLL;
          __int128 v66 = 0uLL;
          __int128 v67 = 0uLL;
          __int128 v65 = 0uLL;
          id v42 = sub_1000836CC();
          unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v43 = 3LL;
          }
          else {
            uint64_t v43 = 2LL;
          }
          LOWORD(v63) = 0;
          _os_log_send_and_compose_impl( v43,  0LL,  &v65,  250LL,  &_mh_execute_header,  v36,  0LL,  "User confirmed update, in Settings; continuing with Apply.",
            &v63,
            2);
        }
      }

      else
      {
        __int128 v78 = 0u;
        memset(v79, 0, sizeof(v79));
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v65 = 0u;
        id v39 = sub_1000836CC();
        unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v40 = 3LL;
        }
        else {
          uint64_t v40 = 2LL;
        }
        LOWORD(v63) = 0;
        _os_log_send_and_compose_impl( v40,  0LL,  &v65,  250LL,  &_mh_execute_header,  v36,  0LL,  "Redownloading update; continuing with Apply.",
          &v63,
          2);
      }

      __int128 v31 = v38;

      id v44 = sub_1000836CC();
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      _os_log_message_persist_impl(v31, 0LL, v45);

      if (v31 == &v65) {
        goto LABEL_19;
      }
    }

    free(v31);
LABEL_19:
    __int128 v24 = v56;
    __int128 v26 = v14;
LABEL_20:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018EB9C;
    block[3] = &unk_1003D0110;
    __int128 v34 = &v58;
    id v58 = v25;
    dispatch_async(&_dispatch_main_q, block);
LABEL_21:

    goto LABEL_22;
  }

  __int128 v78 = 0u;
  memset(v79, 0, sizeof(v79));
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v65 = 0u;
  id v16 = sub_1000836CC();
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v18 = 3LL;
  }
  else {
    uint64_t v18 = 2LL;
  }
  __int128 v19 = "";
  if (v11) {
    __int128 v19 = "relying on DAS so not ";
  }
  int v63 = 136315138;
  v64 = v19;
  _os_log_send_and_compose_impl( v18,  0LL,  &v65,  250LL,  &_mh_execute_header,  v17,  0LL,  "Auto-apply updates set; %scontinuing with Apply.",
    (const char *)&v63);
  __int128 v21 = v20;

  id v22 = sub_1000836CC();
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  _os_log_message_persist_impl(v21, 0LL, v23);

  if (v21 != &v65) {
    free(v21);
  }
  __int128 v25 = v55;
  __int128 v24 = v56;
  __int128 v26 = v14;
  if ((v11 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_22:
}

- (void)_promptForApplyConfirmationWithData:(id)a3 thenDo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018EC7C;
  block[3] = &unk_1003D2F08;
  id v13 = v6;
  BOOL v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_showOSUpdateError:(id)a3 inDomain:(id)a4 description:(id)a5 underlyingError:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  BOOL v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_10018F1A4;
  v19[3] = &unk_1003D1998;
  id v20 = v12;
  id v21 = v10;
  id v22 = v9;
  id v23 = v11;
  id v15 = v11;
  id v16 = v9;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, v19);
}

- (void)_showOSUpdateUpToDateDialog:(BOOL)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018F6E0;
  block[3] = &unk_1003D3530;
  BOOL v7 = a3;
  dispatch_async(v5, block);
}

- (void)_presentModalUpdateScreen
{
  if (!+[PBOSUpdateSwitch performsBackgroundApply](&OBJC_CLASS___PBOSUpdateSwitch, "performsBackgroundApply")
    || !-[PBSoftwareUpdateService isPresenting](self, "isPresenting"))
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018F8E0;
    block[3] = &unk_1003D0418;
    objc_copyWeak(&v4, &location);
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }

- (void)_presentWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  id v6 = (objc_class *)objc_opt_class(self);
  BOOL v7 = NSStringFromClass(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v5, "setIdentifier:", v8);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v5, "setAnimated:", 0LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018FA74;
  v12[3] = &unk_1003D2108;
  v12[4] = self;
  id v9 = -[PBBlockSystemOverlayUIProvider initWithBlock:]( objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider),  "initWithBlock:",  v12);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v5, "setProvider:", v9);

  overlayController = self->_overlayController;
  id v11 = -[PBMutableSystemOverlayPresentationRequest copy](v5, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v11,  v4);
}

- (void)_dismiss
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v3));
    [v4 setAnimated:0];
    objc_initWeak(&location, self);
    overlayController = self->_overlayController;
    id v6 = [v4 copy];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10018FC00;
    v7[3] = &unk_1003D1228;
    objc_copyWeak(&v8, &location);
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v6,  v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_didFinishLegacyCheckWithData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRestore, 0);
  id v6 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAlreadyDownloaded, 0);
  unsigned __int8 v7 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsManagedAction, 0);
  if (v5)
  {
    __int128 v45 = 0uLL;
    memset(v46, 0, sizeof(v46));
    __int128 v43 = 0uLL;
    __int128 v44 = 0uLL;
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    __int128 v39 = 0uLL;
    __int128 v40 = 0uLL;
    __int128 v37 = 0uLL;
    __int128 v38 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v34 = 0uLL;
    __int128 v32 = 0uLL;
    id v8 = sub_1000836CC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    v31[0] = 0;
    _os_log_send_and_compose_impl( v10,  0LL,  &v32,  250LL,  &_mh_execute_header,  v9,  0LL,  "Update found for restore - continuing with download",  v31,  2);
    id v12 = v11;

    id v13 = sub_1000836CC();
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _os_log_message_persist_impl(v12, 0LL, v14);

    if (v12 != &v32) {
      free(v12);
    }
    dispatch_async(&_dispatch_main_q, &stru_1003DAA38);
  }

  else if ((v7 & 1) != 0)
  {
    __int128 v45 = 0uLL;
    memset(v46, 0, sizeof(v46));
    __int128 v43 = 0uLL;
    __int128 v44 = 0uLL;
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    __int128 v39 = 0uLL;
    __int128 v40 = 0uLL;
    __int128 v37 = 0uLL;
    __int128 v38 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v34 = 0uLL;
    __int128 v32 = 0uLL;
    id v15 = sub_1000836CC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    v31[0] = 0;
    _os_log_send_and_compose_impl( v17,  0LL,  &v32,  250LL,  &_mh_execute_header,  v16,  0LL,  "Update found for managed action - operation complete",  v31,  2);
    __int128 v19 = v18;

    id v20 = sub_1000836CC();
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != &v32) {
      free(v19);
    }
  }

  else
  {
    __int128 v45 = 0uLL;
    memset(v46, 0, sizeof(v46));
    __int128 v43 = 0uLL;
    __int128 v44 = 0uLL;
    __int128 v41 = 0uLL;
    __int128 v42 = 0uLL;
    __int128 v39 = 0uLL;
    __int128 v40 = 0uLL;
    __int128 v37 = 0uLL;
    __int128 v38 = 0uLL;
    __int128 v35 = 0uLL;
    __int128 v36 = 0uLL;
    __int128 v33 = 0uLL;
    __int128 v34 = 0uLL;
    __int128 v32 = 0uLL;
    id v22 = sub_1000836CC();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = 3LL;
    }
    else {
      uint64_t v24 = 2LL;
    }
    v31[0] = 0;
    _os_log_send_and_compose_impl( v24,  0LL,  &v32,  250LL,  &_mh_execute_header,  v23,  0LL,  "Update found for non-managed action - prompting",  v31,  2);
    __int128 v26 = v25;

    id v27 = sub_1000836CC();
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    _os_log_message_persist_impl(v26, 0LL, v28);

    if (v26 != &v32) {
      free(v26);
    }
    id v29 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsLargeUpdate, 0);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:PBSOSUpdateServiceKeyAvailableUpdate]);
    -[PBSoftwareUpdateService _showOSUpdateDownloadAndApplyConfirmationForUpdate:largeUpdate:assetIsDownloaded:]( self,  "_showOSUpdateDownloadAndApplyConfirmationForUpdate:largeUpdate:assetIsDownloaded:",  v30,  v29,  v6);
  }
}

- (void)_didFinishTvOSUCheckWithData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRestore, 0);
  id v6 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAlreadyDownloaded, 0);
  unsigned __int8 v7 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsManagedAction, 0);
  id v8 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsLargeUpdate, 0);
  unsigned int v9 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsPrepared, 0);
  unsigned int v10 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAutoCheck, 0);
  if (v5)
  {
    __int128 v51 = 0u;
    memset(v52, 0, sizeof(v52));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    id v11 = sub_1000836CC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = 3LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    LOWORD(v36) = 0;
    _os_log_send_and_compose_impl( v13,  0LL,  &v38,  250LL,  &_mh_execute_header,  v12,  0LL,  "Update found for restore - tvOSU should continue automatically",  &v36,  2);
    id v15 = v14;

    id v16 = sub_1000836CC();
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _os_log_message_persist_impl(v15, 0LL, v17);

    if (v15 == &v38) {
      goto LABEL_22;
    }
LABEL_12:
    free(v15);
    goto LABEL_22;
  }

  if ((v7 & 1) != 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_numberForKey:", PBSOSUpdateServiceKeyTriggerAction));
    id v19 = [v18 unsignedLongLongValue];

    __int128 v51 = 0u;
    memset(v52, 0, sizeof(v52));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    id v20 = sub_1000836CC();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    int v36 = 134217984;
    id v37 = v19;
    _os_log_send_and_compose_impl( v22,  0LL,  &v38,  250LL,  &_mh_execute_header,  v21,  0LL,  "Update found for managed action %ld. Not continuing with download",  &v36);
    id v15 = v23;

    id v24 = sub_1000836CC();
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    _os_log_message_persist_impl(v15, 0LL, v25);

    if (v15 != &v38) {
      goto LABEL_12;
    }
  }

  else
  {
    unsigned int v26 = v10;
    unsigned int v27 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyDidConfirmDownload, 0);
    __int128 v51 = 0u;
    memset(v52, 0, sizeof(v52));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    id v28 = sub_1000836CC();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v30 = 3LL;
    }
    else {
      uint64_t v30 = 2LL;
    }
    int v36 = 67109120;
    LODWORD(v37) = v27;
    _os_log_send_and_compose_impl( v30,  0LL,  &v38,  250LL,  &_mh_execute_header,  v29,  0LL,  "Update found for non-managed action. confirmed:%{BOOL}d",  &v36,  8);
    __int128 v32 = v31;

    id v33 = sub_1000836CC();
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    _os_log_message_persist_impl(v32, 0LL, v34);

    if (v32 != &v38) {
      free(v32);
    }
    if (((v9 ^ 1 | v26) & 1) != 0)
    {
      if ((v27 & 1) == 0)
      {
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:PBSOSUpdateServiceKeyAvailableUpdate]);
        -[PBSoftwareUpdateService _showOSUpdateDownloadAndApplyConfirmationForUpdate:largeUpdate:assetIsDownloaded:]( self,  "_showOSUpdateDownloadAndApplyConfirmationForUpdate:largeUpdate:assetIsDownloaded:",  v35,  v8,  v6);
      }
    }

    else
    {
      -[PBSoftwareUpdateService _showApplyConfirmationDialogIfNeededWithData:]( self,  "_showApplyConfirmationDialogIfNeededWithData:",  v4);
    }
  }

- (id)singleLineDescriptionFor:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  unsigned int v10 = sub_1001904AC;
  id v11 = sub_1001904BC;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001904D4;
  v6[3] = &unk_1003D9900;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)powerManagerAllowSystemToSleep:(id)a3
{
  return !-[PBSoftwareUpdateService isPresenting](self, "isPresenting", a3);
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  unsigned int v5 = (void (**)(void))a5;
  +[PBOSUpdateSwitch scheduleUpdateChecks:](&OBJC_CLASS___PBOSUpdateSwitch, "scheduleUpdateChecks:", 1LL);
  v5[2](v5);
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v6 = (void (**)(void))a5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned int v8 = [v7 shouldAutomaticallyApplyUpdates];

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v10 = [v9 isSleepNever];

    if ((v10 & 1) == 0) {
      -[PBSoftwareUpdateService _cancelOSUpdateDarkWakeTimer](self, "_cancelOSUpdateDarkWakeTimer");
    }
    if (+[PBOSUpdateSwitch isRunning](&OBJC_CLASS___PBOSUpdateSwitch, "isRunning")
      && (+[PBOSUpdateSwitch action](&OBJC_CLASS___PBOSUpdateSwitch, "action") & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      +[PBOSUpdateSwitch cancelForReason:](&OBJC_CLASS___PBOSUpdateSwitch, "cancelForReason:", 3LL);
    }
  }

  v6[2](v6);
}

- (void)osUpdateProcessDidStartCheckWithData:(id)a3
{
  id v4 = a3;
  memset(v27, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v25 = 138543362;
  unsigned int v26 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v27,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateCheckStarted with data %{public}@",  &v25,  12);
  unsigned __int8 v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v27) {
    free(v10);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didStartCheckWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }
}

- (void)osUpdateProcessDidFinishCheckWithData:(id)a3
{
  id v4 = a3;
  __int128 v89 = 0u;
  memset(v90, 0, sizeof(v90));
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v76 = 0u;
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v71 = 138543362;
  *(void *)__int128 v72 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  &v76,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateCheckFinished with data %{public}@",  &v71,  12);
  unsigned __int8 v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != &v76) {
    free(v10);
  }
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v68 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v67 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didFinishCheckWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }

    while (v15);
  }

  unsigned int v20 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAutoCheck, 0);
  unsigned int v21 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRedownload, 0);
  HIDWORD(v62) = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsRestore, 0);
  unsigned int v22 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAvailable, 0);
  unsigned __int8 v64 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsManagedAction, 0);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_numberForKey:", PBSOSUpdateServiceKeyDidFailErrorCode));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_stringForKey:", PBSOSUpdateServiceErrorDomain));
  int v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_stringForKey:", PBSOSUpdateServiceKeyDidFailErrorString));
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService osSoftwareUpdateCheckResponse](self, "osSoftwareUpdateCheckResponse"));

  if (v26)
  {
    unsigned int v66 = v21;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:PBSOSUpdateServiceKeyAvailableUpdate]);
    unsigned int v65 = v22;
    if (v25)
    {
      NSErrorUserInfoKey v73 = NSLocalizedDescriptionKey;
      __int128 v74 = v25;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    }

    else
    {
      uint64_t v30 = 0LL;
    }

    __int128 v31 = v25;
    if (v23)
    {
      __int128 v32 = v23;
      id v33 = [v23 integerValue];
      __int128 v34 = v24;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  v33,  v30));
    }

    else
    {
      __int128 v32 = 0LL;
      __int128 v34 = v24;
      __int128 v35 = 0LL;
    }

    id v36 = sub_1000836CC();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_10028991C((uint64_t)v4, v37, v38);
    }

    __int128 v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[PBSoftwareUpdateService osSoftwareUpdateCheckResponse]( self,  "osSoftwareUpdateCheckResponse"));
    ((void (**)(void, void *, void *))v39)[2](v39, v29, v35);

    -[PBSoftwareUpdateService setOsSoftwareUpdateCheckResponse:](self, "setOsSoftwareUpdateCheckResponse:", 0LL);
    id v24 = v34;
    __int128 v23 = v32;
    int v25 = v31;
    unsigned int v22 = v65;
    unsigned int v21 = v66;
  }

  if (((v20 | v21) & 1) != 0)
  {
    __int128 v89 = 0u;
    memset(v90, 0, sizeof(v90));
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v76 = 0u;
    id v40 = sub_1000836CC();
    __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v42 = 3LL;
    }
    else {
      uint64_t v42 = 2LL;
    }
    int v71 = 67109376;
    *(_DWORD *)__int128 v72 = v20;
    *(_WORD *)&v72[4] = 1024;
    *(_DWORD *)&v72[6] = v21;
    LODWORD(v62) = 14;
    _os_log_send_and_compose_impl( v42,  0LL,  &v76,  250LL,  &_mh_execute_header,  v41,  0LL,  "No action: autocheck:%{BOOL}d redownloading:%{BOOL}d",  &v71,  v62);
    __int128 v44 = v43;

    id v45 = sub_1000836CC();
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    _os_log_message_persist_impl(v44, 0LL, v46);

    if (v44 != &v76) {
      free(v44);
    }
  }

  else if (v22)
  {
    if (OTAImplementationType(v27, v28) == 2) {
      -[PBSoftwareUpdateService _didFinishTvOSUCheckWithData:](self, "_didFinishTvOSUCheckWithData:", v4);
    }
    else {
      -[PBSoftwareUpdateService _didFinishLegacyCheckWithData:](self, "_didFinishLegacyCheckWithData:", v4);
    }
  }

  else if ((v64 & 1) == 0)
  {
    if (v23)
    {
      __int128 v89 = 0uLL;
      memset(v90, 0, sizeof(v90));
      __int128 v87 = 0uLL;
      __int128 v88 = 0uLL;
      __int128 v85 = 0uLL;
      __int128 v86 = 0uLL;
      __int128 v83 = 0uLL;
      __int128 v84 = 0uLL;
      __int128 v81 = 0uLL;
      __int128 v82 = 0uLL;
      __int128 v79 = 0uLL;
      __int128 v80 = 0uLL;
      __int128 v77 = 0uLL;
      __int128 v78 = 0uLL;
      __int128 v76 = 0uLL;
      id v47 = sub_1000836CC();
      __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v49 = 3LL;
      }
      else {
        uint64_t v49 = 2LL;
      }
      int v71 = 138543362;
      *(void *)__int128 v72 = v23;
      LODWORD(v62) = 12;
      _os_log_send_and_compose_impl( v49,  0LL,  &v76,  250LL,  &_mh_execute_header,  v48,  0LL,  "No update available due to error %{public}@",  &v71,  v62);
      __int128 v51 = v50;

      id v52 = sub_1000836CC();
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      _os_log_message_persist_impl(v51, 0LL, v53);

      if (v51 != &v76) {
        free(v51);
      }
      unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_numberForKey:", PBSOSUpdateServiceKeyDidFailUnderlyingErrorCode));
      -[PBSoftwareUpdateService _showOSUpdateError:inDomain:description:underlyingError:]( self,  "_showOSUpdateError:inDomain:description:underlyingError:",  v23,  v24,  v25,  v54);
    }

    else
    {
      __int128 v89 = 0uLL;
      memset(v90, 0, sizeof(v90));
      __int128 v87 = 0uLL;
      __int128 v88 = 0uLL;
      __int128 v85 = 0uLL;
      __int128 v86 = 0uLL;
      __int128 v83 = 0uLL;
      __int128 v84 = 0uLL;
      __int128 v81 = 0uLL;
      __int128 v82 = 0uLL;
      __int128 v79 = 0uLL;
      __int128 v80 = 0uLL;
      __int128 v77 = 0uLL;
      __int128 v78 = 0uLL;
      __int128 v76 = 0uLL;
      id v55 = sub_1000836CC();
      id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v57 = 3LL;
      }
      else {
        uint64_t v57 = 2LL;
      }
      LOWORD(v71) = 0;
      LODWORD(v62) = 2;
      _os_log_send_and_compose_impl( v57,  0LL,  &v76,  250LL,  &_mh_execute_header,  v56,  0LL,  "No update available",  &v71,  v62);
      id v59 = v58;

      id v60 = sub_1000836CC();
      __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      _os_log_message_persist_impl(v59, 0LL, v61);

      if (v59 != &v76) {
        free(v59);
      }
      -[PBSoftwareUpdateService _showOSUpdateUpToDateDialog:](self, "_showOSUpdateUpToDateDialog:", v63);
    }
  }
}

- (void)osUpdateProcessDidStartDownloadWithData:(id)a3
{
  id v4 = a3;
  memset(v27, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v25 = 138543362;
  unsigned int v26 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v27,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateDownloadStarted with data %{public}@",  &v25,  12);
  unsigned __int8 v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v27) {
    free(v10);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didStartDownloadWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }
}

- (void)osUpdateProcessDidUpdateDownloadProgressWithData:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100289988(self, (uint64_t)v4, v6);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) osUpdateService]);
        uint64_t v13 = v12;
        if (v12) {
          [v12 didUpdateDownloadProgressWithData:v4];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

- (void)osUpdateProcessDidFinishDownloadWithData:(id)a3
{
  id v4 = a3;
  memset(v33, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v31 = 138543362;
  __int128 v32 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v33,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateDownloadFinished with data %{public}@",  &v31,  12);
  uint64_t v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v33) {
    free(v10);
  }
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didFinishDownloadWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  if (objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyDidSucceed, 0))
  {
    if (!-[PBSoftwareUpdateService _shouldStopAfterDownloadAndBeforeApplyWithData:]( self,  "_shouldStopAfterDownloadAndBeforeApplyWithData:",  v4)) {
      -[PBSoftwareUpdateService _showApplyConfirmationDialogIfNeededWithData:]( self,  "_showApplyConfirmationDialogIfNeededWithData:",  v4);
    }
  }

  else
  {
    unsigned __int8 v20 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsAutoCheck, 0);
    unsigned __int8 v21 = objc_msgSend(v4, "tvs_BOOLForKey:defaultValue:", PBSOSUpdateServiceKeyIsManagedAction, 0);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_numberForKey:", PBSOSUpdateServiceKeyDidFailErrorCode));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_stringForKey:", PBSOSUpdateServiceErrorDomain));
    if ((v20 & 1) == 0 && (v21 & 1) == 0 && [v22 integerValue] != (id)3)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_stringForKey:", PBSOSUpdateServiceKeyDidFailErrorString));
      int v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvs_numberForKey:", PBSOSUpdateServiceKeyDidFailUnderlyingErrorCode));
      -[PBSoftwareUpdateService _showOSUpdateError:inDomain:description:underlyingError:]( self,  "_showOSUpdateError:inDomain:description:underlyingError:",  v22,  v23,  v24,  v25);
    }
  }
}

- (void)osUpdateProcessDidStartRedownloadWithData:(id)a3
{
  id v4 = a3;
  memset(v27, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v25 = 138543362;
  __int128 v26 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v27,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateRedownloadStarted with data %{public}@",  &v25,  12);
  uint64_t v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v27) {
    free(v10);
  }
  +[PBSSystemStatus _setUpdatingOS:](&OBJC_CLASS___PBSSystemStatus, "_setUpdatingOS:", 1LL);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didStartRedownloadWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

  -[PBSoftwareUpdateService _presentModalUpdateScreen](self, "_presentModalUpdateScreen");
}

- (void)osUpdateProcessDidStartApplyWithData:(id)a3
{
  id v4 = a3;
  memset(v27, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v25 = 138543362;
  __int128 v26 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v27,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateApplyStarted with data %{public}@",  &v25,  12);
  uint64_t v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v27) {
    free(v10);
  }
  +[PBSSystemStatus _setUpdatingOS:](&OBJC_CLASS___PBSSystemStatus, "_setUpdatingOS:", 1LL);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) osUpdateService]);
        id v19 = v18;
        if (v18) {
          [v18 didStartApplyWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

  -[PBSoftwareUpdateService _presentModalUpdateScreen](self, "_presentModalUpdateScreen");
}

- (void)osUpdateProcessDidUpdateApplyProgressWithData:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
    *(_DWORD *)buf = 138543362;
    id v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "UpdateApplyProgress with data %{public}@",  buf,  0xCu);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v12) osUpdateService]);
        id v14 = v13;
        if (v13) {
          [v13 didUpdateApplyProgressWithData:v4];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  if (!+[PBOSUpdateSwitch performsBackgroundApply](&OBJC_CLASS___PBOSUpdateSwitch, "performsBackgroundApply"))
  {
    objc_initWeak((id *)buf, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100191C4C;
    v15[3] = &unk_1003D0418;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v4;
    dispatch_async(&_dispatch_main_q, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)osUpdateProcessDidFinishApplyWithData:(id)a3
{
  id v4 = a3;
  memset(v31, 0, 250);
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSoftwareUpdateService singleLineDescriptionFor:](self, "singleLineDescriptionFor:", v4));
  int v29 = 138543362;
  uint64_t v30 = v8;
  _os_log_send_and_compose_impl( v7,  0LL,  v31,  250LL,  &_mh_execute_header,  v6,  0LL,  "UpdateApplyFinished with data %{public}@",  &v29,  12);
  id v10 = v9;

  id v11 = sub_1000836CC();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  _os_log_message_persist_impl(v10, 0LL, v12);

  if (v10 != v31) {
    free(v10);
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemService activeConnections](&OBJC_CLASS___PBSystemService, "activeConnections"));
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)i) osUpdateService]);
        __int128 v19 = v18;
        if (v18) {
          [v18 didFinishApplyWithData:v4];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v15);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100191F10;
  block[3] = &unk_1003CFEB8;
  id v22 = v4;
  __int128 v23 = self;
  id v20 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (BOOL)monitoringEnabled
{
  return self->_monitoringEnabled;
}

- (void)setMonitoringEnabled:(BOOL)a3
{
  self->_monitoringEnabled = a3;
}

- (BOOL)precheckingOSUpdateConditions
{
  return self->_precheckingOSUpdateConditions;
}

- (void)setPrecheckingOSUpdateConditions:(BOOL)a3
{
  self->_precheckingOSUpdateConditions = a3;
}

- (TVSBackgroundTask)osSoftwareUpdateInitialCheckTask
{
  return self->_osSoftwareUpdateInitialCheckTask;
}

- (void)setOsSoftwareUpdateInitialCheckTask:(id)a3
{
}

- (TVSBackgroundTask)osSoftwareUpdatePeriodicCheckTask
{
  return self->_osSoftwareUpdatePeriodicCheckTask;
}

- (void)setOsSoftwareUpdatePeriodicCheckTask:(id)a3
{
}

- (PCSimpleTimer)darkWakeTimer
{
  return self->_darkWakeTimer;
}

- (void)setDarkWakeTimer:(id)a3
{
}

- (PCSimpleTimer)updateDelayExpirationTimer
{
  return self->_updateDelayExpirationTimer;
}

- (void)setUpdateDelayExpirationTimer:(id)a3
{
}

- (NSTimer)vendorBagRefetchTimeoutTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_vendorBagRefetchTimeoutTimer);
}

- (void)setVendorBagRefetchTimeoutTimer:(id)a3
{
}

- (PCSimpleTimer)dailyReportingTimer
{
  return self->_dailyReportingTimer;
}

- (void)setDailyReportingTimer:(id)a3
{
}

- (id)osSoftwareUpdateCheckResponse
{
  return self->_osSoftwareUpdateCheckResponse;
}

- (void)setOsSoftwareUpdateCheckResponse:(id)a3
{
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (UIViewController)updateViewController
{
  return self->_updateViewController;
}

- (void).cxx_destruct
{
}

@end