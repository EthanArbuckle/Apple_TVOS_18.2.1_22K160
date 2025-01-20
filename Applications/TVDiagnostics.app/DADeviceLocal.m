@interface DADeviceLocal
- (BOOL)areTestsSuspended;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DADeviceConnectionLocal)connection;
- (DADeviceDelegate)delegate;
- (DADeviceLocal)init;
- (DADeviceLocal)initWithSerialNumber:(id)a3;
- (DADeviceState)state;
- (DATestQueue)testQueue;
- (DKDiagnosticManager)diagnosticsManager;
- (DKReportManager)reportManager;
- (NSString)bundleIdentifier;
- (NSString)customSerialNumber;
- (NSString)description;
- (id)_IMEI;
- (id)_createDeviceConnection;
- (id)_deviceAttributes;
- (id)_deviceClass;
- (id)_deviceColor;
- (id)_deviceEnclosureColor;
- (id)_deviceImageName;
- (id)_deviceMaskName;
- (id)_deviceType;
- (id)_getDiagnosticAllowList;
- (id)_marketingName;
- (id)_productClass;
- (id)_serialNumber;
- (unint64_t)hash;
- (void)_initDevice;
- (void)_localDeviceSessionWillStartNotification:(id)a3;
- (void)archiveConnection;
- (void)cancelTestWithCommand:(id)a3;
- (void)deviceConnection:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6;
- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4;
- (void)deviceConnection:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5;
- (void)deviceConnection:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)idle;
- (void)profileWithCommand:(id)a3;
- (void)requestSuiteFinishWithCompletionHandler:(id)a3;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)resumeTests;
- (void)setBundleIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCustomSerialNumber:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsManager:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setState:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)setTestsSuspended:(BOOL)a3;
- (void)start;
- (void)startTestWithCommand:(id)a3;
- (void)suspendTests;
- (void)updateProgress:(id)a3 forTest:(id)a4;
- (void)uploadAssets:(id)a3 completion:(id)a4;
@end

@implementation DADeviceLocal

- (DADeviceLocal)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DADeviceLocal;
  v2 = -[DADeviceLocal init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[DADeviceLocal _initDevice](v2, "_initDevice");
  }
  return v3;
}

- (DADeviceLocal)initWithSerialNumber:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DADeviceLocal;
  v6 = -[DADeviceLocal init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _serialNumber](v6, "_serialNumber"));
    unsigned int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100018D0C(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      v7 = 0LL;
    }

    else
    {
      objc_storeStrong((id *)&v7->_customSerialNumber, a3);
      -[DADeviceLocal _initDevice](v7, "_initDevice");
    }
  }

  return v7;
}

- (void)setBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[DKReportManager initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___DKReportManager),  "initWithBundleIdentifier:",  v4);

  reportManager = self->_reportManager;
  self->_reportManager = v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serialNumber]);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___DADevice])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serialNumber]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serialNumber]);
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@; %p: %@>",
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (BOOL)isLocal
{
  return 1;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"com.apple.Diagnostics.LocalSessionWillStart" object:self];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  [v4 start];
}

- (void)idle
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  [v2 idle];
}

- (void)suspendTests
{
  uint64_t v3 = DiagnosticLogHandleForCategory(1LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Test launch suspending for %@.",  (uint8_t *)&v7,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
  [v5 setSuspended:1];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
  [v6 cancelAllDiagnostics];
}

- (void)resumeTests
{
  uint64_t v3 = DiagnosticLogHandleForCategory(1LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Test launch resuming for %@.",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
  [v5 setSuspended:0];
}

- (void)end
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  id v4 = [v3 phase];

  if (v4 != (id)5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
    [v5 setPhase:5];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009784;
    block[3] = &unk_10002C820;
    block[4] = self;
    dispatch_async(v7, block);
  }

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  [v8 requestSuiteStart:v7 completionHandler:v6];
}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  [v4 idle];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  [v5 setSuiteID:0];

  v6[2](v6, 0LL);
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v12 = objc_retainBlock(a5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  [v10 beginDiagnosticWithIdentifier:v11 parameters:v8 completion:v12];
}

- (void)startTestWithCommand:(id)a3
{
  id v12 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DADeviceConnectionStartTestCommand);
  if ((objc_opt_isKindOfClass(v12, v4) & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 testID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesForIdentifier:v6]);

    if (v7)
    {
      id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[DADeviceLocal testQueue](self, "testQueue"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 parameters]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v12 completion]);
      id v11 = [v10 copy];
      [v8 enqueueTestWithTestAttributes:v7 parameters:v9 completion:v11];
    }

    else
    {
      id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v12 completion]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DKErrorDomain,  -1000LL,  0LL));
      ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);
    }
  }
}

