@interface ASServiceClient
- (ASServiceClient)initWithConnection:(id)a3 servicesMonitor:(id)a4;
- (BOOL)_classInstancesSufficientlyRespondToSyncSelectors:(Class)a3;
- (BOOL)sendSyncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8;
- (id)_providerServiceDelegateWithErrorHandler:(id)a3;
- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3;
- (void)barrierWithCompletion:(id)a3;
- (void)beginSyncForServicePath:(id)a3 className:(id)a4 requestUUID:(id)a5 info:(id)a6 reply:(id)a7;
- (void)clearDomainObjectsForServicePath:(id)a3 className:(id)a4;
- (void)doCommandForServicePath:(id)a3 className:(id)a4 infoDictionary:(id)a5 executionInfo:(id)a6 reply:(id)a7;
- (void)fetchCurrentSyncSnapshotForServicePath:(id)a3 className:(id)a4 key:(id)a5 completion:(id)a6;
- (void)preheatBundleForServicePath:(id)a3;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)runMaintenanceWorkForServicePath:(id)a3 className:(id)a4 completion:(id)a5;
- (void)serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:(id)a3 reply:(id)a4;
@end

@implementation ASServiceClient

- (ASServiceClient)initWithConnection:(id)a3 servicesMonitor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ASServiceClient;
  v6 = -[ASServiceClient init](&v11, "init");
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v6->_connection, v7);

    id v8 = objc_loadWeakRetained(&v12);
    objc_storeWeak((id *)&v6->_servicesMonitor, v8);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_servicesMonitor);
    [WeakRetained setDelegate:v6];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_providerServiceDelegateWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (!WeakRetained)
  {
    id v8 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[ASServiceClient _providerServiceDelegateWithErrorHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Connection to assistantd already dropped",  buf,  0xCu);
      if (v4) {
        goto LABEL_5;
      }
    }

    else if (v4)
    {
LABEL_5:
      id v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  23LL,  @"Connection to assistantd already dropped."));
      v4[2](v4, v7);
      v6 = 0LL;
      goto LABEL_6;
    }

    v6 = 0LL;
    goto LABEL_7;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000D374;
  v10[3] = &unk_100014528;
  objc_super v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxyWithErrorHandler:v10]);
  id v7 = v11;
LABEL_6:

LABEL_7:
  return v6;
}

- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (!WeakRetained)
  {
    id v8 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[ASServiceClient _synchronousProviderServiceDelegateWithErrorHandler:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Connection to assistantd already dropped",  buf,  0xCu);
      if (v4) {
        goto LABEL_5;
      }
    }

    else if (v4)
    {
LABEL_5:
      id v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  23LL,  @"Connection to assistantd already dropped."));
      v4[2](v4, v7);
      v6 = 0LL;
      goto LABEL_6;
    }

    v6 = 0LL;
    goto LABEL_7;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000D294;
  v10[3] = &unk_100014528;
  objc_super v11 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained synchronousRemoteObjectProxyWithErrorHandler:v10]);
  id v7 = v11;
LABEL_6:

LABEL_7:
  return v6;
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000D280;
  v7[3] = &unk_100014550;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained addBarrierBlock:v7];
}

- (void)doCommandForServicePath:(id)a3 className:(id)a4 infoDictionary:(id)a5 executionInfo:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v17 logEventWithType:4004 context:0];

  kdebug_trace(722470228LL, 0LL, 0LL, 0LL, 0LL);
  v18 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v42 = "-[ASServiceClient doCommandForServicePath:className:infoDictionary:executionInfo:reply:]";
    __int16 v43 = 2112;
    id v44 = v14;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 2112;
    id v48 = v12;
    __int16 v49 = 2112;
    id v50 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Connection got message %@ for command %@. (bundle = %@, executionInfo = %@)",  buf,  0x34u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  v20 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained keepAliveWithReplyHandler:v16]);
  v21 = v20;
  if (!v20) {
    v20 = v16;
  }
  id v22 = objc_retainBlock(v20);

  v23 = sub_1000094BC(v12, 33);
  v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
  v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  v33 = sub_10000A614;
  v34 = &unk_1000145A0;
  id v35 = v13;
  id v36 = v12;
  id v37 = v14;
  id v38 = v15;
  v39 = self;
  id v40 = v22;
  id v25 = v22;
  id v26 = v15;
  id v27 = v14;
  id v28 = v12;
  id v29 = v13;
  dispatch_async(v24, &v31);

  kdebug_trace(722470236LL, 0LL, 0LL, 0LL, 0LL);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics", v31, v32, v33, v34));
  [v30 logEventWithType:4006 context:0];
}

- (void)beginSyncForServicePath:(id)a3 className:(id)a4 requestUUID:(id)a5 info:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v36 = "-[ASServiceClient beginSyncForServicePath:className:requestUUID:info:reply:]";
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Beginning sync for path %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  v19 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained startWatchdogForPluginAtPath:v12 syncClassName:v13 completion:v16]);
  v20 = v19;
  if (!v19) {
    v19 = v16;
  }
  id v21 = objc_retainBlock(v19);

  id v22 = sub_1000094BC(v12, 17);
  v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000A478;
  v29[3] = &unk_1000145A0;
  v29[4] = self;
  id v30 = v13;
  id v31 = v12;
  id v32 = v15;
  id v33 = v14;
  id v34 = v21;
  id v24 = v21;
  id v25 = v14;
  id v26 = v15;
  id v27 = v12;
  id v28 = v13;
  dispatch_async(v23, v29);
}

