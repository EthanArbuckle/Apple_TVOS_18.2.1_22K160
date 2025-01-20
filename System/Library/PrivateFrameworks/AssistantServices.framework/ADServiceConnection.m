@interface ADServiceConnection
- (ADServiceConnection)initWithIdentifier:(id)a3 path:(id)a4 commandMap:(id)a5 anchorMap:(id)a6 clearingClass:(id)a7 maintenanceClass:(id)a8 instanceContext:(id)a9 queue:(id)a10;
- (ADServiceConnectionDelegate)delegate;
- (NSString)identifier;
- (double)_timeoutForCommand:(id)a3;
- (id)_bundleClassForDomain:(id)a3 commandName:(id)a4;
- (id)_connection;
- (id)_providerService;
- (id)_providerServiceDelegate;
- (id)_providerServiceWithErrorHandler:(id)a3;
- (id)_stopTimersWithContinuation;
- (id)_syncClassForAnchorKey:(id)a3;
- (void)_addWatchdogTimer:(id)a3 forUUID:(id)a4;
- (void)_getCarDNDModeWithReply:(id)a3;
- (void)_getLockStateWithReply:(id)a3;
- (void)_getStarkModeWithReply:(id)a3;
- (void)_getTimeoutSuspendedWithReply:(id)a3;
- (void)_getWatchAuthenticationWithReply:(id)a3;
- (void)_handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_removeTimerForUUID:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)preheatServiceBundle;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)sendBeginSyncWithInfo:(id)a3 chunkHandler:(id)a4 completion:(id)a5;
- (void)sendClearDomainObjects;
- (void)sendClientBoundCommand:(id)a3 domain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)sendFetchSyncSnapshotForInfo:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ADServiceConnection

- (ADServiceConnection)initWithIdentifier:(id)a3 path:(id)a4 commandMap:(id)a5 anchorMap:(id)a6 clearingClass:(id)a7 maintenanceClass:(id)a8 instanceContext:(id)a9 queue:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___ADServiceConnection;
  v24 = -[ADServiceConnection init](&v51, "init");
  if (v24)
  {
    id v50 = v23;
    v25 = (NSString *)[v16 copy];
    identifier = v24->_identifier;
    v24->_identifier = v25;

    v27 = (NSString *)[v17 copy];
    path = v24->_path;
    v24->_path = v27;

    v29 = -[ADServiceStatistics initWithServiceIdentifier:]( objc_alloc(&OBJC_CLASS___ADServiceStatistics),  "initWithServiceIdentifier:",  v16);
    stats = v24->_stats;
    v24->_stats = v29;

    v31 = (NSDictionary *)[v18 copy];
    commandMap = v24->_commandMap;
    v24->_commandMap = v31;

    v33 = (NSDictionary *)[v19 copy];
    anchorKeyClassMap = v24->_anchorKeyClassMap;
    v24->_anchorKeyClassMap = v33;

    v35 = (NSString *)[v20 copy];
    domainObjectClearingClassName = v24->_domainObjectClearingClassName;
    v24->_domainObjectClearingClassName = v35;

    v37 = (NSString *)[v21 copy];
    maintenanceClassName = v24->_maintenanceClassName;
    v24->_maintenanceClassName = v37;

    objc_storeStrong((id *)&v24->_targetQueue, a10);
    dispatch_queue_attr_t v39 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v40 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v39);
    dispatch_queue_t v41 = dispatch_queue_create("ADServiceConnectionSyncQueue", v40);

    syncQueue = v24->_syncQueue;
    v24->_syncQueue = (OS_dispatch_queue *)v41;

    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    watchdogTimersByUUID = v24->_watchdogTimersByUUID;
    v24->_watchdogTimersByUUID = v43;

    v45 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    suspendedWatchdogTimerUUIDs = v24->_suspendedWatchdogTimerUUIDs;
    v24->_suspendedWatchdogTimerUUIDs = v45;

    if (v22) {
      v47 = (AFInstanceContext *)v22;
    }
    else {
      v47 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v24->_instanceContext;
    v24->_instanceContext = v47;

    id v23 = v50;
  }

  return v24;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADServiceConnection;
  -[ADServiceConnection dealloc](&v3, "dealloc");
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCConnectionWithMachServiceName:options:]( self->_instanceContext,  "createXPCConnectionWithMachServiceName:options:",  kAssistantServiceServiceName,  0LL));
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    uint64_t v7 = AFProviderServiceXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v8);

    v9 = self->_connection;
    uint64_t v10 = AFProviderServiceDelegateXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v11);

    v12 = self->_connection;
    v13 = -[ADServiceConnectionProviderServiceDelegate initWithServiceConnection:syncQueue:]( objc_alloc(&OBJC_CLASS___ADServiceConnectionProviderServiceDelegate),  "initWithServiceConnection:syncQueue:",  self,  self->_syncQueue);
    -[NSXPCConnection setExportedObject:](v12, "setExportedObject:", v13);

    v14 = self->_connection;
    if ((AFIsHorseman(v15) & 1) != 0)
    {
      id v16 = (dispatch_queue_s *)(id)qword_1005780B0;
      dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
      dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_UNSPECIFIED, 0);
      id v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);

      dispatch_queue_t v21 = dispatch_queue_create_with_target_V2(0LL, v20, v16);
    }

    else
    {
      dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
      dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INTERACTIVE, 0);
      id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);

      dispatch_queue_t v21 = dispatch_queue_create(0LL, (dispatch_queue_attr_t)v16);
    }

    -[NSXPCConnection _setQueue:](v14, "_setQueue:", v21);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &stru_1004F7918);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &stru_1004F7938);
    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }

  return connection;
}

