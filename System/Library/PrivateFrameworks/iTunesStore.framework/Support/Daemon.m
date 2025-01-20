@interface Daemon
+ (id)daemon;
- (AMSBagValue)changeLanguageURL;
- (AMSBagValue)trustedDomains;
- (Daemon)init;
- (id)addObserverForBackgroundTaskWithIdentifierPrefix:(id)a3 withBlock:(id)a4;
- (id)cachedObjectForKey:(id)a3;
- (void)_expireCachedObjectForKey:(id)a3;
- (void)_finishProtectionClassCMigrationIfNeeded;
- (void)_getShowingDialogWithMessage:(id)a3 connection:(id)a4;
- (void)_handleWakeWithName:(const char *)a3 job:(id)a4;
- (void)_initBackgroundTaskAgent;
- (void)_networkUsageStateChangeNotification:(id)a3;
- (void)_observeNotifications;
- (void)_operationCountChanged:(id)a3;
- (void)_reloadOperationKeepAliveTransaction;
- (void)_reloadWiFiManager;
- (void)_setGlobalState;
- (void)_warmUpSharedURLCache;
- (void)addBackgroundTaskWithRequest:(id)a3;
- (void)addKeepAliveOperationQueue:(id)a3;
- (void)batterySaverWatcherDidChangeState:(id)a3;
- (void)beginShowingDialog;
- (void)cacheObject:(id)a3 withKey:(id)a4 expirationInterval:(double)a5;
- (void)cancelBackgroundTaskWithIdentifier:(id)a3;
- (void)dealloc;
- (void)endShowingDialog;
- (void)keepAliveWithAssertion:(id)a3 block:(id)a4;
- (void)releaseKeepAliveAssertion:(id)a3;
- (void)removeBackgroundTaskObserver:(id)a3;
- (void)removeCachedObjectForKey:(id)a3;
- (void)removeKeepAliveOperationQueue:(id)a3;
- (void)start;
- (void)takeKeepAliveAssertion:(id)a3;
@end

@implementation Daemon

- (Daemon)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___Daemon;
  v2 = -[Daemon init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    -[Daemon _warmUpSharedURLCache](v2, "_warmUpSharedURLCache");
    v3->_backgroundTaskObservers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.Daemon", 0LL);
    v3->_keepAliveTransactions = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    v3->_keepAliveTransactionStore = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v3->_satisfiedWakeRequests = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
    v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v3,  "_networkUsageStateChangeNotification:",  ISNetworkUsageStateChangedNotification,  0LL);
    id v5 = +[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue");
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v3,  "_operationCountChanged:",  ISOperationQueueOperationCountChangedNotification,  v5);
    v3->_keepAliveOperationQueues = -[NSMutableSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithObjects:",  v5,  0LL);
    dispatchQueue = (dispatch_queue_s *)v3->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10011F1CC;
    block[3] = &unk_10034AE98;
    block[4] = v3;
    dispatch_async(dispatchQueue, block);
    v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)v3->_dispatchQueue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10011F1D4;
    handler[3] = &unk_10034AE98;
    handler[4] = v3;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);
    v8 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    v26[0] = CPSharedResourcesDirectory(v8);
    v26[1] = @"Library";
    v26[2] = @"Caches";
    v26[3] = @"com.apple.storeServices.watchAnalytics";
    v9 = +[NSString pathWithComponents:]( &OBJC_CLASS___NSString,  "pathWithComponents:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
    if (-[NSFileManager fileExistsAtPath:](v8, "fileExistsAtPath:", v9))
    {
      id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v10) {
        id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v11 = [v10 shouldLog];
      else {
        unsigned int v12 = v11;
      }
      v13 = (os_log_s *)[v10 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = v12;
      }
      else {
        uint64_t v15 = v12 & 2;
      }
      if ((_DWORD)v15)
      {
        int v24 = 138543362;
        v25 = v9;
        uint64_t v16 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "Removing unused cached data at: %{public}@",  &v24,  12);
        if (v16)
        {
          v17 = (void *)v16;
          v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
          free(v17);
          v20 = v18;
          *(void *)&double v14 = SSFileLog(v10, @"%@").n128_u64[0];
        }
      }

      -[NSFileManager removeItemAtPath:error:](v8, "removeItemAtPath:error:", v9, 0LL, v14, v20);
    }
  }

  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  SSAccountStoreChangedNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  ISNetworkUsageStateChangedNotification,  0LL);
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  ISOperationQueueOperationCountChangedNotification,  0LL);
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  satisfiedWakeRequests = self->_satisfiedWakeRequests;
  if (satisfiedWakeRequests) {
    xpc_release(satisfiedWakeRequests);
  }
  jetsamSource = self->_jetsamSource;
  if (jetsamSource)
  {
    dispatch_source_cancel((dispatch_source_t)jetsamSource);
    dispatch_release((dispatch_object_t)self->_jetsamSource);
  }

  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel((dispatch_source_t)sigTermSource);
    dispatch_release((dispatch_object_t)self->_sigTermSource);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___Daemon;
  -[Daemon dealloc](&v8, "dealloc");
}

