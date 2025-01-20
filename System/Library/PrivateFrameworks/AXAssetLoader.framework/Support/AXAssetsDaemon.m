@interface AXAssetsDaemon
+ (id)sharedInstance;
- (AXAssetsActivityTransactionManager)activityTransactionManager;
- (AXAssetsXPCServer)xpcServer;
- (NSMutableArray)managedAssets;
- (OS_dispatch_queue)notificationQueue;
- (id)_init;
- (id)_managedAssetForAssetType:(id)a3;
- (void)_refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5;
- (void)_updateAssetForAssetType:(id)a3;
- (void)registerManagedAsset:(id)a3;
- (void)registerManagedAssets:(id)a3;
- (void)run;
- (void)setActivityTransactionManager:(id)a3;
- (void)setManagedAssets:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setXpcServer:(id)a3;
- (void)willBecomeIdle:(id)a3 completion:(id)a4;
@end

@implementation AXAssetsDaemon

+ (id)sharedInstance
{
  if (qword_100027A50 != -1) {
    dispatch_once(&qword_100027A50, &stru_100020AE8);
  }
  return (id)qword_100027A48;
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AXAssetsDaemon;
  v2 = -[AXAssetsDaemon init](&v15, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AXAssetsActivityTransactionManager);
    -[AXAssetsDaemon setActivityTransactionManager:](v2, "setActivityTransactionManager:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon activityTransactionManager](v2, "activityTransactionManager"));
    [v4 setDelegate:v2];

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[AXAssetsDaemon setManagedAssets:](v2, "setManagedAssets:", v5);

    v6 = objc_alloc_init(&OBJC_CLASS___AXAssetsXPCServer);
    -[AXAssetsDaemon setXpcServer:](v2, "setXpcServer:", v6);

    objc_initWeak(&location, v2);
    xpcServer = v2->_xpcServer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000EBD0;
    v12[3] = &unk_100020B10;
    objc_copyWeak(&v13, &location);
    -[AXAssetsXPCServer setRefreshAssetCatalogForAssetTypeHandler:]( xpcServer,  "setRefreshAssetCatalogForAssetTypeHandler:",  v12);
    v8 = v2->_xpcServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000EC3C;
    v10[3] = &unk_100020B38;
    objc_copyWeak(&v11, &location);
    -[AXAssetsXPCServer setUpdateAssetForAssetTypeHandler:](v8, "setUpdateAssetForAssetTypeHandler:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)registerManagedAsset:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon managedAssets](self, "managedAssets"));
  [v5 addObject:v4];
}

- (void)registerManagedAssets:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon managedAssets](self, "managedAssets"));
  [v5 addObjectsFromArray:v4];
}

- (void)run
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon managedAssets](self, "managedAssets"));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v7) checkInAssetUpdateXPCActivity];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon xpcServer](self, "xpcServer"));
  [v8 startServer];

  uint64_t v10 = AXLogAssetDaemon(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Bootstrap complete. Will enter event loop.",  v12,  2u);
  }

  dispatch_main();
}

- (id)_managedAssetForAssetType:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon managedAssets](self, "managedAssets", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 policy]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetType]);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon _managedAssetForAssetType:](self, "_managedAssetForAssetType:", a3));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXManagedAssetTaskContext contextWithXPCClient]( &OBJC_CLASS___AXManagedAssetTaskContext,  "contextWithXPCClient"));
  [v10 enqueueCatalogRefreshTaskWithOverrideTimeout:v8 forceCatalogRefresh:v5 context:v9];
}

- (void)_updateAssetForAssetType:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXAssetsDaemon _managedAssetForAssetType:](self, "_managedAssetForAssetType:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXManagedAssetTaskContext contextWithXPCClient]( &OBJC_CLASS___AXManagedAssetTaskContext,  "contextWithXPCClient"));
  [v4 enqueueAssetUpdateTaskWithContext:v3];
}

- (void)willBecomeIdle:(id)a3 completion:(id)a4
{
  id v4 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F0D8;
  block[3] = &unk_100020B60;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (AXAssetsActivityTransactionManager)activityTransactionManager
{
  return self->_activityTransactionManager;
}

- (void)setActivityTransactionManager:(id)a3
{
}

- (AXAssetsXPCServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (NSMutableArray)managedAssets
{
  return self->_managedAssets;
}

- (void)setManagedAssets:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end