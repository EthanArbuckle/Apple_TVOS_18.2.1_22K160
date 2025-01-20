@interface CPLEngineWrapperArray
+ (double)timeToWaitForRegisteredWrapper;
+ (void)setTimeToWaitForRegisteredWrapper:(double)a3;
- (BOOL)_autoCloseOneWrapper;
- (BOOL)_autoCloseWrapper:(id)a3;
- (BOOL)_canAutoCloseWrapper:(id)a3;
- (BOOL)_canReallyOpenWrapper:(id)a3 error:(id *)a4;
- (BOOL)_shouldAutoOpenWrapper:(id)a3 error:(id *)a4;
- (BOOL)isWrapperOpened:(id)a3;
- (CPLConfigurationDictionary)mostRecentConfigurationDictionary;
- (CPLConfigurationDictionary)oldestConfigurationDictionary;
- (CPLEngineParametersStorage)parametersStorage;
- (CPLEngineWrapperArray)initWithParametersStorage:(id)a3 queue:(id)a4;
- (CPLEngineWrapperArrayDelegate)delegate;
- (NSArray)registeredLibraryIdentifiers;
- (NSArray)wrapperStatuses;
- (OS_dispatch_queue)queue;
- (id)_instantiateWrapperWithParameters:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5;
- (id)_loadWrapperWithIdentifier:(id)a3 error:(id *)a4;
- (id)_wrappersLibraryIdentifierEnumerator;
- (id)openedWrapperWithLibraryIdentifier:(id)a3;
- (id)registeredWrapperCreateIfNecessaryWithParameters:(id)a3 error:(id *)a4;
- (id)registeredWrapperWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)_countOfUltimatelyOpenedWrappers;
- (unint64_t)count;
- (unint64_t)unopenedCount;
- (void)_addEngineWrapperOpenObserver:(id)a3 withIdentifier:(id)a4;
- (void)_callStopAllBlocks;
- (void)_dropWrapper:(id)a3;
- (void)_executeMaintenanceWithEnumerator:(id)a3 progress:(id)a4 completionHandler:(id)a5;
- (void)_forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 enumerator:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (void)_registerOpenError:(id)a3 forWrapper:(id)a4;
- (void)_removeEngineWrapperOpenObserverWithIdentifier:(id)a3;
- (void)cancelConfigurationDictionariesRefresh;
- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5;
- (void)emergencyStop;
- (void)enumerateOpenedWrappersWithBlock:(id)a3;
- (void)enumerateWrappersWithBlock:(id)a3;
- (void)executeMaintenanceWithCompletionHandler:(id)a3;
- (void)executePeriodicUploadOfComputeStatesWithCompletionHandler:(id)a3;
- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5;
- (void)loadRegisteredWrappers;
- (void)refreshAllConfigurationDictionaries;
- (void)refreshAllConfigurationDictionariesWithCompletionHandler:(id)a3;
- (void)requestRegisteredWrapperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stopAllWithCompletionHandler:(id)a3;
- (void)wipeEnginesIfNecessary;
- (void)wrapper:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)wrapper:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)wrapper:(id)a3 libraryDidOpenWithError:(id)a4;
- (void)wrapperDidCompleteInitialSyncOfMainScope:(id)a3;
- (void)wrapperEmergencyExit:(id)a3;
- (void)wrapperLibraryDidClose:(id)a3;
- (void)wrapperNeedsInitialDownloadOfMainScope:(id)a3;
- (void)wrapperShouldBeDropped:(id)a3;
@end

@implementation CPLEngineWrapperArray

+ (double)timeToWaitForRegisteredWrapper
{
  return *(double *)&qword_10028FC50;
}

+ (void)setTimeToWaitForRegisteredWrapper:(double)a3
{
  qword_10028FC50 = *(void *)&a3;
}

- (CPLEngineWrapperArray)initWithParametersStorage:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLEngineWrapperArray;
  v9 = -[CPLEngineWrapperArray init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parametersStorage, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    wrappers = v10->_wrappers;
    v10->_wrappers = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unopenedWrappers = v10->_unopenedWrappers;
    v10->_unopenedWrappers = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    autoClosingWrappers = v10->_autoClosingWrappers;
    v10->_autoClosingWrappers = v15;
  }

  return v10;
}

