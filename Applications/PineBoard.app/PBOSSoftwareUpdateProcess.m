@interface PBOSSoftwareUpdateProcess
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedProcess;
+ (int64_t)_compareOSVersion:(id)a3 andBuild:(id)a4 withOSVersion:(id)a5 andBuild:(id)a6;
- (BOOL)_goodTimeToDownload;
- (BOOL)_goodTimeToInstallAndReboot;
- (BOOL)_isAppACandidateForOffLoading:(id)a3;
- (BOOL)_isManagedAction;
- (BOOL)_playingExternalARCAudio;
- (BOOL)_showingHKCameras;
- (BOOL)_wasStartedByBackgroundCheck;
- (BOOL)_wasStartedForRestore;
- (BOOL)assetIsLarge;
- (BOOL)configureForAction:(unint64_t)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)downloadAssetWithDiscretionaryPriority;
- (BOOL)isApplyingRecheckedUpdate;
- (BOOL)isCheckingForUpdate;
- (BOOL)isDownloadingUpdate;
- (BOOL)isInitializing;
- (BOOL)isRunning;
- (BOOL)needToCancelMSUOperation;
- (BOOL)sentDownloadFinishedCallback;
- (BOOL)userConfirmedApplyAtCheckTime;
- (MAAsset)asset;
- (MAProgressNotification)lastDownloadProgressNotification;
- (MSUUpdateBrainAssetLoader)brainLoader;
- (NSDate)assetReleaseDate;
- (OS_dispatch_queue)spaceClearingQueue;
- (PBOSSoftwareUpdateProcess)init;
- (PBSOSSoftwareUpdateProcessDelegate)delegate;
- (PBSOSUpdateScanOptions)scanOptions;
- (TVSStateMachine)machine;
- (float)lastMSUPercentCompleted;
- (id)_brainAssetDownloadOptions;
- (id)_downloadProgressPhaseForCurrentState;
- (id)_resultUserInfoWithError:(id)a3;
- (id)_step2ImagePathWithImage:(id)a3;
- (id)_stringForCancelReason:(unint64_t)a3;
- (id)currentDownload;
- (int64_t)_purgeAppsWithBundleIDs:(id)a3 spaceNeeded:(int64_t)a4 error:(id *)a5;
- (int64_t)_purgeManuallySelectedAppsToGetSpaceNeeded:(int64_t)a3;
- (int64_t)_purgeOlderAppsToGetSpaceNeeded:(int64_t)a3;
- (unint64_t)action;
- (unint64_t)deferredAction;
- (unint64_t)state;
- (void)_cancelUpdateDuringApply;
- (void)_cancelUpdateDuringDownload;
- (void)_cancelUpdatePreDownload;
- (void)_clearAssetDownloadSpace;
- (void)_clearBrainDownloadSpace;
- (void)_clearInternalStateOnReturnToIdle;
- (void)_clearPrepareAndApplySpace;
- (void)_clearPrepareAndApplySpaceWithInstallationSize:(unint64_t)a3 andPadding:(unint64_t)a4;
- (void)_clearSpace:(int64_t)a3 withCompletion:(id)a4;
- (void)_continueWithSufficientSpaceFor:(id)a3;
- (void)_downloadAsset;
- (void)_downloadBrain;
- (void)_foundAsset:(id)a3 releaseDate:(id)a4 error:(id)a5;
- (void)_handleAssetDownloadProgress:(id)a3;
- (void)_handleBrainDownloadProgressCallbackWithState:(id)a3 error:(id)a4;
- (void)_performCheck;
- (void)_prepareAndApplyUpdate;
- (void)_prepareAndApplyUpdateThreadedWithImage:(id)a3;
- (void)_processAssetDownloadFailureWithResult:(int64_t)a3;
- (void)_processAssetDownloadSuccess;
- (void)_processBrainDownloadSpaceCheckResultForBrainSize:(int64_t)a3 error:(id)a4;
- (void)_processDownloadSpaceCheckResultForRequiredSpace:(unint64_t)a3 hasSpace:(BOOL)a4 error:(id)a5;
- (void)_processEvent:(id)a3;
- (void)_processPrepareAndApplySpaceCheckResultForRequiredSpace:(unint64_t)a3 andError:(id)a4;
- (void)_purgePreviousAssets;
- (void)_recheckForNewerUpdate;
- (void)_registerHandlers;
- (void)_restoreAllPurgedApps;
- (void)_sendCheckFinishedNotificationForUpdateAvailable:(BOOL)a3 withError:(id)a4;
- (void)_sendCheckStartNotification;
- (void)_storeURLBagLoaded:(id)a3;
- (void)_updateProgressStatus:(id)a3;
- (void)cancelForReason:(unint64_t)a3;
- (void)dealloc;
- (void)purgeAssetsWithCompletion:(id)a3;
- (void)purgeableAssetSpaceWithCompletion:(id)a3;
- (void)resumeAfterDownload;
- (void)resumeAfterUpdateCheck;
- (void)setAction:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAssetDownloadIsDiscretionary:(BOOL)a3;
- (void)setAssetIsLarge:(BOOL)a3;
- (void)setAssetReleaseDate:(id)a3;
- (void)setBrainLoader:(id)a3;
- (void)setDeferredAction:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadAssetWithDiscretionaryPriority:(BOOL)a3;
- (void)setIsApplyingRecheckedUpdate:(BOOL)a3;
- (void)setLastDownloadProgressNotification:(id)a3;
- (void)setLastMSUPercentCompleted:(float)a3;
- (void)setMachine:(id)a3;
- (void)setNeedToCancelMSUOperation:(BOOL)a3;
- (void)setScanOptions:(id)a3;
- (void)setSentDownloadFinishedCallback:(BOOL)a3;
- (void)setSpaceClearingQueue:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUserConfirmedApplyAtCheckTime:(BOOL)a3;
- (void)start;
@end

@implementation PBOSSoftwareUpdateProcess

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003D5D0;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (id)sharedProcess
{
  if (qword_100470110 != -1) {
    dispatch_once(&qword_100470110, &stru_1003D1A28);
  }
  return (id)qword_100470108;
}

- (PBOSSoftwareUpdateProcess)init
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___PBOSSoftwareUpdateProcess;
  v2 = -[PBOSSoftwareUpdateProcess init](&v46, "init");
  v3 = v2;
  if (v2)
  {
    v2->_state = 1LL;
    v4 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:stateChangeHandler:",  @"OSSoftwareUpdate",  @"init",  0LL,  0LL);
    machine = v3->_machine;
    v3->_machine = v4;

    v6 = v3->_machine;
    id v7 = sub_1000836CC();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[TVSStateMachine setLogObject:](v6, "setLogObject:", v8);

    -[TVSStateMachine logUnhandledEvents](v3->_machine, "logUnhandledEvents");
    -[PBOSSoftwareUpdateProcess _registerHandlers](v3, "_registerHandlers");
    -[TVSStateMachine setShouldAcceptEvents:](v3->_machine, "setShouldAcceptEvents:", 1LL);
    v3->_action = 1LL;
    scanOptions = v3->_scanOptions;
    v3->_scanOptions = 0LL;

    v3->_deferredAction = 1LL;
    asset = v3->_asset;
    v3->_asset = 0LL;

    assetReleaseDate = v3->_assetReleaseDate;
    v3->_assetReleaseDate = 0LL;

    brainLoader = v3->_brainLoader;
    v3->_brainLoader = 0LL;

    *(_DWORD *)&v3->_needToCancelMSUOperation = 0x10000;
    v3->_lastMSUPercentCompleted = 0.0;
    lastDownloadProgressNotification = v3->_lastDownloadProgressNotification;
    v3->_lastDownloadProgressNotification = 0LL;

    if (OTAImplementationType() != 2)
    {
      __int128 v59 = 0u;
      memset(v60, 0, sizeof(v60));
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v48 = 0u;
      memset(buf, 0, sizeof(buf));
      id v14 = sub_1000836CC();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v16 = 3LL;
      }
      else {
        uint64_t v16 = 2LL;
      }
      v45[0] = 0;
      v17 = (uint8_t *)_os_log_send_and_compose_impl( v16,  0LL,  buf,  250LL,  &_mh_execute_header,  v15,  0LL,  "------- Legacy Process Start -------",  v45,  2);

      id v18 = sub_1000836CC();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      _os_log_message_persist_impl(v17, 0LL, v19);

      if (v17 != buf) {
        free(v17);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastAttemptedUUID]);
      BOOL v22 = v21 != 0LL;

      id v23 = sub_1000836CC();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v21) {
          v25 = &stru_1003E2910;
        }
        else {
          v25 = @"not ";
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastAttemptedUUID]);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "OS update process starting, %@after update. (UUID %{public}@)",  buf,  0x16u);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
      unsigned int v29 = [v28 isValid];

      id v30 = sub_1000836CC();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
      if (v29)
      {
        if (v32) {
          sub_1002737F0();
        }

        +[PBOSSoftwareUpdateMonitor noteStage:](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "noteStage:", off_10046C3D0[0]);
      }

      else
      {
        if (v32) {
          sub_10027381C();
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v33 addObserver:v3 selector:"_storeURLBagLoaded:" name:TVSURLBagDidLoadNotification object:0];
      }

      dispatch_queue_t v34 = dispatch_queue_create("com.apple.PineBoard.SWU.SpaceClearing", 0LL);
      spaceClearingQueue = v3->_spaceClearingQueue;
      v3->_spaceClearingQueue = (OS_dispatch_queue *)v34;

      v36 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 firstObject]);

      v39 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v38,  1LL);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[TVSCacheDelete sharedInstance](&OBJC_CLASS___TVSCacheDelete, "sharedInstance"));
      [v40 registerCacheAtURL:v39 ofType:3 urgency:3 withCompletion:0];

      objc_initWeak((id *)buf, v3);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003DB10;
      block[3] = &unk_1003D1A50;
      objc_copyWeak(&v43, (id *)buf);
      BOOL v44 = v22;
      dispatch_async(&_dispatch_main_q, block);
      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
    }
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBOSSoftwareUpdateProcess;
  -[PBOSSoftwareUpdateProcess dealloc](&v4, "dealloc");
}

- (BOOL)configureForAction:(unint64_t)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((id)-[PBOSSoftwareUpdateProcess state](self, "state") == (id)2)
  {
    id v9 = sub_1000836CC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 - 2 > 7) {
        v11 = @"N/A";
      }
      else {
        v11 = off_1003D1F28[a3 - 2];
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Configuration for action %{public}@.",  buf,  0xCu);
    }

    -[PBOSSoftwareUpdateProcess setAction:](self, "setAction:", a3);
    -[PBOSSoftwareUpdateProcess setScanOptions:](self, "setScanOptions:", v8);
    BOOL v18 = 1;
  }

  else if ((id)-[PBOSSoftwareUpdateProcess state](self, "state") == (id)1)
  {
    id v12 = sub_1000836CC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 - 2 > 7) {
        id v14 = @"N/A";
      }
      else {
        id v14 = off_1003D1F28[a3 - 2];
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Still initializing. Deferred action %{public}@.",  buf,  0xCu);
    }

    -[PBOSSoftwareUpdateProcess setDeferredAction:](self, "setDeferredAction:", a3);
    BOOL v18 = 1;
    -[PBOSSoftwareUpdateProcess setAction:](self, "setAction:", 1LL);
    -[PBOSSoftwareUpdateProcess setScanOptions:](self, "setScanOptions:", v8);
  }

  else
  {
    unint64_t v15 = -[PBOSSoftwareUpdateProcess state](self, "state");
    if (v15 == 4)
    {
      uint64_t v16 = @"Download";
      uint64_t v17 = 6LL;
    }

    else if (v15 == 3)
    {
      uint64_t v16 = @"Update check";
      uint64_t v17 = 5LL;
    }

    else
    {
      uint64_t v16 = @"Install";
      uint64_t v17 = 7LL;
    }

    __int128 v47 = 0u;
    memset(v48, 0, sizeof(v48));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    *(_OWORD *)buf = 0u;
    id v19 = sub_1000836CC();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    if (a3 - 2 > 7) {
      BOOL v22 = @"N/A";
    }
    else {
      BOOL v22 = off_1003D1F28[a3 - 2];
    }
    int v28 = 138543874;
    unsigned int v29 = v22;
    __int16 v30 = 2114;
    v31 = v16;
    __int16 v32 = 2048;
    unint64_t v33 = -[PBOSSoftwareUpdateProcess state](self, "state");
    id v23 = (uint8_t *)_os_log_send_and_compose_impl( v21,  0LL,  buf,  250LL,  &_mh_execute_header,  v20,  16LL,  "Failed to configure for action %{public}@. %{public}@ already in progress [%lu].",  &v28,  32);

    id v24 = sub_1000836CC();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    _os_log_message_persist_impl(v23, 16LL, v25);

    if (v23 != buf) {
      free(v23);
    }
    if (a5)
    {
      v26 = objc_alloc(&OBJC_CLASS___NSError);
      BOOL v18 = 0;
      *a5 =  -[NSError initWithDomain:code:userInfo:]( v26,  "initWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  v17,  0LL);
    }

    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (void)start
{
  if (qword_100470120 != -1) {
    dispatch_once(&qword_100470120, &stru_1003D1A70);
  }
  if ((id)-[PBOSSoftwareUpdateProcess deferredAction](self, "deferredAction") == (id)1)
  {
    v3 = (void *)qword_100470118;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBOSSoftwareUpdateProcess action](self, "action")));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

    if (v5)
    {
      -[PBOSSoftwareUpdateProcess _processEvent:](self, "_processEvent:", v5);
    }

    else
    {
      __int128 v30 = 0u;
      memset(v31, 0, sizeof(v31));
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
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      *(_OWORD *)buf = 0u;
      id v7 = sub_1000836CC();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      unint64_t v10 = -[PBOSSoftwareUpdateProcess action](self, "action");
      if (v10 - 2 > 7) {
        v11 = @"N/A";
      }
      else {
        v11 = off_1003D1F28[v10 - 2];
      }
      int v15 = 138543362;
      uint64_t v16 = v11;
      id v12 = (uint8_t *)_os_log_send_and_compose_impl( v9,  0LL,  buf,  250LL,  &_mh_execute_header,  v8,  16LL,  "Unrecognized action during start:%{public}@",  &v15,  12);

      id v13 = sub_1000836CC();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      _os_log_message_persist_impl(v12, 16LL, v14);

      if (v12 != buf) {
        free(v12);
      }
    }
  }

  else
  {
    id v6 = sub_1000836CC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = -[PBOSSoftwareUpdateProcess deferredAction](self, "deferredAction");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not starting deferred action %lu", buf, 0xCu);
    }
  }
}

- (BOOL)isInitializing
{
  return (id)-[PBOSSoftwareUpdateProcess state](self, "state") == (id)1;
}

- (BOOL)isCheckingForUpdate
{
  BOOL v3 = -[PBOSSoftwareUpdateProcess isRunning](self, "isRunning");
  if (v3) {
    LOBYTE(v3) = (id)-[PBOSSoftwareUpdateProcess state](self, "state") == (id)3;
  }
  return v3;
}

- (BOOL)isDownloadingUpdate
{
  BOOL v3 = -[PBOSSoftwareUpdateProcess isRunning](self, "isRunning");
  if (v3) {
    LOBYTE(v3) = (id)-[PBOSSoftwareUpdateProcess state](self, "state") == (id)4;
  }
  return v3;
}

- (BOOL)isRunning
{
  return ((id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)1
       || (id)-[PBOSSoftwareUpdateProcess deferredAction](self, "deferredAction") != (id)1)
      && (id)-[PBOSSoftwareUpdateProcess state](self, "state") != (id)2;
}

- (id)currentDownload
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  objc_super v4 = v3;
  if (v3) {
    [v3 refreshState];
  }
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1002738D4();
  }

  if (-[PBOSSoftwareUpdateProcess isDownloadingUpdate](self, "isDownloadingUpdate"))
  {
    if (!v4) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 currentState]);

  if (!v4)
  {
LABEL_12:
    id v10 = sub_1000836CC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100273848();
    }
    id v12 = 0LL;
    goto LABEL_27;
  }

  if (v8 != @"clear-asset-download-space")
  {
    if ([v4 state] == (id)2)
    {
      int v9 = 0;
      goto LABEL_16;
    }

    goto LABEL_12;
  }

