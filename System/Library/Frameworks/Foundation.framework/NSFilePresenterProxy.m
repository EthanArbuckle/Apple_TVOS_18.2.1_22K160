@interface NSFilePresenterProxy
+ (id)urlWithItemURL:(id)a3 subitemPath:(id)a4;
- (BOOL)allowedForURL:(id)a3;
- (BOOL)disconnected;
- (BOOL)inSubarbiter;
- (BOOL)shouldSendObservationMessageWithPurposeID:(id)a3;
- (BOOL)usesMainThreadDuringReliquishing;
- (NSFilePresenterProxy)initWithClient:(id)a3 remotePresenter:(id)a4 reactorID:(id)a5;
- (NSSet)observedUbiquityAttributes;
- (id)_clientProxy;
- (unint64_t)filePresenterResponses;
- (void)_settleNonCoordinatedChanges;
- (void)accommodateDeletionWithSubitemPath:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)disconnect;
- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 purposeID:(id)a5 subitemURL:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (void)forwardUsingProxy:(id)a3;
- (void)invalidate;
- (void)localFileWasEvicted;
- (void)observeChangeAtSubitemPath:(id)a3;
- (void)observeChangeOfUbiquityAttributes:(id)a3;
- (void)observeDisappearanceAtSubitemPath:(id)a3;
- (void)observeDisconnectionByWriterWithPurposeID:(id)a3;
- (void)observeMoveByWriterWithPurposeID:(id)a3 withPhysicalDestinationURL:(id)a4 withFSID:(fsid)a5 andFileID:(unint64_t)a6;
- (void)observeMoveOfSubitemAtURL:(id)a3 toURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7;
- (void)observeNewProvider:(id)a3;
- (void)observePresenterChange:(BOOL)a3 atSubitemURL:(id)a4;
- (void)observeReconnectionByWriterWithPurposeID:(id)a3;
- (void)observeSharingChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4;
- (void)observeUbiquityChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4;
- (void)observeVersionChangeOfKind:(id)a3 withClientID:(id)a4 name:(id)a5 subitemPath:(id)a6;
- (void)promisedFileWasFulfilled;
- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 resultHandler:(id)a6;
- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemPath:(id)a6 resultHandler:(id)a7;
- (void)saveChangesWithCompletionHandler:(id)a3;
- (void)setFilePresenterResponses:(unint64_t)a3;
- (void)setInSubarbiter:(BOOL)a3;
- (void)setItemLocation:(id)a3;
- (void)setObservedUbiquityAttributes:(id)a3;
- (void)setUsesMainThreadDuringReliquishing:(BOOL)a3;
- (void)startObservingApplicationStateWithQueue:(id)a3;
- (void)startWatchingWithQueue:(id)a3 lastEventID:(id)a4 unannouncedMoveHandler:(id)a5;
- (void)stopObservingApplicationState;
@end

@implementation NSFilePresenterProxy

- (NSFilePresenterProxy)initWithClient:(id)a3 remotePresenter:(id)a4 reactorID:(id)a5
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFilePresenterProxy;
  v6 = -[NSFileReactorProxy initWithClient:reactorID:](&v8, sel_initWithClient_reactorID_, a3, a5);
  if (v6) {
    v6->_remotePresenter = -[NSFilePresenterManagedProxy initWithXPCProxy:]( objc_alloc(&OBJC_CLASS___NSFilePresenterManagedProxy),  "initWithXPCProxy:",  a4);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFilePresenterProxy;
  -[NSFileReactorProxy dealloc](&v4, sel_dealloc);
}

- (id)_clientProxy
{
  return self->_remotePresenter;
}

