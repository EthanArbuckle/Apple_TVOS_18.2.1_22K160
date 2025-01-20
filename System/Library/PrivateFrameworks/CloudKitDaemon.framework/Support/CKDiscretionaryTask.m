@interface CKDiscretionaryTask
- (BOOL)isSpringBoardApp;
- (BOOL)running;
- (CKDOperationCallbackProxy)callbackProxy;
- (CKDiscretionaryClientConnection)connection;
- (CKDiscretionaryOptions)options;
- (CKDiscretionarySchedulerTask)task;
- (CKDiscretionaryTask)initWithConnection:(id)a3 operationID:(id)a4 group:(id)a5 bundleID:(id)a6 isSpringBoardApp:(BOOL)a7 requiresPastBuddy:(BOOL)a8 options:(id)a9 schedulerClass:(Class)a10 startHandler:(id)a11 suspendHandler:(id)a12;
- (Class)schedulerClass;
- (NDApplication)application;
- (NSString)bundleID;
- (NSString)operationID;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)resourceTimer;
- (OS_os_transaction)transaction;
- (id)_schedulerTaskIdentifier;
- (id)startHandler;
- (id)suspendHandler;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)complete;
- (void)dealloc;
- (void)setApplication:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCallbackProxy:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setOperationID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResourceTimer:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSchedulerClass:(Class)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStartHandler:(id)a3;
- (void)setSuspendHandler:(id)a3;
- (void)setTask:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation CKDiscretionaryTask

- (CKDiscretionaryTask)initWithConnection:(id)a3 operationID:(id)a4 group:(id)a5 bundleID:(id)a6 isSpringBoardApp:(BOOL)a7 requiresPastBuddy:(BOOL)a8 options:(id)a9 schedulerClass:(Class)a10 startHandler:(id)a11 suspendHandler:(id)a12
{
  BOOL v61 = a8;
  id v17 = a3;
  id v63 = a4;
  id v64 = a5;
  id v65 = a6;
  id v66 = a9;
  id v67 = a11;
  id v18 = a12;
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___CKDiscretionaryTask;
  v19 = -[CKDiscretionaryTask init](&v76, "init");
  v20 = v19;
  if (!v19) {
    goto LABEL_34;
  }
  objc_storeWeak((id *)&v19->_connection, v17);
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 serialQueue]);
  serialQueue = v20->_serialQueue;
  v20->_serialQueue = (OS_dispatch_queue *)v21;

  objc_storeStrong((id *)&v20->_operationID, a4);
  p_options = (id *)&v20->_options;
  objc_storeStrong((id *)&v20->_options, a9);
  objc_storeStrong((id *)&v20->_schedulerClass, a10);
  id v24 = [v67 copy];
  id startHandler = v20->_startHandler;
  v20->_id startHandler = v24;

  id v26 = [v18 copy];
  id suspendHandler = v20->_suspendHandler;
  v20->_id suspendHandler = v26;

  objc_storeStrong((id *)&v20->_bundleID, a6);
  v20->_isSpringBoardApp = a7;
  uint64_t v28 = os_transaction_create("com.apple.ckdiscretionaryd.discTask");
  transaction = v20->_transaction;
  v20->_transaction = (OS_os_transaction *)v28;

  if (!v17
    || !v20->_serialQueue
    || !v20->_operationID
    || !*p_options
    || !v20->_schedulerClass
    || !v20->_startHandler
    || !v20->_suspendHandler
    || !v20->_bundleID
    || !v20->_transaction)
  {
    if (ck_log_initialization_predicate != -1LL) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v32 = (void *)ck_log_facility_ckdd;
    if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_ERROR))
    {
      v34 = v20->_serialQueue;
      operationID = v20->_operationID;
      Class schedulerClass = v20->_schedulerClass;
      options = v20->_options;
      id v36 = v20->_startHandler;
      v38 = v32;
      id v39 = objc_retainBlock(v36);
      id v40 = objc_retainBlock(v20->_suspendHandler);
      v41 = v20->_transaction;
      bundleID = v20->_bundleID;
      *(_DWORD *)buf = 134220032;
      v78 = v34;
      __int16 v79 = 2048;
      id v80 = v17;
      __int16 v81 = 2048;
      v82 = operationID;
      __int16 v83 = 2048;
      v84 = options;
      __int16 v85 = 2048;
      Class v86 = schedulerClass;
      __int16 v87 = 2048;
      id v88 = v39;
      __int16 v89 = 2048;
      id v90 = v40;
      __int16 v91 = 2048;
      v92 = v41;
      __int16 v93 = 2048;
      v94 = bundleID;
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Missing critical attribute for initilization of CKDiscretionaryTask. serialQueue:%p, connection:%p, operationID: %p, options:%p, scheduler:%p, startHandler:%p, suspendHandler:%p, transaction:%p, bundleID:%p",  buf,  0x5Cu);
    }

    goto LABEL_19;
  }

  id v30 = [*p_options discretionaryNetworkBehavior];
  if (v30 == (id)2)
  {
    uint64_t v31 = 4LL;
  }

  else
  {
    if (v30 == (id)1)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryTask application](v20, "application"));
      [v43 addObserver:v20];
      if ([v43 hasForegroundBackgroundStates]
        && ![v43 isForeground])
      {
        uint64_t v44 = 3LL;
      }

      else
      {
        uint64_t v44 = 2LL;
      }

      uint64_t v60 = v44;

      goto LABEL_28;
    }

    if (v30)
    {
      uint64_t v60 = 0LL;
      goto LABEL_28;
    }

    uint64_t v31 = 1LL;
  }

  uint64_t v60 = v31;