- (void)setAssetDownloadIsDiscretionary:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBOSSoftwareUpdateProcess setDownloadAssetWithDiscretionaryPriority:]( self,  "setDownloadAssetWithDiscretionaryPriority:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));

  if (v5)
  {
    id v6 = (void *)objc_opt_new(&OBJC_CLASS___MADownloadConfig);
    [v6 setDiscretionary:v3];
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100273934(v3, v8, v9, v10, v11, v12, v13, v14);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
    [v15 configDownload:v6 completion:&stru_1003D1AB0];
  }

- (void)resumeAfterUpdateCheck
{
}

- (void)resumeAfterDownload
{
}

- (void)cancelForReason:(unint64_t)a3
{
  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _stringForCancelReason:](self, "_stringForCancelReason:", a3));
  int v12 = 138543362;
  uint64_t v13 = v8;
  uint64_t v9 = (_OWORD *)_os_log_send_and_compose_impl( v7,  0LL,  v14,  250LL,  &_mh_execute_header,  v6,  0LL,  "Canceling update, reason: %{public}@",  &v12,  12);

  id v10 = sub_1000836CC();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  _os_log_message_persist_impl(v9, 0LL, v11);

  if (v9 != v14) {
    free(v9);
  }
  -[PBOSSoftwareUpdateProcess _processEvent:](self, "_processEvent:", off_100469208);
}

- (void)purgeableAssetSpaceWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  unint64_t v5 = -[PBOSSoftwareUpdateProcess state](self, "state");
  if (v5 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    [v6 purgeableAssetSpaceWithCompletion:v4];
  }

  else
  {
    unint64_t v7 = v5;
    id v8 = sub_1000836CC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring request for purgeable asset size while performing an update (state:%lu).",  (uint8_t *)&v10,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
    v4[2](v4, v6);
  }
}

- (void)purgeAssetsWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  unint64_t v5 = -[PBOSSoftwareUpdateProcess state](self, "state");
  if (v5 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    [v6 purgeLocalAssetsWithCompletion:v4];
  }

  else
  {
    unint64_t v7 = v5;
    id v8 = sub_1000836CC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to purge assets while performing an update (state:%lu).",  (uint8_t *)&v10,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", 0LL));
    v4[2](v4, v6);
  }
}

- (void)_processEvent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  [v5 postEvent:v4 withContext:0];
}

- (void)_registerHandlers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = sub_10003F83C;
  v92[3] = &unk_1003D1AD8;
  v92[4] = self;
  [v3 registerDefaultHandlerForEvent:off_100469238 withBlock:v92];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_10003FA80;
  v91[3] = &unk_1003D1AD8;
  v91[4] = self;
  [v4 registerDefaultHandlerForEvent:off_1004691F0 withBlock:v91];

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472LL;
  v90[2] = sub_10003FCD8;
  v90[3] = &unk_1003D1AD8;
  v90[4] = self;
  [v5 registerDefaultHandlerForEvent:off_1004691F8 withBlock:v90];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_10003FDCC;
  v89[3] = &unk_1003D1AD8;
  v89[4] = self;
  [v6 registerDefaultHandlerForEvent:off_100469208 withBlock:v89];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_10003FEC0;
  v88[3] = &unk_1003D1AD8;
  v88[4] = self;
  [v7 registerHandlerForEvent:off_100469220 onState:@"init" withBlock:v88];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_10003FF80;
  v87[3] = &unk_1003D1AD8;
  v87[4] = self;
  [v8 registerHandlerForEvent:off_100469228 onState:@"init" withBlock:v87];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_100040050;
  v86[3] = &unk_1003D1AD8;
  v86[4] = self;
  [v9 registerHandlerForEvent:off_100469230 onState:@"purge" withBlock:v86];

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_100040150;
  v85[3] = &unk_1003D1AD8;
  v85[4] = self;
  [v10 registerHandlerForEvent:off_100469238 onState:@"idle" withBlock:v85];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100040288;
  v84[3] = &unk_1003D1AD8;
  v84[4] = self;
  [v11 registerHandlerForEvent:off_1004691F0 onState:@"idle" withBlock:v84];

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_1000403C0;
  v83[3] = &unk_1003D1AD8;
  v83[4] = self;
  [v12 registerHandlerForEvent:off_1004691F8 onState:@"idle" withBlock:v83];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_1000404F8;
  v82[3] = &unk_1003D1AD8;
  v82[4] = self;
  [v13 registerHandlerForEvent:off_100469240 onState:@"autocheck" withBlock:v82];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_10004054C;
  v81[3] = &unk_1003D1AD8;
  v81[4] = self;
  [v14 registerHandlerForEvent:off_100469248 onState:@"autocheck" withBlock:v81];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_1000405A8;
  v80[3] = &unk_1003D1AD8;
  v80[4] = self;
  [v15 registerHandlerForEvent:off_1004691F0 onState:@"autocheck" withBlock:v80];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_1000405CC;
  v79[3] = &unk_1003D1AD8;
  v79[4] = self;
  [v16 registerHandlerForEvent:off_100469250 onState:@"autocheck" withBlock:v79];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_1000407D0;
  v78[3] = &unk_1003D1AD8;
  v78[4] = self;
  [v17 registerHandlerForEvent:off_100469258 onState:@"autocheck" withBlock:v78];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_100040824;
  v77[3] = &unk_1003D1AD8;
  v77[4] = self;
  [v18 registerHandlerForEvent:off_100469208 onState:@"autocheck" withBlock:v77];

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_100040880;
  v76[3] = &unk_1003D1AD8;
  v76[4] = self;
  [v19 registerHandlerForEvent:off_100469240 onState:@"manual-check" withBlock:v76];

  float v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_1000408D4;
  v75[3] = &unk_1003D1AD8;
  v75[4] = self;
  [v20 registerHandlerForEvent:off_100469248 onState:@"manual-check" withBlock:v75];

  float v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_100040930;
  v74[3] = &unk_1003D1AD8;
  v74[4] = self;
  [v21 registerHandlerForEvent:off_100469250 onState:@"manual-check" withBlock:v74];

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_100040A8C;
  v73[3] = &unk_1003D1AD8;
  v73[4] = self;
  [v22 registerHandlerForEvent:off_100469258 onState:@"manual-check" withBlock:v73];

  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_100040AE0;
  v72[3] = &unk_1003D1AD8;
  v72[4] = self;
  [v23 registerHandlerForEvent:off_100469208 onState:@"manual-check" withBlock:v72];

  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_100040B3C;
  v71[3] = &unk_1003D1AD8;
  v71[4] = self;
  [v24 registerHandlerForEvent:off_100469208 onState:@"download-confirm" withBlock:v71];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_100040B74;
  v70[3] = &unk_1003D1AD8;
  v70[4] = self;
  [v25 registerHandlerForEvent:off_100469200 onState:@"download-confirm" withBlock:v70];

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_100040D60;
  v69[3] = &unk_1003D1AD8;
  v69[4] = self;
  [v26 registerHandlerForEvent:off_100469270 onState:@"clear-asset-download-space" withBlock:v69];

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100040DB0;
  v68[3] = &unk_1003D1AD8;
  v68[4] = self;
  [v27 registerHandlerForEvent:off_100469208 onState:@"clear-asset-download-space" withBlock:v68];

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_100040E00;
  v67[3] = &unk_1003D1AD8;
  v67[4] = self;
  [v28 registerHandlerForEvent:off_100469278 onState:@"clear-asset-download-space" withBlock:v67];

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100040F54;
  v66[3] = &unk_1003D1AD8;
  v66[4] = self;
  [v29 registerHandlerForEvent:off_100469208 onState:@"download" withBlock:v66];

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_100040FA4;
  v65[3] = &unk_1003D1AD8;
  v65[4] = self;
  [v30 registerHandlerForEvent:off_100469260 onState:@"download" withBlock:v65];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_100040FF4;
  v64[3] = &unk_1003D1AD8;
  v64[4] = self;
  [v31 registerHandlerForEvent:off_100469268 onState:@"download" withBlock:v64];

  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100041184;
  v63[3] = &unk_1003D1AD8;
  v63[4] = self;
  [v32 registerHandlerForEvent:off_100469208 onState:@"apply-confirm" withBlock:v63];

  unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_1000411D4;
  v62[3] = &unk_1003D1AD8;
  v62[4] = self;
  [v33 registerHandlerForEvent:off_100469210 onState:@"apply-confirm" withBlock:v62];

  dispatch_queue_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10004141C;
  v61[3] = &unk_1003D1AD8;
  v61[4] = self;
  [v34 registerHandlerForEvent:off_100469218 onState:@"apply-confirm" withBlock:v61];

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100041554;
  v60[3] = &unk_1003D1AD8;
  v60[4] = self;
  [v35 registerHandlerForEvent:off_100469298 onState:@"apply-recheck" withBlock:v60];

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000416D0;
  v59[3] = &unk_1003D1AD8;
  v59[4] = self;
  [v36 registerHandlerForEvent:off_1004692A0 onState:@"apply-recheck" withBlock:v59];

  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100041918;
  v58[3] = &unk_1003D1AD8;
  v58[4] = self;
  [v37 registerHandlerForEvent:off_100469230 onState:@"apply-recheck-cleanup" withBlock:v58];

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_100041A5C;
  v57[3] = &unk_1003D1AD8;
  v57[4] = self;
  [v38 registerHandlerForEvent:off_100469270 onState:@"clear-brain-download-space" withBlock:v57];

  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_100041AAC;
  v56[3] = &unk_1003D1AD8;
  v56[4] = self;
  [v39 registerHandlerForEvent:off_100469278 onState:@"clear-brain-download-space" withBlock:v56];

  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100041BE4;
  v55[3] = &unk_1003D1AD8;
  v55[4] = self;
  [v40 registerHandlerForEvent:off_100469268 onState:@"download-brain" withBlock:v55];

  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_100041D38;
  v54[3] = &unk_1003D1AD8;
  v54[4] = self;
  [v41 registerHandlerForEvent:off_100469260 onState:@"download-brain" withBlock:v54];

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100041D88;
  v53[3] = &unk_1003D1AD8;
  v53[4] = self;
  [v42 registerHandlerForEvent:off_100469270 onState:@"clear-prepare-space" withBlock:v53];

  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100041DD8;
  v52[3] = &unk_1003D1AD8;
  v52[4] = self;
  [v43 registerHandlerForEvent:off_100469278 onState:@"clear-prepare-space" withBlock:v52];

  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100041F10;
  v51[3] = &unk_1003D1AD8;
  v51[4] = self;
  [v44 registerHandlerForEvent:off_100469280 onState:@"apply" withBlock:v51];

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100041F60;
  v50[3] = &unk_1003D1AD8;
  v50[4] = self;
  [v45 registerHandlerForEvent:off_100469288 onState:@"apply" withBlock:v50];

  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100041FA8;
  v49[3] = &unk_1003D1AD8;
  v49[4] = self;
  [v46 registerHandlerForEvent:off_100469290 onState:@"cancel" withBlock:v49];

  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100041FCC;
  v48[3] = &unk_1003D1AD8;
  v48[4] = self;
  [v47 registerHandlerForEvent:off_1004691F0 onState:@"cancel" withBlock:v48];
}

