@interface MLDClientImportServiceSession
- (MLDClientImportServiceSession)initWithConnection:(id)a3;
- (void)_addItems:(id)a3;
- (void)_adjustProgressForIncomingOperationCount:(unint64_t)a3;
- (void)_beginSessionWithConfiguration:(id)a3;
- (void)_endSessionCommittingChanges:(id)a3;
- (void)_removeItems:(id)a3;
- (void)_reportProgress;
- (void)_startImportThread;
- (void)_updateItems:(id)a3;
- (void)addItems:(id)a3 completion:(id)a4;
- (void)beginSessionWithConfiguration:(id)a3 completion:(id)a4;
- (void)cancelSessionWithCompletion:(id)a3;
- (void)endSessionWithCompletion:(id)a3;
- (void)removeItems:(id)a3 completion:(id)a4;
- (void)stop;
- (void)updateItems:(id)a3 completion:(id)a4;
@end

@implementation MLDClientImportServiceSession

- (MLDClientImportServiceSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v6 = -[MLDClientImportServiceSession init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_active = 1;
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v8 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v7,  "_startImportThread",  0LL);
    importSessionThread = v7->_importSessionThread;
    v7->_importSessionThread = v8;

    -[NSThread setQualityOfService:](v7->_importSessionThread, "setQualityOfService:", 25LL);
    -[NSThread start](v7->_importSessionThread, "start");
  }

  return v7;
}

- (void)stop
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100014AE8;
  v2[3] = &unk_100025148;
  v2[4] = self;
  -[MLDClientImportServiceSession cancelSessionWithCompletion:](self, "cancelSessionWithCompletion:", v2);
}

- (void)beginSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_beginSessionWithConfiguration:",  self->_importSessionThread,  v9,  1LL);
  BOOL success = self->_success;
  if (self->_success) {
    v8 = 0LL;
  }
  else {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ml_errorWithCode:description:]( &OBJC_CLASS___NSError,  "ml_errorWithCode:description:",  0LL,  @"failed to start import session"));
  }
  v6[2](v6, v8);
  if (!success) {
}
  }

- (void)endSessionWithCompletion:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_endSessionCommittingChanges:",  self->_importSessionThread,  &__kCFBooleanTrue,  1LL);
  BOOL success = self->_success;
  if (self->_success) {
    id v5 = 0LL;
  }
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ml_errorWithCode:description:]( &OBJC_CLASS___NSError,  "ml_errorWithCode:description:",  0LL,  @"failed to commit import session"));
  }
  v6[2](v6, v5);
  if (!success) {
}
  }

- (void)cancelSessionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_endSessionCommittingChanges:",  self->_importSessionThread,  &__kCFBooleanFalse,  1LL);
  v4[2](v4, 0LL);
}

- (void)addItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_addItems:",  self->_importSessionThread,  v10,  1LL);
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ml_errorWithCode:description:]( &OBJC_CLASS___NSError,  "ml_errorWithCode:description:",  0LL,  @"failed to add import items"));
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)updateItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_updateItems:",  self->_importSessionThread,  v10,  1LL);
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ml_errorWithCode:description:]( &OBJC_CLASS___NSError,  "ml_errorWithCode:description:",  0LL,  @"failed to update import items"));
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)removeItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  -[MLDClientImportServiceSession performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_removeItems:",  self->_importSessionThread,  v10,  1LL);
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ml_errorWithCode:description:]( &OBJC_CLASS___NSError,  "ml_errorWithCode:description:",  0LL,  @"failed to remove import items"));
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)_startImportThread
{
  v3 = (NSRunLoop *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  importSessionRunLoop = self->_importSessionRunLoop;
  self->_importSessionRunLoop = v3;

  while (self->_active)
  {
    id v5 = self->_importSessionRunLoop;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    -[NSRunLoop runMode:beforeDate:](v5, "runMode:beforeDate:", NSDefaultRunLoopMode, v6);
  }

- (void)_beginSessionWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting import session", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_configuration, a3);
  self->_totalOperationCount = (unint64_t)-[ML3ClientImportSessionConfiguration operationCount]( self->_configuration,  "operationCount");
  id v7 = objc_alloc(&OBJC_CLASS___MLTransactionContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 privacyContext]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryPath]);
  id v10 = [v7 initWithPrivacyContext:v8 path:v9 priorityLevel:1 options:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MLDMediaLibraryService sharedInstance](&OBJC_CLASS___MLDMediaLibraryService, "sharedInstance"));
  id v23 = 0LL;
  v12 = (ML3ActiveTransaction *)objc_claimAutoreleasedReturnValue([v11 beginTransactionForDatabaseWithContext:v10 error:&v23]);
  id v13 = v23;
  transaction = self->_transaction;
  self->_transaction = v12;

  if (self->_transaction)
  {
    v15 = objc_alloc(&OBJC_CLASS___ML3ClientImportServiceSession);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ML3ActiveTransaction library](self->_transaction, "library"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ML3ActiveTransaction connection](self->_transaction, "connection"));
    v18 = -[ML3ClientImportServiceSession initWithLibrary:connection:configuration:]( v15,  "initWithLibrary:connection:configuration:",  v16,  v17,  self->_configuration);
    importSession = self->_importSession;
    self->_importSession = v18;

    unsigned __int8 v20 = -[ML3ClientImportServiceSession begin](self->_importSession, "begin");
    self->_BOOL success = v20;
    if ((v20 & 1) == 0)
    {
      v21 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to begin import session",  buf,  0xCu);
      }

      -[MLDClientImportServiceSession _endSessionCommittingChanges:]( self,  "_endSessionCommittingChanges:",  &__kCFBooleanFalse);
    }
  }

  else
  {
    v22 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to start transaction. err=%{public}@",  buf,  0x16u);
    }

    self->_BOOL success = 0;
  }
}

