@interface SHMediaLibrarySyncManager
- (NSLock)syncCompletionLock;
- (NSUUID)taskID;
- (NSUUID)workerID;
- (SHMediaLibraryClient)client;
- (SHMediaLibraryController)controller;
- (SHMediaLibrarySyncDelegate)delegate;
- (SHMediaLibrarySyncManager)initWithClient:(id)a3 completionHandler:(id)a4;
- (SHWorkerDelegate)workerDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4;
- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5;
- (void)_libraryDidCompleteSync:(id)a3;
- (void)_libraryWillBeginSync:(id)a3;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 controller:(id)a5;
- (void)finishSyncing;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)updateSnapshotWithAttribution:(id)a3;
@end

@implementation SHMediaLibrarySyncManager

- (SHMediaLibrarySyncManager)initWithClient:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = objc_retainBlock(a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHMediaLibrarySyncManager;
  v10 = -[SHMediaLibrarySyncManager init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_client, a3);
    v12 = objc_alloc_init(&OBJC_CLASS___NSLock);
    syncCompletionLock = v11->_syncCompletionLock;
    v11->_syncCompletionLock = v12;
  }

  return v11;
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
  id v9 = [v8 type];

  if (!v9)
  {
    NSErrorUserInfoKey v34 = NSDebugDescriptionErrorKey;
    v35 = @"Invalid client Bundle ID or Team ID";
    v24 = &v35;
    v25 = &v34;
LABEL_9:
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  1LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  400LL,  0LL,  v28));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager delegate](self, "delegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 allItemIdentifiers]);
    [v30 _library:self didProduceError:v29 failedItemIdentifiers:v31];

    v32 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager completionHandler](self, "completionHandler"));
    v32[2]();

    goto LABEL_10;
  }

  if (v9 == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 credentials]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attribution]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 containingAppBundleIdentifier]);
    unsigned __int8 v14 = [v6 validateWithBundleIdentifier:v13];

    if ((v14 & 1) == 0)
    {
      uint64_t v26 = sh_log_object(v15);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to synchronize library, snapshot contains invalid changes",  v33,  2u);
      }

      NSErrorUserInfoKey v36 = NSDebugDescriptionErrorKey;
      v37 = @"No permisison to sync media library changes";
      v24 = &v37;
      v25 = &v36;
      goto LABEL_9;
    }
  }

  v16 = objc_alloc(&OBJC_CLASS___SHMediaLibraryController);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 credentials]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 attribution]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 containingAppBundleIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 credentials]);
  v23 = -[SHMediaLibraryController initWithBundleIdentifier:clientType:]( v16,  "initWithBundleIdentifier:clientType:",  v20,  [v22 clientType]);

  -[SHMediaLibrarySyncManager _synchronizeSnapshot:startCondition:controller:]( self,  "_synchronizeSnapshot:startCondition:controller:",  v6,  v7,  v23);
LABEL_10:
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4 controller:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  -[SHMediaLibrarySyncManager updateSnapshotWithAttribution:](self, "updateSnapshotWithAttribution:", v11);
  v12 = objc_alloc(&OBJC_CLASS___SHMediaLibraryContext);

  unsigned __int8 v14 = -[SHMediaLibraryContext initWithSnapshot:startCondition:](v12, "initWithSnapshot:startCondition:", v11, v10);
  -[SHMediaLibraryContext setDelegate:](v14, "setDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager controller](self, "controller"));
  [v13 synchronizeWithContext:v14];
}