- (id)_providerService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _connection](self, "_connection"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxy]);

  return v3;
}

- (id)_providerServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _connection](self, "_connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v4]);

  return v6;
}

- (id)_providerServiceDelegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _connection](self, "_connection"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 exportedObject]);

  return v3;
}

- (id)_bundleClassForDomain:(id)a3 commandName:(id)a4
{
  commandMap = self->_commandMap;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](commandMap, "objectForKey:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  return v8;
}

- (void)_addWatchdogTimer:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    targetQueue = (dispatch_queue_s *)self->_targetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100253770;
    block[3] = &unk_1004FD4C0;
    block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(targetQueue, block);
  }
}

- (void)_removeTimerForUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    targetQueue = (dispatch_queue_s *)self->_targetQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100253764;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

- (double)_timeoutForCommand:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_respondsToSelector(v4, "hashedRouteUIDs");
  if ((v5 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector(v4, "hashedRouteUID") & 1) != 0) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v4 hashedRouteUIDs]);
  if (![v3 count])
  {
    if ((objc_opt_respondsToSelector(v4, "hashedRouteUID") & 1) != 0)
    {
LABEL_7:
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 hashedRouteUID]);
      id v7 = [v6 length];

      if ((v5 & 1) != 0) {
      if (v7)
      }
        goto LABEL_10;
LABEL_13:
      double v8 = 10.0;
      goto LABEL_14;
    }

LABEL_12:
    goto LABEL_13;
  }

LABEL_10:
  double v8 = 15.0;
LABEL_14:

  return v8;
}

- (void)sendClientBoundCommand:(id)a3 domain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v47 = a5;
  id v13 = a6;
  if (self->_path)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    dispatch_queue_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v41 handleFailureInMethod:a2 object:self file:@"ADServiceConnection.m" lineNumber:182 description:@"Must have a path"];

    if (v11) {
      goto LABEL_3;
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v42 handleFailureInMethod:a2 object:self file:@"ADServiceConnection.m" lineNumber:183 description:@"Must have a command"];

