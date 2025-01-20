@interface DirectUploadSessionController
- (DirectUploadSessionController)initWithDispatchQueue:(id)a3;
- (DirectUploadSessionDelegate)delegate;
- (int64_t)numberOfTasks;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)_addUploadTaskWithRequest:(id)a3 configuration:(id)a4 URLRequest:(id)a5;
- (void)_asyncModifyTasksForDatabaseIDs:(id)a3 usingBlock:(id)a4;
- (void)_cleanupForDatabaseID:(id)a3;
- (void)_failUploadWithDatabaseID:(id)a3 error:(id)a4;
- (void)_flushProgress;
- (void)addUploadTasksWithRequests:(id)a3;
- (void)cancelUploadTasksWithDatabaseIdentifiers:(id)a3;
- (void)dealloc;
- (void)invalidURLSessions;
- (void)pauseUploadTasksWithDatabaseIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DirectUploadSessionController

- (DirectUploadSessionController)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DirectUploadSessionController;
  v6 = -[DirectUploadSessionController init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    preparationQueue = v7->_preparationQueue;
    v7->_preparationQueue = v8;

    -[ISOperationQueue setMaxConcurrentOperationCount:](v7->_preparationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:](v7->_preparationQueue, "setName:", @"com.apple.DirectUploadSessionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v10 addKeepAliveOperationQueue:v7->_preparationQueue];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v3 removeKeepAliveOperationQueue:self->_preparationQueue];

  progressFlushTimer = self->_progressFlushTimer;
  if (progressFlushTimer) {
    dispatch_source_cancel((dispatch_source_t)progressFlushTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DirectUploadSessionController;
  -[DirectUploadSessionController dealloc](&v5, "dealloc");
}

- (void)addUploadTasksWithRequests:(id)a3
{
  id v4 = a3;
  if (!self->_uploadDatabaseIDs)
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uploadDatabaseIDs = self->_uploadDatabaseIDs;
    self->_uploadDatabaseIDs = v5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    v11 = (void *)objc_opt_class(self);
    id v12 = v11;
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v11;
    __int16 v32 = 2048;
    id v33 = [v4 count];
    v13 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Adding %ld upload requests",  location,  22);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
      free(v13);
      SSFileLog(v7, @"%@");
    }
  }

  else
  {
  }

  objc_initWeak((id *)location, self);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v4;
  id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        v19 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v18 databaseIdentifier]);
        v20 = -[PrepareDirectUploadOperation initWithRequest:]( objc_alloc(&OBJC_CLASS___PrepareDirectUploadOperation),  "initWithRequest:",  v18);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100044394;
        v23[3] = &unk_10034BDF8;
        objc_copyWeak(&v25, (id *)location);
        v23[4] = v18;
        v23[5] = self;
        v21 = v19;
        v24 = v21;
        -[PrepareDirectUploadOperation setOutputBlock:](v20, "setOutputBlock:", v23);
        -[NSMutableArray addObject:](self->_uploadDatabaseIDs, "addObject:", v21);
        -[ISOperationQueue addOperation:](self->_preparationQueue, "addOperation:", v20);

        objc_destroyWeak(&v25);
      }

      id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  objc_destroyWeak((id *)location);
}

- (void)cancelUploadTasksWithDatabaseIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000446CC;
  v3[3] = &unk_10034BE20;
  v3[4] = self;
  -[DirectUploadSessionController _asyncModifyTasksForDatabaseIDs:usingBlock:]( self,  "_asyncModifyTasksForDatabaseIDs:usingBlock:",  a3,  v3);
}

- (void)invalidURLSessions
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_sessions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "invalidateAndCancel", (void)v9);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  sessions = self->_sessions;
  self->_sessions = 0LL;
}

- (int64_t)numberOfTasks
{
  return (int64_t)-[NSMutableArray count](self->_uploadDatabaseIDs, "count");
}

