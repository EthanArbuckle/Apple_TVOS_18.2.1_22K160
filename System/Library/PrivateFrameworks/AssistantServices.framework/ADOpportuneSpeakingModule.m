@interface ADOpportuneSpeakingModule
+ (id)sharedModule;
- (ADOpportuneSpeakingStateManager)stateManager;
- (id)_connectionToOSMService;
- (id)_init;
- (id)_remoteOSMService;
- (void)_cleanUpAllModels;
- (void)_finishRunningCurrentSpeakableWithResult:(int64_t)a3 error:(id)a4;
- (void)_loadModelWithType:(int64_t)a3 completion:(id)a4;
- (void)_processEnqueuedSpeakables;
- (void)_recordImmediateNotificationInteractionAfterRecommendation:(int64_t)a3 forSpeakable:(id)a4;
- (void)_resetConnectionToOSMService;
- (void)_withAllModelsExecute:(id)a3;
- (void)modelWithIdentifier:(id)a3 didUpdateScore:(float)a4 forSpeakable:(id)a5;
- (void)recordSpokenRequestCancelledForSpeakable:(id)a3;
- (void)recordSpokenRequestCompletedForSpeakable:(id)a3;
- (void)requestsToSpeak:(id)a3 withHandler:(id)a4;
@end

@implementation ADOpportuneSpeakingModule

- (id)_init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADOpportuneSpeakingModule;
  v2 = -[ADOpportuneSpeakingModule init](&v20, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADOpportuneSpeakingModule", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    modelLoadingGroup = v2->_modelLoadingGroup;
    v2->_modelLoadingGroup = (OS_dispatch_group *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedSpeakables = v2->_queuedSpeakables;
    v2->_queuedSpeakables = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    handlersBySpeakableID = v2->_handlersBySpeakableID;
    v2->_handlersBySpeakableID = v11;

    v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  4LL);
    modelMap = v2->_modelMap;
    v2->_modelMap = v13;

    v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  4LL);
    typeMap = v2->_typeMap;
    v2->_typeMap = v15;

    v17 = -[ADOpportuneSpeakingStateManager initWithQueue:]( objc_alloc(&OBJC_CLASS___ADOpportuneSpeakingStateManager),  "initWithQueue:",  v2->_queue);
    stateManager = v2->_stateManager;
    v2->_stateManager = v17;
  }

  return v2;
}

- (void)_finishRunningCurrentSpeakableWithResult:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  dispatch_group_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFOpportuneSpeakable speakableIdentifier](self->_currentSpeakable, "speakableIdentifier"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_handlersBySpeakableID, "objectForKey:", v7));
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, int64_t, id))(v8 + 16))(v8, a3, v6);
    -[ADOpportuneSpeakingModule _recordImmediateNotificationInteractionAfterRecommendation:forSpeakable:]( self,  "_recordImmediateNotificationInteractionAfterRecommendation:forSpeakable:",  a3,  self->_currentSpeakable);
    -[NSMutableDictionary removeObjectForKey:](self->_handlersBySpeakableID, "removeObjectForKey:", v7);
  }

  currentSpeakable = self->_currentSpeakable;
  self->_currentSpeakable = 0LL;

  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = self->_currentSpeakable;
    int v13 = 136315394;
    v14 = "-[ADOpportuneSpeakingModule _finishRunningCurrentSpeakableWithResult:error:]";
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s _currentSpeakable: %@",  (uint8_t *)&v13,  0x16u);
  }

  -[ADOpportuneSpeakingModule _processEnqueuedSpeakables](self, "_processEnqueuedSpeakables");
}

- (void)_recordImmediateNotificationInteractionAfterRecommendation:(int64_t)a3 forSpeakable:(id)a4
{
  id v6 = a4;
  dispatch_group_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 speakableDate]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:60.0]);
  if (AFIsInternalInstall(v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADOpportuneSpeakingModule _remoteOSMService](self, "_remoteOSMService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 speakableIdentifier]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100272E04;
    v11[3] = &unk_1004F8B50;
    int64_t v13 = a3;
    v11[4] = self;
    id v12 = v6;
    [v9 recordNotificationUsageForSpeakableId:v10 withStartDate:v7 withEndDate:v8 withCompletion:v11];
  }
}

