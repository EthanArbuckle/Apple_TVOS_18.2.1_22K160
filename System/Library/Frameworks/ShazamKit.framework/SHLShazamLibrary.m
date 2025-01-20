@interface SHLShazamLibrary
+ (SHLShazamLibrary)defaultLibrary;
- (BOOL)isValidCallingProcessIdentifier:(id)a3;
- (BOOL)shouldPerformFetch;
- (NSProgress)syncProgress;
- (SHLFailedTaskRetryHandler)retryHandler;
- (SHLLibraryStore)store;
- (SHLShazamLibrary)initWithCallingProcessIdentifier:(id)a3;
- (SHLShazamLibrary)initWithScope:(int64_t)a3 callingProcessIdentifier:(id)a4;
- (SHLShazamLibraryDelegate)delegate;
- (SHLSyncSession)syncSession;
- (SHLSyncSessionConfiguration)configuration;
- (id)newFetchTaskWithStartCondition:(id)a3;
- (id)newModifyTaskWithChanges:(id)a3 startCondition:(id)a4;
- (id)taskWithFailedItemsAndCurrentChanges:(id)a3;
- (int64_t)syncActionForTaskType:(int64_t)a3;
- (void)clearCachedSyncStatus;
- (void)finishSession:(id)a3;
- (void)migrateCacheIfNeeded;
- (void)retryFailedTasks:(id)a3;
- (void)session:(id)a3 task:(id)a4 didDeleteItemsWithIdentifiers:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchDeletedItemsWithIdentifiers:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchGroups:(id)a5;
- (void)session:(id)a3 task:(id)a4 didFetchTracks:(id)a5;
- (void)session:(id)a3 task:(id)a4 didModifyGroups:(id)a5;
- (void)session:(id)a3 task:(id)a4 didModifyTracks:(id)a5;
- (void)session:(id)a3 task:(id)a4 didProduceOutcome:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRetryHandler:(id)a3;
- (void)setShouldPerformFetch:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setSyncProgress:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)synchronizeChanges:(id)a3 startCondition:(id)a4;
- (void)synchronizeWithStartCondition:(id)a3;
- (void)updateProgressWithTask:(id)a3;
@end

@implementation SHLShazamLibrary

- (SHLShazamLibrary)initWithCallingProcessIdentifier:(id)a3
{
  return -[SHLShazamLibrary initWithScope:callingProcessIdentifier:]( self,  "initWithScope:callingProcessIdentifier:",  1LL,  a3);
}

- (SHLShazamLibrary)initWithScope:(int64_t)a3 callingProcessIdentifier:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SHLShazamLibrary;
  v7 = -[SHLShazamLibrary init](&v21, "init");
  if (v7)
  {
    v8 = objc_alloc(&OBJC_CLASS___SHLSyncSessionConfiguration);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v10 = -[SHLSyncSessionConfiguration initWithType:scope:callingProcessIdentifier:sessionIdentifier:]( v8,  "initWithType:scope:callingProcessIdentifier:sessionIdentifier:",  0LL,  a3,  v6,  v9);
    configuration = v7->_configuration;
    v7->_configuration = v10;

    v12 = -[SHLLibraryStore initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLLibraryStore),  "initWithConfiguration:",  v7->_configuration);
    store = v7->_store;
    v7->_store = v12;

    -[SHLShazamLibrary migrateCacheIfNeeded](v7, "migrateCacheIfNeeded");
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 0LL));
    syncProgress = v7->_syncProgress;
    v7->_syncProgress = (NSProgress *)v14;

    v7->_shouldPerformFetch = 1;
    v16 = -[SHLSyncSession initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLSyncSession),  "initWithConfiguration:",  v7->_configuration);
    syncSession = v7->_syncSession;
    v7->_syncSession = v16;

    -[SHLSyncSession setDelegate:](v7->_syncSession, "setDelegate:", v7);
    v18 = objc_alloc_init(&OBJC_CLASS___SHLFailedTaskRetryHandler);
    retryHandler = v7->_retryHandler;
    v7->_retryHandler = v18;
  }

  return v7;
}