+ (id)daemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011F4D0;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3498 != -1) {
    dispatch_once(&qword_1003A3498, block);
  }
  return (id)qword_1003A3490;
}

- (void)addBackgroundTaskWithRequest:(id)a3
{
  id v5 = [a3 requestIdentifier];
  if (v5)
  {
    id v6 = v5;
    v7 = (const char *)[v5 UTF8String];
    id v8 = [a3 copyBackgroundTaskAgentJob];
    if (v8)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10011F724;
      handler[3] = &unk_10034F298;
      handler[4] = self;
      void handler[5] = v6;
      handler[6] = v8;
      xpc_activity_register(v7, v8, handler);
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      unsigned int v10 = [v9 shouldLog];
      else {
        unsigned int v11 = v10;
      }
      unsigned int v12 = (os_log_s *)[v9 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = v11;
      }
      else {
        uint64_t v13 = v11 & 2;
      }
      if ((_DWORD)v13)
      {
        int v21 = 138543362;
        id v22 = v6;
        uint64_t v14 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "Added background task: %{public}@",  &v21,  12);
        goto LABEL_19;
      }
    }

    else
    {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      unsigned int v15 = [v9 shouldLog];
      else {
        unsigned int v16 = v15;
      }
      v17 = (os_log_s *)[v9 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = v16 & 2;
      }
      if ((_DWORD)v18)
      {
        int v21 = 138543362;
        id v22 = v6;
        uint64_t v14 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "No criteria for background task: %{public}@",  &v21,  12);
LABEL_19:
        if (v14)
        {
          v19 = (void *)v14;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
          free(v19);
          SSFileLog(v9, @"%@");
        }
      }
    }
  }

- (void)addKeepAliveOperationQueue:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10011F7E4;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)addObserverForBackgroundTaskWithIdentifierPrefix:(id)a3 withBlock:(id)a4
{
  id v6 = [a4 copy];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011F8D4;
  block[3] = &unk_10034E7E0;
  block[4] = self;
  void block[5] = a3;
  block[6] = v6;
  dispatch_sync(dispatchQueue, block);
  return v6;
}

- (void)beginShowingDialog
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011FBA0;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)cachedObjectForKey:(id)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  unsigned int v10 = sub_10011FC7C;
  unsigned int v11 = sub_10011FC8C;
  uint64_t v12 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011FC98;
  block[3] = &unk_10034E790;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)cacheObject:(id)a3 withKey:(id)a4 expirationInterval:(double)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10011FD34;
  v6[3] = &unk_10034F310;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  *(double *)&v6[7] = a5;
  dispatch_async(dispatchQueue, v6);
}

- (void)cancelBackgroundTaskWithIdentifier:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10011FF28;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)endShowingDialog
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001200F8;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)keepAliveWithAssertion:(id)a3 block:(id)a4
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120190;
  block[3] = &unk_10034AF28;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(global_queue, block);
}