- (void)_purgePreviousAssets
{
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Verifying beta catalog is up to date during initial asset purge.",  (uint8_t *)buf,  2u);
  }

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDBetaManager sharedManager](&OBJC_CLASS___SDBetaManager, "sharedManager"));
  [v5 verifyCurrentCatalog];

  id v6 = sub_1000836CC();
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Starting prior asset purge...",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100042318;
  v9[3] = &unk_1003D1B00;
  objc_copyWeak(&v10, buf);
  [v8 purgeLocalAssetsWithCompletion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_performCheck
{
  if ((id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)8)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000425A8;
    v9[3] = &unk_1003D1B50;
    id v4 = &v10;
    objc_copyWeak(&v10, &location);
    [v3 descriptorForCurrentlyInstalledAssetWithCompletion:v9];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    unint64_t v5 = -[PBOSSoftwareUpdateProcess action](self, "action");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess scanOptions](self, "scanOptions"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004278C;
    v7[3] = &unk_1003D1B78;
    id v4 = &v8;
    objc_copyWeak(&v8, &location);
    [v3 assetForAction:v5 options:v6 withCompletion:v7];
  }

  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

- (void)_foundAsset:(id)a3 releaseDate:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v71 = v8;
  if (!v8)
  {
    __int128 v91 = 0u;
    memset(v92, 0, sizeof(v92));
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v80 = 0u;
    memset(buf, 0, sizeof(buf));
    id v23 = sub_1000836CC();
    double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = 3LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    v74[0] = 0;
    __int128 v26 = (uint8_t *)_os_log_send_and_compose_impl( v25,  0LL,  buf,  250LL,  &_mh_execute_header,  v24,  0LL,  "No asset found.",  v74,  2);

    id v27 = sub_1000836CC();
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    _os_log_message_persist_impl(v26, 0LL, v28);

    if (v26 != buf) {
      free(v26);
    }
    if (!v10)
    {
      -[PBOSSoftwareUpdateProcess _sendCheckFinishedNotificationForUpdateAvailable:withError:]( self,  "_sendCheckFinishedNotificationForUpdateAvailable:withError:",  0LL,  0LL);
      if (!-[PBOSSoftwareUpdateProcess _isManagedAction](self, "_isManagedAction"))
      {
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v29 setLastCheckDate:v30];
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
      __int16 v32 = v31;
      unint64_t v33 = off_100469240;
      goto LABEL_26;
    }

    goto LABEL_25;
  }

  id v11 = sub_1000836CC();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Found asset %{public}@ with attributes:",  buf,  0xCu);
  }

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 attributes]);
  id v14 = [v13 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v14)
  {
    id v15 = v14;
    id v69 = v10;
    id v70 = v9;
    uint64_t v16 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v76 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)i);
        id v19 = sub_1000836CC();
        float v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          float v21 = (void *)objc_claimAutoreleasedReturnValue([v71 attributes]);
          double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v18]);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "    %{public}@ : %{public}@", buf, 0x16u);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v75 objects:v93 count:16];
    }

    while (v15);

    id v10 = v69;
    id v9 = v70;
    if (!v69) {
      goto LABEL_34;
    }
    goto LABEL_25;
  }

  if (v10)
  {
LABEL_25:
    -[PBOSSoftwareUpdateProcess _sendCheckFinishedNotificationForUpdateAvailable:withError:]( self,  "_sendCheckFinishedNotificationForUpdateAvailable:withError:",  0LL,  v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    __int16 v32 = v31;
    unint64_t v33 = off_100469258;
LABEL_26:
    [v31 postEvent:v33 withContext:0 userInfo:0];
    goto LABEL_27;
  }

- (void)_recheckForNewerUpdate
{
  if ((id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)8)
  {
    __int128 v30 = 0u;
    memset(v31, 0, sizeof(v31));
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
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    *(_OWORD *)id location = 0u;
    id v3 = sub_1000836CC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v5 = 3LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
    v16[0] = 0;
    _os_log_send_and_compose_impl( v5,  0LL,  location,  250LL,  &_mh_execute_header,  v4,  0LL,  "Skipping recheck for manual install only.",  v16,  2);
    unint64_t v7 = v6;

    id v8 = sub_1000836CC();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    _os_log_message_persist_impl(v7, 0LL, v9);

    if (v7 != location) {
      free(v7);
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v10 postEvent:off_1004692A0 withContext:0 userInfo:0];
  }

  else
  {
    objc_initWeak(location, self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    unint64_t v12 = -[PBOSSoftwareUpdateProcess action](self, "action");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess scanOptions](self, "scanOptions"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000434F4;
    v14[3] = &unk_1003D1B78;
    objc_copyWeak(&v15, location);
    [v11 assetForAction:v12 options:v13 withCompletion:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }

- (BOOL)_playingExternalARCAudio
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unint64_t v3 = (unint64_t)[v2 eARCStatus];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
  id v5 = [v4 tvPowerState];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
  unsigned __int8 v7 = [v6 isActiveSource];

  if (v3 != 1 && (v3 & 0xFFFFFFFFFFFFFFFELL) != 2 || v5 == (id)3) {
    return 0;
  }
  else {
    return v7 ^ 1;
  }
}

- (BOOL)_showingHKCameras
{
  return +[PBAttentionMonitor _isRemainingActiveFor:](&OBJC_CLASS___PBAttentionMonitor, "_isRemainingActiveFor:", 1LL);
}

- (BOOL)_goodTimeToDownload
{
  if (-[PBOSSoftwareUpdateProcess isApplyingRecheckedUpdate](self, "isApplyingRecheckedUpdate"))
  {
    __int128 v82 = 0u;
    memset(v83, 0, 26);
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v69 = 0u;
    id v3 = sub_1000836CC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v5 = 3LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
    LOWORD(v56[0]) = 0;
    _os_log_send_and_compose_impl( v5,  0LL,  &v69,  250LL,  &_mh_execute_header,  v4,  0LL,  "Recheck: good time to download",  v56,  2);
    unsigned __int8 v7 = v6;

    id v8 = sub_1000836CC();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    _os_log_message_persist_impl(v7, 0LL, v9);

    if (v7 != &v69) {
      free(v7);
    }
    LOBYTE(v10) = 1;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    [v11 shouldAutomaticallyApplyUpdates];

    if ((id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)2
      || -[PBOSSoftwareUpdateProcess _wasStartedForRestore](self, "_wasStartedForRestore"))
    {
      unsigned int v54 = 1;
    }

    else
    {
      unsigned int v54 = -[PBOSSoftwareUpdateProcess _isManagedAction](self, "_isManagedAction");
    }

    BOOL v12 = (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)4
       || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)5
       || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)3;
    BOOL v52 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    unsigned int v14 = [v13 tasksEnabledOfType:1];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v51 = [v15 isSleepNever] & v14;

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    id v17 = [v16 powerState];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    unsigned int v19 = [v18 playing];

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    unsigned int v21 = [v20 playingMusic];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
    unsigned int v23 = [v22 nowPlayingAppFocused] ^ 1;

    unsigned int v24 = -[PBOSSoftwareUpdateProcess _playingExternalARCAudio](self, "_playingExternalARCAudio");
    unsigned __int16 v25 = -[PBOSSoftwareUpdateProcess _showingHKCameras](self, "_showingHKCameras");
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
    unsigned __int8 v27 = [v26 isPresenting];

    int v28 = 0;
    unsigned __int16 v48 = v25;
    if ((v24 & 1) == 0 && (v25 & 1) == 0 && (v27 & 1) == 0) {
      int v28 = v19 ^ 1 | v21 & v23;
    }
    unsigned int v29 = v23;
    BOOL v30 = v17 == (id)3;
    __int128 v82 = 0u;
    memset(v83, 0, 26);
    int v31 = v52 & v28;
    if (v17 == (id)3) {
      int v32 = 1;
    }
    else {
      int v32 = v51;
    }
    __int128 v80 = 0uLL;
    __int128 v81 = 0uLL;
    if (!(v52 & v28 ^ 1 | v14)) {
      int v31 = v32;
    }
    int v49 = v31;
    __int128 v78 = 0uLL;
    __int128 v79 = 0uLL;
    __int128 v76 = 0uLL;
    __int128 v77 = 0uLL;
    __int128 v74 = 0uLL;
    __int128 v75 = 0uLL;
    __int128 v72 = 0uLL;
    __int128 v73 = 0uLL;
    __int128 v70 = 0uLL;
    __int128 v71 = 0uLL;
    __int128 v69 = 0uLL;
    id v33 = sub_1000836CC();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    v56[0] = 67112448;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v35 = 3LL;
    }
    else {
      uint64_t v35 = 2LL;
    }
    LOWORD(v57) = 1024;
    HIWORD(v57) = v52;
    LOWORD(v58) = HIWORD(v30);
    HIWORD(v58) = 1024;
    LOWORD(v59) = 1024;
    HIWORD(v59) = v19;
    LOWORD(v60) = HIWORD(v24);
    HIWORD(v60) = 1024;
    LOWORD(v61) = 1024;
    HIWORD(v61) = v48;
    unsigned int v62 = v29;
    __int16 v63 = 1024;
    unsigned int v64 = v14;
    __int16 v65 = 1024;
    int v66 = v19 ^ 1;
    __int16 v67 = 1024;
    int v68 = v28;
    _os_log_send_and_compose_impl( v35,  0LL,  &v69,  250LL,  &_mh_execute_header,  v34,  0LL,  "Check:Download autoEn:%d autoTrig:%d manTrig:%d asleep:%d idle:%d playingAny:%d playingMus:%d playingARC:%d airpla ying:%d hkCams:%d npBgd:%d okBgd:%d okIntF:%d okIntB:%d",  v56,  86,  v24,  v49,  v51,  v52,  v56[0],  v57,  v54,  v58,  v59,  v21,  v60,  v61);
    __int128 v37 = v36;

    id v38 = sub_1000836CC();
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    _os_log_message_persist_impl(v37, 0LL, v39);

    if (v37 != &v69) {
      free(v37);
    }
    *(_OWORD *)((char *)v83 + 10) = 0u;
    if (v53) {
      BOOL v10 = v50;
    }
    else {
      BOOL v10 = v55;
    }
    __int128 v82 = 0uLL;
    v83[0] = 0uLL;
    __int128 v80 = 0uLL;
    __int128 v81 = 0uLL;
    __int128 v78 = 0uLL;
    __int128 v79 = 0uLL;
    __int128 v76 = 0uLL;
    __int128 v77 = 0uLL;
    __int128 v74 = 0uLL;
    __int128 v75 = 0uLL;
    __int128 v72 = 0uLL;
    __int128 v73 = 0uLL;
    __int128 v70 = 0uLL;
    __int128 v71 = 0uLL;
    __int128 v69 = 0uLL;
    id v40 = sub_1000836CC();
    __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v42 = 3LL;
    }
    else {
      uint64_t v42 = 2LL;
    }
    v56[0] = 67109120;
    v56[1] = v10;
    _os_log_send_and_compose_impl( v42,  0LL,  &v69,  250LL,  &_mh_execute_header,  v41,  0LL,  "Check:Download good time to download:%d",  v56);
    id v44 = v43;

    id v45 = sub_1000836CC();
    id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    _os_log_message_persist_impl(v44, 0LL, v46);

    if (v44 != &v69) {
      free(v44);
    }
  }

  return v10;
}

- (BOOL)_goodTimeToInstallAndReboot
{
  if ((id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)2
    || -[PBOSSoftwareUpdateProcess _wasStartedForRestore](self, "_wasStartedForRestore")
    || -[PBOSSoftwareUpdateProcess _isManagedAction](self, "_isManagedAction"))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    BOOL v5 = (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)4
      && (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)5
      && (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    unsigned int v7 = [(id)v6 playing];

    LODWORD(v6) = -[PBOSSoftwareUpdateProcess _playingExternalARCAudio](self, "_playingExternalARCAudio");
    unsigned int v8 = -[PBOSSoftwareUpdateProcess _showingHKCameras](self, "_showingHKCameras");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
    unsigned int v10 = [v9 isPresenting];

    int v3 = (v5 | v6 | v8 | v10 | v7) ^ 1;
    memset(v19, 0, 250);
    id v11 = sub_1000836CC();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = 3LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    v18[0] = 67109120;
    v18[1] = v3;
    _os_log_send_and_compose_impl( v13,  0LL,  v19,  250LL,  &_mh_execute_header,  v12,  0LL,  "Check:Install good time to install update:%d",  v18);
    id v15 = v14;

    id v16 = sub_1000836CC();
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _os_log_message_persist_impl(v15, 0LL, v17);

    if (v15 != v19) {
      free(v15);
    }
  }

  return v3;
}

- (void)_sendCheckStartNotification
{
  BOOL v3 = (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)7
    && (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)8;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
  BOOL v5 = (void *)v4;
  if (v3 && v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", 0LL));
    [v5 osUpdateProcessDidStartCheckWithData:v6];
  }
}

- (void)_sendCheckFinishedNotificationForUpdateAvailable:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)7
    && (id)-[PBOSSoftwareUpdateProcess action](self, "action") != (id)8;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
  id v9 = (void *)v8;
  if (v7 && v8)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", v6));
    if (v4
      && (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset")),
          v11,
          v11))
    {
      [v10 setObject:&__kCFBooleanTrue forKey:PBSOSUpdateServiceKeyIsAvailable];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess assetReleaseDate](self, "assetReleaseDate"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 descriptorForAsset:v13 withReleaseDate:v14]);

      if (v15) {
        [v10 setObject:v15 forKey:PBSOSUpdateServiceKeyAvailableUpdate];
      }
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
      [v16 refreshState];

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
      id v18 = [v17 state];

      if (v18 == (id)2) {
        unsigned int v19 = &__kCFBooleanTrue;
      }
      else {
        unsigned int v19 = &__kCFBooleanFalse;
      }
      [v10 setObject:v19 forKey:PBSOSUpdateServiceKeyIsAlreadyDownloaded];
    }

    else
    {
      [v10 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyIsAvailable];
      [v10 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyIsAlreadyDownloaded];
    }

    [v9 osUpdateProcessDidFinishCheckWithData:v10];
  }
}

- (void)_downloadAsset
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  [v3 refreshState];
  id v4 = [v3 state];
  if (v4 == (id)1)
  {
    objc_initWeak(from, self);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100044B48;
    v43[3] = &unk_1003D1BC8;
    objc_copyWeak(&v44, from);
    [v3 attachProgressCallBack:v43];
    if (-[PBOSSoftwareUpdateProcess _isManagedAction](self, "_isManagedAction")) {
      unsigned __int8 v19 = 0;
    }
    else {
      unsigned __int8 v19 = -[PBOSSoftwareUpdateProcess downloadAssetWithDiscretionaryPriority]( self,  "downloadAssetWithDiscretionaryPriority");
    }
    __int128 v59 = 0u;
    memset(v60, 0, sizeof(v60));
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 location = 0u;
    id v27 = sub_1000836CC();
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = 3LL;
    }
    else {
      uint64_t v29 = 2LL;
    }
    __int16 v42 = 0;
    _os_log_send_and_compose_impl( v29,  0LL,  &location,  250LL,  &_mh_execute_header,  v28,  0LL,  "Purging all prior local assets in preparation to download...",  &v42,  2);
    int v31 = v30;

    id v32 = sub_1000836CC();
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    _os_log_message_persist_impl(v31, 0LL, v33);

    if (v31 != &location) {
      free(v31);
    }
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100044B88;
    v37[3] = &unk_1003D1C18;
    unsigned __int8 v41 = v19;
    id v38 = v3;
    objc_copyWeak(&v40, from);
    __int128 v39 = self;
    [v34 purgeLocalAssetsWithCompletion:v37];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v44);
    objc_destroyWeak(from);
  }

  else if (v4 == (id)4)
  {
    __int128 v59 = 0uLL;
    memset(v60, 0, sizeof(v60));
    __int128 v57 = 0uLL;
    __int128 v58 = 0uLL;
    __int128 v55 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    __int128 v47 = 0uLL;
    __int128 v48 = 0uLL;
    __int128 location = 0uLL;
    id v12 = sub_1000836CC();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = 3LL;
    }
    else {
      uint64_t v14 = 2LL;
    }
    LOWORD(from[0]) = 0;
    _os_log_send_and_compose_impl( v14,  0LL,  &location,  250LL,  &_mh_execute_header,  v13,  0LL,  "Asset already being downloaded. Check for PineBoard restart.",  from,  2);
    id v16 = v15;

    id v17 = sub_1000836CC();
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    _os_log_message_persist_impl(v16, 0LL, v18);

    if (v16 != &location) {
      free(v16);
    }
    objc_initWeak((id *)&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10004544C;
    v35[3] = &unk_1003D1BC8;
    objc_copyWeak(&v36, (id *)&location);
    [v3 attachProgressCallBack:v35];
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&location);
  }

  else if (v4 == (id)2)
  {
    __int128 v59 = 0uLL;
    memset(v60, 0, sizeof(v60));
    __int128 v57 = 0uLL;
    __int128 v58 = 0uLL;
    __int128 v55 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    __int128 v47 = 0uLL;
    __int128 v48 = 0uLL;
    __int128 location = 0uLL;
    id v5 = sub_1000836CC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    LOWORD(from[0]) = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  &location,  250LL,  &_mh_execute_header,  v6,  0LL,  "Asset already downloaded.",  from,  2);
    id v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != &location) {
      free(v9);
    }
    -[PBOSSoftwareUpdateProcess _processAssetDownloadSuccess](self, "_processAssetDownloadSuccess");
  }

  else
  {
    __int128 v59 = 0uLL;
    memset(v60, 0, sizeof(v60));
    __int128 v57 = 0uLL;
    __int128 v58 = 0uLL;
    __int128 v55 = 0uLL;
    __int128 v56 = 0uLL;
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    __int128 v47 = 0uLL;
    __int128 v48 = 0uLL;
    __int128 location = 0uLL;
    id v20 = sub_1000836CC();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    LODWORD(from[0]) = 67109120;
    HIDWORD(from[0]) = [v3 state];
    _os_log_send_and_compose_impl( v22,  0LL,  &location,  250LL,  &_mh_execute_header,  v21,  16LL,  "Asset found in unexpected state: %d. Failing download.",  from);
    unsigned int v24 = v23;

    id v25 = sub_1000836CC();
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    _os_log_message_persist_impl(v24, 16LL, v26);

    if (v24 != &location) {
      free(v24);
    }
    -[PBOSSoftwareUpdateProcess _processAssetDownloadFailureWithResult:]( self,  "_processAssetDownloadFailureWithResult:",  3LL);
  }
}

- (void)_processAssetDownloadSuccess
{
  if (!-[PBOSSoftwareUpdateProcess sentDownloadFinishedCallback](self, "sentDownloadFinishedCallback"))
  {
    -[PBOSSoftwareUpdateProcess setSentDownloadFinishedCallback:](self, "setSentDownloadFinishedCallback:", 1LL);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", 0LL));
      [v4 setObject:&__kCFBooleanTrue forKey:PBSOSUpdateServiceKeyDidSucceed];
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess currentDownload](self, "currentDownload"));
      if (v5)
      {
        [v4 setObject:v5 forKey:PBSOSUpdateServiceKeyCurrentDownload];
      }

      else
      {
        memset(v16, 0, 250);
        id v6 = sub_1000836CC();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          uint64_t v8 = 3LL;
        }
        else {
          uint64_t v8 = 2LL;
        }
        v15[0] = 0;
        _os_log_send_and_compose_impl( v8,  0LL,  v16,  250LL,  &_mh_execute_header,  v7,  16LL,  "Current download not found during download success.",  v15,  2);
        id v10 = v9;

        id v11 = sub_1000836CC();
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        _os_log_message_persist_impl(v10, 16LL, v12);

        if (v10 != v16) {
          free(v10);
        }
      }

      id v13 = [v4 copy];
      [v3 osUpdateProcessDidFinishDownloadWithData:v13];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v14 postEvent:off_100469268 withContext:0 userInfo:0];

    +[PBOSSoftwareUpdateMonitor noteResourceFetchOfType:withResult:]( &OBJC_CLASS___PBOSSoftwareUpdateMonitor,  "noteResourceFetchOfType:withResult:",  2LL,  0LL);
  }