- (void)loadRegisteredWrappers
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParametersStorage allDefinedParameters](self->_parametersStorage, "allDefinedParameters"));
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v14 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)i), "libraryIdentifier", v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray _loadWrapperWithIdentifier:error:]( self,  "_loadWrapperWithIdentifier:error:",  v9,  0LL));

        if (v10) {
          BOOL v11 = _CPLSilentLogging == 0;
        }
        else {
          BOOL v11 = 0;
        }
        if (v11)
        {
          id v12 = sub_1000109E4();
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found %@ at launch", buf, 0xCu);
          }
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v6);
  }
}

- (BOOL)_shouldAutoOpenWrapper:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryIdentifier]);
  unsigned __int8 v7 = [v6 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if ((v7 & 1) != 0) {
    return 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v10 = [v9 BOOLForKey:@"CPLDontAutoOpenAppLibraries"];

  if (v10)
  {
    if (a4)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors libraryDoesNotAutoOpenError](&OBJC_CLASS___CPLErrors, "libraryDoesNotAutoOpenError"));
LABEL_9:
      id v12 = v11;
      BOOL result = 0;
      *a4 = v12;
      return result;
    }
  }

  else
  {
    if (a4)
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors tooManyOpenedEnginesError](&OBJC_CLASS___CPLErrors, "tooManyOpenedEnginesError"));
      goto LABEL_9;
    }
  }

  return 0;
}

- (BOOL)_canAutoCloseWrapper:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryIdentifier]);
  char v4 = [v3 isEqualToString:CPLLibraryIdentifierSystemLibrary] ^ 1;

  return v4;
}

- (BOOL)_autoCloseWrapper:(id)a3
{
  id v4 = a3;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_autoClosingWrappers,  "objectForKeyedSubscript:",  v5));
  if (v6)
  {
  }

  else if (-[CPLEngineWrapperArray _canAutoCloseWrapper:](self, "_canAutoCloseWrapper:", v4))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapperArray delegate](self, "delegate"));
    id v8 = [v7 wrapperArray:self countOfClientsForWrapper:v4];

    if (!v8)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_autoClosingWrappers,  "setObject:forKeyedSubscript:",  v4,  v5);
      [v4 stop];
      BOOL v9 = 1;
      goto LABEL_6;
    }
  }

  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)_autoCloseOneWrapper
{
  uint64_t v6 = 0LL;
  unsigned __int8 v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  wrappers = self->_wrappers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010CB0;
  v5[3] = &unk_10023E4C8;
  v5[4] = self;
  v5[5] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](wrappers, "enumerateKeysAndObjectsUsingBlock:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_canReallyOpenWrapper:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryIdentifier]);
  unsigned __int8 v7 = [v6 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if ((v7 & 1) != 0) {
    return 1;
  }
  if ((unint64_t)-[NSMutableDictionary count](self->_wrappers, "count") >= 0xF)
  {
    if (!a4) {
      return 0;
    }
    goto LABEL_9;
  }

  char v9 = (char *)-[NSMutableDictionary count](self->_wrappers, "count");
  BOOL result = -[CPLEngineWrapperArray _autoCloseOneWrapper](self, "_autoCloseOneWrapper");
  if (a4 && !result)
  {
LABEL_9:
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors tooManyOpenedEnginesError]( &OBJC_CLASS___CPLErrors,  "tooManyOpenedEnginesError"));
    BOOL result = 0;
    *a4 = v10;
  }

  return result;
}

- (id)_loadWrapperWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage parametersForLibraryIdentifier:]( self->_parametersStorage,  "parametersForLibraryIdentifier:",  v6));
  if (v7)
  {
    id v15 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray _instantiateWrapperWithParameters:createIfNecessary:error:]( self,  "_instantiateWrapperWithParameters:createIfNecessary:error:",  v7,  0LL,  &v15));
    id v9 = v15;
    if (!v8)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_1000109E4();
        BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v17 = v6;
          __int16 v18 = 2112;
          id v19 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@ can't be opened: %@\nResetting stored parameters and will just wait for a client to connect",  buf,  0x16u);
        }
      }

      if (a4) {
        *a4 = v9;
      }
      -[CPLEngineParametersStorage removeParametersWithLibraryIdentifier:error:]( self->_parametersStorage,  "removeParametersWithLibraryIdentifier:error:",  v6,  0LL);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000109E4();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}@ has not been configured yet",  buf,  0xCu);
      }
    }

    uint64_t v8 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2006LL,  @"%@ has not been configured yet",  v6));
    }
  }

  return v8;
}