- (void)setItemLocation:(id)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  itemLocation = self->super._itemLocation;
  if (itemLocation == a3) {
    goto LABEL_11;
  }
  id v6 = -[NSFileAccessNode itemProvider](itemLocation, "itemProvider");
  v7 = (void *)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation);
  char HasPresentersExcludingPresenter = _nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self);
  id v9 = -[NSFileAccessNode url](self->super._itemLocation, "url");
  -[NSFileAccessNode removePresenter:](self->super._itemLocation, "removePresenter:", self);
  self->super._itemLocation = (NSFileAccessNode *)a3;
  [a3 addPresenter:self];
  id v10 = -[NSFileAccessNode itemProvider](self->super._itemLocation, "itemProvider");
  id v11 = -[NSFileAccessNode url](self->super._itemLocation, "url");
  if (v6 != v10)
  {
    if (v6) {
      [v6 observePresentationChangeOfKind:@"removed" withPresenter:self url:v9 newURL:0];
    }
    if (v10) {
      [v10 observePresentationChangeOfKind:@"added" withPresenter:self url:v11 newURL:0];
    }
    -[NSFilePresenterProxy observeNewProvider:](self, "observeNewProvider:", v10);
    if ((HasPresentersExcludingPresenter & 1) != 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  [v6 observePresentationChangeOfKind:@"itemMoved" withPresenter:self url:v9 newURL:v11];
  if ((HasPresentersExcludingPresenter & 1) == 0) {
LABEL_8:
  }
    [v7 observePresenterChange:0 atSubitemURL:v9];
LABEL_9:
  if ((_nodeHasPresentersExcludingPresenter(self->super._itemLocation, (uint64_t)self) & 1) == 0) {
    [(id)_nearestPresenterInterestedInSubitemPresenters(self->super._itemLocation) observePresenterChange:1 atSubitemURL:v11];
  }
LABEL_11:
  watcher = self->_watcher;
  if (watcher)
  {
    v13 = self->super._itemLocation;
    if (v13)
    {
      -[NSFileWatcher setURL:](watcher, "setURL:", -[NSFileAccessNode url](v13, "url"));
    }

    else
    {
      -[NSFileWatcher stop](self->_watcher, "stop");
      -[NSFileWatcher setObserver:](self->_watcher, "setObserver:", 0LL);
    }
  }

  if (self->_processManager)
  {
    id v14 = -[NSFileAccessNode url](self->super._itemLocation, "url");
    if (v14)
    {
      v16[0] = v14;
      uint64_t v15 = [MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    -[NSFileAccessProcessManager setURLs:](self->_processManager, "setURLs:", v15);
  }

- (void)setFilePresenterResponses:(unint64_t)a3
{
  self->_filePresenterResponses = a3;
  objc_msgSend(self->_remotePresenter, "setFilePresenterResponses:");
}

- (BOOL)shouldSendObservationMessageWithPurposeID:(id)a3
{
  return ![a3 isEqual:self->super._reactorID] || self->_inSubarbiter;
}

- (void)forwardUsingProxy:(id)a3
{
  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = -[NSFilePresenterXPCMessenger initWithFilePresenterProxy:]( objc_alloc(&OBJC_CLASS___NSFilePresenterXPCMessenger),  "initWithFilePresenterProxy:",  self);
    self->_forwardedMessenger = forwardedMessenger;
  }

  objc_msgSend( a3,  "addPresenter:withID:fileURL:lastPresentedItemEventIdentifier:ubiquityAttributes:options:responses:",  forwardedMessenger,  self->super._reactorID,  -[NSFileAccessNode url](self->super._itemLocation, "url"),  0,  self->_observedUbiquityAttributes,  2 * self->_usesMainThreadDuringRelinquishing,  self->_filePresenterResponses);
}

- (void)invalidate
{
  self->_forwardedMessenger = 0LL;
  -[NSFilePresenterProxy setFilePresenterResponses:](self, "setFilePresenterResponses:", 0LL);
}

- (BOOL)allowedForURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if ([a3 isFileURL])
  {
    *(void *)v19 = 0LL;
    *(void *)&v19[8] = v19;
    *(void *)&v19[16] = 0x2020000000LL;
    char v20 = 0;
    id v5 = -[NSFileReactorProxy client](self, "client");
    if (v5)
    {
      [v5 auditToken];
    }

    else
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
    }

    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v18;
    if (sandbox_check_by_audit_token()
      && !objc_msgSend( (id)objc_msgSend(a3, "path"),  "containsString:",  @"/NanoPreferencesSync/NanoDomains/"))
    {
      v13[1] = 3221225472LL;
      __int128 v14 = v17;
      v13[0] = MEMORY[0x1895F87A8];
      v13[2] = __38__NSFilePresenterProxy_allowedForURL___block_invoke;
      v13[3] = &unk_189CA4DA8;
      __int128 v15 = v18;
      v13[4] = v19;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:usingBlock:]( &OBJC_CLASS___NSFileReactorProxy,  "_enumerateParentDirectoriesStartingAtURL:usingBlock:",  a3,  v13);
      if (!*(_BYTE *)(*(void *)&v19[8] + 24LL))
      {
        objc_super v8 = (os_log_s *)_NSFCPresenterLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id reactorID = self->super._reactorID;
          int v10 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          uint64_t v11 = [a3 path];
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v10;
          *(_WORD *)&buf[18] = 2113;
          *(void *)&buf[20] = v11;
          _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Registering presenter %{public}@ disallowed. Process %d is not allowed to access the requested path or any o f its parent directories: %{private}@",  buf,  0x1Cu);
        }
      }
    }

    else
    {
      *(_BYTE *)(*(void *)&v19[8] + 24LL) = 1;
    }

    BOOL v7 = *(_BYTE *)(*(void *)&v19[8] + 24LL) != 0;
    _Block_object_dispose(v19, 8);
  }

  else
  {
    id v6 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138543619;
      *(void *)&v19[4] = self;
      *(_WORD *)&v19[12] = 2113;
      *(void *)&v19[14] = a3;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Registering presenter %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@",  v19,  0x16u);
    }

    return 0;
  }

  return v7;
}