- (void)takeKeepAliveAssertion:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100120254;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)releaseKeepAliveAssertion:(id)a3
{
  dispatch_time_t v5 = dispatch_time(0LL, 15000000000LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100120354;
  v7[3] = &unk_10034AE70;
  v7[4] = self;
  v7[5] = a3;
  dispatch_after(v5, dispatchQueue, v7);
}

- (void)removeBackgroundTaskObserver:(id)a3
{
  if (a3)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100120410;
    v4[3] = &unk_10034AE70;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(dispatchQueue, v4);
  }

- (void)removeCachedObjectForKey:(id)a3
{
  if (a3)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100120568;
    v4[3] = &unk_10034AE70;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(dispatchQueue, v4);
  }

- (void)removeKeepAliveOperationQueue:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001205CC;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)start
{
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    int v48 = 138412802;
    uint64_t v49 = objc_opt_class(self);
    __int16 v50 = 2080;
    v51 = "Nov 10 2024";
    __int16 v52 = 2080;
    v53 = "02:47:38";
    uint64_t v8 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Starting... (Built: %s %s)",  &v48,  32);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      unsigned int v10 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v8, 4LL);
      free(v9);
      v39 = v10;
      __n128 v7 = SSFileLog(v3, @"%@");
    }
  }

  xpc_track_activity(v7);
  -[Daemon _finishProtectionClassCMigrationIfNeeded](self, "_finishProtectionClassCMigrationIfNeeded");
  -[Daemon _setGlobalState](self, "_setGlobalState");
  -[Daemon _initBackgroundTaskAgent](self, "_initBackgroundTaskAgent");
  -[Daemon _observeNotifications](self, "_observeNotifications");
  +[UserNotificationManager sharedManager](&OBJC_CLASS___UserNotificationManager, "sharedManager");
  id v11 = +[SSXPCServer mainServer](&OBJC_CLASS___SSXPCServer, "mainServer");
  id v12 = +[DownloadController controller](&OBJC_CLASS___DownloadController, "controller");
  [v12 observeXPCServer:v11];
  id v13 = +[MicroPaymentQueue paymentQueue](&OBJC_CLASS___MicroPaymentQueue, "paymentQueue");
  [v13 observeXPCServer:v11];
  +[AccountPasswordSettingsController observeXPCServer:]( &OBJC_CLASS___AccountPasswordSettingsController,  "observeXPCServer:",  v11);
  +[AppReceiptController observeXPCServer:](&OBJC_CLASS___AppReceiptController, "observeXPCServer:", v11);
  +[DaemonBiometricKeychain observeXPCServer:](&OBJC_CLASS___DaemonBiometricKeychain, "observeXPCServer:", v11);
  +[DaemonBiometricStore observeXPCServer:](&OBJC_CLASS___DaemonBiometricStore, "observeXPCServer:", v11);
  +[DirectUploadController observeXPCServer:](&OBJC_CLASS___DirectUploadController, "observeXPCServer:", v11);
  +[DistributedNotificationCenter observeXPCServer:]( &OBJC_CLASS___DistributedNotificationCenter,  "observeXPCServer:",  v11);
  +[ErrorHandlerManager observeXPCServer:](&OBJC_CLASS___ErrorHandlerManager, "observeXPCServer:", v11);
  +[EventDispatcher observeXPCServer:](&OBJC_CLASS___EventDispatcher, "observeXPCServer:", v11);
  +[KeyValueStore observeXPCServer:](&OBJC_CLASS___KeyValueStore, "observeXPCServer:", v11);
  +[IPodLibrary observeXPCServer:](&OBJC_CLASS___IPodLibrary, "observeXPCServer:", v11);
  -[MetricsController observeXPCServer:]( +[MetricsController sharedInstance](&OBJC_CLASS___MetricsController, "sharedInstance"),  "observeXPCServer:",  v11);
  +[PurchaseController observeXPCServer:](&OBJC_CLASS___PurchaseController, "observeXPCServer:", v11);
  +[PurchaseManifest observeXPCServer:](&OBJC_CLASS___PurchaseManifest, "observeXPCServer:", v11);
  -[PushNotificationController observeXPCServer:]( +[PushNotificationController sharedInstance](&OBJC_CLASS___PushNotificationController, "sharedInstance"),  "observeXPCServer:",  v11);
  +[SoftwareUpdatesStore observeXPCServer:](&OBJC_CLASS___SoftwareUpdatesStore, "observeXPCServer:", v11);
  +[SpringBoardUtility observeXPCServer:](&OBJC_CLASS___SpringBoardUtility, "observeXPCServer:", v11);
  +[StoreDownloadQueue observeXPCServer:](&OBJC_CLASS___StoreDownloadQueue, "observeXPCServer:", v11);
  +[StorePreorderQueue observeXPCServer:](&OBJC_CLASS___StorePreorderQueue, "observeXPCServer:", v11);
  -[StoreServicesRequestQueue observeXPCServer:]( +[StoreServicesRequestQueue sharedInstance](&OBJC_CLASS___StoreServicesRequestQueue, "sharedInstance"),  "observeXPCServer:",  v11);
  +[NetworkRequestQueue observeXPCServer:](&OBJC_CLASS___NetworkRequestQueue, "observeXPCServer:", v11);
  [v11 addObserver:self selector:"_getShowingDialogWithMessage:connection:" forMessage:131];
  id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v14) {
    id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v15 = objc_msgSend(v14, "shouldLog", v39);
  else {
    LODWORD(v16) = v15;
  }
  v17 = (os_log_s *)[v14 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    uint64_t v16 = v16;
  }
  else {
    v16 &= 2u;
  }
  if ((_DWORD)v16)
  {
    uint64_t v19 = objc_opt_class(self);
    int v48 = 138412290;
    uint64_t v49 = v19;
    LODWORD(v41) = 12;
    uint64_t v20 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Starting XPC server",  &v48,  v41);
    if (v20)
    {
      int v21 = (void *)v20;
      id v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
      free(v21);
      v40 = v22;
      *(void *)&double v18 = SSFileLog(v14, @"%@").n128_u64[0];
    }
  }

  objc_msgSend(v11, "start", v18, v40);
  -[Daemon takeKeepAliveAssertion:](self, "takeKeepAliveAssertion:", @"com.apple.itunesstored.launch");
  dispatch_time_t v23 = dispatch_time(0LL, 10000000000LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100120D40;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_after(v23, dispatchQueue, block);
  [v12 start];
  [v13 start];
  objc_msgSend(+[PurchaseController sharedController](PurchaseController, "sharedController"), "start");
  objc_msgSend( +[AppReceiptController sharedController](AppReceiptController, "sharedController"),  "start");
  objc_msgSend( +[DirectUploadController sharedController](DirectUploadController, "sharedController"),  "start");
  -[CacheDeleteCoordinator updatePurgeableStorage]( +[CacheDeleteCoordinator sharedInstance](&OBJC_CLASS___CacheDeleteCoordinator, "sharedInstance"),  "updatePurgeableStorage");
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  bagTimers = self->_bagTimers;
  id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( bagTimers,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(bagTimers);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * (void)i) start];
      }

      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( bagTimers,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v27);
  }

  +[ExplicitPreferenceManager sharedManager](&OBJC_CLASS___ExplicitPreferenceManager, "sharedManager");
  v30 = -[BatterySaverWatcher initWithDelegate:]( objc_alloc(&OBJC_CLASS___BatterySaverWatcher),  "initWithDelegate:",  self);
  self->_batterySaverWatcher = v30;
  -[Daemon batterySaverWatcherDidChangeState:](self, "batterySaverWatcherDidChangeState:", v30);
  +[PurchaseActionsManager registerInstallAttributionDatabaseCleanTask]( &OBJC_CLASS___PurchaseActionsManager,  "registerInstallAttributionDatabaseCleanTask");
  +[PurchaseActionsManager registerInstallAttributionPingbackRetryTask]( &OBJC_CLASS___PurchaseActionsManager,  "registerInstallAttributionPingbackRetryTask");
  -[NSUserDefaults registerDefaults:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "registerDefaults:",  +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  -[NSBundle URLForResource:withExtension:]( +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"),  "URLForResource:withExtension:",  @"Defaults",  @"plist")));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kSSDaemonLaunchedNotification, 0LL, 0LL, 1u);
  id v32 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v32) {
    id v32 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v33 = [v32 shouldLog];
  else {
    LODWORD(v34) = v33;
  }
  v35 = (os_log_s *)[v32 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
    uint64_t v34 = v34;
  }
  else {
    v34 &= 2u;
  }
  if ((_DWORD)v34)
  {
    uint64_t v36 = objc_opt_class(self);
    int v48 = 138412290;
    uint64_t v49 = v36;
    LODWORD(v41) = 12;
    uint64_t v37 = _os_log_send_and_compose_impl(v34, 0LL, 0LL, 0LL, &_mh_execute_header, v35, 1LL, "%@: Started", &v48, v41);
    if (v37)
    {
      v38 = (void *)v37;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v37, 4LL);
      free(v38);
      SSFileLog(v32, @"%@");
    }
  }

- (AMSBagValue)changeLanguageURL
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  id v4 = objc_alloc_init(&OBJC_CLASS___AMSBinaryPromise);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100120FB4;
  v19[3] = &unk_10034AE98;
  v19[4] = v4;
  -[ISLoadURLBagOperation setCompletionBlock:](v3, "setCompletionBlock:", v19);
  id v5 = +[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue");
  int v24 = v3;
  objc_msgSend( v5,  "addOperations:waitUntilFinished:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1),  1);
  uint64_t v18 = 0LL;
  if ([v4 resultWithTimeout:&v18 error:60.0]) {
    return (AMSBagValue *)+[AMSBagValue frozenBagValueWithKey:value:valueType:]( AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"change-language",  objc_msgSend( -[ISLoadURLBagOperation URLBag](v3, "URLBag"),  "urlForKey:",  @"change-language"),  5);
  }
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  unsigned int v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    uint64_t v12 = objc_opt_class(self);
    uint64_t v13 = AMSLogableError(v18);
    int v20 = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    uint64_t v14 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "%{public}@: Failed to get the change-language URL from the bag. error = %{public}@",  &v20,  22);
    if (v14)
    {
      unsigned int v15 = (void *)v14;
      uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      v17 = v16;
      *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
    }
  }

  return (AMSBagValue *)+[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"change-language",  5LL,  v18,  v11,  v17);
}