- (id)_instantiateWrapperWithParameters:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    queue = self->_queue;
    id v49 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained wrapperArray:self engineWrapperWithParameters:v8 createIfNecessary:v6 queue:queue error:&v49]);
    id v13 = v49;
    if (v12)
    {
      if (!v6)
      {
        [v12 setDelegate:self];
        id v47 = 0LL;
        int v21 = -[CPLEngineWrapperArray _shouldAutoOpenWrapper:error:](self, "_shouldAutoOpenWrapper:error:", v12, &v47);
        id v17 = v47;
        if ((v21 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            id v29 = sub_1000109E4();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedDescription]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@ will not open automatically: %@",  buf,  0x16u);
            }
          }

          v32 = self->_queue;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_1000114D0;
          v44[3] = &unk_10023DE80;
          v44[4] = self;
          id v45 = v12;
          id v17 = v17;
          id v46 = v17;
          v33 = v44;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_100015800;
          v51 = &unk_10023DBC8;
          id v52 = v33;
          v34 = v32;
          dispatch_block_t v35 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
          dispatch_async(v34, v35);

          goto LABEL_32;
        }

- (void)_callStopAllBlocks
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v3 = self->_stopAllBlocks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      unsigned __int8 v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7) + 16LL))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        unsigned __int8 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  stopAllBlocks = self->_stopAllBlocks;
  self->_stopAllBlocks = 0LL;
}

- (void)_addEngineWrapperOpenObserver:(id)a3 withIdentifier:(id)a4
{
  id v12 = a3;
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  if (!self->_openObservers)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    openObservers = self->_openObservers;
    self->_openObservers = v8;
  }

  id v10 = [v12 copy];
  id v11 = objc_retainBlock(v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_openObservers, "setObject:forKeyedSubscript:", v11, v7);
}

- (void)_removeEngineWrapperOpenObserverWithIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[NSMutableDictionary removeObjectForKey:](self->_openObservers, "removeObjectForKey:", v5);
}

- (void)stopAllWithCompletionHandler:(id)a3
{
  stopAllBlocks = self->_stopAllBlocks;
  if (stopAllBlocks)
  {
    id v4 = a3;
    id v13 = [v4 copy];

    id v5 = objc_retainBlock(v13);
    -[NSMutableArray addObject:](stopAllBlocks, "addObject:", v5);
  }

  else
  {
    id v7 = a3;
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v9 = self->_stopAllBlocks;
    self->_stopAllBlocks = v8;

    id v10 = self->_stopAllBlocks;
    id v11 = [v7 copy];

    id v12 = objc_retainBlock(v11);
    -[NSMutableArray addObject:](v10, "addObject:", v12);

    if (-[NSMutableDictionary count](self->_wrappers, "count")) {
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_wrappers,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10023E508);
    }
    else {
      -[CPLEngineWrapperArray _callStopAllBlocks](self, "_callStopAllBlocks");
    }
  }

- (void)emergencyStop
{
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_wrappers, "count");
}

- (unint64_t)_countOfUltimatelyOpenedWrappers
{
  id v4 = -[NSMutableDictionary count](self->_wrappers, "count");
  id v5 = -[NSMutableDictionary count](self->_autoClosingWrappers, "count");
  BOOL v6 = v4 >= v5;
  unint64_t result = v4 - v5;
  if (!v6) {
    sub_10018E8D4((uint64_t)a2, (uint64_t)self);
  }
  return result;
}

- (unint64_t)unopenedCount
{
  return (unint64_t)-[NSMutableDictionary count](self->_unopenedWrappers, "count");
}

- (NSArray)registeredLibraryIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_wrappers, "allKeys"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortedArrayUsingComparator:&stru_10023E568]);

  return (NSArray *)v3;
}

