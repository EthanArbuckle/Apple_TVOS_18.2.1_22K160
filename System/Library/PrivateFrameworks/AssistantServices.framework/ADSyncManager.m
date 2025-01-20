@interface ADSyncManager
- (ADSyncManager)initWithServiceManager:(id)a3 queue:(id)a4;
- (BOOL)_forceResetOnNextSync;
- (BOOL)isSyncing;
- (BOOL)isVerifying;
- (BOOL)shouldIncludeAllKnownSiriKitAnchorsForReason:(id)a3;
- (BOOL)shouldSyncEverythingForReason:(id)a3;
- (BOOL)shouldSyncIntentPolicyForSyncKeys:(id)a3;
- (BOOL)shouldSyncThirdPartyUserVocabularyForSyncKeys:(id)a3;
- (SASyncAnchor)_currentAnchor;
- (SASyncGetAnchors)getAnchorsRequest;
- (id)_continueBlock;
- (id)_preferredSyncKeyOrder;
- (id)_serviceManager;
- (id)_sortedAnchorsFromAnchors:(id)a3;
- (id)queuedAnchors;
- (id)queuedReasons;
- (id)syncKeysForReason:(id)a3;
- (void)_continueSync;
- (void)_finishSync;
- (void)_invokeContinueBlockWithKeepGoingArgument:(BOOL)a3;
- (void)_postSyncFinishedNotification;
- (void)_setAnchorsToSync:(id)a3;
- (void)_setContinueBlock:(id)a3;
- (void)_setCurrentAnchor:(id)a3;
- (void)_setCurrentAnchorToNext;
- (void)_setForceResetOnNextSync:(BOOL)a3;
- (void)_syncFinishedForService:(id)a3 error:(id)a4;
- (void)_syncingService:(id)a3 withSyncInfo:(id)a4 receivedChunk:(id)a5 continueBlock:(id)a6;
- (void)_waitUntilSafeToContinue;
- (void)addQueuedAnchors:(id)a3 forReasons:(id)a4;
- (void)cancelSyncForAnchor:(id)a3;
- (void)clearQueuedAnchorsAndReasons;
- (void)continueSync;
- (void)prepareSyncWithAnchors:(id)a3 forReasons:(id)a4 delegate:(id)a5;
- (void)reset;
- (void)serviceTimedoutForSync:(id)a3;
- (void)setGetAnchorsRequest:(id)a3;
- (void)setIsVerifying:(BOOL)a3;
@end

@implementation ADSyncManager

- (ADSyncManager)initWithServiceManager:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADSyncManager;
  v9 = -[ADSyncManager init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceManager, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = v10->_queue;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002266CC;
    v15[3] = &unk_1004FBBD0;
    v16 = v11;
    v13 = v11;
    [v12 addQueue:v13 heartBeatInterval:v15 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v10;
}

- (id)_serviceManager
{
  return self->_serviceManager;
}

- (void)_setAnchorsToSync:(id)a3
{
  if (self->_anchorsToSync != a3)
  {
    v4 = (NSMutableArray *)[a3 mutableCopy];
    anchorsToSync = self->_anchorsToSync;
    self->_anchorsToSync = v4;
  }

- (void)_finishSync
{
  v3 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADSyncManager _finishSync]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_syncedAnchors, "count"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v27 = self;
  obj = self->_syncedAnchors;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v47,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    v28 = v4;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
        if (v10)
        {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
          v11 = (void *)AFSiriLogContextSync;
          if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
          {
            log = v11;
            v12 = (void *)objc_claimAutoreleasedReturnValue([v9 generation]);
            id v13 = v6;
            uint64_t v14 = v7;
            id v15 = [v9 count];
            v16 = (void *)objc_claimAutoreleasedReturnValue([v9 validity]);
            objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v9 appMetaData]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v17 syncSlots]);
            *(_DWORD *)buf = 136316418;
            v36 = "-[ADSyncManager _finishSync]";
            __int16 v37 = 2112;
            v38 = v10;
            __int16 v39 = 2112;
            v40 = v12;
            __int16 v41 = 2048;
            id v42 = v15;
            uint64_t v7 = v14;
            id v6 = v13;
            __int16 v43 = 2112;
            v44 = v16;
            __int16 v45 = 2112;
            v46 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s Anchor key: %@  generation: %@   count: %lu  validity: %@  syncSlots: %@",  buf,  0x3Eu);

            v4 = v28;
          }
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v47,  16LL);
    }

    while (v6);
  }

  delegate = v27->_delegate;
  v27->_delegate = 0LL;
  v20 = delegate;

  currentAnchor = v27->_currentAnchor;
  v27->_currentAnchor = 0LL;

  anchorsToSync = v27->_anchorsToSync;
  v27->_anchorsToSync = 0LL;

  syncedAnchors = v27->_syncedAnchors;
  v27->_syncedAnchors = 0LL;

  currentSyncID = v27->_currentSyncID;
  v27->_currentSyncID = 0LL;

  currentSyncReasons = v27->_currentSyncReasons;
  v27->_currentSyncReasons = 0LL;

  timedoutServices = v27->_timedoutServices;
  v27->_timedoutServices = 0LL;

  v27->_forceResetOnNextSync = 0;
  -[ADSyncManagerDelegate syncManager:finishedSyncForKeys:postNotification:]( v20,  "syncManager:finishedSyncForKeys:postNotification:",  v27,  v4,  1LL);

  -[ADSyncManager _postSyncFinishedNotification](v27, "_postSyncFinishedNotification");
}