- (AMSBagValue)trustedDomains
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  id v4 = objc_alloc_init(&OBJC_CLASS___AMSBinaryPromise);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100121220;
  v19[3] = &unk_10034AE98;
  v19[4] = v4;
  -[ISLoadURLBagOperation setCompletionBlock:](v3, "setCompletionBlock:", v19);
  id v5 = +[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue");
  int v24 = v3;
  objc_msgSend( v5,  "addOperations:waitUntilFinished:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1),  1);
  uint64_t v18 = 0LL;
  if ([v4 resultWithTimeout:&v18 error:60.0]) {
    return (AMSBagValue *)+[AMSBagValue frozenBagValueWithKey:value:valueType:]( AMSBagValue,  "frozenBagValueWithKey:value:valueType:",  @"trustedDomains",  objc_msgSend( -[ISLoadURLBagOperation URLBag](v3, "URLBag"),  "valueForKey:",  @"trustedDomains"),  0);
  }
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  unsigned int v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    uint64_t v12 = objc_opt_class(self);
    uint64_t v13 = AMSLogableError(v18);
    int v20 = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    uint64_t v14 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "%{public}@: Failed to get the trustedDomains from the bag. error = %{public}@",  &v20,  22);
    if (v14)
    {
      unsigned int v15 = (void *)v14;
      uint64_t v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
      free(v15);
      v17 = v16;
      *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
    }
  }

  return (AMSBagValue *)+[AMSBagValue failingBagValueWithKey:valueType:error:]( &OBJC_CLASS___AMSBagValue,  "failingBagValueWithKey:valueType:error:",  @"trustedDomains",  0LL,  v18,  v11,  v17);
}

