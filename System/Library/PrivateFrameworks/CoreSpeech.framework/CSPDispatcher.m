@interface CSPDispatcher
+ (id)sharedDispatcher;
- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3;
- (BOOL)handleDarwinNotificationEventWithName:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CESRTaskCoalescer)taskCoalescer;
- (CSPDispatcher)init;
- (NSXPCListener)adminServiceListener;
- (id)_adminServiceProvider;
- (id)_defaultTaskCoalescerWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3 adminServiceProvider:(id)a4 speechProfileSiteManager:(id)a5;
- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4;
- (id)_speechProfileSiteManager;
- (void)_notifyChangeToSets:(id)a3;
- (void)registerXPCActivities;
- (void)resourceAvailableForPersona:(id)a3;
- (void)resourceUnavailableForPersona:(id)a3;
- (void)resourceUnavailableSoonForPersona:(id)a3;
- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4;
- (void)runMigration:(id)a3;
- (void)setupXPCListeners;
@end

@implementation CSPDispatcher

- (CSPDispatcher)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"init unsupported",  &__NSDictionary0__struct));
  objc_exception_throw(v2);
  return (CSPDispatcher *)-[CSPDispatcher _initWithQueue:](v3, v4, v5);
}

- (id)_initWithQueue:(id)a3
{
  return -[CSPDispatcher _initWithQueue:adminServiceProvider:speechProfileSiteManager:]( self,  "_initWithQueue:adminServiceProvider:speechProfileSiteManager:",  a3,  0LL,  0LL);
}

- (id)_initWithQueue:(id)a3 adminServiceProvider:(id)a4 speechProfileSiteManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSPDispatcher;
  v12 = -[CSPDispatcher init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CSPDispatcher _defaultTaskCoalescerWithQueue:](v13, "_defaultTaskCoalescerWithQueue:", v9));
    taskCoalescer = v13->_taskCoalescer;
    v13->_taskCoalescer = (CESRTaskCoalescer *)v14;

    objc_storeStrong((id *)&v13->_adminServiceProvider, a4);
    objc_storeStrong((id *)&v13->_speechProfileSiteManager, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileResourceMonitor sharedMonitor]( &OBJC_CLASS___CESRSpeechProfileResourceMonitor,  "sharedMonitor"));
    [v16 addObserver:v13];
  }

  return v13;
}

- (id)_defaultTaskCoalescerWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___CESRTaskCoalescer);
  v7 = (objc_class *)objc_opt_class(self, v6);
  v8 = NSStringFromClass(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = -[CESRTaskCoalescer initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:]( v5,  "initWithManagerName:coalescenceInterval:coalescenceDelay:executionQueue:",  v9,  v4,  10.0,  2.0);

  return v10;
}

- (id)_speechProfileSiteManager
{
  speechProfileSiteManager = self->_speechProfileSiteManager;
  if (!speechProfileSiteManager)
  {
    id v4 = (CESRSpeechProfileSiteManagement *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileSiteResolver defaultResolver]( &OBJC_CLASS___CESRSpeechProfileSiteResolver,  "defaultResolver"));
    id v5 = self->_speechProfileSiteManager;
    self->_speechProfileSiteManager = v4;

    speechProfileSiteManager = self->_speechProfileSiteManager;
  }

  return speechProfileSiteManager;
}

- (id)_adminServiceProvider
{
  adminServiceProvider = self->_adminServiceProvider;
  if (!adminServiceProvider)
  {
    id v4 = objc_alloc(&OBJC_CLASS___CESRSpeechProfileAdminServiceFactory);
    queue = self->_queue;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSPDispatcher _speechProfileSiteManager](self, "_speechProfileSiteManager"));
    v7 = (CESRSpeechProfileAdminServiceProvider *)[v4 initWithQueue:queue speechProfileSiteManager:v6];
    v8 = self->_adminServiceProvider;
    self->_adminServiceProvider = v7;

    adminServiceProvider = self->_adminServiceProvider;
  }

  return adminServiceProvider;
}

- (void)registerXPCActivities
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_POST_INSTALL, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  v3 = (const char *)XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY;
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  sub_1000169D4("com.apple.siri.xpc_activity.post-install-speech-profile-migration", v2, &stru_10022A288);

  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, v3, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  sub_1000169D4("com.apple.siri.xpc_activity.daily-speech-profile-maintenance", xdict, &stru_10022A2A8);
}

