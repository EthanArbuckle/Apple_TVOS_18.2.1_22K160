@interface DADeviceConnectionLocal
- (ASTSession)session;
- (BOOL)_shutdownForBatteryDisconnectWithUnsealCode:(unsigned int)a3;
- (BOOL)_shutdownToShelfLifeMode;
- (BOOL)isDisconnecting;
- (DAAssetUploader)assetUploader;
- (DADeviceConnectionConfigurator)configurator;
- (DADeviceConnectionDelegate)delegate;
- (DADeviceConnectionLocal)initWithState:(id)a3;
- (DADeviceState)state;
- (DASessionSettings)sessionSettings;
- (DAStrongDeviceIdentity)strongDeviceIdentity;
- (NSMutableDictionary)progressForTest;
- (NSMutableDictionary)sandboxExtensionHandles;
- (id)IMEI;
- (id)session:(id)a3 estimatedTimeRemainingForTest:(id)a4;
- (id)session:(id)a3 progressForTest:(id)a4;
- (int)mode;
- (unsigned)_unsealCodeFromParameters:(id)a3;
- (void)_session:(id)a3 didFinishSuiteWithName:(id)a4 skipped:(BOOL)a5;
- (void)_sessionDidPowerOff:(id)a3 forReboot:(BOOL)a4 withParameters:(id)a5;
- (void)_setNextBootForBootMode:(int64_t)a3;
- (void)_shutDownDeviceForReboot:(BOOL)a3;
- (void)archive;
- (void)end;
- (void)idle;
- (void)requestAsset:(id)a3 completionHandler:(id)a4;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)requestUploadAssets:(id)a3 completion:(id)a4;
- (void)session:(id)a3 cancelTest:(id)a4;
- (void)session:(id)a3 didCompleteTestSuite:(id)a4 description:(id)a5;
- (void)session:(id)a3 didEndWithError:(id)a4;
- (void)session:(id)a3 didFinishSendingResultForTest:(id)a4;
- (void)session:(id)a3 didPauseSendingResultForTest:(id)a4 error:(id)a5;
- (void)session:(id)a3 didPauseWithError:(id)a4;
- (void)session:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5;
- (void)session:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5;
- (void)session:(id)a3 didResumeSendingResultForTest:(id)a4;
- (void)session:(id)a3 didStartTestSuite:(id)a4 description:(id)a5;
- (void)session:(id)a3 didUpdateSettings:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 didUpdateTestSuiteImage:(id)a4;
- (void)session:(id)a3 didUpdateTestSuiteProgress:(id)a4;
- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4;
- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5;
- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5;
- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6;
- (void)sessionDidCancelSuite:(id)a3;
- (void)sessionDidReboot:(id)a3 withParameters:(id)a4;
- (void)sessionDidResume:(id)a3;
- (void)sessionDidShutDown:(id)a3 withParameters:(id)a4;
- (void)sessionDidStart:(id)a3;
- (void)setAssetUploader:(id)a3;
- (void)setConfigurator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setProgressForTest:(id)a3;
- (void)setSandboxExtensionHandles:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionSettings:(id)a3;
- (void)setStrongDeviceIdentity:(id)a3;
- (void)start;
@end

@implementation DADeviceConnectionLocal

- (DADeviceConnectionLocal)initWithState:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DADeviceConnectionLocal;
  v6 = -[DADeviceConnectionLocal init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v7->_disconnecting = 0;
    -[DADeviceState setPhase:](v7->_state, "setPhase:", 0LL);
    v8 = objc_alloc_init(&OBJC_CLASS___DAAssetUploader);
    assetUploader = v7->_assetUploader;
    v7->_assetUploader = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    sandboxExtensionHandles = v7->_sandboxExtensionHandles;
    v7->_sandboxExtensionHandles = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    progressForTest = v7->_progressForTest;
    v7->_progressForTest = (NSMutableDictionary *)v12;
  }

  return v7;
}

- (id)IMEI
{
  return 0LL;
}

- (DADeviceState)state
{
  return self->_state;
}

- (int)mode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal configurator](self, "configurator"));

  if (!v3) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal configurator](self, "configurator"));
  int v5 = [v4 mode];

  return v5;
}