- (void)batterySaverWatcherDidChangeState:(id)a3
{
  unsigned int v4 = [a3 batterySaverEnabled];
  id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v6 = v5;
  if (v4)
  {
    if (!v5) {
      id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)[v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      int v22 = 138412290;
      uint64_t v23 = objc_opt_class(self);
      uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: battery saver mode started",  &v22,  12);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        uint64_t v21 = v13;
        *(void *)&double v10 = SSFileLog(v6, @"%@").n128_u64[0];
      }
    }

    objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v10, v21),  "disableAutomaticDownloadsWithReason:",  @"battery saver mode started");
  }

  else
  {
    if (!v5) {
      id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v14 = [v6 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    uint64_t v16 = (os_log_s *)[v6 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v22 = 138412290;
      uint64_t v23 = objc_opt_class(self);
      uint64_t v18 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: battery saver mode ended",  &v22,  12);
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        int v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
        free(v19);
        uint64_t v21 = v20;
        *(void *)&double v17 = SSFileLog(v6, @"%@").n128_u64[0];
      }
    }

    objc_msgSend( +[StoreDownloadQueue sharedDownloadQueue](StoreDownloadQueue, "sharedDownloadQueue", v17, v21),  "enableAutomaticDownloadsWithReason:",  @"battery saver mode ended");
  }

- (void)_getShowingDialogWithMessage:(id)a3 connection:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001214F8;
  block[3] = &unk_10034AF00;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)_networkUsageStateChangeNotification:(id)a3
{
  if (-[ISNetworkObserver isUsingNetwork]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance", a3),  "isUsingNetwork"))
  {
    -[Daemon _reloadWiFiManager](self, "_reloadWiFiManager");
  }

  else
  {
    dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001215E8;
    block[3] = &unk_10034AE98;
    block[4] = self;
    dispatch_after(v4, dispatchQueue, block);
  }

- (void)_operationCountChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100121648;
  block[3] = &unk_10034AE98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_expireCachedObjectForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_cachedObjects, "objectForKey:");
  if (v5)
  {
    [v5 setExpirationTimer:0];
    -[NSMutableDictionary removeObjectForKey:](self->_cachedObjects, "removeObjectForKey:", a3);
  }

- (void)_handleWakeWithName:(const char *)a3 job:(id)a4
{
  unsigned int v7 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", a3);
  id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v8) {
    id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  uint64_t v11 = (os_log_s *)[v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if ((_DWORD)v10)
  {
    int v30 = 138412546;
    uint64_t v31 = objc_opt_class(self);
    __int16 v32 = 2080;
    unsigned int v33 = a3;
    uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Background task status changed: [%s]",  &v30,  22);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      unsigned int v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      int v22 = v14;
      SSFileLog(v8, @"%@");
    }
  }

  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  backgroundTaskObservers = self->_backgroundTaskObservers;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( backgroundTaskObservers,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(backgroundTaskObservers);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (-[NSString hasPrefix:](v7, "hasPrefix:", v21, v22)) {
          -[NSMutableSet unionSet:]( v15,  "unionSet:",  -[NSMutableDictionary objectForKey:](self->_backgroundTaskObservers, "objectForKey:", v21));
        }
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( backgroundTaskObservers,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    }

    while (v18);
  }

  if (-[NSMutableSet count](v15, "count", v22))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100121950;
    block[3] = &unk_10034E6E0;
    block[4] = v15;
    void block[5] = v7;
    block[6] = a4;
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.itunesstored.Daemon.observers", 0LL);
    dispatch_async(v24, block);
  }

  xpc_dictionary_set_value(self->_satisfiedWakeRequests, a3, a4);
}