- (void)_processAssetDownloadFailureWithResult:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset", a3));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", 0LL));
    [v5 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyDidSucceed];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess currentDownload](self, "currentDownload"));
      if (v7)
      {
        [v5 setObject:v7 forKey:PBSOSUpdateServiceKeyCurrentDownload];
      }

      else
      {
        __int128 v43 = 0u;
        memset(v44, 0, sizeof(v44));
        __int128 v41 = 0u;
        __int128 v42 = 0u;
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
        __int128 v30 = 0u;
        id v17 = sub_1000836CC();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          uint64_t v19 = 3LL;
        }
        else {
          uint64_t v19 = 2LL;
        }
        LOWORD(v28) = 0;
        _os_log_send_and_compose_impl( v19,  0LL,  &v30,  250LL,  &_mh_execute_header,  v18,  16LL,  "Current download not found during download failure.",  &v28,  2);
        unsigned int v21 = v20;

        id v22 = sub_1000836CC();
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        _os_log_message_persist_impl(v21, 16LL, v23);

        if (v21 != &v30) {
          free(v21);
        }
      }

      id v24 = [v5 copy];
      [v6 osUpdateProcessDidFinishDownloadWithData:v24];
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v25 postEvent:off_100469260 withContext:0 userInfo:0];

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
    else {
      uint64_t v27 = 2LL;
    }

    +[PBOSSoftwareUpdateMonitor noteResourceFetchOfType:withResult:]( &OBJC_CLASS___PBOSSoftwareUpdateMonitor,  "noteResourceFetchOfType:withResult:",  v27,  1LL);
  }

  else
  {
    __int128 v43 = 0u;
    memset(v44, 0, sizeof(v44));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
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
    __int128 v30 = 0u;
    id v8 = sub_1000836CC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentState]);
    int v28 = 138543362;
    uint64_t v29 = v12;
    _os_log_send_and_compose_impl( v10,  0LL,  &v30,  250LL,  &_mh_execute_header,  v9,  0LL,  "Download canceled (our state:%{public}@)",  &v28,  12);
    uint64_t v14 = v13;

    id v15 = sub_1000836CC();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    _os_log_message_persist_impl(v14, 0LL, v16);

    if (v14 != &v30) {
      free(v14);
    }
  }

- (void)_downloadBrain
{
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  int v14 = 134217984;
  id v15 = [v6 state];
  _os_log_send_and_compose_impl( v5,  0LL,  v16,  250LL,  &_mh_execute_header,  v4,  0LL,  "Starting download of brain in state %ld",  &v14);
  id v8 = v7;

  id v9 = sub_1000836CC();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  _os_log_message_persist_impl(v8, 0LL, v10);

  if (v8 != v16) {
    free(v8);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess brainLoader](self, "brainLoader"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _brainAssetDownloadOptions](self, "_brainAssetDownloadOptions"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100045B78;
  v13[3] = &unk_1003D1C38;
  v13[4] = self;
  [v11 loadUpdateBrainWithMAOptions:v12 progressHandler:v13];
}

- (void)_processPrepareAndApplySpaceCheckResultForRequiredSpace:(unint64_t)a3 andError:(id)a4
{
  id v6 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace", a3, a4);
  if ((unint64_t)v6 >= a3)
  {
    __int128 v44 = 0u;
    memset(v45, 0, sizeof(v45));
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
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v31 = 0u;
    id v20 = sub_1000836CC();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    LOWORD(v27) = 0;
    _os_log_send_and_compose_impl( v22,  0LL,  &v31,  250LL,  &_mh_execute_header,  v21,  0LL,  "Sufficient prepare/apply space. Continuing...",  &v27,  2);
    id v24 = v23;

    id v25 = sub_1000836CC();
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    _os_log_message_persist_impl(v24, 0LL, v26);

    if (v24 != &v31) {
      free(v24);
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v15 postEvent:off_100469278 withContext:0 userInfo:0];
  }

  else
  {
    id v7 = v6;
    __int128 v44 = 0u;
    memset(v45, 0, sizeof(v45));
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
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v31 = 0u;
    id v8 = sub_1000836CC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    int v27 = 134218240;
    id v28 = v7;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    _os_log_send_and_compose_impl( v10,  0LL,  &v31,  250LL,  &_mh_execute_header,  v9,  16LL,  "Insufficient prepare/apply space. unused:%lld required:%lld. Failing update.",  &v27,  22);
    id v12 = v11;

    id v13 = sub_1000836CC();
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _os_log_message_persist_impl(v12, 16LL, v14);

    if (v12 != &v31) {
      free(v12);
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  9LL,  0LL));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", v16));
      [v17 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyDidSucceed];
      id v18 = [v17 copy];
      [v15 osUpdateProcessDidFinishApplyWithData:v18];
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v19 postEvent:off_100469270 withContext:0 userInfo:0];
  }
}

- (void)_prepareAndApplyUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  unsigned int v4 = [v3 state];

  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Preparing update with asset in state %d",  buf,  8u);
  }

  -[PBOSSoftwareUpdateProcess setLastDownloadProgressNotification:](self, "setLastDownloadProgressNotification:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getLocalFileUrl]);

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
  __int128 v30 = 0u;
  *(_OWORD *)buf = 0u;
  __int128 v29 = 0u;
  id v9 = sub_1000836CC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = 3LL;
  }
  else {
    uint64_t v11 = 2LL;
  }
  int v26 = 138543362;
  int v27 = v8;
  _os_log_send_and_compose_impl( v11,  0LL,  buf,  250LL,  &_mh_execute_header,  v10,  0LL,  "Preparing update at %{public}@",  &v26,  12);
  id v13 = v12;

  id v14 = sub_1000836CC();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  _os_log_message_persist_impl(v13, 0LL, v15);

  if (v13 != buf) {
    free(v13);
  }
  if (v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVSUIOSUpdateView imageForStep2of2](&OBJC_CLASS___TVSUIOSUpdateView, "imageForStep2of2"));
    objc_initWeak((id *)buf, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000463AC;
    block[3] = &unk_1003D0418;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v16;
    id v19 = v16;
    dispatch_async(v18, block);

    id v20 = &v23;
  }

  else
  {
    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004615C;
    v24[3] = &unk_1003D0890;
    objc_copyWeak(&v25, (id *)buf);
    dispatch_async(&_dispatch_main_q, v24);
    id v20 = &v25;
  }

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

- (id)_step2ImagePathWithImage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [@"/var/MobileSoftwareUpdate/Controller/AppleTV" stringByAppendingPathComponent:@"swuprogress.tga"]);
  unsigned __int8 v33 = 0;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (-[NSFileManager fileExistsAtPath:isDirectory:]( v5,  "fileExistsAtPath:isDirectory:",  @"/var/MobileSoftwareUpdate/Controller/AppleTV",  &v33))
  {
    BOOL v6 = v33 == 0;
  }

  else
  {
    BOOL v6 = 1;
  }

  if (v6)
  {
    -[NSFileManager removeItemAtPath:error:]( v5,  "removeItemAtPath:error:",  @"/var/MobileSoftwareUpdate/Controller/AppleTV",  0LL);
    id v32 = 0LL;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v5,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  @"/var/MobileSoftwareUpdate/Controller/AppleTV",  1LL,  0LL,  &v32);
    id v7 = v32;
  }

  else
  {
    id v7 = 0LL;
  }

  if (-[NSFileManager fileExistsAtPath:isDirectory:]( v5,  "fileExistsAtPath:isDirectory:",  @"/var/MobileSoftwareUpdate/Controller/AppleTV",  &v33))
  {
    BOOL v8 = v33 == 0;
  }

  else
  {
    BOOL v8 = 1;
  }

  if (v8)
  {
    __int128 v55 = 0u;
    memset(v56, 0, sizeof(v56));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v42 = 0u;
    id v9 = sub_1000836CC();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    int v36 = 138543874;
    __int128 v37 = @"/var/MobileSoftwareUpdate/Controller/AppleTV";
    __int16 v38 = 1024;
    int v39 = v33;
    __int16 v40 = 2114;
    id v41 = v7;
    _os_log_send_and_compose_impl( v11,  0LL,  &v42,  250LL,  &_mh_execute_header,  v10,  16LL,  "Failed to locate or create Step 2 image cache directory at %{public}@ [isDir:%d] [%{public}@]",  &v36,  28);
    id v13 = v12;

    id v14 = sub_1000836CC();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    _os_log_message_persist_impl(v13, 16LL, v15);

    if (v13 != &v42) {
      free(v13);
    }
    id v16 = v4;
    goto LABEL_28;
  }

  id v17 = sub_1000836CC();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100273A4C();
  }

  CFStringRef v34 = kCGImageDestinationLossyCompressionQuality;
  __int128 v35 = &off_1003FE9E0;
  id v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
  id v20 = CGImageDestinationCreateWithURL( (CFURLRef)+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4),  @"com.truevision.tga-image",  1uLL,  v16);
  if (!v20
    || (unsigned int v21 = v20,
        CGImageDestinationAddImage(v20, (CGImageRef)[v3 CGImage], 0),
        BOOL v22 = CGImageDestinationFinalize(v21),
        CFRelease(v21),
        !v22))
  {
    __int128 v55 = 0u;
    memset(v56, 0, sizeof(v56));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v42 = 0u;
    id v23 = sub_1000836CC();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      uint64_t v25 = 3LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    int v36 = 138543362;
    __int128 v37 = (const __CFString *)v4;
    _os_log_send_and_compose_impl( v25,  0LL,  &v42,  250LL,  &_mh_execute_header,  v24,  16LL,  "Failed to write Step 2 image to %{public}@.",  &v36,  12);
    int v27 = v26;

    id v28 = sub_1000836CC();
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    _os_log_message_persist_impl(v27, 16LL, v29);

    if (v27 != &v42) {
      free(v27);
    }

LABEL_28:
    unsigned int v4 = 0LL;
  }

  __int128 v30 = v4;
  return v30;
}

- (void)_prepareAndApplyUpdateThreadedWithImage:(id)a3
{
  id v96 = a3;
  context = objc_autoreleasePoolPush();
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  unsigned int v5 = [v4 state];

  id v6 = sub_1000836CC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PrepareAndApply update with asset in state %d",  buf,  8u);
  }

  CFTypeRef v111 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v110 = 0LL;
  LODWORD(v8) = 0;
  -[PBOSSoftwareUpdateProcess setLastMSUPercentCompleted:](self, "setLastMSUPercentCompleted:", v8);
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", &off_1003FE578));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  unsigned int v10 = [v9 shouldIgnoreEngineeringFiles];

  if (v10) {
    [v98 addObjectsFromArray:&off_1003FE5A8];
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v98));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v11,  kMSUOptionsKeyDoNotPatch));

  __int128 v134 = 0u;
  memset(v135, 0, sizeof(v135));
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  *(_OWORD *)buf = 0u;
  id v13 = sub_1000836CC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = 3LL;
  }
  else {
    uint64_t v15 = 2LL;
  }
  *(_DWORD *)v117 = 138543362;
  *(void *)&v117[4] = v12;
  _os_log_send_and_compose_impl( v15,  0LL,  buf,  250LL,  &_mh_execute_header,  v14,  0LL,  "MSU Prepare options:%{public}@",  v117,  12);
  id v17 = v16;

  id v18 = sub_1000836CC();
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  _os_log_message_persist_impl(v17, 0LL, v19);

  if (v17 != buf) {
    free(v17);
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  int v21 = MSUPrepareUpdateWithMAAsset(v20, v12, &v110, &cf, sub_100047658, self);

  __int128 v134 = 0u;
  memset(v135, 0, sizeof(v135));
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  *(_OWORD *)buf = 0u;
  id v22 = sub_1000836CC();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v24 = 3LL;
  }
  else {
    uint64_t v24 = 2LL;
  }
  *(_DWORD *)v117 = 67109378;
  *(_DWORD *)&v117[4] = v21;
  *(_WORD *)&v117[8] = 2114;
  *(void *)&v117[10] = cf;
  LODWORD(v91) = 18;
  _os_log_send_and_compose_impl( v24,  0LL,  buf,  250LL,  &_mh_execute_header,  v23,  0LL,  "MSU Prepare result: %d error:%{public}@",  v117,  v91);
  int v26 = v25;

  id v27 = sub_1000836CC();
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  _os_log_message_persist_impl(v26, 0LL, v28);

  if (v26 != buf) {
    free(v26);
  }
  if (cf) {
    char v29 = 0;
  }
  else {
    char v29 = v21;
  }
  if ((v29 & 1) != 0)
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    *(void *)v117 = 0LL;
    *(void *)&v117[8] = v117;
    *(void *)&v117[16] = 0x3032000000LL;
    v118 = sub_1000478DC;
    v119 = sub_1000478EC;
    id v120 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100047904;
    block[3] = &unk_1003D0790;
    void block[4] = v117;
    dispatch_sync(&_dispatch_main_q, block);
    if ([*(id *)(*(void *)&v117[8] + 40) length]) {
      [v30 setObject:*(void *)(*(void *)&v117[8] + 40) forKey:kMSUOptionsKeyUpdateOSBackgroundImagePath];
    }
    [v30 setObject:@"1280" forKey:kMSUOptionsKeyUpdateOSDisplayWidth];
    [v30 setObject:@"720" forKey:kMSUOptionsKeyUpdateOSDisplayHeight];
    [v30 setObject:@"60.0" forKey:kMSUOptionsKeyUpdateOSDisplayRefreshRate];
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)4));
    [v30 setObject:v31 forKey:@"installTonight"];

    __int128 v134 = 0u;
    memset(v135, 0, sizeof(v135));
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    *(_OWORD *)buf = 0u;
    id v32 = sub_1000836CC();
    unsigned __int8 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v34 = 3LL;
    }
    else {
      uint64_t v34 = 2LL;
    }
    int v113 = 138543362;
    *(void *)v114 = v30;
    LODWORD(v92) = 12;
    _os_log_send_and_compose_impl( v34,  0LL,  buf,  250LL,  &_mh_execute_header,  v33,  0LL,  "MSU Apply options:%{public}@",  &v113,  v92);
    int v36 = v35;

    id v37 = sub_1000836CC();
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    _os_log_message_persist_impl(v36, 0LL, v38);

    if (v36 != buf) {
      free(v36);
    }
    int v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
    unsigned int v40 = [v39 isCarryOrLiveOnUser];

    if (v40)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 accountID]);

      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 password]);

      v115[0] = kMSUOptionsKeyAppleConnectCredentialsSubkeyAccountName;
      v115[1] = kMSUOptionsKeyAppleConnectCredentialsSubkeyPassword;
      v116[0] = v42;
      v116[1] = v44;
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v116,  v115,  2LL));
      [v30 setObject:v45 forKey:kMSUOptionsKeyAppleConnectCredentials];
      id v46 = sub_1000836CC();
      __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "MSU Apply: adding credentials for %{public}@",  buf,  0xCu);
      }
    }

    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v49 = [v48 isSupervised];

    if (v49)
    {
      [v30 setObject:&__kCFBooleanTrue forKey:kMSUOptionsKeyEnableManagedRequest];
      id v50 = sub_1000836CC();
      __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "MSU Apply: adding managed request flag",  buf,  2u);
      }
    }

    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
    unsigned int v53 = [v52 shouldSkipUpdate];

    if (v53)
    {
      id v54 = sub_1000836CC();
      __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int128 v56 = "MSU Apply failing because shouldSkipUpdate is set.";
LABEL_49:
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 2u);
      }
    }

    else
    {
      __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
      unsigned int v59 = [v58 shouldFakeUpdateSuccess];

      if (!v59)
      {
        int v61 = MSUApplyUpdate(v110, v30, &v111, sub_100047658, self);
        goto LABEL_52;
      }

      id v60 = sub_1000836CC();
      __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int128 v56 = "MSU Apply succeeding because shouldFakeUpdateSuccess is set.";
        goto LABEL_49;
      }
    }

    int v61 = v53 ^ 1;