- (void)_processEnqueuedSpeakables
{
  if (!self->_currentSpeakable && -[NSMutableArray count](self->_queuedSpeakables, "count"))
  {
    dispatch_queue_attr_t v3 = (AFOpportuneSpeakable *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_queuedSpeakables, "firstObject"));
    currentSpeakable = self->_currentSpeakable;
    self->_currentSpeakable = v3;

    if (AFIsInternalInstall(-[NSMutableArray removeObjectAtIndex:](self->_queuedSpeakables, "removeObjectAtIndex:", 0LL))
      && _AFPreferencesSpokenNotificationIsAlwaysOpportune())
    {
      dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[ADOpportuneSpeakingModule _processEnqueuedSpeakables]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Always Opportune: Forcing all speakables to be spoken",  buf,  0xCu);
      }

      -[ADOpportuneSpeakingModule _finishRunningCurrentSpeakableWithResult:error:]( self,  "_finishRunningCurrentSpeakableWithResult:error:",  2LL,  0LL);
    }

    else if (_AFPreferencesOpportuneSpeakingModuleEnabled())
    {
      double v6 = _AFPreferencesOpportuneSpeakingTimeout() + 1.0;
      dispatch_group_t v7 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      queue = self->_queue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100272C24;
      v12[3] = &unk_1004FD0A0;
      *(double *)&v12[5] = v6;
      v12[4] = self;
      v9 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v7,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v12,  v6);
      timer = self->_timer;
      self->_timer = v9;

      -[AFWatchdogTimer start](self->_timer, "start");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100272D0C;
      v11[3] = &unk_1004F8B78;
      v11[4] = self;
      *(double *)&void v11[5] = v6;
      -[ADOpportuneSpeakingModule _withAllModelsExecute:](self, "_withAllModelsExecute:", v11);
    }

    else
    {
      -[ADOpportuneSpeakingModule _finishRunningCurrentSpeakableWithResult:error:]( self,  "_finishRunningCurrentSpeakableWithResult:error:",  2LL,  0LL);
    }
  }

- (void)requestsToSpeak:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v10 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 speakableDescription]);
      *(_DWORD *)buf = 136315394;
      v16 = "-[ADOpportuneSpeakingModule requestsToSpeak:withHandler:]";
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100272BB4;
    block[3] = &unk_1004FD9E0;
    block[4] = self;
    id v14 = v7;
    id v13 = v6;
    dispatch_async(queue, block);
  }
}

- (void)recordSpokenRequestCancelledForSpeakable:(id)a3
{
  id v7 = a3;
  if (AFIsInternalInstall(v7))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADOpportuneSpeakingModule _remoteOSMService](self, "_remoteOSMService"));
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 speakableIdentifier]);
    [v4 recordFeedbackOfType:2 forSpeakableId:v5];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_modelMap, "objectForKey:", self->_executionModelIdentifier));
  [v6 recordFeedbackOfType:2 forSpeakable:v7];
}

- (void)recordSpokenRequestCompletedForSpeakable:(id)a3
{
  id v7 = a3;
  if (AFIsInternalInstall(v7))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADOpportuneSpeakingModule _remoteOSMService](self, "_remoteOSMService"));
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 speakableIdentifier]);
    [v4 recordFeedbackOfType:1 forSpeakableId:v5];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_modelMap, "objectForKey:", self->_executionModelIdentifier));
  [v6 recordFeedbackOfType:1 forSpeakable:v7];
}

- (void)_withAllModelsExecute:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100272A34;
    v23[3] = &unk_1004FD990;
    v23[4] = self;
    id v24 = v4;
    id v6 = objc_retainBlock(v23);
    else {
      unint64_t v7 = 1LL;
    }
    id v8 = -[NSMutableDictionary count](self->_modelMap, "count");
    if ((unint64_t)v8 >= v7)
    {
      ((void (*)(void *))v6[2])(v6);
    }

    else if (self->_modelLoading)
    {
      v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[ADOpportuneSpeakingModule _withAllModelsExecute:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Already loading models", buf, 0xCu);
      }

      dispatch_group_notify((dispatch_group_t)self->_modelLoadingGroup, (dispatch_queue_t)self->_queue, v6);
    }

    else
    {
      self->_modelLoading = 1;
      if (AFIsInternalInstall(v8))
      {
        for (uint64_t i = 1LL; i != 4; ++i)
        {
          typeMap = self->_typeMap;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", i));
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](typeMap, "objectForKey:", v12));

          if (!v13)
          {
            dispatch_group_enter((dispatch_group_t)self->_modelLoadingGroup);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_100272B88;
            v22[3] = &unk_1004FD940;
            v22[4] = self;
            -[ADOpportuneSpeakingModule _loadModelWithType:completion:](self, "_loadModelWithType:completion:", i, v22);
          }
        }
      }

      else
      {
        id v14 = self->_typeMap;
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15));

        if (!v16)
        {
          dispatch_group_enter((dispatch_group_t)self->_modelLoadingGroup);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_100272B94;
          v21[3] = &unk_1004FD940;
          v21[4] = self;
          -[ADOpportuneSpeakingModule _loadModelWithType:completion:](self, "_loadModelWithType:completion:", 1LL, v21);
        }
      }

      queue = (dispatch_queue_s *)self->_queue;
      modelLoadingGroup = self->_modelLoadingGroup;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100272BA0;
      v19[3] = &unk_1004FD990;
      v19[4] = self;
      objc_super v20 = v6;
      dispatch_group_notify((dispatch_group_t)modelLoadingGroup, queue, v19);
    }
  }
}