- (void)_initBackgroundTaskAgent
{
  self->_bagTimers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = +[URLBagTimer subscriptionRenewTimer](&OBJC_CLASS___URLBagTimer, "subscriptionRenewTimer");
  [v3 setEventBlock:&stru_10034F330];
  [v3 setPreconditionsBlock:&stru_10034F370];
  -[NSMutableArray addObject:](self->_bagTimers, "addObject:", v3);
}

- (void)_finishProtectionClassCMigrationIfNeeded
{
  id v3 = +[ISFileProtectionClassMigrator isMigrationNeeded]( &OBJC_CLASS___ISFileProtectionClassMigrator,  "isMigrationNeeded");
  if (!(_DWORD)v3) {
    return;
  }
  int out_token = -1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100121FA4;
  handler[3] = &unk_10034F3B8;
  int v19 = -1;
  uint64_t v11 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, dispatchQueue, handler);
  if (!(_DWORD)v11)
  {
LABEL_3:
    if ((+[ISFileProtectionClassMigrator migrate](&OBJC_CLASS___ISFileProtectionClassMigrator, "migrate") & 1) == 0)
    {
      id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v4) {
        id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      int v5 = [v4 shouldLog];
      unsigned int v6 = [v4 shouldLogToDisk] ? v5 | 2 : v5;
      unsigned int v7 = (os_log_s *)[v4 OSLogObject];
      uint64_t v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) ? v6 : v6 & 2u;
      if ((_DWORD)v8)
      {
        LOWORD(v21[0]) = 0;
        uint64_t v9 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "Data Protection migration to class C failed");
        goto LABEL_25;
      }
    }

    return;
  }

  int v12 = v11;
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v13 = [v4 shouldLog];
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v14 & 2;
  }
  if ((_DWORD)v16)
  {
    v21[0] = 67109120;
    v21[1] = v12;
    uint64_t v9 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  16LL,  "Registration for device first unlock notification failed: %u",  v21);
