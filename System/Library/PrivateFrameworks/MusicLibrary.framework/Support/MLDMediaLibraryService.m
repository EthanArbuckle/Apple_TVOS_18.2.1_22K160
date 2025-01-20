@interface MLDMediaLibraryService
+ (id)sharedInstance;
- (BOOL)_isMediaPath:(id)a3 selector:(SEL)a4 resolvedPath:(id *)a5;
- (BOOL)_platformSupportsSiriIndexing;
- (BOOL)_platformSupportsSpotlightIndexing;
- (BOOL)_shouldAcceptConnectionForMediaLibraryService:(id)a3;
- (BOOL)_validateTransactionIdentifier:(id)a3 forClient:(id)a4;
- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5;
- (BOOL)isDatabaseLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLDMediaLibraryService)init;
- (id)_XPCListenerForService:(int64_t)a3;
- (id)_allMediaLibraries;
- (id)_clientForConnection:(id)a3;
- (id)_currentXPCClient;
- (id)_deviceSharedLibraryPath;
- (id)_generateSecurityScopedURLWrapperForItemPid:(unint64_t)a3 withLibrary:(id)a4 error:(id *)a5;
- (id)_init;
- (id)_mediaLibraryForPath:(id)a3;
- (id)_stateDump;
- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4;
- (int64_t)_MLDSupportedServiceForXPCListener:(id)a3;
- (int64_t)currentLockReason;
- (void)_disconnectLibraries:(id)a3;
- (void)_handleDebugSignal;
- (void)_handleLibraryDidChangeNotification:(id)a3;
- (void)_handleXPCDisconnect:(id)a3;
- (void)_idleTimerFired:(id)a3;
- (void)_logPrivacyAccessWithTransactionIdentifier:(id)a3;
- (void)_performDiagnosticWithReason:(id)a3;
- (void)_performMaintenanceOnDatabaseAtPath:(id)a3 withActivity:(id)a4 completion:(id)a5;
- (void)_reconnectLibraries:(id)a3;
- (void)_registerForLibraryDidChangeNotifications;
- (void)_registerTransactionInfo:(id)a3 forIdentitifer:(id)a4;
- (void)_resetIdleTimer;
- (void)_setupActivityHandlers;
- (void)_setupCacheDeleteController;
- (void)_setupNotifyEventHandlers;
- (void)_setupSignalHandler;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)_tearDownLibraryDidChangeNotifications;
- (void)_tearDownSignalHandler;
- (void)_unregisterServiceOriginatedTransactionWithConnection:(id)a3;
- (void)_unregisterTransactionInfoForIdentifier:(id)a3;
- (void)_updateMultiUserPurgeabilityForPrimaryLibraryPath:(id)a3;
- (void)_updateSiriIndexForNotification:(id)a3;
- (void)_updateSiriIndexMetadataForLibraryAtPath:(id)a3 completion:(id)a4;
- (void)_validateDatabaseAtPath:(id)a3 byTruncatingFirst:(BOOL)a4 withCompletion:(id)a5;
- (void)_validateDatabaseAtPath:(id)a3 forConnection:(id)a4 byTruncatingFirst:(BOOL)a5 withCompletion:(id)a6;
- (void)_writeDiagnosticToDisk:(id)a3;
- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4;
- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4;
- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7;
- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6;
- (void)faultForQuery:(id)a3 fromClientBundleID:(id)a4 onTrustError:(id)a5;
- (void)getClientImportServiceListenerEndpointWithCompletion:(id)a3;
- (void)getLanguageResourcesWithCompletion:(id)a3;
- (void)getMediaLibraryResourcesServiceListenerEndpointWithCompletion:(id)a3;
- (void)library:(id)a3 didBeginDatabaseTransactionWithConnection:(id)a4;
- (void)library:(id)a3 didCommitDatabaseTransactionWithConnection:(id)a4;
- (void)library:(id)a3 didRollbackDatabaseTransactionWithConnection:(id)a4;
- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4;
- (void)mediaLibraryWriter:(id)a3 terminatedTransaction:(id)a4 withError:(id)a5;
- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)performDiagnosticWithCompletionHandler:(id)a3;
- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6;
- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)securityScopedURLWrapperForItemPid:(unint64_t)a3 withDatabasePath:(id)a4 completionHandler:(id)a5;
- (void)setCurrentLockReason:(int64_t)a3;
- (void)setDatabaseLocked:(BOOL)a3;
- (void)setOptions:(id)a3 withCompletionHandler:(id)a4;
- (void)start;
- (void)unlockDatabaseWithCompletion:(id)a3;
- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3;
- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4;
- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)validateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation MLDMediaLibraryService

- (MLDMediaLibraryService)init
{
  return 0LL;
}

- (id)_init
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___MLDMediaLibraryService;
  v2 = -[MLDMediaLibraryService init](&v36, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.medialibraryd.MediaLibraryService.SerialQueue", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.medialibraryd.MediaLibraryService.SpotlightIndexQueue", 0LL);
    spotlightIndexQueue = v2->_spotlightIndexQueue;
    v2->_spotlightIndexQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryWriterBeginTransactionQueue", 0LL);
    writerBeginTransactionQueue = v2->_writerBeginTransactionQueue;
    v2->_writerBeginTransactionQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryWriterUpdateQueue", v10);
    writerUpdateQueue = v2->_writerUpdateQueue;
    v2->_writerUpdateQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryCallbackQueue", &_dispatch_queue_attr_concurrent);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    v2->_xpcLock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc_init(&OBJC_CLASS___ML3MediaLibraryWriter);
    writer = v2->_writer;
    v2->_writer = v15;

    -[ML3MediaLibraryWriter setDelegate:](v2->_writer, "setDelegate:", v2);
    v17 = objc_alloc_init(&OBJC_CLASS___ML3DatabaseImportManager);
    importManager = v2->_importManager;
    v2->_importManager = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___MLDDatabaseValidationController);
    validationController = v2->_validationController;
    v2->_validationController = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    maintenanceTasksOperationQueue = v2->_maintenanceTasksOperationQueue;
    v2->_maintenanceTasksOperationQueue = v21;

    -[NSOperationQueue setName:]( v2->_maintenanceTasksOperationQueue,  "setName:",  @"com.apple.medialibraryd.MaintenanceOperationQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:]( v2->_maintenanceTasksOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[NSOperationQueue setQualityOfService:](v2->_maintenanceTasksOperationQueue, "setQualityOfService:", 17LL);
    v23 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    databaseRecoveryOperationQueue = v2->_databaseRecoveryOperationQueue;
    v2->_databaseRecoveryOperationQueue = v23;

    -[NSOperationQueue setQualityOfService:](v2->_databaseRecoveryOperationQueue, "setQualityOfService:", 25LL);
    -[NSOperationQueue setName:]( v2->_databaseRecoveryOperationQueue,  "setName:",  @"com.apple.medialibraryd.DatabaseRecoveryOperationQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:]( v2->_databaseRecoveryOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    databaseRecoveryCompletionHandlers = v2->_databaseRecoveryCompletionHandlers;
    v2->_databaseRecoveryCompletionHandlers = v25;

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mediaLibraries = v2->_mediaLibraries;
    v2->_mediaLibraries = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpcListeners = v2->_xpcListeners;
    v2->_xpcListeners = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    transactionInfoForID = v2->_transactionInfoForID;
    v2->_transactionInfoForID = v31;

    -[MLDMediaLibraryService _registerForLibraryDidChangeNotifications](v2, "_registerForLibraryDidChangeNotifications");
    -[MLDMediaLibraryService _setupSignalHandler](v2, "_setupSignalHandler");
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100012A64;
    v35[3] = &unk_100024A78;
    v35[4] = v2;
    v33 = v2;
    v33->_stateHandle = sub_100012A64((uint64_t)v35);
  }

  return v2;
}

