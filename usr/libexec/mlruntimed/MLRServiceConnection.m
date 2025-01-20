@interface MLRServiceConnection
- (BOOL)taskIsDeferred;
- (MLRServiceConnection)initWithXPCConnection:(id)a3;
- (OS_xpc_object)activity;
- (void)debugInfoStringForPluginID:(id)a3 completion:(id)a4;
- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5;
- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)fetchRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4;
- (void)fetchTelemetryForBundleId:(id)a3 completion:(id)a4;
- (void)runEvaluationForBundleId:(id)a3 recipePath:(id)a4 recordUUIDs:(id)a5 attachments:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)runLiveEvaluationForAllBundlesWithBaseURL:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)runLiveEvaluationForBundleId:(id)a3 taskSource:(int64_t)a4 baseURL:(id)a5 localeIdentifier:(id)a6 completion:(id)a7;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forInfoKey:(id)a4 bundleID:(id)a5 completion:(id)a6;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation MLRServiceConnection

- (MLRServiceConnection)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MLRServiceConnection;
  v5 = -[MLRServiceConnection init](&v22, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v6 systemUptime];
    v5->_connectionStartTime = v7;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("MLRServiceConnection", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    [v4 _setQueue:v5->_queue];
    objc_storeWeak((id *)&v5->_connection, v4);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](&OBJC_CLASS___DESBundleRegistry, "sharedInstance"));
    bundleRegistry = v5->_bundleRegistry;
    v5->_bundleRegistry = (DESBundleRegistry *)v12;

    v14 = objc_opt_new(&OBJC_CLASS___DESRecordStoreManager);
    recordStoreManager = v5->_recordStoreManager;
    v5->_recordStoreManager = v14;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000073A4;
    v20[3] = &unk_100014708;
    v16 = v5;
    v21 = v16;
    v17 = objc_retainBlock(v20);
    [v4 setInterruptionHandler:v17];
    [v4 setInvalidationHandler:v17];
    v18 = v16;
  }

  return v5;
}

- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3
{
  p_connection = &self->_connection;
  v5 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  unsigned __int8 v7 = +[DESServiceAccess hasToolEntitlement:]( &OBJC_CLASS___DESServiceAccess,  "hasToolEntitlement:",  WeakRetained);

  if ((v7 & 1) != 0)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[DESBundleRegistry allBundleIds](self->_bundleRegistry, "allBundleIds"));
    v5[2](v5);
  }

  else
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    uint64_t v12 = @"fetchInstalledBundlesIdsWithCompletion may only be called by des_tool";
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v8));
    ((void (*)(void (**)(void), void, void *))v5[2])(v5, 0LL, v9);
  }

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    uint64_t v8 = DESLogAndReturnSunsetError();
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v9);
  }

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    uint64_t v6 = DESLogAndReturnSunsetError();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
  }

- (void)fetchRecordsForBundleId:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    uint64_t v6 = DESLogAndReturnSunsetError();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, void, void, void, id))a4 + 2))(v5, 0LL, 0LL, 0LL, v7);
  }

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v14 = 0LL;
  unsigned __int8 v9 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v6,  WeakRetained,  &v14);
  id v10 = v14;

  if ((v9 & 1) != 0)
  {
    recordStoreManager = self->_recordStoreManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100007D04;
    v12[3] = &unk_100014960;
    v12[4] = self;
    id v13 = v7;
    -[DESRecordStoreManager deleteAllSavedRecordsForBundleId:completion:]( recordStoreManager,  "deleteAllSavedRecordsForBundleId:completion:",  v6,  v12);
  }

  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v17 = 0LL;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v8,  WeakRetained,  &v17);
  id v13 = v17;

  if ((v12 & 1) != 0)
  {
    recordStoreManager = self->_recordStoreManager;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100007EC0;
    v15[3] = &unk_100014960;
    v15[4] = self;
    id v16 = v10;
    -[DESRecordStoreManager deleteSavedRecordForBundleId:identfier:completion:]( recordStoreManager,  "deleteSavedRecordForBundleId:identfier:completion:",  v8,  v9,  v15);
  }

  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    uint64_t v6 = DESLogAndReturnSunsetError();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
  }

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v15 = 0LL;
  unsigned __int8 v10 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v8,  WeakRetained,  &v15);

  id v11 = v15;
  if ((v10 & 1) != 0)
  {
    if (v7)
    {
      uint64_t v12 = DESLogAndReturnSunsetError();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7[2](v7, 0LL, v13);
    }
  }

  else
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Uh oh %@", buf, 0xCu);
    }

    v7[2](v7, 0LL, v11);
  }
}

