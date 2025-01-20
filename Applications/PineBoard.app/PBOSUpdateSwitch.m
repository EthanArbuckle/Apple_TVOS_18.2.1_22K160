@interface PBOSUpdateSwitch
+ (BOOL)IsAwaitingRebootToApply;
+ (BOOL)isCheckingForUpdate;
+ (BOOL)isRunning;
+ (BOOL)performsBackgroundApply;
+ (PBDependencyDescription)dependencyDescription;
+ (id)_sharedInstance;
+ (id)isAssetReadyToInstallForUpdate:(id)a3;
+ (unint64_t)action;
+ (void)cancelForReason:(unint64_t)a3;
+ (void)currentDownload:(id)a3;
+ (void)downloadOnlyWithOptions:(id)a3 completion:(id)a4;
+ (void)installOnlyWithDescriptor:(id)a3 options:(id)a4 completion:(id)a5;
+ (void)purgeDownloadWithCompletion:(id)a3;
+ (void)resumeAfterDownload;
+ (void)resumeAfterUpdateCheck;
+ (void)scheduleUpdateChecks:(BOOL)a3;
+ (void)setAssetDownloadIsDiscretionary:(BOOL)a3;
+ (void)setProcessDelegate:(id)a3;
+ (void)startAction:(unint64_t)a3 withOptions:(id)a4 completion:(id)a5;
+ (void)startWithCompletion:(id)a3;
- (BOOL)readyForUse;
- (BOOL)startingUp;
- (BOOL)useNewProcess;
- (PBOSSoftwareUpdateProcess)legacyProcess;
- (PBOSUpdateSwitch)init;
- (PBSOSSoftwareUpdateProcessDelegate)delegate;
- (PBSOSUpdateProcessBridge)tvOSProcessBridge;
- (void)disableSUController;
- (void)forceAction:(int64_t)a3 withUrgency:(int64_t)a4;
- (void)osUpdateProcessDidFinishApplyWithData:(id)a3;
- (void)osUpdateProcessDidFinishCheckWithData:(id)a3;
- (void)osUpdateProcessDidFinishDownloadWithData:(id)a3;
- (void)osUpdateProcessDidStartApplyWithData:(id)a3;
- (void)osUpdateProcessDidStartCheckWithData:(id)a3;
- (void)osUpdateProcessDidStartDownloadWithData:(id)a3;
- (void)osUpdateProcessDidStartRedownloadWithData:(id)a3;
- (void)osUpdateProcessDidUpdateApplyProgressWithData:(id)a3;
- (void)osUpdateProcessDidUpdateDownloadProgressWithData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyProcess:(id)a3;
- (void)setReadyForUse:(BOOL)a3;
- (void)setStartingUp:(BOOL)a3;
- (void)setTvOSProcessBridge:(id)a3;
- (void)setUseNewProcess:(BOOL)a3;
@end

@implementation PBOSUpdateSwitch

+ (id)_sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A50C0;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471298 != -1) {
    dispatch_once(&qword_100471298, block);
  }
  return (id)qword_100471290;
}

- (PBOSUpdateSwitch)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBOSUpdateSwitch;
  v2 = -[PBOSUpdateSwitch init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_startingUp = 0;
    v2->_useNewProcess = 0;
    +[PBSOSUpdateProcessBridge determineNextOTAImplementation]( &OBJC_CLASS___PBSOSUpdateProcessBridge,  "determineNextOTAImplementation");
  }

  return v3;
}