- (void)start
{
  uint64_t v3 = DiagnosticLogHandleForCategory(1LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[DADeviceConnectionLocal start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  &off_10002E758,  &off_10002E770,  &off_10002E788,  0LL));
  [v5 removeErrorCodes:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  [v7 setPhase:2];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serialNumber]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ASTIdentity identityWithSerialNumber:]( &OBJC_CLASS___ASTIdentity,  "identityWithSerialNumber:",  v10));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASTSession sessionWithIdentity:](&OBJC_CLASS___ASTSession, "sessionWithIdentity:", v11));
    -[DADeviceConnectionLocal setSession:](self, "setSession:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    [v13 setDelegate:self];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  objc_msgSend(v14, "startWithMode:", -[DADeviceConnectionLocal mode](self, "mode"));
}

- (void)idle
{
  uint64_t v3 = DiagnosticLogHandleForCategory(1LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[DADeviceConnectionLocal idle]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v6,  0xCu);
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  [v5 idle];
}

- (void)end
{
  uint64_t v3 = DiagnosticLogHandleForCategory(1LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[DADeviceConnectionLocal end]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v7,  0xCu);
  }

  -[DADeviceConnectionLocal setDisconnecting:](self, "setDisconnecting:", 1LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    [v6 end];
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    [v6 setPhase:1];
  }
}

- (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v15 = "-[DADeviceConnectionLocal requestAsset:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001375C;
  v12[3] = &unk_10002CD28;
  id v13 = v6;
  id v11 = v6;
  [v10 requestAsset:v7 completionHandler:v12];
}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[DADeviceConnectionLocal requestUploadAssets:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal assetUploader](self, "assetUploader"));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal assetUploader](self, "assetUploader"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    [v11 uploadAssets:v6 wtihDeviceIdentity:v12 completion:v7];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DKErrorDomain,  -1008LL,  0LL));
    v7[2](v7, v11, v12);
  }
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v15 = "-[DADeviceConnectionLocal requestSuiteStart:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100013A14;
  v12[3] = &unk_10002CD50;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 requestSuiteStart:v7 completionHandler:v12];
}

- (void)sessionDidStart:(id)a3
{
  uint64_t v4 = DiagnosticLogHandleForCategory(1LL);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[DADeviceConnectionLocal sessionDidStart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v7,  0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    [v6 setPhase:4];
  }

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = DiagnosticLogHandleForCategory(1LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[DADeviceConnectionLocal session:startTest:parameters:testResult:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  [v11 setStatusCode:&off_10002E7A0];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"specifications"]);
  if (v14)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"allowCellularSizeThreshold"]);
      if (v16)
      {
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
        char isKindOfClass = objc_opt_isKindOfClass(v16, v17);
        uint64_t v19 = DiagnosticLogHandleForCategory(1LL);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if ((isKindOfClass & 1) == 0)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138412290;
            v40 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Bad test specification value. Expected a number, got [%@]",  buf,  0xCu);
          }

          [v11 setStatusCode:&off_10002E7B8];
          int v22 = 0;
          goto LABEL_15;
        }

        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          v40 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Setting cellular threshold to %@.",  buf,  0xCu);
        }

        [v11 setAllowCellularSizeThreshold:v16];
      }

      int v22 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }

  int v22 = 1;
LABEL_16:
  unsigned int v23 = -[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting");
  if (!v22 || v23)
  {
    id v26 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
    [v26 sendTestResult:v11 error:0];
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_100013F20;
    v34 = &unk_10002CD78;
    v35 = self;
    id v25 = v9;
    id v36 = v25;
    id v37 = v11;
    id v38 = v24;
    id v26 = v24;
    v27 = objc_retainBlock(&v31);
    v28 = objc_opt_new(&OBJC_CLASS___DADeviceConnectionStartTestCommand);
    -[DADeviceConnectionStartTestCommand setTestID:](v28, "setTestID:", v25, v31, v32, v33, v34, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[DKDiagnosticParameters diagnosticParametersWithDictionary:]( &OBJC_CLASS___DKDiagnosticParameters,  "diagnosticParametersWithDictionary:",  v10));
    -[DADeviceConnectionStartTestCommand setParameters:](v28, "setParameters:", v29);

    -[DADeviceConnectionStartTestCommand setCompletion:](v28, "setCompletion:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    [v30 deviceConnection:self didRecieveCommand:v28];
  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[DADeviceConnectionLocal session:didEndWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000143F4;
  v13[3] = &unk_10002CDA0;
  id v14 = v7;
  uint64_t v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 transactionWithBlock:v13];

  -[DADeviceConnectionLocal setDisconnecting:](self, "setDisconnecting:", 0LL);
  -[DADeviceConnectionLocal setStrongDeviceIdentity:](self, "setStrongDeviceIdentity:", 0LL);
}

- (void)session:(id)a3 didStartTestSuite:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = DiagnosticLogHandleForCategory(1LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[DADeviceConnectionLocal session:didStartTestSuite:description:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000146B4;
  v14[3] = &unk_10002CDC8;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 transactionWithBlock:v14];
}

- (void)session:(id)a3 didCompleteTestSuite:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = DiagnosticLogHandleForCategory(1LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[DADeviceConnectionLocal session:didCompleteTestSuite:description:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v11,  0xCu);
  }

  -[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:]( self,  "_session:didFinishSuiteWithName:skipped:",  v8,  v7,  0LL);
}

- (void)sessionDidCancelSuite:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DiagnosticLogHandleForCategory(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[DADeviceConnectionLocal sessionDidCancelSuite:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 suiteName]);
  -[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:]( self,  "_session:didFinishSuiteWithName:skipped:",  v4,  v8,  1LL);
}