- (id)registeredWrapperCreateIfNecessaryWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_previousOpenErrors,  "objectForKeyedSubscript:",  v7));
  __int128 v9 = v8;
  if (v8 && ([v8 shouldTryReopening] & 1) == 0)
  {
    if (!a4)
    {
LABEL_14:
      id v11 = 0LL;
      goto LABEL_32;
    }

    id v11 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue([v9 openError]);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v7));
    if (v10)
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 parameters]);
      unsigned __int8 v13 = [v12 matchesParameters:v6];

      if ((v13 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          id v14 = sub_1000109E4();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v33 = v6;
            __int16 v34 = 2112;
            id v35 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Trying to open engine %@ but it mismatches with parameters for %@",  buf,  0x16u);
          }
        }

        if (a4)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2005LL,  @"Incorrect parameters for %@",  v16));
        }

        goto LABEL_14;
      }
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray mostRecentConfigurationDictionary]( self,  "mostRecentConfigurationDictionary"));
      id v31 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray _instantiateWrapperWithParameters:createIfNecessary:error:]( self,  "_instantiateWrapperWithParameters:createIfNecessary:error:",  v6,  1LL,  &v31));
      id v18 = v31;
      id v19 = v18;
      if (v11)
      {
        if (!_CPLSilentLogging)
        {
          id v20 = sub_1000109E4();
          int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v33 = v11;
            __int16 v34 = 2112;
            id v35 = v6;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Created %@ for %@", buf, 0x16u);
          }
        }

        parametersStorage = self->_parametersStorage;
        id v30 = 0LL;
        unsigned __int8 v23 = -[CPLEngineParametersStorage saveParameters:error:](parametersStorage, "saveParameters:error:", v6, &v30);
        id v24 = v30;
        if ((v23 & 1) == 0 && !_CPLSilentLogging)
        {
          id v25 = sub_1000109E4();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v33 = v6;
            __int16 v34 = 2112;
            id v35 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Failed to store %@ for automatic start: %@",  buf,  0x16u);
          }
        }

        if (v17)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v11 engine]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 configuration]);
          [v28 updateConfigurationDictionary:v17];
        }

        else
        {
          -[CPLEngineWrapperArray refreshAllConfigurationDictionaries](self, "refreshAllConfigurationDictionaries");
        }
      }

      else if (a4)
      {
        *a4 = v18;
      }
    }
  }

- (id)registeredWrapperWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_previousOpenErrors,  "objectForKeyedSubscript:",  v6));
  id v8 = v7;
  if (v7)
  {
    if ([v7 shouldTryReopeningWithoutLibrary])
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 parameters]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray registeredWrapperCreateIfNecessaryWithParameters:error:]( self,  "registeredWrapperCreateIfNecessaryWithParameters:error:",  v9,  a4));
LABEL_7:

      goto LABEL_10;
    }

    id v10 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v8 openError]);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v6));
    if (!v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2006LL,  @"%@ has not been configured yet",  v6));
      __int128 v9 = v11;
      if (a4) {
        *a4 = v11;
      }
      goto LABEL_7;
    }
  }

- (id)openedWrapperWithLibraryIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v4));

    if (v6)
    {

      id v5 = 0LL;
    }
  }

  return v5;
}

- (void)enumerateWrappersWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, _BYTE *))a3;
  unsigned __int8 v16 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapperArray registeredLibraryIdentifiers](self, "registeredLibraryIdentifiers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_wrappers,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v12 + 1) + 8 * v9)));
      v4[2](v4, v10, &v16);
      int v11 = v16;

      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateOpenedWrappersWithBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012140;
  v4[3] = &unk_10023E590;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CPLEngineWrapperArray enumerateWrappersWithBlock:](v5, "enumerateWrappersWithBlock:", v4);
}

- (BOOL)isWrapperOpened:(id)a3
{
  unopenedWrappers = self->_unopenedWrappers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](unopenedWrappers, "objectForKeyedSubscript:", v4));
  LOBYTE(unopenedWrappers) = v5 == 0LL;

  return (char)unopenedWrappers;
}

- (id)_wrappersLibraryIdentifierEnumerator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapperArray registeredLibraryIdentifiers](self, "registeredLibraryIdentifiers"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectEnumerator]);

  return v3;
}

- (void)_forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 enumerator:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 nextObject]);
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v16));
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v16));

      if (!v18)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1000124E8;
        v23[3] = &unk_10023E608;
        id v24 = v17;
        BOOL v30 = v10;
        id v25 = v12;
        v26 = self;
        id v29 = v15;
        id v27 = v13;
        id v28 = v14;
        [v28 performAsCurrentWithPendingUnitCount:1 usingBlock:v23];

        goto LABEL_16;
      }

      if (!_CPLSilentLogging)
      {
        id v19 = sub_1000109E4();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Requested forced backup for %@ can't be done as it is not fully opened",  buf,  0xCu);
        }
      }

      objc_msgSend(v14, "setCompletedUnitCount:", (char *)objc_msgSend(v14, "completedUnitCount") + 1);
    }

    -[CPLEngineWrapperArray _forceBackupWithActivity:forceClientPush:enumerator:progress:completionHandler:]( self,  "_forceBackupWithActivity:forceClientPush:enumerator:progress:completionHandler:",  v12,  v10,  v13,  v14,  v15);