uint64_t __38__NSFilePresenterProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
{
  uint64_t v8 = [a2 fileSystemRepresentation];
  char v6 = 1;
  uint64_t result = sandbox_check_by_audit_token();
  if ((_DWORD)result)
  {
    uint64_t result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", 0, v8);
    char v6 = result;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  *a3 = v6;
  return result;
}

- (void)_settleNonCoordinatedChanges
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self->_didObserveNonCoordinatedChanges)
  {
    v3 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id reactorID = self->super._reactorID;
      int v5 = 138543362;
      id v6 = reactorID;
      _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "Presenter %{public}@ settling non-coordinated events",  (uint8_t *)&v5,  0xCu);
    }

    if (self->_didObserveMovingByWriter) {
      -[NSFileWatcher setURL:](self->_watcher, "setURL:", -[NSFileAccessNode url](self->super._itemLocation, "url"));
    }
    -[NSFileWatcher settle](self->_watcher, "settle");
    self->_didObserveMovingByWriter = 0;
    self->_didObserveNonCoordinatedChanges = 0;
  }

- (void)startWatchingWithQueue:(id)a3 lastEventID:(id)a4 unannouncedMoveHandler:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  self->_queue = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  id v9 = objc_alloc(&OBJC_CLASS___NSFileWatcher);
  client = self->super._client;
  if (client) {
    -[NSXPCConnection auditToken](client, "auditToken");
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  uint64_t v11 = -[NSFileWatcher initWithQueue:auditToken:](v9, "initWithQueue:auditToken:", a3, v14);
  self->_watcher = v11;
  -[NSFileWatcher setURL:](v11, "setURL:", -[NSFileAccessNode url](self->super._itemLocation, "url"));
  if (a4) {
    -[NSFileWatcher setLastObservedEventID:]( self->_watcher,  "setLastObservedEventID:",  [a4 unsignedLongLongValue]);
  }
  watcher = self->_watcher;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke;
  v13[3] = &unk_189CA4DF8;
  v13[4] = self;
  void v13[5] = a3;
  v13[6] = a4;
  v13[7] = a5;
  -[NSFileWatcher setObserver:](watcher, "setObserver:", v13);
  -[NSFileWatcher start](self->_watcher, "start");
}