- (void)_session:(id)a3 didFinishSuiteWithName:(id)a4 skipped:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[DADeviceConnectionLocal _session:didFinishSuiteWithName:skipped:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100014B74;
    v28[3] = &unk_10002CE18;
    v28[4] = self;
    id v12 = objc_retainBlock(v28);
    if ([v8 shouldShowResults]
      && (id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state")),
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diagnosticEventID]),
          v14,
          v13,
          v14))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 diagnosticEventID]);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100014D60;
      v24[3] = &unk_10002CE40;
      id v26 = v12;
      id v25 = v9;
      BOOL v27 = v5;
      [v15 requestSuiteSummary:v17 completionHandler:v24];

      v18 = v26;
    }

    else
    {
      uint64_t v19 = DiagnosticLogHandleForCategory(1LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Skipping requesting suite summary",  buf,  2u);
      }

      BOOL v21 = objc_alloc(&OBJC_CLASS___DAHistoryEntry);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v18 suiteName]);
      unsigned int v23 = -[DAHistoryEntry initWithTestSuiteName:skipped:](v21, "initWithTestSuiteName:skipped:", v22, v5);
      ((void (*)(void *, DAHistoryEntry *, void))v12[2])(v12, v23, 0LL);
    }
  }
}

- (void)session:(id)a3 didUpdateTestSuiteProgress:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteProgress:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v9,  0xCu);
  }

  if (!-[DADeviceConnectionLocal isDisconnecting](self, "isDisconnecting"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    [v8 setProgress:v5];
  }
}

- (void)session:(id)a3 didUpdateTestSuiteImage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[DADeviceConnectionLocal session:didUpdateTestSuiteImage:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v9,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  [v8 setTestSuiteImageData:v5];
}

- (id)session:(id)a3 progressForTest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[DADeviceConnectionLocal session:progressForTest:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v16,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal progressForTest](self, "progressForTest"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);

  if (v9 && ([v9 isIndeterminate] & 1) == 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 fractionCompleted]);
    [v11 doubleValue];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12 * 100.0));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  uint64_t v13 = DiagnosticLogHandleForCategory(1LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[DADeviceConnectionLocal session:progressForTest:]";
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s progress is: %@",  (uint8_t *)&v16,  0x16u);
  }

  return v10;
}

- (id)session:(id)a3 estimatedTimeRemainingForTest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[DADeviceConnectionLocal session:estimatedTimeRemainingForTest:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v12,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal progressForTest](self, "progressForTest"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);

  if (v9) {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 estimatedTimeRemaining]);
  }
  else {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (void)session:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "deviceConnection:didRequestSuiteRunWithDestinations:confirmation:");

  if ((v10 & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000153BC;
    v13[3] = &unk_10002CE90;
    id v14 = v7;
    id v15 = self;
    id v16 = v8;
    [v11 deviceConnection:self didRequestSuiteRunWithDestinations:v14 confirmation:v13];
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    [v12 setSuitesAvailable:&__NSArray0__struct];

    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)session:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, void *, void))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "deviceConnection:didRequestInstructionalPrompt:withConfirmation:");

  if ((v9 & 1) != 0)
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
    [v10 deviceConnection:self didRequestInstructionalPrompt:v11 withConfirmation:v7];
  }

  else
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    v7[2](v7, v10, 0LL);
  }
}