- (void)pauseUploadTasksWithDatabaseIdentifiers:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100044A1C;
  v3[3] = &unk_10034BE20;
  v3[4] = self;
  -[DirectUploadSessionController _asyncModifyTasksForDatabaseIDs:usingBlock:]( self,  "_asyncModifyTasksForDatabaseIDs:usingBlock:",  a3,  v3);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id object = a4;
  id v6 = a5;
  id AssociatedObject = objc_getAssociatedObject(object, "com.apple.itunesstored.upload.id");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(AssociatedObject);
  __int128 v9 = (void *)v8;
  if (v6 && v8)
  {
    __int128 v10 = objc_alloc(&OBJC_CLASS___DirectUploadResponse);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([object response]);
    __int128 v12 = -[DirectUploadResponse initWithURLResponse:data:](v10, "initWithURLResponse:data:", v11, v6);

    if (v12)
    {
      -[DirectUploadResponse setCountOfBytesSent:]( v12,  "setCountOfBytesSent:",  [object countOfBytesSent]);
      objc_setAssociatedObject(object, "com.apple.itunesstored.upload.response", v12, (void *)1);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  __int128 v10 = (void (**)(id, void))a6;
  uint64_t v11 = (uint64_t)objc_msgSend(a5, "itunes_statusCode");
  if (v11 > 399)
  {
    uint64_t v12 = v11;
    uint64_t v13 = SSError(SSErrorDomain, 3LL, 0LL, 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = SSErrorHTTPStatusCodeKey;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    uint64_t v17 = SSErrorBySettingUserInfoValue(v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    objc_setAssociatedObject(v9, "com.apple.itunesstored.upload.error", v18, (void *)1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v19 shouldLog];
    else {
      LODWORD(v21) = v20;
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if ((_DWORD)v21)
    {
      v23 = (void *)objc_opt_class(self);
      id v24 = v23;
      id AssociatedObject = objc_getAssociatedObject(v9, "com.apple.itunesstored.upload.id");
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
      int v28 = 138412802;
      __int128 v29 = v23;
      __int16 v30 = 2112;
      v31 = v26;
      __int16 v32 = 2112;
      id v33 = v18;
      __int128 v27 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Fail upload: %@, after HTTP error: %@",  &v28,  32);

      if (!v27)
      {
LABEL_15:

        v10[2](v10, 0LL);
        goto LABEL_16;
      }

      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
      free(v27);
      SSFileLog(v19, @"%@");
    }

    goto LABEL_15;
  }

  v10[2](v10, 1LL);
LABEL_16:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id AssociatedObject = objc_getAssociatedObject(v9, "com.apple.itunesstored.upload.id");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v12)
  {
    id v13 = objc_getAssociatedObject(v9, "com.apple.itunesstored.upload.response");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000450BC;
    v17[3] = &unk_10034BE48;
    id v18 = v10;
    id v19 = v14;
    id v20 = v9;
    uint64_t v21 = self;
    id v22 = v12;
    id v23 = v8;
    id v16 = v14;
    dispatch_async(dispatchQueue, v17);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id AssociatedObject = objc_getAssociatedObject(a4, "com.apple.itunesstored.upload.id");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  uint64_t v12 = v11;
  if (v11)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100045698;
    v14[3] = &unk_10034BE98;
    id v15 = v11;
    id v16 = self;
    int64_t v17 = a7;
    int64_t v18 = a6;
    dispatch_async(dispatchQueue, v14);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, id))a6;
  id AssociatedObject = objc_getAssociatedObject(a4, "com.apple.itunesstored.upload.id");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  id v13 = v12;
  if (v12)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100045A54;
    v15[3] = &unk_10034AD58;
    v15[4] = self;
    id v16 = v12;
    dispatch_async(dispatchQueue, v15);
  }

  v10[2](v10, v9);
}

- (void)_addUploadTaskWithRequest:(id)a3 configuration:(id)a4 URLRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = a5;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v10 = self->_sessions;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v37;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 configuration]);
      unsigned __int8 v17 = [v16 isEqual:v9];

      if ((v17 & 1) != 0) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v18 = v15;

    if (v18) {
      goto LABEL_14;
    }
  }

  else
  {
LABEL_9:
  }

  if (!self->_sessions)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    sessions = self->_sessions;
    self->_sessions = v19;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v9,  self,  0LL));
  -[NSMutableArray addObject:](self->_sessions, "addObject:", v18);
LABEL_14:
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 localAssetURL]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 uploadTaskWithRequest:v35 fromFile:v21]);

  v34 = v8;
  id v23 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v8 databaseIdentifier]);
  objc_setAssociatedObject(v22, "com.apple.itunesstored.upload.id", v23, (void *)1);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v24) {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v25 = [v24 shouldLog];
  else {
    unsigned int v26 = v25;
  }
  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v26 & 2;
  }
  if (!(_DWORD)v28) {
    goto LABEL_25;
  }
  __int128 v29 = (void *)objc_opt_class(self);
  id v33 = v29;
  id v30 = [v22 taskIdentifier];
  v31 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  int v40 = 138413058;
  v41 = v29;
  __int16 v42 = 2048;
  id v43 = v30;
  __int16 v44 = 2112;
  v45 = v23;
  __int16 v46 = 2112;
  v47 = v31;
  __int16 v32 = (void *)_os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  1LL,  "%@: Starting task: %lu, for upload: %@, session: %@",  &v40,  42);

  if (v32)
  {
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
    free(v32);
    SSFileLog(v24, @"%@");
LABEL_25:
  }

  [v22 resume];
}

