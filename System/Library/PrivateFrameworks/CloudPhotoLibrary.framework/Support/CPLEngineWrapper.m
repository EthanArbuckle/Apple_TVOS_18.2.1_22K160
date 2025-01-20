@interface CPLEngineWrapper
- (BOOL)deactivated;
- (BOOL)inEmergencyClosing;
- (BOOL)isSystemLibrary;
- (BOOL)startWithError:(id *)a3;
- (BOOL)stopped;
- (BOOL)stopping;
- (CPLEngineLibrary)engine;
- (CPLEngineParameters)parameters;
- (CPLEngineWrapper)initWithParameters:(id)a3 engine:(id)a4 queue:(id)a5;
- (CPLEngineWrapperDelegate)delegate;
- (NSString)description;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSURL)clientLibraryBaseURL;
- (NSURL)volumeURL;
- (OS_dispatch_queue)queue;
- (id)_deactivateMarkerURL;
- (id)ownerNameForEngineLibrary:(id)a3;
- (id)redactedDescription;
- (void)_emergencyExit;
- (void)_libraryHasBeenDeleted;
- (void)_libraryMustBeWiped:(id)a3;
- (void)_startWatchingSystemState;
- (void)_startWatchingURL:(id)a3 forPauseReason:(id)a4;
- (void)_stopWatchingSystemState;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)emergencyClose;
- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)engineLibraryDidCompleteInitialSyncOfMainScope:(id)a3;
- (void)engineLibraryNeedsInitialDownloadOfMainScope:(id)a3;
- (void)fileWatcherFileDidAppear:(id)a3;
- (void)fileWatcherFileDidDisappear:(id)a3;
- (void)pingSupervisor;
- (void)resetStoredParametersWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInEmergencyClosing:(BOOL)a3;
- (void)setVolumeURL:(id)a3;
- (void)stop;
- (void)volumeWillUnmount:(id)a3;
- (void)wipeWithReason:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLEngineWrapper

- (CPLEngineWrapper)initWithParameters:(id)a3 engine:(id)a4 queue:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = (dispatch_queue_s *)a5;
  if (!v11) {
    sub_10018E6CC(v10, (uint64_t)a2, (uint64_t)self);
  }
  v13 = v12;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLEngineWrapper;
  v14 = -[CPLEngineWrapper init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = CPLCopyDefaultSerialQueueAttributes(v14);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("com.apple.cpl.enginelibrary.wrapper", v17, v13);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v15->_stopped = 1;
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pausedWatchers = v15->_pausedWatchers;
    v15->_pausedWatchers = v20;

    objc_storeStrong((id *)&v15->_parameters, a3);
    objc_storeStrong((id *)&v15->_engine, a4);
    -[CPLEngineLibrary setOwner:](v15->_engine, "setOwner:", v15);
  }

  return v15;
}

- (NSURL)clientLibraryBaseURL
{
  return -[CPLEngineParameters clientLibraryBaseURL](self->_parameters, "clientLibraryBaseURL");
}

- (NSString)libraryIdentifier
{
  return -[CPLEngineParameters libraryIdentifier](self->_parameters, "libraryIdentifier");
}

- (NSString)mainScopeIdentifier
{
  return -[CPLEngineParameters mainScopeIdentifier](self->_parameters, "mainScopeIdentifier");
}

- (BOOL)isSystemLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters libraryIdentifier](self->_parameters, "libraryIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  return v3;
}

- (BOOL)startWithError:(id *)a3
{
  id v5 = objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper clientLibraryBaseURL](self, "clientLibraryBaseURL"));
  unsigned int v6 = open((const char *)[v5 fileSystemRepresentation], 0x8000);

  if ((v6 & 0x80000000) == 0)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_vnode,  v6,  1uLL,  (dispatch_queue_t)self->_queue);
    watchCPLLibrarySource = self->_watchCPLLibrarySource;
    self->_watchCPLLibrarySource = v7;

    v9 = self->_watchCPLLibrarySource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000E37C;
    handler[3] = &unk_10023DC70;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    id v10 = self->_watchCPLLibrarySource;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10000E394;
    v29[3] = &unk_10023DC70;
    v29[4] = self;
    dispatch_source_set_cancel_handler((dispatch_source_t)v10, v29);
    dispatch_resume((dispatch_object_t)self->_watchCPLLibrarySource);
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10000E33C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_watchCPLLibrarySource;
        *(_DWORD *)buf = 138412802;
        v32 = self;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Started watching %@ (fd: %i / source: %@)",  buf,  0x1Cu);
      }
    }

    id v14 = 0LL;