- (void)session:(id)a3 cancelTest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[DADeviceConnectionLocal session:cancelTest:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = objc_opt_new(&OBJC_CLASS___DADeviceConnectionCancelTestCommand);
  -[DADeviceConnectionCancelTestCommand setTestID:](v8, "setTestID:", v5);

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  [v9 deviceConnection:self didRecieveCommand:v8];
}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = DiagnosticLogHandleForCategory(1LL);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[DADeviceConnectionLocal session:profile:filteredByComponents:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  [v13 setPhase:3];

  id v14 = objc_opt_new(&OBJC_CLASS___DADeviceConnectionProfileCommand);
  -[DADeviceConnectionProfileCommand setComponents:](v14, "setComponents:", v9);

  -[DADeviceConnectionProfileCommand setProfile:](v14, "setProfile:", v10);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100015808;
  v17[3] = &unk_10002CEB8;
  id v18 = v8;
  id v15 = v8;
  -[DADeviceConnectionProfileCommand setCompletion:](v14, "setCompletion:", v17);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal delegate](self, "delegate"));
  [v16 deviceConnection:self didRecieveCommand:v14];
}

- (void)session:(id)a3 didPauseWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[DADeviceConnectionLocal session:didPauseWithError:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v10,  0xCu);
  }

  if ([v5 code] == (id)-1004)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    [v8 addErrorCode:3 userInfo:v9];
  }
}

- (void)sessionDidResume:(id)a3
{
  uint64_t v4 = DiagnosticLogHandleForCategory(1LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DADeviceConnectionLocal sessionDidResume:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  [v6 removeErrorCode:3];
}

- (void)session:(id)a3 didPauseSendingResultForTest:(id)a4 error:(id)a5
{
  id v6 = a5;
  uint64_t v7 = DiagnosticLogHandleForCategory(1LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    id v14 = "-[DADeviceConnectionLocal session:didPauseSendingResultForTest:error:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v13,  0xCu);
  }

  id v9 = [v6 code];
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  if (v9 == (id)-1003LL) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 3LL;
  }
  [v10 addErrorCode:v12 userInfo:v11];
}

- (void)session:(id)a3 didResumeSendingResultForTest:(id)a4
{
  uint64_t v5 = DiagnosticLogHandleForCategory(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[DADeviceConnectionLocal session:didResumeSendingResultForTest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_10002E848, &off_10002E860, 0LL));
  [v7 removeErrorCodes:v8];
}

- (void)session:(id)a3 didFinishSendingResultForTest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = DiagnosticLogHandleForCategory(1LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[DADeviceConnectionLocal session:didFinishSendingResultForTest:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v11,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal sandboxExtensionHandles](self, "sandboxExtensionHandles"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v5]);

  +[DKSandboxExtension releaseSandboxExtensionsWithHandles:]( &OBJC_CLASS___DKSandboxExtension,  "releaseSandboxExtensionsWithHandles:",  v9);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal sandboxExtensionHandles](self, "sandboxExtensionHandles"));
  [v10 removeObjectForKey:v5];

  -[DADeviceConnectionLocal didFinishSendingResultForTest:](self, "didFinishSendingResultForTest:", v5);
}

- (void)session:(id)a3 didUpdateSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = a4;
  uint64_t v11 = DiagnosticLogHandleForCategory(1LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    int v22 = "-[DADeviceConnectionLocal session:didUpdateSettings:completionHandler:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v21,  0xCu);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[DASessionSettings sessionSettingsWithDictionary:]( &OBJC_CLASS___DASessionSettings,  "sessionSettingsWithDictionary:",  v10));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionSettings]);
  unsigned __int8 v16 = [v15 isEqual:v13];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    [v17 setSessionSettings:v13];

    objc_msgSend(v8, "setAllowCellularSizeThreshold:", objc_msgSend(v13, "allowCellularSizeThreshold"));
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionSettings]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dictionary]);
  v9[2](v9, v20, 0LL);
}

- (void)sessionDidReboot:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[DADeviceConnectionLocal sessionDidReboot:withParameters:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v10,  0xCu);
  }

  -[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:]( self,  "_sessionDidPowerOff:forReboot:withParameters:",  v7,  1LL,  v6);
}

