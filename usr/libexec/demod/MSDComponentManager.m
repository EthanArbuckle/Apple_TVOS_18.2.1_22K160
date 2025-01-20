@interface MSDComponentManager
- (BOOL)parallelProcessing;
- (BOOL)result;
- (BOOL)waitForProcessingCompletionTillDate:(id)a3 outError:(id *)a4;
- (MSDComponentManager)initWithComponents:(id)a3 andProcessor:(id)a4;
- (MSDComponentProcessor)componentProcessor;
- (NSError)error;
- (NSMutableArray)activeComponents;
- (NSMutableArray)pendingComponents;
- (NSMutableArray)removableComponents;
- (NSMutableArray)retryableComponents;
- (os_unfair_lock_s)componentListLock;
- (unint64_t)_calculateFreeSpaceToReserve:(unint64_t)a3;
- (void)_cancelAllOperations;
- (void)_dispatchComponent:(id)a3;
- (void)_dispatchNextComponent;
- (void)_enforceFreeDiskSpaceRequirement;
- (void)_handleCompleteComponent:(id)a3;
- (void)_handleNewOperationStagedForComponent:(id)a3;
- (void)_handleRetryComponent:(id)a3 forComponent:(id)a4;
- (void)_postCompletionNotificationWithResult:(BOOL)a3 andError:(id)a4;
- (void)_setupInterComponentDependencyOnRetry:(BOOL)a3;
- (void)_startProcessingComponentsOnRetry:(BOOL)a3;
- (void)abortProcessing;
- (void)component:(id)a3 didProduceClonedComponent:(id)a4;
- (void)componentDidHaveNewOperationStaged:(id)a3;
- (void)pauseProcessing;
- (void)resumeProcessing;
- (void)setActiveComponents:(id)a3;
- (void)setComponentListLock:(os_unfair_lock_s)a3;
- (void)setComponentProcessor:(id)a3;
- (void)setParallelProcessing:(BOOL)a3;
- (void)setPendingComponents:(id)a3;
- (void)setRemovableComponents:(id)a3;
- (void)setRetryableComponents:(id)a3;
- (void)startProcessingAllComponents;
@end

@implementation MSDComponentManager

- (MSDComponentManager)initWithComponents:(id)a3 andProcessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MSDComponentManager;
  v8 = -[MSDComponentManager init](&v31, "init");
  if (v8)
  {
    v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    -[MSDComponentManager setActiveComponents:](v8, "setActiveComponents:", v9);

    v10 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    -[MSDComponentManager setRetryableComponents:](v8, "setRetryableComponents:", v10);

    v11 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
    -[MSDComponentManager setRemovableComponents:](v8, "setRemovableComponents:", v11);

    id v12 = [v6 mutableCopy];
    -[MSDComponentManager setPendingComponents:](v8, "setPendingComponents:", v12);

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 reverseObjectEnumerator]);
    id v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v27 + 1) + 8 * (void)v17) createRemovableCounterpartComponent]);
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](v8, "removableComponents"));
            [v19 addObject:v18];
          }

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v15);
    }

    -[MSDComponentManager setComponentProcessor:](v8, "setComponentProcessor:", v7);
    -[MSDComponentManager setComponentListLock:](v8, "setComponentListLock:", 0LL);
    if (os_variant_has_internal_content("com.apple.mobilestoredemod")
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance")),
          unsigned int v21 = [v20 disableParallelProcessing],
          v20,
          v21))
    {
      id v22 = sub_10003A95C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Disabling parallel processing as requested.",  v26,  2u);
      }

      uint64_t v24 = 0LL;
    }

    else
    {
      uint64_t v24 = 1LL;
    }

    -[MSDComponentManager setParallelProcessing:](v8, "setParallelProcessing:", v24);
  }

  return v8;
}

- (void)startProcessingAllComponents
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[MSDComponentManager startProcessingAllComponents]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v7, 0xCu);
  }

  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  -[MSDComponentManager _enforceFreeDiskSpaceRequirement](self, "_enforceFreeDiskSpaceRequirement");
  -[MSDComponentManager _startProcessingComponentsOnRetry:](self, "_startProcessingComponentsOnRetry:", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v6 resume];

  os_unfair_lock_unlock(p_componentListLock);
}