- (void)cancelTestWithCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DADeviceConnectionCancelTestCommand);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    [v7 cancelAllDiagnostics];
  }

- (void)profileWithCommand:(id)a3
{
  id v3 = a3;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 1;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___DADeviceConnectionProfileCommand);
  v30 = v3;
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    uint64_t v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal diagnosticsManager](self, "diagnosticsManager"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100009F80;
    v41[3] = &unk_10002CA68;
    v44 = &v45;
    id v29 = v3;
    id v42 = v29;
    dispatch_group_t group = v5;
    dispatch_group_t v43 = group;
    [v6 diagnosticsWithCompletion:v41];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v29 components]);
    if (!v7
      || (id v8 = (void *)objc_claimAutoreleasedReturnValue([v29 components]),
          BOOL v9 = [v8 count] == 0,
          v8,
          v7,
          v9))
    {
      v31 = 0LL;
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v29 components]);
      id v11 = [v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"identifier"]);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"type"]);
              if (v17)
              {
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[DKComponentPredicate componentPredicateWithType:identifier:]( &OBJC_CLASS___DKComponentPredicate,  "componentPredicateWithType:identifier:",  v17,  v16));
                [v31 addObject:v18];
              }
            }
          }

          id v11 = [v10 countByEnumeratingWithState:&v37 objects:v49 count:16];
        }

        while (v11);
      }
    }

    uint64_t v19 = DiagnosticLogHandleForCategory(1LL);
    objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting report...", buf, 2u);
    }

    dispatch_group_enter(group);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal reportManager](self, "reportManager"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10000A158;
    v32[3] = &unk_10002CA90;
    v35 = &v45;
    id v22 = v29;
    id v33 = v22;
    v23 = group;
    v34 = v23;
    [v21 reportWithComponentPredicateManifest:v31 completion:v32];

    dispatch_time_t v24 = dispatch_time(0LL, 120000000000LL);
    dispatch_group_wait(v23, v24);
    *((_BYTE *)v46 + 24) = 0;
    v25 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v22 completion]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v22 profile]);
    ((void (**)(void, void *))v25)[2](v25, v26);
  }

  _Block_object_dispose(&v45, 8);
}

- (void)deviceConnection:(id)a3 didRecieveCommand:(id)a4
{
  id v7 = a4;
  id v5 = [v7 commandType];
  if (v5 == (id)2)
  {
    -[DADeviceLocal profileWithCommand:](self, "profileWithCommand:", v7);
    goto LABEL_7;
  }

  if (v5 == (id)1)
  {
    -[DADeviceLocal cancelTestWithCommand:](self, "cancelTestWithCommand:", v7);
    goto LABEL_7;
  }

  id v6 = v7;
  if (!v5)
  {
    -[DADeviceLocal startTestWithCommand:](self, "startTestWithCommand:", v7);
LABEL_7:
    id v6 = v7;
  }
}

- (void)deviceConnection:(id)a3 didRequestSuiteRunWithDestinations:(id)a4 confirmation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  [v9 device:self didRequestSuiteRunWithDestinations:v8 confirmation:v7];
}

- (void)deviceConnection:(id)a3 didFinishTestSuite:(id)a4 withEntry:(id)a5 error:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  [v12 device:self didFinishTestSuite:v11 withEntry:v10 error:v9];
}