LABEL_16:

    goto LABEL_17;
  }

  if (!_CPLSilentLogging)
  {
    id v21 = sub_1000109E4();
    unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Finished all necessary backup activities successfully",  buf,  2u);
    }
  }

  (*((void (**)(id, void))v15 + 2))(v15, 0LL);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "totalUnitCount"));
LABEL_17:
}

- (void)forceBackupWithActivity:(id)a3 forceClientPush:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void))a5;
  if (-[NSMutableDictionary count](self->_wrappers, "count"))
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  -[NSMutableDictionary count](self->_wrappers, "count")));
    int v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray _wrappersLibraryIdentifierEnumerator]( self,  "_wrappersLibraryIdentifierEnumerator"));
    -[CPLEngineWrapperArray _forceBackupWithActivity:forceClientPush:enumerator:progress:completionHandler:]( self,  "_forceBackupWithActivity:forceClientPush:enumerator:progress:completionHandler:",  v8,  v6,  v11,  v10,  v9);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000109E4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No engine to backup - finishing backup activity immediately",  v14,  2u);
      }
    }

    v9[2](v9, 0LL);
  }
}

- (void)_executeMaintenanceWithEnumerator:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  if ([v9 isCancelled])
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000109E4();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Requested maintenance has been cancelled",  buf,  2u);
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors operationCancelledError](&OBJC_CLASS___CPLErrors, "operationCancelledError"));
    v10[2](v10, v13);
    goto LABEL_23;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v13));
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v13));

      if (!v15)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_100012C78;
        v20[3] = &unk_10023E1B0;
        id v21 = v14;
        unsigned __int8 v22 = self;
        id v23 = v8;
        id v24 = v9;
        id v25 = v10;
        [v24 performAsCurrentWithPendingUnitCount:1 usingBlock:v20];

        goto LABEL_22;
      }

      if (!_CPLSilentLogging)
      {
        id v16 = sub_1000109E4();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Requested maintenance for %@ can't be done as it is not fully opened",  buf,  0xCu);
        }
      }
    }

    objc_msgSend(v9, "setCompletedUnitCount:", (char *)objc_msgSend(v9, "completedUnitCount") + 1);
    -[CPLEngineWrapperArray _executeMaintenanceWithEnumerator:progress:completionHandler:]( self,  "_executeMaintenanceWithEnumerator:progress:completionHandler:",  v8,  v9,  v10);
LABEL_22:

    goto LABEL_23;
  }

  if (!_CPLSilentLogging)
  {
    id v18 = sub_1000109E4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Finished maintenance for all engines successfully",  buf,  2u);
    }
  }

  v10[2](v10, 0LL);
LABEL_23:
}

- (void)executeMaintenanceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000130A8;
  v14[3] = &unk_10023E630;
  v14[4] = self;
  +[CPLSimpleUpgradeHistory cleanupUnusedUpgradeHistoriesWithUsedBlock:]( &OBJC_CLASS___CPLSimpleUpgradeHistory,  "cleanupUnusedUpgradeHistoriesWithUsedBlock:",  v14);
  if (-[NSMutableDictionary count](self->_wrappers, "count"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray _wrappersLibraryIdentifierEnumerator]( self,  "_wrappersLibraryIdentifierEnumerator"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  -[NSMutableDictionary count](self->_wrappers, "count")));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100013110;
    v11[3] = &unk_10023E458;
    id v12 = v6;
    id v13 = v4;
    id v7 = v6;
    -[CPLEngineWrapperArray _executeMaintenanceWithEnumerator:progress:completionHandler:]( self,  "_executeMaintenanceWithEnumerator:progress:completionHandler:",  v5,  v7,  v11);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000109E4();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No engine to maintain - finishing system task immediately",  v10,  2u);
      }
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }
}

- (void)executePeriodicUploadOfComputeStatesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray openedWrapperWithLibraryIdentifier:]( self,  "openedWrapperWithLibraryIdentifier:",  CPLLibraryIdentifierSystemLibrary));
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 engine]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 store]);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100013258;
    v11[3] = &unk_10023E318;
    id v12 = v8;
    id v13 = v6;
    id v9 = v8;
    id v10 = [v9 performReadTransactionWithBlock:v11];
  }

  v4[2](v4, 0LL);
}