- (void)_asyncModifyTasksForDatabaseIDs:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_sessions;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100045FC0;
        v14[3] = &unk_10034BEC0;
        id v15 = v6;
        id v16 = v7;
        [v13 getTasksWithCompletionHandler:v14];

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }
}

- (void)_cleanupForDatabaseID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v12 = v4;
  if (self->_progress)
  {
    id v6 = [v4 longLongValue];
    uint64_t v7 = (uint64_t)-[NSMutableArray count](self->_progress, "count");
    if (v7 >= 1)
    {
      unint64_t v8 = v7 + 1;
      do
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_progress, "objectAtIndex:", v8 - 2));
        if ([v9 uploadDatabaseIdentifier] == v6) {
          -[NSMutableArray removeObjectAtIndex:](self->_progress, "removeObjectAtIndex:", v8 - 2);
        }

        --v8;
      }

      while (v8 > 1);
    }

    id v10 = -[NSMutableArray count](self->_progress, "count");
    id v5 = v12;
    if (!v10)
    {
      progress = self->_progress;
      self->_progress = 0LL;

      id v5 = v12;
    }
  }

  -[NSMutableArray removeObject:](self->_uploadDatabaseIDs, "removeObject:", v5);
}

- (void)_failUploadWithDatabaseID:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  -[DirectUploadSessionController _cleanupForDatabaseID:](self, "_cleanupForDatabaseID:", v8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadSessionController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "uploadSessionController:uploadDidFailWithDatabaseID:error:") & 1) != 0) {
    objc_msgSend( v7,  "uploadSessionController:uploadDidFailWithDatabaseID:error:",  self,  objc_msgSend(v8, "longLongValue"),  v6);
  }
}

- (void)_flushProgress
{
  progressFlushTimer = self->_progressFlushTimer;
  if (progressFlushTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressFlushTimer);
    id v4 = self->_progressFlushTimer;
    self->_progressFlushTimer = 0LL;
  }

  if (-[NSMutableArray count](self->_progress, "count"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectUploadSessionController delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "uploadSessionController:uploadProgressDidChange:") & 1) == 0)
    {

      id v5 = 0LL;
    }

    id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v28 = self;
    id obj = self->_progress;
    id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
    if (v32)
    {
      uint64_t v6 = *(void *)v34;
      uint64_t v7 = &ACSLocateCachingServer_ptr;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          uint64_t v10 = (uint64_t)objc_msgSend(v9, "countOfBytesExpectedToSend", v25);
          if (v10 >= 1)
          {
            uint64_t v11 = v10;
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedDaemonConfig]);
            if (!v12) {
              id v12 = (void *)objc_claimAutoreleasedReturnValue([v7[459] sharedConfig]);
            }
            unsigned int v13 = [v12 shouldLog];
            else {
              unsigned int v14 = v13;
            }
            id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              uint64_t v16 = v14;
            }
            else {
              uint64_t v16 = v14 & 2;
            }
            if ((_DWORD)v16)
            {
              __int128 v17 = (void *)objc_opt_class(v28);
              id v31 = v17;
              __int128 v18 = v7;
              __int128 v19 = v5;
              id v20 = [v9 uploadDatabaseIdentifier];
              id v21 = [v9 countOfBytesSent];
              int v37 = 138412802;
              __int128 v38 = v17;
              __int16 v39 = 2048;
              id v40 = v20;
              id v5 = v19;
              uint64_t v7 = v18;
              __int16 v41 = 2048;
              double v42 = (float)((float)(uint64_t)v21 / (float)v11);
              LODWORD(v26) = 32;
              id v22 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  2LL,  "%@: Upload %lld did update progress: %.2f",  &v37,  v26);

              uint64_t v6 = v27;
              if (v22)
              {
                id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
                free(v22);
                unsigned int v25 = v15;
                SSFileLog(v12, @"%@");
                goto LABEL_23;
              }
            }

            else
            {
LABEL_23:
            }
          }

          if (v5)
          {
            id v23 = [v9 copy];
            -[NSMutableArray addObject:](v30, "addObject:", v23);
          }
        }

        id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
      }

      while (v32);
    }

    [v5 uploadSessionController:v28 uploadProgressDidChange:v30];
    progress = v28->_progress;
    v28->_progress = 0LL;
  }

- (DirectUploadSessionDelegate)delegate
{
  return (DirectUploadSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end