- (void)deviceConnection:(id)a3 didRequestInstructionalPrompt:(id)a4 withConfirmation:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal delegate](self, "delegate"));
  [v9 device:self didRequestInstructionalPrompt:v8 withConfirmation:v7];
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 progressForTest]);
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  char v9 = objc_opt_respondsToSelector(v8, "requestAsset:completionHandler:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000A5FC;
    v11[3] = &unk_10002CAB8;
    id v12 = v6;
    id v13 = v7;
    [v10 requestAsset:v12 completionHandler:v11];
  }
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *, uint64_t))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  char v8 = objc_opt_respondsToSelector(v7, "requestUploadAssets:completion:");

  if ((v8 & 1) != 0)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    [v9 requestUploadAssets:v11 completion:v6];
  }

  else
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DKErrorDomain,  -1008LL,  0LL));
    v6[2](v6, v9, v10);

    id v6 = (void (**)(id, void *, uint64_t))v10;
  }
}

- (void)_initDevice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceAttributes](self, "_deviceAttributes"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _serialNumber](self, "_serialNumber"));
  id v5 = -[DADeviceState initWithSerialNumber:attributes:]( objc_alloc(&OBJC_CLASS___DADeviceState),  "initWithSerialNumber:attributes:",  v4,  v3);
  state = self->_state;
  self->_state = v5;

  id v7 = (DATestQueue *)objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](&OBJC_CLASS___DATestQueue, "testQueueWithDelegate:", self));
  testQueue = self->_testQueue;
  self->_testQueue = v7;

  char v9 = objc_opt_new(&OBJC_CLASS___DKDiagnosticManager);
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = v9;

  -[DKDiagnosticManager setProgressResponder:](self->_diagnosticsManager, "setProgressResponder:", self);
  -[DKDiagnosticManager setAssetResponder:](self->_diagnosticsManager, "setAssetResponder:", self);
  if (os_variant_has_internal_content("com.apple.Diagnostics"))
  {
    uint64_t v11 = DiagnosticLogHandleForCategory(1LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Diagnostic allow list enabled for internal install",  v20,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _getDiagnosticAllowList](self, "_getDiagnosticAllowList"));
    -[DKDiagnosticManager setAllowList:](self->_diagnosticsManager, "setAllowList:", v13);
  }

  uint64_t v14 = objc_alloc(&OBJC_CLASS___DKReportManager);
  uint64_t v15 = -[DKReportManager initWithBundleIdentifier:](v14, "initWithBundleIdentifier:", kDKDefaultBundleIdentifier);
  reportManager = self->_reportManager;
  self->_reportManager = v15;

  uint64_t v17 = (DADeviceConnectionLocal *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _createDeviceConnection](self, "_createDeviceConnection"));
  connection = self->_connection;
  self->_connection = v17;

  -[DADeviceConnectionLocal setDelegate:](self->_connection, "setDelegate:", self);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v19 addObserver:self selector:"_localDeviceSessionWillStartNotification:" name:@"com.apple.Diagnostics.LocalSessionWillStart" object:0];
}

- (id)_createDeviceConnection
{
  id v3 = objc_alloc(&OBJC_CLASS___DADeviceConnectionLocal);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  id v5 = -[DADeviceConnectionLocal initWithState:](v3, "initWithState:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DADeviceConnectionConfigurator sharedInstance]( &OBJC_CLASS___DADeviceConnectionConfigurator,  "sharedInstance"));
  -[DADeviceConnectionLocal setConfigurator:](v5, "setConfigurator:", v6);

  return v5;
}

- (id)_deviceAttributes
{
  v20[0] = @"productClass";
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _productClass](self, "_productClass"));
  v21[0] = v19;
  v20[1] = @"IMEI";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[DADeviceLocal _IMEI](self, "_IMEI"));
  uint64_t v4 = (void *)v3;
  if (!v3) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v17 = (void *)v3;
  v21[1] = v3;
  v20[2] = @"marketingName";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DADeviceLocal _marketingName](self, "_marketingName"));
  id v6 = (void *)v5;
  if (!v5) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v21[2] = v5;
  v20[3] = @"imageName";
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceImageName](self, "_deviceImageName", v5));
  v21[3] = v18;
  v20[4] = @"maskName";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceMaskName](self, "_deviceMaskName"));
  v21[4] = v7;
  v20[5] = @"deviceType";
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceType](self, "_deviceType"));
  v21[5] = v8;
  v20[6] = @"deviceClass";
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceClass](self, "_deviceClass"));
  v21[6] = v9;
  v20[7] = @"deviceEnclosureColor";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceEnclosureColor](self, "_deviceEnclosureColor"));
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v21[7] = v11;
  v20[8] = @"deviceColor";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal _deviceColor](self, "_deviceColor"));
  id v13 = v12;
  if (!v12) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v21[8] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  9LL));
  if (!v12) {

  }
  if (!v10) {
  if (!v6)
  }

  if (!v4) {
  return v14;
  }
}