- (id)_stateDump
{
  dispatch_queue_t v3 = -[MLDDiagnostic initWithReason:]( objc_alloc(&OBJC_CLASS___MLDMutableDiagnostic),  "initWithReason:",  @"OS_STATE_API_REQUEST");
  -[MLDMediaLibraryService collectDiagnostic:](self, "collectDiagnostic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLDDiagnostic dictionaryRepresentation](v3, "dictionaryRepresentation"));

  return v4;
}

- (void)dealloc
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000129EC;
  block[3] = &unk_100024AE0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  MSVLogRemoveStateHandler(self->_stateHandle);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MLDMediaLibraryService;
  -[MLDMediaLibraryService dealloc](&v4, "dealloc");
}

- (void)validateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received database validation request on client connection: %{public}@ - path: %{public}@",  buf,  0x16u);
  }

  id v15 = 0LL;
  unsigned __int8 v11 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v7,  a2,  &v15);
  id v12 = v15;
  if ((v11 & 1) != 0)
  {
    -[MLDMediaLibraryService _validateDatabaseAtPath:forConnection:byTruncatingFirst:withCompletion:]( self,  "_validateDatabaseAtPath:forConnection:byTruncatingFirst:withCompletion:",  v12,  v9,  0LL,  v8);
  }

  else if (v8)
  {
    id v13 = objc_retainBlock(v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0LL, v14, 0LL);
  }
}

- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  dispatch_queue_attr_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received request to attempt database recovery from client connection: %{public}@",  buf,  0xCu);
  }

  id v23 = 0LL;
  unsigned __int8 v11 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v8,  a2,  &v23);

  id v12 = v23;
  if ((v11 & 1) != 0)
  {
    id v13 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database recovery at path: %@",  v12));
    id v15 = [v13 initWithName:v14];

    [v15 beginTransaction];
    -[MLDMediaLibraryService _performDiagnosticWithReason:]( self,  "_performDiagnosticWithReason:",  @"Database File Recovery");
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100012694;
    block[3] = &unk_100024B30;
    block[4] = self;
    id v22 = v7;
    id v20 = v15;
    id v21 = v12;
    id v17 = v15;
    dispatch_async(serialQueue, block);

LABEL_7:
    goto LABEL_8;
  }

  if (v7)
  {
    id v17 = objc_retainBlock(v7);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v17 + 2))(v17, 0LL, v18, 0LL);

    goto LABEL_7;
  }

- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  unsigned __int8 v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138543618;
    v26 = v12;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received request to perform database integrity check from client connection: %{public}@. path=%{public}@",  buf,  0x16u);
  }

  id v24 = 0LL;
  unsigned __int8 v13 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v9,  a2,  &v24);
  id v14 = v24;
  if ((v13 & 1) != 0)
  {
    id v15 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database recovery at path: %@",  v14));
    id v17 = [v15 initWithName:v16];

    [v17 beginTransaction];
    __int16 v18 = -[MLDDatabaseIntegrityCheckOperation initWithDatabasePath:repairFaults:]( objc_alloc(&OBJC_CLASS___MLDDatabaseIntegrityCheckOperation),  "initWithDatabasePath:repairFaults:",  v14,  v6);
    objc_initWeak((id *)buf, v18);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000125A0;
    v20[3] = &unk_100024B58;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v10;
    id v19 = v17;
    id v21 = v19;
    -[MLDDatabaseIntegrityCheckOperation setCompletionBlock:](v18, "setCompletionBlock:", v20);
    -[NSOperationQueue addOperation:](self->_databaseRecoveryOperationQueue, "addOperation:", v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
LABEL_7:

    goto LABEL_8;
  }

  if (v10)
  {
    id v19 = objc_retainBlock(v10);
    __int16 v18 = (MLDDatabaseIntegrityCheckOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, MLDDatabaseIntegrityCheckOperation *, void))v19 + 2))(v19, 0LL, v18, 0LL);
    goto LABEL_7;
  }

- (void)performDiagnosticWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(id, void *, void))a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.medialibraryd.diagnostic"]);
  if (_NSIsNSNumber() && ([v6 BOOLValue] & 1) != 0)
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "(Service API) Collecting diagnostic information...",  (uint8_t *)v11,  2u);
    }

    id v8 = -[MLDDiagnostic initWithReason:]( objc_alloc(&OBJC_CLASS___MLDMutableDiagnostic),  "initWithReason:",  @"MediaLibraryService API");
    -[MLDMediaLibraryService collectDiagnostic:](self, "collectDiagnostic:", v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MLDDiagnostic description](v8, "description"));
    v4[2](v4, v9, 0LL);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2001LL,  0LL));
    ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v10);
  }
}

- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received database recreation request on client connection: %{public}@",  buf,  0xCu);
  }

  id v16 = 0LL;
  unsigned __int8 v11 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v8,  a2,  &v16);

  id v12 = v16;
  if ((v11 & 1) != 0)
  {
    -[MLDMediaLibraryService _performDiagnosticWithReason:]( self,  "_performDiagnosticWithReason:",  @"Database Reinitialization");
    unsigned __int8 v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enqueueing recreation operation...", buf, 2u);
    }

    -[MLDMediaLibraryService _validateDatabaseAtPath:forConnection:byTruncatingFirst:withCompletion:]( self,  "_validateDatabaseAtPath:forConnection:byTruncatingFirst:withCompletion:",  v12,  v9,  1LL,  v7);
  }

  else if (v7)
  {
    id v14 = objc_retainBlock(v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v14 + 2))(v14, 0LL, v15, 0LL);
  }
}

- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  id v10 = [v7 priorityLevel];
  id v11 = [v7 options];
  id v12 = (MLDTaskAssertion *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  unsigned __int8 v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Received begin transaction request on client: %{public}@",  buf,  0xCu);
  }

  id v42 = 0LL;
  unsigned __int8 v14 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v9,  a2,  &v42);
  id v15 = v42;
  id v16 = v15;
  if ((v14 & 1) != 0)
  {
    if (v8)
    {
      if (v15)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database transaction for library at path: %@",  v15));
        id v30 = v11;
        if ((v11 & 2) != 0)
        {
          v31 = 0LL;
        }

        else
        {
          uint64_t v18 = ML3ProcessHandleFromPID(-[MLDTaskAssertion processID](v12, "processID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(v18);
          if ([v29 isDaemon])
          {
            id v19 = os_log_create("com.apple.amp.medialibraryd", "Service");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v44 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Skipping taking task assertion for daemon client process %{public}@",  buf,  0xCu);
            }

            v31 = 0LL;
          }

          else
          {
            v32 = objc_alloc(&OBJC_CLASS___MLDTaskAssertion);
            id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Finish Task Assertion, %@",  v17));
            unsigned int v27 = -[MLDTaskAssertion processID](v12, "processID");
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MLDTaskAssertion bundleID](v12, "bundleID"));
            v31 = -[MLDTaskAssertion initWithName:pid:bundleID:](v32, "initWithName:pid:bundleID:", v28, v27, v21);

            id v19 = os_log_create("com.apple.amp.medialibraryd", "Service");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v44 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Taking task assertion %{public}@",  buf,  0xCu);
            }
          }
        }

        id v22 = [[MSVXPCTransaction alloc] initWithName:v17];
        [v22 beginTransaction];
        if (v10 && -[ML3DatabaseImportManager operationsCount](self->_importManager, "operationsCount"))
        {
          id v23 = os_log_create("com.apple.amp.medialibraryd", "Service");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Suspending current import operations for higher priority client transaction.",  buf,  2u);
          }

          -[ML3DatabaseImportManager suspendImportOperations](self->_importManager, "suspendImportOperations");
          -[MLDMediaLibraryService _startIdleTimer](self, "_startIdleTimer");
        }

        else
        {
          -[MLDMediaLibraryService _resetIdleTimer](self, "_resetIdleTimer");
        }

        id v24 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Validating database before starting transaction",  buf,  2u);
        }

        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_1000121B0;
        v33[3] = &unk_100024BA8;
        v33[4] = self;
        id v34 = v16;
        v35 = v12;
        id v40 = v30;
        SEL v41 = a2;
        id v39 = v8;
        id v36 = v22;
        v37 = v31;
        id v38 = v7;
        v25 = v31;
        id v26 = v22;
        -[MLDMediaLibraryService validateDatabaseAtPath:withCompletionHandler:]( self,  "validateDatabaseAtPath:withCompletionHandler:",  v34,  v33);
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MediaLibraryWriter writerErrorWithCode:description:]( &OBJC_CLASS___ML3MediaLibraryWriter,  "writerErrorWithCode:description:",  200LL,  @"No database path provided to start the transaction."));
        (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v17);
      }

      goto LABEL_30;
    }

    id v17 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      goto LABEL_31;
    }

    id v20 = (MLDTaskAssertion *)objc_claimAutoreleasedReturnValue(-[MLDTaskAssertion bundleID](v12, "bundleID"));
    *(_DWORD *)buf = 138543362;
    v44 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "Warning: %{public}@ attempted to begin a transaction without a completion handler. MLWriter will deadlock without a way to give identifier back to client.",  buf,  0xCu);
LABEL_15:

    goto LABEL_30;
  }

  if (v8)
  {
    id v17 = objc_retainBlock(v8);
    id v20 = (MLDTaskAssertion *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(void *, void, MLDTaskAssertion *, void))v17 + 2))(v17, 0LL, v20, 0LL);
    goto LABEL_15;
  }

- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1000101C4;
  id v24 = sub_1000101D4;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1000101C4;
  uint64_t v18 = sub_1000101D4;
  id v19 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001211C;
  v10[3] = &unk_100024BD0;
  id v12 = &v14;
  unsigned __int8 v13 = &v20;
  v10[4] = self;
  id v7 = dispatch_semaphore_create(0LL);
  id v11 = v7;
  -[MLDMediaLibraryService beginTransactionForDatabaseWithContext:completionHandler:]( self,  "beginTransactionForDatabaseWithContext:completionHandler:",  v6,  v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138543362;
    id v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Received database update request on client connection: %{public}@",  buf,  0xCu);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  if (-[MLDMediaLibraryService _validateTransactionIdentifier:forClient:]( self,  "_validateTransactionIdentifier:forClient:",  v12,  v16))
  {
    -[MLDMediaLibraryService _resetIdleTimer](self, "_resetIdleTimer");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);

    writerUpdateQueue = (dispatch_queue_s *)self->_writerUpdateQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100012018;
    v21[3] = &unk_100024C20;
    v21[4] = self;
    id v22 = v12;
    id v23 = v10;
    id v24 = v11;
    id v25 = v18;
    id v26 = v13;
    id v20 = v18;
    dispatch_async(writerUpdateQueue, v21);
  }

  else
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2002LL,  0LL));
    (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v20);
  }
}

- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  uint64_t v18 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Received database query request on client connection: %{public}@",  buf,  0xCu);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  if (-[MLDMediaLibraryService _validateTransactionIdentifier:forClient:]( self,  "_validateTransactionIdentifier:forClient:",  v15,  v19))
  {
    -[MLDMediaLibraryService _resetIdleTimer](self, "_resetIdleTimer");
    if (v16)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);

      writerUpdateQueue = (dispatch_queue_s *)self->_writerUpdateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100011F10;
      block[3] = &unk_100024C48;
      block[4] = self;
      id v26 = v15;
      id v27 = v12;
      id v28 = v13;
      id v29 = v14;
      id v30 = v21;
      id v31 = v16;
      id v23 = v21;
      dispatch_async(writerUpdateQueue, block);
    }

    else
    {
      id v23 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
        *(_DWORD *)buf = 138543362;
        v33 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Warning: %{public}@ attempted to execute query without completion handler. Results will be thrown in the bit b ucket without a way to give them to the client.",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2002LL,  0LL));
    (*((void (**)(id, void, os_log_s *))v16 + 2))(v16, 0LL, v23);
  }
}

- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, id, id))a5;
  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138543362;
    id v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Received end transaction request on client connection: %{public}@",  buf,  0xCu);
  }

  writer = self->_writer;
  id v15 = 0LL;
  id v13 = -[ML3MediaLibraryWriter endTransaction:shouldCommit:error:]( writer,  "endTransaction:shouldCommit:error:",  v8,  v6,  &v15);
  id v14 = v15;
  if (v9) {
    v9[2](v9, v13, v14);
  }
  -[MLDMediaLibraryService _unregisterTransactionInfoForIdentifier:]( self,  "_unregisterTransactionInfoForIdentifier:",  v8);
}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Ending transaction %{public}@. shouldCommit=%{BOOL}u",  buf,  0x12u);
  }

  writer = self->_writer;
  id v14 = 0LL;
  unsigned __int8 v11 = -[ML3MediaLibraryWriter endTransaction:shouldCommit:error:]( writer,  "endTransaction:shouldCommit:error:",  v8,  v6,  &v14);
  id v12 = v14;
  -[MLDMediaLibraryService _unregisterTransactionInfoForIdentifier:]( self,  "_unregisterTransactionInfoForIdentifier:",  v8);
  if (a5) {
    *a5 = v12;
  }

  return v11;
}

- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v59 = (unint64_t)v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received database operation request on client: %{public}@",  buf,  0xCu);
  }

  id v16 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  unint64_t v41 = a3;
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database operation of type %lu",  a3));
  id v18 = [v16 initWithName:v17];

  id v42 = v18;
  [v18 beginTransaction];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:MLDatabaseOperationOptionPriorityLevelKey]);
  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:MLDatabaseOperationOptionReadOnlyKey]);
    unsigned __int8 v21 = [v20 BOOLValue];

    id v22 = [v19 unsignedIntegerValue];
    if ((v21 & 1) == 0 && v22 && -[ML3DatabaseImportManager operationsCount](self->_importManager, "operationsCount"))
    {
      id v23 = os_log_create("com.apple.amp.medialibraryd", "Service");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Suspending current import operations for higher priority database operation.",  buf,  2u);
      }

      -[ML3DatabaseImportManager suspendImportOperations](self->_importManager, "suspendImportOperations");
      -[MLDMediaLibraryService _startIdleTimer](self, "_startIdleTimer");
    }
  }

  -[MLDMediaLibraryService _resetIdleTimer](self, "_resetIdleTimer");
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:MLDatabaseOperationOptionDatabasePathKey]);
  id v57 = 0LL;
  unsigned __int8 v25 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v24,  a2,  &v57);
  id v26 = v57;
  id v27 = v26;
  if ((v25 & 1) != 0)
  {
    id v38 = v19;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100011B1C;
    v49[3] = &unk_100024C98;
    v49[4] = self;
    id v28 = v26;
    id v50 = v28;
    unint64_t v56 = v41;
    id v51 = v11;
    id v29 = v12;
    id v52 = v29;
    id v39 = v14;
    id v30 = v14;
    id v53 = v30;
    id v40 = v13;
    id v31 = v13;
    id v55 = v31;
    id v54 = v42;
    v32 = objc_retainBlock(v49);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:MLDatabaseOperationOptionTransactionIdentifierKey]);
    if (v33)
    {
      dispatch_async((dispatch_queue_t)self->_writerUpdateQueue, v32);
    }

    else
    {
      id v37 = v11;
      id v36 = os_log_create("com.apple.amp.medialibraryd", "Service");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v59 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Validating database before performing operation of type %lu",  buf,  0xCu);
      }

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_100011C0C;
      v43[3] = &unk_100024CC0;
      unint64_t v48 = v41;
      id v44 = v30;
      v45 = self;
      v46 = v32;
      id v47 = v31;
      -[MLDMediaLibraryService validateDatabaseAtPath:withCompletionHandler:]( self,  "validateDatabaseAtPath:withCompletionHandler:",  v28,  v43);

      id v11 = v37;
    }

    id v19 = v38;

    id v14 = v39;
    id v13 = v40;
  }

  else if (v13)
  {
    id v34 = objc_retainBlock(v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v34 + 2))(v34, 0LL, v35, 0LL);
  }
}

- (void)setOptions:(id)a3 withCompletionHandler:(id)a4
{
  objc_super v4 = (void (**)(id, uint64_t, void))a4;
  dispatch_queue_t v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Received set options command from client connection: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = [[MSVXPCTransaction alloc] initWithName:@"Setting media library options."];
  [v7 beginTransaction];
  if (v4) {
    v4[2](v4, 1LL, 0LL);
  }
  [v7 endTransaction];
}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Received import command from client: %{public}@",  buf,  0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 libraryPath]);
  id v33 = 0LL;
  unsigned __int8 v17 = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  v16,  a2,  &v33);
  id v18 = v33;
  if ((v17 & 1) != 0)
  {
    id v19 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Database import into library at path: %@",  v18));
    id v21 = [v19 initWithName:v20];

    [v21 beginTransaction];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000117FC;
    v24[3] = &unk_100024D38;
    id v25 = v11;
    id v26 = self;
    id v27 = v18;
    id v28 = v14;
    unint64_t v32 = a4;
    id v29 = v12;
    id v30 = v21;
    id v31 = v13;
    id v22 = v21;
    -[MLDMediaLibraryService validateDatabaseAtPath:withCompletionHandler:]( self,  "validateDatabaseAtPath:withCompletionHandler:",  v27,  v24);

    id v23 = v25;
LABEL_7:

    goto LABEL_8;
  }

  if (v13)
  {
    id v22 = objc_retainBlock(v13);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v22 + 2))(v22, 0LL, v23, 0LL);
    goto LABEL_7;
  }

- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cancelling operations for import source %lu",  buf,  0xCu);
  }

  importManager = self->_importManager;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000117E8;
  v10[3] = &unk_100024D60;
  id v11 = v6;
  id v9 = v6;
  -[ML3DatabaseImportManager cancelImportOperationsForSource:withCompletionHandler:]( importManager,  "cancelImportOperationsForSource:withCompletionHandler:",  a3,  v10);
}

- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"MLDMediaLibraryService.m", 778, @"Invalid parameter not satisfying: %@", @"reason != MLServiceLockReasonNone" object file lineNumber description];
  }

  writerUpdateQueue = (dispatch_queue_s *)self->_writerUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011388;
  block[3] = &unk_100024DB0;
  id v12 = v7;
  int64_t v13 = a3;
  block[4] = self;
  id v9 = v7;
  dispatch_barrier_async(writerUpdateQueue, block);
}

- (void)unlockDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  writerUpdateQueue = (dispatch_queue_s *)self->_writerUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001106C;
  v7[3] = &unk_100024DD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(writerUpdateQueue, v7);
}

- (void)getLanguageResourcesWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, void *, void))a3;
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v6 = v5;
    if (v5)
    {
      [v5 auditToken];
      uint64_t v7 = MSVBundleIDForAuditToken(&v13);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    }

    id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received language resources request from %{public}@",  buf,  0xCu);
    }

    -[MLDMediaLibraryService _resetIdleTimer](self, "_resetIdleTimer");
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3LanguageResourceManager sharedResourceManager]( &OBJC_CLASS___ML3LanguageResourceManager,  "sharedResourceManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resources]);
    v4[2](v4, v12, 0LL);
  }

- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4
{
}

- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (-[MLDMediaLibraryService _platformSupportsSpotlightIndexing](self, "_platformSupportsSpotlightIndexing"))
  {
    if ([&off_100026628 containsObject:v9])
    {
      id v11 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationState]);
      unsigned __int8 v13 = [v12 isValid];

      if ((v13 & 1) != 0)
      {
        if (!v8 || [v8 count])
        {
          id v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v38 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Received valid request to update spotlight index for bundle ID %{public}@",  buf,  0xCu);
          }

          uint64_t v35 = MLDatabaseOperationAttributeBundleIDKey;
          id v36 = v9;
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));

          if (v8) {
            [v16 setValue:v8 forKey:MLDatabaseOperationAttributeEntityURLsArrayKey];
          }
          v33[0] = MLDatabaseOperationOptionDatabasePathKey;
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary autoupdatingSharedLibraryPath]( &OBJC_CLASS___ML3MusicLibrary,  "autoupdatingSharedLibraryPath"));
          v34[0] = v17;
          v34[1] = &off_100026670;
          v33[1] = MLDatabaseOperationOptionPriorityLevelKey;
          v33[2] = MLDatabaseOperationOptionReadOnlyKey;
          v33[3] = MLDatabaseOperationOptionEnqueueSerially;
          v34[2] = &__kCFBooleanTrue;
          v34[3] = &__kCFBooleanTrue;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  4LL));

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 connection]);

          if (v20)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 connection]);
            id v22 = v21;
            if (v21)
            {
              [v21 auditToken];
            }

            else
            {
              __int128 v31 = 0u;
              __int128 v32 = 0u;
            }

            +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:]( &OBJC_CLASS___ML3DatabasePrivacyContext,  "logDatabasePrivacyAccessWithAuditToken:",  &v31);
          }

          -[MLDMediaLibraryService performDatabaseOperation:withAttributes:options:completionHandler:]( self,  "performDatabaseOperation:withAttributes:options:completionHandler:",  4LL,  v16,  v18,  v10,  v31,  v32);

          goto LABEL_32;
        }

        if (v10)
        {
          os_log_t v29 = sub_1000037E0();
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v38 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "Failed to process request to update spotlight index for bundle ID %{public}@ – searchable items identifier s array has zero entries",  buf,  0xCu);
          }

          id v27 = &off_100026700;
          uint64_t v28 = 1002LL;
LABEL_24:
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  v28,  v27));
          v10[2](v10, 0LL, v16);