- (BOOL)waitForProcessingCompletionTillDate:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_100080D90;
  v40 = sub_100080DA0;
  id v41 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  id v8 = sub_10003A95C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
    __int16 v44 = 2114;
    id v45 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: entered with deadline %{public}@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  BOOL v11 = [v10 count] == 0;

  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100080DA8;
    v28[3] = &unk_1000FA978;
    __int128 v30 = &v32;
    objc_super v31 = &v36;
    id v14 = v7;
    __int128 v29 = v14;
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"MSDComponentManagerComplete" object:0 queue:v13 usingBlock:v28]);

    if (v6)
    {
      [v6 timeIntervalSinceNow];
      dispatch_time_t v17 = dispatch_time(0LL, (uint64_t)(v16 * 1000000000.0));
      if (dispatch_semaphore_wait(v14, v17))
      {
        id v18 = sub_10003A95C();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for processing of all components to complete.",  buf,  2u);
        }

        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741184LL,  @"Cannot finish update within given time."));
        unsigned int v21 = (void *)v37[5];
        v37[5] = v20;

        -[MSDComponentManager _cancelAllOperations](self, "_cancelAllOperations");
      }

      if (!a4)
      {
LABEL_10:
        if (!v15) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }

    else
    {
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      if (!a4) {
        goto LABEL_10;
      }
    }

    *a4 = (id) v37[5];
    if (!v15)
    {
LABEL_18:
      id v25 = sub_10003A95C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
      }

      BOOL v23 = *((_BYTE *)v33 + 24) != 0;
      goto LABEL_21;
    }

- (void)pauseProcessing
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    dispatch_semaphore_t v7 = "-[MSDComponentManager pauseProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v5 suspend];
}

- (void)resumeProcessing
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    dispatch_semaphore_t v7 = "-[MSDComponentManager resumeProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v5 resume];
}

- (void)abortProcessing
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741185LL,  @"Operation canceled."));
  id v4 = sub_10003A95C();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    dispatch_semaphore_t v7 = "-[MSDComponentManager abortProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v6, 0xCu);
  }

  -[MSDComponentManager _cancelAllOperations](self, "_cancelAllOperations");
  -[MSDComponentManager _postCompletionNotificationWithResult:andError:]( self,  "_postCompletionNotificationWithResult:andError:",  0LL,  v3);
}

- (void)_startProcessingComponentsOnRetry:(BOOL)a3
{
  if (-[MSDComponentManager parallelProcessing](self, "parallelProcessing"))
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents", 0LL));
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[MSDComponentManager _dispatchComponent:]( self,  "_dispatchComponent:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v6);
    }
  }

  else
  {
    -[MSDComponentManager _dispatchNextComponent](self, "_dispatchNextComponent");
  }

- (void)_cancelAllOperations
{
  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  [v4 removeAllObjects];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  [v5 removeAllObjects];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
  [v6 removeAllObjects];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
  [v7 removeAllObjects];

  os_unfair_lock_unlock(p_componentListLock);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v8 cancel];
}

- (void)_dispatchNextComponent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  if (v4)
  {
    id v5 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      int v8 = 138543362;
      __int128 v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dispatching component %{public}@ ...",  (uint8_t *)&v8,  0xCu);
    }

    -[MSDComponentManager _dispatchComponent:](self, "_dispatchComponent:", v4);
  }
}

- (void)_postCompletionNotificationWithResult:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v5 setObject:v6 forKey:@"Result"];

  if (v8) {
    [v5 setObject:v8 forKey:@"Error"];
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:@"MSDComponentManagerComplete" object:0 userInfo:v5];
}

- (void)_dispatchComponent:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self];
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v5 process:v4];
}

- (void)_handleNewOperationStagedForComponent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "New operation staged for component: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  [v7 process:v4];
}

- (void)_handleCompleteComponent:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543362;
    id v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "All operations complete for component: %{public}@",  (uint8_t *)&v24,  0xCu);
  }

  os_unfair_lock_lock(&self->_componentListLock);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  [v7 removeObject:v4];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  id v9 = [v8 count];

  if (v9)
  {
    if (!-[MSDComponentManager parallelProcessing](self, "parallelProcessing")) {
      -[MSDComponentManager _dispatchNextComponent](self, "_dispatchNextComponent");
    }
    goto LABEL_15;
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Processing retryable components...",  (uint8_t *)&v24,  2u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
    [v14 addObjectsFromArray:v15];

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
    [v16 removeAllObjects];

    dispatch_time_t v17 = self;
    uint64_t v18 = 1LL;
LABEL_14:
    -[MSDComponentManager _startProcessingComponentsOnRetry:](v17, "_startProcessingComponentsOnRetry:", v18);
    goto LABEL_15;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
  id v20 = [v19 count];

  id v21 = sub_10003A95C();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v23)
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Processing pending components...",  (uint8_t *)&v24,  2u);
    }

    -[MSDComponentManager _enforceFreeDiskSpaceRequirement](self, "_enforceFreeDiskSpaceRequirement");
    dispatch_time_t v17 = self;
    uint64_t v18 = 0LL;
    goto LABEL_14;
  }

  if (v23)
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "All components complete!", (uint8_t *)&v24, 2u);
  }

  -[MSDComponentManager _postCompletionNotificationWithResult:andError:]( self,  "_postCompletionNotificationWithResult:andError:",  1LL,  0LL);