- (void)_setCurrentAnchorToNext
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_anchorsToSync, "lastObject"));
  -[ADSyncManager _setCurrentAnchor:](self, "_setCurrentAnchor:", v3);
  if (v3) {
    -[NSMutableArray removeLastObject](self->_anchorsToSync, "removeLastObject");
  }
}

- (void)_syncingService:(id)a3 withSyncInfo:(id)a4 receivedChunk:(id)a5 continueBlock:(id)a6
{
  id v40 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 appMetadata]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appIdentifyingInfo]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 toAdd]);
  *((void *)&v39 + 1) = [v15 count];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 toRemove]);
  *(void *)&__int128 v39 = [v16 count];

  objc_super v17 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    log = v17;
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v10 key]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v10 anchor]);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v10 validity]);
    id v34 = [v10 count];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleId]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v14 version]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v14 clientIdentifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 buildNumber]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v10 appMetadata]);
    id v32 = v10;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v30 syncSlots]);
    v29 = self;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 pre]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v11 post]);
    v35 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 validity]);
    *(_DWORD *)buf = 136318978;
    id v42 = "-[ADSyncManager _syncingService:withSyncInfo:receivedChunk:continueBlock:]";
    __int16 v43 = 2112;
    id v44 = v40;
    __int16 v45 = 2112;
    v46 = v37;
    __int16 v47 = 2112;
    v48 = v38;
    __int16 v49 = 2112;
    v50 = v31;
    __int16 v51 = 2048;
    id v52 = v34;
    __int16 v53 = 2112;
    v54 = v18;
    __int16 v55 = 2112;
    v56 = v28;
    __int16 v57 = 2112;
    v58 = v19;
    __int16 v59 = 2112;
    v60 = v20;
    __int16 v61 = 2112;
    v62 = v21;
    __int16 v63 = 2112;
    v64 = v22;
    __int16 v65 = 2112;
    v66 = v23;
    __int16 v67 = 2112;
    v68 = v24;
    __int16 v69 = 2048;
    uint64_t v70 = *((void *)&v39 + 1);
    __int16 v71 = 2048;
    uint64_t v72 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s %@  Sync - key: %@  anchor: %@  validity: %@  count %lu\n App Metadata - bundleId: %@  version: %@  clientIdentifier: %@  buildNumber: %@  syncSlots: %@\n Chunk - pre: %@  post: %@  validity: %@  toAdd: %lu  toRemove: %lu",  buf,  0xA2u);

    v12 = v35;
    self = v29;

    id v10 = v32;
  }

  if (self->_continueBlock)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2 object:self file:@"ADSyncManager.m" lineNumber:140 description:@"Not expecting a sync chunk; already have a continue block"];
  }

  if (self->_currentSyncShouldCancel)
  {
    v12[2](v12, 0LL);
  }

  else
  {
    -[ADSyncManager _setContinueBlock:](self, "_setContinueBlock:", v12);
    if (v39 != 0) {
      self->_currentSyncHasChanges = 1;
    }
    v25 = (NSString *)objc_claimAutoreleasedReturnValue([v11 post]);
    currentSyncGeneration = self->_currentSyncGeneration;
    self->_currentSyncGeneration = v25;

    -[ADSyncManagerDelegate syncManager:chunkForSyncInfo:chunkInfo:]( self->_delegate,  "syncManager:chunkForSyncInfo:chunkInfo:",  self,  v10,  v11);
    -[ADSyncManagerDelegate syncManagerIsPausingSync:](self->_delegate, "syncManagerIsPausingSync:", self);
  }
}