- (void)requestRegisteredWrapperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = self->_queue;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v75[0] = 0LL;
  v75[1] = v75;
  v75[2] = 0x3032000000LL;
  v75[3] = sub_1000138A8;
  v75[4] = sub_1000138B8;
  id v76 = 0LL;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_1000138C0;
  v72[3] = &unk_10023E658;
  id v11 = v8;
  v73 = v11;
  v74 = v75;
  id v12 = objc_retainBlock(v72);
  v70[0] = 0LL;
  v70[1] = v70;
  v70[2] = 0x2020000000LL;
  char v71 = 0;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_100013914;
  v62[3] = &unk_10023E680;
  id v13 = v11;
  v63 = v13;
  v69 = v70;
  id v14 = v12;
  id v67 = v14;
  id v15 = v7;
  id v68 = v15;
  id v16 = v9;
  id v64 = v16;
  v65 = self;
  id v38 = v10;
  id v66 = v38;
  id v17 = objc_retainBlock(v62);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1000139C4;
  v55[3] = &unk_10023E6D0;
  id v18 = v13;
  v56 = v18;
  v60 = v70;
  id v35 = v14;
  id v58 = v35;
  v61 = v75;
  id v19 = v6;
  id v57 = v19;
  id v20 = v17;
  id v59 = v20;
  v39 = objc_retainBlock(v55);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100013C14;
  v51[3] = &unk_10023E720;
  id v40 = v18;
  id v52 = v40;
  SEL v54 = a2;
  id v21 = v20;
  id v53 = v21;
  [v16 setCancellationHandler:v51];
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_previousOpenErrors,  "objectForKeyedSubscript:",  v19));
  if (v22
    && (id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_wrappers,  "objectForKeyedSubscript:",  v19,  v35)),  v23,  !v23))
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100013DE4;
    v48[3] = &unk_10023DFE0;
    v50 = v21;
    id v49 = v22;
    id v29 = v48;
    block = _NSConcreteStackBlock;
    uint64_t v78 = 3221225472LL;
    v79 = sub_100015800;
    v80 = &unk_10023DBC8;
    id v81 = v29;
    BOOL v30 = v40;
    dispatch_block_t v31 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v30, v31);

    id v24 = v50;
  }

  else
  {
    id v37 = v16;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_wrappers,  "objectForKeyedSubscript:",  v19,  v35));
    if (v24
      && (id v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v19)),  v25,  !v25))
    {
      id v26 = v15;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100013E2C;
      v45[3] = &unk_10023DFE0;
      id v27 = (id *)&v47;
      id v47 = v21;
      id v28 = &v46;
      id v46 = v24;
      v32 = v45;
      block = _NSConcreteStackBlock;
      uint64_t v78 = 3221225472LL;
      v79 = sub_100015800;
      v80 = &unk_10023DBC8;
      id v81 = v32;
      id v33 = v40;
      dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v33, v34);
    }

    else
    {
      ((void (*)(void))v39[2])();
      CPLRequestClient(v19);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100013E40;
      v41[3] = &unk_10023E748;
      v42 = v40;
      id v43 = v19;
      v44 = v21;
      -[CPLEngineWrapperArray _addEngineWrapperOpenObserver:withIdentifier:]( self,  "_addEngineWrapperOpenObserver:withIdentifier:",  v41,  v38);
      id v26 = v15;
      id v27 = (id *)&v42;
      id v28 = &v43;
    }

    id v15 = v26;
    id v16 = v37;
  }

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v75, 8);
}

- (void)wipeEnginesIfNecessary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  previousOpenErrors = self->_previousOpenErrors;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013F64;
  v6[3] = &unk_10023E770;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( previousOpenErrors,  "enumerateKeysAndObjectsUsingBlock:",  v6);
}

- (void)_dropWrapper:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 libraryIdentifier]);
  -[NSMutableDictionary removeObjectForKey:](self->_unopenedWrappers, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_wrappers, "removeObjectForKey:", v4);
  parametersStorage = self->_parametersStorage;
  id v10 = 0LL;
  unsigned __int8 v6 = -[CPLEngineParametersStorage removeParametersWithLibraryIdentifier:error:]( parametersStorage,  "removeParametersWithLibraryIdentifier:error:",  v4,  &v10);
  id v7 = v10;
  if ((v6 & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_1000109E4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to remove parameters for %{public}@: %@",  buf,  0x16u);
    }
  }
}