LABEL_52:
    __int128 v134 = 0u;
    memset(v135, 0, sizeof(v135));
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    __int128 v130 = 0u;
    __int128 v131 = 0u;
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v124 = 0u;
    __int128 v125 = 0u;
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    *(_OWORD *)buf = 0u;
    id v62 = sub_1000836CC();
    __int16 v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v64 = 3LL;
    }
    else {
      uint64_t v64 = 2LL;
    }
    int v113 = 67109378;
    *(_DWORD *)v114 = v61;
    *(_WORD *)&v114[4] = 2114;
    *(void *)&v114[6] = v111;
    LODWORD(v93) = 18;
    _os_log_send_and_compose_impl( v64,  0LL,  buf,  250LL,  &_mh_execute_header,  v63,  0LL,  "MSU Apply result: %d error:%{public}@",  &v113,  v93);
    int v66 = v65;

    id v67 = sub_1000836CC();
    int v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    _os_log_message_persist_impl(v66, 0LL, v68);

    if (v66 != buf) {
      free(v66);
    }
    id v69 = [(id)v111 copy];
    if (!v69) {
      id v69 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  12LL,  0LL));
    }
    CFTypeRef v70 = v111;
    if (v111) {
      CFRelease(v111);
    }
    id v71 = sub_1000836CC();
    __int128 v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "MSU Apply, about to close session.", buf, 2u);
    }

    MSUCloseUpdateHandle(v110);
    if (v70) {
      char v73 = 0;
    }
    else {
      char v73 = v61;
    }
    if ((v73 & 1) != 0)
    {
      if (-[PBOSSoftwareUpdateProcess _wasStartedForRestore](self, "_wasStartedForRestore"))
      {
        __int128 v134 = 0u;
        memset(v135, 0, sizeof(v135));
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v128 = 0u;
        __int128 v129 = 0u;
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        *(_OWORD *)buf = 0u;
        id v74 = sub_1000836CC();
        __int128 v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v76 = 3LL;
        }
        else {
          uint64_t v76 = 2LL;
        }
        LOWORD(v113) = 0;
        LODWORD(v94) = 2;
        _os_log_send_and_compose_impl( v76,  0LL,  buf,  250LL,  &_mh_execute_header,  v75,  0LL,  "RESTORE: Clearing all accounts before reboot.",  &v113,  v94);
        __int128 v78 = v77;

        id v79 = sub_1000836CC();
        __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
        _os_log_message_persist_impl(v78, 0LL, v80);

        if (v78 != buf) {
          free(v78);
        }
        sub_1001C97A0();
        __int128 v134 = 0u;
        memset(v135, 0, sizeof(v135));
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v128 = 0u;
        __int128 v129 = 0u;
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        *(_OWORD *)buf = 0u;
        id v81 = sub_1000836CC();
        __int128 v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v83 = 3LL;
        }
        else {
          uint64_t v83 = 2LL;
        }
        LOWORD(v113) = 0;
        LODWORD(v95) = 2;
        _os_log_send_and_compose_impl( v83,  0LL,  buf,  250LL,  &_mh_execute_header,  v82,  0LL,  "RESTORE: Account clearing complete.",  &v113,  v95);
        __int128 v85 = v84;

        id v86 = sub_1000836CC();
        __int128 v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        _os_log_message_persist_impl(v85, 0LL, v87);

        if (v85 != buf) {
          free(v85);
        }
      }

      while (1)
      {
        -[PBOSSoftwareUpdateProcess lastMSUPercentCompleted](self, "lastMSUPercentCompleted");
        if (v88 >= 100.0) {
          break;
        }
        objc_initWeak((id *)buf, self);
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472LL;
        v101[2] = sub_100047AD4;
        v101[3] = &unk_1003D0890;
        objc_copyWeak(&v102, (id *)buf);
        dispatch_sync(&_dispatch_main_q, v101);

        usleep(0x186A0u);
        objc_destroyWeak(&v102);
        objc_destroyWeak((id *)buf);
      }

      id v89 = sub_1000836CC();
      __int128 v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Queuing completion of update.", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472LL;
      v99[2] = sub_100047BB8;
      v99[3] = &unk_1003D0890;
      objc_copyWeak(&v100, (id *)buf);
      dispatch_async(&_dispatch_main_q, v99);

      objc_destroyWeak(&v100);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      objc_initWeak((id *)buf, self);
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472LL;
      v103[2] = sub_10004793C;
      v103[3] = &unk_1003D0418;
      objc_copyWeak(&v105, (id *)buf);
      id v104 = v69;
      dispatch_async(&_dispatch_main_q, v103);

      objc_destroyWeak(&v105);
      objc_destroyWeak((id *)buf);
    }

    _Block_object_dispose(v117, 8);
    goto LABEL_85;
  }

  id v57 = [(id)cf copy];
  if (!v57) {
    id v57 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  11LL,  0LL));
  }
  objc_initWeak((id *)buf, self);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472LL;
  v107[2] = sub_100047744;
  v107[3] = &unk_1003D0418;
  objc_copyWeak(&v109, (id *)buf);
  id v30 = v57;
  id v108 = v30;
  dispatch_async(&_dispatch_main_q, v107);
  if (cf) {
    CFRelease(cf);
  }
  if (v110) {
    ((void (*)(void))MSUCloseUpdateHandle)();
  }

  objc_destroyWeak(&v109);
  objc_destroyWeak((id *)buf);
LABEL_85:

  objc_autoreleasePoolPop(context);
}

- (id)_downloadProgressPhaseForCurrentState
{
  unint64_t v2 = -[PBOSSoftwareUpdateProcess state](self, "state");
  switch(v2)
  {
    case 3uLL:
      id v3 = (id *)&kPBSOSUpdatePhaseScanning;
      break;
    case 6uLL:
      id v3 = (id *)&kPBSOSUpdatePhasePreparing;
      break;
    case 4uLL:
      id v3 = (id *)&kPBSOSUpdatePhaseDownloading;
      break;
    default:
      id v4 = 0LL;
      return v4;
  }

  id v4 = *v3;
  return v4;
}

- (void)_handleAssetDownloadProgress:(id)a3
{
  id v4 = a3;
  -[PBOSSoftwareUpdateProcess setLastDownloadProgressNotification:](self, "setLastDownloadProgressNotification:", v4);
  if ([v4 isStalled])
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100048270;
    v16[3] = &unk_1003D0890;
    unsigned int v5 = &v17;
    objc_copyWeak(&v17, &location);
    id v6 = v16;
  }

  else
  {
    [v4 expectedTimeRemaining];
    double v8 = v7;
    if ((uint64_t)[v4 totalExpected] < 1)
    {
      float v10 = -1.0;
    }

    else
    {
      float v9 = (float)(uint64_t)[v4 totalWritten];
      float v10 = (float)(v9 / (float)(uint64_t)[v4 totalExpected]) * 100.0;
    }

    id v11 = sub_1000836CC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100273A78(v4, v12, v10);
    }

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000483D4;
    block[3] = &unk_1003D1C80;
    unsigned int v5 = v14;
    objc_copyWeak(v14, &location);
    float v15 = v10;
    v14[1] = v8;
    id v6 = block;
  }

  dispatch_async(&_dispatch_main_q, v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_handleBrainDownloadProgressCallbackWithState:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ASStateOperation]);
  float v9 = v8;
  if (!v7)
  {
    if (([v8 isEqualToString:ASOperationWaitingToDownload] & 1) != 0
      || [v9 isEqualToString:ASOperationDownloadingAsset])
    {
      id v21 = sub_1000836CC();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100273B4C();
      }

      goto LABEL_22;
    }

    if (([v9 isEqualToString:ASOperationVerifyingAsset] & 1) != 0
      || [v9 isEqualToString:ASOperationUnarchivingAsset])
    {
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ASStateOperationProgress]);
      id v32 = sub_100083870();
      unsigned __int8 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412546;
        *(id *)((char *)location + 4) = v9;
        WORD2(location[1]) = 2112;
        *(id *)((char *)&location[1] + 6) = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Brain %@ progress percent:%@",  (uint8_t *)location,  0x16u);
      }

      if (v31)
      {
        uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v31, v34) & 1) != 0)
        {
          [v31 floatValue];
          if (v35 > 0.0)
          {
            float v36 = v35 * 5.0;
            else {
              float v37 = v36;
            }
            objc_initWeak(location, self);
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472LL;
            _DWORD v56[2] = sub_100048DF4;
            v56[3] = &unk_1003D1CA8;
            objc_copyWeak(&v57, location);
            float v58 = v37;
            dispatch_async(&_dispatch_main_q, v56);
            objc_destroyWeak(&v57);
            objc_destroyWeak(location);
          }
        }
      }

      goto LABEL_22;
    }

    if ([v9 isEqualToString:ASOperationCompleted])
    {
      objc_initWeak(location, self);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_100048EFC;
      v54[3] = &unk_1003D0890;
      id v30 = &v55;
      objc_copyWeak(&v55, location);
      __int16 v38 = v54;
    }

    else
    {
      if (([v9 isEqualToString:ASOperationStalled] & 1) == 0
        && ![v9 isEqualToString:ASOperationDownloadPaused])
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
        __int128 v67 = 0u;
        memset(location, 0, sizeof(location));
        id v46 = sub_1000836CC();
        __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          uint64_t v48 = 3LL;
        }
        else {
          uint64_t v48 = 2LL;
        }
        int v62 = 138543362;
        id v63 = v9;
        _os_log_send_and_compose_impl( v48,  0LL,  location,  250LL,  &_mh_execute_header,  v47,  16LL,  "Unexpected brain operation %{public}@",  &v62,  12);
        id v18 = v49;

        id v50 = sub_1000836CC();
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        _os_log_message_persist_impl(v18, 16LL, v51);

        if (v18 != location) {
          goto LABEL_8;
        }
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
      __int128 v67 = 0u;
      memset(location, 0, sizeof(location));
      id v39 = sub_1000836CC();
      unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        uint64_t v41 = 3LL;
      }
      else {
        uint64_t v41 = 2LL;
      }
      int v62 = 138543362;
      id v63 = v9;
      _os_log_send_and_compose_impl( v41,  0LL,  location,  250LL,  &_mh_execute_header,  v40,  16LL,  "Brain progress stalled unexpectedly [%{public}@] - canceling.",  &v62,  12);
      __int128 v43 = v42;

      id v44 = sub_1000836CC();
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      _os_log_message_persist_impl(v43, 16LL, v45);

      if (v43 != location) {
        free(v43);
      }
      objc_initWeak(location, self);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472LL;
      v52[2] = sub_100048F9C;
      v52[3] = &unk_1003D0890;
      id v30 = &v53;
      objc_copyWeak(&v53, location);
      __int16 v38 = v52;
    }

    dispatch_async(&_dispatch_main_q, v38);
LABEL_21:
    objc_destroyWeak(v30);
    objc_destroyWeak(location);
    goto LABEL_22;
  }

  float v10 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if (![v10 isEqualToString:ASErrorDomain])
  {

    goto LABEL_15;
  }

  id v11 = [v7 code];

  if (v11 != (id)11)
  {
LABEL_15:
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
    __int128 v67 = 0u;
    memset(location, 0, sizeof(location));
    id v23 = sub_1000836CC();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      uint64_t v25 = 3LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    int v62 = 138543618;
    id v63 = v9;
    __int16 v64 = 2114;
    id v65 = v7;
    _os_log_send_and_compose_impl( v25,  0LL,  location,  250LL,  &_mh_execute_header,  v24,  16LL,  "Brain: Error during %{public}@: %{public}@",  &v62,  22);
    id v27 = v26;

    id v28 = sub_1000836CC();
    char v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    _os_log_message_persist_impl(v27, 16LL, v29);

    if (v27 != location) {
      free(v27);
    }
    objc_initWeak(location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100048D38;
    block[3] = &unk_1003D0418;
    id v30 = &v61;
    objc_copyWeak(&v61, location);
    id v60 = v7;
    dispatch_async(&_dispatch_main_q, block);

    goto LABEL_21;
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
  __int128 v67 = 0u;
  memset(location, 0, sizeof(location));
  id v12 = sub_1000836CC();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    uint64_t v14 = 3LL;
  }
  else {
    uint64_t v14 = 2LL;
  }
  float v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentState]);
  int v62 = 138543618;
  id v63 = v7;
  __int16 v64 = 2114;
  id v65 = v16;
  _os_log_send_and_compose_impl( v14,  0LL,  location,  250LL,  &_mh_execute_header,  v13,  16LL,  "Brain download canceled with error %{public}@ (our state:%{public}@)",  &v62,  22);
  id v18 = v17;

  id v19 = sub_1000836CC();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  _os_log_message_persist_impl(v18, 16LL, v20);

  if (v18 != location) {
LABEL_8:
  }
    free(v18);
LABEL_22:
}

- (void)_updateProgressStatus:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Error"]);
  if ([v5 length]) {
    goto LABEL_13;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMSUStatusKeyPercentComplete]);
  [v6 floatValue];
  float v8 = v7;
  -[PBOSSoftwareUpdateProcess setLastMSUPercentCompleted:](self, "setLastMSUPercentCompleted:");
  if ((unint64_t)++qword_100470128 <= 0x3E7)
  {
    float v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMSUStatusKeyActionText]);
    id v10 = sub_100083870();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v20 = (int)v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MSU: %d %@", buf, 0x12u);
    }

LABEL_9:
    goto LABEL_10;
  }

  if (qword_100470128 == 1000)
  {
    id v12 = sub_100083870();
    float v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Limiting MSU log output", buf, 2u);
    }

    goto LABEL_9;
  }

- (void)_cancelUpdatePreDownload
{
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
  __int128 v26 = 0u;
  id v3 = sub_1000836CC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  LOWORD(v25[0]) = 0;
  _os_log_send_and_compose_impl( v5,  0LL,  &v26,  250LL,  &_mh_execute_header,  v4,  0LL,  "Canceling update prior to download.",  v25,  2);
  float v7 = v6;

  id v8 = sub_1000836CC();
  float v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  _os_log_message_persist_impl(v7, 0LL, v9);

  if (v7 != &v26) {
    free(v7);
  }
  -[PBOSSoftwareUpdateProcess setNeedToCancelMSUOperation:](self, "setNeedToCancelMSUOperation:", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  [v10 refreshState];

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
    id v14 = [v13 state];

    if (v14 == (id)4)
    {
      float v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
      unsigned int v16 = [v15 cancelDownloadSync];

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
      __int128 v26 = 0u;
      id v17 = sub_1000836CC();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v19 = 3LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
      v25[0] = 67109120;
      v25[1] = v16;
      _os_log_send_and_compose_impl( v19,  0LL,  &v26,  250LL,  &_mh_execute_header,  v18,  0LL,  "Asset download canceled [%d].",  v25);
      __int16 v21 = v20;

      id v22 = sub_1000836CC();
      id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      _os_log_message_persist_impl(v21, 0LL, v23);

      if (v21 != &v26) {
        free(v21);
      }
    }
  }

  -[PBOSSoftwareUpdateProcess _clearInternalStateOnReturnToIdle](self, "_clearInternalStateOnReturnToIdle");
  -[PBOSSoftwareUpdateProcess _restoreAllPurgedApps](self, "_restoreAllPurgedApps");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  [v24 postEvent:off_100469290 withContext:0 userInfo:0];
}

- (void)_cancelUpdateDuringDownload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  [v3 refreshState];

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
  id v4 = sub_1000836CC();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  float v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  int v35 = 134217984;
  id v36 = [v7 state];
  _os_log_send_and_compose_impl( v6,  0LL,  &v37,  250LL,  &_mh_execute_header,  v5,  0LL,  "Canceling download asset in state: %ld",  &v35);
  float v9 = v8;

  id v10 = sub_1000836CC();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  _os_log_message_persist_impl(v9, 0LL, v11);

  if (v9 != &v37) {
    free(v9);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  3LL,  0LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", v13));
    [v14 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyDidSucceed];
    float v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess currentDownload](self, "currentDownload"));
    if (v15)
    {
      [v14 setObject:v15 forKey:PBSOSUpdateServiceKeyCurrentDownload];
    }

    else
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
      id v16 = sub_1000836CC();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v18 = 3LL;
      }
      else {
        uint64_t v18 = 2LL;
      }
      LOWORD(v35) = 0;
      _os_log_send_and_compose_impl( v18,  0LL,  &v37,  250LL,  &_mh_execute_header,  v17,  16LL,  "Current download not found during cancel.",  &v35,  2);
      int v20 = v19;

      id v21 = sub_1000836CC();
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      _os_log_message_persist_impl(v20, 16LL, v22);

      if (v20 != &v37) {
        free(v20);
      }
    }

    [v12 osUpdateProcessDidFinishDownloadWithData:v14];
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  id v24 = [v23 state];

  if (v24 == (id)4)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
    unsigned int v26 = [v25 cancelDownloadSync];

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
    id v27 = sub_1000836CC();
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v29 = 3LL;
    }
    else {
      uint64_t v29 = 2LL;
    }
    int v35 = 67109120;
    LODWORD(v36) = v26;
    _os_log_send_and_compose_impl( v29,  0LL,  &v37,  250LL,  &_mh_execute_header,  v28,  0LL,  "Asset download canceled [%d].",  &v35);
    __int128 v31 = v30;

    id v32 = sub_1000836CC();
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    _os_log_message_persist_impl(v31, 0LL, v33);

    if (v31 != &v37) {
      free(v31);
    }
  }

  -[PBOSSoftwareUpdateProcess _clearInternalStateOnReturnToIdle](self, "_clearInternalStateOnReturnToIdle");
  -[PBOSSoftwareUpdateProcess _restoreAllPurgedApps](self, "_restoreAllPurgedApps");
  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  [v34 postEvent:off_100469290 withContext:0 userInfo:0];
}