- (void)_syncFinishedForService:(id)a3 error:(id)a4
{
  currentSyncService = self->_currentSyncService;
  self->_currentSyncService = 0LL;

  if (!a4 && !self->_currentSyncShouldCancel)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncManager _currentAnchor](self, "_currentAnchor"));
    if (v7)
    {
      -[NSMutableArray addObject:](self->_syncedAnchors, "addObject:", v7);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
      v12 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
      sub_1002D6A38(v9);
    }

    if (self->_currentSyncHasChanges)
    {
      delegate = self->_delegate;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 key]);
      -[ADSyncManagerDelegate syncManager:finishedSyncForSyncKey:generation:]( delegate,  "syncManager:finishedSyncForSyncKey:generation:",  self,  v11,  self->_currentSyncGeneration);
    }
  }

  -[ADSyncManager _setCurrentAnchor:](self, "_setCurrentAnchor:", 0LL);
  -[ADSyncManager _waitUntilSafeToContinue](self, "_waitUntilSafeToContinue");
  -[ADSyncManagerDelegate syncManagerIsPausingSync:](self->_delegate, "syncManagerIsPausingSync:", self);
}

- (void)_continueSync
{
  id v3 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    anchorsToSync = self->_anchorsToSync;
    *(_DWORD *)buf = 136315394;
    v23 = "-[ADSyncManager _continueSync]";
    __int16 v24 = 2112;
    v25 = anchorsToSync;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s anchorsToSync: %@", buf, 0x16u);
  }

  -[ADSyncManager _setCurrentAnchorToNext](self, "_setCurrentAnchorToNext");
  currentAnchor = self->_currentAnchor;
  if (!currentAnchor) {
    goto LABEL_14;
  }
  *(void *)&__int128 v5 = 136315394LL;
  __int128 v17 = v5;
  while (1)
  {
    uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[SASyncAnchor key](currentAnchor, "key", v17));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ADServiceManager serviceForSyncAnchorKey:](self->_serviceManager, "serviceForSyncAnchorKey:", v7));
    if (v8) {
      break;
    }
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v17;
      v23 = "-[ADSyncManager _continueSync]";
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Sync manager couldn't find connection for anchor key %{public}@. Moving on.",  buf,  0x16u);
    }

    -[ADSyncManager _setCurrentAnchorToNext](self, "_setCurrentAnchorToNext");

    currentAnchor = self->_currentAnchor;
    if (!currentAnchor) {
      goto LABEL_14;
    }
  }

  id v10 = (void *)v8;
  id v11 = [[AFSyncInfo alloc] initWithAnchor:self->_currentAnchor forcingReset:self->_forceResetOnNextSync];
  [v11 setReasons:self->_currentSyncReasons];
  [v11 setForVerification:self->_isVerifying];
  if (self->_forceResetOnNextSync)
  {
    v12 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = v17;
      v23 = "-[ADSyncManager _continueSync]";
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Forcing a reset on key %@", buf, 0x16u);
    }
  }

  [v10 setDelegate:self];
  self->_currentSyncShouldCancel = 0;
  objc_storeStrong((id *)&self->_currentSyncService, v10);
  self->_currentSyncHasChanges = 0;
  id v13 = -[NSUUID copy](self->_currentSyncID, "copy");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1002263F4;
  v18[3] = &unk_1004F6E30;
  v18[4] = self;
  id v19 = v10;
  id v20 = v13;
  id v21 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v16 beginSyncForInfo:v14 chunkHandler:v18];

  if (!self->_currentAnchor) {
LABEL_14:
  }
    -[ADSyncManager _finishSync](self, "_finishSync");
}

- (void)_postSyncFinishedNotification
{
}