LABEL_3:
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 encodedClassName]);
  v46 = v12;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceConnection _bundleClassForDomain:commandName:]( self,  "_bundleClassForDomain:commandName:",  v12,  v14));
  id v16 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  v44 = (void *)v14;
  -[ADServiceStatistics markIncomingCommand:](self->_stats, "markIncomingCommand:", v14);
  -[ADServiceConnection _timeoutForCommand:](self, "_timeoutForCommand:", v11);
  double v18 = v17;
  dispatch_queue_attr_t v19 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
    *(_DWORD *)buf = 136315650;
    v64 = "-[ADServiceConnection sendClientBoundCommand:domain:executionContext:reply:]";
    __int16 v65 = 2114;
    v66 = v21;
    __int16 v67 = 2114;
    v68 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Using timeout of %{public}@ seconds for %{public}@",  buf,  0x20u);
  }

  dispatch_queue_attr_t v22 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  targetQueue = self->_targetQueue;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_100253070;
  v58[3] = &unk_1004FDA30;
  id v24 = v15;
  id v59 = v24;
  v60 = self;
  v25 = v16;
  v61 = v25;
  id v26 = v13;
  id v62 = v26;
  v27 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v22,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  targetQueue,  v58,  v18);
  -[AFWatchdogTimer start](v27, "start");
  v28 = v11;
  LODWORD(v22) = objc_msgSend(v11, "ad_shouldLogToMetrics");
  kdebug_trace(722470224LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v22)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v29 logEventWithType:4005 context:0];
  }

  kdebug_trace(722470232LL, 0LL, 0LL, 0LL, 0LL);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_100253208;
  v53[3] = &unk_1004F7988;
  v53[4] = self;
  v30 = v25;
  v54 = v30;
  v31 = v27;
  v55 = v31;
  id v56 = v24;
  id v32 = v26;
  id v57 = v32;
  id v33 = v24;
  v34 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceConnection _providerServiceWithErrorHandler:]( self,  "_providerServiceWithErrorHandler:",  v53));
  path = self->_path;
  v45 = v28;
  v36 = (void *)objc_claimAutoreleasedReturnValue([v28 dictionary]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v47 info]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1002532E0;
  v48[3] = &unk_1004F79B0;
  v48[4] = self;
  v49 = v30;
  id v50 = v31;
  id v51 = v44;
  id v52 = v32;
  id v43 = v32;
  id v38 = v44;
  dispatch_queue_attr_t v39 = v31;
  v40 = v30;
  [v34 doCommandForServicePath:path className:v33 infoDictionary:v36 executionInfo:v37 reply:v48];

  -[ADServiceConnection _addWatchdogTimer:forUUID:](self, "_addWatchdogTimer:forUUID:", v39, v40);
}

- (id)_syncClassForAnchorKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_anchorKeyClassMap, "objectForKey:", a3);
}

- (void)sendBeginSyncWithInfo:(id)a3 chunkHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = a5;
  uint64_t v10 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v57 = "-[ADServiceConnection sendBeginSyncWithInfo:chunkHandler:completion:]";
    __int16 v58 = 2112;
    id v59 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _providerServiceDelegate](self, "_providerServiceDelegate"));
  id v12 = objc_alloc_init(&OBJC_CLASS___ADSyncRequest);
  -[ADSyncRequest setSyncChunkHandler:](v12, "setSyncChunkHandler:", v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncRequest uuid](v12, "uuid"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection delegate](self, "delegate"));
  syncQueue = self->_syncQueue;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100252C90;
  v50[3] = &unk_1004FCBB0;
  id v16 = v8;
  id v51 = v16;
  id v17 = v11;
  id v52 = v17;
  id v18 = v13;
  id v53 = v18;
  id v54 = v14;
  id v19 = v35;
  id v55 = v19;
  id v36 = v14;
  -[ADSyncRequest startTimerOnQueue:withTimeoutHandler:](v12, "startTimerOnQueue:withTimeoutHandler:", syncQueue, v50);
  id v20 = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100252D90;
  block[3] = &unk_1004FD4C0;
  id v21 = v17;
  id v47 = v21;
  v48 = v12;
  id v22 = v18;
  id v49 = v22;
  v34 = v12;
  dispatch_async(v20, block);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100252DA0;
  v42[3] = &unk_1004F79D8;
  v42[4] = self;
  id v43 = v21;
  id v44 = v22;
  id v45 = v19;
  id v33 = v19;
  id v23 = v22;
  id v32 = v21;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100252E60;
  v39[3] = &unk_1004FD740;
  v39[4] = self;
  id v40 = v16;
  id v24 = objc_retainBlock(v42);
  id v41 = v24;
  id v25 = v16;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceConnection _providerServiceWithErrorHandler:]( self,  "_providerServiceWithErrorHandler:",  v39));
  path = self->_path;
  v28 = v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v25 key]);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _syncClassForAnchorKey:](self, "_syncClassForAnchorKey:", v29));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100252F78;
  v37[3] = &unk_1004FC838;
  id v38 = v24;
  v31 = v24;
  [v26 beginSyncForServicePath:path className:v30 requestUUID:v23 info:v25 reply:v37];

  self->_preheated = 1;
}

- (void)sendFetchSyncSnapshotForInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = "-[ADServiceConnection sendFetchSyncSnapshotForInfo:completion:]";
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100252B94;
    v18[3] = &unk_1004FD740;
    v18[4] = self;
    id v9 = v6;
    id v19 = v9;
    id v10 = v7;
    id v20 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceConnection _providerServiceWithErrorHandler:]( self,  "_providerServiceWithErrorHandler:",  v18));
    path = self->_path;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _syncClassForAnchorKey:](self, "_syncClassForAnchorKey:", v13));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100252C84;
    v16[3] = &unk_1004F7A00;
    id v17 = v10;
    [v11 fetchCurrentSyncSnapshotForServicePath:path className:v14 key:v15 completion:v16];
  }
}

- (void)sendClearDomainObjects
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _providerService](self, "_providerService"));
  [v3 clearDomainObjectsForServicePath:self->_path className:self->_domainObjectClearingClassName];

  self->_preheated = 1;
}

- (void)preheatServiceBundle
{
  if (!self->_preheated)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _providerService](self, "_providerService"));
    [v3 preheatBundleForServicePath:self->_path];

    self->_preheated = 1;
  }

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = v4;
  if (self->_maintenanceClassName && self->_path)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100252B80;
    v8[3] = &unk_1004FCC00;
    id v6 = v4;
    id v9 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceConnection _providerServiceWithErrorHandler:]( self,  "_providerServiceWithErrorHandler:",  v8));
    [v7 runMaintenanceWorkForServicePath:self->_path className:self->_maintenanceClassName completion:v6];

    self->_preheated = 1;
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)invalidate
{
  objc_super v3 = self->_connection;
  connection = self->_connection;
  self->_connection = 0LL;

  self->_preheated = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100252B78;
  v6[3] = &unk_1004FD940;
  id v7 = v3;
  char v5 = v3;
  -[NSXPCConnection addBarrierBlock:](v5, "addBarrierBlock:", v6);
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _providerService](self, "_providerService"));
  [v5 reloadServiceBundleAtPath:v4];
}

- (id)_stopTimersWithContinuation
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3032000000LL;
  v8[3] = sub_100252698;
  void v8[4] = sub_1002526A8;
  id v9 = 0LL;
  targetQueue = (dispatch_queue_s *)self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002526B0;
  block[3] = &unk_1004FCDB0;
  void block[4] = self;
  void block[5] = v8;
  dispatch_async(targetQueue, block);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002528FC;
  v6[3] = &unk_1004FCDB0;
  void v6[4] = self;
  v6[5] = v8;
  id v4 = objc_retainBlock(v6);
  _Block_object_dispose(v8, 8);

  return v4;
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100252660;
  v12[3] = &unk_1004F7A28;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 openURL:v7 completion:v12];
}

- (void)_getLockStateWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100252600;
  v10[3] = &unk_1004FBFE8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_getCarDNDModeWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002525B0;
  v10[3] = &unk_1004FBFE8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_getStarkModeWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100252550;
  v10[3] = &unk_1004FBFE8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_getWatchAuthenticationWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100252500;
  v10[3] = &unk_1004FBFE8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10025249C;
  v15[3] = &unk_1004F7A50;
  id v16 = v11;
  id v17 = v8;
  id v13 = v8;
  id v14 = v11;
  [v12 handleCommand:v10 withExecutionContextMatchingInfo:v9 completion:v15];
}

- (void)_getTimeoutSuspendedWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADServiceConnection _stopTimersWithContinuation](self, "_stopTimersWithContinuation"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10025243C;
  v10[3] = &unk_1004FBFE8;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ADServiceConnectionDelegate)delegate
{
  return (ADServiceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end