- (NSArray)wrapperStatuses
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000142A8;
  v14[3] = &unk_10023DD08;
  id v15 = self;
  id v3 =  -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[CPLEngineWrapperArray count](self, "count"));
  id v16 = v3;
  -[CPLEngineWrapperArray enumerateWrappersWithBlock:](v15, "enumerateWrappersWithBlock:", v14);
  previousOpenErrors = self->_previousOpenErrors;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_100014374;
  id v11 = &unk_10023E770;
  id v12 = self;
  __int16 v13 = v3;
  id v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( previousOpenErrors,  "enumerateKeysAndObjectsUsingBlock:",  &v8);
  id v6 = -[NSMutableArray copy](v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (CPLConfigurationDictionary)mostRecentConfigurationDictionary
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000138A8;
  uint64_t v9 = sub_1000138B8;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000144F8;
  v4[3] = &unk_10023E798;
  void v4[4] = &v5;
  -[CPLEngineWrapperArray enumerateWrappersWithBlock:](self, "enumerateWrappersWithBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLConfigurationDictionary *)v2;
}

- (CPLConfigurationDictionary)oldestConfigurationDictionary
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000138A8;
  uint64_t v9 = sub_1000138B8;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100014688;
  v4[3] = &unk_10023E798;
  void v4[4] = &v5;
  -[CPLEngineWrapperArray enumerateWrappersWithBlock:](self, "enumerateWrappersWithBlock:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CPLConfigurationDictionary *)v2;
}

- (void)refreshAllConfigurationDictionaries
{
}

- (void)refreshAllConfigurationDictionariesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained allowsConfigurationRefreshForWrapperArray:self] & 1) != 0)
  {
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray oldestConfigurationDictionary]( self,  "oldestConfigurationDictionary"));
    id v8 = v7;
    if (v7
      && ((-[dispatch_queue_s isStale](v7, "isStale") & 1) != 0
       || (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
           unsigned __int8 v10 = [v9 BOOLForKey:@"CPLAlwaysFetchConfiguration"],
           v9,
           (v10 & 1) != 0)))
    {
      configurationFetcher = self->_configurationFetcher;
      if (!configurationFetcher)
      {
        id v12 = objc_alloc(&OBJC_CLASS___CPLConfigurationFetcher);
        uint64_t v13 = _CPLConfigurationDefaultURL();
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        id v15 = -[CPLConfigurationFetcher initWithConfigurationURL:delegate:queue:]( v12,  "initWithConfigurationURL:delegate:queue:",  v14,  self,  self->_queue);
        id v16 = self->_configurationFetcher;
        self->_configurationFetcher = v15;

        configurationFetcher = self->_configurationFetcher;
      }

      -[CPLConfigurationFetcher fetchConfigurationDictionary:completionHandler:]( configurationFetcher,  "fetchConfigurationDictionary:completionHandler:",  v8,  v4);
    }

    else if (v4)
    {
      queue = self->_queue;
      block = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472LL;
      id v24 = sub_100015800;
      id v25 = &unk_10023DBC8;
      id v26 = v4;
      id v20 = queue;
      dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v20, v21);
    }

    goto LABEL_11;
  }

  if (v4)
  {
    id v17 = self->_queue;
    block = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    id v24 = sub_100015800;
    id v25 = &unk_10023DBC8;
    id v26 = v4;
    id v8 = v17;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v8, v18);

LABEL_11:
  }
}

- (void)cancelConfigurationDictionariesRefresh
{
  configurationFetcher = self->_configurationFetcher;
  self->_configurationFetcher = 0LL;
}

- (void)configurationFetcher:(id)a3 didUpdateConfigurationDictionary:(id)a4 configurationHasChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  queue = self->_queue;
  unsigned __int8 v10 = (CPLConfigurationFetcher *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  configurationFetcher = self->_configurationFetcher;

  if (configurationFetcher == v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100014A6C;
    v14[3] = &unk_10023E7C0;
    id v15 = v8;
    -[CPLEngineWrapperArray enumerateWrappersWithBlock:](self, "enumerateWrappersWithBlock:", v14);
    if (v5)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, _CPLConfigurationDidChangeNotification, 0LL, 0LL, 0);
    }

    uint64_t v13 = self->_configurationFetcher;
    self->_configurationFetcher = 0LL;
  }
}

- (void)wrapperEmergencyExit:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_CPLSilentLogging)
  {
    id v5 = sub_1000109E4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ is requesting an emergency exit",  (uint8_t *)&v11,  0xCu);
    }
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_wrappers,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10023E7E0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000109E4();
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Closing immediately", (uint8_t *)&v11, 2u);
      }
    }

    exit(0);
  }

  id v8 = WeakRetained;
  [WeakRetained emergencyExitForWrapperArray:self];
}