- (void)disableSUController
{
  id v2 = sub_1000836CC();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  v14[0] = 0;
  _os_log_send_and_compose_impl( v4,  0LL,  v15,  250LL,  &_mh_execute_header,  v3,  0LL,  "Disabling SUController for legacy update..",  v14,  2);
  v6 = v5;

  id v7 = sub_1000836CC();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  _os_log_message_persist_impl(v6, 0LL, v8);

  if (v6 != v15) {
    free(v6);
  }
  v9 = -[SUControllerManager initWithDelegate:](objc_alloc(&OBJC_CLASS___SUControllerManager), "initWithDelegate:", 0LL);
  v10 = objc_alloc_init(&OBJC_CLASS___SUControllerConfig);
  -[SUControllerConfig setPerformAutoScan:](v10, "setPerformAutoScan:", 0LL);
  -[SUControllerConfig setPerformAutoInstall:](v10, "setPerformAutoInstall:", 0LL);
  -[SUControllerConfig setPerformAutoDownloadAndPrepare:](v10, "setPerformAutoDownloadAndPrepare:", 0LL);
  -[SUControllerConfig setAutoActivityCheckPeriod:](v10, "setAutoActivityCheckPeriod:", 0x7FFFFFFFLL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001A5300;
  v12[3] = &unk_1003DB2A8;
  v13 = v9;
  v11 = v9;
  -[SUControllerManager modifyConfig:modifying:completion:](v11, "modifyConfig:modifying:completion:", v10, 23LL, v12);
}

+ (void)startWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must be on the main thread"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028AFB0();
    }
    _bs_set_crash_log_message([v42 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A5A50LL);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v5 startingUp])
  {
    __int128 v65 = 0u;
    memset(v66, 0, sizeof(v66));
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
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v52 = 0u;
    id v6 = sub_1000836CC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    LOWORD(v51[0]) = 0;
    _os_log_send_and_compose_impl( v8,  0LL,  &v52,  250LL,  &_mh_execute_header,  v7,  16LL,  "Attempt to start update switch when already starting.",  v51,  2);
    v10 = v9;

    id v11 = sub_1000836CC();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _os_log_message_persist_impl(v10, 16LL, v12);

    if (v10 != &v52) {
      free(v10);
    }
LABEL_9:
    v4[2](v4);
    goto LABEL_10;
  }

  [v5 setStartingUp:1];
  __int128 v65 = 0u;
  memset(v66, 0, sizeof(v66));
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
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v52 = 0u;
  id v13 = sub_1000836CC();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v15) {
    uint64_t v17 = 3LL;
  }
  else {
    uint64_t v17 = 2LL;
  }
  v51[0] = 67109120;
  v51[1] = OTAImplementationType(v15, v16) == 2;
  _os_log_send_and_compose_impl( v17,  0LL,  &v52,  250LL,  &_mh_execute_header,  v14,  0LL,  "Setting MSU AppleConnect default to %{BOOL}d",  v51,  8);
  v19 = v18;

  id v20 = sub_1000836CC();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  _os_log_message_persist_impl(v19, 0LL, v21);

  if (v19 != &v52) {
    free(v19);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  objc_msgSend(v22, "setMsuUsesAppleConnect:", OTAImplementationType(v22, v23) == 2);

  if (OTAImplementationType(v24, v25) == 2)
  {
    __int128 v65 = 0uLL;
    memset(v66, 0, sizeof(v66));
    __int128 v63 = 0uLL;
    __int128 v64 = 0uLL;
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
    __int128 v52 = 0uLL;
    id v26 = sub_1000836CC();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v28 = 3LL;
    }
    else {
      uint64_t v28 = 2LL;
    }
    LOWORD(v51[0]) = 0;
    LODWORD(v43) = 2;
    _os_log_send_and_compose_impl( v28,  0LL,  &v52,  250LL,  &_mh_execute_header,  v27,  0LL,  "------- Using TVOSUpdate framework------- ",  v51,  v43);
    v30 = v29;

    id v31 = sub_1000836CC();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    _os_log_message_persist_impl(v30, 0LL, v32);

    if (v30 != &v52) {
      free(v30);
    }
    v33 = -[PBSOSUpdateProcessBridge initWithDelegate:forcedActionDelegate:]( objc_alloc(&OBJC_CLASS___PBSOSUpdateProcessBridge),  "initWithDelegate:forcedActionDelegate:",  v5,  v5);
    [v5 setUseNewProcess:1];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001A5A58;
    v47[3] = &unk_1003D2F08;
    id v48 = v5;
    v49 = v33;
    v50 = v4;
    v34 = v33;
    -[PBSOSUpdateProcessBridge startWithCompletion:](v34, "startWithCompletion:", v47);
  }

  else
  {
    __int128 v65 = 0uLL;
    memset(v66, 0, sizeof(v66));
    __int128 v63 = 0uLL;
    __int128 v64 = 0uLL;
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
    __int128 v52 = 0uLL;
    id v35 = sub_1000836CC();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v37 = 3LL;
    }
    else {
      uint64_t v37 = 2LL;
    }
    LOWORD(v51[0]) = 0;
    LODWORD(v43) = 2;
    _os_log_send_and_compose_impl( v37,  0LL,  &v52,  250LL,  &_mh_execute_header,  v36,  0LL,  "------- Using legacy code paths -------",  v51,  v43);
    v39 = v38;

    id v40 = sub_1000836CC();
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    _os_log_message_persist_impl(v39, 0LL, v41);

    if (v39 != &v52) {
      free(v39);
    }
    [v5 disableSUController];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1001A5AA4;
    v44[3] = &unk_1003DB2D0;
    id v45 = v5;
    v46 = v4;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v45,  v44);
  }