LABEL_32:
        }
      }

      else if (v10)
      {
        id v26 = os_log_create("com.apple.amp.medialibraryd", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Failed to process request to update spotlight index – removed system app",  buf,  2u);
        }

        id v27 = &off_1000266D8;
        uint64_t v28 = 1003LL;
        goto LABEL_24;
      }

- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3
{
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v19 connection]);

  if (v4)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v19 connection]);
    id v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v34, 0, 32);
    }
    +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:]( &OBJC_CLASS___ML3DatabasePrivacyContext,  "logDatabasePrivacyAccessWithAuditToken:",  v34);
  }

  uint64_t v7 = dispatch_group_create();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2810000000LL;
  v32[3] = &unk_10001C405;
  int v33 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        dispatch_group_enter(v7);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 databasePath]);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100010F68;
        v24[3] = &unk_100024E00;
        id v27 = v32;
        id v25 = v9;
        id v26 = v7;
        -[MLDMediaLibraryService _updateSiriIndexMetadataForLibraryAtPath:completion:]( self,  "_updateSiriIndexMetadataForLibraryAtPath:completion:",  v14,  v24);
      }

      id v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }

    while (v10);
  }

  callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010FD0;
  block[3] = &unk_100024DD8;
  id v22 = v9;
  id v23 = v18;
  id v16 = v9;
  id v17 = v18;
  dispatch_group_notify(v7, callbackQueue, block);

  _Block_object_dispose(v32, 8);
}

- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v11 = 0LL;
  LOBYTE(a2) = -[MLDMediaLibraryService _isMediaPath:selector:resolvedPath:]( self,  "_isMediaPath:selector:resolvedPath:",  a3,  a2,  &v11);
  id v8 = v11;
  if ((a2 & 1) != 0)
  {
    -[MLDMediaLibraryService _performMaintenanceOnDatabaseAtPath:withActivity:completion:]( self,  "_performMaintenanceOnDatabaseAtPath:withActivity:completion:",  v8,  0LL,  v7);
  }

  else if (v7)
  {
    id v9 = objc_retainBlock(v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  195935908LL,  0LL));
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0LL, v10, 0LL);
  }
}

- (void)getMediaLibraryResourcesServiceListenerEndpointWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _XPCListenerForService:](self, "_XPCListenerForService:", 2LL));
  if (v5)
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "MultiUser");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@ - Unable to get an anonymous listener for MediaLibraryResourcesService - This usually indicates an at tempt to access medialibraryd without the proper entitlements.",  (uint8_t *)&v9,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2000LL,  &off_100026728));
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
  v4[2](v4, v8, v6);
}

- (void)getClientImportServiceListenerEndpointWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _XPCListenerForService:](self, "_XPCListenerForService:", 3LL));
  if (v5)
  {
    id v6 = 0LL;
  }

  else
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "MultiUser");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@ - Unable to get an anonymous listener for ClientImportSessionService - This usually indicates an atte mpt to access medialibraryd without the proper entitlements.",  (uint8_t *)&v9,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2000LL,  &off_100026750));
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 endpoint]);
  v4[2](v4, v8, v6);
}

- (void)securityScopedURLWrapperForItemPid:(unint64_t)a3 withDatabasePath:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = -[ML3MusicLibrary initWithPath:](objc_alloc(&OBJC_CLASS___ML3MusicLibrary), "initWithPath:", v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:@"com.apple.medialibrary.media-access"]);
  unsigned int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v22 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MLDMediaLibraryService _generateSecurityScopedURLWrapperForItemPid:withLibrary:error:]( self,  "_generateSecurityScopedURLWrapperForItemPid:withLibrary:error:",  a3,  v10,  &v22));
    id v15 = v22;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  id v16 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@ securityScopedURLWrapperForItemPid client missing entitlement.",  buf,  0xCu);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MLDMediaLibraryServiceErrorDomain",  2001LL,  0LL));
  id v14 = 0LL;
  if (v8)
  {
LABEL_7:
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100010EC8;
    v18[3] = &unk_100025060;
    id v19 = v14;
    id v21 = v8;
    id v20 = v15;
    dispatch_async(callbackQueue, v18);
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
  }

  *(_OWORD *)buf = v19;
  *(_OWORD *)&buf[16] = v20;
  int v9 = TCCAccessCheckAuditToken(kTCCServiceMediaLibrary, buf, 0LL);
  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  os_log_t v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v13 = [v8 processIdentifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      id v14 = "Refusing connection from pid: %d, TCC not granted";
      id v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      uint32_t v17 = 8;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
    }

- (BOOL)_shouldAcceptConnectionForMediaLibraryService:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryServiceInterface serviceInterface]( &OBJC_CLASS___MLMediaLibraryServiceInterface,  "serviceInterface"));
  [v4 setExportedInterface:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryServiceInterface clientInterface]( &OBJC_CLASS___MLMediaLibraryServiceInterface,  "clientInterface"));
  [v4 setRemoteObjectInterface:v6];

  [v4 setDelegate:self];
  objc_msgSend(v4, "ml_setValid:", 1);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100010D00;
  v20[3] = &unk_100024E28;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  [v4 setInvalidationHandler:v20];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  os_log_type_t v16 = sub_100010DE4;
  uint32_t v17 = &unk_100024E28;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  [v4 setInterruptionHandler:&v14];
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Listener accepted new connection %{public}@",  buf,  0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___ML3Client);
  int v9 = -[ML3Client initWithConnection:](v8, "initWithConnection:", v4, v14, v15, v16, v17);
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  xpcClients = self->_xpcClients;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 processIdentifier]));
  -[NSMutableDictionary setObject:forKey:](xpcClients, "setObject:forKey:", v9, v12);

  os_unfair_lock_unlock(p_xpcLock);
  [v4 resume];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)library:(id)a3 didBeginDatabaseTransactionWithConnection:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTransactionID]);
  id v8 = (ML3ActiveTransaction *)objc_claimAutoreleasedReturnValue( -[ML3MediaLibraryWriter _transactionForIdentifier:]( self->_writer,  "_transactionForIdentifier:",  v7));
  if (!v8)
  {
    id v8 = -[ML3ActiveTransaction initWithLibrary:connection:client:]( objc_alloc(&OBJC_CLASS___ML3ActiveTransaction),  "initWithLibrary:connection:client:",  v9,  v6,  0LL);
    -[ML3ActiveTransaction setTerminable:](v8, "setTerminable:", 0LL);
    -[ML3MediaLibraryWriter _registerTransaction:](self->_writer, "_registerTransaction:", v8);
  }
}

- (void)library:(id)a3 didCommitDatabaseTransactionWithConnection:(id)a4
{
}

- (void)library:(id)a3 didRollbackDatabaseTransactionWithConnection:(id)a4
{
}

- (void)mediaLibraryWriter:(id)a3 terminatedTransaction:(id)a4 withError:(id)a5
{
  id v12 = a5;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 client]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v9)
  {
    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxy]);
    [v11 serviceTerminatedTransactionWithIdentifier:v10 error:v12];
  }

  -[MLDMediaLibraryService _unregisterTransactionInfoForIdentifier:]( self,  "_unregisterTransactionInfoForIdentifier:",  v10);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_xpcLock);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_xpcClients, "allValues"));
  os_unfair_lock_unlock(&self->_xpcLock);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010AC8;
  block[3] = &unk_100024E50;
  id v10 = v4;
  os_log_t v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (MSVDeviceSupportsMultipleLibraries()) {
    -[MLDMediaLibraryService _updateMultiUserPurgeabilityForPrimaryLibraryPath:]( self,  "_updateMultiUserPurgeabilityForPrimaryLibraryPath:",  v7);
  }
  v6[2](v6, 1LL, 0LL);
}