- (id)_sortedAnchorsFromAnchors:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v23 = self;
    __int128 v5 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 key]);
          if (v13
            && (id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 appMetaData]),
                v14,
                !v14))
          {
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v13);
          }

          else
          {
            -[NSMutableArray addObject:](v6, "addObject:", v12);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v9);
    }

    id v15 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncManager _preferredSyncKeyOrder](v23, "_preferredSyncKeyOrder"));
    __int128 v17 = (char *)[v16 count];
    if (v17)
    {
      v18 = v17 - 1;
      do
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v18]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v19));
        if (v20)
        {
          -[NSMutableArray addObject:](v15, "addObject:", v20);
          -[NSMutableDictionary removeObjectForKey:](v5, "removeObjectForKey:", v19);
        }

        --v18;
      }

      while (v18 != (char *)-1LL);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v5, "allValues"));
    if (v21) {
      -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v21);
    }
    if (v15) {
      -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v15);
    }
  }

  else
  {
    id v6 = (NSMutableArray *)v4;
  }

  return v6;
}

- (void)prepareSyncWithAnchors:(id)a3 forReasons:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_delegate)
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v24,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ADSyncManager.m",  287,  @"Already have a sync delegate, is sync still in progress?");
  }

  id v12 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  objc_storeStrong((id *)&self->_delegate, a5);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  currentSyncID = self->_currentSyncID;
  self->_currentSyncID = v13;

  id v15 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    id v16 = self->_currentSyncID;
    int v25 = 136315650;
    __int128 v26 = "-[ADSyncManager prepareSyncWithAnchors:forReasons:delegate:]";
    __int16 v27 = 2112;
    v28 = v16;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Preparing sync with ID %@ for reasons: %@",  (uint8_t *)&v25,  0x20u);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncManager _sortedAnchorsFromAnchors:](self, "_sortedAnchorsFromAnchors:", v9));
  -[ADSyncManager _setAnchorsToSync:](self, "_setAnchorsToSync:", v17);
  v18 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v10);
  currentSyncReasons = self->_currentSyncReasons;
  self->_currentSyncReasons = v18;

  id v20 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
  syncedAnchors = self->_syncedAnchors;
  self->_syncedAnchors = v20;

  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  timedoutServices = self->_timedoutServices;
  self->_timedoutServices = v22;

  -[ADSyncManager _waitUntilSafeToContinue](self, "_waitUntilSafeToContinue");
  -[ADSyncManagerDelegate syncManagerIsPausingSync:](self->_delegate, "syncManagerIsPausingSync:", self);
}

- (void)addQueuedAnchors:(id)a3 forReasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_queuedAnchorsByNormalizedKey)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queuedAnchorsByNormalizedKey = self->_queuedAnchorsByNormalizedKey;
    self->_queuedAnchorsByNormalizedKey = v8;
  }

  id v10 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSMutableArray count](self->_anchorsToSync, "count"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v11 = self->_anchorsToSync;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v36,  v47,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)i), "_af_normalizedKey"));
        -[NSMutableSet addObject:](v10, "addObject:", v16);
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v36,  v47,  16LL);
    }

    while (v13);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v17 = v6;
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_af_normalizedKey", (void)v32));
      }

      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }

    while (v19);
  }

  queuedReasons = self->_queuedReasons;
  if (!queuedReasons)
  {
    int v25 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v26 = self->_queuedReasons;
    self->_queuedReasons = v25;

    queuedReasons = self->_queuedReasons;
  }

  -[NSMutableSet addObjectsFromArray:](queuedReasons, "addObjectsFromArray:", v7, (void)v32);
  __int16 v27 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_DEBUG))
  {
    v28 = self->_queuedAnchorsByNormalizedKey;
    __int16 v29 = v27;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v28, "allKeys"));
    __int128 v31 = self->_queuedReasons;
    *(_DWORD *)buf = 136315650;
    __int16 v41 = "-[ADSyncManager addQueuedAnchors:forReasons:]";
    __int16 v42 = 2112;
    __int16 v43 = v30;
    __int16 v44 = 2112;
    __int16 v45 = v31;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Anchors in queue: %@ for reasons: %@",  buf,  0x20u);
  }
}

- (void)clearQueuedAnchorsAndReasons
{
  queuedAnchorsByNormalizedKey = self->_queuedAnchorsByNormalizedKey;
  self->_queuedAnchorsByNormalizedKey = 0LL;

  queuedReasons = self->_queuedReasons;
  self->_queuedReasons = 0LL;
}