- (void)_cancelUpdateDuringApply
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  [v3 refreshState];

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
  __int128 v26 = 0u;
  id v4 = sub_1000836CC();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  float v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  int v24 = 134217984;
  id v25 = [v7 state];
  _os_log_send_and_compose_impl( v6,  0LL,  &v26,  250LL,  &_mh_execute_header,  v5,  0LL,  "Canceling apply asset in state: %ld",  &v24);
  float v9 = v8;

  id v10 = sub_1000836CC();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  _os_log_message_persist_impl(v9, 0LL, v11);

  if (v9 != &v26) {
    free(v9);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess brainLoader](self, "brainLoader"));

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess brainLoader](self, "brainLoader"));
    id v23 = 0LL;
    [v13 cancel:&v23];
    id v14 = v23;

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
    __int128 v26 = 0u;
    id v15 = sub_1000836CC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }

    int v24 = 138543362;
    id v25 = v14;
    _os_log_send_and_compose_impl( v17,  0LL,  &v26,  250LL,  &_mh_execute_header,  v16,  0LL,  "Brain loader canceled [%{public}@].",  &v24,  12);
    uint64_t v19 = v18;

    id v20 = sub_1000836CC();
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != &v26) {
      free(v19);
    }
    -[PBOSSoftwareUpdateProcess setBrainLoader:](self, "setBrainLoader:", 0LL);
  }

  -[PBOSSoftwareUpdateProcess _clearInternalStateOnReturnToIdle](self, "_clearInternalStateOnReturnToIdle");
  -[PBOSSoftwareUpdateProcess _restoreAllPurgedApps](self, "_restoreAllPurgedApps");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
  [v22 postEvent:off_100469290 withContext:0 userInfo:0];
}

- (void)_clearAssetDownloadSpace
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess currentDownload](self, "currentDownload"));
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v69 = PBSOSUpdateServiceKeyCurrentDownload;
      uint64_t v70 = v5;
      float v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
    }

    else
    {
      float v7 = 0LL;
    }

    [v4 osUpdateProcessDidStartDownloadWithData:v7];
  }

  id v8 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
  uint64_t v50 = 0LL;
  [v3 refreshState];
  if ([v3 state] == (id)2) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = [v3 spaceCheck:&v50];
  }
  __int128 v67 = 0u;
  memset(v68, 0, sizeof(v68));
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v54 = 0u;
  id v10 = sub_1000836CC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v12 = 3LL;
  }
  else {
    uint64_t v12 = 2LL;
  }
  id v13 = [v3 state];
  int v51 = 67109888;
  *(_DWORD *)__int128 v52 = v13 == (id)2;
  *(_WORD *)&void v52[4] = 1024;
  *(_DWORD *)&v52[6] = v9;
  *(_WORD *)id v53 = 2048;
  *(void *)&v53[2] = v50;
  *(_WORD *)&v53[10] = 2048;
  *(void *)&v53[12] = v8;
  _os_log_send_and_compose_impl( v12,  0LL,  &v54,  250LL,  &_mh_execute_header,  v11,  0LL,  "Asset download space check: asset installed:%d enoughSpace:%d requiredSpace:%lld unusedSpace:%llu",  &v51,  34,  v43,  v44);
  id v15 = v14;

  id v16 = sub_1000836CC();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  _os_log_message_persist_impl(v15, 0LL, v17);

  if (v15 != &v54) {
    free(v15);
  }
  if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
    char v18 = v9;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) != 0)
  {
    if ((v9 & 1) != 0)
    {
      -[PBOSSoftwareUpdateProcess _processDownloadSpaceCheckResultForRequiredSpace:hasSpace:error:]( self,  "_processDownloadSpaceCheckResultForRequiredSpace:hasSpace:error:");
    }

    else
    {
      __int128 v67 = 0u;
      memset(v68, 0, sizeof(v68));
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v54 = 0u;
      id v27 = sub_1000836CC();
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v29 = 3LL;
      }
      else {
        uint64_t v29 = 2LL;
      }
      LOWORD(v51) = 0;
      LODWORD(v42) = 2;
      _os_log_send_and_compose_impl( v29,  0LL,  &v54,  250LL,  &_mh_execute_header,  v28,  0LL,  "Asset space check returned insufficient space for asset download.",  &v51,  v42);
      __int128 v31 = v30;

      id v32 = sub_1000836CC();
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      _os_log_message_persist_impl(v31, 0LL, v33);

      if (v31 != &v54) {
        free(v31);
      }
      __int128 v67 = 0u;
      memset(v68, 0, sizeof(v68));
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v54 = 0u;
      id v34 = sub_1000836CC();
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v36 = 3LL;
      }
      else {
        uint64_t v36 = 2LL;
      }
      int v51 = 134218496;
      *(void *)__int128 v52 = v50;
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)id v53 = 157286400;
      *(_WORD *)&v53[4] = 2048;
      *(void *)&v53[6] = v50 + 157286400;
      _os_log_send_and_compose_impl( v36,  0LL,  &v54,  250LL,  &_mh_execute_header,  v35,  0LL,  "Space needed (%lld + %d buffer = %lld).",  &v51,  28,  v43);
      __int128 v38 = v37;

      id v39 = sub_1000836CC();
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      _os_log_message_persist_impl(v38, 0LL, v40);

      if (v38 != &v54) {
        free(v38);
      }
      v50 += 157286400LL;
      uint64_t v41 = v50;
      __int128 v43 = _NSConcreteStackBlock;
      uint64_t v44 = 3221225472LL;
      __int128 v45 = sub_10004A18C;
      __int128 v46 = &unk_1003D1CF8;
      __int128 v47 = self;
      id v48 = v3;
      uint64_t v49 = v50;
      -[PBOSSoftwareUpdateProcess _clearSpace:withCompletion:](self, "_clearSpace:withCompletion:", v41, &v43);
    }
  }

  else
  {
    __int128 v67 = 0u;
    memset(v68, 0, sizeof(v68));
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v54 = 0u;
    id v19 = sub_1000836CC();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    LOWORD(v51) = 0;
    LODWORD(v42) = 2;
    _os_log_send_and_compose_impl( v21,  0LL,  &v54,  250LL,  &_mh_execute_header,  v20,  16LL,  "Asset space check returned insufficient space but an invalid requiredSpace of OFF_MAX. Failing update.",  &v51,  v42);
    id v23 = v22;

    id v24 = sub_1000836CC();
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    _os_log_message_persist_impl(v23, 16LL, v25);

    if (v23 != &v54) {
      free(v23);
    }
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  9LL,  0LL));
    -[PBOSSoftwareUpdateProcess _processDownloadSpaceCheckResultForRequiredSpace:hasSpace:error:]( self,  "_processDownloadSpaceCheckResultForRequiredSpace:hasSpace:error:",  0LL,  0LL,  v26);
  }
}

- (void)_processDownloadSpaceCheckResultForRequiredSpace:(unint64_t)a3 hasSpace:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
  id v10 = v9;
  if (v8 || !v5 || (unint64_t)v9 <= a3)
  {
    if (v5 && (v8 || (unint64_t)v9 < a3))
    {
      __int128 v54 = 0u;
      memset(v55, 0, sizeof(v55));
      __int128 v52 = 0u;
      __int128 v53 = 0u;
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
      __int128 v41 = 0u;
      id v11 = sub_1000836CC();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      int v33 = 138544130;
      uint64_t v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) ? 3LL : 2LL;
      id v34 = v8;
      __int16 v35 = 1024;
      int v36 = 1;
      __int16 v37 = 2048;
      unint64_t v38 = a3;
      __int16 v39 = 2048;
      id v40 = v10;
      _os_log_send_and_compose_impl( v13,  0LL,  &v41,  250LL,  &_mh_execute_header,  v12,  16LL,  "Conflicting asset download space data [err:%{public}@ hasSpace:%d required:%llu unused:%llu].",  &v33,  38);
      id v15 = v14;

      id v16 = sub_1000836CC();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      _os_log_message_persist_impl(v15, 16LL, v17);

      if (v15 != &v41) {
        free(v15);
      }
    }

    char v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
    if (v18)
    {
      if (v8) {
        id v19 = v8;
      }
      else {
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  9LL,  0LL));
      }
      id v20 = v19;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", v19));
      [v21 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyDidSucceed];
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess currentDownload](self, "currentDownload"));
      if (v22)
      {
        [v21 setObject:v22 forKey:PBSOSUpdateServiceKeyCurrentDownload];
      }

      else
      {
        __int128 v54 = 0u;
        memset(v55, 0, sizeof(v55));
        __int128 v52 = 0u;
        __int128 v53 = 0u;
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
        __int128 v41 = 0u;
        id v23 = sub_1000836CC();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          uint64_t v25 = 3LL;
        }
        else {
          uint64_t v25 = 2LL;
        }
        LOWORD(v33) = 0;
        LODWORD(v32) = 2;
        _os_log_send_and_compose_impl( v25,  0LL,  &v41,  250LL,  &_mh_execute_header,  v24,  16LL,  "Current download not found during download space check.",  &v33,  v32);
        id v27 = v26;

        id v28 = sub_1000836CC();
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        _os_log_message_persist_impl(v27, 16LL, v29);

        if (v27 != &v41) {
          free(v27);
        }
      }

      id v30 = [v21 copy];
      [v18 osUpdateProcessDidFinishDownloadWithData:v30];
    }

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v31 postEvent:off_100469270 withContext:0 userInfo:0];
  }

  else
  {
    -[PBOSSoftwareUpdateProcess _continueWithSufficientSpaceFor:]( self,  "_continueWithSufficientSpaceFor:",  @"asset download");
  }
}

- (void)_clearBrainDownloadSpace
{
  id v3 = objc_alloc(&OBJC_CLASS___MSUUpdateBrainAssetLoader);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess asset](self, "asset"));
  BOOL v5 = -[MSUUpdateBrainAssetLoader initWithUpdateAsset:](v3, "initWithUpdateAsset:", v4);
  -[PBOSSoftwareUpdateProcess setBrainLoader:](self, "setBrainLoader:", v5);

  objc_initWeak(&location, self);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess spaceClearingQueue](self, "spaceClearingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004AA00;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v8, &location);
  void block[4] = self;
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_processBrainDownloadSpaceCheckResultForBrainSize:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  float v7 = v6;
  if (a3 < 0 && !v6)
  {
    __int128 v63 = 0u;
    memset(v64, 0, sizeof(v64));
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v50 = 0u;
    id v8 = sub_1000836CC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    *(_WORD *)__int128 v45 = 0;
    _os_log_send_and_compose_impl( v10,  0LL,  &v50,  250LL,  &_mh_execute_header,  v9,  16LL,  "Unexpected negative brain size without corresponding error. Failing update.",  v45,  2);
    uint64_t v12 = v11;

    id v13 = sub_1000836CC();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _os_log_message_persist_impl(v12, 16LL, v14);

    if (v12 != &v50) {
      free(v12);
    }
    float v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  9LL,  0LL));
  }

  id v15 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
  id v16 = v15;
  __int128 v63 = 0u;
  memset(v64, 0, sizeof(v64));
  if (v7) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = (uint64_t)v15 < a3;
  }
  int v18 = !v17;
  __int128 v61 = 0uLL;
  __int128 v62 = 0uLL;
  __int128 v59 = 0uLL;
  __int128 v60 = 0uLL;
  __int128 v57 = 0uLL;
  __int128 v58 = 0uLL;
  __int128 v55 = 0uLL;
  __int128 v56 = 0uLL;
  __int128 v53 = 0uLL;
  __int128 v54 = 0uLL;
  __int128 v51 = 0uLL;
  __int128 v52 = 0uLL;
  __int128 v50 = 0uLL;
  id v19 = sub_1000836CC();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  *(_DWORD *)__int128 v45 = 67109890;
  if (v21) {
    uint64_t v22 = 3LL;
  }
  else {
    uint64_t v22 = 2LL;
  }
  *(_DWORD *)&v45[4] = v18;
  *(_WORD *)&v45[8] = 2048;
  *(void *)&v45[10] = a3;
  __int16 v46 = 2048;
  id v47 = v16;
  __int16 v48 = 2114;
  __int128 v49 = v7;
  LODWORD(v43) = 38;
  _os_log_send_and_compose_impl( v22,  0LL,  &v50,  250LL,  &_mh_execute_header,  v20,  0LL,  "Brain download space recheck: hasSpace:%d requiredSpace:%lld unusedSpace:%llu error:%{public}@",  v45,  v43);
  id v24 = v23;

  id v25 = sub_1000836CC();
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  _os_log_message_persist_impl(v24, 0LL, v26);

  if (v24 != &v50) {
    free(v24);
  }
  if (v18)
  {
    -[PBOSSoftwareUpdateProcess _continueWithSufficientSpaceFor:]( self,  "_continueWithSufficientSpaceFor:",  @"brain download");
  }

  else
  {
    if (v7)
    {
      __int128 v63 = 0uLL;
      memset(v64, 0, sizeof(v64));
      __int128 v61 = 0uLL;
      __int128 v62 = 0uLL;
      __int128 v59 = 0uLL;
      __int128 v60 = 0uLL;
      __int128 v57 = 0uLL;
      __int128 v58 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v56 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v54 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v50 = 0uLL;
      id v27 = sub_1000836CC();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        uint64_t v29 = 3LL;
      }
      else {
        uint64_t v29 = 2LL;
      }
      *(_DWORD *)__int128 v45 = 138543362;
      *(void *)&v45[4] = v7;
      LODWORD(v44) = 12;
      _os_log_send_and_compose_impl( v29,  0LL,  &v50,  250LL,  &_mh_execute_header,  v28,  16LL,  "Unable to determine brain size [%{public}@]. Failing update.",  COERCE_DOUBLE(138543362LL),  v45,  v44,  *(_OWORD *)v45);
    }

    else
    {
      __int128 v63 = 0uLL;
      memset(v64, 0, sizeof(v64));
      __int128 v61 = 0uLL;
      __int128 v62 = 0uLL;
      __int128 v59 = 0uLL;
      __int128 v60 = 0uLL;
      __int128 v57 = 0uLL;
      __int128 v58 = 0uLL;
      __int128 v55 = 0uLL;
      __int128 v56 = 0uLL;
      __int128 v53 = 0uLL;
      __int128 v54 = 0uLL;
      __int128 v51 = 0uLL;
      __int128 v52 = 0uLL;
      __int128 v50 = 0uLL;
      id v31 = sub_1000836CC();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        uint64_t v33 = 3LL;
      }
      else {
        uint64_t v33 = 2LL;
      }
      *(_WORD *)__int128 v45 = 0;
      LODWORD(v44) = 2;
      _os_log_send_and_compose_impl( v33,  0LL,  &v50,  250LL,  &_mh_execute_header,  v28,  16LL,  "Insufficient brain download space.",  v32,  v45,  v44,  *(_OWORD *)v45);
    }

    id v34 = v30;

    id v35 = sub_1000836CC();
    int v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    _os_log_message_persist_impl(v34, 16LL, v36);

    if (v34 != &v50) {
      free(v34);
    }
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess delegate](self, "delegate"));
    if (v37)
    {
      if (v7) {
        id v38 = v7;
      }
      else {
        id v38 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  9LL,  0LL));
      }
      __int16 v39 = v38;
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess _resultUserInfoWithError:](self, "_resultUserInfoWithError:", v38));
      [v40 setObject:&__kCFBooleanFalse forKey:PBSOSUpdateServiceKeyDidSucceed];
      id v41 = [v40 copy];
      [v37 osUpdateProcessDidFinishApplyWithData:v41];
    }

    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess machine](self, "machine"));
    [v42 postEvent:off_100469270 withContext:0 userInfo:0];
  }
}