- (void)start
{
  dispatch_queue_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  xpcClients = self->_xpcClients;
  self->_xpcClients = v3;

  id v7 = [[MSVXPCTransaction alloc] initWithName:@"Keep-alive for MediaLibraryService initialization"];
  [v7 beginTransaction];
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
  [v7 endTransactionOnDate:v5];

  -[MLDMediaLibraryService _setupNotifyEventHandlers](self, "_setupNotifyEventHandlers");
  -[MLDMediaLibraryService _setupActivityHandlers](self, "_setupActivityHandlers");
  -[MLDMediaLibraryService _setupCacheDeleteController](self, "_setupCacheDeleteController");
  id v6 = -[MLDMediaLibraryService _XPCListenerForService:](self, "_XPCListenerForService:", 1LL);
}

- (void)setDatabaseLocked:(BOOL)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010AB8;
  v4[3] = &unk_100024E78;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

- (BOOL)isDatabaseLocked
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010AA4;
  v5[3] = &unk_100024F68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentLockReason:(int64_t)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010A98;
  v4[3] = &unk_100024EA0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (int64_t)currentLockReason
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010A84;
  v5[3] = &unk_100024F68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_disconnectLibraries:(id)a3
{
  id v3 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 databasePath]);
          *(_DWORD *)buf = 138543362;
          __int128 v20 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Lock: locking connection pool for library at %{public}@",  buf,  0xCu);
        }

        os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionPool]);
        [v11 lock];

        id v12 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 databasePath]);
          *(_DWORD *)buf = 138543362;
          __int128 v20 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Lock: closing all database connections for library at %{public}@",  buf,  0xCu);
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionPool]);
        [v14 _closeAllConnectionsAndWaitForBusyConnections:0];
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v5);
  }
}

- (void)_reconnectLibraries:(id)a3
{
  id v3 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 databasePath]);
          *(_DWORD *)buf = 138543362;
          id v19 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unlock: reconnecting to library at path %{public}@",  buf,  0xCu);
        }

        [v8 reconnectToDatabase];
        os_log_t v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 databasePath]);
          *(_DWORD *)buf = 138543362;
          id v19 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unlock: unlocking connection pool for library at path %{public}@",  buf,  0xCu);
        }

        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 connectionPool]);
        [v13 unlock];
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v5);
  }
}

- (void)_logPrivacyAccessWithTransactionIdentifier:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000109D0;
  v7[3] = &unk_1000251D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_setupNotifyEventHandlers
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000108CC;
  handler[3] = &unk_100024EC8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);
}

- (void)_setupActivityHandlers
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000107DC;
  handler[3] = &unk_100024EC8;
  handler[4] = self;
  xpc_activity_register("com.apple.medialibraryd.maintainence", v3, handler);
}

- (void)_setupCacheDeleteController
{
  xpc_object_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010690;
  block[3] = &unk_1000251D8;
  id v9 = v3;
  id v10 = self;
  id v7 = v3;
  dispatch_sync(serialQueue, block);
  id v5 = -[MLDCacheDeleteController initWithLibraries:]( objc_alloc(&OBJC_CLASS___MLDCacheDeleteController),  "initWithLibraries:",  v7);
  cacheDeleteController = self->_cacheDeleteController;
  self->_cacheDeleteController = v5;
}

- (id)_XPCListenerForService:(int64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000101C4;
  os_log_t v11 = sub_1000101D4;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000103E0;
  v6[3] = &unk_100024F18;
  v6[6] = a3;
  v6[7] = a2;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (int64_t)_MLDSupportedServiceForXPCListener:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010300;
  v6[3] = &unk_100024F68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_mediaLibraryForPath:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.medialibraryd", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mediaLibraries = self->_mediaLibraries;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    __int128 v15 = (uint64_t (*)(uint64_t, uint64_t))mediaLibraries;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Path: %{public}@, _mediaLibraries=%{public}@",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  __int128 v15 = sub_1000101C4;
  __int128 v16 = sub_1000101D4;
  id v17 = 0LL;
  if (v4)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010230;
    block[3] = &unk_100024F90;
    unsigned int v13 = buf;
    void block[4] = self;
    id v12 = v4;
    dispatch_sync(serialQueue, block);

    id v8 = *(void **)(*(void *)&buf[8] + 40LL);
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = v8;
  _Block_object_dispose(buf, 8);

  return v9;
}

- (id)_allMediaLibraries
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000101C4;
  uint64_t v10 = sub_1000101D4;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000101DC;
  v5[3] = &unk_100024F68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_deviceSharedLibraryPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibraryResourcesManager sharedManager]( &OBJC_CLASS___ML3MusicLibraryResourcesManager,  "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pathForResourceFileOrFolder:15]);

  return v3;
}

- (void)_handleXPCDisconnect:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ml_setValid:", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _clientForConnection:](self, "_clientForConnection:", v4));

  if (v5)
  {
    -[ML3DatabaseImportManager cancelImportOperationsOriginatingFromClient:]( self->_importManager,  "cancelImportOperationsOriginatingFromClient:",  v5);
    writerUpdateQueue = (dispatch_queue_s *)self->_writerUpdateQueue;
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    unsigned int v13 = sub_1000101B8;
    __int128 v14 = &unk_1000251D8;
    __int128 v15 = self;
    id v7 = v5;
    id v16 = v7;
    dispatch_async(writerUpdateQueue, &v11);
    p_xpcLock = &self->_xpcLock;
    os_unfair_lock_lock(&self->_xpcLock);
    xpcClients = self->_xpcClients;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v7, "processID", v11, v12, v13, v14, v15)));
    -[NSMutableDictionary removeObjectForKey:](xpcClients, "removeObjectForKey:", v10);

    os_unfair_lock_unlock(p_xpcLock);
  }
}

- (id)_currentXPCClient
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _clientForConnection:](self, "_clientForConnection:", v3));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[ML3Client daemonClient](&OBJC_CLASS___ML3Client, "daemonClient"));
  }
  id v5 = (void *)v4;

  return v5;
}

- (id)_clientForConnection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 processIdentifier];
  if (v5 == getpid())
  {
    uint64_t v6 = (ML3Client *)objc_claimAutoreleasedReturnValue(+[ML3Client daemonClient](&OBJC_CLASS___ML3Client, "daemonClient"));
  }

  else
  {
    os_unfair_lock_lock(&self->_xpcLock);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 processIdentifier]));
    uint64_t v6 = (ML3Client *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_xpcClients, "objectForKey:", v7));
    if (!v6)
    {
      uint64_t v6 = -[ML3Client initWithConnection:](objc_alloc(&OBJC_CLASS___ML3Client), "initWithConnection:", v4);
      -[NSMutableDictionary setObject:forKey:](self->_xpcClients, "setObject:forKey:", v6, v7);
    }

    os_unfair_lock_unlock(&self->_xpcLock);
  }

  return v6;
}

- (void)_setupSignalHandler
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  unsigned int v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0x1EuLL,  0LL,  v4);
  signalDispatchSource = self->_signalDispatchSource;
  self->_signalDispatchSource = v5;

  objc_initWeak(&location, self);
  id v7 = self->_signalDispatchSource;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001018C;
  v8[3] = &unk_100024FB8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
  dispatch_resume((dispatch_object_t)self->_signalDispatchSource);
  signal(30, (void (__cdecl *)(int))1);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_tearDownSignalHandler
{
}