LABEL_28:
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v45 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v46 = v45;
    v47 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryTask operationID](v20, "operationID"));
    v48 = sub_10000740C(v60);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    *(_DWORD *)buf = 138543618;
    v78 = v47;
    __int16 v79 = 2114;
    id v80 = v49;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "%{public}@ scheduling in state %{public}@",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, v20);
  v50 = v20->_serialQueue;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_1000060B4;
  v73[3] = &unk_1000104C0;
  objc_copyWeak(&v75, (id *)buf);
  v51 = v20;
  v74 = v51;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_10000625C;
  v71[3] = &unk_1000104E8;
  objc_copyWeak(&v72, (id *)buf);
  uint64_t v52 = objc_claimAutoreleasedReturnValue( -[objc_class scheduleOperationID:group:bundleID:requiresPastBuddy:options:state:queue:startHandler:suspendHandler:]( a10,  "scheduleOperationID:group:bundleID:requiresPastBuddy:options:state:queue:startHandler:suspendHandler:",  v63,  v64,  v65,  v61,  v66,  v60,  v50,  v73,  v71));
  v53 = v51[14];
  v51[14] = (dispatch_source_s *)v52;

  dispatch_source_t v54 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v20->_serialQueue);
  [v51 setResourceTimer:v54];

  v55 = v51[12];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100006374;
  handler[3] = &unk_100010510;
  objc_copyWeak(&v70, (id *)buf);
  dispatch_source_set_event_handler(v55, handler);
  [v66 timeoutIntervalForResource];
  dispatch_time_t v57 = dispatch_time(0LL, (uint64_t)(v56 * 1000000000.0));
  dispatch_source_set_timer(v51[12], v57, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_activate(v51[12]);
  if (v51[14])
  {
    objc_destroyWeak(&v70);
    objc_destroyWeak(&v72);

    objc_destroyWeak(&v75);
    objc_destroyWeak((id *)buf);
LABEL_34:
    v33 = v20;
    goto LABEL_35;
  }

  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v59 = (os_log_s *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v68 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Failed to initialize CKDiscretionarySchedulerTask for CKDiscretionaryTask",  v68,  2u);
  }

  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)buf);
LABEL_19:
  v33 = 0LL;
LABEL_35:

  return v33;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKDiscretionaryTask;
  -[CKDiscretionaryTask dealloc](&v3, "dealloc");
}