- (void)setupXPCListeners
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = dispatch_queue_create("CSPDispatcher Set Change Queue", v4);

  uint64_t v6 = objc_alloc(&OBJC_CLASS___CCSetChangeXPCListener);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D1548;
  v12[3] = &unk_10022CDB8;
  v12[4] = self;
  v7 = -[CCSetChangeXPCListener initWithIdentifier:batchHandlerBlock:queue:useCase:]( v6,  "initWithIdentifier:batchHandlerBlock:queue:useCase:",  @"com.apple.corespeechd",  v12,  v5,  CESRSpeechProfileUseCaseIdentifier);
  setChangeListener = self->_setChangeListener;
  self->_setChangeListener = v7;

  if (CSIsInternalBuild(v9))
  {
    id v10 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[CSPDispatcher _listenerWithMachServiceName:delegate:]( self,  "_listenerWithMachServiceName:delegate:",  @"com.apple.corespeech.corespeechd.speechprofileadmin.service",  self));
    adminServiceListener = self->_adminServiceListener;
    self->_adminServiceListener = v10;
  }
}

- (void)_notifyChangeToSets:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileEvaluationStatus sharedStatus]( &OBJC_CLASS___CESRSpeechProfileEvaluationStatus,  "sharedStatus"));
  unsigned int v6 = [v5 isEvaluationEnabled];

  if (v6)
  {
    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSPDispatcher _notifyChangeToSets:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Ignoring Cascade change notification because evaluation is enabled.",  buf,  0xCu);
    }
  }

  else
  {
    v8 = (void *)os_transaction_create("com.apple.corespeechd.speechprofilesetchange");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000D1508;
    v11[3] = &unk_10022EA98;
    v11[4] = self;
    id v12 = v4;
    id v13 = v8;
    id v9 = v8;
    id v10 = objc_retainBlock(v11);
    dispatch_async((dispatch_queue_t)self->_queue, v10);
  }
}

- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v6);

  -[NSXPCListener setDelegate:](v7, "setDelegate:", v5);
  -[NSXPCListener resume](v7, "resume");
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_adminServiceListener == v6)
  {
    BOOL v9 = -[CSPDispatcher _adminServiceShouldAcceptNewConnection:](self, "_adminServiceShouldAcceptNewConnection:", v7);
  }

  else
  {
    v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      id v12 = "-[CSPDispatcher listener:shouldAcceptNewConnection:]";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unrecognized listener passed to delegate: %@",  (uint8_t *)&v11,  0x16u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.corespeech.corespeechd.speechprofileadmin"]);

  if (v5)
  {
    *(void *)v19 = 0LL;
    *(void *)&v19[8] = v19;
    *(void *)&v19[16] = 0x3032000000LL;
    v20 = sub_1000D14B8;
    v21 = sub_1000D14C8;
    id v22 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000D14D0;
    v14[3] = &unk_10022EF80;
    v14[4] = self;
    v14[5] = v19;
    dispatch_sync(queue, v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CESRSpeechProfileAdminService));
    [v4 setExportedInterface:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&v19[8] + 40) adminService]);
    [v4 setExportedObject:v8];

    [v4 resume];
    BOOL v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v10 = [v4 processIdentifier];
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSPDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s New connection established to process with pid=(%d)",  buf,  0x12u);
    }

    _Block_object_dispose(v19, 8);
  }

  else
  {
    int v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      *(_DWORD *)v19 = 136315394;
      *(void *)&v19[4] = "-[CSPDispatcher _adminServiceShouldAcceptNewConnection:]";
      *(_WORD *)&v19[12] = 1024;
      *(_DWORD *)&v19[14] = [v4 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Connecting process with pid=(%d) is not entitled for the speech profile admin service - rejecting connection.",  v19,  0x12u);
    }
  }

  return v5 != 0LL;
}

- (BOOL)handleDarwinNotificationEventWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAFPreferencesDidChangeDarwinNotification;
  if (([v4 isEqualToString:kAFPreferencesDidChangeDarwinNotification] & 1) == 0
    && ([v4 isEqualToString:AFLanguageCodeDidChangeDarwinNotification] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.siri.uaf.com.apple.siri.understanding"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED"] & 1) == 0 && !objc_msgSend(v4, "isEqualToString:", @"com.apple.sysdiagnose.sysdiagnoseStarted"))
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_23;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CESRSpeechProfileEvaluationStatus sharedStatus]( &OBJC_CLASS___CESRSpeechProfileEvaluationStatus,  "sharedStatus"));
  unsigned int v7 = [v6 isEvaluationEnabled];

  v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v7)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSPDispatcher handleDarwinNotificationEventWithName:]";
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Evaluation is enabled, ignoring notification: %@",  buf,  0x16u);
    }

    goto LABEL_9;
  }

  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSPDispatcher handleDarwinNotificationEventWithName:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Handling notification: %@", buf, 0x16u);
  }

  if (([v4 isEqualToString:v5] & 1) != 0
    || [v4 isEqualToString:AFLanguageCodeDidChangeDarwinNotification])
  {
    unsigned int v10 = (void *)os_transaction_create("com.apple.corespeechd.speechprofilesettingschange");
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D1354;
    block[3] = &unk_10022EFD0;
    block[4] = self;
    id v12 = v10;
    id v31 = v12;
    dispatch_async(queue, block);
  }

  else
  {
    id v12 = 0LL;
  }

  if (([v4 isEqualToString:@"com.apple.siri.uaf.com.apple.siri.understanding"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.MobileAsset.AutoAssetNotification^com.apple.MobileAsset.MAAutoAsset^STARTUP_ACTIVATED"])
  {
    __int16 v13 = (void *)os_transaction_create("com.apple.corespeechd.speechprofileassetupdate");

    uint64_t v14 = (dispatch_queue_s *)self->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000D1384;
    v28[3] = &unk_10022EFD0;
    v28[4] = self;
    id v12 = v13;
    id v29 = v12;
    dispatch_async(v14, v28);
  }

  if ([v4 isEqualToString:@"com.apple.sysdiagnose.sysdiagnoseStarted"])
  {
    v15 = (void *)os_transaction_create("com.apple.corespeechd.speechprofilesysdiagnosestarted");

    v16 = (dispatch_queue_s *)self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000D13B4;
    v26[3] = &unk_10022EFD0;
    v26[4] = self;
    id v12 = v15;
    id v27 = v12;
    dispatch_async(v16, v26);
    __int16 v17 = v27;
  }

  else
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    id v22 = sub_1000D13E4;
    v23 = &unk_10022EFD0;
    id v24 = v4;
    v25 = self;
    unsigned int v18 = objc_retainBlock(&v20);
    -[CESRTaskCoalescer submitTaskWithId:taskBlock:completion:]( self->_taskCoalescer,  "submitTaskWithId:taskBlock:completion:",  0LL,  v18,  0LL,  v20,  v21,  v22,  v23);

    __int16 v17 = v24;
  }

  BOOL v9 = 1;
LABEL_23:

  return v9;
}

- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D1274;
  v10[3] = &unk_10022E8D0;
  id v12 = a3;
  id v13 = a4;
  v10[4] = self;
  id v11 = (id)os_transaction_create("com.apple.corespeechd.speechprofilemaintenance");
  id v6 = v11;
  id v7 = v13;
  id v8 = v12;
  BOOL v9 = objc_retainBlock(v10);
  dispatch_async((dispatch_queue_t)self->_queue, v9);
}

- (void)runMigration:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D1194;
  v8[3] = &unk_10022E7D0;
  id v9 = (id)os_transaction_create("com.apple.corespeechd.speechprofilemigration");
  id v10 = v4;
  v8[4] = self;
  id v5 = v9;
  id v6 = v4;
  id v7 = objc_retainBlock(v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);
}

- (void)resourceAvailableForPersona:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D1104;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)resourceUnavailableForPersona:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D106C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)resourceUnavailableSoonForPersona:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D0FD4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSXPCListener)adminServiceListener
{
  return self->_adminServiceListener;
}

- (CESRTaskCoalescer)taskCoalescer
{
  return self->_taskCoalescer;
}

- (void).cxx_destruct
{
}

+ (id)sharedDispatcher
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D16A8;
  block[3] = &unk_10022CD90;
  block[4] = a1;
  if (qword_10027FFB0 != -1) {
    dispatch_once(&qword_10027FFB0, block);
  }
  return (id)qword_10027FFB8;
}

@end