- (void)sessionDidShutDown:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[DADeviceConnectionLocal sessionDidShutDown:withParameters:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v10,  0xCu);
  }

  -[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:]( self,  "_sessionDidPowerOff:forReboot:withParameters:",  v7,  0LL,  v6);
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v21 = "-[DADeviceConnectionLocal session:generateAuthInfoWithNonce:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  int v10 = (void *)CFPreferencesCopyAppValue(@"StrongDeviceIdentity", @"com.apple.AppleServiceToolkit");
  uint64_t v11 = v10;
  if (v10 && ![v10 BOOLValue])
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Strong device identity is OFF.", buf, 2u);
    }

    [v6 sendAuthInfoResult:0 error:0];
  }

  else
  {
    uint64_t v12 = DiagnosticLogHandleForCategory(1LL);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Strong device identity is ON.", buf, 2u);
    }

    id v14 = objc_opt_new(&OBJC_CLASS___DAStrongDeviceIdentity);
    -[DADeviceConnectionLocal setStrongDeviceIdentity:](self, "setStrongDeviceIdentity:", v14);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000162C0;
    v18[3] = &unk_10002CEE0;
    id v19 = v6;
    [v15 generateAuthInfoWithNonce:v7 completion:v18];
  }
}

- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = DiagnosticLogHandleForCategory(1LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[DADeviceConnectionLocal session:signPayload:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    id v14 = 0LL;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 signPayload:v7 error:&v14]);
    id v11 = v14;
  }

  else
  {
    int v13 = 0LL;
  }

  v8[2](v8, v13, v11);
}

- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = DiagnosticLogHandleForCategory(1LL);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[DADeviceConnectionLocal session:signFile:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[DADeviceConnectionLocal] %s", buf, 0xCu);
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal strongDeviceIdentity](self, "strongDeviceIdentity"));
    id v14 = 0LL;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 signFile:v7 error:&v14]);
    id v11 = v14;
  }

  else
  {
    int v13 = 0LL;
  }

  v8[2](v8, v13, v11);
}

- (void)_sessionDidPowerOff:(id)a3 forReboot:(BOOL)a4 withParameters:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = DiagnosticLogHandleForCategory(1LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    id v19 = "-[DADeviceConnectionLocal _sessionDidPowerOff:forReboot:withParameters:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[DADeviceConnectionLocal] %s",  (uint8_t *)&v18,  0xCu);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bootMode"]);
  if (v10 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) != 0)) {
    id v12 = [v10 integerValue];
  }
  else {
    id v12 = 0LL;
  }
  -[DADeviceConnectionLocal _setNextBootForBootMode:](self, "_setNextBootForBootMode:", v12);
  if ([v10 integerValue] == (id)3)
  {
    uint64_t v13 = DiagnosticLogHandleForCategory(3LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Starting battery disconnect shutdown sequence.",  (uint8_t *)&v18,  2u);
    }

    uint64_t v15 = -[DADeviceConnectionLocal _unsealCodeFromParameters:](self, "_unsealCodeFromParameters:", v7);
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 5.0);
    if (-[DADeviceConnectionLocal _shutdownForBatteryDisconnectWithUnsealCode:]( self,  "_shutdownForBatteryDisconnectWithUnsealCode:",  v15))
    {
      goto LABEL_17;
    }

- (void)_setNextBootForBootMode:(int64_t)a3
{
  uint64_t v4 = DiagnosticLogHandleForCategory(3LL);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    int64_t v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting next boot to %ld",  (uint8_t *)&v14,  0xCu);
  }

  if ((unint64_t)(a3 - 3) >= 2 && a3)
  {
    if (a3 == 1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](&OBJC_CLASS___DANvramUtil, "sharedInstance"));
      [v6 setNextBootRecovery];
    }

    else
    {
      uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
        sub_1000193B0(a3, (os_log_s *)v6, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](&OBJC_CLASS___DANvramUtil, "sharedInstance"));
    [v6 clearNextBootCheckerBoardPersistent];
  }
}

- (void)_shutDownDeviceForReboot:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = DiagnosticLogHandleForCategory(1LL);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Diagnostics is rebooting this device", v8, 2u);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___FBSSystemService);
  id v7 = [[FBSShutdownOptions alloc] initWithReason:@"Rebooting for Diagnostics"];
  [v7 setRebootType:v3];
  [v6 shutdownWithOptions:v7];
}

- (unsigned)_unsealCodeFromParameters:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"unsealCode"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v4));
    if ([v6 scanHexInt:&v9])
    {
      LODWORD(v3) = v9;
    }

    else
    {
      uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
      BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_100019414();
      }
    }
  }

  return v3;
}