- (id)_deviceImageName
{
  id v2 = (void *)MGCopyAnswer(@"DeviceEnclosureColor", 0LL);
  if ([v2 isEqualToString:@"unknown"])
  {
    uint64_t v3 = MGCopyAnswer(@"DeviceColor", 0LL);

    id v2 = (void *)v3;
  }

  uint64_t v4 = (void *)MGCopyAnswer(@"ProductType", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@.png", v4, v2));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingReservedURLCharactersUsingEncoding:1]);

  return v6;
}

- (id)_deviceMaskName
{
  id v2 = (void *)MGCopyAnswer(@"ProductType", 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"mask_%@.png", v2));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByReplacingReservedURLCharactersUsingEncoding:1]);

  return v4;
}

- (id)_serialNumber
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal customSerialNumber](self, "customSerialNumber"));

  if (v3) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal customSerialNumber](self, "customSerialNumber"));
  }
  else {
    uint64_t v4 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
  }
  return v4;
}

- (id)_productClass
{
  return (id)MGCopyAnswer(@"DeviceName", 0LL);
}

- (id)_deviceClass
{
  return (id)MGCopyAnswer(@"DeviceClass", 0LL);
}

- (id)_deviceType
{
  return (id)MGCopyAnswer(@"ProductType", 0LL);
}

- (id)_deviceEnclosureColor
{
  id v2 = (void *)MGCopyAnswer(@"DeviceEnclosureColor", 0LL);
  uint64_t v3 = 0LL;

  return v3;
}

- (id)_deviceColor
{
  id v2 = (void *)MGCopyAnswer(@"DeviceColor", 0LL);
  uint64_t v3 = 0LL;

  return v3;
}

- (id)_marketingName
{
  return (id)MGCopyAnswer(@"marketing-name", 0LL);
}

- (id)_IMEI
{
  return 0LL;
}

- (id)_getDiagnosticAllowList
{
  if (qword_10003A618 != -1) {
    dispatch_once(&qword_10003A618, &stru_10002CAD8);
  }
  return (id)qword_10003A610;
}

- (void)_localDeviceSessionWillStartNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  if (![v6 phase])
  {

LABEL_8:
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal state](self, "state"));
  id v8 = [v7 phase];

  if (v8 != (id)1)
  {
    uint64_t v9 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
      int v13 = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Local device %@ ending so %@ can start",  (uint8_t *)&v13,  0x16u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
    [v12 end];
  }

- (NSString)bundleIdentifier
{
  return (NSString *)kDKDefaultBundleIdentifier;
}

- (void)archiveConnection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceLocal connection](self, "connection"));
  [v2 archive];
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DADeviceConnectionLocal)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (DKDiagnosticManager)diagnosticsManager
{
  return self->_diagnosticsManager;
}

- (void)setDiagnosticsManager:(id)a3
{
}

- (DKReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (BOOL)areTestsSuspended
{
  return self->_testsSuspended;
}

- (void)setTestsSuspended:(BOOL)a3
{
  self->_testsSuspended = a3;
}

- (DATestQueue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)customSerialNumber
{
  return self->_customSerialNumber;
}

- (void)setCustomSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end