void __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke( uint64_t a1,  uint64_t a2,  __int16 a3,  void *a4,  uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if ((a3 & 0x100) != 0)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 72LL))
    {
      id v9 = (os_log_s *)_NSFCPresenterLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16LL);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v10;
        _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Presenter %{public}@ detected non-coordinated event",  buf,  0xCu);
      }

      *(_BYTE *)(*(void *)(a1 + 32) + 125LL) = 1;
      dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_68;
      block[3] = &unk_189C9A030;
      v12 = *(dispatch_queue_s **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v11, v12, block);
    }
  }

  else
  {
    char v6 = a3;
    if ((a3 & 0x200) != 0)
    {
      if (a5 != -1 && *(void *)(a1 + 48)) {
        [*(id *)(*(void *)(a1 + 32) + 40) updateLastEventID:a5];
      }
    }

    else
    {
      if (!a2)
      {
        if ((a3 & 0x10) != 0)
        {
          uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 24) url];
          if (v14)
          {
            if (([a4 isEqual:v14] & 1) == 0)
            {
              *(void *)buf = 0LL;
              uint64_t v19 = 0LL;
              _NSGetFSIDAndFileID(a4, buf, &v19);
              (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
            }
          }
        }

        if ((v6 & 2) != 0)
        {
          uint64_t v15 = *(void *)(a1 + 32);
        }

        else
        {
          if ((v6 & 4) == 0) {
            return;
          }
          uint64_t v15 = *(void *)(a1 + 32);
          if (*(_BYTE *)(v15 + 121)) {
            return;
          }
        }

        __int128 v18 = *(void **)(*(void *)(a1 + 32) + 40LL);
        __int128 v17 = 0LL;
        goto LABEL_26;
      }

      uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) itemProvider];
      if (v8)
      {
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2;
        v20[3] = &unk_189CA4DD0;
        v20[4] = *(void *)(a1 + 32);
        [v8 provideLogicalURLForURL:a2 completionHandler:v20];
        return;
      }

      if ([*(id *)(a1 + 32) shouldSendObservationMessageWithPurposeID:*(void *)(*(void *)(a1 + 32) + 80)])
      {
        v16 = *(void **)(*(void *)(a1 + 32) + 40LL);
        __int128 v17 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( &OBJC_CLASS___NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  a2,  0LL);
        __int128 v18 = v16;
LABEL_26:
        [v18 observeChangeWithSubitemURL:v17];
      }
    }
  }

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_68( uint64_t a1)
{
  return [*(id *)(a1 + 32) _settleNonCoordinatedChanges];
}

uint64_t __82__NSFilePresenterProxy_startWatchingWithQueue_lastEventID_unannouncedMoveHandler___block_invoke_2( uint64_t result,  uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t result = [*(id *)(result + 32) shouldSendObservationMessageWithPurposeID:*(void *)(*(void *)(result + 32) + 80)];
    if ((_DWORD)result) {
      return [*(id *)(*(void *)(v3 + 32) + 40) observeChangeWithSubitemURL:a2];
    }
  }

  return result;
}

- (void)startObservingApplicationStateWithQueue:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!self->_inSubarbiter)
  {
    processManager = self->_processManager;
    if (processManager)
    {
      -[NSFileAccessProcessManager invalidate](processManager, "invalidate");
    }

    char v6 = -[NSFileAccessProcessManager initWithClient:queue:]( [NSFileAccessProcessManager alloc],  "initWithClient:queue:",  objc_msgSend(-[NSFileReactorProxy client](self, "client"), "_xpcConnection"),  a3);
    self->_processManager = v6;
    if ((self->_filePresenterResponses & 0xFFFFFFFF8000020FLL) != 0)
    {
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke;
      v9[3] = &unk_189CA4E20;
      v9[4] = self;
      -[NSFileAccessProcessManager setSuspensionHandler:](v6, "setSuspensionHandler:", v9);
    }

    id v7 = -[NSFileAccessNode url](self->super._itemLocation, "url");
    if (v7)
    {
      v10[0] = v7;
      uint64_t v8 = [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    -[NSFileAccessProcessManager setURLs:](self->_processManager, "setURLs:", v8);
    [self->_remotePresenter setProcessManager:self->_processManager];
  }

uint64_t __64__NSFilePresenterProxy_startObservingApplicationStateWithQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) logSuspensionWarning];
}