+ (void)setProcessDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  [v5 setDelegate:v4];
}

+ (void)scheduleUpdateChecks:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    __int128 v40 = 0u;
    memset(v41, 0, sizeof(v41));
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v27 = 0u;
    id v7 = sub_1000836CC();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v26[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  &v27,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to schedule checks before readyForUse",  v26,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != &v27) {
      free(v11);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v14 useNewProcess])
  {
    __int128 v40 = 0u;
    memset(v41, 0, sizeof(v41));
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v27 = 0u;
    id v15 = sub_1000836CC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    v26[0] = 0;
    LODWORD(v25) = 2;
    _os_log_send_and_compose_impl( v17,  0LL,  &v27,  250LL,  &_mh_execute_header,  v16,  0LL,  "Not scheduling legacy update check timers - tvOSU enabled.",  v26,  v25);
    v19 = v18;

    id v20 = sub_1000836CC();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 0LL, v21);

    if (v19 != &v27) {
      free(v19);
    }
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBSoftwareUpdateService sharedInstance](&OBJC_CLASS___PBSoftwareUpdateService, "sharedInstance"));
    uint64_t v23 = v22;
    if (v3)
    {
      [v22 _scheduleOSUpdateOnSleepCheck];
    }

    else
    {
      [v22 _scheduleOSUpdateCheck];

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBSoftwareUpdateService sharedInstance](&OBJC_CLASS___PBSoftwareUpdateService, "sharedInstance"));
      [v24 _scheduleDailyOSUpdateReporting];
    }
  }
}

+ (void)startAction:(unint64_t)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"completion required"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B058();
    }
    _bs_set_crash_log_message([v66 UTF8String]);
    __break(0);
    JUMPOUT(0x1001A64CCLL);
  }

  v10 = (void (**)(void, void, void))v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v12 = [v11 readyForUse];

  if ((v12 & 1) == 0)
  {
    __int128 v88 = 0u;
    memset(v89, 0, sizeof(v89));
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v75 = 0u;
    id v13 = sub_1000836CC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    LOWORD(v71) = 0;
    _os_log_send_and_compose_impl( v15,  0LL,  &v75,  250LL,  &_mh_execute_header,  v14,  0LL,  "Attempt to start action when not readyForUse.",  &v71,  2);
    uint64_t v17 = v16;

    id v18 = sub_1000836CC();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    _os_log_message_persist_impl(v17, 0LL, v19);

    if (v17 != &v75) {
      free(v17);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 legacyProcess]);
  if (v21)
  {
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 tvOSProcessBridge]);

    if (!v22)
    {
      __int128 v88 = 0u;
      memset(v89, 0, sizeof(v89));
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v75 = 0u;
      id v58 = sub_1000836CC();
      __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
        uint64_t v60 = 3LL;
      }
      else {
        uint64_t v60 = 2LL;
      }
      LOWORD(v71) = 0;
      LODWORD(v67) = 2;
      _os_log_send_and_compose_impl( v60,  0LL,  &v75,  250LL,  &_mh_execute_header,  v59,  17LL,  "Unexpected nil shared instance.",  &v71,  v67);
      __int128 v62 = v61;

      id v63 = sub_1000836CC();
      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      _os_log_message_persist_impl(v62, 17LL, v64);

      if (v62 != &v75) {
        free(v62);
      }
      __int128 v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  2LL,  0LL));
      ((void (**)(void, void, void *))v10)[2](v10, 0LL, v65);

      goto LABEL_34;
    }
  }

  __int128 v88 = 0u;
  memset(v89, 0, sizeof(v89));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v75 = 0u;
  id v23 = sub_1000836CC();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v25 = 3LL;
  }
  else {
    uint64_t v25 = 2LL;
  }
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  unsigned int v27 = [v26 msuUsesAppleConnect];
  int v71 = 67109120;
  LODWORD(v72) = v27;
  LODWORD(v67) = 8;
  _os_log_send_and_compose_impl( v25,  0LL,  &v75,  250LL,  &_mh_execute_header,  v24,  0LL,  "MSU keychain default is %{BOOL}d.",  &v71,  v67);
  __int128 v29 = v28;

  id v30 = sub_1000836CC();
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  _os_log_message_persist_impl(v29, 0LL, v31);

  if (v29 != &v75) {
    free(v29);
  }
  if (![v20 useNewProcess])
  {
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v20 legacyProcess]);
    id v69 = 0LL;
    id v38 = [v37 configureForAction:a3 withOptions:v8 error:&v69];
    id v34 = v69;

    if ((_DWORD)v38)
    {
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v20 legacyProcess]);
      [v39 start];
    }

    else
    {
      __int128 v88 = 0u;
      memset(v89, 0, sizeof(v89));
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v75 = 0u;
      id v49 = sub_1000836CC();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        uint64_t v51 = 3LL;
      }
      else {
        uint64_t v51 = 2LL;
      }
      __int128 v52 = sub_10003D53C(a3);
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      int v71 = 138543618;
      v72 = v53;
      __int16 v73 = 2114;
      id v74 = v34;
      LODWORD(v68) = 22;
      _os_log_send_and_compose_impl( v51,  0LL,  &v75,  250LL,  &_mh_execute_header,  v50,  16LL,  "Failed to configure for action %{public}@ [%{public}@]",  &v71,  v68);
      __int128 v55 = v54;

      id v56 = sub_1000836CC();
      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      _os_log_message_persist_impl(v55, 16LL, v57);

      if (v55 != &v75) {
        free(v55);
      }
    }

    ((void (**)(void, id, id))v10)[2](v10, v38, v34);
    goto LABEL_33;
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v20 tvOSProcessBridge]);
  id v70 = 0LL;
  unsigned __int8 v33 = [v32 isReadyForTrigger:a3 error:&v70];
  id v34 = v70;

  if ((v33 & 1) != 0)
  {
    logOTABanner(v35);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v20 tvOSProcessBridge]);
    [v36 scanForUpdateWithTrigger:a3 options:v8];

    v10[2](v10, 1LL, 0LL);