LABEL_25:
    if (v9)
    {
      id v17 = (void *)v9;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v17);
      SSFileLog(v4, @"%@");
    }
  }

- (void)_observeNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = (const __CFString *)off_1003A2C38();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_100122220,  v4,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  int v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v5,  "addObserverForName:object:queue:usingBlock:",  SSDeviceStoreFrontChangedNotification,  0LL,  0LL,  &stru_10034F3F8);
  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v5,  "addObserverForName:object:queue:usingBlock:",  SSAccountStoreChangedNotification,  0LL,  0LL,  &stru_10034F418);
  unsigned int v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_memorypressure,  0LL,  2uLL,  0LL);
  self->_jetsamSource = v6;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100122BC8;
  handler[3] = &unk_10034AE98;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
  dispatch_resume((dispatch_object_t)self->_jetsamSource);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_10034F438);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_10034F458);
  xpc_set_event_stream_handler(kNSURLSessionLaunchOnDemandNotificationName, &_dispatch_main_q, &stru_10034F478);
}

- (void)_reloadOperationKeepAliveTransaction
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  keepAliveOperationQueues = self->_keepAliveOperationQueues;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keepAliveOperationQueues,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(keepAliveOperationQueues);
        }
        if ((uint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * (void)i) operationCount] > 0)
        {
          if (!self->_aliveForOperationQueues)
          {
            self->_aliveForOperationQueues = 1;
            -[Daemon takeKeepAliveAssertion:]( self,  "takeKeepAliveAssertion:",  @"com.apple.itunesstored.keepQueuesAlive");
          }

          return;
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( keepAliveOperationQueues,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (self->_aliveForOperationQueues)
  {
    self->_aliveForOperationQueues = 0;
    -[Daemon releaseKeepAliveAssertion:]( self,  "releaseKeepAliveAssertion:",  @"com.apple.itunesstored.keepQueuesAlive");
  }

- (void)_reloadWiFiManager
{
  if (-[ISNetworkObserver isUsingNetwork]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"),  "isUsingNetwork")) {
    uint64_t v2 = 2LL;
  }
  else {
    uint64_t v2 = 1LL;
  }
  objc_msgSend(+[WiFiManager sharedWiFiManager](WiFiManager, "sharedWiFiManager"), "setClientType:", v2);
}

- (void)_setGlobalState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SSLogFileOptions);
  objc_msgSend( v3,  "setLogDirectoryPath:",  objc_msgSend( objc_msgSend( objc_msgSend( (id)CPSharedResourcesDirectory(objc_msgSend(v3, "setLogFileBaseName:", @"itunesstored")),  "stringByAppendingPathComponent:",  @"Library"),  "stringByAppendingPathComponent:",  @"Logs"),  "stringByAppendingPathComponent:",  @"com.apple.itunesstored"));
  SSDebugSetFileLoggingOptions(v3);

  id v4 = -[ISDevice copyProtocolConditionalContext]( +[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"),  "copyProtocolConditionalContext");
  +[SSProtocolConditionalEvaluator setDefaultConditionalContext:]( &OBJC_CLASS___SSProtocolConditionalEvaluator,  "setDefaultConditionalContext:",  v4);

  +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance");
  -[Daemon _reloadWiFiManager](self, "_reloadWiFiManager");
}

- (void)_warmUpSharedURLCache
{
}

@end