LABEL_18:
    if (self->_volumeURL)
    {
      objc_super v23 = -[CPLDaemonDiskArbitration initWithVolumeURL:queue:]( objc_alloc(&OBJC_CLASS___CPLDaemonDiskArbitration),  "initWithVolumeURL:queue:",  self->_volumeURL,  self->_queue);
      diskArb = self->_diskArb;
      self->_diskArb = v23;

      -[CPLDaemonDiskArbitration addVolumeUnmountObserver:](self->_diskArb, "addVolumeUnmountObserver:", self);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:self selector:"_libraryMustBeWiped:" name:CPLLibraryMustBeWipedNotificationName object:self->_engine];

    engine = self->_engine;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10000E448;
    v28[3] = &unk_10023E430;
    v28[4] = self;
    -[CPLEngineLibrary openWithCompletionHandler:](engine, "openWithCompletionHandler:", v28);
    BOOL v20 = 1;
    goto LABEL_21;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper clientLibraryBaseURL](self, "clientLibraryBaseURL"));
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v15));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v17 = [v16 cplIsFileDoesNotExistError:v14];

  if (!v17)
  {
    if (!_CPLSilentLogging)
    {
      id v21 = sub_10000E33C();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v32 = self;
        __int16 v33 = 2112;
        *(void *)v34 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to watch %@: %@", buf, 0x16u);
      }
    }

    goto LABEL_18;
  }

  if (!_CPLSilentLogging)
  {
    id v18 = sub_10000E33C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%@ was deleted before we even knew it",  buf,  0xCu);
    }
  }

  if (a3)
  {
    id v14 = v14;
    BOOL v20 = 0;
    *a3 = v14;
  }

  else
  {
    BOOL v20 = 0;
  }

- (void)_emergencyExit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained) {
    exit(0);
  }
  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 wrapperEmergencyExit:self];
}

- (void)_libraryHasBeenDeleted
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000E33C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%@ has been deleted - dropping stored parameters and exiting now.",  (uint8_t *)&v6,  0xCu);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained wrapperShouldBeDropped:self];

  -[CPLEngineWrapper _emergencyExit](self, "_emergencyExit");
}

- (NSString)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self, "libraryIdentifier"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper clientLibraryBaseURL](self, "clientLibraryBaseURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAbbreviatingWithTildeInPath]);
  unsigned int v9 = -[CPLEngineWrapper inEmergencyClosing](self, "inEmergencyClosing");
  id v10 = "";
  if (v9) {
    id v10 = " (emergency closing)";
  }
  id v11 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ for %@ at %@%s>", v4, v5, v8, v10);

  return v11;
}

- (id)redactedDescription
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self, "libraryIdentifier"));
  unsigned int v6 = -[CPLEngineWrapper inEmergencyClosing](self, "inEmergencyClosing");
  v7 = "";
  if (v6) {
    v7 = " (emergency closing)";
  }
  v8 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ for %@ %s>", v4, v5, v7);

  return v8;
}

- (void)stop
{
  self->_stopping = 1;
  -[CPLEngineWrapper _stopWatchingSystemState](self, "_stopWatchingSystemState");
  dispatch_time_t v3 = dispatch_time(0LL, 5000000000LL);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E914;
  block[3] = &unk_10023DC70;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)queue, block);
  engine = self->_engine;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000EA04;
  v6[3] = &unk_10023E430;
  v6[4] = self;
  -[CPLEngineLibrary closeAndDeactivate:completionHandler:](engine, "closeAndDeactivate:completionHandler:", 0LL, v6);
}

- (void)emergencyClose
{
  if (!-[CPLEngineWrapper inEmergencyClosing](self, "inEmergencyClosing"))
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10000E33C();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        unsigned int v6 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Closing %@ in emergency",  (uint8_t *)&v5,  0xCu);
      }
    }

    -[CPLEngineWrapper setInEmergencyClosing:](self, "setInEmergencyClosing:", 1LL);
    -[CPLEngineLibrary emergencyClose](self->_engine, "emergencyClose");
  }

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  engine = self->_engine;
  if (engine)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000ED6C;
    v7[3] = &unk_10023E458;
    v7[4] = self;
    id v8 = v4;
    -[CPLEngineLibrary closeAndDeactivate:completionHandler:](engine, "closeAndDeactivate:completionHandler:", 1LL, v7);
  }
}

- (void)wipeWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  engine = self->_engine;
  id v8 = a3;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](engine, "store"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000EF30;
  v11[3] = &unk_10023E058;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 wipeStoreAtNextOpeningWithReason:v8 completionBlock:v11];
}