LABEL_33:

    +[PBSOSUpdateProcessBridge determineNextOTAImplementation]( &OBJC_CLASS___PBSOSUpdateProcessBridge,  "determineNextOTAImplementation");
    goto LABEL_34;
  }

  __int128 v88 = 0u;
  memset(v89, 0, sizeof(v89));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v75 = 0u;
  id v40 = sub_1000836CC();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    uint64_t v42 = 3LL;
  }
  else {
    uint64_t v42 = 2LL;
  }
  uint64_t v43 = sub_10003D53C(a3);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  int v71 = 138543618;
  v72 = v44;
  __int16 v73 = 2114;
  id v74 = v34;
  LODWORD(v68) = 22;
  _os_log_send_and_compose_impl( v42,  0LL,  &v75,  250LL,  &_mh_execute_header,  v41,  16LL,  "Not ready for action %{public}@ [%{public}@]",  &v71,  v68);
  v46 = v45;

  id v47 = sub_1000836CC();
  id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  _os_log_message_persist_impl(v46, 16LL, v48);

  if (v46 != &v75) {
    free(v46);
  }
  ((void (**)(void, void, id))v10)[2](v10, 0LL, v34);

LABEL_34:
}

+ (void)downloadOnlyWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v9 = [v8 readyForUse];

  if ((v9 & 1) == 0)
  {
    __int128 v66 = 0u;
    memset(v67, 0, sizeof(v67));
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v53 = 0u;
    id v10 = sub_1000836CC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    LOWORD(v49) = 0;
    _os_log_send_and_compose_impl( v12,  0LL,  &v53,  250LL,  &_mh_execute_header,  v11,  0LL,  "Attempt to download when not readyForUse.",  &v49,  2);
    v14 = v13;

    id v15 = sub_1000836CC();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    _os_log_message_persist_impl(v14, 0LL, v16);

    if (v14 != &v53) {
      free(v14);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if (![v17 useNewProcess])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v17 legacyProcess]);
    id v47 = 0LL;
    id v23 = [v22 configureForAction:7 withOptions:v6 error:&v47];
    id v20 = v47;

    if ((_DWORD)v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 legacyProcess]);
      [v24 start];
    }

    else
    {
      __int128 v66 = 0u;
      memset(v67, 0, sizeof(v67));
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v53 = 0u;
      id v37 = sub_1000836CC();
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        uint64_t v39 = 3LL;
      }
      else {
        uint64_t v39 = 2LL;
      }
      id v40 = sub_10003D53C(7LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      int v49 = 138412546;
      v50 = v41;
      __int16 v51 = 2114;
      id v52 = v20;
      LODWORD(v46) = 22;
      _os_log_send_and_compose_impl( v39,  0LL,  &v53,  250LL,  &_mh_execute_header,  v38,  16LL,  "Failed to configure for action %@ [%{public}@]",  &v49,  v46);
      uint64_t v43 = v42;

      id v44 = sub_1000836CC();
      id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      _os_log_message_persist_impl(v43, 16LL, v45);

      if (v43 != &v53) {
        free(v43);
      }
    }

    id v34 = (void (*)(void *, id, id))v7[2];
    uint64_t v35 = v7;
    id v36 = v23;
    goto LABEL_24;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 tvOSProcessBridge]);
  id v48 = 0LL;
  unsigned __int8 v19 = [v18 isReadyForTrigger:7 error:&v48];
  id v20 = v48;

  if ((v19 & 1) == 0)
  {
    __int128 v66 = 0u;
    memset(v67, 0, sizeof(v67));
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v53 = 0u;
    id v25 = sub_1000836CC();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      uint64_t v27 = 3LL;
    }
    else {
      uint64_t v27 = 2LL;
    }
    __int128 v28 = sub_10003D53C(7LL);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    int v49 = 138543618;
    v50 = v29;
    __int16 v51 = 2114;
    id v52 = v20;
    LODWORD(v46) = 22;
    _os_log_send_and_compose_impl( v27,  0LL,  &v53,  250LL,  &_mh_execute_header,  v26,  16LL,  "Not ready for action %{public}@ [%{public}@]",  &v49,  v46);
    __int128 v31 = v30;

    id v32 = sub_1000836CC();
    unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    _os_log_message_persist_impl(v31, 16LL, v33);

    if (v31 != &v53) {
      free(v31);
    }
    id v34 = (void (*)(void *, id, id))v7[2];
    uint64_t v35 = v7;
    id v36 = 0LL;
