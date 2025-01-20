@interface PBTMockSUControllerManager
- (NSString)terminalState;
- (PBTMockSUControllerManager)initWithDelegate:(id)a3;
- (SUControllerConfig)config;
- (id)_SUCProgressWithFractionComplete:(float)a3 timeRemaining:(double)a4;
- (id)_successfulSUCDescriptor;
- (int64_t)suControllerManagerError;
- (void)installUpdate:(id)a3;
- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5;
- (void)purgeUpdate:(id)a3 completion:(id)a4;
- (void)scanForUpdates:(id)a3;
- (void)setConfig:(id)a3;
- (void)setSuControllerManagerError:(int64_t)a3;
- (void)setTerminalState:(id)a3;
- (void)setupForDownloadFailureWithError:(id)a3;
- (void)setupForDownloadSuccess;
- (void)setupForInstallFailureWithError:(id)a3;
- (void)setupForInstallSuccess;
- (void)setupForScanFailureWithError:(id)a3;
- (void)setupForScanSuccess;
- (void)startDownload:(id)a3;
@end

@implementation PBTMockSUControllerManager

- (void)setupForScanSuccess
{
  self->_suControllerManagerError = 0LL;
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"scan";
}

- (void)setupForScanFailureWithError:(id)a3
{
  self->_suControllerManagerError = (int64_t)[a3 code];
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"scan";
}

- (void)setupForDownloadSuccess
{
  self->_suControllerManagerError = 0LL;
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"download";
}

- (void)setupForDownloadFailureWithError:(id)a3
{
  self->_suControllerManagerError = (int64_t)[a3 code];
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"download";
}

- (void)setupForInstallSuccess
{
  self->_suControllerManagerError = 0LL;
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"install";
}

- (void)setupForInstallFailureWithError:(id)a3
{
  self->_suControllerManagerError = (int64_t)[a3 code];
  terminalState = self->_terminalState;
  self->_terminalState = (NSString *)@"install";
}

- (PBTMockSUControllerManager)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBTMockSUControllerManager;
  v3 = -[PBTMockSUControllerManager initWithDelegate:](&v7, "initWithDelegate:", 0LL);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___SUControllerConfig);
    config = v3->_config;
    v3->_config = v4;

    -[SUControllerConfig setPerformAutoScan:](v3->_config, "setPerformAutoScan:", 1LL);
    -[SUControllerConfig setPerformAutoDownloadAndPrepare:](v3->_config, "setPerformAutoDownloadAndPrepare:", 1LL);
    -[SUControllerConfig setPerformAutoInstall:](v3->_config, "setPerformAutoInstall:", 1LL);
    -[SUControllerConfig setAutoAcceptTermsAndConditions:](v3->_config, "setAutoAcceptTermsAndConditions:", 1LL);
  }

  return v3;
}

