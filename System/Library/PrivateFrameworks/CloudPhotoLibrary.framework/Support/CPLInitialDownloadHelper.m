@interface CPLInitialDownloadHelper
- (BOOL)initialDownloadIsRunning;
- (CPLEngineWrapperArray)wrappers;
- (CPLInitialDownloadHelper)initWithWrappers:(id)a3 queue:(id)a4;
- (CPLInitialDownloadHelperDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)_requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4;
- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CPLInitialDownloadHelper

- (CPLInitialDownloadHelper)initWithWrappers:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLInitialDownloadHelper;
  v9 = -[CPLInitialDownloadHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_wrappers, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (BOOL)initialDownloadIsRunning
{
  return self->_currentLibraryIdentifier != 0LL;
}

- (void)_requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  2LL));
  if (!_CPLSilentLogging)
  {
    id v12 = sub_10000C010();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "";
      if (v6) {
        v14 = " with activated main scope";
      }
      *(_DWORD *)buf = 138543618;
      id v31 = v9;
      __int16 v32 = 2080;
      v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Requesting %{public}@%s", buf, 0x16u);
    }
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000C050;
  v27[3] = &unk_10023E118;
  id v29 = v10;
  id v15 = v11;
  id v28 = v15;
  id v16 = v10;
  v17 = objc_retainBlock(v27);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000C088;
  v26[3] = &unk_10023E138;
  v26[4] = a2;
  [v15 setCancellationHandler:v26];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000C14C;
  v21[3] = &unk_10023E200;
  v21[4] = self;
  id v22 = v9;
  BOOL v25 = v6;
  id v23 = v15;
  id v24 = v17;
  id v18 = v15;
  v19 = v17;
  id v20 = v9;
  [v18 performAsCurrentWithPendingUnitCount:1 usingBlock:v21];
}

- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10000CA80;
  v36[3] = &unk_10023E118;
  id v12 = v10;
  id v38 = v12;
  id v13 = v11;
  id v37 = v13;
  v14 = objc_retainBlock(v36);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10000CAB8;
  v35[3] = &unk_10023E138;
  v35[4] = a2;
  [v13 setCancellationHandler:v35];
  if (-[CPLEngineWrapperArray count](self->_wrappers, "count"))
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10000CE30;
    v26[3] = &unk_10023E228;
    v26[4] = self;
    id v15 = &v27;
    id v16 = v9;
    BOOL v29 = a4;
    v17 = (id *)&v28;
    id v27 = v16;
    id v28 = v14;
    id v18 = v14;
    [v13 performAsCurrentWithPendingUnitCount:1 usingBlock:v26];
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_10000C010();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Checking account info before requesting %@",  buf,  0xCu);
      }
    }

    WeakRetained = (CPLInitialDownloadHelper *)objc_loadWeakRetained((id *)&self->_delegate);
    id v22 = WeakRetained;
    if (WeakRetained) {
      id v23 = WeakRetained;
    }
    else {
      id v23 = self;
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000CB7C;
    v30[3] = &unk_10023E278;
    v30[4] = self;
    id v15 = &v31;
    id v24 = v9;
    BOOL v34 = a4;
    v17 = (id *)&v33;
    id v31 = v24;
    v33 = v14;
    id v32 = v13;
    BOOL v25 = v14;
    -[CPLInitialDownloadHelper initialDownloadHelper:checkActiveAccountWithCompletionHandler:]( v23,  "initialDownloadHelper:checkActiveAccountWithCompletionHandler:",  self,  v30);
  }
}

- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  currentLibraryIdentifier = self->_currentLibraryIdentifier;
  if (currentLibraryIdentifier)
  {
    if (-[NSString isEqualToString:](currentLibraryIdentifier, "isEqualToString:", v10))
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_10000C010();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v10;
          id v16 = "Requested to perform initial download for %{public}@ but we are already doing it";
          v17 = v15;
          uint32_t v18 = 12;
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
          goto LABEL_15;
        }

        goto LABEL_15;
      }
    }

    else if (!_CPLSilentLogging)
    {
      id v27 = sub_10000C010();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = self->_currentLibraryIdentifier;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        id v16 = "Requested to perform initial download for %{public}@ but we are already doing %{public}@";
        v17 = v15;
        uint32_t v18 = 22;
        goto LABEL_14;
      }

- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000DD38;
  v11[3] = &unk_10023DBC8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DDEC;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (CPLInitialDownloadHelperDelegate)delegate
{
  return (CPLInitialDownloadHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CPLEngineWrapperArray)wrappers
{
  return self->_wrappers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end