LABEL_24:
    v34(v35, v36, v20);
    goto LABEL_25;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v17 tvOSProcessBridge]);
  [v21 downloadOnlyWithOptions:v6];

  ((void (*)(void *, uint64_t, void))v7[2])(v7, 1LL, 0LL);
LABEL_25:
}

+ (void)installOnlyWithDescriptor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v12 = [v11 readyForUse];

  if ((v12 & 1) == 0)
  {
    __int128 v69 = 0u;
    memset(v70, 0, sizeof(v70));
    __int128 v67 = 0u;
    __int128 v68 = 0u;
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
    __int128 v56 = 0u;
    id v13 = sub_1000836CC();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    LOWORD(v52) = 0;
    _os_log_send_and_compose_impl( v15,  0LL,  &v56,  250LL,  &_mh_execute_header,  v14,  0LL,  "Attempt to install when not readyForUse.",  &v52,  2);
    uint64_t v17 = v16;

    id v18 = sub_1000836CC();
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    _os_log_message_persist_impl(v17, 0LL, v19);

    if (v17 != &v56) {
      free(v17);
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if (![v20 useNewProcess])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 legacyProcess]);
    id v50 = 0LL;
    id v26 = [v25 configureForAction:8 withOptions:v9 error:&v50];
    id v23 = v50;

    if ((_DWORD)v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v20 legacyProcess]);
      [v27 start];
    }

    else
    {
      __int128 v69 = 0u;
      memset(v70, 0, sizeof(v70));
      __int128 v67 = 0u;
      __int128 v68 = 0u;
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
      __int128 v56 = 0u;
      id v40 = sub_1000836CC();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        uint64_t v42 = 3LL;
      }
      else {
        uint64_t v42 = 2LL;
      }
      uint64_t v43 = sub_10003D53C(8LL);
      id v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      int v52 = 138412546;
      __int128 v53 = v44;
      __int16 v54 = 2114;
      id v55 = v23;
      LODWORD(v49) = 22;
      _os_log_send_and_compose_impl( v42,  0LL,  &v56,  250LL,  &_mh_execute_header,  v41,  16LL,  "Failed to configure for action %@ [%{public}@]",  &v52,  v49);
      uint64_t v46 = v45;

      id v47 = sub_1000836CC();
      id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      _os_log_message_persist_impl(v46, 16LL, v48);

      if (v46 != &v56) {
        free(v46);
      }
    }

    id v37 = (void (*)(void *, id, id))v10[2];
    id v38 = v10;
    id v39 = v26;
    goto LABEL_24;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 tvOSProcessBridge]);
  id v51 = 0LL;
  unsigned __int8 v22 = [v21 isReadyForTrigger:8 error:&v51];
  id v23 = v51;

  if ((v22 & 1) == 0)
  {
    __int128 v69 = 0u;
    memset(v70, 0, sizeof(v70));
    __int128 v67 = 0u;
    __int128 v68 = 0u;
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
    __int128 v56 = 0u;
    id v28 = sub_1000836CC();
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      uint64_t v30 = 3LL;
    }
    else {
      uint64_t v30 = 2LL;
    }
    __int128 v31 = sub_10003D53C(8LL);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    int v52 = 138543618;
    __int128 v53 = v32;
    __int16 v54 = 2114;
    id v55 = v23;
    LODWORD(v49) = 22;
    _os_log_send_and_compose_impl( v30,  0LL,  &v56,  250LL,  &_mh_execute_header,  v29,  16LL,  "Not ready for action %{public}@ [%{public}@]",  &v52,  v49);
    id v34 = v33;

    id v35 = sub_1000836CC();
    id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    _os_log_message_persist_impl(v34, 16LL, v36);

    if (v34 != &v56) {
      free(v34);
    }
    id v37 = (void (*)(void *, id, id))v10[2];
    id v38 = v10;
    id v39 = 0LL;
