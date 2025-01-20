@interface MSDDownloadRequestManager
- (BOOL)_coalesceDownloadRequestForFileWithSameHash:(id)a3;
- (MSDContentServer)server;
- (MSDDownloadRequestManager)initWithCellularAccess:(BOOL)a3 andFDCUpdateDelegate:(id)a4;
- (MSDFDCUpdateDelegate)fdcDelegate;
- (NSMutableDictionary)downloadRequestCompletions;
- (OS_dispatch_queue)updateQueue;
- (os_unfair_lock_s)downloadRequestsLock;
- (unint64_t)signpostId;
- (void)_dispatchRequest:(id)a3;
- (void)_finishDownloadRequest:(id)a3 withReponse:(id)a4;
- (void)_handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4;
- (void)_updateFDCforRequest:(id)a3;
- (void)downloadFileForRequest:(id)a3;
- (void)setDownloadRequestCompletions:(id)a3;
- (void)setDownloadRequestsLock:(os_unfair_lock_s)a3;
- (void)setFdcDelegate:(id)a3;
- (void)setServer:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setUpdateQueue:(id)a3;
@end

@implementation MSDDownloadRequestManager

- (MSDDownloadRequestManager)initWithCellularAccess:(BOOL)a3 andFDCUpdateDelegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MSDDownloadRequestManager;
  v7 = -[MSDDownloadRequestManager init](&v17, "init");
  v8 = v7;
  if (v7)
  {
    -[MSDDownloadRequestManager setDownloadRequestsLock:](v7, "setDownloadRequestsLock:", 0LL);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.downloadManagerUpdateQueue", 0LL);
    -[MSDDownloadRequestManager setUpdateQueue:](v8, "setUpdateQueue:", v9);

    -[MSDDownloadRequestManager setFdcDelegate:](v8, "setFdcDelegate:", v6);
    id v10 = sub_10003AAAC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    -[MSDDownloadRequestManager setSignpostId:](v8, "setSignpostId:", os_signpost_id_generate(v11));

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDDownloadRequestManager setDownloadRequestCompletions:](v8, "setDownloadRequestCompletions:", v12);

    v13 = -[MSDContentServer initWithCellularAccess:]( objc_alloc(&OBJC_CLASS___MSDContentServer),  "initWithCellularAccess:",  v4);
    -[MSDDownloadRequestManager setServer:](v8, "setServer:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](v8, "server"));
    [v14 setObserver:v8];

    v15 = v8;
  }

  return v8;
}

- (void)downloadFileForRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___MSDDownloadFileResponse);
  if ([v4 isValid])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
    unsigned int v8 = [v6 fileExistsAtPath:v7];

    if (!v8)
    {
      if (!-[MSDDownloadRequestManager _coalesceDownloadRequestForFileWithSameHash:]( self,  "_coalesceDownloadRequestForFileWithSameHash:",  v4))
      {
        -[MSDDownloadRequestManager _dispatchRequest:](self, "_dispatchRequest:", v4);
        goto LABEL_13;
      }

      id v14 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Coalesce current download file request with existing one.",  (uint8_t *)&v18,  0xCu);
      }

      goto LABEL_11;
    }

    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
      int v18 = 138543362;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "File already exists at save path: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    -[MSDServerResponse setError:](v5, "setError:", 0LL);
  }

  else
  {
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000938B0(v4, v16);
    }

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744769LL,  @"Input is invalid"));
    -[MSDServerResponse setError:](v5, "setError:", v17);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);

  if (v12)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 completion]);
    (*((void (**)(os_log_s *, MSDDownloadFileResponse *))v13 + 2))(v13, v5);
LABEL_11:
  }

- (void)_dispatchRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathExtension:@"IN_PROGRESS"]);
  [v4 setSavePath:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadCredentials]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 originServer]);
  unsigned __int8 v9 = [v7 isValidForOriginServer:v8];

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
    [v10 downloadFile:v4];
  }

  else
  {
    id v11 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100093944(v4, v12);
    }

    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager updateQueue](self, "updateQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100020FB8;
    v14[3] = &unk_1000F94E0;
    v14[4] = self;
    id v15 = v4;
    dispatch_async(v13, v14);
  }
}

