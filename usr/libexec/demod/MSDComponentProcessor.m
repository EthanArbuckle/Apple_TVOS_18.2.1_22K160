@interface MSDComponentProcessor
- (MSDComponentProcessor)initWithQoS:(int64_t)a3;
- (MSDOperationQueue)defaultQueue;
- (MSDOperationQueue)downloadQueue;
- (MSDOperationQueue)installQueue;
- (MSDOperationQueue)parallelInstallQueue;
- (MSDOperationQueue)prepareQueue;
- (MSDOperationQueue)uninstallQueue;
- (id)_queueForOperation:(id)a3;
- (void)_dispatchOperationForExecution:(id)a3;
- (void)cancel;
- (void)process:(id)a3;
- (void)resume;
- (void)setDefaultQueue:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setInstallQueue:(id)a3;
- (void)setParallelInstallQueue:(id)a3;
- (void)setPrepareQueue:(id)a3;
- (void)setUninstallQueue:(id)a3;
- (void)suspend;
@end

@implementation MSDComponentProcessor

- (MSDComponentProcessor)initWithQoS:(int64_t)a3
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MSDComponentProcessor;
  v4 = -[MSDComponentProcessor init](&v40, "init");
  if (v4)
  {
    if (os_variant_has_internal_content("com.apple.mobilestoredemod")
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance")),
          uint64_t v6 = (uint64_t)[v5 concurrentDownloadOperation],
          v5,
          v6 >= 1))
    {
      id v7 = sub_10003A95C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v42 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Override default number of concurrent download operation: %ld",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v6 = 2LL;
    }

    v9 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setDefaultQueue:](v4, "setDefaultQueue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    [v10 setMaxConcurrentOperationCount:1];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    [v11 setQualityOfService:a3];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    [v12 setSuspended:1];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](v4, "defaultQueue"));
    [v13 setName:@"com.apple.msd.default_queue"];

    v14 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setPrepareQueue:](v4, "setPrepareQueue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    [v15 setMaxConcurrentOperationCount:1];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    [v16 setQualityOfService:a3];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    [v17 setSuspended:1];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](v4, "prepareQueue"));
    [v18 setName:@"com.apple.msd.prepare_queue"];

    v19 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setDownloadQueue:](v4, "setDownloadQueue:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    [v20 setMaxConcurrentOperationCount:v6];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    [v21 setQualityOfService:a3];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    [v22 setSuspended:1];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](v4, "downloadQueue"));
    [v23 setName:@"com.apple.msd.download_queue"];

    v24 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setInstallQueue:](v4, "setInstallQueue:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    [v25 setMaxConcurrentOperationCount:1];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    [v26 setQualityOfService:a3];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    [v27 setSuspended:1];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](v4, "installQueue"));
    [v28 setName:@"com.apple.msd.install_queue"];

    v29 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setParallelInstallQueue:](v4, "setParallelInstallQueue:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    [v30 setMaxConcurrentOperationCount:5];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    [v31 setQualityOfService:a3];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    [v32 setSuspended:1];

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](v4, "parallelInstallQueue"));
    [v33 setName:@"com.apple.msd.parallel_install_queue"];

    v34 = objc_alloc_init(&OBJC_CLASS___MSDOperationQueue);
    -[MSDComponentProcessor setUninstallQueue:](v4, "setUninstallQueue:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    [v35 setMaxConcurrentOperationCount:1];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    [v36 setQualityOfService:a3];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    [v37 setSuspended:1];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](v4, "uninstallQueue"));
    [v38 setName:@"com.apple.msd.uninstall_queue"];
  }

  return v4;
}

- (void)process:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 activateStagedOperations]);
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MSDComponentProcessor _dispatchOperationForExecution:]( v5,  "_dispatchOperationForExecution:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9),  (void)v10);
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)resume
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  [v2 setSuspended:0];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  [v3 setSuspended:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  [v4 setSuspended:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  [v5 setSuspended:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  [v6 setSuspended:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  [v7 setSuspended:0];

  objc_sync_exit(obj);
}

- (void)suspend
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  [v2 setSuspended:1];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  [v3 setSuspended:1];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  [v4 setSuspended:1];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  [v5 setSuspended:1];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  [v6 setSuspended:1];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  [v7 setSuspended:1];

  objc_sync_exit(obj);
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](obj, "defaultQueue"));
  [v2 cancelAllOperations];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](obj, "prepareQueue"));
  [v3 cancelAllOperations];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](obj, "downloadQueue"));
  [v4 cancelAllOperations];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](obj, "installQueue"));
  [v5 cancelAllOperations];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor parallelInstallQueue](obj, "parallelInstallQueue"));
  [v6 cancelAllOperations];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](obj, "uninstallQueue"));
  [v7 cancelAllOperations];

  objc_sync_exit(obj);
}

- (void)_dispatchOperationForExecution:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor _queueForOperation:](self, "_queueForOperation:", v4));
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000957E8((uint64_t)v4, v5, v7);
  }

  [v5 addOperation:v4];
}

- (id)_queueForOperation:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 type])
  {
    case 1uLL:
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor prepareQueue](self, "prepareQueue"));
      break;
    case 2uLL:
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor downloadQueue](self, "downloadQueue"));
      break;
    case 3uLL:
      else {
        uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor installQueue](self, "installQueue"));
      }
      break;
    case 4uLL:
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor uninstallQueue](self, "uninstallQueue"));
      break;
    default:
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDComponentProcessor defaultQueue](self, "defaultQueue"));
      break;
  }

  id v6 = (void *)v5;

  return v6;
}

- (MSDOperationQueue)defaultQueue
{
  return self->_defaultQueue;
}

- (void)setDefaultQueue:(id)a3
{
}

- (MSDOperationQueue)prepareQueue
{
  return self->_prepareQueue;
}

- (void)setPrepareQueue:(id)a3
{
}

- (MSDOperationQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (MSDOperationQueue)installQueue
{
  return self->_installQueue;
}

- (void)setInstallQueue:(id)a3
{
}

- (MSDOperationQueue)parallelInstallQueue
{
  return self->_parallelInstallQueue;
}

- (void)setParallelInstallQueue:(id)a3
{
}

- (MSDOperationQueue)uninstallQueue
{
  return self->_uninstallQueue;
}

- (void)setUninstallQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end