- (void)synchronizeWithStartCondition:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SHLLibraryChangeset);
  -[SHLShazamLibrary synchronizeChanges:startCondition:](self, "synchronizeChanges:startCondition:", v5, v4);
}

- (void)synchronizeChanges:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002D0D8();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sync started with startCondition: %{public}@",  buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "libraryWillBeginSync:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v12 libraryWillBeginSync:self];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
  id v40 = 0LL;
  unsigned __int8 v14 = [v13 startTransactionWithError:&v40];
  id v15 = v40;

  if ((v14 & 1) != 0)
  {
    if (-[SHLShazamLibrary shouldPerformFetch](self, "shouldPerformFetch"))
    {
      id v16 = -[SHLShazamLibrary newFetchTaskWithStartCondition:](self, "newFetchTaskWithStartCondition:", v7);
      -[SHLShazamLibrary updateProgressWithTask:](self, "updateProgressWithTask:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
      [v17 executeTask:v16];
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v18 =  -[SHLShazamLibrary newModifyTaskWithChanges:startCondition:]( self,  "newModifyTaskWithChanges:startCondition:",  v6,  v7);
    id v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
          -[SHLShazamLibrary updateProgressWithTask:](self, "updateProgressWithTask:", v23, (void)v36);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
          [v24 executeTask:v23];
        }

        id v20 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v20);
    }

    if (!-[SHLShazamLibrary shouldPerformFetch](self, "shouldPerformFetch") && ![v18 count])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
      objc_msgSend(v25, "shl_markIndeterminate");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
      [v26 commitTransactionWithError:0];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
      char v28 = objc_opt_respondsToSelector(v27, "library:didCompleteSyncWithCompletionHandler:");

      if ((v28 & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
        [v29 library:self didCompleteSyncWithCompletionHandler:&stru_10006DB40];
      }
    }

    goto LABEL_24;
  }

  if (v15)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    char v31 = objc_opt_respondsToSelector(v30, "library:didProduceError:withFailedItemIdentifiers:syncAction:");

    if ((v31 & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[SHLError errorWithCode:underlyingError:]( &OBJC_CLASS___SHLError,  "errorWithCode:underlyingError:",  5LL,  v15));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
      [v33 library:self didProduceError:v32 withFailedItemIdentifiers:&__NSArray0__struct syncAction:1];
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v35 = objc_opt_respondsToSelector(v34, "library:didCompleteSyncWithCompletionHandler:");

  if ((v35 & 1) != 0)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v18 library:self didCompleteSyncWithCompletionHandler:&stru_10006DB20];
LABEL_24:
  }
}

- (void)clearCachedSyncStatus
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary store](self, "store"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 currentCache]);
  [v2 resetWithError:0];
}

- (void)session:(id)a3 task:(id)a4 didProduceOutcome:(id)a5
{
  id v47 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
  char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 tasksToRetry]);
  if ([v13 count])
  {
    BOOL v14 = 0;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
    BOOL v14 = v15 == 0LL;
  }

  if (+[SHLError canRetryForError:](&OBJC_CLASS___SHLError, "canRetryForError:", v12))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 tasksToRetry]);
    if ([v16 count]) {
      BOOL v17 = (uint64_t)[v8 retryCount] < 5;
    }
    else {
      BOOL v17 = 0;
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  if (!v14 && !v17)
  {
    id v18 = sub_10002D0D8();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class(v8);
      uint64_t v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
      *(_DWORD *)buf = 138543874;
      v52 = v22;
      __int16 v53 = 2112;
      v54 = v23;
      __int16 v55 = 2112;
      v56 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to complete <task: %{public}@ %@> and not retrying due to <error: %@>",  buf,  0x20u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    char v26 = objc_opt_respondsToSelector(v25, "library:didProduceError:withFailedItemIdentifiers:syncAction:");

    if ((v26 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
      char v28 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v9 failedItemIdentifiers]);
      objc_msgSend( v27,  "library:didProduceError:withFailedItemIdentifiers:syncAction:",  self,  v28,  v29,  -[SHLShazamLibrary syncActionForTaskType:](self, "syncActionForTaskType:", objc_msgSend(v8, "type")));
    }
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
  unsigned int v31 = [v30 isFinished];

  if (v31)
  {
    id v32 = sub_10002D0D8();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v34 = (objc_class *)objc_opt_class(v8);
      char v35 = NSStringFromClass(v34);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543618;
      v52 = v36;
      __int16 v53 = 2112;
      v54 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "Finished <task: %{public}@ %@> and sync complete",  buf,  0x16u);
    }

    -[SHLShazamLibrary finishSession:](self, "finishSession:", v8);
  }

  else if (v14 || !v17)
  {
    id v38 = sub_10002D0D8();
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      id v40 = (objc_class *)objc_opt_class(v8);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543618;
      v52 = v42;
      __int16 v53 = 2112;
      v54 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "Finished <task: %{public}@ %@>, still syncing",  buf,  0x16u);
    }
  }

  else
  {
    objc_initWeak((id *)buf, self);
    v44 = objc_alloc(&OBJC_CLASS___SHLTaskRetryContext);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100033E90;
    v48[3] = &unk_10006CC78;
    objc_copyWeak(&v50, (id *)buf);
    id v49 = v9;
    v45 = -[SHLTaskRetryContext initWithOutcome:retryBlock:](v44, "initWithOutcome:retryBlock:", v49, v48);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary retryHandler](self, "retryHandler"));
    [v46 retryTask:v8 withContext:v45];

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);
  }
}