- (void)resetStoredParametersWithCompletionHandler:(id)a3
{
  self->_deactivated = 1;
  p_delegate = &self->_delegate;
  id v6 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained wrapperShouldBeDropped:self];

  v6[2]();
}

- (void)pingSupervisor
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary supervisor](self->_engine, "supervisor"));
  [v2 ping];
}

- (id)_deactivateMarkerURL
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engine, "store"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 platformObject]);

  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteStore), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 deactivateMarkerURL]);
  }
  else {
    int v5 = 0LL;
  }

  return v5;
}

- (void)_startWatchingURL:(id)a3 forPauseReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___CPLFileWatcher);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self, "libraryIdentifier"));
  id v10 = [v8 initWithFileURL:v7 name:v6 ownerIdentifier:v9 delegate:self queue:self->_queue];

  -[NSMutableSet addObject:](self->_unpausedWatchers, "addObject:", v10);
  [v10 startWatching];
}

- (void)_startWatchingSystemState
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  pausedWatchers = self->_pausedWatchers;
  self->_pausedWatchers = v3;

  int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  unpausedWatchers = self->_unpausedWatchers;
  self->_unpausedWatchers = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper clientLibraryBaseURL](self, "clientLibraryBaseURL"));
  if (!_CPLSilentLogging)
  {
    id v8 = sub_10000E33C();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self, "libraryIdentifier"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAbbreviatingWithTildeInPath]);
      int v18 = 138543618;
      v19 = v10;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Will watch markers for %{public}@ in %@",  (uint8_t *)&v18,  0x16u);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"pauseSyncMarker" isDirectory:0]);
  -[CPLEngineWrapper _startWatchingURL:forPauseReason:]( self,  "_startWatchingURL:forPauseReason:",  v13,  @"test pause marker");
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"pauseICloudPhotos" isDirectory:0]);
  -[CPLEngineWrapper _startWatchingURL:forPauseReason:]( self,  "_startWatchingURL:forPauseReason:",  v14,  @"user pause marker");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper _deactivateMarkerURL](self, "_deactivateMarkerURL"));
  if (v15) {
    -[CPLEngineWrapper _startWatchingURL:forPauseReason:]( self,  "_startWatchingURL:forPauseReason:",  v15,  @"deactivation marker");
  }
  uint64_t v16 = -[PFCameraViewfinderSessionWatcher initWithDispatchQueue:delegate:]( objc_alloc(&OBJC_CLASS___PFCameraViewfinderSessionWatcher),  "initWithDispatchQueue:delegate:",  self->_queue,  self);
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v16;

  -[PFCameraViewfinderSessionWatcher startWatching](self->_cameraWatcher, "startWatching");
  -[CPLEngineWrapper cameraWatcherDidChangeState:](self, "cameraWatcherDidChangeState:", self->_cameraWatcher);
}

- (void)_stopWatchingSystemState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:CPLLibraryMustBeWipedNotificationName object:self->_engine];

  watchCPLLibrarySource = self->_watchCPLLibrarySource;
  if (watchCPLLibrarySource)
  {
    dispatch_source_cancel((dispatch_source_t)watchCPLLibrarySource);
    int v5 = self->_watchCPLLibrarySource;
    self->_watchCPLLibrarySource = 0LL;
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = self->_pausedWatchers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v10) stopWatching];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v24,  v29,  16LL);
    }

    while (v8);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = self->_unpausedWatchers;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v15), "stopWatching", (void)v20);
        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
    }

    while (v13);
  }

  pausedWatchers = self->_pausedWatchers;
  self->_pausedWatchers = 0LL;

  unpausedWatchers = self->_unpausedWatchers;
  self->_unpausedWatchers = 0LL;

  -[PFCameraViewfinderSessionWatcher stopWatching](self->_cameraWatcher, "stopWatching");
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = 0LL;

  -[CPLDaemonDiskArbitration removeVolumeUnmountObserver:](self->_diskArb, "removeVolumeUnmountObserver:", self);
  -[CPLDaemonDiskArbitration stop](self->_diskArb, "stop");
  diskArb = self->_diskArb;
  self->_diskArb = 0LL;
}

- (void)_libraryMustBeWiped:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000F6D0;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001042C;
  block[3] = &unk_10023DBC8;
  id v9 = v4;
  int v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F86C;
  v11[3] = &unk_10023E058;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001042C;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000F9AC;
  v11[3] = &unk_10023E058;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001042C;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (id)ownerNameForEngineLibrary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 processName]);

  return v4;
}