- (void)_endSessionCommittingChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 BOOLValue];
  if (self->_importSession)
  {
    v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      __int16 v18 = 1024;
      LODWORD(v19) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Finishing import session. shouldCommit=%{BOOL}u",  buf,  0x12u);
    }

    if ((_DWORD)v5)
    {
      unsigned __int8 v7 = -[ML3ClientImportServiceSession finish](self->_importSession, "finish");
      self->_BOOL success = v7;
      if ((v7 & 1) != 0)
      {
        uint64_t v5 = 1LL;
      }

      else
      {
        v8 = os_log_create("com.apple.amp.medialibraryd", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to finish import session",  buf,  0xCu);
        }

        uint64_t v5 = 0LL;
      }
    }

    importSession = self->_importSession;
    self->_importSession = 0LL;
  }

  if (self->_transaction)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MLDMediaLibraryService sharedInstance](&OBJC_CLASS___MLDMediaLibraryService, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ML3ActiveTransaction identifier](self->_transaction, "identifier"));
    id v15 = 0LL;
    unsigned __int8 v12 = [v10 endTransaction:v11 shouldCommit:v5 error:&v15];
    id v13 = v15;
    self->_BOOL success = v12;

    if ((v12 & 1) == 0)
    {
      v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to end transaction. err=%{public}@",  buf,  0x16u);
      }
    }
  }
}

- (void)_addItems:(id)a3
{
  id v4 = a3;
  unsigned __int8 v20 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:]( self,  "_adjustProgressForIncomingOperationCount:",  [v4 count]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v20 count]));
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v24 = 0u;
    id v6 = v20;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          importSession = self->_importSession;
          id v23 = 0LL;
          unsigned int v12 = -[ML3ClientImportServiceSession addTrack:persistentID:]( importSession,  "addTrack:persistentID:",  v10,  &v23);
          id v13 = v23;
          self->_BOOL success = v12;
          if (v12)
          {
            [v5 setObject:v13 forKey:v10];
          }

          else
          {
            v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to add track",  buf,  0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_100014934;
            v22[3] = &unk_100025148;
            v22[4] = self;
            v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v22));
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_100014A08;
            v21[3] = &unk_100025170;
            v21[4] = self;
            [v16 sessionFailedToAddItem:v10 completion:v21];
          }

          if (!self->_success)
          {

            goto LABEL_17;
          }

          ++self->_completedOperationCount;
          -[MLDClientImportServiceSession _reportProgress](self, "_reportProgress");
        }

        id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)_updateItems:(id)a3
{
  id v4 = a3;
  unsigned __int8 v20 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:]( self,  "_adjustProgressForIncomingOperationCount:",  [v4 count]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v20 count]));
    __int128 v27 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v24 = 0u;
    id v6 = v20;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          importSession = self->_importSession;
          id v23 = 0LL;
          unsigned int v12 = -[ML3ClientImportServiceSession updateTrack:persistentID:]( importSession,  "updateTrack:persistentID:",  v10,  &v23);
          id v13 = v23;
          self->_BOOL success = v12;
          if (v12)
          {
            [v5 setObject:v13 forKey:v10];
          }

          else
          {
            v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to update track",  buf,  0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_100014780;
            v22[3] = &unk_100025148;
            v22[4] = self;
            v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v22));
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_100014854;
            v21[3] = &unk_100025170;
            v21[4] = self;
            [v16 sessionFailedToUpdateItem:v10 completion:v21];
          }

          if (!self->_success)
          {

            goto LABEL_17;
          }

          ++self->_completedOperationCount;
          -[MLDClientImportServiceSession _reportProgress](self, "_reportProgress");
        }

        id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)_removeItems:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:]( self,  "_adjustProgressForIncomingOperationCount:",  [v4 count]);
    os_log_t v5 = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v19 count]));
    __int128 v26 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v23 = 0u;
    id v6 = v19;
    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          importSession = self->_importSession;
          id v22 = 0LL;
          unsigned int v12 = -[ML3ClientImportServiceSession removeTrack:persistentID:]( importSession,  "removeTrack:persistentID:",  v10,  &v22);
          id v13 = v22;
          self->_BOOL success = v12;
          if (v12)
          {
            -[os_log_s setObject:forKey:](v5, "setObject:forKey:", v13, v10);
          }

          else
          {
            v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v29 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Failed to remove track",  buf,  0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_1000145CC;
            v21[3] = &unk_100025148;
            v21[4] = self;
            v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v21));
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_1000146A0;
            v20[3] = &unk_100025170;
            v20[4] = self;
            [v16 sessionFailedToUpdateItem:v10 completion:v20];
          }

          if (!self->_success)
          {

            goto LABEL_17;
          }

          ++self->_completedOperationCount;
          -[MLDClientImportServiceSession _reportProgress](self, "_reportProgress");
        }

        id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)_adjustProgressForIncomingOperationCount:(unint64_t)a3
{
  unint64_t v3 = self->_completedOperationCount + a3;
  if (v3 > self->_totalOperationCount) {
    self->_totalOperationCount = v3;
  }
}

- (void)_reportProgress
{
  unint64_t completedOperationCount = self->_completedOperationCount;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * completedOperationCount, 1) <= 0x1999999999999999uLL)
  {
    unint64_t totalOperationCount = self->_totalOperationCount;
    xpcConnection = self->_xpcConnection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000144F8;
    v7[3] = &unk_100025148;
    v7[4] = self;
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v7));
    *(float *)&double v6 = (float)completedOperationCount / (float)totalOperationCount;
    [v5 sessionDidUpdateProgress:v6];
  }

- (void).cxx_destruct
{
}

@end