LABEL_24:
    v37(v38, v39, v23);
    goto LABEL_25;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 tvOSProcessBridge]);
  [v24 applyOnlyWithDescriptor:v8 options:v9];

  ((void (*)(void *, uint64_t, void))v10[2])(v10, 1LL, 0LL);
LABEL_25:
}

+ (void)resumeAfterUpdateCheck
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v15, 0, 250);
    id v5 = sub_1000836CC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v14[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v15,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to resume after check when not readyForUse.",  v14,  2);
    id v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v15) {
      free(v9);
    }
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 useNewProcess])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
    [v13 resumeAfterPause];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 legacyProcess]);
    [v13 resumeAfterUpdateCheck];
  }
}

+ (void)resumeAfterDownload
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v15, 0, 250);
    id v5 = sub_1000836CC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v14[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v15,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to resume after download when not readyForUse.",  v14,  2);
    id v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v15) {
      free(v9);
    }
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 useNewProcess])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
    [v13 resumeAfterPause];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 legacyProcess]);
    [v13 resumeAfterDownload];
  }
}

+ (void)cancelForReason:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    memset(v17, 0, 250);
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v16[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  v17,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to cancel when not readyForUse.",  v16,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != v17) {
      free(v11);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v14 useNewProcess])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tvOSProcessBridge]);
    [v15 cancelWithReason:a3];
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 legacyProcess]);
    [v15 cancelForReason:a3];
  }
}

+ (void)purgeDownloadWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, _UNKNOWN **))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    memset(v18, 0, 250);
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v17[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  v18,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to purge when not readyForUse.",  v17,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != v18) {
      free(v11);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v14 useNewProcess])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tvOSProcessBridge]);
    [v15 purgeUpdate];

    v4[2](v4, &off_1003FE070);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 legacyProcess]);
    [v16 purgeAssetsWithCompletion:v4];
  }
}

+ (BOOL)isCheckingForUpdate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v18, 0, 250);
    id v5 = sub_1000836CC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v17[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v18,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to check for update when not readyForUse.",  v17,  2);
    uint64_t v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v18) {
      free(v9);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 readyForUse])
  {
    if ([v12 useNewProcess])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
      unsigned __int8 v14 = [v13 IsScanning];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 legacyProcess]);
      unsigned __int8 v14 = [v13 isCheckingForUpdate];
    }

    BOOL v15 = v14;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)isRunning
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v18, 0, 250);
    id v5 = sub_1000836CC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v17[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v18,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to check if running when not readyForUse.",  v17,  2);
    uint64_t v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v18) {
      free(v9);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 readyForUse])
  {
    if ([v12 useNewProcess])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
      unsigned __int8 v14 = [v13 IsRunning];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 legacyProcess]);
      unsigned __int8 v14 = [v13 isRunning];
    }

    BOOL v15 = v14;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (unint64_t)action
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v17, 0, 250);
    id v5 = sub_1000836CC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v16[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v17,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to request action when not readyForUse.",  v16,  2);
    uint64_t v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v17) {
      free(v9);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 useNewProcess])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
    [v13 action];
    unint64_t v14 = 1LL;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 legacyProcess]);
    unint64_t v14 = (unint64_t)[v13 action];
  }

  return v14;
}