- (void)finishSession:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
  objc_msgSend(v5, "shl_markIndeterminate");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v7 = objc_opt_respondsToSelector(v6, "library:didCompleteSyncWithCompletionHandler:");

  if ((v7 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100033FDC;
    v10[3] = &unk_10006DB68;
    id v11 = v4;
    v12 = self;
    [v8 library:self didCompleteSyncWithCompletionHandler:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
    [v9 commitTransactionWithError:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didModifyTracks:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Uploaded %lu modified tracks",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didChangeTracks:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didChangeTracks:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didModifyGroups:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Uploaded %lu modified groups",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didChangeGroups:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didChangeGroups:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didDeleteItemsWithIdentifiers:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Deleted %lu items", (uint8_t *)&v12, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didDeleteItemsWithIdentifiers:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didDeleteItemsWithIdentifiers:v6 syncAction:0];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchTracks:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Fetched %lu tracks", (uint8_t *)&v12, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didChangeTracks:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didChangeTracks:v6 syncAction:1];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchGroups:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Fetched %lu groups", (uint8_t *)&v12, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didChangeGroups:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didChangeGroups:v6 syncAction:1];
  }
}

- (void)session:(id)a3 task:(id)a4 didFetchDeletedItemsWithIdentifiers:(id)a5
{
  id v6 = a5;
  id v7 = sub_10002D0D8();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Fetched %lu deleted items", (uint8_t *)&v12, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
  char v10 = objc_opt_respondsToSelector(v9, "library:didDeleteItemsWithIdentifiers:syncAction:");

  if ((v10 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary delegate](self, "delegate"));
    [v11 library:self didDeleteItemsWithIdentifiers:v6 syncAction:1];
  }
}

- (id)newModifyTaskWithChanges:(id)a3 startCondition:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SHLShazamLibrary taskWithFailedItemsAndCurrentChanges:]( self,  "taskWithFailedItemsAndCurrentChanges:",  a3));
  id v8 = v7;
  if (v7)
  {
    [v7 setSyncStartCondition:v6];
    if ((uint64_t)[v8 size] <= 200)
    {
      int v12 = v8;
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    }

    else
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdivideTaskIntoBatchesOfSize:"));
    }

    char v10 = (void *)v9;
  }

  else
  {
    char v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)newFetchTaskWithStartCondition:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SHLSyncSessionFetchTask);
  -[SHLSyncSessionFetchTask setSyncStartCondition:](v4, "setSyncStartCondition:", v3);
  unsigned int v5 = [v3 isEqualToString:@"InitialFetch"];

  -[SHLSyncSessionFetchTask setFetchType:](v4, "setFetchType:", v5 ^ 1);
  return v4;
}