- (void)_handleDebugSignal
{
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "*** Received debug signal. Collecting diagnostic information...",  v4,  2u);
  }

  -[MLDMediaLibraryService _performDiagnosticWithReason:](self, "_performDiagnosticWithReason:", @"Debug Signal");
}

- (void)_performDiagnosticWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Collecting diagnostic information...",  (uint8_t *)&v9,  2u);
  }

  uint64_t v6 = -[MLDDiagnostic initWithReason:](objc_alloc(&OBJC_CLASS___MLDMutableDiagnostic), "initWithReason:", v4);
  -[MLDMediaLibraryService collectDiagnostic:](self, "collectDiagnostic:", v6);
  -[MLDMediaLibraryService _writeDiagnosticToDisk:](self, "_writeDiagnosticToDisk:", v6);
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MLDDiagnostic description](v6, "description"));
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_writeDiagnosticToDisk:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary pathForResourceFileOrFolder:]( &OBJC_CLASS___ML3MusicLibrary,  "pathForResourceFileOrFolder:",  24LL));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MediaLibraryDiagnostic_%f.log",  v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  unsigned int v9 = [v3 writeToFile:v8 error:0];

  uint64_t v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      __int128 v14 = v8;
      uint64_t v12 = "Saved diagnostic information to %{public}@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }

  else if (v11)
  {
    *(_DWORD *)buf = 138543362;
    __int128 v14 = v8;
    uint64_t v12 = "Failed to save diagnostic information to path: %{public}@";
    goto LABEL_8;
  }
}

- (void)_registerForLibraryDidChangeNotifications
{
  if (-[MLDMediaLibraryService _platformSupportsSpotlightIndexing](self, "_platformSupportsSpotlightIndexing")
    || -[MLDMediaLibraryService _platformSupportsSiriIndexing](self, "_platformSupportsSiriIndexing"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_handleLibraryDidChangeNotification:" name:ML3MusicLibraryContentsDidChangeNotification object:0];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_handleLibraryDidChangeNotification:" name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  }

  if (MSVDeviceSupportsMultipleLibraries())
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy]( &OBJC_CLASS___ML3MusicLibraryAccountChangeObserverProxy,  "sharedProxy"));
    [v5 addAccountChangeObserver:self];
  }

- (void)_handleLibraryDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (-[MLDMediaLibraryService _platformSupportsSpotlightIndexing](self, "_platformSupportsSpotlightIndexing")) {
    -[MLDMediaLibraryService _updateSpotlightIndexForNotification:](self, "_updateSpotlightIndexForNotification:", v4);
  }
  if (-[MLDMediaLibraryService _platformSupportsSiriIndexing](self, "_platformSupportsSiriIndexing")) {
    -[MLDMediaLibraryService _updateSiriIndexForNotification:](self, "_updateSiriIndexForNotification:", v4);
  }
}

- (void)_updateMultiUserPurgeabilityForPrimaryLibraryPath:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_updateMultiUserPurgeabilityForPrimaryLibraryPath %{private}@",  (uint8_t *)&v6,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
  [v5 enumerateObjectsUsingBlock:&stru_100024FF8];
}

- (void)_updateSiriIndexForNotification:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  unsigned int v5 = [v4 isEqualToString:ML3MusicLibraryContentsDidChangeNotification];

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 object]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 databasePath]);
    -[MLDMediaLibraryService _updateSiriIndexMetadataForLibraryAtPath:completion:]( self,  "_updateSiriIndexMetadataForLibraryAtPath:completion:",  v7,  &stru_100025038);
  }
}

- (void)_tearDownLibraryDidChangeNotifications
{
  if (-[MLDMediaLibraryService _platformSupportsSpotlightIndexing](self, "_platformSupportsSpotlightIndexing")
    || -[MLDMediaLibraryService _platformSupportsSiriIndexing](self, "_platformSupportsSiriIndexing"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:ML3MusicLibraryContentsDidChangeNotification object:0];

    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  }

- (void)_startIdleTimer
{
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Starting media library service idle timer.",  v9,  2u);
  }

  if (self->_idleTimer) {
    -[MLDMediaLibraryService _stopIdleTimer](self, "_stopIdleTimer");
  }
  id v4 = objc_alloc(&OBJC_CLASS___NSTimer);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  int v6 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v4,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v5,  self,  "_idleTimerFired:",  0LL,  1LL,  5.0);
  idleTimer = self->_idleTimer;
  self->_idleTimer = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v8 addTimer:self->_idleTimer forMode:NSDefaultRunLoopMode];
}

- (void)_idleTimerFired:(id)a3
{
  if (-[ML3DatabaseImportManager suspendedOperationsCount](self->_importManager, "suspendedOperationsCount", a3)
    || -[ML3DatabaseImportManager isSuspended](self->_importManager, "isSuspended"))
  {
    id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Media library service has suspended import operations. Attempting to resume.",  buf,  2u);
    }

    -[ML3DatabaseImportManager resumeSuspendedImportOperations](self->_importManager, "resumeSuspendedImportOperations");
  }

  else if (!-[ML3DatabaseImportManager operationsCount](self->_importManager, "operationsCount"))
  {
    unsigned int v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MediaLibraryService's idle timer is stopping.",  v6,  2u);
    }

    -[MLDMediaLibraryService _stopIdleTimer](self, "_stopIdleTimer");
  }

- (void)_resetIdleTimer
{
  if (self->_idleTimer)
  {
    id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Resetting idle timer", v6, 2u);
    }

    idleTimer = self->_idleTimer;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    -[NSTimer setFireDate:](idleTimer, "setFireDate:", v5);
  }

- (void)_stopIdleTimer
{
  if (self->_idleTimer)
  {
    id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Stopping media library service idle timer.",  v5,  2u);
    }

    -[NSTimer invalidate](self->_idleTimer, "invalidate");
    idleTimer = self->_idleTimer;
    self->_idleTimer = 0LL;
  }

- (void)_performMaintenanceOnDatabaseAtPath:(id)a3 withActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  BOOL v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[Maintenance] Maintenance activity triggered.",  buf,  2u);
  }

  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _deviceSharedLibraryPath](self, "_deviceSharedLibraryPath"));
  }
  unsigned int v13 = v12;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _mediaLibraryForPath:](self, "_mediaLibraryForPath:", v12));
  id v15 = [[ML3MaintenanceTasksOperation alloc] initWithLibrary:v14 activity:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100010020;
  v18[3] = &unk_100025060;
  void v18[4] = self;
  id v19 = v14;
  id v20 = v9;
  id v16 = v9;
  id v17 = v14;
  [v15 setCompletionBlock:v18];
  -[NSOperationQueue addOperation:](self->_maintenanceTasksOperationQueue, "addOperation:", v15);
}

- (void)_registerTransactionInfo:(id)a3 forIdentitifer:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000FF54;
    block[3] = &unk_100024E50;
    void block[4] = self;
    id v10 = v6;
    id v11 = v8;
    dispatch_sync(serialQueue, block);
  }
}

- (void)_unregisterTransactionInfoForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[1] = 3221225472LL;
    block[2] = sub_10000FE64;
    block[3] = &unk_1000251D8;
    void block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(serialQueue, block);

    id v4 = v6;
  }
}