- (void)_registerOpenError:(id)a3 forWrapper:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (!self->_previousOpenErrors)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    previousOpenErrors = self->_previousOpenErrors;
    self->_previousOpenErrors = v7;
  }

  id v9 = objc_alloc(&OBJC_CLASS____CPLEngineWrapperOpenError);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 parameters]);
  int v11 = -[_CPLEngineWrapperOpenError initWithParameters:openError:](v9, "initWithParameters:openError:", v10, v15);
  id v12 = self->_previousOpenErrors;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperArray:self wrapperShouldBeDropped:v6];
}

- (void)wrapper:(id)a3 libraryDidOpenWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v8));

  if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_unopenedWrappers, "removeObjectForKey:", v8);
    -[NSMutableDictionary removeObjectForKey:](self->_previousOpenErrors, "removeObjectForKey:", v8);
    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_1000109E4();
        int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v6;
          __int16 v22 = 2112;
          id v23 = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to open %@: %@", buf, 0x16u);
        }
      }

      -[NSMutableDictionary removeObjectForKey:](self->_autoClosingWrappers, "removeObjectForKey:", v8);
      -[NSMutableDictionary removeObjectForKey:](self->_wrappers, "removeObjectForKey:", v8);
      -[CPLEngineWrapperArray _registerOpenError:forWrapper:](self, "_registerOpenError:forWrapper:", v7, v6);
    }

    openObservers = self->_openObservers;
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    id v16 = sub_100014F98;
    id v17 = &unk_10023E808;
    id v18 = v6;
    id v19 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](openObservers, "enumerateKeysAndObjectsUsingBlock:", &v14);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "wrapperArrayCountDidChange:", self, v14, v15, v16, v17);
  }
}

- (void)wrapperLibraryDidClose:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_wrappers, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_unopenedWrappers,  "objectForKeyedSubscript:",  v5));

    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        id v8 = sub_1000109E4();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ closed before even being opened",  (uint8_t *)&v15,  0xCu);
        }
      }

      -[NSMutableDictionary removeObjectForKey:](self->_unopenedWrappers, "removeObjectForKey:", v5);
    }

    else if (!_CPLSilentLogging)
    {
      id v10 = sub_1000109E4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is closed", (uint8_t *)&v15, 0xCu);
      }
    }

    -[NSMutableDictionary removeObjectForKey:](self->_wrappers, "removeObjectForKey:", v5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained wrapperArrayCountDidChange:self];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_autoClosingWrappers,  "objectForKeyedSubscript:",  v5));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors libraryDoesNotAutoOpenError](&OBJC_CLASS___CPLErrors, "libraryDoesNotAutoOpenError"));
    -[CPLEngineWrapperArray _registerOpenError:forWrapper:](self, "_registerOpenError:forWrapper:", v14, v4);

    -[NSMutableDictionary removeObjectForKey:](self->_autoClosingWrappers, "removeObjectForKey:", v5);
  }

  if (!-[NSMutableDictionary count](self->_wrappers, "count") && self->_stopAllBlocks) {
    -[CPLEngineWrapperArray _callStopAllBlocks](self, "_callStopAllBlocks");
  }
}

- (void)wrapper:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = (void (**)(id, const __CFString *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained wrapperArray:self getStatusWithCompletionHandler:v6];
  }
  else {
    v6[2](v6, &stru_1002482B0, 0LL);
  }
}

- (void)wrapper:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = (void (**)(id, void *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained wrapperArray:self getStatusDictionaryWithCompletionHandler:v6];
  }
  else {
    v6[2](v6, &__NSDictionary0__struct, 0LL);
  }
}

- (void)wrapperShouldBeDropped:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperArray:self wrapperShouldBeDropped:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
  parametersStorage = self->_parametersStorage;
  id v17 = 0LL;
  unsigned __int8 v8 = -[CPLEngineParametersStorage removeParametersWithLibraryIdentifier:error:]( parametersStorage,  "removeParametersWithLibraryIdentifier:error:",  v6,  &v17);
  id v9 = v17;
  if ((v8 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000109E4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        id v12 = "Removed stored parameters for %@";
        uint64_t v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v16 = sub_1000109E4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v9;
      id v12 = "Failed to drop parameters for %@: %@";
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_8;
    }

- (void)wrapperNeedsInitialDownloadOfMainScope:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperArray:self wrapperNeedsInitialDownloadOfMainScope:v5];
}

- (void)wrapperDidCompleteInitialSyncOfMainScope:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperArray:self wrapperDidCompleteInitialSyncOfMainScope:v5];
}

- (CPLEngineParametersStorage)parametersStorage
{
  return self->_parametersStorage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPLEngineWrapperArrayDelegate)delegate
{
  return (CPLEngineWrapperArrayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end