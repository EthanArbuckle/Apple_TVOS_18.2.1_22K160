@interface PBAppInfoService
- (NSDictionary)queue_currentAppInfos;
- (NSDictionary)queue_lastProvidedAppInfos;
- (NSMutableSet)queue_updatedAppInfoBundleIdentifiers;
- (OS_dispatch_queue)accessQueue;
- (PBAppInfoController)appInfoController;
- (PBAppInfoService)init;
- (PBAppInfoService)initWithInfoStore:(id)a3 remoteConnection:(id)a4;
- (PBAppInfoStore)infoStore;
- (PBSAppInfoConfiguration)queue_currentConfiguration;
- (PBSAppInfoConfiguration)queue_lastProvidedConfiguration;
- (PBSAppInfoDelegateServiceInterface)serviceDelegate;
- (PBSystemServiceConnection)remoteConnection;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
- (void)appInfoUpdatesWithReply:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation PBAppInfoService

- (PBAppInfoService)init
{
  return 0LL;
}

- (PBAppInfoService)initWithInfoStore:(id)a3 remoteConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___PBAppInfoService;
  v9 = -[PBAppInfoService init](&v33, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_remoteConnection, v8);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PineBoard.PBAppInfoService", 0LL);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_infoStore, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteConnection]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 valueForEntitlement:@"com.apple.appletv.pbs.app-info-service-access.everything"]);
    unsigned int v15 = [v14 BOOLValue];

    if (!v8 || v15)
    {
      v19 = (PBAppInfoController *)objc_claimAutoreleasedReturnValue([v7 appInfoControllerWithEverything]);
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteConnection]);
      v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 valueForEntitlement:@"com.apple.appletv.pbs.app-info-service-access.placeholders"]);
      unsigned int v18 = [v17 BOOLValue];

      if (v18)
      {
        v19 = (PBAppInfoController *)objc_claimAutoreleasedReturnValue([v7 appInfoControllerWithEnabledAndVisibleAppsAndPlaceholders]);
      }

      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteConnection]);
        v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 valueForEntitlement:@"com.apple.appletv.pbs.allow-shared-state-access"]);
        unsigned int v22 = [v21 BOOLValue];

        if (v22) {
          v19 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( objc_alloc(&OBJC_CLASS___PBAppInfoController),  "initWithInfoStore:filter:delegate:",  v7,  &stru_1003D2860,  0LL);
        }
        else {
          v19 = (PBAppInfoController *)objc_claimAutoreleasedReturnValue([v7 appInfoControllerWithEnabledAndVisibleApps]);
        }
      }
    }

    appInfoController = v10->_appInfoController;
    v10->_appInfoController = v19;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v10->_appInfoController, "appInfos"));
    queue_currentAppInfos = v10->_queue_currentAppInfos;
    v10->_queue_currentAppInfos = (NSDictionary *)v24;

    queue_lastProvidedAppInfos = v10->_queue_lastProvidedAppInfos;
    v10->_queue_lastProvidedAppInfos = 0LL;

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    queue_updatedAppInfoBundleIdentifiers = v10->_queue_updatedAppInfoBundleIdentifiers;
    v10->_queue_updatedAppInfoBundleIdentifiers = v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[PBAppInfoController configuration](v10->_appInfoController, "configuration"));
    queue_currentConfiguration = v10->_queue_currentConfiguration;
    v10->_queue_currentConfiguration = (PBSAppInfoConfiguration *)v29;

    queue_lastProvidedConfiguration = v10->_queue_lastProvidedConfiguration;
    v10->_queue_lastProvidedConfiguration = 0LL;

    -[PBAppInfoController setDelegate:](v10->_appInfoController, "setDelegate:", v10);
  }

  return v10;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100069AF4;
  unsigned int v15 = &unk_1003CFEB8;
  v16 = self;
  id v9 = v7;
  id v17 = v9;
  dispatch_sync(accessQueue, &v12);
  v10 = self;
  objc_sync_enter(v10);
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoService serviceDelegate](v10, "serviceDelegate", v12, v13, v14, v15, v16));
  [v11 appInfoServiceDidUpdateAppInfo:v10];

  objc_sync_exit(v10);
}

- (void)setServiceDelegate:(id)a3
{
  v4 = (PBSAppInfoDelegateServiceInterface *)a3;
  v5 = self;
  objc_sync_enter(v5);
  serviceDelegate = v5->_serviceDelegate;
  v5->_serviceDelegate = v4;

  objc_sync_exit(v5);
}

- (void)appInfoUpdatesWithReply:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100069EE8;
    block[3] = &unk_1003D2888;
    block[4] = self;
    v16 = v5;
    id v17 = v6;
    id v18 = v7;
    id v19 = v8;
    id v10 = v8;
    id v11 = v7;
    v12 = v6;
    uint64_t v13 = v5;
    dispatch_sync(accessQueue, block);
    v14 = -[PBSAppInfoControllerUpdate initWithAddedInfos:removedInfos:updatedInfos:updatedConfiguration:]( objc_alloc(&OBJC_CLASS___PBSAppInfoControllerUpdate),  "initWithAddedInfos:removedInfos:updatedInfos:updatedConfiguration:",  v13,  v12,  v11,  v10);
    v4[2](v4, v14);
  }

- (PBAppInfoStore)infoStore
{
  return self->_infoStore;
}

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSDictionary)queue_currentAppInfos
{
  return self->_queue_currentAppInfos;
}

- (NSDictionary)queue_lastProvidedAppInfos
{
  return self->_queue_lastProvidedAppInfos;
}

- (NSMutableSet)queue_updatedAppInfoBundleIdentifiers
{
  return self->_queue_updatedAppInfoBundleIdentifiers;
}

- (PBSAppInfoConfiguration)queue_currentConfiguration
{
  return self->_queue_currentConfiguration;
}

- (PBSAppInfoConfiguration)queue_lastProvidedConfiguration
{
  return self->_queue_lastProvidedConfiguration;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (PBSAppInfoDelegateServiceInterface)serviceDelegate
{
  return self->_serviceDelegate;
}

- (void).cxx_destruct
{
}

@end