- (void)stopObservingApplicationState
{
  self->_processManager = 0LL;
  [self->_remotePresenter setProcessManager:0];
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 resultHandler:(id)a6
{
}

+ (id)urlWithItemURL:(id)a3 subitemPath:(id)a4
{
  id result = (id)[a4 count];
  if (result)
  {
    uint64_t v7 = objc_msgSend( (id)objc_msgSend(a3, "path"),  "stringByAppendingPathComponent:",  +[NSString pathWithComponents:](NSString, "pathWithComponents:", a4));
    return (id)[MEMORY[0x189604030] fileURLWithPath:v7];
  }

  return result;
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemPath:(id)a6 resultHandler:(id)a7
{
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  v5[5] = *MEMORY[0x1895F89C0];
  id remotePresenter = self->_remotePresenter;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke;
  v5[3] = &unk_189CA4430;
  v5[4] = a3;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_79;
  v4[3] = &unk_189CA4430;
  v4[4] = a3;
  objc_msgSend( (id)objc_msgSend(remotePresenter, "remoteObjectProxyWithErrorHandler:", v5),  "saveChangesWithCompletionHandler:",  v4);
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_super v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"saveChanges";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __57__NSFilePresenterProxy_saveChangesWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)accommodateDeletionWithSubitemPath:(id)a3 completionHandler:(id)a4
{
  void v9[5] = *MEMORY[0x1895F89C0];
  id v6 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( &OBJC_CLASS___NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a3);
  id remotePresenter = self->_remotePresenter;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke;
  v9[3] = &unk_189CA4430;
  v9[4] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_82;
  v8[3] = &unk_189CA4430;
  v8[4] = a4;
  objc_msgSend( (id)objc_msgSend(remotePresenter, "remoteObjectProxyWithErrorHandler:", v9),  "accommodateDeletionOfSubitemAtURL:completionHandler:",  +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  v6,  0),  v8);
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_super v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"accommodateDeletion";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __77__NSFilePresenterProxy_accommodateDeletionWithSubitemPath_completionHandler___block_invoke_82( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)observeMoveByWriterWithPurposeID:(id)a3 withPhysicalDestinationURL:(id)a4 withFSID:(fsid)a5 andFileID:(unint64_t)a6
{
  self->_didObserveMovingByWriter = 1;
  uint64_t v10 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( &OBJC_CLASS___NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  a3))
  {
    [self->_remotePresenter observeMoveToURL:v10 withSubitemURL:0 byWriterWithPurposeID:a3 withFSID:a5 andFileID:a6];
  }

- (void)observeMoveOfSubitemAtURL:(id)a3 toURL:(id)a4 byWriterWithPurposeID:(id)a5 withFSID:(fsid)a6 andFileID:(unint64_t)a7
{
  if (!a3) {
    self->_didObserveMovingByWriter = 1;
  }
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  a5))
  {
    [self->_remotePresenter observeMoveToURL:a4 withSubitemURL:a3 byWriterWithPurposeID:a5 withFSID:a6 andFileID:a7];
  }

- (void)observeDisconnectionByWriterWithPurposeID:(id)a3
{
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  a3))
  {
    [self->_remotePresenter observeDisconnection];
  }

  -[NSFileWatcher stop](self->_watcher, "stop");
  -[NSFilePresenterProxy disconnect](self, "disconnect");
}

- (void)observeReconnectionByWriterWithPurposeID:(id)a3
{
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  a3))
  {
    [self->_remotePresenter observeReconnection];
  }

- (void)observeUbiquityChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  int v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( &OBJC_CLASS___NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( &OBJC_CLASS___NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a3),  a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  self->_currentWriterPurposeID))
  {
    [self->_remotePresenter observeUbiquityChangeWithSubitemURL:v5];
  }

- (void)observeSharingChangeAtSubitemPath:(id)a3 withPhysicalURL:(id)a4
{
  int v5 = +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( &OBJC_CLASS___NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( &OBJC_CLASS___NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a3),  a4);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  self->_currentWriterPurposeID))
  {
    [self->_remotePresenter observeSharingChangeWithSubitemURL:v5];
  }

- (void)observeChangeOfUbiquityAttributes:(id)a3
{
  observedUbiquityAttributes = self->_observedUbiquityAttributes;
  if (!observedUbiquityAttributes
    || -[NSSet count](observedUbiquityAttributes, "count")
    && (int v6 = (void *)[a3 mutableCopy],
        [v6 intersectSet:self->_observedUbiquityAttributes],
        a3 = v6,
        [a3 count]))
  {
    if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  self->_currentWriterPurposeID))
    {
      [self->_remotePresenter observeChangeOfUbiquityAttributes:a3];
    }
  }

- (void)observeDisappearanceAtSubitemPath:(id)a3
{
  if ([a3 count])
  {
    id v5 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( &OBJC_CLASS___NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a3);
    if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  self->_currentWriterPurposeID))
    {
      objc_msgSend( self->_remotePresenter,  "observeChangeWithSubitemURL:",  +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  v5,  0));
    }
  }

- (void)observeChangeAtSubitemPath:(id)a3
{
  id v4 = +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( &OBJC_CLASS___NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a3);
  if (-[NSFilePresenterProxy shouldSendObservationMessageWithPurposeID:]( self,  "shouldSendObservationMessageWithPurposeID:",  self->_currentWriterPurposeID))
  {
    objc_msgSend( self->_remotePresenter,  "observeChangeWithSubitemURL:",  +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  v4,  0));
  }