- (void)scanForUpdates:(id)a3
{
  id v5 = a3;
  dispatch_time_t v6 = dispatch_time(0LL, 200000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016A538;
  block[3] = &unk_1003D1718;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_after(v6, &_dispatch_main_q, block);
}

- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((v6 & 1) != 0)
  {
    -[SUControllerConfig setPerformAutoScan:](self->_config, "setPerformAutoScan:", [v8 performAutoScan]);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      -[SUControllerConfig setPerformAutoInstall:]( self->_config,  "setPerformAutoInstall:",  [v8 performAutoInstall]);
      if ((v6 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }

  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }

  -[SUControllerConfig setPerformAutoDownloadAndPrepare:]( self->_config,  "setPerformAutoDownloadAndPrepare:",  [v8 performAutoDownloadAndPrepare]);
  if ((v6 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v6 & 8) != 0) {
LABEL_5:
  }
    -[SUControllerConfig setAutoAcceptTermsAndConditions:]( self->_config,  "setAutoAcceptTermsAndConditions:",  [v8 autoAcceptTermsAndConditions]);
LABEL_6:
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10016A840;
  v11[3] = &unk_1003D2560;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  dispatch_async(&_dispatch_main_q, v11);
}

- (void)startDownload:(id)a3
{
  id v5 = a3;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBTMockSUControllerManager delegate](self, "delegate"));
  char v7 = objc_opt_respondsToSelector(v6, "manager:didChangeProgressOnDownload:");

  if ((v7 & 1) != 0)
  {
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    v24 = sub_10016AAF0;
    v25 = sub_10016AB00;
    id v26 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
    [(id)v22[5] setDescriptor:v5];
    dispatch_time_t v8 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10016AB18;
    block[3] = &unk_1003D5870;
    block[4] = self;
    void block[5] = &v21;
    dispatch_after(v8, &_dispatch_main_q, block);
    dispatch_time_t v9 = dispatch_time(0LL, 400000000LL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10016AB94;
    v19[3] = &unk_1003D5870;
    v19[4] = self;
    v19[5] = &v21;
    dispatch_after(v9, &_dispatch_main_q, v19);

    dispatch_time_t v10 = dispatch_time(0LL, 600000000LL);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10016AC10;
    v18[3] = &unk_1003D5870;
    v18[4] = self;
    v18[5] = &v21;
    dispatch_after(v10, &_dispatch_main_q, v18);

    dispatch_time_t v11 = dispatch_time(0LL, 800000000LL);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10016AC8C;
    v14[3] = &unk_1003D9CD0;
    v16 = &v21;
    SEL v17 = a2;
    v14[4] = self;
    id v15 = v5;
    id v12 = v5;
    dispatch_after(v11, &_dispatch_main_q, v14);

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing manager:didChangeProgressOnDownload: API"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002883E0();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
  }

- (void)installUpdate:(id)a3
{
  id v5 = a3;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBTMockSUControllerManager delegate](self, "delegate"));
  char v7 = objc_opt_respondsToSelector(v6, "manager:didChangeProgressOnApply:progress:");

  if ((v7 & 1) != 0)
  {
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_10016AAF0;
    v33 = sub_10016AB00;
    id v34 = objc_alloc_init(&OBJC_CLASS___SUControllerDownload);
    [(id)v30[5] setDescriptor:v5];
    dispatch_time_t v8 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10016B268;
    block[3] = &unk_1003D5B10;
    block[4] = self;
    v28 = &v29;
    id v9 = v5;
    id v27 = v9;
    dispatch_after(v8, &_dispatch_main_q, block);
    dispatch_time_t v10 = dispatch_time(0LL, 400000000LL);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10016B2E0;
    v23[3] = &unk_1003D5B10;
    v23[4] = self;
    v25 = &v29;
    id v11 = v9;
    id v24 = v11;
    dispatch_after(v10, &_dispatch_main_q, v23);

    dispatch_time_t v12 = dispatch_time(0LL, 600000000LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10016B358;
    v20[3] = &unk_1003D5B10;
    v20[4] = self;
    v22 = &v29;
    id v13 = v11;
    id v21 = v13;
    dispatch_after(v12, &_dispatch_main_q, v20);

    dispatch_time_t v14 = dispatch_time(0LL, 800000000LL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10016B3D0;
    v17[3] = &unk_1003D1718;
    v17[4] = self;
    id v18 = v13;
    SEL v19 = a2;
    id v15 = v13;
    dispatch_after(v14, &_dispatch_main_q, v17);

    _Block_object_dispose(&v29, 8);
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing manager:didChangeProgressOnApply: API"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002885F4();
    }
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
  }

- (void)purgeUpdate:(id)a3 completion:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0LL, 200000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10016B62C;
  block[3] = &unk_1003D0110;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, &_dispatch_main_q, block);
}

- (id)_successfulSUCDescriptor
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SUControllerDescriptor);
  [v2 setProductVersion:@"18.0"];
  [v2 setProductBuildVersion:@"22J200"];
  [v2 setDownloadSize:1000000];
  [v2 setInstallationSize:3000000];
  [v2 setTotalRequiredFreeSpace:4000000];
  [v2 setUserDidAcceptTermsAndConditions:1];
  [v2 setFullReplacement:0];
  [v2 setRampEnabled:0];
  return v2;
}

- (id)_SUCProgressWithFractionComplete:(float)a3 timeRemaining:(double)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___SUControllerProgress);
  char v7 = v6;
  LODWORD(v8) = 1.0;
  if (a3 == 1.0) {
    id v9 = @"downloaded";
  }
  else {
    id v9 = @"downloading";
  }
  objc_msgSend(v6, "setPhase:", v9, v8);
  *(float *)&double v10 = a3;
  [v7 setPortionComplete:v10];
  [v7 setEstimatedTimeRemaining:a4];
  [v7 setIsDone:a3 == 1.0];
  [v7 setActionText:&stru_1003E2910];
  return v7;
}

- (int64_t)suControllerManagerError
{
  return self->_suControllerManagerError;
}

- (void)setSuControllerManagerError:(int64_t)a3
{
  self->_suControllerManagerError = a3;
}

- (NSString)terminalState
{
  return self->_terminalState;
}

- (void)setTerminalState:(id)a3
{
}

- (SUControllerConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end