- (void)engineLibraryNeedsInitialDownloadOfMainScope:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FC58;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001042C;
  block[3] = &unk_10023DBC8;
  id v9 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)engineLibraryDidCompleteInitialSyncOfMainScope:(id)a3
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FD50;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001042C;
  block[3] = &unk_10023DBC8;
  id v9 = v4;
  id v5 = queue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (void)volumeWillUnmount:(id)a3
{
  uint64_t v4 = (CPLDaemonDiskArbitration *)a3;
  if (self->_diskArb == v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10000E33C();
      dispatch_block_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Volume for %@ will unmount. Requesting emergency exit",  (uint8_t *)&v7,  0xCu);
      }
    }

    -[CPLEngineWrapper _emergencyExit](self, "_emergencyExit");
  }
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  uint64_t v4 = (PFCameraViewfinderSessionWatcher *)a3;
  id v5 = v4;
  if (!self->_deactivated && !self->_stopping && !self->_stopped && self->_cameraWatcher == v4)
  {
    if (-[PFCameraViewfinderSessionWatcher isCameraRunning](v4, "isCameraRunning"))
    {
      if (!self->_disabledEngineBecauseOfCamera)
      {
        self->_disabledEngineBecauseOfCamera = 1;
        if (!_CPLSilentLogging)
        {
          id v6 = sub_10000E33C();
          int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            id v14 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Camera for %@ is running - disabling background synchronization",  (uint8_t *)&v13,  0xCu);
          }
        }

        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engine, "scheduler"));
        [v8 disableSynchronizationWithReason:@"camera"];

        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary supervisor](self->_engine, "supervisor"));
        [v9 pause];
LABEL_18:
      }
    }

    else if (self->_disabledEngineBecauseOfCamera)
    {
      self->_disabledEngineBecauseOfCamera = 0;
      if (!_CPLSilentLogging)
      {
        id v10 = sub_10000E33C();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Camera for %@ is not running - re-enabling background synchronization",  (uint8_t *)&v13,  0xCu);
        }
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engine, "scheduler"));
      [v12 enableSynchronizationWithReason:@"camera"];

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary supervisor](self->_engine, "supervisor"));
      [v9 resume];
      goto LABEL_18;
    }
  }
}

- (void)fileWatcherFileDidAppear:(id)a3
{
  id v4 = a3;
  if (!self->_deactivated
    && !self->_stopping
    && !self->_stopped
    && -[NSMutableSet containsObject:](self->_unpausedWatchers, "containsObject:", v4))
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10000E33C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        int v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ for %@ is present - disabling background synchronization",  (uint8_t *)&v10,  0x16u);
      }
    }

    -[NSMutableSet addObject:](self->_pausedWatchers, "addObject:", v4);
    -[NSMutableSet removeObject:](self->_unpausedWatchers, "removeObject:", v4);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engine, "scheduler"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    [v7 disableSynchronizationWithReason:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary supervisor](self->_engine, "supervisor"));
    [v9 pause];
  }
}

- (void)fileWatcherFileDidDisappear:(id)a3
{
  id v4 = a3;
  if (!self->_deactivated
    && !self->_stopping
    && !self->_stopped
    && -[NSMutableSet containsObject:](self->_pausedWatchers, "containsObject:", v4))
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10000E33C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        int v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ for %@ is absent - re-enabling background synchronization",  (uint8_t *)&v10,  0x16u);
      }
    }

    -[NSMutableSet addObject:](self->_unpausedWatchers, "addObject:", v4);
    -[NSMutableSet removeObject:](self->_pausedWatchers, "removeObject:", v4);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engine, "scheduler"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    [v7 enableSynchronizationWithReason:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary supervisor](self->_engine, "supervisor"));
    [v9 resume];
  }
}

- (CPLEngineParameters)parameters
{
  return self->_parameters;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPLEngineLibrary)engine
{
  return self->_engine;
}

- (NSURL)volumeURL
{
  return self->_volumeURL;
}

- (void)setVolumeURL:(id)a3
{
}

- (CPLEngineWrapperDelegate)delegate
{
  return (CPLEngineWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inEmergencyClosing
{
  return self->_inEmergencyClosing;
}

- (void)setInEmergencyClosing:(BOOL)a3
{
  self->_inEmergencyClosing = a3;
}

- (BOOL)stopping
{
  return self->_stopping;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (BOOL)deactivated
{
  return self->_deactivated;
}

- (void).cxx_destruct
{
}

@end