- (void)_clearPrepareAndApplySpace
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess spaceClearingQueue](self, "spaceClearingQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004B69C;
  v4[3] = &unk_1003D0890;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_clearPrepareAndApplySpaceWithInstallationSize:(unint64_t)a3 andPadding:(unint64_t)a4
{
  id v7 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
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
  *(_OWORD *)id location = 0u;
  id v8 = sub_1000836CC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  int v30 = 134218752;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = 3LL;
  }
  else {
    uint64_t v10 = 2LL;
  }
  unint64_t v31 = a4 + a3;
  __int16 v32 = 2048;
  id v33 = v7;
  __int16 v34 = 2048;
  unint64_t v35 = a3;
  __int16 v36 = 2048;
  unint64_t v37 = a4;
  _os_log_send_and_compose_impl( v10,  0LL,  location,  250LL,  &_mh_execute_header,  v9,  0LL,  "Prepare/Apply space check: requiredSpace:%llu unusedSpace:%llu (installationSize:%llu padding:%llu).",  &v30,  42,  block,  v24);
  uint64_t v12 = v11;

  id v13 = sub_1000836CC();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  _os_log_message_persist_impl(v12, 0LL, v14);

  if (v12 != location) {
    free(v12);
  }
  if (a4 + a3 <= (unint64_t)v7)
  {
    objc_initWeak(location, self);
    block = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    id v25 = sub_10004C068;
    __int128 v26 = &unk_1003D1D98;
    objc_copyWeak(v27, location);
    v27[1] = (id)(a4 + a3);
    dispatch_async(&_dispatch_main_q, &block);
    objc_destroyWeak(v27);
    objc_destroyWeak(location);
  }

  else
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
    *(_OWORD *)id location = 0u;
    id v15 = sub_1000836CC();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    int v30 = 134218240;
    unint64_t v31 = a4 + a3;
    __int16 v32 = 2048;
    id v33 = v7;
    LODWORD(v22) = 22;
    _os_log_send_and_compose_impl( v17,  0LL,  location,  250LL,  &_mh_execute_header,  v16,  0LL,  "Insufficient space for Prepare/Apply. Requesting total for this pass: %llu unused: %llu...",  &v30,  v22);
    id v19 = v18;

    id v20 = sub_1000836CC();
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != location) {
      free(v19);
    }
    objc_initWeak(location, self);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10004BC00;
    v28[3] = &unk_1003D1D70;
    objc_copyWeak(v29, location);
    v29[1] = (id)(a4 + a3);
    v29[2] = (id)a4;
    v29[3] = (id)a3;
    -[PBOSSoftwareUpdateProcess _clearSpace:withCompletion:](self, "_clearSpace:withCompletion:", a4 + a3, v28);
    objc_destroyWeak(v29);
    objc_destroyWeak(location);
  }

- (void)_clearSpace:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess spaceClearingQueue](self, "spaceClearingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004C18C;
  block[3] = &unk_1003D1DE8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (int64_t)_purgeOlderAppsToGetSpaceNeeded:(int64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess spaceClearingQueue](self, "spaceClearingQueue"));
  dispatch_assert_queue_V2(v5);

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v59[0] = 0LL;
  v59[1] = v59;
  v59[2] = 0x2020000000LL;
  v59[3] = 0LL;
  uint64_t v53 = 0LL;
  __int128 v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  __int128 v56 = sub_1000478DC;
  __int128 v57 = sub_1000478EC;
  id v58 = 0LL;
  id v7 = objc_alloc_init(&OBJC_CLASS___ASDPurgeableAppRequestOptions);
  [v7 setVolume:@"/private/var/"];
  [v7 setUrgency:4];
  __int128 v77 = 0u;
  memset(v78, 0, sizeof(v78));
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v64 = 0u;
  id v8 = sub_1000836CC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = 3LL;
  }
  else {
    uint64_t v10 = 2LL;
  }
  LOWORD(v60) = 0;
  _os_log_send_and_compose_impl( v10,  0LL,  &v64,  250LL,  &_mh_execute_header,  v9,  0LL,  "Determining size of default purgeable apps ...",  &v60,  2);
  uint64_t v12 = v11;

  id v13 = sub_1000836CC();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  _os_log_message_persist_impl(v12, 0LL, v14);

  if (v12 != &v64) {
    free(v12);
  }
  id v15 = [[ASDPurgeableAppRequest alloc] initWithOptions:v7];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10004D730;
  v49[3] = &unk_1003D1E10;
  __int128 v51 = v59;
  __int128 v52 = &v53;
  id v16 = v6;
  __int128 v50 = v16;
  [v15 startWithCompletionBlock:v49];
  dispatch_time_t v17 = dispatch_time(0LL, 120000000000LL);
  dispatch_semaphore_wait(v16, v17);
  if ([(id)v54[5] count])
  {
    int v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v19 = (void *)v54[5];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10004D9C4;
    v47[3] = &unk_1003D1E38;
    id v20 = v18;
    __int128 v48 = v20;
    [v19 enumerateObjectsUsingBlock:v47];
    id v46 = 0LL;
    int64_t v21 = -[PBOSSoftwareUpdateProcess _purgeAppsWithBundleIDs:spaceNeeded:error:]( self,  "_purgeAppsWithBundleIDs:spaceNeeded:error:",  v20,  a3,  &v46);
    id v22 = v46;
    if (v22)
    {
      __int128 v77 = 0u;
      memset(v78, 0, sizeof(v78));
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v64 = 0u;
      id v23 = sub_1000836CC();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        uint64_t v25 = 3LL;
      }
      else {
        uint64_t v25 = 2LL;
      }
      int v60 = 138543362;
      int64_t v61 = (int64_t)v22;
      LODWORD(v45) = 12;
      _os_log_send_and_compose_impl( v25,  0LL,  &v64,  250LL,  &_mh_execute_header,  v24,  16LL,  "Attempt to purge default apps failed. Error: %{public}@",  &v60,  v45);
      id v27 = v26;

      id v28 = sub_1000836CC();
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      _os_log_message_persist_impl(v27, 16LL, v29);
    }

    else
    {
      id v37 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
      __int128 v77 = 0u;
      memset(v78, 0, sizeof(v78));
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v64 = 0u;
      id v38 = sub_1000836CC();
      __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v40 = 3LL;
      }
      else {
        uint64_t v40 = 2LL;
      }
      int v60 = 134218240;
      int64_t v61 = v21;
      __int16 v62 = 2048;
      id v63 = v37;
      LODWORD(v45) = 22;
      _os_log_send_and_compose_impl( v40,  0LL,  &v64,  250LL,  &_mh_execute_header,  v39,  0LL,  "Default app purge cleared %lld bytes. (now %lld free)",  &v60,  v45);
      id v27 = v41;

      id v42 = sub_1000836CC();
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      _os_log_message_persist_impl(v27, 0LL, v43);
    }

    if (v27 != &v64) {
      free(v27);
    }
  }

  else
  {
    __int128 v77 = 0u;
    memset(v78, 0, sizeof(v78));
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v64 = 0u;
    id v30 = sub_1000836CC();
    unint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v32 = 3LL;
    }
    else {
      uint64_t v32 = 2LL;
    }
    LOWORD(v60) = 0;
    LODWORD(v45) = 2;
    _os_log_send_and_compose_impl( v32,  0LL,  &v64,  250LL,  &_mh_execute_header,  v31,  0LL,  "Found no default purgeable apps.",  &v60,  v45);
    __int16 v34 = v33;

    id v35 = sub_1000836CC();
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    _os_log_message_persist_impl(v34, 0LL, v36);

    if (v34 != &v64) {
      free(v34);
    }
    int64_t v21 = 0LL;
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v59, 8);

  return v21;
}

- (int64_t)_purgeManuallySelectedAppsToGetSpaceNeeded:(int64_t)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  id v7 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v5,  "initWithInfoStore:filter:delegate:",  v6,  &stru_1003D1E78,  0LL);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v60 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v7, "appInfos"));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10004E070;
  v66[3] = &unk_1003D0B78;
  id v58 = self;
  v66[4] = self;
  uint64_t v10 = v8;
  __int128 v67 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v66];

  -[NSMutableArray sortUsingComparator:](v10, "sortUsingComparator:", &stru_1003D1EB8);
  id v11 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v13 = v10;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v62,  v87,  16LL);
  int64_t v59 = a3;
  if (v14)
  {
    id v15 = v14;
    id v16 = 0LL;
    int64_t v17 = a3 - (void)v11;
    uint64_t v18 = *(void *)v63;
LABEL_3:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v63 != v18) {
        objc_enumerationMutation(v13);
      }
      id v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 diskUsage]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 staticUsage]);
      id v16 = &v16[(void)[v22 longLongValue]];

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
      [v12 addObject:v23];

      if (v15 == (id)++v19)
      {
        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v62,  v87,  16LL);
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    id v16 = 0LL;
  }

  if ([v12 count])
  {
    __int128 v85 = 0uLL;
    memset(v86, 0, sizeof(v86));
    __int128 v83 = 0uLL;
    __int128 v84 = 0uLL;
    __int128 v81 = 0uLL;
    __int128 v82 = 0uLL;
    __int128 v79 = 0uLL;
    __int128 v80 = 0uLL;
    __int128 v77 = 0uLL;
    __int128 v78 = 0uLL;
    __int128 v75 = 0uLL;
    __int128 v76 = 0uLL;
    __int128 v73 = 0uLL;
    __int128 v74 = 0uLL;
    __int128 v72 = 0uLL;
    id v24 = sub_1000836CC();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v26 = 3LL;
    }
    else {
      uint64_t v26 = 2LL;
    }
    id v27 = [v12 count];
    int v68 = 134218240;
    int64_t v69 = (int64_t)v27;
    __int16 v70 = 2048;
    __int128 v71 = v16;
    _os_log_send_and_compose_impl( v26,  0LL,  &v72,  250LL,  &_mh_execute_header,  v25,  0LL,  "Attempting to clear %ld apps manually to free %lld bytes.",  &v68,  22);
    uint64_t v29 = v28;

    id v30 = sub_1000836CC();
    unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    _os_log_message_persist_impl(v29, 0LL, v31);

    if (v29 != &v72) {
      free(v29);
    }
    id v61 = 0LL;
    int64_t v32 = -[PBOSSoftwareUpdateProcess _purgeAppsWithBundleIDs:spaceNeeded:error:]( v58,  "_purgeAppsWithBundleIDs:spaceNeeded:error:",  v12,  v59,  &v61);
    id v33 = v61;
    if (v33)
    {
      __int128 v85 = 0u;
      memset(v86, 0, sizeof(v86));
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v72 = 0u;
      id v34 = sub_1000836CC();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        uint64_t v36 = 3LL;
      }
      else {
        uint64_t v36 = 2LL;
      }
      int v68 = 138412290;
      int64_t v69 = (int64_t)v33;
      LODWORD(v57) = 12;
      _os_log_send_and_compose_impl( v36,  0LL,  &v72,  250LL,  &_mh_execute_header,  v35,  16LL,  "Attempt to purge manual apps failed. Error: %@{public}",  &v68,  v57);
      id v38 = v37;

      id v39 = sub_1000836CC();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      __int128 v41 = v38;
      uint64_t v42 = 16LL;
    }

    else
    {
      __int128 v50 = (char *)+[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
      __int128 v85 = 0u;
      memset(v86, 0, sizeof(v86));
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v72 = 0u;
      id v51 = sub_1000836CC();
      __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v53 = 3LL;
      }
      else {
        uint64_t v53 = 2LL;
      }
      int v68 = 134218240;
      int64_t v69 = v32;
      __int16 v70 = 2048;
      __int128 v71 = v50;
      LODWORD(v57) = 22;
      _os_log_send_and_compose_impl( v53,  0LL,  &v72,  250LL,  &_mh_execute_header,  v52,  0LL,  "Manual app purge cleared %lld bytes. (now %lld free)",  &v68,  v57);
      id v38 = v54;

      id v55 = sub_1000836CC();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v55);
      __int128 v41 = v38;
      uint64_t v42 = 0LL;
    }

    _os_log_message_persist_impl(v41, v42, v40);

    if (v38 != &v72) {
      free(v38);
    }
  }

  else
  {
    __int128 v85 = 0uLL;
    memset(v86, 0, sizeof(v86));
    __int128 v83 = 0uLL;
    __int128 v84 = 0uLL;
    __int128 v81 = 0uLL;
    __int128 v82 = 0uLL;
    __int128 v79 = 0uLL;
    __int128 v80 = 0uLL;
    __int128 v77 = 0uLL;
    __int128 v78 = 0uLL;
    __int128 v75 = 0uLL;
    __int128 v76 = 0uLL;
    __int128 v73 = 0uLL;
    __int128 v74 = 0uLL;
    __int128 v72 = 0uLL;
    id v43 = sub_1000836CC();
    __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v45 = 3LL;
    }
    else {
      uint64_t v45 = 2LL;
    }
    LOWORD(v68) = 0;
    _os_log_send_and_compose_impl( v45,  0LL,  &v72,  250LL,  &_mh_execute_header,  v44,  0LL,  "Found no manual purgeable apps.",  &v68,  2);
    __int128 v47 = v46;

    id v48 = sub_1000836CC();
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    _os_log_message_persist_impl(v47, 0LL, v49);

    if (v47 != &v72) {
      free(v47);
    }
    int64_t v32 = 0LL;
  }

  return v32;
}