- (void)setResourceTimer:(id)a3
{
  v4 = (OS_dispatch_source *)a3;
  resourceTimer = self->_resourceTimer;
  if (resourceTimer != v4 && resourceTimer != 0LL)
  {
    dispatch_source_cancel((dispatch_source_t)resourceTimer);
    resourceTimer = self->_resourceTimer;
  }

  self->_resourceTimer = v4;
}

- (void)setTask:(id)a3
{
  v4 = (CKDiscretionarySchedulerTask *)a3;
  task = self->_task;
  if (task != v4 && task != 0LL)
  {
    if (self->_running) {
      -[CKDiscretionarySchedulerTask finish](task, "finish");
    }
    else {
      -[CKDiscretionarySchedulerTask cancel](task, "cancel");
    }
  }

  v7 = self->_task;
  self->_task = v4;
}

- (NDApplication)application
{
  application = self->_application;
  if (!application)
  {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue( -[CKDiscretionaryOptions applicationBundleIdentifierOverride]( self->_options,  "applicationBundleIdentifierOverride"));
    bundleID = v4;
    if (!v4) {
      bundleID = self->_bundleID;
    }
    v6 = bundleID;

    if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", v6))
    {
      v7 = self->_bundleID;
      if (self->_isSpringBoardApp)
      {
LABEL_6:
        v8 = (NDApplication *)objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v7));
LABEL_9:
        v10 = self->_application;
        self->_application = v8;

        application = self->_application;
        return application;
      }
    }

    else
    {
      unsigned __int8 v9 = +[NDApplication springBoardApplicationExistsWithIdentifier:]( &OBJC_CLASS___NDApplication,  "springBoardApplicationExistsWithIdentifier:",  v6);
      v7 = v6;
      if ((v9 & 1) != 0) {
        goto LABEL_6;
      }
    }

    v8 = (NDApplication *)objc_claimAutoreleasedReturnValue( +[NDApplication applicationWithIdentifier:]( &OBJC_CLASS___NDApplication,  "applicationWithIdentifier:",  v7));
    goto LABEL_9;
  }

  return application;
}

- (id)_schedulerTaskIdentifier
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"ckdiscretionaryd:%@",  self->_operationID));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[CKDiscretionaryOptions applicationBundleIdentifierOverride]( self->_options,  "applicationBundleIdentifierOverride"));

  bundleID = self->_bundleID;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKDiscretionaryOptions applicationBundleIdentifierOverride]( self->_options,  "applicationBundleIdentifierOverride"));
    [v3 appendFormat:@":%@-%@", bundleID, v6];
  }

  else
  {
    [v3 appendFormat:@":%@", self->_bundleID];
  }

  return v3;
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryTask operationID](self, "operationID"));
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "applicationEnteredForeground, updating priority of %{public}@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006984;
  block[3] = &unk_100010510;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async((dispatch_queue_t)serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryTask operationID](self, "operationID"));
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "applicationNoLongerInForeground, updating priority of %{public}@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006C00;
  block[3] = &unk_100010510;
  objc_copyWeak(&v10, (id *)buf);
  dispatch_async((dispatch_queue_t)serialQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)complete
{
  if (ck_log_initialization_predicate != -1LL) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v3 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDiscretionaryTask operationID](self, "operationID"));
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@ complete", buf, 0xCu);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006E40;
  block[3] = &unk_100010538;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (CKDOperationCallbackProxy)callbackProxy
{
  return self->_callbackProxy;
}

- (void)setCallbackProxy:(id)a3
{
}

- (CKDiscretionaryClientConnection)connection
{
  return (CKDiscretionaryClientConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (CKDiscretionaryOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)startHandler
{
  return self->_startHandler;
}

- (void)setStartHandler:(id)a3
{
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (void)setSuspendHandler:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (void)setApplication:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)resourceTimer
{
  return self->_resourceTimer;
}

- (Class)schedulerClass
{
  return self->_schedulerClass;
}

- (void)setSchedulerClass:(Class)a3
{
}

- (CKDiscretionarySchedulerTask)task
{
  return self->_task;
}

- (void).cxx_destruct
{
}

@end