- (void)_libraryWillBeginSync:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager delegate](self, "delegate", a3));
  [v4 _libraryWillBeginSync:self];
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
  id v8 = [v7 type];

  if (v8 == (id)2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 credentials]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attribution]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 containingAppBundleIdentifier]);
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[SHMediaLibrarySnapshot remapSnapshot:withBundleIdentifier:]( &OBJC_CLASS___SHMediaLibrarySnapshot,  "remapSnapshot:withBundleIdentifier:",  v6,  v13));

    if (!v9) {
      goto LABEL_9;
    }
  }

  else
  {
    if (v8 != (id)1)
    {
      id v9 = 0LL;
      goto LABEL_9;
    }

    id v9 = [v6 copy];
    if (!v9) {
      goto LABEL_9;
    }
  }

  if ([v9 hasChanges])
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v14 postNotificationName:SHMediaLibrarySyncDidChangeNotification object:0];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager delegate](self, "delegate"));
    [v15 _library:v16 didChangeWithSnapshot:v9];
  }

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
  id v9 = [v8 type];

  if (v9 == (id)1 || v9 == (id)2 && objc_msgSend(v13, "sh_isMediaLibraryPublicError"))
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[SHError remapErrorToClientError:](&OBJC_CLASS___SHError, "remapErrorToClientError:", v13));
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager delegate](self, "delegate"));
      [v12 _library:self didProduceError:v11 failedItemIdentifiers:v7];
    }
  }
}

- (void)_libraryDidCompleteSync:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager delegate](self, "delegate"));
  [v5 _libraryDidCompleteSync:self];

  id v6 = v4;
  uint64_t v7 = sh_log_object(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager completionHandler](self, "completionHandler"));
    id v10 = objc_retainBlock(v9);
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling completion handler %@ on library controller %@",  (uint8_t *)&v11,  0x16u);
  }

  -[SHMediaLibrarySyncManager finishSyncing](self, "finishSyncing");
  -[SHMediaLibrarySyncManager shutdownWorker](self, "shutdownWorker");
}

- (void)finishSyncing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager syncCompletionLock](self, "syncCompletionLock"));
  [v3 lock];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager completionHandler](self, "completionHandler"));
  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager completionHandler](self, "completionHandler"));
    v5[2]();

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0LL;
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager syncCompletionLock](self, "syncCompletionLock"));
  [v7 unlock];
}

- (void)shutdownWorker
{
  controller = self->_controller;
  self->_controller = 0LL;

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager workerDelegate](self, "workerDelegate"));
  [v4 finishedWorker:self];

  -[SHMediaLibrarySyncManager finishSyncing](self, "finishSyncing");
}

- (void)updateSnapshotWithAttribution:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changes]);
  id v5 = [v4 count];

  if (v5)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v26 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 changes]);
    id v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    id v10 = &AMSErrorDomain_ptr;
    while (1)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 libraryItem]);
        uint64_t v15 = objc_opt_class(v10[170], v14);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
        {
          id v16 = [v12 changeType];

          if (v16 == (id)3) {
            continue;
          }
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 libraryItem]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v13 providerIdentifier]);

          if (!v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
            v19 = (void *)objc_claimAutoreleasedReturnValue([v18 credentials]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 attribution]);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 containingAppBundleIdentifier]);
            [v13 setProviderIdentifier:v21];

            id v10 = &AMSErrorDomain_ptr;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibrarySyncManager client](self, "client"));
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 credentials]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 attribution]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 productName]);
            [v13 setProviderName:v25];
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v8)
      {
LABEL_14:

        id v3 = v26;
        break;
      }
    }
  }
}

- (NSUUID)workerID
{
  workerID = self->_workerID;
  if (!workerID)
  {
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = self->_workerID;
    self->_workerID = v4;

    workerID = self->_workerID;
  }

  return workerID;
}

- (NSUUID)taskID
{
  taskID = self->_taskID;
  if (!taskID)
  {
    id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = self->_taskID;
    self->_taskID = v4;

    taskID = self->_taskID;
  }

  return taskID;
}

- (int64_t)executionScope
{
  return 0LL;
}

- (SHMediaLibrarySyncDelegate)delegate
{
  return (SHMediaLibrarySyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHWorkerDelegate)workerDelegate
{
  return (SHWorkerDelegate *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
}

- (SHMediaLibraryClient)client
{
  return self->_client;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSLock)syncCompletionLock
{
  return self->_syncCompletionLock;
}

- (SHMediaLibraryController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end