- (void)runEvaluationForBundleId:(id)a3 recipePath:(id)a4 recordUUIDs:(id)a5 attachments:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v11 = a7;
  id v12 = a8;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v25 = 0LL;
  unsigned __int8 v15 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v13,  WeakRetained,  &v25);

  id v16 = v25;
  if ((v15 & 1) != 0)
  {
    id v17 = -[DESSandBoxManager initWithExtensions:]( objc_alloc(&OBJC_CLASS___DESSandBoxManager),  "initWithExtensions:",  v11);
    sandBoxExtension = self->_sandBoxExtension;
    self->_sandBoxExtension = v17;

    v19 = self->_sandBoxExtension;
    id v24 = v16;
    unsigned __int8 v20 = -[DESSandBoxManager consumeExtensionsWithError:](v19, "consumeExtensionsWithError:", &v24);
    id v21 = v24;

    if ((v20 & 1) != 0)
    {
      uint64_t v22 = DESLogAndReturnSunsetError();
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      (*((void (**)(id, void, void, void, void *))v12 + 2))(v12, 0LL, 0LL, 0LL, v23);
    }

    else
    {
      (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0LL, 0LL, 0LL, v21);
    }

    id v16 = v21;
  }

  else
  {
    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0LL, 0LL, 0LL, v16);
  }
}

- (void)runLiveEvaluationForBundleId:(id)a3 taskSource:(int64_t)a4 baseURL:(id)a5 localeIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v24 = 0LL;
  unsigned __int8 v17 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v12,  WeakRetained,  &v24);
  id v18 = v24;
  if ((v17 & 1) != 0)
  {
    v19 = -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]( objc_alloc(&OBJC_CLASS___MLRTaskScheduler),  "initWithBaseURL:localeIdentifier:fromDesTool:",  v13,  v14,  WeakRetained != 0LL);
    unsigned __int8 v20 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:]( objc_alloc(&OBJC_CLASS___MLRSchedulingTask),  "initWithBundleIdentifier:taskSource:",  v12,  a4);
    id v25 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100008440;
    v22[3] = &unk_100014668;
    v22[4] = self;
    id v23 = v15;
    -[MLRTaskScheduler startTasks:completion:](v19, "startTasks:completion:", v21, v22);
  }

  else
  {
    (*((void (**)(id, void, id))v15 + 2))(v15, 0LL, v18);
  }
}

- (void)runLiveEvaluationForAllBundlesWithBaseURL:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if ((+[DESServiceAccess hasToolEntitlement:]( &OBJC_CLASS___DESServiceAccess,  "hasToolEntitlement:",  WeakRetained) & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](&OBJC_CLASS___DESBundleRegistry, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allUnrestrictedBundleIds]);

    id v14 = -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]( objc_alloc(&OBJC_CLASS___MLRTaskScheduler),  "initWithBaseURL:localeIdentifier:fromDesTool:",  v8,  v9,  WeakRetained != 0LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000086E0;
    v15[3] = &unk_100014610;
    id v16 = v10;
    -[MLRTaskScheduler startTasksForPluginIDs:completion:](v14, "startTasksForPluginIDs:completion:", v13, v15);
  }

  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v18 = @"runLiveEvaluationForAllBundles may only be called by des_tool";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v14 = (MLRTaskScheduler *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v13));
    (*((void (**)(id, MLRTaskScheduler *))v10 + 2))(v10, v14);
  }
}

- (void)fetchTelemetryForBundleId:(id)a3 completion:(id)a4
{
  p_connection = &self->_connection;
  id v5 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  unsigned __int8 v7 = +[DESServiceAccess hasToolEntitlement:]( &OBJC_CLASS___DESServiceAccess,  "hasToolEntitlement:",  WeakRetained);

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = DESLogAndReturnSunsetError();
    id v11 = (id)objc_claimAutoreleasedReturnValue(v8);
    v5[2](v5, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    id v13 = @"fetchTelemetryForBundleId may only be called by des_tool";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v9));
    ((void (*)(void (**)(id, void), void, void *))v5[2])(v5, 0LL, v10);
  }

- (void)setValue:(id)a3 forInfoKey:(id)a4 bundleID:(id)a5 completion:(id)a6
{
}

- (void)wakeUpWithCompletion:(id)a3
{
}

- (void)debugInfoStringForPluginID:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v9 = -[DESDebugRecord initFromStoreWithPluginID:taskSource:]( objc_alloc(&OBJC_CLASS___DESDebugRecord),  "initFromStoreWithPluginID:taskSource:",  v6,  1LL);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v7));
  v5[2](v5, v8);
}

- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  unsigned __int8 v12 = +[DESServiceAccess hasMLRCtlEntitlement:]( &OBJC_CLASS___DESServiceAccess,  "hasMLRCtlEntitlement:",  WeakRetained);

  if ((v12 & 1) != 0)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100008CF0((uint64_t)v8, (uint64_t)v9, v13);
    }

    id v14 = [[MLRTrialDediscoTaskResult alloc] initWithJSONResult:v8 identifier:v9];
    if (!v14)
    {
      uint64_t v17 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown identifier = %@",  v9));
      id v22 = v16;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  1303LL,  v18));
      v10[2](v10, v19);

      goto LABEL_8;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 280LL));
    id v20 = 0LL;
    [v14 submitWithTRIClient:v15 error:&v20];
    id v16 = v20;
  }

  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    id v24 = @"donateJSONResult may only be called by internal tool.";
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v14));
  }

  v10[2](v10, v16);
LABEL_8:
}

- (BOOL)taskIsDeferred
{
  return 0;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
}

@end