- (void)runMaintenanceWorkForServicePath:(id)a3 className:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[ASServiceClient runMaintenanceWorkForServicePath:className:completion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (qword_10001AA58 != -1) {
    dispatch_once(&qword_10001AA58, &stru_1000145E0);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained startWatchdogForPluginAtPath:v8 syncClassName:v9 completion:v10]);
  id v14 = v13;
  if (!v13) {
    id v13 = v10;
  }
  id v15 = objc_retainBlock(v13);

  id v16 = (dispatch_queue_s *)qword_10001AA50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A32C;
  block[3] = &unk_100014630;
  id v21 = v9;
  id v22 = v8;
  id v23 = v15;
  id v17 = v15;
  id v18 = v8;
  id v19 = v9;
  dispatch_async(v16, block);
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ASServiceClient reloadServiceBundleAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  [WeakRetained reloadServiceBundleAtPath:v4];
}

- (void)fetchCurrentSyncSnapshotForServicePath:(id)a3 className:(id)a4 key:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = v13;
    id v15 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[ASServiceClient fetchCurrentSyncSnapshotForServicePath:className:key:completion:]";
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Fetching current sync for path %@",  buf,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained startWatchdogForPluginAtPath:v10 syncClassName:v11 syncSnapshotCompletion:v14]);
    id v18 = v17;
    if (!v17) {
      id v17 = v14;
    }
    id v19 = objc_retainBlock(v17);

    v20 = sub_1000094BC(v10, 17);
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000A17C;
    block[3] = &unk_100014658;
    void block[4] = self;
    id v24 = v11;
    id v25 = v10;
    id v26 = v12;
    id v27 = v19;
    id v22 = v19;
    dispatch_async(v21, block);
  }
}

- (BOOL)_classInstancesSufficientlyRespondToSyncSelectors:(Class)a3
{
  if ((-[objc_class instancesRespondToSelector:]( a3,  "instancesRespondToSelector:",  "beginSyncWithAnchor:validity:count:forKey:beginInfo:") & 1) != 0 || (-[objc_class instancesRespondToSelector:]( a3,  "instancesRespondToSelector:",  "beginSyncWithAnchor:validity:forKey:beginInfo:") & 1) != 0 || (-[objc_class instancesRespondToSelector:]( a3,  "instancesRespondToSelector:",  "beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:") & 1) != 0 || (unsigned int v4 = -[objc_class instancesRespondToSelector:]( a3,  "instancesRespondToSelector:",  "beginSyncWithInfo:configuration:")) != 0)
  {
    LOBYTE(v4) = -[objc_class instancesRespondToSelector:]( a3,  "instancesRespondToSelector:",  "getChangeAfterAnchor:changeInfo:");
  }

  return v4;
}

- (void)clearDomainObjectsForServicePath:(id)a3 className:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    unsigned int v20 = 136315394;
    id v21 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Clearing domain objects for service path %@",  (uint8_t *)&v20,  0x16u);
  }

  id v8 = sub_100009B84(v6, v5);
  if (!v8)
  {
    id v15 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      unsigned int v20 = 136315650;
      id v21 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s No clearing class with name %{public}@ at path %{public}@",  (uint8_t *)&v20,  0x20u);
    }

    goto LABEL_15;
  }

  id v9 = v8;
  unsigned int v20 = 0;
  id v10 = protocol_copyMethodDescriptionList((Protocol *)&OBJC_PROTOCOL___AFDomainObjectClearing, 1, 1, &v20);
  if (!v10)
  {
LABEL_10:
    id v14 = objc_alloc_init(v9);
    [v14 clearAceDomainObjects];

    goto LABEL_15;
  }

  id v11 = v10;
  if (!v20)
  {
LABEL_9:
    free(v11);
    goto LABEL_10;
  }

  unint64_t v12 = 0LL;
  id v13 = v10;
  while ((-[objc_class instancesRespondToSelector:](v9, "instancesRespondToSelector:", v13->name) & 1) != 0)
  {
    ++v12;
    ++v13;
    if (v12 >= v20) {
      goto LABEL_9;
    }
  }

  free(v11);
  id v16 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    id v17 = v16;
    id v18 = NSStringFromClass(v9);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    unsigned int v20 = 136315394;
    id v21 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
    __int16 v22 = 2114;
    id v23 = v19;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Class %{public}@ doesn't conform to AFDomainObjectClearing",  (uint8_t *)&v20,  0x16u);
  }

- (void)preheatBundleForServicePath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ASServiceClient preheatBundleForServicePath:]";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Preheating bundle at path %@", buf, 0x16u);
  }

  if ((sub_100009444(v3) & 1) != 0)
  {
    id v5 = sub_1000094BC(v3, 33);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000095DC;
    block[3] = &unk_1000146A8;
    id v9 = v3;
    dispatch_async(v6, block);
  }

  else
  {
    int v7 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[ASServiceClient preheatBundleForServicePath:]";
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Path is %{public}@ is not allowed",  buf,  0x16u);
    }
  }
}

- (void).cxx_destruct
{
}

- (BOOL)sendSyncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000D5D0;
  v23[3] = &unk_100014870;
  v23[4] = &v24;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[ASServiceClient _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  v23));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000D5E4;
  v22[3] = &unk_100014710;
  v22[4] = &v24;
  [v20 syncChunksWithPreAnchor:v14 postAnchor:v15 updates:v16 deletes:v17 validity:v18 forRequestUUID:v19 reply:v22];

  LOBYTE(v20) = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)v20;
}

- (void)serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:(id)a3 reply:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[ASServiceClient _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  &stru_100014890));
  [v7 assistantServiceWillCrashForStuckSyncPluginAtPath:v6];

  -[ASServiceClient barrierWithCompletion:](self, "barrierWithCompletion:", v8);
}

@end