- (void)observeVersionChangeOfKind:(id)a3 withClientID:(id)a4 name:(id)a5 subitemPath:(id)a6
{
  self->_didObserveVersionChangingByWriter = 1;
  objc_msgSend( self->_remotePresenter,  "observeVersionChangeOfKind:toItemAtURL:withClientID:name:",  a3,  +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  +[NSFilePresenterProxy urlWithItemURL:subitemPath:]( NSFilePresenterProxy,  "urlWithItemURL:subitemPath:",  -[NSFileAccessNode standardizedURL](self->super._itemLocation, "standardizedURL"),  a6),  0),  a4,  a5);
}

- (void)observePresenterChange:(BOOL)a3 atSubitemURL:(id)a4
{
  if (!self->_inSubarbiter) {
    objc_msgSend( self->_remotePresenter,  "observePresenterChange:forSubitemAtURL:",  a3,  +[NSURLPromisePair pairWithLogicalURL:physicalURL:]( NSURLPromisePair,  "pairWithLogicalURL:physicalURL:",  a4,  0));
  }
}

- (void)observeNewProvider:(id)a3
{
  if (!self->_inSubarbiter) {
    objc_msgSend(self->_remotePresenter, "setProviderPurposeIdentifier:", objc_msgSend(a3, "reactorID"));
  }
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 purposeID:(id)a5 subitemURL:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  unint64_t v9 = a7;
  id v10 = a6;
  BOOL v13 = a3;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v15 = MEMORY[0x1895F87A8];
  if (a3 && self->_watcher)
  {
    -[NSFilePresenterProxy _settleNonCoordinatedChanges](self, "_settleNonCoordinatedChanges");
    id currentWriterPurposeID = self->_currentWriterPurposeID;
    self->_id currentWriterPurposeID = (id)[a5 copy];
    ++self->_writingRelinquishmentCount;
    if (currentWriterPurposeID)
    {
      previousWriterPurposeIDs = self->_previousWriterPurposeIDs;
      if (!previousWriterPurposeIDs)
      {
        previousWriterPurposeIDs = (NSMutableArray *)objc_opt_new();
        self->_previousWriterPurposeIDs = previousWriterPurposeIDs;
      }

      -[NSMutableArray addObject:](previousWriterPurposeIDs, "addObject:", currentWriterPurposeID);
    }

    v31[0] = v15;
    v31[1] = 3221225472LL;
    v31[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2;
    v31[3] = &unk_189CA3B18;
    v31[4] = self;
    __int128 v18 = v31;
    id v10 = a6;
    unint64_t v9 = a7;
  }

  else
  {
    __int128 v18 = &__block_literal_global_77;
  }

  if ([a5 isEqual:self->super._reactorID] && !self->_inSubarbiter)
  {
    v25[0] = v15;
    v25[1] = 3221225472LL;
    v25[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3;
    v25[3] = &unk_189CA4F00;
    v25[4] = v18;
    (*((void (**)(id, uint64_t, void, void *))a8 + 2))(a8, 1LL, 0LL, v25);
  }

  else
  {
    v29[0] = v15;
    v29[1] = 3221225472LL;
    v29[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_86;
    v29[3] = &unk_189CA4ED8;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a8;
    v29[7] = v18;
    BOOL v30 = v13;
    id remotePresenter = self->_remotePresenter;
    v28[0] = v15;
    v28[1] = 3221225472LL;
    v28[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_94;
    v28[3] = &unk_189CA4430;
    v28[4] = v29;
    char v20 = (void *)[remotePresenter remoteObjectProxyWithErrorHandler:v28];
    uint64_t v21 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id reactorID = self->super._reactorID;
      *(_DWORD *)buf = 138543618;
      id v33 = reactorID;
      __int16 v34 = 2114;
      id v35 = a4;
      _os_log_impl( &dword_182EB1000,  v21,  OS_LOG_TYPE_DEFAULT,  "Asking presenter %{public}@ to relinquish to claim %{public}@",  buf,  0x16u);
    }

    if (v13)
    {
      v27[0] = v15;
      v27[1] = 3221225472LL;
      v27[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_97;
      v27[3] = &unk_189CA4430;
      v27[4] = v29;
      [v20 relinquishToWritingClaimWithID:a4 options:v9 purposeID:a5 subitemURL:v10 completionHandler:v27];
    }

    else
    {
      v26[0] = v15;
      v26[1] = 3221225472LL;
      v26[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_98;
      v26[3] = &unk_189CA4430;
      v26[4] = v29;
      [v20 relinquishToReadingClaimWithID:a4 options:v9 purposeID:a5 completionHandler:v26];
    }
  }

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!*(void *)(*(void *)(a1 + 32) + 72LL))
  {
    id v4 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "A file presenter is being asked to reacquire from a writer more times than it's been asked to relinquish",  buf,  2u);
    }
  }

  --*(void *)(*(void *)(a1 + 32) + 72LL);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 72))
  {

    *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(*(void *)(a1 + 32) + 88) lastObject];
    [*(id *)(*(void *)(a1 + 32) + 88) removeLastObject];
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }

  else
  {
    int v6 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16LL);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v7;
      _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_INFO,  "Deferring presenter %{public}@ reaquistion for .5 seconds",  buf,  0xCu);
    }

    dispatch_time_t v8 = dispatch_time(0LL, 500000000LL);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(dispatch_queue_s **)(v9 + 56);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_85;
    v11[3] = &unk_189C9FF78;
    v11[4] = v9;
    v11[5] = a2;
    dispatch_after(v8, v10, v11);
  }

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_85( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 120))
  {
    objc_msgSend(*(id *)(v2 + 64), "setURL:", objc_msgSend(*(id *)(v2 + 24), "url"));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  [*(id *)(v2 + 64) settle];

  *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
  *(_BYTE *)(*(void *)(a1 + 32) + 120LL) = 0;
  *(_BYTE *)(*(void *)(a1 + 32) + 121LL) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_86( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v6 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16LL);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_DEFAULT,  "Received relinquishment reply for presenter %{public}@ to claim %{public}@",  buf,  0x16u);
  }

  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_87;
  v15[3] = &unk_189CA4EB0;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  char v18 = a2;
  __int128 v16 = *(_OWORD *)(a1 + 32);
  char v19 = *(_BYTE *)(a1 + 64);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))( v13,  a2,  a3,  v15,  v7,  v8,  v9,  v10);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_87( uint64_t a1,  uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 48);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_88;
  v4[3] = &unk_189CA4E88;
  __int16 v7 = *(_WORD *)(a1 + 56);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = a2;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_88( uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(a1 + 56)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Telling presenter %{public}@ to reacquire after claim %{public}@",  buf,  0x16u);
  }

  __int128 v5 = *(void **)(*(void *)(a1 + 32) + 40LL);
  if (*(_BYTE *)(a1 + 57))
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_89;
    v13[3] = &unk_189CA4430;
    v13[4] = *(void *)(a1 + 48);
    __int16 v7 = (void *)[v5 remoteObjectProxyWithErrorHandler:v13];
    v12[0] = v6;
    v12[1] = 3221225472LL;
    v12[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_92;
    v12[3] = &unk_189CA37F0;
    v12[4] = *(void *)(a1 + 32);
    return [v7 reacquireFromWritingClaimForID:*(void *)(a1 + 40) completionHandler:v12];
  }

  else
  {
    [v5 reacquireFromReadingClaimForID:*(void *)(a1 + 40)];
    uint64_t v9 = (os_log_s *)_NSFCPresenterLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16LL);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_INFO,  "Not waiting for reacquisition reply for presenter %{public}@ after claim %{public}@",  buf,  0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_89( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    __int16 v7 = @"reacquire";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_92( void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSFCPresenterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[4] + 16LL);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Received reacquisition reply for presenter %{public}@ after claim %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_94( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"relinquish";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_97( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_2_98( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  void v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4;
  v8[3] = &unk_189C9DCE8;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))( v6,  v8,  a3,  a4,  a5,  a6);
}

uint64_t __115__NSFilePresenterProxy_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)disconnect
{
  self->_disconnected = 1;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)promisedFileWasFulfilled
{
}

- (void)localFileWasEvicted
{
}

- (BOOL)inSubarbiter
{
  return self->_inSubarbiter;
}

- (void)setInSubarbiter:(BOOL)a3
{
  self->_inSubarbiter = a3;
}

- (BOOL)usesMainThreadDuringReliquishing
{
  return self->_usesMainThreadDuringRelinquishing;
}

- (void)setUsesMainThreadDuringReliquishing:(BOOL)a3
{
  self->_usesMainThreadDuringRelinquishing = a3;
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setObservedUbiquityAttributes:(id)a3
{
}

- (unint64_t)filePresenterResponses
{
  return self->_filePresenterResponses;
}

@end