- (BOOL)_shutdownForBatteryDisconnectWithUnsealCode:(unsigned int)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___DSAppleSMCDevice);
  [v4 openAppleSMC:0];
  unsigned __int16 v39 = HIWORD(a3);
  __int16 v40 = a3;
  unsigned int v5 = [v4 writeDataFor:@"GCCM" value:&v40 size:2];
  uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001946C();
    }
    goto LABEL_47;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Low bytes of unseal code successfully written to SMC",  buf,  2u);
  }

  unsigned __int8 v9 = [v4 writeDataFor:@"GCRW" value:&v39 size:2];
  uint64_t v10 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v8 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001946C();
    }
    goto LABEL_47;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "High bytes of unseal code successfully written to SMC, %#x",  buf,  8u);
  }

  __int16 v38 = 0;
  if (([v4 writeDataFor:@"GCCM" value:&v38 size:2] & 1) == 0)
  {
    uint64_t v30 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100019440();
    }
    goto LABEL_47;
  }

  uint64_t v12 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Status read control register written low bytes to SMC",  buf,  2u);
  }

  unsigned int v14 = [v4 readDataFor:@"GCRW" value:&v37 size:2];
  uint64_t v15 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v8 = v16;
  if (!v14)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
LABEL_36:
    sub_100019440();
    goto LABEL_47;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully read from status high bytes register address: %#x",  buf,  8u);
  }

  if ((v37 & 0x2000) != 0)
  {
    uint64_t v31 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v42 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Control assignment failed, register value: %#x",  buf,  8u);
    }

    goto LABEL_47;
  }

  unsigned __int16 v37 = 23;
  if (![v4 writeDataFor:@"GCCM" value:&v37 size:2])
  {
    uint64_t v32 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    goto LABEL_36;
  }

  uint64_t v17 = DiagnosticLogHandleForCategory(3LL);
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "First read control register low bytes written to SMC",  buf,  2u);
  }

  unsigned int v19 = [v4 readDataFor:@"GCRW" value:&v36 size:2];
  uint64_t v20 = DiagnosticLogHandleForCategory(3LL);
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v8 = v21;
  if (!v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
LABEL_42:
    }
      sub_100019440();
LABEL_47:

    BOOL v29 = 0;
    goto LABEL_48;
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully read from first control register high bytes address: %#x",  buf,  8u);
  }

  unsigned __int16 v36 = 32;
  if (![v4 writeDataFor:@"GCCM" value:&v36 size:2])
  {
    uint64_t v33 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    goto LABEL_42;
  }

  uint64_t v22 = DiagnosticLogHandleForCategory(3LL);
  unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Second read control register low bytes written to SMC",  buf,  2u);
  }

  unsigned int v24 = [v4 readDataFor:@"GCRW" value:&v35 size:2];
  uint64_t v25 = DiagnosticLogHandleForCategory(3LL);
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v8 = v26;
  if (!v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100019440();
    }
    goto LABEL_47;
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v42 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully read from second control register high bytes value: %#x",  buf,  8u);
  }

  uint64_t v27 = DiagnosticLogHandleForCategory(3LL);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Battery Disconnect shutdown successfully initiated.",  buf,  2u);
  }

  BOOL v29 = 1;
LABEL_48:

  return v29;
}

- (BOOL)_shutdownToShelfLifeMode
{
  id v3 = objc_alloc_init(&OBJC_CLASS___DSAppleSMCDevice);
  [v3 openAppleSMC:0];
  if (![v3 writeValueFor:@"BCSL" andValue:&off_10002E878])
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }

  [v3 readValueFor:@"BCSL"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5 != 2)
  {
    uint64_t v9 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      sub_100019498();
LABEL_8:

    BOOL v6 = 0;
    goto LABEL_9;
  }

  -[DADeviceConnectionLocal _shutDownDeviceForReboot:](self, "_shutDownDeviceForReboot:", 0LL);
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)archive
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal session](self, "session"));
  [v2 archive];
}

- (DADeviceConnectionDelegate)delegate
{
  return (DADeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)progressForTest
{
  return self->_progressForTest;
}

- (void)setProgressForTest:(id)a3
{
}

- (DADeviceConnectionConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
}

- (ASTSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
}

- (DAStrongDeviceIdentity)strongDeviceIdentity
{
  return self->_strongDeviceIdentity;
}

- (void)setStrongDeviceIdentity:(id)a3
{
}

- (DAAssetUploader)assetUploader
{
  return self->_assetUploader;
}

- (void)setAssetUploader:(id)a3
{
}

- (NSMutableDictionary)sandboxExtensionHandles
{
  return self->_sandboxExtensionHandles;
}

- (void)setSandboxExtensionHandles:(id)a3
{
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (void).cxx_destruct
{
}

@end