- (id)taskWithFailedItemsAndCurrentChanges:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tracksToAdd]);
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v5));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 trackIDsToDelete]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 groupsToAdd]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v8));

  v42 = v4;
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v4 groupIDsToDelete]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v10));

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary store](self, "store"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentCache]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tasksOfType:1]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary store](self, "store"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentCache]);
  [v16 removeAllTasksOfType:1];

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v17 = v14;
  id v18 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if (![v22 type])
        {
          id v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 tracksToModify]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 insertions]);
          [v43 unionSet:v25];

          char v26 = (void *)objc_claimAutoreleasedReturnValue([v23 tracksToModify]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 deletions]);
          [v7 unionSet:v27];

          char v28 = (void *)objc_claimAutoreleasedReturnValue([v23 groupsToModify]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v28 insertions]);
          [v9 unionSet:v29];

          v30 = (void *)objc_claimAutoreleasedReturnValue([v23 groupsToModify]);
          unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 deletions]);
          [v11 unionSet:v31];
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v19);
  }

  id v32 = objc_alloc(&OBJC_CLASS___SHLLibraryBatch);
  id v33 = [v43 copy];
  id v34 = [v7 copy];
  char v35 = -[SHLLibraryBatch initWithInsertions:deletions:](v32, "initWithInsertions:deletions:", v33, v34);

  __int128 v36 = objc_alloc(&OBJC_CLASS___SHLLibraryBatch);
  id v37 = [v9 copy];
  id v38 = [v11 copy];
  __int128 v39 = -[SHLLibraryBatch initWithInsertions:deletions:](v36, "initWithInsertions:deletions:", v37, v38);

  if (-[SHLLibraryBatch hasChanges](v35, "hasChanges") || -[SHLLibraryBatch hasChanges](v39, "hasChanges")) {
    id v40 = -[SHLSyncSessionModifyTask initWithTracksToModify:groupsToModify:]( objc_alloc(&OBJC_CLASS___SHLSyncSessionModifyTask),  "initWithTracksToModify:groupsToModify:",  v35,  v39);
  }
  else {
    id v40 = 0LL;
  }

  return v40;
}

- (BOOL)isValidCallingProcessIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (void)migrateCacheIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore currentCache](self->_store, "currentCache"));
  unsigned int v4 = [v3 needsMigration];

  if (v4)
  {
    id v5 = sub_10002D0D8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Current local cache requires migration",  buf,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHLLibraryStore currentCache](self->_store, "currentCache"));
    id v17 = 0LL;
    unsigned int v8 = [v7 migrateWithError:&v17];
    id v9 = v17;

    id v10 = sub_10002D0D8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    int v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v13 = "Successfully migrated local cache";
        BOOL v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
      }
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      id v13 = "Failed to migrate current local cache %@";
      BOOL v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 12;
      goto LABEL_9;
    }
  }

- (void)updateProgressWithTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
  id v6 = (char *)[v5 totalUnitCount];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
  unsigned int v8 = &v6[(void)[v7 totalUnitCount]];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
  [v9 setTotalUnitCount:v8];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncProgress](self, "syncProgress"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);

  objc_msgSend(v12, "addChild:withPendingUnitCount:", v10, objc_msgSend(v11, "totalUnitCount"));
}

- (int64_t)syncActionForTaskType:(int64_t)a3
{
  return a3 == 1;
}

- (void)retryFailedTasks:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "setRetryCount:", (char *)objc_msgSend(v9, "retryCount") + 1);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLShazamLibrary syncSession](self, "syncSession"));
        [v10 executeTask:v9];
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

+ (SHLShazamLibrary)defaultLibrary
{
  if (qword_1000889F0 != -1) {
    dispatch_once(&qword_1000889F0, &stru_10006DB88);
  }
  return (SHLShazamLibrary *)(id)qword_1000889E8;
}

- (SHLShazamLibraryDelegate)delegate
{
  return (SHLShazamLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(id)a3
{
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SHLSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (SHLLibraryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (SHLFailedTaskRetryHandler)retryHandler
{
  return self->_retryHandler;
}

- (void)setRetryHandler:(id)a3
{
}

- (BOOL)shouldPerformFetch
{
  return self->_shouldPerformFetch;
}

- (void)setShouldPerformFetch:(BOOL)a3
{
  self->_shouldPerformFetch = a3;
}

- (void).cxx_destruct
{
}

@end