- (void)_loadModelWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t Description = AFOpportuneSpeakingModelTypeGetDescription(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(Description);
  v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADOpportuneSpeakingModule _loadModelWithType:completion:]";
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s loading model with type: %@", buf, 0x16u);
  }

  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1)
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[ADOpportuneSpeakingModule _loadModelWithType:completion:]";
        __int16 v22 = 2112;
        v23 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Unsupported model type: %@",  buf,  0x16u);
        if (!v6) {
          goto LABEL_8;
        }
      }

      else if (!v6)
      {
        goto LABEL_8;
      }

      v6[2](v6);
      goto LABEL_8;
    }

    queue = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002727B0;
    v14[3] = &unk_1004FB930;
    v14[4] = self;
    uint64_t v16 = 1LL;
    __int16 v15 = v6;
    dispatch_async(queue, v14);
    v11 = v15;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADOpportuneSpeakingModule _remoteOSMService](self, "_remoteOSMService"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002726E8;
    v17[3] = &unk_1004F8BC8;
    v17[4] = self;
    int64_t v19 = a3;
    v18 = v6;
    [v10 createModelWithType:a3 completion:v17];

    v11 = v18;
  }

LABEL_8:
}

- (void)_resetConnectionToOSMService
{
  dispatch_queue_attr_t v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_typeMap, "count"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_typeMap, "allKeys", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_typeMap, "objectForKey:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_modelMap, "objectForKey:", v10));
        id v12 = (char *)[v9 integerValue];
        if ((unint64_t)(v12 - 2) >= 2)
        {
        }

        else
        {
          [v11 stop];
          -[NSMutableDictionary removeObjectForKey:](self->_modelMap, "removeObjectForKey:", v10);
          if (self->_executionModelIdentifier == v10)
          {
            self->_executionModelIdentifier = 0LL;

            self->_executionModelType = 0LL;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  typeMap = self->_typeMap;
  self->_typeMap = v3;
  id v14 = v3;

  self->_modelLoading = 0;
  connection = self->_connection;
  self->_connection = 0LL;
}

- (void)_cleanUpAllModels
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_modelMap, "allValues", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v7) stop];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  id v8 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 4LL);
  modelMap = self->_modelMap;
  self->_modelMap = v8;

  v10 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  4LL);
  typeMap = self->_typeMap;
  self->_typeMap = v10;

  self->_modelLoading = 0;
  executionModelIdentifier = self->_executionModelIdentifier;
  self->_executionModelIdentifier = 0LL;

  self->_executionModelType = 0LL;
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0LL;
}

- (id)_connectionToOSMService
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.siri.OpportuneSpeakingModelService");
    id v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    uint64_t v7 = AFOpportuneSpeakingModelServiceInterface();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v8);

    objc_initWeak(&location, self);
    v9 = self->_connection;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10027256C;
    v14[3] = &unk_1004FAF58;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v14);
    v10 = self->_connection;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10027262C;
    v12[3] = &unk_1004FAF58;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (id)_remoteOSMService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADOpportuneSpeakingModule _connectionToOSMService](self, "_connectionToOSMService"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:&stru_1004F8BE8]);

  return v3;
}

- (void)modelWithIdentifier:(id)a3 didUpdateScore:(float)a4 forSpeakable:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    __int128 v14 = v10;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 speakableDescription]);
    *(_DWORD *)buf = 136315906;
    __int16 v22 = "-[ADOpportuneSpeakingModule modelWithIdentifier:didUpdateScore:forSpeakable:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2048;
    double v26 = a4;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s model with identifier %@ returned score: %f speakable: %@",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10027234C;
  v16[3] = &unk_1004FAE98;
  id v17 = v9;
  __int128 v18 = self;
  float v20 = a4;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v16);
}

- (ADOpportuneSpeakingStateManager)stateManager
{
  return self->_stateManager;
}

- (void).cxx_destruct
{
}

+ (id)sharedModule
{
  if (qword_1005782E8 != -1) {
    dispatch_once(&qword_1005782E8, &stru_1004F8B28);
  }
  return (id)qword_1005782F0;
}

@end