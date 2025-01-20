@interface PBAppInfoController
+ (id)enabledAndVisibleAppsAndPlaceholdersFilter;
+ (id)enabledAndVisibleAppsFilter;
+ (id)enabledAppsFilter;
- (NSDictionary)appInfos;
- (NSDictionary)queue_currentAppInfos;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)delegateQueue;
- (PBAppInfoConfiguration)configuration;
- (PBAppInfoController)init;
- (PBAppInfoController)initWithInfoStore:(id)a3 filter:(id)a4 delegate:(id)a5;
- (PBAppInfoControllerDelegate)delegate;
- (PBAppInfoStore)infoStore;
- (PBSAppInfoControllerUpdate)updatePendingDelegateNotification;
- (id)_filteredAppInfoFromAppInfo:(id)a3;
- (id)_handleDidAddInfos:(id)a3 removeInfos:(id)a4 updateInfos:(id)a5 updatedConfiguration:(id)a6;
- (id)appInfoForScene:(id)a3;
- (id)appInfoForSceneIdentifier:(id)a3;
- (id)appInfoForSceneIdentity:(id)a3;
- (id)filter;
- (id)infoStoreObserverToken;
- (id)queue_configuration;
- (void)appInfoStore:(id)a3 beginUpdatesWithAddedInfos:(id)a4 removedInfos:(id)a5 updatedInfos:(id)a6 updatedConfiguration:(id)a7;
- (void)appInfoStoreEndUpdates:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation PBAppInfoController

- (id)appInfoForScene:(id)a3
{
  id v4 = a3;
  if ([v4 isValid])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcess]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self, "appInfos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)appInfoForSceneIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sceneWithIdentifier:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfoForScene:](self, "appInfoForScene:", v6));
  return v7;
}

- (id)appInfoForSceneIdentity:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfoForSceneIdentifier:](self, "appInfoForSceneIdentifier:", v4));

  return v5;
}

+ (id)enabledAndVisibleAppsAndPlaceholdersFilter
{
  return &stru_1003DA0A0;
}

+ (id)enabledAndVisibleAppsFilter
{
  return &stru_1003DA0C0;
}

+ (id)enabledAppsFilter
{
  return &stru_1003DA0E0;
}

- (PBAppInfoController)init
{
  return 0LL;
}

- (PBAppInfoController)initWithInfoStore:(id)a3 filter:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBAppInfoController;
  v12 = -[PBAppInfoController init](&v25, "init");
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PineBoard.PBAppInfoController", 0LL);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_infoStore, a3);
    id v15 = [v10 copy];
    id filter = v12->_filter;
    v12->_id filter = v15;

    objc_storeWeak((id *)&v12->_delegate, v11);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v9 configuration]);
    id queue_configuration = v12->_queue_configuration;
    v12->_id queue_configuration = (id)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 appInfos]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[PBAppInfoController _filteredAppInfoFromAppInfo:](v12, "_filteredAppInfoFromAppInfo:", v19));
    queue_currentAppInfos = v12->_queue_currentAppInfos;
    v12->_queue_currentAppInfos = (NSDictionary *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[PBAppInfoStore addObserver:](v12->_infoStore, "addObserver:", v12));
    id infoStoreObserverToken = v12->_infoStoreObserverToken;
    v12->_id infoStoreObserverToken = (id)v22;
  }

  return v12;
}

- (void)dealloc
{
  id infoStoreObserverToken = self->_infoStoreObserverToken;
  self->_id infoStoreObserverToken = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBAppInfoController;
  -[PBAppInfoController dealloc](&v4, "dealloc");
}

- (NSDictionary)appInfos
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100172890;
  id v10 = sub_1001728A0;
  id v11 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001728B8;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (PBAppInfoConfiguration)configuration
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100172890;
  id v10 = sub_1001728A0;
  id v11 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001729AC;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PBAppInfoConfiguration *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_super v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_delegate, v5);

  objc_sync_exit(v4);
}

- (PBAppInfoControllerDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (PBAppInfoControllerDelegate *)WeakRetained;
}

- (void)appInfoStore:(id)a3 beginUpdatesWithAddedInfos:(id)a4 removedInfos:(id)a5 updatedInfos:(id)a6 updatedConfiguration:(id)a7
{
  uint64_t v8 = (PBSAppInfoControllerUpdate *)objc_claimAutoreleasedReturnValue( -[PBAppInfoController _handleDidAddInfos:removeInfos:updateInfos:updatedConfiguration:]( self,  "_handleDidAddInfos:removeInfos:updateInfos:updatedConfiguration:",  a4,  a5,  a6,  a7));
  updatePendingDelegateNotification = self->_updatePendingDelegateNotification;
  self->_updatePendingDelegateNotification = v8;
}

- (void)appInfoStoreEndUpdates:(id)a3
{
  id v4 = a3;
  id v5 = self->_updatePendingDelegateNotification;
  updatePendingDelegateNotification = self->_updatePendingDelegateNotification;
  self->_updatePendingDelegateNotification = 0LL;

  if (v5 && -[PBSAppInfoControllerUpdate hasChanges](v5, "hasChanges"))
  {
    v7 = self;
    objc_sync_enter(v7);
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
    id v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained appInfoController:v7 didUpdate:v5];
    }

    objc_sync_exit(v7);
  }
}

- (id)_handleDidAddInfos:(id)a3 removeInfos:(id)a4 updateInfos:(id)a5 updatedConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  v30 = sub_100172CF4;
  v31 = &unk_1003DA108;
  v32 = self;
  id v33 = v10;
  id v34 = v11;
  id v35 = v12;
  v36 = v14;
  v37 = v15;
  id v38 = v16;
  id v39 = v13;
  id v18 = v13;
  id v19 = v16;
  uint64_t v20 = v15;
  v21 = v14;
  id v22 = v12;
  id v23 = v11;
  id v24 = v10;
  dispatch_sync(accessQueue, &v28);
  objc_super v25 = objc_alloc(&OBJC_CLASS___PBSAppInfoControllerUpdate);
  v26 = -[PBSAppInfoControllerUpdate initWithAddedInfos:removedInfos:updatedInfos:updatedConfiguration:]( v25,  "initWithAddedInfos:removedInfos:updatedInfos:updatedConfiguration:",  v21,  v20,  v19,  v18,  v28,  v29,  v30,  v31,  v32);

  return v26;
}

- (id)_filteredAppInfoFromAppInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = v4;
  if (self->_filter)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001732C8;
    v8[3] = &unk_1003DA130;
    v8[4] = self;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_filter:", v8));
  }

  return v6;
}

- (PBAppInfoStore)infoStore
{
  return self->_infoStore;
}

- (id)filter
{
  return self->_filter;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSDictionary)queue_currentAppInfos
{
  return self->_queue_currentAppInfos;
}

- (id)queue_configuration
{
  return self->_queue_configuration;
}

- (id)infoStoreObserverToken
{
  return self->_infoStoreObserverToken;
}

- (PBSAppInfoControllerUpdate)updatePendingDelegateNotification
{
  return self->_updatePendingDelegateNotification;
}

- (void).cxx_destruct
{
}

@end