- (id)queuedAnchors
{
  id v3 = -[NSMutableDictionary count](self->_queuedAnchorsByNormalizedKey, "count");
  if (v3) {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_queuedAnchorsByNormalizedKey, "allValues"));
  }
  return v3;
}

- (id)queuedReasons
{
  return self->_queuedReasons;
}

- (void)_waitUntilSafeToContinue
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002263C8;
  v3[3] = &unk_1004F6E58;
  objc_copyWeak(&v4, &location);
  -[ADSyncManager _setContinueBlock:](self, "_setContinueBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)isSyncing
{
  return self->_delegate != 0LL;
}

- (void)continueSync
{
  id continueBlock = self->_continueBlock;
  id v4 = (os_log_s *)AFSiriLogContextSync;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO);
  if (continueBlock)
  {
    if (v5)
    {
      int v6 = 136315138;
      id v7 = "-[ADSyncManager continueSync]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Continuing sync", (uint8_t *)&v6, 0xCu);
    }

    -[ADSyncManager _invokeContinueBlockWithKeepGoingArgument:](self, "_invokeContinueBlockWithKeepGoingArgument:", 1LL);
  }

  else if (v5)
  {
    int v6 = 136315138;
    id v7 = "-[ADSyncManager continueSync]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Sync Manager isn't waiting on a continue, ignoring request",  (uint8_t *)&v6,  0xCu);
  }

- (void)cancelSyncForAnchor:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_currentAnchor;
  id v6 = v4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SASyncAnchor key](v5, "key"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 key]);
  if (v7 | v8 && ![(id)v7 isEqual:v8])
  {

    goto LABEL_11;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SASyncAnchor appMetaData](v5, "appMetaData"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 appMetaData]);
  if (v9 | v10)
  {
    id v11 = (void *)v10;
    unsigned __int8 v12 = [(id)v9 isEqual:v10];

    if ((v12 & 1) == 0)
    {
LABEL_11:
      uint64_t v14 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        currentAnchor = self->_currentAnchor;
        int v16 = 136315650;
        id v17 = "-[ADSyncManager cancelSyncForAnchor:]";
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = currentAnchor;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Ignoring sync cancel for anchor %@. Current anchor is %@",  (uint8_t *)&v16,  0x20u);
      }

      goto LABEL_13;
    }
  }

  else
  {
  }

  id v13 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[ADSyncManager cancelSyncForAnchor:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Canceling sync for anchor %@",  (uint8_t *)&v16,  0x16u);
  }

  self->_currentSyncShouldCancel = 1;
  -[ADSyncManager _invokeContinueBlockWithKeepGoingArgument:](self, "_invokeContinueBlockWithKeepGoingArgument:", 0LL);
LABEL_13:
}

- (void)_invokeContinueBlockWithKeepGoingArgument:(BOOL)a3
{
  id continueBlock = self->_continueBlock;
  if (continueBlock)
  {
    BOOL v5 = a3;
    uint64_t v7 = (void (**)(id, BOOL))objc_retainBlock(continueBlock);
    id v6 = self->_continueBlock;
    self->_id continueBlock = 0LL;

    v7[2](v7, v5);
  }

- (void)reset
{
  unsigned int v3 = -[ADSyncManager isSyncing](self, "isSyncing");
  BOOL isVerifying = self->_isVerifying;
  BOOL v5 = self->_delegate;
  -[ADSyncManager cancelSyncForAnchor:](self, "cancelSyncForAnchor:", self->_currentAnchor);
  delegate = self->_delegate;
  self->_delegate = 0LL;

  getAnchorsRequest = self->_getAnchorsRequest;
  self->_getAnchorsRequest = 0LL;

  currentAnchor = self->_currentAnchor;
  self->_currentAnchor = 0LL;

  syncedAnchors = self->_syncedAnchors;
  self->_syncedAnchors = 0LL;

  anchorsToSync = self->_anchorsToSync;
  self->_anchorsToSync = 0LL;

  currentSyncReasons = self->_currentSyncReasons;
  self->_currentSyncReasons = 0LL;

  id continueBlock = self->_continueBlock;
  self->_id continueBlock = 0LL;

  currentSyncService = self->_currentSyncService;
  self->_currentSyncService = 0LL;

  currentSyncID = self->_currentSyncID;
  self->_currentSyncID = 0LL;

  timedoutServices = self->_timedoutServices;
  self->_timedoutServices = 0LL;

  self->_BOOL isVerifying = 0;
  if (v3)
  {
    int v16 = (os_log_s *)AFSiriLogContextSync;
    BOOL v17 = os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO);
    if (isVerifying)
    {
      if (v17)
      {
        *(_DWORD *)id v19 = 136315138;
        *(void *)&v19[4] = "-[ADSyncManager reset]";
        __int16 v18 = "%s In progress verification has been reset";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v18, v19, 0xCu);
      }
    }

    else if (v17)
    {
      *(_DWORD *)id v19 = 136315138;
      *(void *)&v19[4] = "-[ADSyncManager reset]";
      __int16 v18 = "%s In progress sync has been reset";
      goto LABEL_7;
    }

    -[ADSyncManagerDelegate syncManagerDidResetInProgressSync:]( v5,  "syncManagerDidResetInProgressSync:",  self,  *(_OWORD *)v19);
  }
}