- (BOOL)_isAppACandidateForOffLoading:(id)a3
{
  id v3 = a3;
  if ([v3 applicationDSID] || objc_msgSend(v3, "applicationDownloaderDSID"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesMetadata]);
    if (![v4 storeItemIdentifier]
      || ([v3 isPlaceholder] & 1) != 0
      || ![v3 isDeletable]
      || ([v3 isBeta] & 1) != 0
      || ([v3 isPlaceholder] & 1) != 0
      || ([v3 isProfileValidated] & 1) != 0
      || ([v3 applicationHasMIDBasedSINF] & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }

    else
    {
      unsigned int v5 = [v3 isLaunchProhibited] ^ 1;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (int64_t)_purgeAppsWithBundleIDs:(id)a3 spaceNeeded:(int64_t)a4 error:(id *)a5
{
  v143 = a5;
  id v148 = a3;
  dispatch_semaphore_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBOSSoftwareUpdateProcess spaceClearingQueue](self, "spaceClearingQueue"));
  dispatch_assert_queue_V2(v6);

  dispatch_semaphore_t v146 = dispatch_semaphore_create(0LL);
  v147 = +[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
  if (a4 > (uint64_t)v147)
  {
    uint64_t v159 = 0LL;
    v160 = &v159;
    uint64_t v161 = 0x3032000000LL;
    v162 = sub_1000478DC;
    v163 = sub_1000478EC;
    id v164 = 0LL;
    uint64_t v155 = 0LL;
    v156 = &v155;
    uint64_t v157 = 0x2020000000LL;
    uint64_t v158 = 0LL;
    __int128 v188 = 0u;
    memset(v189, 0, 26);
    __int128 v186 = 0u;
    __int128 v187 = 0u;
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    __int128 v176 = 0u;
    __int128 v177 = 0u;
    __int128 v175 = 0u;
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v149 = a4 - (void)v147;
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    id v10 = [v148 count];
    if (v9) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    int v165 = 134217984;
    id v166 = v10;
    _os_log_send_and_compose_impl( v11,  0LL,  &v175,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempting to purge %lu apps ...",  &v165);
    id v13 = v12;

    id v14 = sub_1000836CC();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    _os_log_message_persist_impl(v13, 0LL, v15);

    if (v13 != &v175) {
      free(v13);
    }
    id v16 = 0LL;
    uint64_t v145 = 134218752LL;
    while (1)
    {
      __int128 v188 = 0u;
      memset(v189, 0, 26);
      __int128 v186 = 0u;
      __int128 v187 = 0u;
      __int128 v184 = 0u;
      __int128 v185 = 0u;
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      __int128 v178 = 0u;
      __int128 v179 = 0u;
      __int128 v176 = 0u;
      __int128 v177 = 0u;
      __int128 v175 = 0u;
      id v17 = sub_1000836CC();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      int v165 = 134218240;
      if (v19) {
        uint64_t v20 = 3LL;
      }
      else {
        uint64_t v20 = 2LL;
      }
      id v166 = v16;
      __int16 v167 = 2048;
      v168 = (_BYTE *)v149;
      LODWORD(v135) = 22;
      _os_log_send_and_compose_impl( v20,  0LL,  &v175,  250LL,  &_mh_execute_header,  v18,  0LL,  "Purge attempt %ld for %lld bytes ...",  &v165,  v135);
      id v22 = v21;

      id v23 = sub_1000836CC();
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      _os_log_message_persist_impl(v22, 0LL, v24);

      if (v22 != &v175) {
        free(v22);
      }
      id v25 = objc_alloc_init(&OBJC_CLASS___ASDPurgeAppsRequestOptions);
      [v25 setVolume:@"/private/var/"];
      [v25 setUrgency:4];
      [v25 setApps:v148];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v149));
      [v25 setDesiredPurgeAmount:v26];

      id v27 = [[ASDPurgeAppsRequest alloc] initWithOptions:v25];
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472LL;
      v151[2] = sub_10004F230;
      v151[3] = &unk_1003D1EE0;
      v153 = &v159;
      v154 = &v155;
      id v28 = v146;
      v152 = v28;
      [v27 startWithCompletionBlock:v151];
      dispatch_time_t v29 = dispatch_time(0LL, 120000000000LL);
      dispatch_semaphore_wait(v28, v29);
      uint64_t v30 = v156[3];
      unint64_t v31 = (char *)+[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
      __int128 v188 = 0u;
      memset(v189, 0, 26);
      __int128 v186 = 0u;
      __int128 v187 = 0u;
      __int128 v184 = 0u;
      __int128 v185 = 0u;
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      __int128 v178 = 0u;
      __int128 v179 = 0u;
      __int128 v176 = 0u;
      __int128 v177 = 0u;
      __int128 v175 = 0u;
      id v32 = sub_1000836CC();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      id v34 = &v147[v30];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v35 = 3LL;
      }
      else {
        uint64_t v35 = 2LL;
      }
      int64_t v36 = v156[3];
      int v165 = 134219008;
      id v166 = v16;
      __int16 v167 = 2048;
      v168 = v147;
      __int16 v169 = 2048;
      int64_t v170 = v36;
      __int16 v171 = 2048;
      v172 = &v147[v30];
      __int16 v173 = 2048;
      v174 = v31;
      LODWORD(v136) = 52;
      _os_log_send_and_compose_impl( v35,  0LL,  &v175,  250LL,  &_mh_execute_header,  v33,  0LL,  "Post-purge [%ld] unused space expected: (initial unused: %lld + claimed purged: %lld = %lld) current: %lld.",  &v165,  v136,  v140,  v143,  v145);
      id v38 = v37;

      id v39 = sub_1000836CC();
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      _os_log_message_persist_impl(v38, 0LL, v40);

      if (v38 != &v175) {
        free(v38);
      }
      if (!v160[5] && v31 < v34)
      {
        uint64_t v41 = 30LL;
        while (1)
        {
          sleep(1u);
          uint64_t v42 = (char *)+[TVSDiskSpaceUtility mediaFreeSpace](&OBJC_CLASS___TVSDiskSpaceUtility, "mediaFreeSpace");
          id v43 = v42;
          if (v42 >= v34) {
            break;
          }
          if (v42 <= v31)
          {
            __int128 v188 = 0uLL;
            memset(v189, 0, 26);
            __int128 v186 = 0uLL;
            __int128 v187 = 0uLL;
            __int128 v184 = 0uLL;
            __int128 v185 = 0uLL;
            __int128 v182 = 0uLL;
            __int128 v183 = 0uLL;
            __int128 v180 = 0uLL;
            __int128 v181 = 0uLL;
            __int128 v178 = 0uLL;
            __int128 v179 = 0uLL;
            __int128 v176 = 0uLL;
            __int128 v177 = 0uLL;
            __int128 v175 = 0uLL;
            id v61 = sub_1000836CC();
            __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
            BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
            int v165 = 134218496;
            if (v63) {
              uint64_t v64 = 3LL;
            }
            else {
              uint64_t v64 = 2LL;
            }
            id v166 = v34;
            __int16 v167 = 2048;
            v168 = v31;
            __int16 v169 = 2048;
            int64_t v170 = (int64_t)v43;
            LODWORD(v137) = 32;
            _os_log_send_and_compose_impl( v64,  0LL,  &v175,  250LL,  &_mh_execute_header,  v62,  0LL,  "Unused space stopped changing or dropped during sleep, expected: %lld previous: %lld current: %lld",  &v165,  v137,  v141);
            __int128 v66 = v65;

            id v67 = sub_1000836CC();
            int v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
            _os_log_message_persist_impl(v66, 0LL, v68);

            if (v66 != &v175)
            {
              int v60 = v66;
              goto LABEL_40;
            }

            goto LABEL_41;
          }

          __int128 v188 = 0uLL;
          memset(v189, 0, 26);
          __int128 v186 = 0uLL;
          __int128 v187 = 0uLL;
          __int128 v184 = 0uLL;
          __int128 v185 = 0uLL;
          __int128 v182 = 0uLL;
          __int128 v183 = 0uLL;
          __int128 v180 = 0uLL;
          __int128 v181 = 0uLL;
          __int128 v178 = 0uLL;
          __int128 v179 = 0uLL;
          __int128 v176 = 0uLL;
          __int128 v177 = 0uLL;
          __int128 v175 = 0uLL;
          id v44 = sub_1000836CC();
          uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
          int v165 = 134218240;
          if (v46) {
            uint64_t v47 = 3LL;
          }
          else {
            uint64_t v47 = 2LL;
          }
          id v166 = v34;
          __int16 v167 = 2048;
          v168 = v43;
          LODWORD(v137) = 22;
          _os_log_send_and_compose_impl( v47,  0LL,  &v175,  250LL,  &_mh_execute_header,  v45,  0LL,  "Slept for 1 second and rechecked unused space, expected: %lld current: %lld",  &v165,  v137);
          __int128 v49 = v48;

          id v50 = sub_1000836CC();
          id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          _os_log_message_persist_impl(v49, 0LL, v51);

          if (v49 != &v175) {
            free(v49);
          }
          unint64_t v31 = v43;
          if (!--v41) {
            goto LABEL_41;
          }
        }

        __int128 v188 = 0uLL;
        memset(v189, 0, 26);
        __int128 v186 = 0uLL;
        __int128 v187 = 0uLL;
        __int128 v184 = 0uLL;
        __int128 v185 = 0uLL;
        __int128 v182 = 0uLL;
        __int128 v183 = 0uLL;
        __int128 v180 = 0uLL;
        __int128 v181 = 0uLL;
        __int128 v178 = 0uLL;
        __int128 v179 = 0uLL;
        __int128 v176 = 0uLL;
        __int128 v177 = 0uLL;
        __int128 v175 = 0uLL;
        id v52 = sub_1000836CC();
        uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
        int v165 = 134218240;
        if (v54) {
          uint64_t v55 = 3LL;
        }
        else {
          uint64_t v55 = 2LL;
        }
        id v166 = v34;
        __int16 v167 = 2048;
        v168 = v43;
        LODWORD(v137) = 22;
        _os_log_send_and_compose_impl( v55,  0LL,  &v175,  250LL,  &_mh_execute_header,  v53,  0LL,  "Sleeping cleared expected space, expected: %lld current: %lld.",  &v165,  v137);
        uint64_t v57 = v56;

        id v58 = sub_1000836CC();
        int64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        _os_log_message_persist_impl(v57, 0LL, v59);

        if (v57 != &v175)
        {
          int v60 = v57;
LABEL_40:
          free(v60);
        }
      }

- (void)_restoreAllPurgedApps
{
  id v2 = sub_1000836CC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  v15[0] = 0;
  _os_log_send_and_compose_impl(v4, 0LL, v16, 250LL, &_mh_execute_header, v3, 0LL, "Restoring all purged apps.", v15, 2);
  dispatch_semaphore_t v6 = v5;

  id v7 = sub_1000836CC();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  _os_log_message_persist_impl(v6, 0LL, v8);

  if (v6 != v16) {
    free(v6);
  }
  id v9 = [[ASDRestoreDemotedApplicationsRequestOptions alloc] initWithBundleIDs:0];
  id v10 = [[ASDRestoreDemotedApplicationsRequest alloc] initWithOptions:v9];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004F5E0;
  v13[3] = &unk_1003D1F08;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  uint64_t v11 = v14;
  [v10 startWithCompletionBlock:v13];
  dispatch_time_t v12 = dispatch_time(0LL, 120LL);
  dispatch_semaphore_wait(v11, v12);
}

- (BOOL)_isManagedAction
{
  return (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)6
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)7
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)8;
}

+ (int64_t)_compareOSVersion:(id)a3 andBuild:(id)a4 withOSVersion:(id)a5 andBuild:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unint64_t v11 = (unint64_t)objc_msgSend(a3, "tvs_threePartVersionCompare:", a5) - 2;
  if (v11 >= 6)
  {
    if (v9 && v10)
    {
      int64_t v12 = (int64_t)[v9 compare:v10 options:64];
    }

    else if (!v9 || v10)
    {
      if (v9) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v10 == 0LL;
      }
      uint64_t v14 = !v13;
      int64_t v12 = v14 << 63 >> 63;
    }

    else
    {
      int64_t v12 = 1LL;
    }
  }

  else
  {
    int64_t v12 = qword_1002EC148[v11];
  }

  return v12;
}

- (BOOL)_wasStartedForRestore
{
  return (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)9;
}

- (BOOL)_wasStartedByBackgroundCheck
{
  return (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)4
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)3
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)5
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)6
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)7
      || (id)-[PBOSSoftwareUpdateProcess action](self, "action") == (id)8;
}

- (void)_continueWithSufficientSpaceFor:(id)a3
{
  __int128 v29 = 0u;
  memset(v30, 0, sizeof(v30));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  *(_OWORD *)id location = 0u;
  id v4 = a3;
  id v5 = sub_1000836CC();
  dispatch_semaphore_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = 3LL;
  }
  else {
    uint64_t v7 = 2LL;
  }

  int v14 = 138543362;
  id v15 = v4;
  _os_log_send_and_compose_impl( v7,  0LL,  location,  250LL,  &_mh_execute_header,  v6,  0LL,  "Sufficient %{public}@ space.",  &v14,  12);
  id v9 = v8;

  id v10 = sub_1000836CC();
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  _os_log_message_persist_impl(v9, 0LL, v11);

  if (v9 != location) {
    free(v9);
  }
  objc_initWeak(location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004FA6C;
  block[3] = &unk_1003D0890;
  objc_copyWeak(&v13, location);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(location);
}

- (id)_brainAssetDownloadOptions
{
  id v2 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
  [v2 setDiscretionary:0];
  return v2;
}

- (void)_clearInternalStateOnReturnToIdle
{
}

- (id)_resultUserInfoWithError:(id)a3
{
  id v22 = a3;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBOSSoftwareUpdateProcess _wasStartedByBackgroundCheck](self, "_wasStartedByBackgroundCheck")));
  uint64_t v20 = PBSOSUpdateServiceKeyIsAutoCheck;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[PBOSSoftwareUpdateProcess action](self, "action")));
  uint64_t v18 = PBSOSUpdateServiceKeyTriggerAction;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBOSSoftwareUpdateProcess _wasStartedForRestore](self, "_wasStartedForRestore")));
  uint64_t v17 = PBSOSUpdateServiceKeyIsRestore;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_assetIsLarge));
  uint64_t v6 = PBSOSUpdateServiceKeyIsLargeUpdate;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBOSSoftwareUpdateProcess isApplyingRecheckedUpdate](self, "isApplyingRecheckedUpdate")));
  uint64_t v8 = PBSOSUpdateServiceKeyIsRedownload;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBOSSoftwareUpdateProcess userConfirmedApplyAtCheckTime](self, "userConfirmedApplyAtCheckTime")));
  uint64_t v10 = PBSOSUpdateServiceKeyDidConfirmApply;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBOSSoftwareUpdateProcess _isManagedAction](self, "_isManagedAction")));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v21,  v20,  v19,  v18,  v4,  v17,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  PBSOSUpdateServiceKeyIsManagedAction,  0LL));

  if (v22)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v22 code]));
    [v12 setObject:v13 forKey:PBSOSUpdateServiceKeyDidFailErrorCode];

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
    [v12 setObject:v14 forKey:PBSOSUpdateServiceKeyDidFailErrorDomain];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedDescription]);
    [v12 setObject:v15 forKey:PBSOSUpdateServiceKeyDidFailErrorString];
  }

  return v12;
}

- (void)_storeURLBagLoaded:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self name:TVSURLBagDidLoadNotification object:0];

  id v5 = sub_1000836CC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100273C28();
  }

  +[PBOSSoftwareUpdateMonitor noteStage:](&OBJC_CLASS___PBOSSoftwareUpdateMonitor, "noteStage:", off_10046C3D0[0]);
}

- (id)_stringForCancelReason:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"unknown";
  }
  else {
    return off_1003D1F68[a3 - 1];
  }
}

- (PBSOSSoftwareUpdateProcessDelegate)delegate
{
  return (PBSOSSoftwareUpdateProcessDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (TVSStateMachine)machine
{
  return self->_machine;
}

- (void)setMachine:(id)a3
{
}

- (unint64_t)deferredAction
{
  return self->_deferredAction;
}

- (void)setDeferredAction:(unint64_t)a3
{
  self->_deferredAction = a3;
}

- (PBSOSUpdateScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSDate)assetReleaseDate
{
  return self->_assetReleaseDate;
}

- (void)setAssetReleaseDate:(id)a3
{
}

- (MSUUpdateBrainAssetLoader)brainLoader
{
  return self->_brainLoader;
}

- (void)setBrainLoader:(id)a3
{
}

- (BOOL)needToCancelMSUOperation
{
  return self->_needToCancelMSUOperation;
}

- (void)setNeedToCancelMSUOperation:(BOOL)a3
{
  self->_needToCancelMSUOperation = a3;
}

- (BOOL)assetIsLarge
{
  return self->_assetIsLarge;
}

- (void)setAssetIsLarge:(BOOL)a3
{
  self->_assetIsLarge = a3;
}

- (BOOL)downloadAssetWithDiscretionaryPriority
{
  return self->_downloadAssetWithDiscretionaryPriority;
}

- (void)setDownloadAssetWithDiscretionaryPriority:(BOOL)a3
{
  self->_downloadAssetWithDiscretionaryPriority = a3;
}

- (BOOL)isApplyingRecheckedUpdate
{
  return self->_isApplyingRecheckedUpdate;
}

- (void)setIsApplyingRecheckedUpdate:(BOOL)a3
{
  self->_isApplyingRecheckedUpdate = a3;
}

- (BOOL)sentDownloadFinishedCallback
{
  return self->_sentDownloadFinishedCallback;
}

- (void)setSentDownloadFinishedCallback:(BOOL)a3
{
  self->_sentDownloadFinishedCallback = a3;
}

- (BOOL)userConfirmedApplyAtCheckTime
{
  return self->_userConfirmedApplyAtCheckTime;
}

- (void)setUserConfirmedApplyAtCheckTime:(BOOL)a3
{
  self->_userConfirmedApplyAtCheckTime = a3;
}

- (float)lastMSUPercentCompleted
{
  return self->_lastMSUPercentCompleted;
}

- (void)setLastMSUPercentCompleted:(float)a3
{
  self->_lastMSUPercentCompleted = a3;
}

- (MAProgressNotification)lastDownloadProgressNotification
{
  return self->_lastDownloadProgressNotification;
}

- (void)setLastDownloadProgressNotification:(id)a3
{
}

- (OS_dispatch_queue)spaceClearingQueue
{
  return self->_spaceClearingQueue;
}

- (void)setSpaceClearingQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end