+ (void)currentDownload:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void *, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    memset(v18, 0, 250);
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v17[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  v18,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to request current download when not readyForUse.",  v17,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != v18) {
      free(v11);
    }
  }

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v14 useNewProcess])
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tvOSProcessBridge]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentDownload]);

    v4[2](v4, v16, 0LL);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSoftwareUpdateService sharedInstance](&OBJC_CLASS___PBSoftwareUpdateService, "sharedInstance"));
    [v16 _currentDownload:v4];
  }
}

+ (void)setAssetDownloadIsDiscretionary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    memset(v18, 0, 250);
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v17[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  v18,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to set download policy when not readyForUse.",  v17,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != v18) {
      free(v11);
    }
  }

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v14 useNewProcess])
  {
    id v15 = sub_1000836CC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10028B100(v16);
    }
  }

  else
  {
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 legacyProcess]);
    -[os_log_s setAssetDownloadIsDiscretionary:](v16, "setAssetDownloadIsDiscretionary:", v3);
  }
}

+ (id)isAssetReadyToInstallForUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v6 = [v5 readyForUse];

  if ((v6 & 1) == 0)
  {
    __int128 v36 = 0u;
    memset(v37, 0, sizeof(v37));
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v23 = 0u;
    id v7 = sub_1000836CC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    v22[0] = 0;
    _os_log_send_and_compose_impl( v9,  0LL,  &v23,  250LL,  &_mh_execute_header,  v8,  0LL,  "Attempt to check asset state when not readyForUse.",  v22,  2);
    id v11 = v10;

    id v12 = sub_1000836CC();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    _os_log_message_persist_impl(v11, 0LL, v13);

    if (v11 != &v23) {
      free(v11);
    }
  }

  *(void *)&__int128 v23 = 0LL;
  *((void *)&v23 + 1) = &v23;
  *(void *)&__int128 v24 = 0x3032000000LL;
  *((void *)&v24 + 1) = sub_1001A7E9C;
  *(void *)&__int128 v25 = sub_1001A7EAC;
  *((void *)&v25 + 1) = 0LL;
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if (![v14 useNewProcess])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateAssetManager sharedManager](&OBJC_CLASS___PBOSUpdateAssetManager, "sharedManager"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001A7EC4;
    v21[3] = &unk_1003DB2F8;
    v21[4] = &v23;
    [v18 installedAssetForUpdate:v4 withCompletion:v21];
    goto LABEL_11;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tvOSProcessBridge]);
  unsigned __int8 v16 = [v15 IsAssetReadyToInstall];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSOSUpdateServiceErrorDomain,  13LL,  0LL));
    id v18 = *(void **)(*((void *)&v23 + 1) + 40LL);
    *(void *)(*((void *)&v23 + 1) + 40LL) = v17;
LABEL_11:
  }

  id v19 = *(id *)(*((void *)&v23 + 1) + 40LL);

  _Block_object_dispose(&v23, 8);
  return v19;
}