- (BOOL)_coalesceDownloadRequestForFileWithSameHash:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 savePath]);
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v5]);

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);

    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];

    id v11 = v8;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 completion]);

    id v13 = objc_retainBlock(v12);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v13));

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
    [v9 setObject:v11 forKey:v5];
  }

  os_unfair_lock_unlock(p_downloadRequestsLock);
  return v8 != 0LL;
}

- (void)_handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 savePath]);
  p_downloadRequestsLock = &self->_downloadRequestsLock;
  os_unfair_lock_lock(&self->_downloadRequestsLock);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

  if (v10)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v15) + 16LL))(*(void *)(*((void *)&v17 + 1) + 8LL * (void)v15));
          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v13);
    }

    objc_msgSend(v11, "removeAllObjects", (void)v17);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager downloadRequestCompletions](self, "downloadRequestCompletions"));
  [v16 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_downloadRequestsLock);
}

- (void)_updateFDCforRequest:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MSDDownloadFileResponse);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v18 downloadCredentials]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v18 originServer]);
  unsigned int v7 = [v5 isValidForOriginServer:v6];

  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
    [v8 downloadFile:v18];
  }

  else
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager fdcDelegate](self, "fdcDelegate"));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 downloadCredentials]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 manifestInfo]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager fdcDelegate](self, "fdcDelegate"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 updateFileDownloadCredentialFromManifestInfo:v11]);

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 error]);
        -[MSDServerResponse setError:](v4, "setError:", v15);

        -[MSDDownloadRequestManager _finishDownloadRequest:withReponse:]( self,  "_finishDownloadRequest:withReponse:",  v18,  v4);
      }

      else
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager server](self, "server"));
        [v17 downloadFile:v18];
      }
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744513LL,  @"Download Credential Expired"));
      -[MSDServerResponse setError:](v4, "setError:", v16);

      -[MSDDownloadRequestManager _finishDownloadRequest:withReponse:]( self,  "_finishDownloadRequest:withReponse:",  v18,  v4);
    }
  }
}

- (void)_finishDownloadRequest:(id)a3 withReponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDDownloadRequestManager updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000217E8;
  block[3] = &unk_1000F9768;
  id v9 = v7;
  id v37 = v9;
  dispatch_async(v8, block);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pathExtension]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByDeletingPathExtension]);

  if (v11 && [v11 isEqualToString:@"IN_PROGRESS"])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

    if (!v14)
    {
      id v15 = objc_claimAutoreleasedReturnValue([v6 savePath]);
      v16 = (const char *)[v15 UTF8String];
      id v17 = v13;
      LODWORD(v16) = rename(v16, (const char *)[v17 UTF8String]);

      if ((_DWORD)v16)
      {
        id v18 = __error();
        __int128 v19 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v18));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = sub_10003A95C();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000939FC((uint64_t)v17, (uint64_t)v20, v22);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727740944LL,  v20));
        [v9 setError:v23];
      }
    }

    [v6 setSavePath:v13];
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);

  if (!v24) {
    goto LABEL_15;
  }
  if ((uint64_t)[v6 retryCount] < 1)
  {
    id v28 = sub_10003A95C();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v30;
      __int16 v39 = 2114;
      v40 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Download Failed for file: %{public}@ with error: %{public}@",  location,  0x16u);
    }

LABEL_15:
    -[MSDDownloadRequestManager _handleCompletionForDownloadRequest:withResponse:]( self,  "_handleCompletionForDownloadRequest:withResponse:",  v6,  v9);
    goto LABEL_16;
  }

  objc_initWeak((id *)location, self);
  dispatch_time_t v25 = dispatch_time(0LL, 3000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000218D4;
  v32[3] = &unk_1000F9990;
  id v33 = v6;
  objc_copyWeak(&v35, (id *)location);
  v34 = self;
  dispatch_after(v25, v27, v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)location);
LABEL_16:
}

- (MSDFDCUpdateDelegate)fdcDelegate
{
  return self->_fdcDelegate;
}

- (void)setFdcDelegate:(id)a3
{
}

- (os_unfair_lock_s)downloadRequestsLock
{
  return self->_downloadRequestsLock;
}

- (void)setDownloadRequestsLock:(os_unfair_lock_s)a3
{
  self->_downloadRequestsLock = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (MSDContentServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSMutableDictionary)downloadRequestCompletions
{
  return self->_downloadRequestCompletions;
}

- (void)setDownloadRequestCompletions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end