- (void)serviceTimedoutForSync:(id)a3
{
  timedoutServices = self->_timedoutServices;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  -[NSMutableSet addObject:](timedoutServices, "addObject:", v5);

  if ((unint64_t)-[NSMutableSet count](self->_timedoutServices, "count") >= 3)
  {
    id v6 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADSyncManager serviceTimedoutForSync:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Too many plugins have timed out for sync, reset and try later",  (uint8_t *)&v7,  0xCu);
    }

    -[ADSyncManager reset](self, "reset");
  }

- (SASyncAnchor)_currentAnchor
{
  return self->_currentAnchor;
}

- (void)_setCurrentAnchor:(id)a3
{
}

- (BOOL)_forceResetOnNextSync
{
  return self->_forceResetOnNextSync;
}

- (void)_setForceResetOnNextSync:(BOOL)a3
{
  self->_forceResetOnNextSync = a3;
}

- (id)_continueBlock
{
  return self->_continueBlock;
}

- (void)_setContinueBlock:(id)a3
{
}

- (SASyncGetAnchors)getAnchorsRequest
{
  return self->_getAnchorsRequest;
}

- (void)setGetAnchorsRequest:(id)a3
{
}

- (BOOL)isVerifying
{
  return self->_isVerifying;
}

- (void)setIsVerifying:(BOOL)a3
{
  self->_BOOL isVerifying = a3;
}

- (void).cxx_destruct
{
}

- (id)_preferredSyncKeyOrder
{
  if (AFIsHorseman(self, a2))
  {
    int v7 = @"com.apple.siri.client.state.DynamiteClientState";
    uint64_t v8 = @"com.apple.media.entities";
    uint64_t v9 = @"com.apple.homekit.name";
    v2 = &v7;
    uint64_t v3 = 3LL;
  }

  else
  {
    BOOL v5 = @"com.apple.contact.people";
    id v6 = @"com.apple.homekit.name";
    v2 = &v5;
    uint64_t v3 = 2LL;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v2,  v3,  v5,  v6,  v7,  v8,  v9));
}

- (id)syncKeysForReason:(id)a3
{
  id v4 = sub_1002D6574(a3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (![v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncManager _serviceManager](self, "_serviceManager"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 allSyncAnchorKeys]);

    BOOL v5 = (void *)v7;
  }

  return v5;
}

- (BOOL)shouldSyncEverythingForReason:(id)a3
{
  id v3 = a3;
  id v4 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"assistant_enabled",  @"daily_sync",  @"requested_by_assistantd",  @"com.apple.assistant.sync_data_changed",  @"Safety net",  @"siri_locale_change",  0LL);
  unsigned __int8 v5 = -[NSSet containsObject:](v4, "containsObject:", v3);

  return v5;
}

- (BOOL)shouldIncludeAllKnownSiriKitAnchorsForReason:(id)a3
{
  return [a3 isEqualToString:@"daily_sync"];
}

- (BOOL)shouldSyncThirdPartyUserVocabularyForSyncKeys:(id)a3
{
  return [a3 containsObject:@"com.apple.siri.vocabularyupdates"];
}

- (BOOL)shouldSyncIntentPolicyForSyncKeys:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [v3 containsObject:@"com.apple.siri.appIntentSupportPolicyAndVocab.nano"];
  }

  return v4;
}

@end