+ (BOOL)IsAwaitingRebootToApply
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    __int128 v38 = 0u;
    memset(v39, 0, sizeof(v39));
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    id v5 = sub_1000836CC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT) ? 3LL : 2LL;
    v24[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  &v25,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to check apply state when not readyForUse.",  v24,  2);
    uint64_t v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != &v25) {
      free(v9);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  if ([v12 useNewProcess])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 tvOSProcessBridge]);
    unsigned __int8 v14 = [v13 IsAwaitingRebootToApply];
  }

  else
  {
    __int128 v38 = 0u;
    memset(v39, 0, sizeof(v39));
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    id v15 = sub_1000836CC();
    unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = 3LL;
    }
    else {
      uint64_t v17 = 2LL;
    }
    v24[0] = 0;
    LODWORD(v23) = 2;
    _os_log_send_and_compose_impl( v17,  0LL,  &v25,  250LL,  &_mh_execute_header,  v16,  16LL,  "Asked if we are awaiting reboot for legacy process.",  v24,  v23);
    id v19 = v18;

    id v20 = sub_1000836CC();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _os_log_message_persist_impl(v19, 16LL, v21);

    if (v19 != &v25) {
      free(v19);
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

+ (BOOL)performsBackgroundApply
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v4 = [v3 readyForUse];

  if ((v4 & 1) == 0)
  {
    memset(v16, 0, 250);
    id v5 = sub_1000836CC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    v15[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  v16,  250LL,  &_mh_execute_header,  v6,  0LL,  "Attempt to perform background apply when not readyForUse.",  v15,  2);
    uint64_t v9 = v8;

    id v10 = sub_1000836CC();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != v16) {
      free(v9);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  unsigned __int8 v13 = [v12 useNewProcess];

  return v13;
}

- (void)osUpdateProcessDidStartCheckWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A8650;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B140();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidFinishCheckWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A88F8;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B1E8();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidStartDownloadWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A8B5C;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B290();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidUpdateDownloadProgressWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A8DC0;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B338();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidFinishDownloadWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A8F6C;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B3E0();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidStartRedownloadWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A91D0;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B488();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidStartApplyWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A9434;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B530();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidUpdateApplyProgressWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A9698;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B5D8();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)osUpdateProcessDidFinishApplyWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBOSUpdateSwitch _sharedInstance](&OBJC_CLASS___PBOSUpdateSwitch, "_sharedInstance"));
  unsigned __int8 v6 = [v5 useNewProcess];

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001A98FC;
    v9[3] = &unk_1003CFEB8;
    v9[4] = self;
    id v10 = v4;
    id v7 = v4;
    dispatch_async(&_dispatch_main_q, v9);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only called here for TVOSUpdate"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B680();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)forceAction:(int64_t)a3 withUrgency:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    __int128 v42 = 0u;
    memset(v43, 0, sizeof(v43));
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
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v29 = 0u;
    id v5 = sub_1001A87A4();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    v28[0] = 0;
    _os_log_send_and_compose_impl( v7,  0LL,  &v29,  250LL,  &_mh_execute_header,  v6,  0LL,  "forceActionRequestedWithUrgency - soonest",  v28,  2);
    uint64_t v9 = v8;

    id v10 = sub_1001A87A4();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    _os_log_message_persist_impl(v9, 0LL, v11);

    if (v9 != &v29) {
      free(v9);
    }
  }

  if (a3)
  {
    if (a3 == 1)
    {
      __int128 v42 = 0u;
      memset(v43, 0, sizeof(v43));
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
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v29 = 0u;
      id v12 = sub_1001A87A4();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = 3LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      v28[0] = 0;
      LODWORD(v27) = 2;
      _os_log_send_and_compose_impl( v14,  0LL,  &v29,  250LL,  &_mh_execute_header,  v13,  0LL,  "Forcing immediate reboot",  v28,  v27);
      unsigned __int8 v16 = v15;

      id v17 = sub_1001A87A4();
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      _os_log_message_persist_impl(v16, 0LL, v18);

      if (v16 != &v29) {
        free(v16);
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      [v19 rebootRequestedByClient:@"OTAForceReboot"];
    }
  }

  else
  {
    __int128 v42 = 0u;
    memset(v43, 0, sizeof(v43));
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
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v29 = 0u;
    id v20 = sub_1001A87A4();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = 3LL;
    }
    else {
      uint64_t v22 = 2LL;
    }
    v28[0] = 0;
    LODWORD(v27) = 2;
    _os_log_send_and_compose_impl( v22,  0LL,  &v29,  250LL,  &_mh_execute_header,  v21,  0LL,  "Forcing immediate install",  v28,  v27);
    __int128 v24 = v23;

    id v25 = sub_1001A87A4();
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    _os_log_message_persist_impl(v24, 0LL, v26);

    if (v24 != &v29) {
      free(v24);
    }
    +[PBOSUpdateSwitch resumeAfterDownload](&OBJC_CLASS___PBOSUpdateSwitch, "resumeAfterDownload");
  }

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001A9E24;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  id v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBOSSoftwareUpdateProcess, v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v9 = v5;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

- (BOOL)startingUp
{
  return self->_startingUp;
}

- (void)setStartingUp:(BOOL)a3
{
  self->_startingUp = a3;
}

- (BOOL)readyForUse
{
  return self->_readyForUse;
}

- (void)setReadyForUse:(BOOL)a3
{
  self->_readyForUse = a3;
}

- (BOOL)useNewProcess
{
  return self->_useNewProcess;
}

- (void)setUseNewProcess:(BOOL)a3
{
  self->_useNewProcess = a3;
}

- (PBOSSoftwareUpdateProcess)legacyProcess
{
  return self->_legacyProcess;
}

- (void)setLegacyProcess:(id)a3
{
}

- (PBSOSUpdateProcessBridge)tvOSProcessBridge
{
  return self->_tvOSProcessBridge;
}

- (void)setTvOSProcessBridge:(id)a3
{
}

- (PBSOSSoftwareUpdateProcessDelegate)delegate
{
  return (PBSOSSoftwareUpdateProcessDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end