LABEL_15:
  os_unfair_lock_unlock(&self->_componentListLock);
}

- (void)_handleRetryComponent:(id)a3 forComponent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003A95C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10009F780((uint64_t)v6, v9);
  }

  os_unfair_lock_lock(&self->_componentListLock);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  [v10 addObject:v6];

  os_unfair_lock_unlock(&self->_componentListLock);
  -[MSDComponentManager _handleCompleteComponent:](self, "_handleCompleteComponent:", v7);
}

- (void)_enforceFreeDiskSpaceRequirement
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v5 = [v4 getFreeSpace];

  unint64_t v6 = -[MSDComponentManager _calculateFreeSpaceToReserve:](self, "_calculateFreeSpaceToReserve:", v5);
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v43 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Trying to enforce free disk space requirement:  %{iec-bytes}llu",  buf,  0xCu);
  }

  *(void *)&__int128 v9 = 138543362LL;
  __int128 v36 = v9;
  v37 = self;
  while (1)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents", v36));
    id v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v39;
      while (2)
      {
        id v14 = 0LL;
        id v15 = v5;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          double v16 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v14);
          dispatch_time_t v17 = [v16 diskSpaceRequired];
          id v18 = sub_10003A95C();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            unint64_t v43 = (unint64_t)v16;
            __int16 v44 = 2048;
            id v45 = v17;
            __int16 v46 = 2048;
            v47 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Free space needed=%{iec-bytes}llu, Free space left=%{iec-bytes}llu",  buf,  0x20u);
          }

          BOOL v20 = v15 >= v17;
          id v5 = (_BYTE *)(v15 - v17);
          if (v5 == 0LL || !v20 || (unint64_t)v5 <= v6)
          {
            id v21 = sub_10003A95C();
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v36;
              unint64_t v43 = (unint64_t)v16;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Not enough free space left for this component.",  buf,  0xCu);
            }

            id v5 = v15;
            self = v37;
            goto LABEL_20;
          }

          -[NSMutableArray addObject:](v3, "addObject:", v16);
          id v14 = (char *)v14 + 1;
          id v15 = v5;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
        self = v37;
        if (v12) {
          continue;
        }
        break;
      }
    }

- (unint64_t)_calculateFreeSpaceToReserve:(unint64_t)a3
{
  id v4 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMGQDiskUsageAmountDataReserved]);
  unint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = (unint64_t)[v5 unsignedLongLongValue];
  }

  else
  {
    id v8 = sub_10003A95C();
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10009F7F4(v9);
    }

    unint64_t v7 = 5 * a3 / 0x64;
  }

  return v7;
}

- (void)_setupInterComponentDependencyOnRetry:(BOOL)a3
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100080D90;
  v10[4] = sub_100080DA0;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3032000000LL;
  v8[3] = sub_100080D90;
  v8[4] = sub_100080DA0;
  id v9 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100081F8C;
  v6[3] = &unk_1000FA9A0;
  BOOL v7 = a3;
  v6[4] = v8;
  v6[5] = v10;
  [v5 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
}

- (void)component:(id)a3 didProduceClonedComponent:(id)a4
{
}

- (void)componentDidHaveNewOperationStaged:(id)a3
{
}

- (BOOL)result
{
  return self->_result;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMutableArray)activeComponents
{
  return self->_activeComponents;
}

- (void)setActiveComponents:(id)a3
{
}

- (NSMutableArray)retryableComponents
{
  return self->_retryableComponents;
}

- (void)setRetryableComponents:(id)a3
{
}

- (NSMutableArray)removableComponents
{
  return self->_removableComponents;
}

- (void)setRemovableComponents:(id)a3
{
}

- (NSMutableArray)pendingComponents
{
  return self->_pendingComponents;
}

- (void)setPendingComponents:(id)a3
{
}

- (MSDComponentProcessor)componentProcessor
{
  return self->_componentProcessor;
}

- (void)setComponentProcessor:(id)a3
{
}

- (os_unfair_lock_s)componentListLock
{
  return self->_componentListLock;
}

- (void)setComponentListLock:(os_unfair_lock_s)a3
{
  self->_componentListLock = a3;
}

- (BOOL)parallelProcessing
{
  return self->_parallelProcessing;
}

- (void)setParallelProcessing:(BOOL)a3
{
  self->_parallelProcessing = a3;
}

- (void).cxx_destruct
{
}

@end