- (BOOL)_validateTransactionIdentifier:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  if (!v6) {
    goto LABEL_4;
  }
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000FD80;
  v12[3] = &unk_100025088;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  dispatch_sync(serialQueue, v12);

  if (*((_BYTE *)v17 + 24))
  {
    BOOL v9 = 1;
  }

  else
  {
LABEL_4:
    id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to validate transaction %{public}@ for client %{public}@",  buf,  0x16u);
    }

    BOOL v9 = *((_BYTE *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)_validateDatabaseAtPath:(id)a3 byTruncatingFirst:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_validateDatabaseAtPath:(id)a3 forConnection:(id)a4 byTruncatingFirst:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  if (v10)
  {
    pid_t v13 = [v10 processIdentifier];
    [v10 auditToken];
    uint64_t v14 = MSVBundleIDForAuditToken(v27);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    pid_t v13 = getpid();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
  }

  id v17 = objc_alloc(&OBJC_CLASS___MSVXPCTransaction);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation request from %@ (%ld) for library at path: %@",  v15,  v13,  v12));
  id v19 = [v17 initWithName:v18];

  [v19 beginTransaction];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _mediaLibraryForPath:](self, "_mediaLibraryForPath:", v12));

  validationController = self->_validationController;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000FD50;
  v24[3] = &unk_1000250B0;
  id v25 = v19;
  id v26 = v11;
  id v22 = v19;
  id v23 = v11;
  -[MLDDatabaseValidationController validateMusicLibrary:shouldTruncateDatabase:completion:]( validationController,  "validateMusicLibrary:shouldTruncateDatabase:completion:",  v20,  v7,  v24);
}

- (void)_unregisterServiceOriginatedTransactionWithConnection:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 currentTransactionID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ML3MediaLibraryWriter _transactionForIdentifier:](self->_writer, "_transactionForIdentifier:"));
  unsigned int v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);

    if (!v6) {
      -[ML3MediaLibraryWriter _unregisterTransaction:](self->_writer, "_unregisterTransaction:", v5);
    }
  }
}

- (BOOL)_platformSupportsSpotlightIndexing
{
  return 0;
}

- (BOOL)_platformSupportsSiriIndexing
{
  if (qword_10002BB68 != -1) {
    dispatch_once(&qword_10002BB68, &stru_1000250D0);
  }
  uint64_t v2 = qword_10002BB60;
  uint64_t v3 = MSVGetDeviceHardwarePlatform();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = [(id)v2 containsObject:v4];

  return v2 ^ 1;
}

- (BOOL)_isMediaPath:(id)a3 selector:(SEL)a4 resolvedPath:(id *)a5
{
  id v9 = a3;
  if (!a5)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2, self, @"MLDMediaLibraryService.m", 1831, @"Invalid parameter not satisfying: %@", @"resolvedPath" object file lineNumber description];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary autoupdatingSharedLibraryPath]( &OBJC_CLASS___ML3MusicLibrary,  "autoupdatingSharedLibraryPath"));
  if ([v9 isEqualToString:v10])
  {
    id v11 = v9;
    *a5 = v11;
    BOOL v12 = 1;
  }

  else
  {
    uint64_t v28 = 0LL;
    __int128 v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    char v31 = 0;
    pid_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary allLibraryContainerPaths]( &OBJC_CLASS___ML3MusicLibrary,  "allLibraryContainerPaths"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10000FCC4;
    v25[3] = &unk_1000250F8;
    id v14 = v9;
    id v26 = v14;
    __int16 v27 = &v28;
    [v13 enumerateObjectsUsingBlock:v25];

    if (*((_BYTE *)v29 + 24))
    {
      id v11 = v14;
      *a5 = v11;
      BOOL v12 = 1;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_stringByResolvingRealPath"));

      id v11 = v15;
      *a5 = v11;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary mediaFolderPath](&OBJC_CLASS___ML3MusicLibrary, "mediaFolderPath"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "msv_stringByResolvingRealPath"));

      if ([v11 hasPrefix:v17]
        && ([v11 hasSuffix:@"iTunes_Control/iTunes/MediaLibrary.sqlitedb"] & 1) != 0
        || -[MLDDatabaseValidationController isValidatedPath:](self->_validationController, "isValidatedPath:", v11))
      {
        BOOL v12 = 1;
      }

      else
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MLDMediaLibraryService _currentXPCClient](self, "_currentXPCClient"));
        id v19 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          id v20 = NSStringFromSelector(a4);
          id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
          *(_DWORD *)buf = 138543874;
          id v33 = v21;
          __int16 v34 = 2114;
          uint64_t v35 = v22;
          __int16 v36 = 2114;
          id v37 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "%{public}@: not opening database [invalid path] bundleID=%{public}@ path=%{public}@",  buf,  0x20u);
        }

        BOOL v12 = 0;
      }
    }

    _Block_object_dispose(&v28, 8);
  }

  return v12;
}

- (void)_updateSiriIndexMetadataForLibraryAtPath:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  if (-[MLDMediaLibraryService _platformSupportsSiriIndexing](self, "_platformSupportsSiriIndexing"))
  {
    v10[0] = MLDatabaseOperationOptionDatabasePathKey;
    v10[1] = MLDatabaseOperationOptionPriorityLevelKey;
    v11[0] = v7;
    v11[1] = &off_100026670;
    v10[2] = MLDatabaseOperationOptionReadOnlyKey;
    v10[3] = MLDatabaseOperationOptionEnqueueSerially;
    v11[2] = &__kCFBooleanTrue;
    v11[3] = &__kCFBooleanTrue;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));

    -[MLDMediaLibraryService performDatabaseOperation:withAttributes:options:completionHandler:]( self,  "performDatabaseOperation:withAttributes:options:completionHandler:",  8LL,  &__NSDictionary0__struct,  v8,  v6);
  }

  else
  {
    id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      pid_t v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@ updateSiriIndexMetadata called on unsupported platform.",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MLMusicLibraryErrorDomain,  10LL,  0LL));
    v6[2](v6, 0LL, v8);
  }
}

- (id)_generateSecurityScopedURLWrapperForItemPid:(unint64_t)a3 withLibrary:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [[ML3Track alloc] initWithPersistentID:a3 inLibrary:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:ML3TrackPropertyFilePath]);
  id v11 = v10;
  if (v10 && [v10 length])
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaFolderPathByAppendingPathComponent:v11]);
    pid_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v12));

    id v14 = [[NSSecurityScopedURLWrapper alloc] initWithURL:v13 readonly:1];
    id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543875;
      uint64_t v18 = self;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      __int16 v21 = 2113;
      id v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ generated wrapper for item pid: %llu. wrapper=%{private}@",  buf,  0x20u);
    }
  }

  else
  {
    id v14 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MLMusicLibraryErrorDomain,  1LL,  @"Could not find relative path for item pid %llu",  a3));
  }

  return v14;
}

- (void)faultForQuery:(id)a3 fromClientBundleID:(id)a4 onTrustError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"action"]);
  id v11 = [v10 integerValue];

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000FB60;
    v13[3] = &unk_100025120;
    id v14 = v7;
    id v16 = v11;
    id v15 = v8;
    BOOL v12 = objc_retainBlock(v13);
    sub_10000FCBC((uint64_t)v12);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10002BB58 != -1) {
    dispatch_once(&qword_10002BB58, &stru_100024A28);
  }
  return (id)qword_10002BB50;
}

@end